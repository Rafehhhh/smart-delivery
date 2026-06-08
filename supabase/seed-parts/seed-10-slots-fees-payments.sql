-- Generated smaller seed chunk from supabase/seed.sql.
begin;

insert into public.delivery_slots (source_key, label, starts_at, ends_at, capacity, reserved, is_active)
values
  ('slot-morning', 'Today, 9:00 AM - 11:00 AM', '2026-06-03T09:00:00+05:30', '2026-06-03T11:00:00+05:30', 8, 5, true),
  ('slot-afternoon', 'Today, 2:00 PM - 4:00 PM', '2026-06-03T14:00:00+05:30', '2026-06-03T16:00:00+05:30', 6, 6, true),
  ('slot-evening', 'Today, 6:00 PM - 8:00 PM', '2026-06-03T18:00:00+05:30', '2026-06-03T20:00:00+05:30', 10, 3, true)
on conflict (source_key) do update set
  label = excluded.label,
  starts_at = excluded.starts_at,
  ends_at = excluded.ends_at,
  capacity = excluded.capacity,
  reserved = excluded.reserved,
  is_active = excluded.is_active;


insert into public.service_fee_rules (name, flat_fee, free_delivery_minimum, is_active)
select 'Local delivery flat fee', 35, 1500, true
where not exists (select 1 from public.service_fee_rules where is_active = true);


insert into public.payment_methods (mode, provider, display_name, is_enabled)
values
  ('cash', 'cash', 'Cash on delivery', true),
  ('upi', 'razorpay', 'UPI via Razorpay', false),
  ('card', 'razorpay', 'Card via Razorpay', false),
  ('wallet', 'future_gateway', 'Wallet payment', false),
  ('net_banking', 'future_gateway', 'Net banking', false)
on conflict (mode, provider) do update set
  display_name = excluded.display_name,
  is_enabled = excluded.is_enabled;

commit;
