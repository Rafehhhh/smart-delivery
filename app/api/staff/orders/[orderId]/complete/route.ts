import { cookies } from "next/headers";
import { areAllOrderItemsFinalized } from "@/lib/calculations";
import { fail, ok } from "@/lib/api";
import { orders as demoOrders } from "@/lib/demo-data";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createOrderEvent } from "@/lib/supabase-orders";
import { readTestOrdersFromCookies, setTestOrdersCookie, updateTestOrder, upsertTestOrder } from "@/lib/test-order-store";
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
      if (!isTestStaff) return fail("Sign in as staff before completing delivery.", 401);
      const storedOrders = readTestOrdersFromCookies(cookieStore);
      const fallbackOrder = demoOrders.find((order) => order.id === orderId);
      const baseOrders = fallbackOrder && !storedOrders.some((order) => order.id === orderId)
        ? upsertTestOrder(storedOrders, fallbackOrder)
        : storedOrders;
      const currentOrder = baseOrders.find((order) => order.id === orderId);
      if (!currentOrder || !areAllOrderItemsFinalized(currentOrder.items)) {
        return fail("Mark every product as bought and finalize the invoice before completing delivery.", 409);
      }
      const nextOrders = updateTestOrder(baseOrders, orderId, (order) => ({
        ...order,
        status: "delivered",
        paymentState: "paid"
      }));
      const response = ok({
        orderId,
        orderNumber: nextOrders.find((order) => order.id === orderId)?.orderNumber ?? orderId,
        status: "delivered",
        paymentState: "paid",
        completedAt: new Date().toISOString()
      });
      return setTestOrdersCookie(response, nextOrders);
    }

    const cashResult = await supabase
      .from("cash_transactions")
      .select("balance_due, refund_due")
      .eq("order_id", orderId)
      .order("created_at", { ascending: false })
      .limit(1)
      .maybeSingle();
    if (cashResult.error) return fail("Could not verify cash settlement.", 500, cashResult.error.message);

    const itemsResult = await supabase
      .from("order_items")
      .select("id, product_name, unit, requested_quantity, estimated_price, final_quantity, final_price")
      .eq("order_id", orderId);
    if (itemsResult.error) return fail("Could not verify bought products.", 500, itemsResult.error.message);
    const items = (itemsResult.data ?? []).map((item) => ({
      id: item.id,
      productId: item.id,
      productName: item.product_name,
      unit: item.unit,
      requestedQuantity: Number(item.requested_quantity),
      estimatedPrice: Number(item.estimated_price),
      finalQuantity: item.final_quantity === null ? undefined : Number(item.final_quantity),
      finalPrice: item.final_price === null ? undefined : Number(item.final_price)
    }));
    if (!areAllOrderItemsFinalized(items)) {
      return fail("Mark every product as bought and finalize the invoice before completing delivery.", 409);
    }

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
