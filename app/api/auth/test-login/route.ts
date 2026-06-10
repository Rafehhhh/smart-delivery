import { z } from "zod";
import { fail, ok, parseJson } from "@/lib/api";

const testLoginSchema = z.object({
  role: z.enum(["customer", "admin", "staff"]),
  staffStatus: z.enum(["approved", "pending"]).optional()
});

export async function POST(request: Request) {
  if (process.env.NEXT_PUBLIC_ENABLE_TEST_LOGIN !== "true") {
    return fail("Test login is disabled.", 404);
  }

  const parsed = await parseJson(request, testLoginSchema);
  if (!parsed.success) return fail("Invalid test login role.", 422, parsed.error.flatten());

  const staffStatus = parsed.data.staffStatus ?? "approved";
  const testMode = parsed.data.role === "staff" && staffStatus === "pending" ? "staff_pending" : parsed.data.role;
  const response = ok({
    role: parsed.data.role,
    staffStatus,
    mode: testMode
  });

  response.cookies.set("smart_delivery_test_mode", testMode, {
    path: "/",
    maxAge: 60 * 60 * 24 * 7,
    sameSite: "lax"
  });
  response.cookies.set("smart_delivery_test_role", parsed.data.role, {
    path: "/",
    maxAge: 60 * 60 * 24 * 7,
    sameSite: "lax"
  });
  response.cookies.set("smart_delivery_test_staff_status", staffStatus, {
    path: "/",
    maxAge: 60 * 60 * 24 * 7,
    sameSite: "lax"
  });

  return response;
}
