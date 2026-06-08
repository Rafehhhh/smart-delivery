-- Generated smaller seed chunk from supabase/seed.sql.
begin;

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-cream', (select id from public.categories where source_key = 'cat-home'), 'Baby Cream', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-diaper', (select id from public.categories where source_key = 'cat-home'), 'Baby Diaper', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Diaper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-lotion', (select id from public.categories where source_key = 'cat-home'), 'Baby Lotion', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Lotion price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-nail-cutter', (select id from public.categories where source_key = 'cat-home'), 'Baby Nail Cutter', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Nail Cutter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-oil', (select id from public.categories where source_key = 'cat-home'), 'Baby Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-pant-diaper', (select id from public.categories where source_key = 'cat-home'), 'Baby Pant Diaper', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Pant Diaper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-powder', (select id from public.categories where source_key = 'cat-home'), 'Baby Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-shampoo', (select id from public.categories where source_key = 'cat-home'), 'Baby Shampoo', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Shampoo price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-soap', (select id from public.categories where source_key = 'cat-home'), 'Baby Soap', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Soap price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-spoon', (select id from public.categories where source_key = 'cat-home'), 'Baby Spoon', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Spoon price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-wash', (select id from public.categories where source_key = 'cat-home'), 'Baby Wash', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Wash price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baby-wipes', (select id from public.categories where source_key = 'cat-home'), 'Baby Wipes', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baby Wipes price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-backpack', (select id from public.categories where source_key = 'cat-home'), 'Backpack', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Backpack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baking-paper', (select id from public.categories where source_key = 'cat-home'), 'Baking Paper', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baking Paper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baking-powder', (select id from public.categories where source_key = 'cat-home'), 'Baking Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baking Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-baking-soda', (select id from public.categories where source_key = 'cat-home'), 'Baking Soda', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Baking Soda price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-banana-for-offering', (select id from public.categories where source_key = 'cat-home'), 'Banana For Offering', 'dozen', 68, 70.72, 'down', 'Trial estimate: Rs 68/dozen - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Banana For Offering price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-banana-leaf', (select id from public.categories where source_key = 'cat-home'), 'Banana Leaf', 'dozen', 68, 70.72, 'down', 'Trial estimate: Rs 68/dozen - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Banana Leaf price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy item price found', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bandage', (select id from public.categories where source_key = 'cat-home'), 'Bandage', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bandage price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bath-brush', (select id from public.categories where source_key = 'cat-home'), 'Bath Brush', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bath Brush price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bath-mat', (select id from public.categories where source_key = 'cat-home'), 'Bath Mat', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bath Mat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bath-soap', (select id from public.categories where source_key = 'cat-home'), 'Bath Soap', 'piece', 38, 40, 'down', 'Brand MRP / offer', 'popular', 'Compare combo offers.', 'Vishal / Smart Bazaar comparison', 'Packaged item price should be admin-updated.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bath-sponge', (select id from public.categories where source_key = 'cat-home'), 'Bath Sponge', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bath Sponge price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bath-towel', (select id from public.categories where source_key = 'cat-home'), 'Bath Towel', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bath Towel price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bathroom-cleaner', (select id from public.categories where source_key = 'cat-home'), 'Bathroom Cleaner', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bathroom Cleaner price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-battery', (select id from public.categories where source_key = 'cat-home'), 'Battery', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Battery price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bay-leaf', (select id from public.categories where source_key = 'cat-home'), 'Bay Leaf', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bay Leaf price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beard-comb', (select id from public.categories where source_key = 'cat-home'), 'Beard Comb', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beard Comb price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beard-oil', (select id from public.categories where source_key = 'cat-home'), 'Beard Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beard Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beard-wash', (select id from public.categories where source_key = 'cat-home'), 'Beard Wash', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beard Wash price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bed-bug-spray', (select id from public.categories where source_key = 'cat-home'), 'Bed Bug Spray', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bed Bug Spray price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-betel-leaf', (select id from public.categories where source_key = 'cat-home'), 'Betel Leaf', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Betel Leaf price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-betel-nut', (select id from public.categories where source_key = 'cat-home'), 'Betel Nut', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Betel Nut price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bib', (select id from public.categories where source_key = 'cat-home'), 'Bib', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bib price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bike-cleaning-cloth', (select id from public.categories where source_key = 'cat-home'), 'Bike Cleaning Cloth', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bike Cleaning Cloth price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-binder-clips', (select id from public.categories where source_key = 'cat-home'), 'Binder Clips', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Binder Clips price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bindi', (select id from public.categories where source_key = 'cat-home'), 'Bindi', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bindi price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-biriyani-masala', (select id from public.categories where source_key = 'cat-home'), 'Biriyani Masala', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Biriyani Masala price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bitter-gourd-pickle', (select id from public.categories where source_key = 'cat-home'), 'Bitter Gourd Pickle', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bitter Gourd Pickle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-black-salt', (select id from public.categories where source_key = 'cat-home'), 'Black Salt', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Black Salt price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-black-sesame-seeds', (select id from public.categories where source_key = 'cat-home'), 'Black Sesame Seeds', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Black Sesame Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bleach', (select id from public.categories where source_key = 'cat-home'), 'Bleach', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bleach price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-blouse-hooks', (select id from public.categories where source_key = 'cat-home'), 'Blouse Hooks', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Blouse Hooks price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-blue-liquid', (select id from public.categories where source_key = 'cat-home'), 'Blue Liquid', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Blue Liquid price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-body-lotion', (select id from public.categories where source_key = 'cat-home'), 'Body Lotion', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Body Lotion price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-body-scrub', (select id from public.categories where source_key = 'cat-home'), 'Body Scrub', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Body Scrub price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-body-spray', (select id from public.categories where source_key = 'cat-home'), 'Body Spray', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Body Spray price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-body-wash', (select id from public.categories where source_key = 'cat-home'), 'Body Wash', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Body Wash price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bone-meal', (select id from public.categories where source_key = 'cat-home'), 'Bone Meal', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bone Meal price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bottle-brush', (select id from public.categories where source_key = 'cat-home'), 'Bottle Brush', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bottle Brush price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bottle-nipple', (select id from public.categories where source_key = 'cat-home'), 'Bottle Nipple', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bottle Nipple price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bottle-opener', (select id from public.categories where source_key = 'cat-home'), 'Bottle Opener', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bottle Opener price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bowl', (select id from public.categories where source_key = 'cat-home'), 'Bowl', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bowl price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bowl-with-spoon', (select id from public.categories where source_key = 'cat-home'), 'Bowl With Spoon', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bowl With Spoon price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bp-monitor', (select id from public.categories where source_key = 'cat-home'), 'BP Monitor', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real BP Monitor price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-brass-lamp', (select id from public.categories where source_key = 'cat-home'), 'Brass Lamp', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Brass Lamp price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-breast-pads', (select id from public.categories where source_key = 'cat-home'), 'Breast Pads', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Breast Pads price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-broom', (select id from public.categories where source_key = 'cat-home'), 'Broom', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Broom price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-brown-sugar', (select id from public.categories where source_key = 'cat-home'), 'Brown Sugar', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Brown Sugar price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-brown-tape', (select id from public.categories where source_key = 'cat-home'), 'Brown Tape', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Brown Tape price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bucket', (select id from public.categories where source_key = 'cat-home'), 'Bucket', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bucket price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-butter', (select id from public.categories where source_key = 'cat-home'), 'Butter', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Butter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-butter-paper', (select id from public.categories where source_key = 'cat-home'), 'Butter Paper', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Butter Paper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cable-ties', (select id from public.categories where source_key = 'cat-home'), 'Cable Ties', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cable Ties price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-calculator', (select id from public.categories where source_key = 'cat-home'), 'Calculator', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Calculator price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-camphor', (select id from public.categories where source_key = 'cat-home'), 'Camphor', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Camphor price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-candle', (select id from public.categories where source_key = 'cat-home'), 'Candle', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Candle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-canola-oil', (select id from public.categories where source_key = 'cat-home'), 'Canola Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Canola Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-car-cleaning-cloth', (select id from public.categories where source_key = 'cat-home'), 'Car Cleaning Cloth', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Car Cleaning Cloth price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cardamom', (select id from public.categories where source_key = 'cat-home'), 'Cardamom', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cardamom price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-carom-seeds', (select id from public.categories where source_key = 'cat-home'), 'Carom Seeds', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Carom Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-casserole', (select id from public.categories where source_key = 'cat-home'), 'Casserole', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Casserole price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cello-tape', (select id from public.categories where source_key = 'cat-home'), 'Cello Tape', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cello Tape price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-changing-mat', (select id from public.categories where source_key = 'cat-home'), 'Changing Mat', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Changing Mat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chapati-board', (select id from public.categories where source_key = 'cat-home'), 'Chapati Board', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chapati Board price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chart-paper', (select id from public.categories where source_key = 'cat-home'), 'Chart Paper', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chart Paper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chilli-pickle', (select id from public.categories where source_key = 'cat-home'), 'Chilli Pickle', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chilli Pickle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chilli-powder', (select id from public.categories where source_key = 'cat-home'), 'Chilli Powder', 'pack', 72, 74, 'down', 'Brand MRP / offer', 'standard', 'Check brand preference.', 'Supermarket comparison', 'Packaged item price should be admin-updated.', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chilli-sauce', (select id from public.categories where source_key = 'cat-home'), 'Chilli Sauce', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chilli Sauce price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chocolate-spread', (select id from public.categories where source_key = 'cat-home'), 'Chocolate Spread', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chocolate Spread price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-christmas-candle', (select id from public.categories where source_key = 'cat-home'), 'Christmas Candle', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Christmas Candle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chyawanprash', (select id from public.categories where source_key = 'cat-home'), 'Chyawanprash', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chyawanprash price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cinnamon', (select id from public.categories where source_key = 'cat-home'), 'Cinnamon', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cinnamon price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cleaning-cloth', (select id from public.categories where source_key = 'cat-home'), 'Cleaning Cloth', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cleaning Cloth price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cleaning-gloves', (select id from public.categories where source_key = 'cat-home'), 'Cleaning Gloves', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cleaning Gloves price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cleaning-spray-bottle', (select id from public.categories where source_key = 'cat-home'), 'Cleaning Spray Bottle', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cleaning Spray Bottle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cleanser', (select id from public.categories where source_key = 'cat-home'), 'Cleanser', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cleanser price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cloth-bag', (select id from public.categories where source_key = 'cat-home'), 'Cloth Bag', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cloth Bag price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cloth-clips', (select id from public.categories where source_key = 'cat-home'), 'Cloth Clips', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cloth Clips price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-clothes-pegs', (select id from public.categories where source_key = 'cat-home'), 'Clothes Pegs', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Clothes Pegs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-clothes-whitener', (select id from public.categories where source_key = 'cat-home'), 'Clothes Whitener', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Clothes Whitener price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-clothesline-rope', (select id from public.categories where source_key = 'cat-home'), 'Clothesline Rope', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Clothesline Rope price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cloves', (select id from public.categories where source_key = 'cat-home'), 'Cloves', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cloves price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coaster', (select id from public.categories where source_key = 'cat-home'), 'Coaster', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coaster price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cockroach-spray', (select id from public.categories where source_key = 'cat-home'), 'Cockroach Spray', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cockroach Spray price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coco-peat', (select id from public.categories where source_key = 'cat-home'), 'Coco Peat', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coco Peat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cocoa-powder', (select id from public.categories where source_key = 'cat-home'), 'Cocoa Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cocoa Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-broom', (select id from public.categories where source_key = 'cat-home'), 'Coconut Broom', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Broom price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-chutney-powder', (select id from public.categories where source_key = 'cat-home'), 'Coconut Chutney Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Chutney Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-cream', (select id from public.categories where source_key = 'cat-home'), 'Coconut Cream', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-for-puja', (select id from public.categories where source_key = 'cat-home'), 'Coconut For Puja', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut For Puja price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-hair-oil', (select id from public.categories where source_key = 'cat-home'), 'Coconut Hair Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Hair Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-oil', (select id from public.categories where source_key = 'cat-home'), 'Coconut Oil', 'litre', 178, 180, 'down', 'Brand MRP / shop offer', 'top_selling', 'Compare brand and litre pack offers before purchase.', 'Vishal Mega Mart / Smart Bazaar / Extra comparison', 'Brand-specific packaged item price should be admin-updated.', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-scraper', (select id from public.categories where source_key = 'cat-home'), 'Coconut Scraper', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Scraper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coconut-vinegar', (select id from public.categories where source_key = 'cat-home'), 'Coconut Vinegar', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Vinegar price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cold-cream', (select id from public.categories where source_key = 'cat-home'), 'Cold Cream', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cold Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cold-pack', (select id from public.categories where source_key = 'cat-home'), 'Cold Pack', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cold Pack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cold-pressed-coconut-oil', (select id from public.categories where source_key = 'cat-home'), 'Cold Pressed Coconut Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cold Pressed Coconut Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-collar-cleaner', (select id from public.categories where source_key = 'cat-home'), 'Collar Cleaner', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Collar Cleaner price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-color-paper', (select id from public.categories where source_key = 'cat-home'), 'Color Paper', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Color Paper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-color-pencils', (select id from public.categories where source_key = 'cat-home'), 'Color Pencils', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Color Pencils price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-comb', (select id from public.categories where source_key = 'cat-home'), 'Comb', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Comb price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-comfort-gel-pack', (select id from public.categories where source_key = 'cat-home'), 'Comfort Gel Pack', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Comfort Gel Pack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-compact-powder', (select id from public.categories where source_key = 'cat-home'), 'Compact Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Compact Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-compass-box', (select id from public.categories where source_key = 'cat-home'), 'Compass Box', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Compass Box price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-compost', (select id from public.categories where source_key = 'cat-home'), 'Compost', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Compost price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-conditioner', (select id from public.categories where source_key = 'cat-home'), 'Conditioner', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Conditioner price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cooking-fat', (select id from public.categories where source_key = 'cat-home'), 'Cooking Fat', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cooking Fat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cooking-pot', (select id from public.categories where source_key = 'cat-home'), 'Cooking Pot', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cooking Pot price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-coriander-powder', (select id from public.categories where source_key = 'cat-home'), 'Coriander Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coriander Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-corn-oil', (select id from public.categories where source_key = 'cat-home'), 'Corn Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Corn Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-corn-starch', (select id from public.categories where source_key = 'cat-home'), 'Corn Starch', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Corn Starch price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-correction-pen', (select id from public.categories where source_key = 'cat-home'), 'Correction Pen', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Correction Pen price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cotton', (select id from public.categories where source_key = 'cat-home'), 'Cotton', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cotton price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cotton-buds', (select id from public.categories where source_key = 'cat-home'), 'Cotton Buds', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cotton Buds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cotton-pads', (select id from public.categories where source_key = 'cat-home'), 'Cotton Pads', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cotton Pads price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cotton-roll', (select id from public.categories where source_key = 'cat-home'), 'Cotton Roll', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cotton Roll price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cotton-sanitary-pads', (select id from public.categories where source_key = 'cat-home'), 'Cotton Sanitary Pads', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cotton Sanitary Pads price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cotton-wicks', (select id from public.categories where source_key = 'cat-home'), 'Cotton Wicks', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cotton Wicks price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cough-drops', (select id from public.categories where source_key = 'cat-home'), 'Cough Drops', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cough Drops price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cow-ghee', (select id from public.categories where source_key = 'cat-home'), 'Cow Ghee', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cow Ghee price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-crayons', (select id from public.categories where source_key = 'cat-home'), 'Crayons', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Crayons price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cream', (select id from public.categories where source_key = 'cat-home'), 'Cream', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-crepe-bandage', (select id from public.categories where source_key = 'cat-home'), 'Crepe Bandage', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Crepe Bandage price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cumin', (select id from public.categories where source_key = 'cat-home'), 'Cumin', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cumin price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cup', (select id from public.categories where source_key = 'cat-home'), 'Cup', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-curry-leaf-bunch', (select id from public.categories where source_key = 'cat-home'), 'Curry Leaf Bunch', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Curry Leaf Bunch price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-curry-masala', (select id from public.categories where source_key = 'cat-home'), 'Curry Masala', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Curry Masala price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-curtain-hook', (select id from public.categories where source_key = 'cat-home'), 'Curtain Hook', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Curtain Hook price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cutting-board', (select id from public.categories where source_key = 'cat-home'), 'Cutting Board', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cutting Board price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cutting-pliers', (select id from public.categories where source_key = 'cat-home'), 'Cutting Pliers', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cutting Pliers price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-dates-pickle', (select id from public.categories where source_key = 'cat-home'), 'Dates Pickle', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dates Pickle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-dates-syrup', (select id from public.categories where source_key = 'cat-home'), 'Dates Syrup', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dates Syrup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-day-cream', (select id from public.categories where source_key = 'cat-home'), 'Day Cream', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Day Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-dental-floss', (select id from public.categories where source_key = 'cat-home'), 'Dental Floss', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dental Floss price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-denture-cleaner', (select id from public.categories where source_key = 'cat-home'), 'Denture Cleaner', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Denture Cleaner price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-deodorant', (select id from public.categories where source_key = 'cat-home'), 'Deodorant', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Deodorant price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-detergent-liquid', (select id from public.categories where source_key = 'cat-home'), 'Detergent Liquid', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Detergent Liquid price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-detergent', (select id from public.categories where source_key = 'cat-home'), 'Detergent Powder', 'kg', 118, 125, 'down', 'Brand MRP / offer', 'popular', 'Large offer movement; check pack size.', 'Vishal / Smart Bazaar comparison', 'Packaged item price should be admin-updated.', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-diabetes-test-strips', (select id from public.categories where source_key = 'cat-home'), 'Diabetes Test Strips', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Diabetes Test Strips price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

commit;
