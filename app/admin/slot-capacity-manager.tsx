"use client";

import { useState } from "react";
import { slots as seedSlots } from "@/lib/demo-data";
import { isSlotAvailable, remainingSlotCapacity } from "@/lib/calculations";
import type { DeliverySlot } from "@/lib/types";
import { Plus, Trash2 } from "lucide-react";

export function SlotCapacityManager() {
  const [managedSlots, setManagedSlots] = useState<DeliverySlot[]>(seedSlots);
  const [label, setLabel] = useState("Tomorrow, 9:00 AM - 11:00 AM");
  const [capacity, setCapacity] = useState(8);

  function addSlot() {
    const cleanLabel = label.trim();
    if (!cleanLabel || capacity < 1) return;

    setManagedSlots((current) => [
      ...current,
      {
        id: `slot-${Date.now()}`,
        label: cleanLabel,
        startsAt: "2026-06-04T09:00:00+05:30",
        endsAt: "2026-06-04T11:00:00+05:30",
        capacity,
        reserved: 0
      }
    ]);
    setLabel("");
    setCapacity(8);
  }

  return (
    <section id="slots" className="scroll-mt-20 rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm">
      <h2 className="flex items-center gap-1.5 text-base font-semibold sm:text-lg">Slot management</h2>
      <p className="mt-0.5 text-sm text-ink/58">Add or delete delivery slot timing and capacity.</p>

      <div className="mt-2 grid gap-1.5 sm:grid-cols-[1fr_110px]">
        <input
          value={label}
          onChange={(event) => setLabel(event.target.value)}
          className="focus-ring rounded-lg border border-ink/15 px-2.5 py-1.5 text-sm"
          aria-label="Slot label"
        />
        <input
          type="number"
          min={1}
          value={capacity}
          onChange={(event) => setCapacity(Number(event.target.value))}
          className="focus-ring rounded-lg border border-ink/15 px-2.5 py-1.5 text-sm"
          aria-label="Slot capacity"
        />
      </div>

      <button
        type="button"
        onClick={addSlot}
        className="focus-ring mt-1.5 inline-flex w-full items-center justify-center gap-1.5 rounded-full bg-leaf px-3 py-1.5 text-sm font-semibold text-white"
      >
        <Plus aria-hidden size={16} />
        Add slot
      </button>

      <div className="mt-2 space-y-1.5">
        {managedSlots.map((slot) => (
          <div key={slot.id} className="rounded-lg border border-ink/10 p-2.5">
            <div className="flex items-start justify-between gap-2">
              <div className="min-w-0">
                <p className="font-semibold">{slot.label}</p>
                <p className="mt-0.5 text-xs text-ink/56">
                  {slot.reserved} of {slot.capacity} reserved - {remainingSlotCapacity(slot)} left
                </p>
              </div>
              <button
                type="button"
                onClick={() => setManagedSlots((current) => current.filter((entry) => entry.id !== slot.id))}
                className="focus-ring inline-flex h-7 w-7 shrink-0 items-center justify-center rounded-full border border-ink/15 text-clay"
                aria-label={`Delete ${slot.label}`}
              >
                <Trash2 aria-hidden size={16} />
              </button>
            </div>
            <div className="mt-2 h-1.5 rounded-full bg-ink/10">
              <div
                className={isSlotAvailable(slot) ? "h-1.5 rounded-full bg-leaf" : "h-1.5 rounded-full bg-clay"}
                style={{ width: `${Math.min((slot.reserved / slot.capacity) * 100, 100)}%` }}
              />
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
