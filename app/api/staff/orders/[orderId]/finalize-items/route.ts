import { calculateFinalItemsTotal, calculateServiceFee, derivePaymentState, reconcileCash } from "@/lib/calculations";
import { fail, finalizeItemsSchema, ok, parseJson } from "@/lib/api";
import { getDemoOrder, serviceFeeRule } from "@/lib/demo-data";

export async function PATCH(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, finalizeItemsSchema);
  if (!parsed.success) return fail("Invalid finalization payload.", 422, parsed.error.flatten());

  const order = getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);

  const finalItems = order.items.map((item) => {
    const update = parsed.data.items.find((entry) => entry.itemId === item.id);
    return update ? { ...item, finalQuantity: update.finalQuantity, finalPrice: update.finalPrice } : item;
  });
  const itemsTotal = calculateFinalItemsTotal(finalItems);
  const serviceFee = calculateServiceFee(itemsTotal, serviceFeeRule);
  const finalTotal = itemsTotal + serviceFee;
  const cash = reconcileCash(finalTotal, order.cash.advanceCollected, order.cash.finalCollected);

  return ok({
    ...order,
    items: finalItems,
    finalTotal,
    serviceFee,
    paymentState: derivePaymentState(cash, finalTotal),
    status: "ready_for_delivery",
    cash
  });
}
