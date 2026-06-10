import { calculateFinalItemsTotal, calculateServiceFee, derivePaymentState, reconcileCash } from "@/lib/calculations";
import { fail, finalizeItemsSchema, ok, parseJson } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { createOrderEvent } from "@/lib/supabase-orders";
import { buildWhatsAppFallbackUrl } from "@/lib/whatsapp";

export async function PATCH(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, finalizeItemsSchema);
  if (!parsed.success) return fail("Invalid finalization payload.", 422, parsed.error.flatten());

  try {
    const supabase = await createSupabaseServerClient();
    const userResult = await supabase.auth.getUser();
    const user = userResult.data.user;
    if (!user) return fail("Sign in as staff before finalizing items.", 401);

    for (const item of parsed.data.items) {
      const itemResult = await supabase
        .from("order_items")
        .update({
          final_quantity: item.finalQuantity,
          final_price: item.finalPrice
        })
        .eq("id", item.itemId)
        .eq("order_id", orderId);
      if (itemResult.error) return fail("Could not update final item prices.", 500, itemResult.error.message);
    }

    const [itemsResult, feeResult, cashResult] = await Promise.all([
      supabase
        .from("order_items")
        .select("id, product_name, unit, requested_quantity, estimated_price, final_quantity, final_price")
        .eq("order_id", orderId),
      supabase
        .from("service_fee_rules")
        .select("id, name, flat_fee, free_delivery_minimum, is_active")
        .eq("is_active", true)
        .limit(1)
        .maybeSingle(),
      supabase
        .from("cash_transactions")
        .select("advance_collected, final_collected")
        .eq("order_id", orderId)
        .order("created_at", { ascending: false })
        .limit(1)
        .maybeSingle()
    ]);

    if (itemsResult.error) return fail("Could not reload order items.", 500, itemsResult.error.message);

    const finalItems = (itemsResult.data ?? []).map((item) => ({
      id: item.id,
      productId: item.id,
      productName: item.product_name,
      unit: item.unit,
      requestedQuantity: Number(item.requested_quantity),
      estimatedPrice: Number(item.estimated_price),
      finalQuantity: item.final_quantity === null ? undefined : Number(item.final_quantity),
      finalPrice: item.final_price === null ? undefined : Number(item.final_price)
    }));
    const itemsTotal = calculateFinalItemsTotal(finalItems);
    const serviceFee = calculateServiceFee(itemsTotal, {
      id: feeResult.data?.id ?? "default",
      name: feeResult.data?.name ?? "Default",
      flatFee: Number(feeResult.data?.flat_fee ?? 0),
      freeDeliveryMinimum: feeResult.data?.free_delivery_minimum === null ? undefined : Number(feeResult.data?.free_delivery_minimum ?? 0),
      isActive: feeResult.data?.is_active ?? true
    });
    const finalTotal = itemsTotal + serviceFee;
    const cash = reconcileCash(
      finalTotal,
      Number(cashResult.data?.advance_collected ?? 0),
      Number(cashResult.data?.final_collected ?? 0)
    );
    const paymentState = derivePaymentState(cash, finalTotal);

    const updateResult = await supabase
      .from("orders")
      .update({
        final_total: finalTotal,
        service_fee: serviceFee,
        payment_state: paymentState,
        status: "ready_for_delivery",
        updated_at: new Date().toISOString()
      })
      .eq("id", orderId)
      .eq("assigned_staff_id", user.id);
    if (updateResult.error) return fail("Could not finalize invoice.", 500, updateResult.error.message);

    const orderResult = await supabase
      .from("orders")
      .select("order_number, customer:profiles!orders_customer_id_fkey(phone)")
      .eq("id", orderId)
      .single();
    const customerRecord = orderResult.data?.customer as { phone?: string } | { phone?: string }[] | undefined;
    const customerPhone = Array.isArray(customerRecord) ? customerRecord[0]?.phone : customerRecord?.phone;
    const orderNumber = orderResult.data?.order_number ?? "your order";
    const messageBody = `Smart Delivery order ${orderNumber} final invoice is ready. Final payable: INR ${finalTotal}.`;

    await Promise.all([
      createOrderEvent({
        orderId,
        actorId: user.id,
        eventType: "invoice_finalized",
        message: "Final invoice was updated and the order is ready for delivery.",
        metadata: { final_total: finalTotal, service_fee: serviceFee, payment_state: paymentState }
      }),
      customerPhone
        ? supabase.from("whatsapp_messages").insert({
            order_id: orderId,
            staff_id: user.id,
            recipient_phone: customerPhone,
            recipient_role: "customer",
            event_type: "invoice_finalized",
            message_body: messageBody,
            status: "fallback_ready",
            fallback_url: buildWhatsAppFallbackUrl(customerPhone, messageBody)
          })
        : Promise.resolve()
    ]);

    return ok({
      orderId,
      items: finalItems,
      finalTotal,
      serviceFee,
      paymentState,
      cash
    });
  } catch (caught) {
    return fail(caught instanceof Error ? caught.message : "Could not finalize invoice.", 500);
  }
}
