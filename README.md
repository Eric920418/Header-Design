
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

## 2026-07-30 Antra 原生 RWD 寬螢幕修正（最新真值）

本節取代 README 內較早的「Hero 1200+ 單一桌面版」說明。網站仍不使用 `transform: scale()` 或 CSS `zoom`；100 吋是物理尺寸，不是 CSS 條件，提案現場應維持瀏覽器 zoom 100%，再由實際 CSS viewport 套用原生 RWD。

- **根因**：舊 Hero 在所有寬螢幕都固定 `left:30px`，但 Antra Home 6 的上半內容使用 `1584px` 置中版心、下半 CTA／浮水印使用 `1585px` 置中版心。1512px 時兩者剛好都接近 30px，故 14 吋 MacBook 看不出問題；1920px 以上模板會開始置中，舊實作卻繼續黏左。
- **Hero 版心**：上層 `.hero-template-top` 為 `max-width:1584px`，下層 `.hero-template-bottom` 為 `max-width:1585px`；手機寬度為 `viewport - 30px`，768px 以上為 `viewport - 60px`，超過最大寬後自動水平置中。標題與 Start Project 實測 x 座標為 1512=`30`、1920=`168`、2560=`488`、3840=`1128`。
- **Kitchen 浮水印**：1201px 以上沿用模板下半 Flex 結構：120px CTA 後接 `88.7%` 浮水印欄，文字以 `right:-1px` 貼齊，不再使用 `right:4.83vw`。因本站文字是 `Kitchen`、模板是 `Interior`，左緣會因字寬不同，但兩者右緣與版心結構一致。
- **原生區間**：模板啟用 Elementor `767 / 880 / 1024 / 1200 / 1366px` 斷點；Hero 實際高度為 `≤767:587px`、`768–880:489px`、`881–1024:719px`、`1025–1200:858px`、`≥1201:952px`。標題、分隔線、CTA、描述與浮水印同步使用相同區間，不再混用 1024 與 1200 的半套桌面值。
- **全站容器稽核**：4K viewport 下 Services／品牌承諾／Footer 仍為 `1410px` 置中（x=1215），門市查詢為 `1512px` 置中（x=1164），門市案例與 Project 輪播維持 full-bleed。沒有為 4K 放大固定字級或卡片，避免違反模板原本的留白比例。
- **溢出檢查**：390、768、1025、1512、1920、2560、3840px 均為 `scrollWidth === innerWidth`；逐元素掃描亦無未被合法 overflow 容器裁切的越界節點。Header mega-menu、品牌系列抽屜、右側浮動按鈕與地圖不參與版心縮放。
- **互動回歸**：1512px 品牌系列抽屜展開後標題 x=`30→230`；Header 廚房產品 mega-menu 維持滿版面板與 1200px 內容版心；右側浮動按鈕在頁尾停於 viewport top=`112px`，與 60px Header 保留 52px。
- **視覺證據**：`/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/hero-rwd-local-1920.png`、`hero-rwd-local-3840.png`、`hero-rwd-template-1920.png`。

### 2026-07-30 Hero 下方品牌輪播 RWD（逐 Section 驗收 1）

- **來源真值**：已購 Antra `home-4.xml` 的 Brand 容器。Section 本身維持 full-width 與 `15/30px` 安全邊距，輪播 viewport 新增 `max-width:1770px` 置中內框；不把 Hero 的 1584px 版心誤套到此區。
- **鎖定差異**：反向步進、4 秒自動播放、滑鼠移入暫停、拖曳後停止自動播放、十張 Hover 預覽、預覽浮在 Hero 上方、雙層文字 Hover、62px 高度與 120px gap 全部維持 `95fd118` 行為。
- **斷點規則**：`390 / 768 / 880 / 1200 / 1367px` 依序顯示 `1 / 3 / 4 / 5 / 6` 欄；小於 1770px 版心時的尺寸與位置完全不變。寬螢幕只增加兩側留白，不再把單格隨 viewport 無限制拉寬。
- **修正前基準**：1512px viewport 為 `1452px`、單格 `142px`；3840px viewport 被錯誤拉到 `3780px`、單格 `530px`。修正後 1512px 仍為 `1452px / 142px`，3840px 收斂為 `1770px / 195px` 並水平置中。
- **QA 結果**：`390 / 767 / 768 / 880 / 881 / 1024 / 1025 / 1200 / 1201 / 1366 / 1367 / 1512 / 1920 / 2560 / 3840px` 全數通過。1512px 修改前後 PNG 的 SHA-256 完全相同，證明既有構圖 0 位移；1920／2560／3840px 內框分別為 `x=75 / 395 / 1035`、寬度均為 `1770px`、單格約 `195px`。
- **互動回歸**：反向自動播放有前進、Hover 可暫停、240×158px 預覽正常顯示並輪換圖片、拖曳後不再自動播放；`prefers-reduced-motion` 同時停止主輪播與預覽換圖。所有斷點均為 `scrollWidth === clientWidth`，合法超出項目都有輪播裁切祖先，無 Vite overlay、console error 或 page error。
- **視覺證據**：同目錄 `brand-marquee-before-{1512,3840}.png` 與 `brand-marquee-after-{1512,3840}.png`。

## 2026-07-21 首頁素材與版面更新（最新狀態）

本節是目前首頁的最新實作真值；如與下方 2026-07-17 的歷史 Design QA 記錄衝突，以本節為準。新素材統一放在 `public/home-2026/`，不在執行時引用 Downloads 路徑。

- **Header Logo / mega-menu**：導覽列 Logo 改用 Footer 同一份橫式 `public/home-2026/footer/sakura-kitchen.png`，保持原始比例；Flex 版面框仍為 ≥1280px `260px`、1024–1279px `160px`、<1024px `184px`，但 Logo 圖片以 `scale(1.25)` 視覺放大為約 `325 / 200 / 230px`。縮放不參與 Flex 尺寸計算，因此不擠壓左右導覽，也不改變固定 `60px` Header 高度；手機以左側為縮放原點避免貼出畫面。因素材金色與 Header 金色漸層對比不足，僅在 Header 以 CSS 轉為白色，Footer 原始金色不受影響。正常桌面導覽自 `1024px` 顯示，所有桌面寬度均使用 `15px / 15px / 400`，1024–1279px 只縮小 item 左右 padding，≥1280px 使用官網完整間距；只有 <1024px 使用搜尋＋漢堡 Accordion。白色廚房產品 mega-menu 繼續滿寬，產品內容收進 `max-width:1200px`；SAKURA／SVAGO／TEKA 三個文字標題使用官方 Logo，每個為 `170×50px` 顯示框並與產品圖、「廚房商品型錄」左緣對齊。桌面支援 hover 與鍵盤 focus-within 展開；一般下拉選單的觸發區與 Header 同為 `60px` 高，左側第一項沿左緣、右側項目沿右緣展開，避免 `190px` 選單被 viewport 裁切。新增「設計案例 → 品牌系列」第二層滿寬 mega-menu：左側保留四個原選項，右側以 `5×2` 卡片顯示首頁現有十大系列、正式中英文及圖片；「品牌系列」使用不跳頁的 submenu button，整塊維持同一個 hover/focus 區域，移入圖片不會閃退，圖片卡與「查看全部」才連回首頁 `#kitchen-series`。十大系列資料集中於 `src/data/kitchenStyles.ts`，與 `ProjectSection` 共用，避免 Header 與正文不同步。手機 Accordion 維持原本單層操作。
- **Hero**：使用 `ai-kitchen.jpg → clever-kitchen.jpg → basic-plus.jpg`，每 5 秒換圖；圖片轉場改為 Antra Page 1 Slider Revolution 原始 `slidingoverlaydown / double` 規格：總長 `2000ms`、第一份新圖片 `1333ms`、第二份新圖片延遲 `333ms` 並於 `2000ms` 完成，easing 對應 `power2.inOut`。首次進場三層為模板灰 `#9F9FA4`＋套 `rgba(16,8,1,.46)` 暫時遮罩的新圖＋原色新圖；後續換圖依模板實際週期改為保留上一張完整圖片作底層，再以暗色新圖與原色新圖由上往下覆蓋，過程不再重新露出灰底。最後原色圖片完整覆蓋，不加入整張常駐黑色遮罩；另在圖片轉場之上加入僅覆蓋 Hero 底部 `58%` 的透明至黑色漸層（中段 `rgba(0,0,0,.42)`、底部 `rgba(0,0,0,.86)`），強化 `Kitchen` 浮水印對比但不壓暗上半部主圖。Hero 根節點不再套整區 `fadeInDown`；`prefers-reduced-motion` 停在第一張、隱藏遮罩圖片層並直接顯示原色圖片。h1 與底部巨型字的 `Interior` 均改為 `Kitchen`；h1 在所有斷點固定於 `Inspired` 後換行。桌面左側「品牌系列」伸縮選單改為 viewport fixed，捲離 Hero 後仍固定在左側中線；手機維持隱藏。Start Project 的 120px 玻璃圓尺寸不變，未 hover 時增加 2 秒金色雷達水波，hover 後停止並隱藏。
- **Section eyebrow**：Services／Gallery／WhatWeDo／Store 依序改為「廚房產品／門市案例／品牌承諾／門市查詢」，膠囊尺寸、金點、邊框與動畫不變。
- **廚房產品卡**：順序與編號改為 `01 SAKURA → 02 SVAGO → 03 TEKA`；正式品牌拼字為 `SVAGO`。卡片尺寸、Logo 光學等大、Embla 輪播與 hover 不變。
- **Services 底部 Logo 跑馬燈**：取代舊的 `Kitchen Product` 巨型文字，順序為 SAKURA／TLK／TEKA／SVAGO／SAKURA Home；每格 Logo `170×50px`、左右 margin 各 `70px`、兩組無縫重複。尺寸與間距沿用 SAKURA 官網 Footer，速度依最新需求由官網基準 `20s` 加快為 `16s linear infinite`；背景仍併入 Services 深色 Section，減少動態模式停止動畫。
- **品牌承諾影片**：使用 YouTube `wH374AF9wLI`；初始顯示對應縮圖與模板正圓播放鈕，點擊後在原 16:9 卡片內切換為 autoplay iframe。縮圖或 iframe 載入失敗時，前端顯示完整錯誤理由、影片 ID 與 YouTube 備援連結。
- **Footer**：底部巨型 `footer-sakura.svg` 改為使用者提供的 `public/home-2026/footer/sakura-kitchen.png`；保留原始金色與比例、不降低透明度，所有斷點都水平置中並貼齊 Footer 底部。依最新回饋將總高調整為手機／平板 `390px`、桌面 `600px`；連結與圖示列的 top padding 增加 12px（手機 48px、桌面 60px），整排稍微下移。背景、Copyright 與連結內容不變。
- **門市案例第 6 點**：背景改用 `yuan-aifei.jpg`，右側兩張卡依序使用 `old-house-kitchen.jpg` 與 `custom-kitchen.jpg`；完全移除深色漸層遮罩。右側兩張正方形縮圖維持靠右，尺寸為 1024px `140×140px`、1200px `230×230px`、1280px `280×280px`、1440px 以上 `295×295px`；依尺寸同步上移右欄，避免固定 956px Section 裁掉卡片底部。箭頭位於縮圖左側的剩餘空間水平置中，1280px 暫時收斂控制欄 gap 以保留完整安全距離。每張縮圖本身是可操作按鈕，點擊後直接切換為背景主案例；拖曳、四秒自動播放、hover 與進場動畫維持不變。

依專案文件規範，Design QA 結果繼續記錄在本 `README.md`，不另建第二份 Markdown 文件。

### 2026-07-21 Design QA

- **真值來源**：首頁素材來自 `首頁用圖_2026.07.21`；Logo 跑馬燈以 SAKURA 官網 Footer 為尺寸與間距基準。官網實測為五個 `170×50px` Logo 框、單側 `70px` 間距、`20s linear infinite`；本站依最新速度需求覆寫為 `16s`。
- **四斷點**：在 `390 / 768 / 1024 / 1512px` 驗證，所有尺寸皆為 `scrollWidth === innerWidth`，無水平爆版；Footer Logo 各斷點底部 inset 均為 `0px`，寬度依序為 `360 / 708 / 922 / 1410px`。
- **Header / Hero**：1512px mega-menu 內版心實測 `1200px`，三個品牌 Logo 均為 `170×50px` 且左緣與各欄產品圖一致。Hero 有三張輪播圖、5 秒換圖與 Page 1 的 2 秒三層轉場。首次進場逐幀為「只有灰底 → 上方暗圖／下方灰底 → 上方原圖／中段暗圖／下方灰底 → 完整原圖」；另行等待模板自動換到下一張後確認，後續週期的底層是上一張圖片，不會再次出現灰底。因此本站 `ai-kitchen.jpg → clever-kitchen.jpg` 也保留舊圖在底層，再建立暗色新圖與原色新圖重播，遮罩實測為 `rgba(16,8,1,.46)`；本機在換圖前、換圖開始、雙層交疊及完成四個時間點逐幀複查，底部始終是上一張圖片或已覆蓋的新圖片，沒有灰色閃屏，最終也沒有常駐遮罩。`390 / 768 / 1024 / 1512px` 均為 `scrollWidth === innerWidth`，沒有 Vite error overlay。QA 初次發現 768px 標題單行造成右側裁切，已改為固定於 `Inspired` 後換行，複查通過。
- **內容與互動**：四個中文 eyebrow 已存在；產品卡為 `01 SAKURA → 02 SVAGO → 03 TEKA`。影片初始縮圖及正圓播放鈕正常，點擊後建立 `wH374AF9wLI` autoplay iframe，`allowFullScreen` 與播放權限完整；失敗狀態在卡片內保留完整原因及 YouTube 連結。
- **Footer / 跑馬燈**：官網與本機皆以 `1280×720` 擷取並合併比對；Logo 視覺框、間距與移動節奏一致，本機沿用 Services 深色背景。Footer 新金色 Logo 原色、比例完整、各斷點置中貼底。
- **視覺證據**：集中於 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/`，包含 `home-2026-hero-{390,768,1024,1512}.png`、`home-2026-mega-1512.png`、`home-2026-logo-marquee-768.png`、`home-2026-video-playing-768.png`、`home-2026-footer-768.png` 與 `logo-marquee-comparison-1280.png`。
- **Console**：無本次功能造成的 error。僅保留地圖既有的兩項 warning：Google Maps 建議 `loading=async`，以及傳統 `google.maps.Marker` deprecation；地圖屬明確不動範圍。
- **結論**：首頁素材更新範圍通過；門市案例第 6 點於後續迭代依 `IMG_1251.PNG` 補齊，驗收記錄見下方最新 Gallery Design QA。

### 2026-07-21 Gallery 第 6 點 Design QA

- **來源真值**：`/Users/eric/Downloads/IMG_1251.PNG`；紅框與紅字為尺寸／位置註記，不屬於成品視覺。
- **實作證據**：瀏覽器在 1512px 實測曾顯示 `280×280px`，原因是 Tailwind 產物中 arbitrary `min-[1440px]` 規則被 named `xl` 規則反向覆蓋；同一問題也讓 1440px 的 margin 與 gap 未生效。現已移除這三組互相衝突的 responsive utilities，改由 `globals.css` 依 1024／1200／1280／1440px 順序明確定義 `.gallery-case-card / row / layout`。依兩輪視覺回饋，1440px 以上由 340px、310px 收斂為真正生效的 `295×295px`、`margin-top:260px`、gap 30px。箭頭在左側彈性控制欄內水平置中；縮圖使用原生 `<button>`，具中文 `aria-label` 與鍵盤 focus ring，點擊會以該縮圖的 `caseIndex` 更新主背景。
- **響應式**：390px 卡片仍依可用寬度為約 `147×147px`，768px 上限為 `220×220px`，1024px 為 `140×140px`，1200px 為 `230×230px`，1280px 為 `280×280px`，1440px 以上為 `295×295px`；行動版箭頭位於縮圖下方置中，1024px 起進入左控制欄。
- **圖片與互動**：初始背景為 `yuan-aifei.jpg`，右卡為 `old-house-kitchen.jpg / custom-kitchen.jpg`；圖片均使用原始 JPEG、`object-cover`、無遮罩。實際點擊「下一張」後背景與兩張卡同步切換，拖曳、`3.2s` autoplay、hover 與 Reveal 動畫保留。
- **五項 fidelity**：字型、字級、行高與文案未改；間距與下緣依紅色標註線重排；模板金、按鈕邊框及白字色票未改；三張案例圖皆為提供的原始素材；「門市案例／Interior design／Lorem ipsum／更多設計」內容維持既有版本。
- **合併比對**：來源標註與成品焦點圖位於 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/gallery-comparison-final.png`；完整成品為同目錄 `gallery-locked-initial-1512.png`。初次合併比對未發現 P0／P1／P2 差異，無需第二輪修正。
- **Console**：沒有本次 Gallery 造成的 error；只有明確不動範圍內既有 Google Maps `loading=async` 與 Marker deprecation warnings。
- **文件規則**：依專案規範不新增 `design-qa.md`，本段是唯一 QA 文件位置。
- **final result: passed**

## 全站原生 RWD（已移除 Scale-to-Fit）

整站不再把 1512px 桌面畫布用 `transform: scale()` 壓進小螢幕，而是依真實 viewport 重排。`ScaleToFit.tsx`、`useCanvasScale.ts` 已刪除，`App.tsx` 直接渲染內容；這也避免縮小桌面字造成手機可讀性與點擊區過小。

- **斷點**：Tailwind utilities 繼續使用既有 `sm / md / lg / antra / xl / 2xl`，Hero 的精準幾何則由 `globals.css` 另以 Elementor 原生 `767 / 880 / 1024 / 1200 / 1366px` 區間控制，避免 named breakpoint 無法表達 `881–1024` 與 `1025–1200` 的模板差異。
- **Header**：`StickyHeader` 是真正的 `position:fixed; width:100%`，不再另套 canvas scale；`App` 保留與官網相同的 60px spacer。
- **FloatingButtons**：全斷點依 SAKURA 官網 quick links 維持右側 fixed 直排；頁首時仍為手機底距 70px、`sm+` 底距 36px。新增捲動進度連動：由頁首到頁尾以 `requestAnimationFrame` 線性增加負向 `translateY`，頁尾時整列頂端停在 viewport `112px`，與 60px fixed Header 保留 52px 安全距離。位移會依 viewport 高度與按鈕列實際高度重新計算，短螢幕不會硬撞 Header；`prefers-reduced-motion` 時維持原本固定位置、不做捲動位移。
  - 官網實測規格：手機單顆 `72×72px`（內容 `56×56px`）、`sm+` 單顆 `74×74px`（內容 `58×58px`）、金色 `#B79258`、灰色 `#737373`、金色頂鈕與灰色群組相隔 `20px`、群組使用 `1px` 白色 50% 分隔線；本站保留既有三個文字與目的連結。
- **Hero**：直接對應模板五段原生高度、字級、對齊與座標；1201px 以上再進入 1584／1585px 置中版心。1512 仍是既有桌面比對點，1920／2560／3840 同樣納入正式驗收。
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
| 兩欄 section | 預設模板基準為 `gap-[90px]`；品牌承諾區依最新需求改為文字／影片 `44% / 56%`、桌面 gap 70px，讓影片明顯大於文字欄 |
| 內容型 CTA 膠囊按鈕 | 全站統一鎖定總高 **60px**：`pl-[30px] pr-[9px] py-[9px]`、文字 `15/22px`、gap 8px、內圓 `40×40px`；按鈕與內圓均禁止 flex shrink，窄欄時不縮放、不換行。金色內圓在未 hover 時沿用影片播放鍵的 `2s` 雷達水波；hover 整顆 CTA 後水波立即停止並隱藏 |
| 專案卡（project-style-4） | 378×880、hover 567、標題 `text-[36px]` |
| Gallery 案例卡 | `basis-[450px]` × `aspect-[45/61]` = 450×610、間距 30 |
| 卡片圓角 | `rounded-3xl`(24px) |

- 桌面精準值仍以 1512px 為比對點；手機／平板由各元件的 `md:/lg:` 規則重排，不再縮小桌面畫布。
- Header／FloatingButtons／Footer 維持 SAKURA 自訂設計；Hero 已改為 Antra Home 6 原版視覺。StoreLocation 是自訂功能區，不列入模板還原。

## 響應式設計（原生重排）

採真實斷點策略，透過 Tailwind responsive utilities 與 CSS Custom Properties 實現：

| 層級 | 範圍 | 策略 |
|------|------|------|
| 手機 | ≤767px | 模板 mobile portrait 固定值 |
| 行動橫式 | 768px - 880px | 模板 mobile-extra 固定值 |
| 平板 | 881px - 1024px | 模板 tablet 固定值 |
| 平板橫式 | 1025px - 1200px | 模板 tablet-extra 固定值 |
| 桌面 | ≥1201px | 952px Hero；1584／1585px 版心，寬螢幕自動置中 |

### 技術方案

- **inline style 值**：使用 `globals.css` 中定義的 CSS 變數（如 `var(--hero-h)`），值隨斷點自動切換
- **className 值**：直接使用 Tailwind 響應式前綴（如 `h-[280px] md:h-[380px] lg:h-[450px]`）

### 主要響應式適配

| 組件 | 手機版 | 平板版 | 桌面版 |
|------|--------|--------|--------|
| Header（巨型選單） | logo + 搜尋 + 漢堡；漢堡開 accordion 抽屜 | 同左 | 中央 logo + 左右導覽 + hover 下拉 + 搜尋展開 |
| HeroSection（主視覺） | Antra 390 置中版 | 768–880 置中；881–1024 置中大字 | 1025–1200 平板橫式；1201+ 置中版心桌面版 |
| HeroStyleMarquee | 62px 輪播本體＋上下 12px、1 欄 step carousel | 768=3 欄、880=4 欄；上下 16px | 1200=5 欄、1367+=6 欄；gap 120px、上下 16px |
| FloatingButtons | 右側 `fixed` 直排，頁首底距 70px；隨捲動上移 | 右側 `fixed` 直排，頁首底距 36px；隨捲動上移 | 同左，頁尾頂端停於 112px，不碰 60px Header |
| ProjectSection（10 種廚房風格輪播） | embla 拖曳、卡片較窄 | 拖曳捲動 | 拖曳、卡片 378×880、hover 伸縮露出橫式廚房圖 |
| StoreLocationSection（門市查詢） | 上下堆疊；篩選器兩欄、標籤獨立一列 | 上下堆疊 | `lg`（1024px）起維持原本左右並排；1024–1279px 內部欄位允許重排 |
| Footer（Antra 骨架簡化版） | 390px；連結／icons 上下配置，資訊列下移 | 390px；連結與 icons 分列，資訊列下移 | 600px；資訊區 220px＋版權帶 70px，Logo 完整並貼底 |

## 主視覺（Hero）— Antra Home Six 版型

`HeroSection.tsx` 還原 Antra Home 6 的 `ee91316` Hero，使用模板原圖 `public/hero-antra-home-6.jpg` 與模板色票；同時把使用者原有的「品牌系列」左側伸縮抽屜以功能層疊回 Hero。Header、FloatingButtons 與 StoreLocation 的功能／資料保留；StoreLocation 僅調整響應式安全區與重排斷點。

- **1512px 真值**：section `1512×952`；原圖 `1920×950`、`cover center`；黑色 overlay opacity `0.64`；內容 `left:30 / top:244`。
- **文字**：eyebrow `12/22`、letter-spacing `1px`、實測寬約 204px，外層用 flex 消除 inline baseline 的 0.5px 偏移；h1 `100/110`、letter-spacing `-1px`、寬 850；副文 `18/24/500`、寬 522。模板主金使用原值 `#CAA05C`，不再套 SAKURA CIS `#C9AA79`。
- **下半部**：分隔線 `top:691`；Start Project 圓鈕依 Home 6 實頁在 `390 / 1024 / 1512px` 逐一量測，三個斷點均為 `120×120`（1024px 因 Elementor 欄寬運算顯示 `118.64px`）、桌面 `left:30 / top:750`、背景 `#5C5C5C75`、邊框 `#FFFFFF12`、外層圓角 `200px`、內層圓角 `100px`、`backdrop-filter:blur(58px)`；文字為 Cal Sans `18/24 / 400 / #FFFFFF`，hover 為 `#CAA05C`。本次確認原尺寸正確，修正的是原先偏黑的錯誤背景值與內外圓層級；`Kitchen` 浮水印以 block line-box 固定為 `320/240 / left:426 / top:719 / opacity:.64`。
- **模板動態**：Hero 根節點原有的 Home 6 `fadeInDown` 已由 Page 1 背景 `slidingoverlaydown / double` 取代，避免整個文字與控制項也跟著圖片簾幕位移；內層仍保留標題 `slideInLeft 2s`、圓鈕 `fadeIn 2s delay 900ms`、浮水印 `fadeInUp 2s delay 900ms`。Page 1 真值取自 Slider Revolution `SR7_1_1`：`d=2000 / sd=1333.333 / power2.inOut / south / double`。
- **原生 RWD 實測值**：≤767=`587px` 高、title `30/35`；768–880=`489px` 高、title `50/60`；881–1024=`719px` 高、title `100/110` 置中；1025–1200=`858px` 高、title `100/110` 左對齊；≥1201=`952px` 高並進入 1584／1585px 置中版心。桌面浮水印不再以 `4.83vw` 定位，而是放回模板下半 `88.7%` Flex 欄。
- **自訂功能保留**：桌面左側「品牌系列」把手改為 `fixed left:0 top:50% translateY(-50%) z-index:40`，捲動到其他 Section 仍固定在 viewport 左側；可展開 190px 選單，展開時把手同步右移並沿用原行為把 Hero 文字、圓鈕與浮水印右推。手機版維持隱藏。Hero 下方 `HeroStyleMarquee.tsx` 是獨立品牌輪播 Section。

### Hero 下方品牌輪播 — Antra Home 4 `antra-brand`

- **模板真值**：來源 `home-4.xml` Brand container `4c0bad9`／widget `61788d0`。輪播 viewport 左右 padding：手機 15px、其餘 30px；單列高 62px（模板 SVG 58px + link padding 2px）；項間固定 120px。
- **響應式欄數**：390=1、768=3、880=4、1200=5、1367+=6；slide 寬度使用模板公式 `(viewport - gap × (columns - 1)) / columns`，1512px 時為 142px，起點依序 `30 / 292 / 554 / 816 / 1078 / 1340`。
- **輪播方式**：由原本 40 秒連續 marquee 改為模板的 step carousel：loop、可拖曳／觸控、500ms 級轉場；依最新需求由每 5000ms 加快為每 **4000ms** 反向後退一格（`scrollPrev`），hover 暫停、使用者開始拖曳後停止 autoplay；無箭頭、無 dots。hover 小預覽內的十張圖片亦由 1400ms 加快為 **1100ms**。`prefers-reduced-motion` 下不自動播放。
- **Hover 圖片預覽**：桌面 Hover 或鍵盤 Focus 任一風格項目時，使用 React portal 在該項目上方顯示 `240×156px` 小型深色圓角視窗，因此不受輪播 viewport 的 `overflow-hidden` 裁切，並可跨越區塊邊界浮在 Hero 底部。視窗從目前項目對應索引開始，每 `1400ms` 依序淡換 `public/kitchen-styles/` 現有十張圖片；滑出、失焦、捲動或縮放即關閉。圖片視窗不接收 pointer event，不影響原本拖曳；風格卡目前皆為 `href="#"` 假連結，因此攔截其預設跳頂行為，避免鍵盤或點擊預覽時頁面突然回到頂部。`prefers-reduced-motion` 時停在初始圖片。
- **內容不改**：仍顯示原六組中文、英文與 logo；因模板原件只放 logo，本站額外文字保留在同一個 62px slide 內，不為追求外觀而刪內容。為了讓 6 個原始項目在桌面也能 loop，DOM 建立三組；後兩組 `aria-hidden` 且不進入 tab order。
- **外部位置**：依先前需求保持緊貼 Hero，不套用 Home 4 專屬 Hero 的 `margin-top`（該間距隨 Home 4 Slider 高度而變，不適用目前 Home 6 Hero）；carousel 本身的高度、padding、slide 尺寸與 gap 依模板。
- **區塊留白**：依驗收回饋在輪播本體外增加輕量垂直 padding，手機上下各 12px、768px 以上各 16px；62px 輪播 viewport、slide 尺寸、120px gap 與 Embla 運動參數不變。區塊總高分別為 86px／94px。
- **仍移除的非模板加料**：三張 Unsplash 輪播、Ken Burns、右下輪播指示器；使用者本輪沒有要求恢復。
- **建置修正**：修正 `globals.css` 內會提前結束註解的 `*/` 字樣，避免 Tailwind CSS 最佳化階段出現解析警告；不改變任何視覺樣式。

#### 品牌輪播 Design QA（2026-07-17）

- **Source visual truth**：Antra Home 4 `https://demo2.themelexus.com/antra/home-4/` 的 Brand widget `61788d0`，並以本地主題 `homepage/home-4.xml`、`brand.php`、`elementor-classes.js` 交叉核對設定與運動方式。
- **同尺寸對照圖**：模板 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/brand-reference-1512.png`；本站輪播本體 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/brand-implementation-1512.png`；增加外層留白後 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/brand-spacing-section-1512.png`。
- **版面量測**：輪播 viewport 高度維持 62px；外層 section 手機 86px、768px 以上 94px。390／768／880／1024／1200／1367／1512px 均無水平 overflow。1512px 的 6 個 slide 寬 142px，起點為 `30 / 291.9 / 553.9 / 815.9 / 1077.9 / 1339.9`，與模板 `30 / 292 / 554 / 816 / 1078 / 1340` 的差異僅為瀏覽器次像素顯示。
- **互動驗證**：原始實測為每 5000ms 呼叫 `scrollNext` 前進一格；本站先依需求反轉為 `scrollPrev`，最新再加快為每 **4000ms**，仍維持一格一格 step carousel。loop、拖曳、hover 暫停與拖曳後停止 autoplay 由 Embla event wiring 保留，無箭頭、無 dots。
- **刻意差異**：模板每張只有 logo；本站按「內容都不要改」保留中文與英文，因此單張內部視覺不是模板原 logo-only 組成。輪播高度、欄數、viewport padding、slide 寬、120px gap 與運動規則則已對齊。
- **Console**：本次檢查無 console error；`pnpm build` 通過。

final result: passed

## Footer — Antra Home 6 骨架簡化版

`Footer.tsx` 使用 Antra Home 6 Footer 主體 `6632dbf` 的三段式結構，但依需求刪除模板的訂閱區、地址、電話與多欄選單，只保留原有「網站地圖／隱私權政策」、Copyright、數位展板與 YouTube。

- **模板素材**：使用模板原始 `1920×950` 背景圖，已本地化為 `public/footer-antra-bg.jpg`；外層套用模板同級的 75% 黑色遮罩。
- **結構高度（最新）**：依驗收回饋進一步由手機／平板 420px、桌面 650px 收斂為 **390px / 600px**。上半資訊區維持 220px、版權帶維持 70px，縮減的是版權帶下方的背景／Logo 舞台；內容最大寬 1410px，桌面左右 51px。
- **簡化內容**：左側只放網站地圖與隱私權政策，右側只保留數位展板與 YouTube 圖示；中間版權帶逐字保留 `Copyright © Taiwan Sakura Corporation. All rights reserved`。
- **資訊列下移**：上半區高度不變，內層由手機 `py:36px`、桌面 `py:48px` 改為手機 `pt:48px / pb:24px`、桌面 `pt:60px / pb:24px`；網站地圖、隱私權政策、數位展板與 YouTube 整排往下 12px，但不增加 Footer 總高。
- **Logo 貼底**：目前使用 `public/home-2026/footer/sakura-kitchen.png` 原始金色 PNG，維持原比例、水平置中與 `bottom:0`；總高縮減不改 Logo 寬度或底部定位。

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
- **卡片**：378×880 直式、底部黑色漸層 scrim；依目前核准版本，**左上膠囊放英文系列名、底部放中文大標**，每筆保留中文 `desc`；`Basic+` 上下品牌名相同。
- **hover 效果**：滑到整張卡片時卡片變寬（378→567）並由下淡入該風格描述（`max-h-0 opacity-0 → group-hover:max-h-20 opacity-100`，`transition-all 500ms`）；整卡 Hover 不改標題色。
- **hover 伸縮**：卡片寬度 `×1.5`（`378→567px`，固定高度只變寬），橫式廚房圖靜態裁成直切片、Hover 變寬露出更多；只有游標直接移到中文標題文字時才轉模板金 `#CAA05C`。
- **捲動 + 自動輪播（一格一格步進 / 吸附模式）**：`embla-carousel-react`（`loop:true` + `align:'start'`，**刻意不用 `dragFree`**）。自動輪播依最新需求由每 3.5s 加快為每 **2.8s** `emblaApi.scrollNext()`，仍維持走一格、停一下的步進感；使用者啟用 `prefers-reduced-motion` 時停止自動輪播。**露縫關鍵＝曾用的 `dragFree`**：它讓 `scrollNext` 變慣性滑動、在 `loop` 環繞重定位時對不齊而露縫；改吸附模式後每次精準走一格、於乾淨卡邊界重定位，不露縫。滑鼠移入暫停，移出延遲 560ms 恢復；仍可手動拖曳。
- **移動中「卡間縫隙」殘留防治（次像素）**：實測相鄰卡**排版間隙全 0.00**，故任何殘縫屬**分數像素 transform 合成的髮絲縫**。兩層保險：①`<article>` `w-[calc(100%+2px)] -ml-px`（左右各多蓋 1px、量得重疊 2px，接縫兩側恆被卡片蓋住；卡槽 `.group` 仍 378、不影響 Embla 迴圈總長 10×378=3780）；②輪播 viewport `bg-[#1C1C1D]`（殘縫透出深色而非亮背景，難察）。
- **左右兩側方向箭頭**（源自主題 `style.css` `.antra-swiper-wrapper .elementor-swiper-button` 的 48×48）：`w-12 h-12`(**48×48**) + lucide 箭頭 `w-6`(**24**)、**半透明磨砂**（`bg-white/10 backdrop-blur-md` + `border-white/30` + 白 icon，透出後方廚房照，非實心白）；垂直置中，手機／平板左右各 30px，桌面左箭頭改為 60px，避開固定 40px「品牌系列」把手並保留 20px 安全距離，右箭頭仍為 30px；**hover 金底 `#C9AA79` + 金邊 + 白箭頭**。因 Embla 的 prev/next 表示索引方向而非軌道視覺方向，依最新驗收把 handler 互換：左箭頭呼叫 `scrollNext()`、右箭頭呼叫 `scrollPrev()`，並將 aria-label 改為「向左瀏覽／向右瀏覽」。
- **卡片標題層級**：依最新需求對調雙語位置，左上膠囊改顯示英文系列名，底部 36px 大標改顯示中文名稱；圖片、描述及 hover 動畫不變。`Basic+` 的中英文資料相同，因此上下均維持 `Basic+`。
- **雙層 Hover**：整張卡片 Hover 只觸發卡寬展開及描述淡入，不再連帶改變標題顏色；只有游標直接進入底部中文 `h3` 的實際文字寬度時，標題才由白色轉為模板金 `#CAA05C`。左上英文膠囊與描述維持原色。
- **內容 = 10 種廚房風格**（真圖）：Basic+ / AI kitchen（僅英文）、Clever 巧域廚房 / Loft Chic 潮派廚房 / Joyful 童樂廚房 / premium 君璽廚房 / Elegant 臻美廚房 / Chef 大廚廚房 / Country 鄉村廚房 / Harmony 閣樂廚房。圖片放在 `public/kitchen-styles/*.jpg`（來源 `Downloads/首頁用圖/品牌系列x10`；Clever 已縮圖）。**渲染時複製兩份 `[...STYLES, ...STYLES]`＝20 張**，給 Embla loop 足夠緩衝、避免捲動動畫中接縫來不及補齊而露縫。

### ProjectSection RWD QA（2026-07-30）

- **尺寸鎖定**：15 個寬度 `390、767、768、880、881、1024、1025、1200、1201、1366、1367、1512、1920、2560、3840px` 全數實測。卡片槽在三段分別維持 `280×480`、`340×640`、`378×880px`；1920／2560／3840px 只增加可見卡片數，不放大卡片。
- **Full-bleed / 接縫**：所有寬度 Section 與輪播 viewport 均為 `x=0 / width=viewport`；20 張卡的內容框固定比卡槽寬 2px，相鄰內容量得 `-2px` 重疊。每個斷點皆 `document.scrollWidth === clientWidth`，圖片 0 張破圖，Vite overlay／console／page error 皆為 0。
- **互動**：正常模式 2.8 秒自動前進一格；Hover 展開桌面實測 `378→567px`，整卡 Hover 時中文仍為白色，直接 Hover 中文文字才變 `rgb(202,160,92)`；Hover 停留超過一個播放週期軌道不移動。左右箭頭皆能驅動相反方向，左箭頭桌面位置由 30px 修正為 60px，消除與固定品牌把手的 10px 覆蓋。
- **減少動態**：原實作在 `prefers-reduced-motion: reduce` 仍會自動位移，已改為不建立 autoplay timer；手動拖曳與方向箭頭保留。
- **證據**：1512px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/project-rwd-after-1512.png`；3840px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/project-rwd-after-3840.png`。

## 服務輪播（Our Services）— Antra home-6 `antra-services-list` style-3 複刻

`ServicesSection.tsx`（原 `PricingSection` 已換掉；改為 **Antra 模板 home-6「Our Services」= `antra-services-list` style-3 服務輪播**，照原始碼 `dummy-data/homepage/home-6.xml`、`inc/elementor/widgets/service-list.php` + `assets/css/base/elementor.css` 複刻）。底部 SAKURA 既有跑馬燈 `MarqueeBand` 已併入同一個 Services `<section>`，文案與動畫均未更動。

- **背景與 Section 尺寸**：使用模板原始 `1920×1040` `public/services/h6-bg-2.jpg`，`cover / top center / no-repeat`，疊加黑色 76%。模板的 `backdrop-filter: blur(29px)` 掛在 Section selector，本機亦照此位置設定，不再把 blur 錯掛到 overlay 而模糊背景圖。依使用者指定移除全部 Section top margin；上／左右 padding 沿用 Elementor：手機 `60/15`、平板 `80/30`、1024–1199 `100/30`、≥1200 `125/30`。跑馬燈已併入 Section，因此原 bottom padding 改由跑馬燈前的 96px 間距承接，Section 本身 bottom padding 為 0，讓跑馬燈貼底。
- **標題列**：subtitle 膠囊 `● Our Services` 與大標均為模板白色；桌面左欄 424px、標題寬 769px、`60/64`，手機 `30/35`、寬手機 `45/50`。桌面裝飾完整還原 Elementor 結構：水平線 `502px`＋`deco-horizontal.svg` 尖端、垂直線 `179px`＋`deco-vertical.svg` 尖端，線色 `rgba(255,255,255,.18)`；標題與輪播桌面間距 60px、窄版 30px。
- **服務卡（style-3，照原始碼）**：卡片 `#FFFFFF`、radius 24px、padding 10px；圖片手機高 250px、其餘 310px、radius 24px、hover `scale(1.1)`、薄暗罩 `rgba(0,0,0,.11)`。caption 手機 `20/0/30`、其餘 `30/20/35`；標題手機 `25/30`、桌面 `28/35` Cal Sans，內文 Golos Text `16/24 #9F9FA4`，編號 `30px #E3E3E8`。手機全部圖上字下，較寬斷點才套偶數卡 `column-reverse`。
- **輪播（模板 data-settings 為基礎）**：`embla-carousel-react` `loop`，手機 1 欄、平板／1024 兩欄、≥1200 三欄；30px gap，autoplay 依最新需求由 5000ms 加快為 **4000ms**，hover 暫停、`reduced-motion` 不自動播、可拖曳、無箭頭／點。資料僅保留 SAKURA、SVAGO、TEKA 三張並編號 `01–03`。
- **內容與素材**：僅保留三個已指定品牌的卡片；原模板英文 excerpt 維持不變。品牌標題與產品圖皆本地化至 `public/services/`，破圖仍 fallback `/kitchen-styles/elegant.jpg`。寬版三張卡的圖片位置依最新驗收改為「上／下／上」：01 SAKURA 圖上字下、02 SVAGO 字上圖下、03 TEKA 圖上字下；手機仍統一圖上字下。
- **跑馬燈**：`MarqueeBand`「Kitchen Product」現在位於 Services `<section>` 內，共用 `h6-bg-2.jpg`、黑色 76% overlay 與同一裁切範圍，不再有 `#f6f6f6` 分區。以 96px 間距接在服務卡後，透過負水平 margin 維持全出血，且跑馬燈容器底緣與 Section 底緣相同（bottom gap `0px`）；文字使用模板金 `#CAA05C → transparent`，220px 字級、重複內容與 `animate-marquee` 速度不變。

### Services Design QA（2026-07-17）

- **Source visual truth**：以已購買模板 `/Users/eric/Desktop/Header-Design/antra-full 2/antra/dummy-data/homepage/home-6.xml` 的 Elementor instance、`assets/css/base/elementor.css`，以及原版背景 `public/services/h6-bg-2.jpg`／6 張服務圖／2 個 deco SVG 為唯一基準；直播 demo 網域目前受瀏覽器政策封鎖，未以繞過方式存取。
- **Implementation evidence**：桌面聚焦成品 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/services-section-implementation-1512.png`；原始背景素材／本機成品對照 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/services-page6-source-vs-implementation.png`。
- **Desktop 1512×956**：Services 內容原始區塊保持桌面 top/水平 padding `125px 30px`；併入跑馬燈後 Section 實際高度 `1205px`、外距上 `0`、bottom padding `0`。背景 `top center / cover`、黑色 `.76`，selector 保留 blur `29px`。標題 Cal Sans `60/64`、寬 `769px`；三欄 `33.333%`，卡寬約 `450px`、白底、radius/padding `24/10px`、圖片高 `310px`；標題 `28/35`、內文 Golos Text `16/24 #9F9FA4`。
- **Tablet 1024×768**：外距 `0`、top/水平 padding `100px 30px`、bottom padding `0`；標題 `45/50`、兩欄 `50%`、圖片高 `310px`，偶數卡維持模板上下反轉。
- **Mobile 390×844**：外距 `0`、top/水平 padding `60px 15px`、bottom padding `0`；標題 `30/35`、單欄 `100%`、圖片高 `250px`，所有卡片皆圖上字下；卡標 `25/30`、內文 `16/24`。
- **Interaction / regression**：Embla `loop` 與最新 4000ms autoplay 在三張資料下仍有效；hover 暫停、拖曳與 reduced-motion 保護仍在。品牌 Logo marquee 的 computed animation-name=`marquee`、完整循環 16s，且仍與 Services 為同一個 Section。
- **Browser checks**：1512、1024、390 三種寬度均無水平溢出、素材 natural size 正確、無 console error。logo 改為光學等大後，1512px 的渲染面積為 SVago `136.06×38=5170px²`、TEKA `132.59×39=5171px²`、SAKURA `172.66×28=4835px²`；390px 分別為 `111×31=3441px²`、`108.80×32=3482px²`、`148×24=3552px²`，差異均在約 ±7% 內且比例未變形。其新主圖分別在 1512px 為 `430×310`、390px 為 `340×250`。桌機／手機均確認只渲染這三張品牌卡。三張主圖均以 `object-cover` 正確填滿卡片。
- **等高驗證**：前三張卡在 1512px 均為 `560px`（caption `230px`）、1024px 均為 `507px`（caption `177px`）、390px 均為 `462px`（caption `192px`）；三斷點皆無水平溢出且 console error 為 0。
- **品牌標題素材**：第 01 卡使用者提供的 `public/services/svago-logo-white.png`（SVago，`111×31`）與 `public/services/svago-product.png`（`1300×945`）；第 02 卡使用 `public/services/teka-logo-white.svg`（TEKA 向量 logo，viewBox `170×50`）與 `public/services/teka-product.png`（`977×945`）；第 03 卡為 SAKURA logo 與抽油煙機主圖。三張來源皆為白色透明圖，因此在白底 caption 中統一轉為原 h3 的深色。由於三者的橫長比例不同，改採**光學等大**而非機械等高：SVago `31/35/38px`、TEKA `32/36/39px`、SAKURA `24/26/28px`（mobile/tablet/desktop，高度與寬度自動），三者在同一斷點的視覺面積接近且完全不拉伸。
- **卡片等高**：因文字標題最多兩行、品牌 logo 僅一行，caption 依實測最大內容高度設共同最小高——mobile `192px`、768–1199 `177px`、≥1200 `230px`；三張品牌卡在同一斷點維持相同整張高度，產品圖固定高度與 Embla 輪播不變。寬版圖文交錯更新為圖片「上／下／上」。
- **Comparison history**：before＝淺灰背景、卡片缺白底／24px 外框、圖片使用比例高度且外連；final＝Page 6 原背景＋遮罩、原版白卡／固定圖高／排版、全部素材本地化，無 P0／P1／P2 殘留。
- **final result: passed**

## 門市案例（Gallery）— Antra Home Three 版型

`GallerySection.tsx`：對位 Home Three gallery 版型（section 高/位置/膠囊/大標/箭頭照模板實測 + 主題 `heading.php`），**但右側依使用者規則做「背景=主圖 + 2 卡聯動」**（非模板原生的 3 欄 swiper）。字型用模板 Cal Sans、金 `#C9AA79`，內容為 **SAKURA 門市案例**。

- **輪播規則（使用者指定）**：**全出血背景 = 目前主圖(#active)**，右邊固定**只 2 張卡** = 下兩張(#active+1、#active+2)；前進時背景與兩卡一起輪替（背景交叉淡入 + `useParallax('.gallery-bg')` scale 1.12、卡片/段落 `animate-gallery-card` 滑入）。`useState(active)` 驅動，autoplay 依最新需求由 4s 加快為 **3.2s**（滑入暫停），支援指標拖曳。
- **section 高度 = `min-h-[956px]`**（實測模板 956）；內容**非置中**，照模板 `e-con-inner` `padding-top` 推到下半部。左標題區 `lg:w-[479px]`（L51）+ 右卡欄 `flex-1`。內部間距：膠囊 `mb-[26px]`、段落 `mt-[37px]`、CTA `mt-[40px]`。右欄改為兩欄 Grid：「左側彈性控制欄／右側固定縮圖欄」，因此縮圖右緣仍對齊 51px 版心，箭頭則在左側剩餘空間水平置中。
  - ⚠ **驗證陷阱**：`.reveal` 用個別 `translate` 屬性做進場，隱藏分頁 transition 卡住停在 `translate:0 56px` → 量測會**整體 +56**；驗證垂直位置要先 `translate:none!important` 清掉再量（見 [[mcp-tab-hidden-raf-io]]）。卡片另有 `animate-gallery-card` 的 `translateX(40px)` 進場，量水平也要結算。
- **背景底圖**：= 當前 `CASES[active].image`（crossfade）。遮罩 `linear-gradient(90deg, rgba(0,0,0,.82)→.5)` 壓成模板沉穩深調 + 保左側文字可讀。
- **左：標題區**：只更新模板文字，圖片與動畫不動。**副標膠囊**（`border-white/25`、`rounded-[24px]`、`padding 3/13/3/9`、金點 + `our gallery` 15/ls1/uppercase）+ 大標（`Interior design`＝模板 Home Three 逐字；桌面 **110/100**、tablet-extra `76/90`、tablet `42/50`、mobile `40/45`、capitalize）+ 原版段落 `Lorem ipsum dolor sit amet consectetur. Magna nunc porttitor convallis faucibus laoreet.`（白色、18/24、寬 378）+ **CTA 按鈕**（見下）。
- **CTA 按鈕**：與品牌承諾區統一鎖定為全站內容型 CTA 規格：總高 **60px**、`padding 9/9/9/30`、文字 **15/22px**、icon gap 8px、圖示圈 **40×40px**；按鈕與內圓均禁止 flex shrink，欄位改寬時不縮放、不換行。未 hover 時金圓外層以 `antra-lexus-scale 2s infinite` 產生雷達水波；hover 整顆 CTA 後停止並隱藏水波，原本填金／箭頭轉正效果不變。
- **右：2 張縮圖**：正方形、`rounded-3xl`，1024／1200／1280／1440+ 依序為 `140 / 230 / 280 / 295px`，桌面卡間 gap 30；右欄 `margin-top` 依序調整為 `205 / 315 / 275 / 260px`，讓各尺寸的卡片底部都落在固定 Section 內。卡片 hover 維持陰影加深與圖片 `scale(1.06)`。每張縮圖改為按鈕，點擊即把該案例設為 active，背景和另外兩張縮圖同步輪替。
- **箭頭**：42×42 圓框、`border-white/25`、lucide `ArrowLeft/ArrowRight`。先前雖設 `left:50%`，但箭頭 DOM 仍在右側 Grid 內，Grid 成為 absolute containing block，導致 1512px 實際中心落在 x≈996 並壓到第一張卡片後方；現已把控制群移成 Section 全寬內容層的直接子元素，桌面使用 `position:absolute; left:50%; transform:translateX(-50%); z-index:30`，真正以整個 Section 為參考。為避免亮色案例圖讓透明按鈕視覺消失，增加輕量 `bg-black/20` 與 backdrop blur。`top` 依 1024／1200／1280+ 設為 `691 / 891 / 901px`，讓 42px 箭頭底緣與卡片底線一致；縮圖明確放在 Grid 第 2 欄。行動版維持正常流、位於縮圖下方置中，仍控制聯動 `prev/next`。
- **內容 = 3 則門市案例**：`CASES` 僅保留圖片 `public/store-cases/case{1,2,3}.jpg`（來源 `影像/門市案例`）；背景與兩張卡的聯動、4 秒自動輪播、滑動及 hover 動畫均未更動。放在 `App.tsx` 產品區之後。

## What We Do — Antra Home Six 版型

`WhatWeDoSection.tsx`：複刻 Home Six 的「What we do」兩欄區（淺色白底、顯示字用 Cal Sans、內文用 Golos Text、模板金 `#CAA05C`）。右欄影片為 SAKURA 額外功能，因此保留；其餘文字、欄寬、背景裝飾與響應式間距依 Home 6 instance `f0420ee`。

- **Section / 欄位**：桌面 padding `120px 30px 115px`、tablet-extra `100px 30px`、tablet `80px 30px`、mobile `60px 15px`；內容版心 1410px。桌面以 `51fr / 49.5fr` 還原 51%／49.5% 欄比與 90px gap，1024–1199 gap 30px，窄版單欄。
- **左欄（依主題原始碼對齊模板）**：
  - **副標膠囊**：Cal Sans `12/22`、tracking 1、uppercase；`rounded-[24px]` + `border rgba(114,114,114,.18)` + `padding 3/13/3/10` + 6px 金點。副標至大標 20px，整個 heading widget 至清單 40px。
  - **雙色大標**：Cal Sans 400；桌面 `60/64`、寬手機 `45/50`、手機 `30/35`；最大寬 670px，自然換行、不使用手動 `<br>`。文字為「SAKURA has ⟨created exceptional⟩ architectural designs.」，模板原品牌 Antra 僅替換成 SAKURA。
  - **打勾清單**：純金 `Check` 19px、無圓底；字體已由錯誤的 Golos Text 修正為模板 Cal Sans 400 `18/24`，icon/text gap 7px，每列上下 16px並保留分隔線。
  - **段落**：Golos Text `16/24 #59585D`、最大寬 645px；桌面 margin `29px 0 50px`，窄版 `30px 0` 並置中。
  - **CTA**：依「只同步英文、中文內容不動」保留 `櫻花優勢`；全站內容型 CTA 統一鎖定 `height:60px`、`padding 9/9/9/30`、icon gap 8px、文字 `15/22px`、金圓 40px，並增加 `shrink-0` 與 `whitespace-nowrap`，確保左右欄比例改變不會縮小按鈕。金圓在未 hover 時使用與影片播放鍵相同的 2 秒雷達水波；hover 後水波消失、按鈕填金且箭頭轉正。
- **右欄影片區（刻意保留差異）**：Home 6 原版是 `h6-image-5.jpg`＋`h6-image-4.jpg` 兩張疊圖；本專案依「額外功能與動態不移除」保留 16:9 影片、hover 與 Reveal。依最新視覺需求，桌面 Grid 從左／右 `51 / 49.5`、gap 90px 改為 `44 / 56`、gap 70px；1512px 版心下文字欄約 590px、影片欄約 750px，影片明顯放大而左欄縮小。兩欄仍 `items-center` 垂直置中。
  - **播放鈕＝模板 icon／效果 + 使用者指定正圓**：改用模板原生 `antra-icon-play-fill`（資產 `public/fonts/antra-icon-1.0.12.woff2`），不再用 Lucide `Play`。外型依使用者覆寫成正圓：桌面 `137×137`、768–1199 `77×77`、窄版 `87×87`；icon 分別為 40px／35px／40px，保留原本的 bottom margin。
  - **玻璃／雷達動畫**：wrapper 與 `::before` 均為 `1px rgba(255,255,255,.11)`、radius 50%；`::before` 為白色 36%、opacity .95、`backdrop-filter: blur(29px)`；`::after` 為 1px 白色雷達圈，使用模板 `lexus-scale` 的 2 秒無限動畫（scale `1→1.3`、opacity `1→0`）。移除原本錯誤的 `animate-ping` 與 hover 放大。
- **背景右下半透明建築圖 = 模板原圖 `h6-bg-3.png`**（`public/decor/h6-bg-3.png`，821×520）：恢復原始 821px 寬、`bottom right / no-repeat / auto` 視覺，PNG 自帶透明度；保留既有 `.wwd-blueprint` 輕微視差。
- 影片來源未定：poster 為佔位、播放鈕 `onClick` 尚未接（待提供 YouTube 連結或影片檔即可接 lightbox/iframe）。What We Do 英文已改為 Home 6 原文；CTA 中文依內容保留規則維持「櫻花優勢」。放在 `App.tsx` 圖庫區之後。

### What We Do 瀏覽器驗收（2026-07-17）

- **字型載入**：`document.fonts.ready` 後，Cal Sans 60px／18px 與 Golos Text 16px 的 `document.fonts.check()` 均為 `true`，不是只有 CSS family 名稱正確、實際卻落到 fallback。
- **1512px 最新欄寬**：section padding 維持 `120px 30px 115px`、版心 1410px；Grid 更新後扣除 70px gap 的可分配寬度為 1340px，文字／影片理論欄寬約 `589.6 / 750.4px`。h2 仍為 Cal Sans 400 `60/64`，CTA 15px；兩欄 `items-center`、影片 16:9 與 Section 高度不變。
- **播放鈕實測**：依使用者指定，1512px 為正圓 `137×137`、icon 40px、margin-bottom 8px；1024px 為正圓 `77×77`、icon 35px；390px 為正圓 `87×87`、icon 40px。三斷點均無水平溢位；`antra-icon` 字型載入成功，`::after` transform 取樣有持續變化，確認雷達動畫不是只有宣告但未執行。
- **1024×768**：section padding `100px 30px`、欄寬 `473.969px / 460.031px`、gap 30px；h2 仍為模板桌面值 `60/64`；無水平溢位。
- **390×844**：section padding `60px 15px`、單欄且 gap 30px；h2 Cal Sans 400 `30/35`、eyebrow Cal Sans `12/22` + 1px tracking、清單 Cal Sans `18/24`、段落 Golos Text `16/24`、CTA 15px；垂直置中設定不改變單欄順序，無水平溢位。
- **主控台**：本 section 無 error／warning；僅既有 Google Maps 的 async 載入與舊 Marker API 兩則 warning，屬明確排除、不在本次 What We Do 修改範圍。
- **來源與限制**：數值以已購模板 `antra/dummy-data/homepage/home-6.xml`、`antra/assets/css/base/elementor.css` 與原始 `h6-bg-3.png` 為準。模板 demo 網域在目前瀏覽器環境被政策阻擋，購買包也沒有這一段的完整頁截圖，所以已完成原始碼數值＋本機實際渲染驗收，但無法宣稱做過來源截圖的逐像素疊圖；若補一張模板該區截圖，可再做最後視覺差分。

## 門市查詢（Store Locations）— Antra Contact Us 風格 + 可用地圖搜尋

`StoreLocationSection.tsx`：套 Antra「Contact Us」視覺（淺灰底 `#f6f6f6`、膠囊 eyebrow、雙色大標、白色圓角卡片、金色 `#C9AA79`），並把原本的空佔位地圖與無效搜尋**做成真的能用**：

- **防爆版安全容器（2026-07-19）**：原本 `max-w-[1410px] mx-auto` 在 viewport 小於 1410px 時沒有任何左右留白，且標題直接固定為 `424px + 661px`，會被 section 的 `overflow-hidden` 裁掉。現改為 `max-w-[1512px]`，左側採 `20 / 32 / 51px` 安全留白，右側額外保留 `88 / 90 / 86px` 給固定懸浮列；`lg=1024px` 起仍維持原本水平結構，但標題改用 `minmax(260px,424px) + minmax(0,1fr)`，地圖／列表子欄加入 `min-w-0`，篩選器與地址／電話在 1024–1279px 允許內部重排。1512px 完整維持原本水平版型，同時避免瀏覽器縮放、窄桌機或右側懸浮按鈕裁切互動內容。

- **標題版型（依「首頁 Section 說明.pptx」slide 2 門市地圖）**：**分欄標題**——eyebrow `get in touch`（桌面左欄最大 424px）+ 大標推到右邊 `Have a Project in ⟨Mind? Let’s Make⟩ It Happen`（模板 Contact 頁逐字；`Mind? Let’s Make` 金色，彎引號 ’）。**加十字裝飾線**（與 `PricingSection` 相同：橫線 `left-[-13px] top-[16px] w-[502px] h-px`、直線 `left-[363px] top-[-38px] h-[179px]`、兩端 15px 三角、色 `#e3e3e8`、`hidden lg:block`），座標與 Pricing 一致 → 同位置。
- **左欄（寬，~62%）**：**Google Maps JavaScript API 自訂地圖**（`GoogleStoreMap.tsx`），套**極簡淺灰樣式**（`LIGHT_STYLE` style JSON，仿官網 store/location 的 Positron 淺灰風）+ **深色水滴「S」標記**（inline SVG）；選取/篩選門市時 `google.maps.Geocoder` 依地址定位、`panTo` 平移（結果 cache）。
  - **需金鑰**：在專案根目錄建立 `.env`，設定 `VITE_GOOGLE_MAPS_API_KEY=你的金鑰`（`.env` 已加入 `.gitignore` 不會 commit），並在 Google Cloud 啟用 **Maps JavaScript API** 與 **Geocoding API**；金鑰建議以 HTTP referrer 限制網域。改 `.env` 後需**重啟 `pnpm dev`**（Vite 環境變數不熱更新）。
  - **無金鑰/載入失敗**：地圖區直接顯示完整錯誤訊息（依全域規則「錯誤完整顯示在前端」），不靜默空白。
- **右欄（窄）**：`我的位置` 改成與 **`選擇區域` / `選擇城市`** 相同的 52px 高白底圓角按鈕；三個控制固定使用等寬三欄同排，窄螢幕縮小內距、字級與圖示避免爆版。位置按鈕保留 `LocateFixed` 金色準星，兩個下拉維持 `appearance-none` + 疊自訂 `ChevronDown`。下方改為固定四列的機場 split-flap 門市資訊板：每列維持固定高度，第一行區域 pill + 店名，第二行 `MapPin` 地址 + 金色電話；選中仍為金底白字。
- **機場翻牌輪換**：目前 5 間真實門市中固定顯示 4 間，第 5 間作為候補；翻牌等待間隔依最新需求由 `2.8s` 加快為 **`2.2s`**，翻動本身仍使用 `760ms` 3D `rotateX`。卡面不加中央分隔線；畫面同時不出現重複門市，已選取並控制地圖的門市不會被自動換走。hover 或鍵盤 focus 進入資訊板即暫停；`prefers-reduced-motion` 完全停用輪換。
- **級聯篩選**：`region` / `city` 兩個 state 驅動；選區域自動清空城市、城市下拉未選區域時 disabled（`REGIONS` 提供五大區→縣市對照）。`filtered = STORES.filter(區域符合 && 城市符合)`；選取門市若被濾掉自動退回第一筆可見門市；該區無資料顯示「此區域尚無門市資料」。
- **門市資料**：pptx 真實資料共 5 間（承德 / 石牌 / 民權 / 中山南京 / 八德，皆北部/臺北市，含真地址電話）；其他區暫無資料，補上即可用。

## Header — SAKURA 巨型選單（mega-menu）

`Header.tsx`：單一金色 bar、**橫式中央 logo**（與 Footer 共用 `public/home-2026/footer/sakura-kitchen.png`；Header 內以 `brightness-0 invert` 轉白以維持金底對比）。Logo 版面框維持 ≥1280px `260px`、1024–1279px `160px`、<1024px `184px`，另以 transform `scale(1.25)` 放大視覺尺寸，不影響 Flex 佔位與 60px Header 高度。左右各一組導覽，自訂 Tailwind 實作（未用 Radix，與全站一致）。完整桌面導覽維持自 `lg / 1024px` 顯示；1024–1279px 只使用緊湊 item padding與較小中央 Logo 版面框，確保八個入口正常同排，不再縮小字級。

- **背景／字型／字級對齊參考站 `sakura-kitchenlife.com.tw`**（實測 `.l-header`／`.l-nav__item`，常數定義於 `Header.tsx` 頂部）：背景漸層 `linear-gradient(90deg, #B79258 20%, #D2B587)`（`HEADER_GRADIENT`）；字型堆疊 `"Noto Sans TC","PingFang TC","Microsoft JhengHei",微軟正黑體`（`HEADER_FONT`，套在 `<header>` 上向下繼承，**未外連 Google Fonts**、Mac 上 fallback 至 PingFang TC）；導覽字級 `text-[15px]`、weight 400、字色純白。
- **間距對齊參考站**：bar 容器使用 `px-5 xl:px-12`（20/48px）且**滿寬**，對齊參考站在 1024／1512px 的左右邊距 20／48px；搜尋展開列維持同一安全留白。≥1280px 導覽項使用 `px-3`＋`gap-1`，1024–1279px 僅壓成 `px-1`＋`gap-0.5`。bar 高度、mega-menu 起點與 App spacer 已同步由 `72px` 改為官網的 `60px`。**注意**：參考站為「logo 靠左＋導覽靠右」的 space-between 版型，本專案依既有需求保留「導覽左半｜中央 logo｜導覽右半」結構，故只同步尺寸而不改導覽資訊架構。

- **導覽資料**：`NAV_LEFT` / `NAV_RIGHT` config 陣列，每項 `{ label, children?, href?, external?, mega?, megaCatalog? }`。主導覽使用「優惠消息」，其下拉項維持「優惠活動／最新消息／媒體影音」。有 `mega` → 圖片式大選單；有 `children` → 文字下拉；只有 `href` → 連結（`external` 用 `target="_blank"`，如櫻花集團連 sakura.com.tw）。
- **桌面（`lg+ / ≥1024px`）**：三段 flex（左群 / logo / 右群 + 🔍）；全桌面導覽文字固定為官網 `15px / 15px / 400`，1024–1279px 只使用緊湊 padding，≥1280px 使用完整間距。有子選單者 `group relative` + `group-hover` 展開白色下拉（子項 hover 轉金、`ChevronDown` 旋轉；`pt-2` 橋接避免 hover 中斷）。
- **廚房產品 → 圖片式 mega-menu（仿 Antra Home 選單）**：hover 從 header 下方**淡入展開滿寬白色面板**（`opacity`+`visibility` 300ms；面板 `absolute left-0 right-0 top-[60px]`，定位參考 `header`，故滿寬）。內含**三張品牌大圖卡**（SAKURA 廚電 / SVAGO / TEKA，`public/products/*.jpg`，來源 `影像/廚房產品`）：`aspect-[4/3]` 圓角 + 底部漸層 + 白字標籤，卡片 hover 圖片放大、標籤轉金；面板底部 `廚房商品型錄 →` 文字連結。觸發鈕撐滿 `h-[60px]` 讓面板無縫貼合、hover 不中斷。手機版則把三品牌 + 型錄當 accordion 子項展開。
- **手機／平板導覽（`< lg / 1024px`）**：logo + 🔍 + 漢堡；漢堡開白色抽屜，主項點擊 **accordion 展開**子選單（`useState expanded`），純連結直接點。
- **搜尋**：🔍 切換 `openSearch`，在 bar 下方展開白色圓角搜尋輸入框（前端介面，功能待接）。
- **固定頁首（sticky）**：`StickyHeader.tsx` 直接以 `position:fixed; inset-inline:0; top:0` 渲染原生滿寬 Header，不再套縮放；`App.tsx` 保留 `HEADER_H`(60px) spacer。手機漢堡／accordion 抽屜與桌面 mega-menu 均保留。

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
