-- Generated smaller seed chunk from supabase/seed.sql.
begin;

insert into public.categories (source_key, name, description, sort_order)
values
  ('cat-vegetables', 'Vegetables', 'Fresh local-market vegetables with weekly price movement.', 0),
  ('cat-meat', 'Meat & Fish', 'Chicken, beef, mutton, and seafood rates for household orders.', 1),
  ('cat-rice', 'Rice & Grains', 'Daily rice, pulses, flour, and staple grains.', 2),
  ('cat-fruits', 'Fruits', 'Common fruits and seasonal fresh items.', 3),
  ('cat-foods', 'Food Items', 'Bakery, packaged food, and ready-to-buy daily food items.', 4),
  ('cat-home', 'Home Essentials', 'Cooking oil, spices, soaps, and household basics.', 5)
on conflict (source_key) do update set
  name = excluded.name,
  description = excluded.description,
  sort_order = excluded.sort_order;

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-achappam', (select id from public.categories where source_key = 'cat-foods'), 'Achappam', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Achappam price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-ada-pradhaman-mix', (select id from public.categories where source_key = 'cat-foods'), 'Ada Pradhaman Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Ada Pradhaman Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-almond-butter', (select id from public.categories where source_key = 'cat-foods'), 'Almond Butter', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Almond Butter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-almond-milk', (select id from public.categories where source_key = 'cat-foods'), 'Almond Milk', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Almond Milk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-almonds', (select id from public.categories where source_key = 'cat-foods'), 'Almonds', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Almonds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-aloe-vera-juice', (select id from public.categories where source_key = 'cat-foods'), 'Aloe Vera Juice', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Aloe Vera Juice price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-appam-batter-pack', (select id from public.categories where source_key = 'cat-foods'), 'Appam Batter Pack', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Appam Batter Pack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-appam-mix', (select id from public.categories where source_key = 'cat-foods'), 'Appam Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Appam Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-apple-cider-vinegar', (select id from public.categories where source_key = 'cat-foods'), 'Apple Cider Vinegar', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Apple Cider Vinegar price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-aval-mix', (select id from public.categories where source_key = 'cat-foods'), 'Aval Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Aval Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-badam-drink-mix', (select id from public.categories where source_key = 'cat-foods'), 'Badam Drink Mix', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Badam Drink Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-bakery-shortening', (select id from public.categories where source_key = 'cat-foods'), 'Bakery Shortening', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bakery Shortening price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-banana-chips', (select id from public.categories where source_key = 'cat-foods'), 'Banana Chips', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Banana Chips price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-banana-halwa', (select id from public.categories where source_key = 'cat-foods'), 'Banana Halwa', 'dozen', 72, 74.88, 'down', 'Trial estimate: Rs 72/dozen - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Banana Halwa price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-bird-feed', (select id from public.categories where source_key = 'cat-foods'), 'Bird Feed', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bird Feed price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-biscuits', (select id from public.categories where source_key = 'cat-foods'), 'Biscuits', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Biscuits price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-black-tea', (select id from public.categories where source_key = 'cat-foods'), 'Black Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Black Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-bombay-mixture', (select id from public.categories where source_key = 'cat-foods'), 'Bombay Mixture', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bombay Mixture price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-boost-health-drink', (select id from public.categories where source_key = 'cat-foods'), 'Boost Health Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Boost Health Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-bottled-water', (select id from public.categories where source_key = 'cat-foods'), 'Bottled Water', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bottled Water price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-bread', (select id from public.categories where source_key = 'cat-foods'), 'Bread', 'pack', 45, 45, 'stable', 'Brand MRP / shop offer', 'standard', 'Best purchased from bakery/supermarket close to delivery route.', 'Sreedevi Supermarket and Bakery', 'Packaged/bakery prices are shop-specific and admin-maintained.', true, true)
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
values ('prod-bun', (select id from public.categories where source_key = 'cat-foods'), 'Bun', 'pack', 35, 35, 'stable', 'Bakery price', 'standard', 'Buy near route for freshness.', 'Sreedevi Supermarket and Bakery', 'Bakery price is shop-specific.', true, true)
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
values ('prod-butter-cookies', (select id from public.categories where source_key = 'cat-foods'), 'Butter Cookies', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Butter Cookies price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-buttermilk-drink', (select id from public.categories where source_key = 'cat-foods'), 'Buttermilk Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Buttermilk Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-snacks-and-sweets-cake-rusk', (select id from public.categories where source_key = 'cat-foods'), 'Cake Rusk', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cake Rusk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-calcium-supplement-food', (select id from public.categories where source_key = 'cat-foods'), 'Calcium Supplement Food', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Calcium Supplement Food price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-candy', (select id from public.categories where source_key = 'cat-foods'), 'Candy', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Candy price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cardamom-tea', (select id from public.categories where source_key = 'cat-foods'), 'Cardamom Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cardamom Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cashew-nuts', (select id from public.categories where source_key = 'cat-foods'), 'Cashew Nuts', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cashew Nuts price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cat-food', (select id from public.categories where source_key = 'cat-foods'), 'Cat Food', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cat Food price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cat-litter', (select id from public.categories where source_key = 'cat-foods'), 'Cat Litter', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cat Litter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-chakli', (select id from public.categories where source_key = 'cat-foods'), 'Chakli', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chakli price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-chapati-mix', (select id from public.categories where source_key = 'cat-foods'), 'Chapati Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chapati Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-chapati', (select id from public.categories where source_key = 'cat-foods'), 'Chapati Pack', 'pack', 55, 55, 'stable', 'Ready food pack', 'popular', 'Useful quick dinner item.', 'Bakery / supermarket comparison', 'Shop-specific ready-food price.', false, true)
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
values ('prod-chia-seeds', (select id from public.categories where source_key = 'cat-foods'), 'Chia Seeds', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chia Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-chikki', (select id from public.categories where source_key = 'cat-foods'), 'Chikki', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chikki price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-chocolate', (select id from public.categories where source_key = 'cat-foods'), 'Chocolate', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chocolate price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-chocolate-drink-mix', (select id from public.categories where source_key = 'cat-foods'), 'Chocolate Drink Mix', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chocolate Drink Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-coconut-cookies', (select id from public.categories where source_key = 'cat-foods'), 'Coconut Cookies', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Cookies price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-coconut-milk', (select id from public.categories where source_key = 'cat-foods'), 'Coconut Milk', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Milk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-coconut-milk-drink', (select id from public.categories where source_key = 'cat-foods'), 'Coconut Milk Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Milk Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-coconut-milk-powder', (select id from public.categories where source_key = 'cat-foods'), 'Coconut Milk Powder', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coconut Milk Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-coffee-powder', (select id from public.categories where source_key = 'cat-foods'), 'Coffee Powder', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Coffee Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cold-coffee', (select id from public.categories where source_key = 'cat-foods'), 'Cold Coffee', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cold Coffee price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cookies', (select id from public.categories where source_key = 'cat-foods'), 'Cookies', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cookies price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cornflakes', (select id from public.categories where source_key = 'cat-foods'), 'Cornflakes', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cornflakes price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-crackers', (select id from public.categories where source_key = 'cat-foods'), 'Crackers', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Crackers price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cream-biscuits', (select id from public.categories where source_key = 'cat-foods'), 'Cream Biscuits', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cream Biscuits price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cup-noodles', (select id from public.categories where source_key = 'cat-foods'), 'Cup Noodles', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cup Noodles price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-cutlet', (select id from public.categories where source_key = 'cat-foods'), 'Cutlet', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cutlet price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-dates', (select id from public.categories where source_key = 'cat-foods'), 'Dates', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dates price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-digestive-biscuits', (select id from public.categories where source_key = 'cat-foods'), 'Digestive Biscuits', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Digestive Biscuits price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-dog-food', (select id from public.categories where source_key = 'cat-foods'), 'Dog Food', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dog Food price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-dosa-batter-pack', (select id from public.categories where source_key = 'cat-foods'), 'Dosa Batter Pack', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dosa Batter Pack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-dosa-mix', (select id from public.categories where source_key = 'cat-foods'), 'Dosa Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dosa Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-snacks-and-sweets-dry-fig', (select id from public.categories where source_key = 'cat-foods'), 'Dry Fig', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dry Fig price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-dust-tea', (select id from public.categories where source_key = 'cat-foods'), 'Dust Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dust Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-eggs', (select id from public.categories where source_key = 'cat-foods'), 'Eggs', 'piece', 7, 6, 'up', 'Rs 6 - 7/piece', 'top_selling', 'High-demand add-on item.', 'Local store comparison', 'Admin-maintained local price.', true, true)
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
values ('prod-ela-ada', (select id from public.categories where source_key = 'cat-foods'), 'Ela Ada', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Ela Ada price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-electrolyte-drink', (select id from public.categories where source_key = 'cat-foods'), 'Electrolyte Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Electrolyte Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-energy-drink', (select id from public.categories where source_key = 'cat-foods'), 'Energy Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Energy Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-filter-coffee-powder', (select id from public.categories where source_key = 'cat-foods'), 'Filter Coffee Powder', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Filter Coffee Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-flax-seeds', (select id from public.categories where source_key = 'cat-foods'), 'Flax Seeds', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Flax Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-food-color', (select id from public.categories where source_key = 'cat-foods'), 'Food Color', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Food Color price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-food-storage-box', (select id from public.categories where source_key = 'cat-foods'), 'Food Storage Box', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Food Storage Box price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-food-wrap', (select id from public.categories where source_key = 'cat-foods'), 'Food Wrap', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Food Wrap price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-fried-cashew', (select id from public.categories where source_key = 'cat-foods'), 'Fried Cashew', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fried Cashew price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-frozen-cutlet', (select id from public.categories where source_key = 'cat-foods'), 'Frozen Cutlet', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Frozen Cutlet price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-frozen-fries', (select id from public.categories where source_key = 'cat-foods'), 'Frozen Fries', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Frozen Fries price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-frozen-nuggets', (select id from public.categories where source_key = 'cat-foods'), 'Frozen Nuggets', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Frozen Nuggets price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-frozen-parotta', (select id from public.categories where source_key = 'cat-foods'), 'Frozen Parotta', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Frozen Parotta price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-frozen-peas', (select id from public.categories where source_key = 'cat-foods'), 'Frozen Peas', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Frozen Peas price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-frozen-samosa', (select id from public.categories where source_key = 'cat-foods'), 'Frozen Samosa', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Frozen Samosa price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-fruit-concentrate', (select id from public.categories where source_key = 'cat-foods'), 'Fruit Concentrate', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fruit Concentrate price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-fryums', (select id from public.categories where source_key = 'cat-foods'), 'Fryums', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fryums price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-ginger-tea', (select id from public.categories where source_key = 'cat-foods'), 'Ginger Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Ginger Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-glucose-biscuits', (select id from public.categories where source_key = 'cat-foods'), 'Glucose Biscuits', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Glucose Biscuits price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-glucose-drink-powder', (select id from public.categories where source_key = 'cat-foods'), 'Glucose Drink Powder', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Glucose Drink Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-granola', (select id from public.categories where source_key = 'cat-foods'), 'Granola', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Granola price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-green-tea', (select id from public.categories where source_key = 'cat-foods'), 'Green Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Green Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-halwa', (select id from public.categories where source_key = 'cat-foods'), 'Halwa', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Halwa price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-herbal-tea', (select id from public.categories where source_key = 'cat-foods'), 'Herbal Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Herbal Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-herbal-wellness-tea', (select id from public.categories where source_key = 'cat-foods'), 'Herbal Wellness Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Herbal Wellness Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-himalayan-pink-salt', (select id from public.categories where source_key = 'cat-foods'), 'Himalayan Pink Salt', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Himalayan Pink Salt price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-iced-tea', (select id from public.categories where source_key = 'cat-foods'), 'Iced Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Iced Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-idiyappam-pack', (select id from public.categories where source_key = 'cat-foods'), 'Idiyappam Pack', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Idiyappam Pack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-idli-mix', (select id from public.categories where source_key = 'cat-foods'), 'Idli Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Idli Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-idli-pack', (select id from public.categories where source_key = 'cat-foods'), 'Idli Pack', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Idli Pack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-idli-steamer', (select id from public.categories where source_key = 'cat-foods'), 'Idli Steamer', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Idli Steamer price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-infant-food', (select id from public.categories where source_key = 'cat-foods'), 'Infant Food', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Infant Food price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-instant-coffee', (select id from public.categories where source_key = 'cat-foods'), 'Instant Coffee', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Instant Coffee price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-instant-coffee-premix', (select id from public.categories where source_key = 'cat-foods'), 'Instant Coffee Premix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Instant Coffee Premix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-instant-oats', (select id from public.categories where source_key = 'cat-foods'), 'Instant Oats', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Instant Oats price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-instant-soup', (select id from public.categories where source_key = 'cat-foods'), 'Instant Soup', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Instant Soup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-instant-tea-premix', (select id from public.categories where source_key = 'cat-foods'), 'Instant Tea Premix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Instant Tea Premix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-iron-supplement-food', (select id from public.categories where source_key = 'cat-foods'), 'Iron Supplement Food', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Iron Supplement Food price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-jalebi', (select id from public.categories where source_key = 'cat-foods'), 'Jalebi', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Jalebi price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-juice', (select id from public.categories where source_key = 'cat-foods'), 'Juice', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Juice price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-kara-sev', (select id from public.categories where source_key = 'cat-foods'), 'Kara Sev', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kara Sev price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-kerala-mixture', (select id from public.categories where source_key = 'cat-foods'), 'Kerala Mixture', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kerala Mixture price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-kids-snack', (select id from public.categories where source_key = 'cat-foods'), 'Kids Snack', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kids Snack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-kokum-syrup', (select id from public.categories where source_key = 'cat-foods'), 'Kokum Syrup', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kokum Syrup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-kuzhalappam', (select id from public.categories where source_key = 'cat-foods'), 'Kuzhalappam', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kuzhalappam price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-laddu', (select id from public.categories where source_key = 'cat-foods'), 'Laddu', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Laddu price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-lassi-drink', (select id from public.categories where source_key = 'cat-foods'), 'Lassi Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lassi Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-leaf-tea', (select id from public.categories where source_key = 'cat-foods'), 'Leaf Tea', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Leaf Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-lemon-drink', (select id from public.categories where source_key = 'cat-foods'), 'Lemon Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lemon Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-lime-syrup', (select id from public.categories where source_key = 'cat-foods'), 'Lime Syrup', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lime Syrup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-low-sugar-biscuits', (select id from public.categories where source_key = 'cat-foods'), 'Low Sugar Biscuits', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Low Sugar Biscuits price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-macaroni', (select id from public.categories where source_key = 'cat-foods'), 'Macaroni', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Macaroni price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-malted-health-drink', (select id from public.categories where source_key = 'cat-foods'), 'Malted Health Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Malted Health Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-mango-juice', (select id from public.categories where source_key = 'cat-foods'), 'Mango Juice', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mango Juice price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-marie-biscuits', (select id from public.categories where source_key = 'cat-foods'), 'Marie Biscuits', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Marie Biscuits price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-marshmallow', (select id from public.categories where source_key = 'cat-foods'), 'Marshmallow', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Marshmallow price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-masala-peanuts', (select id from public.categories where source_key = 'cat-foods'), 'Masala Peanuts', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Masala Peanuts price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-masala-tea', (select id from public.categories where source_key = 'cat-foods'), 'Masala Tea', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Masala Tea price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-milk', (select id from public.categories where source_key = 'cat-foods'), 'Milk', 'litre', 56, 56, 'stable', 'MRP item', 'top_selling', 'Daily essential.', 'Nearest store on route', 'Packaged MRP item.', false, true)
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
values ('prod-milk-pan', (select id from public.categories where source_key = 'cat-foods'), 'Milk Pan', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Milk Pan price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-beverages-milk-powder', (select id from public.categories where source_key = 'cat-foods'), 'Milk Powder', 'kg', 449, 466.96, 'down', 'MRP Rs 455; offer Rs 449/kg', 'standard', 'Imported from Beverages / Health and milk drinks.', 'Fine Grocery Calicut public listing', 'Fine Grocery Calicut public listing (Observed 2026-06-04). Calicut online grocery listing; service availability depends on selected Calicut location. Source: https://finegrocery.in/', false, true)
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
values ('prod-millet-mix', (select id from public.categories where source_key = 'cat-foods'), 'Millet Mix', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Millet Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-mineral-water', (select id from public.categories where source_key = 'cat-foods'), 'Mineral Water', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mineral Water price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-mixed-fruit-juice', (select id from public.categories where source_key = 'cat-foods'), 'Mixed Fruit Juice', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mixed Fruit Juice price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-mixture', (select id from public.categories where source_key = 'cat-foods'), 'Mixture', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mixture price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-muesli', (select id from public.categories where source_key = 'cat-foods'), 'Muesli', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Muesli price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-murukku', (select id from public.categories where source_key = 'cat-foods'), 'Murukku', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Murukku price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-mysore-pak', (select id from public.categories where source_key = 'cat-foods'), 'Mysore Pak', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mysore Pak price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-nannari-syrup', (select id from public.categories where source_key = 'cat-foods'), 'Nannari Syrup', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nannari Syrup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-ney-pathiri-snack', (select id from public.categories where source_key = 'cat-foods'), 'Ney Pathiri Snack', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Ney Pathiri Snack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-neyyappam', (select id from public.categories where source_key = 'cat-foods'), 'Neyyappam', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Neyyappam price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-noodles', (select id from public.categories where source_key = 'cat-foods'), 'Noodles', 'pack', 48, 50, 'down', 'Brand MRP / offer', 'standard', 'Check brand preference.', 'Smart Bazaar / Vishal comparison', 'Packaged item price should be admin-updated.', true, true)
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
values ('prod-oat-cookies', (select id from public.categories where source_key = 'cat-foods'), 'Oat Cookies', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Oat Cookies price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-oats-upma-mix', (select id from public.categories where source_key = 'cat-foods'), 'Oats Upma Mix', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Oats Upma Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-orange-juice', (select id from public.categories where source_key = 'cat-foods'), 'Orange Juice', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Orange Juice price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-organic-chilli-powder', (select id from public.categories where source_key = 'cat-foods'), 'Organic Chilli Powder', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Chilli Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-organic-coconut-oil', (select id from public.categories where source_key = 'cat-foods'), 'Organic Coconut Oil', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Coconut Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-organic-coriander-powder', (select id from public.categories where source_key = 'cat-foods'), 'Organic Coriander Powder', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Coriander Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-organic-honey', (select id from public.categories where source_key = 'cat-foods'), 'Organic Honey', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Honey price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-organic-jaggery', (select id from public.categories where source_key = 'cat-foods'), 'Organic Jaggery', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Jaggery price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-organic-sugar', (select id from public.categories where source_key = 'cat-foods'), 'Organic Sugar', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Sugar price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-organic-turmeric-powder', (select id from public.categories where source_key = 'cat-foods'), 'Organic Turmeric Powder', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Turmeric Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-ors-drink', (select id from public.categories where source_key = 'cat-foods'), 'ORS Drink', 'bottle', 95, 98.8, 'down', 'Trial estimate: Rs 95/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real ORS Drink price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-pakkavada', (select id from public.categories where source_key = 'cat-foods'), 'Pakkavada', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pakkavada price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-palada-payasam-mix', (select id from public.categories where source_key = 'cat-foods'), 'Palada Payasam Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Palada Payasam Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-pancake-mix', (select id from public.categories where source_key = 'cat-foods'), 'Pancake Mix', 'piece', 28, 29.12, 'down', 'Trial estimate: Rs 28/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pancake Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-papad', (select id from public.categories where source_key = 'cat-foods'), 'Papad', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Papad price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-pappadam', (select id from public.categories where source_key = 'cat-foods'), 'Pappadam', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pappadam price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-parotta', (select id from public.categories where source_key = 'cat-foods'), 'Parotta Pack', 'pack', 60, 60, 'stable', 'Ready food pack', 'popular', 'Quick meal item.', 'Bakery / supermarket comparison', 'Shop-specific ready-food price.', false, true)
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
values ('prod-pasta', (select id from public.categories where source_key = 'cat-foods'), 'Pasta', 'kg', 120, 124.8, 'down', 'Trial estimate: Rs 120/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pasta price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-pathiri-pack', (select id from public.categories where source_key = 'cat-foods'), 'Pathiri Pack', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pathiri Pack price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
values ('prod-payasam-mix', (select id from public.categories where source_key = 'cat-foods'), 'Payasam Mix', 'pack', 72, 74.88, 'down', 'Trial estimate: Rs 72/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Payasam Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
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
