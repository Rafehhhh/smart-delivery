import { fail, ok } from "@/lib/api";
import { getDemoOrder } from "@/lib/demo-data";
import { dispatchOrderToStaff } from "@/lib/whatsapp";

export async function POST(_: Request, { params }: { params: Promise<{ orderId: string }> }) {
  const { orderId } = await params;
  const order = getDemoOrder(orderId);
  if (!order) return fail("Order not found.", 404);
  if (!order.assignedStaff) return fail("Assign a staff member before dispatching WhatsApp details.", 409);

  const result = await dispatchOrderToStaff({
    order,
    staffPhone: order.assignedStaff.phone
  });

  return ok({
    orderId,
    result,
    loggedAt: new Date().toISOString()
  });
}
