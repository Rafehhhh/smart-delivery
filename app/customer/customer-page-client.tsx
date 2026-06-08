"use client";

import { type ReactNode, useEffect, useMemo, useRef, useState } from "react";
import Link from "next/link";
import { AppShell } from "@/components/app-shell";
import { calculateEstimate, calculateServiceFee, isSlotAvailable, remainingSlotCapacity } from "@/lib/calculations";
import { orders } from "@/lib/demo-data";
import { formatCurrency } from "@/lib/format";
import type { CatalogData } from "@/lib/supabase-catalog";
import type { Order, OrderItem, Product, ProductCategory } from "@/lib/types";
import {
  CalendarClock,
  CheckCircle2,
  ChevronDown,
  ChevronRight,
  Flame,
  Home,
  Minus,
  PackageSearch,
  Plus,
  Search,
  Send,
  ShoppingCart,
  Tag,
  UserRound,
  X
} from "lucide-react";

type ListedCartLine = {
  kind: "listed";
  productId: string;
  quantity: number;
  note?: string;
};

type CustomCartLine = {
  kind: "custom";
  id: string;
  productName: string;
  note: string;
};

type CartLine = ListedCartLine | CustomCartLine;

type QuantityControlProps = {
  value: number;
  unit: string;
  compact?: boolean;
  onIncrement: (delta: number) => void;
  onChange: (quantity: number) => void;
};

type ProductSortMode = "name_asc" | "price_low" | "price_high";
type ProductPriceRange = "all" | "under_50" | "50_100" | "100_250" | "above_250";
type DemoOrderUpdate = {
  title: string;
  message: string;
};

const priceRangeLabels: Record<ProductPriceRange, string> = {
  all: "All prices",
  under_50: "Under Rs 50",
  "50_100": "Rs 50 - Rs 100",
  "100_250": "Rs 100 - Rs 250",
  above_250: "Above Rs 250"
};

const sortLabels: Record<ProductSortMode, string> = {
  name_asc: "Name A-Z",
  price_low: "Price low to high",
  price_high: "Price high to low"
};

const priceRangeOptions: ProductPriceRange[] = ["all", "under_50", "50_100", "100_250", "above_250"];
const sortOptions: ProductSortMode[] = ["name_asc", "price_low", "price_high"];

const demoOrderUpdates: DemoOrderUpdate[] = [
  {
    title: "Order submitted",
    message: "Your order request is now in the local delivery queue."
  },
  {
    title: "Assigned to staff",
    message: "An available delivery staff member accepted the order."
  },
  {
    title: "Shopping started",
    message: "The staff member is purchasing your selected products now."
  },
  {
    title: "Delivery ETA",
    message: "Your items are expected to reach you within 25 minutes."
  },
  {
    title: "Delivered",
    message: "The demo order flow is complete. Final settlement can be collected at delivery."
  }
];

const productAliases: Record<string, string[]> = {
  "prod-tomato": ["tomato", "തക്കാളി"],
  "prod-cucumber": ["cucumber", "വെള്ളരി"],
  "prod-potato": ["potato", "ഉരുളക്കിഴങ്ങ്"],
  "prod-carrot": ["carrot", "കാരറ്റ്"],
  "prod-chicken-skinless": ["chicken", "കോഴി", "ചിക്കൻ"],
  "prod-beef": ["beef", "ബീഫ്"],
  "prod-matta-rice": ["matta rice", "rice", "മട്ട അരി", "അരി"],
  "prod-sona-rice": ["sona masoori", "rice", "അരി"],
  "prod-banana": ["banana", "പഴം"],
  "prod-bread": ["bread", "ബ്രഡ്"],
  "prod-coconut-oil": ["coconut oil", "oil", "വെളിച്ചെണ്ണ"],
  "prod-dish-soap": ["dish wash", "soap", "സോപ്പ്"]
};

const manglishProductAliases: Record<string, string[]> = {
  "prod-apple": ["apple", "aappil", "appil", "seema pazham", "aapil pazham"],
  "prod-ash-gourd": ["kumbalanga", "kumbalanga kaya", "kumbalam", "ashgourd", "poosanikka", "poosanikai"],
  "prod-banana": ["pazham", "nenthra pazham", "nendra pazham", "nenthran pazham", "banana", "vazha pazham"],
  "prod-basmati-rice": ["ari", "basmati ari", "basmathi ari", "basmati rice", "basumathi ari"],
  "prod-bath-soap": ["soap", "soppu", "kulikkunna soppu", "bath soppu", "kuli soap", "kulikkan soap"],
  "prod-beans": ["beans", "beens", "payar", "beans payar"],
  "prod-beef": ["beef", "beefu", "erachi", "irachi", "maadu erachi", "madu irachi"],
  "prod-bitter-gourd": ["pavakka", "paavakka", "kaipakka", "kaippakka", "bittergourd"],
  "prod-bread": ["bread", "brad", "rotti", "double rotti", "bakery rotti"],
  "prod-brinjal": ["vazhuthananga", "vazhuthana", "brinjal", "kathirikka", "kathirikai", "vazhuthanenga"],
  "prod-broken-rice": ["ari", "broken ari", "nurukku ari", "podiyari", "nuru ari"],
  "prod-bun": ["bun", "bunnu", "bakery bun", "sweet bun"],
  "prod-cabbage": ["cabbage", "kyabej", "muttakose", "muttakos"],
  "prod-carrot": ["carrot", "carrotu", "karat", "carattu"],
  "prod-cauliflower": ["cauliflower", "coli flower", "koliflower", "gobi", "gopi"],
  "prod-chapati": ["chapati", "chappathi", "chapathi", "rotti", "chappati"],
  "prod-cherumani-rice": ["ari", "cherumani ari", "cherumani", "cherumani rice"],
  "prod-chicken-broiler": ["chicken", "kozhi", "kozi", "broiler", "broiler kozhi", "chikkan"],
  "prod-chicken-curry-cut": ["chicken", "kozhi", "kozi", "curry cut", "curry kozhi", "chikkan"],
  "prod-chicken-skinless": ["chicken", "kozhi", "kozi", "skinless", "skinless kozhi", "chikkan"],
  "prod-chilli-powder": ["mulaku podi", "mulak podi", "chilli podi", "chilly powder", "milaku podi"],
  "prod-coconut-oil": ["velichenna", "velichenna oil", "coconut enna", "thenga enna", "coconut oil", "nalikeram enna"],
  "prod-cucumber": ["kakhidi", "kakdi", "kakadi", "vellari", "velari", "vellarikka", "vellarika", "kheera"],
  "prod-detergent": ["detergent", "washing powder", "alakkupodi", "alak podi", "thuni alakku podi", "thuni soap podi"],
  "prod-dish-soap": ["dish wash", "pathram soap", "pathram soppu", "pathram kazhukan", "soppu", "pathram kazhukal soap"],
  "prod-eggs": ["mutta", "motta", "kozhi mutta", "egg", "eggs"],
  "prod-fish-ayala": ["meen", "ayala", "aila", "ayila", "fish"],
  "prod-fish-king": ["meen", "neymeen", "ney meen", "aikora", "king fish", "fish"],
  "prod-fish-sardine": ["meen", "mathi", "chaala", "chala", "sardine", "fish"],
  "prod-floor-cleaner": ["floor cleaner", "thara cleaner", "nilam cleaner", "floor liquid", "nilam kazhukal liquid"],
  "prod-grapes": ["grapes", "munthiri", "muntiri", "mundiri"],
  "prod-green-gram": ["cherupayar", "cheru payar", "green gram", "payar", "moong"],
  "prod-guava": ["perakka", "perakka pazham", "guava", "pera"],
  "prod-idli-rice": ["ari", "idli ari", "idly ari", "idli rice"],
  "prod-kuruva-rice": ["ari", "kuruva ari", "kuruva", "kuruva rice"],
  "prod-ladies-finger": ["vendakka", "venda", "ladies finger", "okra", "bendakka"],
  "prod-mango": ["manga", "maanga", "mango", "mampazham"],
  "prod-matta-rice": ["ari", "matta ari", "matta rice", "matamara", "matta mara", "kerala rice", "kuthari", "red rice"],
  "prod-milk": ["paal", "pal", "milk"],
  "prod-mutton": ["mutton", "aadu erachi", "aadu irachi", "erachi", "irachi", "aattirachi"],
  "prod-noodles": ["noodles", "noodels", "nool", "instant noodles", "maggi", "magi"],
  "prod-onion": ["savala", "sawala", "ulli", "onion", "big onion"],
  "prod-orange": ["orange", "naranga", "narayana", "madhura naranga", "orange naranga", "orange mask", "orange pazham"],
  "prod-papaya": ["pappaya", "papaya", "kappalanga", "omakka", "kaplanga"],
  "prod-parotta": ["porotta", "parotta", "barotta", "paratha"],
  "prod-pineapple": ["kaithachakka", "kaitha chakka", "pineapple", "pine apple", "kaithakka"],
  "prod-plantain": ["pazham", "nendran", "nenthran", "ethakka", "ethapazham", "plantain"],
  "prod-pomegranate": ["mathalam", "mathala naranga", "pomegranate", "mathalanaranga"],
  "prod-potato": ["urulakizhangu", "urula", "kizhangu", "potato", "aloo"],
  "prod-prawns": ["chemmeen", "chemeen", "konju", "prawns", "meen"],
  "prod-quail": ["kaada", "kada", "kaada mutta", "kada mutta", "quail"],
  "prod-raw-rice": ["ari", "pachari", "raw ari", "raw rice"],
  "prod-rusk": ["rusk", "rask", "toast", "bakery rask"],
  "prod-salt": ["uppu", "salt"],
  "prod-sapota": ["sapota", "chikkoo", "chikku", "sapotta", "sapotta pazham"],
  "prod-shampoo": ["shampoo", "shampu", "thalayil thekkunna shampoo", "mudi shampoo"],
  "prod-sona-rice": ["ari", "sona ari", "sona masoori ari", "sona rice"],
  "prod-sugar": ["panchasara", "panjasara", "sugar", "sharkara alla panchasara"],
  "prod-tea-powder": ["chaaya podi", "chaya podi", "tea podi", "tea powder", "theyila podi"],
  "prod-tomato": ["thakkali", "takkali", "thakali", "takali", "takkli", "thakkli", "ta"],
  "prod-turmeric-powder": ["manjal podi", "manjal", "turmeric podi", "turmeric powder"],
  "prod-urad-dal": ["uzhunnu", "uzhunnu parippu", "urad dal", "ulundhu"],
  "prod-watermelon": ["thannimathan", "thanni mathan", "watermelon", "water melon"],
  "prod-yogurt": ["thairu", "thayiru", "curd", "yogurt"]
};

type CustomerPageClientProps = {
  initialCatalog: CatalogData;
};

export function CustomerPageClient({ initialCatalog }: CustomerPageClientProps) {
  const { categories, products, serviceFeeRule, slots } = initialCatalog;
  const customer = orders.find((order) => order.customer.id === "customer-1")?.customer ?? {
    id: "customer-1",
    role: "customer" as const,
    name: "Fathima N.",
    phone: "+919876543210"
  };
  const customerAddress = orders.find((order) => order.customer.id === "customer-1")?.address ?? {
    id: "addr-1",
    customerId: "customer-1",
    houseName: "Green Villa",
    addressLine: "12 Market Road",
    landmark: "Near Masjid Junction",
    locality: "Local Area"
  };
  const [globalSearchTerm, setGlobalSearchTerm] = useState("");
  const [selectedCategoryId, setSelectedCategoryId] = useState("all");
  const [selectedPriceRange, setSelectedPriceRange] = useState<ProductPriceRange>("all");
  const [sortMode, setSortMode] = useState<ProductSortMode>("name_asc");
  const [draftQuantities, setDraftQuantities] = useState<Record<string, number>>({});
  const [cart, setCart] = useState<CartLine[]>([]);
  const [selectedSlotId, setSelectedSlotId] = useState(slots.find(isSlotAvailable)?.id ?? slots[0].id);
  const [isFilterOpen, setIsFilterOpen] = useState(false);
  const [isSortOpen, setIsSortOpen] = useState(false);
  const [isProfileOpen, setIsProfileOpen] = useState(false);
  const [isAddressEditorOpen, setIsAddressEditorOpen] = useState(false);
  const [orderUpdateIndex, setOrderUpdateIndex] = useState<number | null>(null);
  const [openNoteIds, setOpenNoteIds] = useState<Record<string, boolean>>({});
  const [isNoteReminderOpen, setIsNoteReminderOpen] = useState(false);
  const [hasAcknowledgedNoteReminder, setHasAcknowledgedNoteReminder] = useState(false);
  const [isCustomItemFormOpen, setIsCustomItemFormOpen] = useState(false);
  const [customItemDraft, setCustomItemDraft] = useState({ productName: "", note: "" });
  const productControlsRef = useRef<HTMLDivElement>(null);
  const [profileDraft, setProfileDraft] = useState({
    name: customer.name,
    phone: customer.phone,
    houseName: customerAddress.houseName,
    addressLine: customerAddress.addressLine,
    landmark: customerAddress.landmark ?? "",
    locality: customerAddress.locality
  });

  const selectedCategory = categories.find((category) => category.id === selectedCategoryId);
  const productRows = useMemo(() => {
    return products
      .filter((product) => selectedCategoryId === "all" || product.categoryId === selectedCategoryId)
      .filter((product) => matchesPriceRange(product, selectedPriceRange))
      .filter((product) => matchesSearch(product, globalSearchTerm))
      .sort((first, second) => sortProducts(first, second, sortMode));
  }, [globalSearchTerm, selectedCategoryId, selectedPriceRange, sortMode]);
  const activeCategoryLabel = selectedCategory?.name ?? "All categories";
  const popularProducts = useMemo(
    () =>
      products
        .filter((product) => product.popularity === "top_selling" || product.popularity === "popular")
        .sort((first, second) => popularityRank(second) - popularityRank(first) || first.name.localeCompare(second.name))
        .slice(0, 4),
    []
  );
  const priceMoverProducts = useMemo(
    () =>
      products
        .filter((product) => typeof product.previousWeekPrice === "number")
        .sort((first, second) => Math.abs(priceDifference(second)) - Math.abs(priceDifference(first)))
        .slice(0, 4),
    []
  );
  const cartItems: OrderItem[] = useMemo(
    () =>
      cart
        .map((line, index) => {
          if (line.kind === "custom") {
            return {
              id: line.id,
              productId: line.id,
              productName: line.productName,
              unit: "request",
              requestedQuantity: 1,
              estimatedPrice: 0,
              notes: line.note || undefined
            };
          }
          const product = products.find((entry) => entry.id === line.productId);
          if (!product) return null;
          return {
            id: `cart-${index}`,
            productId: product.id,
            productName: product.name,
            unit: product.unit,
            requestedQuantity: line.quantity,
            estimatedPrice: product.price,
            notes: line.note || undefined
          };
        })
        .filter(Boolean) as OrderItem[],
    [cart]
  );

  const subtotal = calculateEstimate(cartItems);
  const serviceFee = calculateServiceFee(subtotal, serviceFeeRule);
  const payable = subtotal + serviceFee;
  const selectedSlot = slots.find((slot) => slot.id === selectedSlotId);
  const customerOrders = orders.filter((order) => order.customer.id === "customer-1");
  const isCartVisible = cartItems.length > 0;
  const isPinnedCart = cartItems.length === 1;
  const isScrollableCart = cartItems.length > 8;
  const latestOrder = [...customerOrders].sort(
    (first, second) => new Date(second.createdAt).getTime() - new Date(first.createdAt).getTime()
  )[0];
  const activeOrderUpdate = orderUpdateIndex === null ? null : demoOrderUpdates[orderUpdateIndex];

  useEffect(() => {
    function closeProductMenus(event: PointerEvent) {
      if (!isFilterOpen && !isSortOpen) return;
      const target = event.target;
      if (target instanceof Node && productControlsRef.current?.contains(target)) return;
      setIsFilterOpen(false);
      setIsSortOpen(false);
    }

    document.addEventListener("pointerdown", closeProductMenus);
    return () => document.removeEventListener("pointerdown", closeProductMenus);
  }, [isFilterOpen, isSortOpen]);

  useEffect(() => {
    if (orderUpdateIndex === null) return;

    const timeout = window.setTimeout(
      () => {
        setOrderUpdateIndex((current) => {
          if (current === null) return null;
          return current < demoOrderUpdates.length - 1 ? current + 1 : null;
        });
      },
      orderUpdateIndex < demoOrderUpdates.length - 1 ? 2800 : 4200
    );

    return () => window.clearTimeout(timeout);
  }, [orderUpdateIndex]);

  function getDraftQuantity(productId: string) {
    return draftQuantities[productId] ?? 1;
  }

  function updateDraftQuantity(productId: string, delta: number) {
    const product = products.find((entry) => entry.id === productId);
    const unit = product?.unit ?? "piece";
    setDraftQuantities((current) => ({
      ...current,
      [productId]: normalizeQuantity(getDraftQuantity(productId) + delta, unit)
    }));
  }

  function setDraftQuantity(productId: string, quantity: number) {
    const product = products.find((entry) => entry.id === productId);
    const unit = product?.unit ?? "piece";
    setDraftQuantities((current) => ({
      ...current,
      [productId]: normalizeQuantity(quantity, unit)
    }));
  }

  function addProductToCart(productId: string) {
    const quantity = getDraftQuantity(productId);
    setCart((current) => {
      const next = [...current];
      const existing = next.find((line): line is ListedCartLine => line.kind === "listed" && line.productId === productId);
      if (existing) {
        existing.quantity += quantity;
      } else {
        next.push({ kind: "listed", productId, quantity });
      }
      return next;
    });
  }

  function updateCartQuantity(lineKey: string, delta: number) {
    setCart((current) =>
      current
        .map((line) => {
          if (getCartLineKey(line) !== lineKey || line.kind !== "listed") return line;
          const product = products.find((entry) => entry.id === line.productId);
          const nextQuantity = normalizeQuantity(line.quantity + delta, product?.unit ?? "piece");
          return nextQuantity < getMinimumQuantity(product?.unit ?? "piece") ? null : { ...line, quantity: nextQuantity };
        })
        .filter(Boolean) as CartLine[]
    );
  }

  function setCartQuantity(lineKey: string, quantity: number) {
    setCart((current) =>
      current.map((line) => {
        if (getCartLineKey(line) !== lineKey || line.kind !== "listed") return line;
        const product = products.find((entry) => entry.id === line.productId);
        return { ...line, quantity: normalizeQuantity(quantity, product?.unit ?? "piece") };
      })
    );
  }

  function toggleCartNote(lineKey: string) {
    setOpenNoteIds((current) => ({ ...current, [lineKey]: !current[lineKey] }));
  }

  function updateCartNote(lineKey: string, note: string) {
    setCart((current) =>
      current.map((line) => (getCartLineKey(line) === lineKey ? { ...line, note } : line))
    );
  }

  function confirmCartNote(lineKey: string) {
    setOpenNoteIds((current) => ({ ...current, [lineKey]: false }));
  }

  function clearCartNote(lineKey: string) {
    updateCartNote(lineKey, "");
  }

  function addCustomItemToCart() {
    const productName = customItemDraft.productName.trim();
    if (!productName) return;
    const id = `custom-${Date.now()}`;
    setCart((current) => [...current, { kind: "custom", id, productName, note: customItemDraft.note.trim() }]);
    setOpenNoteIds((current) => ({ ...current, [id]: true }));
    setCustomItemDraft({ productName: "", note: "" });
    setIsCustomItemFormOpen(false);
  }

  function selectFromHighlight(product: Product) {
    if (product.categoryId !== selectedCategoryId) setSelectedCategoryId(product.categoryId);
    if (selectedPriceRange !== "all") setSelectedPriceRange("all");
    setDraftQuantities((current) => ({ ...current, [product.id]: current[product.id] ?? 1 }));
    addProductToCart(product.id);
  }

  function clearFilters() {
    setSelectedCategoryId("all");
    setSelectedPriceRange("all");
  }

  function updateProfileDraft(field: keyof typeof profileDraft, value: string) {
    setProfileDraft((current) => ({ ...current, [field]: value }));
  }

  function submitDemoOrder() {
    if (!selectedSlot || cartItems.length === 0) return;
    if (!hasAcknowledgedNoteReminder && cartItems.some((item) => !item.notes?.trim())) {
      setIsNoteReminderOpen(true);
      return;
    }
    setOrderUpdateIndex(0);
  }

  function continueSubmitFromReminder() {
    setHasAcknowledgedNoteReminder(true);
    setIsNoteReminderOpen(false);
    setOrderUpdateIndex(0);
  }

  return (
    <AppShell
      hideNav
      headerContent={
        <>
          <a
            href={isCartVisible ? "#cart" : "#products"}
            aria-label="Cart"
            title="Cart"
            className="focus-ring inline-flex h-9 w-9 items-center justify-center rounded-full border border-ink/15 bg-white text-ink hover:border-leaf/40 hover:text-leaf"
          >
            <ShoppingCart aria-hidden size={16} />
          </a>
          <CustomerProfileMenu
            profile={profileDraft}
            isOpen={isProfileOpen}
            onToggle={() => setIsProfileOpen((current) => !current)}
            onManageAddress={() => {
              setIsProfileOpen(false);
              setIsAddressEditorOpen(true);
            }}
          />
          <a
            href="/"
            aria-label="Home"
            title="Home"
            className="focus-ring inline-flex h-9 w-9 items-center justify-center rounded-full border border-ink/15 bg-white text-ink hover:border-leaf/40 hover:text-leaf"
          >
            <Home aria-hidden size={16} />
          </a>
        </>
      }
    >
      <section className="border-b border-ink/10 bg-white">
        <div className="mx-auto max-w-7xl px-2 py-2 sm:px-4 lg:px-6">
          <div className="flex items-center gap-2 rounded-full border border-ink bg-limewash px-3 py-2">
            <Search aria-hidden className="shrink-0 text-leaf" size={18} />
            <input
              id="product-search"
              value={globalSearchTerm}
              onChange={(event) => setGlobalSearchTerm(event.target.value)}
              placeholder="Search within the active category and price filter"
              aria-label="Search products"
              className="w-full bg-transparent text-sm outline-none placeholder:text-ink/38"
            />
          </div>
          <div ref={productControlsRef} className="mt-1.5 flex flex-wrap items-center gap-2">
            <div className="flex flex-wrap items-center gap-3">
              <ProductFilterDropdown
                categories={categories}
                isOpen={isFilterOpen}
                selectedCategoryId={selectedCategoryId}
                selectedPriceRange={selectedPriceRange}
                onToggle={() => {
                  setIsFilterOpen((current) => !current);
                  setIsSortOpen(false);
                }}
                onSelectCategory={(categoryId) => {
                  setSelectedCategoryId(categoryId);
                }}
                onSelectPriceRange={(priceRange) => {
                  setSelectedPriceRange(priceRange);
                }}
                onClear={clearFilters}
              />
              <ProductSortDropdown
                isOpen={isSortOpen}
                sortMode={sortMode}
                onToggle={() => {
                  setIsSortOpen((current) => !current);
                  setIsFilterOpen(false);
                }}
                onSelect={(nextSortMode) => {
                  setSortMode(nextSortMode);
                  setIsSortOpen(false);
                }}
              />
            </div>
            <span className="ml-auto rounded-full bg-mint px-2.5 py-1 text-xs font-semibold text-leaf">
              {productRows.length} items
            </span>
          </div>
        </div>
      </section>

      <section
        className={
          isCartVisible
            ? "mx-auto grid max-w-7xl items-stretch gap-2 px-2 py-2 sm:px-4 lg:grid-cols-[minmax(0,2.25fr)_minmax(250px,0.9fr)_minmax(260px,0.9fr)] lg:px-6"
            : "mx-auto grid max-w-7xl items-stretch gap-2 px-2 py-2 sm:px-4 lg:grid-cols-[minmax(0,3fr)_minmax(290px,1fr)] lg:px-6"
        }
      >
        <main className="flex h-[794px] min-h-0 flex-col">
          <section
            id="products"
            className="flex h-full min-h-0 flex-col rounded-xl border border-ink/10 bg-white p-2.5 shadow-soft"
          >
            <div className="flex flex-col gap-1 border-b border-ink/10 pb-2 sm:flex-row sm:items-center sm:justify-between">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Products</p>
                <h1 className="mt-1 flex items-center gap-2 text-xl font-semibold">
                  <PackageSearch aria-hidden size={18} />
                  {globalSearchTerm.trim() ? "Search results" : activeCategoryLabel}
                </h1>
                <p className="mt-0.5 text-xs text-ink/58">
                  Search, filter, and sort from the top controls. Prices are approximate local-market entries.
                </p>
              </div>
            </div>

            <div className="mt-2 flex flex-wrap items-center gap-1.5 text-xs font-semibold text-ink/60">
              <span className="rounded-full bg-limewash px-2.5 py-1">{activeCategoryLabel}</span>
              <span className="rounded-full bg-limewash px-2.5 py-1">{priceRangeLabels[selectedPriceRange]}</span>
              <span className="rounded-full bg-limewash px-2.5 py-1">{sortLabels[sortMode]}</span>
              {globalSearchTerm.trim() ? <span className="rounded-full bg-mint px-2.5 py-1 text-leaf">Search: {globalSearchTerm.trim()}</span> : null}
            </div>

            {productRows.length > 0 ? (
              <div className="mt-2 min-h-0 flex-1 overflow-y-auto overflow-x-hidden pr-1">
                <table className={isCartVisible ? "w-full table-fixed border-separate border-spacing-y-1 text-left text-[11px]" : "w-full table-fixed border-separate border-spacing-y-1 text-left text-xs"}>
                  <colgroup>
                    <col className={isCartVisible ? "w-[6%]" : "w-[7%]"} />
                    <col className={isCartVisible ? "w-[29%]" : "w-[27%]"} />
                    <col className={isCartVisible ? "w-[16%]" : "w-[15%]"} />
                    <col className={isCartVisible ? "w-[14%]" : "w-[13%]"} />
                    <col className={isCartVisible ? "w-[24%]" : "w-[24%]"} />
                    <col className={isCartVisible ? "w-[11%]" : "w-[14%]"} />
                  </colgroup>
                  <thead className="sticky top-0 z-10 bg-white">
                    <tr className="text-ink/58">
                      <th className={isCartVisible ? "px-1 py-1 font-semibold" : "px-2 py-1 font-semibold"}>{isCartVisible ? "No" : "No."}</th>
                      <th className={isCartVisible ? "px-1 py-1 font-semibold" : "px-2 py-1 font-semibold"}>{isCartVisible ? "Item" : "Product"}</th>
                      <th className={isCartVisible ? "px-1 py-1 font-semibold" : "px-2 py-1 font-semibold"}>{isCartVisible ? "Rate" : "Price"}</th>
                      <th className={isCartVisible ? "px-1 py-1 font-semibold" : "px-2 py-1 font-semibold"}>Total</th>
                      <th className={isCartVisible ? "px-1 py-1 font-semibold" : "px-2 py-1 font-semibold"}>{isCartVisible ? "Qty" : "Quantity"}</th>
                      <th className={isCartVisible ? "px-1 py-1 font-semibold" : "px-2 py-1 font-semibold"}>{isCartVisible ? "Add" : "Cart"}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {productRows.map((product, index) => (
                        <tr key={product.id} className="bg-limewash hover:bg-mint/60">
                          <td className={isCartVisible ? "rounded-l-xl px-1 py-1 font-semibold text-ink/50" : "rounded-l-xl px-2 py-1.5 font-semibold text-ink/50"}>{index + 1}</td>
                          <td className={isCartVisible ? "min-w-0 px-1 py-1" : "min-w-0 px-2 py-1.5"}>
                            <p className={isCartVisible ? "truncate font-semibold leading-tight" : "truncate font-semibold"}>{product.name}</p>
                            <p className={isCartVisible ? "mt-0.5 truncate text-[10px] leading-tight text-ink/52" : "mt-0.5 truncate text-[11px] text-ink/52"}>{product.retailRange ?? "Admin-maintained local price"}</p>
                          </td>
                          <td className={isCartVisible ? "px-1 py-1 font-semibold leading-tight" : "px-2 py-1.5 font-semibold"}>
                            {hasKnownPrice(product) ? `${formatCurrency(product.price)} / ${product.unit}` : "Price pending"}
                          </td>
                          <td className={isCartVisible ? "px-1 py-1 font-semibold leading-tight text-leaf" : "px-2 py-1.5 font-semibold text-leaf"}>
                            {hasKnownPrice(product) ? formatCurrency(product.price * getDraftQuantity(product.id)) : "Pending"}
                          </td>
                          <td className={isCartVisible ? "px-1 py-1" : "px-2 py-1.5"}>
                            <QuantityControl
                              value={getDraftQuantity(product.id)}
                              unit={product.unit}
                              compact={isCartVisible}
                              onIncrement={(delta) => updateDraftQuantity(product.id, delta)}
                              onChange={(quantity) => setDraftQuantity(product.id, quantity)}
                            />
                          </td>
                          <td className={isCartVisible ? "rounded-r-xl px-1 py-1" : "rounded-r-xl px-2 py-1.5"}>
                            <button
                              type="button"
                              onClick={() => addProductToCart(product.id)}
                              className={isCartVisible ? "focus-ring inline-flex items-center justify-center rounded-full bg-leaf px-2 py-1 text-[10px] font-semibold text-white" : "focus-ring inline-flex items-center gap-1.5 rounded-full bg-leaf px-3 py-1.5 text-xs font-semibold text-white"}
                            >
                              <ShoppingCart aria-hidden size={isCartVisible ? 12 : 14} />
                              <span className={isCartVisible ? "sr-only" : ""}>Add</span>
                            </button>
                          </td>
                        </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            ) : (
              <div className="mt-2 rounded-xl border border-dashed border-ink/20 bg-limewash p-4 text-center">
                <p className="font-semibold">No products match this search and filter.</p>
                <p className="mt-1 text-sm text-ink/58">Try clearing the filter or searching another product name.</p>
              </div>
            )}

          </section>
        </main>

        {isCartVisible ? (
          <section
            id="cart"
            className={
              isPinnedCart || isScrollableCart
                ? "flex h-fit max-h-[calc(100vh-6rem)] min-h-[calc(100vh-6rem)] flex-col rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm scroll-mt-24 lg:sticky lg:top-20"
                : "flex h-fit flex-col rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm scroll-mt-24"
            }
          >
            <div className="flex items-center justify-between gap-2">
              <h2 className="flex items-center gap-2 text-base font-semibold">
                <ShoppingCart aria-hidden size={18} />
                Cart
              </h2>
              <span className="text-xs font-semibold text-ink/56">{cartItems.length} items</span>
            </div>

              <div className={isPinnedCart || isScrollableCart ? "mt-2 min-h-0 flex-1 space-y-1.5 overflow-y-auto pr-1" : "mt-2 space-y-1.5 pr-1"}>
                {cartItems.map((item, index) => {
                  const line = cart[index];
                  const lineKey = getCartLineKey(line);
                  const isCustomItem = line.kind === "custom";
                  const isEstimatePending = item.estimatedPrice <= 0;
                  const isNoteOpen = openNoteIds[lineKey];

                  return (
                    <div key={lineKey} className="rounded-xl border border-ink/10 bg-limewash p-1.5">
                      <div className="flex items-start justify-between gap-1.5">
                        <div className="min-w-0">
                          <p className="truncate text-[13px] font-semibold leading-tight">{item.productName}</p>
                          <p className="mt-0.5 text-[11px] leading-tight text-ink/58">
                            {isCustomItem || isEstimatePending
                              ? "Estimated price pending"
                              : `${formatQuantity(item.requestedQuantity, item.unit)} x ${formatCurrency(item.estimatedPrice)}`}
                          </p>
                        </div>
                        <strong className="shrink-0 text-xs">
                          {isCustomItem || isEstimatePending ? "Pending" : formatCurrency(item.requestedQuantity * item.estimatedPrice)}
                        </strong>
                      </div>

                      {!isNoteOpen ? (
                        <>
                          <div className="mt-1 flex flex-wrap items-center justify-between gap-1">
                            <button
                              type="button"
                              onClick={() => toggleCartNote(lineKey)}
                              className="focus-ring rounded-full border border-ink/15 bg-white px-2 py-0.5 text-[11px] font-semibold text-ink/68 hover:border-leaf/40 hover:text-leaf"
                            >
                              {item.notes?.trim() ? "Edit note" : "Add note"}
                            </button>
                            {!isCustomItem ? (
                              <QuantityControl
                                value={item.requestedQuantity}
                                unit={item.unit}
                                compact
                                onIncrement={(delta) => updateCartQuantity(lineKey, delta)}
                                onChange={(quantity) => setCartQuantity(lineKey, quantity)}
                              />
                            ) : null}
                          </div>
                          {item.notes?.trim() ? (
                            <p className="mt-1 rounded-lg bg-white px-2 py-1 text-[11px] leading-snug text-ink/62">{item.notes}</p>
                          ) : null}
                        </>
                      ) : (
                        <div className="mt-1 rounded-xl bg-white p-1.5">
                          <div className="flex justify-end">
                            <button
                              type="button"
                              onClick={() => confirmCartNote(lineKey)}
                              className="focus-ring inline-flex h-6 w-6 items-center justify-center rounded-full border border-ink/15 text-ink/58 hover:border-leaf/40 hover:text-leaf"
                              aria-label="Close note editor"
                              title="Close"
                            >
                              <X aria-hidden size={13} />
                            </button>
                          </div>
                          <textarea
                            value={item.notes ?? ""}
                            onChange={(event) => updateCartNote(lineKey, event.target.value)}
                            rows={2}
                            placeholder="Type your demand or instruction"
                            className="focus-ring mt-1 w-full resize-none rounded-lg border border-ink/15 bg-limewash px-2 py-1.5 text-xs outline-none placeholder:text-ink/38"
                          />
                          <div className="mt-1 flex items-center gap-1.5">
                            <button
                              type="button"
                              onClick={() => confirmCartNote(lineKey)}
                              className="focus-ring inline-flex flex-1 items-center justify-center rounded-full bg-leaf px-3 py-1 text-xs font-semibold text-white"
                            >
                              OK
                            </button>
                            <button
                              type="button"
                              onClick={() => clearCartNote(lineKey)}
                              className="focus-ring inline-flex flex-1 items-center justify-center rounded-full border border-ink/15 px-3 py-1 text-xs font-semibold hover:border-leaf/40 hover:text-leaf"
                            >
                              Clear
                            </button>
                          </div>
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>

            <div className="mt-2 shrink-0 rounded-xl border border-dashed border-ink/18 bg-limewash p-2">
              {!isCustomItemFormOpen ? (
                <button
                  type="button"
                  onClick={() => setIsCustomItemFormOpen(true)}
                  className="focus-ring inline-flex w-full items-center justify-center gap-1.5 rounded-full border border-ink/15 bg-white px-3 py-1.5 text-xs font-semibold hover:border-leaf/40 hover:text-leaf"
                >
                  <Plus aria-hidden size={14} />
                  Add custom product
                </button>
              ) : (
                <div className="mt-2 space-y-1.5">
                  <div className="flex justify-end">
                    <button
                      type="button"
                      onClick={() => setIsCustomItemFormOpen(false)}
                      className="focus-ring inline-flex h-7 w-7 items-center justify-center rounded-full border border-ink/15 bg-white text-ink/62 hover:border-leaf/40 hover:text-leaf"
                      aria-label="Close custom product form"
                      title="Close"
                    >
                      <X aria-hidden size={14} />
                    </button>
                  </div>
                  <input
                    value={customItemDraft.productName}
                    onChange={(event) => setCustomItemDraft((current) => ({ ...current, productName: event.target.value }))}
                    placeholder="Product not listed"
                    className="focus-ring w-full rounded-lg border border-ink/15 bg-white px-2 py-1.5 text-xs outline-none placeholder:text-ink/38"
                  />
                  <textarea
                    value={customItemDraft.note}
                    onChange={(event) => setCustomItemDraft((current) => ({ ...current, note: event.target.value }))}
                    rows={2}
                    placeholder="Quantity, brand, shop, or instruction"
                    className="focus-ring w-full resize-none rounded-lg border border-ink/15 bg-white px-2 py-1.5 text-xs outline-none placeholder:text-ink/38"
                  />
                  <button
                    type="button"
                    onClick={addCustomItemToCart}
                    disabled={!customItemDraft.productName.trim()}
                    className="focus-ring inline-flex w-full items-center justify-center rounded-full bg-leaf px-3 py-1.5 text-xs font-semibold text-white disabled:opacity-50"
                  >
                    Add custom item
                  </button>
                </div>
              )}
            </div>

            <div className="mt-2 shrink-0">
              <label className="flex items-center gap-2 text-sm font-semibold" htmlFor="slot">
                <CalendarClock aria-hidden size={16} />
                Delivery slot
              </label>
              <select
                id="slot"
                className="focus-ring mt-1.5 w-full rounded-xl border border-ink/15 bg-white px-3 py-2 text-xs"
                value={selectedSlotId}
                onChange={(event) => setSelectedSlotId(event.target.value)}
              >
                {slots.map((slot) => (
                  <option key={slot.id} value={slot.id} disabled={!isSlotAvailable(slot)}>
                    {slot.label} - {remainingSlotCapacity(slot)} left
                  </option>
                ))}
              </select>
            </div>

            <div className="mt-2 shrink-0 space-y-1 rounded-xl bg-limewash p-2">
              <div className="flex justify-between text-xs">
                <span>Items estimate</span>
                <strong>{formatCurrency(subtotal)}</strong>
              </div>
              <div className="flex justify-between text-xs">
                <span>Service fee</span>
                <strong>{formatCurrency(serviceFee)}</strong>
              </div>
              <div className="flex justify-between border-t border-ink/10 pt-1.5 text-sm">
                <span className="font-semibold">Approx payable</span>
                <strong>{formatCurrency(payable)}</strong>
              </div>
              <div className="flex justify-between text-xs text-ink/60">
                <span>Estimated slot</span>
                <strong className="text-right text-ink">{selectedSlot?.label}</strong>
              </div>
            </div>

            <button
              type="button"
              onClick={submitDemoOrder}
              className="focus-ring mt-2 inline-flex w-full shrink-0 items-center justify-center gap-2 rounded-full bg-leaf px-4 py-2 text-sm font-semibold text-white disabled:opacity-50"
              disabled={!selectedSlot || cartItems.length === 0}
            >
              <Send aria-hidden size={16} />
              Submit order
            </button>
          </section>
        ) : null}

        <aside className="h-fit space-y-2 lg:sticky lg:top-20">
          <section className="rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm">
            <ProductHighlightGroup title="Popular products" icon={Flame} products={popularProducts} onSelect={selectFromHighlight} />
            <ProductHighlightGroup title="Big price changes" icon={Tag} products={priceMoverProducts} onSelect={selectFromHighlight} />
          </section>

          <LatestDeliveryCard order={latestOrder} totalOrders={customerOrders.length} />

        </aside>
      </section>

      {activeOrderUpdate ? <OrderUpdateToast update={activeOrderUpdate} onClose={() => setOrderUpdateIndex(null)} /> : null}

      {isNoteReminderOpen ? (
        <div className="fixed inset-0 z-40 flex items-center justify-center bg-ink/35 px-4 py-6">
          <section className="max-h-[calc(100vh-2rem)] w-full max-w-2xl overflow-y-auto rounded-xl bg-white p-4 shadow-soft">
            <div className="flex items-start justify-between gap-4">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Order notes</p>
                <h2 className="mt-1 text-xl font-semibold">Add product notes if needed</h2>
                <p className="mt-1 text-sm text-ink/60">
                  Notes help staff choose the right brand, company, shop, size, freshness, or substitution before buying.
                </p>
              </div>
              <button
                type="button"
                onClick={() => setIsNoteReminderOpen(false)}
                className="focus-ring rounded-full border border-ink/15 px-3 py-1.5 text-sm font-semibold"
              >
                Cancel
              </button>
            </div>

            <div className="mt-3 space-y-2">
              {cartItems.map((item, index) => {
                const line = cart[index];
                const lineKey = getCartLineKey(line);

                return (
                  <label key={lineKey} className="block rounded-xl bg-limewash p-2.5 text-sm font-semibold">
                    {item.productName}
                    <span className="ml-2 text-xs font-normal text-ink/52">
                      {line.kind === "custom" ? "Pending estimate" : formatQuantity(item.requestedQuantity, item.unit)}
                    </span>
                    <textarea
                      value={item.notes ?? ""}
                      onChange={(event) => updateCartNote(lineKey, event.target.value)}
                      rows={2}
                      placeholder="Brand, shop, company, quantity detail, or special instruction"
                      className="focus-ring mt-1.5 w-full resize-none rounded-lg border border-ink/15 bg-white px-2 py-1.5 text-xs font-normal outline-none placeholder:text-ink/38"
                    />
                  </label>
                );
              })}
            </div>

            <div className="mt-3 grid gap-2 sm:grid-cols-2">
              <button
                type="button"
                onClick={continueSubmitFromReminder}
                className="focus-ring inline-flex items-center justify-center rounded-full bg-leaf px-4 py-2.5 text-sm font-semibold text-white"
              >
                Save notes and submit
              </button>
              <button
                type="button"
                onClick={continueSubmitFromReminder}
                className="focus-ring inline-flex items-center justify-center rounded-full border border-ink/15 px-4 py-2.5 text-sm font-semibold hover:border-leaf/40 hover:text-leaf"
              >
                Continue without notes
              </button>
            </div>
          </section>
        </div>
      ) : null}

      {isAddressEditorOpen ? (
        <div className="fixed inset-0 z-40 flex items-center justify-center bg-ink/35 px-4 py-6">
          <section className="w-full max-w-2xl rounded-xl bg-white p-4 shadow-soft">
            <div className="flex items-start justify-between gap-4">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.12em] text-leaf">Manage address</p>
                <h2 className="mt-1 text-xl font-semibold">Customer contact and delivery details</h2>
              </div>
              <button
                type="button"
                onClick={() => setIsAddressEditorOpen(false)}
                className="focus-ring rounded-full border border-ink/15 px-3 py-1.5 text-sm font-semibold"
              >
                Close
              </button>
            </div>
            <div className="mt-3 grid gap-3 sm:grid-cols-2">
              <ProfileInput label="Customer name" value={profileDraft.name} onChange={(value) => updateProfileDraft("name", value)} />
              <ProfileInput label="WhatsApp number" value={profileDraft.phone} onChange={(value) => updateProfileDraft("phone", value)} />
              <ProfileInput label="House name" value={profileDraft.houseName} onChange={(value) => updateProfileDraft("houseName", value)} />
              <ProfileInput label="Locality" value={profileDraft.locality} onChange={(value) => updateProfileDraft("locality", value)} />
              <ProfileInput label="Address" value={profileDraft.addressLine} onChange={(value) => updateProfileDraft("addressLine", value)} wide />
              <ProfileInput label="Landmark" value={profileDraft.landmark} onChange={(value) => updateProfileDraft("landmark", value)} wide />
            </div>
            <button
              type="button"
              onClick={() => setIsAddressEditorOpen(false)}
              className="focus-ring mt-3 inline-flex w-full items-center justify-center rounded-full bg-leaf px-4 py-2.5 text-sm font-semibold text-white"
            >
              Save details
            </button>
          </section>
        </div>
      ) : null}
    </AppShell>
  );
}

function QuantityControl({ value, unit, compact = false, onIncrement, onChange }: QuantityControlProps) {
  const [isEditing, setIsEditing] = useState(false);
  const [draftValue, setDraftValue] = useState(formatQuantityNumber(value, unit));
  const step = getQuantityStep(unit);

  useEffect(() => {
    if (!isEditing) setDraftValue(formatQuantityNumber(value, unit));
  }, [isEditing, unit, value]);

  function commitQuantity() {
    const parsed = Number(draftValue);
    if (Number.isFinite(parsed)) onChange(parsed);
    setDraftValue(formatQuantityNumber(normalizeQuantity(Number.isFinite(parsed) ? parsed : value, unit), unit));
    setIsEditing(false);
  }

  return (
    <div className={compact ? "inline-flex items-center gap-0.5 rounded-full border border-ink/10 bg-white p-0.5" : "inline-flex items-center gap-1 rounded-full border border-ink/10 bg-white p-1"}>
      <button
        type="button"
        onClick={() => onIncrement(-step)}
        className={compact ? "focus-ring flex h-6 w-6 items-center justify-center rounded-full border border-ink/10" : "focus-ring flex h-7 w-7 items-center justify-center rounded-full border border-ink/10"}
        aria-label={`Reduce quantity by ${step}`}
      >
        <Minus aria-hidden size={compact ? 13 : 15} />
      </button>
      {isEditing ? (
        <input
          autoFocus
          value={draftValue}
          onChange={(event) => setDraftValue(event.target.value)}
          onBlur={commitQuantity}
          onKeyDown={(event) => {
            if (event.key === "Enter") commitQuantity();
            if (event.key === "Escape") {
              setDraftValue(formatQuantityNumber(value, unit));
              setIsEditing(false);
            }
          }}
          inputMode="decimal"
          className={compact ? "w-12 rounded-full border border-leaf/30 px-1 py-0.5 text-center text-[11px] font-semibold outline-none" : "w-16 rounded-full border border-leaf/30 px-2 py-0.5 text-center text-xs font-semibold outline-none"}
          aria-label={`Enter quantity in ${unit}`}
        />
      ) : (
        <button
          type="button"
          onClick={() => setIsEditing(true)}
          className={compact ? "focus-ring min-w-12 rounded-full px-1 text-center text-[11px] font-semibold leading-none" : "focus-ring min-w-16 rounded-full px-2 text-center text-xs font-semibold"}
          title="Click to type quantity"
        >
          {formatQuantity(value, unit)}
        </button>
      )}
      <button
        type="button"
        onClick={() => onIncrement(step)}
        className={compact ? "focus-ring flex h-6 w-6 items-center justify-center rounded-full bg-leaf text-white" : "focus-ring flex h-7 w-7 items-center justify-center rounded-full bg-leaf text-white"}
        aria-label={`Increase quantity by ${step}`}
      >
        <Plus aria-hidden size={compact ? 13 : 15} />
      </button>
    </div>
  );
}

function ProductFilterDropdown({
  categories: productCategories,
  isOpen,
  selectedCategoryId,
  selectedPriceRange,
  onToggle,
  onSelectCategory,
  onSelectPriceRange,
  onClear
}: {
  categories: ProductCategory[];
  isOpen: boolean;
  selectedCategoryId: string;
  selectedPriceRange: ProductPriceRange;
  onToggle: () => void;
  onSelectCategory: (categoryId: string) => void;
  onSelectPriceRange: (priceRange: ProductPriceRange) => void;
  onClear: () => void;
}) {
  const categoryLabel = productCategories.find((category) => category.id === selectedCategoryId)?.name ?? "All categories";
  const [activePanel, setActivePanel] = useState<"category" | "price">("category");

  return (
    <div className="relative">
      <button
        type="button"
        onClick={onToggle}
        aria-expanded={isOpen}
        className="focus-ring inline-flex items-center gap-1 rounded-full px-1 py-0.5 text-xs font-semibold uppercase tracking-[0.1em] text-leaf hover:text-ink"
      >
        Filter
        <ChevronDown aria-hidden size={15} />
      </button>
      {isOpen ? (
        <div className="absolute left-0 top-7 z-30 flex items-start gap-1.5">
          <div className="w-40 rounded-xl border border-ink/10 bg-white p-1.5 shadow-soft">
            <button
              type="button"
              onClick={() => setActivePanel("category")}
              className={
                activePanel === "category"
                  ? "focus-ring flex w-full items-center justify-between rounded-lg bg-mint px-2 py-1.5 text-left text-xs font-semibold text-leaf"
                  : "focus-ring flex w-full items-center justify-between rounded-lg px-2 py-1.5 text-left text-xs font-semibold hover:bg-limewash"
              }
            >
              <span>
                Category
                <span className="block text-[11px] font-normal text-ink/52">{categoryLabel}</span>
              </span>
              <ChevronRight aria-hidden size={15} />
            </button>
            <button
              type="button"
              onClick={() => setActivePanel("price")}
              className={
                activePanel === "price"
                  ? "focus-ring mt-1 flex w-full items-center justify-between rounded-lg bg-mint px-2 py-1.5 text-left text-xs font-semibold text-leaf"
                  : "focus-ring mt-1 flex w-full items-center justify-between rounded-lg px-2 py-1.5 text-left text-xs font-semibold hover:bg-limewash"
              }
            >
              <span>
                Price
                <span className="block text-[11px] font-normal text-ink/52">{priceRangeLabels[selectedPriceRange]}</span>
              </span>
              <ChevronRight aria-hidden size={15} />
            </button>
            <button
              type="button"
              onClick={onClear}
              className="focus-ring mt-1.5 w-full rounded-full border border-ink/15 px-2 py-1.5 text-xs font-semibold hover:bg-limewash"
            >
              Clear filters
            </button>
          </div>
          <div className="w-48 rounded-xl border border-ink/10 bg-white p-1.5 shadow-soft">
            {activePanel === "category" ? (
              <div className="grid gap-1">
                <FilterOption selected={selectedCategoryId === "all"} onClick={() => onSelectCategory("all")}>
                  All categories
                </FilterOption>
                {productCategories.map((category) => (
                  <FilterOption key={category.id} selected={selectedCategoryId === category.id} onClick={() => onSelectCategory(category.id)}>
                    {category.name}
                  </FilterOption>
                ))}
              </div>
            ) : (
              <div className="grid gap-1">
                {priceRangeOptions.map((priceRange) => (
                  <FilterOption key={priceRange} selected={selectedPriceRange === priceRange} onClick={() => onSelectPriceRange(priceRange)}>
                    {priceRangeLabels[priceRange]}
                  </FilterOption>
                ))}
              </div>
            )}
          </div>
        </div>
      ) : null}
    </div>
  );
}

function ProductSortDropdown({
  isOpen,
  sortMode,
  onToggle,
  onSelect
}: {
  isOpen: boolean;
  sortMode: ProductSortMode;
  onToggle: () => void;
  onSelect: (sortMode: ProductSortMode) => void;
}) {
  return (
    <div className="relative">
      <button
        type="button"
        onClick={onToggle}
        aria-expanded={isOpen}
        className="focus-ring inline-flex items-center gap-1 rounded-full px-1 py-0.5 text-xs font-semibold uppercase tracking-[0.1em] text-leaf hover:text-ink"
      >
        Sort
        <ChevronDown aria-hidden size={15} />
      </button>
      {isOpen ? (
        <div className="absolute left-0 top-7 z-30 w-48 rounded-xl border border-ink/10 bg-white p-1.5 shadow-soft">
          <p className="px-2 py-1 text-[11px] font-semibold uppercase tracking-[0.12em] text-leaf">Sort by</p>
          <div className="mt-1 grid gap-1">
            {sortOptions.map((option) => (
              <FilterOption key={option} selected={sortMode === option} onClick={() => onSelect(option)}>
                {sortLabels[option]}
              </FilterOption>
            ))}
          </div>
        </div>
      ) : null}
    </div>
  );
}

function FilterOption({ children, selected, onClick }: { children: ReactNode; selected: boolean; onClick: () => void }) {
  return (
    <button
      type="button"
      onClick={onClick}
      className={
        selected
          ? "focus-ring rounded-lg bg-leaf px-2.5 py-1.5 text-left text-xs font-semibold text-white"
          : "focus-ring rounded-lg bg-limewash px-2.5 py-1.5 text-left text-xs font-semibold text-ink/72 hover:bg-mint"
      }
    >
      {children}
    </button>
  );
}

function LatestDeliveryCard({ order, totalOrders }: { order?: Order; totalOrders: number }) {
  return (
    <section id="delivery-history" className="rounded-xl border border-ink/10 bg-white p-2.5 shadow-sm">
      <div className="flex items-center justify-between gap-2">
        <h2 className="text-sm font-semibold">Delivery history</h2>
        <span className="rounded-full bg-mint px-2.5 py-1 text-xs font-semibold text-leaf">{totalOrders} orders</span>
      </div>
      {order ? (
        <article className="mt-2 rounded-xl bg-limewash p-2.5 text-sm">
          <div className="flex items-start justify-between gap-2">
            <div>
              <p className="font-semibold">{order.orderNumber}</p>
              <p className="mt-0.5 text-xs text-ink/58">{order.slot.label}</p>
            </div>
            <span className="rounded-full bg-white px-2.5 py-1 text-[11px] font-semibold capitalize text-leaf">
              {order.status.replaceAll("_", " ")}
            </span>
          </div>
          <div className="mt-2 grid grid-cols-3 gap-2 text-xs">
            <div>
              <span className="text-ink/52">Items</span>
              <strong className="mt-0.5 block">{order.items.length}</strong>
            </div>
            <div>
              <span className="text-ink/52">Payment</span>
              <strong className="mt-0.5 block capitalize">{order.paymentState.replaceAll("_", " ")}</strong>
            </div>
            <div>
              <span className="text-ink/52">Total</span>
              <strong className="mt-0.5 block">{formatCurrency(order.finalTotal ?? order.estimateTotal + order.serviceFee)}</strong>
            </div>
          </div>
        </article>
      ) : (
        <p className="mt-2 rounded-xl bg-limewash p-2.5 text-sm text-ink/58">No deliveries yet.</p>
      )}
      <Link
        href="/customer/history"
        className="focus-ring mt-2 inline-flex w-full items-center justify-center rounded-full border border-ink/15 px-3 py-2 text-xs font-semibold hover:border-leaf/40 hover:text-leaf"
      >
        Check more
      </Link>
    </section>
  );
}

function OrderUpdateToast({ update, onClose }: { update: DemoOrderUpdate; onClose: () => void }) {
  return (
    <section className="fixed bottom-4 left-1/2 z-50 w-[calc(100%-1.5rem)] max-w-md -translate-x-1/2 rounded-2xl border border-leaf/20 bg-white p-3 shadow-soft">
      <div className="flex items-start gap-3">
        <span className="mt-0.5 flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-mint text-leaf">
          <CheckCircle2 aria-hidden size={18} />
        </span>
        <div className="min-w-0 flex-1">
          <p className="font-semibold">{update.title}</p>
          <p className="mt-1 text-sm text-ink/62">{update.message}</p>
        </div>
        <button
          type="button"
          onClick={onClose}
          className="focus-ring rounded-full border border-ink/10 px-2 py-1 text-xs font-semibold text-ink/62 hover:text-ink"
        >
          Close
        </button>
      </div>
    </section>
  );
}

function CustomerProfileMenu({
  profile,
  isOpen,
  onToggle,
  onManageAddress
}: {
  profile: {
    name: string;
    phone: string;
    houseName: string;
    addressLine: string;
    landmark: string;
    locality: string;
  };
  isOpen: boolean;
  onToggle: () => void;
  onManageAddress: () => void;
}) {
  return (
    <div className="relative">
      <button
        type="button"
        onClick={onToggle}
        className="focus-ring inline-flex items-center gap-2 rounded-full border border-ink/15 bg-white px-3 py-2 text-sm font-semibold hover:border-leaf/40"
      >
        <UserRound aria-hidden size={16} />
        <span>{profile.name}</span>
        <ChevronDown aria-hidden size={15} />
      </button>
      {isOpen ? (
        <div className="absolute right-0 top-11 z-30 w-72 rounded-xl border border-ink/10 bg-white p-3 text-sm shadow-soft">
          <p className="font-semibold">{profile.name}</p>
          <p className="mt-1 text-ink/58">{profile.phone}</p>
          <div className="mt-2 rounded-xl bg-limewash p-2.5">
            <p className="font-semibold">{profile.houseName}</p>
            <p className="mt-1 text-ink/62">{profile.addressLine}</p>
            <p className="mt-1 text-ink/62">{profile.landmark}</p>
            <p className="mt-1 text-ink/62">{profile.locality}</p>
          </div>
          <button
            type="button"
            onClick={onManageAddress}
            className="focus-ring mt-2.5 inline-flex w-full items-center justify-center rounded-full bg-leaf px-4 py-2.5 text-sm font-semibold text-white"
          >
            Manage address
          </button>
        </div>
      ) : null}
    </div>
  );
}

function ProfileInput({
  label,
  value,
  onChange,
  wide = false
}: {
  label: string;
  value: string;
  onChange: (value: string) => void;
  wide?: boolean;
}) {
  return (
    <label className={wide ? "text-sm font-semibold sm:col-span-2" : "text-sm font-semibold"}>
      {label}
      <input
        value={value}
        onChange={(event) => onChange(event.target.value)}
        className="focus-ring mt-1.5 w-full rounded-xl border border-ink/15 bg-limewash px-3 py-2.5 font-normal"
      />
    </label>
  );
}

function ProductHighlightGroup({
  title,
  icon: Icon,
  products: groupProducts,
  onSelect
}: {
  title: string;
  icon: typeof Flame;
  products: Product[];
  onSelect: (product: Product) => void;
}) {
  return (
    <div className="border-b border-ink/10 py-2 last:border-b-0 last:pb-0 first:pt-0">
      <h2 className="flex items-center gap-2 text-sm font-semibold">
        <Icon aria-hidden className="text-leaf" size={19} />
        {title}
      </h2>
      <div className="mt-2 space-y-1.5">
        {groupProducts.map((product) => {
          const difference = priceDifference(product);
          return (
            <button
              key={product.id}
              type="button"
              onClick={() => onSelect(product)}
              className="focus-ring w-full rounded-xl border border-ink/10 bg-limewash p-2 text-left hover:border-leaf/40 hover:bg-mint"
            >
              <div className="flex items-start justify-between gap-2">
                <span className="text-sm font-semibold">{product.name}</span>
                <span className={difference > 0 ? "text-xs font-semibold text-clay" : "text-xs font-semibold text-leaf"}>
                  {difference > 0 ? "+" : ""}{formatCurrency(difference)}
                </span>
              </div>
              <p className="mt-1 text-xs text-ink/58">
                {formatCurrency(product.price)} / {product.unit}
              </p>
            </button>
          );
        })}
      </div>
    </div>
  );
}

function getCartLineKey(line: CartLine) {
  return line.kind === "custom" ? line.id : line.productId;
}

function getQuantityStep(unit: string) {
  return unit === "kg" ? 0.25 : 1;
}

function getMinimumQuantity(unit: string) {
  return unit === "kg" ? 0.25 : 1;
}

function normalizeQuantity(quantity: number, unit: string) {
  const minimum = getMinimumQuantity(unit);
  if (!Number.isFinite(quantity)) return minimum;
  if (unit === "kg") return Math.max(Math.round(quantity * 1000) / 1000, minimum);
  return Math.max(Math.round(quantity), minimum);
}

function formatQuantityNumber(quantity: number, unit: string) {
  const normalized = normalizeQuantity(quantity, unit);
  if (unit !== "kg") return String(normalized);
  return Number.isInteger(normalized) ? String(normalized) : normalized.toFixed(3);
}

function formatQuantity(quantity: number, unit: string) {
  return `${formatQuantityNumber(quantity, unit)} ${unit}`;
}

function matchesSearch(product: Product, searchTerm: string) {
  const query = searchTerm.trim().toLocaleLowerCase();
  if (!query) return true;
  const aliases = [...(productAliases[product.id] ?? []), ...(manglishProductAliases[product.id] ?? [])];
  return [product.id, product.name, product.retailRange ?? "", product.bestValueShop ?? "", product.recommendation ?? "", product.sourceNote ?? "", ...aliases]
    .join(" ")
    .toLocaleLowerCase()
    .includes(query);
}

function hasKnownPrice(product: Product) {
  return product.price > 0;
}

function matchesPriceRange(product: Product, priceRange: ProductPriceRange) {
  if (priceRange !== "all" && !hasKnownPrice(product)) return false;
  if (priceRange === "under_50") return product.price < 50;
  if (priceRange === "50_100") return product.price >= 50 && product.price <= 100;
  if (priceRange === "100_250") return product.price > 100 && product.price <= 250;
  if (priceRange === "above_250") return product.price > 250;
  return true;
}

function priceDifference(product: Product) {
  return product.price - (product.previousWeekPrice ?? product.price);
}

function sortProducts(first: Product, second: Product, sortMode: ProductSortMode) {
  if (sortMode === "price_low") return sortablePrice(first, "low") - sortablePrice(second, "low") || first.name.localeCompare(second.name);
  if (sortMode === "price_high") return sortablePrice(second, "high") - sortablePrice(first, "high") || first.name.localeCompare(second.name);
  return first.name.localeCompare(second.name);
}

function sortablePrice(product: Product, direction: "low" | "high") {
  if (hasKnownPrice(product)) return product.price;
  return direction === "low" ? Number.MAX_SAFE_INTEGER : -1;
}

function popularityRank(product: Product) {
  if (product.popularity === "top_selling") return 2;
  if (product.popularity === "popular") return 1;
  return 0;
}
