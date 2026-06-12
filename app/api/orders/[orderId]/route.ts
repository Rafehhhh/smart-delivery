import { cookies } from "next/headers";
import { fail, ok, parseJson, updateOrderSchema } from "@/lib/api";
import { getDemoOrder } from "@/lib/demo-data";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { getOrderEvents, getOrdersData } from "@/lib/supabase-orders";
import { readTestOrdersFromCookies, setTestOrdersCookie, updateTestOrder } from "@/lib/test-order-store";

export async function GET(_: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const { orders, source } = await getOrdersData();
  const order = orders.find((entry) => entry.id === orderId) ?? getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);
  const events = source === "supabase" ? await getOrderEvents(orderId) : [];
  return ok({ order, events });
}

export async function PATCH(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, updateOrderSchema);
  if (!parsed.success) return fail("Invalid order update.", 422, parsed.error.flatten());
  if (parsed.data.status !== "cancelled") return fail("Only customer cancellation is supported here.", 422);

  const cookieStore = await cookies();
  const testOrders = readTestOrdersFromCookies(cookieStore);
  const testOrder = testOrders.find((order) => order.id === orderId);
  if (testOrder) {
    if (testOrder.status !== "submitted" || testOrder.assignedStaff) {
      return fail("This order cannot be cancelled after staff accepts it.", 409);
    }
    const cancelledOrder = { ...testOrder, status: "cancelled" as const, notes: parsed.data.notes ?? testOrder.notes };
    const response = ok(cancelledOrder);
    setTestOrdersCookie(response, updateTestOrder(testOrders, orderId, () => cancelledOrder));
    return response;
  }

  try {
    const supabase = await createSupabaseServerClient();
    const userResult = await supabase.auth.getUser();
    const user = userResult.data.user;
    if (!user) return fail("Sign in before cancelling an order.", 401);

    const profileResult = await supabase.from("profiles").select("role").eq("id", user.id).maybeSingle();
    if (profileResult.data?.role !== "customer") return fail("Only customers can cancel their own orders.", 403);

    const orderResult = await supabase
      .from("orders")
      .select("id, slot_id, status, assigned_staff_id")
      .eq("id", orderId)
      .eq("customer_id", user.id)
      .maybeSingle();
    const order = orderResult.data;
    if (orderResult.error || !order) return fail("Order not found.", 404);
    if (order.status !== "submitted" || order.assigned_staff_id) {
      return fail("This order cannot be cancelled after staff accepts it.", 409);
    }

    const now = new Date().toISOString();
    const updateResult = await supabase
      .from("orders")
      .update({ status: "cancelled", notes: parsed.data.notes ?? null, updated_at: now })
      .eq("id", orderId)
      .select("id, status")
      .single();
    if (updateResult.error) return fail("Could not cancel order.", 500, updateResult.error.message);

    const slotResult = await supabase.from("delivery_slots").select("reserved").eq("id", order.slot_id).maybeSingle();
    const reserved = Math.max(Number(slotResult.data?.reserved ?? 0) - 1, 0);
    await Promise.all([
      supabase.from("delivery_slots").update({ reserved }).eq("id", order.slot_id),
      supabase.from("order_events").insert({
        order_id: orderId,
        actor_id: user.id,
        event_type: "order_cancelled",
        message: "Customer cancelled the order before staff accepted it.",
        metadata: {}
      })
    ]);

    return ok(updateResult.data);
  } catch (caught) {
    return fail(caught instanceof Error ? caught.message : "Could not cancel order.", 500);
  }
}
