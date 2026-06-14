import { MobileHomeConfirmLink } from "@/components/mobile-home-confirm-link";
import { Home } from "lucide-react";

export function AdminHomeHeader() {
  return (
    <div className="flex items-center gap-2">
      <span className="hidden text-sm font-semibold text-ink/72 sm:inline">Admin</span>
      <MobileHomeConfirmLink
        className="focus-ring inline-flex h-10 w-10 items-center justify-center rounded-full border border-ink/25 bg-white text-ink/72 shadow-sm hover:text-ink lg:border-ink/10 lg:shadow-none"
      >
        <Home aria-hidden size={16} />
      </MobileHomeConfirmLink>
    </div>
  );
}
