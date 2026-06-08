import { fail, ok, parseJson, productUpdateSchema } from "@/lib/api";
import { products } from "@/lib/demo-data";

export async function PATCH(request: Request, { params }: { params: Promise<{ productId: string }> }) {
  const { productId } = await params;
  const parsed = await parseJson(request, productUpdateSchema);
  if (!parsed.success) return fail("Invalid product update.", 422, parsed.error.flatten());

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
  const product = products.find((entry) => entry.id === productId);
  if (!product) return fail("Product not found.", 404);

  return ok({
    ...product,
    isAvailable: false,
    deletedAt: new Date().toISOString()
  });
}
