
# SAKURA Kitchen — Nuxt 3 品牌網站

## 0.0 首頁（2026-08-21 調整）

- 依 `2026.08.21_0.0首頁 _調整.pptx` 第 2、3 頁重核共用 Header、首頁 Hero、Home 09 廚房系列、Kitchen Products、Home 01 案例輪播、Home 06 品牌承諾、門市查詢與 Footer；版型直接沿用專案內 Antra Home 01／06／09 原始模板資料，不以 PPT 或網站截圖充當前端內容。
- Header 導覽統一 Noto Sans TC 15px；2026-08-25 依甲方正式 `橫式英文logo.svg`，桌機與手機 Header 已改用原始白色／紅色向量商標 `public/home-2026/logos/sakura-kitchen-horizontal.svg`，不再把 Footer 金色 PNG 透過濾鏡與 transform 偽裝成 Header Logo。桌機完整尺寸為約 266×21px、1024–1199px 維持 160px 緊湊框、手機為 184px；2026-08-28 桌機 Header 改為「左側平衡欄／四個左選項／中央 Logo／四個右選項／獨立搜尋欄」五欄網格，左右四個選項各自使用相同的四等分位置，搜尋不再參與右側選單寬度計算，因此 Logo 幾何中心固定等於 viewport 中心；搜尋圖示本體維持精確 15×15px、外層保留 40×40px 點擊範圍。桌機下拉改為受控狀態，選項跳轉、路由變更與 Escape 會立即收回。2026-08-25 將「設計案例」原本的小下拉＋品牌系列第二層 Hover 合併成單一全寬視窗：滑入一次即在左側顯示設計靈感／廚房裝修指南／品牌系列型錄，右側同步呈現十大廚房系列，不再需要移到「品牌系列」觸發第二個視窗。2026-08-26 再將左欄 `Design Inspiration` 下方標題由「設計案例」改為「品牌系列」，只在這個標題旁保留金色箭頭；下方三個分類連結不再重複顯示箭頭，右欄 `Kitchen Series` 中文標題也由「十大廚房系列」統一為「品牌系列」。全寬的「設計案例」與「廚房產品」選單皆沿用 Antra `style.css` 的透明走廊結構，並依最新視覺需求將間距由模板基準 20px 加大為 28px；透明區由選單外框的 padding 形成連續 hover 走廊，不會因移入空隙而關閉。合併選單對可選 `children` 資料加上空陣列保護，鍵盤焦點與手機展開結構維持可操作。「我要加盟」導覽只保留加盟介紹、加盟優勢、加盟金與流程、加盟 Q&A，下載與申請頁路由本身未刪除。
- 2026-08-28 Header 左右四個選項由撐滿側欄的四等分改為依文字實際寬度排列，選項間距收斂為 4–6px，並移除各按鈕額外水平 padding；搜尋分隔線置於搜尋欄內側 4px，使其與「櫻花集團」及搜尋圖示保有均衡留白。1200px 以上將左右選單分別向畫面外側移動 42–160px，把節省的按鈕寬度改留給 Logo 兩側；位移採不建立 fixed containing block 的相對定位，避免品牌系列 Mega Menu 被壓縮到選單欄寬。Logo 本身與獨立搜尋欄位不移動，仍固定於 viewport 幾何中心。
- Hero 保持總高已包含 60px 主導覽；側欄與 Header 共用 `KITCHEN_STYLES` 單一資料源。Home 09 廚房系列已重新逐值對照原始 `324674d／f3df49b／25283d1／2b67735／285719a`：標題區使用真正 30／70 欄、639px Cal Sans 60/64px 主標、30px 標題間距、766px 原模板說明文字及右欄 63/60px 留白；Section 上距依裝置為 110／100／80／60px，桌機下距依畫面銜接需求由模板 150px 收斂為 80px。Projects 輪播依原始 `2b67735` 使用全寬、透明 viewport 且不加左右 padding，Style 6 卡片依模板 CSS 使用 24px 圓角，18px 卡距會透出所在 Section 背景而非額外黑底；卡距由每張 slide 的 `margin-right` 提供，讓 Embla loop 最後一張接回第一張時仍維持完整 18px，不再出現循環接縫黏合。卡片中文標題於所有斷點統一為 30px／38px 行高，不再於 1201px 放大為 36px。維持 1／2／3／4／5 欄與 400／460／500／560／620px 卡高，進場為 `opalMoveLeft delay 400ms`，1201px 以上 hover 卡寬翻倍，拖曳、鍵盤左右鍵、自動輪播及停留暫停均保留。
- Kitchen Products 使用共用深色標題軌，`KITCHEN PRODUCTS` 為 Noto Sans TC 15px，Logo 跑馬燈上方加入 1px 白線。案例區依 Home 01 重排並使用 `SHOWROOM PROJECTS`；Home 06 標題收斂至 560px、影片上限 645px，YouTube 固定從 0:00 載入且不自動播放，逾時或載入失敗時會完整顯示影片 ID、排查提示與外部觀看連結。
- 門市篩選與資訊統一 Noto Sans TC 15px，手機為定位滿寬＋區域／城市兩欄、480px 以下單欄；右側資訊板固定顯示 4 間、第 5 間作候補，每 2.2 秒隨機替換一列，選取門市不會被換走，Hover／Focus 與 reduced-motion 會暫停。2026-08-25 再把錯誤的「整張卡片旋轉＋淡入淡出」改成真正機場 split-flap：卡片保留中央轉軸縫，760ms 內由舊資料上半片先向下折到 90°，再由新資料下半片從 90°展開，全程不旋轉整張卡片，3D 翻片也限制在卡片圓角邊界內避免瞬間水平溢位。Footer copyright 僅將 `Taiwan Sakura Corporation.` 設為金色；社群圖示依 PNG 實際透明邊界校正可見中心，YouTube 下移 7px。桌機不再用固定右側 padding 猜位置，而是依 Header「櫻花集團」最後一字的可見右緣即時對齊，再換算成 Footer 1410px 版心內的 right 座標；視窗與字體載入變化後會重新量測，並保留與 74px 懸浮按鈕的安全距離。大型 SAKURA KITCHEN 距底 30px，頁尾滿版且無底部留白。
- 2026-08-25 右側快捷列最終依使用者指定改為三顆：「案例門市／到府丈量／線上客服」。金色案例門市保留本站原本的房屋 PNG 與 Noto Sans TC 文字，但外框校正為手機 72×72px、桌機 74×74px；下方兩顆灰色按鈕直接使用官網 `quick-link-2.svg`、`quick-link-3.svg`，並移除 VR 體驗。2026-08-28 丈量按鈕同步更新可見 SVG 文字與無障礙名稱，圖示、尺寸與正式丈量網址不變。三顆之間保留官網 20px 分組間距、1px 分隔線與既有捲動位置邏輯。
- 2026-08-25 Footer 的回到頂端按鈕移出 Footer 裁切容器，改為全站固定於視窗右下角；按鈕在手機／桌機分別以 12／13px 右距對齊快捷列中心，底距固定 20px。右側三個快捷按鈕整組底距統一為 88px，與回頂按鈕保留 20px 間距，且捲動位移只會讓快捷列繼續向上，不會互相遮擋。點擊後平滑回到頁首，`prefers-reduced-motion` 下改為立即跳回頂端。
- 2026-08-28 依最新首頁回饋，Hero 的 `Trusted Design Partner` 膠囊與 `Find Your Inspired Kitchen` 文字移除，只保留白色 `Design`；`Design` 與英文內文整組由原 Home 06 位置下移 24px。桌機版心左側至少保留 70px 安全距離，因此固定的 40px「品牌系列」伸縮按鈕不會壓住文字；大螢幕則自動回到原 1584px 版心，不額外推移。
- 2026-08-28 Hero 標題與內文改與每張背景共用同一個 5 秒循環，不另增 JavaScript 計時器：圖片揭幕前 350ms 文字保持隱藏，接著以約 1.15 秒從左柔和進場，短暫停留後於約 2.3 秒提前開始淡出、4 秒前完全消失，下一張圖片建立時由 Vue key 自動重啟文字進場。`prefers-reduced-motion` 下不循環淡出，文字保持完整可見。
- 首頁 Hero 的三張圖片分別綁定 `Premium／Clever／Basic +` 標題及各自正式中文內文，標題沿用模板 display 字體，內文統一 Noto Sans TC 15px；文字以相同 key 跟隨背景每 5 秒同步進場、停留與淡出。Start Project CTA 使用 `fadeIn`，大型 `Kitchen` 浮水印提前至 250ms 啟動並使用 1.25 秒 `fadeInUp`。Hero 圖片依 Home 01 使用雙層向下揭幕，且每張在 5 秒停留期間持續 Ken Burns 緩放大／向左運鏡，上一張固定在運鏡終態以避免換圖回跳；其他首頁小標、主標與 CTA 才沿用各自模板的 `opalMove*／opalScaleUp`。CTA 保留雷達水波與 hover 填金，hover／鍵盤 focus 時文字由 `Start Project` 交叉淡換為「設計靈感」，點擊以 NuxtLink 前往 `/design-inspiration`；`prefers-reduced-motion` 會關閉進場、輪播、翻牌與水波，但所有內容立即可見。共用 Header／Footer調整會套用全站，其他改動僅影響首頁。
- 首頁 Interior／SHOWROOM PROJECTS 依 Home 01 改為穩定 RWD 舞台：Section 維持 956px，1025–1512px 的左側文案固定從 y=388 起、雙卡固定從 y=648 起，不再隨視窗變窄整組向上漂移；標題保留 200px 行盒，避免 110px 切換 76px 時帶動描述與 CTA 跳位。雙卡只在 220–295px 間按可用寬度收斂，並移除箭頭移出 Grid 後已失效的 104px 空白控制欄，確保兩卡始終完整靠右留在 Section 內；箭頭以兩張實際卡寬計算安全界線，優先置中、接近卡片時自動左移並保留 24px 距離。1024px 以下才切換模板的上下堆疊版。
- 2026-08-25 修正 Nuxt SPA 全站換頁沿用上一頁 `scrollY` 的路由錯誤：內建 `scrollBehavior` 持續等待未完成的 `page:loading:end`，實測從首頁 `scrollY=1800` 進入 `/news` 三秒後仍停在 1800；本專案 Nuxt 3 舊式根目錄結構也未合併新增的 `app/router.options.ts`，而在 plugin setup 直接覆寫 `router.options.scrollBehavior` 又會被 Nuxt 導覽包裝器改回原函式。最終由 `plugins/router-scroll.client.ts` 在全站 Router `afterEach` 完成後統一捲動，並於 `beforeEach` 保存各網址位置：不同 pathname 的站內跳轉立即回到頁首，上一頁／下一頁恢復原捲動位置，同一路徑 query 更新不強制跳頂；`#advantages`、`#franchise-process` 等錨點在 DOM 更新後扣除 60px Header 再平滑定位。修正集中於 Router，不在 Header、Footer 或各卡片重複綁定 `window.scrollTo`。
- 全站 Section 膠囊小標以首頁 `FEATURED PROJECTS` 為唯一實作來源：新增 `InternalSectionPill`，`FEATURED PROJECTS` 自身與全部標題軌也改讀該元件；固定使用 `var(--font-ui)`（Cal Sans、中文字回退 Noto Sans TC）、12px、400、14px line-height、1px letter-spacing、5px 金點、8px/14px 內距及 26px 圓角。首頁 `STORE LOCATOR／SHOWROOM PROJECTS／品牌承諾`，以及加盟、建商、AI Kitchen、品牌 Hero、文章推薦、產品保養、廚電商品／系列／型錄等獨立 Section 標籤皆停止使用各自的 10／11／13／15px 舊規則；`Trusted Design Partner` 已依 2026-08-28 回饋自首頁 Hero 移除。未渲染的舊 pill/kicker CSS 也已清除，避免後續誤用。亮暗背景只切換文字與邊框顏色，不再改尺寸、字體或金點大小。
- 2026-08-25 再依 Antra 官方 Home 09／04／06／05／01 的 XML、`deco-horizontal.svg／deco-vertical.svg` 與實際頁面 computed layout 校正全站標題軌：水平／垂直線回到原始 rail 位置，兩端各保留 15×15 原版箭頭，不再使用錯誤的 `top: 121px／50px` 或無箭頭純線。共用元件新增來源幾何模式；首頁廚房系列用 Home 09、Kitchen Products 用 Home 06、加盟故事用 Home 05（左右欄維持原版 70px 起點）、加盟行銷用 Home 01，其餘內頁以 Home 04 為基準，並依 1366／1200／1024／880px 原始設定換算線長與交點。Home 06 線條相對完整 30／70 row 定位，主標另從 38px 起排，避免裝飾壓到文字；頁面內殘留的舊 pill／deco 定位 CSS 已移除，767px 以下仍依既定驗收規格隱藏線條、箭頭並保留膠囊。

### 0.0 Design QA

- 桌機 production preview 實測 Header Logo 為 260×20.5px、頁面 `scrollWidth === clientWidth`；設計案例選單、品牌系列十大卡片、下面三個原選項、我要加盟四個保留項目、Escape 與路由切換關閉均已逐項操作驗證。
- Home 09 五欄、Home 01 雙預覽卡、Home 06 影片 0:00／錯誤 fallback、門市 Google Maps 金鑰錯誤、四張穩定門市卡及 Footer 30px 底距均以本機瀏覽器核對；響應式斷點以 767／880／1024／1200／1201px CSS 規則覆蓋 390、768、880、1024、1200、1366、1512px 規格。
- 最終執行 `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check`；不新增套件、公開 API、路由或資料格式。

## 1.4 品牌系列型錄（2026-08-21 新版調整）

- 2026-08-26 將列表 Hero 主標由中文「品牌系列型錄」改為英文 `Kitchen Catalogues`；Hero 同步對齊設計靈感與廚房裝修指南列表，改用相同的松竹店背景、36% 構圖、64% 深色遮罩、桌機 360px／手機 288px 高度及 Cal Sans 60px 英文標題，麵包屑仍保留中文名稱。

- 依 `2026.08.15_1.0設計案例_調整.pptx` 第八、九頁校正 `/catalogues/kitchenware-catalog`；第九頁的甲方資訊提案明確補入 MUJI Basic+ 與 Clever，因此最終清單依甲方正式來源更新為八筆：MUJI Basic+、Clever、iPremium、Joyful、Premium、Harmony、Loft Chic、Elegant。
- 列表沿用 PPT 指定的 Projects 01 三欄版型與 24px 圓角卡片，八筆資料依 3／3／2 排成三列；Hero 標題為 Noto Serif TC Medium 80px、麵包屑為 Noto Sans TC 15px。2026-08-25 依最新回饋將卡片主標統一為 Noto Serif TC Medium 20/30px，主標只保留系列名稱並移除尾端「型錄」；下方說明統一顯示「系列產品型錄」，不再重複一次 MUJI Basic+、Clever、iPremium、Joyful、Premium、Harmony、Loft Chic 或 Elegant 系列名稱。
- 每張卡恢復原本的 PDF 預覽互動：點擊完整封面或標題會以新分頁開啟正式 `pdfUrl`，Hover／鍵盤聚焦顯示「預覽」與右上斜箭頭；封面仍依原始比例完整顯示、不裁切。下載不再綁定整張卡，而是放在標題右側的獨立膠囊按鈕，使用同網域 `/api/catalogues/:id` 端點與 `Content-Disposition: attachment` 直接下載具有明確檔名的 PDF；手機縮為 44px 圓形圖示按鈕。上游連線、HTTP 或非 PDF 錯誤會回傳完整狀態、型錄 ID、來源與原始回應，不靜默失敗。手機維持單欄，並為右側固定快捷列保留 93px 安全距。
- **預覽／下載 Design QA（2026-08-26）**：來源截圖為 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_cbRE3S/截圖 2026-08-26 晚上7.36.44.png`（902×222），桌機 1280×720 與手機 390×844 的瀏覽器實作截圖整理於 `/private/tmp/catalogue-page-implementation.png`、`/private/tmp/catalogue-title-download-implementation.png`，聚焦比較圖為 `/private/tmp/catalogue-title-download-comparison.png`。字體維持先前核准的 Noto Serif TC 20/30px；標題、說明的左對齊與 9px 間距保留，下載膠囊精確對齊標題列右緣。8 張卡均有獨立預覽與下載連結，桌機 Hover 覆層 opacity 為 1、手機下載鈕為 44×44px，兩個 viewport 水平溢位皆為 0；實際點擊第一張卡下載鈕已成功觸發瀏覽器 download event，頁面保持原網址且 console error 為 0。正式封面資產、品牌色與原始比例未變，沒有剩餘 P0／P1／P2 差異；最終結果：`passed`。
- 2026-08-26 逐份渲染並檢查甲方 `1.4_品牌系列型錄` 八份 PDF 第一頁：Premium、Elegant、Loft Chic、Joyful、Harmony、iPremium、Clever 均有完整正式封面，現有卡片素材亦對應這些封面；Basic+ PDF 第一頁是產品規格內頁，因此保留甲方另附的 Basic+ 封面。封面顯示改為依圖片原始比例自動撐高並使用 `object-fit: contain`，移除原本偏方形的固定比例與 Hover 1.05 倍放大，任何狀態都不得裁掉 Logo、頂部色塊或底部系列名稱。

### 1.4 新版 Design QA

- **來源與狀態**：PPT 第八、九頁完整標註圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/source-slides/source-slide-08.png`、`source-slide-09.png`，Projects 01 完整參考為 `assets/ppt/media/image33.png`（1038×2474）。第九頁甲方資訊來源短網址實際導向 SAKURA 正式 `/catalogues/kitchenware-catalog`；其八筆順序、文案、封面與 PDF 已逐筆核對。新增 Basic+／Clever 使用 PPT 原始 `image36.jpg`／`image38.jpg`，其餘六張本地素材雜湊亦與第九頁內嵌原圖完全相同。
- **同畫面比對**：桌機以 1440×1100 CSS viewport、DPR 1 分段實拍並無縫拼接為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide9-implementation-full-1440-v1.jpg`；PPT 第九頁標註區與實作正規化後合併於 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide9-ppt-implementation-comparison-v1.jpg`。模板篩選器依紅字指示刪除，Projects 01 的三欄結構、卡片比例、24px 圓角、圖下標題／說明與深色頁尾維持一致；把模板英文字與圖片換成甲方正式內容屬必要差異，未留下可執行的 P0／P1／P2。
- **字體、內容與版面**：瀏覽器實測 Hero 為 Noto Serif TC Medium 80/76.19px、麵包屑為 Noto Sans TC 15/22px；卡片標題為 Noto Serif TC Medium 20/30px，說明為 Noto Sans TC 15/23px。1440px 下三欄皆約 411.33px，八筆依 3／3／2 排列；八張卡均指向同網域下載端點，沒有 `target="_blank"`，並各自帶入明確的 `download` 檔名。
- **互動、手機與錯誤**：Hover／鍵盤聚焦會顯示「下載型錄」與 Download 圖示、加深遮罩並將標題轉為 `#CAA05C`，封面本身不再縮放或裁切。390×844 下維持單欄並替快捷列保留安全距，卡片高度依各封面原始比例自然延伸。2026-08-26 實測 `/api/catalogues/basic-plus` 回傳 HTTP 200、`application/pdf`、`Content-Disposition: attachment; filename="SAKURA-MUJI-Basic-Plus.pdf"`，檔案為 1,228,218 bytes 且開頭簽章為 `%PDF-`；找不到 ID 或上游異常時由 Nuxt 完整回傳錯誤內容。
- **建置結果**：`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 全數通過；build 只有專案既有的 Tailwind sourcemap 警告。
- **final result: passed**

## 1.3.3 中島廚房餐桌如何規劃（2026-08-21 新版調整）

- 2026-08-26 文章尾段與其餘廚房裝修指南內頁統一：移除四顆跨分類膠囊；Home 07 只推薦另外兩篇「廚房裝修指南」，移除作者列，標題統一 20/30px，CTA 改用右上斜箭頭，並保留每張卡正確的站內文章路由。
- 依 `2026.08.15_1.0設計案例_調整.pptx` 第七頁校正 `/knowledge/design/knowledge31`，保留既有完整文章資料、指定 YouTube 影片與正式延伸文章，不以簡報截圖代替網頁內容。
- 文章頁套用 PPT 指定的 Noto Sans TC／Noto Serif TC 字級層級、松竹店 Breadcrumb 情境底圖、40px 標題至主圖間距，文末兩條跳轉文字加粗；底部推薦改用 Antra Home 07 三欄結構。
- 1.3.2 與 1.3.3 共用同一組 PPT 文章模板規則，避免兩頁字體與間距再次分岔；1.3.2 的案例雙欄仍只作用於插座文章，不會套到本頁。

### 1.3.3 新版 Design QA

- **來源與狀態**：PPT 第七頁完整標註圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/source-slides/source-slide-07.png`，內嵌原頁完整截圖為 `assets/ppt/media/image28.png`（2880×11754），指定 YouTube 畫面參考為 `assets/ppt/media/image29.png`（1606×1068），Home 07 參考為 `assets/ppt/media/image20.png`（1334×638）。驗證狀態為文章預設內容、影片未播放／播放中，以及底部延伸文章全部顯示。
- **同畫面比對**：桌機以 1440×1100 CSS viewport、DPR 1 實拍；原頁頂部正規化後與新版首屏合併於 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide7-top-comparison-v1.png`，文章末段／影片合併於 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide7-video-comparison-v1.png`，Home 07 同尺寸比較為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide7-home07-comparison-v1.png`。PPT 指定的松竹店 Hero、38px 大標與 Home 07 屬必要差異；首輪未發現可執行的 P0／P1／P2。
- **字體、節奏與色彩**：瀏覽器實測麵包屑為 Noto Sans TC 15/22px、文章大標為 Noto Serif TC Medium 38/50px、章節標為 Noto Serif TC Medium 25/36px、子標為 Noto Sans TC Medium 20/30px、內文與文末連結為 Noto Sans TC 15/25px；Meta 到大標 15px、大標到首圖 40px，文章與主圖維持 930px 版心。沿用 `#F6F6F6`、`#1C1C1D`、`#59585D`、`#CAA05C` 與 24px 圓角。
- **影片與跳轉**：播放按鈕實際載入 `https://www.youtube-nocookie.com/embed/ervCQo-l2T4?autoplay=1&rel=0&playsinline=1`，iframe 正常播放且沒有錯誤狀態；兩條文末跳轉維持甲方提供的正式外部網址、700 字重與 `noopener noreferrer`。Home 07 的 CTA 與兩張正式文章卡皆保留可操作連結。
- **Home 07、手機與錯誤**：桌機推薦區為 1380×660.96px 三欄，左側模板標題 52/55.12px，兩張正式文章圖皆為 418.55×298.96px、1.4:1。390×844 手機實拍為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide7-mobile-top-390.png`、`/private/tmp/sakura-ai-kitchen.A3GeB0/slide7-mobile-video-390.png` 與 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide7-mobile-related-390.png`；文章右緣 297px、快捷列左緣 318px，保留 21px 間距，`scrollWidth === clientWidth === 390`。全頁 29 張圖片全部載入、破圖 0、可見 alert 0、console warn/error 0。
- **建置結果**：`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 全數通過；build 只有專案既有的 Tailwind sourcemap 警告。
- **final result: passed**

## 1.3.2 廚房插座該如何規劃（2026-08-21 新版調整）

- 2026-08-26 文章尾段與其餘廚房裝修指南內頁統一：移除四顆跨分類膠囊；Home 07 只推薦另外兩篇「廚房裝修指南」，移除作者列，標題統一 20/30px，CTA 改用右上斜箭頭，並保留每張卡正確的站內文章路由。
- 依 `2026.08.15_1.0設計案例_調整.pptx` 第六頁重新校正 `/knowledge/design/kitchen-outlet-planning`，沿用正式 Vue 文章內容與甲方三張案例素材，不以 PPT 或官網截圖冒充可閱讀頁面。
- Breadcrumb 改用松竹店門市照片；麵包屑、分類、日期、內文與分類 Tab 統一 Noto Sans TC，文章大標改為 Noto Serif TC Medium 38/50px，章節標為 25/36px，子標為 Noto Sans TC Medium 20/30px，內文為 15/25px。
- 三個廚房插座案例依 PPT 指定的 Home 06 橫式結構改為圖片／說明各半的兩欄排版，案例標題保留甲方提供的櫻花官網正式案例連結；手機回到單欄並保留右側固定快捷列安全距。
- 底部推薦區套用 Antra Home 07：桌機為左側模板標題與 CTA、右側兩張 1.4:1 橫式文章卡；手機維持單欄且不被右側快捷列遮住。1.3.2、1.3.3 現已共用同一套延伸文章規則。

### 1.3.2 新版 Design QA

- **來源真值**：PPT 第六頁標註圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/source-slides/source-slide-06.png`，內嵌原頁完整截圖為 `assets/ppt/media/image25.png`（2880×14957），Home 06 橫式雙欄參考為 `assets/ppt/media/image24.png`（808×416），Home 07 參考為 `assets/ppt/media/image20.png`（1334×638）。
- **同畫面比對**：桌機以 1440×1100 CSS viewport、DPR 1 實拍；原頁頂部正規化後與新版首屏合併於 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide6-top-comparison-v1.png`，案例區合併於 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide6-cases-comparison-v1.png`，Home 07 同尺寸比較為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide6-home07-comparison-v2.png`。PPT 指定的新 Hero、38px 大標與案例雙欄均屬必要差異。
- **字體、節奏與色彩**：瀏覽器實測麵包屑為 Noto Sans TC 15/22px、文章大標為 Noto Serif TC Medium 38/50px、章節標為 Noto Serif TC Medium 25/36px、子標為 Noto Sans TC Medium 20/30px、內文為 Noto Sans TC 15/25px；Meta 到大標 15px、大標到首圖 40px，文章與主圖維持 930px 版心。保留全站 `#F6F6F6`、`#1C1C1D`、`#59585D`、`#CAA05C` 與 24px 圓角。
- **案例與 Home 07**：三個案例在 1440px 下皆為 450px 圖片／450px 說明、30px gap，圖片維持 1.5:1 比例；三個案例標題保留 `noopener noreferrer` 的官方正式連結。Home 07 為 1380px 三欄，左側標題 52/55.12px，兩張正式文章圖皆為 418.55×298.96px、1.4:1。
- **互動與修正歷程**：首輪曾把 case50 等官方網址誤轉為尚不存在的站內路由，實際點擊立刻出現 404，屬 P1 功能問題；已恢復甲方原始官方連結。另在修改途中發現一次 Vue 標籤閉合錯誤並立即修正；以全新瀏覽器分頁重測桌機與手機後，console warn/error、可見 alert 均為 0，31 張圖片全部完成且破圖 0。第二輪同畫面比對未留下可執行的 P0／P1／P2。
- **手機版**：390×844 實拍為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide6-mobile-top-390.png`、`/private/tmp/sakura-ai-kitchen.A3GeB0/slide6-mobile-cases-390-v3.png` 與 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide6-mobile-home07-cards-390.png`；文章與 Home 07 右緣皆為 297px，固定快捷列左緣為 318px，保留 21px 間距。三個案例與推薦卡皆回到單欄，`scrollWidth === clientWidth === 390`。
- **建置結果**：`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 全數通過；build 只有專案既有的 Tailwind sourcemap 警告。
- **final result: passed**

## 1.3.1 廚房系統櫃材質有哪些（2026-08-21 新版調整）

- 2026-08-26 依最新頁面標註調整文章尾段：移除優惠活動／最新消息／媒體影音／廚房裝修指南四顆分類膠囊；Home 07 延伸區不再混入優惠與招商消息，只顯示另外兩篇「廚房裝修指南」，並保留各自正確的站內文章路由。
- 延伸卡移除 `By Admin`，中文標題統一為 Noto Serif TC Medium 20/30px；`Explore Blogs` CTA 使用 Lucide `ArrowUpRight` 右上斜箭頭，hover 方向同步右上移動。桌機 1512px 與手機 390px 均為兩筆正確文章、分類標籤一致，破圖、可見錯誤與水平溢位皆為 0。
- 依 `2026.08.15_1.0設計案例_調整.pptx` 第五頁重新校正 `/knowledge/design/systemcabinet`；文章仍以真正的 Vue 文字、連結、圖片與語意表格呈現，不使用整頁截圖取代官網內容。
- 2026-08-28 將文章主標「廚房系統櫃材質有哪些？2025最新推薦，輕鬆打造優質廚房！」於桌機、平板與手機統一為 Noto Serif TC 30px／41px，不影響文章內 h2／h3、麵包屑與其他知識文章。
- Breadcrumb 底圖改用 3.1 案例門市的松竹店店面照；麵包屑、分類、日期、內文與分類 Tab 統一 Noto Sans TC，文章大標改為 Noto Serif TC Medium 38/50px，章節標改為 25/36px，子標為 Noto Sans TC Medium 20/30px，內文為 15/25px。
- 文章 Meta 到標題的距離由 12.5px 校正為 15px，標題到首圖由 30px 校正為 40px；五大板材仍以可選取、可讀取的 `table／thead／tbody／th` 呈現，手機只在表格自身提供水平滑動。
- STEP6 的北歐風／現代風／工業風已做成加粗的設計靈感篩選連結；鄉村／童樂／閤樂／臻美／潮派／君璽／大廚已做成加粗的品牌系列跳轉，文章結尾的「廚房系列型錄」改走站內型錄路由。
- 三個材質案例在桌機改為圖片／說明各半的兩欄排版，手機回到單欄並為右側固定快捷列保留 93px 安全距；底部推薦區使用 Antra Home 07 版型（52px 左側模板標題與 CTA、右側 1.4:1 橫式文章卡），不影響尚未調整的 1.3.3 內頁。

### 1.3.1 新版 Design QA

- **2026-08-26 標註圖複驗**：來源為 `/Users/eric/Downloads/IMG_1341 2.PNG`（2560×1362）；以 `/knowledge/design/systemcabinet` 桌機 1512px 與手機 390px 實際渲染比對。DOM 掃描確認分類導覽為 0、推薦卡為 2、作者列為 0，兩張卡均標示「廚房裝修指南」並分別連到 `/knowledge/design/kitchen-outlet-planning`、`/knowledge/design/knowledge31`；computed style 為 20px／30px，兩個 viewport 的 `scrollWidth === clientWidth`，圖片失敗與前端 alert 均為 0。`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 全數通過；build 只有專案既有的 Tailwind sourcemap 警告。
- **來源與狀態**：PPT 第五頁完整標註圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/source-slides/source-slide-05.png`，原頁完整截圖為 `assets/ppt/media/image16.png`（2880×16463），Home 07 參考為 `assets/ppt/media/image20.png`（1334×638），Hero 指定門市素材為 `assets/ppt/media/image13.jpg`（1919×1280）。驗證狀態為文章預設內容、三個案例與底部延伸文章全部顯示。
- **正規化與同畫面比較**：桌機以 1440×1100 CSS viewport、DPR 1 擷取；PPT 原頁頂部裁成 2880×2200 後正規化為 1440×1100，與實作頂部合併於 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide5-final-top-comparison.png`。Home 07 參考與實作皆正規化為 1334×638，左右合併於 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide5-final-home07-comparison.png`。
- **字體與節奏**：瀏覽器實測文章大標為 Noto Serif TC Medium 38/50px、章節標 25/36px、子標 Noto Sans TC Medium 20/30px、內文 Noto Sans TC 15/25px；Meta 到大標 15px、大標到首圖 40px，與 PPT 第五頁標註一致。Hero 為 185px，文章、主圖、表格與內文均維持 930px 版心。
- **內容、跳轉與表格**：STEP6 實際輸出 3 個設計靈感連結與 7 個品牌系列連結；點擊「北歐風」成功進入 `/design-inspiration?style=北歐風`，Select 實際選中「北歐風」後可返回原文章。結尾型錄為站內連結；五大板材仍只有一張真正的語意表格，包含 4 筆 tbody 資料列、caption 與 10 個 th。
- **案例與 Home 07**：1440px 實測三個案例 Grid 為 450px／450px、30px gap，圖片與完整文字各佔一欄；本頁限定 Home 07 為 1380px 寬三欄、左側 52/55.12px 模板標題、兩張 1.4:1 橫式正式文章圖。首輪同畫面比較發現舊 1.28 比例令卡圖偏高、標題被流動值縮至 45px，已校正為 1.4 與固定 52px；第二輪未留下可執行的 P0／P1／P2。
- **響應式、圖片與錯誤**：390×844 實拍為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide5-final-mobile-top-390.png` 與 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide5-final-mobile-home07-390.png`；`scrollWidth === clientWidth === 390`，文章內容右緣 297px、快捷列左緣 318px，保留 21px 間距。手機表格容器為 280px、內容 900px，只在表格自身橫向滑動；全部圖片載入成功，桌機／手機皆無可見 alert、Nuxt error 或 console warn/error。
- **建置結果**：`NUXT_IGNORE_LOCK=1 pnpm typecheck`、`NUXT_IGNORE_LOCK=1 pnpm build` 與 `git diff --check` 全數通過；build 只有專案既有的 Tailwind sourcemap 警告。
- **final result: passed**

## 1.3 廚房裝修指南列表（2026-08-21 新版調整）

- 2026-08-26 將列表 Hero 主標由中文「廚房裝修指南」改為英文 `Kitchen Knowledge`，並與設計靈感／品牌系列型錄 Hero 統一桌機與手機的高度、內距、英文字體與標題位置；中文頁名仍保留於麵包屑及 SEO。

- 依 `2026.08.15_1.0設計案例_調整.pptx` 第四頁重新校正 `/knowledge`，Hero 底圖改用 3.1 案例門市正式素材中的松竹店店面照；標題改為 Noto Serif TC Medium 60px，麵包屑改為 Noto Sans TC 15px。
- 2026-08-26 依最新回饋將內容標題完整恢復 Home 02 原版英文：左側小標為 `Straight From The Newsroom`，右側大標為 `Take A Look At Our Latest Blog & Articles.`；大標使用原版 Cal Sans 60/64px，`Our Latest Blog` 保留品牌金色，左側標籤欄與裝飾線維持 Home 02 原有幾何。中文「廚房裝修指南」只保留於麵包屑、文章分類及 SEO。
- 左側精選文章與右側三篇列表維持 PPT 指定的 Home 02 結構；文章標題統一 Noto Serif TC Medium 25px／36px，Meta、日期與摘要統一 Noto Sans TC，摘要為 15px／26px。
- 「甲方提供 3 篇」只代表列表資料固定為三筆，不額外建立搜尋、分頁、後台或第四篇假資料；三張文章卡仍連到既有 `/knowledge/design/systemcabinet`、`/knowledge/design/kitchen-outlet-planning`、`/knowledge/design/knowledge31` 站內文章頁。
- 手機版維持單欄三篇並預留 93px 右側快捷列安全距；文章圖片、標題與摘要不再被固定快捷列蓋住，中英雙標同步縮放且不產生水平溢位。

### 1.3 新版 Design QA

- **來源與狀態**：PPT 第四頁完整標註圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/source-slides/source-slide-04.png`（3178×2245），原頁完整截圖為 `assets/ppt/media/image14.png`（3440×4961），中英雙標聚焦參考為 `assets/ppt/media/image15.png`（1254×360），Hero 指定門市素材為 `assets/ppt/media/image13.jpg`（1919×1280）。驗證狀態為 `/knowledge` 預設列表、三篇資料全部顯示。
- **正規化與同畫面比較**：桌機實作以 1440×1100 CSS viewport、DPR 1 擷取至 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide4-final-desktop-1440.png`；雙標參考先正規化為 1440×414，再與相同寬度、相同內容狀態的實作裁切合併至 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide4-final-heading-comparison.png`。Hero 素材／實作聚焦輸入為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide4-final-hero-comparison.png`。
- **字體、節奏、色彩與內容**：Hero 實測 Noto Serif TC 60/72px、麵包屑 Noto Sans TC 15/22px；雙標為 Noto Serif TC Medium 60/66px 與 Bodoni Moda 60/66px；文章標題為 Noto Serif TC Medium 25/36px，摘要為 Noto Sans TC 15/26px。保留 `#F6F6F6`、`#1C1C1D`、`#59585D`、`#CAA05C` 與 Home 02 的 49／51.3 雙欄、60px 間距、24px 圓角；文案與日期仍是甲方三篇正式資料。
- **圖片與互動**：松竹店 Hero、三張正式文章圖均完整載入，破圖數 0；Hover 實測文章圖片為 `matrix(1.1, 0, 0, 1.1, 0, 0)`。三筆 href 均為站內正式路由，並實際點擊第一篇成功進入 `/knowledge/design/systemcabinet` 後返回列表。
- **響應式與錯誤**：390×844 CSS viewport、DPR 1 的 Hero／雙標實拍為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide4-mobile-top-390-v2.png`，文章卡實拍為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide4-mobile-cards-390.png`；三張卡均為 282px 單欄且右緣 297px，與快捷列保留 21px 間距，`scrollWidth === clientWidth === 390`。桌機／手機均無可見 alert、Nuxt error、破圖或 console warn/error。
- **比較歷程**：首輪發現中英雙標誤留在右側 70% 欄且尺寸偏小，屬 P2 版心／層級漂移，已改為跨欄置中並校正至 60px；手機首輪發現固定快捷列覆蓋標題與摘要，屬 P2 可讀性問題，已加入 93px 安全距並縮放雙標。第二輪同畫面比較未留下可執行的 P0／P1／P2；PPT 指定把模板標籤改為 `Kitchen Knowledge`、Hero 換成門市照片，均屬必要差異。
- **建置結果**：`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 全數通過；build 只有專案既有的 Tailwind sourcemap 警告。
- **final result: passed**

## 1.2 設計靈感列表（2026-08-20 新版調整）

- 依 `2026.08.15_1.0設計案例_調整.pptx` 第三頁重新校正 `/design-inspiration`，Hero 底圖改用 3.1 案例門市正式素材中的松竹店店面照，不再沿用 3.0 服務流程的室內示意背景。
- Hero 顯示標題依 2026-08-26 最新回饋由 `Design Inspiration` 精簡為英文 `Inspiration`，使用模板英文字體 60px；麵包屑仍保留中文「設計靈感」及 Noto Sans TC 15px，桌面維持母版的 360px Hero、深色遮罩與置中構圖。列表卡片標題桌機與手機統一為 Noto Serif TC 20/30px，兩行預留高度同步由 72px 收斂為 60px。
- 2026-08-28「全部型式」下拉移除獨立的「島」選項；既有中島案例資料不刪除，仍可由「一字型＋中島／L型＋中島」等正式型式篩選。
- 依標註刪除篩選器上方可見的「設計型式／設計風格」欄位標題，但保留 `label` 為螢幕閱讀器使用；兩個下拉選單統一 Noto Sans TC 16px。型式選項依 2026-08-28 標註圖調整為「一字型／一字型+中島／島／L型／L型+中島／ㄇ字型」；畫面的「島」保留對應既有資料值「中島」，原有篩選、URL query、空狀態與分頁行為不變。
- 三張卡片改直接使用 3.1 案例門市內容圖：case10 第 03 張、case56 第 04 張、case35 第 11 張；沒有另造假圖或用 PPT 截圖代替。卡片仍分別連到 `/gallery/case10`、`/gallery/case56`、`/gallery/case35`，並保留 `from=inspiration` 回返來源。
- 案例標題改為 Noto Serif TC Medium 25px／36px、最多兩行；門市名稱改為 Noto Sans TC 15px／24px，符合新版標註且維持現有 Hover `View` 互動。

### 1.2 新版 Design QA

- **來源真值**：PPT 第三頁標註圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/source-slides/source-slide-03.png`，內嵌完整母版頁為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/assets/ppt/media/image12.png`（3440×4803），正規化 1440px 版本為 `/private/tmp/sakura-ai-kitchen.A3GeB0/reference-slide3-page-1440.png`。
- **視覺比較**：已把 1440×900 的 Hero／篩選器與案例卡實作和母版放在同一張圖比對；新版保留母版的 360px Hero、三欄比例、圓角與灰底節奏，依紅字標註替換店面背景、刪除可見欄位標題並校正中文字體。完整首屏比較為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide3-compare-top.png`，卡片與文字聚焦比較為 `/private/tmp/sakura-ai-kitchen.A3GeB0/slide3-compare-cards.png`。
- **互動驗證**：以「中島＋現代風」篩選後 URL 正確更新並只顯示 case35；「L型＋北歐風」會進入完整可見的空狀態，「查看全部案例」可清除 query 回到三張卡。案例 Hover 會顯示 `View` 並將圖片放大至 1.05 倍；case10 實際點擊可進入 `/gallery/case10?from=inspiration`。
- **響應式與錯誤驗證**：390×844 的 `scrollWidth` 等於 390，Hero、兩個下拉選單、Filter 與單欄卡片均未產生水平溢位；桌機與手機的圖片載入失敗數皆為 0，瀏覽器 console 沒有 warn/error。
- **Final result：PASS**。`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build`、`git diff --check` 全數通過；build 僅保留專案既有的 Tailwind sourcemap 警告，沒有編譯錯誤。

## 1.0 AI 廚房（2026-08-20 新版調整）

- 依 `2026.08.15_1.0設計案例_調整.pptx` 第二頁重新校正 `/home-style/aikitchen`；新版不是沿用舊頁換字，而是把 Hero 底部由影片卡改為 Home 02 結構，以三張正式 AI Kitchen 圖片輪播 AI CABINET、AI FAUCET、AI LIGHT，並補上可手動前後切換的控制。
- Hero 底部的圓形 CTA 依標註連到 `/catalogues/kitchenware-catalog` 品牌系列型錄列表；桌面左側新增可展開的品牌系列抽屜，AI 廚房顯示目前頁，其餘尚未製作的系列回到首頁品牌系列區，不建立假內頁。
- 2026-08-25 依最新回饋重排 `Creative Projects That Define Our Style` 的四套系舞台：移除把同兩張素材重複渲染成上下四圖的結構，改為單列雙圖；桌機圖片高度由單列 265px 提高為 420px。中央套系選單由 250px／74px 縮為 190px／56px，整組頁籤、狀態與箭頭以 Grid `align-self: center` 在圖片高度內精確垂直置中，不使用固定 margin 猜位置。互動狀態拆分為套系索引與套系內圖片索引：四個頁籤只在點擊或鍵盤聚焦時切換套系及其文案，移向下方箭頭時不會再被途經的 Hover 頁籤誤切；箭頭只循環切換目前套系的圖片，進度顯示目前圖片張數而非錯誤的 `01 / 04`。`KitchenSuite.images` 改為任意長度陣列，可支援每套超過兩張素材。內容段落、舞台與詳情卡的垂直間距同步收斂，詳情由原本舞台下方 40px 提至 22px；1200、1024、767、390px 皆維持單列圖片且不以負 margin 硬拉版面。
- 2026-08-26 將 `Creative Projects That Define Our Style` 引言改為與下方圖片舞台共用同一套三欄 Grid：桌機 `1fr／190px／1fr`、1200px `1fr／164px／1fr`、1024px `1fr／148px／1fr`，三行 AI Kitchen 文案固定落在第三欄，因此其左緣會與右側圖片精確對齊，不再用 44%／56% 兩欄比例猜位置。Section 桌機上下 padding 由 120px 小幅收斂為 100px，手機仍維持 60px 安全留白。
- 2026-08-28 修正 AI Kitchen 套系詳情卡三欄垂直基準：中欄三行技術說明改與左欄下方第一行內文「將AI科技在空間規劃體現」保持同一水平高度，不再錯誤對齊右欄「廚電配備」；手機既有自然堆疊不變。
- 2026-08-26 四套系詳情卡的中文 headline（例如「將AI科技在空間規劃體現」）由 25px／36px 統一收斂為 Noto Serif TC Medium 20px／30px，桌機與手機不再使用不同字級。
- 2026-08-26 四套系詳情卡中間欄的三段說明維持欄內垂直置中，但依最新視覺回饋將文字改回靠左；段落使用 `text-wrap: pretty` 改善中文孤字換行，避免長句末尾只剩一個字。規則套用所有套系資料，不針對 i Fun 以固定 margin 假對位。
- 2026-08-26 修正 `Gallery Of Inspiring Interior Designs` 的 D0032 科斯白邊框裁切：原始 340×340 JPG 的 1px 灰框貼齊圖片外緣，會被共用 24px 圓角裁切。現只對 D0032 以元件外框重建連續圓角邊線，並微幅放大白色原圖隱藏被裁斷的方形來源框；其餘五張門板素材與尺寸不變。
- 內文標籤改為 `Kitchen Collections`，中文引言與套系標題使用 Noto Serif TC 25px，正文使用 Noto Sans TC；四套系頁籤使用 Bodoni Moda 20px。門板、推薦廚電與推薦案例亦依新版標註統一中文字體層級。
- 推薦廚電依 2026-08-25 最新回饋暫停輪播，只渲染資料前五項；已移除該區 Embla 軌道、複製資料、4 秒計時器、拖曳游標與 carousel ARIA，避免看似靜止但仍可被拖動。第六筆資料仍保留於資料層、不破壞後續恢復需求；桌機固定五欄、1200px 以下三欄、767px 以下兩欄自然換行。每項保留 Hover `＋` 按鈕與真實站內跳轉；現階段只有 DR7396 已有產品詳情頁，其他型號先連到 2.0 SAKURA 廚電列表，避免建立不存在的假詳情路由。
- AI Kitchen「Take A Look At Our Latest Blog & Articles」改為真正逐卡移動的 Embla 循環輪播；桌機每次左側短卡向中央移動時，圖片高度、下圓角、暗色漸層與標題層會依滑動進度逐幀放大／交叉淡換，同一時間原中央長卡向右移並逐幀縮短，不再於 `select` 事件瞬間切換 featured class 而形成整排順移感。平板與手機維持等高卡片，避免窄螢幕因高度變形造成跳版；停留、鍵盤焦點、手動拖曳與 reduced-motion 行為不變。
- 2026-08-28 再修正案例輪播交接中央卡突然縮小：實際頁面逐幀量測顯示 cubic 交接在兩卡各走一半時仍會由 560px 降至約 526px；幾何高度與下圓角改用更平緩的 6 次 ease-out，離場卡延後縮小、進場卡提早放大，交接中央維持接近完整高度。文字與漸層仍使用原線性焦點交叉淡換，避免兩張標題同時搶焦點。
- 2026-08-28 依最新回饋將 AI Kitchen 推薦案例輪播的 Embla 滑動 `duration` 由 32 加快為 24；每張仍停留 5 秒，只縮短卡片從左側進入中央的移動時間，不增加輪播頻率。
- 2026-08-28 修正快速 Hover 後三張案例全部縮短：根因是輪播用 JavaScript 寫入即時焦點尺寸，同時 Vue `:style` 又在 `casesPaused` 重繪時把焦點重設到原始第 2 張；當該張已循環到畫面外，三張可見卡便全部失焦。現已移除 Vue 對動態尺寸的重複所有權，初始中央卡只用 CSS fallback，滑動後的尺寸完全由 Embla 幾何更新控制，Hover／離開／Hero 換圖等重繪都不再覆蓋中央焦點。
- 推薦案例於 2026-08-25 重新直接核對 Antra Home 03 XML、`assets/js/elementor-classes.js` 與 `assets/css/base/elementor.css`：改用真實 Embla 連續軌道，不以固定槽位整批替換內容。桌機同畫面三張；2026-08-28 自動播放改為每 5 秒將軌道向左推進一張，左側短卡移入中央並放大，原中央長卡同步移往右側並縮短。鍵盤方向亦回到自然對應：右鍵看下一張、左鍵看上一張。保留無箭頭、Hover／鍵盤焦點暫停，左右拖曳或方向鍵操作後停止自動播放。1024px 以下依模板降為兩欄並取消直式焦點特效，767px 以下單欄。案例標題統一為 Noto Serif TC 20px／30px 行高，限制兩行；摘要維持 Noto Sans TC 15px、三行。
- 原本的品牌影片 Dialog 已依「改 Home 02」標註移除，避免同一 Hero 同時存在兩套互斥的底部互動；三段 AI 功能輪播成為此區唯一主體。
- 新增樣式沿用全站 `#CAA05C`、Noto Sans TC／Noto Serif TC 與既有模糊玻璃語彙；沒有用截圖冒充互動 Hero、假 SVG 或 CSS 圖形替代正式圖片與 Lucide 控制圖示。
- 手機版維持全站右側 72px 快捷列，AI Hero 內容預留 93px 安全距；Hero 功能卡改為兩欄兩列、案例改成單卡輪播，沒有把桌機底部帶硬縮進手機寬度。
- 桌機 Hero 的 Home 02 控制列右側另保留 86px 全站快捷列安全距，避免下一張按鈕被固定快捷列蓋住而無法操作。

### 1.0 新版 Design QA

- **來源真值**：PPT 第二頁標註圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/source-slides/source-slide-02.png`，內嵌完整母版頁為 `/private/tmp/sakura-ai-kitchen.A3GeB0/template-inspect/template-inspect/assets/ppt/media/image5.png`（3440×11821），正規化 1440px 版本為 `/private/tmp/sakura-ai-kitchen.A3GeB0/reference-slide2-page-1440.png`。
- **視覺比較**：已在 1440×900 逐區比對 Hero、內容／套系、門板、廚電與推薦案例；Hero 與內文維持母版的構圖、圓角、金色層級及圖片比例，新版標註指定的 Home 02 資訊列則取代舊影片卡。比對圖為 `/private/tmp/sakura-ai-kitchen.A3GeB0/compare-hero.png`、`/private/tmp/sakura-ai-kitchen.A3GeB0/compare-intro.png`。
- **互動驗證**：三段 Hero 可手動前後切換，品牌系列抽屜可展開且共 10 項、AI 廚房正確標示目前頁；四套系切換後名稱與圖片同步；推薦廚電桌面同畫面五項並顯示 Hover `＋`；案例桌面同畫面三項，每 5 秒實際往右滑動一張，進入中央的卡片拉高、離開中央的卡片縮短，不得以淡入淡出或三槽同時換內容取代；滑入／聚焦暫停，左右拖曳可切換且操作後停止自動播放。
- **響應式與錯誤驗證**：390×844 實機視窗的 `scrollWidth` 等於 390，Hero 資訊卡與按鈕保留右側快捷列安全距，套系、廚電與案例均未造成水平溢位；桌機與手機圖片載入失敗數皆為 0，重新載入目前版本後沒有新的 Vue warn/error。
- **Final result：PASS**。`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build`、`git diff --check` 全數通過；build 僅保留專案既有的 Tailwind sourcemap 警告，沒有編譯錯誤。

## 2.4 廚房商品型錄／產品保養 Tips（2026-08-20 新版調整）

- 依新版 `2026.08.18_2.0廚房產品_調整.pptx` 第六頁重新校正，而不是把 2026-08-16 舊版視為已完成：Hero 改用松竹店照片，標題改為 Noto Serif TC 80px，麵包屑改為 Noto Sans TC 15px。
- 五張型錄卡依新版標註使用 Noto Serif TC 25px 名稱與 Noto Sans TC 15px 說明，桌面維持三欄＋兩欄排列；列距改跟建商專區型錄一致，Hover 補上「下載型錄」與半透明深色圓箭頭，封面遮罩改為上深下淺。每張卡仍直接開啟正式 PDF，不建立後台或假下載流程。
- 保養區把 `Product Care Tips` 改回 Antra 母版的橢圓外框與灰色延伸線；「廚房產品保養」改用 Noto Sans TC，問題列則直接對齊 3.1 FAQ 的 20px 問題、16px 編號與 15px 內文層級。右側題目由過大的 30px 襯線字收回 Noto Sans TC 20px，保留正式保養圖解與可開啟原圖的箭頭互動。
- 新版簡報註記把五金型錄年份寫成 2024，但同頁封面、正式 PDF 與甲方現行資料均為 2026；畫面維持 2026，避免封面與文字互相矛盾。櫻花石英石仍依封面與 PDF 使用 2024。

### 2.4 新版 Design QA

- **來源真值**：新版 PPT 第六頁完整標註圖為 `/private/tmp/sakura-products-adjust.QyzhMl/template-inspect/source-slides/source-slide-06.png`，內嵌完整頁面為 `/private/tmp/sakura-products-adjust.QyzhMl/template-inspect/assets/ppt/media/image20.png`（2880×6699）；production preview 為 `/catalogues/catalog`，預設狀態固定「除油煙機／如何選購除油煙機？」。
- **桌機同畫面與字體**：PPT 內嵌完整頁面已正規化為 `/private/tmp/sakura-products-adjust.QyzhMl/reference-slide6-1440.png`；瀏覽器 1440×900 實拍為 `/private/tmp/sakura-products-adjust.QyzhMl/catalog-slide6-final-top.png`、`catalog-slide6-final-grid.png`、`catalog-slide6-final-care.png`。實測 Hero 為 Noto Serif TC 80/80px、麵包屑 Noto Sans TC 15/22px、卡名 Noto Serif TC 25/36px、說明 Noto Sans TC 15/23px；保養主標 Noto Sans TC 56/66px、FAQ 題目 20/30px、編號 16/30px、內文 15/25px、右卡題目 20/30px，均符合新版紅字標註。
- **內容、下載與互動**：五張封面完整載入，五個正式 PDF 以 HEAD 驗證皆回傳 `200` 與 `application/pdf`。FAQ 預設為除油煙機 Q01；點擊 Q02 後 `aria-expanded` 與右卡標題／圖解同步更新，再從第三個下拉選擇第 4 題後切到烘碗機／洗碗機 Q04「使用烘碗機的好處有哪些？」、右卡同步且三個下拉回復分類名。
- **響應式與錯誤**：390×844 實拍為 `/private/tmp/sakura-products-adjust.QyzhMl/catalog-slide6-mobile-top.png` 與 `catalog-slide6-mobile-care.png`；`scrollWidth === innerWidth === 390`、型錄與三個篩選皆單欄、右卡位於 FAQ 後方、五張封面無破圖。手機仍依全站既有規格保留 72px 右側快捷列，內容預留 93px 安全距，沒有遮住問題與下拉；頁面無可見 alert、Vite overlay 或 Nuxt error。
- **建置結果**：`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過。
- **final result: passed**

- 新增正式 SSR 路由 `/catalogues/catalog`，依 `2026.08.15_2.0廚房產品_櫻花整體廚房頁面開版.pptx` 第六頁製作；沿用 PPT 指定的 Antra `Projects 01` 360px 麵包屑 Hero、1410px 版心、桌面 3 欄／平板 2 欄／手機 1 欄型錄卡與 Hover 右側金色圓形箭頭，並依紅字要求刪除篩選列。2026-08-16 依使用者回饋再以母版同畫面檢查，撤除自行加入的 Hover `PDF Catalogue／查看型錄` 文字，並縮小中文 Hero、卡片標題與說明的視覺比例，避免內容置換後仍套用過大的英文尺寸。
- 五本型錄依 PPT 與甲方現行資料整理為櫻花整體廚房、五金收納／水槽／龍頭／把手、櫻花石英石、SAKURA 全產品、SVAGO／TEKA 進口廚電；封面直接使用 PPT 第六頁內嵌正式原圖，卡片另開甲方正式 PDF。PPT 左側舊文字與同頁封面／甲方 2026 資料存在年份差異，因此畫面採同頁最新封面與甲方目前下載網址，不把舊年份錯配到新版封面。
- 新增同頁「廚房產品保養」互動區，結構依 PPT 指定的 Antra FAQ 元件：三個分類下拉為瓦斯爐／IH 感應爐、除油煙機、烘碗機／洗碗機；左側問題可展開，右側依問題切換正式圖解與資訊卡。預設狀態依 PPT 使用「除油煙機 → 如何選購除油煙機？」。回饋修正版把先前過度自訂的巨型左標題／對半雙欄改回母版的不對稱節奏：左側小型 eyebrow、中段主標、右側短說明，問答與圖解約 70／30 分欄。
- 2026-08-16 依使用者圈選的 FAQ 母版細節再修正：前一版把母版三個膠囊下拉誤判成扁平頁籤，右側又只保留長圖，屬於結構性誤讀。現行改為三個白色膠囊原生下拉選單，各自列出該分類的問題；左側問答改用母版簡潔的加號／減號，右側固定為「4:5 圖片預覽＋白色箭頭＋題目＋摘要」資訊卡。沒有專屬圖片的問題沿用同分類第一張正式保養圖，圖片可另開完整原圖，避免為了匹配卡片比例把長圖內容永久裁掉。
- 三個下拉的收合狀態固定顯示分類名稱，不會把第一題誤顯示成欄位標籤；選取問題後會更新左側展開題目與右側資訊卡，再自動回到分類名稱，避免三欄都變成長問題造成版面失衡。
- 右側模板原圖的白色箭頭落在深色照片上，但甲方正式保養圖多為白底資訊圖；為避免箭頭消失，現行保留白色箭頭並加半透明深色圓形承托，Hover 轉品牌金色。這是針對內容替換後的必要對比修正，不更換正式圖解。
- 依使用者截圖與實作同畫面比較後，FAQ 桌面版再把 eyebrow 欄由 170px 校正為 270px，使主標起點貼近母版；內容由約 70／30 改為「左側彈性問答＋70px 間距＋260px 右卡」，右側不再過寬，4:5 圖片與下方文字比例回到母版。此輪視為前一版 P2 版面比例漂移的修正。
- 同畫面第二輪發現右側資訊卡仍錯誤地從問答列起點才開始，較母版低約一個下拉列高度；現行把「三個下拉＋問答」包在左欄，右側資訊卡從下拉列頂端同步開始，圖片下方標題與摘要因此能在首個 FAQ viewport 內完整露出。
- FAQ 問題、步驟與注意事項取自素材包 `FAQ 內容/2.4_廚房商品型錄/廚房產品: 保養tips.docx`；六張圖解取自 `影像/2.0_廚房產品/2.4_產品保養/`，沒有以截圖頁面、假 icon、CSS 圖形或自創保養圖片代替。圖片失敗會在原位置完整顯示錯誤標題、替代文字、素材路徑與修正提示。
- Header 桌機 mega-menu 與手機 Accordion 的「廚房商品型錄」已接到 `/catalogues/catalog`；2.1.1、2.1.1.1、2.1.1.1.1 三層頁尾 CTA 由 disabled 改為真實 Nuxt 連結，預覽卡也改用 2.4 正式商品型錄，不再誤用 1.4 品牌系列型錄。
- 本頁不建立執行期 API；依使用者先前決定，以 2026-08-16 甲方資料快照與正式 PDF 連結完成前端，日後再由 API 替換資料來源，不影響現有版型與互動。

### 2.4 舊版 Design QA（2026-08-16）

- **來源真值與狀態**：PPT 第六頁完整畫面為 `/private/tmp/sakura-product-ppt.0ty3uG/rendered/slide-6.png`（1258×889）；PPT 內嵌的 Antra `Projects 01`＋FAQ 母版為 `/private/tmp/sakura-slide6.9dW8eP/source/ppt/media/image37.png`（977×2477）。實作真值為 production preview `/catalogues/catalog`，初始狀態固定為「除油煙機／Q1 如何選購除油煙機？」。
- **瀏覽器畫面與規格**：最終 FAQ 以 1280×720 CSS viewport、DPR 2 擷取 `/private/tmp/sakura-catalog-faq-layout-final.png`；手機以 390×844 CSS viewport 實測，`scrollWidth === 390`、右側資訊卡位於問答後方且無重疊。使用者圈選參考圖先縮放至同寬，再與瀏覽器實作合併為 `/private/tmp/sakura-faq-user-final-comparison.png`；最終修正另以量測確認下拉列與右卡 `top` 同為 `225.1875px`，不以分開觀看冒充同畫面比較。
- **全局與細節比較**：使用者回饋後重新判定首輪結論過度寬鬆：雖然 Hero、灰底型錄區、三欄卡片、白底 FAQ 與頁尾順序正確，但 72px 左側保養標題、50／50 問答分欄、黑色無圖解卡與 Hover 額外文案均非母版指定，屬 P1 視覺結構漂移。修正版保留 PPT 明確要求刪除的 Filter、五本正式封面與三類保養頁籤，只調整母版幾何與層級，不把正式內容換回建築照片或英文 FAQ。
- **字體、間距與色彩**：標題使用專案既有 Cal Sans／中文字型 fallback；桌面採 68px Hero、56px 保養標題、24px 卡片標題與 19px FAQ 問題。最終 FAQ Header 採 `270px／主標／300px` 三段，主標實測起點 `x=377px`；內容為 `804px` 問答、`70px` 間距、`260px` 右卡，實測右卡 `x=947px`，貼近參考圖比例。`#F6F6F6`、白底、`#1C1C1D`、`#59585D` 與 `#CAA05C` 映射既有 Antra token；手機仍保留右側固定快捷列安全距。
- **圖片、內容與圖示**：五張封面 naturalWidth 分別為 1168、1241、776、774、758；預設保養圖解為 1000×2199，捲到可視區後 `complete=true`。標題、五類型錄、三類保養分類、四至五個問題與七步清潔內容均與 PPT／Word 素材一致；箭頭與展開符號使用既有 Lucide，沒有 CSS 圖形、手繪 SVG、假封面或頁面截圖冒充元件。
- **互動、響應式與錯誤**：三個原生下拉均可鍵盤操作，收合後顯示分類名；實際在第三欄選擇第 4 題後，左側 Q04 `aria-expanded=true`、右側標題更新為「使用烘碗機的好處有哪些？」且圖片連結保留，三欄再回到分類名稱。加號／減號使用 Lucide，右卡箭頭深色承托在白底圖解上仍清楚可見；桌面與手機水平溢位為 0，瀏覽器 console 為空，圖片錯誤 fallback 仍完整呈現。
- **比較歷程與可接受差異**：第二輪修正巨型標題、50／50 分欄、黑卡與額外 Hover 文案；第三輪依圈選圖把假頁籤改成膠囊下拉、問答箭頭改為加減號、補回右側圖片／箭頭／標題／摘要卡；同畫面比較再發現主標起點與右卡寬度為 P2 比例漂移，已校正至 270px Header 起始欄及 260px 右卡；下一輪發現右卡比下拉列低一層，已重組為左右雙欄並讓兩者頂端完全對齊。最終沒有剩餘可執行的 P0／P1／P2。參考照片改成 PPT 指定保養圖解、英文文案改成正式中文 FAQ，屬指定內容替換；來源無手機稿，因此手機不聲稱像素級相同。
- **建置結果**：`pnpm typecheck`、`pnpm build` 與 `git diff --check` 均通過；build 僅有專案既有的 Tailwind sourcemap warning。五個正式 PDF 連結以 HEAD 驗證皆回傳 `application/pdf`。
- **final result: passed**

## 2.1.1.1.1 SAKURA 廚電各產品頁（2026-08-20 調整）

- 七個正式詳情路由依新版 `2026.08.18_2.0廚房產品_調整.pptx` 第五頁統一重核；沿用資料驅動共用模板，不複製七份近似頁面。短版 Hero 改用新版指定的松竹店店面照，五層麵包屑固定 Noto Sans TC 15/22px。
- 產品首屏依新版標註把膠囊補成 `SAKURA Product`，商品名稱固定 Noto Serif TC Medium 38px，型號使用 Noto Serif TC；產品特色、特色清單、型號／售價、產品資料與附件列全部改為 Noto Sans TC 18px。詳細規格 CTA 的金色圓鈕改用白箭頭，縮圖由 76px 放大為 92px。
- Related Products 區改為新版指定的 `KITCHEN PRODUCT` 眉標，以及「SAKURA 廚電 / Kitchen Appliances」雙語標題；中文使用 Noto Serif TC Medium 40px、英文使用 Bodoni Moda 40px。四張關聯商品的名稱改用 Noto Serif TC，型號與售價改用 Noto Sans TC，商品透明主體依各圖實際邊界校正視覺中心；既有上一組／下一組切換與真實商品連結保留。
- 型錄段落補齊「廚房商品型錄 / Kitchen Product Catalog」雙語標題、白色 CTA 箭頭與 Noto Sans TC 20px 型錄名稱。詳細規格 Dialog 的型號改為 Noto Sans TC 16px、標題改為 Noto Serif TC，表格使用 Noto Sans TC 並保留上下及窄螢幕橫向捲動，不用縮字或裁掉規格列；關閉鈕鍵盤 Focus 改用外框提示，不再因自動聚焦整顆填金而偏離 PPT 的白色圓鈕。

### 2.1.1.1.1 新版 Design QA

- **來源真值**：新版 PPT 第五頁完整標註圖為 `/private/tmp/sakura-products-adjust.QyzhMl/template-inspect/source-slides/source-slide-05.png`，內嵌頁面模板正規化為 `/private/tmp/sakura-products-adjust.QyzhMl/reference-slide5-1440.png`（1440×3512）；production preview 以 R7600 初始狀態與規格 Dialog 為主，再抽查其餘六型號共用模板。
- **同畫面比較**：1440px 桌面把來源與實作裁成相同狀態並排，產品首區、關聯商品與型錄段落分別保存於 `/private/tmp/sakura-products-adjust.QyzhMl/slide5-overview-comparison.png`、`slide5-related-comparison.png`、`slide5-catalogue-comparison.png`。產品圖片面、左右資訊比例、分隔線、黑色 CTA、四欄關聯商品與兩張型錄卡均對齊模板；新版紅字指定的 Noto Serif TC／Noto Sans TC／Bodoni Moda、雙語標題及松竹店 Hero 視為本輪真值，沒有回退到內嵌舊字樣。
- **字體、圖片與版面**：桌面實測商品名稱 38px、產品特色／清單／型號售價／附件 18px、縮圖 92px；關聯商品中英標皆 40px，型錄卡名稱 20px。R7600 三張圖及其餘六型號全部載入成功，七個路由的 role alert 與破圖皆為 0；桌面維持 1410px 版心與四欄 Related Products，沒有因加上雙語標題破壞商品卡視覺中心。
- **互動與真實資料**：相簿下一張實測從 `01 / 03` 切為 `02 / 03`，主圖同步改成 `r7600-2.png`；點第三張縮圖後計數為 `03 / 03` 且只有第三張 `aria-pressed=true`。Related Products 下一組會由 R7615 開頭輪替成 R7653 開頭，點卡片可抵達 R7653 並更新標題、型號與 10 項特色；R7600 的使用手冊、RoHS、商品型錄三個正式附件連結均保留。
- **規格 Dialog 與響應式**：桌面 Dialog 實測 12 組規格，內容區 `clientHeight=840`、`scrollHeight=909`、`overflow-y:auto`；關閉鈕自動聚焦時仍為白底，僅顯示金色外框。390×844 手機實測頁面 `scrollWidth === 390`、內容單欄 360px、標題 34px、縮圖 76px、快捷列隱藏；Dialog 為 360×814，表格區 `clientWidth=320`、`scrollWidth=560`，可橫向捲動而不裁字或縮小規格。
- **路由與錯誤**：R7600、R7615、R7653、DR7396、DR7397、R7302A、R7301A 七個正式網址均顯示正確型號、特色、價格列與附件數，圖片完整且沒有前端 alert。瀏覽器 console 無 error／warning，只有 Vite／Nuxt 開發訊息與既有 Vue Suspense info。
- **建置結果**：`pnpm --dir nuxt-site typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 均通過；build 只有專案既有的 Tailwind sourcemap warning。`git diff --check` 於最終文件更新後再次驗證。
- **final result: passed**

- 新增資料驅動的正式 SSR 詳情路由 `/products/sakura/range-hood/near-suction/[product]`，目前完整支援 R7600、R7615、R7653、DR7396、DR7397、R7302A、R7301A 七個型號；上一層七張商品卡全部改為真實 Nuxt 連結，未知型號由 Nuxt 404 在前端完整顯示錯誤，不建立空白或假詳情頁。
- 依 `2026.08.15_2.0廚房產品_櫻花整體廚房頁面開版.pptx` 第五頁指定的 Antra `Shop > Single Product` 母版製作：沿用不放大型頁名的短版深色麵包屑、左側大商品圖、右側品牌／名稱／型號／特色／售價／產品資料、底部縮圖列、四張 Related Products 與 Home 07 型錄 CTA；五層麵包屑換成 PPT 指定的 SAKURA 資訊，產品名稱是頁面唯一 H1。
- 商品名稱、型號、售價、特色、詳細規格、使用手冊、RoHS 與可用商品型錄均取自甲方現行商品資料；正式商品圖下載成獨立本機素材放在 `public/section-2/products/sakura/range-hood/near-suction/details/`，畫面 UI、規格表與互動仍由 Vue／HTML／CSS 實作，沒有把甲方網頁截圖貼進前端。
- 相簿縮圖與左右切換均使用真實商品圖片；「詳細規格」使用原生 Dialog 顯示各型號完整雙欄資料表，附件另開正式 PDF；Related Products 固定顯示四張同系列商品並可循環切換，每張可直接進入對應詳情頁。
- 依 PPT 紅字要求刪除 Single Product 母版的商品上一筆／下一筆導覽與 Newsletter；因甲方資料未提供購物流程，本頁也不捏造購物車、數量、庫存、評分或評論。API 仍依使用者決定延後，現階段使用 2026-08-16 甲方資料快照，而不是自創文案。
- 底部維持全站黑色膠囊＋金色圓箭頭的「廚房商品型錄下載」CTA，現已接到正式 `/catalogues/catalog`；預覽卡同步改成 2.4 商品型錄資料。

### 2.1.1.1.1 Design QA

- **來源真值與狀態**：來源為 PPT 第五頁的 Antra `Shop > Single Product` 內嵌母版 `/private/tmp/antra-single-product-top.png`（1430×1220）與甲方 R7600 商品資料；production preview 以 `/products/sakura/range-hood/near-suction/r7600` 初始狀態為主要比對，其餘六個型號使用相同模板與各自正式資料。來源只提供桌面稿，不捏造手機像素級真值。
- **同畫面證據**：1280×720 CSS viewport、DPR 2；Browser 輸出的實作畫面為 1280×720，來源裁切／縮放成同尺寸後與最終首屏合併於 `/private/tmp/sakura-single-product-final-comparison.png`。商品主體另以相同 1135×570 內容區合併於 `/private/tmp/sakura-single-product-focus-comparison.png`，用來檢查標題、圖片尺度、雙欄比例、特色、售價與箭頭，而不是只看縮小的整頁圖。
- **比較歷程**：第一輪發現詳情頁誤沿用前幾頁 360px 大標 Hero，與第五頁母版的短版麵包屑不一致，判定為 P1 首屏比例漂移；已撤掉大型頁名、把 Hero 改為實測 200px，並把產品名稱升為唯一 H1。第二輪同尺寸比較確認 Header 下方為短版五層麵包屑、商品雙欄緊接其後，先前差異已消失，未再發現可執行的 P0／P1／P2。
- **字體、間距與色彩**：產品名稱沿用全站 Cal Sans／中文 fallback，桌面 62px 上限，型號、區塊小標、特色與售價層級與母版一致；1410px 版心、左大圖右資訊、26px 圖片圓角、分隔線與 30px 關聯商品欄距均沿用既有 Antra 節奏。`#1C1C1D`、`#59585D`、`#F6F6F6`、白色與品牌金 `#CAA05C` 對應母版深灰／淺灰／金色 token，disabled CTA 仍有可見狀態與原因。
- **圖片、圖示與文案**：R7600 三張商品圖實測 naturalWidth 800 且 `complete=true`；其餘正式圖為 800px 主尺寸，R7301A 長邊壓至 1600px，沒有破圖、截圖 UI、假商品圖、CSS 圖形或手繪 SVG。箭頭、下載與關閉圖示全用既有 Lucide；商品名稱、六項特色、R7600XL／$18,000、12 列規格與三個附件均與甲方資料一致。
- **互動與可用性**：相簿第二張點擊後主圖切成 `r7600-2.png`、計數更新為 `02 / 03` 且只有一個 `aria-pressed=true`；規格 Dialog 實測開啟、12 列資料與關閉鈕正常。Related Products 實測四張真連結，點 R7615 後路由、型號、$15,700、六項特色與兩張縮圖同步更新；上一層 R7600 商品卡也能回到正式詳情頁。頁面沒有 Newsletter、Reviews、購物車或數量輸入。
- **版面、路由與錯誤**：1280px 實測五層麵包屑、`scrollWidth === clientWidth`、水平溢位 0、Browser console 空白；七個正式型號皆回傳 HTTP 200，未知型號回傳 404 並由 Nuxt 顯示完整錯誤。CSS 另含 1023px 雙欄／關聯商品兩欄、767px 商品單欄／規格表直排與 reduced-motion 規則；因來源沒有手機稿，手機僅做結構與規則驗證，不聲稱像素級相同。
- **建置結果**：修正後 `pnpm typecheck`、`pnpm build` 與 `git diff --check` 均通過；build 僅有專案既有的 Tailwind sourcemap warning。
- **final result: passed**

## 2.1.1 SAKURA 廚電產品列表頁（2026-08-20 調整）

- 正式 SSR 路由 `/products/sakura/range-hood/near-suction` 依新版 `2026.08.18_2.0廚房產品_調整.pptx` 第四頁重新核對。新版把這層標為 **2.1.1 SAKURA 廚電產品（列表頁）**，但 2026-08-15 舊簡報曾標成 2.1.1.1；保留既有路由與資料層級，避免七個商品詳情連結與上層系列入口失效。
- Hero 底圖改用新版指定的 `影像 > 3.0 門市與服務 > 3.1 案例門市` 松竹店面照；H1 使用 Noto Serif TC 角色，麵包屑固定 Noto Sans TC 15/22px。主內容依標註補成「近吸系列 / Range Hood Series」雙語標題，中文為 Noto Serif TC Medium 40px、英文為 Bodoni Moda 40px。
- 七張商品卡維持桌面四欄、平板兩欄、手機單欄；商品名稱使用 Noto Serif TC，型號與售價使用 Noto Sans TC。逐張依透明商品主體的實際邊界校正視覺中心，不再只把 720×540 空白畫布置中；Hover／Focus 補上新版要求的深色遮罩、中央圓形白箭頭、縮放與旋轉回正動畫，手機固定顯示右下金色箭頭。
- 中段「除油煙機系列」改為 Noto Serif TC Medium 25px，左右加入 1px 細灰線；八個同層名稱改為 Noto Sans TC 20px，商品數量改為 Noto Sans TC 13px。底部型錄區補齊「廚房商品型錄 / Kitchen Product Catalog」雙語標題、白色 CTA 箭頭，型錄卡名稱固定 Noto Sans TC 20px。
- 本系列只有七項，仍依規格不顯示「超過八項才出現」的載入箭頭；沒有新增 PPT 明確排除的搜尋、篩選、假分頁或假載入更多。七張商品卡與型錄 CTA 都保留既有真實路由。

### 2.1.1 Design QA

- **來源真值**：新版 PPT 第四頁完整標註圖為 `/private/tmp/sakura-products-adjust.QyzhMl/template-inspect/source-slides/source-slide-04.png`，內嵌頁面模板正規化為 `/private/tmp/sakura-products-adjust.QyzhMl/reference-slide4-1440.png`（1440×3101）；production preview 以 `/products/sakura/range-hood/near-suction` 的桌面與手機初始狀態驗證。新版紅線指定的松竹店 Hero、雙語標題、字體、商品置中、Hover 箭頭與細灰線均視為對模板的明確調整，不回退到內嵌舊畫面。
- **同畫面比較與版面**：1440×900 初始狀態與來源同寬並排於 `/private/tmp/sakura-products-adjust.QyzhMl/slide4-top-comparison.png`，商品區同畫面證據為 `/private/tmp/sakura-products-adjust.QyzhMl/slide4-grid-comparison.png`。桌面實測四欄各 301px、七張卡完整，頁面 `scrollWidth === clientWidth === 1440`；新版明確要求新增的英文副標使商品卡比內嵌舊畫面下移約一行，屬標註內容增加，不以壓縮間距掩蓋。
- **字體、圖片與互動**：瀏覽器量測中文／英文主標皆 40px，分別套用 Noto Serif TC 與 Bodoni Moda；Hero H1 為 Noto Serif TC 80px、麵包屑為 Noto Sans TC 15px。七張商品圖全部 `complete=true`、naturalWidth 720，透明主體經逐張 offset 後落在白色圖片面的視覺中心；R7600 Hover 實測遮罩與箭頭 opacity 皆為 1、箭頭旋轉回正、圖片 scale 約 1.045，實際點擊抵達 `/products/sakura/range-hood/near-suction/r7600` 並可返回列表。
- **手機與執行品質**：390×844 實測內容欄與卡寬皆 360px、Hero H1 單行 41.73px、七個操作箭頭固定顯示為 48px、右側快捷列隱藏、`scrollWidth === clientWidth === 390`；role alert 與隱藏 reveal 元素皆為 0。瀏覽器沒有 error／warning，只有 Vite／Nuxt 開發訊息與既有 Vue Suspense info；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build`、`git diff --check` 均通過，build 僅有專案既有的 Tailwind sourcemap warning。
- **final result: passed**

## 舊版 2.1.1.1 近吸系列產品列表頁（2026-08-15）

- 新增正式 SSR 路由 `/products/sakura/range-hood/near-suction`，依 `2026.08.15_2.0廚房產品_櫻花整體廚房頁面開版.pptx` 第四頁製作；層級固定為「SAKURA 廚電產品 → 除油煙機系列 → 近吸系列」，Hero H1 仍使用 PPT 指定的「SAKURA 廚電產品」，麵包屑完整保留四層。
- 主商品區使用第四頁指定的 Antra `Pages > Shop > Single Product` Related Products 結構，並依紅字標註改成桌面四欄；平板兩欄、手機單欄。商品卡是 Vue／HTML／CSS 元件，只有商品主體圖片取自 PPT 內嵌的甲方正式畫面，沒有把整頁截圖貼進前端。
- 依 PPT 甲方資料建立七項近吸產品：R7600／$18,000、R7615／$15,700、R7653／$20,700、DR7396／$26,300、DR7397／$26,300、R7302A／$18,300、R7301A／$18,300；商品名稱、型號、價格與排列順序均照來源畫面，圖片整理為七張 720×540 PNG。
- 第四頁指定「產品超過 8 項才顯示箭頭」，本系列只有 7 項，因此不顯示載入箭頭；同時不加入 PPT 未要求的搜尋、篩選、假分頁或假載入更多。七張商品卡現已接到 2.1.1.1.1 對應的正式詳情路由。
- 中段依 `Home 01` 形式串接除油煙機八個同層系列名稱與產品數量，保留無框、疏朗灰階、連續橫向動畫與 Hover 暫停；不拿甲方資料截圖中的 UI 元件充當模板，也不重複 2.1 的十三項頂層分類。
- 底部依 `Home 07` 使用兩本型錄預覽與全站黑色膠囊＋金色圓箭頭 CTA；現已改用 2.4 正式商品型錄預覽並接到 `/catalogues/catalog`。
- `/products/sakura/range-hood` 的「近吸系列」卡片已成為正式 Nuxt 連結並支援鍵盤 focus；其餘七個尚未要求的系列仍不偽裝成可點擊入口。API 依使用者決定延後，現階段採 PPT 甲方資料快照。

### 2.1.1.1 Design QA

- **來源與狀態**：來源視覺真值為 PPT 第四頁指定的 Antra `Pages > Shop > Single Product` 畫面（PPT 內嵌 `image22.png`，815×2475）及甲方近吸系列資料畫面（PPT 內嵌 `image19.png`，2560×1364）；實作為 production preview `/products/sakura/range-hood/near-suction`。兩者均以桌面四欄、商品列表初始狀態比較，PPT 沒有提供手機視覺真值，所以手機只驗證 2／1 欄程式規則，不捏造像素級對照結論。
- **同畫面比較證據**：已把來源 `Related Products` 四欄區與本機 1280×720 商品區裁成相同 1160px 內容寬度，放進 `/private/tmp/near-suction-template-comparison.png` 同畫面上下比較；另保存首屏、第一列、第二列、同層系列與型錄 CTA 的 1280×720 瀏覽器畫面。來源卡片與實作均為四欄、20px 圓角圖片面、圖片下方資訊與無多餘邊框；來源的英文家具／評分星號改為 PPT 指定的甲方商品名稱、型號與建議售價，屬必要資料替換，不是設計漂移。
- **字體與層級**：Hero 保留全站 Cal Sans／中文 fallback、大標 80px 與置中麵包屑；商品區標題採同系列頁既有 60／64px 層級。卡片名稱 20／27px、型號 16／22px、價格 17px 粗體，在四欄下 DR7396、R7302A、R7301A 的長名稱正常換兩行，第二列型號與價格仍對齊，沒有截字或擠壓。
- **間距、色彩與素材**：實測 1280px 四欄為 `261px × 4`、欄距 30px，內容左右安全距 73px；灰底、白色圖片面、`#1C1C1D` 標題、`#59585D` 內文、`#CAA05C` Hover 沿用 Antra token。七張商品圖均為 720×540、`complete=true`、naturalWidth 720，第二列重裁後沒有殘留甲方畫面的商品文字或價格；未用 CSS 圖形、假商品圖或整頁截圖充當元件。
- **互動與可用性**：從 `/products/sakura/range-hood` 實際點擊「查看近吸系列的 7 個產品」可抵達新頁；商品 Hover 實測圖片 `scale(1.045)` 且名稱轉金色，同層系列列 Hover 後 animation-play-state 為 `paused`。七張商品卡均已接到正式詳情頁；型錄 CTA 現已接到 `/catalogues/catalog`，頁面無搜尋、篩選、載入更多或商品假連結。
- **版面與錯誤**：1280px 實測 7 張商品卡、8 個同層系列、4 欄網格與四層麵包屑完整；`document.scrollWidth === document.clientWidth === 1280`，沒有水平爆版。瀏覽器 console 為空，所有圖片載入成功；CSS 包含 1023px 兩欄、767px 單欄、手機 Hero／安全距與 reduced-motion 規則。
- **比較歷程**：首輪素材檢查發現最初的商品裁圖帶到甲方畫面的價格文字，已把第一列改為 430×310、第二列改為 430×250 的商品主體區重新裁切，再統一整理成 720×540；修正後瀏覽器第二列畫面與七張 natural size 檢查均無殘字。第二輪同畫面比較未發現可執行的 P0／P1／P2 差異，沒有再以主觀偏好改動模板結構。
- **建置結果**：`pnpm typecheck` 與 `pnpm build` 均通過；build 只有專案既有的 Tailwind sourcemap warning。
- **final result: passed**

## 2.1.1.1 SAKURA 廚電系列列表頁（2026-08-20 調整）

- 正式 SSR 路由 `/products/sakura/range-hood` 依新版 `2026.08.18_2.0廚房產品_調整.pptx` 第三頁重新核對；新版把此層標為 **2.1.1.1 SAKURA 廚電系列（列表頁）**，與 2026-08-15 舊簡報的 2.1.1 編號不同。程式路由與資料層級不遷移，避免破壞既有連結；README 明確區分新舊簡報名稱，不把兩套頁碼混為同一份規格。
- 版面保留 Antra Blog／Gallery 01 的 360px Hero、三欄系列卡、Home 01 名稱輪播與 Home 07 型錄推薦段落。Hero H1 與麵包屑維持「SAKURA 廚電產品」，底圖改用新版指定的 `影像 > 3.0 門市與服務 > 3.1 案例門市` 松竹店面照；麵包屑固定 Noto Sans TC 15/22px。
- 主內容改為雙語標題「除油煙機系列 / Range Hood Series」：中文使用 Noto Serif TC Medium 40px，英文使用 Bodoni Moda 40px。八張卡維持原始模板的 24px 圓角，系列名稱改為 Noto Serif TC Medium 25/36px，產品數量改為 Noto Sans TC 13/19px，圖片與文字之間補上新版標註的 1px 細灰線。
- 近吸系列卡依新版「動畫參照：關於我們＋號改箭頭」補上圖片遮罩、中央圓形白箭頭、縮放與旋轉回正動畫；動畫只出現在有正式路由的卡片，未完成的其他系列不製造假點擊入口。手機沒有 Hover，因此正式連結固定顯示右下金色箭頭。
- 依 PPT 內嵌甲方資料畫面建立 8 個正式系列與數量：近吸 7、歐化 9、隱藏 7、流線 3、深罩 1、斜背 4、輕巧 1、配備 8。八張卡片商品主體均自 PPT 內嵌正式畫面裁出並整理為獨立 720×540 PNG；畫面 UI、文字、卡片、Hover 與 RWD 仍以 Vue／HTML／CSS 實作。
- 2.1 的「除油煙機」分類卡已接到 `/products/sakura/range-hood`，桌機 Hover／鍵盤 Focus 顯示圓形箭頭，手機固定顯示操作提示；其餘分類對應的 2.1.1 頁面尚未要求，因此不建立假路由。
- 「近吸系列」已接到新完成的 `/products/sakura/range-hood/near-suction`；其餘同層系列等待後續簡報頁與正式資料，不先建立空頁。
- 依 PPT 規則，產品超過 8 項才顯示載入箭頭；本頁剛好 8 項，所以不製作假載入更多。搜尋與篩選同樣依簡報排除。
- 第三頁底部指定的「廚房商品型錄下載」現已接到正式 `/catalogues/catalog`，CTA 保留全站黑色膠囊＋金色圓箭頭樣式，不再誤連到語意不同的品牌系列型錄。
- 中段「SAKURA 廚電產品」依新版指定改為 Noto Serif TC Medium 25px，左右補上細灰線；輪播主名稱使用 Noto Sans TC，所屬分類改為 Noto Sans TC 13px。型錄段落補齊模板雙語標題「廚房商品型錄 / Kitchen Product Catalog」，金色圓鈕內使用白箭頭，型錄卡名稱使用 Noto Sans TC 20px。
- 使用者已確認 API 可延後，因此未設定 API 不再視為前端錯誤或顯示介接提示；只有日後真的設定端點、且端點失敗或回傳空資料時，2.1 才顯示完整錯誤與 fallback 原因。
- 依 2026-08-15 畫面回饋修正中段 Home 01：撤除沒有簡報依據的 `Product Categories` 左標、右側 36px 大標與三張分類統計方框。PPT 第三頁要求的是 Home 01 品牌 Logo 列的元件與動畫形式，因此改成置中的「SAKURA 廚電產品」小標，以及由 2.1 正式資料產生的 13 個系列名稱／商品識別橫向輪播；未建立的分類仍不偽裝成可點擊連結。
- 第二次視覺校正撤除 Logo 列中泛白且沒有簡報依據的商品縮圖；PPT 標註要求串接的是「系列產品名稱」，所以每項改為 Home 01 原版的文字識別鎖定：系列名稱為主字、所屬的 SAKURA 廚電商品／熱水器／淨水設備為小字。桌面固定約六項同時可見，灰階對比依模板 Logo 列調整，不再套用讓文字發白的整體透明度；保留連續橫向動畫及 Hover 暫停，沒有卡片、邊框、假 icon 或灰白圖片方塊。

### 2.1.1.1 Design QA

- **來源真值與比較方式**：新版 PPT 第三頁完整標註圖為 `/private/tmp/sakura-products-adjust.QyzhMl/template-inspect/source-slides/source-slide-03.png`，頁面模板原圖正規化為 `/private/tmp/sakura-products-adjust.QyzhMl/reference-slide3-1440.png`（1440px 寬）；production preview 以 `/products/sakura/range-hood`、1440×900、deviceScaleFactor 1 的初始狀態為實作真值。首屏並排證據為 `/private/tmp/sakura-products-adjust.QyzhMl/slide3-top-comparison.png`，卡片細節並排證據為 `/private/tmp/sakura-products-adjust.QyzhMl/slide3-grid-comparison.png`。Hero 店面照、雙語標題與灰線是新版紅線標註要求的刻意差異，不回退到內嵌模板舊底圖或單語標題。
- **字體與版面**：瀏覽器量測中文主標為 Noto Serif TC 40px、英文為 Bodoni Moda 40px；卡名為 Noto Serif TC 25px、數量為 Noto Sans TC 13px、卡片分隔線為 1px。1440px 實測八張卡維持三欄、24px 圓角與模板圖片比例，`scrollWidth === innerWidth`；中段標題為 Noto Serif TC Medium 25px 並有左右細灰線，分類小字為 Noto Sans TC 13/19px，型錄雙語標題及白箭頭均與新版標註一致。
- **圖片與互動**：8 張系列卡圖片全部 `complete=true` 且無破圖。近吸系列卡 Hover 實測遮罩 opacity 1、圖片 scale 約 1.045、金色圓形箭頭旋轉回正；實際點擊可抵達 `/products/sakura/range-hood/near-suction`。沒有為其餘七張尚無正式頁面的卡建立假路由，也沒有搜尋、篩選或假載入更多。
- **手機與可用性**：390×844 實測 Hero H1 為單行 41.73px、內容欄 360px、正式連結固定顯示右下 48px 金色箭頭、快捷列 `display:none`、`scrollWidth === 390`；圖片錯誤與 role alert 均為 0。PPT 未提供手機稿，因此手機只依既有 1 欄模板與不遮擋規則驗證，不捏造像素級來源對照。
- **執行品質**：乾淨重載後瀏覽器紀錄沒有 error 或 warning，只有 Vite／Nuxt 開發模式 debug、info 與既有 Vue Suspense 提示；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 均通過，build 只有專案既有的 Tailwind sourcemap warning。
- **final result: passed**

## 2.1 SAKURA 廚電商品列表頁（2026-08-20 調整）

- 正式 SSR 路由 `/products/sakura` 依新版 `2026.08.18_2.0廚房產品_調整.pptx` 第二頁重新核對；保留 Antra Virtual Tours 的 360px 麵包屑 Hero、Home 02 左文右圖介紹區、1410px 版心、3／2／1 欄商品卡與 24px 圓角節奏。頁面大標與麵包屑維持「SAKURA 廚電產品」，介紹區依新版標註將膠囊改為帶金色圓點的 `Kitchen Appliance`，模板英文大標 `Behind Every Statistic Pulses A Human Story` 不更換。
- **新版指定調整**：Hero 底圖改用 `影像 > 3.0 門市與服務 > 3.1 案例門市` 的松竹店店面照；Hero 中英大標使用 Noto Serif TC 角色、麵包屑固定 Noto Sans TC 15/22px。介紹段落使用 Noto Sans TC；商品分類標籤固定 Noto Sans TC 13/19px，商品名稱固定 Noto Serif TC 25/34px。Hover 箭頭沿用「關於我們」卡片的圓形動態語彙，不把加號或假按鈕混入商品卡。
- 商品資料依 PPT 內嵌的甲方正式分類畫面建立 13 個可核對分類：6 個 SAKURA 廚電商品、2 個熱水器、5 個淨水設備；卡片商品圖取自 PPT 內嵌來源圖的單一商品主體，頁面結構、文字與互動仍是 Vue／HTML／CSS，沒有把完整頁面截圖當成網頁。
- 新增唯讀商品資料介接設定 `NUXT_PUBLIC_SAKURA_PRODUCT_ENDPOINT`。依使用者決定，甲方尚未提供 API 端點時先安靜使用 PPT 分類快照，不顯示錯誤或介接提示；日後若真的設定端點且回傳失敗、空資料或格式錯誤，才完整顯示錯誤、端點、fallback 原因與重新讀取操作。
- Header 桌機與手機版的「廚房產品 → SAKURA 廚電」已接到 `/products/sakura`；SVAGO、TEKA 仍維持明確的「尚未開放」狀態，廚房商品型錄則已接到正式 `/catalogues/catalog`，沒有 `#` 假連結。
- 本頁刻意不加入搜尋、篩選、假分頁、假載入更多與假 360° 控制，因 PPT 明列原合約沒有搜尋／篩選。2.1.1 第一個正式系列頁「除油煙機系列」已完成並接上；其餘分類等對應 PPT 頁面與正式資料提供後再延伸，不先建立空白或假路由。
- **手機可用性修正**：390px 回查發現原本右側 72px 快捷列會覆蓋 360px 內容欄 57px，並遮住介紹文與商品卡，因此全部 `/products…` 路由於 767px 以下隱藏快捷列；桌面仍維持原狀。Hero 標題改用 34–42px 流動字級與單行控制，避免「SAKURA 廚電產品」在手機被硬折成三行。
- **乾淨資料狀態**：未設定商品 API 時，`useAsyncData` 改回傳空陣列再使用 13 筆 PPT 快照，不再回傳 `null` 觸發 Nuxt 用戶端重複請求警告；只有正式端點已設定且失敗時才顯示完整錯誤與重試操作。
- 型別驗證第一輪已攔截 API fallback label 的 `unknown` 窄化與 retry handler 的事件簽章問題；兩處均已改成明確的字串快照與無參數 UI handler，避免把資料解析器或 AsyncData 執行選項直接暴露給按鈕事件。
- 首輪瀏覽器 QA 發現 Nuxt 對 `components/internal/` 會自動加上 `Internal` 前綴；頁面原先使用未加前綴的元件名稱，造成介紹圖與商品圖容器存在但圖片節點沒有渲染。現已改為 `InternalProductCategoryImage`，並納入後續建置與影像 naturalWidth 檢查。
- 導覽 DOM 檢查另發現用動態 `<component>` 指向 `NuxtLink` 會被 SSR 留成無效的 `<nuxtlink>` 自訂標籤，視覺存在但實際不能導航。桌機 mega menu 已改成編譯期明確的 `NuxtLink v-if`／disabled `div v-else`，避免「看起來能點、實際沒 href」的假互動。

### 2.1 Design QA

- **模板對照**：新版 PPT 第二頁、內嵌 `image4.png` 長頁與 1440px 本機預覽以相同尺寸比對；依專案只維護 README 的規則，本節取代額外的 `design-qa.md`。來源真值位於 `/private/tmp/sakura-products-adjust.QyzhMl/reference-1440.png`，實作證據與最終比較圖於同一暫存目錄；Hero、Home 02、膠囊、金色標題片段、三欄卡片與 Footer 的結構維持模板比例。
- **資料與素材**：瀏覽器實測 13 張分類卡完整渲染；介紹圖 naturalWidth 為 977，13 張商品圖 naturalWidth 均為 720，所有 `complete=true` 且沒有圖片 error fallback。PPT 分類順序與數量為 6＋2＋5，未加入 PPT 明確排除的搜尋／篩選。
- **導覽與 SSR**：頁面回傳正式 SEO title；Header 內有 1 個真實 `/products/sakura` anchor、無殘留 `<nuxtlink>` 自訂元素。乾淨新分頁的 console 為空，沒有 hydration mismatch、runtime error 或 Vite overlay。
- **版面與互動**：1440×900 實測三欄卡寬 411px、`scrollWidth === innerWidth`、13 張卡順序為 6＋2＋5；第一張除油煙機卡 Hover 後金色圓形箭頭為 `opacity:1`，點擊可進入正式 `/products/sakura/range-hood`。390×844 實測內容欄 360px、Hero 標題單行、快捷列 `display:none`、卡片無遮擋且 `scrollWidth === innerWidth`；桌機與手機圖片錯誤、Reveal 隱藏、role alert、console error／warning 皆為 0。
- **建置結果**：`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過；build 僅保留專案既有的 Tailwind sourcemap warning，沒有本頁新增的 compile error。
- **final result: passed**

## 6.2.2 建商專區型錄（2026-08-15）

- **最新 PPT 第 10 頁（2026-08-23）**：`/builders/catalogues` 改以 `2026.08.19_6.0合作專區_調整.pptx` 第 10 頁為最新真值；依投影片三組紅色刪除標記，頁面只保留新增的 `Developer Catalogs／建商專區型錄 2026`，舊版 `iPremium／Joyful／Premium／Harmony／Loft Chic／Elegant` 六本品牌系列型錄不再於建商專區渲染。一般品牌系列型錄仍維持既有 `/catalogues/kitchenware-catalog` 路由，避免兩種型錄資訊架構再次混用。
- **字體、狀態與互動**：Hero 中文主標及卡片標題改為 Noto Serif TC SemiBold，卡片標題固定 25／34px；麵包屑、說明、紅色 PDF 狀態與預覽操作統一 Noto Sans TC 15px。正式 PDF 尚未由甲方提供，因此保留單一卡片的原生 Dialog 封面預覽並完整顯示「正式 PDF 待甲方提供」，不建立假下載連結；主標、麵包屑與卡片分層進場，卡片 Hover／Focus 維持模板的深色覆蓋、圖片縮放與圓形箭頭。
- **第 10 頁 Design QA（2026-08-23）**：最新簡報標註與 1440×1000 實作已合併於 `/private/tmp/builders-catalogues-slide10-design-qa.png` 核對；桌機與手機 390×844 均檢查 Hero、單一卡片、Footer 與 Dialog。卡片數量 1、圖片失敗 0、未完成 Reveal 0，兩種尺寸皆 `scrollWidth === innerWidth`。手機快捷列依頁面既有安全規則隱藏，預覽鈕常駐且不遮住標題；Dialog 開啟後焦點落在「關閉型錄預覽」，支援 Escape，狀態文案完整可見。沒有剩餘 P0／P1／P2 差異，最終結果：`passed`。
- **建置驗證**：`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過；production build 只有專案既有的 Tailwind CSS v4 sourcemap warning，沒有第 10 頁新增的 compile error。
- 新增正式 SSR 路由 `/builders/catalogues`，依 `2026.08.14_6.0合作專區_櫻花整體廚房頁面開版.pptx` 第七頁實作；沿用 Antra Projects 01 的 360px 麵包屑 Hero、1410px 版心、3／2／1 欄型錄卡、24px 圓角與 Projects hover 節奏，並依 PPT 指示刪除篩選列。
- **舊版紀錄（已由最新第 10 頁覆蓋）**：第七頁曾要求在本頁同時保留六本品牌系列型錄與新增建商型錄；2026-08-23 最新稿已明確把六本舊卡全部標示刪除，因此現行頁面不再沿用這項舊決策。
- 2026 建商型錄封面直接取自 PPT 第七頁內嵌的 1241×1654 正式原圖，整理至 `public/section-6/builders/catalogues/developer-catalogue-2026.jpg`；Hover／Focus 採 Poliform 圖冊參考的深色覆蓋、預覽文字與右側箭頭，點擊後用原生 Dialog 顯示完整封面預覽。
- PPT 沒有附建商型錄 PDF，因此頁面明確顯示「正式 PDF 待甲方提供」，Dialog 也說明沒有建立假下載；Header「建商專區型錄」及 6.2.1 的兩個產品型錄入口均維持 `/builders/catalogues`，一般「品牌系列型錄」仍走 `/catalogues/kitchenware-catalog`。
- **舊版手機紀錄（已由最新第 10 頁覆蓋）**：舊版曾為右側快捷列預留 78px；現行手機頁依全站內容安全規則隱藏快捷列，卡片改用完整欄寬。Dialog 仍使用原生 top layer，支援關閉鈕、`cancel`／Escape 與點擊遮罩關閉；圖片失敗會在原卡片完整顯示素材資訊，reduced-motion 下停用縮放與位移。
- 首輪 1280px QA 發現共用 Header 在 `xl` 斷點同時放大 Logo、導覽內距與外框內距，造成 Logo 壓到「品牌承諾」；完整桌面間距改由 1440px 才啟用，1024–1439px 維持既有 160px Logo 框與緊湊導覽，未改 60px 高度、字級或下拉互動。型錄 Dialog 另明確設為 viewport 置中，開啟時焦點直接落在關閉鈕，移除瀏覽器加在整個可捲動 panel 外的金色焦點框，同時保留關閉鈕的可見焦點環。
- **舊版 Design QA（已由最新第 10 頁覆蓋）**：2026-08-15 曾驗收七張封面與六個品牌 PDF；該資料量及手機快捷列結論不再適用，現行驗收結果以上方「第 10 頁 Design QA」為準。

## 6.2.1 SAKURA KITCHEN 介紹頁（2026-08-15）

- **最新 PPT 第 9 頁（2026-08-23）**：`/builders/sakura-kitchen` 改以 `2026.08.19_6.0合作專區_調整.pptx` 第 9 頁為最新真值，保留投影片指定的 Home／Virtual Tours 長頁結構，不重做另一套近似版。桌機 Header 與 Hero 間距校正為 20px；Hero 英文／中文 Logo 直接使用投影片內嵌的正式透明圖，不再把頁尾金色 Logo 透過 CSS 濾鏡偽裝成白色版本。品牌介紹、玻璃卡與 Hero 文案明確使用 Noto Sans TC，玻璃卡連結依註記改為 `Our Advantages` 並維持 `/about/advantage`。
- **標題、文案與 CTA 校正**：兩組中文主標統一為 Noto Serif TC SemiBold 40／50px，承接全站 18px 以上襯線字 SemiBold 規則；說明段落、`EXPLORE OUR COLLECTIONS`、產品型錄與立即預約改為 Noto Sans TC 15px。Hero 圓形「立即預約」依 PPT 移除箭頭，保留模板色彩／透明度並加入金色雷達動畫；產品型錄與頁尾預約 CTA 則維持全站 60px 膠囊、40px 金色圓箭頭、雷達水波與 Hover 旋轉。標題、說明、全景圖、六張系列卡及 CTA 均分層使用既有 `opalMoveUp／opalScaleUp`，reduced-motion 下停止水波與轉場但內容立即可見。
- **第 9 頁最終 Design QA（2026-08-23）**：將 PPT 內嵌的 2880×6996 長頁參考與 1440×1000 實作首屏、逐段桌機截圖放進同一張比較圖核對；頁面維持 Hero、品牌優勢全景、系列六卡與 Footer 的模板順序，桌機 `scrollWidth === innerWidth === 1440`，390×844 手機 `scrollWidth === innerWidth === 390`，圖片失敗 0、未完成 reveal 0、唯一 `h1`。Hero 預約 CTA 實際導向 `/builders#appointment` 且定位成功、品牌優勢卡導向 `/about/advantage`、產品型錄以 `_blank`＋`noopener noreferrer` 開啟 `/builders/catalogues`；手機另在此頁隱藏會覆蓋主要內容的右側快捷列，最終結果 passed。
- 新增正式路由 `/builders/sakura-kitchen`，依 `2026.08.14_6.0合作專區_櫻花整體廚房頁面開版.pptx` 第六頁與其中的 Antra Virtual Tours 參考頁重製；原 `/builders` 頁移至 `pages/builders/index.vue` 以建立正確父子路由，Header「建商專區」同步補上首頁、SAKURA KITCHEN 與型錄三項下拉導覽。
- 2026-08-15 依畫面回饋重新逐項拆解第六頁：前版雖使用正式圖片，但把 Antra Virtual Tours 的 Hero 比例、右下玻璃導覽卡與低矮全景區塊改成自訂版型，並把產品型錄錯放進 Hero，判定不符合模板後已撤除。現行 Hero 直接沿用專案既有 Home 09 的 1410px／`2.203125:1`／24px 圓角舞台，右下玻璃導覽卡保留 PPT 指定的左圖右文模板結構，並連到本頁品牌優勢；立即預約維持左下圓形入口。
- Hero、品牌優勢橫幅與六張品牌系列圖直接取自 PPT 第六頁內嵌的正式原圖；玻璃導覽卡依模板改為真實 HTML／CSS 元件，保留模板英文標題 `Project Excellence`，英文連結依最新第 9 頁更新為 `Our Advantages`，中段說明換成 PPT 指定的「源自於全台數百萬戶家庭生活研究與觀察」。文字可選取、整張可點擊並導向正式品牌優勢頁 `/about/advantage`。先前誤把 `Project Excellence` 參考圖當成正式網頁素材的作法已撤除，網站不再載入帶字卡片截圖。
- 文案採用 PPT 指定的 700 萬用戶數據、45 萬套設計模組、AI 科技應用與家庭生活研究內容；品牌系列名稱使用 Libre Baskerville，Nuxt Google Fonts 載入設定已補齊 400／700 字重。
- 品牌系列已依 PPT 素材與標示恢復為 `iChef`、`iFun`、`Loft Chic`、`iPremium`、`原色系列 01`、`原色系列 02`，順序、圖片與命名逐一對應；系列名改回 Virtual Tours 卡片中央覆蓋位置，不再使用錯誤的 AI Kitchen／Premium／Elegant 名稱或左下角自創排版。
- Hero 與頁尾「立即預約」均導向 `/builders#appointment`，完成跨頁定位到 6.2-S1 預約表單；PPT 指定的唯一「產品型錄」入口移回低矮全景圖中央並以新分頁開啟正式 6.2.2 `/builders/catalogues`，Hero 不再重複放型錄入口。
- RWD：桌面使用 1410px 單一模板版心、全景維持 `4:1` 低矮比例與三欄品牌圖；1024px 以下 Hero 改為 1.72:1、品牌圖兩欄，767px 以下改單欄並分離玻璃卡與預約圓鈕。所有圖片失敗會在原容器完整顯示檔案、用途與部署檢查提示，reduced-motion 下取消位移與 Hover transform。
- 首輪瀏覽器驗收發現 `builders.vue` 與 `builders/sakura-kitchen.vue` 路由衝突，已改為 `builders/index.vue` 後重新建置；品牌專有名詞 `iFun`／`iPremium` 另覆寫全域標題 capitalize，保留 PPT 指定大小寫。
- 390×844 首屏實測程式版玻璃卡片位於 x=35–305、右側快捷列始於 x=318，左圖與右文兩個抽樣點均命中整張連結而非快捷列；桌機與手機點擊均完整導向 `/about/advantage`。手機 `scrollWidth === clientWidth === 390`，卡片文字可選取，Hero 三張圖片皆正常載入。
- 最終 Design QA：把 542×228 模板卡片參考與 1280×720 production preview 的程式元件裁切合併至同一張 1084×228 比較圖，逐項檢查圓角、玻璃底、左圖右文比例、英文 `Project Excellence`／中文 PPT 說明／英文 `Our Projects` 層級與縮圖裁切；桌機卡片實測 414.8×174.5 CSS px，手機為 270×113.6 CSS px。整張點擊、桌機／手機 `/about/advantage` 跳轉、快捷列安全距離、溢位、素材 naturalWidth 及重新載入的 console error 均通過，最終結果 passed；完整 QA 紀錄維持於 `/private/tmp/sakura-kitchen-redesign-qa.txt`，未新增第二份 `.md`。

## 5.3 關於我們（2026-08-13）

- 正式路由：`/about/introduce`；Header「品牌承諾」、5.1 與 5.2 頁面導覽均已接上，不再顯示為停用項目。
- 版型依 `2026.08.13_5.0品牌承諾_櫻花整體廚房頁面開版.pptx` 第五頁重製，使用 Antra Service 01、Home 03 About Us、四區塊 About Us 與 Gallery 01 的原生結構、1410／1770px 版心與 Opal 進場動畫。
- 內容包含 1978、1992、2016、2020 四個官方品牌紀事；桌面可從 Service 01 清單切換主圖與內容，後續保留 Home 03 四欄品牌紀事。
- 5.3 Banner 用於 Antra `banner-process` 的一張主背景＋四欄透明分隔切換；六張官方品牌辨識圖依序為品牌銘板、靜音緩衝抽屜邊蓋、不鏽鋼桶身沖印、座式緩衝滑軌蓋沖印、鉸鍊邊蓋、門板前緣封邊壓印。
- 所有 5.3 素材整理於唯一正式靜態目錄 `public/section-5/about-us/`，不直接引用 Downloads；圖片載入失敗會在原容器完整顯示檔案路徑與錯誤狀態。
- RWD：桌面維持模板雙欄／四欄／六欄，1024px 改 2／3 欄，767px 以下改單欄或雙欄；reduced-motion 下取消位移與過渡。
- QA：`pnpm typecheck` 與 `pnpm build` 通過；本機 SSR 驗證四筆品牌記事、四個品牌承諾區塊、六個辨識項目均存在，所有圖片載入完成且 `scrollWidth === clientWidth`。
- 2026-08-13 二次校正：刪除所有無來源的補寫文案，改為 PPT 第五頁與官方品牌介紹可核對的原文；Hero 改回 Service 01 深色背景，品牌承諾改為 Antra `banner-process` 原始 Hover 換圖／四欄展開結構，Gallery 01 補回 50% 黑色遮罩、中央圖示與 `scale(1.2)`。
- 2026-08-13 Banner Process 狀態修正：撤除 01 的程式常駐 active，四欄預設全部收合；桌面以 Antra 原生 CSS Hover、鍵盤 Focus 展開，離開後恢復收合。四欄均保留相同的內容佔位高度，沒有說明段落的 04 也會與 01–03 貼齊同一底線，不再向下溢出舞台；背景維持 PPT 指定的單張 Banner，不自行加入四張切換圖。
- 2026-08-13 PPT 第五頁完整文字複核：Service 01 四個英文示例問題已全部撤除，改為 1978 成立台灣櫻花、1992 發展系統廚具、2016 導入 AR 3D、2020 產線整合與新廠啟用的甲方指定文案；四筆年份長文、四欄品牌承諾及六項專屬品牌辨識均逐項核對。簡報轉檔混入的「樱／厨房」統一校正為台灣官網正體字「櫻／廚房」，辨識名稱依 PPT 修正為「鉸鏈邊蓋」與「門板前緣邊壓印」。
- 2026-08-13 Service 01 展開結構修正：依 Antra `service-accordion` Layout 2 將每筆品牌紀事長文放回對應年份列內，1978 預設展開，切換 1992／2016／2020 時只展開該列並同步左圖；不再把單一答案錯放在整組列表底下。左側圖片覆蓋文字依甲方要求只顯示年份，不重複顯示事件標題。
- 同次互動驗收修正共用 Reveal 指令的 VNode style 合併：不再於 directive `created` 階段把已正規化的 style 強制改成陣列，避免年份切換時 Vue 嘗試寫入 `CSSStyleDeclaration[0]` 而拋出前端錯誤；動畫 delay 仍由 SSR props 與實際 DOM 同步保留。
- 依甲方畫面回饋移除品牌紀事卡片上方整排「ABOUT US／櫻花整體廚房紀事」標題，只保留四張年份紀事卡片；Section 改用 `aria-label` 維持可理解的無障礙區塊名稱，且同步清除標題造成的多餘留白。

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
開發模式使用 `nuxt-site/.nuxt-dev/`，正式建置與 typecheck 使用 `nuxt-site/.nuxt/`；兩者刻意分離，避免開著 dev 時執行 build 造成 Vite 的 `#app-manifest` 虛擬模組失效。

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
- 2026-08-17 依新版「門市與服務、優惠消息」PPT 的 3.1 服務流程／FAQ 頁更新 `/service-process`（檔案實際第 2 張為 3.1，第 3 張已是 3.2 案例門市）：Hero 改用素材庫既有的台中集團品牌館正面照，頁面標題／麵包屑分別套用 `Noto Serif TC` 與 `Noto Sans TC 15px`；2026-08-18 回查時移除會讓 fixed 背景依視窗裁切的設定，改以 `center 88%` 固定內容裁切，確保 `SAKURA GROUP`、`O.N.E` 與館外觀能進入 Hero，而不是只剩樹冠。介紹主標恢復 Antra 模板原文 `Description Architecture Process For Exceptional Results.`，中文說明改為 `Noto Sans TC 15px`，並在 `1025–1366px` 套用模板式 `50/56px` 字級，避免英文主標被右側浮動列裁切。流程標題調整為 `Noto Serif TC 38px`、流程文案統一 `Noto Sans TC`，並縮短介紹與流程間距。FAQ 保留模板英文大標與全寬 Accordion，分類／題目／回答改用 `Noto Sans TC`、題目為桌機 `20px`，同時移除回答原本的負上邊距並補 `8px` 上內距，解決 PPT 指出的內文上緣被裁切；3.1 FAQ 另啟用桌機右側 `86px`、手機 `72px` 浮動列安全距，服務流程手機內容也保留相同安全欄，避免標題、文案與 `＋／－` 被快速服務按鈕遮住。2026-08-18 手機回查另補上安全欄的 `border-box`，避免 72px padding 反向撐寬 360px FAQ rail，造成分類標題、題號與問題文字左側出界；手機 FAQ 英文標題亦保留 `Answers To` 的單字空格。Accordion 保留滑鼠、Enter 與 Space 切換。
- 2026-08-17 3.1 Design QA：視覺真值採用 `/Users/eric/Downloads/2026.08.14_3.0門市與服務、4.0優惠消息 _調整.pptx` 第二頁與其內嵌 1720×5312 原頁截圖；以 1720×900 分別比對 Hero、服務流程與 FAQ，並補測 1280×720、390×844。首輪發現 1280px 英文介紹標被浮動列壓到、手機流程／FAQ 操作區被浮動列遮住、鍵盤切換不穩定及 `AnswersTo` 缺空格，已依序透過中尺寸字級、安全欄、明確 Enter／Space handler 與文字空格修正。最終三個寬度皆為 `scrollWidth === clientWidth`，第一題預設展開，滑鼠／Enter／Space 切換正常，Console error／warning 為 0；新 Taichung Hero、Noto 字體、模板英文介紹、縮短間距與 FAQ 20px 題目屬 PPT 指定差異，Design QA 結果：`passed`。
- 2026-08-18 3.1 回查 Design QA：先確認 PPT 頁序誤差，以章節標號 3.1 的實際第 2 張為真值（實際第 3 張為 3.2，不能依口述頁碼誤改）。將 PPT 內嵌整頁、1512px 實作的 Hero／流程／影片／FAQ 四個同區域畫面各自合併比較；首輪抓到兩個 P2：Hero 正確照片被 fixed 裁切成樹冠，以及 390px FAQ 安全 padding 因 content-box 反向撐寬、使分類與題號左側出界。修正後 1512×980 實測 Hero 為 `center 88% / scroll`、8 個流程步驟、15 題 FAQ、圖片錯誤 0、Reveal 隱藏 0、水平溢位 0；Noto Serif／Noto Sans 字級分別符合 80／38 與 15／20px。390×844 FAQ 標題、分類與問題列均落在 `x=15–303px`，與 `x=318px` 的浮動列保有 15px 間隔；第一題預設展開，滑鼠、Enter、Space 均可切換。最終結果：`passed`。
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

- **Header Logo / mega-menu**：導覽列 Logo 改用 Footer 同一份橫式 `public/home-2026/footer/sakura-kitchen.png`，保持原始比例；Flex 版面框為 ≥1440px `260px`、1024–1439px `160px`、<1024px `184px`，Logo 圖片以 `scale(1.25)` 視覺放大為約 `325 / 200 / 230px`。縮放不參與 Flex 尺寸計算，因此不擠壓左右導覽，也不改變固定 `60px` Header 高度；手機以左側為縮放原點避免貼出畫面。因素材金色與 Header 金色漸層對比不足，僅在 Header 以 CSS 轉為白色，Footer 原始金色不受影響。正常桌面導覽自 `1024px` 顯示，所有桌面寬度均使用 `15px / 15px / 400`，1024–1439px 使用緊湊 item 與外框內距，≥1440px 使用官網完整間距；只有 <1024px 使用搜尋＋漢堡 Accordion。白色廚房產品 mega-menu 繼續滿寬，產品內容收進 `max-width:1200px`；SAKURA／SVAGO／TEKA 三個文字標題使用官方 Logo，每個為 `170×50px` 顯示框並與產品圖、「廚房商品型錄」左緣對齊。桌面支援 hover 與鍵盤 focus-within 展開；一般下拉選單的觸發區與 Header 同為 `60px` 高，左側第一項沿左緣、右側項目沿右緣展開，避免 `190px` 選單被 viewport 裁切。新增「設計案例 → 品牌系列」第二層滿寬 mega-menu：左側保留四個原選項，右側以 `5×2` 卡片顯示首頁現有十大系列、正式中英文及圖片；「品牌系列」使用不跳頁的 submenu button，整塊維持同一個 hover/focus 區域，移入圖片不會閃退，圖片卡與「查看全部」才連回首頁 `#kitchen-series`。十大系列資料集中於 `src/data/kitchenStyles.ts`，與 `ProjectSection` 共用，避免 Header 與正文不同步。手機 Accordion 維持原本單層操作。
- **Header 二層 Hover intent 修正（2026-08-14）**：Nuxt 版「設計案例 → 品牌系列」維持現有滿寬面板、卡片尺寸、顏色與 300ms 淡入動畫，不再用高層級透明列覆蓋品牌面板。游標短暫經過「品牌系列」前往「設計靈感／廚房裝修指南／品牌系列型錄」時不開啟面板，三列可直接點擊；刻意停留 180ms 才開啟品牌面板，移入十大系列卡片後保持可操作。鍵盤 focus 立即開啟，不套 hover 延遲。
- **Hero**：使用 `ai-kitchen.jpg → clever-kitchen.jpg → basic-plus.jpg`，每 5 秒換圖；圖片轉場沿用 Antra Home 01 Slider Revolution 原始 `slidingoverlaydown / double` 規格：總長 `2000ms`、第一份新圖片 `1333ms`、第二份新圖片延遲 `333ms` 並於 `2000ms` 完成，easing 對應 `power2.inOut`。每張新圖的暗色層與原色層同步執行 5 秒 Ken Burns 緩放大／向左移動，上一張在下一輪揭幕期間維持運鏡終態，不再於換圖瞬間縮回原尺寸。首次進場三層為模板灰 `#9F9FA4`＋套 `rgba(16,8,1,.46)` 暫時遮罩的新圖＋原色新圖；後續換圖依模板實際週期改為保留上一張完整圖片作底層，再以暗色新圖與原色新圖由上往下覆蓋，過程不再重新露出灰底。最後原色圖片完整覆蓋，不加入整張常駐黑色遮罩；另在圖片轉場之上加入僅覆蓋 Hero 底部 `58%` 的透明至黑色漸層（中段 `rgba(0,0,0,.42)`、底部 `rgba(0,0,0,.86)`），強化 `Kitchen` 浮水印對比但不壓暗上半部主圖。2026-08-28 移除原 Home 06 eyebrow 文案與 H1 其餘文字，只保留標題區第一行靠左的 `Design`，並為固定品牌系列按鈕加入 70px 桌機安全區；`Design` 與描述改為同步單張背景的 5 秒文字循環，Start Project 為 `fadeIn / slow 2s / delay 900ms`，底部 Kitchen 大字為 `fadeInUp / 1.25s / delay 250ms`。Hero 根節點不套整區 `fadeInDown`；`prefers-reduced-motion` 停在第一張、隱藏遮罩圖片層並直接顯示原色圖片，所有保留內容立即可見。桌面左側「品牌系列」伸縮選單固定於 viewport，捲離 Hero 後仍固定在左側中線；手機維持隱藏。Start Project 的 120px 玻璃圓尺寸不變，未 hover 時增加 2 秒金色雷達水波，hover 後停止並隱藏。
- **Section eyebrow**：Services／Gallery／WhatWeDo／Store 依序改為「廚房產品／門市案例／品牌承諾／門市查詢」，膠囊尺寸、金點、邊框與動畫不變。
- **廚房產品卡**：順序與編號改為 `01 SAKURA → 02 SVAGO → 03 TEKA`；正式品牌拼字為 `SVAGO`。卡片尺寸、Logo 光學等大、Embla 輪播與 hover 不變。
- **Services 底部 Logo 跑馬燈**：取代舊的 `Kitchen Product` 巨型文字，順序為 SAKURA／TLK／TEKA／SVAGO／SAKURA Home；每格 Logo `170×50px`、左右 margin 各 `70px`、四組無縫重複以完整覆蓋 4K。尺寸與間距沿用 SAKURA 官網 Footer，速度依最新需求由官網基準 `20s` 加快為 `16s linear infinite`；背景仍併入 Services 深色 Section，減少動態模式停止動畫。
- **品牌承諾影片**：使用 YouTube `wH374AF9wLI`；2026-08-25 修正首頁放大影片區曾直接顯示 YouTube iframe 的回歸，重新使用共用 `InternalBrandVideo`。待機封面改用從 1080p 正式原片第 `0.00s` 直接擷取的 `/public/home-2026/brand-commitment-opening-frame.webp`，並依指定畫面裁掉原片上下電影黑邊；人物與廣告畫面沒有 AI 重繪。初始只顯示這一幀與模板正圓播放鈕，不預先露出 YouTube 控制介面；點擊後才在原 16:9 卡片內載入 autoplay iframe。封面或 iframe 載入失敗時，前端顯示完整錯誤理由、影片 ID 與 YouTube 備援連結。
- **指定影格 Design QA**：來源真值為使用者提供的 `截圖 2026-08-25 晚上11.35.50.png`（940×648）；瀏覽器實作為 1280×720 viewport 中 690×388 的 16:9 影片卡。實作擷圖 `/private/tmp/home-brand-commitment-implementation-1280x720.png`、正規化的影格對照板 `/private/tmp/home-brand-design-qa.png`；人物、食材紙袋、棕色櫃體與中央構圖一致，實作保留 Antra 自有的圓形水波播放鈕，不把參考圖的 YouTube 控制介面燒進圖片。封面實際載入 1920×790，`object-fit: cover`、中心對齊，點擊後 iframe 數量為 1，browser console error 為 0；`final result: passed`。
- **Footer**：底部巨型 `footer-sakura.svg` 改為使用者提供的 `public/home-2026/footer/sakura-kitchen.png`；保留原始金色與比例、不降低透明度，所有斷點都水平置中並貼齊 Footer 底部。2026-08-25 再將 Footer 背景替換為使用者提供的 `IMG_1340.PNG`，網頁最佳化檔為 `public/home-2026/footer/kitchen-background.webp`（1774×887），保留原有深色透明圖層以確保白色連結與金色 Logo 可讀。依最新回饋將總高調整為手機／平板 `390px`、桌面 `600px`；連結與圖示列的 top padding 增加 12px（手機 48px、桌面 60px），整排稍微下移。資訊列與 Logo 共用真正的 `1410px` 置中版心，不在 max-width 內再疊加 51px padding；390px 另為 Copyright 保留右側懸浮列安全區。Copyright 與連結內容不變。
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

### 字型系統（Cal Sans／Golos Text＋Noto Serif TC／Noto Sans TC）

全站依 Antra 模板與開版 PPT 共用四種字型角色，來源集中在 `src/styles/globals.css`，Nuxt 由 `nuxt.config.ts` 的 Google Fonts 連結載入：
- **英文標題／展示字＝`Cal Sans`（僅 weight 400）**；**中文標題＝`Noto Serif TC`**。`--font-display` 以 Cal Sans 在前、Noto Serif TC 在後，同一個中英混合標題可逐字使用正確字型；全站 `<h1..h6>` 預設走此 token，頁面只有在 PPT／模板明確要求無襯線層級時才用 scoped token 覆寫，避免用 `!important` 誤蓋 FAQ 與品牌特殊字。
- **英文正文＝`Golos Text`（400–900）**；**中文正文／表單／導覽／按鈕＝`Noto Sans TC`**。`--font-sans` 負責正文，`--font-ui` 保留 Cal Sans 的英文介面外觀並以 Noto Sans TC 補中文字形。
- **PPT 明確指定的純中文字**使用 `--font-cjk-serif`／`--font-cjk-sans`；6.2.1 品牌系列卡依 PPT 保留 `--font-brand-serif`（Libre Baskerville）。所有 token 都接上 PingFang TC／Microsoft JhengHei／Songti 等系統 fallback，字型載入失敗時仍維持黑體／明體角色，不落到不確定的 generic font。
- **2026-08-18 全站治理**：盤點 32 個 Nuxt 路由與 259 個顯式 `font-family` 宣告，把 233 個散落的 `"Cal Sans", sans-serif`、9 個 Noto Sans、2 個 Noto Serif及其餘 Golos／Libre 宣告全部改為共用 token；body 也明確套用 `--font-sans`。往後改字體只調整全域角色，不再逐頁補字型。
- **2026-08-18 字型 QA**：逐頁以瀏覽器檢查 32 個桌面路由，另以 390×844 檢查首頁、品牌優勢、建商、加盟表單、設計案例、優惠消息、廚電商品與服務流程 8 個代表頁；所有頁面 body／標題角色正確、實際中文字型 fallback 正確載入、特殊 Libre Baskerville 保留、路由無誤且水平溢位皆為 0。AI Kitchen 商品卡的型號與品名刻意保留雙層字型，不視為漏改。
- **標題字級（對照 demo `html`=20px 實測，逐一驗證）**：Hero h1 **100**、Pricing/WhatWeDo/Store h2 **60**、Gallery h2 **75**（原 110，不符模板任何標題、已改對齊 home-three gallery 75/lh80）、Project 卡 h3 36。Hero 大標移除原 `-1px` letter-spacing（模板標題 letter-spacing 0）。

### 英文文案（＝Antra 模板原始 demo 逐字，只英文、中文不動）

各 section 的英文改用**本地模板 demo 匯出檔逐字文案**（來源 `antra-full 2/antra/dummy-data/`：`homepage/home-6.xml`＝Hero/WhatWeDo、`home-3.xml`＝Gallery、`content.xml`＝Pricing/Contact）。金色重點字沿用 CIS 金 `#C9AA79`（只跟隨模板「哪些字是金的」）；模板文案裡的品牌名 **Antra→SAKURA**。

| Section | 英文文案（模板逐字；⟨…⟩＝金字） |
|---|---|
| Hero | eyebrow 與 `Find Your Inspired Kitchen` 已依 2026-08-28 最新回饋移除，只保留原位置的 `Design`；副標 `Transform your vision into reality with our innovative designs, creating modern spaces that blend functionality, aesthetics, and sustainability.`；圓鈕預設 `Start Project`、hover／focus 顯示「設計靈感」，連至 `/design-inspiration` |
| Services | eyebrow `Our Services`；h2 `Explore Our ⟨Comprehensive Interior Design⟩ Services`；6 服務卡 title/excerpt＝模板 home-6 dummy-data 佔位（待 SAKURA 本地化） |
| Gallery | eyebrow `our gallery`；h2 `Interior design`；段落 `Lorem ipsum dolor sit amet consectetur. Magna nunc porttitor convallis faucibus laoreet.`（Home Three 原始文字） |
| WhatWeDo | 2026-08-26 依最新首頁回饋恢復模板英文大標 `SAKURA has created exceptional`；`打造符合每個家庭的理想廚房` 改為 20px Noto Serif TC SemiBold 內文標題，甲方指定的全台家庭生活研究與廚房需求完整段落置於其下並維持 15px Noto Sans TC。eyebrow 保留 `Brand Commitment`，原本三筆模板英文清單及 `We specialize…` 佔位文案不恢復。 |
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
| 兩欄 section | 預設模板基準為 `gap-[90px]`；品牌承諾區在 1201px 以上依最新需求改為文字／影片 `40% / 60%`、桌面 gap 70px，影片最大寬度由 645px 放大為 760px（1280px 畫面約 690px、1512px 達 760px）；881–1200px 維持較安全的 `44% / 56%`，手機回到單欄，避免中文標題被過度壓窄 |
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

- **背景素材（最新）**：已依指定圖片改用 `public/home-2026/footer/kitchen-background.webp`，來源為 `IMG_1340.PNG`（1774×887）；Nuxt Footer 沿用原本深色底與 20% 背景圖層，不改連結、圖示、Copyright 與底部 Logo 的可讀層級。舊的 `public/footer-antra-bg.jpg` 保留為歷史模板素材，不再由現行 Nuxt Footer 渲染。
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
- **2026-08-25 背景替換 Design QA**：來源真值為 `/Users/eric/Downloads/IMG_1340.PNG`（1774×887），現行素材為 `public/home-2026/footer/kitchen-background.webp`（1774×887，88KB）。桌面 1280×720 viewport 中 Footer 為 1280×600，實作擷圖 `/private/tmp/footer-kitchen-background-1280.png`、對照板 `/private/tmp/footer-design-qa-1280.png`；手機 390×844 viewport 中 Footer 為 390×390，實作擷圖 `/private/tmp/footer-kitchen-background-390.png`、對照板 `/private/tmp/footer-design-qa-390.png`。兩種斷點皆為 `background-size:cover`、`background-position:50% 50%`、圖層透明度 0.2；桌面保留完整中央櫃體與右側造型吊燈，手機以水槽與中櫃為中心裁切，沒有拉伸。連結、社群圖示、Copyright、底部 Logo 與回頂端按鈕的原有層級均保留；`final result: passed`。
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
  - **雙色大標**：Cal Sans 400；桌面 `60/64`、寬手機 `45/50`、手機 `30/35`；最大寬 670px，自然換行、不使用手動 `<br>`。文字縮短為「SAKURA has ⟨created exceptional⟩」，模板原品牌 Antra 僅替換成 SAKURA。
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
- **左欄（寬，~62%）**：**Google Maps JavaScript API 自訂地圖**（現行 Nuxt 元件 `nuxt-site/components/GoogleStoreMap.client.vue`），完整沿用遷移前 Vite `GoogleStoreMap.tsx` 的 18 條 Antra 中性色 style JSON、**深色水滴「S」標記**（inline SVG）、台灣總覽邊界與街道級聚焦；選取／篩選門市時 `google.maps.Geocoder` 依地址定位、`panTo` 平移（結果 cache）。地圖在首屏外初始化時，以 `IntersectionObserver` 於進入可視區後觸發 resize 並恢復正確視野，避免空白圖磚。2026-08-25 修正 Nuxt 遷移時只搬入 8 條樣式且退回 Google 預設紅色 pin 的視覺回歸。
  - **需金鑰**：目前網站由 `nuxt-site/` 的 Nuxt 應用執行，請在 `nuxt-site/.env` 設定 `NUXT_PUBLIC_GOOGLE_MAPS_API_KEY=你的金鑰`（各層 `.env` 已由 `.gitignore` 排除，不會 commit），並在 Google Cloud 啟用 **Maps JavaScript API** 與 **Geocoding API**；金鑰會提供給瀏覽器使用，必須以 HTTP referrer 限制允許網域。改 `.env` 後需**重啟 `pnpm dev`**（Nuxt 環境變數不熱更新）。Vercel Production 也必須使用同一個 `NUXT_PUBLIC_GOOGLE_MAPS_API_KEY` 名稱並重新部署；舊的 `VITE_GOOGLE_MAPS_API_KEY` 只供已停用的 Vite 入口讀取，Nuxt 不會自動沿用。
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
- **Projects Details 分類 Tab**：依 PPT 母版補回四個圓角 Tab 與各自圖示；「優惠活動」為金色啟用狀態並可返回 4.1 列表。後續完成的「最新消息」「媒體影音」「廚房裝修指南」皆已接上正式列表路由，不使用 `#` 或不存在的假路由。
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

## Header 下拉選單收合修正（2026-08-12）

- **症狀**：桌面 Header Hover 開啟「門市與服務」後，曾點擊過「服務流程」或選單按鈕時，滑鼠離開仍可能維持展開。
- **根因**：原本以 `group-focus-within` 和 Hover 同時控制下拉；滑鼠點擊留下的 DOM Focus 會持續符合 `:focus-within`，讓 Hover 已結束的選單仍被強制顯示。
- **修正**：Header 現在辨識鍵盤與指標輸入。滑鼠裝置由 `hover` 單獨控制，離開項目立即收合；只有使用 Tab／方向鍵時，`focus-within` 才能維持展開，鍵盤無障礙操作不被犧牲。
- **影響範圍**：同一規則套用「設計案例」「廚房產品」「門市與服務」「優惠消息」及右側導覽下拉；手機 Accordion、Header 高度與既有視覺不變。

## 案例門市列表導頁修正（2026-08-13）

- `/gallery` 三張門市卡的金色「預約門市」按鈕改為進入各自案例內頁，分別對應 `/gallery/case10`、`/gallery/case56`、`/gallery/case35`。
- 卡片圖片、店名與按鈕現在具有一致的站內目的地；案例內頁 Sidebar 的真正「到店預約」CTA 仍保留官方預約網址，不受列表導頁調整影響。

## Nuxt 3 — 5.1 品牌優勢（2026-08-13）

`nuxt-site/pages/about/advantage.vue` 已建立正式 SSR 路由 `/about/advantage`。甲方於 2026-08-13 確認第三頁「步驟三（引用甲方資訊提案）」才是最終結構真值，因此第二頁／早期 Home 09 組版不再作為驗收基準；現行版本逐段對照第三頁紅框標註、已購 Antra Home 08、Home 01、Gallery 01、FAQs Elementor 原始資料重製，沒有使用簡報截圖，也沒有建立 5.3 假頁。

- **2026-08-20 新版調整 PPT 第二頁**：依 `2026.08.15_5.0品牌承諾_調整.pptx` 的紅線標註校正 5.1，不拿整頁參考截圖當網頁素材。Hero 三個導覽序號改為 PPT 指定的 `。`，導覽統一 `Noto Sans TC 16px`；五種家庭中文標籤改為 `Noto Sans TC 18px`、英文標籤加入正式 `Bodoni Moda 20px`；兩處中文段落標題改為 `Noto Serif TC 25px`；河南店標籤更新為簡報指定的「櫻花廚藝生活館_河南店」並使用 `Noto Sans TC 16px`。門市與 FAQ 間距縮短 40px，FAQ 維持母版全寬三組 12 題、問題 `Noto Sans TC 20px`，並增加展開答案上方內距，修正簡報指出的內文上緣壓迫；同時啟用既有右側快捷列安全欄，避免固定的案例門市／到府丈量／客服中心蓋住 FAQ 加減號。
- **2026-08-20 5.1 Design QA**：來源真值為 PPT 第二頁內嵌的 2880×16040 原頁截圖與頁面紅線標註；以 1440×900 同尺寸擷取 FAQ 並和來源放入 `/private/tmp/sakura-brand-ppt.IaJdHi/faq-comparison-board.png` 同畫面檢查。桌機實測三組 12 題、單題展開、滑鼠與 Enter 切換、`Bodoni Moda` 載入、圖片錯誤 0、水平溢位 0；390×844 實測 `scrollWidth === 390`，FAQ rail 為 x=15–375、操作內容為 x=15–303、快捷列為 x=318–390，互不重疊。型別檢查與 production build 均通過；建置只保留 Tailwind v4 既有 sourcemap warning。最終無剩餘可執行的 P0／P1／P2，右側安全欄屬避免固定工具列遮擋操作的必要差異。
- **2026-08-20 新版調整 PPT 第三頁**：重新放大檢查「步驟二／步驟三」而不是沿用舊筆記。第三頁把三項優勢指定為 Home 01 的 Blog 三欄卡與 `Initial Consultation` 向上覆蓋動畫，不是三組左文右圖寬版列；現已把英文母版標題還原為 `Take A Look At Our Latest / Blog & Articles.` 的兩行節奏，三張卡依 01 Digitization／02 Safety／03 Professional 使用正式圖片與逐字文案，桌機 Hover 會讓白色圓角詳情卡由卡底完整向上覆蓋，reduced-motion 停用轉場，平板與手機則維持不依賴 Hover 的完整靜態內容。Hero 補回 PPT 標示的 Home 01 圓形向下控制，實際捲到家庭型態段落；優勢與門市背景回到母版連續的 `#f6f6f6`，家庭、優勢、門市三段也加入快捷列安全欄，避免第三欄內容被固定服務按鈕覆蓋。
- **2026-08-20 第三頁 Design QA**：專案規則只維護 README，本段取代額外 `design-qa.md`。來源真值為 `/private/tmp/sakura-brand-ppt.IaJdHi/template-inspect/source-slides/source-slide-03.png`（3179×2245）與聚焦裁切 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-benefits-detail.png`（900×600）；實作以 1440×900、DPR 1 的 Hero／家庭／優勢／門市／FAQ 五個終態擷取合成 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-implementation-sequence.png`，全段同畫面比較為 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-full-comparison-v2.png`。三欄卡 Hover 終態另以 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-benefits-slide3-hover-v2.png`（1440×1000）與來源同框於 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-benefits-comparison-v2.png`；390×844 靜態手機證據為 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-benefits-mobile-slide3.png` 與 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-faq-mobile-slide3.png`。字型／兩行標題、30px 三欄節奏、`#f6f6f6` 背景、正式圖片裁切、三組逐字文案與 FAQ 內容均對齊；桌機覆蓋卡的 Y 位移實測由 610px 經 111.78px 到 0px、終態 `opacity:1`，手機覆蓋層為 `display:none` 且三卡保持完整可讀。Hero 向下控制實測停在目標頂部 100px；FAQ 共 12 題、切換後只開一題。桌機與手機皆水平溢位 0、圖片錯誤 0、可見錯誤區塊 0、console error／warning 0，最終結果 `passed`，無剩餘 P0／P1／P2。
- **2026-08-20 Hover 圓角修正／QA**：使用者截圖中白色覆蓋卡底部的方形灰塊，不是 28px 圓角本身失效，而是覆蓋卡陰影被外層卡片的矩形 `overflow: hidden` 裁切。外層改為允許陰影自然延伸，白色覆蓋卡本身仍保留 `overflow: hidden`、28px 圓角與原向上滑入動畫，因此圖片和內容遮罩不變，只消除四角外側的方形陰影邊界。來源問題截圖與 1440×900、DPR 1 的 Hover 終態已合併至 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-benefit-hover-radius-comparison.png`，實作畫面為 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-benefit-hover-radius-fixed.png`；實機樣式為外層 `overflow: visible`、覆蓋層 `overflow: hidden`／`border-radius: 28px`／`opacity: 1`／位移歸零，頁面水平溢位 0、console error／warning 0。字型、間距、色彩、圖片與文案沒有被此次單點修正改動，無剩餘 P0／P1／P2，最終結果 `passed`；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

- **導覽**：Header「品牌承諾 → 品牌優勢」與首頁「櫻花優勢」CTA 皆進入 `/about/advantage`；「集團品牌館」接到 `/about/exhibition`，「關於我們」接到 `/about/introduce`，5.1／5.2／5.3 三頁已全部可導向。
- **Hero（第三頁修正）**：撤除錯用的 Home 09 影片 Hero，改為 Home 08 原生兩欄首屏：1770px 版心、左側 `Find Your Inspired Interior Design`、右側局部廚房圖與摘要，並以負 300px 位移銜接大型正式 Banner。品牌優勢／集團品牌館／關於我們三個頁面節點依第三頁放在首屏，現均可進入各自正式頁面。
- **家庭型態**：`Industrial Elegance Condo` 與官方品牌介紹下方依序呈現 Single／Couple／Children／Core Family／Extended Family 五卡；桌機為五欄，1366／1024／880／568px 以下逐級收斂，Embla 每 4 秒循環、Hover 暫停，reduced-motion 停止自動播放。
- **三項優勢（第三頁修正）**：撤除錯讀成 Home 01「寬版圖文列」的舊實作；第三頁真正引用的是三欄 Blog 卡與向上覆蓋卡片動畫。01 Digitization、02 Safety、03 Professional 在桌機為三欄，使用正式圖片、中文標題及完整說明，Hover 時以白色詳情卡向上覆蓋；平板兩欄、手機單欄並直接保留完整內容。
- **門市形象與 FAQ**：保留 `Description. Architecture Process For Exceptional Results` 及三民店／河南店不對稱雙圖；第三頁的紅字「刪除」是要求移除 FAQ 右側示意卡，因此 FAQ 維持全寬，不重新加回聊天卡。FAQ 保留 `Quick And Clear Answers To Your Key Questions`，依正式 DOCX 呈現三組 12 題，第一題預設展開、一次只展開一題，`＋／－` 固定右對齊。
- **素材與錯誤**：Banner、家庭 5 張、優勢 3 張、門市 2 張共 11 張素材集中於 `public/section-5/brand-advantage/`。共用圖片元件在原容器顯示完整錯誤、替代文字與素材路徑，Hero Banner 另有全區塊錯誤介面。
- **動畫 SSR 修正**：共用 `v-reveal` 現在在 Vue `created` 階段同步 Client VNode 的 `.ev`、`data-ev`、delay 與 duration，消除 SSR `getSSRProps` 造成的 hydration class mismatch；5.1 與回歸檢查的 3.1 均無 hydration warning，既有動畫方向與時序不變。
- **RWD／QA**：390、768、1024、1512、1920、2560、3840px 均為 `scrollWidth === clientWidth`，每個尺寸皆有 5 個家庭卡、3 個優勢按鈕、12 題 FAQ、錯誤區塊 0。捲到底後 11 張正式素材皆成功載入；優勢圖片切換、FAQ單題展開、Header／首頁連結與 3.1 FAQ 回歸正常。
- **建置**：`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 通過；production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 5.2 集團品牌館（2026-08-13）

`nuxt-site/pages/about/exhibition.vue` 已依正式品牌承諾 PPT 第四頁建立 SSR 路由 `/about/exhibition`。第一次實作只套用相近的模板視覺 token，卻以自訂 Hero、三張資訊卡與深色注意事項重新組版，並不符合使用者要求，已判定不合格並撤除。現行版本逐段回到 Antra Home 09、Single Post 02、Projects 01 與 Home 06 的原始 DOM／CSS 結構；沒有把簡報畫面當成圖片，第三個節點由獨立的 5.3 `/about/introduce` 正式承接。

- **導覽與 Hero（2026-08-20 第四頁校正）**：Header「品牌承諾 → 集團品牌館」在桌面與手機均已接到 `/about/exhibition`；Hero 使用正式 `Exhibition_Banner_Asset_01`，依 Home 09 的 1410px／24px 圓角影像舞台與左下 60/58px 英文大標重建，保留 `Creative Projects That Define Our Style`。重新放大 PPT 第四頁後，確認右側 Home 09 參考圖確實標示「嵌入影片」，舊版 README 將其判讀成「影片彈窗應撤除」並不成立；現行玻璃元件仍保留品牌優勢／集團品牌館／關於我們三個節點，但目前頁「集團品牌館」改為可操作的影片入口，開啟既有正式 SAKURA 品牌承諾影片，保留載入中、12 秒逾時、完整錯誤原因與 YouTube 備援。Hero 與 Header 的桌面／手機間距同步依紅字改為 20px，三個節點文字依註記改為 Noto Sans TC 16px。
- **正式內容**：依 PPT 第四頁逐字呈現「享受、交流、體驗」、六感體驗與現代美術館空間敘述；台北館、台中館、高雄館使用各自正式圖片、地址及週一至週五 8:30–17:30 營業時間。館別詳情補上 PPT 指定的「注意事項」標題，四點參觀須知逐字保存建設公司預約範圍、客服電話、門市服務、維修限制與全預約制資訊；官方頁面目前另有不同拆分方式，但不覆蓋 PPT 的四點版本。
- **注意事項結構修正**：完整放大檢查 PPT 第四頁紅線後，確認注意事項不是館別 Sidebar 的內容，而是指定放入 Single Post 02 最下方 `Exploring Design Styles` 複製文字區塊。現已移除底部錯誤重複的「透過鏡面…」段落，改成全寬「注意事項」與四點正式文案；館別 Projects 01 只保留各館圖片、地址及營業時間，結構與 PPT 一致。四點內容逐字校正 `SAKURA KITCHEN與TLK`、客服電話與標點，且不依賴 Reveal 才能存在於 DOM。
- **Antra 版型與第四頁標註**：Hero 下沿用 Single Post 02 的 930px `single-content / entry-content` 文章欄與 1290px `image-content` breakout 雙圖；依 PPT 將 Hero 下方與 Fundamentals 內文兩段的上下順序校正，逐字改回「以人為主…現代美術館」及「透過鏡面…感官饗宴」。`Understanding The Fundamentals` 依標註改為 Noto Serif TC 30/40px，中文副標、段落與 Gallery 膠囊改為 Noto Sans TC；雙圖至 Gallery 標題、Gallery 標題至館別篩選、篩選至館別內容分別採 100／53／40px。三館仍使用 Projects 01 的三個圓角篩選與單一詳情區，館名改 Noto Serif TC 30/40px，篩選／地址／營業時間為 Noto Sans TC 16px。最後接 Single Post 02 的 `Exploring Design Styles` 文字區，標題與四點注意事項依標註使用 Noto Sans TC，內文為 15/24px；大型英文標題維持模板原文。
- **素材與錯誤**：六張正式素材整理至 `public/section-5/brand-pavilion/`，最長邊限制為 2800px 或 1800px，避免原始 6720／8256／7295px 圖片直接拖慢首屏。所有圖片經共用 `InternalBrandImage` 呈現；錯誤時在原容器顯示「品牌頁面圖片載入失敗」、替代文字及素材路徑。
- **手機內容安全（2026-08-20）**：390px 回查時發現右側快速服務列會同時壓住 Hero 第三個節點、首段文案與 Fundamentals 標題，這不是 PPT 的桌面版面要求，而是固定工具列造成的手機可用性缺陷；`/about/exhibition` 在 767px 以下改為隱藏快速服務列，桌機仍完整保留三個固定入口，頁面內容不再為工具列額外縮窄。
- **RWD／QA**：390px 為單欄、768px 三館為兩欄、1024px 起為三欄；1512／1920／2560／3840px Hero 固定 1410px 置中，不隨超寬螢幕無限制放大。390、768、1024、1512、1920、2560、3840px 實測皆 `scrollWidth === clientWidth`、錯誤提示 0，六張正式圖片均成功載入，Hero 目前頁標示正確。
- **Design QA（2026-08-20 PPT 第四頁複核）**：依專案只維護 README 的規則，本節取代額外的 `design-qa.md`。真值來源為 `/Users/eric/Downloads/2026.08.15_5.0品牌承諾_調整.pptx` 第 4 頁、3179×2245 標註頁與其內嵌 3440×7317 長頁；長頁以 2× 比例正規化成 1720×3560，和 1720×1000 實作的 Hero、Gallery、注意事項分別放入 `/private/tmp/sakura-brand-ppt.IaJdHi/slide4-top-comparison.png`、`slide4-gallery-comparison.png`、`slide4-bottom-comparison.png` 同畫面比對，最終結果 `passed`。桌面實測 Hero 與 Header 間距 20px、三個玻璃節點皆完整顯示、影片視窗可開啟／播放／Escape 關閉、三館圖片與地址會同步切換；Gallery 間距為 100／53／40px，Noto Serif TC 與 Noto Sans TC 套用位置正確。390×844 實測 360px 單欄、快速服務列隱藏、水平溢位 0；桌機與手機圖片錯誤、Reveal 隱藏、console error／warning 皆為 0。
- **建置**：`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 通過；production build 只有 Tailwind CSS v4 既有 sourcemap warning，沒有新增型別或 SSR 錯誤。

## Nuxt 3 — 5.3 關於我們（2026-08-20）

`nuxt-site/pages/about/introduce.vue` 依品牌承諾 PPT 第 5 頁調整既有 `/about/introduce`，保留已符合 Antra 模板的 Breadcrumb、Service 01、品牌紀事、四欄 Process 與 Gallery 結構，不另造一套近似版型。

- **Hero 與字體**：Breadcrumb 底圖依標註改用 5.2 集團品牌館的台中館正式照片，麵包屑逐字維持「首頁／關於我們」並改為 Noto Sans TC 15/22px。內頁膠囊、說明文、歷史內容與品牌辨識使用 Noto Sans TC；Service 01 年表問題改為 Noto Serif TC 20px Medium；四項品牌承諾標題改為 Noto Serif TC 30/40px。
- **品牌紀事輪播**：1978／1992／2016／2020 四段正式文案與圖片不改成自訂卡片內容；桌機維持四張完整並列，平板顯示兩張、手機提供可滑動的單列 scroll-snap 輪播，符合 PPT「參照官網輪播」標註。
- **Hover 換圖**：四項品牌承諾沿用 Service 01 的互動概念，預設顯示第 03 項「永久免費的安心健檢」，Hover、鍵盤 Focus 或觸控點擊任一欄時會同步切換正式背景圖、金色編號與該欄完整說明；不是只做文字位移。
- **品牌辨識放大與進度條**：逐字補上 PPT 指定的「櫻花整體廚房之廚具，除於門板張貼SAKURA KITCHEN之品牌銘板外，亦會於下列地方標示 SAKURA Logo」，並依問號標註把每張圖片的「＋」改成可操作按鈕；點擊後開啟原圖 Lightbox，支援上一張／下一張、鍵盤方向鍵及 Escape 關閉。輪播下方新增與實際可視比例、捲動位置同步的金色進度條，桌面版收回 1410px Antra 版心，一次完整顯示五張，手機仍可觸控橫滑。
- **手機內容安全**：`/about/introduce` 在 767px 以下隱藏固定快速服務列，避免遮住 Hero、年表、品牌承諾及圖片放大控制；桌機仍保留三個固定服務入口。
- **Design QA**：依專案只維護 README 的規則，本節取代額外的 `design-qa.md`。真值來源為 `/Users/eric/Downloads/2026.08.15_5.0品牌承諾_調整.pptx` 第 5 頁、3179×2245 標註頁及內嵌 3440×8790 長頁；長頁依 2× 密度正規化為 1720×4395，和 1720×1000 實作分別以 `/private/tmp/sakura-brand-ppt.IaJdHi/slide5-top-comparison.png`、`slide5-values-comparison.png`、`slide5-identity-comparison.png` 同畫面比對，最終結果 `passed`。五項必要表面均已複核：Noto Serif／Sans 字體與指定尺寸正確、1410px 版心與區段節奏一致、品牌金／灰白／深色遮罩沿用既有 token、正式圖片無模糊或錯誤、PPT 指定文案逐字呈現。1720px 實測四項承諾會同步切圖、Lightbox 前後切換正常、歷史四張完整並列、品牌辨識五張完整顯示；390×844 實測兩個輪播可橫滑、Lightbox 不超出畫面、快速列隱藏、`scrollWidth === clientWidth`。桌機與手機圖片錯誤、Reveal 隱藏、可見錯誤區塊、console error／warning 皆為 0。
- **建置**：`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過；production build 只有 Tailwind CSS v4 既有 sourcemap warning，沒有新增型別、SSR 或打包錯誤。

## Nuxt 3 — 1.1 品牌系列 AI Kitchen（2026-08-14）

`nuxt-site/pages/home-style/aikitchen.vue` 建立正式 SSR 路由 `/home-style/aikitchen`。本輪範圍只包含 AI Kitchen；其餘九個品牌系列保留於 Header Mega Menu 並以 `aria-disabled` 明確標示尚未開放，不建立假頁、假連結或不存在的品牌系列總覽。

- **PPT／Antra 結構**：以正式 `2026.08.14_1.0設計案例_櫻花整體廚房頁面開版.pptx` 第二頁為結構真值，逐段對照已購 Antra Home 09、Home 08、Gallery 01、Home 01 與 Home 03 原始 Elementor DOM／CSS；沒有使用簡報截圖當作頁面區塊。
- **Hero**：使用正式 AI Kitchen 01–03 圖；2026-08-28 依最新回饋將主標題還原為 `Find Your Inspired / Interior Design`，第二行使用品牌金色。桌機 Hero 文案套用與首頁相同的 70px 最小左側安全距離，只在 1025px 以上品牌系列抽屜存在時生效，因此收合把手不會蓋住標題，超寬畫面仍回到 1584px 版心。第一張載入與後續換圖皆沿用首頁／Page 1 的灰底或上一張終態／遮罩圖／原色圖結構，每 5 秒換圖、2 秒完成錯時由上而下揭露。遮罩與原色圖片同步執行完整 5 秒 Ken Burns 緩放大／向左運鏡，上一張在下一輪揭幕期間固定於運鏡終態，避免畫面縮回；同日補上與首頁相同的三張 Hero 原圖預載，讓 02／03 圖片在第一輪切換前完成下載並進入解碼流程，不再於揭幕開始後才載入而偶發卡頓；reduced-motion 時停在第一張並直接顯示原色圖片。Start Project CTA 維持標題下方的正常排版並於桌機右移 30px、手機右移 15px，移除斜箭頭；hover／鍵盤 focus 時文字交叉淡換為「設計靈感」，點擊前往 `/design-inspiration`。底部「品牌系列型錄」圓鈕依最新需求只保留文字與 hover 填色，移除右側斜箭頭。
- **正式文案與四套系**：使用官方 AI Kitchen 開場三段文案，以及 i Fun、i Chef、i Loft Chic、i Premium 的完整標題、說明與廚電配備。四套系不是一般 2×2 卡片，而是 PPT 指定的左右四影像窗與中央四項選單；桌面 Hover／Focus、手機點擊切換，影像與內容使用 Home 08 的 0.8 秒展開／淡入。套系說明中欄以 49px 上方距離對齊右欄第一筆廚電文字；i Fun 時三行說明會與 `R7352 近吸除油煙機－近吸隱藏系列（半隱藏）` 頂緣平行。
- **Gallery／廚電／案例**：六款門板 D0751、D0754、D0750、D0718、D0032、D0720 使用櫻花官網 340×340 獨立原圖；推薦廚電資料保留六款官方透明底原圖，但目前依最新回饋只固定渲染前五項，不輪播。Home 03 推薦案例使用 PPT 內嵌的三張原始高解析照片，只保留正式案例標題並連到櫻花官方案例頁，不保留模板假分類或英文假文案。
- **資料與導覽**：新增 `KitchenSeriesPageData`、`KitchenSuite`、`KitchenFinish`、`KitchenEquipment`、`KitchenCase` 型別與 AI Kitchen 唯一註冊資料。`KitchenStyle` 增加 `slug／route／available`，AI Kitchen 指向 `/home-style/aikitchen`，官方名稱「閤樂廚房」已校正；Header「品牌系列」只作 Mega Menu 觸發器並移除不成立的「查看全部」。
- **素材與錯誤**：11 張正式系列圖、6 張門板、6 張廚電與 3 張案例圖集中於 `public/section-1/brand-series/ai-kitchen/`。頁面圖片全部透過共用錯誤元件在原容器顯示名稱、路徑與完整載入錯誤，不留下破圖圖示。
- **QA**：`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過；production build 只保留 Tailwind CSS v4 既有 sourcemap warning。390／768／1024／1512／1920／2560／3840px 實測皆 `scrollWidth === clientWidth`，正式圖片載入失敗 0、前端錯誤區塊 0；斷點依序呈現 2／3／3／6／6／6／6 欄門板、1／2／2／3／3／3／3 欄案例，1410px 版心在超寬螢幕不再放大。1512px 已驗證 i Chef 切換會同步更新四個圖片窗、完整說明及廚電配備；390px 重新載入並捲至套系區後仍維持預設 i Fun，不會被觸控裝置的假 Hover 誤切換。Header 桌面 Mega Menu 與手機 Accordion 均只有 AI Kitchen 可進入，九個系列皆為 `aria-disabled`，不存在「查看全部」假連結。Hero 三層來源會在 5 秒後切換，遮罩層 1.333 秒、原色層 1.667 秒加 0.333 秒延遲，共同構成 2 秒轉場；影片 Dialog、關閉操作與所有 Reveal 均正常。正式路由回傳 HTTP 200，未知 `/home-style/not-created` 回傳 Nuxt 404。
- **Home 03 推薦案例校正**：初版誤把 `Recommended Cases` 與 `Take A Look At Our Latest Blog & Articles.` 套進置中標題共用元件，未還原 Home 03。現已改回原始 30／70 標題列：左側膠囊、金色圓點、水平／垂直裝飾線，右側 60/64px 大標並將 `Our Latest Blog` 標為模板金色。三案依 `post-style-3` 重製為 560px 舞台，第二個可見案例使用直式滿版圖片、底部漸層與白字覆蓋，左右案例維持 1.40625 圖片比例、20/30px 標題及三行官方中文摘要；PPT 標示刪除的假分類與模板英文摘要沒有加回。1024px 以下解除中央特殊卡，回復一致的 2／1 欄內容流。

## Nuxt 3 — 1.2 設計靈感列表頁（2026-08-14）

- **正式路由與來源**：新增 SSR 路由 `/design-inspiration`，以正式 `2026.08.14_1.0設計案例_櫻花整體廚房頁面開版.pptx` 第三頁與已購 Antra `Projects 01` 為唯一版型真值；沒有把 AI Kitchen 的 Home 09 或既有案例門市卡片挪來替代。因 `/gallery` 已屬 3.2 案例門市，1.2 使用獨立路由避免覆蓋，Header「設計案例 → 設計靈感」同步接上。
- **Projects 01 原生結構**：依 `dummy-data/content.xml` 的 Projects 01 Elementor 設定與 `inc/elementor/widgets/project.php`、`assets/css/base/elementor.css` 重建：Section 桌面 `100px 30px 130px`、1410px 版心、每頁 9 筆、3／2／1 欄、30px gap、圖片 `aspect-ratio:.833333`、24px 圓角、30/34px 標題、80px 玻璃 View 圓鈕、hover `scale(1.05)`／0.5 秒、40px 篩選下距及 41px 分頁上距。
- **篩選與狀態**：只實作 PPT 指定的「設計型式／設計風格」兩個下拉篩選，使用 AND 條件；Filter 按鈕沿用 Antra `btn-slip-effect` 的膠囊、金色圓形箭頭與旋轉 Hover。`form／style／page` 同步 URL query，支援重新整理、上一頁與無效 query 正規化；無結果時在前端顯示完整空狀態，不引入 PPT 未要求的家庭組成、預算或設計師篩選。
- **三筆正式案例**：首期依 PPT 顯示 case10 一字型／工業風、case56 一字型／北歐風、case35 中島／現代風，並連至既有 `/gallery/case10`、`case56`、`case35` 的 3.2.1 內頁。case35 詳細頁仍保留正式規格「L型＋中島」，列表僅以「中島」作篩選分類。三張列表圖直接取自 PPT 第三頁內嵌原始照片，整理於 `public/section-1/design-inspiration/`，圖片失敗由共用案例圖片元件在原容器完整顯示路徑與錯誤。
- **RWD、動畫與分頁**：桌面 3 欄、1023px 以下 2 欄、767px 以下 1 欄；Hero 沿用 Antra 內頁 Breadcrumb 的 360px／80px 標題系統。卡片使用 `opalMoveUp` 並將延遲限制於 240ms，reduced-motion 時立即顯示且停用圖片縮放。數字分頁是真實 9 筆分頁狀態，目前三筆只顯示有效的第 1 頁，不製造不存在的第 2 頁。
- **篩選回歸修正**：雙層篩選與瀏覽器返回會重新建立案例卡片；共用 `v-reveal` 已將 VNode class 正規化為空白分隔字串，避免動態節點產生 `design-project-card,ev` 逗號 class，同時讓 SSR／Client 維持相同的動畫 class、延遲與 `data-ev`，不改首頁既有效果。
- **本機 QA**：已在 390／768／1024／1512／1920／3840px 驗證 1／2／3 欄、5:6 圖片比例、1410px 最大版心與 `scrollWidth === clientWidth`；雙層篩選、URL query、瀏覽器返回、無結果重設、case10 內頁連結、圖片錯誤數及 Console 均通過。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 完成（使用 ignore lock 僅因本機 3002 開發伺服器正在執行）。
- **篩選列視覺校正**：保留 Projects 01 的 24px 標籤、58px Select、20px gap 與原生 Filter CTA，但解除兩個欄位固定 300px 造成的右側大片死白；桌面／平板改為等寬填滿 CTA 以外的版心，手機仍維持上下堆疊與滿寬選單。
- **Select 圓角校正**：Projects Widget 的局部 CSS 雖只指定白底與透明邊框，實際畫面會繼承 Antra 主題全域表單圓角；初版誤用 `border-radius:0` 覆蓋該效果，現已還原為 100px 膠囊 Select，與 PPT 提供的模板截圖一致。
- **版心置中校正**：共用 `internal-rail-safe` 原本把右側懸浮列所需的 86px 全部留在右側，使 1.2 篩選列與卡片視覺中心左偏 43px；本頁改為左右各 43px，在不縮減既有可用寬度、不碰懸浮列的前提下讓內容軸線回到 viewport 正中心。767px 以下懸浮列不占用內容空間，維持 0 安全內距。

## Nuxt 3 — 1.3 廚房裝修指南列表頁（2026-08-14）

- **正式路由與命名**：新增 SSR 路由 `/knowledge`，對齊 PPT 第四頁資訊來源所指向的櫻花官網正式列表路徑；Header「設計案例」內原本停用的「廚房小百科」依最新 PPT 名稱改為「廚房裝修指南」並接上新頁。4.x 三種文章內頁底部原本停用的「廚房裝修指南」分類 Tab 也同步啟用，不建立 `#` 或不存在的假路由。
- **PPT／Home 02 真值**：頁面使用既有 Antra 內頁 Breadcrumb Hero，顯示「廚房裝修指南」及「首頁 / 廚房裝修指南」。內容區逐項對照已購 Antra `Home 2` 的 `antra-post-grid` 原始 Elementor XML、`post-style-1`／`post-style-2` PHP 與 `elementor.css`：1083px 的 30／70 標題列、`Straight From The Newsroom` 膠囊、`Take A Look At Our Latest Blog & Articles.` 60/64px 大標、49／51.3 比例雙欄、60px gap、24px 圓角與圖片 Hover `scale(1.1)` 均保留。
- **最新文章重複邏輯**：依 PPT 截圖與 Home 02 原始兩個 Post Grid Widget，最新文章「廚房系統櫃材質」會同時出現在左側大卡及右側三篇列表第一筆；這不是資料重複錯誤。1024px 以下隱藏左側大卡並保留右側三篇，因此手機／平板不會漏掉最新文章。
- **三篇正式資料**：依 PPT 指定來源收錄「廚房系統櫃材質」、「廚房插座規劃」、「中島廚房餐桌」三篇，日期分別為 `2025-05-09`、`2024-10-08`、`2023-11-08`；摘要逐字使用各篇官網第一段，不自行補寫裝修宣稱。內頁尚未建立前，卡片沿用 Home 02 可點擊行為並進入 PPT 指定的既有櫻花官方文章，避免導向 404 假頁。
- **素材與錯誤介面**：三張正式主視覺取自甲方素材包並整理至 `public/section-1/kitchen-guide/`；4000px 系統櫃圖縮至 2400px、移除 metadata 並以 JPEG 86 品質輸出，視覺內容與比例不變。`InternalGuideImage` 會在原容器完整顯示「廚房裝修指南圖片載入失敗」、替代文字及素材路徑，不留下破圖圖示。
- **RWD／浮動列安全**：桌面內容最大 1410px 並維持視窗正中央，左右各保留 46px 對稱內距，1280px 實測文章右緣不與 74px 右側浮動列重疊；1366px 以下 gap 收斂為 30px、左圖高度 440px，1024px 以下改為單欄三篇，767px 以下圖片在上、內容在下。1280px 實測 `scrollWidth === clientWidth`、三篇列表與一張精選卡均存在、圖片錯誤 0；Reveal 捲入後均為 `is-visible`。
- **動畫與建置**：Breadcrumb、標題左右兩欄與文章兩欄使用既有 `opalMoveUp／Left／Right`，不把 Reveal 套在圖片本身；reduced-motion 由全站指令立即顯示內容並停用圖片縮放。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過；production build 只有 Tailwind CSS v4 既有 sourcemap warning，沒有新增型別、SSR 或打包錯誤。

## Nuxt 3 — 1.3.1 廚房裝修指南內頁（2026-08-14）

- 2026-08-26 依最新回饋調整 `/knowledge/design/systemcabinet` 麵包屑 Hero：桌機總高度由原始 185px 提高為 300px、手機由原始 150px 提高為 250px；Hero 以 60px 共用 Header 高度作第一列，麵包屑置中於 Header 下方的實際可見區域，不再只置中整個被導覽覆蓋的容器而產生視覺偏上。

- **正式路由與 PPT 結構**：新增 SSR 路由 `/knowledge/design/systemcabinet`，依正式開版 PPT 第五頁組合 Antra `Single Post 01` 的 185px Breadcrumb、文章 Meta／50px 標題，以及 `Projects Details` 的 930px 內容流、40/44px 章節標題、24px 圓角圖片與底部分類 Tab。列表頁「廚房系統櫃材質」的大卡和右側第一筆已改走站內路由，其餘兩篇未開版文章仍連正式官網，不建立假內頁。
- **日期判讀**：PPT 第五頁的母版縮圖仍殘留 `NOV 1, 2025`，但同份 PPT 第四頁與櫻花官網文章皆為 `2025-05-09`；頁面保留 Single Post 的日期幾何，內容採可驗證的 `MAY 9, 2025`，不把模板占位資料當正式文章資訊。
- **正式內文與語意表格**：文章逐段使用官網「廚房系統櫃材質重要嗎」、「五大板材比較」、「七步驟挑選」與三筆案例內容，資料拆為型別化重點、步驟、表格列與案例區塊，沒有使用 `v-html` 或整頁截圖。PPT 明確標示「表格區塊（官網不是圖片）」，因此五種板材以真正的 `table／thead／tbody／th` 重建；手機可鍵盤聚焦並水平滑動查看完整六欄內容。
- **圖片與錯誤**：主圖沿用列表正式素材；三張案例原圖整理至 `public/section-1/kitchen-guide/system-cabinet/`，全部保持自然比例、不以固定高度裁切。載入失敗時由 `InternalGuideImage` 在原位置顯示圖片用途、完整素材路徑與錯誤狀態。
- **分類與推薦**：內文末端依 PPT 保留優惠活動、最新消息、媒體影音、廚房裝修指南四個 Projects Details 膠囊 Tab；最下方使用 Antra Home 03 專案卡幾何顯示三個分類的第一篇正式文章，Embla track 不套 Reveal transform，保留拖曳、Hover 與鍵盤 Focus。
- **動畫／RWD／QA**：Meta／標題與段落群使用 `opalMoveUp`，主圖與三張案例圖只動畫純外層 `opalScaleUp`。1512×956 實測 Breadcrumb 185px、文章／首圖／內文皆為 930px 置中，首圖為 930×523px 自然 16:9；比較表為 6 欄 4 列、930px 完整顯示。390×844 實測內容欄 360px、頁面 `scrollWidth === clientWidth === 390`，表格只在自身 360px 容器內提供 900px 水平滑動並顯示操作提示，三張案例圖錯誤 0、四個分類 Tab 與三張推薦卡皆存在，捲到底後 Reveal 隱藏節點 0、Console error 0。`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 通過；production build 僅保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 1.3.2／1.3.3 廚房裝修指南內頁（2026-08-14）

- **正式路由**：依 PPT 第六、七頁新增 `/knowledge/design/kitchen-outlet-planning` 與 `/knowledge/design/knowledge31`，並將 `/knowledge` 列表剩餘兩篇卡片改為站內 NuxtLink；未知 slug 由 Nuxt 404 完整顯示，不建立其他不存在的裝修文章。
- **模板母版**：兩頁共用 Antra `Single Post 01` 的 185px Breadcrumb、單一「廚房裝修指南」分類膠囊、正式日期與 930px 文章欄；2026-08-28 依最新回饋將共用文章主標在桌機、平板與手機統一為 30/41px，因此 `/knowledge/design/kitchen-outlet-planning`、`/knowledge/design/knowledge31` 及同模板文章會一次同步，不再逐頁覆寫。內文依 `Projects Details` 使用 40/44px 章節標題、25/30px 子標、24px 圓角自然比例圖片、Projects Details 四分類 Tab，以及最下方三分類第一篇 Home 03 輪播。
- **第六頁內容**：逐段呈現官方廚房插座文章的規劃三步驟、安裝三注意事項、三筆正式案例與延伸閱讀；主圖與三張案例圖取自甲方素材包，案例標題保留官方 case50／case31／case48 連結。4,500px 原圖在不改比例下縮至 2,400px、JPEG 86 品質，避免文章頁載入 5.1MB 原檔。
- **第七頁內容**：逐段呈現中島廚房適用性、三項優點、餐桌三大設計重點與延伸閱讀；主圖、內文圖使用甲方正式素材。PPT 指定的 Home One 影片區使用官網可驗證的 YouTube ID `ervCQo-l2T4`，保留模板大字覆蓋、正圓水波播放鍵、載入中、12 秒逾時、完整錯誤原因及 YouTube 備援連結。
- **內容誠信**：兩頁的標題、日期、段落與連結皆由素材包及櫻花官網文章核對；PPT 中殘留的模板 `NOV 1, 2025` 未覆蓋正式 `OCT 8, 2024`／`NOV 8, 2023`。頁面不使用 `v-html` 或文章截圖，圖片失敗由 `InternalGuideImage` 在原位置顯示用途、完整路徑及錯誤狀態。
- **實機 QA**：1512×956 實測兩頁 Breadcrumb 為 185px、Meta／標題與內文皆使用 930px 置中欄，Reveal 完成後主圖寬 930px；390×844 內容欄為 360px、標題 30px，頁面皆 `scrollWidth === clientWidth`。完整捲動後圖片錯誤 0、Reveal 隱藏節點 0、四個分類 Tab 與三張推薦卡存在；`/knowledge` 已確認三篇卡片全部連到站內正式路由。第七頁播放鍵實測會建立 `youtube-nocookie.com/embed/ervCQo-l2T4` iframe。
- **建置**：`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過；production build 僅有 Tailwind CSS v4 既有 sourcemap warning，沒有新增型別、SSR 或打包錯誤。

## Nuxt 3 — 1.4 品牌系列型錄列表頁（2026-08-14）

- **正式路由與範圍**：新增 SSR 路由 `/catalogues/kitchenware-catalog`，Header「設計案例 → 品牌系列型錄」同步啟用。PPT 第八頁右側參考畫面雖帶有 MUJI Basic+ 與 Clever，但左側網站架構紅框明確指定 `x6項`；本頁只上線 iPremium、Joyful、Premium、Harmony、Loft Chic、Elegant 六項，不把示意資料誤納入正式範圍。
- **Projects 01 模板**：依已購 Antra `Projects 01` 原始 Elementor 設定重建 100／130px Section 間距、1410px 版心、3／2／1 欄、30px 欄距、24px 圓角、5:6 圖片舞台、30/34px 標題及 0.5 秒圖片 Hover。PPT 標示「刪除」的篩選列與沒有實際資料需求的分頁均不渲染；中央 View 圓鈕依 PPT「右側加箭頭」改成右下玻璃圓形箭頭，鍵盤 Focus 與觸控手機同樣可辨識。
- **正式資料與下載**：六張封面取自甲方 1.4 素材包並整理至 `public/section-1/catalogues/`；標題、描述與 PDF 下載網址逐筆核對 PPT 指定的甲方公開型錄 API。卡片直接另頁開啟正式 PDF，不建立假的 1.4.1 文章內頁；圖片錯誤時在原卡片完整顯示型錄名稱、素材路徑與錯誤原因。
- **RWD／QA**：1512px 實測為三欄、768px 為兩欄、390px 為單欄；六張正式封面全部載入、Reveal 完成後隱藏節點 0、`scrollWidth === clientWidth`，頁面不存在 PPT 指定刪除的篩選列與假分頁。手機六個右下箭頭保持可見，桌面則由 Hover／Focus 顯示；Header 桌面與手機導覽皆存在正式站內入口。
- **建置**：`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 均通過；production build 僅有 Tailwind CSS v4 既有 sourcemap warning，沒有新增型別、SSR 或打包錯誤。

## Nuxt 3 — 6.1 我要加盟 Landing Page（2026-08-22）

- **PPT 第 3 頁文案校正（2026-08-24）**：依最新稿第 3 頁右側提案，不改 Home 05／01／07／04 的既有模板結構，只更新可選取 HTML 文案。Hero 小標改為「我要加盟」，三個內容主標改為「店經理的創業故事／加盟創業首選品牌／強大廣告行銷」；Hero 的 73%、700 萬戶、36 年說明移除非來源空格，兩位店經理依簡報順序改為謝立宸 14 年、劉芳玲 2 年，並逐字補回完整創業故事。六大優勢摘要逐項依簡報原文補齊自有工廠、家庭研究、永久服務、商圈機制、全台支援與廚藝大學內容，不再使用前版縮寫。390px 初驗發現浮動快捷列已隱藏但舊安全欄仍壓縮主標，造成「店經理的創業故事」末字孤行；現已於 767px 以下解除本頁多餘安全欄，三組中文主標恢復完整內容寬度。
- **第 3 頁 Design QA（2026-08-24）**：將 PPT 第 3 頁完整標註與 1440×1000 實作的故事、優勢、行銷三段放入同一張 `/private/tmp/franchise-slide3-copy-design-qa.png` 核對；390×844 另逐段驗證中文主標、內容寬度與手機安全欄。桌機與手機皆無水平溢位或失效圖片，唯一 `h1` 保留英文模板標題；Hero 申請 CTA 為 `/franchising/form`、`target="_blank"` 且含 `rel="noopener"`。初驗唯一 P2 為手機主標孤字，修正後三組標題均維持單行，沒有剩餘 P0／P1／P2 差異，最終結果：`passed`。
- **最新 PPT 真值與 Hero**：SSR 路由 `/franchising/intro` 改以 `2026.08.19_6.0合作專區_調整.pptx` 第 2 頁為唯一主規格，只採用該頁明確引用的第 3 頁加盟內容，覆蓋 8 月 14 日舊版。Hero 維持 Antra Home 05、從 `y=0` 開始且高度包含 60px Header；pill 依第 3 頁文案更新為「我要加盟」，英文大標保留 `Find Your Inspired / Interior Design`，右欄以 Noto Sans TC 16／15px 呈現 73%、700 萬戶、36 年品牌內容。申請 CTA 以新分頁開啟站內 `/franchising/form` 並含 `rel="noopener"`。
- **加盟故事與正式素材**：保留 Home 05 30／70 標題軌、YouTube `sAuAjtpvZYk` 與兩位店經理訪談，標籤更新為 `Our Partners`。原本把文案壓成圖片的 `story-strip.png` 已停止渲染，改用甲方 `marquee-1.webp`、`marquee-2.webp` 建立雙排反向循環；Hover、鍵盤焦點暫停，reduced-motion 停止移動。圖片及影片失敗時仍在原位置完整顯示檔案路徑、原因與備援操作。
- **六大優勢與行銷案例**：依 PPT 第二頁的「一個螢幕頁面」要求，把六張優勢卡重組為 `01／02／03` 三個 `100vh` 桌機畫面狀態；每次顯示兩張，左側 30% 標題與大型序號固定，右側下一組由下方進入並更新序號，不再把六張做成普通錯落長列表。1024px 以下解除 sticky 並自然單欄排列。`FranchiseAdvantage` 仍使用 `features[]` 逐項載入甲方 `Global_Icon_Asset_01–20.svg` 與可選取 HTML 文字；優勢徽章及 icon 說明明確使用 `--font-cjk-sans`，瀏覽器 computed style 為 Noto Sans TC 15px。品牌行銷維持 Home 01 五筆正式素材、3／2／1 張 scroll-snap，無可見箭頭、可觸控拖曳及鍵盤左右瀏覽。
- **CTA、流程與資格**：區塊順序依 PPT 修正為「六大優勢 → Home 07 深色圖片 CTA → 品牌行銷案例」，CTA 使用既有 Antra 深色室內素材與上淺下深遮罩，文案逐字改回簡報指定內容，並保留分層進場、金色雷達水波、箭頭旋轉與 Hover 填色。原 `franchise-overview.png` 已停止渲染；流程區維持三張桌機原生 sticky 覆蓋卡，使用甲方七步流程 SVG、PPT 完整四段高額補助／加盟補助金／業績獎金／教育訓練文字與四項資格 SVG，1024px 以下自然堆疊且不搶奪頁面捲動。
- **FAQ、動畫與可用性**：FAQ 已依後續 Home 04 原始碼回查結果，改為上方 30／70 標題軌、下方 71% Accordion／29% 加盟資料卡；`Franchise FAQs` 使用 Noto Sans TC，四題原生 Accordion 問題為 Noto Serif TC SemiBold 20px、答案為 Noto Sans TC 15px，並保留鍵盤操作與清楚焦點。跑馬燈、品牌案例軌與 FAQ button 均有金色鍵盤焦點；小標、主標、內文、圖片、卡片與 CTA 分別使用既有 `opalMove*／opalScaleUp`，reduced-motion 會停用跑馬燈、sticky 覆蓋、序號轉場、水波與自動進場，但內容立即可見。
- **手機 CTA 安全區**：390px 實機尺寸檢查發現右側快速服務列會覆蓋 Home 07 文案與申請按鈕，因此 `/franchising/intro` 在 767px 以下沿用表單頁既有的隱藏規則；桌機快速服務列保持原位置與功能，CTA、案例與 FAQ 皆無水平溢位或操作遮擋。
- **招商訊息截圖逐項修正（2026-08-22）**：補上前次驗收漏掉的頁尾招商訊息區塊。小標由「招商訊息」改為 `Franchise Information` 並明確使用 Noto Sans TC；三篇新聞標題由 Cal Sans 25px 改為 Noto Serif TC SemiBold 20／30px。底部「查看更多」改用 PPT 指定的 60px 外框膠囊、Noto Sans TC 15px 與 box-sizing 鎖定 40×40px 的金色圓形箭頭，保留進場、水波、箭頭旋轉及 Hover 金底狀態。
- **加盟流程／Home 04 FAQ 原模板回復（2026-08-22）**：依 PPT 第 2 頁的放大標註撤除自創的英文大標、三張深色 sticky 卡。加盟流程改回單一 Noto Serif TC SemiBold 25／35px 中文標題、甲方 1410×251 七步流程 SVG，以及同畫面左右並排的深色補助／白色資格內容；所有文字維持可選取 HTML，背景使用原始線稿素材而非把 `franchise-overview.png` 當網頁。補助圖文區本身的 CTA 已依標註改成無箭頭「我要加盟」，保留進場並增加金色呼吸動畫；手機同步移除多餘右側安全距離，避免大型圖文區被壓窄。FAQ 再依 `home-4.xml` 的 `83319f9` 原始結構完整重建：上方 `Franchise FAQs` 十字線標題軌與 `Quick And Clear Answers To Your Key Questions`，下方左側 71% 四題 Accordion、右側 29% 加盟資料卡；正式直式「櫻花加盟總部優勢」圖取自最新 PPT `image30.png`，整理為 `public/section-6/franchise/franchise-benefits-sheet.png`，圖片與標題皆連至 `/franchising/download`，不再使用門市照片圓形 CTA 代替 Home 04 資訊卡。
- **Home 04 FAQ Design QA**：來源為最新 PPT 內 548×416px 的 `image29.png` Home 04 區塊與第 2 頁標註；實作以 1512px CSS viewport、1× density 擷取完整區段，正規化為 548×416px 後合併比對。第一次比較的 P1 為內容欄左右反置、英文模板主標缺失、資訊卡錯用門市照片與圓形 CTA；修正後 30／70 標題軌、71／29 內容比例、Accordion 線條／編號／展開狀態及右側資料卡均與模板對齊。字體、間距、`#f6f6f6／#caa05c` 色彩、PPT 正式圖片清晰度與中文文案五項皆通過；直式圖片因使用正式原比例而不裁切，屬預期差異。桌機 1512px 與手機 390px 皆為水平溢位 0、圖片錯誤 0，第二題展開後僅一個 panel 開啟，兩個資料下載連結皆指向 `/franchising/download`。比對圖：`/Users/eric/.codex/visualizations/2026/08/14/019fffeb-5d3d-7d91-b40f-009022fb2247/franchise-faq-home4-design-qa.png`；最終結果：`passed`。
- **Home 05 Hero 原始碼對位修正（2026-08-22）**：重新逐項核對 `home-5.xml` 的 `15c08dc／d0e8b28／1152f28／ca5e90b／fc05b4c／3e2e9a1`。英文主標移除人工 `<br>`，改由模板 64% 欄寬自然換行；桌機右欄不再沿用只適合原始單段英文的固定 `margin-top: 89px`，改以 Grid 底緣讓 CTA 與 `Interior Design` 行盒底部動態對齊。Hero CTA 另依 Antra `elementor-button-default` 還原 60px 高、`9 / 9 / 9 / 30px` 內距、15px 字級、40px 金色圓形箭頭與 `-45deg` 初始角度；Laptop／Tablet Extra／Tablet／Mobile Extra／Mobile 標題同步回到原始 90／60／42／36／30px 響應式字級，不讓新增的中文加盟內容破壞模板基線。

## Nuxt 3 — 6.1.1 加盟資料下載（2026-08-23）

- **最新 PPT 第四頁為規格真值**：`/franchising/download` 只依 `2026.08.19_6.0合作專區_調整.pptx` 第 4 頁調整；第 3 頁的 6.1.2 表單本次完全不動。桌機 Hero 總高依內頁參考稿回到 450px 並已包含 60px 主導覽，內容從導覽下方 88px 開始；小標改為實際 Noto Sans TC、主標改為 Noto Serif TC SemiBold、麵包屑改為 Noto Sans TC 15px。6.1 Landing Page 的三個資料下載入口均加上 `target="_blank"` 與 `rel="noopener"`，依標註另開分頁。
- **內容字級與刪除項目**：主標「櫻花整體廚房加盟簡介」使用 Noto Serif TC SemiBold；說明、兩個 PDF 操作與資料欄均使用 Noto Sans TC，資料欄統一 14px。依紅框刪除 `Official Brochure` 膠囊及兩張預覽右側的「封面與外頁／品牌優勢與加盟辦法」頁名，保留左側 `PAGE 01／02` 與兩張正式 PDF 預覽，不把整頁截圖當網站內容。
- **CTA、動畫與錯誤狀態**：底部「返回我要加盟」改為簡報指定的 60px 外框膠囊、Noto Sans TC 15px、40px 金色圓形箭頭、`-45deg` 初始角度、Hover 填金與雷達水波；Hero 小標／主標／麵包屑、內容主標／說明／資料列／PDF 操作與返回 CTA 均分層使用既有 `opalMove*／opalScaleUp`，reduced-motion 下停止轉場與水波。PDF HEAD 檢查、完整 HTTP 錯誤、素材路徑與重新檢查操作維持不變；767px 以下隱藏右側快速服務列，避免覆蓋 PDF 操作與頁面 CTA。
- **Design QA（2026-08-23）**：因專案只允許一份 Markdown，本段取代 Product Design 預設的 `design-qa.md`。來源為最新 PPT 第 4 頁內嵌 2880×6350px `image50.png` 與其紅框標註，桌機實作以 1512×980 CSS viewport、1× density 擷取，來源等比縮至 1512px 後分成頁首與頁尾兩組同畫面比對；證據為 `/Users/eric/.codex/visualizations/2026/08/14/019fffeb-5d3d-7d91-b40f-009022fb2247/franchise-download-slide4-qa-top.png`、`franchise-download-slide4-qa-bottom.png` 與 390×844 的 `franchise-download-slide4-mobile-top.png`。第一次比較的 P1 為 Hero 僅 360px、內容相對參考稿上移，P2 為手機快速服務列遮住 PDF 按鈕；修正後 Hero 為 450px 且內容 y 軸與來源對齊，手機快捷列隱藏。Noto Serif／Sans 字體、30／70 內容節奏、黑／金／淺灰色票、兩張正式 WebP 清晰度、PDF 文案與刪除項均已核對；1512px／390px 水平溢位、圖片錯誤、Vite overlay、console error／warning 與 Reveal 隱藏節點皆為 0，最終結果：`passed`。

## Nuxt 3 — 6.1.2 加盟申請表單（2026-08-23）

- **最新 PPT 第五頁調整（2026-08-23）**：`/franchising/form` 改以 `2026.08.19_6.0合作專區_調整.pptx` 第 5 頁為最新規格，並只讀取該頁明確指定的第 6 頁表單排列。依紅框完整刪除 Header 下方的黑色加盟區塊導覽，維持本頁為獨立 SSR 路由；申請頁主標改為明確的 Noto Serif TC SemiBold，說明、資料下載 CTA、表單標籤與輸入控制統一為 Noto Sans TC，CTA 與欄位指定 15px。頁首小標、主標、說明及下載 CTA 分層使用 `opalMoveUp／opalScaleUp`；NuxtLink CTA 使用可觀察的外層 Reveal wrapper，避免連結 Hydration 後停在 `visibility:hidden`。確認送出 CTA 另加獨立進場、金色雷達水波、箭頭旋轉與 Hover 填色，reduced-motion 下停止水波及轉場但內容立即可見。正式後台未設定時的完整 `ConfigurationError`、不傳送／不儲存個資說明及官方表單備援保持不變。
- **PPT 第六頁母版與流程（2026-08-23）**：第 6 頁不是另一個新網址，而是 6.1.2 的開版來源與流程補充。頁面沿用 Blog > Single Post 02 的 930px 內容骨架、淺灰頁面／白色表單區塊、分層頁面動畫及甲方預約表單欄位；首頁共用 Header 的「我要加盟」選單已包含加盟介紹、加盟優勢、加盟金與流程、加盟 Q&A 四個 6.1 錨點。第 5 頁明確標註刪除的黑色次導覽優先於第 6 頁流程示意，因此不重新加回；Single Post 02 原 Hero／麵包屑也不渲染。第 6 頁指定的案例門市照片已核對為 `public/section-6/franchise/hero-store.jpg`，與 PPT 內嵌 `image44.jpg` SHA-1 完全一致，保留作正式分享預覽圖，不把已刪除 Hero 重新塞回可見版面。依「此頁另開分頁」標註，6.1 Landing Page 的三個表單 CTA 均以新分頁開啟 `/franchising/form`；表單頁的加盟資料下載也以新分頁開啟 `/franchising/download`，避免使用者填到一半離開表單。
- **正式路由與 PPT 真值**：SSR 路由維持 `/franchising/form`；最初依 `2026.08.14_6.0合作專區_櫻花整體廚房頁面開版.pptx` 建立 Single Post 02 表單骨架，現由 2026-08-19 最新稿第 5 頁覆蓋導覽與字體規格。頁首只保留首頁共用 Header，舊版黑色加盟次導覽及 Single Post 02 頂部 Hero 圖皆不渲染。
- **Single Post 02 表單骨架**：內容使用 930px `single-content` 版心、置中標題、前三欄並排輸入、圓角 58px 欄位、完整寬度加盟意向區與 Antra 膠囊送出鈕；不是把舊官網截圖貼進頁面。欄位逐項核對甲方現行 `/franchising/form`：姓名、Email、電話、加盟經驗、四級創業預算、開店地區、五級創業時間及個資同意，共八項必填。
- **驗證與資料安全**：姓名、Email、電話、Radio、Select、地區與個資同意皆有前端驗證、`aria-invalid`、明確錯誤與首個錯誤自動聚焦；不使用 localStorage、Session Storage 或資料庫。`NUXT_PUBLIC_FRANCHISE_APPLICATION_ENDPOINT` 未設定時，送出會完整顯示設定錯誤，明確告知資料未傳送、未儲存並提供甲方現行官方申請表；設定正式端點後才會 POST，並具送出中、成功及包含 HTTP 狀態／端點的完整失敗狀態。所有技術錯誤直接展開顯示，不藏在摺疊區塊；未取得正式 site key 前不偽造 reCAPTCHA。
- **導覽串接**：Header「我要加盟」新增「加盟申請表」，6.1 Landing Page 三個申請 CTA 全部改走站內 `/franchising/form`；6.1.1 與表單頁互相可達。現行甲方外部表單只作後台尚未串接時的明確備援，不再作為站內主要 CTA。
- **手機表單安全區**：390px 實測發現全站右側快捷列會遮住表單選項與送出狀態，因此只在 `/franchising/form` 的 767px 以下隱藏快捷列；桌面版與其他頁維持原有三顆浮動按鈕，不改共用樣式與行為。
- **最新 Design QA（2026-08-23）**：依專案只允許一份 Markdown 的規則，本段取代 Product Design 預設的 `design-qa.md`。來源真值為最新 PPT 第 5 頁內嵌的 2880×4943px `image51.png`；先依標註移除來源 y=120–249 的黑色加盟導覽，再以 1× density 正規化為 1440×2407px，和 1440×980 實作在 `scrollY=0／700` 的同區域比較，證據為 `/Users/eric/.codex/visualizations/2026/08/14/019fffeb-5d3d-7d91-b40f-009022fb2247/franchise-form-slide5-qa-top.png`、`franchise-form-slide5-qa-form.png`，手機證據為 `franchise-form-slide5-mobile-top.png`、`franchise-form-slide5-mobile-submit.png`。首輪瀏覽器檢查發現下載 CTA 直接掛 Reveal 後仍停在 `visibility:hidden`（P1，核心入口不可見），改由外層 wrapper 接管 Reveal 後，修正版 CTA、表單與送出鈕皆正常顯示。主標／卡片標題 Noto Serif TC SemiBold、說明／下載 CTA／欄位與送出鈕 Noto Sans TC 15px、930px 表單骨架、淺灰背景、圓角欄位與金色 CTA 均已核對；1440px／390px 水平溢位、圖片錯誤、Nuxt 錯誤覆蓋層與 Reveal 隱藏節點皆為 0，空白送出顯示 8 項錯誤並聚焦姓名，最終結果：`passed`。
- **PPT 第六頁 Design QA（2026-08-23）**：來源視覺由第 5 頁最終長頁 `image51.png` 與第 6 頁的 Single Post 02 `image52.png`、正式案例門市 `image44.jpg` 及紅線流程共同構成；第 6 頁屬結構來源，不把整張提案投影片當網站截圖。實作以 1440×980 CSS viewport、DPR 1、動畫完成狀態擷取，和 1440×980 正規化來源同畫面比較於 `/Users/eric/.codex/visualizations/2026/08/14/019fffeb-5d3d-7d91-b40f-009022fb2247/franchise-form-slide6-design-qa.png`；表單欄位的聚焦比較沿用 `franchise-form-slide5-qa-form.png`，390×844 手機證據為 `franchise-form-slide6-mobile.png`。首輪互動檢查的 P2 為 6.1 Landing Page 只有 Hero CTA 另開分頁，其餘兩個 CTA 與表單內下載會帶離目前頁面；補齊 `target="_blank"／rel="noopener"` 後，三個申請入口與資料下載皆符合第 6 頁「此頁另開分頁」，且保留填寫狀態。最終比較確認 Header 採最新版首頁白色 Logo（PPT 舊截圖藍色 Logo 為已被新版首頁覆蓋的可接受差異）、主標／卡片標題的 Noto Serif TC SemiBold、說明／欄位的 Noto Sans TC、930px 表單寬度、圓角與陰影、`#f6f6f6`／白／金色票、線稿背景清晰度及全部正式文案；1440px／390px 水平溢位與圖片錯誤皆為 0，手機快速服務列正確隱藏，無剩餘可執行的 P0／P1／P2，最終結果：`passed`。
- **Design QA（2026-08-15）**：將 PPT 指定的 Antra Single Post 02、甲方現行表單截圖與 production preview 放入同一張比較板檢查。1280×720 與 390×844 實測皆 `scrollWidth === clientWidth`、單一 `h1`、Reveal 隱藏節點 0；桌面保留快捷列，手機快捷列為 `display:none` 且 360px 表單卡完整可用。空白送出顯示 8 項必填錯誤並聚焦姓名；完整假資料送出顯示可見的 `ConfigurationError`，沒有傳送個資。正式路由回應 HTTP 200、Console error 0、`pnpm --dir nuxt-site typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 均通過，build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 6.2 建商專區／6.2-S1 預約表單（2026-08-15）

- **正式路由與範圍**：新增 SSR 路由 `/builders`，依 `2026.08.14_6.0合作專區_櫻花整體廚房頁面開版.pptx` 第 5 頁實作完整 6.2 建商專區 Landing Page；6.2-S1 是頁面最下方 `#appointment` 預約 Section，而不是脫離內容脈絡的獨立空白表單頁。Header「建商專區」從 `#` 改接正式路由，Hero「專人聯繫」直接捲到表單。
- **PPT／Antra 骨架**：Hero 與大圖依 Antra Home 05，團隊四欄依 Home 07，合作 Logo 區依 Home 01，預約區依 Contact Us；保留 `Find Your Inspired / Interior Design`、`Have A Project In Mind? Let’s Make It Happen`、1410／1770px 版心、Cal Sans、品牌金色及既有 Header／Footer。團隊區使用官方 Antra Home 07 四張人物原圖，但所有姓名與職稱均顯示 `Coming Soon`，避免把模板假資料冒充櫻花人員。
- **正式建商內容與素材**：Hero、聯絡區廚房圖、SAKURA KITCHEN Logo 與九組合作建設 Logo 直接取自 PPT 內嵌原始檔，整理於 `public/section-6/builders/`；畫面以真實 HTML 呈現 45 萬+ 設計模組、AI 智能工廠、管理平台、HOME in O.N.E.、專業銷講／監工／驗收與一鍵登錄終身服務，不把舊官網整頁截圖貼進前端。所有圖片載入失敗時會在原容器顯示用途、完整素材路徑與錯誤。
- **6.2-S1 欄位與資料安全**：表單依 PPT 為聯絡人、聯絡電話、建設公司、電子信箱與備註；前三項必填，Email 留白允許、填寫時驗證格式。空白送出會顯示逐欄錯誤並聚焦第一欄；`NUXT_PUBLIC_BUILDER_APPOINTMENT_ENDPOINT` 未設定時完整顯示 `ConfigurationError`，明確保證資料沒有傳送或儲存。設定正式端點後才 POST，並保留送出中、成功及包含 HTTP 狀態／端點的完整失敗訊息；沒有 localStorage、Session Storage、假 reCAPTCHA 或假成功。
- **RWD 與浮動列**：桌面為四人／三能力／五 Logo 欄，平板依序折為 2／3／3 欄，手機為 1／1／2 欄；Hero 與 Contact 改單欄，所有重要表單控制項保持滿寬。767px 以下在 `/builders` 隱藏右側快捷列並解除桌面用的 86px `internal-rail-safe`，避免快捷列已消失後內容仍被錯誤壓窄；其他頁及桌面行為不變。
- **Design QA（2026-08-15）**：PPT 第 5 頁最終提案、1280×720 Hero／Contact production preview 已合併比較；頁面 Section 順序、深淺背景節奏、Antra 大標與素材用途一致。桌機與 390×844 手機皆 `scrollWidth === clientWidth`、單一 `h1`、圖片錯誤 0、Console error 0；Hero CTA 點擊後 `#appointment` 精準停在 60px Header 下。手機快捷列為 `display:none`，內容安全內距已解除，團隊卡／Logo／表單寬度分別 330／164.5／330px。空白送出顯示 3 個必填錯誤並聚焦聯絡人；完整假資料送出顯示可見的 `NUXT_PUBLIC_BUILDER_APPOINTMENT_ENDPOINT` 設定錯誤，沒有傳送個資。九個正式建商 Logo 全部載入，`pnpm --dir nuxt-site typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 均通過；build 僅保留 Tailwind CSS v4 既有 sourcemap warning。
- **6.2-S1 預約表單（2026-08-23／新版 PPT 第 7 頁）**：`/builders#appointment` 保留 Antra Contact Us 原始雙欄比例與英文模板主標，依標註把 `GET IN TOUCH`、左側說明、地址／營業時間、館別切換與全部表單欄位統一為 Noto Sans TC；「櫻花集團 品牌館／全預約制」及「預約專人聯繫」改為 Noto Serif TC SemiBold，並刪除表單標題下方 PPT 指定移除的重複說明。台北／台中／高雄改為可操作的 16px Tab，點選與鍵盤左右鍵會同步更換正式品牌館照片、地址及營業時間；照片直接沿用 `5.2 集團品牌館` 已整理的三館正式素材，不再把舊版廚房局部圖當成品牌館照片。既有必填驗證、第一錯誤聚焦、未設定端點與完整送出錯誤仍完整保留在前端。
- **6.2-S1 Design QA（2026-08-23）**：PPT 第 7 頁標註區與 1440×1000、DPR 1 的瀏覽器實作已合併為 `/private/tmp/builders-appointment-design-qa.png` 比對；桌機維持模板 42／58 雙欄、標題／卡片／影像比例與淺灰建築線稿背景，手機 390×844 改為自然單欄且 `scrollWidth === innerWidth`。字體 computed style 已確認兩個中文主標為 Noto Serif TC 600、館別 Tab 為 Noto Sans TC 16px、說明及表單欄位為 Noto Sans TC；三館切換均同步更新正式照片與資料，鍵盤右鍵可由台北移至台中。圖片載入、Reveal 終態、空白送出三項錯誤與聯絡人聚焦皆通過，未保留 P0／P1／P2 視覺差異，最終結果為 `passed`。
- **6.2 建商專區整頁（2026-08-23／新版 PPT 第 8 頁）**：第 8 頁是 `/builders` 全頁規格，不是另一個 6.2.1 頁面；以投影片內嵌 Antra 長頁及 Home 05／07／01、Project Detail、Contact Us 標註為模板來源。Hero 改用甲方 `6-1developers-01banner.jpg` 正式圖，保留模板英文大標並讓「專人聯繫」直達本頁預約 Section；CTA 使用全站 60px 膠囊、40px 金色圓箭頭、雷達水波、箭頭旋轉與 Hover 填色。
- **Home 07／能力／iCare／Home 01**：團隊四欄首張改為正式 SAKURA KITCHEN 專案卡、Logo 與 `/builders/sakura-kitchen` 入口，其餘三張依簡報維持 `Coming Soon`，不虛構人員資料。45 萬+ 設計模組、AI 智能工廠、管理平台與銷講／監工／驗收保留為可選取 HTML；「一鍵登錄 終身服務」改用甲方 `6-1developers-icare.png` 原圖，不再以自創深色資訊卡代替。九組正式合作建商 Logo 依 Home 01 改為雙排反向循環，Hover 暫停，reduced-motion 下改靜態 Grid，語意清單仍可被輔助技術讀取。
- **PPT 第 8 頁 Design QA／建置**：依專案只保留 README 的規則，本段取代額外的 `design-qa.md`。PPT 內嵌 505×2474px Antra 長頁與六個 1440×1000 實作 viewport 已放進同一張 `/private/tmp/builders-slide8-design-qa.png` 比對；模板留白區依投影片紅線補入正式建商內容，而不是自行填入 Antra 假資料。桌機 1440px 與手機 390px 皆無水平溢位、破圖、Nuxt 錯誤或未完成 Reveal；Hero CTA 正確落到 `#appointment`，空白送出顯示三個必填錯誤並聚焦聯絡人。手機 QA 發現的 iCare 主標末字孤行（P2）已改為完整「終身服務」詞組換行；Logo 輪播取得鍵盤焦點時會暫停。`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只有既有的 Tailwind CSS v4 sourcemap warning，最終結果：`passed`。
- **預約 CTA 一致性修正（2026-08-15）**：6.2-S1「立即預約」移除獨有的黑底、18px gap、黑色箭頭與向上位移 Hover，改用全站內容型 CTA 真值：60px 高、`30 / 9 / 9px` 內距、灰色 64% 細框、15/22px 字級、40px 金色圓箭頭、初始 `-45deg` 與既有 2 秒雷達水波；Hover／鍵盤 Focus 後整顆填金、文字反白且箭頭轉正。手機維持內容寬度，不再把按鈕拉成滿欄。

## Nuxt 3 — 3.2.1 案例門市內頁（2026-08-18）

- **PPT 第四頁真值**：`/gallery/case10` 依門市與服務調整稿第 4 頁重整；Breadcrumb Hero 改用 PPT 指定的案例門市店面底圖並補上「首頁 / 案例門市 / 門市案例」，內頁主標固定 Noto Serif TC 38/50px，規格、門市、內文與各級標題改回簡報標示的 Noto Serif TC／Noto Sans TC 層級。
- **文章與評論**：只移除 case10 中 PPT 紅框指定的兩個文章圖片區塊，首頁輪播和其餘正式文章圖仍保留。原本不在需求內的空評論狀態與留言表單不再渲染，改為逐字呈現簡報指定的三則顧客評論；沒有送出、儲存或假後台行為。
- **模板段落與互動**：前後篇標籤恢復 `Previous Post / Next Post`；底部 30／70 標題列恢復 Home 03 原始英文，案例卡標題限制兩行、摘要限制三行，金色預約標籤改白字並在有正式 LINE 時優先跳轉 LINE。相關案例改為 Embla track，轉場時間縮至 18，桌機／平板／手機維持 3／2／1 張的模板比例。右側規格／門市欄跨越完整文章 Grid，桌機可在 96px 頂距內 Sticky；桌面版心左右各保留 43px 快捷列安全距離，767px 以下案例內頁隱藏快捷列並解除安全內距，避免內容被固定按鈕遮住。
- **Design QA／建置**：已將 PPT 第 4 頁標註區、原始 case10 長頁與 1512px 實作的頁首、文章、評論、推薦案例四個 viewport 合併比對；來源為 `/Users/eric/Downloads/2026.08.14_3.0門市與服務、4.0優惠消息 _調整.pptx` 第 4 頁，實作證據為 `/private/tmp/case10-qa-*.png`，比較板為 `/private/tmp/case10-design-qa-comparison-v2.png`，最終結果 `passed`。1512×980 實測 Sidebar 在 500px／1300px 捲動位置皆固定於 96px、圖片輪播可由第 1 張切到第 2 張、前後篇為 `case35 / case56`、LINE CTA 為安康店正式連結、3 則評論、2 個保留文章圖組、3 張相關案例、圖片錯誤 0、完整捲動後 Reveal 隱藏 0／19、`scrollWidth === innerWidth`；390×844 實測內容寬 360px、快捷列隱藏、頁面無水平溢位。`pnpm --dir nuxt-site typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 均通過，production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 3.2.2 老宅廚房案例內頁（2026-08-18）

- **PPT 第五頁真值**：`/gallery/case56` 沿用 3.2.1 已核准的 Antra 案例內頁結構，不建立另一套相近版型；標題維持 Noto Serif TC 38/50px，並把 1025–1200px 原本錯回 42px 的規則同步校正。Breadcrumb 依入口判斷：案例門市維持「首頁 / 案例門市 / 門市案例」，設計靈感卡改帶 `from=inspiration`，顯示「首頁 / 設計靈感 / 門市案例」，canonical 仍維持無 query 的正式案例網址；前後篇與更多案例連結也會保留同一來源，避免進下一篇後麵包屑無故跳回案例門市。
- **承德店正式資料**：案例規格依簡報補齊北歐風、單色系（非白色）、其他、一字型、400CM以上、2-4坪、35萬以上、櫻花石、陳冠瑋共 9 項，移除不在新版規格表的「家的組成」。門市資訊改為週一至週六 10:30–21:00、`02- 2883 9919`、士林區後港里完整地址；到店預約與 LINE 諮詢都使用 PPT 指定的承德店 `https://lin.ee/50meLfG`。
- **文章刪減與評論**：保留首段兩張正式案例圖及主輪播；依五個紅框移除後續「格局動線、門板、中島、抽屜、廚電」圖片區塊，並刪除 PPT 單獨標示的廚房電器型號段落，產品延伸連結仍保留。顧客評論依簡報逐字放入 3 則相同內容，留言表單不渲染；此評論提到「紀先生」但本案設計師為「陳冠瑋」，屬來源簡報本身的內容不一致，前端先照稿呈現，正式上線前應由內容端確認。
- **Design QA／建置**：因專案規則禁止新增第二份 `.md`，本節取代 Product Design 預設的 `design-qa.md`。已把 PPT 第 5 頁、內嵌 `image19.png` 長頁與實作畫面合併比對，證據為 `/private/tmp/case56-qa-*.png`、`/private/tmp/case56-mobile-top.png` 與 `/private/tmp/case56-design-qa-*.png`，最終結果 `passed`。1512×980 實測 9 項規格、承德店資料／LINE、3 則評論、1 個文章圖組、0 個留言表單皆正確；Sidebar 在 500／1300／2200px 捲動位置皆固定於 96px，輪播可由第 1 張切至第 2 張，來源感知 Breadcrumb、前後篇及推薦連結都會保留 `from=inspiration`。桌面與 390×844 手機完整捲動後圖片錯誤、Reveal 隱藏、Nuxt 錯誤、console error／warning、水平溢位皆為 0；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 僅有 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 3.2.3 量身打造型男夢想廚房案例內頁（2026-08-18）

- **沿用案例內頁模板**：`/gallery/case35` 不建立新頁面骨架，直接沿用 3.2.1／3.2.2 已核准的 Antra 案例內頁、38/50px Noto Serif TC 標題、來源感知 Breadcrumb、Sticky 右欄、Previous／Next、評論與更多案例輪播；只依 PPT 第 6 頁替換資料及指定刪減。
- **松竹店正式資料**：案例規格改為現代風、石紋色、潮派廚房、L型+中島、400CM以上、4坪以上、35萬以上、櫻花石、沈志剛共 9 項，移除舊版不在規格表的「家的組成」。門市資訊補齊週一至週六 09:30–21:00、`04-2239 7068`、軍功里完整地址；卡片、到店預約與 LINE 諮詢統一使用 PPT 指定松竹店連結 `https://lin.ee/xIPto4o`。
- **文章圖片與評論**：主輪播、首段雙圖及最後一段屋主實景圖保留；依三個紅框移除清水模單圖、多功能中島雙圖與收納廚電雙圖，文章文字與最後三個延伸連結維持。顧客評論依簡報逐字放入 3 則相同內容，留言表單不渲染；評論提到「紀先生」但本案設計師為「沈志剛」，屬來源簡報的內容不一致，前端先照稿呈現，正式上線前須由內容端確認。
- **Design QA／建置**：因專案規則禁止新增第二份 `.md`，本節取代 Product Design 預設的 `design-qa.md`。已把 PPT 第 6 頁、內嵌 `image24.png` 長頁與實作畫面放進同一組比對板，證據為 `/private/tmp/case35-qa-*.png`、`/private/tmp/case35-mobile-top-final.png`、`/private/tmp/case35-design-qa-top.png` 與 `/private/tmp/case35-design-qa-lower.png`，最終結果 `passed`。1512×980 實測標題 38/50px、9 項規格、松竹店資料／LINE、3 則評論、2 個保留文章圖組、0 個留言表單皆正確；Sidebar 在 450／1400／2500px 捲動位置皆固定於 96px，主輪播可由第 1 張切至第 2 張，`from=inspiration` 來源 Breadcrumb、前後篇及推薦連結皆保持。桌面與 390×844 手機完整捲動後圖片錯誤、Reveal 隱藏、Nuxt 錯誤、console error／warning、水平溢位皆為 0；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 僅有 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 4.0 優惠消息總覽頁（2026-08-19）

- **PPT 第七頁真值**：`/news` 保留 Antra News List 既有的首篇大圖、後續左右圖文與右側欄結構，只依調整稿第 7 頁更換 Hero 為案例門市同一張店面圖；Hero「優惠消息」套用 Noto Serif TC 60px，麵包屑使用 Noto Sans TC 15px。文章首篇標題為 Noto Serif TC 38/50px，後續標題為 25/31px，日期、分類及摘要統一為 Noto Sans TC。
- **側欄與實際導覽**：依紅框刪除 `Categories` 與 `Popular Tags`，保留「優惠消息」分類膠囊及「最新文章」。分類膠囊不再是不可操作的 `span`，而是分別連到 `/news/activities`、`/news/latest`、`/news/video` 的正式列表頁；主列表與最新文章的圖片、標題也接上既有正式文章路由，並補齊鍵盤 Focus 樣式。側欄兩個標題為 Noto Serif TC 25/31px，最新文章標題為 Noto Sans TC 18/24px，文章列間保留一個文字框的間距。
- **手機可讀性**：390px 實機寬度回查時發現右側快速服務列會直接遮住文章標題與摘要，因此在全部 `/news…` 路由的 767px 以下隱藏該列；桌機優惠消息頁及其他非新聞路由維持原行為，不為了容納固定列而壓窄文章內容。
- **Design QA／建置**：依專案僅保留一份文件的規則，本節取代額外的 `design-qa.md`。已把 PPT 第 7 頁、其內嵌 Antra 長頁與 1512px production preview 放在同一比較輸入檢查，證據為 `/private/tmp/news-design-qa-same-frame.png`，最終結果 `passed`。1512×980 實測 Hero／麵包屑為 60／15px，首篇／一般文章為 38/50、25/31px，側欄只剩「優惠消息／最新文章」兩個 25px 標題、最新文章 18px；三個分類路由、首篇文章路由皆可實際跳轉，9 篇主文章與 4 篇最新文章均有圖片及標題連結。桌面與 390×844 手機皆 `scrollWidth === clientWidth`、圖片錯誤 0、console error／warning 0；手機側欄與快速服務列隱藏後，文章標題、摘要不再被遮擋。`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 4.1／4.2／4.3 優惠消息分類列表頁（2026-08-19）

- **PPT 第八頁真值**：第 8 頁中央標示「同內容調整」，因此 `/news/activities`、`/news/latest`、`/news/video` 三個分類列表共用同一修正，不只改 4.1。三頁 Hero 均換成 3.1 案例門市店面圖，頁名使用 Noto Serif TC 60/64px，完整麵包屑使用 Noto Sans TC 15/20px；4.1 補上原本缺少的目前頁「優惠活動」。
- **卡片層級**：維持 Antra 三欄文章卡、24px 圓角、金色分類膠囊、Hover 圖片放大與整卡正式文章連結；分類膠囊改用 Noto Serif TC，卡片標題依 PPT 固定 Noto Serif TC 18/24px，摘要為 Noto Sans TC 15/22px 並限制兩行，日期則使用 Noto Sans TC。三篇正式資料、圖片與路由全部保留，不用假卡補版面。
- **手機可讀性**：快速服務列的手機隱藏條件由單一 `/news` 擴充至全部 `/news…` 路由，避免三個列表及後續文章內頁的標題、摘要與操作區被固定列遮擋；桌機仍保留原快捷列。
- **Design QA／建置**：依專案只保留 README 的規則，本節取代額外的 `design-qa.md`。已將 PPT 第 8 頁、內嵌 Antra 優惠活動長頁與 1512×980 production preview 合併比對，證據為 `/private/tmp/slide8-activities-design-qa.png`，最終結果 `passed`。三個分類頁均實測為 Hero 60/64px、麵包屑 15/20px、3 張正式卡、標題 18/24px、摘要 15/22px 且兩行；正式圖片錯誤 0、三頁皆 `scrollWidth === clientWidth`，首張卡可進入各自文章路由。390×844 為單欄 360px，標題與摘要字級不變、摘要確實 clamp 2、快速服務列為 `display:none`、水平溢位 0；console error／warning 為 0。`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 4.1／4.2／4.3 優惠消息文章內頁（2026-08-19）

- **PPT 第九頁真值與範圍**：第 9 頁左側再次標示「文章頁同內容調整」，因此修改範圍是 `/news/activities/[slug]`、`/news/latest/[slug]`、`/news/video/[slug]` 三套正式文章模板，不是只修示意圖中的優惠活動。三頁麵包屑底圖統一換成 3.1 案例門市店面圖，文字使用 Noto Sans TC 15/20px 並加寬字距。
- **文章版面與字級**：文章 Header、主圖／影片與內文改為廚房裝修指南文章內頁相同的 930px 版心；分類日期列間距由 12.5px 校正為 15px，標題至主圖間距由 30px 改為 40px。文章大標固定 Noto Serif TC 38/46px，段落標題為 Noto Serif TC 25/32px，段落、清單及文章連結為 Noto Sans TC 15/26px；三頁都不再由 Cal Sans／Golos Text 搶先顯示中文字。
- **分類狀態**：文章底部移除 PPT 指定刪除的「廚房裝修指南」，只保留優惠活動、最新消息、媒體影音；每一頁只有目前分類使用金底白字，另外兩個維持白底灰字及可操作 Hover，不再出現優惠活動頁四顆按鈕全部金底的錯誤。
- **輪播改成列表卡排版**：`InternalActivityRelatedCarousel`、`InternalLatestRelatedCarousel`、`InternalMediaRelatedCarousel` 保留 Embla 拖曳與正式文章連結，但圖片比例改為優惠活動列表使用的 `1.40625`、金色分類膠囊改置於左上 20px、移除黑色遮罩；卡片下方只保留完整日期與標題，標題使用 Noto Serif TC 25/32px，桌面卡片間距由 30px 改為 40px。
- **Design QA／建置**：依專案只維護 README 的規則，本節取代額外的 `design-qa.md`。來源視覺為 PPT 第 9 頁與內嵌文章長頁，實作證據為 `/private/tmp/slide9-activity-top-1512.png`、`/private/tmp/slide9-activity-middle-1512.png`、`/private/tmp/slide9-activity-bottom-final-1512.png`，同畫面比較板為 `/private/tmp/slide9-article-design-qa.png`，最終結果 `passed`。1512×980 三類文章均確認底圖、930px 版心、38px 大標、25px 段落標題、15px 內文、正確目前分類與 3 張正式輪播卡；輪播第二張可實際跳轉。390×844 實測無水平溢位，文章為 360px 版心、快速服務列隱藏。Noto Serif TC／Noto Sans TC 字型載入檢查皆為 `true`，圖片載入錯誤與 console error／warning 為 0；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 4.2 最新消息指定文章調整（2026-08-19）

- **PPT 第十頁真值與範圍**：第 10 頁不是第 9 頁共用文章模板的再版，而是 `/news/latest/2026-franchise-seminar` 與 `/news/latest/kaohsiung_opening` 兩篇指定文章的內容例外；共用的 930px 版心、38px 文章標題、15px 正文、三分類 Tab 與推薦文章維持不動。最新消息文章的麵包屑背景依指定改用素材庫 `5.2 集團品牌館／Taichung` 的台中集團品牌館正面照，定位沿用 3.1 已驗收的 `center 88%`。
- **加盟說明會**：QR Code 恢復官網順序，置於報名連結上方並限制為原始 500px 寬，不再被共用媒體樣式放大至 930px；報名列顯示「報名連結＋完整網址＋立即點我報名」。台北／台中／高雄場次標題改為 PPT 指定的 `【地區加盟說明會場次】`、Noto Serif TC 18/28px，三張正式場次圖同樣維持約 500px 窄版置中。
- **高雄品牌館**：首段介紹保留單欄；PPT 點名的張永杰董事長段落改為 Home Six 參考的左圖右文雙欄，左側使用同一段原官網現場圖、右側保留指定原文，既有 `opalMoveUp／opalScaleUp` 進場語彙不另造動畫。第二張 HOME in O.N.E 現場圖與其後核心價值／結語仍完整保留；767px 以下依閱讀順序改為圖片在上、文字在下。
- **Design QA／建置**：PPT 第 10 頁的加盟頁與品牌館標註區已和 1280×720 實作動畫終態放入同一張比較板 `/private/tmp/slide10-design-qa-comparison.png`。本機實測加盟頁 QR 與三張場次圖皆為 500px、報名列確實在 QR 後、三個場次標題為 Noto Serif TC 18px；高雄品牌館指定段落落在 930px 版心內的 400.5／489.5px 雙欄，兩張文章圖均載入完成。兩頁 `scrollWidth === innerWidth`、Reveal 隱藏 0、console error／warning 0；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 全站內頁版面一致性（2026-08-21）

- **中文字重單一規格**：新增 `--font-weight-cjk-serif-emphasis: 600`；46 個正式內頁網址中，所有實際使用 Noto Serif TC、標準字級 18px 以上的中文標題、文章標題、卡名與產品名稱統一為 SemiBold。Noto Sans TC 正文、小於 18px 的文字與純英文 Cal Sans／Bodoni Moda／Libre Baskerville 不受影響；共用 Header 的「十大廚房系列」與隱私權頁標題同步修正。
- **Hero 含主導覽高度**：60px Header 高度集中為 `--site-header-height`，固定導覽覆蓋於 Hero；首頁與全部內頁 Hero 使用 `hero-includes-header` 回到文件 `y=0`，並保留每個模板原本的 Hero 高度與內部比例。沒有 Hero 的 `/franchising/form` 仍從 `y=60` 開始，未額外裁切標題、麵包屑或圖片。
- **30／70 標題共用元件**：新增 `InternalTemplateHeadingRail`，統一橢圓外框、5px 金點與 1px `#E3E3E8` 水平／垂直裝飾；支援亮／暗色、標準／緊湊密度、Home 04／09／06／05／01 原始幾何及操作按鈕插槽。FAQ、品牌門市、服務流程、關於我們、品牌辨識、集團品牌館、加盟、建商、AI Kitchen、裝修指南與案例推薦共 13 組標題已遷移；服務流程補上 `Service Process` 小標。2026-08-25 再直接核對 Antra XML 的 Elementor `icon` widget 與正式 `deco-horizontal.svg／deco-vertical.svg`：兩條線末端均恢復原版 15×15 SVG 箭頭 path，不再以無箭頭的純色 span 代替；Home 06 裝飾改為相對整個 30／70 row 定位，垂直線採原始桌機 `offset-x: 345px`／平板 `200px`，主標從原始 38px 上內距開始，避免線條壓到 `Explore Our…`。768–880px 依原始 `mobile-extra` 設定改為上下排列、置中小標與主標，並使用 150／100px 的線條偏移，避免垂直線擦到首字；767px 以下依模板隱藏裝飾線與箭頭、保留膠囊小標。
- **主標題與 CTA 動效規格**：首頁與內頁的主標題、Section 主標及主要轉換 CTA 全部沿用既有 `v-reveal`，形成固定動效語彙：一般標題由下往上、30／70 分割標題左右錯落 100ms、主要 CTA 使用上移或縮放進場；篩選、分頁、輪播箭頭及 FAQ 開關等高頻操作控制不強制加動畫。補齊建商、加盟、集團品牌館、隱私權及三層廚電頁漏掉的動效，並修正集團品牌館一個只有 `.ev` 隱藏 class、未綁定 Reveal 而可能永久不可見的標題；`prefers-reduced-motion` 仍會直接顯示內容並停用動畫。
- **全站 QA**：在 1280×720、768×1024、390×844 三種實際 viewport 逐一開啟全部 46 個有效內頁網址，確認 Hero 文件座標、Noto Serif TC computed style、十字線 DOM／5px 金點／1px 線條、手機線條隱藏與膠囊保留、水平溢位、圖片載入及前端錯誤；三種尺寸結果皆為字重違規 0、裝飾缺件 0、水平溢位 0、已完成圖片錯誤 0、Nuxt error 0。首頁 Hero 實測保持 952px 且起點為 `y=0`；表單頁在三種尺寸皆從 `y=60` 開始。手機／平板規則沿用各頁既有斷點並由共用元件集中控制，不改路由、資料、API 或圖片素材。
- **動畫 QA**：動畫驗收另把首頁納入，於同三種 viewport 逐一檢查 47 個網址、每種尺寸各 171 個主標題與 58 個主要 CTA，未綁定動畫、水平溢位與 Nuxt error 均為 0。針對本次補齊的集團品牌館、建商、加盟、隱私權及商品三層模板，再逐項捲入驗證 75 個動畫目標；全部成功進入 `is-visible`、維持可見並取得非 `none` 的對應 keyframe。
- **建置**：`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過；production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 右側快速服務按鈕官網比例校正（2026-08-25）

- **官網尺寸真值**：依原官網實際 DOM 與 computed layout 校正，不再只憑截圖估算。按鈕在手機為 `72 × 72px`、桌機為 `74 × 74px`，四周固定 `8px` padding；內容框因此分別為 `56 × 56px` 與 `58 × 58px`，第一顆按鈕下方保留 `20px` 間距。灰色按鈕間的 1px 白色半透明分隔線獨立於按鈕盒模型，第三顆不再被邊框撐成 75px。
- **指定資產與內容**：金色按鈕依 `截圖 2026-08-25 上午11.26.34.png` 恢復「案例門市」及 `/gallery` 連結；第二輪實圖比對發現 36px 房屋與 16px 標籤仍比官網 SVG 大一級，因此再校正為手機 29px／桌機 30px 房屋、Noto Sans TC 12/12px 標籤，並對齊下方兩顆圖示約 14px 的上緣與標籤約 12px 的下緣。按鈕外框仍維持官網 72／74px；灰色區保留原始圖示與正式服務連結，其中丈量按鈕可見文字及無障礙名稱已統一為「到府丈量」。
- **本輪 Design QA**：來源視覺為使用者提供的金色案例門市截圖與前一輪官網灰色按鈕截圖；XML、靜態尺寸規則與正式建置會持續檢查。Codex In-app Browser 的本機 URL 安全規則拒絕重新載入 `127.0.0.1:3018`，因此無法取得修改後瀏覽器截圖並與來源組成同畫面比較；依 image-to-code 驗收規則，本輪視覺 QA `final result: blocked`，需由使用者手動重新整理後提供或確認最終畫面，不能僅以建置成功宣稱視覺通過。
