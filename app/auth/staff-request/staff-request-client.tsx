"use client";

import { FormEvent, useState } from "react";
import { useRouter } from "next/navigation";
import { Bike, Send } from "lucide-react";

export function StaffRequestClient() {
  const router = useRouter();
  const [form, setForm] = useState({
    fullName: "",
    phone: "",
    routeArea: "Koyilandy local route",
    vehicle: "",
    note: ""
  });
  const [error, setError] = useState("");
  const [isSaving, setIsSaving] = useState(false);

  function updateField(field: keyof typeof form, value: string) {
    setForm((current) => ({ ...current, [field]: value }));
  }

  async function submitRequest(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError("");
    setIsSaving(true);

    try {
      const response = await fetch("/api/auth/staff-request", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form)
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not submit staff request.");
      router.replace("/auth/staff-pending");
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "Could not submit staff request.");
    } finally {
      setIsSaving(false);
    }
  }

  return (
    <section className="mx-auto flex min-h-[calc(100vh-90px)] max-w-3xl items-center px-4 py-10 sm:px-6">
      <form onSubmit={submitRequest} className="w-full rounded-xl border border-ink/10 bg-white p-5 shadow-soft">
        <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Staff access</p>
        <h1 className="mt-2 flex items-center gap-2 text-3xl font-semibold">
          <Bike aria-hidden size={26} />
          Request delivery staff approval
        </h1>
        <p className="mt-2 text-sm leading-6 text-ink/62">
          Admin will review your details before the staff workspace is unlocked.
        </p>

        <div className="mt-5 grid gap-3 sm:grid-cols-2">
          <Input label="Full name" value={form.fullName} onChange={(value) => updateField("fullName", value)} />
          <Input label="Phone" value={form.phone} onChange={(value) => updateField("phone", value)} />
          <Input label="Route area" value={form.routeArea} onChange={(value) => updateField("routeArea", value)} />
          <Input label="Vehicle" value={form.vehicle} onChange={(value) => updateField("vehicle", value)} />
          <label className="block sm:col-span-2">
            <span className="text-sm font-semibold">Note for admin (optional)</span>
            <textarea
              value={form.note}
              onChange={(event) => updateField("note", event.target.value)}
              rows={3}
              className="focus-ring mt-1.5 w-full resize-none rounded-md border border-ink/15 px-3 py-2.5"
            />
          </label>
        </div>

        {error ? <p className="mt-3 rounded-md bg-clay/10 px-3 py-2 text-sm font-semibold text-clay">{error}</p> : null}

        <button
          type="submit"
          disabled={isSaving}
          className="focus-ring mt-5 inline-flex w-full items-center justify-center gap-2 rounded-full bg-leaf px-4 py-3 text-sm font-semibold text-white disabled:opacity-50"
        >
          <Send aria-hidden size={18} />
          Submit staff request
        </button>
      </form>
    </section>
  );
}

function Input({ label, value, onChange }: { label: string; value: string; onChange: (value: string) => void }) {
  return (
    <label className="block">
      <span className="text-sm font-semibold">{label}</span>
      <input
        value={value}
        onChange={(event) => onChange(event.target.value)}
        className="focus-ring mt-1.5 w-full rounded-md border border-ink/15 px-3 py-2.5"
        required
      />
    </label>
  );
}
