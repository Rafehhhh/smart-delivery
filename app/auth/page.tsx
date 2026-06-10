import { Suspense } from "react";
import { AppShell } from "@/components/app-shell";
import { AuthPageClient } from "./auth-page-client";

export default function AuthPage() {
  return (
    <AppShell>
      <Suspense fallback={<div className="mx-auto max-w-3xl px-4 py-16">Loading sign in...</div>}>
        <AuthPageClient />
      </Suspense>
    </AppShell>
  );
}
