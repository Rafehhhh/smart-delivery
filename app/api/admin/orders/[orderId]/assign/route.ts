import { assignOrderSchema, fail, ok, parseJson } from "@/lib/api";
import { getDemoOrder, profiles } from "@/lib/demo-data";

export async function POST(request: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const parsed = await parseJson(request, assignOrderSchema);
  if (!parsed.success) return fail("Invalid assignment payload.", 422, parsed.error.flatten());

  const order = getDemoOrder(orderId);
  const staff = profiles.find((profile) => profile.id === parsed.data.staffId && profile.role === "staff");

  if (!order || !staff) return fail("Order or staff member not found.", 404);

  return ok({
    ...order,
    assignedStaff: staff,
    status: "assigned",
    assignment: {
      orderId,
      staffId: staff.id,
      assignedAt: new Date().toISOString()
    }
  });
}
