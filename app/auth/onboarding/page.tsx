import { Suspense } from "react";
import { AppShell } from "@/components/app-shell";
import { CustomerOnboardingClient } from "./customer-onboarding-client";

export default function CustomerOnboardingPage() {
  return (
    <AppShell hideNav>
      <Suspense fallback={<div className="mx-auto max-w-2xl px-4 py-16">Loading customer setup...</div>}>
        <CustomerOnboardingClient />
      </Suspense>
    </AppShell>
  );
}
