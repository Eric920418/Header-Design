
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

## 全站原生 RWD（已移除 Scale-to-Fit）

整站不再把 1512px 桌面畫布用 `transform: scale()` 壓進小螢幕，而是依真實 viewport 重排。`ScaleToFit.tsx`、`useCanvasScale.ts` 已刪除，`App.tsx` 直接渲染內容；這也避免縮小桌面字造成手機可讀性與點擊區過小。

- **斷點**：`globals.css` 恢復 Tailwind 標準 `sm 640 / md 768 / lg 1024 / xl 1280 / 2xl 1536`，並增加只供模板 Hero 使用的 `antra 1200` 斷點；元件原有 `md:`、`lg:` 規則重新生效。
- **Header**：`StickyHeader` 是真正的 `position:fixed; width:100%`，不再另套 canvas scale；`App` 保留 72px spacer。
- **FloatingButtons**：`lg+` 保留右側 fixed 浮動欄；`<lg` 改用原本就存在的手機底部三按鈕列。頁面根在手機保留 65px bottom padding，避免 Footer 被覆蓋。
- **Hero**：直接對應模板 390／768／1024／1200+ 的原生高度、字級、對齊與座標；1512 仍是桌面像素級比對基準，不再是全站縮放畫布。
- **其他 sections**：沿用既有 Tailwind 響應式 class 與 CSS 變數；StoreLocation 的資料、地圖、篩選與互動未更動。

## 捲動動態（Lenis 阻尼 + 出場動畫 + GSAP 視差）— 複刻 Antra 模板

模組集中在 **`src/motion/`**，三種效果皆對映 Antra 模板實測值，且都受 `prefers-reduced-motion` 保護。套件（pnpm）：`lenis`、`gsap`。

- **平滑捲動阻尼（Lenis）** — `src/motion/{useSmoothScroll.ts, ScrollMotionProvider.tsx}`。對映模板 config：`duration: 1.5` + expo ease-out `t=>Math.min(1,1.001-2**(-10*t))`。用原生 window 捲動、不設 wrapper/content transform，因此不破壞 Header／FloatingButtons 的 fixed。只在 **桌面（>992px）且非 reduced-motion** 啟用。
- **出場動畫（IntersectionObserver + CSS，完全比照 Antra 模板）** — `src/motion/Reveal.tsx` + `globals.css` 的 `.ev`。逐 section 用模板實際的 Elementor 進場動畫（keyframe 逐字取自 demo `styleSheets`；`.animated` = `1.25s` / fill `both`；hidden state = `visibility:hidden` 同 `.elementor-invisible`）。機制：`.ev { visibility:hidden }`、IntersectionObserver 進場加 `.is-visible`、`animation-name` 由 `data-ev` 決定（進場一次不重播、reduced-motion 直接顯示）。
  - **API**：`<Reveal anim="slideInLeft" delayMs={300} speed="slow">` 或 `useReveal(ref)` 掛既有元素（配 `className="ev"` + `data-ev` + inline `animationDelay`）。`anim` 支援 `slideInUp/Down/Left/Right`、`fadeIn/Up/Down`（Elementor 核心 **100% 位移**）+ `opalMoveUp/…/opalScaleUp`（主題 100px 版，備用）。`speed` 對應 Elementor `animation_duration` 控制項：`normal`=1.25s（預設）、`slow`=2s、`fast`=0.75s（class `.ev-slow`/`.ev-fast`）。
  - **逐 section 對映（實測 demo）**：**Hero（home-6 逐項對位）＝容器 section `fadeInDown`(normal 1.25s) 整區落下＋標題/副標 `slideInLeft`(slow 2s) 從左滑入＋Start 圓鈕 `fadeIn`(slow, 900) ＋浮水印 `fadeInUp`(slow, 900)**——容器落下與內層左滑**巢狀複合**成斜向動態（非單一由下往上），延遲 900 層錯落；Project section `slideInUp`；Pricing 標題 `slideInUp` + 三卡 `slideInUp`(0/300/500)；Gallery 標題 `slideInUp`(200) + 右卡欄 `slideInUp`(400)；WhatWeDo 左 `slideInLeft` + 右影片 `slideInRight`(300)；StoreLocation `slideInUp`；**Footer 無進場**（模板亦無）。
  - **鐵則**：`.ev` 用 `transform`（fill both 收在 none），**勿套在已佔 transform 的元素**（Embla 軌道、`.project-parallax-img`/`.gallery-bg`/`.wwd-blueprint` 視差、`animate-gallery-card`、hover-scale/rotate）→ 一律包外層 wrapper。`slideInLeft/Right` 的 100% 位移靠 section `overflow-hidden` 裁切避免水平捲軸。
- **捲動視差（GSAP ScrollTrigger，純 scrub 不 pin）** — `src/motion/useParallax.ts`。用 `yPercent` scrub（`scrub:0.5`）位移；目標為 GallerySection 全出血背景與 WhatWeDo 裝飾。只寫內層 transform。ProjectSection 照片視差維持移除，避免 Embla loop 的合成接縫。

## 色彩規範（Antra 模板）— 全站唯一色盤

自 2026-07-17 起，模板外觀優先於舊 SAKURA CIS；本節取代 README 後方任何歷史色號敘述。正式色值直接取自付費模板 `antra/dummy-data/elementor.json` 的 Elementor system colors。**單一來源**：`src/theme/cis.ts`（inline style）與 `src/styles/globals.css`（全域／Tailwind tokens），兩邊數值必須一致。

| 模板角色 | HEX | 全站用途 |
|---|---|---|
| Primary | `#CAA05C` | 金色重點、hover、focus、互動提示 |
| Secondary / Accent | `#1C1C1D` | 標題、深色面、Footer、地圖標記 |
| Text | `#59585D` | 內文、次要按鈕底、圖示 |
| Lighter | `#9F9FA4` | placeholder、較淡文字 |
| Border | `#E3E3E8` | 邊框、分隔線、裝飾線 |
| Background Field | `#F6F6F6` | 頁面與欄位淺底 |
| Dark | `#000000` | 圖片遮罩及其透明階 |
| White | `#FFFFFF` | 卡片、反白文字及其透明階 |

- **零衍生色政策**：不再使用舊 `#C9AA79`、金屬漸層、暖灰或 shadcn `oklch()` 色票；Header 改為模板 Primary 純色。Alpha 只能建立在上表基色上，例如黑色圖片遮罩、白色玻璃面、Lighter 邊框。
- **完整範圍**：Header、Hero、自訂側選單、兩個跑馬燈、Project、Services、Gallery、WhatWeDo、門市、Google 地圖、Footer、桌面浮動鈕與手機底列全部套同一色盤；互動、資料、尺寸、版型和動畫未改。
- **地圖**：地圖功能與初始視野不動，只把 Google Maps style 收斂為模板 Background / Border / White / Text / Lighter，標記使用 Secondary；錯誤訊息使用 Primary，因模板沒有紅色色票。Google Maps 執行期注入的圖磚底、縮放分隔線與版權底也在 `.antra-map` 內以 `!important` 收斂到 Background / Border，不關閉任何控制項。
- **素材界線**：照片、SAKURA Logo、圖示 PNG/SVG 的來源像素不加濾鏡。這些是內容素材而非 CSS UI 色；強制改色會破壞商標與照片原色，也不屬於模板 CSS 色盤。
- **驗證**：原始碼 HEX／RGB／OKLCH 掃描通過；瀏覽器在桌面 `1512×956`、手機 `390×844` 並捲過所有 Reveal 區塊後，computed-style 非模板基色均為 0。可見 UI 不得出現上表之外的基色。

### Footer 垂直分層

- Footer 手機／平板維持精簡版 `450px`；桌面為 `682px`。桌面只增加版權帶下方的背景圖／Logo 舞台，上方資訊區 `220px` 與 Copyright 帶 `80px` 完全不增高，既有連結、數位展板與 YouTube 不變。
- 原 `footer-sakura.svg` 畫布高 428，其中底部 80px 完全透明；已把 SVG `height/viewBox` 收緊為 348，不縮放也不裁任何可見筆畫。桌面使用 `bottom:0` 後，現在是「可見字形」而非 `<img>` 外框貼齊 Footer 底部，版權帶至 Logo 上緣仍約 `176px`。手機／平板保留 `bottom:30px`。

#### Footer Design QA（2026-07-17）

- **Source visual truth**：模板貼底參考 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_WVSkS0/截圖 2026-07-17 下午2.17.25.png`；修正前空隙 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_8Epxm3/截圖 2026-07-17 下午2.22.00.png`。
- **Implementation evidence**：桌面實際渲染 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/footer-visible-ink-flush-desktop-1512.png`；模板／成品同圖聚焦對照 `footer-template-vs-visible-flush.png`；手機：`footer-complete-mobile-390.png`。
- **Viewport / state**：桌面 `1512×956`、手機 `390×844`；頁面捲至最底、Footer 靜止狀態。
- **Full-view evidence**：Footer 上方資訊區、Copyright 帶、背景圖留白、巨型字標與固定浮動鈕均在同一畫面核對。1512px 桌面版權帶底緣至 Logo 上緣量得 `175.1px`，參考圖約 `177px`；Logo 上下都在 Footer 邊界內（`fullyVisible=true`），且 `bottomInset=0` 精準貼底。1024px 同樣 `bottomInset=0`、無水平溢出；390px 手機維持 `bottomInset=30px` 安全距離。
- **Focused comparison evidence**：本次問題只涉及版權帶與 Logo 的垂直關係，因此聚焦裁切足以判定；不需改動字型、圖示或內容欄位。
- **Fonts / typography**：既有字型、字級、行高、字重與文案未改；Copyright 仍置中。
- **Spacing / layout rhythm**：首輪發現 `[P2]` Logo 與版權帶重疊 `34.5px`；最終移除 SVG 底部 80px 透明畫布、桌面舞台設為 `682px`、Logo 使用 `bottom:0`，同時保留模板間距、完整字標與可見筆畫貼底；上方黑色資訊與版權帶高度均不變。
- **Colors / tokens**：沿用模板 `#1C1C1D`、白色透明階與 `#CAA05C`，沒有新增色號。
- **Image quality / assets**：沿用原有背景圖與向量 `footer-sakura.svg`，沒有重新生成、拉伸或改色。
- **Copy / content**：網站地圖、隱私權政策、Copyright、數位展板、YouTube 均原樣保留。
- **Browser checks**：1512、1024、390 三種寬度均完成實際渲染；Footer 高度分別為 `682px`、`682px`、`450px`，各斷點無水平溢出且沒有 console error。
- **Comparison history**：before＝`gap -34.5px`（重疊，P2）；iteration 1＝`65.5px`；iteration 2＝`175.5px` 但 Logo 被裁；iteration 3＝`<img>` 外框貼底但 SVG 內仍有 80px 透明留白（P2）；iteration 4＝收緊 SVG 至 348px、桌面 `682px`＋`bottom:0`，可見筆畫完整且真正貼底，無 P0／P1／P2 殘留。
- **final result: passed**
- **地圖初始視野（`GoogleStoreMap` `focus` prop）**：**初始顯示整個台灣主島**（`fitBounds(TAIWAN_BOUNDS)`，尺寸未定前以 `TAIWAN_CENTER`/`zoom 7` 當 fallback），只放門市 pin、**不鎖定街道級**；使用者**點門市卡片**才 `setFocused(true)` → 地圖 `panTo`+`setZoom(16)` 聚焦該門市（`placeAt` 依 `focusRef` 決定是否平移縮放）。`StoreLocationSection` 以 `focused` state 控制，門市卡片 `onClick` 設 true。
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
| Gallery | eyebrow `our gallery`；h2 `Interior design`；段落 `Lorem ipsum dolor sit amet consectetur. Magna nunc porttitor convallis faucibus laoreet.`（Home Three 原始文字） |
| WhatWeDo | eyebrow `What we do`；h2 `SAKURA has ⟨created exceptional⟩ architectural designs.`（Antra→SAKURA）；清單 `Residence And Condo / Modern Kitchen Renovate / Interior House Decoration`、段落 `We specialize in transforming visions…precision.`（本就與模板一致，未改） |
| Store | eyebrow `get in touch`（未改）；h2 `Have a Project in ⟨Mind? Let’s Make⟩ It Happen`（模板 Contact 頁；彎引號 ’） |

**刻意保留、未動的英文**：ProjectSection 10 個廚房系列卡名（`Basic+`/`AI Kitchen`/`Clever Kitchen`…）與 Hero 6 個風格名（`Modern`/`Scandinavian`…）＝對應旁邊中文的 SAKURA 產品/風格名；品牌專有名詞 `SAKURA`（浮水印）/`SVAGO`/`TEKA`/`Copyright © Taiwan Sakura Corporation…`/`YouTube`；`MarqueeBand` 裝飾字 `Kitchen Product`（模板無對應 marquee 文案）。

**文字排版 token**（size/line-height/letter-spacing/text-transform/字重/字型皆照模板）：

| 角色 | 值 |
|---|---|
| Section h2 | `text-[60px] leading-[64px]`（Gallery 依 Home Three 原始 instance：桌面 `110/100`、tablet-extra `76/90`、tablet `42/50`、mobile `40/45`） |
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

- 桌面精準值仍以 1512px 為比對點；手機／平板由各元件的 `md:/lg:` 規則重排，不再縮小桌面畫布。
- Header／FloatingButtons／Footer 維持 SAKURA 自訂設計；Hero 已改為 Antra Home 6 原版視覺。StoreLocation 是自訂功能區，不列入模板還原。

## 響應式設計（原生重排）

採真實斷點策略，透過 Tailwind responsive utilities 與 CSS Custom Properties 實現：

| 層級 | 範圍 | 策略 |
|------|------|------|
| 手機 | <768px | 獨立的較小固定值（CSS 變數默認值） |
| 平板 | 768px - 1023px | `min()` + `dvh` 流動縮放 |
| 桌面 | ≥1024px | 桌面構圖；Hero 在 ≥1200px 切到模板完整左對齊版 |

### 技術方案

- **inline style 值**：使用 `globals.css` 中定義的 CSS 變數（如 `var(--hero-h)`），值隨斷點自動切換
- **className 值**：直接使用 Tailwind 響應式前綴（如 `h-[280px] md:h-[380px] lg:h-[450px]`）

### 主要響應式適配

| 組件 | 手機版 | 平板版 | 桌面版 |
|------|--------|--------|--------|
| Header（巨型選單） | logo + 搜尋 + 漢堡；漢堡開 accordion 抽屜 | 同左 | 中央 logo + 左右導覽 + hover 下拉 + 搜尋展開 |
| HeroSection（主視覺） | Antra 390 置中版 | Antra 768 置中版 | 1024 置中大字；1200+ 原版左對齊 |
| HeroStyleMarquee | 62px 輪播本體＋上下 12px、1 欄 step carousel | 768=3 欄、880=4 欄；上下 16px | 1200=5 欄、1367+=6 欄；gap 120px、上下 16px |
| FloatingButtons | 底部固定導航列 | 底部固定導航列 | 右側 `fixed` 浮動欄（疊在內容上，不佔軌道） |
| ProjectSection（10 種廚房風格輪播） | embla 拖曳、卡片較窄 | 拖曳捲動 | 拖曳、卡片 378×880、hover 伸縮露出橫式廚房圖 |
| StoreLocationSection（門市查詢） | 上下堆疊（地圖+搜尋在上、列表在下） | 同左 | 左右並排（左 45% 地圖+搜尋、右列表） |
| Footer（Antra 骨架簡化版） | 450px；連結／icons 上下配置、Logo 避開固定功能列 | 450px；連結與 icons 分列 | 682px；資訊區＋版權帶高度不變，Logo 可見筆畫完整並貼底 |

## 主視覺（Hero）— Antra Home Six 版型

`HeroSection.tsx` 還原 Antra Home 6 的 `ee91316` Hero，使用模板原圖 `public/hero-antra-home-6.jpg` 與模板色票；同時把使用者原有的「品牌系列」左側伸縮抽屜以功能層疊回 Hero。Header、FloatingButtons、StoreLocation 的內容與互動未更動。

- **1512px 真值**：section `1512×952`；原圖 `1920×950`、`cover center`；黑色 overlay opacity `0.64`；內容 `left:30 / top:244`。
- **文字**：eyebrow `12/22`、letter-spacing `1px`、實測寬約 204px，外層用 flex 消除 inline baseline 的 0.5px 偏移；h1 `100/110`、letter-spacing `-1px`、寬 850；副文 `18/24/500`、寬 522。模板主金使用原值 `#CAA05C`，不再套 SAKURA CIS `#C9AA79`。
- **下半部**：分隔線 `top:691`；Start Project 圓鈕 `120×120 / left:30 / top:750`、`backdrop-filter:blur(58px)`；`Interior` 浮水印以 block line-box 固定為 `320/240 / left:426 / top:719 / opacity:.64`。
- **模板動態**：Hero `fadeInDown 1.25s`、標題 `slideInLeft 2s`、圓鈕 `fadeIn 2s delay 900ms`、浮水印 `fadeInUp 2s delay 900ms`。`App.tsx` 已移除重複的第二層 Hero 動畫。
- **原生 RWD 實測值**：390=`587px` 高、title `30/35`、左右 15px；768=`489px` 高、title `50/60`、左右 30px；1024=`719px` 高、title `100/110` 置中；1200+=`952px` 高、完整桌面座標。分隔線、圓鈕與浮水印也各自對應模板斷點（浮水印右距：390=14px、768/1024=29px、桌面=4.83vw）。
- **自訂功能保留**：桌面左側「品牌系列」把手可展開 190px 選單，展開時沿用原行為把 Hero 文字、圓鈕與浮水印右推；Hero 下方 `HeroStyleMarquee.tsx` 是獨立品牌輪播 section，內容使用指定的六組中英文與 `/brand-logos/*.svg`。

### Hero 下方品牌輪播 — Antra Home 4 `antra-brand`

- **模板真值**：來源 `home-4.xml` Brand container `4c0bad9`／widget `61788d0`。輪播 viewport 左右 padding：手機 15px、其餘 30px；單列高 62px（模板 SVG 58px + link padding 2px）；項間固定 120px。
- **響應式欄數**：390=1、768=3、880=4、1200=5、1367+=6；slide 寬度使用模板公式 `(viewport - gap × (columns - 1)) / columns`，1512px 時為 142px，起點依序 `30 / 292 / 554 / 816 / 1078 / 1340`。
- **輪播方式**：由原本 40 秒連續 marquee 改為模板的 step carousel：loop、可拖曳／觸控、500ms 級轉場、每 5000ms 前進一格、hover 暫停、使用者開始拖曳後停止 autoplay；無箭頭、無 dots。`prefers-reduced-motion` 下不自動播放。
- **內容不改**：仍顯示原六組中文、英文與 logo；因模板原件只放 logo，本站額外文字保留在同一個 62px slide 內，不為追求外觀而刪內容。為了讓 6 個原始項目在桌面也能 loop，DOM 建立三組；後兩組 `aria-hidden` 且不進入 tab order。
- **外部位置**：依先前需求保持緊貼 Hero，不套用 Home 4 專屬 Hero 的 `margin-top`（該間距隨 Home 4 Slider 高度而變，不適用目前 Home 6 Hero）；carousel 本身的高度、padding、slide 尺寸與 gap 依模板。
- **區塊留白**：依驗收回饋在輪播本體外增加輕量垂直 padding，手機上下各 12px、768px 以上各 16px；62px 輪播 viewport、slide 尺寸、120px gap 與 Embla 運動參數不變。區塊總高分別為 86px／94px。
- **仍移除的非模板加料**：三張 Unsplash 輪播、Ken Burns、右下輪播指示器；使用者本輪沒有要求恢復。
- **建置修正**：修正 `globals.css` 內會提前結束註解的 `*/` 字樣，避免 Tailwind CSS 最佳化階段出現解析警告；不改變任何視覺樣式。

#### 品牌輪播 Design QA（2026-07-17）

- **Source visual truth**：Antra Home 4 `https://demo2.themelexus.com/antra/home-4/` 的 Brand widget `61788d0`，並以本地主題 `homepage/home-4.xml`、`brand.php`、`elementor-classes.js` 交叉核對設定與運動方式。
- **同尺寸對照圖**：模板 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/brand-reference-1512.png`；本站輪播本體 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/brand-implementation-1512.png`；增加外層留白後 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/brand-spacing-section-1512.png`。
- **版面量測**：輪播 viewport 高度維持 62px；外層 section 手機 86px、768px 以上 94px。390／768／880／1024／1200／1367／1512px 均無水平 overflow。1512px 的 6 個 slide 寬 142px，起點為 `30 / 291.9 / 553.9 / 815.9 / 1077.9 / 1339.9`，與模板 `30 / 292 / 554 / 816 / 1078 / 1340` 的差異僅為瀏覽器次像素顯示。
- **互動驗證**：可見瀏覽器實測 5000ms 後 transform 從 `translate3d(-2483px,0,0)` 前進到 `translate3d(-2759.91px,0,0)`，確認為一格一格 step carousel；loop、拖曳、hover 暫停與拖曳後停止 autoplay 由 Embla event wiring 保留，無箭頭、無 dots。
- **刻意差異**：模板每張只有 logo；本站按「內容都不要改」保留中文與英文，因此單張內部視覺不是模板原 logo-only 組成。輪播高度、欄數、viewport padding、slide 寬、120px gap 與運動規則則已對齊。
- **Console**：本次檢查無 console error；`pnpm build` 通過。

final result: passed

## Footer — Antra Home 6 骨架簡化版

`Footer.tsx` 使用 Antra Home 6 Footer 主體 `6632dbf` 的三段式結構，但依需求刪除模板的訂閱區、地址、電話與多欄選單，只保留原有「網站地圖／隱私權政策」、Copyright、數位展板與 YouTube。

- **模板素材**：使用模板原始 `1920×950` 背景圖，已本地化為 `public/footer-antra-bg.jpg`；外層套用模板同級的 75% 黑色遮罩。
- **結構高度**：依驗收回饋取消模板 945px 的整段高度；手機／平板為 450px、桌面為 682px。上半資訊區固定 220px、版權帶固定 80px；桌面只增加版權帶下方的背景圖／Logo 舞台，黑色資訊帶不增高。內容最大寬 1410px，桌面左右 51px。
- **簡化內容**：左側只放網站地圖與隱私權政策，右側只保留數位展板與 YouTube 圖示；中間版權帶逐字保留 `Copyright © Taiwan Sakura Corporation. All rights reserved`。
- **Logo 下移**：`footer-sakura.svg` 不再壓住版權列，並移除原素材底部 80px 透明畫布（428→348）；桌面最大寬 1320px、`bottom:0`、opacity 30%。桌面版權帶底緣至字標上緣約 175.5px，整張 Logo 可見筆畫完整且下緣貼齊 Footer。
- **原生 RWD**：手機左右 15px、連結與 icons 垂直分區；平板／桌面改為左右分列。手機／平板 Logo 使用 `bottom:30px` 避開底部固定浮動列；桌面使用 `bottom:0`，藉 682px 高度保留模板間距、完整 Logo 與貼底關係。

### Footer Design QA（2026-07-17）

- **Source visual truth**：Antra Home 6 `https://demo2.themelexus.com/antra/home-6/` Footer 主體 `6632dbf`；模板截圖 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/footer-template-home6-1512.png`。
- **Implementation screenshots**：最新桌面 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/footer-visible-ink-flush-desktop-1512.png`；模板／成品同圖聚焦對照 `footer-template-vs-visible-flush.png`；手機 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/footer-complete-mobile-390.png`。
- **Viewport / state**：1512×956、390×844，Footer 捲入可見區的穩定狀態；Header 與 FloatingButtons 是使用者指定保留的自訂功能，桌面截圖中的覆蓋不列為 Footer 差異。
- **Full-view comparison**：同一張 1920×950 背景、75% 黑罩、資訊層、獨立版權帶與底部巨型字標保留模板骨架；總高依最新驗收為手機／平板 450px、桌面 682px，且桌面新增高度只屬於版權帶下方 Logo 舞台。模板多欄內容按需求刪除。
- **Focused comparison**：桌面巨型 SAKURA Logo 維持最大寬 1320px並沉在底部；素材 viewBox 已從 428 收緊至可見字形高 348，使用 `bottom:0` 配合 682px 總高，完整顯示且可見筆畫貼底；手機使用 `bottom:30px`。
- **Fidelity surfaces**：沿用現有字型與原文案；色彩使用模板黑罩／半透明深色資訊層與 SAKURA 金字標；背景與 Logo 都是實際圖片素材，未用 CSS 造假；連結、Copyright、數位展板、YouTube 內容均未改。
- **Responsive / console**：390px Footer 為 450px、1024／1512px Footer 為 682px，三者皆 `scrollWidth === clientWidth`；1512px 的 Logo 與版權帶間距為 `175.1px`，桌面 `bottomInset=0`、手機 `bottomInset=30px`，皆無 Logo／Copyright 裁切，console 無 error。`pnpm build` 通過。
- **Comparison history**：第一輪 Logo 與版權帶重疊；第二輪間距不足；第三輪 Logo 被裁；第四輪 `<img>` 外框貼底但 SVG 透明畫布仍留縫；第五輪量到透明區 80/428，收緊素材為 348px 並把桌面調成 682px，最終保留模板間距、完整字標且可見筆畫貼底。上方 220px 資訊區與 80px 版權帶未增高，無可執行的 P0/P1/P2。

final result: passed

### Hero Design QA（2026-07-17）

- **Source visual truth**：Antra Home 6 `https://demo2.themelexus.com/antra/home-6/`，並以本地主題 `dummy-data/homepage/home-6.xml` 的 section `ee91316` 交叉核對。
- **Reference screenshot**：`/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/hero-reference-1512.png`。
- **Implementation screenshots**：桌面 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/hero-rwd-1512.png`；手機 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/hero-rwd-390.png`。
- **Viewport / state**：390×844、768×844、1024×844、1512×956；動畫完成後的穩定狀態。本站自訂 Header／FloatingButtons／品牌系列抽屜按需求保留，模板差異判定時列為明確例外。
- **Full-view comparison**：背景原圖、中心裁切、黑色 64% overlay、952px section 高、分隔線、圓鈕與浮水印構圖一致；Hero 本身無 P0/P1/P2 差異。
- **Focused comparison**：eyebrow `203.9×30 @ 30,244`、h1 `850×220 @ 30,294`、副文 `522×72 @ 30,544`、圓鈕 `120×120 @ 30,750`、浮水印 `1012.8×240 @ 426,719`，皆與原版 computed metrics 一致。
- **Fidelity surfaces**：Cal Sans/Golos Text、字重/字距/行高、間距、模板金 `#CAA05C`、原圖品質、英文文案均通過；原生 390／768／1024／1512 metrics 已量測並寫入 responsive rules。
- **Comparison history**：第一輪修正錯圖、錯 overlay、錯高度、錯字距與非模板加料；第二輪修正 eyebrow 寬度與 0.5px baseline、浮水印 line-box；最終同尺寸重新擷取後未發現可執行的 P0/P1/P2。
- **Console / interaction**：Hero 無 console error；各斷點 `scrollWidth === innerWidth`。桌面品牌系列抽屜實測 `0→190px`、`aria-expanded` 正確切換、展開後 heading `x:30→230`；390px Header 漢堡抽屜可正常開啟。跑馬燈為 12 項（6+6）無縫循環，重複組不進入 tab order。僅觀察到未改動的 Google Maps 載入方式與舊 Marker API 警告。

final result: passed

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

`ServicesSection.tsx`（原 `PricingSection` 已換掉；改為 **Antra 模板 home-6「Our Services」= `antra-services-list` style-3 服務輪播**，照原始碼 `dummy-data/homepage/home-6.xml`、`inc/elementor/widgets/service-list.php` + `assets/css/base/elementor.css` 複刻）。底部 SAKURA 既有跑馬燈 `MarqueeBand` 已併入同一個 Services `<section>`，文案與動畫均未更動。

- **背景與 Section 尺寸**：使用模板原始 `1920×1040` `public/services/h6-bg-2.jpg`，`cover / top center / no-repeat`，疊加黑色 76%。模板的 `backdrop-filter: blur(29px)` 掛在 Section selector，本機亦照此位置設定，不再把 blur 錯掛到 overlay 而模糊背景圖。依使用者指定移除全部 Section top margin；上／左右 padding 沿用 Elementor：手機 `60/15`、平板 `80/30`、1024–1199 `100/30`、≥1200 `125/30`。跑馬燈已併入 Section，因此原 bottom padding 改由跑馬燈前的 96px 間距承接，Section 本身 bottom padding 為 0，讓跑馬燈貼底。
- **標題列**：subtitle 膠囊 `● Our Services` 與大標均為模板白色；桌面左欄 424px、標題寬 769px、`60/64`，手機 `30/35`、寬手機 `45/50`。桌面裝飾完整還原 Elementor 結構：水平線 `502px`＋`deco-horizontal.svg` 尖端、垂直線 `179px`＋`deco-vertical.svg` 尖端，線色 `rgba(255,255,255,.18)`；標題與輪播桌面間距 60px、窄版 30px。
- **服務卡（style-3，照原始碼）**：卡片 `#FFFFFF`、radius 24px、padding 10px；圖片手機高 250px、其餘 310px、radius 24px、hover `scale(1.1)`、薄暗罩 `rgba(0,0,0,.11)`。caption 手機 `20/0/30`、其餘 `30/20/35`；標題手機 `25/30`、桌面 `28/35` Cal Sans，內文 Golos Text `16/24 #9F9FA4`，編號 `30px #E3E3E8`。手機全部圖上字下，較寬斷點才套偶數卡 `column-reverse`。
- **輪播（模板 data-settings 照抄）**：`embla-carousel-react` `loop`，手機 1 欄、平板／1024 兩欄、≥1200 三欄；30px gap、autoplay 5000ms、hover 暫停、`reduced-motion` 不自動播、可拖曳、無箭頭／點（`navigation:none`）。
- **內容與素材**：01–06 英文 title／excerpt 完整保留模板 dummy-data；`service-{1..6}.jpg`、`h6-bg-2.jpg` 與兩個 deco SVG 已從 Page 6 原始素材本地化到 `public/services/`，不再依賴 demo 外連；破圖仍 fallback `/kitchen-styles/elegant.jpg`。
- **跑馬燈**：`MarqueeBand`「Kitchen Product」現在位於 Services `<section>` 內，共用 `h6-bg-2.jpg`、黑色 76% overlay 與同一裁切範圍，不再有 `#f6f6f6` 分區。以 96px 間距接在服務卡後，透過負水平 margin 維持全出血，且跑馬燈容器底緣與 Section 底緣相同（bottom gap `0px`）；文字使用模板金 `#CAA05C → transparent`，220px 字級、重複內容與 `animate-marquee` 速度不變。

### Services Design QA（2026-07-17）

- **Source visual truth**：以已購買模板 `/Users/eric/Desktop/Header-Design/antra-full 2/antra/dummy-data/homepage/home-6.xml` 的 Elementor instance、`assets/css/base/elementor.css`，以及原版背景 `public/services/h6-bg-2.jpg`／6 張服務圖／2 個 deco SVG 為唯一基準；直播 demo 網域目前受瀏覽器政策封鎖，未以繞過方式存取。
- **Implementation evidence**：桌面聚焦成品 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/services-section-implementation-1512.png`；原始背景素材／本機成品對照 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/services-page6-source-vs-implementation.png`。
- **Desktop 1512×956**：Services 內容原始區塊保持桌面 top/水平 padding `125px 30px`；併入跑馬燈後 Section 實際高度 `1205px`、外距上 `0`、bottom padding `0`。背景 `top center / cover`、黑色 `.76`，selector 保留 blur `29px`。標題 Cal Sans `60/64`、寬 `769px`；三欄 `33.333%`，卡寬約 `450px`、白底、radius/padding `24/10px`、圖片高 `310px`；標題 `28/35`、內文 Golos Text `16/24 #9F9FA4`。
- **Tablet 1024×768**：外距 `0`、top/水平 padding `100px 30px`、bottom padding `0`；標題 `45/50`、兩欄 `50%`、圖片高 `310px`，偶數卡維持模板上下反轉。
- **Mobile 390×844**：外距 `0`、top/水平 padding `60px 15px`、bottom padding `0`；標題 `30/35`、單欄 `100%`、圖片高 `250px`，所有卡片皆圖上字下；卡標 `25/30`、內文 `16/24`。
- **Interaction / regression**：Embla `loop` 與 5000ms autoplay 實測 track transform 有變化；hover 暫停、拖曳與 reduced-motion 保護仍在。`Kitchen Product` marquee 節點存在且 computed animation-name=`marquee`，目前與 Services 為同一個 Section；Header、左側伸縮選單、右側浮動鈕及其他 Sections 未改。
- **Browser checks**：1512、1024、390 三種寬度均無水平溢出、素材 natural size 正確（服務圖 `1410×1018`）、無 console error。
- **Comparison history**：before＝淺灰背景、卡片缺白底／24px 外框、圖片使用比例高度且外連；final＝Page 6 原背景＋遮罩、原版白卡／固定圖高／排版、全部素材本地化，無 P0／P1／P2 殘留。
- **final result: passed**

## 門市案例（Gallery）— Antra Home Three 版型

`GallerySection.tsx`：對位 Home Three gallery 版型（section 高/位置/膠囊/大標/箭頭照模板實測 + 主題 `heading.php`），**但右側依使用者規則做「背景=主圖 + 2 卡聯動」**（非模板原生的 3 欄 swiper）。字型用模板 Cal Sans、金 `#C9AA79`，內容為 **SAKURA 門市案例**。

- **輪播規則（使用者指定）**：**全出血背景 = 目前主圖(#active)**，右邊固定**只 2 張卡** = 下兩張(#active+1、#active+2)；前進時背景與兩卡一起輪替（背景交叉淡入 + `useParallax('.gallery-bg')` scale 1.12、卡片/段落 `animate-gallery-card` 滑入）。`useState(active)` 驅動、autoplay 4s（滑入暫停）、指標拖曳。
- **section 高度 = `min-h-[956px]`**（實測模板 956）；內容**非置中**，照模板 `e-con-inner` `padding-top` 推到下半部 —— 內容容器 `lg:pt-[388px]`、`items-start`。實測靜止：副標/卡片頂 y388、大標 y445、段落 y682、箭頭 y788（與模板 0–1px）。左標題區 `lg:w-[479px]`（L51）+ 右卡欄 `flex-1`。內部間距：膠囊 `mb-[26px]`、段落 `mt-[37px]`、箭頭 `mt-[40px]`。**右側卡片靠右**：右卡欄 `flex justify-end`（容器 `lg:pr-[51px]`）內包一層縮到卡片寬度的區塊 → 卡片右緣對齊右版心 1461（右邊距 51、與左緣對稱），左側 530–771 留白露出背景主圖。**箭頭在該區塊內靠左**（不加 `justify`）→ 落在**卡片群左緣 771 的正下方**（卡片下方 40px），非靠右。
  - ⚠ **驗證陷阱**：`.reveal` 用個別 `translate` 屬性做進場，隱藏分頁 transition 卡住停在 `translate:0 56px` → 量測會**整體 +56**；驗證垂直位置要先 `translate:none!important` 清掉再量（見 [[mcp-tab-hidden-raf-io]]）。卡片另有 `animate-gallery-card` 的 `translateX(40px)` 進場，量水平也要結算。
- **背景底圖**：= 當前 `CASES[active].image`（crossfade）。遮罩 `linear-gradient(90deg, rgba(0,0,0,.82)→.5)` 壓成模板沉穩深調 + 保左側文字可讀。
- **左：標題區**：只更新模板文字，圖片與動畫不動。**副標膠囊**（`border-white/25`、`rounded-[24px]`、`padding 3/13/3/9`、金點 + `our gallery` 15/ls1/uppercase）+ 大標（`Interior design`＝模板 Home Three 逐字；桌面 **110/100**、tablet-extra `76/90`、tablet `42/50`、mobile `40/45`、capitalize）+ 原版段落 `Lorem ipsum dolor sit amet consectetur. Magna nunc porttitor convallis faucibus laoreet.`（白色、18/24、寬 378）+ **CTA 按鈕**（見下）。
- **CTA 按鈕 — 依主題原始碼 `antra-elementor-button`**（`elementor.css` `.elementor-price-table__button` 真值）：透明底、`border 1px rgba(159,159,164,.64)`、`rounded-full`、`padding 7/7/7/30`、字 **15px/weight400/capitalize**、`transition .5s`；圖示圈 **40×40** 金底白箭頭（lucide `ArrowRight` `w-5`=20）、**預設 `-rotate-45`**（↗）。**hover**：整顆填金（`bg`+`border`=`#C9AA79`）、圖示 `group-hover/cta:rotate-0`（→）。文字用「查看所有案例」；模板淺底字深、本區深底故**字用白**。⚠ 尺寸取**原始碼**非量網頁（demo root 20px 會放大成 18.75/45，見門市案例區備註）。
- **右：2 張卡**：`w-[330px] h-[360px] rounded-3xl`（沿用模板卡尺寸）、gap 30；右側留白處露出背景主圖。**卡片高度受限於 956 + y388 起點，故為 360（非早期的 610）**；要更高卡片就得把 section 拉高過模板 956。卡片 hover：陰影加深 `shadow-[0_32px_80px_-8px_rgba(0,0,0,.7)]` + 圖片 `group-hover/card:scale-[1.06]`（`overflow-hidden` 裁切）。
- **箭頭**：模板位置 —— 卡片**下方左側**（`mt-[40px]`、42×42 圓框、`border-white/25`、透明底、lucide `ArrowLeft/ArrowRight`）控制聯動 `prev/next`。
- **內容 = 3 則門市案例**：`CASES` 僅保留圖片 `public/store-cases/case{1,2,3}.jpg`（來源 `影像/門市案例`）；背景與兩張卡的聯動、4 秒自動輪播、滑動及 hover 動畫均未更動。放在 `App.tsx` 產品區之後。

## What We Do — Antra Home Six 版型

`WhatWeDoSection.tsx`：複刻 Home Six 的「What we do」兩欄區（淺色白底、顯示字用 Cal Sans、內文用 Golos Text、模板金 `#CAA05C`）。右欄影片為 SAKURA 額外功能，因此保留；其餘文字、欄寬、背景裝飾與響應式間距依 Home 6 instance `f0420ee`。

- **Section / 欄位**：桌面 padding `120px 30px 115px`、tablet-extra `100px 30px`、tablet `80px 30px`、mobile `60px 15px`；內容版心 1410px。桌面以 `51fr / 49.5fr` 還原 51%／49.5% 欄比與 90px gap，1024–1199 gap 30px，窄版單欄。
- **左欄（依主題原始碼對齊模板）**：
  - **副標膠囊**：Cal Sans `12/22`、tracking 1、uppercase；`rounded-[24px]` + `border rgba(114,114,114,.18)` + `padding 3/13/3/10` + 6px 金點。副標至大標 20px，整個 heading widget 至清單 40px。
  - **雙色大標**：Cal Sans 400；桌面 `60/64`、寬手機 `45/50`、手機 `30/35`；最大寬 670px，自然換行、不使用手動 `<br>`。文字為「SAKURA has ⟨created exceptional⟩ architectural designs.」，模板原品牌 Antra 僅替換成 SAKURA。
  - **打勾清單**：純金 `Check` 19px、無圓底；字體已由錯誤的 Golos Text 修正為模板 Cal Sans 400 `18/24`，icon/text gap 7px，每列上下 16px並保留分隔線。
  - **段落**：Golos Text `16/24 #59585D`、最大寬 645px；桌面 margin `29px 0 50px`，窄版 `30px 0` 並置中。
  - **CTA**：依「只同步英文、中文內容不動」保留 `櫻花優勢`；外觀精確採 antra `elementor-button-default` 的 `padding 9/9/9/30`、icon gap 8px、字 15px、盒高 60px、金圓 40px，箭頭預設 `-45deg`，hover 填金並轉正。
- **右欄影片區（刻意保留差異）**：Home 6 原版是 `h6-image-5.jpg`＋`h6-image-4.jpg` 兩張疊圖；本專案依「額外功能與動態不移除」保留 16:9 影片、hover 與 Reveal。欄位維持模板 49.5% 結構，並依視覺回饋改為與左欄內容垂直置中，避免影片貼上造成下方留白失衡。
  - **播放鈕＝模板 icon／效果 + 使用者指定正圓**：改用模板原生 `antra-icon-play-fill`（資產 `public/fonts/antra-icon-1.0.12.woff2`），不再用 Lucide `Play`。外型依使用者覆寫成正圓：桌面 `137×137`、768–1199 `77×77`、窄版 `87×87`；icon 分別為 40px／35px／40px，保留原本的 bottom margin。
  - **玻璃／雷達動畫**：wrapper 與 `::before` 均為 `1px rgba(255,255,255,.11)`、radius 50%；`::before` 為白色 36%、opacity .95、`backdrop-filter: blur(29px)`；`::after` 為 1px 白色雷達圈，使用模板 `lexus-scale` 的 2 秒無限動畫（scale `1→1.3`、opacity `1→0`）。移除原本錯誤的 `animate-ping` 與 hover 放大。
- **背景右下半透明建築圖 = 模板原圖 `h6-bg-3.png`**（`public/decor/h6-bg-3.png`，821×520）：恢復原始 821px 寬、`bottom right / no-repeat / auto` 視覺，PNG 自帶透明度；保留既有 `.wwd-blueprint` 輕微視差。
- 影片來源未定：poster 為佔位、播放鈕 `onClick` 尚未接（待提供 YouTube 連結或影片檔即可接 lightbox/iframe）。What We Do 英文已改為 Home 6 原文；CTA 中文依內容保留規則維持「櫻花優勢」。放在 `App.tsx` 圖庫區之後。

### What We Do 瀏覽器驗收（2026-07-17）

- **字型載入**：`document.fonts.ready` 後，Cal Sans 60px／18px 與 Golos Text 16px 的 `document.fonts.check()` 均為 `true`，不是只有 CSS family 名稱正確、實際卻落到 fallback。
- **1512×956**：section padding `120px 30px 115px`、版心 1410px、欄寬 `669.844px / 650.148px`、gap 90px；h2 實算 Cal Sans 400 `60/64`，高度 192px（自然三行）；CTA 內文實算 15px。兩欄 `align-items:center` 後，影片相對 section 的上／下留白為 `257.65px / 252.65px`，視覺已垂直置中且無水平溢位。
- **播放鈕實測**：依使用者指定，1512px 為正圓 `137×137`、icon 40px、margin-bottom 8px；1024px 為正圓 `77×77`、icon 35px；390px 為正圓 `87×87`、icon 40px。三斷點均無水平溢位；`antra-icon` 字型載入成功，`::after` transform 取樣有持續變化，確認雷達動畫不是只有宣告但未執行。
- **1024×768**：section padding `100px 30px`、欄寬 `473.969px / 460.031px`、gap 30px；h2 仍為模板桌面值 `60/64`；無水平溢位。
- **390×844**：section padding `60px 15px`、單欄且 gap 30px；h2 Cal Sans 400 `30/35`、eyebrow Cal Sans `12/22` + 1px tracking、清單 Cal Sans `18/24`、段落 Golos Text `16/24`、CTA 15px；垂直置中設定不改變單欄順序，無水平溢位。
- **主控台**：本 section 無 error／warning；僅既有 Google Maps 的 async 載入與舊 Marker API 兩則 warning，屬明確排除、不在本次 What We Do 修改範圍。
- **來源與限制**：數值以已購模板 `antra/dummy-data/homepage/home-6.xml`、`antra/assets/css/base/elementor.css` 與原始 `h6-bg-3.png` 為準。模板 demo 網域在目前瀏覽器環境被政策阻擋，購買包也沒有這一段的完整頁截圖，所以已完成原始碼數值＋本機實際渲染驗收，但無法宣稱做過來源截圖的逐像素疊圖；若補一張模板該區截圖，可再做最後視覺差分。

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
- **固定頁首（sticky）**：`StickyHeader.tsx` 直接以 `position:fixed; inset-inline:0; top:0` 渲染原生滿寬 Header，不再套縮放；`App.tsx` 保留 `HEADER_H`(72px) spacer。手機漢堡／accordion 抽屜與桌面 mega-menu 均保留。

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
