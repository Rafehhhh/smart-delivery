import { z } from "zod";
import { fail, ok, parseJson } from "@/lib/api";
import { createSupabaseServerClient } from "@/lib/supabase/server";

const staffRequestSchema = z.object({
  fullName: z.string().min(2),
  phone: z.string().min(8),
  routeArea: z.string().min(2),
  vehicle: z.string().min(2),
  note: z.string().optional()
});

export async function GET() {
  const supabase = await createSupabaseServerClient();
  const userResult = await supabase.auth.getUser();
  const user = userResult.data.user;
  if (!user) return fail("Sign in before checking staff request.", 401);

  const requestResult = await supabase
    .from("staff_signup_requests")
    .select("id, status, full_name, phone, route_area, vehicle, note, created_at")
    .eq("user_id", user.id)
    .maybeSingle();

  if (requestResult.error) return fail("Could not load staff request.", 500, requestResult.error.message);
  return ok(requestResult.data);
}

export async function POST(request: Request) {
  const parsed = await parseJson(request, staffRequestSchema);
  if (!parsed.success) return fail("Invalid staff request.", 422, parsed.error.flatten());

  const supabase = await createSupabaseServerClient();
  const userResult = await supabase.auth.getUser();
  const user = userResult.data.user;
  if (!user) return fail("Sign in before requesting staff access.", 401);

  const profileResult = await supabase.from("profiles").upsert({
    id: user.id,
    role: "customer",
    full_name: parsed.data.fullName,
    phone: parsed.data.phone,
    updated_at: new Date().toISOString()
  }).select("id").single();

  if (profileResult.error) return fail("Could not save applicant profile.", 500, profileResult.error.message);

  const requestResult = await supabase
    .from("staff_signup_requests")
    .upsert({
      user_id: user.id,
      full_name: parsed.data.fullName,
      phone: parsed.data.phone,
      route_area: parsed.data.routeArea,
      vehicle: parsed.data.vehicle,
      note: parsed.data.note || null,
      status: "pending",
      updated_at: new Date().toISOString()
    }, { onConflict: "user_id" })
    .select("id, status")
    .single();

  if (requestResult.error) return fail("Could not submit staff request.", 500, requestResult.error.message);

  return ok(requestResult.data, { status: 201 });
}
