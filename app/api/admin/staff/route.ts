import { fail, ok, parseJson, staffSchema } from "@/lib/api";
import { profiles } from "@/lib/demo-data";

export async function GET() {
  return ok(profiles.filter((profile) => profile.role === "staff"));
}

export async function POST(request: Request) {
  const parsed = await parseJson(request, staffSchema);
  if (!parsed.success) return fail("Invalid staff payload.", 422, parsed.error.flatten());

  return ok(
    {
      id: `staff_${Date.now()}`,
      role: "staff",
      ...parsed.data
    },
    { status: 201 }
  );
}
