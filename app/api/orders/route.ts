import { cookies } from "next/headers";
import { calculateEstimate, calculateServiceFee, isSlotAvailable, reconcileCash } from "@/lib/calculations";
import { addresses, products as demoProducts, serviceFeeRule as demoServiceFeeRule, slots as demoSlots, profiles } from "@/lib/demo-data";
import { createOrderSchema, fail, ok, parseJson } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import { buildWhatsAppFallbackUrl } from "@/lib/whatsapp";
import type { OrderItem } from "@/lib/types";

function baseSlotId(slotId: string) {
  return slotId.replace(/-\d+$/, "");
}

async function createDemoOrderResponse(parsed: Awaited<ReturnType<typeof parseJson<typeof createOrderSchema["_type"]>>>) {
  if (!parsed.success) return fail("Invalid order payload.", 422, parsed.error.flatten());

  const customer = profiles.find((profile) => profile.id === (parsed.data.customerId ?? "customer-1") && profile.role === "customer") ?? profiles[0];
  const address = addresses.find((entry) => entry.id === parsed.data.addressId) ?? addresses[0];
  const slot = demoSlots.find((entry) => entry.id === baseSlotId(parsed.data.slotId));
  if (!slot) return fail("Delivery slot was not found.", 404);
  if (!isSlotAvailable(slot)) return fail("Selected delivery slot is full.", 409);

  const items: OrderItem[] = parsed.data.items.map((input, index) => {
    const product = input.productId ? demoProducts.find((entry) => entry.id === input.productId) : undefined;
    return {
      id: `new-item-${index + 1}`,
      productId: product?.id ?? `custom-${index + 1}`,
      productName: product?.name ?? input.productName ?? "Custom product",
      unit: product?.unit ?? input.unit ?? "request",
      requestedQuantity: input.requestedQuantity,
      estimatedPrice: product?.price ?? input.estimatedPrice ?? 0,
      notes: input.notes
    };
  });

  const estimateTotal = calculateEstimate(items);
  const serviceFee = calculateServiceFee(estimateTotal, demoServiceFeeRule);

  return ok(
    {
      id: `order_${Date.now()}`,
      orderNumber: `SD-${Math.floor(1000 + Math.random() * 9000)}`,
      customer,
      address,
      slot: { ...slot, reserved: slot.reserved + 1 },
      status: "submitted",
      paymentState: "unpaid",
      estimateTotal,
      serviceFee,
      items,
      cash: reconcileCash(0, 0),
      createdAt: new Date().toISOString(),
      notes: parsed.data.notes
    },
    { status: 201 }
  );
}

export async function POST(request: Request) {
  const parsed = await parseJson(request, createOrderSchema);
  if (!parsed.success) return fail("Invalid order payload.", 422, parsed.error.flatten());

  try {
    const cookieStore = await cookies();
    const isTestCustomer =
      process.env.NEXT_PUBLIC_ENABLE_TEST_LOGIN === "true" &&
      cookieStore.get("smart_delivery_test_role")?.value === "customer";

    const supabase = await createSupabaseServerClient();
    const userResult = await supabase.auth.getUser();
    const user = userResult.data.user;
    if (!user) {
      return isTestCustomer ? createDemoOrderResponse(parsed) : fail("Sign in before creating an order.", 401);
    }

    const profileResult = await supabase
      .from("profiles")
      .select("id, role, full_name, phone")
      .eq("id", user.id)
      .maybeSingle();
    if (profileResult.error || profileResult.data?.role !== "customer") {
      return fail("Only customers can create orders.", 403);
    }

    const addressResult = await supabase
      .from("customer_addresses")
      .select("id")
      .eq("id", parsed.data.addressId)
      .eq("customer_id", user.id)
      .maybeSingle();
    if (addressResult.error || !addressResult.data) return fail("Customer address was not found.", 404);

    const slotKey = baseSlotId(parsed.data.slotId);
    const slotResult = await supabase
      .from("delivery_slots")
      .select("id, source_key, capacity, reserved, is_active")
      .or(`id.eq.${slotKey},source_key.eq.${slotKey}`)
      .maybeSingle();
    const slot = slotResult.data;
    if (slotResult.error || !slot || !slot.is_active) return fail("Delivery slot was not found.", 404);
    if ((slot.reserved ?? 0) >= slot.capacity) return fail("Selected delivery slot is full.", 409);

    const productKeys = parsed.data.items.map((item) => item.productId).filter(Boolean) as string[];
    const productResult = productKeys.length
      ? await supabase
          .from("products")
          .select("id, source_key, name, unit, price, is_available")
          .or(productKeys.map((key) => `id.eq.${key},source_key.eq.${key}`).join(","))
      : { data: [], error: null };
    if (productResult.error) return fail("Could not load selected products.", 500, productResult.error.message);

    const productsByKey = new Map<string, { id: string; source_key: string | null; name: string; unit: string; price: number | string; is_available: boolean }>();
    for (const product of productResult.data ?? []) {
      productsByKey.set(product.id, product);
      if (product.source_key) productsByKey.set(product.source_key, product);
    }

    const items: OrderItem[] = [];
    for (const [index, input] of parsed.data.items.entries()) {
      const product = input.productId ? productsByKey.get(input.productId) : undefined;
      if (input.productId && (!product || !product.is_available)) {
        return fail(`Product ${input.productId} is unavailable.`, 409);
      }

      items.push({
        id: `pending-${index + 1}`,
        productId: product?.id ?? `custom-${index + 1}`,
        productName: product?.name ?? input.productName ?? "Custom product",
        unit: product?.unit ?? input.unit ?? "request",
        requestedQuantity: input.requestedQuantity,
        estimatedPrice: Number(product?.price ?? input.estimatedPrice ?? 0),
        notes: input.notes
      });
    }

    const estimateTotal = calculateEstimate(items);
    const feeResult = await supabase
      .from("service_fee_rules")
      .select("id, name, flat_fee, free_delivery_minimum, is_active")
      .eq("is_active", true)
      .limit(1)
      .maybeSingle();
    const serviceFee = calculateServiceFee(estimateTotal, {
      id: feeResult.data?.id ?? "default",
      name: feeResult.data?.name ?? "Default",
      flatFee: Number(feeResult.data?.flat_fee ?? demoServiceFeeRule.flatFee),
      freeDeliveryMinimum: feeResult.data?.free_delivery_minimum === null ? undefined : Number(feeResult.data?.free_delivery_minimum ?? 0),
      isActive: feeResult.data?.is_active ?? true
    });

    const today = new Date().toISOString().slice(0, 10).replace(/-/g, "");
    const countResult = await supabase
      .from("orders")
      .select("id", { count: "exact", head: true })
      .gte("created_at", `${new Date().toISOString().slice(0, 10)}T00:00:00.000Z`);
    const orderNumber = `SD-${today}-${String((countResult.count ?? 0) + 1).padStart(4, "0")}`;

    const orderResult = await supabase
      .from("orders")
      .insert({
        order_number: orderNumber,
        customer_id: user.id,
        address_id: parsed.data.addressId,
        slot_id: slot.id,
        status: "submitted",
        payment_state: "unpaid",
        estimate_total: estimateTotal,
        service_fee: serviceFee,
        notes: parsed.data.notes ?? null
      })
      .select("id")
      .single();
    if (orderResult.error) return fail("Could not create order.", 500, orderResult.error.message);

    const orderId = orderResult.data.id;
    const itemResult = await supabase.from("order_items").insert(
      items.map((item) => ({
        order_id: orderId,
        product_id: item.productId.startsWith("custom-") ? null : item.productId,
        product_name: item.productName,
        unit: item.unit,
        requested_quantity: item.requestedQuantity,
        estimated_price: item.estimatedPrice,
        notes: item.notes ?? null
      }))
    );
    if (itemResult.error) return fail("Could not save order items.", 500, itemResult.error.message);

    await Promise.all([
      supabase.from("delivery_slots").update({ reserved: (slot.reserved ?? 0) + 1 }).eq("id", slot.id),
      supabase.from("cash_transactions").insert({
        order_id: orderId,
        reconciliation_status: "not_started"
      }),
      supabase.from("order_events").insert({
        order_id: orderId,
        actor_id: user.id,
        event_type: "order_submitted",
        message: "Order submitted and waiting for available staff.",
        metadata: { item_count: items.length, estimate_total: estimateTotal + serviceFee }
      })
    ]);

    const staffResult = await supabase
      .from("profiles")
      .select("id, phone")
      .eq("role", "staff");
    const activeStaffResult = await supabase
      .from("orders")
      .select("assigned_staff_id")
      .in("status", ["assigned", "confirmed", "shopping", "ready_for_delivery"])
      .not("assigned_staff_id", "is", null);
    const busyStaffIds = new Set((activeStaffResult.data ?? []).map((order) => order.assigned_staff_id));
    const messageBody = `New Smart Delivery order ${orderNumber}. ${items.length} items. Estimated total INR ${estimateTotal + serviceFee}. Open staff app to accept.`;
    const availableStaff = (staffResult.data ?? []).filter((staff) => !busyStaffIds.has(staff.id));
    if (availableStaff.length > 0) {
      await supabase.from("whatsapp_messages").insert(
        availableStaff.map((staff) => ({
          order_id: orderId,
          staff_id: staff.id,
          recipient_phone: staff.phone,
          recipient_role: "staff",
          event_type: "new_order_offer",
          message_body: messageBody,
          status: "fallback_ready",
          fallback_url: buildWhatsAppFallbackUrl(staff.phone, messageBody)
        }))
      );
    }

    return ok(
      {
        id: orderId,
        orderNumber,
        status: "submitted",
        paymentState: "unpaid",
        estimateTotal,
        serviceFee,
        items,
        createdAt: new Date().toISOString()
      },
      { status: 201 }
    );
  } catch (caught) {
    if (process.env.NEXT_PUBLIC_ENABLE_TEST_LOGIN === "true") {
      return createDemoOrderResponse(parsed);
    }
    return fail(caught instanceof Error ? caught.message : "Could not create order.", 500);
  }
}
