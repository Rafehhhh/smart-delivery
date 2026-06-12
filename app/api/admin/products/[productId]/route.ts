import { fail, ok, parseJson, productUpdateSchema } from "@/lib/api";
import { products } from "@/lib/demo-data";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import type { z } from "zod";

type ProductUpdateInput = z.infer<typeof productUpdateSchema>;

export async function PATCH(request: Request, { params }: { params: Promise<{ productId: string }> }) {
  const { productId } = await params;
  const parsed = await parseJson(request, productUpdateSchema);
  if (!parsed.success) return fail("Invalid product update.", 422, parsed.error.flatten());

  try {
    const supabase = await createSupabaseServerClient();
    const updateResult = await supabase
      .from("products")
      .update(toProductUpdateRow(parsed.data))
      .or(`id.eq.${productId},source_key.eq.${productId}`)
      .select("id, source_key, category_id, name, unit, price, previous_week_price, retail_range, source_note, popularity, best_value_shop, is_approximate_price, is_available")
      .maybeSingle();

    if (updateResult.data) {
      return ok({
        id: updateResult.data.source_key ?? updateResult.data.id,
        categoryId: updateResult.data.category_id,
        name: updateResult.data.name,
        unit: updateResult.data.unit,
        price: Number(updateResult.data.price),
        previousWeekPrice: updateResult.data.previous_week_price === null ? undefined : Number(updateResult.data.previous_week_price),
        retailRange: updateResult.data.retail_range ?? undefined,
        sourceNote: updateResult.data.source_note ?? undefined,
        popularity: updateResult.data.popularity ?? undefined,
        bestValueShop: updateResult.data.best_value_shop ?? undefined,
        isApproximatePrice: updateResult.data.is_approximate_price,
        isAvailable: updateResult.data.is_available,
        updatedAt: new Date().toISOString()
      });
    }
  } catch {
    // Demo fallback below keeps local previews usable without Supabase.
  }

  const product = products.find((entry) => entry.id === productId);
  if (!product) return fail("Product not found.", 404);

  return ok({
    ...product,
    ...parsed.data,
    updatedAt: new Date().toISOString()
  });
}

export async function DELETE(_: Request, { params }: { params: Promise<{ productId: string }> }) {
  const { productId } = await params;
  try {
    const supabase = await createSupabaseServerClient();
    const updateResult = await supabase
      .from("products")
      .update({ is_available: false, updated_at: new Date().toISOString() })
      .or(`id.eq.${productId},source_key.eq.${productId}`)
      .select("id")
      .maybeSingle();
    if (updateResult.data) return ok({ id: productId, isAvailable: false, deletedAt: new Date().toISOString() });
  } catch {
    // Demo fallback below keeps local previews usable without Supabase.
  }

  const product = products.find((entry) => entry.id === productId);
  if (!product) return fail("Product not found.", 404);

  return ok({
    ...product,
    isAvailable: false,
    deletedAt: new Date().toISOString()
  });
}

function toProductUpdateRow(data: ProductUpdateInput) {
  return {
    ...(data.name ? { name: data.name } : {}),
    ...(data.unit ? { unit: data.unit } : {}),
    ...(typeof data.price === "number" ? { price: data.price } : {}),
    ...(data.previousWeekPrice !== undefined ? { previous_week_price: data.previousWeekPrice } : {}),
    ...(data.retailRange !== undefined ? { retail_range: data.retailRange } : {}),
    ...(data.sourceNote !== undefined ? { source_note: data.sourceNote } : {}),
    ...(data.popularity !== undefined ? { popularity: data.popularity } : {}),
    ...(data.bestValueShop !== undefined ? { best_value_shop: data.bestValueShop } : {}),
    ...(typeof data.isApproximatePrice === "boolean" ? { is_approximate_price: data.isApproximatePrice } : {}),
    ...(typeof data.isAvailable === "boolean" ? { is_available: data.isAvailable } : {}),
    updated_at: new Date().toISOString()
  };
}
