import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { StatusPill } from "@/components/status-pill";
import { formatCurrency, formatDateTime } from "@/lib/format";
import { getOrderTotal } from "@/lib/admin-metrics";
import { buildOrderProgressEvents, formatOrderEventTitle } from "@/lib/order-progress";
import { getOrderEventsForOrders, getOrdersData, getWhatsAppMessagesForOrders } from "@/lib/supabase-orders";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, BellRing, MapPin, MessageCircle, ReceiptText } from "lucide-react";
import type { OrderStatus } from "@/lib/types";

export const dynamic = "force-dynamic";

const orderFilters: Array<{ label: string; value: "all" | OrderStatus }> = [
  { label: "All", value: "all" },
  { label: "Pending", value: "submitted" },
  { label: "Accepted", value: "assigned" },
  { label: "Shopping", value: "shopping" },
  { label: "Ready", value: "ready_for_delivery" },
  { label: "Delivered", value: "delivered" }
];

export default async function AdminOrdersPage({
  searchParams
}: {
  searchParams?: Promise<{ status?: string }>;
}) {
  const { orders } = await getOrdersData();
  const params = await searchParams;
  const activeFilter = orderFilters.some((filter) => filter.value === params?.status) ? params?.status ?? "all" : "all";
  const visibleOrders = activeFilter === "all" ? orders : orders.filter((order) => order.status === activeFilter);
  const orderIds = orders.map((order) => order.id);
  const [eventsByOrderId, messagesByOrderId] = await Promise.all([
    getOrderEventsForOrders(orderIds),
    getWhatsAppMessagesForOrders(orderIds)
  ]);

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-3 py-4 sm:px-6 lg:px-8 lg:py-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/25 px-3 py-2 text-sm font-semibold shadow-sm lg:rounded-md lg:border-ink/15 lg:shadow-none">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-3 text-2xl font-semibold sm:text-4xl lg:mt-5">Order monitoring details</h1>
          <p className="mt-2 max-w-2xl text-sm leading-6 text-ink/64 lg:mt-3 lg:text-base">
            Read-only order records with customer details, delivery slot, staff acceptance status, products, payment state, and address.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-3 px-2 py-3 pb-24 sm:px-6 lg:gap-6 lg:px-8 lg:py-8 lg:pb-8">
        <div className="flex flex-wrap gap-2 rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:shadow-sm">
          {orderFilters.map((filter) => (
            <Link
              key={filter.value}
              href={filter.value === "all" ? "/admin/orders" : `/admin/orders?status=${filter.value}`}
              className={
                activeFilter === filter.value
                  ? "focus-ring rounded-full bg-leaf px-3 py-1.5 text-xs font-semibold text-white"
                  : "focus-ring rounded-full border border-ink/15 px-3 py-1.5 text-xs font-semibold hover:border-leaf/40 hover:text-leaf"
              }
            >
              {filter.label}
            </Link>
          ))}
        </div>

        {visibleOrders.map((order) => (
          <article key={order.id} className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-4 lg:shadow-sm">
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
              <div className="rounded-2xl border border-ink/15 bg-limewash p-3 lg:rounded-md lg:border-0">
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

              <div className="rounded-2xl border border-ink/25 p-3 lg:rounded-md lg:border-ink/10">
                <h3 className="flex items-center gap-2 font-semibold">
                  <ReceiptText aria-hidden size={18} />
                  Products and amount
                </h3>
                <div className="mt-3 space-y-2">
                  {order.items.map((item) => (
                    <div key={item.id} className="flex items-start justify-between gap-3 rounded-2xl border border-ink/15 bg-limewash p-2 text-sm lg:rounded-md lg:border-0">
                      <span>{item.productName} - {item.requestedQuantity} {item.unit}</span>
                      <strong>{formatCurrency((item.finalPrice ?? item.estimatedPrice) * (item.finalQuantity ?? item.requestedQuantity))}</strong>
                    </div>
                  ))}
                </div>
                <div className="mt-3 flex justify-between rounded-2xl bg-ink p-3 text-sm font-semibold text-white lg:rounded-md">
                  <span>Total</span>
                  <span>{formatCurrency(getOrderTotal(order))}</span>
                </div>
              </div>
            </div>

            <div className="mt-4 grid gap-4 lg:grid-cols-2">
              <div className="rounded-2xl border border-ink/25 p-3 lg:rounded-md lg:border-ink/10">
                <h3 className="flex items-center gap-2 font-semibold">
                  <BellRing aria-hidden size={18} />
                  Order timeline
                </h3>
                <div className="mt-3 space-y-2">
                  {buildOrderProgressEvents(order, eventsByOrderId[order.id]).map((event) => (
                    <div key={event.id} className="rounded-2xl border border-ink/15 bg-limewash p-2 text-sm lg:rounded-md lg:border-0">
                      <div className="flex flex-wrap items-center justify-between gap-2">
                        <strong>{formatOrderEventTitle(event.eventType)}</strong>
                        <span className="text-xs text-ink/52">{formatDateTime(event.createdAt)}</span>
                      </div>
                      <p className="mt-1 text-ink/62">{event.message}</p>
                    </div>
                  ))}
                </div>
              </div>

              <div className="rounded-2xl border border-ink/25 p-3 lg:rounded-md lg:border-ink/10">
                <h3 className="flex items-center gap-2 font-semibold">
                  <MessageCircle aria-hidden size={18} />
                  WhatsApp update log
                </h3>
                <div className="mt-3 space-y-2">
                  {(messagesByOrderId[order.id] ?? []).slice(0, 4).map((message) => (
                    <div key={message.id} className="rounded-2xl border border-ink/15 bg-limewash p-2 text-sm lg:rounded-md lg:border-0">
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
                    <p className="rounded-2xl border border-ink/15 bg-limewash p-2 text-sm text-ink/58 lg:rounded-md lg:border-0">No WhatsApp update log yet.</p>
                  ) : null}
                </div>
              </div>
            </div>
          </article>
        ))}
        {visibleOrders.length === 0 ? (
          <p className="rounded-3xl border border-ink/25 bg-white p-6 text-center text-ink/58 shadow-soft lg:rounded-md lg:border-ink/10 lg:shadow-sm">
            No orders match this filter.
          </p>
        ) : null}
      </section>
    </AppShell>
  );
}
