import type { NextResponse } from "next/server";
import type { Order } from "./types";

const TEST_ORDERS_COOKIE = "smart_delivery_test_orders";
const COOKIE_MAX_AGE = 60 * 60 * 24 * 7;

type CookieReader = {
  get(name: string): { value: string } | undefined;
};

export function readTestOrdersFromCookies(cookieStore: CookieReader): Order[] {
  const raw = cookieStore.get(TEST_ORDERS_COOKIE)?.value;
  if (!raw) return [];

  try {
    const json = Buffer.from(raw, "base64url").toString("utf8");
    const parsed = JSON.parse(json);
    return Array.isArray(parsed) ? (parsed as Order[]) : [];
  } catch {
    return [];
  }
}

export function setTestOrdersCookie<T>(response: NextResponse<T>, orders: Order[]) {
  const limitedOrders = orders.slice(0, 8);
  const value = Buffer.from(JSON.stringify(limitedOrders), "utf8").toString("base64url");
  response.cookies.set(TEST_ORDERS_COOKIE, value, {
    path: "/",
    maxAge: COOKIE_MAX_AGE,
    sameSite: "lax"
  });
  return response;
}

export function upsertTestOrder(orders: Order[], nextOrder: Order) {
  const filtered = orders.filter((order) => order.id !== nextOrder.id);
  return [nextOrder, ...filtered];
}

export function updateTestOrder(orders: Order[], orderId: string, updater: (order: Order) => Order) {
  return orders.map((order) => (order.id === orderId ? updater(order) : order));
}
