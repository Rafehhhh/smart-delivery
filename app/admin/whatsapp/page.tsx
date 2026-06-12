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
        <div className="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-md border border-ink/15 px-3 py-2 text-sm font-semibold">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-5 flex items-center gap-2 text-3xl font-semibold sm:text-4xl">
            <MessageCircle aria-hidden size={28} />
            WhatsApp update center
          </h1>
          <p className="mt-3 max-w-2xl text-ink/64">
            Review generated WhatsApp fallback messages for customers and staff.
          </p>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
        <div className="overflow-hidden rounded-xl border border-ink/10 bg-white shadow-sm">
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
      </section>
    </AppShell>
  );
}
