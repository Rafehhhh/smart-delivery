import {
  calculateEstimate,
  calculateFinalItemsTotal,
  calculateServiceFee,
  reconcileCash
} from "./calculations";
import { generatedProducts } from "./generated-products";
import type {
  CustomerAddress,
  DeliverySlot,
  Order,
  OrderItem,
  Product,
  ProductCategory,
  LocalShop,
  Profile,
  ServiceFeeRule,
  CustomerReview
} from "./types";

export const categories: ProductCategory[] = [
  {
    id: "cat-vegetables",
    name: "Vegetables",
    description: "Fresh local-market vegetables with weekly price movement."
  },
  {
    id: "cat-meat",
    name: "Meat & Fish",
    description: "Chicken, beef, mutton, and seafood rates for household orders."
  },
  {
    id: "cat-rice",
    name: "Rice & Grains",
    description: "Daily rice, pulses, flour, and staple grains."
  },
  {
    id: "cat-fruits",
    name: "Fruits",
    description: "Common fruits and seasonal fresh items."
  },
  {
    id: "cat-foods",
    name: "Food Items",
    description: "Bakery, packaged food, and ready-to-buy daily food items."
  },
  {
    id: "cat-home",
    name: "Home Essentials",
    description: "Cooking oil, spices, soaps, and household basics."
  }
];

export const localShops: LocalShop[] = [
  {
    id: "shop-extra",
    name: "Extra Hypermarket Koyilandy",
    type: "hypermarket",
    address: "Koyilandy, Kozhikode, Kerala 673307",
    contactPhone: "Admin verification needed",
    discountNote: "Public site describes low-price positioning; item-level public prices need admin survey."
  },
  {
    id: "shop-smart-bazaar",
    name: "Reliance Smart Bazaar Koyilandy",
    type: "hypermarket",
    address: "Mariyam Arcade, near Police Station, Koyilandy, Calicut",
    contactPhone: "Admin verification needed",
    discountNote: "Chain offers may apply; item-level local prices need store/API update."
  },
  {
    id: "shop-supplyco",
    name: "Supplyco Super Market Koyilandy",
    type: "government",
    address: "City Tower, near Boys High School, Koyilandy",
    contactPhone: "Admin verification needed",
    discountNote: "Government/subsidy pricing may be lower for selected essentials."
  },
  {
    id: "shop-oxxo",
    name: "Oxxo Mart Supermarket Koyilandy",
    type: "supermarket",
    address: "Ambadi Complex, opposite State Bank of India, Koyilandy",
    contactPhone: "Admin verification needed",
    discountNote: "Shop-by-shop price survey needed."
  },
  {
    id: "shop-lucky",
    name: "Lucky Margin Free Mart",
    type: "supermarket",
    address: "Farook Plaza, opposite Koyilandy Police Station",
    contactPhone: "Admin verification needed",
    discountNote: "Margin-free store; verify current item prices before recommendation."
  },
  {
    id: "shop-sreedevi",
    name: "Sreedevi Supermarket and Bakery",
    type: "supermarket",
    address: "SH34, Koyilandy, Kerala 673305",
    contactPhone: "Admin verification needed",
    discountNote: "Useful for bakery and packaged food items."
  },
  {
    id: "shop-vishal",
    name: "Vishal Mega Mart Koyilandy",
    type: "hypermarket",
    address: "Opposite Meethalakandy Building, Juma Masjid, Koyilandy",
    contactPhone: "Admin verification needed",
    discountNote: "Likely suitable for packaged and household discount checks."
  },
  {
    id: "shop-triveni",
    name: "Triveni Supermarket Koyilandy",
    type: "government",
    address: "Koyilandy, Kozhikode region",
    contactPhone: "Admin verification needed",
    discountNote: "Consumerfed/Triveni store; verify subsidised item availability."
  }
];

export const customerReviews: CustomerReview[] = [
  {
    id: "review-1",
    customerName: "Fathima N.",
    customerPhone: "+919876543210",
    target: "staff",
    staffId: "staff-1",
    rating: 5,
    comment: "Niyas called before shopping and delivered within the selected morning slot.",
    createdAt: "2026-06-02T17:30:00+05:30",
    replyStatus: "not_replied"
  },
  {
    id: "review-2",
    customerName: "Ashraf M.",
    customerPhone: "+919855551010",
    target: "application",
    rating: 4,
    comment: "The order tracking is clear. Please add exact live vegetable prices when possible.",
    createdAt: "2026-06-02T19:10:00+05:30",
    replyStatus: "replied"
  }
];

const publicPriceNote = "Kozhikode/Koyilandy public market benchmark; exact shop prices should be updated by admin survey.";

function normalizeCatalogKey(value: string) {
  return value.trim().toLowerCase().replace(/&/g, "and").replace(/[^a-z0-9]+/g, " ").trim();
}

function productDuplicateKey(product: Product) {
  return `${normalizeCatalogKey(product.name)}|${normalizeCatalogKey(product.unit)}|${product.categoryId}`;
}

function mergeProductMetadata(existing: Product, incoming: Product): Product {
  return {
    ...existing,
    price: existing.price > 0 ? existing.price : incoming.price,
    previousWeekPrice: existing.previousWeekPrice ?? incoming.previousWeekPrice,
    priceTrend: existing.priceTrend ?? incoming.priceTrend,
    retailRange: existing.retailRange ?? incoming.retailRange,
    popularity: existing.popularity ?? incoming.popularity,
    recommendation: existing.recommendation ?? incoming.recommendation,
    bestValueShop: existing.bestValueShop ?? incoming.bestValueShop,
    sourceNote: existing.sourceNote ?? incoming.sourceNote,
    marketQuotes: existing.marketQuotes?.length ? existing.marketQuotes : incoming.marketQuotes,
    isApproximatePrice: existing.isApproximatePrice || incoming.isApproximatePrice,
    isAvailable: existing.isAvailable || incoming.isAvailable
  };
}

function mergeProductCatalog(baseProducts: Product[], importedProducts: Product[]) {
  const productsById = new Map<string, Product>();
  const seenDuplicateKeys = new Set<string>();

  for (const product of baseProducts) {
    productsById.set(product.id, product);
    seenDuplicateKeys.add(productDuplicateKey(product));
  }

  for (const product of importedProducts) {
    const duplicateById = productsById.get(product.id);
    if (duplicateById) {
      productsById.set(product.id, mergeProductMetadata(duplicateById, product));
      continue;
    }

    const duplicateKey = productDuplicateKey(product);
    if (seenDuplicateKeys.has(duplicateKey)) continue;

    productsById.set(product.id, product);
    seenDuplicateKeys.add(duplicateKey);
  }

  return [...productsById.values()].sort(
    (first, second) => first.categoryId.localeCompare(second.categoryId) || first.name.localeCompare(second.name)
  );
}

const extraProducts: Product[] = [
  { id: "prod-ash-gourd", categoryId: "cat-vegetables", name: "Ash Gourd", unit: "kg", price: 34, previousWeekPrice: 36, priceTrend: "down", retailRange: "Rs 30 - 40/kg", popularity: "standard", recommendation: "Good for curry orders; verify freshness.", bestValueShop: "Local vegetable market comparison", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },
  { id: "prod-beans", categoryId: "cat-vegetables", name: "Beans", unit: "kg", price: 82, previousWeekPrice: 76, priceTrend: "up", retailRange: "Rs 75 - 90/kg", popularity: "standard", recommendation: "Price-sensitive vegetable; buy only if customer confirms.", bestValueShop: "Local vegetable market comparison", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },
  { id: "prod-bitter-gourd", categoryId: "cat-vegetables", name: "Bitter Gourd", unit: "kg", price: 58, previousWeekPrice: 62, priceTrend: "down", retailRange: "Rs 52 - 68/kg", popularity: "standard", recommendation: "Compare shop quality before purchase.", bestValueShop: "Koyilandy local vegetable market", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },
  { id: "prod-brinjal", categoryId: "cat-vegetables", name: "Brinjal", unit: "kg", price: 46, previousWeekPrice: 48, priceTrend: "down", retailRange: "Rs 40 - 55/kg", popularity: "popular", recommendation: "Common household vegetable with steady demand.", bestValueShop: "Koyilandy local vegetable market", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },
  { id: "prod-cabbage", categoryId: "cat-vegetables", name: "Cabbage", unit: "kg", price: 38, previousWeekPrice: 36, priceTrend: "up", retailRange: "Rs 32 - 45/kg", popularity: "standard", recommendation: "Good value when under Rs 40/kg.", bestValueShop: "Supplyco or local market comparison", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },
  { id: "prod-cauliflower", categoryId: "cat-vegetables", name: "Cauliflower", unit: "piece", price: 52, previousWeekPrice: 60, priceTrend: "down", retailRange: "Rs 45 - 70/piece", popularity: "popular", recommendation: "Large price movement; check size before purchase.", bestValueShop: "Local vegetable market comparison", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },
  { id: "prod-ladies-finger", categoryId: "cat-vegetables", name: "Ladies Finger", unit: "kg", price: 54, previousWeekPrice: 58, priceTrend: "down", retailRange: "Rs 48 - 65/kg", popularity: "popular", recommendation: "Popular daily item; select tender stock.", bestValueShop: "Koyilandy local vegetable market", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },
  { id: "prod-onion", categoryId: "cat-vegetables", name: "Onion", unit: "kg", price: 36, previousWeekPrice: 34, priceTrend: "up", retailRange: "Rs 32 - 42/kg", popularity: "top_selling", recommendation: "High-demand staple; check bulk price.", bestValueShop: "Supplyco / local market comparison", sourceNote: publicPriceNote, isApproximatePrice: true, isAvailable: true },

  { id: "prod-chicken-broiler", categoryId: "cat-meat", name: "Chicken Broiler", unit: "kg", price: 198, previousWeekPrice: 205, priceTrend: "down", retailRange: "Around Rs 190 - 215/kg", popularity: "top_selling", recommendation: "Call shop for live rate before purchase.", bestValueShop: "Local meat shop call required", sourceNote: "Exact Koyilandy meat rates need staff confirmation.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-chicken-curry-cut", categoryId: "cat-meat", name: "Chicken Curry Cut", unit: "kg", price: 215, previousWeekPrice: 220, priceTrend: "down", retailRange: "Around Rs 210 - 230/kg", popularity: "popular", recommendation: "Common family order; confirm cut size.", bestValueShop: "Local meat shop call required", sourceNote: "Exact Koyilandy meat rates need staff confirmation.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-fish-ayala", categoryId: "cat-meat", name: "Fish Ayala", unit: "kg", price: 190, previousWeekPrice: 210, priceTrend: "down", retailRange: "Rs 180 - 230/kg", popularity: "popular", recommendation: "Freshness varies daily; staff must confirm.", bestValueShop: "Koyilandy fish market comparison", sourceNote: "Fish rates are approximate and daily-changing.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-fish-king", categoryId: "cat-meat", name: "Fish King Fish", unit: "kg", price: 520, previousWeekPrice: 560, priceTrend: "down", retailRange: "Rs 480 - 600/kg", popularity: "standard", recommendation: "Premium item; confirm with customer before buying.", bestValueShop: "Koyilandy fish market comparison", sourceNote: "Fish rates are approximate and daily-changing.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-fish-sardine", categoryId: "cat-meat", name: "Fish Sardine", unit: "kg", price: 160, previousWeekPrice: 150, priceTrend: "up", retailRange: "Rs 140 - 180/kg", popularity: "popular", recommendation: "Popular seafood order; check morning availability.", bestValueShop: "Koyilandy fish market comparison", sourceNote: "Fish rates are approximate and daily-changing.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-mutton", categoryId: "cat-meat", name: "Mutton", unit: "kg", price: 760, previousWeekPrice: 740, priceTrend: "up", retailRange: "Rs 720 - 800/kg", popularity: "standard", recommendation: "High-value item; customer confirmation required.", bestValueShop: "Local meat shop call required", sourceNote: "Exact Koyilandy meat rates need staff confirmation.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-prawns", categoryId: "cat-meat", name: "Prawns", unit: "kg", price: 420, previousWeekPrice: 450, priceTrend: "down", retailRange: "Rs 390 - 480/kg", popularity: "standard", recommendation: "Check cleaning requirement with customer.", bestValueShop: "Fish market comparison", sourceNote: "Seafood prices are approximate.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-quail", categoryId: "cat-meat", name: "Quail", unit: "piece", price: 65, previousWeekPrice: 65, priceTrend: "stable", retailRange: "Rs 60 - 75/piece", popularity: "standard", recommendation: "Availability must be confirmed by staff.", bestValueShop: "Local meat shop call required", sourceNote: "Shop-specific item.", isApproximatePrice: true, isAvailable: true },

  { id: "prod-basmati-rice", categoryId: "cat-rice", name: "Basmati Rice", unit: "kg", price: 118, previousWeekPrice: 120, priceTrend: "down", retailRange: "Brand MRP / shop offer", popularity: "standard", recommendation: "Compare brand offers.", bestValueShop: "Smart Bazaar / Extra comparison", sourceNote: "Brand-specific price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-broken-rice", categoryId: "cat-rice", name: "Broken Rice", unit: "kg", price: 42, previousWeekPrice: 43, priceTrend: "down", retailRange: "Admin-maintained local store price", popularity: "standard", recommendation: "Value option for household use.", bestValueShop: "Supplyco comparison", sourceNote: "Admin-maintained local price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-cherumani-rice", categoryId: "cat-rice", name: "Cherumani Rice", unit: "kg", price: 54, previousWeekPrice: 55, priceTrend: "down", retailRange: "Admin-maintained local store price", popularity: "popular", recommendation: "Common Kerala household rice.", bestValueShop: "Supplyco / local store comparison", sourceNote: "Admin-maintained local price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-green-gram", categoryId: "cat-rice", name: "Green Gram", unit: "kg", price: 128, previousWeekPrice: 126, priceTrend: "up", retailRange: "Brand MRP / shop offer", popularity: "standard", recommendation: "Check packed item offer.", bestValueShop: "Vishal / Smart Bazaar comparison", sourceNote: "Admin-maintained packaged price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-idli-rice", categoryId: "cat-rice", name: "Idli Rice", unit: "kg", price: 48, previousWeekPrice: 48, priceTrend: "stable", retailRange: "Admin-maintained local store price", popularity: "popular", recommendation: "Recurring household staple.", bestValueShop: "Local rice shop comparison", sourceNote: "Admin-maintained local price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-kuruva-rice", categoryId: "cat-rice", name: "Kuruva Rice", unit: "kg", price: 52, previousWeekPrice: 53, priceTrend: "down", retailRange: "Admin-maintained local store price", popularity: "popular", recommendation: "Good recurring order item.", bestValueShop: "Supplyco / local store comparison", sourceNote: "Admin-maintained local price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-raw-rice", categoryId: "cat-rice", name: "Raw Rice", unit: "kg", price: 50, previousWeekPrice: 50, priceTrend: "stable", retailRange: "Admin-maintained local store price", popularity: "standard", recommendation: "Compare quality before buying.", bestValueShop: "Supplyco comparison", sourceNote: "Admin-maintained local price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-urad-dal", categoryId: "cat-rice", name: "Urad Dal", unit: "kg", price: 146, previousWeekPrice: 142, priceTrend: "up", retailRange: "Brand MRP / shop offer", popularity: "standard", recommendation: "Check packed-item offer.", bestValueShop: "Vishal / Smart Bazaar comparison", sourceNote: "Admin-maintained packaged price.", isApproximatePrice: false, isAvailable: true },

  { id: "prod-apple", categoryId: "cat-fruits", name: "Apple", unit: "kg", price: 180, previousWeekPrice: 190, priceTrend: "down", retailRange: "Rs 160 - 220/kg", popularity: "popular", recommendation: "Compare size and grade.", bestValueShop: "Fruit sellers / supermarket comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-grapes", categoryId: "cat-fruits", name: "Grapes", unit: "kg", price: 110, previousWeekPrice: 120, priceTrend: "down", retailRange: "Rs 100 - 140/kg", popularity: "standard", recommendation: "Check freshness before purchase.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-guava", categoryId: "cat-fruits", name: "Guava", unit: "kg", price: 72, previousWeekPrice: 76, priceTrend: "down", retailRange: "Rs 65 - 85/kg", popularity: "standard", recommendation: "Good value when fresh.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-mango", categoryId: "cat-fruits", name: "Mango", unit: "kg", price: 130, previousWeekPrice: 150, priceTrend: "down", retailRange: "Rs 110 - 170/kg", popularity: "popular", recommendation: "Large seasonal movement; confirm variety.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-orange", categoryId: "cat-fruits", name: "Orange", unit: "kg", price: 96, previousWeekPrice: 98, priceTrend: "down", retailRange: "Rs 88 - 115/kg", popularity: "standard", recommendation: "Compare size and sweetness.", bestValueShop: "Supermarket / fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-papaya", categoryId: "cat-fruits", name: "Papaya", unit: "kg", price: 48, previousWeekPrice: 52, priceTrend: "down", retailRange: "Rs 42 - 60/kg", popularity: "standard", recommendation: "Select ripe level per customer need.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-pineapple", categoryId: "cat-fruits", name: "Pineapple", unit: "piece", price: 78, previousWeekPrice: 84, priceTrend: "down", retailRange: "Rs 70 - 95/piece", popularity: "standard", recommendation: "Check size before purchase.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-plantain", categoryId: "cat-fruits", name: "Plantain", unit: "kg", price: 64, previousWeekPrice: 62, priceTrend: "up", retailRange: "Rs 58 - 75/kg", popularity: "popular", recommendation: "Useful for Kerala meals.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-pomegranate", categoryId: "cat-fruits", name: "Pomegranate", unit: "kg", price: 210, previousWeekPrice: 220, priceTrend: "down", retailRange: "Rs 190 - 250/kg", popularity: "standard", recommendation: "Premium fruit; confirm customer need.", bestValueShop: "Supermarket comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-watermelon", categoryId: "cat-fruits", name: "Watermelon", unit: "kg", price: 34, previousWeekPrice: 38, priceTrend: "down", retailRange: "Rs 28 - 45/kg", popularity: "popular", recommendation: "Good summer-value item.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-sapota", categoryId: "cat-fruits", name: "Sapota", unit: "kg", price: 88, previousWeekPrice: 90, priceTrend: "down", retailRange: "Rs 80 - 105/kg", popularity: "standard", recommendation: "Check ripeness before purchase.", bestValueShop: "Fruit sellers comparison", sourceNote: "Seasonal fruit price needs survey.", isApproximatePrice: true, isAvailable: true },

  { id: "prod-bun", categoryId: "cat-foods", name: "Bun", unit: "pack", price: 35, previousWeekPrice: 35, priceTrend: "stable", retailRange: "Bakery price", popularity: "standard", recommendation: "Buy near route for freshness.", bestValueShop: "Sreedevi Supermarket and Bakery", sourceNote: "Bakery price is shop-specific.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-chapati", categoryId: "cat-foods", name: "Chapati Pack", unit: "pack", price: 55, previousWeekPrice: 55, priceTrend: "stable", retailRange: "Ready food pack", popularity: "popular", recommendation: "Useful quick dinner item.", bestValueShop: "Bakery / supermarket comparison", sourceNote: "Shop-specific ready-food price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-eggs", categoryId: "cat-foods", name: "Eggs", unit: "piece", price: 7, previousWeekPrice: 6, priceTrend: "up", retailRange: "Rs 6 - 7/piece", popularity: "top_selling", recommendation: "High-demand add-on item.", bestValueShop: "Local store comparison", sourceNote: "Admin-maintained local price.", isApproximatePrice: true, isAvailable: true },
  { id: "prod-milk", categoryId: "cat-foods", name: "Milk", unit: "litre", price: 56, previousWeekPrice: 56, priceTrend: "stable", retailRange: "MRP item", popularity: "top_selling", recommendation: "Daily essential.", bestValueShop: "Nearest store on route", sourceNote: "Packaged MRP item.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-noodles", categoryId: "cat-foods", name: "Noodles", unit: "pack", price: 48, previousWeekPrice: 50, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "standard", recommendation: "Check brand preference.", bestValueShop: "Smart Bazaar / Vishal comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-parotta", categoryId: "cat-foods", name: "Parotta Pack", unit: "pack", price: 60, previousWeekPrice: 60, priceTrend: "stable", retailRange: "Ready food pack", popularity: "popular", recommendation: "Quick meal item.", bestValueShop: "Bakery / supermarket comparison", sourceNote: "Shop-specific ready-food price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-rusk", categoryId: "cat-foods", name: "Rusk", unit: "pack", price: 42, previousWeekPrice: 44, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "standard", recommendation: "Tea-time add-on item.", bestValueShop: "Sreedevi / Smart Bazaar comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-tea-powder", categoryId: "cat-foods", name: "Tea Powder", unit: "pack", price: 145, previousWeekPrice: 148, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "popular", recommendation: "Compare brand and pack size.", bestValueShop: "Vishal / Smart Bazaar comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-yogurt", categoryId: "cat-foods", name: "Yogurt", unit: "cup", price: 35, previousWeekPrice: 35, priceTrend: "stable", retailRange: "MRP item", popularity: "standard", recommendation: "Buy late in route for freshness.", bestValueShop: "Nearest cold-storage store", sourceNote: "Packaged MRP item.", isApproximatePrice: false, isAvailable: true },

  { id: "prod-bath-soap", categoryId: "cat-home", name: "Bath Soap", unit: "piece", price: 38, previousWeekPrice: 40, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "popular", recommendation: "Compare combo offers.", bestValueShop: "Vishal / Smart Bazaar comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-chilli-powder", categoryId: "cat-home", name: "Chilli Powder", unit: "pack", price: 72, previousWeekPrice: 74, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "standard", recommendation: "Check brand preference.", bestValueShop: "Supermarket comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-detergent", categoryId: "cat-home", name: "Detergent Powder", unit: "kg", price: 118, previousWeekPrice: 125, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "popular", recommendation: "Large offer movement; check pack size.", bestValueShop: "Vishal / Smart Bazaar comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-floor-cleaner", categoryId: "cat-home", name: "Floor Cleaner", unit: "litre", price: 155, previousWeekPrice: 160, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "standard", recommendation: "Check brand and fragrance.", bestValueShop: "Vishal / Extra comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-salt", categoryId: "cat-home", name: "Salt", unit: "kg", price: 24, previousWeekPrice: 24, priceTrend: "stable", retailRange: "MRP item", popularity: "top_selling", recommendation: "Staple add-on item.", bestValueShop: "Nearest store", sourceNote: "Packaged MRP item.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-shampoo", categoryId: "cat-home", name: "Shampoo", unit: "bottle", price: 135, previousWeekPrice: 140, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "standard", recommendation: "Check brand preference.", bestValueShop: "Vishal / Smart Bazaar comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-sugar", categoryId: "cat-home", name: "Sugar", unit: "kg", price: 46, previousWeekPrice: 45, priceTrend: "up", retailRange: "Admin-maintained local store price", popularity: "top_selling", recommendation: "High-demand staple.", bestValueShop: "Supplyco / local store comparison", sourceNote: "Admin-maintained local price.", isApproximatePrice: false, isAvailable: true },
  { id: "prod-turmeric-powder", categoryId: "cat-home", name: "Turmeric Powder", unit: "pack", price: 58, previousWeekPrice: 60, priceTrend: "down", retailRange: "Brand MRP / offer", popularity: "standard", recommendation: "Check brand preference.", bestValueShop: "Supermarket comparison", sourceNote: "Packaged item price should be admin-updated.", isApproximatePrice: false, isAvailable: true }
];

const baseProducts: Product[] = [
  {
    id: "prod-tomato",
    categoryId: "cat-vegetables",
    name: "Tomato",
    unit: "kg",
    price: 42,
    previousWeekPrice: 44,
    priceTrend: "down",
    retailRange: "Rs 37 - 50/kg",
    popularity: "top_selling",
    recommendation: "Best for regular household orders; compare market rate before buying in bulk.",
    bestValueShop: "Koyilandy local vegetable market benchmark",
    sourceNote: publicPriceNote,
    marketQuotes: [
      { shopName: "Koyilandy/Quilandy APMC benchmark", currentPrice: 40, previousWeekPrice: 42, note: "Wholesale benchmark converted from public mandi data." },
      { shopName: "Reliance Smart Bazaar Koyilandy", note: "Public item price unavailable; admin survey needed." },
      { shopName: "Extra Hypermarket Koyilandy", note: "Public item price unavailable; admin survey needed." }
    ],
    isApproximatePrice: true,
    isAvailable: true
  },
  {
    id: "prod-cucumber",
    categoryId: "cat-vegetables",
    name: "Cucumber",
    unit: "kg",
    price: 42,
    previousWeekPrice: 43,
    priceTrend: "stable",
    retailRange: "Rs 37 - 47/kg",
    popularity: "popular",
    recommendation: "Good value when below Rs 40/kg; suitable for quick delivery orders.",
    bestValueShop: "Kozhikode retail benchmark",
    sourceNote: publicPriceNote,
    marketQuotes: [
      { shopName: "Kozhikode retail benchmark", currentPrice: 42, previousWeekPrice: 43, note: "District retail range used until Koyilandy shop survey is entered." },
      { shopName: "Oxxo Mart Supermarket Koyilandy", note: "Public item price unavailable; admin survey needed." },
      { shopName: "Lucky Margin Free Mart", note: "Verify margin-free price during staff purchase." }
    ],
    isApproximatePrice: true,
    isAvailable: true
  },
  {
    id: "prod-potato",
    categoryId: "cat-vegetables",
    name: "Potato",
    unit: "kg",
    price: 28,
    previousWeekPrice: 30,
    priceTrend: "down",
    retailRange: "Rs 25 - 32/kg",
    popularity: "popular",
    recommendation: "Efficient staple item; prefer shop with clean stock and no sprouting.",
    bestValueShop: "Supplyco or margin-free comparison recommended",
    sourceNote: publicPriceNote,
    marketQuotes: [
      { shopName: "Kozhikode retail benchmark", currentPrice: 28, previousWeekPrice: 30, note: "Retail range benchmark." },
      { shopName: "Supplyco Super Market Koyilandy", discountLabel: "Check subsidy", note: "Admin should verify stock and subsidised rate." },
      { shopName: "Vishal Mega Mart Koyilandy", discountLabel: "Check offer", note: "Admin should verify packaged/bulk offer." }
    ],
    isApproximatePrice: true,
    isAvailable: true
  },
  {
    id: "prod-carrot",
    categoryId: "cat-vegetables",
    name: "Carrot",
    unit: "kg",
    price: 65,
    previousWeekPrice: 67,
    priceTrend: "down",
    retailRange: "Rs 58 - 72/kg",
    popularity: "standard",
    recommendation: "Buy only fresh firm stock; price-sensitive compared with potato/tomato.",
    bestValueShop: "Local vegetable market comparison",
    sourceNote: publicPriceNote,
    marketQuotes: [
      { shopName: "Kozhikode retail benchmark", currentPrice: 65, previousWeekPrice: 67, note: "District retail benchmark." },
      { shopName: "Extra Hypermarket Koyilandy", note: "Public item price unavailable; admin survey needed." }
    ],
    isApproximatePrice: true,
    isAvailable: true
  },
  {
    id: "prod-chicken-skinless",
    categoryId: "cat-meat",
    name: "Chicken Skinless",
    unit: "kg",
    price: 225,
    previousWeekPrice: 235,
    priceTrend: "down",
    retailRange: "Around Rs 225/kg",
    popularity: "top_selling",
    recommendation: "Top-selling meat item; call shop before dispatch because meat prices move quickly.",
    bestValueShop: "Kozhikode meat benchmark; shop call required",
    sourceNote: "Kozhikode public meat benchmark; exact Koyilandy shop rate needs staff confirmation.",
    marketQuotes: [
      { shopName: "Kozhikode meat benchmark", currentPrice: 225, previousWeekPrice: 235, note: "Public benchmark for skinless chicken." },
      { shopName: "Koyilandy local meat shops", note: "Staff must confirm live shop price before purchase." }
    ],
    isApproximatePrice: true,
    isAvailable: true
  },
  {
    id: "prod-beef",
    categoryId: "cat-meat",
    name: "Beef",
    unit: "kg",
    price: 180,
    previousWeekPrice: 180,
    priceTrend: "stable",
    retailRange: "Around Rs 180/kg",
    popularity: "standard",
    recommendation: "Stable benchmark; availability and cut quality must be confirmed by staff.",
    bestValueShop: "Local meat shop call required",
    sourceNote: "Kozhikode public meat benchmark; exact Koyilandy shop rate needs staff confirmation.",
    marketQuotes: [
      { shopName: "Kozhikode meat benchmark", currentPrice: 180, previousWeekPrice: 180, note: "Public benchmark." },
      { shopName: "Koyilandy local meat shops", note: "Staff must confirm live shop price before purchase." }
    ],
    isApproximatePrice: true,
    isAvailable: true
  },
  {
    id: "prod-matta-rice",
    categoryId: "cat-rice",
    name: "Matta Rice",
    unit: "kg",
    price: 56,
    previousWeekPrice: 56,
    priceTrend: "stable",
    retailRange: "Admin-maintained local store price",
    popularity: "top_selling",
    recommendation: "Best staple product for recurring household orders.",
    bestValueShop: "Supplyco / Extra / Smart Bazaar comparison",
    sourceNote: "Shop prices should be maintained by admin because public item-level prices vary by brand.",
    marketQuotes: [
      { shopName: "Supplyco Super Market Koyilandy", discountLabel: "Check subsidy", note: "Verify brand and ration/subsidy availability." },
      { shopName: "Extra Hypermarket Koyilandy", note: "Admin survey needed for brand-specific price." },
      { shopName: "Reliance Smart Bazaar Koyilandy", discountLabel: "Check chain offer", note: "Admin survey needed for brand-specific price." }
    ],
    isApproximatePrice: false,
    isAvailable: true
  },
  {
    id: "prod-sona-rice",
    categoryId: "cat-rice",
    name: "Sona Masoori Rice",
    unit: "kg",
    price: 62,
    previousWeekPrice: 63,
    priceTrend: "down",
    retailRange: "Admin-maintained local store price",
    popularity: "popular",
    recommendation: "Compare with Matta Rice for family preference and value.",
    bestValueShop: "Supplyco / hypermarket comparison",
    sourceNote: "Brand-specific rice prices need admin/shop update.",
    marketQuotes: [
      { shopName: "Supplyco Super Market Koyilandy", note: "Verify stock and current rate." },
      { shopName: "Vishal Mega Mart Koyilandy", discountLabel: "Check offer", note: "Admin survey needed." }
    ],
    isApproximatePrice: false,
    isAvailable: true
  },
  {
    id: "prod-banana",
    categoryId: "cat-fruits",
    name: "Banana",
    unit: "kg",
    price: 60,
    previousWeekPrice: 62,
    priceTrend: "down",
    retailRange: "Admin-maintained seasonal price per kg",
    popularity: "popular",
    recommendation: "Efficient fruit item for weekly household orders.",
    bestValueShop: "Local fruit sellers / supermarket comparison",
    sourceNote: "Koyilandy shop-level fruit prices require admin survey.",
    marketQuotes: [
      { shopName: "Koyilandy fruit sellers", note: "Staff should compare freshness and kg rate." },
      { shopName: "Sreedevi Supermarket and Bakery", note: "Admin survey needed." }
    ],
    isApproximatePrice: true,
    isAvailable: true
  },
  {
    id: "prod-bread",
    categoryId: "cat-foods",
    name: "Bread",
    unit: "pack",
    price: 45,
    previousWeekPrice: 45,
    priceTrend: "stable",
    retailRange: "Brand MRP / shop offer",
    popularity: "standard",
    recommendation: "Best purchased from bakery/supermarket close to delivery route.",
    bestValueShop: "Sreedevi Supermarket and Bakery",
    sourceNote: "Packaged/bakery prices are shop-specific and admin-maintained.",
    marketQuotes: [
      { shopName: "Sreedevi Supermarket and Bakery", note: "Likely suitable source; current item price needs survey." },
      { shopName: "Reliance Smart Bazaar Koyilandy", note: "Check packaged bread offer." }
    ],
    isApproximatePrice: false,
    isAvailable: true
  },
  {
    id: "prod-coconut-oil",
    categoryId: "cat-home",
    name: "Coconut Oil",
    unit: "litre",
    price: 178,
    previousWeekPrice: 180,
    priceTrend: "down",
    retailRange: "Brand MRP / shop offer",
    popularity: "top_selling",
    recommendation: "Compare brand and litre pack offers before purchase.",
    bestValueShop: "Vishal Mega Mart / Smart Bazaar / Extra comparison",
    sourceNote: "Brand-specific packaged item price should be admin-updated.",
    marketQuotes: [
      { shopName: "Vishal Mega Mart Koyilandy", discountLabel: "Check offer", note: "Likely discount-store candidate; verify current rate." },
      { shopName: "Reliance Smart Bazaar Koyilandy", discountLabel: "Check chain offer", note: "Verify current rate." },
      { shopName: "Extra Hypermarket Koyilandy", note: "Verify current rate." }
    ],
    isApproximatePrice: false,
    isAvailable: true
  },
  {
    id: "prod-dish-soap",
    categoryId: "cat-home",
    name: "Dish Wash Bar",
    unit: "piece",
    price: 24,
    previousWeekPrice: 25,
    priceTrend: "down",
    retailRange: "Brand MRP / shop offer",
    popularity: "standard",
    recommendation: "Efficient add-on item; compare multi-pack discount.",
    bestValueShop: "Vishal Mega Mart / Smart Bazaar comparison",
    sourceNote: "Packaged item price should be admin-updated.",
    marketQuotes: [
      { shopName: "Vishal Mega Mart Koyilandy", discountLabel: "Check multi-pack", note: "Admin survey needed." },
      { shopName: "Reliance Smart Bazaar Koyilandy", discountLabel: "Check offer", note: "Admin survey needed." }
    ],
    isApproximatePrice: false,
    isAvailable: true
  },
  ...extraProducts
];

export const products: Product[] = mergeProductCatalog(baseProducts, generatedProducts);

export const slots: DeliverySlot[] = [
  {
    id: "slot-morning",
    label: "Today, 9:00 AM - 11:00 AM",
    startsAt: "2026-06-03T09:00:00+05:30",
    endsAt: "2026-06-03T11:00:00+05:30",
    capacity: 8,
    reserved: 5
  },
  {
    id: "slot-afternoon",
    label: "Today, 2:00 PM - 4:00 PM",
    startsAt: "2026-06-03T14:00:00+05:30",
    endsAt: "2026-06-03T16:00:00+05:30",
    capacity: 6,
    reserved: 6
  },
  {
    id: "slot-evening",
    label: "Today, 6:00 PM - 8:00 PM",
    startsAt: "2026-06-03T18:00:00+05:30",
    endsAt: "2026-06-03T20:00:00+05:30",
    capacity: 10,
    reserved: 3
  }
];

export const profiles: Profile[] = [
  {
    id: "customer-1",
    role: "customer",
    name: "Fathima N.",
    phone: "+919876543210"
  },
  {
    id: "admin-1",
    role: "admin",
    name: "Operations Admin",
    phone: "+919810001111"
  },
  {
    id: "staff-1",
    role: "staff",
    name: "Niyas K.",
    phone: "+919810002222"
  },
  {
    id: "staff-2",
    role: "staff",
    name: "Sameer P.",
    phone: "+919810003333"
  }
];

export const addresses: CustomerAddress[] = [
  {
    id: "addr-1",
    customerId: "customer-1",
    houseName: "Green Villa",
    addressLine: "12 Market Road",
    landmark: "Near Masjid Junction",
    locality: "Local Area"
  }
];

export const serviceFeeRule: ServiceFeeRule = {
  id: "fee-local-flat",
  name: "Local delivery flat fee",
  flatFee: 35,
  freeDeliveryMinimum: 1500,
  isActive: true
};

const pendingItems: OrderItem[] = [
  {
    id: "item-1",
    productId: "prod-matta-rice",
    productName: "Matta Rice",
    unit: "kg",
    requestedQuantity: 10,
    estimatedPrice: 56
  },
  {
    id: "item-2",
    productId: "prod-tomato",
    productName: "Tomato",
    unit: "kg",
    requestedQuantity: 2,
    estimatedPrice: 38,
    notes: "Choose firm tomatoes if available."
  },
  {
    id: "item-3",
    productId: "prod-coconut-oil",
    productName: "Coconut Oil",
    unit: "litre",
    requestedQuantity: 1,
    estimatedPrice: 178
  }
];

const shoppingItems: OrderItem[] = [
  {
    id: "item-4",
    productId: "prod-banana",
    productName: "Banana",
    unit: "kg",
    requestedQuantity: 2,
    estimatedPrice: 60,
    finalQuantity: 2,
    finalPrice: 58
  },
  {
    id: "item-5",
    productId: "prod-dish-soap",
    productName: "Dish Wash Bar",
    unit: "piece",
    requestedQuantity: 4,
    estimatedPrice: 24,
    finalQuantity: 4,
    finalPrice: 24
  }
];

const pendingEstimate = calculateEstimate(pendingItems);
const shoppingFinalSubtotal = calculateFinalItemsTotal(shoppingItems);
const shoppingServiceFee = calculateServiceFee(shoppingFinalSubtotal, serviceFeeRule);

export const orders: Order[] = [
  {
    id: "order-1",
    orderNumber: "SD-1001",
    customer: profiles[0],
    address: addresses[0],
    slot: slots[0],
    status: "submitted",
    paymentState: "unpaid",
    estimateTotal: pendingEstimate,
    serviceFee: calculateServiceFee(pendingEstimate, serviceFeeRule),
    items: pendingItems,
    cash: reconcileCash(0, 0),
    createdAt: "2026-06-02T10:15:00+05:30",
    notes: "Call before purchase if any product is unavailable."
  },
  {
    id: "order-2",
    orderNumber: "SD-1002",
    customer: {
      id: "customer-2",
      role: "customer",
      name: "Ashraf M.",
      phone: "+919855551010"
    },
    address: {
      id: "addr-2",
      customerId: "customer-2",
      houseName: "Palm House",
      addressLine: "7 School Lane",
      landmark: "Opposite old library",
      locality: "Local Area"
    },
    slot: slots[2],
    status: "shopping",
    paymentState: "advance_paid",
    estimateTotal: calculateEstimate(shoppingItems),
    finalTotal: shoppingFinalSubtotal + shoppingServiceFee,
    serviceFee: shoppingServiceFee,
    assignedStaff: profiles[2],
    items: shoppingItems,
    cash: reconcileCash(shoppingFinalSubtotal + shoppingServiceFee, 200),
    createdAt: "2026-06-02T11:40:00+05:30"
  }
];

export function getDemoOrder(orderId: string) {
  return orders.find((order) => order.id === orderId);
}

export function getStaffOrders(staffId: string) {
  return orders.filter((order) => order.assignedStaff?.id === staffId);
}
