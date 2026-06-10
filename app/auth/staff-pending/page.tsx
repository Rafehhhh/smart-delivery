import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { Clock3, Home } from "lucide-react";

export default function StaffPendingPage() {
  return (
    <AppShell hideNav>
      <section className="mx-auto flex min-h-[calc(100vh-90px)] max-w-2xl items-center px-4 py-10 sm:px-6">
        <div className="w-full rounded-xl border border-ink/10 bg-white p-6 text-center shadow-soft">
          <Clock3 aria-hidden className="mx-auto text-leaf" size={42} />
          <p className="mt-5 text-sm font-semibold uppercase tracking-[0.14em] text-leaf">Waiting for approval</p>
          <h1 className="mt-2 text-3xl font-semibold">Your staff request is pending</h1>
          <p className="mx-auto mt-3 max-w-lg text-sm leading-6 text-ink/62">
            Admin must approve your delivery staff access before the staff workspace opens. You can continue using the customer workspace while waiting.
          </p>
          <div className="mt-6 flex flex-wrap justify-center gap-2">
            <Link href="/customer" className="focus-ring inline-flex items-center justify-center rounded-full bg-leaf px-4 py-2.5 text-sm font-semibold text-white">
              Open customer page
            </Link>
            <Link href="/" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/15 px-4 py-2.5 text-sm font-semibold">
              <Home aria-hidden size={16} />
              Home
            </Link>
          </div>
        </div>
      </section>
    </AppShell>
  );
}
