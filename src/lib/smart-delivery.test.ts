import { describe, expect, it } from "vitest";
import {
  calculateEstimate,
  calculateFinalItemsTotal,
  calculateServiceFee,
  canTransitionOrder,
  derivePaymentState,
  isSlotAvailable,
  isSlotSelectable,
  reconcileCash,
  remainingSlotCapacity
} from "./calculations";
import { products } from "./demo-data";
import {
  getCatalogData,
  mapDeliverySlotRow,
  mapProductRow,
  mapServiceFeeRuleRow
} from "./supabase-catalog";
import { authRedirectPath } from "./auth-flow";
import type { DeliverySlot, OrderItem, ServiceFeeRule } from "./types";

const items: OrderItem[] = [
  {
    id: "item-1",
    productId: "rice",
    productName: "Rice",
    unit: "kg",
    requestedQuantity: 10,
    estimatedPrice: 55
  },
  {
    id: "item-2",
    productId: "tomato",
    productName: "Tomato",
    unit: "kg",
    requestedQuantity: 2,
    estimatedPrice: 40,
    finalQuantity: 2.5,
    finalPrice: 36
  }
];

describe("auth role redirects", () => {
  it("sends a new customer to onboarding before opening customer workspace", () => {
    expect(
      authRedirectPath({
        next: "/customer",
        profile: null,
        hasCustomerAddress: false
      })
    ).toBe("/auth/onboarding?next=%2Fcustomer");
  });

  it("sends a customer requesting staff access to pending approval when request is pending", () => {
    expect(
      authRedirectPath({
        next: "/staff",
        profile: {
          id: "profile-1",
          role: "customer",
          full_name: "Applicant",
          phone: "+919999999999"
        },
        hasCustomerAddress: true,
        staffRequestStatus: "pending"
      })
    ).toBe("/auth/staff-pending");
  });

  it("allows approved staff profile to open staff workspace", () => {
    expect(
      authRedirectPath({
        next: "/staff",
        profile: {
          id: "profile-1",
          role: "staff",
          full_name: "Staff",
          phone: "+919999999999"
        },
        hasCustomerAddress: false
      })
    ).toBe("/staff");
  });
});

describe("slot capacity", () => {
  it("detects available slots and remaining capacity", () => {
    const slot: DeliverySlot = {
      id: "slot",
      label: "Morning",
      startsAt: "2026-06-03T09:00:00+05:30",
      endsAt: "2026-06-03T11:00:00+05:30",
      capacity: 8,
      reserved: 5
    };

    expect(isSlotAvailable(slot)).toBe(true);
    expect(remainingSlotCapacity(slot)).toBe(3);
  });

  it("does not return negative capacity", () => {
    expect(
      remainingSlotCapacity({
        id: "slot",
        label: "Full",
        startsAt: "2026-06-03T09:00:00+05:30",
        endsAt: "2026-06-03T11:00:00+05:30",
        capacity: 2,
        reserved: 3
      })
    ).toBe(0);
  });

  it("rejects same-day slots that have already ended", () => {
    const slot: DeliverySlot = {
      id: "slot",
      label: "Morning",
      startsAt: "2026-06-09T09:00:00+05:30",
      endsAt: "2026-06-09T11:00:00+05:30",
      capacity: 8,
      reserved: 2
    };

    expect(isSlotSelectable(slot, new Date("2026-06-09T12:00:00+05:30"))).toBe(false);
  });

  it("accepts future slots with remaining capacity", () => {
    const slot: DeliverySlot = {
      id: "slot",
      label: "Evening",
      startsAt: "2026-06-09T18:00:00+05:30",
      endsAt: "2026-06-09T20:00:00+05:30",
      capacity: 8,
      reserved: 2
    };

    expect(isSlotSelectable(slot, new Date("2026-06-09T12:00:00+05:30"))).toBe(true);
  });
});

describe("order totals", () => {
  it("calculates estimated item totals", () => {
    expect(calculateEstimate(items)).toBe(630);
  });

  it("uses final quantities and prices when available", () => {
    expect(calculateFinalItemsTotal(items)).toBe(640);
  });

  it("applies flat service fee unless free minimum is reached", () => {
    const rule: ServiceFeeRule = {
      id: "fee",
      name: "Flat",
      flatFee: 35,
      freeDeliveryMinimum: 1000,
      isActive: true
    };

    expect(calculateServiceFee(640, rule)).toBe(35);
    expect(calculateServiceFee(1200, rule)).toBe(0);
  });

  it("keeps pending-price catalog requests out of the estimate", () => {
    expect(
      calculateEstimate([
        {
          id: "pending",
          productId: "prod-pending",
          productName: "Pending product",
          unit: "kg",
          requestedQuantity: 2,
          estimatedPrice: 0
        },
        {
          id: "priced",
          productId: "prod-priced",
          productName: "Priced product",
          unit: "kg",
          requestedQuantity: 1.5,
          estimatedPrice: 40
        }
      ])
    ).toBe(60);
  });
});

describe("catalog import", () => {
  it("keeps product ids unique after CSV import", () => {
    const productIds = products.map((product) => product.id);
    expect(new Set(productIds).size).toBe(productIds.length);
  });

  it("removes duplicate product name/unit/category rows", () => {
    const duplicateKeys = products.map((product) =>
      [product.name, product.unit, product.categoryId]
        .join("|")
        .toLowerCase()
        .replace(/&/g, "and")
        .replace(/[^a-z0-9|]+/g, " ")
        .trim()
    );

    expect(new Set(duplicateKeys).size).toBe(duplicateKeys.length);
  });

  it("preserves existing curated products while adding imported products", () => {
    expect(products.some((product) => product.id === "prod-tomato" && product.price > 0)).toBe(true);
    expect(
      products.some((product) =>
        product.id === "prod-achappam" &&
        product.price > 0 &&
        product.sourceNote?.includes("Trial estimated price only")
      )
    ).toBe(true);
  });

  it("gives every catalog product a trial or verified estimate", () => {
    expect(products.every((product) => product.price > 0)).toBe(true);
  });

  it("keeps generated Supabase source keys unique", () => {
    const sourceKeys = products.map((product) => product.id);
    expect(new Set(sourceKeys).size).toBe(sourceKeys.length);
  });
});

describe("supabase catalog mapping", () => {
  it("maps product rows into the existing app product shape", () => {
    const categoryMap = new Map([["uuid-cat", "cat-vegetables"]]);

    expect(
      mapProductRow(
        {
          id: "uuid-product",
          source_key: "prod-test-tomato",
          category_id: "uuid-cat",
          name: "Test Tomato",
          unit: "kg",
          price: "42.50",
          previous_week_price: "40.00",
          price_trend: "up",
          retail_range: "Rs 40 - 45/kg",
          popularity: "popular",
          recommendation: "Trial row",
          best_value_shop: "Local market",
          source_note: "Seeded estimate",
          is_approximate_price: true,
          is_available: true
        },
        categoryMap
      )
    ).toMatchObject({
      id: "prod-test-tomato",
      categoryId: "cat-vegetables",
      name: "Test Tomato",
      price: 42.5,
      previousWeekPrice: 40,
      isApproximatePrice: true
    });
  });

  it("maps slots and service fees from Supabase row names", () => {
    expect(
      mapDeliverySlotRow({
        id: "slot-uuid",
        source_key: "slot-morning",
        label: "Morning",
        starts_at: "2026-06-09T09:00:00+05:30",
        ends_at: "2026-06-09T11:00:00+05:30",
        capacity: 8,
        reserved: 2
      })
    ).toMatchObject({
      id: "slot-morning",
      startsAt: "2026-06-09T09:00:00+05:30",
      reserved: 2
    });

    expect(
      mapServiceFeeRuleRow({
        id: "fee-uuid",
        name: "Pilot fee",
        flat_fee: "35.00",
        free_delivery_minimum: "1000.00",
        is_active: true
      })
    ).toMatchObject({
      flatFee: 35,
      freeDeliveryMinimum: 1000,
      isActive: true
    });
  });

  it("falls back to demo catalog when Supabase config is unavailable", async () => {
    const previousUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const previousKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
    delete process.env.NEXT_PUBLIC_SUPABASE_URL;
    delete process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

    const catalog = await getCatalogData();

    if (previousUrl) {
      process.env.NEXT_PUBLIC_SUPABASE_URL = previousUrl;
    } else {
      delete process.env.NEXT_PUBLIC_SUPABASE_URL;
    }

    if (previousKey) {
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY = previousKey;
    } else {
      delete process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
    }

    expect(catalog.source).toBe("demo");
    expect(catalog.products.length).toBe(products.length);
  });
});

describe("cash and payment state", () => {
  it("tracks balance due after advance cash collection", () => {
    const cash = reconcileCash(1000, 400);

    expect(cash.balanceDue).toBe(600);
    expect(cash.refundDue).toBe(0);
    expect(cash.reconciliationStatus).toBe("balance_due");
    expect(derivePaymentState(cash, 1000)).toBe("advance_paid");
  });

  it("tracks refund due when cash exceeds final payable", () => {
    const cash = reconcileCash(860, 1000);

    expect(cash.balanceDue).toBe(0);
    expect(cash.refundDue).toBe(140);
    expect(cash.reconciliationStatus).toBe("refund_due");
    expect(derivePaymentState(cash, 860)).toBe("refund_pending");
  });

  it("marks payment paid when the final payable is settled", () => {
    const cash = reconcileCash(750, 300, 450);

    expect(cash.reconciliationStatus).toBe("settled");
    expect(derivePaymentState(cash, 750)).toBe("paid");
  });
});

describe("order transitions", () => {
  it("allows the planned operational flow", () => {
    expect(canTransitionOrder("submitted", "assigned")).toBe(true);
    expect(canTransitionOrder("assigned", "confirmed")).toBe(true);
    expect(canTransitionOrder("shopping", "ready_for_delivery")).toBe(true);
  });

  it("rejects unsafe status jumps", () => {
    expect(canTransitionOrder("submitted", "delivered")).toBe(false);
    expect(canTransitionOrder("delivered", "shopping")).toBe(false);
  });
});
