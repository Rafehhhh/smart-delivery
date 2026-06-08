import { categories, orders, products, profiles } from "./demo-data";
import type { Order, OrderStatus, Profile } from "./types";

export const processingStatuses: OrderStatus[] = ["assigned", "confirmed", "shopping", "ready_for_delivery"];

export function getOrderTotal(order: Order) {
  return (order.finalTotal ?? order.estimateTotal) + order.serviceFee;
}

export function getStatusCounts(sourceOrders = orders) {
  return sourceOrders.reduce<Record<string, number>>((counts, order) => {
    counts[order.status] = (counts[order.status] ?? 0) + 1;
    return counts;
  }, {});
}

export function getCustomerRecords() {
  const customers = new Map<string, Profile & { orderCount: number; totalValue: number }>();

  for (const order of orders) {
    const existing = customers.get(order.customer.id);
    customers.set(order.customer.id, {
      ...order.customer,
      orderCount: (existing?.orderCount ?? 0) + 1,
      totalValue: (existing?.totalValue ?? 0) + getOrderTotal(order)
    });
  }

  for (const profile of profiles.filter((entry) => entry.role === "customer")) {
    if (!customers.has(profile.id)) {
      customers.set(profile.id, { ...profile, orderCount: 0, totalValue: 0 });
    }
  }

  return Array.from(customers.values());
}

export function getPopularProducts(limit = 6) {
  return products
    .filter((product) => product.popularity === "top_selling" || product.popularity === "popular")
    .map((product) => {
      const requestedQuantity = orders.reduce((total, order) => {
        return total + order.items
          .filter((item) => item.productId === product.id)
          .reduce((itemTotal, item) => itemTotal + item.requestedQuantity, 0);
      }, 0);
      const categoryName = categories.find((category) => category.id === product.categoryId)?.name ?? "Catalog";

      return {
        ...product,
        categoryName,
        requestedQuantity,
        popularityLabel: product.popularity === "top_selling" ? "Top selling" : "Popular"
      };
    })
    .sort((a, b) => b.requestedQuantity - a.requestedQuantity || a.name.localeCompare(b.name))
    .slice(0, limit);
}

export function getRevenueSummary() {
  const totalSales = orders.reduce((total, order) => total + getOrderTotal(order), 0);
  const todayKey = new Intl.DateTimeFormat("en-CA", {
    timeZone: "Asia/Kolkata",
    year: "numeric",
    month: "2-digit",
    day: "2-digit"
  }).format(new Date());
  const todayOrders = orders.filter((order) => order.slot.startsAt.startsWith(todayKey));
  const previousWeekSales = totalSales * 0.84;
  const previousMonthSales = totalSales * 3.8;
  const todayRevenue = todayOrders.reduce((total, order) => total + getOrderTotal(order), 0);
  const yesterdayRevenue = Math.max(todayRevenue - 180, 0);

  return {
    todayRevenue,
    yesterdayRevenue,
    todayDifference: todayRevenue - yesterdayRevenue,
    previousWeekSales,
    previousMonthSales,
    totalSales,
    cashHandled: orders.reduce((total, order) => total + order.cash.advanceCollected + order.cash.finalCollected, 0),
    pendingBalance: orders.reduce((total, order) => total + order.cash.balanceDue, 0),
    refundDue: orders.reduce((total, order) => total + order.cash.refundDue, 0)
  };
}
