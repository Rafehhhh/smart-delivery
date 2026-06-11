import type { CashSummary, DeliverySlot, OrderItem, PaymentState, ServiceFeeRule } from "./types";

export function isSlotAvailable(slot: DeliverySlot) {
  return slot.reserved < slot.capacity;
}

export function isSlotSelectable(slot: DeliverySlot, now = new Date()) {
  return isSlotAvailable(slot) && new Date(slot.endsAt).getTime() > now.getTime();
}

export function remainingSlotCapacity(slot: DeliverySlot) {
  return Math.max(slot.capacity - slot.reserved, 0);
}

export function calculateEstimate(items: OrderItem[]) {
  return roundCurrency(
    items.reduce((total, item) => total + item.requestedQuantity * item.estimatedPrice, 0)
  );
}

export function calculateFinalItemsTotal(items: OrderItem[]) {
  return roundCurrency(
    items.reduce((total, item) => {
      const quantity = item.finalQuantity ?? item.requestedQuantity;
      const price = item.finalPrice ?? item.estimatedPrice;
      return total + quantity * price;
    }, 0)
  );
}

export function areAllOrderItemsFinalized(items: OrderItem[]) {
  return (
    items.length > 0 &&
    items.every((item) => typeof item.finalQuantity === "number" && item.finalQuantity > 0 && typeof item.finalPrice === "number" && item.finalPrice >= 0)
  );
}

export function calculateServiceFee(subtotal: number, rule: ServiceFeeRule) {
  if (!rule.isActive) return 0;
  if (rule.freeDeliveryMinimum && subtotal >= rule.freeDeliveryMinimum) return 0;
  return roundCurrency(rule.flatFee);
}

export function reconcileCash(finalPayable: number, advanceCollected: number, finalCollected = 0): CashSummary {
  const collected = advanceCollected + finalCollected;
  const balanceDue = roundCurrency(Math.max(finalPayable - collected, 0));
  const refundDue = roundCurrency(Math.max(collected - finalPayable, 0));

  let reconciliationStatus: CashSummary["reconciliationStatus"] = "not_started";
  if (advanceCollected > 0 && balanceDue > 0) reconciliationStatus = "balance_due";
  if (advanceCollected > 0 && balanceDue === 0 && refundDue === 0) reconciliationStatus = "settled";
  if (refundDue > 0) reconciliationStatus = "refund_due";
  if (advanceCollected > 0 && finalPayable === 0) reconciliationStatus = "advance_collected";
  if (finalPayable > 0 && collected >= finalPayable && refundDue === 0) reconciliationStatus = "settled";

  return {
    advanceCollected: roundCurrency(advanceCollected),
    finalCollected: roundCurrency(finalCollected),
    balanceDue,
    refundDue,
    reconciliationStatus
  };
}

export function derivePaymentState(cash: CashSummary, finalPayable: number): PaymentState {
  if (cash.refundDue > 0) return "refund_pending";
  if (cash.balanceDue === 0 && finalPayable > 0) return "paid";
  if (cash.advanceCollected > 0 || cash.finalCollected > 0) return "advance_paid";
  return "unpaid";
}

export function canTransitionOrder(current: string, next: string) {
  const allowed: Record<string, string[]> = {
    draft: ["submitted", "cancelled"],
    submitted: ["assigned", "cancelled"],
    assigned: ["confirmed", "cancelled"],
    confirmed: ["shopping", "cancelled"],
    shopping: ["ready_for_delivery", "cancelled"],
    ready_for_delivery: ["delivered", "cancelled"],
    delivered: [],
    cancelled: []
  };

  return allowed[current]?.includes(next) ?? false;
}

export function roundCurrency(amount: number) {
  return Math.round((amount + Number.EPSILON) * 100) / 100;
}
