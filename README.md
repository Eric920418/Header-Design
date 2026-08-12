
# SAKURA Kitchen — Nuxt 3 品牌網站

SAKURA 廚房品牌網站。2026-08-11 起正式執行版本遷移至 Nuxt 3；原 React/Vite 原始碼暫時保留為像素與互動比對基準，不再由根目錄指令或部署執行。

原始設計稿：https://www.figma.com/design/TTt0ua7aR3ayd8zsIkTBPa/Header-Design

## 技術棧（2026-08-11）

- Nuxt 3／Vue 3／TypeScript
- Tailwind CSS v4（使用 `@tailwindcss/vite` 插件）
- Lucide Vue、Embla Carousel、GSAP、Lenis
- SSR／Nuxt 檔案路由；正式應用位於 `nuxt-site/`

## 啟動方式

```bash
pnpm install
pnpm dev
```

根目錄指令會轉交 `nuxt-site/`，開發伺服器預設在 `http://localhost:3000`。

## 構建

```bash
pnpm build
```

正式輸出為 Nuxt Nitro `.output/`。可另執行 `pnpm typecheck` 驗證 Vue／TypeScript。

## 2026-08-11 Nuxt 3 遷移與 3.0 門市服務

- Nuxt 3 成為唯一正式執行版本；Vercel framework 已由 Vite 切換為 Nuxt。
- 遷移範圍鎖定為既有首頁、隱私權政策、共用 Header／Footer／浮動按鈕，以及新建 3.1 服務流程與 3.2 案例門市。
- 根目錄 `public/` 是唯一靜態素材來源，Nuxt 透過 `dir.public` 直接使用，避免複製同一批首頁素材。
- 舊 React `src/` 保留作遷移 QA；不得把 Nuxt 的新功能回寫成兩套長期維護版本。
- 共用 Nuxt 殼層已建立：固定 Header、桌面／手機導覽、兩種 Mega Menu、Footer、右側浮動按鈕與 reduced-motion 基礎均改為 Vue 元件。
- 首頁遷移已開始：Hero 三層換圖、左側品牌系列、Hero 風格反向輪播與十大系列 Embla 輪播均保留既有速度、方向、Hover 與 reduced-motion 行為。
- Services 三品牌卡與 Logo 跑馬燈、full-bleed 門市案例、品牌承諾影片與共用 CTA 已轉為 Vue，既有素材、輪播速度與 CTA 尺寸不變。
- 首頁 Vue 組裝完成；門市查詢保留三個同排篩選、Google Maps 錯誤前端顯示、門市選取聚焦與 2.2 秒翻牌資料輪替。
- Nuxt 子專案依 Nuxt 3.21.10 的實際 builder 固定使用 Vite 7.3.6，避免 Tailwind 外掛與 Nuxt builder 被解析成兩套互斥型別；首頁自動輪播計時器只在瀏覽器端建立，SSR 不會遺留伺服器計時器。
- 3.0 正式圖片已由開版素材包整理至 `public/section-3/`：三張門市封面與 case10／case56／case35 共 27 張案例圖；已排除 macOS AppleDouble 隱藏檔，執行期不引用 Downloads 或 ZIP 路徑。
- 3.0 內容資料已型別化為服務步驟、FAQ 群組、案例摘要／詳情、門市聯絡與案例規格；FAQ 15 題逐字採用開版 DOCX，案例只建立簡報明確提供的三筆資料，缺少文章、規格或連結的 case56／case35 不虛構欄位。
- `/service-process` 已依 3.1 最新開版要求重做為 SSR 內頁；視覺真值直接取自已購模板 `antra-full 2/antra/dummy-data/content.xml` 的 Elementor `_elementor_data`、`assets/css/base/elementor.css` 與 Antra video/process PHP、JS，不再使用自行發想的內頁版型。Breadcrumb Hero 精確沿用模板 `360.1875px` 桌面高度、`#100801/.64` 遮罩、`138/97px` 間距、`80/76.19px` 標題與原始 `breadcrumb-df.jpg`；平板、手機分別沿用 `80/80`、`80/60px` 設定。
- 服務流程不是合成截圖：八個步驟、標題、說明、箭頭與互動均為獨立 Vue／HTML 元素，程式結構直接移植自 `/Users/eric/Desktop/SPA/frontend/app/pages/services.vue` 的 `flow-row / flow-step / step-title / step-desc`；八個 132×132 透明 icon 亦直接採用 SPA `frontend/public/service-*.png` 正式素材，不再使用從 PPT 裁切的 `step-01～08.png`，舊裁圖已移除。桌面維持 4×2、灰色方向箭頭、標題底線與金色 `＋`，並恢復原碼的 icon Hover「影片待上架」及 3／5／6／8 點擊切換說明；PPT／DOCX 逐字內容仍為顯示真值。影片改用 Antra Home 09 的 `h9-banner-3.jpg` 原始 1410×640 比例與模板 `background-blur-filter-yes`／`radar-animation-yes` 正圓播放鈕，播放、逾時、錯誤原因及 YouTube 備援連結仍完整顯示在前端。
- FAQ 直接複刻模板 `83319f9` 區塊：1410px 版心、`100/130px` 外距、30/66.666% 標題欄、Popular Queries 膠囊、水平／垂直裝飾線、`60/64px` 標題、`28/34px` 題目、`22px` 摘要上下距、右緣無圓框 `＋／－` 與 `40px` 答案內距；依 PPT 移除模板右側 FAQ 圖文欄，Accordion 展開至全寬。四類 15 題逐字採用 DOCX，第一題依模板預設展開，原生 button 保留鍵盤及 `aria-expanded`／關聯 panel 操作。
- `/gallery` 依 3.2 PPT 與 Antra Virtual Tours 原始元件重製：Breadcrumb Hero 與 3.1 共用模板 `breadcrumb-df.jpg`、`#100801/.64` 遮罩及 `80/76.19px` 桌面標題；內容不再使用自行設計的大標、說明段落或 Select 面板。篩選改為「全部／北部／中部／南部／東部／離島」與所屬 23 縣市兩層水平按鈕，狀態同步至 `region`／`city` URL query，切換區域會清除舊縣市，且使用路由歷史紀錄讓瀏覽器上一頁可回到前一個篩選。首期只上線素材完整的安康、承德、松竹三店；PPT 的 53 家是歷史估算，舊官網 2026-08-11 公開 API 已為 63 筆，兩者均不拿來填補未提供的正式內容。
- 3.2 門市卡直接移植 Antra Virtual Tours 幾何：桌機／平板／手機 3／2／1 欄、圖片 350／300px、24px 圓角、0.5 秒 `scale(1.05)` Hover、標題桌機 `28/34px`／手機 24px；移除會誤導為環景功能的 360 icon。卡片顯示正式門市名、地址及獨立「預約門市」按鈕，圖片／店名才進入本機 `case10`、`case56`、`case35`，不會發生巢狀連結誤觸；單頁三筆資料不顯示假分頁。圖片錯誤會在原圖片框完整顯示原因，空區域使用簡潔的 Antra 分隔線狀態且不虛構案例。
- 3.2 QA（2026-08-11）：`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過；390／768／1024／1512／1920／2560／3840px 實測依序為 1／2／2／3／3／3／3 欄，390px 圖片高 300px、其餘 350px，所有尺寸 `scrollWidth === clientWidth`。預設 3 筆、北部 2 筆、新北市 1 筆、中部 1 筆、南部 0 筆與空狀態皆正確；瀏覽器上一頁可從新北市回到北部，直接重新整理 query、3.1 服務流程及三筆案例內頁均無 Nuxt 錯誤。Hover、鍵盤 Focus、獨立預約連結、圖片失敗訊息、無 360 icon 與無假分頁亦完成瀏覽器驗收。
- `/gallery/case10`、`case56`、`case35` 共用 SSR 資料模板，提供觸控圖片輪播、縮圖、前後案例與案例推薦；case10 顯示已提供的規格和門市連結，另外兩筆缺少的資料直接隱藏。留言區只做前端驗證並明示未連接後台、資料未送出。
- `/privacy` 已接管原隱私權政策內容並套用共用 Nuxt 殼層；全站 `error.vue` 對 404 與執行錯誤顯示可理解訊息、重試與返回首頁操作，不向前端暴露伺服器堆疊。預設 SEO site name、title 與各 3.0 頁面 metadata 已加入。
- Production preview 首次 SSR 驗收發現 client-only Reveal directive 造成 `getSSRProps` 500；Reveal 已改為通用 Nuxt plugin，伺服器註冊空 SSR props、瀏覽器端再掛 IntersectionObserver，兼顧 SSR 與既有進場動畫。
- 開發模式進一步定位 hydration mismatch 為 `components/home/LogoMarquee.vue` 的 Nuxt 自動匯入名稱應為 `HomeLogoMarquee`；呼叫端已修正，避免伺服器 comment 與客戶端未解析元件不一致。
- Nuxt 3.21 的設定型別仍指向 Vite 6、實際 builder 為 Vite 7；Tailwind plugin 只在 `nuxt.config.ts` 的外掛陣列邊界做 package-identity 型別轉接，不把 `any` 擴散到應用元件或資料型別。
- QA 後補強 FAQ 的 Enter／Space 明確鍵盤事件；案例列表與案例詳情已修正文檔標題層級，每頁只保留一個語意 `h1`，不以視覺正常掩蓋 SEO／無障礙結構問題。
- 新內頁內容版心新增單側 86px 右側浮動列安全欄，左側基準線不位移；首頁既有浮動列位置與互動完全不動，但 3.0 與隱私權頁面的標題、FAQ、卡片及文章不再被右側按鈕遮住。未知案例 404 同時移除 Nitro 已棄用的長 `statusMessage` 用法。
- Nuxt 主樣式的兩個 `@import` 均移到所有 style rules 之前，確保瀏覽器與 Tailwind 產物都不會因 CSS import 順序而忽略既有 React 基準樣式。
- 根目錄新增 `/node_modules/` ignore；舊 Repository 雖曾追蹤套件快取，本次已只還原其工作樹差異，不把 pnpm 重建造成的 17 萬行第三方套件雜訊混入 Nuxt 遷移交付。

### 2026-08-11 Nuxt 遷移 QA

- `pnpm typecheck` 與 `pnpm build` 通過；正式輸出為 Nuxt 3.21.10／Nitro 2.13.4／Vue 3.5.41／Vite 7.3.6。
- Production preview 直接重新整理 `/`、`/privacy`、`/service-process`、`/gallery`、`/gallery/case10`、`case56`、`case35` 均回應 200 並含 Nuxt SSR payload；未知案例回應 404，前端顯示共用錯誤頁。
- 首頁在 `390、767、768、880、881、1024、1025、1200、1201、1366、1367、1512、1920、2560、3840px` 全數 `scrollWidth === clientWidth`，Hero 高度依序符合既定五段 `587／489／719／858／952px`。
- 3.0、案例內頁與隱私權在 `390、768、1024、1512、1920、3840px` 全數無水平爆版、無破圖且每頁只有一個 `h1`；右側浮動列與主要標題 bounding box 無交疊。
- FAQ 共 15 題；3.1 最新模板對齊後改為第一題預設展開，滑鼠、Enter 與 Space 切換通過。區域／縣市空狀態與重設、案例箭頭、留言驗證屬 3.2 既有紀錄，本輪未修改。
- 最終 production browser tab 無 hydration mismatch、console error 或 warning。
- 首頁 GSAP ScrollTrigger 視差已補回 Nuxt client plugin：Gallery 背景維持 `-8→8 yPercent` 與 `scale(1.12)`，品牌承諾藍圖維持 `-6→6 yPercent`，兩者 `scrub:0.5`；只在桌面 >992px 啟用，route 完成時重建，reduced-motion 完全停用。Production browser 實測捲動前後兩個 transform 均有連續變化，Console 為空。
- `page:finish` hook 明確回傳 `void`，不把 `requestAnimationFrame` 的數值 handle 誤當 Nuxt HookResult。

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
- **Services 底部 Logo 跑馬燈**：取代舊的 `Kitchen Product` 巨型文字，順序為 SAKURA／TLK／TEKA／SVAGO／SAKURA Home；每格 Logo `170×50px`、左右 margin 各 `70px`、四組無縫重複以完整覆蓋 4K。尺寸與間距沿用 SAKURA 官網 Footer，速度依最新需求由官網基準 `20s` 加快為 `16s linear infinite`；背景仍併入 Services 深色 Section，減少動態模式停止動畫。
- **品牌承諾影片**：使用 YouTube `wH374AF9wLI`；初始顯示對應縮圖與模板正圓播放鈕，點擊後在原 16:9 卡片內切換為 autoplay iframe。縮圖或 iframe 載入失敗時，前端顯示完整錯誤理由、影片 ID 與 YouTube 備援連結。
- **Footer**：底部巨型 `footer-sakura.svg` 改為使用者提供的 `public/home-2026/footer/sakura-kitchen.png`；保留原始金色與比例、不降低透明度，所有斷點都水平置中並貼齊 Footer 底部。依最新回饋將總高調整為手機／平板 `390px`、桌面 `600px`；連結與圖示列的 top padding 增加 12px（手機 48px、桌面 60px），整排稍微下移。資訊列與 Logo 共用真正的 `1410px` 置中版心，不在 max-width 內再疊加 51px padding；390px 另為 Copyright 保留右側懸浮列安全區。背景、Copyright 與連結內容不變。
- **門市案例第 6 點**：背景使用 `yuan-aifei.jpg`，右側兩張卡依序為 `old-house-kitchen.jpg` 與 `custom-kitchen.jpg`，沒有深色漸層遮罩。Section 維持真正 full-bleed，不套 1410px 版心；`≤1024px` 依 Home 3 tablet 規則堆疊，`1025–1512px` 將內容 top、水平安全距離、卡片尺寸與卡片下移量連續插值。卡片在 390px 為 170px、768–1024px 為 220px、1025px 為 140px、1200px 為 230px、1280px 為 280px、1440px 起固定 295px；1512px 精確維持原本左右 51px、兩卡 `295×295px`、箭頭 `y=901px`。每張縮圖可點擊切換背景，拖曳、3.2 秒自動播放、hover 與進場動畫均保留；減少動態模式停止自動播放與切換動畫。

依專案文件規範，Design QA 結果繼續記錄在本 `README.md`，不另建第二份 Markdown 文件。

### 2026-07-21 Design QA

- **真值來源**：首頁素材來自 `首頁用圖_2026.07.21`；Logo 跑馬燈以 SAKURA 官網 Footer 為尺寸與間距基準。官網實測為五個 `170×50px` Logo 框、單側 `70px` 間距、`20s linear infinite`；本站依最新速度需求覆寫為 `16s`。
- **全斷點**：Footer 已在 `390 / 767 / 768 / 880 / 881 / 1024 / 1025 / 1200 / 1201 / 1366 / 1367 / 1512 / 1920 / 2560 / 3840px` 驗證，所有尺寸皆為 `scrollWidth === innerWidth`，無水平爆版；Footer Logo 底部 inset 全為 `0px`，在 `390 / 768 / 1024 / 1512px` 的寬度依序為 `360 / 708 / 922 / 1410px`。
- **Header / Hero**：1512px mega-menu 內版心實測 `1200px`，三個品牌 Logo 均為 `170×50px` 且左緣與各欄產品圖一致。Hero 有三張輪播圖、5 秒換圖與 Page 1 的 2 秒三層轉場。首次進場逐幀為「只有灰底 → 上方暗圖／下方灰底 → 上方原圖／中段暗圖／下方灰底 → 完整原圖」；另行等待模板自動換到下一張後確認，後續週期的底層是上一張圖片，不會再次出現灰底。因此本站 `ai-kitchen.jpg → clever-kitchen.jpg` 也保留舊圖在底層，再建立暗色新圖與原色新圖重播，遮罩實測為 `rgba(16,8,1,.46)`；本機在換圖前、換圖開始、雙層交疊及完成四個時間點逐幀複查，底部始終是上一張圖片或已覆蓋的新圖片，沒有灰色閃屏，最終也沒有常駐遮罩。`390 / 768 / 1024 / 1512px` 均為 `scrollWidth === innerWidth`，沒有 Vite error overlay。QA 初次發現 768px 標題單行造成右側裁切，已改為固定於 `Inspired` 後換行，複查通過。
- **內容與互動**：四個中文 eyebrow 已存在；產品卡為 `01 SAKURA → 02 SVAGO → 03 TEKA`。影片初始縮圖及正圓播放鈕正常，點擊後建立 `wH374AF9wLI` autoplay iframe，`allowFullScreen` 與播放權限完整；失敗狀態在卡片內保留完整原因及 YouTube 連結。
- **Footer / 跑馬燈**：官網與本機皆以 `1280×720` 擷取並合併比對；Logo 視覺框、間距與移動節奏一致，本機沿用 Services 深色背景。Footer 新金色 Logo 原色、比例完整、各斷點置中貼底。
- **視覺證據**：集中於 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/`，包含 `home-2026-hero-{390,768,1024,1512}.png`、`home-2026-mega-1512.png`、`home-2026-logo-marquee-768.png`、`home-2026-video-playing-768.png`、`home-2026-footer-768.png` 與 `logo-marquee-comparison-1280.png`。
- **Console**：無本次功能造成的 error。僅保留地圖既有的兩項 warning：Google Maps 建議 `loading=async`，以及傳統 `google.maps.Marker` deprecation；地圖屬明確不動範圍。
- **結論**：首頁素材更新範圍通過；門市案例第 6 點於後續迭代依 `IMG_1251.PNG` 補齊，驗收記錄見下方最新 Gallery Design QA。

### GallerySection RWD QA（2026-07-31）

- **來源真值**：已購買模板 `antra-full 2/antra/dummy-data/homepage/home-3.xml` 的 `e40fdad` Our Gallery instance、`assets/css/base/elementor.css`，以及使用者註記圖 `/Users/eric/Downloads/IMG_1251.PNG`。模板數值只控制 RWD 大方向；本站背景聯動兩張卡、素材、CTA、箭頭位置與互動屬已確認客製差異。
- **完整斷點**：已驗證 `390、767、768、880、881、1024、1025、1200、1201、1366、1367、1512、1920、2560、3840px`。`≤1024px` 為置中堆疊，手機／平板水平安全距離分別 15／30px；Section top 同時保留模板 60／80px 留白與本站 fixed Header 的 60px 安全距離，因此膠囊不會被 Header 遮住。
- **連續桌面幾何**：`1025–1512px` 使用 Gallery 專用 CSS 變數與 `clamp()`，讓 inline padding `30→51px`、content top `200→388px`、row offset `0→260px` 連續變化；卡片依區間平滑由 `140→230→280→295px`。這些規則不使用 Tailwind named/arbitrary breakpoint 混排，避免先前產物順序互相覆蓋。
- **1512px 鎖定比對**：修改前後 heading `x=51 / y=444.5`、CTA `x=51 / y=793.5`、兩張卡 `295×295px / x=841、1166 / y≈652`、控制鈕 `104×42px / x=704 / y=901`；誤差小於 0.02px。背景、卡片、文字、CTA 與箭頭成品截圖視覺一致。
- **超寬安全**：1920、2560、3840px 仍為 full-bleed 背景與左右構圖；卡片固定 295px，不跟 viewport 放大。Section 自身因背景視差 `scale(1.12)` 會產生合法的內部 scrollWidth，但由 Section `overflow:hidden` 裁切；整份文件在全部 15 個寬度皆 `document.scrollWidth === clientWidth`，沒有實際水平捲軸。
- **互動與動態**：上一張、下一張、點擊第二張卡、向左拖曳均切到正確案例；3.2 秒 autoplay 正常前進，Section hover 後保持原案例，圖片 hover computed `scale=1.06`。`prefers-reduced-motion` 下 3.4 秒後仍停在第一張，背景 transition、卡片進場與圖片 transition 同時停用。
- **錯誤檢查**：三張背景／縮圖無破圖，沒有 Vite error overlay、console error 或 page error；Header、左右浮動按鈕、Services 與下一個 WhatWeDoSection 均未修改。
- **視覺證據**：390px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/gallery-rwd-final-390.png`；1024px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/gallery-rwd-final-1024.png`；1512px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/gallery-rwd-final-1512.png`；3840px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/gallery-rwd-final-3840.png`。
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

- Footer 手機／平板固定 `390px`、1024px 起桌面固定 `600px`；上方資訊區為 `220px`，Copyright 帶為 `70px`。這些是使用者已確認的精簡高度，不隨 4K viewport 放大。
- 底部使用 `public/home-2026/footer/sakura-kitchen.png`（3156×245 RGBA），最大寬 `1410px`、保持 12.88:1 原始比例、原色且 `bottom:0`。不再使用舊的 `footer-sakura.svg`，所有斷點的圖片外框與可見像素都貼齊 Footer 底緣。
- 目前完整 Footer QA 與證據集中在下方「Footer — Antra Home 6 骨架簡化版」，舊的 450／682px 與 SVG 記錄已作廢，避免把歷史值誤當成現況。
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
- **1410px 版心修正**：資訊列改用 `viewport - 30 / 60 / 102px` 的實際寬度，最大 1410px 後置中，取消 max-width 容器內重複的 51px padding。1512px 時連結、圖示與 Logo 同為 `x=51…1461`；1920／2560／3840px 分別為 `x=255 / 575 / 1215`，不會隨超寬 viewport 再多往內漂 51px。
- **懸浮列安全區**：右側懸浮列視覺與運動均不改。只有 ≤479px 的 Copyright 帶保留 89px 右側空間；390px 實測文字外框結束於 x=301、懸浮列從 x=318 開始，完整文字不再被遮住。

### Footer Design QA（2026-07-31）

- **Source visual truth**：Antra Home 6 `https://demo2.themelexus.com/antra/home-6/` Footer 主體 `6632dbf`；模板截圖 `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/footer-template-home6-1512.png`。
- **Implementation screenshots**：`/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/footer-rwd-after-{390,1024,1200,1512,3840}.png`；同目錄的 `footer-rwd-before-{390,1024,1200,1512,3840}.png` 保留版心修正前基準。
- **Viewport / state**：`390 / 767 / 768 / 880 / 881 / 1024 / 1025 / 1200 / 1201 / 1366 / 1367 / 1512 / 1920 / 2560 / 3840px`，頁面捲到底、reduced-motion、Footer 靜止狀態。
- **版心量測**：390／768／1024／1512px 的資訊列與 Logo 左緣分別同為 `15 / 30 / 51 / 51px`；1920／2560／3840px 的 1410px 版心左緣分別為 `255 / 575 / 1215px`。修正前 1512px 資訊內容誤在 x=102，現在與 Logo 的 x=51 完全一致。
- **高度與素材**：390–1023px Footer 高 390px、≥1024px 高 600px；資訊區 220px、Copyright 70px 均未改。PNG 自然尺寸 3156×245，各斷點顯示比例 12.88:1、`object-fit:contain`、bottom gap 皆 0，沒有裁切、變形或透明度處理。
- **互動與可讀性**：四個連結均可鍵盤 focus；文字連結 hover 為 `rgb(202,160,92)`，圖示 hover opacity=1；`/privacy.html` 回應 200。390／1512px 的連結、圖示與 Copyright 對右側懸浮列重疊面積均為 0。
- **Overflow / console**：15 個 viewport 全數 `scrollWidth === clientWidth`，所有圖片載入成功，無 console error 或 page error。`pnpm build` 通過。

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

- **背景與 Section 尺寸**：使用模板原始 `1920×1040` `public/services/h6-bg-2.jpg`，`cover / top center / no-repeat`，疊加黑色 76%。模板的 `backdrop-filter: blur(29px)` 掛在 Section selector，本機亦照此位置設定，不再把 blur 錯掛到 overlay 而模糊背景圖。依使用者指定移除全部 Section top margin；上／左右 padding 精確依 Elementor 臨界點套用：`≤767 = 60/15px`、`768–1024 = 80/30px`、`1025–1200 = 100/30px`、`≥1201 = 125/30px`。跑馬燈已併入 Section，因此原 bottom padding 改由跑馬燈前的 96px 間距承接，Section 本身 bottom padding 為 0，讓跑馬燈貼底。
- **標題列**：subtitle 膠囊 `● 廚房產品` 與大標均為模板白色；標題列使用 Home 6 原生 `1083px` 置中內框，`≤767` 為 `30/35`、`768–880` 為 `45/50` 並置中堆疊、`≥881` 恢復 30:70 橫排及 `60/64`。桌面裝飾完整還原 Elementor 結構：水平線 `502px`＋`deco-horizontal.svg` 尖端、垂直線 `179px`＋`deco-vertical.svg` 尖端，線色 `rgba(255,255,255,.18)`；標題與輪播間距 `≤767 = 30px`、`≥768 = 60px`。
- **服務卡（style-3，照原始碼）**：卡片 `#FFFFFF`、radius 24px、padding 10px；圖片手機高 250px、其餘 310px、radius 24px、hover `scale(1.1)`、薄暗罩 `rgba(0,0,0,.11)`。caption 手機 `20/0/30`、其餘 `30/20/35`；標題手機 `25/30`、桌面 `28/35` Cal Sans，內文 Golos Text `16/24 #9F9FA4`，編號 `30px #E3E3E8`。手機全部圖上字下，較寬斷點才套偶數卡 `column-reverse`。
- **輪播（模板 data-settings 為基礎）**：`embla-carousel-react` `loop`，`≤767` 一欄、`768–1200` 兩欄、`≥1201` 三欄；30px gap，autoplay 依最新需求由 5000ms 加快為 **4000ms**，hover 暫停、`reduced-motion` 不自動播、可拖曳、無箭頭／點。資料僅保留 SAKURA、SVAGO、TEKA 三張並編號 `01–03`。卡片 caption 使用 Section 專用媒體查詢：`<640 = 192px`、`640–767 = 177px`、`768–1200 = 196px`、`≥1201 = 230px`；不混用會互相覆蓋的 `sm:` 與 arbitrary breakpoint，確保三卡等高並恢復 1512px 已確認的 560px 卡高。
- **內容與素材**：僅保留三個已指定品牌的卡片；原模板英文 excerpt 維持不變。品牌標題與產品圖皆本地化至 `public/services/`，破圖仍 fallback `/kitchen-styles/elegant.jpg`。寬版三張卡的圖片位置依最新驗收改為「上／下／上」：01 SAKURA 圖上字下、02 SVAGO 字上圖下、03 TEKA 圖上字下；手機仍統一圖上字下。
- **跑馬燈**：`MarqueeBand` 位於 Services `<section>` 內，共用 `h6-bg-2.jpg`、黑色 76% overlay 與同一裁切範圍。五個品牌 Logo 每格 `170×50px`、左右各 70px，依 SAKURA 官網順序循環；內容由兩組增加為四組，動畫改為位移一組的 `-25%`，實際每 16 秒仍移動 1550px，速度與方向不變，但總軌道 6200px 可完整覆蓋 4K，不再露出右側空白。

### ServicesSection RWD QA（2026-07-30）

- **Source visual truth**：以已購買模板 `/Users/eric/Desktop/Header-Design/antra-full 2/antra/dummy-data/homepage/home-6.xml` 的 Home 6 Elementor instance 與 `assets/css/base/elementor.css` style-3 為基準；`frontend-design` 檢查用於確認模板原生 1083px 標題內框、1410px 主版心與卡片視覺層級，沒有重設今日已確認的品牌、素材、Hover 或動態。
- **完整斷點**：已驗證 `390、767、768、880、881、1024、1025、1200、1201、1366、1367、1512、1920、2560、3840px`。Section padding 精確在 `768／1025／1201px` 切換；標題在 `768px` 變為 `45/50`，於 `881px` 恢復模板的 30:70 橫排與 `60/64`，不存在 Tailwind named breakpoint 提前覆蓋。
- **版心與卡片**：1512px 起主內容固定為 1410px、標題列固定為 1083px 並水平置中；1920、2560、3840px 不再放大卡片。三卡高度實測為 390px=`462px`、767px=`447px`、768–1200px=`526px`、≥1201px=`560px`，同一斷點三張完全等高；桌面維持 SAKURA → SVAGO → TEKA、圖片上／下／上及原本 Logo 光學校正。
- **輪播互動**：4000ms autoplay 實測會前進，滑鼠進入輪播後暫停；`prefers-reduced-motion` 下保持第一張不自動移動。卡片 Hover 時圖片的 Tailwind v4 獨立 `scale` computed value 由 `none` 變成 `1.1`；這不是傳統 `transform` 字串，因此 QA 不再用 `transform:none` 誤判。
- **Logo 跑馬燈**：四組各 1550px、總軌道 6200px，3840px viewport 仍完整覆蓋；每 16 秒位移一組，速度與方向未變。只有第一組暴露給輔助技術，另外三組標記 `aria-hidden`，避免 4K 補軌後重複朗讀。
- **回歸結果**：15 個寬度皆 `scrollWidth === clientWidth`；三張產品圖無破圖，無 Vite error overlay、console error 或 page error。Header、左側品牌抽屜、右側浮動按鈕與下一個 GallerySection 均未修改。
- **視覺證據**：1512px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/services-rwd-after-1512.png`；3840px `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/services-rwd-after-3840.png`；Hover `/Users/eric/.codex/visualizations/2026/07/17/019f6e20-caa2-7f73-96fb-e7e6ebd3d13d/services-rwd-hover-1512.png`。
- **final result: passed**

## 門市案例（Gallery）— Antra Home Three 版型

`GallerySection.tsx`：對位 Home Three gallery 版型（section 高/位置/膠囊/大標/箭頭照模板實測 + 主題 `heading.php`），**但右側依使用者規則做「背景=主圖 + 2 卡聯動」**（非模板原生的 3 欄 swiper）。字型用模板 Cal Sans、金 `#C9AA79`，內容為 **SAKURA 門市案例**。

- **輪播規則（使用者指定）**：**全出血背景 = 目前主圖(#active)**，右邊固定**只 2 張卡** = 下兩張(#active+1、#active+2)；前進時背景與兩卡一起輪替（背景交叉淡入 + `useParallax('.gallery-bg')` scale 1.12、卡片/段落 `animate-gallery-card` 滑入）。`useState(active)` 驅動，autoplay 依最新需求由 4s 加快為 **3.2s**（hover 或鍵盤 focus 暫停），支援指標拖曳。
- **Section／RWD**：高度維持 `min-height:956px`；背景真正 full-bleed，內容不塞入 1410px 版心。`≤1024px` 依模板 tablet 規則置中堆疊；手機／平板使用 15／30px 安全距離，並把 fixed Header 的 60px 計入 top spacing。`1025–1512px` 以 Gallery 專用 CSS 變數連續插值，1512px 精確回到左 51px、top 388px；`≥1512px` 不再放大卡片。
- **背景底圖**：等於目前 `CASES[active].image`，使用 700ms crossfade 與既有 `useParallax('.gallery-bg')`。依第 6 點要求不增加整區深色漸層遮罩。
- **左：標題區**：只更新模板文字，圖片與動畫不動。**副標膠囊**（`border-white/25`、`rounded-[24px]`、`padding 3/13/3/9`、金點 + `門市案例` 15/ls1）+ 大標（`Interior design`＝模板 Home Three 逐字；桌面 **110/100**、tablet-extra `76/90`、tablet `42/50`、mobile `40/45`、capitalize）+ 原版段落 `Lorem ipsum dolor sit amet consectetur. Magna nunc porttitor convallis faucibus laoreet.`（白色、18/24、寬 378）+ **CTA 按鈕**（見下）。
- **CTA 按鈕**：與品牌承諾區統一鎖定為全站內容型 CTA 規格：總高 **60px**、`padding 9/9/9/30`、文字 **15/22px**、icon gap 8px、圖示圈 **40×40px**；按鈕與內圓均禁止 flex shrink，欄位改寬時不縮放、不換行。未 hover 時金圓外層以 `antra-lexus-scale 2s infinite` 產生雷達水波；hover 整顆 CTA 後停止並隱藏水波，原本填金／箭頭轉正效果不變。
- **右：2 張縮圖**：正方形、`rounded-3xl`；390px 為 170px、768–1024px 固定 220px，1025–1200／1200–1280／1280–1440 分別平滑由 `140→230／230→280／280→295px`，1440px 起固定 295px。桌面保持靠右與圖片上／下聯動，hover 陰影及圖片 `scale(1.06)` 不變。
- **箭頭**：42×42 圓框、`border-white/25`、Lucide `ArrowLeft/ArrowRight`。控制群仍是 Section 內容層的直接子元素，`left:50%` 以整個 Section 水平置中；`≤1024px` 位於縮圖下方，`≥1025px` 的 top 由 content top＋row offset＋card size 計算，確保底線跟卡片同步。1512px 保持 `x=704 / y=901`。
- **內容 = 3 則門市案例**：素材為 `public/home-2026/gallery/yuan-aifei.jpg`、`old-house-kitchen.jpg`、`custom-kitchen.jpg`。背景與兩卡聯動、3.2 秒 autoplay、拖曳、點擊、hover 與 Reveal 保留；減少動態模式停止自動播放並移除轉場。

## What We Do — Antra Home Six 版型

`WhatWeDoSection.tsx`：複刻 Home Six 的「What we do」兩欄區（淺色白底、顯示字用 Cal Sans、內文用 Golos Text、模板金 `#CAA05C`）。右欄影片為 SAKURA 額外功能，因此保留；其餘文字、欄寬、背景裝飾與響應式間距依 Home 6 instance `f0420ee`。

- **Section / 欄位**：採 Elementor 原生臨界點，而不是 Tailwind `lg/antra` 的近似值：`≤767px` padding `60px 15px`、`768–1024px` `80px 30px`、`1025–1200px` `100px 30px`、`≥1201px` `120px 30px 115px`；內容版心固定 1410px。依 Home 6 的 `mobile-extra` 規則，`≤880px` 單欄、`≥881px` 恢復雙欄；雙欄保留今日確認的 `44fr / 56fr`，`881–1200px` gap 30px、`≥1201px` gap 70px。
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
- **影片狀態**：已接入 YouTube `wH374AF9wLI`。初始顯示影片縮圖，點擊播放鈕後在原 16:9 卡片內切換 autoplay iframe；縮圖或 iframe 載入失敗時，前端會完整顯示原因、影片 ID 與 YouTube 備援連結。What We Do 英文為 Home 6 原文；CTA 中文依內容保留規則維持「櫻花優勢」。

### What We Do 瀏覽器驗收（2026-07-17）

- **字型載入**：`document.fonts.ready` 後，Cal Sans 60px／18px 與 Golos Text 16px 的 `document.fonts.check()` 均為 `true`，不是只有 CSS family 名稱正確、實際卻落到 fallback。
- **1512px 最新欄寬**：section padding 維持 `120px 30px 115px`、版心 1410px；Grid 更新後扣除 70px gap 的可分配寬度為 1340px，文字／影片理論欄寬約 `589.6 / 750.4px`。h2 仍為 Cal Sans 400 `60/64`，CTA 15px；兩欄 `items-center`、影片 16:9 與 Section 高度不變。
- **全斷點實測（2026-07-31）**：已逐一驗證 `390 / 767 / 768 / 880 / 881 / 1024 / 1025 / 1200 / 1201 / 1366 / 1367 / 1512 / 1920 / 2560 / 3840px`。15 組皆為 `scrollWidth === clientWidth`、圖片完整載入且無 console/page error；880px 為 820px 單欄，881px 正確切為 `348.03 / 442.95px` 雙欄，1024/1025px padding 分別為 80/100px，1200/1201px 則正確切換 `100px + 30px gap`／`120px 30px 115px + 70px gap`。
- **寬螢幕鎖定**：1512px 的 1410px 版心位於 x=51，1920/2560/3840px 分別位於 x=255/575/1215；三者內容尺寸均維持文字 589.59px、影片 750.39px、gap 70px，沒有因 viewport 放大而把字、CTA 或影片無限制放大。驗收圖為 `what-we-do-rwd-after-{390,1024,1200,1512,3840}.png`。
- **播放鈕實測**：依使用者指定，1512px 為正圓 `137×137`、icon 40px、margin-bottom 8px；1024px 為正圓 `77×77`、icon 35px；390px 為正圓 `87×87`、icon 40px。三斷點均無水平溢位；`antra-icon` 字型載入成功，`::after` transform 取樣有持續變化，確認雷達動畫不是只有宣告但未執行。
- **互動／狀態實測**：CTA 未 hover 時 `antra-lexus-scale` 正常執行，hover 後切為 `animation:none; opacity:0`；播放鈕水波正常。點擊後 iframe URL 為 `youtube.com/embed/wH374AF9wLI?autoplay=1…`，包含 autoplay、加密媒體、picture-in-picture、web-share 與 fullscreen 權限。攔截縮圖載入時，卡片內完整顯示錯誤原因、影片 ID 與正確的 YouTube 備援連結。
- **Reduced motion**：在 `prefers-reduced-motion: reduce` 下，CTA／播放鈕水波均停止、藍圖視差 transform 為 none，Reveal 全部直接可見，沒有初始 transform 導致的錯位或空白。
- **臨界點校正（2026-07-31）**：修正先前把 `lg=1024px` 當成 Elementor `mobile-extra` 結束點的錯誤。現在 `880→881px` 才由單欄切成雙欄，`1024→1025px` 只切換 section padding `80→100px`，`1200→1201px` 再切換桌面 padding 與 gap `30→70px`；h2 則為 `≤767px 30/35`、`768–880px 45/50`、`≥881px 60/64`。
- **390×844**：section padding `60px 15px`、單欄且 gap 30px；h2 Cal Sans 400 `30/35`、eyebrow Cal Sans `12/22` + 1px tracking、清單 Cal Sans `18/24`、段落 Golos Text `16/24`、CTA 15px。CTA 另以外層 flex 真正置中，修正原本 `inline-flex + mx-auto` 不會產生自動左右 margin 的問題。
- **主控台**：本 section 無 error／warning；僅既有 Google Maps 的 async 載入與舊 Marker API 兩則 warning，屬明確排除、不在本次 What We Do 修改範圍。
- **來源與限制**：數值以已購模板 `antra/dummy-data/homepage/home-6.xml`、`antra/assets/css/base/elementor.css` 與原始 `h6-bg-3.png` 為準；`frontend-design` 檢查只用來辨識 Home 6 的視覺層級與 Elementor 原生 breakpoint，沒有重設今日鎖定的 44/56 欄比、70px gap、大影片、CTA 或播放互動。模板 demo 網域在目前瀏覽器環境被政策阻擋，購買包也沒有這一段的完整頁截圖，所以已完成原始碼數值＋本機實際渲染驗收，但無法宣稱做過來源截圖的逐像素疊圖；若補一張模板該區截圖，可再做最後視覺差分。

## 門市查詢（Store Locations）— Antra Contact Us 風格 + 可用地圖搜尋

`StoreLocationSection.tsx`：套 Antra「Contact Us」視覺（淺灰底 `#f6f6f6`、膠囊 eyebrow、雙色大標、白色圓角卡片、金色 `#C9AA79`），並把原本的空佔位地圖與無效搜尋**做成真的能用**：

- **防爆版安全容器（2026-07-19）**：原本 `max-w-[1410px] mx-auto` 在 viewport 小於 1410px 時沒有任何左右留白，且標題直接固定為 `424px + 661px`，會被 section 的 `overflow-hidden` 裁掉。現改為 `max-w-[1512px]`，左側採 `20 / 32 / 51px` 安全留白，右側額外保留 `88 / 90 / 86px` 給固定懸浮列；`lg=1024px` 起仍維持原本水平結構，但標題改用 `minmax(260px,424px) + minmax(0,1fr)`，地圖／列表子欄加入 `min-w-0`，篩選器與地址／電話在 1024–1279px 允許內部重排。1512px 完整維持原本水平版型，同時避免瀏覽器縮放、窄桌機或右側懸浮按鈕裁切互動內容。
- **1024–1199px 控制列校正（2026-07-31）**：這個區間依需求繼續維持地圖／列表水平排列，不以提早堆疊逃避問題。右欄約 305–372px 時，三個 52px 高等寬控制原本仍繼承 `sm` 的 20/40px 內距，導致 1024px 的「選擇區域／選擇城市」只剩「選擇」，「我的位置」內容寬也超出 12px。現在只在 `1024–1199px` 將按鈕縮為 13px、左右 10px、準星 18px，下拉縮為 13px、左右 10/26px、箭頭 14px；三欄、順序、外型與互動不變，1200px 起自動回到既有 15px 完整規格，1512px 畫面零位移。

- **標題版型（依「首頁 Section 說明.pptx」slide 2 門市地圖）**：**分欄標題**——eyebrow `get in touch`（桌面左欄最大 424px）+ 大標推到右邊 `Have a Project in ⟨Mind? Let’s Make⟩ It Happen`（模板 Contact 頁逐字；`Mind? Let’s Make` 金色，彎引號 ’）。**加十字裝飾線**（與 `PricingSection` 相同：橫線 `left-[-13px] top-[16px] w-[502px] h-px`、直線 `left-[363px] top-[-38px] h-[179px]`、兩端 15px 三角、色 `#e3e3e8`、`hidden lg:block`），座標與 Pricing 一致 → 同位置。
- **左欄（寬，~62%）**：**Google Maps JavaScript API 自訂地圖**（`GoogleStoreMap.tsx`），套**極簡淺灰樣式**（`LIGHT_STYLE` style JSON，仿官網 store/location 的 Positron 淺灰風）+ **深色水滴「S」標記**（inline SVG）；選取/篩選門市時 `google.maps.Geocoder` 依地址定位、`panTo` 平移（結果 cache）。
  - **需金鑰**：在專案根目錄建立 `.env`，設定 `VITE_GOOGLE_MAPS_API_KEY=你的金鑰`（`.env` 已加入 `.gitignore` 不會 commit），並在 Google Cloud 啟用 **Maps JavaScript API** 與 **Geocoding API**；金鑰建議以 HTTP referrer 限制網域。改 `.env` 後需**重啟 `pnpm dev`**（Vite 環境變數不熱更新）。
  - **無金鑰/載入失敗**：地圖區直接顯示完整錯誤訊息（依全域規則「錯誤完整顯示在前端」），不靜默空白。
- **右欄（窄）**：`我的位置` 改成與 **`選擇區域` / `選擇城市`** 相同的 52px 高白底圓角按鈕；三個控制固定使用等寬三欄同排，窄螢幕縮小內距、字級與圖示避免爆版。位置按鈕保留 `LocateFixed` 金色準星，兩個下拉維持 `appearance-none` + 疊自訂 `ChevronDown`。下方改為固定四列的機場 split-flap 門市資訊板：每列維持固定高度，第一行區域 pill + 店名，第二行 `MapPin` 地址 + 金色電話；選中仍為金底白字。
- **機場翻牌輪換**：目前 5 間真實門市中固定顯示 4 間，第 5 間作為候補；翻牌等待間隔依最新需求由 `2.8s` 加快為 **`2.2s`**，翻動本身仍使用 `760ms` 3D `rotateX`。卡面不加中央分隔線；畫面同時不出現重複門市，已選取並控制地圖的門市不會被自動換走。hover 或鍵盤 focus 進入資訊板即暫停；`prefers-reduced-motion` 完全停用輪換。
- **級聯篩選**：`region` / `city` 兩個 state 驅動；選區域自動清空城市、城市下拉未選區域時 disabled（`REGIONS` 提供五大區→縣市對照）。`filtered = STORES.filter(區域符合 && 城市符合)`；選取門市若被濾掉自動退回第一筆可見門市；該區無資料顯示「此區域尚無門市資料」。
- **門市資料**：pptx 真實資料共 5 間（承德 / 石牌 / 民權 / 中山南京 / 八德，皆北部/臺北市，含真地址電話）；其他區暫無資料，補上即可用。

### 門市查詢全斷點驗收（2026-07-31）

- **15 組 viewport**：已逐一驗證 `390 / 767 / 768 / 880 / 881 / 1024 / 1025 / 1200 / 1201 / 1366 / 1367 / 1512 / 1920 / 2560 / 3840px`，全部 `scrollWidth === clientWidth`，控制項與四張門市卡均無內部 overflow、console error 或 page error。`frontend-design` 檢查只用於辨識資訊密度與觸控安全，沒有模板化這個原創 Section。
- **版型鎖定**：390–881px 維持地圖／門市板垂直排列，1024px 起維持水平排列；1512px 完整保留外框 1512px、內容 x=51–1426、地圖 852.5px、gap 32px、門市欄 490.5px。1920/2560/3840px 外框分別置中於 x=204/524/1164，內部尺寸不再放大。
- **1024px 修正結果**：地圖 549.94px、門市欄 305.06px、三個控制各 93.69px；「我的位置／選擇區域／選擇城市」完整顯示，三者 `scrollWidth <= clientWidth`。1200px 起回到原 15px 控制規格，1512px 修改前後位置與尺寸完全一致。
- **懸浮列安全距離**：390/767/1024/1512px 的內容右緣至懸浮列左緣分別保留 16/16/12/12px；滑到底時懸浮列 top=112px，固定 Header bottom=60px，仍保留 52px 呼吸空間，不與 Header 打架。
- **翻牌與操作**：實測 2.2 秒後四列中隨機一列換成候補門市，已選門市始終保留；hover 資訊板 3.2 秒完全停止，移出後恢復。點擊門市會切成金底白字並觸發地圖 focus；選擇無資料區域顯示完整「此區域尚無門市資料」，再切回北部／臺北市可恢復四列。
- **Reduced motion／錯誤**：`prefers-reduced-motion: reduce` 下等待 3.3 秒門市順序不變，所有卡面 animation/transform 均為 none。攔截 Google Maps 載入時，地圖區完整顯示 API 金鑰、Maps JavaScript API 與允許網域的排錯資訊，沒有靜默空白。
- **截圖證據**：`store-location-rwd-after-{390,1024,1200,1512,3840}.png`；其中 1024px 用於確認完整控制文字，1512px 用於確認今日客製版型零位移，3840px 用於確認 4K 不放大。

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

## Nuxt 3 — 3.2 案例門市內頁（2026-08-11）

`nuxt-site/pages/gallery/[slug].vue` 已依開版 PPT 第四頁，改用 Antra `Single Post 01 / 02` 與 Home 03 元素組成，不再沿用先前自行設計的巨型「案例分享」Hero、深色規格卡及圓角換頁卡。

- **路由**：`/gallery/case10`、`/gallery/case56`、`/gallery/case35` 共用資料驅動模板；未知 slug 回傳 Nuxt 404。Header、Footer、右側浮動按鈕及 `/gallery` 列表頁均未修改。
- **Breadcrumb Hero**：使用 `/section-3/service-process/breadcrumb-df.jpg`，只顯示「首頁 / 案例門市」；依 Antra Single Blog 原始 Elementor 數值重建，不再使用自訂垂直置中。桌面 padding 為 `207px 30px 139px`、1025–1200px 為 `160px 30px 100px`、768–1024px 為 `120px 30px 80px`、手機為 `100px 15px 60px`；遮罩固定為 `#100801 / 64%`。頁面只有文章標題一個 `h1`。
- **Antra 版心**：1512px viewport 實測 rail `1410px @ x=51`、文章欄 `929.89px`、Sidebar `409.11px`、欄距 `71px`；首圖 `929.89×520px`、標題 `50/54px`。1920／2560／3840px 維持相同內容尺寸置中，不隨螢幕無限制放大。
- **RWD**：1024px 以下轉為單欄；390px 為 360px 內容寬、左右各 15px，首圖 360×202.5px、標題 `25/30px`。實測 390、767、768、1024、1512、1920、2560、3840px 均為 `scrollWidth === clientWidth`；767px 保持 `25/30px`，768px 正確切回模板桌面字級。
- **圖片輪播**：Embla 主圖循環、縮圖 tab、左右箭頭、拖曳與鍵盤 Focus 均保留；圖片錯誤會在原框完整顯示圖片說明及來源路徑，不會靜默破圖。單欄區間 `≤1024px` 的控制組保留 76px 右側安全距離，避免共用懸浮列遮住「下一張」按鈕；懸浮列本身不改。
- **文章資料**：`StoreCaseDetail.article` 改為 `CaseArticleBlock[]`，以標題、段落、單圖／雙圖和正式連結組成。三篇文字逐項核對 SAKURA 官方案例 case10、case56、case35；圖片使用 `public/section-3/cases/` 已提供素材。
- **資料誠信**：case10 顯示 PPT 指定完整規格與安康店聯絡資料；case56、case35 只顯示官方或既有素材可驗證欄位，缺少的營業時間、LINE、電話不補造。
- **Sidebar / 地圖**：全站同尺寸 60px CTA 與水波箭頭、分隔列規格、門市資訊、LINE／電話／地圖連結；地圖改為免 API Key 的 Google Maps Embed，固定保留外部 Google Maps 備援，12 秒未完成載入會在前端顯示完整錯誤。
- **文章下半部**：Antra 細線「上則案例／下則案例」、無假圖示與假評論的文字空狀態、24px 圓角姓名／Email／網站／評論欄位、同意欄位驗證，以及 PPT 指定的 Home 03 三欄「更多案例」。Home 03 保留 30%／70% 標題列、兩側標準卡與中央 560px 高的深色漸層覆蓋卡；評論驗證成功只顯示「尚未連接後台，內容未送出且未儲存」，不執行資料寫入。
- **PPT 第四頁回查修正**：移除文章標題上方自行加入的城市／門市 kicker；規格依 PPT 固定為設計風格、設計顏色、設計系列、設計形式、設計尺寸、廚房坪數、廚具預算、檯面材質、設計師；case10 的括號、連字號、營業時間、電話及地址顯示格式逐字對齊簡報。這次不再以版心尺寸通過取代結構驗收。
- **SEO**：每個案例使用獨立 title、官方文章首段 description、首圖 OG image、article OG type 與 canonical；未知案例不輸出假內容。
- **QA**：三頁皆為 HTTP 200、無 console error、所有本地案例圖片正常；輪播下一張會同步更新 `aria-selected`；空表單完整顯示四項錯誤，合法表單顯示未儲存提示；未知案例為 HTTP 404。`pnpm typecheck` 通過，`NUXT_IGNORE_LOCK=1 pnpm build` 通過；build 僅有 Tailwind v4 既有 sourcemap warning。

## Nuxt 3 — 4.0 優惠消息總覽（2026-08-11）

`nuxt-site/pages/news/index.vue` 已依開版 PPT 第五頁建立 `/news` 優惠消息總覽；4.1 優惠活動列表／內頁、4.2 最新消息列表／內頁及 4.3 媒體影音列表已於後續階段獨立建立。

- **模板來源**：頁面文章區逐項對照已購 Antra 的 `template-parts/posts-grid/item-post-list.php` 與 `style.css` Blog Listview 規則；第一篇使用 Featured Post，後八篇使用水平 Listview，沒有另創卡片外觀。
- **內頁 Hero**：沿用 3.1、3.2 的 Antra Breadcrumb Hero，標題「優惠消息」、麵包屑「首頁 / 優惠消息」，共用相同背景、`#100801 / 64%` 遮罩、字級、高度與斷點。
- **文章資料**：`nuxt-site/data/news.ts` 收錄 PPT 指定九篇，分為優惠活動、最新消息、媒體影音；依 ISO 日期新到舊排序，同為 `2026-02-09` 的兩篇影音依 PPT 順序保留。每筆保存正式站內路徑供分類頁與內頁使用，但依 PPT 範圍，4.0 總覽卡片本身仍不渲染成連結。
- **Recent Posts**：依 PPT 固定顯示 2026 加盟說明會、美式都會 11 坪大廚房、普發一萬加碼活動、高雄品牌館四筆；保留在 Antra 原生右側 Sidebar，搜尋框刪除，並搭配 Categories 與 Popular Tags，所有尚未建立的分類／標籤均不提供假互動。
- **卡片規格**：1410px 置中版心；Featured 圖片比例 `1.7884615385`、標題 `40/44px`；水平列圖片寬 45.2%、比例 `1.4482758621`、內容左距 50px、標題 `30/34px`；圖片圓角 24px、hover `scale(1.08)`、0.5 秒。`≤1024px` 內容距縮為 30px，`≤568px` 改為圖片在上、內容在下，Featured 標題 `30/35px`。
- **總覽互動規則**：九張總覽文章卡片內沒有 `<a>`、`button`、`role=button` 或額外 `tabindex`，不會用游標、鍵盤 Focus 或假按鈕誤導使用者。Header 的「優惠消息」可前往 `/news`；桌面保留原 Hover 下拉，手機加入「優惠消息總覽」。4.1 已完成後由 Header 獨立連到 `/news/activities`，尚未製作的 4.2／4.3 維持 disabled。
- **素材與錯誤**：九張封面整理於 `public/section-4/news/`，大圖限制在 1800px 以控制體積；`InternalNewsImage` 在載入失敗時會於原圖框完整顯示錯誤、替代文字與素材路徑，不顯示破圖圖示。
- **RWD 實測**：390、568、768、1024、1512、1920、2560、3840px 均為 `scrollWidth === clientWidth`。568px（含）九篇皆為上下排列，768px 起除 Featured 外恢復水平列；1512px 起版心固定 1410px，1920／2560／3840px 不再放大。九篇順序、四筆 Recent Posts、零互動卡片及 `prefers-reduced-motion` 均通過自動化檢查。
- **QA**：`pnpm typecheck` 通過；`NUXT_IGNORE_LOCK=1 pnpm build` 通過，僅出現 Tailwind CSS v4 既有 sourcemap warning。八個 viewport 均無 console error、page error、請求失敗或圖片錯誤；`/news` 可 SSR 直接載入，title 為「優惠消息｜SAKURA 整體廚房」。

### PPT 第五頁結構回查修正（2026-08-11）

- 先前把 Recent Posts 誤解成列表上方的 1410px 橫向整排，並因此移除右側 Sidebar；這與 PPT 第五頁的紅框標註及 Blog Listview 參考圖不符，現已刪除該橫排。
- 桌面恢復 Antra 原生雙欄：1410px 版心內為 930px 文章欄、409px Sidebar、71px 欄距；1024px 使用 634px／300px／30px。`≤1023px` 依模板原始 CSS 隱藏 Sidebar，文章改為單欄。
- 右側依 PPT 順序保留「優惠消息」標籤、Categories、Recent Posts；搜尋框刪除。標籤與分類目前為不可點擊文字，避免在 4.1／4.2／4.3 尚未製作時產生假連結；Recent Posts 沿用 PPT 指定四筆資料。
- 第一篇 930px Featured Post 圖片仍保留，因 PPT 最終示意圖明確包含此模板元素；移除的是列表上方額外新增的 Recent Posts 橫條，不是 Featured Post。
- 修正後實測 390／1024／1512／1920／3840px 均無水平溢位、console error 或素材請求失敗；1512px 為 `930 + 71 + 409px`，1024px 為 `634 + 30 + 300px`，橫向 Recent Posts 節點數為 0，Sidebar 三區標題與九篇文章均完整存在。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 通過，仍只有 Tailwind CSS v4 既有 sourcemap warning。
- 依 PPT 右欄最下方參考圖補回模板原生 `Popular Tags`，順序為 Architecture、Building、Construction、Design、Furniture、Interior、Kitchen、Living Room、Planning；沿用 14px 字級、1px 淺灰邊框、100px 膠囊圓角及原生換行間距。標籤目前為不可點擊文字，避免建立未規劃的 tag 路由。

## Nuxt 3 — 4.1 優惠活動列表（2026-08-11）

`nuxt-site/pages/news/activities/index.vue` 已依開版 PPT 第六頁建立 `/news/activities`。本頁採 Antra `Blog-Gridview`，不沿用 4.0 總覽的 Blog Listview 或右側 Sidebar；三個正式活動內頁完成後，卡片已接到對應路由。

- **Hero／麵包屑**：共用 4.0 內頁 Hero 的背景、64% 遮罩、高度、字體與斷點；標題為「優惠活動」，麵包屑依 PPT 顯示「首頁 / 優惠消息」，「優惠消息」可返回 `/news`。
- **三篇正式資料**：只顯示響應政府普發一萬加碼活動、2025 年免費廚房健檢季、廚房升級送好水三篇，沿用 `nuxt-site/data/news.ts` 的正式日期、標題、第一段摘要與 `public/section-4/news/` 素材，順序為 2025-11-01、2025-05-01、2025-04-01。
- **Antra Gridview 規格**：1410px 版心、桌面三欄、30px 欄距、50px 列距；圖片比例 `1.40625`、24px 圓角、hover `scale(1.1)`／0.5 秒；分類膠囊位於圖片 `top/left 20px`；標題 `30/34px` 最多兩行、摘要 `16/24px` 最多三行、內容寬度 90%。
- **RWD**：`≤1024px` 改為兩欄且內容寬度 100%，`≤767px` 改為單欄、左右 15px、標題 `22/28px`；`prefers-reduced-motion` 停止圖片放大與 fixed 背景。
- **導覽狀態**：Header 桌面下拉與手機 Accordion 的「優惠活動」已接到 `/news/activities`；「最新消息」「媒體影音」仍為 disabled，沒有 `#` 假連結。
- **互動範圍**：三張卡片現在都是可鍵盤操作的 NuxtLink，依序連到 `2025_ro_water_sp`、`2025KC`、`2025B2C_Q2SP`；仍未建立搜尋、篩選或假分頁。
- **QA**：開發站 1280×720 實測為三個 `386.664px` 欄位、三篇順序與日期正確、Sidebar 節點 0、Header `/news/activities` 連結存在、圖片錯誤提示 0，且 `scrollWidth === clientWidth`；CSS 斷點依模板鎖定 1024px 兩欄與 767px 單欄。

## Nuxt 3 — 4.1 優惠活動內頁（2026-08-12 回查）

`nuxt-site/pages/news/activities/[slug].vue` 已依開版 PPT 第七頁與 Antra `Blog Single Post 1`、`Projects Details` 元素建立三個資料驅動 SSR 內頁：

- `/news/activities/2025_ro_water_sp`
- `/news/activities/2025KC`
- `/news/activities/2025B2C_Q2SP`

- **PPT 結構**：共用 Header 後顯示「首頁 / 優惠消息 / 優惠活動」Breadcrumb；文章區依序為分類／日期 Meta、文章標題、主圖、正式內文、Projects Details 分類 Tab 與三篇優惠活動輪播，最後接共用 Footer。沒有自行加入 PPT 未指定的 Sidebar、搜尋、留言、社群分享、前後文章卡或輪播區標題。
- **Antra 原始碼對照**：內頁 DOM 依 `content-single.php` 的 `single-content → entry-header → post-thumbnail → entry-content` 順序重建，Meta 依 `inc/template-functions.php` 的 `entry-meta-top / categories-link / posted-on` 結構；尺寸直接對照 `style.css`。Breadcrumb 僅保留 PPT 內頁使用的 185px 影像帶，不沿用列表頁的大標題 Hero。
- **Antra Single Post 規格**：標題與主圖使用 1410px 置中版心，主圖保留 24px 圓角與下方 30px；內文使用模板原生 930px 置中欄、`16/24px` 內文、`40/44px` `h4` 區段標題與 30px 段距。手機文章標題改為 `25/30px`、內文 `h4` 為 `30/33px`、左右 15px。
- **圖片完整顯示修正**：Antra 原始 Single Post 會把主圖強制裁成 `1.7893401015:1`，但本案三張正式主圖均約為 4:3，直接套用會切掉甲方素材上下內容。依本案素材完整性要求，優惠活動內頁主圖改為依原始比例自然撐高並使用 `object-fit: contain`；內文單圖／雙圖同樣維持自然高度。列表卡片及 Projects Details 輪播仍保留模板的固定比例與裁切行為，不受此修正影響。
- **內文流回查**：主圖以下改為 Antra `content.xml` 與 WordPress `entry-content` 的單一內容流，不再把每段包成自訂 Section。段落固定 `16/24px` 與 30px 下距；章節改用模板 `h4` 的桌面 `40/44px`、手機 `30/33px`，上距 60／45px；清單恢復一般文字粗細與原生圓點，不再使用金色圓點、500 字重或額外 Section 留白。內文圖片仍依模板 `.row / .column-item` 邏輯維持桌面雙欄、手機單欄。
- **正式內容**：三篇文字逐段核對櫻花官網正式頁面，不把內文做成一張長截圖。第一篇保留兩組活動、指定機型登錄連結與注意事項；第二篇保留健檢範圍、六大品牌識別、日期、電話、預約與 LINE；第三篇保留活動期間、滿額贈品、兩張圖文說明及門市查詢連結。
- **素材**：主圖沿用 `public/section-4/news/` 正式列表素材；第二篇三張、第三篇兩張內文圖由甲方素材包整理至 `public/section-4/news/activities/`，最長邊限制 1800px。所有圖片均透過 `InternalNewsImage` 顯示，載入失敗時會在原位置呈現錯誤原因、圖片說明與路徑。
- **Projects Details 分類 Tab**：依 PPT 母版補回四個圓角 Tab 與各自圖示；「優惠活動」為金色啟用狀態並可返回 4.1 列表，尚未建立的「最新消息」「媒體影音」「廚房裝修指南」顯示為 `aria-disabled`，不使用 `#` 或不存在的假路由。
- **Projects Details 輪播**：`InternalActivityRelatedCarousel` 改用 Antra `template-parts/project/block/style-default.php` 與 project style 1 的結構：三欄、圖片比例 `0.8333333333`、24px 圓角、圖片上分類框、`30/34px` 標題、分類／年份資訊與 hover `scale(1.05)`。依 PPT 移除額外英文標題、中文大標、視覺分隔線及桌面箭頭，保留拖曳、鍵盤 Focus、目前頁 `aria-current`，三張卡均連至正式本機文章。
- **路由修正**：為避免 Nuxt 將 `/news/activities/:slug` 錯誤解析回列表，列表由同層 `activities.vue` 改為標準巢狀 `activities/index.vue`；三個內頁可直接重新整理，未知 slug 回傳共用 404 並完整顯示「不存在或尚未公開」。
- **PPT 回查修正／QA**：第二輪以 PPT 第七頁嵌入的 `Blog Single Post 1`、`Projects Details` 畫面逐區比對，移除第一版自行加入的 Related 標題、箭頭、白底分區、注意事項框與 CTA 膠囊。1512×956 實測 Breadcrumb 高度 185px、文章 1410／930px 雙版心、Project 三卡完整，三個內頁皆為一個 `h1`、四個分類 Tab、三張輪播卡、圖片錯誤提示 0，且 `scrollWidth === clientWidth`；390×844 實測主圖、標題與內文為單欄且無水平爆版。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過，build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 3.x／4.x Antra 原生進場動畫（2026-08-12）

- **根因與核心修正**：舊版 `v-reveal` 只會加入 `is-visible`，沒有解析指令傳入的 `anim`、`delay` 或 `duration`，新頁面即使宣告動畫名稱也不會得到 Antra 的 hidden state 與 keyframe。`nuxt-site/plugins/reveal.ts` 現在於 SSR 與 Client 同步輸出 `.ev`、`data-ev`、delay 與速度 class，支援 `opalMoveUp／Down／Left／Right／opalScaleUp`，並相容首頁既有 `slideIn*／fadeIn*`。
- **觸發規則**：IntersectionObserver 使用 `threshold: 0.01` 與底部 `-10%` root margin，元素進入接近 Elementor Waypoint 的位置後只播放一次；路由重新進入會建立新的 observer。元件卸載會解除 observer，快速捲動或上一頁不會留下永久隱藏內容。
- **速度與無障礙**：預設 `normal=1.25s`、`fast=0.75s`、`slow=2s`；指定 delay 以毫秒輸出，未指定時保留元素原有 delay。`prefers-reduced-motion: reduce` 時不建立 observer，CSS 強制 `visibility:visible` 與 `animation:none`。瀏覽器以強制 reduced-motion 模式在 390／768／1024／1512／1920／3840px 實測 `/service-process`：15 個 Reveal 節點全部可見、animated=0，六個寬度皆無水平溢位。
- **3.1 服務流程**：Breadcrumb、段落、八步流程、品牌影片與 FAQ 分別使用模板的 Up／Left／Right／Scale 動畫；流程每列依 `0／100／200／300ms` 階梯延遲。FAQ Accordion 的展開收合與播放鈕水波未修改。
- **3.2 案例門市**：列表篩選、數量、結果格線與空狀態使用 `opalMoveUp`，region／city query 改變後 keyed grid 會重新播放。三個案例內頁補齊標題、輪播外框、非 sticky 的 Sidebar 內容、文章圖文、前後案例、評論及更多案例動畫；Embla track、sticky 容器、地圖、CTA 水波與表單狀態沒有套 transform 動畫。
- **4.0／4.1 優惠消息**：`/news` 的 Featured／Listview 文章與四個 Sidebar widgets 採 Up／Left，文章延遲最高 240ms；`/news/activities` 三卡為 `0／100／200ms`。三個活動內頁的 Meta／標題、自然比例主圖、文章流、分類 Tab 與 Projects Details 外框使用 Up／Scale，沒有碰 Embla track 或恢復圖片裁切。
- **十頁實機 QA**：已逐頁檢查 `/service-process`、`/gallery`、三個 `/gallery/:slug`、`/news`、`/news/activities` 與三個 `/news/activities/:slug`。每頁由頂部一路捲到底後，`.ev:not(.is-visible)` 均為 0；所有觸發元素的 computed `animation-name` 與 `data-ev` 一致，duration 僅為 0.75／1.25／2 秒，十頁皆 `scrollWidth === clientWidth`。
- **首頁回歸**：首頁仍保留 `slideInLeft／slideInRight／slideInUp／fadeIn／fadeInUp`；Hero 實測仍為 `slideInLeft + 2s`，未被新頁的 Opal 設定覆寫。隱私權頁未加入 Reveal。
- **建置結果**：`pnpm typecheck` 通過；因 3002 開發伺服器持續供預覽使用，production build 以 `NUXT_IGNORE_LOCK=1 pnpm build` 通過。輸出只有 Tailwind CSS v4 既有的 sourcemap warning，沒有新增編譯或型別錯誤。

## Nuxt 3 — 4.2 最新消息列表（2026-08-12）

`nuxt-site/pages/news/latest/index.vue` 已依開版 PPT 第八頁建立 `/news/latest`；PPT 左側 Sitemap 標示的 4.2.1–4.2.3 內頁亦已於第九頁階段完成。

- **PPT 結構真值**：頁面使用 Antra 母版 `Blog-Gridview`，不是 4.0 的 Blog Listview／Sidebar，也不沿用舊官網 Latest News 的首篇橫幅。Hero 標題為「最新消息」，Breadcrumb 完整顯示「首頁 / 優惠消息 / 最新消息」，其後直接進入三欄文章格線。
- **Antra 原始碼對照**：卡片依已購模板 `template-parts/posts-grid/item-post-style-1.php` 與 `style.css` 的 `.blog-style-grid .post-style-1` 重建：圖片比例 `1.40625`、24px 圓角、分類膠囊位於 `top/left 20px`、圖片 Hover `scale(1.1)`／0.5 秒、標題 `30/34px` 最多兩行、摘要 `16/24px` 最多三行、內容寬 90%。
- **三篇正式資料**：依 PPT 固定為 2026 加盟說明會（2026-06-15）、高雄品牌館（2025-10-01）、2025 台北加盟展（2025-02-03），順序由新到舊。摘要改採 PPT 指定的官網「各篇第一段內文」：第一篇「歡迎您加盟櫻花整體廚房，一起創造美好生活！」、第二篇完整高雄品牌館第一段、第三篇「SAKURA KITCHEN 來了！」，不再沿用總覽卡片的自寫濃縮內容。
- **連結誠信**：三張卡片現已使用 `NuxtLink` 接到正式的 4.2.1–4.2.3 站內路由，保留模板圖片 Hover、鍵盤 Focus 與可理解的連結語意，不使用 `#` 或不存在的假路由。
- **導覽同步**：桌面 Header Hover 下拉與手機 Accordion 的「最新消息」已由 disabled 改連 `/news/latest`；優惠活動內頁底部的分類 Tab 也同步啟用「最新消息」。4.3 媒體影音仍維持 disabled。
- **動畫**：Breadcrumb 與三張文章卡使用共用 Antra `opalMoveUp`，卡片依 `0／100／200ms` 延遲；reduced-motion 實測 4 個 Reveal 節點全部可見且 animation-name 全為 none。
- **RWD／QA**：390px 為一欄，768／1024px 為兩欄，1512／1920／2560／3840px 為固定 1410px 版心三欄；七個寬度均 `scrollWidth === clientWidth`、三張圖片無錯誤、Header 最新消息連結存在。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過，build 只有 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 4.2 最新消息內頁（2026-08-12）

`nuxt-site/pages/news/latest/[slug].vue` 已依開版 PPT 第九頁完成三筆 SSR 詳細頁：`/news/latest/2026-franchise-seminar`、`/news/latest/kaohsiung_opening`、`/news/latest/2025-franchise-exhibition`。共同使用型別化的 `nuxt-site/data/latestArticles.ts`，未知 slug 由 Nuxt 404 在前端完整顯示錯誤。

- **PPT／模板結構**：採 Antra `Single Post 01` 的 185px 小型 Breadcrumb、1410px 標題與首圖、930px 文章欄；內文圖片採 `Single Post 02` 的 1290px breakout 與 24px 圓角，並依 PPT 插入 `Projects Details` 式單張／雙欄圖片段落。頁尾保留四個分類 Tab 與 Home 03 三欄同分類文章輪播，不加入 PPT 未要求的 Sidebar、分享、評論或前後篇卡片。
- **正式內容與素材**：2026 加盟說明會只呈現可驗證的官方導語、報名入口與素材包提供的台北／台中／高雄場次圖，不自行補寫招商宣稱；高雄品牌館及 2025 加盟展逐段使用官方文章內容。十二張正式圖片整理至 `public/section-4/news/latest/`，文章主圖與內文圖皆以自然比例完整顯示，不使用固定高度裁切；圖片失敗時由共用 `InternalNewsImage` 在原位置顯示完整原因與素材路徑。
- **動畫與互動**：Breadcrumb、Meta／標題與文章段落使用 `opalMoveUp`，首圖及 Projects Details 圖片外層使用 `opalScaleUp`；真正負責 1290px 水平定位的內層不套 Reveal transform，避免動畫覆蓋 `translateX(-50%)` 造成水平爆版。底部 Embla track 不套 Reveal，只動畫其純外層，保留拖曳、循環、Hover 與 Focus。
- **RWD／QA**：390／768／1024／1512／1920／2560／3840px 實測均 `scrollWidth === clientWidth`；桌機維持 1410／930／1290px 三層版心，手機皆為 15px 安全邊距且雙圖自動單欄。三頁正式圖片均載入成功、無前端錯誤提示；`prefers-reduced-motion` 下 14 個 Reveal 節點皆 `animation-name:none`、`opacity:1`，內容立即顯示。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過，build 僅有 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 4.3 媒體影音列表（2026-08-12）

`nuxt-site/pages/news/video/index.vue` 已依開版 PPT 第十頁建立 `/news/video`；第十一頁的三個正式詳細頁完成後，列表三卡已接到對應站內路由，但列表本身仍不放播放控制，避免混淆「開啟文章」與「播放影片」。

- **PPT／模板真值**：採 Antra `Blog-Gridview` 母版，Hero 顯示「媒體影音」及完整「首頁 / 優惠消息 / 媒體影音」Breadcrumb；內容區只有三欄文章格線，不加入 4.0 才有的 Sidebar、搜尋、標籤、Recent Posts 或假分頁。
- **三篇正式資料**：依 PPT 順序顯示「美式都會11坪大廚房」、「侘寂色感 x 高效收納」及「經商企業主首選」；分類、日期、標題與第一段摘要沿用 `nuxt-site/data/news.ts`。封面使用素材包提供並已整理至 `public/section-4/news/video-*.jpg` 的三張正式圖片，載入失敗時仍由共用 `InternalNewsImage` 在原位置完整顯示原因與素材路徑。
- **Antra 幾何／動畫**：1410px 版心、30px 欄距、桌機單卡 450px、圖片比例 `1.40625`、24px 圓角、30/34px 標題、圖片 Hover `scale(1.1)` 與 0.5 秒過渡皆沿用 Blog Gridview。三卡使用 `opalMoveUp` 並依序延遲 0／100／200ms；系統 reduced-motion 時立即顯示且停用位移與 Hover 放大。
- **導覽與 RWD QA**：Header 桌面 Hover 下拉、手機 Accordion，以及 4.1／4.2 內頁底部分類 Tab 均已接到 `/news/video`。390px 一欄、768／1024px 兩欄、1512／1920／2560／3840px 固定 1410px 三欄；七個寬度均 `scrollWidth === clientWidth`，三張圖片與文字無錯誤。三卡現為可鍵盤操作的 NuxtLink，依序進入 `american_urban`、`wabisabi`、`business`；四個 Reveal 節點在 reduced-motion 下皆為 `animation-name:none`、`opacity:1`。

## Nuxt 3 — 4.3 媒體影音內頁（2026-08-12）

`nuxt-site/pages/news/video/[slug].vue` 已依開版 PPT 第十一頁完成三筆資料驅動 SSR 詳細頁：

- `/news/video/american_urban`
- `/news/video/wabisabi`
- `/news/video/business`

- **PPT／Antra 結構**：使用 `Single Post 01` 的 185px 小型 Breadcrumb、文章 Meta 與 `50/54px` 標題；主影片改用 PPT 指定的 Home One Video Popup 元素，接著為 930px 正式內文、Projects Details 四分類 Tab 及三篇媒體影音輪播。未加入 PPT 沒有的 Sidebar、搜尋、分享、留言、前後篇卡或額外區段標題。
- **正式影片來源**：三支 YouTube ID 不是依縮圖猜測，而是逐篇由櫻花官網播放按鈕核對，依序為 `lbSOIDpM5Ic`、`Fv_B1sN2z6I`、`ZRHA-9Rm_vg`。初始狀態保留正式封面與模板正圓 96px 水波播放鍵；點擊後才在原本 16:9 區域載入 `youtube-nocookie.com` iframe，啟用 autoplay、playsinline 與 fullscreen。
- **正式文章內容**：三篇段落與裝修案例連結整理在 `nuxt-site/data/mediaVideos.ts`，逐篇核對官網 `/news/video/american_urban`、`wabisabi`、`business`；沒有自行補寫設計宣稱。Unknown slug 由 Nuxt 404 完整顯示「不存在或尚未公開」。
- **影片錯誤介面**：載入中顯示可理解狀態；iframe error 或 12 秒逾時會在原影片區顯示「影片載入失敗」、影片 ID、可能原因及「前往 YouTube 觀看」連結，不會只留下空白或黑框。實測觸發 `american_urban` 錯誤後，備援連結正確指向 `https://www.youtube.com/watch?v=lbSOIDpM5Ic`。
- **Projects Details 輪播**：`InternalMediaRelatedCarousel` 沿用 Antra 專案卡片幾何：三欄、30px 間距、圖片比例 `.8333333333`、24px 圓角、分類框、`30/34px` 標題與 Hover `scale(1.05)`；三卡都可切換正式媒體內頁，目前頁使用 `aria-current`，Embla track 本身不套 Reveal transform。
- **動畫／RWD QA**：Breadcrumb、Meta／標題、影片外框、內文、分類 Tab 與輪播外框分別使用 `opalMoveUp／opalScaleUp`；390、768、1024、1512、1920、2560、3840px 均為 `scrollWidth === clientWidth`。1512px 實測 Breadcrumb 185px、Header／影片 1410px、內文 930px、播放鍵 96px；390px 影片為 360×202.5px 完整 16:9。1920／2560／3840px 影片維持 1410px，不會隨螢幕無限放大。`prefers-reduced-motion` 實測六個 Reveal 節點全部立即可見、動畫為 `none`，播放鍵水波亦停止。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過；production build 只有 Tailwind CSS v4 既有 sourcemap warning。

## Vercel Nuxt SSR 部署修正（2026-08-12）

- **症狀**：Vercel 的 Nuxt Client、SSR 與 Nitro `vercel` preset 全數建置成功，也已產生 `.vercel/output/functions/__fallback.func`，但最後仍以 `No Output Directory named "dist" found` 判定失敗。
- **背景條件**：此 Vercel Project 建立於 React/Vite 階段，Dashboard Framework Preset 仍為 Vite；因此 Vercel 沒有在根目錄找到有效的 Nuxt Build Output API 時，會退回舊 Framework 的 `dist` 規則。
- **第一個假設被否定**：`vercel.json` 的 `"outputDirectory": null` 雖符合 schema，Vercel CLI 仍會合併專案的舊 Vite 預設並尋找 `dist`，實測無法消除本次錯誤，因此未保留這個無效設定。
- **確認後的根因**：Nuxt 位於 pnpm workspace 的 `nuxt-site/`，Nitro `vercel` preset 實際把完整 Build Output API 寫到 `nuxt-site/.vercel/output`；Vercel 從 Repository 根目錄建置，只檢查根目錄 `.vercel/output`，沒有接到子目錄內的 SSR function 與 routes，最後才退回舊 Vite 的 `dist` 規則。
- **修正**：`nuxt-site/nuxt.config.ts` 在 `VERCEL` 環境下將 Nitro `output.dir` 指到 `../.vercel/output`，使 `config.json`、`static/` 與 `functions/__fallback.func` 一起落在 Repository 根目錄。保留本機預設 `.output`，不影響 `pnpm build`／`pnpm preview`。根目錄 `vercel.json` 保留官方 schema、`framework: nuxtjs`、`pnpm install --frozen-lockfile` 與 `pnpm build`，不把輸出錯誤指向 `.vercel/output/static`，避免丟失 SSR。
- **驗收**：以已連結 Project 的 `vercel project inspect` 確認 Dashboard 原 Framework Preset 確實仍為 Vite。修正後執行 `NUXT_IGNORE_LOCK=1 vercel build --yes`，Nitro 在 Repository 根目錄產生 `.vercel/output/config.json`、`static/` 與 `functions/__fallback.func`，Vercel CLI 回傳 `status: ok`、`outputDirRelative: .vercel/output` 與 `Build completed successfully`，不再要求 `dist`。本機 `pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 亦通過；只保留 Tailwind CSS v4 既有 sourcemap warning。
