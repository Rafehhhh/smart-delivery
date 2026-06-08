import { fail, ok } from "@/lib/api";
import { getDemoOrder } from "@/lib/demo-data";

export async function POST(_: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const order = getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);
  if (order.cash.balanceDue > 0 || order.cash.refundDue > 0) {
    return fail("Settle balance/refund before completing delivery.", 409, order.cash);
  }

  return ok({
    ...order,
    status: "delivered",
    paymentState: "paid",
    completedAt: new Date().toISOString()
  });
}
