import { derivePaymentState, reconcileCash } from "@/lib/calculations";
import { cashSchema, fail, ok, parseJson } from "@/lib/api";
import { getDemoOrder } from "@/lib/demo-data";

export async function POST(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, cashSchema);
  if (!parsed.success) return fail("Invalid cash payload.", 422, parsed.error.flatten());

  const order = getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);

  const advanceCollected = parsed.data.advanceCollected ?? 0;
  const finalCollected = parsed.data.finalCollected ?? 0;
  const cash = reconcileCash(parsed.data.finalPayable, advanceCollected, finalCollected);

  return ok({
    ...order,
    cash,
    paymentState: derivePaymentState(cash, parsed.data.finalPayable)
  });
}
