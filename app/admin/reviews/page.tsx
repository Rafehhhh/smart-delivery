import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { customerReviews, profiles } from "@/lib/demo-data";
import { formatDateTime } from "@/lib/format";
import { AdminHomeHeader } from "../admin-header";
import { ArrowLeft, MessageCircle, Star } from "lucide-react";

export default function AdminReviewsPage() {
  const reviews = [...customerReviews].sort((a, b) => b.createdAt.localeCompare(a.createdAt));

  return (
    <AppShell hideNav headerContent={<AdminHomeHeader />}>
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-md border border-ink/15 px-3 py-2 text-sm font-semibold">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-5 text-3xl font-semibold sm:text-4xl">Customer review details</h1>
          <p className="mt-3 max-w-2xl text-ink/64">
            Every customer review about staff and the application, with reply status and WhatsApp reply shortcuts.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-4 px-4 py-8 sm:px-6 lg:px-8">
        {reviews.map((review) => {
          const staff = review.staffId ? profiles.find((profile) => profile.id === review.staffId) : undefined;

          return (
            <article key={review.id} className="rounded-xl border border-ink/10 bg-white p-4 shadow-sm">
              <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                <div>
                  <h2 className="flex items-center gap-2 text-xl font-semibold">
                    <Star aria-hidden size={19} className="text-leaf" />
                    {review.customerName}
                  </h2>
                  <p className="mt-2 text-sm text-ink/58">{review.customerPhone}</p>
                </div>
                <span className="w-fit rounded-full bg-limewash px-3 py-1.5 text-sm font-semibold text-ink/66">
                  {review.replyStatus === "replied" ? "Replied" : "Needs reply"}
                </span>
              </div>

              <div className="mt-4 grid gap-2 text-sm sm:grid-cols-4">
                <Detail label="Rating" value={`${review.rating}/5`} />
                <Detail label="Target" value={review.target === "staff" ? "Staff" : "Application"} />
                <Detail label="Staff" value={staff?.name ?? "Not staff-specific"} />
                <Detail label="Created" value={formatDateTime(review.createdAt)} />
              </div>

              <p className="mt-4 rounded-xl bg-limewash p-3 text-sm leading-6 text-ink/68">{review.comment}</p>

              <a
                href={`https://wa.me/${review.customerPhone.replace(/\D/g, "")}?text=${encodeURIComponent("Thank you for your Smart Delivery feedback. ")}`}
                className="focus-ring mt-4 inline-flex items-center gap-2 rounded-full bg-ink px-4 py-2 text-sm font-semibold text-white"
              >
                <MessageCircle aria-hidden size={16} />
                Reply to customer
              </a>
            </article>
          );
        })}
      </section>
    </AppShell>
  );
}

function Detail({ label, value }: { label: string; value: string }) {
  return (
    <div className="rounded-xl bg-limewash p-3">
      <p className="text-xs font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className="mt-1 font-semibold">{value}</p>
    </div>
  );
}
