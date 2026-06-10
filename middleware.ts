import { createServerClient, type CookieOptions } from "@supabase/ssr";
import { NextResponse, type NextRequest } from "next/server";
import { authRedirectPath, requiredRoleForPath, type AuthProfile, type StaffSignupRequest } from "@/lib/auth-flow";

export async function middleware(request: NextRequest) {
  const response = NextResponse.next({
    request
  });
  const pathname = request.nextUrl.pathname;
  const requiredRole = requiredRoleForPath(pathname);

  if (!requiredRole) return response;

  const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
  if (!url || !anonKey) return response;

  const supabase = createServerClient(url, anonKey, {
    cookies: {
      getAll() {
        return request.cookies.getAll();
      },
      setAll(cookiesToSet: { name: string; value: string; options: CookieOptions }[]) {
        cookiesToSet.forEach(({ name, value, options }) => {
          request.cookies.set(name, value);
          response.cookies.set(name, value, options);
        });
      }
    }
  });

  const userResult = await supabase.auth.getUser();
  const user = userResult.data.user;

  if (!user) {
    return NextResponse.redirect(new URL(`/auth?next=${encodeURIComponent(pathname)}`, request.url));
  }

  const [profileResult, addressResult, staffRequestResult] = await Promise.all([
    supabase.from("profiles").select("id, role, full_name, phone").eq("id", user.id).maybeSingle(),
    supabase.from("customer_addresses").select("id").eq("customer_id", user.id).limit(1).maybeSingle(),
    supabase.from("staff_signup_requests").select("status").eq("user_id", user.id).maybeSingle()
  ]);

  const profile = (profileResult.data as AuthProfile | null) ?? null;
  const redirectTo = authRedirectPath({
    next: pathname,
    profile,
    hasCustomerAddress: Boolean(addressResult.data),
    staffRequestStatus: (staffRequestResult.data as Pick<StaffSignupRequest, "status"> | null)?.status ?? null
  });

  if (redirectTo !== pathname) {
    return NextResponse.redirect(new URL(redirectTo, request.url));
  }

  return response;
}

export const config = {
  matcher: ["/admin/:path*", "/customer/:path*", "/staff/:path*"]
};
