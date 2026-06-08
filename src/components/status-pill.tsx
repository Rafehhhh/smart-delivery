import type { OrderStatus, PaymentState } from "@/lib/types";

const orderStyles: Record<OrderStatus, string> = {
  draft: "bg-ink/10 text-ink",
  submitted: "bg-market/20 text-ink",
  assigned: "bg-mint text-leaf",
  confirmed: "bg-mint text-leaf",
  shopping: "bg-leaf text-white",
  ready_for_delivery: "bg-clay/15 text-clay",
  delivered: "bg-ink text-white",
  cancelled: "bg-red-100 text-red-800"
};

const paymentStyles: Record<PaymentState, string> = {
  unpaid: "bg-market/20 text-ink",
  advance_paid: "bg-mint text-leaf",
  paid: "bg-leaf text-white",
  partially_paid: "bg-clay/15 text-clay",
  payment_failed: "bg-red-100 text-red-800",
  refund_pending: "bg-clay/15 text-clay",
  refunded: "bg-ink/10 text-ink"
};

export function StatusPill({ value, type }: { value: OrderStatus | PaymentState; type: "order" | "payment" }) {
  const styles = type === "order" ? orderStyles[value as OrderStatus] : paymentStyles[value as PaymentState];

  return (
    <span className={`inline-flex items-center rounded-md px-2.5 py-1 text-xs font-semibold capitalize ${styles}`}>
      {value.replaceAll("_", " ")}
    </span>
  );
}
