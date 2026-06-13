"use client";

import { FormEvent, useState } from "react";
import type { Route } from "next";
import { useRouter, useSearchParams } from "next/navigation";
import { Home, LocateFixed, MapPin } from "lucide-react";

type LocationState = {
  latitude: number;
  longitude: number;
};

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
  const [location, setLocation] = useState<LocationState | null>(null);
  const [locationStatus, setLocationStatus] = useState("");
  const [isSaving, setIsSaving] = useState(false);

  function updateField(field: keyof typeof form, value: string) {
    setForm((current) => ({ ...current, [field]: value }));
  }

  function useCurrentLocation() {
    setError("");
    setLocationStatus("");
    if (!navigator.geolocation) {
      setError("Location is not supported on this device.");
      return;
    }
    setLocationStatus("Getting your location...");
    navigator.geolocation.getCurrentPosition(
      (position) => {
        const nextLocation = {
          latitude: position.coords.latitude,
          longitude: position.coords.longitude
        };
        setLocation(nextLocation);
        setLocationStatus("Location added. You can open it in Google Maps.");
        setForm((current) => ({
          ...current,
          landmark: current.landmark || `GPS: ${nextLocation.latitude.toFixed(5)}, ${nextLocation.longitude.toFixed(5)}`
        }));
      },
      () => setError("Could not get location. Please allow location access or type the address.")
    );
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
    <section className="mx-auto flex min-h-[calc(100vh-90px)] max-w-3xl items-center px-4 py-6 sm:px-6 lg:py-10">
      <form onSubmit={submitDetails} className="w-full rounded-3xl border border-ink/25 bg-white p-4 shadow-soft lg:rounded-xl lg:border-ink/10 lg:p-5">
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

        <div className="mt-3 rounded-2xl border border-ink/25 bg-limewash p-3 lg:rounded-xl lg:border-ink/10">
          <button
            type="button"
            onClick={useCurrentLocation}
            className="focus-ring inline-flex w-full items-center justify-center gap-2 rounded-full border border-ink/25 bg-white px-4 py-2.5 text-sm font-semibold text-ink"
          >
            <LocateFixed aria-hidden size={17} />
            Use my location
          </button>
          {locationStatus ? <p className="mt-2 text-xs font-semibold text-leaf">{locationStatus}</p> : null}
          {location ? (
            <a
              href={`https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}`}
              target="_blank"
              rel="noreferrer"
              className="focus-ring mt-2 inline-flex w-full items-center justify-center rounded-full border border-ink/25 bg-white px-4 py-2 text-xs font-semibold text-ink"
            >
              Open in Google Maps
            </a>
          ) : null}
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
        className="focus-ring mt-1.5 w-full rounded-2xl border border-ink/25 px-3 py-2.5 lg:rounded-md lg:border-ink/15"
        required={!label.includes("optional")}
      />
    </label>
  );
}
