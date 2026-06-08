import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { categories, localShops, products } from "@/lib/demo-data";
import { formatCurrency } from "@/lib/format";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, MapPin, PackageSearch, Phone, Store, TrendingDown, TrendingUp } from "lucide-react";

export default function AdminProductsPage() {
  const categoryById = new Map(categories.map((category) => [category.id, category.name]));
  const sortedProducts = [...products].sort(
    (first, second) =>
      (categoryById.get(first.categoryId) ?? "").localeCompare(categoryById.get(second.categoryId) ?? "") ||
      first.name.localeCompare(second.name)
  );

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-3 py-4 sm:px-4 lg:px-6">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-md border border-ink/15 px-3 py-2 text-sm font-semibold">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-3 text-2xl font-semibold sm:text-3xl">Product table and Koyilandy shops</h1>
          <p className="mt-1.5 max-w-3xl text-sm text-ink/64">
            All catalog products in one admin table. Trial estimates can be replaced later with exact shop prices.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-3 px-2 py-3 sm:px-4 lg:grid-cols-[minmax(0,1.35fr)_320px] lg:px-6">
        <section className="rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm">
          <div className="flex flex-wrap items-center justify-between gap-2 border-b border-ink/10 pb-2">
            <div>
              <h2 className="flex items-center gap-2 text-lg font-semibold">
                <PackageSearch aria-hidden size={20} />
                All products
              </h2>
              <p className="mt-0.5 text-xs text-ink/58">Serial number, category, product/source, price movement, and edit-ready estimate notes.</p>
            </div>
            <span className="rounded-full bg-mint px-3 py-1 text-xs font-semibold text-leaf">{sortedProducts.length} products</span>
          </div>

          <div className="mt-2 max-h-[calc(100vh-13rem)] overflow-y-auto overflow-x-hidden pr-1">
            <table className="w-full table-fixed border-separate border-spacing-y-1 text-left text-xs">
              <colgroup>
                <col className="w-[6%]" />
                <col className="w-[16%]" />
                <col className="w-[25%]" />
                <col className="w-[20%]" />
                <col className="w-[12%]" />
                <col className="w-[11%]" />
                <col className="w-[10%]" />
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
                </tr>
              </thead>
              <tbody>
                {sortedProducts.map((product, index) => {
                  const previous = product.previousWeekPrice ?? product.price;
                  const difference = product.price - previous;
                  const categoryName = categoryById.get(product.categoryId) ?? "Unmapped";
                  const sourceLabel = product.marketQuotes?.[0]?.shopName ?? product.bestValueShop ?? "Admin-maintained";

                  return (
                    <tr key={product.id} className="bg-limewash align-top hover:bg-mint/60">
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
                      <td className="px-2 py-1.5">
                        {formatCurrency(previous)}
                      </td>
                      <td className="rounded-r-xl px-2 py-1.5">
                        <span className={difference > 0 ? "inline-flex items-center gap-1 font-semibold text-clay" : "inline-flex items-center gap-1 font-semibold text-leaf"}>
                          {difference > 0 ? <TrendingUp aria-hidden size={14} /> : <TrendingDown aria-hidden size={14} />}
                          {difference > 0 ? "+" : ""}{formatCurrency(difference)}
                        </span>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </section>

        <aside className="space-y-4">
          <section className="rounded-md border border-ink/10 bg-white p-4 shadow-sm">
            <h2 className="flex items-center gap-2 text-xl font-semibold">
              <Store aria-hidden size={20} />
              Shops near Koyilandy
            </h2>
            <div className="mt-4 space-y-3">
              {localShops.map((shop) => (
                <div key={shop.id} className="rounded-md border border-ink/10 bg-limewash p-3">
                  <p className="font-semibold">{shop.name}</p>
                  <p className="mt-2 flex gap-2 text-sm leading-6 text-ink/62">
                    <MapPin aria-hidden className="mt-1 shrink-0 text-leaf" size={15} />
                    {shop.address}
                  </p>
                  <p className="mt-2 flex gap-2 text-sm text-ink/62">
                    <Phone aria-hidden className="shrink-0 text-leaf" size={15} />
                    {shop.contactPhone ?? "Admin verification needed"}
                  </p>
                  {shop.discountNote ? <p className="mt-2 text-xs leading-5 text-ink/58">{shop.discountNote}</p> : null}
                </div>
              ))}
            </div>
          </section>
        </aside>
      </section>
    </AppShell>
  );
}
