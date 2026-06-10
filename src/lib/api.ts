import { NextResponse } from "next/server";
import { z } from "zod";

export function ok<T>(data: T, init?: ResponseInit) {
  return NextResponse.json({ data }, init);
}

export function fail(message: string, status = 400, details?: unknown) {
  return NextResponse.json({ error: message, details }, { status });
}

export async function parseJson<T>(request: Request, schema: z.Schema<T>) {
  const json = await request.json();
  return schema.safeParse(json);
}

export const orderItemInputSchema = z.object({
  productId: z.string().min(1).optional().nullable(),
  productName: z.string().min(1).optional(),
  unit: z.string().min(1).optional(),
  estimatedPrice: z.number().min(0).optional(),
  requestedQuantity: z.number().positive(),
  notes: z.string().optional()
});

export const createOrderSchema = z.object({
  customerId: z.string().min(1).optional(),
  addressId: z.string().min(1),
  slotId: z.string().min(1),
  slotDateOffset: z.number().int().min(0).max(2).optional(),
  items: z.array(orderItemInputSchema).min(1),
  notes: z.string().optional()
});

export const assignOrderSchema = z.object({
  staffId: z.string().min(1)
});

export const updateOrderSchema = z.object({
  status: z
    .enum([
      "draft",
      "submitted",
      "assigned",
      "confirmed",
      "shopping",
      "ready_for_delivery",
      "delivered",
      "cancelled"
    ])
    .optional(),
  notes: z.string().optional()
});

export const cashSchema = z.object({
  advanceCollected: z.number().min(0).default(0),
  finalCollected: z.number().min(0).default(0),
  finalPayable: z.number().min(0)
});

export const finalizeItemsSchema = z.object({
  items: z
    .array(
      z.object({
        itemId: z.string().min(1),
        finalQuantity: z.number().positive(),
        finalPrice: z.number().min(0)
      })
    )
    .min(1)
});

export const productSchema = z.object({
  categoryId: z.string().min(1),
  name: z.string().min(1),
  unit: z.string().min(1),
  price: z.number().min(0),
  isApproximatePrice: z.boolean().default(false),
  isAvailable: z.boolean().default(true)
});

export const productUpdateSchema = productSchema.partial();

export const slotSchema = z.object({
  label: z.string().min(1),
  startsAt: z.string().datetime({ offset: true }),
  endsAt: z.string().datetime({ offset: true }),
  capacity: z.number().int().positive(),
  reserved: z.number().int().min(0).default(0)
});

export const staffSchema = z.object({
  name: z.string().min(1),
  phone: z.string().min(8)
});

export const serviceFeeRuleSchema = z.object({
  name: z.string().min(1),
  flatFee: z.number().min(0),
  freeDeliveryMinimum: z.number().min(0).optional(),
  isActive: z.boolean().default(true)
});
