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
        <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-md border border-ink/15 px-3 py-2 text-sm font-semibold">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-5 text-3xl font-semibold sm:text-4xl">Delivery status details</h1>
          <p className="mt-3 max-w-2xl text-ink/64">
            Monitor pending, processing, delivered, and staff-side delivery movement.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-4 px-4 py-6 sm:px-6 md:grid-cols-2 lg:grid-cols-4 lg:px-8">
        <Metric icon={Clock3} label="Pending assignment" value={String(pendingAssignment.length)} />
        <Metric icon={Truck} label="Processing" value={String(processingOrders.length)} />
        <Metric icon={CheckCircle2} label="Delivered" value={String(deliveredOrders.length)} />
        <Metric icon={Bike} label="Staff records" value={String(staff.length)} />
      </section>

      <section className="mx-auto grid max-w-7xl gap-6 px-4 pb-10 sm:px-6 lg:grid-cols-[0.7fr_1.3fr] lg:px-8">
        <aside className="rounded-md border border-ink/10 bg-white p-4 shadow-sm">
          <h2 className="text-xl font-semibold">Status count</h2>
          <div className="mt-4 space-y-3 text-sm">
            {Object.entries(statusCounts).map(([status, count]) => (
              <div key={status} className="flex items-center justify-between rounded-md bg-limewash p-3">
                <span className="capitalize text-ink/62">{status.replaceAll("_", " ")}</span>
                <strong>{count}</strong>
              </div>
            ))}
          </div>
        </aside>

        <section className="rounded-md border border-ink/10 bg-white p-4 shadow-sm">
          <h2 className="text-xl font-semibold">Delivery order timeline</h2>
          <div className="mt-4 space-y-3">
            {orders.map((order) => (
              <div key={order.id} className="rounded-md border border-ink/10 p-3">
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
    <div className="rounded-md border border-ink/10 bg-white p-4 shadow-sm">
      <Icon aria-hidden className="text-leaf" size={22} />
      <p className="mt-3 text-sm text-ink/58">{label}</p>
      <p className="mt-1 text-2xl font-semibold">{value}</p>
    </div>
  );
}
