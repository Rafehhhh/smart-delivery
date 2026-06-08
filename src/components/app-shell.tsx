import Link from "next/link";
import type { Route } from "next";
import { Bike, Home, UserRoundCheck } from "lucide-react";

const navItems: { href: Route; label: string; icon: typeof Home }[] = [
  { href: "/", label: "Home", icon: Home },
  { href: "/auth", label: "Sign in", icon: UserRoundCheck }
];

export function AppShell({
  children,
  hideNav = false,
  headerContent
}: {
  children: React.ReactNode;
  hideNav?: boolean;
  headerContent?: React.ReactNode;
}) {
  return (
    <div className="min-h-screen bg-cloud text-ink">
      <header className="sticky top-0 z-20 border-b border-ink/10 bg-cloud">
        <div className="mx-auto flex max-w-7xl flex-wrap items-center justify-between gap-3 px-4 py-3 sm:px-6 lg:px-8">
          <Link href="/" className="flex items-center gap-3 font-semibold">
            <span className="flex h-10 w-10 items-center justify-center rounded-md bg-leaf text-white">
              <Bike aria-hidden size={21} />
            </span>
            <span>Smart Delivery</span>
          </Link>
          {headerContent ? <div className="ml-auto flex items-center gap-2">{headerContent}</div> : null}
          {!hideNav && !headerContent ? <nav className="hidden items-center gap-1 md:flex">
            {navItems.map((item) => (
              <Link
                key={item.href}
                href={item.href}
                className="focus-ring inline-flex items-center gap-2 rounded-md px-3 py-2 text-sm font-medium text-ink/72 hover:bg-white hover:text-ink"
              >
                <item.icon aria-hidden size={16} />
                {item.label}
              </Link>
            ))}
          </nav> : null}
        </div>
        {!hideNav && !headerContent ? <nav className="grid grid-cols-2 border-t border-ink/10 bg-white md:hidden">
          {navItems.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className="focus-ring flex flex-col items-center gap-1 px-2 py-2 text-[11px] font-medium text-ink/72"
            >
              <item.icon aria-hidden size={16} />
              {item.label}
            </Link>
          ))}
        </nav> : null}
      </header>
      <main>{children}</main>
    </div>
  );
}
