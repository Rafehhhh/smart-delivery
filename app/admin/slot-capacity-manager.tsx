"use client";

import { useState } from "react";
import { slots as seedSlots } from "@/lib/demo-data";
import { isSlotAvailable, remainingSlotCapacity } from "@/lib/calculations";
import type { DeliverySlot } from "@/lib/types";
import { Check, Pencil, Plus, Trash2, X } from "lucide-react";

export function SlotCapacityManager() {
  const [managedSlots, setManagedSlots] = useState<DeliverySlot[]>(seedSlots);
  const [label, setLabel] = useState("Tomorrow, 9:00 AM - 11:00 AM");
  const [capacity, setCapacity] = useState(8);
  const [editingSlotId, setEditingSlotId] = useState<string | null>(null);
  const [editLabel, setEditLabel] = useState("");
  const [editCapacity, setEditCapacity] = useState(1);

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

  function startEdit(slot: DeliverySlot) {
    setEditingSlotId(slot.id);
    setEditLabel(slot.label);
    setEditCapacity(slot.capacity);
  }

  function saveSlot(slotId: string) {
    const cleanLabel = editLabel.trim();
    if (!cleanLabel || editCapacity < 1) return;

    setManagedSlots((current) =>
      current.map((slot) =>
        slot.id === slotId
          ? {
              ...slot,
              label: cleanLabel,
              capacity: Math.max(editCapacity, slot.reserved)
            }
          : slot
      )
    );
    setEditingSlotId(null);
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
            {editingSlotId === slot.id ? (
              <div className="grid gap-1.5 sm:grid-cols-[1fr_88px_auto]">
                <input
                  value={editLabel}
                  onChange={(event) => setEditLabel(event.target.value)}
                  className="focus-ring rounded-lg border border-ink/15 px-2 py-1.5 text-sm"
                  aria-label={`Edit ${slot.label} label`}
                />
                <input
                  type="number"
                  min={slot.reserved}
                  value={editCapacity}
                  onChange={(event) => setEditCapacity(Number(event.target.value))}
                  className="focus-ring rounded-lg border border-ink/15 px-2 py-1.5 text-sm"
                  aria-label={`Edit ${slot.label} capacity`}
                />
                <div className="flex gap-1">
                  <button
                    type="button"
                    onClick={() => saveSlot(slot.id)}
                    className="focus-ring inline-flex h-8 w-8 items-center justify-center rounded-full bg-leaf text-white"
                    aria-label={`Save ${slot.label}`}
                  >
                    <Check aria-hidden size={15} />
                  </button>
                  <button
                    type="button"
                    onClick={() => setEditingSlotId(null)}
                    className="focus-ring inline-flex h-8 w-8 items-center justify-center rounded-full border border-ink/15"
                    aria-label="Cancel slot edit"
                  >
                    <X aria-hidden size={15} />
                  </button>
                </div>
              </div>
            ) : (
              <div className="flex items-start justify-between gap-2">
                <div className="min-w-0">
                  <p className="font-semibold">{slot.label}</p>
                  <p className="mt-0.5 text-xs text-ink/56">
                    {slot.reserved} of {slot.capacity} reserved - {remainingSlotCapacity(slot)} left
                  </p>
                </div>
                <div className="flex shrink-0 gap-1">
                  <button
                    type="button"
                    onClick={() => startEdit(slot)}
                    className="focus-ring inline-flex h-7 w-7 items-center justify-center rounded-full border border-ink/15 text-leaf"
                    aria-label={`Edit ${slot.label}`}
                  >
                    <Pencil aria-hidden size={15} />
                  </button>
                  <button
                    type="button"
                    onClick={() => setManagedSlots((current) => current.filter((entry) => entry.id !== slot.id))}
                    className="focus-ring inline-flex h-7 w-7 items-center justify-center rounded-full border border-ink/15 text-clay"
                    aria-label={`Delete ${slot.label}`}
                  >
                    <Trash2 aria-hidden size={16} />
                  </button>
                </div>
              </div>
            )}
            {editingSlotId === slot.id ? (
              <p className="mt-1 text-xs text-ink/56">
                {slot.reserved} already reserved. Capacity cannot be saved below reserved count.
              </p>
            ) : null}
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
