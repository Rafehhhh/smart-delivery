import fs from "node:fs";
import path from "node:path";
import vm from "node:vm";
import { createRequire } from "node:module";
import ts from "typescript";

const rootDir = process.cwd();
const nodeRequire = createRequire(import.meta.url);
const moduleCache = new Map();

function resolveLocalModule(parentFile, request) {
  const base = path.resolve(path.dirname(parentFile), request);
  const candidates = [base, `${base}.ts`, `${base}.tsx`, `${base}.js`, path.join(base, "index.ts")];
  const found = candidates.find((candidate) => fs.existsSync(candidate) && fs.statSync(candidate).isFile());
  if (!found) {
    throw new Error(`Cannot resolve ${request} from ${parentFile}`);
  }
  return found;
}

function loadTsModule(filePath) {
  const absolutePath = path.resolve(rootDir, filePath);
  if (moduleCache.has(absolutePath)) return moduleCache.get(absolutePath).exports;

  const source = fs.readFileSync(absolutePath, "utf8");
  const { outputText } = ts.transpileModule(source, {
    compilerOptions: {
      module: ts.ModuleKind.CommonJS,
      target: ts.ScriptTarget.ES2022,
      esModuleInterop: true
    },
    fileName: absolutePath
  });

  const module = { exports: {} };
  moduleCache.set(absolutePath, module);

  const localRequire = (request) => {
    if (request.startsWith(".")) return loadTsModule(resolveLocalModule(absolutePath, request));
    return nodeRequire(request);
  };

  const script = new vm.Script(`(function(require, exports, module) { ${outputText}\n})`, {
    filename: absolutePath
  });
  script.runInThisContext()(localRequire, module.exports, module);
  return module.exports;
}

function sqlString(value) {
  if (value === null || value === undefined) return "null";
  return `'${String(value).replace(/'/g, "''")}'`;
}

function sqlNumber(value) {
  if (value === null || value === undefined || Number.isNaN(Number(value))) return "null";
  return String(Number(value));
}

function bool(value) {
  return value ? "true" : "false";
}

function writeCategorySeed(categories) {
  const rows = categories.map((category, index) =>
    `  (${sqlString(category.id)}, ${sqlString(category.name)}, ${sqlString(category.description)}, ${index})`
  );

  return `insert into public.categories (source_key, name, description, sort_order)\nvalues\n${rows.join(",\n")}\non conflict (source_key) do update set\n  name = excluded.name,\n  description = excluded.description,\n  sort_order = excluded.sort_order;\n`;
}

function writeProductSeed(products) {
  return products
    .map((product) => {
      const columns = [
        "source_key",
        "category_id",
        "name",
        "unit",
        "price",
        "previous_week_price",
        "price_trend",
        "retail_range",
        "popularity",
        "recommendation",
        "best_value_shop",
        "source_note",
        "is_approximate_price",
        "is_available"
      ];
      const values = [
        sqlString(product.id),
        `(select id from public.categories where source_key = ${sqlString(product.categoryId)})`,
        sqlString(product.name),
        sqlString(product.unit),
        sqlNumber(product.price),
        sqlNumber(product.previousWeekPrice),
        sqlString(product.priceTrend),
        sqlString(product.retailRange),
        sqlString(product.popularity),
        sqlString(product.recommendation),
        sqlString(product.bestValueShop),
        sqlString(product.sourceNote),
        bool(product.isApproximatePrice),
        bool(product.isAvailable)
      ];

      return `insert into public.products (${columns.join(", ")})\nvalues (${values.join(", ")})\non conflict (source_key) do update set\n  category_id = excluded.category_id,\n  name = excluded.name,\n  unit = excluded.unit,\n  price = excluded.price,\n  previous_week_price = excluded.previous_week_price,\n  price_trend = excluded.price_trend,\n  retail_range = excluded.retail_range,\n  popularity = excluded.popularity,\n  recommendation = excluded.recommendation,\n  best_value_shop = excluded.best_value_shop,\n  source_note = excluded.source_note,\n  is_approximate_price = excluded.is_approximate_price,\n  is_available = excluded.is_available,\n  updated_at = now();`;
    })
    .join("\n\n");
}

function writeSlotSeed(slots) {
  const rows = slots.map((slot) =>
    `  (${sqlString(slot.id)}, ${sqlString(slot.label)}, ${sqlString(slot.startsAt)}, ${sqlString(slot.endsAt)}, ${slot.capacity}, ${slot.reserved}, true)`
  );

  return `insert into public.delivery_slots (source_key, label, starts_at, ends_at, capacity, reserved, is_active)\nvalues\n${rows.join(",\n")}\non conflict (source_key) do update set\n  label = excluded.label,\n  starts_at = excluded.starts_at,\n  ends_at = excluded.ends_at,\n  capacity = excluded.capacity,\n  reserved = excluded.reserved,\n  is_active = excluded.is_active;\n`;
}

function writeServiceFeeSeed(rule) {
  return `insert into public.service_fee_rules (name, flat_fee, free_delivery_minimum, is_active)\nselect ${sqlString(rule.name)}, ${sqlNumber(rule.flatFee)}, ${sqlNumber(rule.freeDeliveryMinimum)}, true\nwhere not exists (select 1 from public.service_fee_rules where is_active = true);\n`;
}

function writePaymentMethodSeed() {
  return `insert into public.payment_methods (mode, provider, display_name, is_enabled)\nvalues\n  ('cash', 'cash', 'Cash on delivery', true),\n  ('upi', 'razorpay', 'UPI via Razorpay', false),\n  ('card', 'razorpay', 'Card via Razorpay', false),\n  ('wallet', 'future_gateway', 'Wallet payment', false),\n  ('net_banking', 'future_gateway', 'Net banking', false)\non conflict (mode, provider) do update set\n  display_name = excluded.display_name,\n  is_enabled = excluded.is_enabled;\n`;
}

const { categories, products, slots, serviceFeeRule } = loadTsModule("src/lib/demo-data.ts");

const seedSql = [
  "-- Generated by tools/generate-supabase-seed.mjs. Do not edit product rows by hand.",
  "begin;",
  writeCategorySeed(categories),
  writeProductSeed(products),
  writeSlotSeed(slots),
  writeServiceFeeSeed(serviceFeeRule),
  writePaymentMethodSeed(),
  "commit;",
  ""
].join("\n\n");

const outputPath = path.join(rootDir, "supabase", "seed.sql");
fs.writeFileSync(outputPath, seedSql);
console.log(`Wrote ${path.relative(rootDir, outputPath)} with ${categories.length} categories, ${products.length} products, and ${slots.length} slots.`);
