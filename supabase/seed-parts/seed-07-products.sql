-- Generated smaller seed chunk from supabase/seed.sql.
begin;

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-water-bottle', (select id from public.categories where source_key = 'cat-home'), 'Water Bottle', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Water Bottle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-watering-can', (select id from public.categories where source_key = 'cat-home'), 'Watering Can', 'bottle', 125, 130, 'down', 'Trial estimate: Rs 125/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Watering Can price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-wax-strips', (select id from public.categories where source_key = 'cat-home'), 'Wax Strips', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Wax Strips price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-wet-wipes', (select id from public.categories where source_key = 'cat-home'), 'Wet Wipes', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Wet Wipes price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-whisk', (select id from public.categories where source_key = 'cat-home'), 'Whisk', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Whisk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-white-pepper', (select id from public.categories where source_key = 'cat-home'), 'White Pepper', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real White Pepper price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-white-sesame-seeds', (select id from public.categories where source_key = 'cat-home'), 'White Sesame Seeds', 'kg', 92, 95.68, 'down', 'Trial estimate: Rs 92/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real White Sesame Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-yeast', (select id from public.categories where source_key = 'cat-home'), 'Yeast', 'pack', 68, 70.72, 'down', 'Trial estimate: Rs 68/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Yeast price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-zip-lock-bags', (select id from public.categories where source_key = 'cat-home'), 'Zip Lock Bags', 'piece', 42, 43.68, 'down', 'Trial estimate: Rs 42/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Zip Lock Bags price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-avoli', (select id from public.categories where source_key = 'cat-meat'), 'Avoli', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Avoli price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-ayala', (select id from public.categories where source_key = 'cat-meat'), 'Ayala', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Ayala price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-barracuda', (select id from public.categories where source_key = 'cat-meat'), 'Barracuda', 'piece', 75, 78, 'down', 'Trial estimate: Rs 75/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Barracuda price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No exact public Koyilandy/Kozhikode Barracuda price found; needs shop survey.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beef', (select id from public.categories where source_key = 'cat-meat'), 'Beef', 'kg', 180, 180, 'stable', 'Around Rs 180/kg', 'standard', 'Stable benchmark; availability and cut quality must be confirmed by staff.', 'Local meat shop call required', 'Kozhikode public meat benchmark; exact Koyilandy shop rate needs staff confirmation.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beef-curry-cut', (select id from public.categories where source_key = 'cat-meat'), 'Beef Curry Cut', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beef Curry Cut price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beef-cutlet', (select id from public.categories where source_key = 'cat-meat'), 'Beef Cutlet', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beef Cutlet price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beef-liver', (select id from public.categories where source_key = 'cat-meat'), 'Beef Liver', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beef Liver price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beef-meatballs', (select id from public.categories where source_key = 'cat-meat'), 'Beef Meatballs', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beef Meatballs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-beef-mince', (select id from public.categories where source_key = 'cat-meat'), 'Beef Mince', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Beef Mince price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bone-broth-bones', (select id from public.categories where source_key = 'cat-meat'), 'Bone Broth Bones', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bone Broth Bones price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-bread-crumbs', (select id from public.categories where source_key = 'cat-meat'), 'Bread Crumbs', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Bread Crumbs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-brown-bread', (select id from public.categories where source_key = 'cat-meat'), 'Brown Bread', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Brown Bread price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-burger-bun', (select id from public.categories where source_key = 'cat-meat'), 'Burger Bun', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Burger Bun price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-dairy-eggs-and-bakery-butter', (select id from public.categories where source_key = 'cat-meat'), 'Butter', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Butter price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-buttermilk', (select id from public.categories where source_key = 'cat-meat'), 'Buttermilk', 'bottle', 180, 187.2, 'down', 'Trial estimate: Rs 180/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Buttermilk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cake-rusk', (select id from public.categories where source_key = 'cat-meat'), 'Cake Rusk', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cake Rusk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-catla', (select id from public.categories where source_key = 'cat-meat'), 'Catla', 'pack', 159, 165.36, 'down', 'MRP Rs 215; offer Rs 159/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cheese', (select id from public.categories where source_key = 'cat-meat'), 'Cheese', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cheese price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cheese-slices', (select id from public.categories where source_key = 'cat-meat'), 'Cheese Slices', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cheese Slices price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cheese-spread', (select id from public.categories where source_key = 'cat-meat'), 'Cheese Spread', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cheese Spread price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-breast', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Breast', 'kg', 149, 154.96, 'down', 'MRP Rs 158; mapped to boneless chicken retail option', 'standard', 'Imported from Meat & Poultry / Chicken.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-broiler', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Broiler', 'kg', 198, 205, 'down', 'Around Rs 190 - 215/kg', 'top_selling', 'Call shop for live rate before purchase.', 'Local meat shop call required', 'Exact Koyilandy meat rates need staff confirmation.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-burger-patty', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Burger Patty', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Burger Patty price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-curry-cut', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Curry Cut', 'kg', 215, 220, 'down', 'Around Rs 210 - 230/kg', 'popular', 'Common family order; confirm cut size.', 'Local meat shop call required', 'Exact Koyilandy meat rates need staff confirmation.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-cutlet', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Cutlet', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Cutlet price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-gizzard', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Gizzard', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Gizzard price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-kebab', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Kebab', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Kebab price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-leg-piece', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Leg Piece', 'kg', 190, 197.6, 'down', 'MRP Rs 234; offer Rs 190/pack', 'standard', 'Imported from Meat & Poultry / Chicken.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-liver', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Liver', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Liver price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-masala', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Masala', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Masala price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-meatballs', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Meatballs', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Meatballs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-mince', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Mince', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Mince price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-puffs', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Puffs', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Puffs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-salami', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Salami', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Salami price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-sausage', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Sausage', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Chicken Sausage price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-skinless', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Skinless', 'kg', 225, 235, 'down', 'Around Rs 225/kg', 'top_selling', 'Top-selling meat item; call shop before dispatch because meat prices move quickly.', 'Kozhikode meat benchmark; shop call required', 'Kozhikode public meat benchmark; exact Koyilandy shop rate needs staff confirmation.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-soup-bones', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Soup Bones', 'kg', 39, 40.56, 'down', 'MRP Rs 120; offer Rs 39/pack', 'standard', 'Imported from Meat & Poultry / Prepared meat items.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-chicken-wings', (select id from public.categories where source_key = 'cat-meat'), 'Chicken Wings', 'kg', 198, 205.92, 'down', 'MRP Rs 125; offer Rs 99/500g', 'standard', 'Imported from Meat & Poultry / Chicken.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-choora', (select id from public.categories where source_key = 'cat-meat'), 'Choora', 'pack', 379, 394.16, 'down', 'MRP Rs 515; offer Rs 379/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-clams', (select id from public.categories where source_key = 'cat-meat'), 'Clams', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Clams price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No exact public Koyilandy/Kozhikode Clams price found; needs shop survey.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cleaned-prawns', (select id from public.categories where source_key = 'cat-meat'), 'Cleaned Prawns', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cleaned Prawns price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cleaned-squid', (select id from public.categories where source_key = 'cat-meat'), 'Cleaned Squid', 'kg', 690, 717.6, 'down', 'MRP Rs 857; offer Rs 690/pack', 'standard', 'Imported from Fish & Seafood / Seafood.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-condensed-milk', (select id from public.categories where source_key = 'cat-meat'), 'Condensed Milk', 'bottle', 180, 187.2, 'down', 'Trial estimate: Rs 180/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Condensed Milk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-country-chicken', (select id from public.categories where source_key = 'cat-meat'), 'Country Chicken', 'kg', 678, 705.12, 'down', 'MRP Rs 460; offer Rs 339/500g', 'standard', 'Imported from Meat & Poultry / Chicken.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-country-eggs', (select id from public.categories where source_key = 'cat-meat'), 'Country Eggs', 'dozen', 180, 187.2, 'down', 'Trial estimate: Rs 180/dozen - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Country Eggs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-crab', (select id from public.categories where source_key = 'cat-meat'), 'Crab', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Crab price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-cream-bun', (select id from public.categories where source_key = 'cat-meat'), 'Cream Bun', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Cream Bun price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-croissant', (select id from public.categories where source_key = 'cat-meat'), 'Croissant', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Croissant price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-curd', (select id from public.categories where source_key = 'cat-meat'), 'Curd', 'bottle', 180, 187.2, 'down', 'Trial estimate: Rs 180/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Curd price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-dry-fish', (select id from public.categories where source_key = 'cat-meat'), 'Dry Fish', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dry Fish price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-dry-prawns', (select id from public.categories where source_key = 'cat-meat'), 'Dry Prawns', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Dry Prawns price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-duck-eggs', (select id from public.categories where source_key = 'cat-meat'), 'Duck Eggs', 'kg', 125, 130, 'down', '175', 'standard', 'Imported from Dairy, Eggs & Bakery / Eggs.', 'FreshToHome Koyilandy product page', 'FreshToHome Koyilandy product page (Scraped 2026-06-04). Public Koyilandy online listing for fish, chicken, mutton, and seafood products. Source: https://www.freshtohome.com/buy-fish-meat-online/products/koyilandy', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-duck-meat', (select id from public.categories where source_key = 'cat-meat'), 'Duck Meat', 'kg', 798, 829.92, 'down', 'MRP Rs 545; offer Rs 399/500g', 'standard', 'Imported from Meat & Poultry / Meat.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-egg-masala', (select id from public.categories where source_key = 'cat-meat'), 'Egg Masala', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Egg Masala price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-egg-puffs', (select id from public.categories where source_key = 'cat-meat'), 'Egg Puffs', 'dozen', 180, 187.2, 'down', 'Trial estimate: Rs 180/dozen - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Egg Puffs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-egg-whites', (select id from public.categories where source_key = 'cat-meat'), 'Egg Whites', 'dozen', 180, 187.2, 'down', 'Trial estimate: Rs 180/dozen - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Egg Whites price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-emperor-fish', (select id from public.categories where source_key = 'cat-meat'), 'Emperor Fish', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Emperor Fish price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-ayala', (select id from public.categories where source_key = 'cat-meat'), 'Fish Ayala', 'kg', 190, 210, 'down', 'Rs 180 - 230/kg', 'popular', 'Freshness varies daily; staff must confirm.', 'Koyilandy fish market comparison', 'Fish rates are approximate and daily-changing.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-fillet', (select id from public.categories where source_key = 'cat-meat'), 'Fish Fillet', 'kg', 211, 219.44, 'down', 'MRP Rs 333; offer Rs 211/pack', 'standard', 'Imported from Fish & Seafood / Seafood.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-food', (select id from public.categories where source_key = 'cat-meat'), 'Fish Food', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fish Food price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-head', (select id from public.categories where source_key = 'cat-meat'), 'Fish Head', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fish Head price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-king', (select id from public.categories where source_key = 'cat-meat'), 'Fish King Fish', 'kg', 520, 560, 'down', 'Rs 480 - 600/kg', 'standard', 'Premium item; confirm with customer before buying.', 'Koyilandy fish market comparison', 'Fish rates are approximate and daily-changing.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-masala', (select id from public.categories where source_key = 'cat-meat'), 'Fish Masala', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fish Masala price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-pickle', (select id from public.categories where source_key = 'cat-meat'), 'Fish Pickle', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fish Pickle price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-roe', (select id from public.categories where source_key = 'cat-meat'), 'Fish Roe', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fish Roe price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy item price found', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-sardine', (select id from public.categories where source_key = 'cat-meat'), 'Fish Sardine', 'kg', 160, 150, 'up', 'Rs 140 - 180/kg', 'popular', 'Popular seafood order; check morning availability.', 'Koyilandy fish market comparison', 'Fish rates are approximate and daily-changing.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fish-steak', (select id from public.categories where source_key = 'cat-meat'), 'Fish Steak', 'kg', 856, 890.24, 'down', 'Public benchmark: Rs 856/kg', 'standard', 'Imported from Fish & Seafood / Seafood.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-flavored-milk', (select id from public.categories where source_key = 'cat-meat'), 'Flavored Milk', 'bottle', 180, 187.2, 'down', 'Trial estimate: Rs 180/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Flavored Milk price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-fresh-cream', (select id from public.categories where source_key = 'cat-meat'), 'Fresh Cream', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Fresh Cream price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-goat-meat', (select id from public.categories where source_key = 'cat-meat'), 'Goat Meat', 'kg', 1198, 1245.92, 'down', 'MRP Rs 860; offer Rs 599/500g', 'standard', 'Imported from Meat & Poultry / Meat.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kakka', (select id from public.categories where source_key = 'cat-meat'), 'Kakka', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kakka price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kanava', (select id from public.categories where source_key = 'cat-meat'), 'Kanava', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kanava price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-karimeen', (select id from public.categories where source_key = 'cat-meat'), 'Karimeen', 'pack', 259, 269.36, 'down', 'MRP Rs 350; offer Rs 259/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-killi-meen', (select id from public.categories where source_key = 'cat-meat'), 'Killi Meen', 'pack', 359, 373.36, 'down', 'MRP Rs 490; offer Rs 359/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-king-fish', (select id from public.categories where source_key = 'cat-meat'), 'King Fish', 'kg', 1258, 1308.32, 'down', 'MRP Rs 1120; offer Rs 629/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kora', (select id from public.categories where source_key = 'cat-meat'), 'Kora', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Kora price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-kozhuva', (select id from public.categories where source_key = 'cat-meat'), 'Kozhuva', 'pack', 309, 321.36, 'down', 'MRP Rs 420; offer Rs 309/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lamb-chops', (select id from public.categories where source_key = 'cat-meat'), 'Lamb Chops', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lamb Chops price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-lassi', (select id from public.categories where source_key = 'cat-meat'), 'Lassi', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Lassi price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mathi', (select id from public.categories where source_key = 'cat-meat'), 'Mathi', 'piece', 189, 196.56, 'down', 'MRP Rs 270; offer Rs 189/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-meat-masala', (select id from public.categories where source_key = 'cat-meat'), 'Meat Masala', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Meat Masala price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-meat-masala-marinated-chicken', (select id from public.categories where source_key = 'cat-meat'), 'Meat Masala Marinated Chicken', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Meat Masala Marinated Chicken price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-milk-bread', (select id from public.categories where source_key = 'cat-meat'), 'Milk Bread', 'bottle', 180, 187.2, 'down', 'Trial estimate: Rs 180/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Milk Bread price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-milk-powder', (select id from public.categories where source_key = 'cat-meat'), 'Milk Powder', 'kg', 449, 466.96, 'down', 'MRP Rs 455; offer Rs 449/kg', 'standard', 'Imported from Dairy, Eggs & Bakery / Dairy.', 'Fine Grocery Calicut public listing', 'Fine Grocery Calicut public listing (Observed 2026-06-04). Calicut online grocery listing; service availability depends on selected Calicut location. Source: https://finegrocery.in/', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mozzarella-cheese', (select id from public.categories where source_key = 'cat-meat'), 'Mozzarella Cheese', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mozzarella Cheese price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mullan', (select id from public.categories where source_key = 'cat-meat'), 'Mullan', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mullan price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mussels', (select id from public.categories where source_key = 'cat-meat'), 'Mussels', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mussels price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mutton', (select id from public.categories where source_key = 'cat-meat'), 'Mutton', 'kg', 760, 740, 'up', 'Rs 720 - 800/kg', 'standard', 'High-value item; customer confirmation required.', 'Local meat shop call required', 'Exact Koyilandy meat rates need staff confirmation.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mutton-curry-cut', (select id from public.categories where source_key = 'cat-meat'), 'Mutton Curry Cut', 'kg', 1198, 1245.92, 'down', 'MRP Rs 860; offer Rs 599/500g', 'standard', 'Imported from Meat & Poultry / Meat.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mutton-kebab', (select id from public.categories where source_key = 'cat-meat'), 'Mutton Kebab', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mutton Kebab price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-mutton-liver', (select id from public.categories where source_key = 'cat-meat'), 'Mutton Liver', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Mutton Liver price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-netholi', (select id from public.categories where source_key = 'cat-meat'), 'Netholi', 'pack', 309, 321.36, 'down', 'MRP Rs 420; offer Rs 309/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-neymeen', (select id from public.categories where source_key = 'cat-meat'), 'Neymeen', 'pack', 629, 654.16, 'down', 'MRP Rs 1120; offer Rs 629/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-oyster', (select id from public.categories where source_key = 'cat-meat'), 'Oyster', 'pack', 269, 279.76, 'down', 'MRP Rs 365; offer Rs 269/500g', 'standard', 'Imported from Fish & Seafood / Seafood.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-paneer', (select id from public.categories where source_key = 'cat-meat'), 'Paneer', 'piece', 75, 78, 'down', 'Trial estimate: Rs 75/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Paneer price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-parava', (select id from public.categories where source_key = 'cat-meat'), 'Parava', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Parava price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pav-bun', (select id from public.categories where source_key = 'cat-meat'), 'Pav Bun', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pav Bun price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pizza-base', (select id from public.categories where source_key = 'cat-meat'), 'Pizza Base', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pizza Base price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pomfret', (select id from public.categories where source_key = 'cat-meat'), 'Pomfret', 'pack', 859, 893.36, 'down', 'MRP Rs 1175; offer Rs 859/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pork', (select id from public.categories where source_key = 'cat-meat'), 'Pork', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pork price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-pork-curry-cut', (select id from public.categories where source_key = 'cat-meat'), 'Pork Curry Cut', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Pork Curry Cut price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-prawns', (select id from public.categories where source_key = 'cat-meat'), 'Prawns', 'kg', 420, 450, 'down', 'Rs 390 - 480/kg', 'standard', 'Check cleaning requirement with customer.', 'Fish market comparison', 'Seafood prices are approximate.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-puffs', (select id from public.categories where source_key = 'cat-meat'), 'Puffs', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Puffs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-quail', (select id from public.categories where source_key = 'cat-meat'), 'Quail', 'piece', 65, 65, 'stable', 'Rs 60 - 75/piece', 'standard', 'Availability must be confirmed by staff.', 'Local meat shop call required', 'Shop-specific item.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-quail-eggs', (select id from public.categories where source_key = 'cat-meat'), 'Quail Eggs', 'dozen', 4, 4.16, 'down', 'MRP Rs 5; offer Rs 4/piece', 'standard', 'Imported from Dairy, Eggs & Bakery / Eggs.', 'Fine Grocery Calicut public listing', 'Fine Grocery Calicut public listing (Observed 2026-06-04). Calicut online grocery listing; service availability depends on selected Calicut location. Source: https://finegrocery.in/', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-red-snapper', (select id from public.categories where source_key = 'cat-meat'), 'Red Snapper', 'pack', 569, 591.76, 'down', 'MRP Rs 775; offer Rs 569/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-rohu', (select id from public.categories where source_key = 'cat-meat'), 'Rohu', 'pack', 119, 123.76, 'down', 'MRP Rs 200; offer Rs 119/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-sea-bass', (select id from public.categories where source_key = 'cat-meat'), 'Sea Bass', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Sea Bass price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-seafood-mix', (select id from public.categories where source_key = 'cat-meat'), 'Seafood Mix', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Seafood Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-small-prawns', (select id from public.categories where source_key = 'cat-meat'), 'Small Prawns', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Small Prawns price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-sponge-cake', (select id from public.categories where source_key = 'cat-meat'), 'Sponge Cake', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Sponge Cake price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-squid', (select id from public.categories where source_key = 'cat-meat'), 'Squid', 'kg', 460, 478.4, 'down', 'MRP Rs 629; offer Rs 460/pack', 'standard', 'Imported from Fish & Seafood / Seafood.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-sweet-bun', (select id from public.categories where source_key = 'cat-meat'), 'Sweet Bun', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Sweet Bun price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-tea-cake', (select id from public.categories where source_key = 'cat-meat'), 'Tea Cake', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Tea Cake price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-threadfin-bream', (select id from public.categories where source_key = 'cat-meat'), 'Threadfin Bream', 'pack', 359, 373.36, 'down', 'MRP Rs 490; offer Rs 359/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-tiger-prawns', (select id from public.categories where source_key = 'cat-meat'), 'Tiger Prawns', 'kg', 1338, 1391.52, 'down', 'MRP Rs 915; offer Rs 669/500g', 'standard', 'Imported from Fish & Seafood / Seafood.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-tilapia', (select id from public.categories where source_key = 'cat-meat'), 'Tilapia', 'pack', 109, 113.36, 'down', 'MRP Rs 190; offer Rs 109/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-trevally', (select id from public.categories where source_key = 'cat-meat'), 'Trevally', 'pack', 469, 487.76, 'down', 'MRP Rs 640; offer Rs 469/500g', 'standard', 'Imported from Fish & Seafood / Common fish.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-turkey-meat', (select id from public.categories where source_key = 'cat-meat'), 'Turkey Meat', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Turkey Meat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-vatta', (select id from public.categories where source_key = 'cat-meat'), 'Vatta', 'kg', 938, 975.52, 'down', 'MRP Rs 640; offer Rs 469/500g', 'standard', 'Imported from Fish & Seafood / Kerala fish names.', 'FreshToHome Kozhikode product page', 'FreshToHome Kozhikode product page (2026-06-04). Kozhikode online fish, poultry, mutton, and seafood listing; prices are public online prices and can change. Source: https://www.freshtohome.com/buy-fish-meat-online/products/kozhikode', false, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-veg-puffs', (select id from public.categories where source_key = 'cat-meat'), 'Veg Puffs', 'pack', 180, 187.2, 'down', 'Trial estimate: Rs 180/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Veg Puffs price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-whole-wheat-bread', (select id from public.categories where source_key = 'cat-meat'), 'Whole Wheat Bread', 'kg', 260, 270.4, 'down', 'Trial estimate: Rs 260/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Whole Wheat Bread price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-adai-dal-mix', (select id from public.categories where source_key = 'cat-rice'), 'Adai Dal Mix', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Adai Dal Mix price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-almond-flour', (select id from public.categories where source_key = 'cat-rice'), 'Almond Flour', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Almond Flour price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-appam-podi', (select id from public.categories where source_key = 'cat-rice'), 'Appam Podi', 'pack', 85, 88.4, 'down', 'Trial estimate: Rs 85/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Appam Podi price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-arrowroot-powder', (select id from public.categories where source_key = 'cat-rice'), 'Arrowroot Powder', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Arrowroot Powder price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-atta', (select id from public.categories where source_key = 'cat-rice'), 'Atta', 'kg', 72, 74.88, 'down', 'Public range Rs 20 - 40; mapped to 1kg upper listed option', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Atta price after shop survey.', 'Fine Grocery Calicut public listing', 'Trial estimated price only; editable after shop survey. Fine Grocery Calicut public listing (Observed 2026-06-04). Fine Grocery Calicut public listing exposed a price range, but not one exact current SKU price for this generic catalog row. Source: https://finegrocery.in/', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-aval-rice-flakes', (select id from public.categories where source_key = 'cat-rice'), 'Aval Rice Flakes', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Aval Rice Flakes price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-barley', (select id from public.categories where source_key = 'cat-rice'), 'Barley', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Barley price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-barley-flour', (select id from public.categories where source_key = 'cat-rice'), 'Barley Flour', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Barley Flour price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-basmati-rice', (select id from public.categories where source_key = 'cat-rice'), 'Basmati Rice', 'kg', 118, 120, 'down', 'Brand MRP / shop offer', 'standard', 'Compare brand offers.', 'Smart Bazaar / Extra comparison', 'Brand-specific price should be admin-updated.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-besan-flour', (select id from public.categories where source_key = 'cat-rice'), 'Besan Flour', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Besan Flour price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-black-chickpeas', (select id from public.categories where source_key = 'cat-rice'), 'Black Chickpeas', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Black Chickpeas price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-black-eyed-peas', (select id from public.categories where source_key = 'cat-rice'), 'Black Eyed Peas', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Black Eyed Peas price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-black-urad-dal', (select id from public.categories where source_key = 'cat-rice'), 'Black Urad Dal', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Black Urad Dal price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-boiled-rice', (select id from public.categories where source_key = 'cat-rice'), 'Boiled Rice', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Boiled Rice price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-broad-beans', (select id from public.categories where source_key = 'cat-rice'), 'Broad Beans', 'kg', 42, 43.68, 'down', 'Retail range Rs 50 - 63/kg', 'standard', 'Imported from Pulses & Legumes / Beans and peas.', 'Today Price Rates Kozhikode vegetable market', 'Today Price Rates Kozhikode vegetable market (2026-06-04). Kozhikode mandi benchmark with retail range from Today Price Rates; retail shop price can vary by area, quality, and shop. Source: https://market.todaypricerates.com/Kozhikode-vegetables-price-in-Kerala', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-broken-rice', (select id from public.categories where source_key = 'cat-rice'), 'Broken Rice', 'kg', 42, 43, 'down', 'Admin-maintained local store price', 'standard', 'Value option for household use.', 'Supplyco comparison', 'Admin-maintained local price.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-broken-wheat', (select id from public.categories where source_key = 'cat-rice'), 'Broken Wheat', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Broken Wheat price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-brown-rice', (select id from public.categories where source_key = 'cat-rice'), 'Brown Rice', 'kg', 72, 74.88, 'down', 'Trial estimate: Rs 72/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Brown Rice price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-butter-beans', (select id from public.categories where source_key = 'cat-rice'), 'Butter Beans', 'kg', 41, 42.64, 'down', 'Retail range Rs 49 - 62/kg', 'standard', 'Imported from Pulses & Legumes / Beans and peas.', 'Today Price Rates Kozhikode vegetable market', 'Today Price Rates Kozhikode vegetable market (2026-06-04). Kozhikode mandi benchmark with retail range from Today Price Rates; retail shop price can vary by area, quality, and shop. Source: https://market.todaypricerates.com/Kozhikode-vegetables-price-in-Kerala', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
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
