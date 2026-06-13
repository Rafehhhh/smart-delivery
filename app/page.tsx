import Link from "next/link";
import type { Route } from "next";
import { AppShell } from "@/components/app-shell";
import { Bike, Clock3, HeartHandshake, LogIn, MapPinned, ShieldCheck, ShoppingBasket } from "lucide-react";

export default function HomePage() {
  const signInRoles: { href: Route; title: string; text: string; icon: typeof Bike }[] = [
    { href: "/auth?next=/customer", title: "Customer", text: "Create orders and track delivery.", icon: ShoppingBasket },
    { href: "/auth?next=/admin", title: "Admin", text: "Manage orders, staff, slots, and payments.", icon: ShieldCheck },
    { href: "/auth?next=/staff", title: "Staff", text: "Handle assigned orders and cash settlement.", icon: Bike }
  ];

  return (
    <AppShell
      hideNav
      headerContent={
        <Link
          href="/auth"
          className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/20 bg-white px-3 py-2 text-sm font-semibold shadow-sm hover:border-leaf/50 hover:text-leaf"
        >
          <LogIn aria-hidden size={16} />
          Sign in
        </Link>
      }
    >
      <section className="relative overflow-hidden bg-ink">
        <div
          className="absolute inset-0 bg-cover bg-center"
          style={{
            backgroundImage:
              "linear-gradient(180deg, rgba(23,32,27,0.92), rgba(23,32,27,0.76)), url('https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=1800&q=80')"
          }}
        />
        <div className="relative mx-auto flex min-h-[312px] max-w-5xl flex-col items-center justify-center px-4 py-9 text-center text-white sm:px-6 lg:min-h-[520px] lg:px-8 lg:py-16">
          <div className="flex h-14 w-14 items-center justify-center rounded-xl bg-market text-ink shadow-soft lg:h-20 lg:w-20">
            <Bike aria-hidden size={30} className="lg:h-[42px] lg:w-[42px]" />
          </div>
          <p className="mt-4 text-xs font-semibold uppercase tracking-[0.2em] text-market lg:mt-6 lg:text-sm">Welcome to</p>
          <h1 className="mt-2 text-3xl font-semibold leading-tight sm:text-5xl lg:mt-3 lg:text-6xl">Smart Delivery</h1>
          <p className="mt-3 text-lg font-semibold lg:mt-5 lg:text-2xl">Your local market, delivered smart.</p>
          <p className="mt-3 max-w-2xl text-sm leading-6 text-white/82 lg:mt-5 lg:text-base lg:leading-7">
            A simple delivery system for households to order daily essentials from nearby markets, with organized time slots, trusted staff, clear invoices, and easy payment tracking.
          </p>
        </div>
      </section>

      <section className="bg-limewash">
        <div className="mx-auto max-w-7xl px-4 py-7 sm:px-6 lg:px-8 lg:py-12">
          <div className="mx-auto max-w-3xl text-center">
            <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Sign in</p>
            <h2 className="mt-2 text-2xl font-semibold lg:mt-3 lg:text-3xl">Select your workspace</h2>
          </div>

          <div className="mx-auto mt-5 grid max-w-md grid-cols-3 gap-3 lg:mt-8 lg:max-w-none lg:gap-4">
            {signInRoles.map((role) => (
              <Link
                key={role.href}
                href={role.href}
                className="focus-ring flex flex-col items-center rounded-2xl border border-ink/20 bg-white p-3 text-center shadow-sm transition hover:-translate-y-0.5 hover:border-leaf/40 hover:shadow-soft lg:rounded-md lg:p-5"
              >
                <span className="flex h-14 w-14 items-center justify-center rounded-full border border-leaf/20 bg-mint text-leaf lg:h-12 lg:w-12 lg:rounded-md">
                  <role.icon aria-hidden size={23} />
                </span>
                <span className="mt-2 block text-sm font-semibold lg:mt-5 lg:text-lg">{role.title}</span>
                <span className="mt-2 hidden text-sm leading-6 text-ink/62 lg:block">{role.text}</span>
              </Link>
            ))}
          </div>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-4 py-7 sm:px-6 lg:px-8 lg:py-12">
        <div className="mx-auto max-w-3xl text-center">
          <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">About us</p>
          <h2 className="mt-2 text-2xl font-semibold lg:mt-3 lg:text-3xl">Built for nearby homes and markets</h2>
          <p className="mt-3 text-sm leading-6 text-ink/66 lg:mt-4 lg:text-base lg:leading-7">
            Smart Delivery helps local households order daily essentials from nearby shops with clear prices, time slots, staff updates, and simple settlement.
          </p>
        </div>

        <div className="mt-6 grid gap-2 sm:grid-cols-2 lg:mt-10 lg:grid-cols-4 lg:gap-4">
          {[
            { title: "Local-first service", text: "Designed for one locality first, then expandable area by area.", icon: MapPinned },
            { title: "Everyday essentials", text: "Rice, vegetables, fruits, food items, and household products.", icon: ShoppingBasket },
            { title: "Organized slots", text: "Orders are arranged by available time slots and delivery capacity.", icon: Clock3 },
            { title: "Trusted operations", text: "Admin, customer, and staff pages keep responsibilities clear.", icon: HeartHandshake }
          ].map((item) => (
            <article key={item.title} className="flex gap-3 rounded-2xl border border-ink/20 bg-white p-3 shadow-sm lg:block lg:rounded-md lg:p-5">
              <item.icon aria-hidden className="shrink-0 text-leaf" size={22} />
              <div>
                <h3 className="font-semibold lg:mt-4">{item.title}</h3>
                <p className="mt-1 text-xs leading-5 text-ink/62 lg:mt-2 lg:text-sm lg:leading-6">{item.text}</p>
              </div>
            </article>
          ))}
        </div>
      </section>
    </AppShell>
  );
}
