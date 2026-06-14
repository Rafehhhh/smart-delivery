import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { StatusPill } from "@/components/status-pill";
import { getOrderTotal, getRevenueSummary } from "@/lib/admin-metrics";
import { orders } from "@/lib/demo-data";
import { formatCurrency } from "@/lib/format";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, Banknote, BarChart3, CalendarDays, CreditCard } from "lucide-react";

export default function AdminPaymentsPage() {
  const revenue = getRevenueSummary();
  const paidOrders = orders.filter((order) => order.paymentState === "paid").length;
  const pendingPayments = orders.filter((order) => order.paymentState !== "paid").length;

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-3 py-4 sm:px-6 lg:px-8 lg:py-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/25 px-3 py-2 text-sm font-semibold shadow-sm lg:rounded-md lg:border-ink/15 lg:shadow-none">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-3 text-2xl font-semibold sm:text-4xl lg:mt-5">Payment and revenue details</h1>
          <p className="mt-2 max-w-2xl text-sm leading-6 text-ink/64 lg:mt-3 lg:text-base">
            Full payment visibility for cash, pending balances, previous week, previous month, today revenue, and total sales.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-2 px-2 py-3 sm:px-6 md:grid-cols-2 lg:grid-cols-4 lg:gap-4 lg:px-8 lg:py-6">
        <Metric icon={Banknote} label="Today revenue" value={formatCurrency(revenue.todayRevenue)} />
        <Metric icon={BarChart3} label="Difference from yesterday" value={`${revenue.todayDifference >= 0 ? "+" : ""}${formatCurrency(revenue.todayDifference)}`} />
        <Metric icon={CalendarDays} label="Previous week" value={formatCurrency(revenue.previousWeekSales)} />
        <Metric icon={CreditCard} label="Total sales" value={formatCurrency(revenue.totalSales)} />
      </section>

      <section className="mx-auto grid max-w-7xl gap-3 px-2 pb-24 sm:px-6 lg:grid-cols-[0.7fr_1.3fr] lg:gap-6 lg:px-8 lg:pb-10">
        <aside className="grid gap-2 sm:grid-cols-2 lg:block lg:space-y-4">
          <Summary label="Previous month sales" value={formatCurrency(revenue.previousMonthSales)} />
          <Summary label="Cash handled" value={formatCurrency(revenue.cashHandled)} />
          <Summary label="Paid orders" value={String(paidOrders)} />
          <Summary label="Pending payments" value={String(pendingPayments)} />
          <Summary label="Pending balance" value={formatCurrency(revenue.pendingBalance)} />
          <Summary label="Refund due" value={formatCurrency(revenue.refundDue)} />
        </aside>

        <section className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-4 lg:shadow-sm">
          <h2 className="text-xl font-semibold">Every order payment record</h2>
          <div className="mt-3 grid gap-2 lg:hidden">
            {orders.map((order) => (
              <article key={order.id} className="rounded-2xl border border-ink/20 bg-limewash p-3 shadow-sm">
                <div className="flex items-start justify-between gap-2">
                  <div>
                    <p className="font-semibold">{order.orderNumber}</p>
                    <p className="mt-1 text-xs text-ink/58">{order.customer.name}</p>
                  </div>
                  <StatusPill value={order.paymentState} type="payment" />
                </div>
                <div className="mt-2 grid grid-cols-2 gap-1.5 text-xs">
                  <PaymentMini label="Advance" value={formatCurrency(order.cash.advanceCollected)} />
                  <PaymentMini label="Balance" value={formatCurrency(order.cash.balanceDue)} />
                  <PaymentMini label="Total" value={formatCurrency(getOrderTotal(order))} />
                  <PaymentMini label="Refund" value={formatCurrency(order.cash.refundDue)} />
                </div>
              </article>
            ))}
          </div>
          <div className="mt-4 hidden overflow-x-auto lg:block">
            <table className="w-full min-w-[780px] border-collapse text-left text-sm">
              <thead>
                <tr className="border-b border-ink/10 text-ink/58">
                  <th className="py-3 pr-4 font-semibold">Order</th>
                  <th className="py-3 pr-4 font-semibold">Customer</th>
                  <th className="py-3 pr-4 font-semibold">Payment</th>
                  <th className="py-3 pr-4 font-semibold">Advance</th>
                  <th className="py-3 pr-4 font-semibold">Balance</th>
                  <th className="py-3 pr-0 font-semibold">Total</th>
                </tr>
              </thead>
              <tbody>
                {orders.map((order) => (
                  <tr key={order.id} className="border-b border-ink/10 last:border-0">
                    <td className="py-4 pr-4 font-semibold">{order.orderNumber}</td>
                    <td className="py-4 pr-4">{order.customer.name}</td>
                    <td className="py-4 pr-4"><StatusPill value={order.paymentState} type="payment" /></td>
                    <td className="py-4 pr-4">{formatCurrency(order.cash.advanceCollected)}</td>
                    <td className="py-4 pr-4">{formatCurrency(order.cash.balanceDue)}</td>
                    <td className="py-4 pr-0 font-semibold">{formatCurrency(getOrderTotal(order))}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </section>
      </section>
    </AppShell>
  );
}

function Metric({ icon: Icon, label, value }: { icon: typeof Banknote; label: string; value: string }) {
  return (
    <div className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-4 lg:shadow-sm">
      <Icon aria-hidden className="text-leaf" size={22} />
      <p className="mt-3 text-sm text-ink/58">{label}</p>
      <p className="mt-1 text-2xl font-semibold">{value}</p>
    </div>
  );
}

function Summary({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-4 lg:shadow-sm">
      <p className="text-sm text-ink/58">{label}</p>
      <p className="mt-1 text-xl font-semibold">{value}</p>
    </div>
  );
}

function PaymentMini({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-2xl border border-ink/15 bg-white p-2">
      <p className="text-[10px] font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className="mt-0.5 text-xs font-semibold">{value}</p>
    </div>
  );
}
