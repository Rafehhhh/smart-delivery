import { fail, ok, parseJson, serviceFeeRuleSchema } from "@/lib/api";
import { serviceFeeRule } from "@/lib/demo-data";

export async function GET() {
  return ok(serviceFeeRule);
}

export async function POST(request: Request) {
  const parsed = await parseJson(request, serviceFeeRuleSchema);
  if (!parsed.success) return fail("Invalid service fee rule payload.", 422, parsed.error.flatten());

  return ok(
    {
      id: `fee_${Date.now()}`,
      ...parsed.data
    },
    { status: 201 }
  );
}
