create table if not exists public.staff_signup_requests (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  full_name text not null,
  phone text not null,
  route_area text not null,
  vehicle text not null,
  note text,
  status text not null default 'pending' check (status in ('pending', 'approved', 'rejected')),
  reviewed_by uuid references public.profiles(id),
  reviewed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id)
);

alter table public.staff_signup_requests enable row level security;

drop policy if exists "profiles_self_insert_customer" on public.profiles;
create policy "profiles_self_insert_customer" on public.profiles
  for insert to authenticated
  with check (id = auth.uid() and role = 'customer');

drop policy if exists "profiles_self_update_basic" on public.profiles;
create policy "profiles_self_update_basic" on public.profiles
  for update to authenticated
  using (id = auth.uid())
  with check (id = auth.uid() and role = public.current_profile_role());

drop policy if exists "staff_requests_create_own" on public.staff_signup_requests;
create policy "staff_requests_create_own" on public.staff_signup_requests
  for insert to authenticated
  with check (user_id = auth.uid() and status = 'pending');

drop policy if exists "staff_requests_read_own_or_admin" on public.staff_signup_requests;
create policy "staff_requests_read_own_or_admin" on public.staff_signup_requests
  for select to authenticated
  using (user_id = auth.uid() or public.is_admin());

drop policy if exists "staff_requests_update_own_pending" on public.staff_signup_requests;
create policy "staff_requests_update_own_pending" on public.staff_signup_requests
  for update to authenticated
  using (user_id = auth.uid() and status = 'pending')
  with check (user_id = auth.uid() and status = 'pending');

drop policy if exists "staff_requests_admin_review" on public.staff_signup_requests;
create policy "staff_requests_admin_review" on public.staff_signup_requests
  for update to authenticated
  using (public.is_admin())
  with check (public.is_admin());
