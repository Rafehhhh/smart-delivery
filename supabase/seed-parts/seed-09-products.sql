-- Generated smaller seed chunk from supabase/seed.sql.
begin;

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-spinach', (select id from public.categories where source_key = 'cat-vegetables'), 'Spinach', 'pack', 16, 16.64, 'down', 'Retail range Rs 19 - 24/kg', 'standard', 'Imported from Vegetables / Leafy vegetables.', 'Today Price Rates Kozhikode vegetable market', 'Today Price Rates Kozhikode vegetable market (2026-06-04). Kozhikode mandi benchmark with retail range from Today Price Rates; retail shop price can vary by area, quality, and shop. Source: https://market.todaypricerates.com/Kozhikode-vegetables-price-in-Kerala', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-spring-onion', (select id from public.categories where source_key = 'cat-vegetables'), 'Spring Onion', 'pack', 37, 38.48, 'down', 'Retail range Rs 44 - 56/kg', 'standard', 'Imported from Vegetables / Leafy vegetables.', 'Today Price Rates Kozhikode vegetable market', 'Today Price Rates Kozhikode vegetable market (2026-06-04). Kozhikode mandi benchmark with retail range from Today Price Rates; retail shop price can vary by area, quality, and shop. Source: https://market.todaypricerates.com/Kozhikode-vegetables-price-in-Kerala', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-sweet-corn', (select id from public.categories where source_key = 'cat-vegetables'), 'Sweet Corn', 'pack', 24, 24.96, 'down', 'Retail range Rs 29 - 36/kg', 'standard', 'Imported from Vegetables / Seasonal and specialty vegetables.', 'Today Price Rates Kozhikode vegetable market', 'Today Price Rates Kozhikode vegetable market (2026-06-04). Kozhikode mandi benchmark with retail range from Today Price Rates; retail shop price can vary by area, quality, and shop. Source: https://market.todaypricerates.com/Kozhikode-vegetables-price-in-Kerala', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-sweet-potato', (select id from public.categories where source_key = 'cat-vegetables'), 'Sweet Potato', 'piece', 36, 37.44, 'down', 'Retail range Rs 43 - 54/kg', 'standard', 'Imported from Vegetables / Roots and tubers.', 'Today Price Rates Kozhikode vegetable market', 'Today Price Rates Kozhikode vegetable market (2026-06-04). Kozhikode mandi benchmark with retail range from Today Price Rates; retail shop price can vary by area, quality, and shop. Source: https://market.todaypricerates.com/Kozhikode-vegetables-price-in-Kerala', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-tapioca', (select id from public.categories where source_key = 'cat-vegetables'), 'Tapioca', 'pack', 45, 46.8, 'down', 'Trial estimate: Rs 45/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Tapioca price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-taro-root', (select id from public.categories where source_key = 'cat-vegetables'), 'Taro Root', 'pack', 45, 46.8, 'down', 'Trial estimate: Rs 45/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Taro Root price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-tomato', (select id from public.categories where source_key = 'cat-vegetables'), 'Tomato', 'kg', 42, 44, 'down', 'Rs 37 - 50/kg', 'top_selling', 'Best for regular household orders; compare market rate before buying in bulk.', 'Koyilandy local vegetable market benchmark', 'Kozhikode/Koyilandy public market benchmark; exact shop prices should be updated by admin survey.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-turnip', (select id from public.categories where source_key = 'cat-vegetables'), 'Turnip', 'pack', 45, 46.8, 'down', 'Trial estimate: Rs 45/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Turnip price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-vegetable-knife', (select id from public.categories where source_key = 'cat-vegetables'), 'Vegetable Knife', 'piece', 28, 29.12, 'down', 'Trial estimate: Rs 28/piece - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Vegetable Knife price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-vegetable-oil', (select id from public.categories where source_key = 'cat-vegetables'), 'Vegetable Oil', 'bottle', 45, 46.8, 'down', 'Trial estimate: Rs 45/bottle - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Vegetable Oil price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-vegetable-seeds', (select id from public.categories where source_key = 'cat-vegetables'), 'Vegetable Seeds', 'kg', 58, 60.32, 'down', 'Trial estimate: Rs 58/kg - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Vegetable Seeds price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-yam', (select id from public.categories where source_key = 'cat-vegetables'), 'Yam', 'pack', 45, 46.8, 'down', 'Trial estimate: Rs 45/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Yam price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
  price_trend = excluded.price_trend,
  retail_range = excluded.retail_range,
  popularity = excluded.popularity,
  recommendation = excluded.recommendation,
  best_value_shop = excluded.best_value_shop,
  source_note = excluded.source_note,
  is_approximate_price = excluded.is_approximate_price,
  is_available = excluded.is_available,
  updated_at = now();

insert into public.products (source_key, category_id, name, unit, price, previous_week_price, price_trend, retail_range, popularity, recommendation, best_value_shop, source_note, is_approximate_price, is_available)
values ('prod-zucchini', (select id from public.categories where source_key = 'cat-vegetables'), 'Zucchini', 'pack', 45, 46.8, 'down', 'Trial estimate: Rs 45/pack - editable after shop survey', 'standard', 'Trial estimate for app testing. Admin should replace this with the real Zucchini price after shop survey.', 'Koyilandy shop survey required', 'Trial estimated price only; editable after shop survey. Price pending: shop survey required for Koyilandy. No public Koyilandy-area item price found; needs Extra/Reliance/local shop survey or POS export.', true, true)
on conflict (source_key) do update set
  category_id = excluded.category_id,
  name = excluded.name,
  unit = excluded.unit,
  price = excluded.price,
  previous_week_price = excluded.previous_week_price,
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
