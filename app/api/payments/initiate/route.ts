import { fail, ok, parseJson } from "@/lib/api";
import { getPaymentGateway, initiatePaymentSchema } from "@/lib/payments";

export async function POST(request: Request) {
  const parsed = await parseJson(request, initiatePaymentSchema);
  if (!parsed.success) return fail("Invalid payment initiation payload.", 422, parsed.error.flatten());

  const provider = parsed.data.provider ?? "future_gateway";
  const gateway = getPaymentGateway(parsed.data.mode, provider);
  const transaction = await gateway.initiate({ ...parsed.data, provider });

  return ok({
    transaction,
    liveGatewayEnabled: provider === "cash"
  });
}
