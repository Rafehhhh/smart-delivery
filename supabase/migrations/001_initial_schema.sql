create extension if not exists pgcrypto;

create type public.user_role as enum ('customer', 'admin', 'staff');
create type public.order_status as enum (
  'draft',
  'submitted',
  'assigned',
  'confirmed',
  'shopping',
  'ready_for_delivery',
  'delivered',
  'cancelled'
);
create type public.payment_state as enum (
  'unpaid',
  'advance_paid',
  'paid',
  'partially_paid',
  'payment_failed',
  'refund_pending',
  'refunded'
);
create type public.payment_mode as enum ('cash', 'upi', 'card', 'wallet', 'net_banking');
create type public.payment_provider as enum ('cash', 'razorpay', 'manual', 'future_gateway');
create type public.transaction_status as enum ('created', 'authorized', 'captured', 'failed', 'refunded');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  role public.user_role not null default 'customer',
  full_name text not null,
  phone text not null unique,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.customer_addresses (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid not null references public.profiles(id) on delete cascade,
  house_name text not null,
  address_line text not null,
  landmark text,
  locality text not null,
  is_default boolean not null default false,
  created_at timestamptz not null default now()
);

create table public.categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  description text not null default '',
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table public.products (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references public.categories(id),
  name text not null,
  unit text not null,
  price numeric(12, 2) not null check (price >= 0),
  is_approximate_price boolean not null default false,
  is_available boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.delivery_slots (
  id uuid primary key default gen_random_uuid(),
  label text not null,
  starts_at timestamptz not null,
  ends_at timestamptz not null,
  capacity integer not null check (capacity > 0),
  is_active boolean not null default true,
  created_at timestamptz not null default now(),
  constraint valid_slot_time check (ends_at > starts_at)
);

create table public.service_fee_rules (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  flat_fee numeric(12, 2) not null default 0 check (flat_fee >= 0),
  free_delivery_minimum numeric(12, 2) check (free_delivery_minimum is null or free_delivery_minimum >= 0),
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

create table public.orders (
  id uuid primary key default gen_random_uuid(),
  order_number text not null unique,
  customer_id uuid not null references public.profiles(id),
  address_id uuid not null references public.customer_addresses(id),
  slot_id uuid not null references public.delivery_slots(id),
  assigned_staff_id uuid references public.profiles(id),
  status public.order_status not null default 'submitted',
  payment_state public.payment_state not null default 'unpaid',
  estimate_total numeric(12, 2) not null default 0 check (estimate_total >= 0),
  final_total numeric(12, 2) check (final_total is null or final_total >= 0),
  service_fee numeric(12, 2) not null default 0 check (service_fee >= 0),
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  product_id uuid references public.products(id),
  product_name text not null,
  unit text not null,
  requested_quantity numeric(12, 3) not null check (requested_quantity > 0),
  estimated_price numeric(12, 2) not null check (estimated_price >= 0),
  final_quantity numeric(12, 3) check (final_quantity is null or final_quantity > 0),
  final_price numeric(12, 2) check (final_price is null or final_price >= 0),
  notes text,
  created_at timestamptz not null default now()
);

create table public.staff_assignments (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  staff_id uuid not null references public.profiles(id),
  assigned_by uuid references public.profiles(id),
  assigned_at timestamptz not null default now()
);

create table public.cash_transactions (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  advance_collected numeric(12, 2) not null default 0 check (advance_collected >= 0),
  final_collected numeric(12, 2) not null default 0 check (final_collected >= 0),
  balance_due numeric(12, 2) not null default 0 check (balance_due >= 0),
  refund_due numeric(12, 2) not null default 0 check (refund_due >= 0),
  reconciliation_status text not null default 'not_started',
  recorded_by uuid references public.profiles(id),
  created_at timestamptz not null default now()
);

create table public.payment_methods (
  id uuid primary key default gen_random_uuid(),
  mode public.payment_mode not null,
  provider public.payment_provider not null,
  display_name text not null,
  is_enabled boolean not null default false,
  config jsonb not null default '{}',
  created_at timestamptz not null default now(),
  unique (mode, provider)
);

create table public.payment_transactions (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  mode public.payment_mode not null,
  provider public.payment_provider not null,
  amount numeric(12, 2) not null check (amount > 0),
  status public.transaction_status not null default 'created',
  provider_transaction_id text,
  failure_reason text,
  refund_status text not null default 'not_required',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.payment_events (
  id uuid primary key default gen_random_uuid(),
  provider public.payment_provider not null,
  provider_event_id text,
  event_type text,
  payload jsonb not null default '{}',
  verified boolean not null default false,
  processed_at timestamptz,
  received_at timestamptz not null default now(),
  unique (provider, provider_event_id)
);

create table public.whatsapp_messages (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  staff_id uuid references public.profiles(id),
  recipient_phone text not null,
  message_body text not null,
  provider_message_id text,
  status text not null default 'created',
  error text,
  fallback_url text,
  sent_at timestamptz,
  created_at timestamptz not null default now()
);

create table public.settings (
  key text primary key,
  value jsonb not null,
  updated_at timestamptz not null default now()
);

create or replace function public.current_profile_role()
returns public.user_role
language sql
security definer
set search_path = public
stable
as $$
  select role from public.profiles where id = auth.uid()
$$;

create or replace function public.is_admin()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select public.current_profile_role() = 'admin'
$$;

create or replace function public.is_staff()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select public.current_profile_role() = 'staff'
$$;

alter table public.profiles enable row level security;
alter table public.customer_addresses enable row level security;
alter table public.categories enable row level security;
alter table public.products enable row level security;
alter table public.delivery_slots enable row level security;
alter table public.service_fee_rules enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
alter table public.staff_assignments enable row level security;
alter table public.cash_transactions enable row level security;
alter table public.payment_methods enable row level security;
alter table public.payment_transactions enable row level security;
alter table public.payment_events enable row level security;
alter table public.whatsapp_messages enable row level security;
alter table public.settings enable row level security;

create policy "profiles_read_own_or_admin" on public.profiles
  for select using (id = auth.uid() or public.is_admin());
create policy "profiles_admin_write" on public.profiles
  for all using (public.is_admin()) with check (public.is_admin());

create policy "customers_manage_own_addresses" on public.customer_addresses
  for all using (customer_id = auth.uid() or public.is_admin()) with check (customer_id = auth.uid() or public.is_admin());

create policy "catalog_read_authenticated" on public.categories
  for select to authenticated using (true);
create policy "products_read_authenticated" on public.products
  for select to authenticated using (true);
create policy "catalog_admin_write" on public.categories
  for all using (public.is_admin()) with check (public.is_admin());
create policy "products_admin_write" on public.products
  for all using (public.is_admin()) with check (public.is_admin());

create policy "slots_read_authenticated" on public.delivery_slots
  for select to authenticated using (is_active = true or public.is_admin());
create policy "slots_admin_write" on public.delivery_slots
  for all using (public.is_admin()) with check (public.is_admin());

create policy "fee_read_authenticated" on public.service_fee_rules
  for select to authenticated using (true);
create policy "fee_admin_write" on public.service_fee_rules
  for all using (public.is_admin()) with check (public.is_admin());

create policy "orders_role_read" on public.orders
  for select using (
    customer_id = auth.uid()
    or assigned_staff_id = auth.uid()
    or public.is_admin()
  );
create policy "customers_create_orders" on public.orders
  for insert with check (customer_id = auth.uid());
create policy "admins_update_orders" on public.orders
  for update using (public.is_admin()) with check (public.is_admin());
create policy "staff_update_assigned_orders" on public.orders
  for update using (assigned_staff_id = auth.uid()) with check (assigned_staff_id = auth.uid());

create policy "order_items_role_read" on public.order_items
  for select using (
    exists (
      select 1 from public.orders o
      where o.id = order_id
      and (o.customer_id = auth.uid() or o.assigned_staff_id = auth.uid() or public.is_admin())
    )
  );
create policy "order_items_customer_insert" on public.order_items
  for insert with check (
    exists (select 1 from public.orders o where o.id = order_id and o.customer_id = auth.uid())
  );
create policy "order_items_staff_or_admin_update" on public.order_items
  for update using (
    exists (
      select 1 from public.orders o
      where o.id = order_id
      and (o.assigned_staff_id = auth.uid() or public.is_admin())
    )
  );

create policy "staff_assignments_admin" on public.staff_assignments
  for all using (public.is_admin()) with check (public.is_admin());
create policy "staff_assignments_staff_read" on public.staff_assignments
  for select using (staff_id = auth.uid());

create policy "cash_role_access" on public.cash_transactions
  for all using (
    public.is_admin()
    or exists (select 1 from public.orders o where o.id = order_id and o.assigned_staff_id = auth.uid())
  ) with check (
    public.is_admin()
    or exists (select 1 from public.orders o where o.id = order_id and o.assigned_staff_id = auth.uid())
  );

create policy "payment_methods_admin" on public.payment_methods
  for all using (public.is_admin()) with check (public.is_admin());
create policy "payment_methods_read" on public.payment_methods
  for select to authenticated using (true);

create policy "payment_transactions_role_read" on public.payment_transactions
  for select using (
    public.is_admin()
    or exists (
      select 1 from public.orders o
      where o.id = order_id
      and (o.customer_id = auth.uid() or o.assigned_staff_id = auth.uid())
    )
  );
create policy "payment_transactions_admin_or_staff_write" on public.payment_transactions
  for all using (public.is_admin() or public.is_staff()) with check (public.is_admin() or public.is_staff());

create policy "payment_events_admin" on public.payment_events
  for all using (public.is_admin()) with check (public.is_admin());

create policy "whatsapp_admin_staff" on public.whatsapp_messages
  for all using (public.is_admin() or public.is_staff()) with check (public.is_admin() or public.is_staff());

create policy "settings_admin" on public.settings
  for all using (public.is_admin()) with check (public.is_admin());

insert into public.payment_methods (mode, provider, display_name, is_enabled)
values
  ('cash', 'cash', 'Cash on delivery', true),
  ('upi', 'razorpay', 'UPI via Razorpay', false),
  ('card', 'razorpay', 'Card via Razorpay', false),
  ('wallet', 'future_gateway', 'Wallet payment', false),
  ('net_banking', 'future_gateway', 'Net banking', false);
