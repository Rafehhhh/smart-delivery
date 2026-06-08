import { describe, expect, it } from "vitest";
import {
  calculateEstimate,
  calculateFinalItemsTotal,
  calculateServiceFee,
  canTransitionOrder,
  derivePaymentState,
  isSlotAvailable,
  reconcileCash,
  remainingSlotCapacity
} from "./calculations";
import { products } from "./demo-data";
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
