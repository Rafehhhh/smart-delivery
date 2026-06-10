import { AppShell } from "@/components/app-shell";
import { StaffRequestClient } from "./staff-request-client";

export default function StaffRequestPage() {
  return (
    <AppShell hideNav>
      <StaffRequestClient />
    </AppShell>
  );
}
