import { cookies } from "next/headers";
import { createSupabaseServerClient } from "./supabase/server";
import { addresses as demoAddresses, orders as demoOrders, profiles as demoProfiles } from "./demo-data";
import { calculateEstimate, calculateFinalItemsTotal, calculateServiceFee, derivePaymentState, reconcileCash } from "./calculations";
import { readTestOrdersFromCookies } from "./test-order-store";
import type { CashSummary, CustomerAddress, DeliverySlot, Order, OrderEvent, OrderItem, OrderStatus, PaymentState, Profile, ServiceFeeRule } from "./types";

type OrderRow = {
  id: string;
  order_number: string;
  customer_id: string;
  address_id: string;
  slot_id: string;
  assigned_staff_id: string | null;
  status: OrderStatus;
  payment_state: PaymentState;
  estimate_total: number | string;
  final_total: number | string | null;
  service_fee: number | string;
  notes: string | null;
  created_at: string;
  customer?: ProfileRow | null;
  assigned_staff?: ProfileRow | null;
  address?: AddressRow | null;
  slot?: SlotRow | null;
  items?: ItemRow[];
  cash?: CashRow[];
};

type ProfileRow = {
  id: string;
  role: Profile["role"];
  full_name: string;
  phone: string;
};

type AddressRow = {
  id: string;
  customer_id: string;
  house_name: string;
  address_line: string;
  landmark: string | null;
  locality: string;
};

type SlotRow = {
  id: string;
  source_key: string | null;
  label: string;
  starts_at: string;
  ends_at: string;
  capacity: number;
  reserved: number | null;
};

type ItemRow = {
  id: string;
  product_id: string | null;
  product_name: string;
  unit: string;
  requested_quantity: number | string;
  estimated_price: number | string;
  final_quantity: number | string | null;
  final_price: number | string | null;
  notes: string | null;
};

type CashRow = {
  advance_collected: number | string;
  final_collected: number | string;
  balance_due: number | string;
  refund_due: number | string;
  reconciliation_status: CashSummary["reconciliationStatus"];
};

export type OrdersData = {
  orders: Order[];
  source: "supabase" | "demo";
};

export type WhatsAppMessageLog = {
  id: string;
  orderId: string;
  recipientRole?: string;
  recipientPhone: string;
  eventType?: string;
  status: string;
  fallbackUrl?: string;
  createdAt: string;
};

function toNumber(value: number | string | null | undefined, fallback = 0) {
  if (value === null || value === undefined || value === "") return fallback;
  const parsed = Number(value);
  return Number.isFinite(parsed) ? parsed : fallback;
}

function mapProfile(row: ProfileRow | null | undefined): Profile {
  if (!row) return demoProfiles[0];
  return {
    id: row.id,
    role: row.role,
    name: row.full_name,
    phone: row.phone
  };
}

function mapAddress(row: AddressRow | null | undefined): CustomerAddress {
  if (!row) return demoAddresses[0];
  return {
    id: row.id,
    customerId: row.customer_id,
    houseName: row.house_name,
    addressLine: row.address_line,
    landmark: row.landmark ?? undefined,
    locality: row.locality
  };
}

function mapSlot(row: SlotRow | null | undefined): DeliverySlot {
  if (!row) return demoOrders[0].slot;
  return {
    id: row.source_key ?? row.id,
    label: row.label,
    startsAt: row.starts_at,
    endsAt: row.ends_at,
    capacity: row.capacity,
    reserved: row.reserved ?? 0
  };
}

function mapItem(row: ItemRow): OrderItem {
  return {
    id: row.id,
    productId: row.product_id ?? row.id,
    productName: row.product_name,
    unit: row.unit,
    requestedQuantity: toNumber(row.requested_quantity, 1),
    estimatedPrice: toNumber(row.estimated_price),
    finalQuantity: row.final_quantity === null ? undefined : toNumber(row.final_quantity),
    finalPrice: row.final_price === null ? undefined : toNumber(row.final_price),
    notes: row.notes ?? undefined
  };
}

function mapCash(row: CashRow | undefined): CashSummary {
  if (!row) return reconcileCash(0, 0);
  return {
    advanceCollected: toNumber(row.advance_collected),
    finalCollected: toNumber(row.final_collected),
    balanceDue: toNumber(row.balance_due),
    refundDue: toNumber(row.refund_due),
    reconciliationStatus: row.reconciliation_status
  };
}

export function mapOrderRow(row: OrderRow): Order {
  return {
    id: row.id,
    orderNumber: row.order_number,
    customer: mapProfile(row.customer),
    address: mapAddress(row.address),
    slot: mapSlot(row.slot),
    status: row.status,
    paymentState: row.payment_state,
    serviceFee: toNumber(row.service_fee),
    estimateTotal: toNumber(row.estimate_total),
    finalTotal: row.final_total === null ? undefined : toNumber(row.final_total),
    assignedStaff: row.assigned_staff ? mapProfile(row.assigned_staff) : undefined,
    items: (row.items ?? []).map(mapItem),
    cash: mapCash(row.cash?.[0]),
    createdAt: row.created_at,
    notes: row.notes ?? undefined
  };
}

export async function getOrdersData(): Promise<OrdersData> {
  const testOrders = readTestOrdersFromCookies(await cookies());

  try {
    const supabase = await createSupabaseServerClient();
    const result = await supabase
      .from("orders")
      .select(`
        id,
        order_number,
        customer_id,
        address_id,
        slot_id,
        assigned_staff_id,
        status,
        payment_state,
        estimate_total,
        final_total,
        service_fee,
        notes,
        created_at,
        customer:profiles!orders_customer_id_fkey(id, role, full_name, phone),
        assigned_staff:profiles!orders_assigned_staff_id_fkey(id, role, full_name, phone),
        address:customer_addresses(id, customer_id, house_name, address_line, landmark, locality),
        slot:delivery_slots(id, source_key, label, starts_at, ends_at, capacity, reserved),
        items:order_items(id, product_id, product_name, unit, requested_quantity, estimated_price, final_quantity, final_price, notes),
        cash:cash_transactions(advance_collected, final_collected, balance_due, refund_due, reconciliation_status)
      `)
      .order("created_at", { ascending: false });

    if (result.error || !result.data?.length) {
      return { orders: [...testOrders, ...demoOrders], source: testOrders.length ? "supabase" : "demo" };
    }

    return {
      orders: [...testOrders, ...(result.data as unknown as OrderRow[]).map(mapOrderRow)],
      source: "supabase"
    };
  } catch {
    return { orders: [...testOrders, ...demoOrders], source: testOrders.length ? "supabase" : "demo" };
  }
}

function isUuid(value: string) {
  return /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i.test(value);
}

export async function createOrderEvent(input: {
  orderId: string;
  actorId?: string | null;
  eventType: string;
  message: string;
  metadata?: Record<string, unknown>;
}) {
  const supabase = await createSupabaseServerClient();
  await supabase.from("order_events").insert({
    order_id: input.orderId,
    actor_id: input.actorId ?? null,
    event_type: input.eventType,
    message: input.message,
    metadata: input.metadata ?? {}
  });
}

export async function getOrderEvents(orderId: string): Promise<OrderEvent[]> {
  try {
    const supabase = await createSupabaseServerClient();
    const result = await supabase
      .from("order_events")
      .select("id, order_id, actor_id, event_type, message, metadata, created_at")
      .eq("order_id", orderId)
      .order("created_at", { ascending: true });

    if (result.error) return [];

    return (result.data ?? []).map((row) => ({
      id: row.id,
      orderId: row.order_id,
      actorId: row.actor_id ?? undefined,
      eventType: row.event_type,
      message: row.message,
      metadata: row.metadata ?? {},
      createdAt: row.created_at
    }));
  } catch {
    return [];
  }
}

export async function getOrderEventsForOrders(orderIds: string[]): Promise<Record<string, OrderEvent[]>> {
  const databaseOrderIds = orderIds.filter(isUuid);
  if (databaseOrderIds.length === 0) return {};

  try {
    const supabase = await createSupabaseServerClient();
    const result = await supabase
      .from("order_events")
      .select("id, order_id, actor_id, event_type, message, metadata, created_at")
      .in("order_id", databaseOrderIds)
      .order("created_at", { ascending: true });

    if (result.error) return {};

    return (result.data ?? []).reduce<Record<string, OrderEvent[]>>((eventsByOrder, row) => {
      const event: OrderEvent = {
        id: row.id,
        orderId: row.order_id,
        actorId: row.actor_id ?? undefined,
        eventType: row.event_type,
        message: row.message,
        metadata: row.metadata ?? {},
        createdAt: row.created_at
      };
      eventsByOrder[event.orderId] = [...(eventsByOrder[event.orderId] ?? []), event];
      return eventsByOrder;
    }, {});
  } catch {
    return {};
  }
}

export async function getWhatsAppMessagesForOrders(orderIds: string[]): Promise<Record<string, WhatsAppMessageLog[]>> {
  const databaseOrderIds = orderIds.filter(isUuid);
  if (databaseOrderIds.length === 0) return {};

  try {
    const supabase = await createSupabaseServerClient();
    const result = await supabase
      .from("whatsapp_messages")
      .select("id, order_id, recipient_phone, recipient_role, event_type, status, fallback_url, created_at")
      .in("order_id", databaseOrderIds)
      .order("created_at", { ascending: false });

    if (result.error) return {};

    return (result.data ?? []).reduce<Record<string, WhatsAppMessageLog[]>>((messagesByOrder, row) => {
      const message: WhatsAppMessageLog = {
        id: row.id,
        orderId: row.order_id,
        recipientPhone: row.recipient_phone,
        recipientRole: row.recipient_role ?? undefined,
        eventType: row.event_type ?? undefined,
        status: row.status,
        fallbackUrl: row.fallback_url ?? undefined,
        createdAt: row.created_at
      };
      messagesByOrder[message.orderId] = [...(messagesByOrder[message.orderId] ?? []), message];
      return messagesByOrder;
    }, {});
  } catch {
    return {};
  }
}

export function buildCashForOrder(items: OrderItem[], serviceFeeRule: ServiceFeeRule) {
  const estimateTotal = calculateEstimate(items);
  const serviceFee = calculateServiceFee(estimateTotal, serviceFeeRule);
  return {
    estimateTotal,
    serviceFee,
    cash: reconcileCash(estimateTotal + serviceFee, 0)
  };
}

export function buildFinalTotals(items: OrderItem[], serviceFeeRule: ServiceFeeRule, advanceCollected: number, finalCollected: number) {
  const itemsTotal = calculateFinalItemsTotal(items);
  const serviceFee = calculateServiceFee(itemsTotal, serviceFeeRule);
  const finalTotal = itemsTotal + serviceFee;
  const cash = reconcileCash(finalTotal, advanceCollected, finalCollected);
  return {
    itemsTotal,
    serviceFee,
    finalTotal,
    cash,
    paymentState: derivePaymentState(cash, finalTotal)
  };
}
