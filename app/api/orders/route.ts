import { calculateEstimate, calculateServiceFee, isSlotAvailable, reconcileCash } from "@/lib/calculations";
import { addresses, products, serviceFeeRule, slots, profiles } from "@/lib/demo-data";
import { createOrderSchema, fail, ok, parseJson } from "@/lib/api";
import type { OrderItem } from "@/lib/types";

export async function POST(request: Request) {
  const parsed = await parseJson(request, createOrderSchema);
  if (!parsed.success) return fail("Invalid order payload.", 422, parsed.error.flatten());

  const customer = profiles.find((profile) => profile.id === parsed.data.customerId && profile.role === "customer");
  const address = addresses.find((entry) => entry.id === parsed.data.addressId);
  const slot = slots.find((entry) => entry.id === parsed.data.slotId);

  if (!customer || !address || !slot) return fail("Customer, address, or delivery slot was not found.", 404);
  if (!isSlotAvailable(slot)) return fail("Selected delivery slot is full.", 409);

  const items: OrderItem[] = [];

  for (const [index, input] of parsed.data.items.entries()) {
    const product = products.find((entry) => entry.id === input.productId);
    if (!product || !product.isAvailable) {
      return fail(`Product ${input.productId} is unavailable.`, 409);
    }

    items.push({
      id: `new-item-${index + 1}`,
      productId: product.id,
      productName: product.name,
      unit: product.unit,
      requestedQuantity: input.requestedQuantity,
      estimatedPrice: product.price,
      notes: input.notes
    });
  }

  const estimateTotal = calculateEstimate(items);
  const serviceFee = calculateServiceFee(estimateTotal, serviceFeeRule);

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
