"use client";

import { useMemo, useState } from "react";
import { StatusPill } from "@/components/status-pill";
import { MobileHomeConfirmLink } from "@/components/mobile-home-confirm-link";
import type { StaffSignupRequest } from "@/lib/auth-flow";
import { getOrderTotal, processingStatuses } from "@/lib/admin-metrics";
import { formatCurrency, formatDateTime } from "@/lib/format";
import type { CustomerReview, Order, OrderStatus, Product, ProductCategory, Profile } from "@/lib/types";
import { SlotCapacityManager } from "./slot-capacity-manager";
import {
  Banknote,
  Bike,
  Check,
  ClipboardList,
  Home,
  MessageCircle,
  PackageSearch,
  Pencil,
  ReceiptText,
  RotateCcw,
  Save,
  Settings,
  ShieldCheck,
  Star,
  Trash2,
  TrendingUp,
  UserRound,
  Users,
  X
} from "lucide-react";

type AdminMobileTab = "dashboard" | "products" | "staff" | "orders" | "reviews" | "more";
type StaffView = "approved" | "pending";
type OrderFilter = "all" | OrderStatus;

type ProductDraft = {
  name: string;
  price: string;
  previousWeekPrice: string;
  retailRange: string;
  sourceNote: string;
  bestValueShop: string;
  isAvailable: boolean;
};

export function AdminMobileHeader({ admin }: { admin: Profile }) {
  const [isProfileOpen, setIsProfileOpen] = useState(false);
  const [isEditorOpen, setIsEditorOpen] = useState(false);
  const [profile, setProfile] = useState({
    name: admin.name,
    phone: admin.phone,
    area: "Koyilandy supervisor desk",
    role: "Admin"
  });
  const [draft, setDraft] = useState(profile);

  function saveProfile() {
    setProfile(draft);
    setIsEditorOpen(false);
    setIsProfileOpen(false);
  }

  return (
    <div className="relative flex items-center gap-2">
      <button
        type="button"
        onClick={() => setIsProfileOpen((current) => !current)}
        className="focus-ring inline-flex h-10 w-10 items-center justify-center rounded-full border border-ink/25 bg-white text-ink/72 shadow-sm hover:text-ink lg:hidden"
        aria-label="Admin profile"
      >
        <UserRound aria-hidden size={17} />
      </button>
      <span className="hidden text-sm font-semibold text-ink/72 lg:inline">Admin</span>
      <MobileHomeConfirmLink className="focus-ring inline-flex h-10 w-10 items-center justify-center rounded-full border border-ink/25 bg-white text-ink/72 shadow-sm hover:text-ink lg:border-ink/10 lg:shadow-none">
        <Home aria-hidden size={16} />
      </MobileHomeConfirmLink>

      {isProfileOpen ? (
        <section className="absolute right-0 top-12 z-40 w-72 rounded-3xl border border-ink/30 bg-white p-3 shadow-soft lg:hidden">
          <div className="flex items-start justify-between gap-2">
            <div>
              <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Admin profile</p>
              <h2 className="mt-1 text-lg font-semibold">{profile.name}</h2>
            </div>
            <button type="button" onClick={() => setIsProfileOpen(false)} className="focus-ring rounded-full border border-ink/20 p-1.5" aria-label="Close profile">
              <X aria-hidden size={14} />
            </button>
          </div>
          <div className="mt-3 grid gap-1.5 text-sm">
            <ProfileLine label="Phone" value={profile.phone} />
            <ProfileLine label="Role" value={profile.role} />
            <ProfileLine label="Area" value={profile.area} />
          </div>
          <button
            type="button"
            onClick={() => {
              setDraft(profile);
              setIsEditorOpen(true);
            }}
            className="focus-ring mt-3 inline-flex w-full items-center justify-center rounded-full border border-ink/25 bg-white px-4 py-2 text-sm font-semibold text-ink"
          >
            Manage profile
          </button>
        </section>
      ) : null}

      {isEditorOpen ? (
        <div className="fixed inset-0 z-50 flex items-end bg-ink/25 p-2 lg:hidden" onClick={() => setIsEditorOpen(false)}>
          <section className="w-full rounded-3xl border border-ink/30 bg-white p-4 shadow-soft" onClick={(event) => event.stopPropagation()}>
            <div className="flex items-center justify-between gap-2">
              <h2 className="text-lg font-semibold">Manage admin profile</h2>
              <button type="button" onClick={() => setIsEditorOpen(false)} className="focus-ring rounded-full border border-ink/20 p-2" aria-label="Close editor">
                <X aria-hidden size={15} />
              </button>
            </div>
            <div className="mt-3 grid gap-2">
              <ProfileInput label="Name" value={draft.name} onChange={(value) => setDraft((current) => ({ ...current, name: value }))} />
              <ProfileInput label="Phone" value={draft.phone} onChange={(value) => setDraft((current) => ({ ...current, phone: value }))} />
              <ProfileInput label="Area" value={draft.area} onChange={(value) => setDraft((current) => ({ ...current, area: value }))} />
            </div>
            <button type="button" onClick={saveProfile} className="focus-ring mt-3 inline-flex w-full items-center justify-center rounded-full bg-ink px-4 py-3 text-sm font-semibold text-white">
              Save profile
            </button>
          </section>
        </div>
      ) : null}
    </div>
  );
}

export function AdminMobilePage({
  categories,
  initialProducts,
  orders,
  staff,
  reviews,
  staffRequests
}: {
  categories: ProductCategory[];
  initialProducts: Product[];
  orders: Order[];
  staff: Profile[];
  reviews: CustomerReview[];
  staffRequests: StaffSignupRequest[];
}) {
  const [activeTab, setActiveTab] = useState<AdminMobileTab>("dashboard");
  const [products, setProducts] = useState(initialProducts);
  const [staffRequestRows, setStaffRequestRows] = useState(staffRequests);
  const [staffView, setStaffView] = useState<StaffView>("approved");
  const [orderFilter, setOrderFilter] = useState<OrderFilter>("all");
  const [editingProductId, setEditingProductId] = useState<string | null>(null);
  const [productDraft, setProductDraft] = useState<ProductDraft | null>(null);
  const [undoProduct, setUndoProduct] = useState<Product | null>(null);
  const [busyProductId, setBusyProductId] = useState<string | null>(null);
  const [productError, setProductError] = useState("");
  const [requestBusyId, setRequestBusyId] = useState<string | null>(null);
  const categoryById = useMemo(() => new Map(categories.map((category) => [category.id, category.name])), [categories]);
  const activeStaffIds = useMemo(
    () =>
      new Set(
        orders
          .filter((order) => order.assignedStaff && processingStatuses.includes(order.status))
          .map((order) => order.assignedStaff?.id)
      ),
    [orders]
  );
  const popularProducts = useMemo(
    () =>
      [...products]
        .sort((first, second) => popularityRank(first) - popularityRank(second) || first.name.localeCompare(second.name))
        .slice(0, 4),
    [products]
  );
  const priceMovers = useMemo(
    () =>
      [...products]
        .sort((first, second) => Math.abs(priceMove(second)) - Math.abs(priceMove(first)))
        .slice(0, 4),
    [products]
  );
  const pendingRequests = staffRequestRows.filter((request) => request.status === "pending");
  const paidOrders = orders.filter((order) => order.paymentState === "paid");
  const pendingPayments = orders.filter((order) => order.paymentState !== "paid");
  const activeOrders = orders.filter((order) => processingStatuses.includes(order.status));
  const cashHandled = orders.reduce((total, order) => total + order.cash.advanceCollected + order.cash.finalCollected, 0);
  const todayKey = new Date().toISOString().slice(0, 10);
  const todayRevenue = orders.filter((order) => order.createdAt.startsWith(todayKey)).reduce((total, order) => total + getOrderTotal(order), 0);
  const filteredOrders = orderFilter === "all" ? orders : orders.filter((order) => order.status === orderFilter);

  function startProductEdit(product: Product) {
    setEditingProductId(product.id);
    setProductDraft({
      name: product.name,
      price: String(product.price),
      previousWeekPrice: product.previousWeekPrice === undefined ? "" : String(product.previousWeekPrice),
      retailRange: product.retailRange ?? "",
      sourceNote: product.sourceNote ?? "",
      bestValueShop: product.bestValueShop ?? "",
      isAvailable: product.isAvailable
    });
    setProductError("");
  }

  function updateProductDraft<Key extends keyof ProductDraft>(key: Key, value: ProductDraft[Key]) {
    setProductDraft((current) => (current ? { ...current, [key]: value } : current));
  }

  async function saveProduct(product: Product) {
    if (!productDraft) return;
    const price = Number(productDraft.price);
    if (!Number.isFinite(price) || price < 0) {
      setProductError("Enter a valid price.");
      return;
    }
    setBusyProductId(product.id);
    setProductError("");
    try {
      const response = await fetch(`/api/admin/products/${product.id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          name: productDraft.name,
          price,
          previousWeekPrice: toOptionalNumber(productDraft.previousWeekPrice),
          retailRange: productDraft.retailRange || null,
          sourceNote: productDraft.sourceNote || null,
          bestValueShop: productDraft.bestValueShop || null,
          isApproximatePrice: true,
          isAvailable: productDraft.isAvailable
        })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not save product.");
      setProducts((current) =>
        current.map((entry) =>
          entry.id === product.id
            ? {
                ...entry,
                name: productDraft.name,
                price,
                previousWeekPrice: toOptionalNumber(productDraft.previousWeekPrice) ?? undefined,
                retailRange: productDraft.retailRange || undefined,
                sourceNote: productDraft.sourceNote || undefined,
                bestValueShop: productDraft.bestValueShop || undefined,
                isApproximatePrice: true,
                isAvailable: productDraft.isAvailable
              }
            : entry
        )
      );
      setEditingProductId(null);
      setProductDraft(null);
    } catch (caught) {
      setProductError(caught instanceof Error ? caught.message : "Could not save product.");
    } finally {
      setBusyProductId(null);
    }
  }

  async function softDeleteProduct(product: Product) {
    setBusyProductId(product.id);
    setProductError("");
    try {
      const response = await fetch(`/api/admin/products/${product.id}`, { method: "DELETE" });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not hide product.");
      setUndoProduct(product);
      setProducts((current) => current.map((entry) => (entry.id === product.id ? { ...entry, isAvailable: false } : entry)));
    } catch (caught) {
      setProductError(caught instanceof Error ? caught.message : "Could not hide product.");
    } finally {
      setBusyProductId(null);
    }
  }

  async function undoSoftDelete() {
    if (!undoProduct) return;
    setBusyProductId(undoProduct.id);
    try {
      const response = await fetch(`/api/admin/products/${undoProduct.id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ isAvailable: true })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not undo product hide.");
      setProducts((current) => current.map((entry) => (entry.id === undoProduct.id ? { ...entry, isAvailable: true } : entry)));
      setUndoProduct(null);
    } catch (caught) {
      setProductError(caught instanceof Error ? caught.message : "Could not undo product hide.");
    } finally {
      setBusyProductId(null);
    }
  }

  async function reviewStaffRequest(requestId: string, status: "approved" | "rejected") {
    setRequestBusyId(requestId);
    try {
      const response = await fetch(`/api/admin/staff-requests/${requestId}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not update request.");
      setStaffRequestRows((current) => current.map((request) => (request.id === requestId ? { ...request, status } : request)));
    } catch {
      // Keep the row unchanged; the request panel remains usable for another try.
    } finally {
      setRequestBusyId(null);
    }
  }

  return (
    <section className="flex h-[calc(100dvh-4.75rem)] flex-col overflow-hidden px-2 py-2 pb-24 lg:hidden">
      {activeTab === "dashboard" ? (
        <MobilePanel title="Dashboard" icon={ShieldCheck}>
          <div className="grid grid-cols-2 gap-1.5">
            <AdminStat label="Orders" value={String(orders.length)} />
            <AdminStat label="Active" value={String(activeOrders.length)} />
            <AdminStat label="Products" value={String(products.length)} />
            <AdminStat label="Staff" value={String(staff.length)} />
            <AdminStat label="Pending staff" value={String(pendingRequests.length)} />
            <AdminStat label="Reviews" value={String(reviews.length)} />
            <AdminStat label="Paid" value={String(paidOrders.length)} />
            <AdminStat label="Cash" value={formatCurrency(cashHandled)} />
          </div>
          <div className="mt-2">
            <AdminStat label="Today revenue" value={formatCurrency(todayRevenue)} wide />
          </div>
          <div className="mt-2 min-h-0 space-y-2 overflow-y-auto pr-1">
            <SlotCapacityManager />
            <CompactProductList title="Popular products" products={popularProducts} />
            <CompactProductList title="High price changes" products={priceMovers} showMove />
          </div>
        </MobilePanel>
      ) : null}

      {activeTab === "products" ? (
        <MobilePanel title="Products" icon={PackageSearch}>
          <div className="flex items-center justify-between gap-2">
            <span className="rounded-full border border-ink/25 bg-limewash px-3 py-1 text-xs font-semibold">{products.length} products</span>
            {undoProduct ? (
              <button type="button" onClick={undoSoftDelete} className="focus-ring inline-flex items-center gap-1 rounded-full border border-ink/25 bg-white px-3 py-1 text-xs font-semibold">
                <RotateCcw aria-hidden size={13} />
                Undo
              </button>
            ) : null}
          </div>
          {productError ? <p className="mt-2 rounded-2xl border border-clay/25 bg-clay/10 px-3 py-2 text-xs font-semibold text-clay">{productError}</p> : null}
          <div className="mt-2 min-h-0 flex-1 space-y-1.5 overflow-y-auto pr-1">
            {products.map((product, index) => {
              const isEditing = editingProductId === product.id && productDraft;
              return (
                <article key={product.id} className={product.isAvailable ? "rounded-2xl border border-ink/25 bg-limewash p-2 shadow-sm" : "rounded-2xl border border-ink/20 bg-ink/5 p-2 text-ink/55 shadow-sm"}>
                  <div className="grid grid-cols-[22px_1fr_auto] gap-1.5">
                    <span className="text-xs font-semibold text-ink/45">{index + 1}</span>
                    <div className="min-w-0">
                      <p className="truncate text-sm font-semibold">{product.name}</p>
                      <p className="truncate text-[11px] text-ink/55">{categoryById.get(product.categoryId) ?? "Catalog"}</p>
                    </div>
                    <div className="flex gap-1">
                      <button type="button" onClick={() => startProductEdit(product)} className="focus-ring inline-flex h-8 w-8 items-center justify-center rounded-full border border-ink/25 bg-white text-leaf" aria-label={`Edit ${product.name}`}>
                        <Pencil aria-hidden size={13} />
                      </button>
                      <button type="button" disabled={busyProductId === product.id} onClick={() => softDeleteProduct(product)} className="focus-ring inline-flex h-8 w-8 items-center justify-center rounded-full border border-ink/25 bg-white text-clay disabled:opacity-50" aria-label={`Hide ${product.name}`}>
                        <Trash2 aria-hidden size={13} />
                      </button>
                    </div>
                  </div>
                  <div className="mt-1.5 grid grid-cols-3 gap-1 text-[11px]">
                    <TinyMetric label="Now" value={`${formatCurrency(product.price)} / ${product.unit}`} />
                    <TinyMetric label="Change" value={`${priceMove(product) >= 0 ? "+" : ""}${formatCurrency(priceMove(product))}`} />
                    <TinyMetric label="Status" value={product.isAvailable ? "Live" : "Hidden"} />
                  </div>
                  {isEditing ? (
                    <div className="mt-2 grid gap-1.5 rounded-2xl border border-leaf/25 bg-white p-2">
                      <MobileEditInput label="Name" value={productDraft.name} onChange={(value) => updateProductDraft("name", value)} />
                      <div className="grid grid-cols-2 gap-1.5">
                        <MobileEditInput label="Price" value={productDraft.price} onChange={(value) => updateProductDraft("price", value)} />
                        <MobileEditInput label="Previous" value={productDraft.previousWeekPrice} onChange={(value) => updateProductDraft("previousWeekPrice", value)} />
                      </div>
                      <MobileEditInput label="Range" value={productDraft.retailRange} onChange={(value) => updateProductDraft("retailRange", value)} />
                      <MobileEditInput label="Source" value={productDraft.sourceNote} onChange={(value) => updateProductDraft("sourceNote", value)} />
                      <div className="flex items-center justify-between gap-2">
                        <label className="inline-flex items-center gap-1.5 rounded-full border border-ink/25 bg-limewash px-3 py-2 text-xs font-semibold">
                          <input type="checkbox" checked={productDraft.isAvailable} onChange={(event) => updateProductDraft("isAvailable", event.target.checked)} />
                          Live
                        </label>
                        <div className="flex gap-1">
                          <button type="button" disabled={busyProductId === product.id} onClick={() => saveProduct(product)} className="focus-ring inline-flex h-9 w-9 items-center justify-center rounded-full bg-ink text-white disabled:opacity-50" aria-label="Save product">
                            <Save aria-hidden size={14} />
                          </button>
                          <button type="button" onClick={() => { setEditingProductId(null); setProductDraft(null); }} className="focus-ring inline-flex h-9 w-9 items-center justify-center rounded-full border border-ink/25 bg-white" aria-label="Cancel edit">
                            <X aria-hidden size={14} />
                          </button>
                        </div>
                      </div>
                    </div>
                  ) : null}
                </article>
              );
            })}
          </div>
        </MobilePanel>
      ) : null}

      {activeTab === "staff" ? (
        <MobilePanel title="Staff monitoring" icon={Users}>
          <div className="grid grid-cols-2 gap-1.5">
            <AdminStat label="Staff" value={String(staff.length)} />
            <AdminStat label="Available" value={String(staff.filter((member) => !activeStaffIds.has(member.id)).length)} />
            <AdminStat label="Busy" value={String(staff.filter((member) => activeStaffIds.has(member.id)).length)} />
            <AdminStat label="Pending" value={String(pendingRequests.length)} />
          </div>
          <div className="mt-2 grid grid-cols-2 gap-1.5">
            <FilterButton active={staffView === "approved"} onClick={() => setStaffView("approved")}>Approved staff</FilterButton>
            <FilterButton active={staffView === "pending"} onClick={() => setStaffView("pending")}>Pending requests</FilterButton>
          </div>
          <div className="mt-2 min-h-0 flex-1 space-y-1.5 overflow-y-auto pr-1">
            {staffView === "approved"
              ? staff.map((member, index) => (
                  <article key={member.id} className="rounded-2xl border border-ink/25 bg-limewash p-2 shadow-sm">
                    <div className="flex items-start justify-between gap-2">
                      <div>
                        <p className="text-xs font-semibold text-ink/45">#{index + 1}</p>
                        <h3 className="text-sm font-semibold">{member.name}</h3>
                        <p className="text-xs text-ink/58">{member.phone}</p>
                      </div>
                      <span className={activeStaffIds.has(member.id) ? "rounded-full border border-market/25 bg-market/10 px-2 py-1 text-xs font-semibold text-market" : "rounded-full border border-leaf/25 bg-mint px-2 py-1 text-xs font-semibold text-leaf"}>
                        {activeStaffIds.has(member.id) ? "Busy" : "Available"}
                      </span>
                    </div>
                  </article>
                ))
              : pendingRequests.map((request) => (
                  <article key={request.id} className="rounded-2xl border border-ink/25 bg-limewash p-2 shadow-sm">
                    <h3 className="text-sm font-semibold">{request.full_name}</h3>
                    <p className="text-xs text-ink/58">{request.phone} - {request.route_area}</p>
                    <p className="mt-1 text-xs text-ink/62">{request.vehicle}</p>
                    <div className="mt-2 grid grid-cols-2 gap-1.5">
                      <button type="button" disabled={requestBusyId === request.id} onClick={() => reviewStaffRequest(request.id, "approved")} className="focus-ring rounded-full border border-leaf/25 bg-mint px-3 py-2 text-xs font-semibold text-leaf disabled:opacity-50">
                        Approve
                      </button>
                      <button type="button" disabled={requestBusyId === request.id} onClick={() => reviewStaffRequest(request.id, "rejected")} className="focus-ring rounded-full border border-clay/25 bg-white px-3 py-2 text-xs font-semibold text-clay disabled:opacity-50">
                        Reject
                      </button>
                    </div>
                  </article>
                ))}
            {staffView === "pending" && pendingRequests.length === 0 ? <p className="rounded-2xl border border-ink/20 bg-limewash p-3 text-sm text-ink/58">No pending staff requests.</p> : null}
          </div>
        </MobilePanel>
      ) : null}

      {activeTab === "orders" ? (
        <MobilePanel title="Order monitoring" icon={ClipboardList}>
          <div className="grid grid-cols-3 gap-1.5">
            <AdminStat label="All" value={String(orders.length)} />
            <AdminStat label="Active" value={String(activeOrders.length)} />
            <AdminStat label="Paid" value={String(paidOrders.length)} />
          </div>
          <div className="mt-2 flex gap-1.5 overflow-x-auto pb-1">
            {(["all", "submitted", "assigned", "shopping", "ready_for_delivery", "delivered", "cancelled"] as OrderFilter[]).map((filter) => (
              <FilterButton key={filter} active={orderFilter === filter} onClick={() => setOrderFilter(filter)}>
                {filter === "all" ? "All" : filter.replaceAll("_", " ")}
              </FilterButton>
            ))}
          </div>
          <div className="mt-2 min-h-0 flex-1 space-y-1.5 overflow-y-auto pr-1">
            {filteredOrders.map((order) => (
              <article key={order.id} className="rounded-2xl border border-ink/25 bg-limewash p-2 shadow-sm">
                <div className="flex items-start justify-between gap-2">
                  <div>
                    <p className="font-semibold">{order.orderNumber}</p>
                    <p className="text-xs text-ink/58">{order.customer.name}</p>
                  </div>
                  <strong className="text-sm">{formatCurrency(getOrderTotal(order))}</strong>
                </div>
                <div className="mt-2 flex flex-wrap gap-1.5">
                  <StatusPill value={order.status} type="order" />
                  <StatusPill value={order.paymentState} type="payment" />
                </div>
              </article>
            ))}
          </div>
        </MobilePanel>
      ) : null}

      {activeTab === "reviews" ? (
        <MobilePanel title="Reviews" icon={Star}>
          <div className="min-h-0 flex-1 space-y-1.5 overflow-y-auto pr-1">
            {reviews.map((review) => (
              <article key={review.id} className="rounded-2xl border border-ink/25 bg-limewash p-2 shadow-sm">
                <div className="flex items-start justify-between gap-2">
                  <div>
                    <p className="text-sm font-semibold">{review.customerName}</p>
                    <p className="text-xs text-ink/58">{review.rating}/5 - {review.target === "staff" ? "Staff" : "App"}</p>
                  </div>
                  <span className="rounded-full border border-ink/20 bg-white px-2 py-1 text-xs font-semibold">
                    {review.replyStatus === "replied" ? "Replied" : "Needs reply"}
                  </span>
                </div>
                <p className="mt-2 text-sm leading-5 text-ink/70">{review.comment}</p>
                <a href={`https://wa.me/${review.customerPhone.replace(/\D/g, "")}`} className="focus-ring mt-2 inline-flex items-center gap-1.5 rounded-full border border-ink/25 bg-white px-3 py-1.5 text-xs font-semibold">
                  <MessageCircle aria-hidden size={13} />
                  Reply
                </a>
              </article>
            ))}
          </div>
        </MobilePanel>
      ) : null}

      {activeTab === "more" ? (
        <MobilePanel title="More details" icon={Banknote}>
          <div className="grid grid-cols-2 gap-1.5">
            <AdminStat label="Pending pay" value={String(pendingPayments.length)} />
            <AdminStat label="Paid orders" value={String(paidOrders.length)} />
            <AdminStat label="Cash handled" value={formatCurrency(cashHandled)} />
            <AdminStat label="Today" value={formatCurrency(todayRevenue)} />
          </div>
          <div className="mt-2 rounded-2xl border border-ink/25 bg-limewash p-3">
            <h3 className="text-sm font-semibold">WhatsApp updates</h3>
            <p className="mt-1 text-xs leading-5 text-ink/62">Open the update center from desktop detail pages when you need full dispatch logs.</p>
          </div>
        </MobilePanel>
      ) : null}

      <AdminMobileDock activeTab={activeTab} onChange={setActiveTab} />
    </section>
  );
}

function AdminMobileDock({ activeTab, onChange }: { activeTab: AdminMobileTab; onChange: (tab: AdminMobileTab) => void }) {
  const tabs: Array<{ id: AdminMobileTab; label: string; icon: typeof ShieldCheck }> = [
    { id: "dashboard", label: "Stats", icon: ShieldCheck },
    { id: "products", label: "Products", icon: PackageSearch },
    { id: "staff", label: "Staff", icon: Users },
    { id: "orders", label: "Orders", icon: ReceiptText },
    { id: "reviews", label: "Reviews", icon: Star },
    { id: "more", label: "More", icon: Banknote }
  ];

  return (
    <nav className="fixed inset-x-2 bottom-3 z-30 grid grid-cols-6 rounded-[2rem] border border-ink/30 bg-white/95 px-1.5 py-1.5 shadow-soft backdrop-blur lg:hidden">
      {tabs.map((tab) => (
        <button
          key={tab.id}
          type="button"
          onClick={() => onChange(tab.id)}
          className={activeTab === tab.id ? "focus-ring flex flex-col items-center gap-0.5 rounded-2xl bg-mint px-1 py-1.5 text-[10px] font-semibold text-leaf" : "focus-ring flex flex-col items-center gap-0.5 rounded-2xl px-1 py-1.5 text-[10px] font-semibold text-ink/58"}
        >
          <tab.icon aria-hidden size={16} />
          <span>{tab.label}</span>
        </button>
      ))}
    </nav>
  );
}

function MobilePanel({ title, icon: Icon, children }: { title: string; icon: typeof ShieldCheck; children: React.ReactNode }) {
  return (
    <section className="flex min-h-0 flex-1 flex-col rounded-3xl border border-ink/30 bg-white p-3 shadow-soft">
      <h1 className="flex items-center gap-2 text-lg font-semibold">
        <Icon aria-hidden className="text-leaf" size={18} />
        {title}
      </h1>
      <div className="mt-2 flex min-h-0 flex-1 flex-col">{children}</div>
    </section>
  );
}

function AdminStat({ label, value, wide = false }: { label: string; value: string; wide?: boolean }) {
  return (
    <div className={`rounded-2xl border border-ink/25 bg-limewash px-2.5 py-2 shadow-sm ${wide ? "col-span-2" : ""}`}>
      <p className="text-[10px] font-semibold uppercase tracking-[0.08em] text-ink/48">{label}</p>
      <p className="mt-0.5 truncate text-sm font-semibold">{value}</p>
    </div>
  );
}

function TinyMetric({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-xl border border-ink/15 bg-white px-2 py-1.5">
      <p className="text-[9px] uppercase tracking-[0.08em] text-ink/42">{label}</p>
      <p className="mt-0.5 truncate font-semibold">{value}</p>
    </div>
  );
}

function FilterButton({ active, onClick, children }: { active: boolean; onClick: () => void; children: React.ReactNode }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={active ? "focus-ring shrink-0 rounded-full border border-ink bg-ink px-3 py-1.5 text-xs font-semibold capitalize text-white" : "focus-ring shrink-0 rounded-full border border-ink/25 bg-white px-3 py-1.5 text-xs font-semibold capitalize text-ink"}
    >
      {children}
    </button>
  );
}

function CompactProductList({ title, products, showMove = false }: { title: string; products: Product[]; showMove?: boolean }) {
  return (
    <section className="rounded-3xl border border-ink/25 bg-white p-2 shadow-sm">
      <h2 className="text-sm font-semibold">{title}</h2>
      <div className="mt-1.5 space-y-1">
        {products.map((product, index) => (
          <div key={`${title}-${product.id}`} className="grid grid-cols-[20px_1fr_auto] gap-1.5 rounded-2xl border border-ink/15 bg-limewash p-2 text-xs">
            <span className="font-semibold text-ink/45">{index + 1}</span>
            <span className="truncate font-semibold">{product.name}</span>
            <span className={showMove && priceMove(product) > 0 ? "font-semibold text-clay" : "font-semibold text-leaf"}>
              {showMove ? `${priceMove(product) >= 0 ? "+" : ""}${formatCurrency(priceMove(product))}` : formatCurrency(product.price)}
            </span>
          </div>
        ))}
      </div>
    </section>
  );
}

function MobileEditInput({ label, value, onChange }: { label: string; value: string; onChange: (value: string) => void }) {
  return (
    <label className="text-[11px] font-semibold uppercase tracking-[0.08em] text-ink/52">
      {label}
      <input value={value} onChange={(event) => onChange(event.target.value)} className="focus-ring mt-1 w-full rounded-2xl border border-ink/25 bg-limewash px-3 py-2 text-sm font-normal normal-case tracking-normal text-ink" />
    </label>
  );
}

function ProfileInput({ label, value, onChange }: { label: string; value: string; onChange: (value: string) => void }) {
  return (
    <label className="text-xs font-semibold uppercase tracking-[0.08em] text-ink/52">
      {label}
      <input value={value} onChange={(event) => onChange(event.target.value)} className="focus-ring mt-1 w-full rounded-2xl border border-ink/25 bg-limewash px-3 py-2.5 text-sm font-normal normal-case tracking-normal text-ink" />
    </label>
  );
}

function ProfileLine({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex items-center justify-between gap-2 rounded-2xl border border-ink/15 bg-limewash px-3 py-2">
      <span className="text-ink/52">{label}</span>
      <strong className="text-right">{value}</strong>
    </div>
  );
}

function priceMove(product: Product) {
  return product.price - (product.previousWeekPrice ?? product.price);
}

function popularityRank(product: Product) {
  if (product.popularity === "top_selling") return 0;
  if (product.popularity === "popular") return 1;
  if (product.popularity === "seasonal") return 2;
  return 3;
}

function toOptionalNumber(value: string) {
  const parsed = Number(value);
  return Number.isFinite(parsed) && value.trim() ? parsed : null;
}
