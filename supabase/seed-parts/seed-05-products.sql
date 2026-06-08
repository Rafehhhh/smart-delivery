-- Generated smaller seed chunk from supabase/seed.sql.
begin;

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-jaggery-for-prasadam', (select id from public.categories where source_key = 'cat-home'), 'Jaggery For Prasadam', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Jaggery For Prasadam price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-jam', (select id from public.categories where source_key = 'cat-home'), 'Jam', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Jam price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-jasmine-flowers', (select id from public.categories where source_key = 'cat-home'), 'Jasmine Flowers', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Jasmine Flowers price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kadai', (select id from public.categories where source_key = 'cat-home'), 'Kadai', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kadai price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kajal', (select id from public.categories where source_key = 'cat-home'), 'Kajal', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kajal price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kallappam-mix', (select id from public.categories where source_key = 'cat-home'), 'Kallappam Mix', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kallappam Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kanthari-chilli', (select id from public.categories where source_key = 'cat-home'), 'Kanthari Chilli', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kanthari Chilli price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kashmiri-chilli-powder', (select id from public.categories where source_key = 'cat-home'), 'Kashmiri Chilli Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kashmiri Chilli Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-key-ring', (select id from public.categories where source_key = 'cat-home'), 'Key Ring', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Key Ring price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kids-shampoo', (select id from public.categories where source_key = 'cat-home'), 'Kids Shampoo', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kids Shampoo price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kids-soap', (select id from public.categories where source_key = 'cat-home'), 'Kids Soap', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kids Soap price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kids-toothbrush', (select id from public.categories where source_key = 'cat-home'), 'Kids Toothbrush', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kids Toothbrush price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kids-toothpaste', (select id from public.categories where source_key = 'cat-home'), 'Kids Toothpaste', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kids Toothpaste price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kids-water-bottle', (select id from public.categories where source_key = 'cat-home'), 'Kids Water Bottle', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kids Water Bottle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kitchen-cleaner', (select id from public.categories where source_key = 'cat-home'), 'Kitchen Cleaner', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kitchen Cleaner price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kitchen-gloves', (select id from public.categories where source_key = 'cat-home'), 'Kitchen Gloves', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kitchen Gloves price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kitchen-lighter', (select id from public.categories where source_key = 'cat-home'), 'Kitchen Lighter', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kitchen Lighter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kitchen-towel', (select id from public.categories where source_key = 'cat-home'), 'Kitchen Towel', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kitchen Towel price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-knife', (select id from public.categories where source_key = 'cat-home'), 'Knife', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Knife price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kudampuli', (select id from public.categories where source_key = 'cat-home'), 'Kudampuli', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kudampuli price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kumkum', (select id from public.categories where source_key = 'cat-home'), 'Kumkum', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kumkum price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-labels', (select id from public.categories where source_key = 'cat-home'), 'Labels', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Labels price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-ladle', (select id from public.categories where source_key = 'cat-home'), 'Ladle', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Ladle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lamp-oil', (select id from public.categories where source_key = 'cat-home'), 'Lamp Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lamp Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lancets', (select id from public.categories where source_key = 'cat-home'), 'Lancets', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lancets price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-laundry-bag', (select id from public.categories where source_key = 'cat-home'), 'Laundry Bag', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Laundry Bag price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-laundry-basket', (select id from public.categories where source_key = 'cat-home'), 'Laundry Basket', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Laundry Basket price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-laundry-brush', (select id from public.categories where source_key = 'cat-home'), 'Laundry Brush', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Laundry Brush price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-laundry-sanitizer', (select id from public.categories where source_key = 'cat-home'), 'Laundry Sanitizer', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Laundry Sanitizer price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-leave-in-conditioner', (select id from public.categories where source_key = 'cat-home'), 'Leave In Conditioner', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Leave In Conditioner price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-led-bulb', (select id from public.categories where source_key = 'cat-home'), 'LED Bulb', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real LED Bulb price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lime-pickle', (select id from public.categories where source_key = 'cat-home'), 'Lime Pickle', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lime Pickle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lint-roller', (select id from public.categories where source_key = 'cat-home'), 'Lint Roller', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lint Roller price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lip-balm', (select id from public.categories where source_key = 'cat-home'), 'Lip Balm', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lip Balm price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lip-gloss', (select id from public.categories where source_key = 'cat-home'), 'Lip Gloss', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lip Gloss price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lipstick', (select id from public.categories where source_key = 'cat-home'), 'Lipstick', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lipstick price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-long-notebook', (select id from public.categories where source_key = 'cat-home'), 'Long Notebook', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Long Notebook price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-long-pepper', (select id from public.categories where source_key = 'cat-home'), 'Long Pepper', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Long Pepper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-loofah', (select id from public.categories where source_key = 'cat-home'), 'Loofah', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Loofah price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-loose-flowers', (select id from public.categories where source_key = 'cat-home'), 'Loose Flowers', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Loose Flowers price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-luggage-tag', (select id from public.categories where source_key = 'cat-home'), 'Luggage Tag', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Luggage Tag price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lunch-box', (select id from public.categories where source_key = 'cat-home'), 'Lunch Box', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lunch Box price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mace', (select id from public.categories where source_key = 'cat-home'), 'Mace', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mace price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-makeup-brush', (select id from public.categories where source_key = 'cat-home'), 'Makeup Brush', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Makeup Brush price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-makeup-cotton-pads', (select id from public.categories where source_key = 'cat-home'), 'Makeup Cotton Pads', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Makeup Cotton Pads price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-makeup-remover', (select id from public.categories where source_key = 'cat-home'), 'Makeup Remover', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Makeup Remover price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mango-pickle', (select id from public.categories where source_key = 'cat-home'), 'Mango Pickle', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mango Pickle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-marathi-moggu', (select id from public.categories where source_key = 'cat-home'), 'Marathi Moggu', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Marathi Moggu price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-margarine', (select id from public.categories where source_key = 'cat-home'), 'Margarine', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Margarine price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-marker', (select id from public.categories where source_key = 'cat-home'), 'Marker', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Marker price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-masala-box', (select id from public.categories where source_key = 'cat-home'), 'Masala Box', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Masala Box price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mascara', (select id from public.categories where source_key = 'cat-home'), 'Mascara', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mascara price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mask', (select id from public.categories where source_key = 'cat-home'), 'Mask', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mask price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-matchbox', (select id from public.categories where source_key = 'cat-home'), 'Matchbox', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Matchbox price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-maternity-pads', (select id from public.categories where source_key = 'cat-home'), 'Maternity Pads', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Maternity Pads price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mayonnaise', (select id from public.categories where source_key = 'cat-home'), 'Mayonnaise', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mayonnaise price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-measuring-cup', (select id from public.categories where source_key = 'cat-home'), 'Measuring Cup', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Measuring Cup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-measuring-spoon', (select id from public.categories where source_key = 'cat-home'), 'Measuring Spoon', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Measuring Spoon price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-measuring-tape', (select id from public.categories where source_key = 'cat-home'), 'Measuring Tape', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Measuring Tape price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-medical-tape', (select id from public.categories where source_key = 'cat-home'), 'Medical Tape', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Medical Tape price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mehndi-cone', (select id from public.categories where source_key = 'cat-home'), 'Mehndi Cone', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mehndi Cone price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-menstrual-cup', (select id from public.categories where source_key = 'cat-home'), 'Menstrual Cup', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Menstrual Cup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-microfiber-cloth', (select id from public.categories where source_key = 'cat-home'), 'Microfiber Cloth', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Microfiber Cloth price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mirror', (select id from public.categories where source_key = 'cat-home'), 'Mirror', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mirror price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mixer-jar', (select id from public.categories where source_key = 'cat-home'), 'Mixer Jar', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mixer Jar price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-moisturizer', (select id from public.categories where source_key = 'cat-home'), 'Moisturizer', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Moisturizer price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mop', (select id from public.categories where source_key = 'cat-home'), 'Mop', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mop price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mop-liquid', (select id from public.categories where source_key = 'cat-home'), 'Mop Liquid', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mop Liquid price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mop-refill', (select id from public.categories where source_key = 'cat-home'), 'Mop Refill', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mop Refill price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mosquito-bat', (select id from public.categories where source_key = 'cat-home'), 'Mosquito Bat', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mosquito Bat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mosquito-bite-cream', (select id from public.categories where source_key = 'cat-home'), 'Mosquito Bite Cream', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mosquito Bite Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mosquito-bite-ointment', (select id from public.categories where source_key = 'cat-home'), 'Mosquito Bite Ointment', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mosquito Bite Ointment price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mosquito-coil', (select id from public.categories where source_key = 'cat-home'), 'Mosquito Coil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mosquito Coil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mosquito-liquid-vaporizer', (select id from public.categories where source_key = 'cat-home'), 'Mosquito Liquid Vaporizer', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mosquito Liquid Vaporizer price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mosquito-net', (select id from public.categories where source_key = 'cat-home'), 'Mosquito Net', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mosquito Net price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mosquito-repellent', (select id from public.categories where source_key = 'cat-home'), 'Mosquito Repellent', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mosquito Repellent price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mouthwash', (select id from public.categories where source_key = 'cat-home'), 'Mouthwash', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mouthwash price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mug', (select id from public.categories where source_key = 'cat-home'), 'Mug', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mug price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-multani-mitti', (select id from public.categories where source_key = 'cat-home'), 'Multani Mitti', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Multani Mitti price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-multivitamin-food-supplement', (select id from public.categories where source_key = 'cat-home'), 'Multivitamin Food Supplement', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Multivitamin Food Supplement price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mustard-oil', (select id from public.categories where source_key = 'cat-home'), 'Mustard Oil', 'kg', 90, 93.6, 'down', 'MRP Rs 110; offer Rs 90/500ml', 'standard', 'Imported from Oils, Ghee & Cooking Fats / Cooking oils.', 'Fine Grocery Calicut public listing', 'Fine Grocery Calicut public listing (Observed 2026-06-04). Calicut online grocery listing; service availability depends on selected Calicut location. Source: https://finegrocery.in/', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mustard-sauce', (select id from public.categories where source_key = 'cat-home'), 'Mustard Sauce', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mustard Sauce price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mustard-seeds', (select id from public.categories where source_key = 'cat-home'), 'Mustard Seeds', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mustard Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nail-brush', (select id from public.categories where source_key = 'cat-home'), 'Nail Brush', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nail Brush price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nail-cutter', (select id from public.categories where source_key = 'cat-home'), 'Nail Cutter', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nail Cutter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nail-file', (select id from public.categories where source_key = 'cat-home'), 'Nail File', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nail File price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nail-polish', (select id from public.categories where source_key = 'cat-home'), 'Nail Polish', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nail Polish price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nail-polish-remover', (select id from public.categories where source_key = 'cat-home'), 'Nail Polish Remover', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nail Polish Remover price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nails', (select id from public.categories where source_key = 'cat-home'), 'Nails', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nails price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-neck-pillow', (select id from public.categories where source_key = 'cat-home'), 'Neck Pillow', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Neck Pillow price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-neem-cake', (select id from public.categories where source_key = 'cat-home'), 'Neem Cake', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Neem Cake price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-neem-oil-spray', (select id from public.categories where source_key = 'cat-home'), 'Neem Oil Spray', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Neem Oil Spray price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-newborn-diaper', (select id from public.categories where source_key = 'cat-home'), 'Newborn Diaper', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Newborn Diaper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nigella-seeds', (select id from public.categories where source_key = 'cat-home'), 'Nigella Seeds', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nigella Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-night-cream', (select id from public.categories where source_key = 'cat-home'), 'Night Cream', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Night Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nonstick-pan', (select id from public.categories where source_key = 'cat-home'), 'Nonstick Pan', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nonstick Pan price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-notebook', (select id from public.categories where source_key = 'cat-home'), 'Notebook', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Notebook price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-nutmeg', (select id from public.categories where source_key = 'cat-home'), 'Nutmeg', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Nutmeg price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-odour-remover', (select id from public.categories where source_key = 'cat-home'), 'Odour Remover', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Odour Remover price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-olive-oil', (select id from public.categories where source_key = 'cat-home'), 'Olive Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Olive Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-organic-manure', (select id from public.categories where source_key = 'cat-home'), 'Organic Manure', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Organic Manure price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-ors-powder', (select id from public.categories where source_key = 'cat-home'), 'ORS Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real ORS Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-outdoor-broom', (select id from public.categories where source_key = 'cat-home'), 'Outdoor Broom', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Outdoor Broom price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-outdoor-dustbin', (select id from public.categories where source_key = 'cat-home'), 'Outdoor Dustbin', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Outdoor Dustbin price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-overnight-sanitary-pads', (select id from public.categories where source_key = 'cat-home'), 'Overnight Sanitary Pads', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Overnight Sanitary Pads price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-ovulation-test-kit', (select id from public.categories where source_key = 'cat-home'), 'Ovulation Test Kit', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Ovulation Test Kit price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-padlock', (select id from public.categories where source_key = 'cat-home'), 'Padlock', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Padlock price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pain-balm', (select id from public.categories where source_key = 'cat-home'), 'Pain Balm', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pain Balm price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-palappam-mix', (select id from public.categories where source_key = 'cat-home'), 'Palappam Mix', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Palappam Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-palm-jaggery', (select id from public.categories where source_key = 'cat-home'), 'Palm Jaggery', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Palm Jaggery price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-palm-oil', (select id from public.categories where source_key = 'cat-home'), 'Palm Oil', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Palm Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-panty-liners', (select id from public.categories where source_key = 'cat-home'), 'Panty Liners', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Panty Liners price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-paper-clips', (select id from public.categories where source_key = 'cat-home'), 'Paper Clips', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Paper Clips price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-paper-cup', (select id from public.categories where source_key = 'cat-home'), 'Paper Cup', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Paper Cup price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-paper-decoration', (select id from public.categories where source_key = 'cat-home'), 'Paper Decoration', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Paper Decoration price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-paper-napkin', (select id from public.categories where source_key = 'cat-home'), 'Paper Napkin', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Paper Napkin price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-paper-plate', (select id from public.categories where source_key = 'cat-home'), 'Paper Plate', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Paper Plate price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pathiri-podi', (select id from public.categories where source_key = 'cat-home'), 'Pathiri Podi', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pathiri Podi price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-payasam-ada', (select id from public.categories where source_key = 'cat-home'), 'Payasam Ada', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Payasam Ada price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-payasam-spice-mix', (select id from public.categories where source_key = 'cat-home'), 'Payasam Spice Mix', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Payasam Spice Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-peanut-butter', (select id from public.categories where source_key = 'cat-home'), 'Peanut Butter', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Peanut Butter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-peanut-chutney-powder', (select id from public.categories where source_key = 'cat-home'), 'Peanut Chutney Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Peanut Chutney Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-peeler', (select id from public.categories where source_key = 'cat-home'), 'Peeler', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Peeler price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pen', (select id from public.categories where source_key = 'cat-home'), 'Pen', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pen price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pencil', (select id from public.categories where source_key = 'cat-home'), 'Pencil', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pencil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pepper', (select id from public.categories where source_key = 'cat-home'), 'Pepper', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pepper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-perfume', (select id from public.categories where source_key = 'cat-home'), 'Perfume', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Perfume price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-period-pain-patch', (select id from public.categories where source_key = 'cat-home'), 'Period Pain Patch', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Period Pain Patch price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-personal-hygiene-spray', (select id from public.categories where source_key = 'cat-home'), 'Personal Hygiene Spray', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Personal Hygiene Spray price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-petroleum-jelly', (select id from public.categories where source_key = 'cat-home'), 'Petroleum Jelly', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Petroleum Jelly price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-phenyl', (select id from public.categories where source_key = 'cat-home'), 'Phenyl', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Phenyl price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pickle-jar', (select id from public.categories where source_key = 'cat-home'), 'Pickle Jar', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pickle Jar price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pickle-powder', (select id from public.categories where source_key = 'cat-home'), 'Pickle Powder', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pickle Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pizza-sauce', (select id from public.categories where source_key = 'cat-home'), 'Pizza Sauce', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pizza Sauce price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-plant-fertilizer', (select id from public.categories where source_key = 'cat-home'), 'Plant Fertilizer', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Plant Fertilizer price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-plant-pot', (select id from public.categories where source_key = 'cat-home'), 'Plant Pot', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Plant Pot price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-plant-tonic', (select id from public.categories where source_key = 'cat-home'), 'Plant Tonic', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Plant Tonic price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-plastic-container', (select id from public.categories where source_key = 'cat-home'), 'Plastic Container', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Plastic Container price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pliers', (select id from public.categories where source_key = 'cat-home'), 'Pliers', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pliers price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-plug-adapter', (select id from public.categories where source_key = 'cat-home'), 'Plug Adapter', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Plug Adapter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-plumber-tape', (select id from public.categories where source_key = 'cat-home'), 'Plumber Tape', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Plumber Tape price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-plunger', (select id from public.categories where source_key = 'cat-home'), 'Plunger', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Plunger price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pocket-tissue', (select id from public.categories where source_key = 'cat-home'), 'Pocket Tissue', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pocket Tissue price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-poppy-seeds', (select id from public.categories where source_key = 'cat-home'), 'Poppy Seeds', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Poppy Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pot-holder', (select id from public.categories where source_key = 'cat-home'), 'Pot Holder', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pot Holder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-potting-soil', (select id from public.categories where source_key = 'cat-home'), 'Potting Soil', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Potting Soil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-prawn-pickle', (select id from public.categories where source_key = 'cat-home'), 'Prawn Pickle', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Prawn Pickle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-prayer-beads', (select id from public.categories where source_key = 'cat-home'), 'Prayer Beads', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Prayer Beads price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-prayer-mat', (select id from public.categories where source_key = 'cat-home'), 'Prayer Mat', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Prayer Mat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pregnancy-test-kit', (select id from public.categories where source_key = 'cat-home'), 'Pregnancy Test Kit', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pregnancy Test Kit price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
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
