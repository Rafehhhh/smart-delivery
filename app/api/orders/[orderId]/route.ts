import { fail, ok } from "@/lib/api";
import { getDemoOrder } from "@/lib/demo-data";
import { getOrderEvents, getOrdersData } from "@/lib/supabase-orders";

export async function GET(_: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const { orders, source } = await getOrdersData();
  const order = orders.find((entry) => entry.id === orderId) ?? getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);
  const events = source === "supabase" ? await getOrderEvents(orderId) : [];
  return ok({ order, events });
}
