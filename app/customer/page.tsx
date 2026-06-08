import { CustomerPageClient } from "./customer-page-client";
import { getCatalogData } from "@/lib/supabase-catalog";

export const dynamic = "force-dynamic";

export default async function CustomerPage() {
  const catalog = await getCatalogData();

  return <CustomerPageClient initialCatalog={catalog} />;
}
