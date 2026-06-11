import type { Order, OrderEvent, OrderStatus } from "./types";

export const orderProgressSteps: Array<{ status: OrderStatus; label: string; message: string }> = [
  { status: "submitted", label: "Submitted", message: "Order submitted and waiting for available staff." },
  { status: "assigned", label: "Accepted", message: "A delivery staff member accepted the order." },
  { status: "confirmed", label: "Confirmed", message: "Staff confirmed the order with the customer." },
  { status: "shopping", label: "Shopping", message: "Staff started shopping for the order." },
  { status: "ready_for_delivery", label: "Ready", message: "Final invoice is ready and the order is ready for delivery." },
  { status: "delivered", label: "Delivered", message: "Order delivered and payment marked complete." }
];

export function getOrderProgressIndex(status: OrderStatus) {
  const index = orderProgressSteps.findIndex((step) => step.status === status);
  return index >= 0 ? index : 0;
}

export function formatOrderStatus(status: OrderStatus) {
  return status.replaceAll("_", " ");
}

export function formatOrderEventTitle(eventType: string) {
  return eventType
    .replace(/^status_/, "")
    .replace(/^order_/, "")
    .replaceAll("_", " ")
    .replace(/\b\w/g, (letter) => letter.toUpperCase());
}

export function buildOrderProgressEvents(order: Order, events: OrderEvent[] = []) {
  if (events.length > 0) return events;

  const progressIndex = getOrderProgressIndex(order.status);
  return orderProgressSteps.slice(0, progressIndex + 1).map((step, index) => ({
    id: `${order.id}-${step.status}`,
    orderId: order.id,
    eventType: step.status === "submitted" ? "order_submitted" : `status_${step.status}`,
    message: step.message,
    metadata: { status: step.status },
    createdAt: index === 0 ? order.createdAt : order.createdAt
  }));
}
