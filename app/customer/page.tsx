import { CustomerPageClient } from "./customer-page-client";
import { getCatalogData } from "@/lib/supabase-catalog";
import { getOrdersData } from "@/lib/supabase-orders";

export const dynamic = "force-dynamic";

export default async function CustomerPage() {
  const [catalog, ordersData] = await Promise.all([getCatalogData(), getOrdersData()]);

  return <CustomerPageClient initialCatalog={catalog} initialOrders={ordersData.orders} />;
}
