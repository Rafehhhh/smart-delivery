import { z } from "zod";
import type { PaymentMode, PaymentProvider, PaymentTransaction } from "./types";

export const initiatePaymentSchema = z.object({
  orderId: z.string().min(1),
  amount: z.number().positive(),
  mode: z.enum(["cash", "upi", "card", "wallet", "net_banking"]),
  provider: z.enum(["cash", "razorpay", "manual", "future_gateway"]).default("future_gateway")
});

export type InitiatePaymentInput = z.infer<typeof initiatePaymentSchema>;

export interface PaymentGateway {
  provider: PaymentProvider;
  initiate(input: InitiatePaymentInput): Promise<PaymentTransaction>;
  verifyWebhook?(payload: unknown, signature?: string): Promise<boolean>;
}

export class CashPaymentGateway implements PaymentGateway {
  provider = "cash" as const;

  async initiate(input: InitiatePaymentInput): Promise<PaymentTransaction> {
    return {
      id: `cash_${Date.now()}`,
      orderId: input.orderId,
      amount: input.amount,
      mode: "cash",
      provider: "cash",
      status: "created",
      refundStatus: "not_required",
      createdAt: new Date().toISOString()
    };
  }
}

export class FutureGateway implements PaymentGateway {
  provider = "future_gateway" as const;

  async initiate(input: InitiatePaymentInput): Promise<PaymentTransaction> {
    return {
      id: `future_${Date.now()}`,
      orderId: input.orderId,
      amount: input.amount,
      mode: input.mode,
      provider: input.provider,
      status: "created",
      refundStatus: "not_required",
      createdAt: new Date().toISOString()
    };
  }

  async verifyWebhook() {
    return false;
  }
}

export function getPaymentGateway(mode: PaymentMode, provider: PaymentProvider): PaymentGateway {
  if (mode === "cash" || provider === "cash") return new CashPaymentGateway();
  return new FutureGateway();
}
