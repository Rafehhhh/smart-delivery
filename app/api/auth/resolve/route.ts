import { NextResponse } from "next/server";
import { authRedirectPath, type AuthProfile, type StaffSignupRequest } from "@/lib/auth-flow";
import { createSupabaseServerClient } from "@/lib/supabase/server";

export async function GET(request: Request) {
  const { searchParams } = new URL(request.url);
  const next = searchParams.get("next");
  const supabase = await createSupabaseServerClient();
  const userResult = await supabase.auth.getUser();
  const user = userResult.data.user;

  if (!user) {
    return NextResponse.json({ redirectTo: `/auth${next ? `?next=${encodeURIComponent(next)}` : ""}` }, { status: 401 });
  }

  const [profileResult, addressResult, staffRequestResult] = await Promise.all([
    supabase.from("profiles").select("id, role, full_name, phone").eq("id", user.id).maybeSingle(),
    supabase.from("customer_addresses").select("id").eq("customer_id", user.id).limit(1).maybeSingle(),
    supabase.from("staff_signup_requests").select("status").eq("user_id", user.id).maybeSingle()
  ]);

  const redirectTo = authRedirectPath({
    next,
    profile: (profileResult.data as AuthProfile | null) ?? null,
    hasCustomerAddress: Boolean(addressResult.data),
    staffRequestStatus: (staffRequestResult.data as Pick<StaffSignupRequest, "status"> | null)?.status ?? null
  });

  return NextResponse.json({ redirectTo });
}
