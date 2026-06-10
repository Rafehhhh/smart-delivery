alter table public.whatsapp_messages
  add column if not exists recipient_role public.user_role,
  add column if not exists event_type text,
  add column if not exists retry_count integer not null default 0 check (retry_count >= 0),
  add column if not exists last_attempt_at timestamptz;

create table if not exists public.order_events (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references public.orders(id) on delete cascade,
  actor_id uuid references public.profiles(id),
  event_type text not null,
  message text not null,
  metadata jsonb not null default '{}',
  created_at timestamptz not null default now()
);

alter table public.order_events enable row level security;

drop policy if exists "staff_read_open_orders" on public.orders;
create policy "staff_read_open_orders" on public.orders
  for select to authenticated
  using (public.is_staff() and assigned_staff_id is null and status = 'submitted');

drop policy if exists "staff_accept_open_orders" on public.orders;
create policy "staff_accept_open_orders" on public.orders
  for update to authenticated
  using (public.is_staff() and assigned_staff_id is null and status = 'submitted')
  with check (public.is_staff() and assigned_staff_id = auth.uid());

drop policy if exists "staff_assignments_staff_insert_own" on public.staff_assignments;
create policy "staff_assignments_staff_insert_own" on public.staff_assignments
  for insert to authenticated
  with check (public.is_staff() and staff_id = auth.uid());

drop policy if exists "order_events_role_read" on public.order_events;
create policy "order_events_role_read" on public.order_events
  for select to authenticated
  using (
    public.is_admin()
    or exists (
      select 1 from public.orders o
      where o.id = order_id
      and (o.customer_id = auth.uid() or o.assigned_staff_id = auth.uid())
    )
    or exists (
      select 1 from public.orders o
      where o.id = order_id
      and o.assigned_staff_id is null
      and o.status = 'submitted'
      and public.is_staff()
    )
  );

drop policy if exists "order_events_customer_staff_admin_insert" on public.order_events;
create policy "order_events_customer_staff_admin_insert" on public.order_events
  for insert to authenticated
  with check (
    public.is_admin()
    or exists (
      select 1 from public.orders o
      where o.id = order_id
      and (o.customer_id = auth.uid() or o.assigned_staff_id = auth.uid())
    )
  );
