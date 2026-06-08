import { fail, ok } from "@/lib/api";
import { getDemoOrder } from "@/lib/demo-data";

export async function GET(_: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const order = getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);
  return ok(order);
}
