import { ok } from "@/lib/api";

export async function POST(request: Request, { params }: { params: Promise<{ provider: string }> }) {
  const { provider } = await params;
  const payload = await request.json().catch(() => ({}));

  return ok({
    provider,
    received: true,
    verified: false,
    storedEvent: {
      id: `event_${Date.now()}`,
      payload,
      receivedAt: new Date().toISOString()
    },
    message: "Gateway webhook endpoint is reserved for future online payment providers."
  });
}
