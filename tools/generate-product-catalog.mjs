import { readFileSync, writeFileSync } from "node:fs";
import { resolve } from "node:path";
import { fileURLToPath } from "node:url";

const root = resolve(fileURLToPath(new URL("..", import.meta.url)));
const sourcePath = resolve(root, "docs/product-list.csv");
const outputPath = resolve(root, "src/lib/generated-products.ts");

const broadCategoryMap = new Map([
  ["cat-rice-grains-and-flour", "cat-rice"],
  ["cat-pulses-and-legumes", "cat-rice"],
  ["cat-breakfast-and-flours", "cat-rice"],
  ["cat-vegetables", "cat-vegetables"],
  ["cat-fruits", "cat-fruits"],
  ["cat-meat-and-fish", "cat-meat"],
  ["cat-dairy-and-eggs", "cat-foods"],
  ["cat-bakery-and-ready-to-eat", "cat-foods"],
  ["cat-snacks-and-packaged-food", "cat-foods"],
  ["cat-beverages", "cat-foods"],
  ["cat-cooking-oils-and-ghee", "cat-home"],
  ["cat-spices-and-masalas", "cat-home"],
  ["cat-salt-sugar-and-sweeteners", "cat-home"],
  ["cat-cleaning-and-household", "cat-home"],
  ["cat-personal-care", "cat-home"],
  ["cat-baby-and-pet-care", "cat-home"],
  ["cat-pooja-and-festival", "cat-home"],
  ["cat-health-and-first-aid", "cat-home"]
]);

const fallbackCategoryMatchers = [
  [/vegetable|greens|tuber|root/i, "cat-vegetables"],
  [/fruit/i, "cat-fruits"],
  [/meat|fish|chicken|beef|mutton|seafood|egg/i, "cat-meat"],
  [/rice|grain|flour|pulse|dal|legume|atta/i, "cat-rice"],
  [/bakery|ready|snack|food|beverage|milk|dairy|curd|tea|coffee/i, "cat-foods"],
  [/oil|spice|masala|clean|soap|detergent|care|salt|sugar|house/i, "cat-home"]
];

const trialEstimateByCategoryAndUnit = {
  "cat-vegetables": { kg: 58, piece: 28, pack: 45, bunch: 22 },
  "cat-fruits": { kg: 96, piece: 38, pack: 80, bunch: 45 },
  "cat-meat": { kg: 260, piece: 75, pack: 180 },
  "cat-rice": { kg: 72, pack: 85, piece: 45 },
  "cat-foods": { kg: 120, litre: 62, piece: 28, pack: 72, bottle: 95, cup: 35 },
  "cat-home": { kg: 92, litre: 145, piece: 42, pack: 68, bottle: 125 }
};

function parseCsv(text) {
  const rows = [];
  let row = [];
  let cell = "";
  let inQuote = false;

  for (let index = 0; index < text.length; index += 1) {
    const char = text[index];
    const next = text[index + 1];

    if (inQuote) {
      if (char === "\"" && next === "\"") {
        cell += "\"";
        index += 1;
      } else if (char === "\"") {
        inQuote = false;
      } else {
        cell += char;
      }
      continue;
    }

    if (char === "\"") {
      inQuote = true;
    } else if (char === ",") {
      row.push(cell);
      cell = "";
    } else if (char === "\n") {
      row.push(cell.replace(/\r$/, ""));
      rows.push(row);
      row = [];
      cell = "";
    } else {
      cell += char;
    }
  }

  if (cell || row.length > 0) {
    row.push(cell.replace(/\r$/, ""));
    rows.push(row);
  }

  return rows.filter((entry) => entry.some((value) => value.trim()));
}

function normalizeText(value) {
  return value.trim().toLowerCase().replace(/&/g, "and").replace(/[^a-z0-9]+/g, " ").trim();
}

function toTitleCase(value) {
  return value
    .trim()
    .replace(/\s+/g, " ")
    .replace(/\b[a-z]/g, (match) => match.toUpperCase())
    .replace(/\bAnd\b/g, "and");
}

function mapCategory(row) {
  const byId = broadCategoryMap.get(row.category_id);
  if (byId) return byId;

  const searchable = `${row.category_name} ${row.subcategory_name} ${row.product_name}`;
  const match = fallbackCategoryMatchers.find(([pattern]) => pattern.test(searchable));
  return match?.[1] ?? "cat-home";
}

function normalizeUnit(unit) {
  const cleaned = unit.trim().toLowerCase();
  if (cleaned === "ltr") return "litre";
  if (cleaned === "pc") return "piece";
  if (cleaned === "pcs") return "piece";
  if (cleaned === "nos") return "piece";
  if (cleaned === "packet") return "pack";
  return cleaned || "piece";
}

function normalizePrice(row) {
  const raw = Number(row.scraped_price);
  if (!Number.isFinite(raw) || raw <= 0) return 0;

  const unit = normalizeUnit(row.suggested_unit);
  const priceUnit = row.price_unit.toLowerCase();
  if (unit === "kg" && priceUnit.includes("/5kg")) return raw / 5;
  if (unit === "kg" && priceUnit.includes("/500g")) return raw * 2;
  if (unit === "kg" && priceUnit.includes("/250g")) return raw * 4;
  if (unit === "kg" && priceUnit.includes("/100g")) return raw * 10;
  if (unit === "litre" && priceUnit.includes("/500ml")) return raw * 2;
  return raw;
}

function getTrialEstimate(categoryId, unit) {
  const categoryEstimates = trialEstimateByCategoryAndUnit[categoryId] ?? trialEstimateByCategoryAndUnit["cat-home"];
  return categoryEstimates[unit] ?? categoryEstimates.pack ?? 75;
}

function buildSourceNote(row) {
  const parts = [];
  if (row.price_status === "shop_survey_required") {
    parts.push("Price pending: shop survey required for Koyilandy.");
  } else if (row.source_name) {
    parts.push(`${row.source_name}${row.source_date ? ` (${row.source_date})` : ""}.`);
  }
  if (row.price_notes) parts.push(row.price_notes);
  if (row.source_url) parts.push(`Source: ${row.source_url}`);
  return parts.join(" ");
}

function buildRetailRange(row, price, isTrialEstimate) {
  if (row.original_price) return row.original_price;
  if (isTrialEstimate) return `Trial estimate: Rs ${formatPrice(price)}/${normalizeUnit(row.suggested_unit)} - editable after shop survey`;
  if (price > 0) return `Public benchmark: Rs ${formatPrice(price)}/${normalizeUnit(row.suggested_unit)}`;
  return "Trial estimate - editable after shop survey";
}

function formatPrice(price) {
  return Number.isInteger(price) ? String(price) : price.toFixed(2).replace(/0+$/, "").replace(/\.$/, "");
}

function productFromRow(row) {
  const categoryId = mapCategory(row);
  const unit = normalizeUnit(row.suggested_unit);
  const publicPrice = normalizePrice(row);
  const price = publicPrice > 0 ? publicPrice : getTrialEstimate(categoryId, unit);
  const previousWeekPrice = price > 0 ? Math.round(price * 1.04 * 100) / 100 : undefined;
  const name = toTitleCase(row.product_name);
  const sourceNote = buildSourceNote(row);
  const isTrialEstimate = publicPrice <= 0;

  return {
    id: row.product_id.trim(),
    categoryId,
    name,
    unit,
    price,
    ...(previousWeekPrice ? { previousWeekPrice } : {}),
    ...(previousWeekPrice ? { priceTrend: "down" } : { priceTrend: "stable" }),
    retailRange: buildRetailRange(row, price, isTrialEstimate),
    popularity: price > 0 ? "standard" : "seasonal",
    recommendation:
      isTrialEstimate
        ? `Trial estimate for app testing. Admin should replace this with the real ${name} price after shop survey.`
        : `Imported from ${row.category_name}${row.subcategory_name ? ` / ${row.subcategory_name}` : ""}.`,
    bestValueShop: row.source_name || "Koyilandy shop survey required",
    sourceNote: isTrialEstimate ? `Trial estimated price only; editable after shop survey. ${sourceNote}` : sourceNote,
    marketQuotes: [
      {
        shopName: row.source_name || "Koyilandy shop survey required",
        ...(price > 0 ? { currentPrice: price } : {}),
        ...(previousWeekPrice ? { previousWeekPrice } : {}),
        note: isTrialEstimate ? `Trial estimated price only; editable after shop survey. ${sourceNote}` : sourceNote || "Imported catalog item."
      }
    ],
    isApproximatePrice: row.price_status !== "scraped_public_price" || isTrialEstimate,
    isAvailable: true
  };
}

function serializeProduct(product) {
  return JSON.stringify(product, null, 2)
    .replace(/"priceTrend": "([^"]+)"/g, "\"priceTrend\": \"$1\"")
    .replace(/"popularity": "([^"]+)"/g, "\"popularity\": \"$1\"");
}

const rows = parseCsv(readFileSync(sourcePath, "utf8"));
const header = rows.shift();
const indexes = Object.fromEntries(header.map((column, index) => [column, index]));
const productsById = new Map();
const seenByNameUnitCategory = new Set();

for (const rawRow of rows) {
  const row = Object.fromEntries(header.map((column) => [column, rawRow[indexes[column]] ?? ""]));
  if (!row.product_id || !row.product_name) continue;

  const product = productFromRow(row);
  const nameKey = `${normalizeText(product.name)}|${product.unit}|${product.categoryId}`;
  if (productsById.has(product.id) || seenByNameUnitCategory.has(nameKey)) continue;

  productsById.set(product.id, product);
  seenByNameUnitCategory.add(nameKey);
}

const products = [...productsById.values()].sort((first, second) =>
  first.categoryId.localeCompare(second.categoryId) || first.name.localeCompare(second.name)
);

const output = `import type { Product } from "./types";

// Generated from docs/product-list.csv by tools/generate-product-catalog.mjs.
// Keep manual demo records in demo-data.ts; this module carries the larger imported catalog.
export const generatedProducts: Product[] = ${serializeProduct(products)};
`;

writeFileSync(outputPath, output);
console.log(`Generated ${products.length} products at ${outputPath}`);
