import { cookies } from "next/headers";
import { redirect } from "next/navigation";
import { StaffPageClient } from "./staff-page-client";
import { getOrdersData } from "@/lib/supabase-orders";

export default async function StaffPage() {
  if (process.env.NEXT_PUBLIC_ENABLE_TEST_LOGIN === "true") {
    const cookieStore = await cookies();
    const testMode = cookieStore.get("smart_delivery_test_mode")?.value;
    const testRole = cookieStore.get("smart_delivery_test_role")?.value;
    const testStaffStatus = cookieStore.get("smart_delivery_test_staff_status")?.value;

    if (testMode === "staff_pending" || (testRole === "staff" && testStaffStatus === "pending")) {
      redirect("/auth/staff-pending");
    }
  }

  const ordersData = await getOrdersData();
  return <StaffPageClient initialOrders={ordersData.orders} />;
}
