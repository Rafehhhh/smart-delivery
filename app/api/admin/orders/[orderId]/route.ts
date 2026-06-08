import { canTransitionOrder } from "@/lib/calculations";
import { fail, ok, parseJson, updateOrderSchema } from "@/lib/api";
import { getDemoOrder } from "@/lib/demo-data";

export async function PATCH(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, updateOrderSchema);
  if (!parsed.success) return fail("Invalid order update.", 422, parsed.error.flatten());

  const order = getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);

  if (parsed.data.status && !canTransitionOrder(order.status, parsed.data.status)) {
    return fail(`Cannot move order from ${order.status} to ${parsed.data.status}.`, 409);
  }

  return ok({
    ...order,
    ...parsed.data,
    updatedAt: new Date().toISOString()
  });
}
