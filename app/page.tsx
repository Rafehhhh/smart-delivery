import Link from "next/link";
import type { Route } from "next";
import { AppShell } from "@/components/app-shell";
import { Bike, Clock3, HeartHandshake, MapPinned, ShieldCheck, ShoppingBasket } from "lucide-react";

export default function HomePage() {
  const signInRoles: { href: Route; title: string; text: string; icon: typeof Bike }[] = [
    { href: "/customer", title: "Customer", text: "Create orders and track delivery.", icon: ShoppingBasket },
    { href: "/admin", title: "Admin", text: "Manage orders, staff, slots, and payments.", icon: ShieldCheck },
    { href: "/staff", title: "Staff", text: "Handle assigned orders and cash settlement.", icon: Bike }
  ];

  return (
    <AppShell>
      <section className="relative overflow-hidden bg-ink">
        <div
          className="absolute inset-0 bg-cover bg-center"
          style={{
            backgroundImage:
              "linear-gradient(180deg, rgba(23,32,27,0.92), rgba(23,32,27,0.76)), url('https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=1800&q=80')"
          }}
        />
        <div className="relative mx-auto flex min-h-[520px] max-w-5xl flex-col items-center justify-center px-4 py-16 text-center text-white sm:px-6 lg:px-8">
          <div className="flex h-20 w-20 items-center justify-center rounded-md bg-market text-ink shadow-soft">
            <Bike aria-hidden size={42} />
          </div>
          <p className="mt-6 text-sm font-semibold uppercase tracking-[0.2em] text-market">Welcome to</p>
          <h1 className="mt-3 text-4xl font-semibold leading-tight sm:text-5xl lg:text-6xl">Smart Delivery</h1>
          <p className="mt-5 text-2xl font-semibold">Your local market, delivered smart.</p>
          <p className="mt-5 max-w-2xl text-base leading-7 text-white/82">
            A simple delivery system for households to order daily essentials from nearby markets, with organized time slots, trusted staff, clear invoices, and easy payment tracking.
          </p>
        </div>
      </section>

      <section className="bg-limewash">
        <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
          <div className="mx-auto max-w-3xl text-center">
            <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Sign in</p>
            <h2 className="mt-3 text-3xl font-semibold">Choose your Smart Delivery workspace</h2>
            <p className="mt-3 text-ink/62">
              Customers, admins, and delivery staff each continue to a dedicated page with the activities they need.
            </p>
          </div>

          <div className="mt-8 grid gap-4 md:grid-cols-3">
            {signInRoles.map((role) => (
              <Link
                key={role.href}
                href={role.href}
                className="focus-ring rounded-md border border-ink/10 bg-white p-5 shadow-sm transition hover:-translate-y-0.5 hover:border-leaf/40 hover:shadow-soft"
              >
                <span className="flex h-12 w-12 items-center justify-center rounded-md bg-mint text-leaf">
                  <role.icon aria-hidden size={23} />
                </span>
                <span className="mt-5 block text-lg font-semibold">{role.title}</span>
                <span className="mt-2 block text-sm leading-6 text-ink/62">{role.text}</span>
              </Link>
            ))}
          </div>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
        <div className="mx-auto max-w-3xl text-center">
          <p className="text-sm font-semibold uppercase tracking-[0.14em] text-leaf">About us</p>
          <h2 className="mt-3 text-3xl font-semibold">Built for local households and local markets</h2>
          <p className="mt-4 leading-7 text-ink/66">
            Smart Delivery connects nearby homeowners with trusted delivery staff who purchase daily essentials from the local area and deliver them at scheduled times. The system keeps every order clear from request to final invoice, including approximate market prices, staff updates, and cash or future online payment records.
          </p>
          <p className="mt-4 leading-7 text-ink/66">
            The first launch is focused on the local community, where reliability, direct communication, and simple settlement matter more than complicated shopping screens.
          </p>
        </div>

        <div className="mt-10 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
          {[
            { title: "Local-first service", text: "Designed for one locality first, then expandable area by area.", icon: MapPinned },
            { title: "Everyday essentials", text: "Rice, vegetables, fruits, food items, and household products.", icon: ShoppingBasket },
            { title: "Organized slots", text: "Orders are arranged by available time slots and delivery capacity.", icon: Clock3 },
            { title: "Trusted operations", text: "Admin, customer, and staff pages keep responsibilities clear.", icon: HeartHandshake }
          ].map((item) => (
            <article key={item.title} className="rounded-md border border-ink/10 bg-white p-5 shadow-sm">
              <item.icon aria-hidden className="text-leaf" size={24} />
              <h3 className="mt-4 font-semibold">{item.title}</h3>
              <p className="mt-2 text-sm leading-6 text-ink/62">{item.text}</p>
            </article>
          ))}
        </div>
      </section>
    </AppShell>
  );
}
