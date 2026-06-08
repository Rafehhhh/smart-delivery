import { ok } from "@/lib/api";

const paymentMethods = [
  {
    mode: "cash",
    provider: "cash",
    displayName: "Cash on delivery",
    isEnabled: true
  },
  {
    mode: "upi",
    provider: "razorpay",
    displayName: "UPI via Razorpay",
    isEnabled: false
  },
  {
    mode: "card",
    provider: "razorpay",
    displayName: "Card via Razorpay",
    isEnabled: false
  }
];

export async function GET() {
  return ok(paymentMethods);
}
