import { z } from "zod";
import { fail, ok, parseJson } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";

const reviewStaffRequestSchema = z.object({
  status: z.enum(["approved", "rejected"])
});

export async function PATCH(request: Request, { params }: { params: Promise<{ requestId: string }> }) {
  const { requestId } = await params;
  const parsed = await parseJson(request, reviewStaffRequestSchema);
  if (!parsed.success) return fail("Invalid staff request review.", 422, parsed.error.flatten());

  const supabase = await createSupabaseServerClient();
  const userResult = await supabase.auth.getUser();
  const reviewer = userResult.data.user;
  if (!reviewer) return fail("Sign in as admin before reviewing staff requests.", 401);

  const profileResult = await supabase.from("profiles").select("role").eq("id", reviewer.id).maybeSingle();
  if (profileResult.data?.role !== "admin") return fail("Admin access required.", 403);

  const requestResult = await supabase
    .from("staff_signup_requests")
    .select("id, user_id")
    .eq("id", requestId)
    .maybeSingle();

  if (requestResult.error || !requestResult.data) return fail("Staff request was not found.", 404);

  const reviewedAt = new Date().toISOString();
  const updateResult = await supabase
    .from("staff_signup_requests")
    .update({
      status: parsed.data.status,
      reviewed_by: reviewer.id,
      reviewed_at: reviewedAt,
      updated_at: reviewedAt
    })
    .eq("id", requestId)
    .select("id, status")
    .single();

  if (updateResult.error) return fail("Could not update staff request.", 500, updateResult.error.message);

  if (parsed.data.status === "approved") {
    const profileUpdate = await supabase
      .from("profiles")
      .update({ role: "staff", updated_at: reviewedAt })
      .eq("id", requestResult.data.user_id);

    if (profileUpdate.error) return fail("Staff request approved, but profile role update failed.", 500, profileUpdate.error.message);
  }

  return ok(updateResult.data);
}
