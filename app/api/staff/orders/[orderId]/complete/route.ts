import { fail, ok } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createOrderEvent } from "@/lib/supabase-orders";
import { buildWhatsAppFallbackUrl } from "@/lib/whatsapp";

export async function POST(_: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;

  try {
    const supabase = await createSupabaseServerClient();
    const userResult = await supabase.auth.getUser();
    const user = userResult.data.user;
    if (!user) return fail("Sign in as staff before completing delivery.", 401);

    const cashResult = await supabase
      .from("cash_transactions")
      .select("balance_due, refund_due")
      .eq("order_id", orderId)
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (cashResult.error) return fail("Could not verify cash settlement.", 500, cashResult.error.message);

    const balanceDue = Number(cashResult.data?.balance_due ?? 0);
    const refundDue = Number(cashResult.data?.refund_due ?? 0);
    if (balanceDue > 0 || refundDue > 0) {
      return fail("Settle balance/refund before completing delivery.", 409, { balanceDue, refundDue });
    }

    const updateResult = await supabase
      .from("orders")
      .update({
        status: "delivered",
        payment_state: "paid",
        updated_at: new Date().toISOString()
      })
      .eq("id", orderId)
      .eq("assigned_staff_id", user.id)
      .select("id, order_number")
      .single();
    if (updateResult.error) return fail("Could not complete delivery.", 500, updateResult.error.message);

    const customerResult = await supabase
      .from("orders")
      .select("customer:profiles!orders_customer_id_fkey(phone)")
      .eq("id", orderId)
      .single();
    const customerRecord = customerResult.data?.customer as { phone?: string } | { phone?: string }[] | undefined;
    const customerPhone = Array.isArray(customerRecord) ? customerRecord[0]?.phone : customerRecord?.phone;
    const messageBody = `Smart Delivery order ${updateResult.data.order_number} has been delivered. Thank you.`;

    await Promise.all([
      createOrderEvent({
        orderId,
        actorId: user.id,
        eventType: "order_delivered",
        message: "Order delivered and payment marked complete."
      }),
      customerPhone
        ? supabase.from("whatsapp_messages").insert({
            order_id: orderId,
            staff_id: user.id,
            recipient_phone: customerPhone,
            recipient_role: "customer",
            event_type: "order_delivered",
            message_body: messageBody,
            status: "fallback_ready",
            fallback_url: buildWhatsAppFallbackUrl(customerPhone, messageBody)
          })
        : Promise.resolve()
    ]);

    return ok({
      orderId,
      orderNumber: updateResult.data.order_number,
      status: "delivered",
      paymentState: "paid",
      completedAt: new Date().toISOString()
    });
  } catch (caught) {
    return fail(caught instanceof Error ? caught.message : "Could not complete delivery.", 500);
  }
}
