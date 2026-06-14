import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { formatDateTime } from "@/lib/format";
import { getOrdersData, getWhatsAppMessagesForOrders } from "@/lib/supabase-orders";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, MessageCircle } from "lucide-react";

export const dynamic = "force-dynamic";

export default async function AdminWhatsAppPage() {
  const { orders } = await getOrdersData();
  const messagesByOrderId = await getWhatsAppMessagesForOrders(orders.map((order) => order.id));
  const messages = orders
    .flatMap((order) =>
      (messagesByOrderId[order.id] ?? []).map((message) => ({
        ...message,
        orderNumber: order.orderNumber,
        customerName: order.customer.name
      }))
    )
    .sort((first, second) => second.createdAt.localeCompare(first.createdAt));

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-3 py-4 sm:px-6 lg:px-8 lg:py-6">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/25 px-3 py-2 text-sm font-semibold shadow-soft lg:rounded-md lg:border-ink/15 lg:shadow-none">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-4 flex items-center gap-2 text-2xl font-semibold sm:text-4xl lg:mt-5">
            <MessageCircle aria-hidden size={24} />
            WhatsApp update center
          </h1>
          <p className="mt-2 max-w-2xl text-sm text-ink/64 lg:mt-3 lg:text-base">
            Review generated WhatsApp fallback messages for customers and staff.
          </p>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-3 py-3 pb-24 sm:px-6 lg:px-8 lg:py-6">
        <div className="overflow-hidden rounded-3xl border border-ink/25 bg-white shadow-soft lg:rounded-xl lg:border-ink/10 lg:shadow-sm">
          <div className="grid max-h-[calc(100dvh-13rem)] gap-2 overflow-y-auto p-3 lg:hidden">
            {messages.map((message) => (
              <article key={message.id} className="rounded-2xl border border-ink/20 bg-limewash p-3">
                <div className="flex items-start justify-between gap-3">
                  <div>
                    <p className="font-semibold">{message.orderNumber}</p>
                    <p className="text-xs text-ink/56">{message.customerName}</p>
                  </div>
                  <span className="rounded-full bg-mint px-2 py-1 text-xs font-semibold text-leaf">{message.status}</span>
                </div>
                <div className="mt-3 grid grid-cols-2 gap-2 text-xs">
                  <MessageMeta label="Recipient" value={`${message.recipientRole ?? "recipient"} - ${message.recipientPhone}`} />
                  <MessageMeta label="Event" value={message.eventType?.replaceAll("_", " ") ?? "message"} />
                  <MessageMeta label="Created" value={formatDateTime(message.createdAt)} wide />
                </div>
                {message.fallbackUrl ? (
                  <a href={message.fallbackUrl} className="focus-ring mt-3 inline-flex w-full justify-center rounded-full border border-ink/25 bg-leaf px-3 py-2 text-xs font-semibold text-white">
                    Open WhatsApp link
                  </a>
                ) : (
                  <p className="mt-3 rounded-full border border-ink/15 bg-white px-3 py-2 text-center text-xs text-ink/50">No link</p>
                )}
              </article>
            ))}
            {messages.length === 0 ? (
              <p className="rounded-2xl border border-ink/20 bg-limewash p-5 text-center text-sm text-ink/58">
                No WhatsApp update logs yet.
              </p>
            ) : null}
          </div>

          <div className="hidden lg:block">
            <table className="w-full border-collapse text-left text-sm">
              <thead className="bg-limewash text-xs uppercase tracking-[0.08em] text-ink/56">
                <tr>
                  <th className="px-3 py-2 font-semibold">Order</th>
                  <th className="px-3 py-2 font-semibold">Recipient</th>
                  <th className="px-3 py-2 font-semibold">Event</th>
                  <th className="px-3 py-2 font-semibold">Status</th>
                  <th className="px-3 py-2 font-semibold">Created</th>
                  <th className="px-3 py-2 text-right font-semibold">Action</th>
                </tr>
              </thead>
              <tbody>
                {messages.map((message) => (
                  <tr key={message.id} className="border-t border-ink/10">
                    <td className="px-3 py-2">
                      <strong>{message.orderNumber}</strong>
                      <span className="block text-xs text-ink/52">{message.customerName}</span>
                    </td>
                    <td className="px-3 py-2">
                      <span className="capitalize">{message.recipientRole ?? "recipient"}</span>
                      <span className="block text-xs text-ink/52">{message.recipientPhone}</span>
                    </td>
                    <td className="px-3 py-2 capitalize">{message.eventType?.replaceAll("_", " ") ?? "message"}</td>
                    <td className="px-3 py-2">
                      <span className="rounded-full bg-mint px-2 py-1 text-xs font-semibold text-leaf">{message.status}</span>
                    </td>
                    <td className="px-3 py-2 text-xs text-ink/58">{formatDateTime(message.createdAt)}</td>
                    <td className="px-3 py-2 text-right">
                      {message.fallbackUrl ? (
                        <a href={message.fallbackUrl} className="focus-ring inline-flex rounded-full bg-leaf px-3 py-1.5 text-xs font-semibold text-white">
                          Open
                        </a>
                      ) : (
                        <span className="text-xs text-ink/40">No link</span>
                      )}
                    </td>
                  </tr>
                ))}
                {messages.length === 0 ? (
                  <tr>
                    <td colSpan={6} className="px-3 py-8 text-center text-ink/58">
                      No WhatsApp update logs yet.
                    </td>
                  </tr>
                ) : null}
              </tbody>
            </table>
          </div>
        </div>
      </section>
    </AppShell>
  );
}

function MessageMeta({ label, value, wide = false }: { label: string; value: string; wide?: boolean }) {
  return (
    <div className={`rounded-2xl border border-ink/15 bg-white p-2 ${wide ? "col-span-2" : ""}`}>
      <p className="text-[10px] uppercase tracking-[0.08em] text-ink/45">{label}</p>
      <p className="mt-1 capitalize text-ink/75">{value}</p>
    </div>
  );
}
