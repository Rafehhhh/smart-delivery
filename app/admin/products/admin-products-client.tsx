"use client";

import { Fragment, useMemo, useState } from "react";
import { formatCurrency } from "@/lib/format";
import type { Product, ProductCategory } from "@/lib/types";
import { Check, Pencil, Power, Save, TrendingDown, TrendingUp, X } from "lucide-react";

type Draft = {
  price: string;
  previousWeekPrice: string;
  retailRange: string;
  sourceNote: string;
  bestValueShop: string;
  isAvailable: boolean;
};

function makeDraft(product: Product): Draft {
  return {
    price: String(product.price),
    previousWeekPrice: product.previousWeekPrice === undefined ? "" : String(product.previousWeekPrice),
    retailRange: product.retailRange ?? "",
    sourceNote: product.sourceNote ?? "",
    bestValueShop: product.bestValueShop ?? "",
    isAvailable: product.isAvailable
  };
}

function toNullableNumber(value: string) {
  const trimmed = value.trim();
  if (!trimmed) return null;
  const parsed = Number(trimmed);
  return Number.isFinite(parsed) ? parsed : null;
}

export function AdminProductsClient({ categories, initialProducts }: { categories: ProductCategory[]; initialProducts: Product[] }) {
  const [products, setProducts] = useState(initialProducts);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [draft, setDraft] = useState<Draft | null>(null);
  const [busyId, setBusyId] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const categoryById = useMemo(() => new Map(categories.map((category) => [category.id, category.name])), [categories]);
  const sortedProducts = useMemo(
    () =>
      [...products].sort(
        (first, second) =>
          (categoryById.get(first.categoryId) ?? "").localeCompare(categoryById.get(second.categoryId) ?? "") ||
          first.name.localeCompare(second.name)
      ),
    [categoryById, products]
  );

  function startEdit(product: Product) {
    setEditingId(product.id);
    setDraft(makeDraft(product));
    setError(null);
  }

  function updateDraft<Key extends keyof Draft>(key: Key, value: Draft[Key]) {
    setDraft((current) => (current ? { ...current, [key]: value } : current));
  }

  async function saveProduct(product: Product) {
    if (!draft) return;
    const price = Number(draft.price);
    if (!Number.isFinite(price) || price < 0) {
      setError("Enter a valid price before saving.");
      return;
    }

    setBusyId(product.id);
    setError(null);
    try {
      const response = await fetch(`/api/admin/products/${product.id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          price,
          previousWeekPrice: toNullableNumber(draft.previousWeekPrice),
          retailRange: draft.retailRange.trim() || null,
          sourceNote: draft.sourceNote.trim() || null,
          bestValueShop: draft.bestValueShop.trim() || null,
          isApproximatePrice: true,
          isAvailable: draft.isAvailable
        })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not save product.");

      setProducts((current) =>
        current.map((entry) =>
          entry.id === product.id
            ? {
                ...entry,
                price,
                previousWeekPrice: toNullableNumber(draft.previousWeekPrice) ?? undefined,
                retailRange: draft.retailRange.trim() || undefined,
                sourceNote: draft.sourceNote.trim() || undefined,
                bestValueShop: draft.bestValueShop.trim() || undefined,
                isApproximatePrice: true,
                isAvailable: draft.isAvailable
              }
            : entry
        )
      );
      setEditingId(null);
      setDraft(null);
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "Could not save product.");
    } finally {
      setBusyId(null);
    }
  }

  async function toggleAvailability(product: Product) {
    const nextAvailable = !product.isAvailable;
    setBusyId(product.id);
    setError(null);
    try {
      const response = await fetch(`/api/admin/products/${product.id}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ isAvailable: nextAvailable })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not update product status.");
      setProducts((current) => current.map((entry) => (entry.id === product.id ? { ...entry, isAvailable: nextAvailable } : entry)));
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "Could not update product status.");
    } finally {
      setBusyId(null);
    }
  }

  return (
    <section className="rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm">
      <div className="flex flex-wrap items-center justify-between gap-2 border-b border-ink/10 pb-2">
        <div>
          <h2 className="flex items-center gap-2 text-lg font-semibold">All products</h2>
          <p className="mt-0.5 text-xs text-ink/58">Edit trial prices, weekly movement, source notes, and availability.</p>
        </div>
        <span className="rounded-full bg-mint px-3 py-1 text-xs font-semibold text-leaf">{sortedProducts.length} products</span>
      </div>
      {error ? <p className="mt-2 rounded-lg bg-clay/10 px-3 py-2 text-xs font-semibold text-clay">{error}</p> : null}

      <div className="mt-2 max-h-[calc(100vh-13rem)] overflow-y-auto overflow-x-hidden pr-1">
        <table className="w-full table-fixed border-separate border-spacing-y-1 text-left text-xs">
          <colgroup>
            <col className="w-[5%]" />
            <col className="w-[13%]" />
            <col className="w-[22%]" />
            <col className="w-[18%]" />
            <col className="w-[10%]" />
            <col className="w-[10%]" />
            <col className="w-[9%]" />
            <col className="w-[7%]" />
            <col className="w-[6%]" />
          </colgroup>
          <thead className="sticky top-0 z-10 bg-white">
            <tr className="text-ink/58">
              <th className="px-2 py-1 font-semibold">No.</th>
              <th className="px-2 py-1 font-semibold">Category</th>
              <th className="px-2 py-1 font-semibold">Product</th>
              <th className="px-2 py-1 font-semibold">Brand / Source</th>
              <th className="px-2 py-1 font-semibold">Current</th>
              <th className="px-2 py-1 font-semibold">Previous</th>
              <th className="px-2 py-1 font-semibold">Change</th>
              <th className="px-2 py-1 font-semibold">Status</th>
              <th className="px-2 py-1 text-right font-semibold">Edit</th>
            </tr>
          </thead>
          <tbody>
            {sortedProducts.map((product, index) => {
              const previous = product.previousWeekPrice ?? product.price;
              const difference = product.price - previous;
              const categoryName = categoryById.get(product.categoryId) ?? "Unmapped";
              const sourceLabel = product.marketQuotes?.[0]?.shopName ?? product.bestValueShop ?? "Admin-maintained";
              const isEditing = editingId === product.id && draft;

              return (
                <Fragment key={product.id}>
                  <tr className={product.isAvailable ? "bg-limewash align-top hover:bg-mint/60" : "bg-ink/5 align-top text-ink/50"}>
                    <td className="rounded-l-xl px-2 py-1.5 font-semibold text-ink/50">{index + 1}</td>
                    <td className="px-2 py-1.5">
                      <span className="line-clamp-2 font-semibold">{categoryName}</span>
                    </td>
                    <td className="px-2 py-1.5">
                      <p className="truncate font-semibold">{product.name}</p>
                      <p className="mt-0.5 line-clamp-2 text-[11px] leading-snug text-ink/52">{product.retailRange ?? "Admin-maintained local price"}</p>
                    </td>
                    <td className="px-2 py-1.5">
                      <p className="line-clamp-2 font-semibold">{sourceLabel}</p>
                      <p className="mt-0.5 line-clamp-2 text-[11px] leading-snug text-ink/52">{product.sourceNote ?? "Editable admin catalog item"}</p>
                    </td>
                    <td className="px-2 py-1.5 font-semibold">
                      {formatCurrency(product.price)} / {product.unit}
                    </td>
                    <td className="px-2 py-1.5">{formatCurrency(previous)}</td>
                    <td className="px-2 py-1.5">
                      <span className={difference > 0 ? "inline-flex items-center gap-1 font-semibold text-clay" : "inline-flex items-center gap-1 font-semibold text-leaf"}>
                        {difference > 0 ? <TrendingUp aria-hidden size={14} /> : <TrendingDown aria-hidden size={14} />}
                        {difference > 0 ? "+" : ""}
                        {formatCurrency(difference)}
                      </span>
                    </td>
                    <td className="px-2 py-1.5">
                      <span className={product.isAvailable ? "rounded-full bg-mint px-2 py-0.5 text-[11px] font-semibold text-leaf" : "rounded-full bg-white px-2 py-0.5 text-[11px] font-semibold text-clay"}>
                        {product.isAvailable ? "Live" : "Hidden"}
                      </span>
                    </td>
                    <td className="rounded-r-xl px-2 py-1.5">
                      <div className="flex justify-end gap-1">
                        <button
                          type="button"
                          onClick={() => startEdit(product)}
                          className="focus-ring inline-flex h-7 w-7 items-center justify-center rounded-full border border-ink/10 bg-white text-leaf"
                          aria-label={`Edit ${product.name}`}
                        >
                          <Pencil aria-hidden size={14} />
                        </button>
                        <button
                          type="button"
                          disabled={busyId === product.id}
                          onClick={() => toggleAvailability(product)}
                          className="focus-ring inline-flex h-7 w-7 items-center justify-center rounded-full border border-ink/10 bg-white text-clay disabled:opacity-50"
                          aria-label={`${product.isAvailable ? "Hide" : "Show"} ${product.name}`}
                        >
                          <Power aria-hidden size={14} />
                        </button>
                      </div>
                    </td>
                  </tr>
                  {isEditing ? (
                    <tr className="bg-white">
                      <td colSpan={9} className="rounded-xl border border-leaf/20 bg-mint/35 p-2">
                        <div className="grid gap-2 md:grid-cols-[120px_120px_1fr_1fr_1fr_auto]">
                          <EditField label="Price" value={draft.price} onChange={(value) => updateDraft("price", value)} />
                          <EditField label="Prev week" value={draft.previousWeekPrice} onChange={(value) => updateDraft("previousWeekPrice", value)} />
                          <EditField label="Retail range" value={draft.retailRange} onChange={(value) => updateDraft("retailRange", value)} />
                          <EditField label="Best shop" value={draft.bestValueShop} onChange={(value) => updateDraft("bestValueShop", value)} />
                          <EditField label="Source note" value={draft.sourceNote} onChange={(value) => updateDraft("sourceNote", value)} />
                          <div className="flex items-end gap-1.5">
                            <label className="focus-within:ring-leaf/20 flex h-8 items-center gap-1.5 rounded-full border border-ink/15 bg-white px-2 text-xs font-semibold">
                              <input
                                type="checkbox"
                                checked={draft.isAvailable}
                                onChange={(event) => updateDraft("isAvailable", event.target.checked)}
                              />
                              Live
                            </label>
                            <button
                              type="button"
                              disabled={busyId === product.id}
                              onClick={() => saveProduct(product)}
                              className="focus-ring inline-flex h-8 w-8 items-center justify-center rounded-full bg-leaf text-white disabled:opacity-50"
                              aria-label={`Save ${product.name}`}
                            >
                              {busyId === product.id ? <Check aria-hidden size={15} /> : <Save aria-hidden size={15} />}
                            </button>
                            <button
                              type="button"
                              onClick={() => {
                                setEditingId(null);
                                setDraft(null);
                              }}
                              className="focus-ring inline-flex h-8 w-8 items-center justify-center rounded-full border border-ink/15 bg-white"
                              aria-label="Cancel edit"
                            >
                              <X aria-hidden size={15} />
                            </button>
                          </div>
                        </div>
                      </td>
                    </tr>
                  ) : null}
                </Fragment>
              );
            })}
          </tbody>
        </table>
      </div>
    </section>
  );
}

function EditField({ label, value, onChange }: { label: string; value: string; onChange: (value: string) => void }) {
  return (
    <label className="block text-[11px] font-semibold uppercase tracking-[0.08em] text-ink/52">
      {label}
      <input
        value={value}
        onChange={(event) => onChange(event.target.value)}
        className="focus-ring mt-1 h-8 w-full rounded-lg border border-ink/15 bg-white px-2 text-xs font-semibold normal-case tracking-normal text-ink"
      />
    </label>
  );
}
