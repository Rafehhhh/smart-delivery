import { getOrderEventsForOrders, getOrdersData } from "@/lib/supabase-orders";
import { CustomerHistoryClient } from "./customer-history-client";

export const dynamic = "force-dynamic";

export default async function CustomerHistoryPage() {
  const { orders } = await getOrdersData();
  const eventsByOrderId = await getOrderEventsForOrders(orders.map((order) => order.id));
  return <CustomerHistoryClient initialOrders={orders} eventsByOrderId={eventsByOrderId} />;
}
