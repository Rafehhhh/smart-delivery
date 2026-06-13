"use client";

import { FormEvent, useState } from "react";
import type { Route } from "next";
import { useRouter, useSearchParams } from "next/navigation";
import { Smartphone } from "lucide-react";
import { createSupabaseBrowserClient } from "@/lib/supabase/client";

type AuthStep = "phone" | "otp";
type TestLoginOption = {
  label: string;
  role: "customer" | "admin" | "staff";
  staffStatus?: "approved" | "pending";
  destination: Route;
};

const isTestLoginEnabled = process.env.NEXT_PUBLIC_ENABLE_TEST_LOGIN === "true";
const testLoginOptions: TestLoginOption[] = [
  { label: "Test as Customer", role: "customer", destination: "/customer" },
  { label: "Test as Admin", role: "admin", destination: "/admin" },
  { label: "Test as Staff", role: "staff", staffStatus: "approved", destination: "/staff" },
  { label: "Test as Staff pending", role: "staff", staffStatus: "pending", destination: "/auth/staff-pending" }
];

export function AuthPageClient() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const next = searchParams.get("next") ?? "/customer";
  const [step, setStep] = useState<AuthStep>("phone");
  const [phone, setPhone] = useState("");
  const [otp, setOtp] = useState("");
  const [status, setStatus] = useState("");
  const [error, setError] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);

  async function resolveDestination() {
    const response = await fetch(`/api/auth/resolve?next=${encodeURIComponent(next)}`);
    const payload = await response.json();
    router.replace((payload.redirectTo ?? "/customer") as Route);
  }

  async function submitPhone(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError("");
    setStatus("");
    setIsSubmitting(true);

    try {
      const supabase = createSupabaseBrowserClient();
      const result = await supabase.auth.signInWithOtp({
        phone,
        options: {
          shouldCreateUser: true
        }
      });
      if (result.error) throw result.error;
      setStep("otp");
      setStatus("OTP sent. Enter the code from SMS to continue.");
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "Could not send OTP.");
    } finally {
      setIsSubmitting(false);
    }
  }

  async function submitOtp(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setError("");
    setStatus("");
    setIsSubmitting(true);

    try {
      const supabase = createSupabaseBrowserClient();
      const result = await supabase.auth.verifyOtp({
        phone,
        token: otp,
        type: "sms"
      });
      if (result.error) throw result.error;
      setStatus("Signed in. Opening your workspace...");
      await resolveDestination();
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "Could not verify OTP.");
    } finally {
      setIsSubmitting(false);
    }
  }

  async function submitTestLogin(option: TestLoginOption) {
    setError("");
    setStatus("");
    setIsSubmitting(true);

    try {
      const response = await fetch("/api/auth/test-login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          role: option.role,
          staffStatus: option.staffStatus
        })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Test login failed.");
      router.replace(option.destination);
    } catch (caught) {
      setError(caught instanceof Error ? caught.message : "Test login failed.");
    } finally {
      setIsSubmitting(false);
    }
  }

  return (
    <section className="mx-auto grid min-h-[calc(100vh-90px)] max-w-7xl items-center gap-8 px-4 py-6 sm:px-6 lg:grid-cols-[1fr_430px] lg:px-8 lg:py-10">
      <div>
        <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Phone OTP</p>
        <h1 className="mt-3 text-3xl font-semibold leading-tight sm:text-5xl">Sign in with your mobile number</h1>
        <p className="mt-4 max-w-xl text-sm leading-6 text-ink/66 lg:mt-5 lg:text-base">
          Verify your phone once, then Smart Delivery opens the correct customer, staff, or admin workspace based on your profile role.
        </p>
      </div>

      <form onSubmit={step === "phone" ? submitPhone : submitOtp} className="rounded-3xl border border-ink/25 bg-white p-4 shadow-soft lg:rounded-md lg:border-ink/10 lg:p-5">
        <label className="text-sm font-semibold" htmlFor="phone">
          Mobile number
        </label>
        <input
          id="phone"
          name="phone"
          type="tel"
          value={phone}
          onChange={(event) => setPhone(event.target.value)}
          placeholder="+91 98765 43210"
          disabled={step === "otp"}
          className="focus-ring mt-2 w-full rounded-2xl border border-ink/25 px-3 py-3 disabled:bg-limewash lg:rounded-md lg:border-ink/15"
        />

        {step === "otp" ? (
          <>
            <label className="mt-4 block text-sm font-semibold" htmlFor="otp">
              OTP code
            </label>
            <input
              id="otp"
              name="otp"
              inputMode="numeric"
              value={otp}
              onChange={(event) => setOtp(event.target.value)}
              placeholder="123456"
              className="focus-ring mt-2 w-full rounded-2xl border border-ink/25 px-3 py-3 lg:rounded-md lg:border-ink/15"
            />
          </>
        ) : null}

        {error ? <p className="mt-3 rounded-2xl border border-clay/25 bg-clay/10 px-3 py-2 text-sm font-semibold text-clay lg:rounded-md">{error}</p> : null}
        {status ? <p className="mt-3 rounded-2xl border border-leaf/20 bg-mint px-3 py-2 text-sm font-semibold text-leaf lg:rounded-md">{status}</p> : null}

        <button
          type="submit"
          disabled={isSubmitting || !phone.trim() || (step === "otp" && !otp.trim())}
          className="focus-ring mt-4 inline-flex w-full items-center justify-center gap-2 rounded-full bg-leaf px-4 py-3 text-sm font-semibold text-white disabled:opacity-50 lg:rounded-md"
        >
          <Smartphone aria-hidden size={18} />
          {step === "phone" ? "Send OTP" : "Verify and continue"}
        </button>

        {step === "otp" ? (
          <button
            type="button"
            onClick={() => {
              setStep("phone");
              setOtp("");
              setStatus("");
              setError("");
            }}
            className="focus-ring mt-3 inline-flex w-full items-center justify-center rounded-full border border-ink/25 px-4 py-2 text-sm font-semibold lg:rounded-md lg:border-ink/15"
          >
            Change number
          </button>
        ) : null}

        {isTestLoginEnabled ? (
          <div className="mt-5 rounded-3xl border border-dashed border-ink/25 bg-limewash p-3 shadow-sm lg:rounded-xl">
            <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Testing access</p>
            <p className="mt-1 text-xs leading-5 text-ink/58">
              Use these preview-only buttons until Twilio phone OTP is configured.
            </p>
            <div className="mt-3 grid gap-2 sm:grid-cols-2">
              {testLoginOptions.map((option) => (
                <button
                  key={option.label}
                  type="button"
                  disabled={isSubmitting}
                  onClick={() => submitTestLogin(option)}
                  className="focus-ring inline-flex items-center justify-center rounded-full border border-ink/25 bg-white px-3 py-2 text-xs font-semibold hover:border-leaf/40 hover:text-leaf disabled:opacity-50 lg:border-ink/15"
                >
                  {option.label}
                </button>
              ))}
            </div>
          </div>
        ) : null}
      </form>
    </section>
  );
}
