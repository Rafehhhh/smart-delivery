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

  const headers = new Headers();
  const cookieOptions = "Path=/; Max-Age=604800; SameSite=Lax";
  headers.append("Set-Cookie", `smart_delivery_test_role=${parsed.data.role}; ${cookieOptions}`);
  headers.append("Set-Cookie", `smart_delivery_test_staff_status=${parsed.data.staffStatus ?? "approved"}; ${cookieOptions}`);

  return ok(
    {
      role: parsed.data.role,
      staffStatus: parsed.data.staffStatus ?? "approved"
    },
    { headers }
  );
}
