import { cookies } from "next/headers";
import { fail, ok } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createOrderEvent, mapOrderRow } from "@/lib/supabase-orders";
import { buildWhatsAppFallbackUrl } from "@/lib/whatsapp";

export async function POST(_: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;

  try {
    const cookieStore = await cookies();
    const isTestStaff =
      process.env.NEXT_PUBLIC_ENABLE_TEST_LOGIN === "true" &&
      cookieStore.get("smart_delivery_test_role")?.value === "staff" &&
      cookieStore.get("smart_delivery_test_staff_status")?.value !== "pending";

    const supabase = await createSupabaseServerClient();
    const userResult = await supabase.auth.getUser();
    const user = userResult.data.user;
    if (!user) {
      return isTestStaff
        ? ok({ orderId, status: "assigned", assignment: { orderId, assignedAt: new Date().toISOString() } })
        : fail("Sign in as approved staff before accepting orders.", 401);
    }

    const activeResult = await supabase
      .from("orders")
      .select("id")
      .eq("assigned_staff_id", user.id)
      .in("status", ["assigned", "confirmed", "shopping", "ready_for_delivery"])
      .limit(1);
    if (activeResult.error) return fail("Could not verify active staff orders.", 500, activeResult.error.message);
    if ((activeResult.data ?? []).length > 0) {
      return fail("Complete the active order before accepting another.", 409);
    }

    const updateResult = await supabase
      .from("orders")
      .update({
        assigned_staff_id: user.id,
        status: "assigned",
        updated_at: new Date().toISOString()
      })
      .eq("id", orderId)
      .eq("status", "submitted")
      .is("assigned_staff_id", null)
      .select(`
        id,
        order_number,
        customer_id,
        address_id,
        slot_id,
        assigned_staff_id,
        status,
        payment_state,
        estimate_total,
        final_total,
        service_fee,
        notes,
        created_at,
        customer:profiles!orders_customer_id_fkey(id, role, full_name, phone),
        assigned_staff:profiles!orders_assigned_staff_id_fkey(id, role, full_name, phone),
        address:customer_addresses(id, customer_id, house_name, address_line, landmark, locality),
        slot:delivery_slots(id, source_key, label, starts_at, ends_at, capacity, reserved),
        items:order_items(id, product_id, product_name, unit, requested_quantity, estimated_price, final_quantity, final_price, notes),
        cash:cash_transactions(advance_collected, final_collected, balance_due, refund_due, reconciliation_status)
      `)
      .single();

    if (updateResult.error || !updateResult.data) {
      return fail("Order is no longer available to accept.", 409, updateResult.error?.message);
    }

    const updatedOrder = updateResult.data as typeof updateResult.data & {
      customer?: { phone?: string } | { phone?: string }[];
    };
    const customer = Array.isArray(updatedOrder.customer) ? updatedOrder.customer[0] : updatedOrder.customer;
    const customerPhone = customer?.phone;
    const messageBody = `Smart Delivery order ${updateResult.data.order_number} has been accepted by a delivery staff member.`;

    await Promise.all([
      supabase.from("staff_assignments").insert({
        order_id: orderId,
        staff_id: user.id
      }),
      createOrderEvent({
        orderId,
        actorId: user.id,
        eventType: "order_assigned",
        message: "A delivery staff member accepted the order."
      }),
      customerPhone
        ? supabase.from("whatsapp_messages").insert({
            order_id: orderId,
            staff_id: user.id,
            recipient_phone: customerPhone,
            recipient_role: "customer",
            event_type: "order_assigned",
            message_body: messageBody,
            status: "fallback_ready",
            fallback_url: buildWhatsAppFallbackUrl(customerPhone, messageBody)
          })
        : Promise.resolve()
    ]);

    return ok({
      order: mapOrderRow(updateResult.data as unknown as Parameters<typeof mapOrderRow>[0])
    });
  } catch (caught) {
    return fail(caught instanceof Error ? caught.message : "Could not accept order.", 500);
  }
}
