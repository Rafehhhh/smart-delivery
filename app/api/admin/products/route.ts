import { fail, ok, parseJson, productSchema } from "@/lib/api";
import { products } from "@/lib/demo-data";

export async function GET() {
  return ok(products);
}

export async function POST(request: Request) {
  const parsed = await parseJson(request, productSchema);
  if (!parsed.success) return fail("Invalid product payload.", 422, parsed.error.flatten());

  return ok(
    {
      id: `prod_${Date.now()}`,
      ...parsed.data
    },
    { status: 201 }
  );
}
