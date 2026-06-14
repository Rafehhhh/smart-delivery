import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { getCatalogData } from "@/lib/supabase-catalog";
import { AdminHomeHeader } from "../admin-header";
import { AdminProductsClient } from "./admin-products-client";
import { ArrowLeft } from "lucide-react";

export const dynamic = "force-dynamic";

export default async function AdminProductsPage() {
  const { categories, products } = await getCatalogData({ includeUnavailableProducts: true });

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-3 py-4 sm:px-4 lg:px-6">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/25 px-3 py-2 text-sm font-semibold shadow-sm lg:rounded-md lg:border-ink/15 lg:shadow-none">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-3 text-2xl font-semibold sm:text-3xl">Product table</h1>
          <p className="mt-1.5 max-w-3xl text-sm leading-6 text-ink/64">
            All catalog products in one admin table. Update trial estimates, price movement, notes, and availability.
          </p>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-2 py-3 sm:px-4 lg:px-6">
        <AdminProductsClient categories={categories} initialProducts={products} />
      </section>
    </AppShell>
  );
}
