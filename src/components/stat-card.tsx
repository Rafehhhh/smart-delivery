import type { LucideIcon } from "lucide-react";

export function StatCard({
  label,
  value,
  icon: Icon,
  tone = "leaf"
}: {
  label: string;
  value: string;
  icon: LucideIcon;
  tone?: "leaf" | "market" | "clay" | "ink";
}) {
  const toneClass = {
    leaf: "bg-leaf text-white",
    market: "bg-market text-ink",
    clay: "bg-clay text-white",
    ink: "bg-ink text-white"
  }[tone];

  return (
    <div className="rounded-md border border-ink/10 bg-white p-4 shadow-sm">
      <div className="flex items-center justify-between gap-3">
        <div>
          <p className="text-sm font-medium text-ink/60">{label}</p>
          <p className="mt-1 text-2xl font-semibold">{value}</p>
        </div>
        <span className={`flex h-11 w-11 items-center justify-center rounded-md ${toneClass}`}>
          <Icon aria-hidden size={21} />
        </span>
      </div>
    </div>
  );
}
