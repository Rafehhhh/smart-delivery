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
        <div className="mx-auto max-w-7xl px-3 py-4 sm:px-6 lg:px-8 lg:py-8">
          <Link href="/admin" className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/25 px-3 py-2 text-sm font-semibold shadow-sm lg:rounded-md lg:border-ink/15 lg:shadow-none">
            <ArrowLeft aria-hidden size={16} />
            Admin dashboard
          </Link>
          <h1 className="mt-3 text-2xl font-semibold sm:text-4xl lg:mt-5">Customer review details</h1>
          <p className="mt-2 max-w-2xl text-sm leading-6 text-ink/64 lg:mt-3 lg:text-base">
            Every customer review about staff and the application, with reply status and WhatsApp reply shortcuts.
          </p>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-3 px-2 py-3 pb-24 sm:px-6 lg:gap-4 lg:px-8 lg:py-8 lg:pb-8">
        {reviews.map((review) => {
          const staff = review.staffId ? profiles.find((profile) => profile.id === review.staffId) : undefined;

          return (
            <article key={review.id} className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-xl lg:border-ink/10 lg:p-4 lg:shadow-sm">
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

              <p className="mt-4 rounded-2xl border border-ink/15 bg-limewash p-3 text-sm leading-6 text-ink/68 lg:rounded-xl lg:border-0">{review.comment}</p>

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
    <div className="rounded-2xl border border-ink/15 bg-limewash p-3 lg:rounded-xl lg:border-0">
      <p className="text-xs font-semibold uppercase tracking-[0.08em] text-ink/46">{label}</p>
      <p className="mt-1 font-semibold">{value}</p>
    </div>
  );
}
