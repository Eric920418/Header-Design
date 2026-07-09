
# SAKURA Kitchen - Header Design

SAKURA 廚房品牌網站，基於 Figma 設計稿實作。

原始設計稿：https://www.figma.com/design/TTt0ua7aR3ayd8zsIkTBPa/Header-Design

## 技術棧

- React 18
- Vite
- Tailwind CSS v4（使用 `@tailwindcss/vite` 插件）
- Lucide React 圖標庫

## 啟動方式

```bash
pnpm install
pnpm dev
```

開發伺服器預設在 `http://localhost:3000`。

## 構建

```bash
pnpm build
```

輸出目錄為 `build/`。

## 全站等比例縮放（Scale-to-Fit）— 最重要的全域機制

**需求**：網站會被放到 100 寸大螢幕展示、也可能在很小的螢幕看，要求**整體一定等比例縮放、絕對不跑版/爆版**。

**做法**：整站以 **1512px 當「設計畫布」**，用一層 `transform: scale(視窗寬 / 1512)` 把整張畫布等比縮放到視窗寬。大螢幕放大填滿、小螢幕整體縮小塞進畫面——**全程同一種版面，只放大/縮小，永不重排、永不橫向溢出**。

- **`src/components/ScaleToFit.tsx`**（外殼）：固定 1512px 寬畫布 + `transform: scale`，`transform-origin: top left`；用 `ResizeObserver` 把外層高度同步為「畫布自然高 × scale」（transform 不改 layout box，否則底部留白）。`useLayoutEffect` 在首次 paint 前套好、無閃爍。`src/App.tsx` 用它包住整個 App。
- **共用 scale hook `src/components/useCanvasScale.ts`**：單一來源 `DESIGN_W = 1512` + 「`resize` 時 `scale(innerWidth/1512)`」邏輯。`ScaleToFit` 共用 `DESIGN_W`（自有 effect 因還要同步高度）；**畫布外的 fixed 層（StickyHeader / FloatingButtons）用 `useCanvasScale(origin)` 各自補回等比縮放**——因為畫布的 `transform` 會讓內部 `fixed` 相對畫布、無法真正釘視窗，故這兩者必須抽到畫布外、再自行 scale 保持與全站同比例。
- **設計基準＝1512（＝與模板 1:1 對位點）**：全站在 `DESIGN_W`(=1512) 上量測製作。**任一元素螢幕實際大小 = CSS 值 × (innerWidth/1512)**，只有 `innerWidth=1512` 時 scale=1、與模板 demo「同 px 同尺寸」；窄於 1512 整站等比縮小、寬於則放大。⚠ **DevTools 的 `font-size` 欄位不含祖先 `transform:scale`**——會顯示 CSS 原始值（如 100px），但眼睛看到的是 ×scale 後的大小；想看真實渲染尺寸要看元素 hover 的 `寬×高` 標籤或 `getBoundingClientRect()`。**與模板 demo 目視比對時，兩邊瀏覽器縮放（Cmd/Ctrl 0 歸零）＋視窗寬需一致，否則會誤判「大小不同」**（實測字型/字級本身相同，差異多來自 zoom 或視窗寬）。
- **`FloatingButtons`（右側浮動鈕）也等比縮放**：三層結構＝定位層（`fixed inset-y-0 right-0` 滿高右側條 + `items-end pb-[36px]` 底部對齊 + `pointer-events-none`）→ scaler（`useCanvasScale('right bottom')`）→ 按鈕欄。`right bottom` origin 使縮放時右下角恆貼視窗右下（對齊官網 `.l-quick-links` 的 `right-0 bottom-9`）；`pointer-events-auto` 收回內層可點。詳見下「右側側邊欄」段。
- **凍結斷點到桌面版**（`globals.css` 的 `@theme`）：把 Tailwind `--breakpoint-sm~2xl` 設成極小遞增值（`1px`~`5px`），使 `sm:/md:/lg:` 變體**全部無條件恆生效**（編譯出的 utility 不帶 media query）→ 全站在**任何 viewport 都渲染桌面版外觀**（不受真實 viewport 影響）。這是關鍵：否則手機上 media query 會渲染手機版再被縮放，變「縮小的手機版」。
- **配套**：`HeroSection` 由 `height:100dvh` 改**固定 px**（`dvh`/`vh` 不會被 scale 等比帶動）；`App` 根移除 `min-h-screen`/`pb-14`；`body { overflow-x: hidden }`；still-used 的 `--store-map-h`/`--hero-brand-h` 釘死桌面值。**已清除殘留的死 `dvh` 變數** `--hero-h`/`--hero-ai-font`/`--hero-svg-h`/`--hero-play-size`（`globals.css` 三斷點區塊，rendered code 未引用，是唯一殘留的 viewport 單位）。
- **副作用**：凍結成桌面後**已無手機版概念**——`FloatingButtons` 的手機底部固定列（`flex lg:hidden`）因 `lg:` 恆生效而 `lg:hidden` **永不顯示**；桌面右側浮欄（`hidden lg:flex`）則**恆顯示並隨全站等比縮放**。所有內容（含文字）在小螢幕一起等比變小（可雙指放大）。
- **驗證**：拖動視窗寬 / DevTools 模擬 375~3840px，版面完全不重排、無水平捲軸；模擬 605px（scale 0.4）實測仍渲染完整桌面版、`scrollWidth === innerWidth`。

## 捲動動態（Lenis 阻尼 + 出場動畫 + GSAP 視差）— 複刻 Antra 模板

模組集中在 **`src/motion/`**，三種效果皆對映 Antra 模板實測值，且都受 `prefers-reduced-motion` 保護。套件（pnpm）：`lenis`、`gsap`。

- **平滑捲動阻尼（Lenis）** — `src/motion/{useSmoothScroll.ts, ScrollMotionProvider.tsx}`。對映模板 config：`duration: 1.5` + expo ease-out `t=>Math.min(1,1.001-2**(-10*t))`。用 **原生捲動模式**（不設 wrapper/content transform），故不碰 `ScaleToFit` 的 canvas `scale`、也不破壞 `FloatingButtons` 的 `fixed`。只在 **桌面（>992px）且非 reduced-motion** 啟用，跨 992px / 偏好變更自動啟停。GSAP 與 Lenis 共用單一 rAF（`gsap.ticker`），內容高度變動時自建 `ResizeObserver` → `lenis.resize()` + `ScrollTrigger.refresh()`。`ScrollMotionProvider` 掛在 `ScaleToFit` **外層**。
- **出場動畫（IntersectionObserver + CSS，完全比照 Antra 模板）** — `src/motion/Reveal.tsx` + `globals.css` 的 `.ev`。逐 section 用模板實際的 Elementor 進場動畫（keyframe 逐字取自 demo `styleSheets`；`.animated` = `1.25s` / fill `both`；hidden state = `visibility:hidden` 同 `.elementor-invisible`）。機制：`.ev { visibility:hidden }`、IntersectionObserver 進場加 `.is-visible`、`animation-name` 由 `data-ev` 決定（進場一次不重播、reduced-motion 直接顯示）。
  - **API**：`<Reveal anim="slideInLeft" delayMs={300} speed="slow">` 或 `useReveal(ref)` 掛既有元素（配 `className="ev"` + `data-ev` + inline `animationDelay`）。`anim` 支援 `slideInUp/Down/Left/Right`、`fadeIn/Up/Down`（Elementor 核心 **100% 位移**）+ `opalMoveUp/…/opalScaleUp`（主題 100px 版，備用）。`speed` 對應 Elementor `animation_duration` 控制項：`normal`=1.25s（預設）、`slow`=2s、`fast`=0.75s（class `.ev-slow`/`.ev-fast`）。
  - **逐 section 對映（實測 demo）**：**Hero（home-6 逐項對位）＝容器 section `fadeInDown`(normal 1.25s) 整區落下＋標題/副標 `slideInLeft`(slow 2s) 從左滑入＋Start 圓鈕 `fadeIn`(slow, 900) ＋浮水印 `fadeInUp`(slow, 900)**——容器落下與內層左滑**巢狀複合**成斜向動態（非單一由下往上），延遲 900 層錯落；Project section `slideInUp`；Pricing 標題 `slideInUp` + 三卡 `slideInUp`(0/300/500)；Gallery 標題 `slideInUp`(200) + 右卡欄 `slideInUp`(400)；WhatWeDo 左 `slideInLeft` + 右影片 `slideInRight`(300)；StoreLocation `slideInUp`；**Footer 無進場**（模板亦無）。
  - **鐵則**：`.ev` 用 `transform`（fill both 收在 none），**勿套在已佔 transform 的元素**（Embla 軌道、`.project-parallax-img`/`.gallery-bg`/`.wwd-blueprint` 視差、`animate-gallery-card`、hover-scale/rotate）→ 一律包外層 wrapper。`slideInLeft/Right` 的 100% 位移靠 section `overflow-hidden` 裁切避免水平捲軸。
- **捲動視差（GSAP ScrollTrigger，純 scrub 不 pin）** — `src/motion/useParallax.ts`。**不用 `pin`**：pin 的 `position:fixed`+pin-spacer 在 `transform:scale()` 祖先下量測錯誤，改用 `yPercent` scrub（`scrub:0.5`）位移達到同觀感。目標：GallerySection 全出血背景 `.gallery-bg`（scale 1.12）、WhatWeDo 裝飾 `.wwd-blueprint`。只寫內層 transform，永不碰 `canvasRef`。**⚠ ProjectSection 的照片視差已移除**：視差給每張 `.project-parallax-img` 獨立 transform→GPU 獨立圖層，Embla loop 輪播移動時相鄰圖層在環繞接縫對不齊而露縫（症狀：僅環繞接縫後的照片、移動中露縫、到吸附點才合併）。移除後照片與軌道同層、無縫（`ProjectSection.tsx` 不再呼叫 `useParallax`；`.project-parallax-img` class 保留但無 transform）。

## 色彩規範（SAKURA KITCHEN CIS）— 全站已對齊

全站品牌色**嚴格對齊官方 CIS**（先前散落的 7 種不一致暖金、`#1c1c1d`/`#272625` 等已收斂）。**單一來源**：`src/theme/cis.ts`（供 inline `style={{}}`）+ `globals.css` 的 CIS tokens（`--gold`… 經 `@theme inline` 暴露為 Tailwind `text-gold`/`bg-ink-80`/`text-brand-red`…）。

| 角色 | 名稱 | HEX |
|---|---|---|
| 主-金 | PANTONE 466c / Varnished 871c | `#C9AA79` |
| 金-漸層深 / 淺（衍生） | — | `#B8965F` / `#D8C29A`（Header 金屬漸層、hover） |
| 主-黑 | PANTONE Black C | `#000000`（標題 / 內文） |
| 輔-深灰 | PANTONE Black C 80% | `#3E3A39`（footer、深色面、次要文字） |
| 輔-紅 | PANTONE Red 032c | `#F5333F`（強調 / 錯誤，覆蓋原 shadcn `--destructive`） |
| 主-白 | White | `#FFFFFF` |

- **對齊範圍**：所有金 → `#C9AA79`；深色 → `#000` / `#3E3A39`；紅 → `#F5333F`。深色圖面 scrim 統一為 `rgba(0,0,0,α)`（Black C）。**Header 列漸層**：曾於稽核改為 CIS 衍生 `#B8965F → #D8C29A`，後**依使用者指定改回模板原值 `linear-gradient(90deg, #b79258 20%, #d2b587)`**（`Header.tsx` `HEADER_GRADIENT`）——此為刻意的非-CIS 例外。
- **消除所有 Tailwind 冷灰**：Tailwind 具名灰（`gray-*`，色相偏藍）computed 出來是 **oklch**，rgb-only 掃描會漏掉——故做了 **oklch-aware 全屬性掃描**（color/bg/border/fill/outline/gradient）。全站冷灰已清零：文字/圖示 `text-gray-400~700` → CIS 深灰 `#3E3A39`；深色底 `bg-gray-900` → `#3E3A39`；淺邊框/分隔線 `border/divide-gray-100~300` → **暖線 `#E3DED7`**；淺底 `bg-gray-50/100` → **暖底 `#F4F0EA`**；`placeholder` / 停用 `select` 的灰 → **暖灰 `#8c877f`**。連全域預設也校正：`--foreground` `oklch(0.145)` → `#000`、`--ring`（`outline-ring` 焦點框）`oklch(0.708)` → `#3E3A39`、`--destructive` → `#F5333F`。
- **`<select>` placeholder（已修）**：門市查詢的區域/城市 `<select>` 原本用 `disabled` 屬性 → 瀏覽器**強制灰化**「選擇城市」為 `#808080`（CSS `color` 蓋不動）。已改為**不用 `disabled`、改以 CSS 控制未選態**：placeholder 用暖灰 `#8c877f`，城市未選區域時加暖底 `#F4F0EA` + `pointer-events-none`(保留「先選區域」的停用觀感)。`#808080` 已清零 → **全站 0 個非 CIS/非暖中性色**。
- **支援性中性色**（功能性保留）：section 底 `#f6f6f6`、暖線 `#E3DED7`、暖底 `#F4F0EA`、`white/xx`·`black/xx` 透明階（白/黑即 CIS、其餘為暖/中性淡階）。跑馬燈以 `color: transparent` + 漸層 `background-clip:text` 呈現（刻意技法）。
- **地圖（`GoogleStoreMap` 的 `LIGHT_STYLE`）**：各階中性灰改為**偏暖灰**（R>G>B，如陸地 `#f4f0ea`、道路 `#fdfbf8`、水域 `#e5dfd6`）對齊 CIS 調性；標記水滴改 `#3E3A39`、錯誤字改 `#F5333F`。
- **未動**：未渲染的 shadcn `ui/` 色票與 oklch chart tokens。
- 先前文中「色系沿用原站／不改」之敘述，已由本次 CIS 對齊取代。

## 間距與文字排版 — 依 Antra 模板實測、零誤差

所有 section 的間距/尺寸/**字級**已對齊 **Antra demo 實測值**（@1512 視窗 computed style，localhost 逐項驗收 0px 誤差）。此規範**取代**先前「section py 上限 20」的暫行規則。

### 字型系統（已引入 Antra 模板字體 — Cal Sans / Golos Text）

全站英文文字改用模板實際字體（比照主題 `inc/class-main.php` 從 **Google Fonts** 載入，`index.html` 加 `<link>`）：
- **標題／eyebrow／顯示字＝`Cal Sans`（僅 weight 400）**、`capitalize`。Cal Sans 是裝飾顯示體，400 已顯粗、觀感不單薄；**只有 400 一個字重，任何標題都不可留 `font-bold`/`font-semibold`（會 faux-bold 變醜）**——故各標題已移除 bold class。
- **內文＝`Golos Text`（400–900）**。
- 兩者皆拉丁字型，字型堆疊在 `globals.css` `@theme` 定義並**接 CJK fallback**（`--font-sans`＝Golos Text＋CJK；`--font-display`＝Cal Sans＋CJK）：英文逐字走 Cal Sans/Golos，中文 fallback 到中文字型，並存不衝突。`--font-sans` 設定後 body 預設即 Golos Text；`--font-display` 產生 `font-display` utility。
- **套用方式**：標題 `<h1..h6>` 與英文 eyebrow/`<span>` 加 `font-display` class（`globals.css` 另有 `h1..h6` 基準規則設 Cal Sans/400/capitalize，但 utility 層優先，故實務靠各元件的 `font-display` class 生效）。內文英文無需逐一改（body 預設已 Golos Text）。
- **標題字級（對照 demo `html`=20px 實測，逐一驗證）**：Hero h1 **100**、Pricing/WhatWeDo/Store h2 **60**、Gallery h2 **75**（原 110，不符模板任何標題、已改對齊 home-three gallery 75/lh80）、Project 卡 h3 36。Hero 大標移除原 `-1px` letter-spacing（模板標題 letter-spacing 0）。

### 英文文案（＝Antra 模板原始 demo 逐字，只英文、中文不動）

各 section 的英文改用**本地模板 demo 匯出檔逐字文案**（來源 `antra-full 2/antra/dummy-data/`：`homepage/home-6.xml`＝Hero/WhatWeDo、`home-3.xml`＝Gallery、`content.xml`＝Pricing/Contact）。金色重點字沿用 CIS 金 `#C9AA79`（只跟隨模板「哪些字是金的」）；模板文案裡的品牌名 **Antra→SAKURA**。

| Section | 英文文案（模板逐字；⟨…⟩＝金字） |
|---|---|
| Hero | eyebrow `Trusted Design Partner`；h1 `Find Your ⟨Inspired Interior⟩ Design`；副標 `Transform your vision into reality with our innovative designs, creating modern spaces that blend functionality, aesthetics, and sustainability.`；圓鈕 `Start Project` |
| Services | eyebrow `Our Services`；h2 `Explore Our ⟨Comprehensive Interior Design⟩ Services`；6 服務卡 title/excerpt＝模板 home-6 dummy-data 佔位（待 SAKURA 本地化） |
| Gallery | h2 `Interior Design`（eyebrow 為中文「門市案例」不變） |
| WhatWeDo | eyebrow `What we do`；h2 `SAKURA has ⟨created exceptional⟩ architectural designs.`（Antra→SAKURA）；清單 `Residence And Condo / Modern Kitchen Renovate / Interior House Decoration`、段落 `We specialize in transforming visions…precision.`（本就與模板一致，未改） |
| Store | eyebrow `get in touch`（未改）；h2 `Have a Project in ⟨Mind? Let’s Make⟩ It Happen`（模板 Contact 頁；彎引號 ’） |

**刻意保留、未動的英文**：ProjectSection 10 個廚房系列卡名（`Basic+`/`AI Kitchen`/`Clever Kitchen`…）與 Hero 6 個風格名（`Modern`/`Scandinavian`…）＝對應旁邊中文的 SAKURA 產品/風格名；品牌專有名詞 `SAKURA`（浮水印）/`SVAGO`/`TEKA`/`Copyright © Taiwan Sakura Corporation…`/`YouTube`；`MarqueeBand` 裝飾字 `Kitchen Product`（模板無對應 marquee 文案）。

**文字排版 token**（size/line-height/letter-spacing/text-transform/字重/字型皆照模板）：

| 角色 | 值 |
|---|---|
| Section h2 | `text-[60px] leading-[64px]`（Gallery 為 `text-[75px] leading-[80px]`，對齊 Home Three gallery 標題實測 75/80） |
| 專案卡標題 / 中文副標 / 左上膠囊 | `text-[36px] leading-[44px]` / `text-[20px] leading-[30px]` / `text-[16px]` |
| 品牌卡標題 / 描述（=模板 Pricing 卡） | `text-[45px] leading-[50px]` / `text-[20px] leading-[30px]` |
| eyebrow | `text-[15px] tracking-[1px] uppercase` |
| 內文段落 | `text-[16px] leading-[24px]` |
| 打勾清單 | `text-[18px] leading-[24px]` |
| CTA 按鈕字 | `text-[19px]`（無 letter-spacing；模板 ls normal，故移除 `tracking-wide`） |
| 跑馬燈 | `text-[220px]` |

無模板對應的自訂文字（產品卡標籤、門市卡內文、Header/Footer/Hero）不動。

| 項目 | 值 |
|---|---|
| 內容容器（版心） | `max-w-[1410px] mx-auto`（畫布 1512、兩側各 51px；Header mega-menu 面板與 Footer 同版心） |
| Section 上下留白 | `py-[120px]`（Gallery 特例：`pt-[133px] pb-[138px]`，實測值） |
| Section 大標 h2 | `text-[60px] leading-[64px]`（Gallery 特例：`text-[110px] leading-[100px]`，對位 Home Three） |
| 標題區 → 內容距 | `mb-[60px]` |
| eyebrow | `text-[15px]`、`mb-5`(20px) |
| 卡片 grid 間距 | `gap-[30px]`；三欄卡寬自然 = (1410−60)/3 = **450** |
| 兩欄 section | 欄距 `gap-[90px]`、文欄 `w-[600px]`、媒體欄 flex-1(≈720) |
| CTA 膠囊按鈕 | 總高 **65**：`pl-[30px] pr-[9px] py-[8px]`(8+47+8+邊框2=65)、字 `text-[19px]`、內圓 `w-[47px] h-[47px]` |
| 專案卡（project-style-4） | 378×880、hover 567、標題 `text-[36px]` |
| Gallery 案例卡 | `basis-[450px]` × `aspect-[45/61]` = 450×610、間距 30 |
| 卡片圓角 | `rounded-3xl`(24px) |

- 因斷點已凍結（Scale-to-Fit），本次校正把被改到的 className **寫死為單一桌面值**（消掉 `md:/lg:` 階梯）；未實測的細節（專案卡膠囊、門市卡內距等）**維持原樣、不捏造**。
- Header／Footer／Hero 為自訂設計（SAKURA mockup、使用者提供之設計），不在模板還原範圍；僅版心同步 1410。

## 響應式設計（已凍結為單一桌面版）

> ⚠️ 導入上述 Scale-to-Fit 後，下表的三斷點**已被凍結**：斷點值改為極小值使 `lg:` 恆勝出，全站一律套**桌面版**再等比縮放。以下保留為歷史/元件內 `md:/lg:` 前綴的原始語意參考（前綴未移除，凍結後 `lg:` 自然勝出）。

原採 **三斷點** 策略，透過 CSS Custom Properties + 媒體查詢實現：

| 層級 | 範圍 | 策略 |
|------|------|------|
| 手機 | <768px | 獨立的較小固定值（CSS 變數默認值） |
| 平板 | 768px - 1023px | `min()` + `dvh` 流動縮放 |
| 桌面 | ≥1024px | 原始像素值，視覺零改動 |

### 技術方案

- **inline style 值**：使用 `globals.css` 中定義的 CSS 變數（如 `var(--hero-h)`），值隨斷點自動切換
- **className 值**：直接使用 Tailwind 響應式前綴（如 `h-[280px] md:h-[380px] lg:h-[450px]`）

### 主要響應式適配

| 組件 | 手機版 | 平板版 | 桌面版 |
|------|--------|--------|--------|
| Header（巨型選單） | logo + 搜尋 + 漢堡；漢堡開 accordion 抽屜 | 同左 | 中央 logo + 左右導覽 + hover 下拉 + 搜尋展開 |
| HeroSection（主視覺） | 滿版 Hero + 品牌帶，標題縮小 | 滿版 Hero + 品牌帶 | 滿版 Hero + 品牌帶 |
| FloatingButtons | 底部固定導航列 | 底部固定導航列 | 右側 `fixed` 浮動欄（疊在內容上，不佔軌道） |
| ProjectSection（10 種廚房風格輪播） | embla 拖曳、卡片較窄 | 拖曳捲動 | 拖曳、卡片 378×880、hover 伸縮露出橫式廚房圖 |
| StoreLocationSection（門市查詢） | 上下堆疊（地圖+搜尋在上、列表在下） | 同左 | 左右並排（左 45% 地圖+搜尋、右列表） |
| Footer（黑底頁尾） | logo + 版權 + 連結上下堆疊（`pb-28` 避開手機固定列） | 同左 | 一排：左文字連結、右 icon 連結 |

## 主視覺（Hero）— Antra Home Six 版型

`HeroSection.tsx` 的 Hero 採用 Antra 模板 Home Six 的版型（金色已對齊 **CIS 466c `#C9AA79`**；字型已引入模板 **Cal Sans/Golos Text**，見上「字型系統」）。

- **尺寸/位置零誤差對齊 Home Six（@1512 實測，逐項 0px）**：section 高 **958px**；內容左緣 **30**、eyebrow 上緣 **244**；eyebrow **15px / letter-spacing 1px / uppercase / 白 + 金點**；大標 **100 / 行高 110 / capitalize**（@T300，白+金；Cal Sans/400，已移除原 `-1px` letter-spacing 對齊模板）；副標 **18 / 24 / 字重 500 / 寬 522**（@T550，Golos Text）；左下圓鈕 **120×120 / left 30 / 底 82**（`rgba(92,92,92,.46)` + `1px rgba(255,255,255,.07)`，內含白字）；浮水印 **320px @ left 426 / top 725**（Cal Sans/400）。字型＝模板 **Cal Sans/Golos Text**（見上「字型系統」）、金 → CIS，其餘尺寸/位置照抄。
- **與模板的唯一差**：模板 header 透明疊在 hero 上（hero 由畫面頂 0 起）；本站為**實心金色 sticky header（72px）**，故 hero 由 72px 起——**hero 內部排版與模板 0 誤差**，整體在頁面上比模板低 72px。
- **滿寬**：`FloatingButtons` 桌面版改為 `fixed` 浮動欄、不再佔用 75px 軌道，主內容因此滿寬。
- **`FloatingButtons` 右側側邊欄（對齊官網 `sakura-kitchenlife.com.tw` 的 `.l-quick-links`，實測）**：**3 顆純圖示按鈕**（無文字；VR賞屋已依使用者移除）＝金頂鈕「加盟」(quick-link-4) + 灰底群組「到府丈量／客服」(quick-link-2/3)，群組項間白色 `h-px bg-white/50` 分隔線。尺寸照官網：**圖 `w-[58px] h-[58px]`**、`p-2`(8px)、金頂鈕 `mb-[20px]`、鈕 74×74。**顏色**：金頂鈕＝**CIS 金 `#C9AA79`**（依使用者指定改回，非官網 `#B79258`）、灰群組 `#737373`（官網值）、白分隔線 `white/50`。**圖示直接引用官網資產** `https://www.sakura-kitchenlife.com.tw/images/quick-link-{1..4}.svg`（已實測可載入；要離線化可下載到 `public/floating-icons/`）。連結指向官網對應頁（客服 `icare.sakura.com.tw` 開新分頁）。位置底部貼右（`items-end pb-[36px]`、scaler origin `right bottom`）。手機底列 `flex lg:hidden` 因凍結斷點恆隱藏（保留為一致性）。
- **構成**：全出血深色大圖 + 左對齊金點 eyebrow + 雙色大標題（白/金交錯）+ 副標 + 左下圓形按鈕（`Start Project`）+ 底部金色浮水印（`SAKURA`，對位模板 T725）——**依模板 Home Six「Interior」浮水印實測：金漸層 `linear-gradient(#C9AA79 14.9%, transparent 80.95%)`（金頂→透明底）+ `background-clip:text` + `opacity 0.64`**（比舊版 `gold @0.14` 深約 4.5×，才「跟模板一樣深」）。**英文文案＝Antra 模板 Home Six 逐字**（見「英文文案」段）：eyebrow `Trusted Design Partner`、大標 `Find Your ⟨Inspired Interior⟩ Design`（金字 Inspired Interior）、副標 `Transform your vision into reality…sustainability.`。
- **進場動畫（比照模板 home-6 逐項）**：容器 section `fadeInDown`(1.25s) 整區落下＋標題/副標 `slideInLeft`(slow 2s) 從左滑入＋Start 圓鈕 `fadeIn`(slow, 900)＋浮水印 `fadeInUp`(slow, 900)——容器落下與內層左滑巢狀複合成斜向動態（非單一由下往上）。詳見上「出場動畫」段。
- **英雄輪播（SAKURA 加值，⚠ 模板 home-6 的 hero 本身無輪播——經 dummy-data XML／線上 demo DOM／底圖三重查證，全頁 13 個 Swiper 全在下方其他區塊）**：`SLIDES`（**3 張**，底圖 Unsplash 外連＋各自 eyebrow/大標/副標，皆 SAKURA **佔位**待替換）。**底圖往左跑**＝`@keyframes hero-kenburns`（scale 1.06→1.16 + `translateX 0→-4%`，時長 `SLIDE_MS`=6s、ease-out、fill both；active 圖交叉淡入 `transition-opacity 1s`）；**內文逐張切換**＝各張疊放、active 者 `relative`+`opacity-100 translate-x-0`、其餘 `absolute`+`opacity-0 -translate-x-6`（`transition-all 700`）。**自動輪播** `setInterval` 每 6s 前進、hover 英雄區 `pausedRef` 暫停；右下**指示點**（active 金色長條 30px、可點擊跳張）。**Ken Burns 重啟關鍵**：切張時對 active `<img>` 做 `animation='none'`→讀 `offsetWidth` 強制回流→再設回，否則輪回同一張時 inline animation 字串不變、React 不重播（會停在放大終態）。`reduced-motion`：不輪播、不 Ken Burns，靜態顯示第 0 張。（⚠ 自動化隱藏分頁 transition 被凍結，交叉淡入/往左跑/滑入須在可見瀏覽器驗證。）
- **左側「品牌系列」伸縮抽屜（桌面）**：左緣一個玻璃把手（`ChevronRight` + 直排「品牌系列」，用 `.writing-vertical`），點擊 `open` state 切換。抽屜面板 `w-0 ↔ w-[190px]` 伸縮淡入，列出**品牌系列 8 個中文名**（`SERIES`：巧域／潮派／童樂／君璽／臻美／大廚／鄉村／閣樂廚房；Basic+ / AI kitchen 無中文故略），hover 顯示金色左邊條 + 金字。**「不蓋過主視覺」的做法**：展開時把**內容層（標題/副標，`translateX(200px)`）、左下圓鈕（同 200px）、底部浮水印（`translateX(250px)`）**一起右推、讓出左側空間（皆 `transition 500ms`）。收合時只剩把手在左緣、不佔畫面。**手機不顯示**此抽屜（`hidden lg:flex`），故不觸發位移。
- **品牌帶（採 Antra Home Four 版型）**：Hero 下方淺色背景（`#f6f6f6`）+ **marquee 輪播**（同模板 `elementor-brand` 動態）。**6 項**（`STYLE_TAGS`），每項 = **左：對應的模板品牌「icon」**（只留圖示、**去掉 SVG 原生的品牌英文字**；`img h-[44px]`、`opacity-70` hover→100）+ **右：中文（粗體 15px）／英文（13px）兩行**（`flex items-center gap-4`，icon 左字右）。**間距／分隔線比照模板源碼**：實測模板 Home Four brand 為 6 欄、item 間距 ~120px、logo 高 58；故每項 `px-14`（左右各 56px → 相鄰內容間距 112px），並依源碼 `elementor.css` `.slick-slide:before`（1px `#ebebeb`）在每項加 `border-r`，色改用 CIS 暖線 `#E3DED7`（避冷灰），分隔線落在兩項間距正中。**每項用不同 icon**（Home Four 6 個 `elementor-brand`，實測依 viewBox 寬度配對、對照使用者 Image #40）：現代風→`5.svg`(ARCHITECT)、輕奢風→`6.svg`(BUILDING圓)、北歐風→`4.svg`(BUILDING2)、工業風→`3.svg`(REAL ESTATE)、美式風→`1.svg`(TREND)、鄉村風→`2.svg`(INTERIOR)。`public/brand-logos/1–6.svg` = 6 個 icon-only SVG，統一 `#3E3A39`：**用瀏覽器 `getBBox` 把每個 wordmark 的 icon 路徑與文字路徑依 x 座標間隙分群、只保留 icon 群、重算 viewBox**（原 wordmark 版已被覆寫）。`icon.svg` 為更早的單一建築圖示（已停用）。**輪播**：`[...STYLE_TAGS, ...STYLE_TAGS]` 重複兩組 + `.animate-marquee`（`marquee` keyframe，40s，`-50%` 無縫循環）+ `group-hover:[animation-play-state:paused]`。高度沿用 `--hero-brand-h`。
- **Gallery 已移除**：原本 Hero 下方的圖庫展示（大圖 + 縮圖）已拿掉，改由 `ProjectSection`（專案輪播）取代，見下方 Section 2。

## Section 2（專案輪播）— Antra Home Six 精準複刻

`ProjectSection.tsx`：精準複刻 Home Six 的 `antra-project`「project-style-4」（字型已用模板 Cal Sans，見「字型系統」；其餘結構/尺寸/行為照模板）。

- **取代**了原本 `HeroSection` 內的 Gallery（大圖 + 縮圖展示）；放在 `App.tsx` 的 Hero 之後。
- **無標題區**：模板此 widget 只有卡片（無 heading）。**箭頭為額外加上**（模板此 instance 沒開，但使用者要求）。
- **卡片**：378×880 直式、底部黑色漸層 scrim；**左上膠囊放中文名（`font-bold` 加粗）、底部放英文大標**（`STYLES` 依對照表：英文 `X Kitchen`、中文膠囊 `AI廚房/巧域廚房…`、每筆 `desc`；Basic+ 無中文膠囊）。
- **hover 效果**：滑到卡片時卡片變寬（378→567）+ **英文標題轉金 `#C9AA79`** + **底部由下淡入浮現該風格描述**（`s.desc`，如「極致收納 在廚房」；`max-h-0 opacity-0 → group-hover:max-h-20 opacity-100`，`transition-all 500ms`）。
- **hover 伸縮**：卡片寬度 `×1.5`（`378→567px`，固定高度只變寬），橫式廚房圖靜態裁成直切片、hover 變寬露出更多；EN 標題 hover 轉金（`#C9AA79`）。
- **捲動 + 自動輪播（一格一格步進 / 吸附模式）**：`embla-carousel-react`（`loop:true` + `align:'start'`，**刻意不用 `dragFree`**）。自動輪播：`setInterval` 每 3.5s `emblaApi.scrollNext()`，走一格、停一下（使用者要的步進感）。**露縫關鍵＝曾用的 `dragFree`**：它讓 `scrollNext` 變慣性滑動、在 `loop` 環繞重定位時對不齊而露縫；改吸附模式後每次精準走一格、於乾淨卡邊界重定位，不露縫。滑鼠移入暫停（`mouseenter`→`pausedRef`），移出 **延遲 560ms 恢復**（`resumeTimer`；讓 hover 卡片 500ms 展開/收回動畫期間輪播停住，避免寬度變動期間移動使迴圈總長過期露縫）。仍可手動拖曳（吸附到格）；**拖曳時（`pointerDown`）以 `dragging` state 暫停 hover 變寬**，否則卡片一碰就展開會把拖曳打斷。（試過 `embla-carousel-auto-scroll` 連續捲動版，使用者不要、已移除。）
- **移動中「卡間縫隙」殘留防治（次像素）**：實測相鄰卡**排版間隙全 0.00**，故任何殘縫屬**分數像素 transform 合成的髮絲縫**。兩層保險：①`<article>` `w-[calc(100%+2px)] -ml-px`（左右各多蓋 1px、量得重疊 2px，接縫兩側恆被卡片蓋住；卡槽 `.group` 仍 378、不影響 Embla 迴圈總長 10×378=3780）；②輪播 viewport `bg-[#2a2a2a]`（殘縫透出深色而非亮背景，難察）。（自動化隱藏分頁 rAF 不跑、無法重現移動動畫，須在可見瀏覽器驗證。）
- **左右兩側 prev/next 箭頭**（源自主題 `style.css` `.antra-swiper-wrapper .elementor-swiper-button` 的 48×48）：`w-12 h-12`(**48×48**) + lucide 箭頭 `w-6`(**24**)、**半透明磨砂**（`bg-white/10 backdrop-blur-md` + `border-white/30` + 白 icon，透出後方廚房照，非實心白）；`absolute left/right-[30px] top-1/2 -translate-y-1/2 z-20`（垂直置中、貼左右邊 30）；**hover 金底 `#C9AA79` + 金邊 + 白箭頭**；`onClick` 呼叫 `emblaApi.scrollPrev/Next`。
- **內容 = 10 種廚房風格**（真圖）：Basic+ / AI kitchen（僅英文）、Clever 巧域廚房 / Loft Chic 潮派廚房 / Joyful 童樂廚房 / premium 君璽廚房 / Elegant 臻美廚房 / Chef 大廚廚房 / Country 鄉村廚房 / Harmony 閣樂廚房。圖片放在 `public/kitchen-styles/*.jpg`（來源 `Downloads/首頁用圖/品牌系列x10`；Clever 已縮圖）。**渲染時複製兩份 `[...STYLES, ...STYLES]`＝20 張**，給 Embla loop 足夠緩衝、避免捲動動畫中接縫來不及補齊而露縫。

## 服務輪播（Our Services）— Antra home-6 `antra-services-list` style-3 複刻

`ServicesSection.tsx`（原 `PricingSection` 已換掉；改為 **Antra 模板 home-6「Our Services」= `antra-services-list` style-3 服務輪播**，照原始碼 `inc/elementor/widgets/service-list.php` + `assets/css/base/elementor.css` 複刻）。金色對齊 **CIS 466c `#C9AA79`**；底部保留 SAKURA 既有跑馬燈 `MarqueeBand`（模板本區無、屬加值）。

- **標題列**：subtitle 膠囊 `● Our Services`（左 424 欄）+ 大標 `Explore Our ⟨Comprehensive Interior Design⟩ Services`（60/64 capitalize，右 769；金字＝模板 gold word，色改 CIS）+ 2 個裝飾小箭頭 SVG（絕對定位、桌面）。與輪播間距 `mb-[60px]`（模板 flex_gap row 60）。
- **服務卡（style-3，照原始碼）**：**交替版式**＝`nth-child(even)` 用 `flex-direction:column-reverse`（奇數卡圖上字下、偶數卡字上圖下；程式以服務原始索引奇偶 `i%2` 綁定，輪播緩衝不改版式）。圖 `rounded-[24px]`+`overflow-hidden`+`aspect-[1410/1018]`、**hover 圖 `scale(1.1)`**、薄暗罩 `bg-black/[0.11]`；caption `padding 30/20/35`：標題 `28/35` 2 行截斷（左）＋**編號 30px 灰 `#e3e3e8`**（右，`justify-between`）；副文 `16/24` 3 行截斷、`mt-[23px] mr-[70px]`（模板 margin 23 70 0 0）。
- **輪播（模板 data-settings 照抄）**：`embla-carousel-react` `loop` + 3 欄（slide `flex-[0_0_33.333%]` + `container -ml-[30px]`／`slide pl-[30px]` 做 30px gap）、**autoplay 5000ms**（`setInterval scrollNext`，hover `mouseenter` 暫停、`reduced-motion` 不自動播）、可拖曳、無箭頭/點（模板 `navigation:none`）。（⚠ 隱藏分頁 embla transform 凍結，自動捲動/hover 放大須在可見瀏覽器驗證。）
- **內容 = 模板 6 服務佔位（⚠ 待 SAKURA 本地化）**：01–06＝Residential／Renovation／2D-3D Layouts／Outdoor & Landscape／Consultation／Commercial（title+excerpt 取自模板 dummy-data）。圖＝demo 伺服器 `wp-content/uploads/2025/06/service-{1..6}.jpg`（**外連、已實測可載入**，破圖 fallback `/kitchen-styles/elegant.jpg`）；正式上線請把文案換成 SAKURA 服務、圖下載到 `public/` 本地化。
- **跑馬燈**：`MarqueeBand`「kitchen product」無限捲動（定義於 `globals.css`），置於本區底部（`mt-24`）。

## 門市案例（Gallery）— Antra Home Three 版型

`GallerySection.tsx`：對位 Home Three gallery 版型（section 高/位置/膠囊/大標/箭頭照模板實測 + 主題 `heading.php`），**但右側依使用者規則做「背景=主圖 + 2 卡聯動」**（非模板原生的 3 欄 swiper）。字型用模板 Cal Sans、金 `#C9AA79`，內容為 **SAKURA 門市案例**。

- **輪播規則（使用者指定）**：**全出血背景 = 目前主圖(#active)**，右邊固定**只 2 張卡** = 下兩張(#active+1、#active+2)；前進時背景與兩卡一起輪替（背景交叉淡入 + `useParallax('.gallery-bg')` scale 1.12、卡片/段落 `animate-gallery-card` 滑入）。`useState(active)` 驅動、autoplay 4s（滑入暫停）、指標拖曳。
- **section 高度 = `min-h-[956px]`**（實測模板 956）；內容**非置中**，照模板 `e-con-inner` `padding-top` 推到下半部 —— 內容容器 `lg:pt-[388px]`、`items-start`。實測靜止：副標/卡片頂 y388、大標 y445、段落 y682、箭頭 y788（與模板 0–1px）。左標題區 `lg:w-[479px]`（L51）+ 右卡欄 `flex-1`。內部間距：膠囊 `mb-[26px]`、段落 `mt-[37px]`、箭頭 `mt-[40px]`。**右側卡片靠右**：右卡欄 `flex justify-end`（容器 `lg:pr-[51px]`）內包一層縮到卡片寬度的區塊 → 卡片右緣對齊右版心 1461（右邊距 51、與左緣對稱），左側 530–771 留白露出背景主圖。**箭頭在該區塊內靠左**（不加 `justify`）→ 落在**卡片群左緣 771 的正下方**（卡片下方 40px），非靠右。
  - ⚠ **驗證陷阱**：`.reveal` 用個別 `translate` 屬性做進場，隱藏分頁 transition 卡住停在 `translate:0 56px` → 量測會**整體 +56**；驗證垂直位置要先 `translate:none!important` 清掉再量（見 [[mcp-tab-hidden-raf-io]]）。卡片另有 `animate-gallery-card` 的 `translateX(40px)` 進場，量水平也要結算。
- **背景底圖**：= 當前 `CASES[active].image`（crossfade）。遮罩 `linear-gradient(90deg, rgba(0,0,0,.82)→.5)` 壓成模板沉穩深調 + 保左側文字可讀。
- **左：標題區**：**副標膠囊**（`border-white/25`、`rounded-[24px]`、`padding 3/13/3/9`、金點 + `門市案例` 15/ls1/uppercase）+ 大標（`Interior Design`＝模板 Home Three gallery 逐字，**75/80/capitalize**）+ 段落（隨主圖聯動 `CASES[active].caption` 18/24、寬 378）+ **CTA 按鈕**（見下）。
- **CTA 按鈕 — 依主題原始碼 `antra-elementor-button`**（`elementor.css` `.elementor-price-table__button` 真值）：透明底、`border 1px rgba(159,159,164,.64)`、`rounded-full`、`padding 7/7/7/30`、字 **15px/weight400/capitalize**、`transition .5s`；圖示圈 **40×40** 金底白箭頭（lucide `ArrowRight` `w-5`=20）、**預設 `-rotate-45`**（↗）。**hover**：整顆填金（`bg`+`border`=`#C9AA79`）、圖示 `group-hover/cta:rotate-0`（→）。文字用「查看所有案例」；模板淺底字深、本區深底故**字用白**。⚠ 尺寸取**原始碼**非量網頁（demo root 20px 會放大成 18.75/45，見門市案例區備註）。
- **右：2 張卡**：`w-[330px] h-[360px] rounded-3xl`（沿用模板卡尺寸）、gap 30；右側留白處露出背景主圖。**卡片高度受限於 956 + y388 起點，故為 360（非早期的 610）**；要更高卡片就得把 section 拉高過模板 956。卡片 hover：陰影加深 `shadow-[0_32px_80px_-8px_rgba(0,0,0,.7)]` + 圖片 `group-hover/card:scale-[1.06]`（`overflow-hidden` 裁切）。
- **箭頭**：模板位置 —— 卡片**下方左側**（`mt-[40px]`、42×42 圓框、`border-white/25`、透明底、lucide `ArrowLeft/ArrowRight`）控制聯動 `prev/next`。
- **內容 = 3 則門市案例**：`CASES`（`{image, caption}`）；圖片 `public/store-cases/case{1,2,3}.jpg`（來源 `影像/門市案例`）。案例1 文案為正式；案例2/3 文案為**佔位**待替換。放在 `App.tsx` 產品區之後。

## What We Do — Antra Home Six 版型

`WhatWeDoSection.tsx`：複刻 Home Six 的「What we do」兩欄區（淺色白底、字型用模板 Cal Sans、金色 `#C9AA79`）。

- **左欄（依主題原始碼對齊模板）**：
  - **副標膠囊**：`rounded-[24px]` + `border rgba(114,114,114,.18)` + `padding 3/13/3/10` + 金點 + `what we do` 15/ls1/uppercase（實測模板 `.elementor-title-span`；與 Hero eyebrow 同款）。
  - **雙色大標** `text-[60px] leading-[64px]`（模板 Home Six 逐字「SAKURA has ⟨created exceptional⟩ architectural designs.」，金字 created exceptional；模板原文品牌名 Antra→SAKURA。三行斷點）。
  - **打勾清單**：照模板為**純金 `Check` icon（`w-[19px]`、色 `#C9AA79`、無圓底）**（非先前的金圓底+白勾）；清單字 18/24 `font-normal`（模板 weight 400）。
  - **CTA「櫻花優勢」= antra 標準按鈕**，**與上一個 section（Gallery「查看所有案例」）尺寸一致**：透明底、`border 1px rgba(159,159,164,.64)`、字 **15px**、`padding 7/7/7/30`、`gap-4`、盒高 **56**、金圓 **40** 箭頭預設 `-rotate-45`；hover 整顆填金 `#C9AA79` + 字白 + 箭頭 `rotate-0`。差別僅字色（淺底黑字，`hover:text-white`）。（三顆 antra 按鈕 Gallery/Pricing/WhatWeDo 統一 7/7/7/30/gap-4/高 56。）
- **右欄影片區**：**16:9 影片區塊**（`aspect-video`，圓角 24px + 陰影 + 黑底）：縮圖 poster（`VIDEO_POSTER`）鋪滿 + 置中播放鈕（`Play`）；**播放鈕依模板 `.elementor-video-popup` 改為半透明白圓 `rgba(255,255,255,0.36)` + `backdrop-blur` + 白三角**（非金），加**脈動光圈**（`animate-ping`，同白）與 hover 放大；影片卡 hover 依比例微放大（`hover:scale-[1.02]`）。
- **背景右下半透明建築圖 = 模板原圖 `h6-bg-3.png`**（已下載至 `public/decor/h6-bg-3.png`，821×520、PNG 本身半透明的現代建築線稿）：`<img src={BLUEPRINT}>` `absolute bottom-0 right-0 z-0 w-[600px] max-w-[48%] pointer-events-none`（opacity 用 1，同模板 layer；PNG 自帶半透明）；內容容器 `relative z-10` 疊其上；掛 `.wwd-blueprint` 讓 `useParallax` 做輕微視差。對應模板 `f0420ee` 的 `background-position:100% 100% / no-repeat`。
- 影片來源未定：poster 為佔位、播放鈕 `onClick` 尚未接（待提供 YouTube 連結或影片檔即可接 lightbox/iframe）。文字為佔位。放在 `App.tsx` 圖庫區之後。

## 門市查詢（Store Locations）— Antra Contact Us 風格 + 可用地圖搜尋

`StoreLocationSection.tsx`：套 Antra「Contact Us」視覺（淺灰底 `#f6f6f6`、膠囊 eyebrow、雙色大標、白色圓角卡片、金色 `#C9AA79`），並把原本的空佔位地圖與無效搜尋**做成真的能用**：

- **標題版型（依「首頁 Section 說明.pptx」slide 2 門市地圖）**：**分欄標題**——eyebrow `get in touch`（左 424px 欄）+ 大標推到右邊 `Have a Project in ⟨Mind? Let’s Make⟩ It Happen`（模板 Contact 頁逐字；`Mind? Let’s Make` 金色，彎引號 ’）。**加十字裝飾線**（與 `PricingSection` 相同：橫線 `left-[-13px] top-[16px] w-[502px] h-px`、直線 `left-[363px] top-[-38px] h-[179px]`、兩端 15px 三角、色 `#e3e3e8`、`hidden lg:block`），座標與 Pricing 一致 → 同位置。
- **左欄（寬，~62%）**：**Google Maps JavaScript API 自訂地圖**（`GoogleStoreMap.tsx`），套**極簡淺灰樣式**（`LIGHT_STYLE` style JSON，仿官網 store/location 的 Positron 淺灰風）+ **深色水滴「S」標記**（inline SVG）；選取/篩選門市時 `google.maps.Geocoder` 依地址定位、`panTo` 平移（結果 cache）。
  - **需金鑰**：在專案根目錄建立 `.env`，設定 `VITE_GOOGLE_MAPS_API_KEY=你的金鑰`（`.env` 已加入 `.gitignore` 不會 commit），並在 Google Cloud 啟用 **Maps JavaScript API** 與 **Geocoding API**；金鑰建議以 HTTP referrer 限制網域。改 `.env` 後需**重啟 `pnpm dev`**（Vite 環境變數不熱更新）。
  - **無金鑰/載入失敗**：地圖區直接顯示完整錯誤訊息（依全域規則「錯誤完整顯示在前端」），不靜默空白。
- **右欄（窄）**：`我的位置`（`LocateFixed` 金色準星）+ **`選擇區域` / `選擇城市` 兩個下拉**（`appearance-none` + 疊自訂 `ChevronDown`）；下方門市列表卡片——第一行區域灰底 pill + 店名，第二行 `MapPin` 地址（左）+ **金色電話（右靠同行）**，字級 14；選中 → 金色底白字。
- **級聯篩選**：`region` / `city` 兩個 state 驅動；選區域自動清空城市、城市下拉未選區域時 disabled（`REGIONS` 提供五大區→縣市對照）。`filtered = STORES.filter(區域符合 && 城市符合)`；選取門市若被濾掉自動退回第一筆可見門市；該區無資料顯示「此區域尚無門市資料」。
- **門市資料**：pptx 真實資料共 5 間（承德 / 石牌 / 民權 / 中山南京 / 八德，皆北部/臺北市，含真地址電話）；其他區暫無資料，補上即可用。

## Header — SAKURA 巨型選單（mega-menu）

`Header.tsx`：單一金色 bar、**中央 logo**（`public/sakura-logo.png`，白色雙行「SAKURA／KITCHEN」含紅標記，`img h-8`；桌面/手機共用）、左右各一組導覽，自訂 Tailwind 實作（未用 Radix，與全站一致）。

- **背景／字型／字級對齊參考站 `sakura-kitchenlife.com.tw`**（實測 `.l-header`／`.l-nav__item`，常數定義於 `Header.tsx` 頂部）：背景漸層 `linear-gradient(90deg, #B79258 20%, #D2B587)`（`HEADER_GRADIENT`）；字型堆疊 `"Noto Sans TC","PingFang TC","Microsoft JhengHei",微軟正黑體`（`HEADER_FONT`，套在 `<header>` 上向下繼承，**未外連 Google Fonts**、Mac 上 fallback 至 PingFang TC）；導覽字級 `text-[15px]`、weight 400、字色純白。
- **間距對齊參考站**：bar 容器改 `px-5 lg:px-12`（20/48px）且**滿寬**（移除原 `max-w-7xl mx-auto`），對齊參考站左右邊距 48px；搜尋展開列同步 `px-5 lg:px-12`。導覽項文字間距 28px（既有 `px-3`+`gap-1` 已等於 28px，與參考站一致）。bar 高度仍維持 `72px`（未動，因 mega-menu 以 `top-[72px]` 定位）。**注意**：參考站為「logo 靠左＋導覽靠右」的 space-between 版型，本專案為「導覽左半｜中央 logo｜導覽右半」置中版型（README 明載之自訂設計），故僅間距數值對齊，整體佈局結構刻意不同。

- **導覽資料**：`NAV_LEFT` / `NAV_RIGHT` config 陣列，每項 `{ label, children?, href?, external?, mega?, megaCatalog? }`。有 `mega` → 圖片式大選單；有 `children` → 文字下拉；只有 `href` → 連結（`external` 用 `target="_blank"`，如櫻花集團連 sakura.com.tw）。
- **桌面（`lg+`）**：三段 flex（左群 / logo / 右群 + 🔍）；有子選單者 `group relative` + `group-hover` 展開白色下拉（子項 hover 轉金、`ChevronDown` 旋轉；`pt-2` 橋接避免 hover 中斷）。
- **廚房產品 → 圖片式 mega-menu（仿 Antra Home 選單）**：hover 從 header 下方**淡入展開滿寬白色面板**（`opacity`+`visibility` 300ms；面板 `absolute left-0 right-0 top-[72px]`，定位參考 `header`，故滿寬）。內含**三張品牌大圖卡**（SAKURA 廚電 / SVAGO / TEKA，`public/products/*.jpg`，來源 `影像/廚房產品`）：`aspect-[4/3]` 圓角 + 底部漸層 + 白字標籤，卡片 hover 圖片放大、標籤轉金；面板底部 `廚房商品型錄 →` 文字連結。觸發鈕撐滿 `h-[72px]` 讓面板無縫貼合、hover 不中斷。手機版則把三品牌 + 型錄當 accordion 子項展開。
- **手機（`< lg`）**：logo + 🔍 + 漢堡；漢堡開白色抽屜，主項點擊 **accordion 展開**子選單（`useState expanded`），純連結直接點。
- **搜尋**：🔍 切換 `openSearch`，在 bar 下方展開白色圓角搜尋輸入框（前端介面，功能待接）。
- **固定頁首（sticky）**：因整站被 `ScaleToFit` 的 `transform: scale()` 包住、頁面用 body 原生捲動，畫布內用 `sticky`/`fixed` 都無法真正釘住視窗頂（transform 祖先讓 `fixed` 相對畫布、`overflow:hidden` 祖先讓 `sticky` 失效）。解法：`StickyHeader.tsx` 把 `<Header>` 抽到 `ScaleToFit` **畫布外**、自成 `position: fixed` 頂層，並用**同一 scale（`innerWidth/1512`）等比縮放**維持比例一致；`App.tsx` 在畫布內容頂端放 `HEADER_H`(72px) spacer 避免被蓋住。子項 href 為佔位 `#`；設計圖「SUKURA」視為 SAKURA 錯字已更正。

## 頁尾（Footer）— 巨型 SAKURA 浮水印（灰底）+ 模板暗色版權列

`Footer.tsx`：依 mockup 改為兩段式，取 Antra 頁尾精神（巨型品牌浮水印 + 暗色版權列）。

- **上半（灰底 `#f6f6f6`，同上一區 StoreLocation，無縫接）**：巨型「**SAKURA**」金色字標**浮水印(向量 SVG)** `public/footer-sakura.svg`、`w-[1320px] h-auto` 置中、`opacity 0.8`、`max-w-full` 防溢；`aria-hidden pointer-events-none select-none`；**浮水印層 `relative z-10`，下緣蓋在深色版權列之上**（跨越灰底/深色列交界）；外層 `overflow-hidden` 裁邊。（演進：`text-[330px]` 文字 →`IMG_1185.PNG` 點陣(555×107，放大到 1320 會糊)→ **potrace 向量化成 SVG**：`magick footer-sakura.png -alpha extract -resize 400% -threshold 50% -negate mask.pbm` → `potrace mask.pbm -s --color '#C9AA79' -O 0.4 -t 8`（**不加 `--tight`**，保留原 PNG 比例 5.19=2220×428，src 一換即可、`-mt`/尺寸不動）；填色已烙入 CIS 金 `#C9AA79`，任意縮放皆銳利。）
- **下半（版權列）**：**模板暗色 `#3E3A39`** 滿寬列，用 `-mt-[20px]` 疊在浮水印下緣之上（圖片無文字 330px 行框下方的空白，故負 margin 由文字版的 `-90` 縮為 `-20`；實測圖底與暗列重疊 ~28px、SAKURA 下緣輕蓋上暗列，仿模板）。版心 `max-w-[1410px] px-[51px] py-7`、`flex justify-between`：
  - 左：**網站地圖**（`#`）、**隱私權政策**（`/privacy.html`），**字級 14**、hover 轉金。
  - 中：`Copyright © Taiwan Sakura Corporation. All rights reserved`（`absolute` 置中，不受左右欄寬影響）。
  - 右：**數位展板** `/icons/digital-board.png` **30×30**、**YouTube** `/icons/youtube.png` **33×33**（白色去背 PNG，暗底顯白；`href` 佔位 `#`）。
- 舊的小金 logo `sakura-logo-gold.png` 已由巨型浮水印取代（檔案保留備用）。`App.tsx` 以 `<Reveal>` 包 Footer（出場淡入上升）。

### 隱私權政策頁 — `public/privacy.html`

素材 `隱私權政策.docx` **8.5MB，其中 14MB 是內嵌思源黑體字型，真正內文僅 37KB**。直接把 docx 掛連結是爛做法（下載巨大、瀏覽器無法直接讀），故：

- 用 Python 從 `word/document.xml` 抽出純文字（8 章節 + 條列，最後修訂 2025/3/4），依已知章節標題精準切段。
- 產生**獨立輕量靜態頁** `public/privacy.html`（**7.5KB**，品牌黑底金 logo header + 白底可讀內文、金色章節編號與條列點）。Vite 服務 `public/*`、`vercel.json` 無 SPA rewrite，故 dev/正式站 `/privacy.html` 皆可直接開。

## 驗證方式

1. **桌面版（1920x1080）**：逐頁比對確認零視覺差異
2. **桌面邊界（1024x768）**：確認 `lg:` 斷點切換正常
3. **平板（768x1024 iPad）**：佈局合理、字體可讀、間距適當
4. **手機（390x844 iPhone 14）**：佈局不溢出、文字可讀
5. **斷點跳變**：拖動瀏覽器寬度在 768px 和 1024px 附近確認過渡平滑
