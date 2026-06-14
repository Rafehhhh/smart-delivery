import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { customerReviews, orders, profiles } from "@/lib/demo-data";
import { formatCurrency } from "@/lib/format";
import { getOrderTotal, processingStatuses } from "@/lib/admin-metrics";
import { createSupabaseServerClient } from "@/lib/supabase/server";
import type { StaffSignupRequest } from "@/lib/auth-flow";
import { AdminHomeHeader } from "../admin-header";
import { StaffRequestsPanel } from "./staff-requests-panel";
import { ArrowLeft, MessageCircle, Users } from "lucide-react";

export const dynamic = "force-dynamic";

async function getStaffRequests() {
  try {
    const supabase = await createSupabaseServerClient();
    const result = await supabase
      .from("staff_signup_requests")
      .select("id, user_id, full_name, phone, route_area, vehicle, note, status, reviewed_by, reviewed_at, created_at, updated_at")
      .order("created_at", { ascending: false });

    return (result.data ?? []) as StaffSignupRequest[];
  } catch {
    return [];
  }
}

export default async function AdminStaffRecordsPage() {
  const staffRequests = await getStaffRequests();
  const staff = profiles.filter((profile) => profile.role === "staff");
  const staffRows = staff.map((member) => {
    const memberOrders = orders.filter((order) => order.assignedStaff?.id === member.id);
    const memberReviews = customerReviews.filter((review) => review.staffId === member.id);
    const deliveredOrders = memberOrders.filter((order) => order.status === "delivered");
    const activeOrder = memberOrders.find((order) => processingStatuses.includes(order.status));

    return {
      member,
      memberOrders,
      memberReviews,
      deliveredOrders,
      activeOrder,
      isBusy: Boolean(activeOrder),
      orderValue: memberOrders.reduce((total, order) => total + getOrderTotal(order), 0),
      averageRating: memberReviews.length
        ? memberReviews.reduce((total, review) => total + review.rating, 0) / memberReviews.length
        : 0
    };
  });
  const staffReviewCount = customerReviews.filter((review) => review.target === "staff").length;

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="mx-auto max-w-7xl px-2 py-3 sm:px-4 lg:px-6">
        <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/25 bg-white px-3 py-2 text-sm font-semibold shadow-sm lg:rounded-md lg:border-ink/15 lg:shadow-none">
          <ArrowLeft aria-hidden size={16} />
          Admin dashboard
        </Link>
      </section>

      <section className="mx-auto grid max-w-7xl gap-3 px-2 pb-4 sm:px-4 lg:grid-cols-[minmax(0,1.35fr)_300px] lg:px-6">
        <section className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-xl lg:border-ink/10 lg:p-2.5 lg:shadow-sm">
          <div className="flex flex-wrap items-center justify-between gap-2 border-b border-ink/10 pb-2">
            <div>
              <h1 className="flex items-center gap-2 text-lg font-semibold">
                <Users aria-hidden size={20} />
                All staff details
              </h1>
              <p className="mt-0.5 text-xs text-ink/58">Staff serial number, phone, availability, orders, delivery value, reviews, and WhatsApp contact.</p>
            </div>
            <span className="rounded-full bg-mint px-3 py-1 text-xs font-semibold text-leaf">{staff.length} staff</span>
          </div>

          <div className="mt-2 grid max-h-[calc(100dvh-14rem)] gap-2 overflow-y-auto pr-1 lg:hidden">
            {staffRows.map((row, index) => (
              <article key={row.member.id} className="rounded-2xl border border-ink/25 bg-limewash p-3 shadow-sm">
                <div className="flex items-start justify-between gap-2">
                  <div className="min-w-0">
                    <p className="text-[11px] font-semibold uppercase tracking-[0.1em] text-ink/46">#{index + 1}</p>
                    <h2 className="mt-1 truncate text-base font-semibold">{row.member.name}</h2>
                    <p className="mt-1 text-xs font-semibold text-ink/62">{row.member.phone}</p>
                  </div>
                  <a
                    href={`https://wa.me/${row.member.phone.replace(/\D/g, "")}`}
                    className="focus-ring inline-flex h-9 w-9 shrink-0 items-center justify-center rounded-full border border-ink/25 bg-white text-leaf"
                    aria-label={`Message ${row.member.name} on WhatsApp`}
                  >
                    <MessageCircle aria-hidden size={16} />
                  </a>
                </div>
                <div className="mt-2 grid grid-cols-2 gap-1.5">
                  <MobileStaffStat label="Status" value={row.isBusy ? "Busy" : "Available"} valueClass={row.isBusy ? "text-market" : "text-leaf"} />
                  <MobileStaffStat label="Orders" value={String(row.memberOrders.length)} />
                  <MobileStaffStat label="Delivered" value={String(row.deliveredOrders.length)} />
                  <MobileStaffStat label="Value" value={formatCurrency(row.orderValue)} />
                </div>
                <p className="mt-2 rounded-2xl border border-ink/15 bg-white p-2 text-xs leading-5 text-ink/58">
                  {row.activeOrder ? `Current order: ${row.activeOrder.orderNumber}` : "No active order"}
                </p>
              </article>
            ))}
          </div>

          <div className="mt-2 hidden max-h-[calc(100vh-11rem)] overflow-y-auto overflow-x-hidden pr-1 lg:block">
            <table className="w-full table-fixed border-separate border-spacing-y-1 text-left text-xs">
              <colgroup>
                <col className="w-[6%]" />
                <col className="w-[20%]" />
                <col className="w-[17%]" />
                <col className="w-[13%]" />
                <col className="w-[12%]" />
                <col className="w-[12%]" />
                <col className="w-[12%]" />
                <col className="w-[8%]" />
              </colgroup>
              <thead className="sticky top-0 z-10 bg-white">
                <tr className="text-ink/58">
                  <th className="px-2 py-1 font-semibold">No.</th>
                  <th className="px-2 py-1 font-semibold">Staff</th>
                  <th className="px-2 py-1 font-semibold">Phone</th>
                  <th className="px-2 py-1 font-semibold">Status</th>
                  <th className="px-2 py-1 font-semibold">Orders</th>
                  <th className="px-2 py-1 font-semibold">Delivered</th>
                  <th className="px-2 py-1 font-semibold">Value</th>
                  <th className="px-2 py-1 text-right font-semibold">WA</th>
                </tr>
              </thead>
              <tbody>
                {staffRows.map((row, index) => (
                  <tr key={row.member.id} className="bg-limewash align-top hover:bg-mint/60">
                    <td className="rounded-l-xl px-2 py-1.5 font-semibold text-ink/50">{index + 1}</td>
                    <td className="px-2 py-1.5">
                      <p className="truncate font-semibold">{row.member.name}</p>
                      <p className="mt-0.5 line-clamp-2 text-[11px] leading-snug text-ink/52">
                        {row.activeOrder ? `Current: ${row.activeOrder.orderNumber}` : "No active order"}
                      </p>
                    </td>
                    <td className="px-2 py-1.5 font-semibold text-ink/66">{row.member.phone}</td>
                    <td className="px-2 py-1.5">
                      <span className={row.isBusy ? "rounded-full bg-market/15 px-2 py-0.5 text-xs font-semibold text-market" : "rounded-full bg-mint px-2 py-0.5 text-xs font-semibold text-leaf"}>
                        {row.isBusy ? "Busy" : "Available"}
                      </span>
                    </td>
                    <td className="px-2 py-1.5 font-semibold">{row.memberOrders.length}</td>
                    <td className="px-2 py-1.5 font-semibold">{row.deliveredOrders.length}</td>
                    <td className="px-2 py-1.5 font-semibold">{formatCurrency(row.orderValue)}</td>
                    <td className="rounded-r-xl px-2 py-1.5 text-right">
                      <a
                        href={`https://wa.me/${row.member.phone.replace(/\D/g, "")}`}
                        className="focus-ring inline-flex h-7 w-7 items-center justify-center rounded-full border border-ink/10 bg-white text-leaf"
                        aria-label={`Message ${row.member.name} on WhatsApp`}
                      >
                        <MessageCircle aria-hidden size={15} />
                      </a>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>

        <aside className="space-y-3">
          <StaffRequestsPanel requests={staffRequests} />

          <section className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-xl lg:border-ink/10 lg:p-2.5 lg:shadow-sm">
            <h2 className="text-base font-semibold">Staff summary</h2>
            <div className="mt-2 grid gap-1.5">
              <MiniStat label="Registered staff" value={String(staff.length)} />
              <MiniStat label="Available now" value={String(staffRows.filter((row) => !row.isBusy).length)} />
              <MiniStat label="Busy now" value={String(staffRows.filter((row) => row.isBusy).length)} />
              <MiniStat label="Staff reviews" value={String(staffReviewCount)} />
              <MiniStat label="Unreplied reviews" value={String(customerReviews.filter((review) => review.replyStatus === "not_replied").length)} />
            </div>
          </section>
        </aside>
      </section>
    </AppShell>
  );
}

function MiniStat({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-2xl border border-ink/15 bg-limewash px-2.5 py-2 lg:rounded-lg lg:border-0">
      <p className="text-[11px] font-semibold uppercase tracking-[0.1em] text-ink/46">{label}</p>
      <p className="mt-0.5 text-base font-semibold">{value}</p>
    </div>
  );
}

function MobileStaffStat({ label, value, valueClass = "" }: { label: string; value: string; valueClass?: string }) {
  return (
    <div className="rounded-2xl border border-ink/15 bg-white p-2">
      <p className="text-[10px] font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className={`mt-0.5 text-xs font-semibold ${valueClass}`}>{value}</p>
    </div>
  );
}
