# Smart Delivery

Smart Delivery is a web-first MVP for a local household purchase and delivery service. It includes customer ordering, admin operations, staff workflows, slot capacity, WhatsApp dispatch, cash reconciliation, and a future-ready payment gateway boundary.

## Stack

- Next.js App Router
- TypeScript
- Tailwind CSS
- Supabase Auth and Postgres
- WhatsApp Business Cloud API integration boundary
- Cash-first payment service with future Razorpay/UPI/card support

## Run Locally

```bash
npm install
npm run dev
```

Open `http://localhost:3000`.

The UI runs with demo data by default. Supabase-backed persistence can be wired by applying the migration in `supabase/migrations/001_initial_schema.sql` and connecting route handlers to Supabase queries.

## Environment

Copy `.env.example` to `.env.local`:

```bash
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
WHATSAPP_ACCESS_TOKEN=
WHATSAPP_PHONE_NUMBER_ID=
```

## App Areas

- `/customer`: homeowner catalog, cart, slot picker, and order estimate.
- `/admin`: order queue, catalog, slots, staff assignment, WhatsApp dispatch, payment tracking, and service fee settings.
- `/staff`: assigned orders, customer contact, shopping checklist, final invoice, and cash settlement.
- `/auth`: phone OTP sign-in shell for Supabase auth.

## API Boundaries

- `POST /api/orders`
- `GET /api/orders/:orderId`
- `PATCH /api/admin/orders/:orderId`
- `POST /api/admin/orders/:orderId/assign`
- `POST /api/admin/orders/:orderId/dispatch-whatsapp`
- `POST /api/staff/orders/:orderId/cash`
- `PATCH /api/staff/orders/:orderId/finalize-items`
- `POST /api/staff/orders/:orderId/complete`
- `POST /api/payments/initiate`
- `POST /api/payments/webhook/:provider`

## Payment Gateway Direction

The first launch is cash-first. The schema and service layer already model payment modes, payment providers, payment events, gateway transaction ids, refunds, failure states, and webhook event storage so Razorpay/UPI/card support can be added without redesigning the order lifecycle.

## Verification

```bash
npm run test
npm run build
```

For deployment preparation, use:

```bash
npm run deploy:check
```

See [docs/deployment.md](docs/deployment.md) for the Netlify + Supabase deployment steps.
