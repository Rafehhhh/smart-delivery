import { createClient } from "@supabase/supabase-js";
import {
  categories as demoCategories,
  products as demoProducts,
  serviceFeeRule as demoServiceFeeRule,
  slots as demoSlots
} from "./demo-data";
import type { DeliverySlot, Product, ProductCategory, ServiceFeeRule } from "./types";

export type CatalogData = {
  categories: ProductCategory[];
  products: Product[];
  slots: DeliverySlot[];
  serviceFeeRule: ServiceFeeRule;
  source: "supabase" | "demo";
};

export type CatalogDataOptions = {
  includeUnavailableProducts?: boolean;
};

export type SupabaseCategoryRow = {
  id: string;
  source_key: string | null;
  name: string;
  description: string | null;
};

export type SupabaseProductRow = {
  id: string;
  source_key: string | null;
  category_id: string;
  name: string;
  unit: string;
  price: number | string;
  previous_week_price: number | string | null;
  price_trend: Product["priceTrend"] | null;
  retail_range: string | null;
  popularity: Product["popularity"] | null;
  recommendation: string | null;
  best_value_shop: string | null;
  source_note: string | null;
  is_approximate_price: boolean;
  is_available: boolean;
};

export type SupabaseDeliverySlotRow = {
  id: string;
  source_key: string | null;
  label: string;
  starts_at: string;
  ends_at: string;
  capacity: number;
  reserved: number | null;
};

export type SupabaseServiceFeeRuleRow = {
  id: string;
  name: string;
  flat_fee: number | string;
  free_delivery_minimum: number | string | null;
  is_active: boolean;
};

function toNumber(value: number | string | null | undefined, fallback = 0) {
  if (value === null || value === undefined || value === "") return fallback;
  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : fallback;
}

function fallbackCatalog(): CatalogData {
  return {
    categories: demoCategories,
    products: demoProducts,
    slots: demoSlots,
    serviceFeeRule: demoServiceFeeRule,
    source: "demo"
  };
}

export function hasSupabaseCatalogConfig() {
  return Boolean(process.env.NEXT_PUBLIC_SUPABASE_URL && process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY);
}

export function mapCategoryRow(row: SupabaseCategoryRow): ProductCategory {
  return {
    id: row.source_key ?? row.id,
    name: row.name,
    description: row.description ?? ""
  };
}

export function mapProductRow(row: SupabaseProductRow, categorySourceByUuid: Map<string, string>): Product {
  return {
    id: row.source_key ?? row.id,
    categoryId: categorySourceByUuid.get(row.category_id) ?? row.category_id,
    name: row.name,
    unit: row.unit,
    price: toNumber(row.price),
    previousWeekPrice: row.previous_week_price === null ? undefined : toNumber(row.previous_week_price),
    priceTrend: row.price_trend ?? undefined,
    retailRange: row.retail_range ?? undefined,
    popularity: row.popularity ?? undefined,
    recommendation: row.recommendation ?? undefined,
    bestValueShop: row.best_value_shop ?? undefined,
    sourceNote: row.source_note ?? undefined,
    isApproximatePrice: row.is_approximate_price,
    isAvailable: row.is_available
  };
}

export function mapDeliverySlotRow(row: SupabaseDeliverySlotRow): DeliverySlot {
  return {
    id: row.source_key ?? row.id,
    label: row.label,
    startsAt: row.starts_at,
    endsAt: row.ends_at,
    capacity: row.capacity,
    reserved: row.reserved ?? 0
  };
}

export function mapServiceFeeRuleRow(row: SupabaseServiceFeeRuleRow): ServiceFeeRule {
  return {
    id: row.id,
    name: row.name,
    flatFee: toNumber(row.flat_fee),
    freeDeliveryMinimum: row.free_delivery_minimum === null ? undefined : toNumber(row.free_delivery_minimum),
    isActive: row.is_active
  };
}

export async function getCatalogData(options: CatalogDataOptions = {}): Promise<CatalogData> {
  if (!hasSupabaseCatalogConfig()) return fallbackCatalog();

  try {
    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL as string,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY as string,
      {
        auth: {
          persistSession: false,
          autoRefreshToken: false
        }
      }
    );

    let productQuery = supabase
      .from("products")
      .select("id, source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available")
      .order("name", { ascending: true });

    if (!options.includeUnavailableProducts) {
      productQuery = productQuery.eq("is_available", true);
    }

    const [categoryResult, productResult, slotResult, feeResult] = await Promise.all([
      supabase
        .from("categories")
        .select("id, source_key, name, description")
        .order("sort_order", { ascending: true })
        .order("name", { ascending: true }),
      productQuery,
      supabase
        .from("delivery_slots")
        .select("id, source_key, label, starts_at, ends_at, capacity, reserved")
        .eq("is_active", true)
        .order("starts_at", { ascending: true }),
      supabase
        .from("service_fee_rules")
        .select("id, name, flat_fee, free_delivery_minimum, is_active")
        .eq("is_active", true)
        .limit(1)
        .maybeSingle()
    ]);

    if (categoryResult.error || productResult.error || slotResult.error || feeResult.error) {
      return fallbackCatalog();
    }

    const categoryRows = (categoryResult.data ?? []) as SupabaseCategoryRow[];
    const productRows = (productResult.data ?? []) as SupabaseProductRow[];
    const slotRows = (slotResult.data ?? []) as SupabaseDeliverySlotRow[];
    const feeRow = feeResult.data as SupabaseServiceFeeRuleRow | null;

    if (!categoryRows.length || !productRows.length || !slotRows.length || !feeRow) {
      return fallbackCatalog();
    }

    const categorySourceByUuid = new Map(categoryRows.map((category) => [category.id, category.source_key ?? category.id]));

    return {
      categories: categoryRows.map(mapCategoryRow),
      products: productRows.map((product) => mapProductRow(product, categorySourceByUuid)),
      slots: slotRows.map(mapDeliverySlotRow),
      serviceFeeRule: mapServiceFeeRuleRow(feeRow),
      source: "supabase"
    };
  } catch {
    return fallbackCatalog();
  }
}
