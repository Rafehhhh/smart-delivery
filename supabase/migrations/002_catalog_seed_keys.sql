alter table public.categories
  add column if not exists source_key text;

alter table public.products
  add column if not exists source_key text,
  add column if not exists previous_week_price numeric(12, 2) check (previous_week_price is null or previous_week_price >= 0),
  add column if not exists price_trend text check (price_trend is null or price_trend in ('up', 'down', 'stable')),
  add column if not exists retail_range text,
  add column if not exists popularity text check (popularity is null or popularity in ('popular', 'top_selling', 'seasonal', 'standard')),
  add column if not exists recommendation text,
  add column if not exists best_value_shop text,
  add column if not exists source_note text;

alter table public.delivery_slots
  add column if not exists source_key text,
  add column if not exists reserved integer not null default 0 check (reserved >= 0);

create unique index if not exists categories_source_key_unique
  on public.categories (source_key);

create unique index if not exists products_source_key_unique
  on public.products (source_key);

create unique index if not exists delivery_slots_source_key_unique
  on public.delivery_slots (source_key);

drop policy if exists "categories_public_read" on public.categories;
create policy "categories_public_read" on public.categories
  for select to anon using (true);

drop policy if exists "products_public_read" on public.products;
create policy "products_public_read" on public.products
  for select to anon using (is_available = true);

drop policy if exists "slots_public_read" on public.delivery_slots;
create policy "slots_public_read" on public.delivery_slots
  for select to anon using (is_active = true);

drop policy if exists "fee_public_read" on public.service_fee_rules;
create policy "fee_public_read" on public.service_fee_rules
  for select to anon using (is_active = true);
