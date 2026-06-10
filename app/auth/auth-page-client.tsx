"use client";

import { FormEvent, useState } from "react";
import Link from "next/link";
import type { Route } from "next";
import { useRouter, useSearchParams } from "next/navigation";
import { Bike, ShieldCheck, ShoppingBasket, Smartphone } from "lucide-react";
import { createSupabaseBrowserClient } from "@/lib/supabase/client";

type AuthStep = "phone" | "otp";

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

  return (
    <section className="mx-auto grid min-h-[calc(100vh-90px)] max-w-7xl items-center gap-8 px-4 py-10 sm:px-6 lg:grid-cols-[1fr_430px] lg:px-8">
      <div>
        <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Phone OTP</p>
        <h1 className="mt-3 text-4xl font-semibold leading-tight sm:text-5xl">Sign in with your mobile number</h1>
        <p className="mt-5 max-w-xl text-ink/66">
          Verify your phone once, then Smart Delivery opens the correct customer, staff, or admin workspace based on your profile role.
        </p>
        <div className="mt-8 grid max-w-2xl gap-3">
          {([
            { href: "/auth?next=/customer", title: "Customer", text: "Order daily products and manage delivery details.", icon: ShoppingBasket },
            { href: "/auth?next=/staff", title: "Staff", text: "Request staff access or open approved delivery work.", icon: Bike },
            { href: "/auth?next=/admin", title: "Admin", text: "Open the supervisor dashboard if your number is admin-approved.", icon: ShieldCheck }
          ] satisfies { href: Route; title: string; text: string; icon: typeof Bike }[]).map((role) => (
            <Link
              key={role.href}
              href={role.href}
              className="focus-ring flex items-center gap-4 rounded-md border border-ink/10 bg-white p-4 shadow-sm hover:border-leaf/40 hover:bg-limewash"
            >
              <span className="flex h-12 w-12 items-center justify-center rounded-md bg-mint text-leaf">
                <role.icon aria-hidden size={23} />
              </span>
              <span>
                <span className="block font-semibold">{role.title}</span>
                <span className="mt-1 block text-sm leading-6 text-ink/62">{role.text}</span>
              </span>
            </Link>
          ))}
        </div>
      </div>

      <form onSubmit={step === "phone" ? submitPhone : submitOtp} className="rounded-md border border-ink/10 bg-white p-5 shadow-soft">
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
          className="focus-ring mt-2 w-full rounded-md border border-ink/15 px-3 py-3 disabled:bg-limewash"
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
              className="focus-ring mt-2 w-full rounded-md border border-ink/15 px-3 py-3"
            />
          </>
        ) : null}

        {error ? <p className="mt-3 rounded-md bg-clay/10 px-3 py-2 text-sm font-semibold text-clay">{error}</p> : null}
        {status ? <p className="mt-3 rounded-md bg-mint px-3 py-2 text-sm font-semibold text-leaf">{status}</p> : null}

        <button
          type="submit"
          disabled={isSubmitting || !phone.trim() || (step === "otp" && !otp.trim())}
          className="focus-ring mt-4 inline-flex w-full items-center justify-center gap-2 rounded-md bg-leaf px-4 py-3 text-sm font-semibold text-white disabled:opacity-50"
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
            className="focus-ring mt-3 inline-flex w-full items-center justify-center rounded-md border border-ink/15 px-4 py-2 text-sm font-semibold"
          >
            Change number
          </button>
        ) : null}
      </form>
    </section>
  );
}
