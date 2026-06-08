import { fail, ok, parseJson, slotSchema } from "@/lib/api";
import { slots } from "@/lib/demo-data";

export async function GET() {
  return ok(slots);
}

export async function POST(request: Request) {
  const parsed = await parseJson(request, slotSchema);
  if (!parsed.success) return fail("Invalid delivery slot payload.", 422, parsed.error.flatten());

  if (new Date(parsed.data.endsAt) <= new Date(parsed.data.startsAt)) {
    return fail("Slot end time must be after start time.", 422);
  }

  return ok(
    {
      id: `slot_${Date.now()}`,
      ...parsed.data
    },
    { status: 201 }
  );
}
