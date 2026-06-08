import Link from "next/link";
import type { Route } from "next";
import type { ReactNode } from "react";
import { AppShell } from "@/components/app-shell";
import { StatusPill } from "@/components/status-pill";
import { customerReviews, orders, profiles } from "@/lib/demo-data";
import { formatCurrency, formatDateTime } from "@/lib/format";
import {
  getOrderTotal,
  getRevenueSummary,
  processingStatuses
} from "@/lib/admin-metrics";
import { getCatalogData } from "@/lib/supabase-catalog";
import { SlotCapacityManager } from "./slot-capacity-manager";
import {
  Banknote,
  Bike,
  Home,
  MessageCircle,
  PackageSearch,
  ReceiptText,
  Star,
  TrendingUp
} from "lucide-react";

export const dynamic = "force-dynamic";

export default async function AdminPage() {
  const { products } = await getCatalogData();
  const staff = profiles.filter((profile) => profile.role === "staff");
  const latestOrders = [...orders].sort((a, b) => b.createdAt.localeCompare(a.createdAt)).slice(0, 3);
  const latestReviews = [...customerReviews].sort((a, b) => b.createdAt.localeCompare(a.createdAt)).slice(0, 3);
  const popularityRank = {
    top_selling: 0,
    popular: 1,
    seasonal: 2,
    standard: 3
  } as const;
  const popularProducts = [...products]
    .sort((a, b) => {
      const aRank = popularityRank[a.popularity ?? "standard"];
      const bRank = popularityRank[b.popularity ?? "standard"];
      return aRank - bRank || a.name.localeCompare(b.name);
    })
    .slice(0, 4)
    .map((product) => ({
      name: product.name,
      price: product.price,
      unit: product.unit,
      popularityLabel: product.popularity ? product.popularity.replace("_", " ") : "standard"
    }));
  const priceMovers = [...products].sort((a, b) => {
    const aMove = Math.abs(a.price - (a.previousWeekPrice ?? a.price));
    const bMove = Math.abs(b.price - (b.previousWeekPrice ?? b.price));
    return bMove - aMove;
  }).slice(0, 4);
  const revenue = getRevenueSummary();
  const paidOrders = orders.filter((order) => order.paymentState === "paid").length;
  const pendingPayments = orders.filter((order) => order.paymentState !== "paid").length;
  const activeStaffIds = new Set(
    orders
      .filter((order) => order.assignedStaff && processingStatuses.includes(order.status))
      .map((order) => order.assignedStaff?.id)
  );

  return (
    <AppShell
      hideNav
      headerContent={
        <div className="flex items-center gap-2">
          <span className="text-sm font-semibold text-ink/72">Admin</span>
          <Link
            href="/"
            className="focus-ring inline-flex h-10 w-10 items-center justify-center rounded-full border border-ink/10 bg-white text-ink/72 hover:text-ink"
            aria-label="Go to home"
          >
            <Home aria-hidden size={17} />
          </Link>
        </div>
      }
    >
      <main className="mx-auto grid max-w-7xl gap-2 px-2 py-2 sm:px-3">
        <div className="grid items-start gap-2 lg:grid-cols-2">
          <div className="grid gap-2">
            <div className="grid gap-1.5 sm:grid-cols-3">
              <StatTile label="Orders" value={String(orders.length)} />
              <StatTile label="Products" value={String(products.length)} />
              <StatTile label="Staff" value={String(staff.length)} />
              <StatTile label="Pending pay" value={String(pendingPayments)} />
              <StatTile label="Reviews" value={String(customerReviews.length)} />
              <StatTile label="Cash" value={formatCurrency(revenue.cashHandled)} />
            </div>

            <DashboardSection
              id="staff"
              title="Staff monitoring"
              icon={Bike}
              actionHref="/admin/staff-records"
              actionLabel="Check staff details"
            >
              <div className="max-h-[106px] overflow-y-auto rounded-lg border border-ink/10">
                <table className="w-full border-collapse text-left text-xs sm:text-sm">
                  <thead className="sticky top-0 z-10 bg-limewash text-xs text-ink/58">
                    <tr>
                      <th className="w-10 px-2 py-1.5 font-semibold">No</th>
                      <th className="px-2 py-1.5 font-semibold">Staff</th>
                      <th className="px-2 py-1.5 font-semibold">Phone</th>
                      <th className="px-2 py-1.5 font-semibold">Status</th>
                      <th className="w-11 px-2 py-1.5 text-right font-semibold">WA</th>
                    </tr>
                  </thead>
                  <tbody>
                    {staff.map((member, index) => {
                      const isBusy = activeStaffIds.has(member.id);
                      return (
                        <tr key={member.id} className="border-t border-ink/10">
                          <td className="px-2 py-1.5 font-semibold">{index + 1}</td>
                          <td className="px-2 py-1.5 font-semibold">{member.name}</td>
                          <td className="px-2 py-1.5 text-ink/64">{member.phone}</td>
                          <td className="px-2 py-1.5">
                            <span className={isBusy ? "rounded-full bg-market/15 px-2 py-0.5 text-xs font-semibold text-market" : "rounded-full bg-mint px-2 py-0.5 text-xs font-semibold text-leaf"}>
                              {isBusy ? "Busy" : "Available"}
                            </span>
                          </td>
                          <td className="px-2 py-1.5 text-right">
                            <a
                              href={`https://wa.me/${member.phone.replace(/\D/g, "")}`}
                              className="focus-ring inline-flex h-7 w-7 items-center justify-center rounded-full border border-ink/10 text-leaf"
                              aria-label={`Message ${member.name} on WhatsApp`}
                            >
                              <MessageCircle aria-hidden size={15} />
                            </a>
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            </DashboardSection>

            <DashboardSection
              id="products"
              title="Product monitoring"
              icon={PackageSearch}
              actionHref="/admin/products"
              actionLabel="Browse product details"
            >
              <div className="space-y-1.5">
                <div className="rounded-lg bg-limewash px-2.5 py-1.5 text-sm font-semibold">
                  Total products: {products.length}
                </div>
                <ProductMonitorTable
                  title="Popular products"
                  rows={popularProducts.map((product) => ({
                    name: product.name,
                    detail: `${product.popularityLabel} - ${formatCurrency(product.price)} / ${product.unit}`
                  }))}
                />
              </div>
            </DashboardSection>
          </div>

          <div className="grid gap-2">
            <SlotCapacityManager />

            <DashboardSection
              id="price-changes"
              title="Weekly price changes"
              icon={TrendingUp}
              actionHref="/admin/products"
              actionLabel="Browse price details"
            >
              <ProductMonitorTable
                title="Highest weekly movements"
                rows={priceMovers.map((product) => {
                  const previous = product.previousWeekPrice ?? product.price;
                  const difference = product.price - previous;
                  return {
                    name: product.name,
                    detail: `${formatCurrency(product.price)} now - ${difference >= 0 ? "+" : ""}${formatCurrency(difference)} from last week`
                  };
                })}
              />
            </DashboardSection>
          </div>
        </div>

        <div className="grid items-start gap-2 lg:grid-cols-3">
          <DashboardSection
            id="orders"
            title="Order monitoring"
            icon={ReceiptText}
            actionHref="/admin/orders"
            actionLabel="Check order details"
          >
            <div className="space-y-1.5">
              {latestOrders.map((order) => (
                <article key={order.id} className="rounded-lg bg-limewash p-2.5">
                  <div className="flex flex-wrap items-start justify-between gap-1.5">
                    <div>
                      <p className="font-semibold">{order.orderNumber}</p>
                      <p className="mt-0.5 text-sm text-ink/60">{order.customer.name} - {order.customer.phone}</p>
                    </div>
                    <p className="font-semibold">{formatCurrency(getOrderTotal(order))}</p>
                  </div>
                  <div className="mt-2 flex flex-wrap gap-1.5">
                    <StatusPill value={order.status} type="order" />
                    <StatusPill value={order.paymentState} type="payment" />
                    <span className="rounded-full bg-white px-2 py-1 text-xs font-semibold text-ink/58">{order.slot.label}</span>
                  </div>
                </article>
              ))}
            </div>
          </DashboardSection>

          <DashboardSection
            id="income"
            title="Income"
            icon={Banknote}
            actionHref="/admin/payments"
            actionLabel="Check payment details"
          >
            <div className="grid gap-1.5">
              <MiniMetric label="Today revenue" value={formatCurrency(revenue.todayRevenue)} />
              <MiniMetric label="Paid orders" value={String(paidOrders)} />
              <MiniMetric label="Pending payments" value={String(pendingPayments)} />
              <MiniMetric label="Cash handled" value={formatCurrency(revenue.cashHandled)} />
            </div>
          </DashboardSection>

          <DashboardSection
            id="reviews"
            title="Customer reviews"
            icon={Star}
            actionHref="/admin/reviews"
            actionLabel="Check review details"
          >
            <div className="space-y-1.5">
              {latestReviews.map((review) => (
                <article key={review.id} className="rounded-lg bg-limewash p-2.5 text-sm">
                  <div className="flex flex-wrap items-start justify-between gap-1.5">
                    <div>
                      <p className="font-semibold">{review.customerName}</p>
                      <p className="mt-0.5 text-xs text-ink/56">
                        {review.target === "staff" ? "Staff review" : "Application review"} - {review.rating}/5 - {formatDateTime(review.createdAt)}
                      </p>
                    </div>
                    <span className="rounded-full bg-white px-2 py-1 text-xs font-semibold text-ink/62">
                      {review.replyStatus === "replied" ? "Replied" : "Needs reply"}
                    </span>
                  </div>
                  <p className="mt-1.5 leading-5 text-ink/66">{review.comment}</p>
                  <a
                    href={`https://wa.me/${review.customerPhone.replace(/\D/g, "")}?text=${encodeURIComponent("Thank you for your Smart Delivery feedback. ")}`}
                    className="focus-ring mt-1.5 inline-flex items-center gap-1.5 rounded-full border border-ink/10 bg-white px-2.5 py-1 text-xs font-semibold"
                  >
                    <MessageCircle aria-hidden size={14} />
                    Reply
                  </a>
                </article>
              ))}
            </div>
          </DashboardSection>
        </div>
      </main>
    </AppShell>
  );
}

function DashboardSection({
  id,
  title,
  icon: Icon,
  actionHref,
  actionLabel,
  children
}: {
  id: string;
  title: string;
  icon: typeof TrendingUp;
  actionHref: Route;
  actionLabel: string;
  children: ReactNode;
}) {
  return (
    <section id={id} className="scroll-mt-20 rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm">
      <div className="mb-1.5 flex items-center justify-between gap-2">
        <h2 className="flex items-center gap-1.5 text-base font-semibold sm:text-lg">
          <Icon aria-hidden size={17} className="text-leaf" />
          {title}
        </h2>
      </div>
      <div className="min-w-0">{children}</div>
      <div className="mt-2 flex justify-end">
        <Link
          href={actionHref}
          className="focus-ring inline-flex items-center justify-center rounded-full bg-ink px-2.5 py-1 text-xs font-semibold text-white"
        >
          {actionLabel}
        </Link>
      </div>
    </section>
  );
}

function MiniMetric({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-lg bg-limewash p-2.5">
      <p className="text-xs font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className="mt-0.5 text-sm font-semibold leading-5 sm:text-base">{value}</p>
    </div>
  );
}

function StatTile({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-lg border border-ink/10 bg-white px-2.5 py-2 shadow-sm">
      <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className="mt-0.5 truncate text-sm font-semibold text-ink sm:text-base">{value}</p>
    </div>
  );
}

function ProductMonitorTable({ title, rows }: { title: string; rows: { name: string; detail: string }[] }) {
  return (
    <div className="overflow-hidden rounded-lg border border-ink/10">
      <p className="bg-limewash px-2 py-1 text-xs font-semibold uppercase tracking-[0.08em] text-ink/46">{title}</p>
      <div className="divide-y divide-ink/10">
        {rows.map((row, index) => (
          <div key={`${title}-${row.name}`} className="grid grid-cols-[24px_1fr] gap-1.5 px-2 py-1.5 text-sm">
            <span className="font-semibold text-ink/46">{index + 1}</span>
            <div className="min-w-0">
              <p className="truncate font-semibold">{row.name}</p>
              <p className="truncate text-xs text-ink/58">{row.detail}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
