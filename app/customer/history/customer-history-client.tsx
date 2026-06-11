"use client";

import { useState } from "react";
import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { formatCurrency, formatDateTime } from "@/lib/format";
import { buildOrderProgressEvents, formatOrderEventTitle } from "@/lib/order-progress";
import type { Order, OrderEvent } from "@/lib/types";
import { ArrowLeft, CheckCircle2, ShoppingBag, Star } from "lucide-react";

type ReviewType = "staff" | "order";

export function CustomerHistoryClient({
  initialOrders,
  eventsByOrderId
}: {
  initialOrders: Order[];
  eventsByOrderId: Record<string, OrderEvent[]>;
}) {
  const [activeReviewOrderId, setActiveReviewOrderId] = useState<string | null>(null);
  const [submittedReviews, setSubmittedReviews] = useState<Record<string, boolean>>({});
  const [rating, setRating] = useState(5);
  const [reviewType, setReviewType] = useState<ReviewType>("order");
  const [comment, setComment] = useState("");

  const customerOrders = initialOrders
    .filter((order) => order.customer.id === "customer-1")
    .sort((first, second) => new Date(second.createdAt).getTime() - new Date(first.createdAt).getTime());

  function openReview(orderId: string) {
    setActiveReviewOrderId(orderId);
    setRating(5);
    setReviewType("order");
    setComment("");
  }

  function cancelReview() {
    setActiveReviewOrderId(null);
    setComment("");
  }

  function submitReview(orderId: string) {
    setSubmittedReviews((current) => ({ ...current, [orderId]: true }));
    setActiveReviewOrderId(null);
    setComment("");
  }

  return (
    <AppShell hideNav>
      <section className="mx-auto max-w-7xl px-3 py-3 sm:px-4 lg:px-6">
        <div className="rounded-xl border border-ink/10 bg-white p-3 shadow-soft">
          <div className="flex flex-wrap items-end justify-between gap-2 border-b border-ink/10 pb-3">
            <div className="flex items-start gap-3">
              <Link
                href="/customer"
                aria-label="Back to customer page"
                title="Back to customer page"
                className="focus-ring mt-0.5 inline-flex h-9 w-9 shrink-0 items-center justify-center rounded-full border border-ink/15 bg-white text-ink hover:border-leaf/40 hover:text-leaf"
              >
                <ArrowLeft aria-hidden size={16} />
              </Link>
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Customer history</p>
                <h1 className="mt-1 flex items-center gap-2 text-xl font-semibold">
                  <ShoppingBag aria-hidden size={18} />
                  All order history
                </h1>
              </div>
            </div>
            <span className="rounded-full bg-mint px-2.5 py-1 text-xs font-semibold text-leaf">
              {customerOrders.length} orders
            </span>
          </div>

          <div className="mt-3 grid gap-2">
            {customerOrders.map((order) => {
              const isDelivered = order.status === "delivered";
              const isReviewOpen = activeReviewOrderId === order.id;
              const isReviewSubmitted = submittedReviews[order.id];

              return (
                <article key={order.id} className="rounded-xl border border-ink/10 bg-limewash p-3">
                  <div className="flex flex-wrap items-start justify-between gap-2">
                    <div>
                      <p className="text-lg font-semibold">{order.orderNumber}</p>
                      <p className="mt-0.5 text-sm text-ink/58">{formatDateTime(order.createdAt)}</p>
                      <p className="mt-0.5 text-sm text-ink/58">{order.slot.label}</p>
                    </div>
                    <span className="rounded-full bg-white px-2.5 py-1 text-xs font-semibold capitalize text-leaf">
                      {order.status.replaceAll("_", " ")}
                    </span>
                  </div>

                  <div className="mt-3 grid gap-2 text-sm sm:grid-cols-4">
                    <div>
                      <span className="text-ink/52">Items</span>
                      <strong className="mt-1 block">{order.items.length}</strong>
                    </div>
                    <div>
                      <span className="text-ink/52">Payment</span>
                      <strong className="mt-1 block capitalize">{order.paymentState.replaceAll("_", " ")}</strong>
                    </div>
                    <div>
                      <span className="text-ink/52">Service fee</span>
                      <strong className="mt-1 block">{formatCurrency(order.serviceFee)}</strong>
                    </div>
                    <div>
                      <span className="text-ink/52">Total</span>
                      <strong className="mt-1 block">{formatCurrency(order.finalTotal ?? order.estimateTotal + order.serviceFee)}</strong>
                    </div>
                  </div>

                  <div className="mt-3 rounded-xl bg-white p-2.5">
                    <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Products</p>
                    <div className="mt-2 grid gap-1.5">
                      {order.items.map((item) => (
                        <div key={item.id} className="flex justify-between gap-3 text-sm">
                          <span>
                            {item.productName} x {item.requestedQuantity} {item.unit}
                          </span>
                          <strong>{formatCurrency((item.finalPrice ?? item.estimatedPrice) * (item.finalQuantity ?? item.requestedQuantity))}</strong>
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="mt-3 rounded-xl bg-white p-2.5">
                    <p className="flex items-center gap-1.5 text-xs font-semibold uppercase tracking-[0.12em] text-leaf">
                      <CheckCircle2 aria-hidden size={14} />
                      Order timeline
                    </p>
                    <div className="mt-2 grid gap-1.5">
                      {buildOrderProgressEvents(order, eventsByOrderId[order.id]).map((event) => (
                        <div key={event.id} className="rounded-lg bg-limewash px-2.5 py-2 text-sm">
                          <div className="flex flex-wrap items-center justify-between gap-2">
                            <strong>{formatOrderEventTitle(event.eventType)}</strong>
                            <span className="text-xs text-ink/52">{formatDateTime(event.createdAt)}</span>
                          </div>
                          <p className="mt-1 text-ink/62">{event.message}</p>
                        </div>
                      ))}
                    </div>
                  </div>

                  <div className="mt-3 rounded-xl bg-white p-2.5">
                    <div className="flex flex-wrap items-center justify-between gap-2">
                      <p className="flex items-center gap-1.5 text-sm font-semibold">
                        <Star aria-hidden size={15} className="text-leaf" />
                        Order review
                      </p>
                      {isReviewSubmitted ? (
                        <span className="rounded-full bg-mint px-2.5 py-1 text-xs font-semibold text-leaf">Review submitted</span>
                      ) : isDelivered ? (
                        <button
                          type="button"
                          onClick={() => openReview(order.id)}
                          className="focus-ring rounded-full bg-ink px-3 py-1.5 text-xs font-semibold text-white"
                        >
                          Add review
                        </button>
                      ) : (
                        <span className="rounded-full bg-limewash px-2.5 py-1 text-xs font-semibold text-ink/58">
                          Review available after delivery
                        </span>
                      )}
                    </div>

                    {isReviewOpen ? (
                      <div className="mt-3 grid gap-2 rounded-xl border border-ink/10 bg-limewash p-2.5">
                        <div className="grid gap-2 sm:grid-cols-2">
                          <label className="grid gap-1 text-xs font-semibold text-ink/58">
                            Rating
                            <select
                              value={rating}
                              onChange={(event) => setRating(Number(event.target.value))}
                              className="focus-ring rounded-lg border border-ink/15 bg-white px-2.5 py-2 text-sm font-semibold text-ink"
                            >
                              {[5, 4, 3, 2, 1].map((value) => (
                                <option key={value} value={value}>{value} stars</option>
                              ))}
                            </select>
                          </label>
                          <label className="grid gap-1 text-xs font-semibold text-ink/58">
                            Review type
                            <select
                              value={reviewType}
                              onChange={(event) => setReviewType(event.target.value as ReviewType)}
                              className="focus-ring rounded-lg border border-ink/15 bg-white px-2.5 py-2 text-sm font-semibold text-ink"
                            >
                              <option value="order">Order experience</option>
                              <option value="staff">Staff experience</option>
                            </select>
                          </label>
                        </div>
                        <textarea
                          value={comment}
                          onChange={(event) => setComment(event.target.value)}
                          placeholder="Write your review about delivery, staff, products, or the order experience."
                          className="focus-ring min-h-24 rounded-lg border border-ink/15 bg-white px-2.5 py-2 text-sm"
                        />
                        <div className="flex flex-wrap justify-end gap-2">
                          <button
                            type="button"
                            onClick={cancelReview}
                            className="focus-ring rounded-full border border-ink/15 bg-white px-3 py-1.5 text-xs font-semibold"
                          >
                            Cancel
                          </button>
                          <button
                            type="button"
                            onClick={() => submitReview(order.id)}
                            className="focus-ring rounded-full bg-leaf px-3 py-1.5 text-xs font-semibold text-white"
                          >
                            Submit review
                          </button>
                        </div>
                      </div>
                    ) : null}
                  </div>
                </article>
              );
            })}
          </div>
        </div>
      </section>
    </AppShell>
  );
}
