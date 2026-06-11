import { cookies } from "next/headers";
import { canTransitionOrder } from "@/lib/calculations";
import { fail, ok, parseJson, staffStatusSchema } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createOrderEvent } from "@/lib/supabase-orders";
import { readTestOrdersFromCookies, setTestOrdersCookie, updateTestOrder } from "@/lib/test-order-store";
import { buildWhatsAppFallbackUrl } from "@/lib/whatsapp";
import type { Order, OrderStatus } from "@/lib/types";

const statusMessages: Record<OrderStatus, string> = {
  draft: "Order draft updated.",
  submitted: "Order submitted.",
  assigned: "Order assigned to staff.",
  confirmed: "Staff confirmed the order with the customer.",
  shopping: "Staff started shopping for the order.",
  ready_for_delivery: "Final invoice is ready and the order is ready for delivery.",
  delivered: "Order delivered and payment marked complete.",
  cancelled: "Order cancelled."
};

const whatsappStatusMessages: Partial<Record<OrderStatus, string>> = {
  confirmed: "Your Smart Delivery order has been confirmed by staff.",
  shopping: "Your Smart Delivery staff has started shopping for your order.",
  ready_for_delivery: "Your Smart Delivery order is ready for delivery. Final invoice has been updated.",
  delivered: "Your Smart Delivery order has been delivered. Thank you."
};

function updateLocalOrderStatus(order: Order, status: OrderStatus): Order {
  return {
    ...order,
    status,
    paymentState: status === "delivered" ? "paid" : order.paymentState
  };
}

export async function PATCH(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, staffStatusSchema);
  if (!parsed.success) return fail("Invalid staff status update.", 422, parsed.error.flatten());
  const nextStatus = parsed.data.status;

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
      if (!isTestStaff) return fail("Sign in as staff before updating order status.", 401);
      const orders = readTestOrdersFromCookies(cookieStore);
      const currentOrder = orders.find((order) => order.id === orderId);
      if (!currentOrder) return fail("Order not found.", 404);
      if (!canTransitionOrder(currentOrder.status, nextStatus)) {
        return fail(`Cannot move order from ${currentOrder.status} to ${nextStatus}.`, 409);
      }
      const nextOrders = updateTestOrder(orders, orderId, (order) => updateLocalOrderStatus(order, nextStatus));
      const updatedOrder = nextOrders.find((order) => order.id === orderId);
      return setTestOrdersCookie(ok({ order: updatedOrder }), nextOrders);
    }

    const orderResult = await supabase
      .from("orders")
      .select("id, order_number, status, customer:profiles!orders_customer_id_fkey(phone)")
      .eq("id", orderId)
      .eq("assigned_staff_id", user.id)
      .single();
    if (orderResult.error || !orderResult.data) return fail("Assigned order not found.", 404, orderResult.error?.message);

    const currentStatus = orderResult.data.status as OrderStatus;
    if (!canTransitionOrder(currentStatus, nextStatus)) {
      return fail(`Cannot move order from ${currentStatus} to ${nextStatus}.`, 409);
    }

    const updatePayload: { status: OrderStatus; payment_state?: "paid"; updated_at: string } = {
      status: nextStatus,
      updated_at: new Date().toISOString()
    };
    if (nextStatus === "delivered") updatePayload.payment_state = "paid";

    const updateResult = await supabase
      .from("orders")
      .update(updatePayload)
      .eq("id", orderId)
      .eq("assigned_staff_id", user.id)
      .select("id, status, payment_state")
      .single();
    if (updateResult.error) return fail("Could not update order status.", 500, updateResult.error.message);

    const customerRecord = orderResult.data.customer as { phone?: string } | { phone?: string }[] | undefined;
    const customerPhone = Array.isArray(customerRecord) ? customerRecord[0]?.phone : customerRecord?.phone;
    const whatsappMessage = whatsappStatusMessages[nextStatus];

    await Promise.all([
      createOrderEvent({
        orderId,
        actorId: user.id,
        eventType: `status_${nextStatus}`,
        message: statusMessages[nextStatus],
        metadata: { status: nextStatus }
      }),
      customerPhone && whatsappMessage
        ? supabase.from("whatsapp_messages").insert({
            order_id: orderId,
            staff_id: user.id,
            recipient_phone: customerPhone,
            recipient_role: "customer",
            event_type: `status_${nextStatus}`,
            message_body: whatsappMessage,
            status: "fallback_ready",
            fallback_url: buildWhatsAppFallbackUrl(customerPhone, whatsappMessage)
          })
        : Promise.resolve()
    ]);

    return ok({
      orderId,
      status: updateResult.data.status,
      paymentState: updateResult.data.payment_state
    });
  } catch (caught) {
    return fail(caught instanceof Error ? caught.message : "Could not update order status.", 500);
  }
}
