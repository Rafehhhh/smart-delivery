import { cookies } from "next/headers";
import { derivePaymentState, reconcileCash } from "@/lib/calculations";
import { cashSchema, fail, ok, parseJson } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createOrderEvent } from "@/lib/supabase-orders";

export async function POST(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, cashSchema);
  if (!parsed.success) return fail("Invalid cash payload.", 422, parsed.error.flatten());

  try {
    const cookieStore = await cookies();
    const isTestStaff =
      process.env.NEXT_PUBLIC_ENABLE_TEST_LOGIN === "true" &&
      cookieStore.get("smart_delivery_test_role")?.value === "staff" &&
      cookieStore.get("smart_delivery_test_staff_status")?.value !== "pending";

    const advanceCollected = parsed.data.advanceCollected ?? 0;
    const finalCollected = parsed.data.finalCollected ?? 0;
    const cash = reconcileCash(parsed.data.finalPayable, advanceCollected, finalCollected);
    const paymentState = derivePaymentState(cash, parsed.data.finalPayable);

    const supabase = await createSupabaseServerClient();
    const userResult = await supabase.auth.getUser();
    const user = userResult.data.user;
    if (!user) {
      return isTestStaff ? ok({ orderId, cash, paymentState }) : fail("Sign in as staff before recording cash.", 401);
    }

    const cashResult = await supabase.from("cash_transactions").insert({
      order_id: orderId,
      advance_collected: cash.advanceCollected,
      final_collected: cash.finalCollected,
      balance_due: cash.balanceDue,
      refund_due: cash.refundDue,
      reconciliation_status: cash.reconciliationStatus,
      recorded_by: user.id
    });
    if (cashResult.error) return fail("Could not record cash.", 500, cashResult.error.message);

    const updateResult = await supabase
      .from("orders")
      .update({
        payment_state: paymentState,
        updated_at: new Date().toISOString()
      })
      .eq("id", orderId)
      .eq("assigned_staff_id", user.id);
    if (updateResult.error) return fail("Could not update order payment state.", 500, updateResult.error.message);

    await createOrderEvent({
      orderId,
      actorId: user.id,
      eventType: "cash_updated",
      message: "Cash settlement was updated.",
      metadata: cash
    });

    return ok({
      orderId,
      cash,
      paymentState
    });
  } catch (caught) {
    return fail(caught instanceof Error ? caught.message : "Could not record cash.", 500);
  }
}
