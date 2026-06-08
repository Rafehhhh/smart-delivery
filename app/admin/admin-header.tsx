import Link from "next/link";
import { Home } from "lucide-react";

export function AdminHomeHeader() {
  return (
    <Link
      href="/"
      className="focus-ring inline-flex h-10 w-10 items-center justify-center rounded-full border border-ink/10 bg-white text-ink/72 hover:text-ink"
      aria-label="Go to home"
    >
      <Home aria-hidden size={16} />
    </Link>
  );
}
