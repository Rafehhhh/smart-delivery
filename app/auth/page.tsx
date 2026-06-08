import Link from "next/link";
import type { Route } from "next";
import { AppShell } from "@/components/app-shell";
import { Bike, ShieldCheck, ShoppingBasket, Smartphone } from "lucide-react";

export default function AuthPage() {
  const roleDestinations: { href: Route; title: string; text: string; icon: typeof Bike }[] = [
    { href: "/customer", title: "Customer", text: "Browse products, choose slots, and track purchase orders.", icon: ShoppingBasket },
    { href: "/admin", title: "Admin", text: "Control catalog, orders, staff assignment, payments, and reports.", icon: ShieldCheck },
    { href: "/staff", title: "Staff", text: "View assigned deliveries, contact customers, finalize invoices, and record cash.", icon: Bike }
  ];

  return (
    <AppShell>
      <section className="mx-auto grid min-h-[calc(100vh-90px)] max-w-7xl items-center gap-8 px-4 py-10 sm:px-6 lg:grid-cols-[1fr_430px] lg:px-8">
        <div>
          <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Phone OTP</p>
          <h1 className="mt-3 text-4xl font-semibold leading-tight sm:text-5xl">Sign in with your mobile number</h1>
          <p className="mt-5 max-w-xl text-ink/66">
            Customer, admin, and staff access is controlled by the profile role attached to the verified phone number.
          </p>
          <div className="mt-8 grid max-w-2xl gap-3">
            {roleDestinations.map((role) => (
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

        <form className="rounded-md border border-ink/10 bg-white p-5 shadow-soft">
          <label className="text-sm font-semibold" htmlFor="phone">
            Mobile number
          </label>
          <input
            id="phone"
            name="phone"
            type="tel"
            placeholder="+91 98765 43210"
            className="focus-ring mt-2 w-full rounded-md border border-ink/15 px-3 py-3"
          />
          <button
            type="button"
            className="focus-ring mt-4 inline-flex w-full items-center justify-center gap-2 rounded-md bg-leaf px-4 py-3 text-sm font-semibold text-white"
          >
            <Smartphone aria-hidden size={18} />
            Send OTP
          </button>
          <p className="mt-4 text-sm text-ink/58">
            Supabase phone auth activates when `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` are configured.
          </p>
        </form>
      </section>
    </AppShell>
  );
}
