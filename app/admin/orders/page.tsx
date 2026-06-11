import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { StatusPill } from "@/components/status-pill";
import { formatCurrency, formatDateTime } from "@/lib/format";
import { getOrderTotal } from "@/lib/admin-metrics";
import { buildOrderProgressEvents, formatOrderEventTitle } from "@/lib/order-progress";
import { getOrderEventsForOrders, getOrdersData, getWhatsAppMessagesForOrders } from "@/lib/supabase-orders";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, BellRing, MapPin, MessageCircle, ReceiptText } from "lucide-react";

export const dynamic = "force-dynamic";

export default async function AdminOrdersPage() {
  const { orders } = await getOrdersData();
  const orderIds = orders.map((order) => order.id);
  const [eventsByOrderId, messagesByOrderId] = await Promise.all([
    getOrderEventsForOrders(orderIds),
    getWhatsAppMessagesForOrders(orderIds)
  ]);

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

            <div className="mt-4 grid gap-4 lg:grid-cols-2">
              <div className="rounded-md border border-ink/10 p-3">
                <h3 className="flex items-center gap-2 font-semibold">
                  <BellRing aria-hidden size={18} />
                  Order timeline
                </h3>
                <div className="mt-3 space-y-2">
                  {buildOrderProgressEvents(order, eventsByOrderId[order.id]).map((event) => (
                    <div key={event.id} className="rounded-md bg-limewash p-2 text-sm">
                      <div className="flex flex-wrap items-center justify-between gap-2">
                        <strong>{formatOrderEventTitle(event.eventType)}</strong>
                        <span className="text-xs text-ink/52">{formatDateTime(event.createdAt)}</span>
                      </div>
                      <p className="mt-1 text-ink/62">{event.message}</p>
                    </div>
                  ))}
                </div>
              </div>

              <div className="rounded-md border border-ink/10 p-3">
                <h3 className="flex items-center gap-2 font-semibold">
                  <MessageCircle aria-hidden size={18} />
                  WhatsApp update log
                </h3>
                <div className="mt-3 space-y-2">
                  {(messagesByOrderId[order.id] ?? []).slice(0, 4).map((message) => (
                    <div key={message.id} className="rounded-md bg-limewash p-2 text-sm">
                      <div className="flex flex-wrap items-center justify-between gap-2">
                        <strong className="capitalize">{message.eventType?.replaceAll("_", " ") ?? "message"}</strong>
                        <span className="rounded-full bg-white px-2 py-0.5 text-[11px] font-semibold text-leaf">{message.status}</span>
                      </div>
                      <p className="mt-1 text-xs text-ink/58">
                        {message.recipientRole ?? "recipient"} - {message.recipientPhone}
                      </p>
                      {message.fallbackUrl ? (
                        <a href={message.fallbackUrl} className="mt-1 inline-flex text-xs font-semibold text-leaf hover:text-ink">
                          Open WhatsApp fallback
                        </a>
                      ) : null}
                    </div>
                  ))}
                  {(messagesByOrderId[order.id] ?? []).length === 0 ? (
                    <p className="rounded-md bg-limewash p-2 text-sm text-ink/58">No WhatsApp update log yet.</p>
                  ) : null}
                </div>
              </div>
            </div>
          </article>
        ))}
      </section>
    </AppShell>
  );
}
