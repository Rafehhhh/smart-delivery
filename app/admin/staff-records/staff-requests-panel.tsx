"use client";

import { useState } from "react";
import type { StaffSignupRequest } from "@/lib/auth-flow";
import { CheckCircle2, Clock3, XCircle } from "lucide-react";

export function StaffRequestsPanel({ requests }: { requests: StaffSignupRequest[] }) {
  const [rows, setRows] = useState(requests);
  const [busyId, setBusyId] = useState<string | null>(null);
  const pendingRows = rows.filter((request) => request.status === "pending");

  async function reviewRequest(requestId: string, status: "approved" | "rejected") {
    setBusyId(requestId);
    try {
      const response = await fetch(`/api/admin/staff-requests/${requestId}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status })
      });
      const payload = await response.json();
      if (!response.ok) throw new Error(payload.error ?? "Could not review request.");
      setRows((current) => current.map((request) => request.id === requestId ? { ...request, status } : request));
    } finally {
      setBusyId(null);
    }
  }

  return (
    <section className="rounded-3xl border border-ink/25 bg-white p-3 shadow-soft lg:rounded-xl lg:border-ink/10 lg:p-2.5 lg:shadow-sm">
      <div className="flex items-center justify-between gap-2">
        <h2 className="flex items-center gap-2 text-base font-semibold">
          <Clock3 aria-hidden size={18} />
          Staff requests
        </h2>
        <span className="rounded-full bg-mint px-2.5 py-1 text-xs font-semibold text-leaf">{pendingRows.length} pending</span>
      </div>

      <div className="mt-2 grid gap-2">
        {pendingRows.length ? pendingRows.map((request) => (
          <article key={request.id} className="rounded-2xl border border-ink/15 bg-limewash p-2.5 text-xs shadow-sm lg:rounded-lg lg:border-0 lg:p-2 lg:shadow-none">
            <p className="font-semibold">{request.full_name}</p>
            <p className="mt-0.5 text-ink/58">{request.phone}</p>
            <p className="mt-1 text-ink/64">{request.route_area} - {request.vehicle}</p>
            {request.note ? <p className="mt-1 rounded-2xl border border-ink/15 bg-white px-2 py-1 text-ink/62 lg:rounded-md lg:border-0">{request.note}</p> : null}
            <div className="mt-2 grid grid-cols-2 gap-1.5">
              <button
                type="button"
                disabled={busyId === request.id}
                onClick={() => reviewRequest(request.id, "approved")}
                className="focus-ring inline-flex items-center justify-center gap-1 rounded-full bg-leaf px-2 py-1.5 font-semibold text-white disabled:opacity-50"
              >
                <CheckCircle2 aria-hidden size={14} />
                Approve
              </button>
              <button
                type="button"
                disabled={busyId === request.id}
                onClick={() => reviewRequest(request.id, "rejected")}
                className="focus-ring inline-flex items-center justify-center gap-1 rounded-full border border-ink/15 bg-white px-2 py-1.5 font-semibold text-clay disabled:opacity-50"
              >
                <XCircle aria-hidden size={14} />
                Reject
              </button>
            </div>
          </article>
        )) : (
          <p className="rounded-2xl border border-ink/15 bg-limewash px-2.5 py-2 text-xs font-semibold text-ink/58 lg:rounded-lg lg:border-0">No pending staff requests.</p>
        )}
      </div>
    </section>
  );
}
