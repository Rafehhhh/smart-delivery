import type { Order, WhatsAppDispatchPayload } from "./types";

export type WhatsAppDispatchResult = {
  ok: boolean;
  providerMessageId?: string;
  fallbackUrl: string;
  error?: string;
};

export function buildStaffOrderMessage(order: Order) {
  const itemLines = order.items
    .map((item, index) => `${index + 1}. ${item.productName} - ${item.requestedQuantity} ${item.unit}`)
    .join("\n");

  return [
    `Smart Delivery order ${order.orderNumber}`,
    `Customer: ${order.customer.name} (${order.customer.phone})`,
    `Address: ${order.address.houseName}, ${order.address.addressLine}, ${order.address.locality}`,
    order.address.landmark ? `Landmark: ${order.address.landmark}` : undefined,
    `Slot: ${order.slot.label}`,
    `Estimated total: INR ${order.estimateTotal + order.serviceFee}`,
    "Items:",
    itemLines,
    order.notes ? `Notes: ${order.notes}` : undefined
  ]
    .filter(Boolean)
    .join("\n");
}

export function buildWhatsAppFallbackUrl(phone: string, message: string) {
  const normalized = phone.replace(/[^\d]/g, "");
  return `https://wa.me/${normalized}?text=${encodeURIComponent(message)}`;
}

export async function dispatchOrderToStaff({
  order,
  staffPhone
}: WhatsAppDispatchPayload): Promise<WhatsAppDispatchResult> {
  const message = buildStaffOrderMessage(order);
  const fallbackUrl = buildWhatsAppFallbackUrl(staffPhone, message);

  const token = process.env.WHATSAPP_ACCESS_TOKEN;
  const phoneNumberId = process.env.WHATSAPP_PHONE_NUMBER_ID;

  if (!token || !phoneNumberId) {
    return {
      ok: false,
      fallbackUrl,
      error: "WhatsApp API credentials are not configured. Use the fallback URL or set WHATSAPP_ACCESS_TOKEN and WHATSAPP_PHONE_NUMBER_ID."
    };
  }

  const response = await fetch(`https://graph.facebook.com/v20.0/${phoneNumberId}/messages`, {
    method: "POST",
    headers: {
      Authorization: `Bearer ${token}`,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      messaging_product: "whatsapp",
      to: staffPhone.replace(/[^\d]/g, ""),
      type: "text",
      text: { body: message }
    })
  });

  if (!response.ok) {
    return {
      ok: false,
      fallbackUrl,
      error: await response.text()
    };
  }

  const data = (await response.json()) as { messages?: { id: string }[] };
  return {
    ok: true,
    fallbackUrl,
    providerMessageId: data.messages?.[0]?.id
  };
}
