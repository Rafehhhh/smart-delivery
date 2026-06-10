export type UserRole = "customer" | "admin" | "staff";

export type OrderStatus =
  | "draft"
  | "submitted"
  | "assigned"
  | "confirmed"
  | "shopping"
  | "ready_for_delivery"
  | "delivered"
  | "cancelled";

export type PaymentState =
  | "unpaid"
  | "advance_paid"
  | "paid"
  | "partially_paid"
  | "payment_failed"
  | "refund_pending"
  | "refunded";

export type PaymentMode =
  | "cash"
  | "upi"
  | "card"
  | "wallet"
  | "net_banking";

export type PaymentProvider = "cash" | "razorpay" | "manual" | "future_gateway";

export type ProductCategory = {
  id: string;
  name: string;
  description: string;
};

export type Product = {
  id: string;
  categoryId: string;
  name: string;
  unit: string;
  price: number;
  previousWeekPrice?: number;
  priceTrend?: "up" | "down" | "stable";
  retailRange?: string;
  popularity?: "popular" | "top_selling" | "seasonal" | "standard";
  recommendation?: string;
  bestValueShop?: string;
  sourceNote?: string;
  marketQuotes?: ProductMarketQuote[];
  isApproximatePrice: boolean;
  isAvailable: boolean;
};

export type ProductMarketQuote = {
  shopName: string;
  currentPrice?: number;
  previousWeekPrice?: number;
  discountLabel?: string;
  note: string;
};

export type LocalShop = {
  id: string;
  name: string;
  type: "hypermarket" | "supermarket" | "government" | "local_market";
  address: string;
  contactPhone?: string;
  discountNote?: string;
};

export type CustomerReview = {
  id: string;
  customerName: string;
  customerPhone: string;
  target: "staff" | "application";
  staffId?: string;
  rating: number;
  comment: string;
  createdAt: string;
  replyStatus: "not_replied" | "replied";
};

export type DeliverySlot = {
  id: string;
  label: string;
  startsAt: string;
  endsAt: string;
  capacity: number;
  reserved: number;
};

export type Profile = {
  id: string;
  role: UserRole;
  name: string;
  phone: string;
};

export type CustomerAddress = {
  id: string;
  customerId: string;
  houseName: string;
  addressLine: string;
  landmark?: string;
  locality: string;
};

export type OrderItem = {
  id: string;
  productId: string;
  productName: string;
  unit: string;
  requestedQuantity: number;
  estimatedPrice: number;
  finalQuantity?: number;
  finalPrice?: number;
  notes?: string;
};

export type CashSummary = {
  advanceCollected: number;
  finalCollected: number;
  balanceDue: number;
  refundDue: number;
  reconciliationStatus: "not_started" | "advance_collected" | "settled" | "refund_due" | "balance_due";
};

export type PaymentTransaction = {
  id: string;
  orderId: string;
  mode: PaymentMode;
  provider: PaymentProvider;
  amount: number;
  status: "created" | "authorized" | "captured" | "failed" | "refunded";
  providerTransactionId?: string;
  failureReason?: string;
  refundStatus?: "not_required" | "pending" | "processed";
  createdAt: string;
};

export type Order = {
  id: string;
  orderNumber: string;
  customer: Profile;
  address: CustomerAddress;
  slot: DeliverySlot;
  status: OrderStatus;
  paymentState: PaymentState;
  serviceFee: number;
  estimateTotal: number;
  finalTotal?: number;
  assignedStaff?: Profile;
  items: OrderItem[];
  cash: CashSummary;
  createdAt: string;
  notes?: string;
};

export type OrderEvent = {
  id: string;
  orderId: string;
  actorId?: string;
  eventType: string;
  message: string;
  metadata: Record<string, unknown>;
  createdAt: string;
};

export type ServiceFeeRule = {
  id: string;
  name: string;
  flatFee: number;
  freeDeliveryMinimum?: number;
  isActive: boolean;
};

export type WhatsAppDispatchPayload = {
  order: Order;
  staffPhone: string;
  templateName?: string;
};
