import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { Home } from "lucide-react";
import { StaffRequestClient } from "./staff-request-client";

export default function StaffRequestPage() {
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
      <StaffRequestClient />
    </AppShell>
  );
}
