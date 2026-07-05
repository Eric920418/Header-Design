
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
- **凍結斷點到桌面版**（`globals.css` 的 `@theme`）：把 Tailwind `--breakpoint-sm~2xl` 設成極小遞增值（`1px`~`5px`），使 `sm:/md:/lg:` 變體**全部無條件恆生效**（編譯出的 utility 不帶 media query）→ 全站在**任何 viewport 都渲染桌面版外觀**（不受真實 viewport 影響）。這是關鍵：否則手機上 media query 會渲染手機版再被縮放，變「縮小的手機版」。
- **配套**：`HeroSection` 由 `height:100dvh` 改**固定 `850px`**（`dvh` 不會被 scale 等比帶動）；`App` 根移除 `min-h-screen`/`pb-14`；`body { overflow-x: hidden }`；still-used 的 `--store-map-h`/`--hero-brand-h` 釘死桌面值。
- **副作用**：凍結成桌面後**已無手機版概念**——`FloatingButtons` 的手機底部固定列（`flex lg:hidden`）與桌面軌道（`hidden`）**皆不顯示**；手機上字會等比變小（可雙指放大）。要保留快捷鈕就把桌面軌道 `hidden`→`flex` 開回。
- **驗證**：拖動視窗寬 / DevTools 模擬 375~3840px，版面完全不重排、無水平捲軸；模擬 605px（scale 0.4）實測仍渲染完整桌面版、`scrollWidth === innerWidth`。

## 間距與文字排版 — 依 Antra 模板實測、零誤差

所有 section 的間距/尺寸/**字級**已對齊 **Antra demo 實測值**（@1512 視窗 computed style，localhost 逐項驗收 0px 誤差）。此規範**取代**先前「section py 上限 20」的暫行規則。

**文字排版 token**（size/line-height/letter-spacing/text-transform 照模板；**字重不照抄**——模板字重 400 是因其自帶裝飾字體、400 已顯粗，我們依全域規則維持系統字，照抄 400 會視覺過細，故字重維持現狀）：

| 角色 | 值 |
|---|---|
| Section h2 | `text-[60px] leading-[64px]`（Gallery 特例 `text-[75px] leading-[80px]`） |
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
| Section 大標 h2 | `text-[60px] leading-[64px]`（Gallery 特例：`text-[75px] leading-[80px]`） |
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

`HeroSection.tsx` 的 Hero 採用 Antra 模板 Home Six 的版型（僅借版型/構圖，**色系與字型沿用原站**：金色 `#C4A574`、系統字型，未引入模板字體）。

- **滿螢幕高**：Hero 高度為 `100dvh`（用 `dvh` 避免手機網址列造成跳動）。
- **滿寬**：`FloatingButtons` 桌面版改為 `fixed` 浮動欄、不再佔用 75px 軌道，主內容因此滿寬。
- **構成**：全出血深色大圖 + 左對齊金點 eyebrow + 雙色大標題（白/金交錯）+ 副標 + 左下圓形按鈕（`Discover More`）+ 底部半透明金色浮水印（`SAKURA KITCHEN`）。**文案為英文佔位**（大標 `We Shape / Inspiring Spaces`，兩行兩色；沿用 Antra Home Six 語彙），待正式內容替換。
- **左側「品牌系列」伸縮抽屜（桌面）**：左緣一個玻璃把手（`ChevronRight` + 直排「品牌系列」，用 `.writing-vertical`），點擊 `open` state 切換。抽屜面板 `w-0 ↔ w-[190px]` 伸縮淡入，列出**品牌系列 8 個中文名**（`SERIES`：巧域／潮派／童樂／君璽／臻美／大廚／鄉村／閣樂廚房；Basic+ / AI kitchen 無中文故略），hover 顯示金色左邊條 + 金字。**「不蓋過主視覺」的做法**：展開時把**內容層（標題/副標，`translateX(200px)`）、左下圓鈕（同 200px）、底部浮水印（`translateX(250px)`）**一起右推、讓出左側空間（皆 `transition 500ms`）。收合時只剩把手在左緣、不佔畫面。**手機不顯示**此抽屜（`hidden lg:flex`），故不觸發位移。
- **品牌帶（採 Antra Home Four 版型）**：Hero 下方改為淺色背景（`#f6f6f6`）+ 一排灰階 inline SVG（`BrandLogo` 元件，icon + 文字、hover 轉金）。目前為 6 個設計風格標籤（現代風／輕奢風／北歐風／工業風／美式風／鄉村風），皆為佔位，待正式 logo/圖示替換。高度沿用 `--hero-brand-h`（64/76/88px）；容器用 `flex-wrap + minHeight`，桌面一排、手機自動換行。
- **Gallery 已移除**：原本 Hero 下方的圖庫展示（大圖 + 縮圖）已拿掉，改由 `ProjectSection`（專案輪播）取代，見下方 Section 2。

## Section 2（專案輪播）— Antra Home Six 精準複刻

`ProjectSection.tsx`：精準複刻 Home Six 的 `antra-project`「project-style-4」（僅字型沿用原站系統字，其餘結構/尺寸/行為照模板）。

- **取代**了原本 `HeroSection` 內的 Gallery（大圖 + 縮圖展示）；放在 `App.tsx` 的 Hero 之後。
- **無標題區**：模板此 widget 只有卡片，沒有 heading/箭頭。
- **卡片**：378×880 直式、底部黑色漸層 scrim；**左上膠囊放中文名、底部同時放英文大標 + 中文副標**（`STYLES` 資料；Basic+/AI 無中文則膠囊與底部中文都不顯示、只留英文）。中文在膠囊與底部各出現一次（依需求兩處都要有中文）。
- **hover 伸縮**：卡片寬度 `×1.5`（`378→567px`，固定高度只變寬），橫式廚房圖靜態裁成直切片、hover 變寬露出更多；EN 標題 hover 轉金（`#C4A574`）。
- **捲動 + 自動輪播**：`embla-carousel-react`（`loop:true` + `dragFree`）。**自動輪播**：`setInterval` 每 3.5s 呼叫 `emblaApi.scrollNext()`；滑鼠移入輪播（`rootNode` 的 `mouseenter`）以 `pausedRef` 暫停、移出（`mouseleave`）恢復。仍可手動拖曳;**拖曳時（`pointerDown`）以 `dragging` state 暫停 hover 變寬**，否則卡片一碰就展開會把拖曳打斷（拖不動）。無箭頭。
- **內容 = 10 種廚房風格**（真圖）：Basic+ / AI kitchen（僅英文）、Clever 巧域廚房 / Loft Chic 潮派廚房 / Joyful 童樂廚房 / premium 君璽廚房 / Elegant 臻美廚房 / Chef 大廚廚房 / Country 鄉村廚房 / Harmony 閣樂廚房。圖片放在 `public/kitchen-styles/*.jpg`（來源 `Downloads/首頁用圖/品牌系列x10`；Clever 已縮圖）。

## 價目表（Pricing）— Antra Pricing 忠實複刻

`PricingSection.tsx`（原 `ProductsSection` 已還原；此區為 **Antra 模板 Pricing 區 100% 複刻**，只把大標改成 `Design your space, know the cost`，並保留底部跑馬燈）。金色沿用 `#C4A574`（模板為 `#CAA05C`，依全域「色系不改」規則）。

- **標題列**：eyebrow `● our pricing plans`（左，`w-1/3`）+ 雙色大標 `Design your ⟨space, know⟩ the cost`（60/64 capitalize，右）+ 2 個裝飾小箭頭 SVG（絕對定位、桌面顯示）。
- **三欄（`grid-cols-3 gap-[30px]`，各 450、`min-h-[673px]`）**：
  - **欄1 深色標語卡**：暗色室內圖 + 漸層遮罩 + `Your dreams, ⟨our mission, let's⟩ make it happen.`（36/44）。
  - **欄2 Basic Plan / 欄3 Blueprint Plan**（照模板原文）：標題 45/50 → 副標 20/30(`#59585d`) → **價格 `$` 小 + 數字 100px 金 + `/ Per Month` 20/24** → **金勾清單**（`Check` 24px 金、每項 20/36）→ `Get Started Now` 膠囊按鈕（高 ~61、`pl-30 pr-7 py-7` + 金圓 `ArrowUpRight`）；**卡底建築線稿浮水印** `public/pricing/pricing-banner-2.png`（absolute，來源 demo 授權素材）。
- **跑馬燈已移出本區**：抽成獨立元件 `MarqueeBand.tsx`，放在 `App.tsx` **頁面最底部（Footer 之上）**——「kitchen product」無限捲動（`@keyframes marquee` + `background-clip:text` 漸層，定義於 `globals.css`）。
- **按鈕 hover（依模板實測）**：整顆膠囊填金 `#C4A574` + 文字轉白 + 邊框金（0.5s），同時金圓箭頭 45° 旋轉。
- 內容為模板佔位英文（$99/$169…）依「100% 複製」照抄，連結 `#`，待正式文案；模板背景裝飾圖 `pricing-background-1.jpg`（很淡、demo 上該 URL 失效）暫略。放 `App.tsx` 專案輪播之後。

## 門市案例（Gallery）— Antra Home Three 版型

`GallerySection.tsx`：複刻 Home Three 的 `antra-image-carousel`（字型沿用原站，金色 `#C4A574`），內容改為 **SAKURA 門市案例**。

- **聯動輪播（疊層構圖）**：滿版案例照當背景 = 目前主圖(#1)，右邊固定**只 2 張加大卡片** = 下兩張(#2、#3)。前進時背景與兩卡一起輪替（背景交叉淡入、卡片 `animate-gallery-card` 滑入）。以 `useState(active)` 驅動，非 embla。
- **左：標題區**（~440px）：金點 eyebrow（`門市案例`）+ 巨大白色雙行大標（`Kitchen Design`）+ **隨主圖聯動的案例說明文字**（`CASES[active].caption`）+ **CTA 按鈕**（`查看所有案例` + 金色 `ArrowUpRight` 圓圈，深底版：白字白框、hover 邊框轉金、箭頭旋轉）+ 左右箭頭。
- **右：2 張卡**：圓角 24px（`basis-[450px]`、`aspect-[45/61]`=450×610、30px 間距，依模板實測）。
- **互動**：箭頭 / 每 4s 自動前進（滑入暫停）/ 指標拖曳（`onPointerDown/Up`）切換。
- **內容 = 3 則門市案例**：`CASES`（`{image, caption}`）；圖片 `public/store-cases/case{1,2,3}.jpg`（來源 `影像/門市案例`）。案例1 文案「袁艾菲與老公結婚二周年甜蜜獻禮」為正式；案例2/3 文案為**佔位**待替換。CTA 連結 `#` 佔位。放在 `App.tsx` 產品區之後。

## What We Do — Antra Home Six 版型

`WhatWeDoSection.tsx`：複刻 Home Six 的「What we do」兩欄區（淺色白底、字型沿用原站、金色 `#C4A574`）。

- **左欄**：膠囊 eyebrow（`what we do`）+ 雙色大標 + 金色打勾清單（3 項、含上下分隔線）+ 描述 + 「櫻花優勢」膠囊按鈕。
- **CTA 依模板（「首頁 Section 說明.pptx」slide 1 品牌承諾）**：箭頭圓改為**外框圓 + 內箭頭**，hover 時填金 `#C4A574` + 邊框轉金 + 字轉白 + 箭頭右移（`ArrowRight`，`transition-all`）。
- **右欄影片區**：**16:9 影片區塊**（`aspect-video`，圓角 24px + 陰影 + 黑底）：縮圖 poster（`VIDEO_POSTER`）鋪滿 + 置中主色金圓播放鈕（`Play`），播放鈕加**脈動光圈**（`animate-ping`）與 hover 放大；影片卡 hover 依比例微放大（`hover:scale-[1.02]`）。
- **壓底圖**：影片區下方疊一張**淡建築藍圖**（`BLUEPRINT`，`opacity-[0.12] grayscale`、絕對定位延伸至影片下方、`pointer-events-none`，仿 Home One）——**佔位圖，待換正式線稿**。
- 影片來源未定：poster 為佔位、播放鈕 `onClick` 尚未接（待提供 YouTube 連結或影片檔即可接 lightbox/iframe）。文字為佔位。放在 `App.tsx` 圖庫區之後。

## 門市查詢（Store Locations）— Antra Contact Us 風格 + 可用地圖搜尋

`StoreLocationSection.tsx`：套 Antra「Contact Us」視覺（淺灰底 `#f6f6f6`、膠囊 eyebrow、雙色大標、白色圓角卡片、金色 `#C4A574`），並把原本的空佔位地圖與無效搜尋**做成真的能用**：

- **標題版型（依「首頁 Section 說明.pptx」slide 2 門市地圖）**：與 `PricingSection` 同款**分欄標題**——十字裝飾線（橫線+直線+端點箭頭，`hidden lg:block` 絕對定位）+ eyebrow `get in touch`（左 424px 欄）+ 大標推到右邊 `Have A Project In ⟨Store Locator⟩ It Happen`（`Store Locator` 金色）。**非**舊版的靠左堆疊。
- **左欄（寬，~62%）**：真 **Google Maps embed iframe**（`src = https://maps.google.com/maps?q=<地址>&output=embed`，高度 `var(--store-map-h)`），選取/篩選門市時自動定位。
- **右欄（窄）**：`我的位置`（`LocateFixed` 金色準星）+ **`選擇區域` / `選擇城市` 兩個下拉**（`appearance-none` + 疊自訂 `ChevronDown`）；下方門市列表卡片——第一行區域灰底 pill + 店名，第二行 `MapPin` 地址（左）+ **金色電話（右靠同行）**，字級 14；選中 → 金色底白字。
- **級聯篩選**：`region` / `city` 兩個 state 驅動；選區域自動清空城市、城市下拉未選區域時 disabled（`REGIONS` 提供五大區→縣市對照）。`filtered = STORES.filter(區域符合 && 城市符合)`；選取門市若被濾掉自動退回第一筆可見門市；該區無資料顯示「此區域尚無門市資料」。
- **門市資料**：pptx 真實資料共 5 間（承德 / 石牌 / 民權 / 中山南京 / 八德，皆北部/臺北市，含真地址電話）；其他區暫無資料，補上即可用。

## Header — SAKURA 巨型選單（mega-menu）

`Header.tsx`：單一金色 bar、**中央 logo**、左右各一組導覽，自訂 Tailwind 實作（未用 Radix，與全站一致）。

- **背景／字型／字級對齊參考站 `sakura-kitchenlife.com.tw`**（實測 `.l-header`／`.l-nav__item`，常數定義於 `Header.tsx` 頂部）：背景漸層 `linear-gradient(90deg, #B79258 20%, #D2B587)`（`HEADER_GRADIENT`）；字型堆疊 `"Noto Sans TC","PingFang TC","Microsoft JhengHei",微軟正黑體`（`HEADER_FONT`，套在 `<header>` 上向下繼承，**未外連 Google Fonts**、Mac 上 fallback 至 PingFang TC）；導覽字級 `text-[15px]`、weight 400、字色純白。
- **間距對齊參考站**：bar 容器改 `px-5 lg:px-12`（20/48px）且**滿寬**（移除原 `max-w-7xl mx-auto`），對齊參考站左右邊距 48px；搜尋展開列同步 `px-5 lg:px-12`。導覽項文字間距 28px（既有 `px-3`+`gap-1` 已等於 28px，與參考站一致）。bar 高度仍維持 `72px`（未動，因 mega-menu 以 `top-[72px]` 定位）。**注意**：參考站為「logo 靠左＋導覽靠右」的 space-between 版型，本專案為「導覽左半｜中央 logo｜導覽右半」置中版型（README 明載之自訂設計），故僅間距數值對齊，整體佈局結構刻意不同。

- **導覽資料**：`NAV_LEFT` / `NAV_RIGHT` config 陣列，每項 `{ label, children?, href?, external?, mega?, megaCatalog? }`。有 `mega` → 圖片式大選單；有 `children` → 文字下拉；只有 `href` → 連結（`external` 用 `target="_blank"`，如櫻花集團連 sakura.com.tw）。
- **桌面（`lg+`）**：三段 flex（左群 / logo / 右群 + 🔍）；有子選單者 `group relative` + `group-hover` 展開白色下拉（子項 hover 轉金、`ChevronDown` 旋轉；`pt-2` 橋接避免 hover 中斷）。
- **廚房產品 → 圖片式 mega-menu（仿 Antra Home 選單）**：hover 從 header 下方**淡入展開滿寬白色面板**（`opacity`+`visibility` 300ms；面板 `absolute left-0 right-0 top-[72px]`，定位參考 `header`，故滿寬）。內含**三張品牌大圖卡**（SAKURA 廚電 / SVAGO / TEKA，`public/products/*.jpg`，來源 `影像/廚房產品`）：`aspect-[4/3]` 圓角 + 底部漸層 + 白字標籤，卡片 hover 圖片放大、標籤轉金；面板底部 `廚房商品型錄 →` 文字連結。觸發鈕撐滿 `h-[72px]` 讓面板無縫貼合、hover 不中斷。手機版則把三品牌 + 型錄當 accordion 子項展開。
- **手機（`< lg`）**：logo + 🔍 + 漢堡；漢堡開白色抽屜，主項點擊 **accordion 展開**子選單（`useState expanded`），純連結直接點。
- **搜尋**：🔍 切換 `openSearch`，在 bar 下方展開白色圓角搜尋輸入框（前端介面，功能待接）。
- header 維持**靜態**（非 sticky）；子項 href 為佔位 `#`；設計圖「SUKURA」視為 SAKURA 錯字已更正。

## 頁尾（Footer）— 黑底 + 品牌金 logo

`Footer.tsx`：依設計圖改為**純黑底**、金色 SAKURA KITCHEN logo（僅英文）、版權列、下方一排導覽。

- **logo**：`public/sakura-logo-gold.png`。原始素材 `Logo/櫻花整體廚房_logo-07_0.png` 是「金色 SAKURA KITCHEN ｜ 灰色 櫻花整體廚房」，依需求**用 ImageMagick 裁掉右側中文與分隔線、只留左側金色英文**（`-crop` + `-trim`，成品 20K）。
- **版權**：`Copyright © Taiwan Sakura Corporation. All rights reserved`（設計圖原文 "All right reserved" 屬文法錯字，已更正為 rights）。
- **導覽列**（分隔線下、桌面 `justify-between`）：
  - 左：文字連結 **網站地圖**（`#` 佔位）、**隱私權政策**（→ `/privacy.html`）。
  - 右：icon 連結 **數位展板**（`/icons/digital-board.png`）、**YouTube**（`/icons/youtube.png`）。兩者皆白色去背 PNG（來源 `Icon/展板icon.png`、`YTicon.png`），黑底顯白；`href` 目前為 `#` 佔位（無官方連結，未捏造）。
- **手機**：`pb-28` 預留高度，避免被 `FloatingButtons` 底部固定列蓋住。

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
