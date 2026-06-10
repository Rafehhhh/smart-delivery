import { getOrdersData } from "@/lib/supabase-orders";
import { CustomerHistoryClient } from "./customer-history-client";

export const dynamic = "force-dynamic";

export default async function CustomerHistoryPage() {
  const { orders } = await getOrdersData();
  return <CustomerHistoryClient initialOrders={orders} />;
}
