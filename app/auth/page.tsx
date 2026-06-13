import { Suspense } from "react";
import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { AuthPageClient } from "./auth-page-client";
import { Home } from "lucide-react";

export default function AuthPage() {
  return (
    <AppShell
      hideNav
      headerContent={
        <Link
          href="/"
          aria-label="Home"
          className="focus-ring inline-flex h-10 w-10 items-center justify-center rounded-full border border-ink/25 bg-white text-ink shadow-sm lg:border-ink/10 lg:shadow-none"
        >
          <Home aria-hidden size={17} />
        </Link>
      }
    >
      <Suspense fallback={<div className="mx-auto max-w-3xl px-4 py-16">Loading sign in...</div>}>
        <AuthPageClient />
      </Suspense>
    </AppShell>
  );
}
