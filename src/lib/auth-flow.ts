import type { UserRole } from "./types";

export type AuthProfile = {
  id: string;
  role: UserRole;
  full_name: string;
  phone: string;
};

export type StaffRequestStatus = "pending" | "approved" | "rejected";

export type StaffSignupRequest = {
  id: string;
  user_id: string;
  full_name: string;
  phone: string;
  route_area: string;
  vehicle: string;
  note: string | null;
  status: StaffRequestStatus;
  reviewed_by: string | null;
  reviewed_at: string | null;
  created_at: string;
  updated_at: string;
};

export function isSafeNextPath(next: string | null) {
  if (!next) return false;
  return next.startsWith("/") && !next.startsWith("//") && !next.includes("://");
}

export function roleHome(role: UserRole) {
  if (role === "admin") return "/admin";
  if (role === "staff") return "/staff";
  return "/customer";
}

export function requiredRoleForPath(pathname: string): UserRole | null {
  if (pathname === "/admin" || pathname.startsWith("/admin/")) return "admin";
  if (pathname === "/staff" || pathname.startsWith("/staff/")) return "staff";
  if (pathname === "/customer" || pathname.startsWith("/customer/")) return "customer";
  return null;
}

export function authRedirectPath({
  next,
  profile,
  hasCustomerAddress,
  staffRequestStatus
}: {
  next: string | null;
  profile: AuthProfile | null;
  hasCustomerAddress: boolean;
  staffRequestStatus?: StaffRequestStatus | null;
}) {
  const safeNext = isSafeNextPath(next) ? next : null;

  if (!profile) {
    return safeNext?.startsWith("/staff") ? "/auth/staff-request" : `/auth/onboarding${safeNext ? `?next=${encodeURIComponent(safeNext)}` : ""}`;
  }

  if (profile.role === "customer" && safeNext?.startsWith("/staff")) {
    if (staffRequestStatus === "pending") return "/auth/staff-pending";
    return "/auth/staff-request";
  }

  if (profile.role === "customer" && !hasCustomerAddress) {
    return `/auth/onboarding${safeNext ? `?next=${encodeURIComponent(safeNext)}` : ""}`;
  }

  const requiredRole = safeNext ? requiredRoleForPath(safeNext) : null;
  if (safeNext && (!requiredRole || requiredRole === profile.role)) return safeNext;

  return roleHome(profile.role);
}
