"use client";

import { FormEvent, useState } from "react";
import type { Route } from "next";
import { useRouter, useSearchParams } from "next/navigation";
import { Home, MapPin } from "lucide-react";

export function CustomerOnboardingClient() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const next = searchParams.get("next") ?? "/customer";
  const [form, setForm] = useState({
    fullName: "",
    phone: "",
    houseName: "",
    addressLine: "",
    locality: "",
    landmark: ""
  });
  const [error, setError] = useState("");
  const [isSaving, setIsSaving] = useState(false);

  function updateField(field: keyof typeof form, value: string) {
    setForm((current) => ({ ...current, [field]: value }));
  }

  async function submitDetails(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError("");
    setIsSaving(true);

    try {
      const response = await fetch("/api/auth/customer-onboarding", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ ...form, next })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not save details.");
      router.replace((next.startsWith("/") ? next : "/customer") as Route);
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "Could not save customer details.");
    } finally {
      setIsSaving(false);
    }
  }

  return (
    <section className="mx-auto flex min-h-[calc(100vh-90px)] max-w-3xl items-center px-4 py-10 sm:px-6">
      <form onSubmit={submitDetails} className="w-full rounded-xl border border-ink/10 bg-white p-5 shadow-soft">
        <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Customer setup</p>
        <h1 className="mt-2 flex items-center gap-2 text-3xl font-semibold">
          <Home aria-hidden size={26} />
          Add your delivery details
        </h1>
        <p className="mt-2 text-sm leading-6 text-ink/62">
          These details are used for order delivery and WhatsApp/call confirmation.
        </p>

        <div className="mt-5 grid gap-3 sm:grid-cols-2">
          <Input label="Full name" value={form.fullName} onChange={(value) => updateField("fullName", value)} />
          <Input label="WhatsApp phone" value={form.phone} onChange={(value) => updateField("phone", value)} />
          <Input label="House name" value={form.houseName} onChange={(value) => updateField("houseName", value)} />
          <Input label="Locality" value={form.locality} onChange={(value) => updateField("locality", value)} />
          <Input label="Address" value={form.addressLine} onChange={(value) => updateField("addressLine", value)} wide />
          <Input label="Landmark (optional)" value={form.landmark} onChange={(value) => updateField("landmark", value)} wide />
        </div>

        {error ? <p className="mt-3 rounded-md bg-clay/10 px-3 py-2 text-sm font-semibold text-clay">{error}</p> : null}

        <button
          type="submit"
          disabled={isSaving}
          className="focus-ring mt-5 inline-flex w-full items-center justify-center gap-2 rounded-full bg-leaf px-4 py-3 text-sm font-semibold text-white disabled:opacity-50"
        >
          <MapPin aria-hidden size={18} />
          Save and open customer page
        </button>
      </form>
    </section>
  );
}

function Input({
  label,
  value,
  onChange,
  wide = false
}: {
  label: string;
  value: string;
  onChange: (value: string) => void;
  wide?: boolean;
}) {
  return (
    <label className={wide ? "block sm:col-span-2" : "block"}>
      <span className="text-sm font-semibold">{label}</span>
      <input
        value={value}
        onChange={(event) => onChange(event.target.value)}
        className="focus-ring mt-1.5 w-full rounded-md border border-ink/15 px-3 py-2.5"
        required={!label.includes("optional")}
      />
    </label>
  );
}
