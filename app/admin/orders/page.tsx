import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { StatusPill } from "@/components/status-pill";
import { orders } from "@/lib/demo-data";
import { formatCurrency } from "@/lib/format";
import { getOrderTotal } from "@/lib/admin-metrics";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, Eye, MapPin, ReceiptText } from "lucide-react";

export default function AdminOrdersPage() {
  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-md border border-ink/15 px-3 py-2 text-sm font-semibold">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-5 text-3xl font-semibold sm:text-4xl">Order monitoring details</h1>
          <p className="mt-3 max-w-2xl text-ink/64">
            Read-only order records with customer details, delivery slot, staff acceptance status, products, payment state, and address.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-6 px-4 py-8 sm:px-6 lg:px-8">
        {orders.map((order) => (
          <article key={order.id} className="rounded-md border border-ink/10 bg-white p-4 shadow-sm">
            <div className="flex flex-col gap-4 lg:flex-row lg:items-start lg:justify-between">
              <div>
                <p className="text-sm font-semibold uppercase tracking-[0.12em] text-leaf">{order.orderNumber}</p>
                <h2 className="mt-2 text-2xl font-semibold">{order.customer.name}</h2>
                <p className="mt-1 text-sm text-ink/58">{order.customer.phone}</p>
              </div>
              <div className="flex flex-wrap gap-2">
                <StatusPill value={order.status} type="order" />
                <StatusPill value={order.paymentState} type="payment" />
              </div>
            </div>

            <div className="mt-5 grid gap-4 lg:grid-cols-[0.9fr_1.1fr]">
              <div className="rounded-md bg-limewash p-3">
                <h3 className="flex items-center gap-2 font-semibold">
                  <MapPin aria-hidden size={18} />
                  Customer and delivery
                </h3>
                <p className="mt-3 text-sm leading-6 text-ink/64">
                  {order.address.houseName}, {order.address.addressLine}, {order.address.locality}
                  {order.address.landmark ? ` - ${order.address.landmark}` : ""}
                </p>
                <p className="mt-2 text-sm"><strong>Slot:</strong> {order.slot.label}</p>
                <p className="mt-2 text-sm"><strong>Staff:</strong> {order.assignedStaff?.name ?? "Awaiting staff acceptance"}</p>
                {order.notes ? <p className="mt-2 text-sm"><strong>Note:</strong> {order.notes}</p> : null}
              </div>

              <div className="rounded-md border border-ink/10 p-3">
                <h3 className="flex items-center gap-2 font-semibold">
                  <ReceiptText aria-hidden size={18} />
                  Products and amount
                </h3>
                <div className="mt-3 space-y-2">
                  {order.items.map((item) => (
                    <div key={item.id} className="flex items-start justify-between gap-3 rounded-md bg-limewash p-2 text-sm">
                      <span>{item.productName} - {item.requestedQuantity} {item.unit}</span>
                      <strong>{formatCurrency((item.finalPrice ?? item.estimatedPrice) * (item.finalQuantity ?? item.requestedQuantity))}</strong>
                    </div>
                  ))}
                </div>
                <div className="mt-3 flex justify-between rounded-md bg-ink p-3 text-sm font-semibold text-white">
                  <span>Total</span>
                  <span>{formatCurrency(getOrderTotal(order))}</span>
                </div>
              </div>
            </div>
          </article>
        ))}
      </section>
    </AppShell>
  );
}
