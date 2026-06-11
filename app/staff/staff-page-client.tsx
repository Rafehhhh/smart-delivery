"use client";

import Link from "next/link";
import { useEffect, useMemo, useState } from "react";
import { AppShell } from "@/components/app-shell";
import { StatusPill } from "@/components/status-pill";
import { calculateFinalItemsTotal } from "@/lib/calculations";
import { profiles } from "@/lib/demo-data";
import { formatCurrency } from "@/lib/format";
import type { Order, OrderStatus, Profile } from "@/lib/types";
import { buildStaffOrderMessage, buildWhatsAppFallbackUrl } from "@/lib/whatsapp";
import {
  Banknote,
  BarChart3,
  Bike,
  CalendarDays,
  CheckCircle2,
  ClipboardList,
  Home,
  MapPin,
  MessageCircle,
  PackageCheck,
  Phone,
  ReceiptText,
  Timer,
  UserCircle,
  Wallet,
  X
} from "lucide-react";

const checklist = [
  { label: "Confirm order with customer", status: "confirmed" },
  { label: "Collect advance cash if needed" },
  { label: "Purchase market items", status: "shopping" },
  { label: "Update final invoice", status: "ready_for_delivery" },
  { label: "Collect balance or refund difference" },
  { label: "Mark delivery complete", status: "delivered" }
] satisfies Array<{ label: string; status?: OrderStatus }>;

type StaffProfileState = Profile & {
  area: string;
  vehicle: string;
  isAvailable: boolean;
};

export function StaffPageClient({ initialOrders }: { initialOrders: Order[] }) {
  const [orderList, setOrderList] = useState(initialOrders);
  const [actionError, setActionError] = useState("");
  const staff = profiles.find((profile) => profile.id === "staff-1")!;
  const [profile, setProfile] = useState<StaffProfileState>({
    ...staff,
    area: "Koyilandy town route",
    vehicle: "Bike - KL 56 AB 2211",
    isAvailable: true
  });
  const [isProfileOpen, setIsProfileOpen] = useState(false);
  const [isProfileEditorOpen, setIsProfileEditorOpen] = useState(false);
  const [acceptedOrderIds, setAcceptedOrderIds] = useState(
    initialOrders.filter((order) => order.assignedStaff?.id === staff.id && order.status !== "delivered").map((order) => order.id)
  );
  const [declinedOrderIds, setDeclinedOrderIds] = useState<string[]>([]);
  const [completedOrderIds, setCompletedOrderIds] = useState<string[]>([]);
  const [boughtItemIds, setBoughtItemIds] = useState<string[]>([]);
  const [activeStep, setActiveStep] = useState(0);

  const activeOrders = useMemo(
    () =>
      acceptedOrderIds
        .filter((orderId) => !completedOrderIds.includes(orderId))
        .map((orderId) => orderList.find((order) => order.id === orderId))
        .filter((order): order is Order => Boolean(order))
        .map((order) => buildStaffOrder(order, profile)),
    [acceptedOrderIds, completedOrderIds, orderList, profile]
  );
  const activeOrder = activeOrders[0];
  const hasActiveOrder = Boolean(activeOrder);
  const activeOrderId = activeOrder?.id;
  const activeOrderStatus = activeOrder?.status;
  const openOffers = orderList.filter(
    (order) => !order.assignedStaff && !acceptedOrderIds.includes(order.id) && !declinedOrderIds.includes(order.id)
  ).sort((first, second) => new Date(second.createdAt).getTime() - new Date(first.createdAt).getTime());
  const deliveryHistory = orderList
    .filter((order) => completedOrderIds.includes(order.id) || order.status === "delivered")
    .map((order) => buildStaffOrder(order, profile));

  useEffect(() => {
    if (!activeOrderId || !activeOrderStatus) {
      setActiveStep(0);
      return;
    }
    setActiveStep((current) => Math.max(current, stepFromOrderStatus(activeOrderStatus)));
  }, [activeOrderId, activeOrderStatus]);

  async function acceptOrder(orderId: string) {
    if (!profile.isAvailable || hasActiveOrder) return;
    setActionError("");
    try {
      const response = await fetch(`/api/staff/orders/${orderId}/accept`, { method: "POST" });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not accept order.");
      const updatedOrder = payload.data?.order as Order | undefined;
      if (updatedOrder) {
        setOrderList((current) => current.map((order) => (order.id === orderId ? updatedOrder : order)));
      }
      setAcceptedOrderIds((current) => [...current, orderId]);
      setActiveStep(0);
    } catch (caught) {
      setActionError(caught instanceof Error ? caught.message : "Could not accept order.");
    }
  }

  async function updateOrderStatus(orderId: string, nextStatus: OrderStatus, nextStep: number) {
    setActionError("");
    try {
      const response = await fetch(`/api/staff/orders/${orderId}/status`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status: nextStatus })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not update order status.");

      const updatedOrder = payload.data?.order as Order | undefined;
      const status = (payload.data?.status ?? updatedOrder?.status ?? nextStatus) as OrderStatus;
      setOrderList((current) =>
        current.map((order) =>
          order.id === orderId
            ? updatedOrder ?? { ...order, status, paymentState: status === "delivered" ? "paid" : order.paymentState }
            : order
        )
      );
      if (status === "delivered") {
        setCompletedOrderIds((current) => (current.includes(orderId) ? current : [...current, orderId]));
      }
      setActiveStep(nextStep);
    } catch (caught) {
      setActionError(caught instanceof Error ? caught.message : "Could not update order status.");
    }
  }

  async function completeOrder(orderId: string) {
    setActionError("");
    try {
      const response = await fetch(`/api/staff/orders/${orderId}/complete`, { method: "POST" });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not complete delivery.");
      setOrderList((current) => current.map((order) => (order.id === orderId ? { ...order, status: "delivered", paymentState: "paid" } : order)));
      setCompletedOrderIds((current) => [...current, orderId]);
      setActiveStep(checklist.length);
    } catch (caught) {
      setActionError(caught instanceof Error ? caught.message : "Could not complete delivery.");
    }
  }

  function toggleBoughtItem(itemId: string) {
    setBoughtItemIds((current) =>
      current.includes(itemId) ? current.filter((id) => id !== itemId) : [...current, itemId]
    );
  }

  return (
    <AppShell
      hideNav
      headerContent={
        <div className="relative flex items-center gap-2">
          <span className="text-sm font-semibold text-ink/72">Staff</span>
          <button
            type="button"
            onClick={() => setIsProfileOpen((current) => !current)}
            className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/10 bg-white px-2.5 py-2 text-sm font-semibold text-ink/72 hover:text-ink"
            aria-label="Open staff profile"
          >
            <UserCircle aria-hidden size={17} />
            {profile.name}
          </button>
          <Link
            href="/"
            className="focus-ring inline-flex h-10 w-10 items-center justify-center rounded-full border border-ink/10 bg-white text-ink/72 hover:text-ink"
            aria-label="Go to home"
          >
            <Home aria-hidden size={16} />
          </Link>
          {isProfileOpen ? (
            <ProfileSummaryPopover
              profile={profile}
              hasActiveOrder={hasActiveOrder}
              onManage={() => {
                setIsProfileOpen(false);
                setIsProfileEditorOpen(true);
              }}
              onClose={() => setIsProfileOpen(false)}
            />
          ) : null}
        </div>
      }
    >
      <section className="mx-auto grid max-w-7xl gap-2 px-2 py-2 sm:px-3 lg:grid-cols-[0.72fr_1.28fr] lg:px-4">
        <aside className="space-y-2">
          <OpenOffers
            offers={openOffers}
            canAccept={profile.isAvailable && !hasActiveOrder}
            unavailableReason={!profile.isAvailable ? "Set profile as available to accept orders." : "Complete the active order before accepting another."}
            onAccept={acceptOrder}
            onDecline={(orderId) => setDeclinedOrderIds((current) => [...current, orderId])}
          />
          {actionError ? <p className="rounded-md bg-clay/10 px-3 py-2 text-sm font-semibold text-clay">{actionError}</p> : null}

          <ActivityChecklist
            hasActiveOrder={hasActiveOrder}
            activeStep={activeStep}
            onStepChange={setActiveStep}
            onCompleteDelivery={() => {
              if (activeOrder) void completeOrder(activeOrder.id);
            }}
            onStatusStep={(status, nextStep) => {
              if (activeOrder) void updateOrderStatus(activeOrder.id, status, nextStep);
            }}
          />
        </aside>

        <div className="grid gap-2">
          {activeOrder ? (
            <StaffOrderCard
              order={activeOrder}
              activeStep={activeStep}
              onStepChange={setActiveStep}
              onStatusStep={(status, nextStep) => updateOrderStatus(activeOrder.id, status, nextStep)}
              onComplete={() => completeOrder(activeOrder.id)}
              boughtItemIds={boughtItemIds}
              onToggleBought={toggleBoughtItem}
            />
          ) : (
            <section className="rounded-md border border-dashed border-ink/20 bg-white p-8 text-center shadow-sm">
              <ClipboardList aria-hidden className="mx-auto text-leaf" size={34} />
              <h2 className="mt-4 text-2xl font-semibold">Explore the orders</h2>
              <p className="mx-auto mt-2 max-w-xl text-sm leading-6 text-ink/62">
                No order is assigned to your profile right now. Check the open offers list, accept one delivery, and the full delivery checklist will appear here.
              </p>
            </section>
          )}
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-2 px-2 pb-4 sm:px-3 lg:grid-cols-[1.25fr_0.75fr] lg:px-4">
        <StaffReportCard activeOrders={activeOrders} completedOrders={deliveryHistory} />
        <DeliveryHistory orders={deliveryHistory} />
      </section>

      {isProfileEditorOpen ? (
        <ProfileModal
          profile={profile}
          onClose={() => setIsProfileEditorOpen(false)}
          onChange={setProfile}
        />
      ) : null}
    </AppShell>
  );
}

function buildStaffOrder(order: Order, staff: Profile): Order {
  return {
    ...order,
    assignedStaff: staff,
    status: order.status === "submitted" ? "assigned" : order.status
  };
}

function stepFromOrderStatus(status: OrderStatus) {
  const stepsByStatus: Partial<Record<OrderStatus, number>> = {
    assigned: 0,
    confirmed: 1,
    shopping: 3,
    ready_for_delivery: 4,
    delivered: checklist.length
  };

  return stepsByStatus[status] ?? 0;
}

function ProfileSummaryPopover({
  profile,
  hasActiveOrder,
  onManage,
  onClose
}: {
  profile: StaffProfileState;
  hasActiveOrder: boolean;
  onManage: () => void;
  onClose: () => void;
}) {
  return (
    <div className="absolute right-0 top-12 z-30 w-72 rounded-xl border border-ink/10 bg-white p-3 text-sm shadow-soft">
      <div className="flex items-start justify-between gap-3">
        <div>
          <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Staff profile</p>
          <h2 className="mt-1 font-semibold">{profile.name}</h2>
        </div>
        <button type="button" onClick={onClose} className="focus-ring rounded-full border border-ink/10 p-1.5" aria-label="Close profile popup">
          <X aria-hidden size={14} />
        </button>
      </div>

      <div className="mt-3 grid gap-2">
        <ProfileLine label="Phone" value={profile.phone} />
        <ProfileLine label="Area" value={profile.area} />
        <ProfileLine label="Vehicle" value={profile.vehicle} />
        <ProfileLine label="Availability" value={profile.isAvailable && !hasActiveOrder ? "Available" : hasActiveOrder ? "Busy with order" : "Not available"} />
      </div>

      <button
        type="button"
        onClick={onManage}
        className="focus-ring mt-3 w-full rounded-full bg-ink px-3 py-2 text-xs font-semibold text-white"
      >
        Manage profile
      </button>
    </div>
  );
}

function ProfileLine({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-lg bg-limewash px-2.5 py-2">
      <p className="text-[11px] font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className="mt-0.5 font-semibold text-ink/78">{value}</p>
    </div>
  );
}

function OpenOffers({
  offers,
  canAccept,
  unavailableReason,
  onAccept,
  onDecline
}: {
  offers: Order[];
  canAccept: boolean;
  unavailableReason: string;
  onAccept: (orderId: string) => void;
  onDecline: (orderId: string) => void;
}) {
  return (
    <section className="rounded-md border border-ink/10 bg-white p-2.5 shadow-sm">
      <div className="flex items-start justify-between gap-3">
        <div>
          <h2 className="flex items-center gap-2 text-lg font-semibold">
            <ClipboardList aria-hidden size={20} />
            Open order offers
          </h2>
          <p className="mt-1 text-sm text-ink/58">Latest unassigned orders visible to available staff.</p>
        </div>
        <span className="rounded-full bg-mint px-2.5 py-1 text-xs font-semibold text-leaf">{offers.length} open</span>
      </div>

      <div className="mt-2 max-h-[230px] space-y-1.5 overflow-y-auto pr-1">
        {offers.map((order) => (
          <div key={order.id} className="rounded-md border border-ink/10 bg-limewash p-2">
            <div className="flex items-start justify-between gap-3">
              <div>
                <p className="font-semibold">{order.orderNumber}</p>
                <p className="mt-1 text-sm text-ink/58">{order.customer.name}</p>
              </div>
              <StatusPill value={order.status} type="order" />
            </div>
            <p className="mt-1.5 flex items-center gap-2 text-sm text-ink/62">
              <Timer aria-hidden size={15} />
              {order.slot.label}
            </p>
            <p className="mt-1.5 text-sm font-semibold">{formatCurrency(order.estimateTotal + order.serviceFee)}</p>
            <div className="mt-1.5 grid grid-cols-2 gap-1.5">
              <button
                type="button"
                disabled={!canAccept}
                onClick={() => onAccept(order.id)}
                className="focus-ring rounded-full bg-leaf px-3 py-1.5 text-sm font-semibold text-white disabled:cursor-not-allowed disabled:opacity-45"
                title={canAccept ? "Accept order" : unavailableReason}
              >
                Accept
              </button>
              <button
                type="button"
                onClick={() => onDecline(order.id)}
                className="focus-ring rounded-full border border-ink/15 bg-white px-3 py-1.5 text-sm font-semibold"
              >
                Decline
              </button>
            </div>
            {!canAccept ? <p className="mt-2 text-xs leading-5 text-ink/52">{unavailableReason}</p> : null}
          </div>
        ))}
        {offers.length === 0 ? <p className="rounded-md bg-limewash p-3 text-sm text-ink/60">No open offers right now.</p> : null}
      </div>
    </section>
  );
}

function ActivityChecklist({
  hasActiveOrder,
  activeStep,
  onStepChange,
  onCompleteDelivery,
  onStatusStep
}: {
  hasActiveOrder: boolean;
  activeStep: number;
  onStepChange: (step: number) => void;
  onCompleteDelivery: () => void;
  onStatusStep: (status: OrderStatus, nextStep: number) => void;
}) {
  return (
    <section className="rounded-md border border-ink/10 bg-white p-2.5 shadow-sm">
      <h2 className="flex items-center gap-2 text-lg font-semibold">
        <ClipboardList aria-hidden size={20} />
        Activity checklist
      </h2>
      <div className="mt-2 space-y-1.5 text-sm">
        {!hasActiveOrder ? (
            <div className="rounded-md border border-market/30 bg-market/15 p-2.5 font-semibold text-ink">
            Explore the orders
          </div>
        ) : (
          checklist.map((activity, index) => {
            const isDone = index < activeStep;
            const isNext = index === activeStep;
            return (
              <button
                key={activity.label}
                type="button"
                disabled={isDone || !isNext}
                onClick={() => {
                  if (!isNext) return;
                  const nextStep = Math.min(index + 1, checklist.length);
                  if (activity.status === "delivered") {
                    onCompleteDelivery();
                    return;
                  }
                  if (activity.status) {
                    onStatusStep(activity.status, nextStep);
                    return;
                  }
                  onStepChange(nextStep);
                }}
                className={`focus-ring flex w-full items-center gap-2 rounded-md border p-2.5 text-left transition ${
                  isDone
                    ? "border-leaf/25 bg-mint"
                    : isNext
                      ? "border-market bg-market/20 shadow-soft"
                      : "border-ink/10 bg-white"
                } disabled:cursor-default`}
              >
                <span className={`flex h-7 w-7 items-center justify-center rounded-md text-xs font-semibold ${
                  isDone ? "bg-leaf text-white" : isNext ? "bg-market text-ink" : "bg-limewash text-ink/50"
                }`}>
                  {isDone ? <CheckCircle2 aria-hidden size={16} /> : index + 1}
                </span>
                <span className={isDone ? "font-semibold text-leaf" : isNext ? "font-semibold text-ink" : "text-ink/64"}>
                  {activity.label}
                </span>
              </button>
            );
          })
        )}
      </div>
    </section>
  );
}

function StaffOrderCard({
  order,
  activeStep,
  onStepChange,
  onStatusStep,
  onComplete,
  boughtItemIds,
  onToggleBought
}: {
  order: Order;
  activeStep: number;
  onStepChange: (step: number) => void;
  onStatusStep: (status: OrderStatus, nextStep: number) => void;
  onComplete: () => void;
  boughtItemIds: string[];
  onToggleBought: (itemId: string) => void;
}) {
  const finalItemsTotal = calculateFinalItemsTotal(order.items);
  const finalPayable = order.finalTotal ?? finalItemsTotal + order.serviceFee;
  const message = buildStaffOrderMessage(order);
  const whatsappUrl = buildWhatsAppFallbackUrl(order.customer.phone, message);

  return (
    <article className="flex h-full flex-col rounded-md border border-ink/10 bg-white shadow-soft">
      <div className="border-b border-ink/10 px-3 py-2.5">
        <h2 className="flex items-center gap-2 text-lg font-semibold">
          <ClipboardList aria-hidden size={20} />
          Current order
        </h2>
      </div>
      <div className="grid flex-1 gap-0 xl:grid-cols-2">
        <div className="border-b border-ink/10 p-3 xl:border-b-0 xl:border-r">
          <div className="flex items-start justify-between gap-3">
            <div>
              <p className="text-sm font-semibold uppercase tracking-[0.12em] text-leaf">{order.orderNumber}</p>
              <h2 className="mt-1 text-xl font-semibold">{order.customer.name}</h2>
              <p className="mt-1 text-sm text-ink/60">{order.customer.phone}</p>
            </div>
            <StatusPill value={order.paymentState} type="payment" />
          </div>

          <div className="mt-3 space-y-2">
            <LocationPanel order={order} />

            <div className="grid grid-cols-2 gap-2">
              <a
                href={`tel:${order.customer.phone}`}
                className="focus-ring inline-flex items-center justify-center gap-2 rounded-md border border-ink/15 px-3 py-2 text-sm font-semibold"
              >
                <Phone aria-hidden size={17} />
                Call
              </a>
              <a
                href={whatsappUrl}
                className="focus-ring inline-flex items-center justify-center gap-2 rounded-md bg-leaf px-3 py-2 text-sm font-semibold text-white"
              >
                <MessageCircle aria-hidden size={17} />
                WhatsApp
              </a>
            </div>
          </div>

        </div>

        <div className="flex h-full flex-col p-3">
          <div className="mb-2 flex items-center justify-between gap-3">
            <h3 className="flex items-center gap-2 text-lg font-semibold">
              <PackageCheck aria-hidden size={20} />
              Products to buy
            </h3>
            <StatusPill value={order.status} type="order" />
          </div>
          <div className="flex-1 space-y-1.5">
            {order.items.map((item) => {
              const isBought = boughtItemIds.includes(item.id);
              return (
              <div key={item.id} className={isBought ? "rounded-md border border-leaf/30 bg-mint p-2" : "rounded-md border border-ink/10 p-2"}>
                <div className="flex items-start justify-between gap-3">
                  <div>
                    <p className="font-semibold">{item.productName}</p>
                    <p className="mt-0.5 text-sm text-ink/58">
                      Requested {item.requestedQuantity} {item.unit}
                    </p>
                    {item.notes ? <p className="mt-1 text-sm text-clay">{item.notes}</p> : null}
                  </div>
                  <button
                    type="button"
                    onClick={() => onToggleBought(item.id)}
                    className={isBought ? "focus-ring inline-flex items-center gap-1.5 rounded-full bg-leaf px-2.5 py-1 text-xs font-semibold text-white" : "focus-ring inline-flex items-center gap-1.5 rounded-full border border-ink/15 bg-white px-2.5 py-1 text-xs font-semibold text-ink/64"}
                  >
                    <CheckCircle2 aria-hidden size={14} />
                    {isBought ? "Bought" : "Mark bought"}
                  </button>
                </div>
                <div className="mt-1.5 grid grid-cols-2 gap-1.5 rounded-md bg-limewash p-2 text-sm">
                  <div>
                    <span className="text-ink/58">Estimate</span>
                    <p className="mt-0.5 font-semibold">{formatCurrency(item.estimatedPrice)} / {item.unit}</p>
                  </div>
                  <div>
                    <span className="text-ink/58">Final</span>
                    <p className="mt-0.5 font-semibold">
                      {item.finalPrice ? `${formatCurrency(item.finalPrice)} / ${item.unit}` : "Pending"}
                    </p>
                  </div>
                </div>
              </div>
              );
            })}
          </div>

        </div>
      </div>
      <div className="border-t border-ink/10 p-3">
        <div className="rounded-md border border-ink/10 p-2.5">
          <h3 className="flex items-center gap-2 font-semibold">
            <Banknote aria-hidden size={18} />
            Cash settlement
          </h3>
          <div className="mt-2 grid gap-1.5 text-sm sm:grid-cols-4">
            <div className="rounded-md bg-limewash p-2">
              <span className="text-ink/58">Advance collected</span>
              <strong className="mt-0.5 block">{formatCurrency(order.cash.advanceCollected)}</strong>
            </div>
            <div className="rounded-md bg-limewash p-2">
              <span className="text-ink/58">Final payable</span>
              <strong className="mt-0.5 block">{formatCurrency(finalPayable)}</strong>
            </div>
            <div className="rounded-md bg-limewash p-2">
              <span className="text-ink/58">Balance due</span>
              <strong className={order.cash.balanceDue > 0 ? "mt-0.5 block text-clay" : "mt-0.5 block text-leaf"}>
                {formatCurrency(order.cash.balanceDue)}
              </strong>
            </div>
            <div className="rounded-md bg-limewash p-2">
              <span className="text-ink/58">Refund due</span>
              <strong className="mt-0.5 block">{formatCurrency(order.cash.refundDue)}</strong>
            </div>
          </div>
          <div className="mt-2 grid gap-1.5 sm:grid-cols-2">
            <button
              type="button"
              onClick={() => {
                if (order.status === "shopping") {
                  onStatusStep("ready_for_delivery", Math.max(activeStep, 4));
                  return;
                }
                onStepChange(Math.max(activeStep, 4));
              }}
              className="focus-ring inline-flex items-center justify-center gap-2 rounded-md border border-ink/15 px-3 py-2 text-sm font-semibold"
            >
              <ReceiptText aria-hidden size={17} />
              Finalize invoice
            </button>
            <button
              type="button"
              onClick={onComplete}
              className="focus-ring inline-flex items-center justify-center gap-2 rounded-md bg-ink px-3 py-2 text-sm font-semibold text-white"
            >
              <CheckCircle2 aria-hidden size={17} />
              Complete delivery
            </button>
          </div>
        </div>
      </div>
    </article>
  );
}

function LocationPanel({ order }: { order: Order }) {
  const itemInstructions = order.items.filter((item) => item.notes);

  return (
    <div className="space-y-3">
      <div className="flex gap-3 rounded-md bg-limewash p-3">
        <MapPin aria-hidden className="mt-0.5 text-leaf" size={19} />
        <div>
          <p className="font-semibold">Customer location</p>
          <p className="mt-1 text-sm font-medium">{order.address.houseName}</p>
          <p className="mt-1 text-sm leading-6 text-ink/62">
            {order.address.addressLine}, {order.address.locality}
            {order.address.landmark ? ` - ${order.address.landmark}` : ""}
          </p>
        </div>
      </div>

      <div className="rounded-md border border-ink/10 p-3">
        <h3 className="flex items-center gap-2 font-semibold">
          <ClipboardList aria-hidden size={18} />
          Customer demand and instructions
        </h3>
        <div className="mt-3 space-y-2">
          {order.notes ? <p className="rounded-md bg-limewash p-3 text-sm leading-6 text-ink/68">{order.notes}</p> : null}
          {itemInstructions.map((item) => (
            <div key={item.id} className="rounded-md bg-market/15 p-3 text-sm">
              <p className="font-semibold">{item.productName}</p>
              <p className="mt-1 leading-6 text-ink/62">{item.notes}</p>
            </div>
          ))}
          {!order.notes && itemInstructions.length === 0 ? (
            <p className="rounded-md bg-limewash p-3 text-sm text-ink/58">No special customer instruction added.</p>
          ) : null}
        </div>
      </div>
    </div>
  );
}

function StaffReportCard({ activeOrders, completedOrders }: { activeOrders: Order[]; completedOrders: Order[] }) {
  const allOrders = [...completedOrders, ...activeOrders].filter(
    (order, index, list) => list.findIndex((entry) => entry.id === order.id) === index
  );
  const cashHandled = allOrders.reduce((total, order) => total + order.cash.advanceCollected + order.cash.finalCollected, 0);
  const commissionEarned = completedOrders.reduce((total, order) => total + order.serviceFee * 0.4, 0);
  const today = "2026-06-02";
  const completedToday = completedOrders.filter((order) => order.createdAt.startsWith(today)).length;
  const dailyStats = completedOrders.reduce<Record<string, number>>((stats, order) => {
    const day = order.createdAt.slice(0, 10);
    stats[day] = (stats[day] ?? 0) + 1;
    return stats;
  }, {});

  return (
    <section className="rounded-md border border-ink/10 bg-white p-2 shadow-sm">
      <h2 className="flex items-center gap-2 text-base font-semibold">
        <BarChart3 aria-hidden size={20} />
        Staff report card
      </h2>
      <div className="mt-2 grid grid-cols-2 gap-1.5 sm:grid-cols-4">
        <ReportMetric icon={CheckCircle2} label="Completed" value={String(completedOrders.length)} />
        <ReportMetric icon={Bike} label="Active" value={String(activeOrders.length)} />
        <ReportMetric icon={Wallet} label="Cash handled" value={formatCurrency(cashHandled)} />
        <ReportMetric icon={Banknote} label="Commission" value={formatCurrency(commissionEarned)} />
      </div>

      <div className="mt-2 rounded-md bg-limewash p-2">
        <p className="flex items-center gap-2 text-sm font-semibold">
          <CalendarDays aria-hidden size={16} />
          Daily delivery statistics
        </p>
        <div className="mt-1.5 space-y-1 text-sm">
          <div className="flex justify-between">
            <span>Completed today</span>
            <strong>{completedToday}</strong>
          </div>
          {Object.entries(dailyStats).map(([day, count]) => (
            <div key={day} className="flex justify-between">
              <span>{day}</span>
              <strong>{count} deliveries</strong>
            </div>
          ))}
          {completedOrders.length === 0 ? <p className="text-ink/58">Complete a delivery to start building daily history.</p> : null}
        </div>
      </div>
    </section>
  );
}

function ReportMetric({
  icon: Icon,
  label,
  value
}: {
  icon: typeof Bike;
  label: string;
  value: string;
}) {
  return (
    <div className="rounded-md border border-ink/10 bg-limewash p-2">
      <Icon aria-hidden className="text-leaf" size={18} />
      <p className="mt-1 text-[11px] font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className="mt-0.5 text-sm font-semibold">{value}</p>
    </div>
  );
}

function DeliveryHistory({ orders }: { orders: Order[] }) {
  return (
    <section className="flex h-full flex-col rounded-md border border-ink/10 bg-white p-2 shadow-sm">
      <h2 className="flex items-center gap-2 text-base font-semibold">
        <ReceiptText aria-hidden size={20} />
        Delivery history
      </h2>
      {orders.length > 0 ? (
        <div className="mt-2 max-h-[210px] flex-1 space-y-1.5 overflow-y-auto pr-1">
          {orders.map((order) => (
            <div key={order.id} className="rounded-md bg-limewash p-2">
              <div className="flex items-start justify-between gap-2">
                <div>
                  <p className="font-semibold">{order.orderNumber}</p>
                  <p className="mt-0.5 text-sm text-ink/58">{order.customer.name}</p>
                </div>
                <StatusPill value="delivered" type="order" />
              </div>
            </div>
          ))}
        </div>
      ) : (
        <div className="mt-2 flex flex-1 items-center justify-center rounded-md bg-limewash p-3 text-center text-sm text-ink/60">
          Completed deliveries will appear here.
        </div>
      )}
    </section>
  );
}

function ProfileModal({
  profile,
  onClose,
  onChange
}: {
  profile: StaffProfileState;
  onClose: () => void;
  onChange: (profile: StaffProfileState) => void;
}) {
  const [draft, setDraft] = useState(profile);

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-ink/60 px-4 py-6">
      <div className="w-full max-w-xl rounded-md bg-white shadow-soft">
        <div className="flex items-center justify-between gap-3 border-b border-ink/10 p-4">
          <div>
            <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Staff profile</p>
            <h2 className="mt-1 text-2xl font-semibold">Manage profile</h2>
          </div>
          <button type="button" onClick={onClose} className="focus-ring rounded-md border border-ink/15 p-2" aria-label="Close profile">
            <X aria-hidden size={18} />
          </button>
        </div>

        <div className="grid gap-4 p-4">
          <label className="text-sm font-semibold" htmlFor="staff-name">
            Name
            <input
              id="staff-name"
              value={draft.name}
              onChange={(event) => setDraft((current) => ({ ...current, name: event.target.value }))}
              className="focus-ring mt-2 w-full rounded-md border border-ink/15 px-3 py-3 font-normal"
            />
          </label>
          <label className="text-sm font-semibold" htmlFor="staff-phone">
            WhatsApp / phone
            <input
              id="staff-phone"
              value={draft.phone}
              onChange={(event) => setDraft((current) => ({ ...current, phone: event.target.value }))}
              className="focus-ring mt-2 w-full rounded-md border border-ink/15 px-3 py-3 font-normal"
            />
          </label>
          <label className="text-sm font-semibold" htmlFor="staff-area">
            Delivery area
            <input
              id="staff-area"
              value={draft.area}
              onChange={(event) => setDraft((current) => ({ ...current, area: event.target.value }))}
              className="focus-ring mt-2 w-full rounded-md border border-ink/15 px-3 py-3 font-normal"
            />
          </label>
          <label className="text-sm font-semibold" htmlFor="staff-vehicle">
            Vehicle
            <input
              id="staff-vehicle"
              value={draft.vehicle}
              onChange={(event) => setDraft((current) => ({ ...current, vehicle: event.target.value }))}
              className="focus-ring mt-2 w-full rounded-md border border-ink/15 px-3 py-3 font-normal"
            />
          </label>
          <label className="flex items-center justify-between gap-3 rounded-md bg-limewash p-3 text-sm font-semibold" htmlFor="staff-modal-availability">
            Available for delivery
            <input
              id="staff-modal-availability"
              type="checkbox"
              checked={draft.isAvailable}
              onChange={(event) => setDraft((current) => ({ ...current, isAvailable: event.target.checked }))}
              className="h-5 w-5 accent-leaf"
            />
          </label>
        </div>

        <div className="flex flex-col-reverse gap-3 border-t border-ink/10 p-4 sm:flex-row sm:justify-end">
          <button type="button" onClick={onClose} className="focus-ring rounded-md border border-ink/15 px-4 py-3 text-sm font-semibold">
            Cancel
          </button>
          <button
            type="button"
            onClick={() => {
              onChange(draft);
              onClose();
            }}
            className="focus-ring rounded-md bg-leaf px-4 py-3 text-sm font-semibold text-white"
          >
            Save profile
          </button>
        </div>
      </div>
    </div>
  );
}
