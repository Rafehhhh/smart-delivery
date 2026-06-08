# Smart Delivery Deployment Guide

Use Netlify for the Next.js web app and Supabase for the backend services.

## 1. Local Verification

Run these from the project root before deploying:

```bash
npm install
npm run deploy:check
```

`deploy:check` runs the Vitest suite and a production Next.js build.

## 2. Supabase Setup

1. Create a hosted Supabase project named `smart-delivery-pilot`.
2. Copy the project URL and publishable or anon key.
3. Apply the schema migrations in `supabase/migrations`.
4. Run the seed file in `supabase/seed.sql` to load categories, products, delivery slots, service fee, and payment methods.

Preferred CLI flow:

```bash
supabase login
supabase link
supabase db push
```

Then open the Supabase SQL Editor and run `supabase/seed.sql`.

If the Supabase CLI is not installed, open the Supabase SQL Editor and run the SQL from:

1. `supabase/migrations/001_initial_schema.sql`
2. `supabase/migrations/002_catalog_seed_keys.sql`
3. `supabase/seed.sql`

When the catalog changes later, regenerate the seed locally with:

```bash
npm run seed:supabase
```

## 3. Netlify Setup

1. Push this project to GitHub.
2. In Netlify, choose **Add new project** and import the GitHub repo.
3. Use these build settings:

```txt
Build command: npm run build
Publish directory: .next
Node version: 22
```

These are also stored in `netlify.toml`.

## 4. Netlify Environment Variables

Add these in Netlify under project environment variables:

```txt
NEXT_PUBLIC_SUPABASE_URL=<your Supabase project URL>
NEXT_PUBLIC_SUPABASE_ANON_KEY=<your Supabase publishable or anon key>
WHATSAPP_ACCESS_TOKEN=<optional for first demo deploy>
WHATSAPP_PHONE_NUMBER_ID=<optional for first demo deploy>
```

Leave WhatsApp values empty for the first demo deploy unless you are ready to test WhatsApp dispatch.

## 5. Supabase Auth URLs

After Netlify creates the production URL, add these in Supabase Auth URL settings:

```txt
https://your-site.netlify.app/**
http://localhost:3000/**
```

Use your real Netlify URL in place of `your-site`.

## 6. Production Smoke Test

After deployment, open:

- `/`
- `/customer`
- `/admin`
- `/admin/products`
- `/admin/staff-records`
- `/staff`
- `/auth`

Confirm:

- Product catalog loads.
- Admin product table loads.
- Supabase-seeded catalog appears on `/customer` and `/admin/products` when environment variables and seed data are present.
- Staff table loads.
- Customer cart works.
- Auth page sees Supabase environment variables.
- API routes compile without deployment errors.

## Notes

- Current UI still uses demo data for orders, staff operations, reviews, and order submission.
- Supabase catalog reads are enabled for customer products, admin products, and admin product metrics with demo fallback.
- Route handlers must be connected to database mutations before production ordering operations.
- Trial product prices are temporary and should be replaced by admin-entered shop prices before launch.
