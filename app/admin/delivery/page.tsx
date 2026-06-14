import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { StatusPill } from "@/components/status-pill";
import { getStatusCounts, processingStatuses } from "@/lib/admin-metrics";
import { orders, profiles } from "@/lib/demo-data";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, Bike, CheckCircle2, Clock3, Truck } from "lucide-react";

export default function AdminDeliveryPage() {
  const statusCounts = getStatusCounts();
  const staff = profiles.filter((profile) => profile.role === "staff");
  const pendingAssignment = orders.filter((order) => !order.assignedStaff && order.status !== "cancelled");
  const processingOrders = orders.filter((order) => processingStatuses.includes(order.status));
  const deliveredOrders = orders.filter((order) => order.status === "delivered");

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-3 py-4 sm:px-6 lg:px-8 lg:py-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/25 px-3 py-2 text-sm font-semibold shadow-soft lg:rounded-md lg:border-ink/15 lg:shadow-none">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-4 text-2xl font-semibold sm:text-4xl lg:mt-5">Delivery status details</h1>
          <p className="mt-2 max-w-2xl text-sm text-ink/64 lg:mt-3 lg:text-base">
            Monitor pending, processing, delivered, and staff-side delivery movement.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl grid-cols-2 gap-2 px-3 py-3 sm:px-6 md:grid-cols-2 lg:grid-cols-4 lg:gap-4 lg:px-8 lg:py-6">
        <Metric icon={Clock3} label="Pending assignment" value={String(pendingAssignment.length)} />
        <Metric icon={Truck} label="Processing" value={String(processingOrders.length)} />
        <Metric icon={CheckCircle2} label="Delivered" value={String(deliveredOrders.length)} />
        <Metric icon={Bike} label="Staff records" value={String(staff.length)} />
      </section>

      <section className="mx-auto grid max-w-7xl gap-2 px-3 pb-24 sm:px-6 lg:grid-cols-[0.7fr_1.3fr] lg:gap-6 lg:px-8 lg:pb-10">
        <aside className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-4 lg:shadow-sm">
          <h2 className="text-lg font-semibold lg:text-xl">Status count</h2>
          <div className="mt-3 grid grid-cols-2 gap-2 text-sm lg:mt-4 lg:block lg:space-y-3">
            {Object.entries(statusCounts).map(([status, count]) => (
              <div key={status} className="flex items-center justify-between rounded-2xl border border-ink/15 bg-limewash p-2 lg:rounded-md lg:border-0 lg:p-3">
                <span className="capitalize text-ink/62">{status.replaceAll("_", " ")}</span>
                <strong>{count}</strong>
              </div>
            ))}
          </div>
        </aside>

        <section className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-4 lg:shadow-sm">
          <h2 className="text-lg font-semibold lg:text-xl">Delivery order timeline</h2>
          <div className="mt-3 max-h-[calc(100dvh-23rem)] space-y-2 overflow-y-auto pr-1 lg:mt-4 lg:max-h-none lg:space-y-3 lg:overflow-visible lg:pr-0">
            {orders.map((order) => (
              <div key={order.id} className="rounded-2xl border border-ink/20 p-3 lg:rounded-md lg:border-ink/10">
                <div className="flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
                  <div>
                    <p className="font-semibold">{order.orderNumber}</p>
                    <p className="mt-1 text-sm text-ink/58">{order.customer.name} - {order.slot.label}</p>
                  </div>
                  <div className="flex flex-wrap gap-2">
                    <StatusPill value={order.status} type="order" />
                    <span className="rounded-md bg-limewash px-2 py-1 text-xs font-semibold text-ink/62">
                      {order.assignedStaff?.name ?? "Awaiting staff acceptance"}
                    </span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>
      </section>
    </AppShell>
  );
}

function Metric({ icon: Icon, label, value }: { icon: typeof Truck; label: string; value: string }) {
  return (
    <div className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-4 lg:shadow-sm">
      <Icon aria-hidden className="text-leaf" size={20} />
      <p className="mt-2 text-xs text-ink/58 lg:mt-3 lg:text-sm">{label}</p>
      <p className="mt-1 text-xl font-semibold lg:text-2xl">{value}</p>
    </div>
  );
}
