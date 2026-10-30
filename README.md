## 2026-10-31 手機最新加盟資訊列表字級縮小

- 依凌晨1.46.28截圖，僅max-width:767px將三則加盟消息連結標題由20/30px縮為18/27px，縮小10%並保留易讀行距；不改上方主標、小標置中／24px間距、文章文案、連結、箭頭或整列至少76px的點擊範圍。768px以上仍20/30px；無CMS／資料庫修改。
- pnpm build含typecheck通過（既有JSON import attributes與Tailwind sourcemap警告保留）。本機320／390／430／767px三則列表均18/27px，完整自然換行、與箭頭無重疊，連結文案／目的地及字重保留、列高至少76px、無水平溢位；上方主標尺寸與小標置中／24px間距保留。768／1024／1280／1920px完整量測與正式修前一致，仍20/30px。
- 本機預覽Cookie到期出現401，透過既有預覽頁正常登入後再驗收，未將錯誤畫面算作通過；390px實際捲入目視文字縮小、console error 0。
- 424b6713已發布至dpl_H6zT7S9eGRD7VH9EDv9KoKYVq1JP，Vercel READY／Production、GitHub成功，兩個既有正式網域均接上該版本。主網域八尺寸結果與本機一致：四組手機三列均18/27px、完整換行／不壓箭頭、列高至少76px、上方主標及小標24px間距保留、無水平溢位；四組768px以上完整量測與修前一致。正式390px原生目視三則縮小後文字、console error 0；另一正式網域390px亦三則18/27px、24px間距且無水平溢位。
- 修前基準/tmp/sakura-franchise-news-font-before.json、本機畫面/tmp/sakura-franchise-news-font-local.png、正式畫面/tmp/sakura-franchise-news-font-production.png、完整量測/tmp/sakura-franchise-news-font-qa.json。未提交業務表單或播放影片，無CMS／資料庫寫入；自開server已停、viewport已還原。未驗實體手機或Safari／Firefox；完成紀錄只提交README、不為文件再次部署。

## 2026-10-31 手機最新加盟資訊小標籤置中

- 依凌晨1.46.21截圖核對正式站：FRANCHISE INFORMATION到Explore Our已24px，但標籤仍為inline-flex靠左（手機四尺寸left皆15px、中心117px），未完成置中。僅max-width:767px將最新加盟資訊直屬標籤改flex與margin-inline:auto，沿用共用24px間距；不改其他加盟標籤、標題／列表、768px以上版面或CMS／資料庫。
- pnpm build含typecheck通過（保留既有JSON import attributes與Tailwind sourcemap警告）。本機320／390／430／767px標籤中心與視窗中心誤差小於0.055px（offsetWidth整數取整），到Explore Our均24px，標籤尺寸、標題／列表／區塊高度保留，無水平溢位；768／1024／1280／1920px完整量測與修前一致。正式修前同頁CELEBRITY STORIES參考亦中心195px、間距24px；本機390px目視置中通過、console error 0。
- fefe4e11已發布至dpl_CqkBMZEJRpHrYGfmeQVRVJ8ts6qe，Vercel READY／Production、GitHub成功；兩個既有正式網域分別inspect均指向該版本。主網域八尺寸量測與本機完全一致，四組手機中心誤差小於0.055px、間距24px且無水平溢位，四組768px以上完整量測與修前一致。正式390px原生截圖目視標籤與Explore Our同軸置中、console error 0；另一網域390px亦labelX92.945px、中心194.945px（offsetWidth整數取整）、間距24px、display:flex且可見。
- 修前基準/tmp/sakura-franchise-news-label-before.json、本機畫面/tmp/sakura-franchise-news-label-local.png、正式畫面/tmp/sakura-franchise-news-label-production.png、完整量測/tmp/sakura-franchise-news-label-qa.json。未提交業務表單或播放影片，無CMS／資料庫寫入；自開server已停、viewport已還原。未驗實體手機或Safari／Firefox；完成紀錄只提交README、不為文件再次部署。

## 2026-10-31 手機加盟優勢與Join區塊留白縮短

- 依凌晨1.46.16截圖實測正式站：最後一組優勢圖示至Join SAKURA KITCHEN卡片間距為155px，由加盟優勢padding-bottom:80px及Join margin-top:75px疊加，最後場景本身底距已0px。
- 僅max-width:767px將前區塊底距歸零、後卡上距設48px，總留白縮短107px；不改優勢內容／圖示、卡片尺寸／內距／文字、動畫、768px以上版面或CMS／資料庫。
- pnpm build含typecheck通過（保留既有JSON import attributes與Tailwind sourcemap警告）。本機320／390／430／767px皆48px、卡片上移107px、前區塊高度減少80px，卡片本身560px高度與內距／字級不變、無水平溢位；768／1024／1280／1920px的前區塊高度、交界間距、圖示與卡片尺寸／內距／字級與正式修前完全一致。本機390×844實際捲入交界目視通過，完整內容與CTA可見，console error 0。
- 4de2cf4e已發布至dpl_CffSiWARZJ9BgcBHtJza3Mqv9jDy，Vercel READY／Production、GitHub成功；兩個既有正式網域分別inspect皆指向此版本。主網域八尺寸量測與本機完全一致，四組手機間距48px且無水平溢位，四組768px以上量測與修前一致；正式390×844實際捲入交界，圖示底部240.875px、卡片頂部288.875px，實際相距48px，卡片文案及CTA完整可見、console error 0。另一網域390px亦48px、卡片360×560px、無水平溢位。
- 修前基準/tmp/sakura-franchise-join-space-before.json；本機畫面/tmp/sakura-franchise-join-space-local.png、正式畫面/tmp/sakura-franchise-join-space-production.png及完整量測/tmp/sakura-franchise-join-space-qa.json。未播放影片或送出業務表單，無CMS／資料庫寫入；自開server已停、viewport已還原。未驗實體手機或Safari／Firefox；完成紀錄只提交README，不為文件再次部署。

## 2026-10-31 手機加盟夥伴小標籤與標題左緣對齊

- 依凌晨1.45.48截圖重新核對正式站：Our Partners到中文標題已24px，但手機標籤仍由共用TemplateHeadingRail置中，390px時左緣127.78px、標題左緣15px，確實未完整符合指定位置。
- 僅max-width:767px覆寫franchise-about__grid直屬標籤列為justify-content:flex-start，並清除該列小標籤繼承的margin-inline:auto；兩者必須一起處理，才能與中文／英文標題及影片左緣對齊。保留全站24px間距，不改其他加盟區塊與768px以上排版，也不改文案、影片或CMS／資料庫。
- pnpm build含typecheck通過（保留既有JSON import attributes與Tailwind sourcemap警告）；進場完成後比對正式修前320／390／430／767／768／1024／1280／1920px八尺寸，四組手機標籤與標題left皆15px、間距皆24px、無水平溢位，影片、標題及列高位置保留。四組768px以上的標籤列、標題、影片幾何及justify樣式與修前完全一致；本機390px目視對齊通過，沒有把進場平移中的負x座標當作完成值。
- a52ff8f6已正式發布至dpl_APK7RnjAcCdMoMbDC6fhSeXWBzGS，Vercel READY／Production、GitHub成功，兩個既有正式網域皆接上該版本。主網域八尺寸與本機量測一致：四組手機labelX與titleX皆15px、gap24px且無水平溢位，四組768px以上幾何與修前完全一致。另一網域390px實測亦labelX15px／titleX15px／gap24px，瀏覽器console error 0。
- 正式390px截圖/tmp/sakura-franchise-partners-alignment-production.png；修前後及正式量測/tmp/sakura-franchise-partners-alignment-qa.json。未播放影片或送出業務表單，無CMS／資料庫寫入；自開server已停、viewport已還原。未驗實體手機或Safari／Firefox；完成紀錄只提交README，不為文件再部署。

## 2026-10-31 關於我們手機品牌理念依原官網獨立滿版展示

- 依凌晨1.24.59截圖，實際開啟原官網https://www.sakura-kitchenlife.com.tw/about/introduce核對：四個理念為各自圖片的獨立滿版區塊，首屏是廚房背景、白色斜體Our Brand與中文標題，非目前四個400px短列共用作用中背景。原官網390×844每屏804px（扣40px頁首）、遮罩40%黑色、英文20/30px及中文30/45px。
- 僅max-width:767px加入每卡既有CMS對應圖片，改為自然捲動的獨立屏，最小高度為可視高度扣現有頁首與底部服務列（短視窗至少320px且內容可撐高）；首卡只顯示Our Brand與中文標題，隱藏序號及首卡說明，其他三卡保留原標題與說明，空說明不占位。每卡獨立40%遮罩、文字置中；不改文案或素材資料，不寫CMS／資料庫。桌面原共用背景與Hover／Focus切換保留，新增手機圖片於768px以上display:none。
- pnpm build含typecheck通過；本機八尺寸及390×500、667×375兩種短視窗量測，手機四卡各自有圖且無水平溢位，768px以上四組既有卡片、共用圖片及文字幾何與修前完全一致。390×844實際捲過四屏，圖片皆載入、各屏文字在容器內，上下緣對齊頁首60px與底部服務列772px；桌面實際選第一卡切到廚房背景、回第三卡恢復原安心健檢背景正常。第二屏長標原有孤立單字換行，手機h3改white-space:normal搭配text-wrap:balance，讓既有桌面硬換行在手機自然折行；不改桌面字級與文案。進場／定位包含塊會改變offset參照，文字防裁切改採同座標系的getBoundingClientRect檢查，未把offsetParent差異當成實際溢位。
- 最後版重建含typecheck通過（既有JSON import attributes與Tailwind sourcemap警告保留）；十尺寸重測，六組手機共24卡的文字區皆在卡片內且垂直置中誤差小於0.51px，四組平板／桌面與正式修前完全一致。第二屏長標自然兩行、不再有單字獨立一行，第四屏空說明不占位；保留既有圖片錯誤fallback，不新增套件。
- 646405bf已發布至dpl_E2JLTGfcz5KGESXRWEZLctnCyjyf，Vercel READY／Production、GitHub成功，兩個既有正式網域均指向此版本。主網域十尺寸排版皆與本機一致（不把未捲入時的lazy圖片loaded狀態當作幾何差異），六組手機24卡均在界內並垂直置中誤差小於0.51px；四組768px以上版面與修前完全一致。
- 正式390×844逐屏實際捲動四卡，各自圖片均已載入，頂緣約60px、底緣約772px，沒有被固定頁首或底部服務列遮住；瀏覽器console error 0。正式1280×800實際選第一卡，原共用背景切至廚房，再選第三卡恢復安心健檢背景正常。另一正式網域390×844也為四個712px獨立屏、共享背景隱藏、文字在界內且無水平溢位。
- 正式四屏截圖/tmp/sakura-about-values-production-0.png至/tmp/sakura-about-values-production-3.png，完整量測/tmp/sakura-about-values-qa.json。未更新CMS或資料庫，未提交業務表單；自開預覽server已停、viewport已還原。未驗實體手機及Safari／Firefox；完成紀錄只提交README，不為文件再部署。

## 2026-10-31 手機品牌優勢首屏只顯示一張廚房圖

- 依凌晨1.24.03截圖，只在max-width:767px隱藏BrandAdvantageHero下方重複的stage圖片與整個容器，保留上方圖片及原說明文字；不保留重複容器的30px上距與260px高度。768px以上仍保留既有雙圖與動畫，前輪三列導覽對齊不改，無CMS／資料庫修改。
- pnpm build含typecheck通過（保留既有JSON import attributes與Tailwind sourcemap警告）。對照正式修前320／390／430／767／768／1024／1280／1920px八尺寸，本機四組手機均只剩一張首屏廚房圖、重複容器display:none且高度0，首屏與下一區剛好減少／上移290px（260px重複圖＋30px上距），沒有留下容器空白；保留圖、說明及三列導覽幾何不變，無水平溢位。768px以上四組整體量測完全不變，雙圖仍保留；本機390px目視確認說明後直接接下一區。預覽沿用既有Azure runtime只讀內容。
- 394937d7已正式發布至dpl_6x7TFf8CmoBb8ymM5ja6ztvPjVyS，Vercel READY／Production、GitHub成功，兩個既有正式網域均指向此版本。主網域於進場完成後重測八尺寸，結果全部與本機一致；四組手機單圖、無殘留空間／無水平溢位，四組平板桌面量測與修前完全一致。首次進場途中offsetParent包含塊改變造成圖文offset座標不一致，待進場完成重測已排除，未為動畫中座標差異更改CSS。
- 另一網域390px亦僅一張首屏廚房圖、stage display:none且高度0，無水平溢位。正式390px畫面：/tmp/sakura-brand-single-image-production.png；完整量測：/tmp/sakura-brand-single-image-qa.json。自開預覽server已停、viewport已還原；未驗實體手機或Safari／Firefox，無CMS／資料庫內容修改；完成紀錄只提交README，不為文件再部署。

## 2026-10-31 手機品牌優勢導覽左緣對齊

- 依凌晨1.23.57截圖，修正品牌優勢頁三列「品牌優勢／集團品牌館／關於我們」各自置中造成圓點與文字相差8px。僅max-width:767px將每列改為相同16px圓點欄及80px文字欄，整組維持置中、每列分隔線滿寬，文字字級、色彩、連結與目前頁狀態保留；768px以上不改，不涉及CMS／資料庫。
- pnpm build含typecheck通過（既有JSON import attributes及Tailwind sourcemap警告保留）；本機對照正式修前320／390／430／767／768／1024／1280／1920px八尺寸：四手機尺寸三列圓點與文字左緣差皆0、無水平溢位，三列寬高及垂直位置不變，連結、目前頁狀態與16px字級保留。四個768px以上尺寸的導覽及每列所有量測完全不變；本機390px目視通過。沿用既有Azure runtime只讀公開內容，不執行資料更新或業務表單。
- d8b54cc8已發布至dpl_C2W7WE3rXaRx25CSXKTNuVexnGAS，Vercel READY／Production、GitHub成功，兩個既有正式網域皆指向該版本。主網域八尺寸量測與本機完全一致，四組手機三列圓點與文字各自左緣差0，四組平板／桌面與修前完全一致；另一網域390px圓點位置皆128px、文字皆152px，無水平溢位。正式390px進場完成畫面：/tmp/sakura-brand-nav-production.png；完整量測：/tmp/sakura-brand-nav-qa.json。
- 本機點品牌館連結時URL正確但曾記錄「內容尚未初始化」錯誤，沒有把該另頁算作本機內容驗收通過；正式相同/about/exhibition已另開核對標題、三館資料與完整內容正常，未為此修改CMS。自開預覽server已停、viewport已還原；未驗實體手機或Safari／Firefox。完成紀錄只提交README，不為文件再部署。

## 2026-10-30 手機案例輪播箭頭靠右

- 依門市案例截圖，手機版（小於768px）清除CaseCarousel繼承自平板的76px右外距，上一張／下一張按鈕整組對齊主圖右緣；按鈕尺寸、縮圖列、圖片與輪播行為保留。共用於門市案例與設計靈感詳頁，平板／桌面不改，不涉及CMS／資料庫。
- pnpm build（含typecheck）通過；沿用既有JSON import attributes警告，未新增套件。兩種詳頁各以320／390／430／767／768／1024／1280／1920px八尺寸量測：手機右外距皆0、無水平溢位，768px以上輪播主圖／按鈕／縮圖列的offset尺寸與位置和正式修前完全一致。門市案例實際點下一張、上一張及第三張縮圖，aria-selected與即時張數皆正常。
- 本機SQL未啟動，預覽程序改用既有Azure runtime設定讀取目前正式內容；僅正常預覽登入與公開頁面讀取，不執行資料更新、匯入或遷移。
- b9a6b37e已正式發布至dpl_A6g3RvMWMsYGfoRzSus3intK2RNm，Vercel READY／Production、GitHub成功；sakura-demo-vanlantech.com與header-design-two.vercel.app均指向該版本。主網域兩種詳頁共16尺寸組合均與本機一致，八組手機箭頭與主圖右緣差0px，八組平板／桌面幾何不變，均無水平溢位。正式門市案例下一張狀態為第2張、返回第1張正常；另一網域390px亦右緣差0px、右margin0，瀏覽器console error為0。
- 正式手機390px畫面：/tmp/sakura-mobile-case-arrows-production.png；量測資料：/tmp/sakura-mobile-case-arrow-qa.json。已停止自開預覽server並還原viewport，未驗實體手機或Safari／Firefox；完成紀錄只提交README，不為文件再部署。

## 2026-10-30 設計案例管理依官網分類排序

- 「設計案例」10張卡片改為品牌系列 → 設計靈感 → 廚房裝修指南 → 品牌系列型錄；同分類內容與設定相鄰，系統櫃專題亦歸在廚房裝修指南。
- 使用既有入口識別碼及官網位置對照排序，不依可改名的標題猜分類；同分類維持原相對順序，新入口未對應時保留在最後。排序在搜尋、分類及分頁前執行，僅套用設計案例列表，其他分類、API回傳與內容資料不改。
- 既有check-admin-names補10入口順序、子文章集中、自訂名稱、未知入口保留、空清單、冪等、分類搜尋及不變動原陣列檢查，連同48入口名稱／舊網址／返回條件回歸通過；型別檢查、正式建置與diff檢查通過；正式發布與操作驗證待續記。

## 2026-10-30 全站手機小標籤至第一行標題統一24px

- 依「每個頁面都一樣，要一致」的新要求，本輪將手機小標籤底部至第一行標題（含Explore Our）的距離統一為24px，以產品參考區為準；先前逐頁對齊成28px的設定亦納入統一，舊紀錄不再作本輪標準。桌面與平板768px以上保留原排版。
- 盤點45個公開代表路由與所有SectionPill／TemplateHeadingRail使用結構，已保存八尺寸360組正式修前基準；手機共280組標籤配對原有0／11／16／20／22／23／24／25／26／28／38／44px差異。等待內容掛載後量測，並扣除進場平移，沒有把未掛載或動畫中座標當成留白。
- main.css的max-width:767px集中定義--mobile-heading-label-gap:24px，覆蓋直接相鄰、首頁包裹標籤及裝飾標籤列三種結構；標籤列由單欄grid持有唯一row-gap，清除相鄰標題／包裹層的上margin或padding，直接標籤則只由標題上margin持有間距。保留字級、顏色、內部中英行距、文案、連結及桌面樣式，不寫CMS／資料庫。
- 第一輪pnpm build含typecheck通過，本機45路由八尺寸360組已量測：280手機標籤配對皆24px、無水平溢位，文字／字級／顏色／標籤尺寸及扣除上padding後的標題內容行框不變；280平板／桌面配對最大幾何差異0.0001220703125px，屬浮點誤差。推薦案例與門市案例標題框縮小是把舊上padding移至父列間距，非刪除文字行高。
- 手機標籤顯示一併收尾：reveal指令updated僅在max-width:767px、SectionPill／TemplateHeadingRail已完成進場（無待觸發observer）卻被attrs更新清掉is-visible時，恢復顯示並重用data-reveal-direct避免動畫重播；尚未進場、非標籤及桌面皆不處理。此為前輪加盟資料下載標籤消失及本輪FAQ互動後標籤列隱藏問題的限定修正。
- 第二次pnpm build含typecheck通過；可用pnpm exec node scripts/check-reveal-label-update.mjs重跑限定顯示修正的斷言，自查手機已進場還原、未進場observer保護、首次進場不跳動畫、重複更新、桌面及非標籤排除。已在本機下載頁等待PDF資料載入完成，實際觀察data-reveal-direct及is-visible保留、visibility:visible且間距24px。
- 本機390px實際目視服務流程、首頁品牌系列、型錄FAQ及加盟下載：證據/tmp/sakura-mobile-site-label-gap-service-local.png、/tmp/sakura-mobile-site-label-gap-home-local.png、/tmp/sakura-mobile-site-label-gap-faq-local.png、/tmp/sakura-mobile-site-label-gap-download-local.png。手機建商聯絡區原標籤偏左，統一標籤列後改為與其置中標題對齊；其他手機水平位置保留。
- 0cf9811f第一版正式間距驗證45路由360組通過，280手機標籤配對皆24px；後續真實點服務流程FAQ發現TemplateHeadingRail也會隨Vue重繪丟失is-visible並隱藏。據此將同一手機顯示保護涵蓋SectionPill及TemplateHeadingRail，分支自查亦逐一涵蓋兩種標籤，保留桌面及非標籤排除；最後版本重建、實際FAQ操作與正式複驗待續記。
- 最後版本pnpm build含typecheck及check-reveal-label-update斷言通過。本機以原生FAQ錨點捲動並切換「什麼是五大永久免費服務」，實際aria-expanded false→true，標籤列保留is-visible與data-reveal-direct、visibility:visible，兩組服務頁標籤間距24px且無console error；中途本機預覽Cookie到期，正常登入後重回錨點，未將登入畫面或未進入FAQ的捲動位置算入驗收。
- 最後c7dd9932已發布；Vercel dpl_Txn1V1An1AnzprYoZULGbkRQXjpQ為READY／Production、GitHub成功，分別inspect兩既有正式網域皆確認指向此版本。最後主網域45路由八尺寸360組複驗，280手機標籤配對全為24px、無水平溢位，文字、字樣式與標題內容行框保留；280平板／桌面配對最大差異0.00007480468747189661px（浮點誤差，小於0.001px），無實際版面變動。
- 正式FAQ在進場停止後實際點擊false→true→false，標籤列全程visibility:visible、data-reveal-direct保留，服務頁兩組間距皆24px；PDF資料完成後小標籤亦visible且不重播。另一網域390px重查服務兩組、首頁五組、Clever兩組均24px。正式原生畫面證據/tmp/sakura-mobile-site-label-gap-service-production.png、/tmp/sakura-mobile-site-label-gap-home-production.png、/tmp/sakura-mobile-site-label-gap-download-production.png；完整數據/tmp/sakura-mobile-site-label-gap-qa.json。
- 正常預覽登入外未提交業務表單，無CMS／資料庫內容或結構修改；自開server已停、viewport已還原。未驗實體手機及Safari／Firefox，正式驗收紀錄只提交README、不為文件再部署。

## 2026-10-30 全站手機麵包屑橫幅標題一致化

- 依下午6.32.10截圖及「每個頁面都一樣」，此次統一的是帶麵包屑的英文橫幅標題，不只服務流程。正式390px Our Process為30px／35px，參考Kitchen Appliances為41.73px／48px；另有指南48px、型錄46px、關於我們44px、Privacy38px等差異。
- 在main.css集中加入max-width:767px規則，僅選main內含nav[aria-label="麵包屑"]的hero-includes-header之可見h1及三種消息詳頁橫幅p標題，統一clamp(34px,10.7vw,42px)／48px；允許長標自然換行。保留每頁字重／字型／顏色、文案、麵包屑與版型間距，768px以上不改。不套用文章主標、產品正文主標、首頁、品牌系列與建商／加盟大型首屏。
- 已保存26個代表頁（產品品牌及列表、服務、門市、新聞列表與三種詳頁、指南、型錄、About Us、Privacy及加盟資料）×八尺寸208組正式修前基準；另10個排除頁（含文章／產品正文）×八尺寸80組選擇器命中均0。不寫CMS／資料庫。
- pnpm build含typecheck通過；本機26頁×320／390／430／767px共104組均與同寬Kitchen Appliances採相同34.24／41.73／42／42px、48px行高；文字／字型／字重／顏色／對齊與麵包屑保留，實際字行無水平溢位、版面無裁字或壓到麵包屑。26頁×768／1024／1280／1920px共104組最大幾何差異0.000030517578125px，屬字行浮點誤差；以相對版面座標消除進場動畫形成包含塊的offsetParent差異，未把該差異當CSS回歸。排除頁80組字級／行高／顏色差異0。
- 本機390px服務流程與320px Franchise Information長標原生目視通過，證據/tmp/sakura-mobile-banner-service-local.png及/tmp/sakura-mobile-banner-long-local.png。長標自然兩行且麵包屑完整；保留每頁既有對齊與留白，未為字級統一改寫首屏高度或動畫。
- 6c6ef1a1已發布；Vercel dpl_FqyykDyKm3k4W6LV52MxHzQXzQJm為READY／Production，兩個既有正式網域均接上。主網域26頁104手機組字級／行高、文字字樣式與麵包屑、無溢位／無裁字／無重疊均通過；104平板／桌面組最大差異0.000030517578125px，10個排除頁80組字級等差異0。另一網域390px服務流程與Privacy均41.73px／48px，包含原important樣式覆寫檢查。
- 正式390px服務流程目視證據/tmp/sakura-mobile-banner-service-production.png，320px加盟下載長標與麵包屑證據/tmp/sakura-mobile-banner-long-production.png，完整數據/tmp/sakura-mobile-banner-title-qa.json。另發現加盟下載頁的小標籤載入後class由ev is-visible變為ev、visibility:hidden；新字級選擇器未命中該span，顯示狀態丟失的觸發原因未進一步驗證，本次未修改其動畫。長標截圖及字級通過不代表這項獨立動畫問題通過。
- 無CMS／資料庫／業務表單寫入，自開server已停、viewport已還原；未驗實體手機及Safari／Firefox。正式紀錄只提交README，不為文件再部署。

## 2026-10-30 商品列表型錄區塊手機標籤間距

- 依下午6.31.44截圖，商品列表SAKURA PRODUCT CATALOGUE至「廚房商品型錄」要同/products/sakura產品區塊。正式四種手機寬度參考間距24px，列表型錄區塊22px；768px以上27px。此需求與前幾輪Explore Our的28px不同，以本張參考區塊實測24px為準。
- 僅將ProductListPage.vue的max-width:767px型錄h2 margin-top22→24px，保留下margin30px、靠左、字級／配色／文案及下載與預覽連結。共用元件涵蓋三品牌全部產品、分類列表與既有除油煙機／近吸系列路由，已保存六代表路由×八尺寸48組正式修前基準。不改產品詳情模板或CMS／資料庫。
- pnpm build含typecheck通過；本機六代表路由×320／390／430／767px共24組間距24px，h2與中文只下移2px、區塊高度增2px，標籤、字級、行高、配色、靠左與型錄文字／圖片來源／三個入口連結均保留，無整頁水平溢位。六路由×768／1024／1280／1920px共24組標籤、標題、尺寸及連結資料對修前差異0。390px原生捲動完整目視證據/tmp/sakura-mobile-product-catalogue-gap-local.png；實際點下載入口正常進/catalogues/catalog，看到型錄清單及PDF預覽／下載連結，未觸發PDF下載。
- 8baded81已發布；Vercel dpl_6J7nH4bkxb2LHFd6KRZ8HoTcaJ16為READY／Production、GitHub成功。初次READY回傳尚未列兩自訂網域，另分別inspect兩網域已確認皆指向同一新版且aliases包含兩者；主網域六路由24手機組間距24px／無溢位／樣式文字連結保留通過，24平板／桌面組對修前差異0。正式實際點入口也正常進型錄清單，看到PDF預覽與下載連結，未實際下載。
- 另一正式網域預覽Cookie到期時先正常登入，未把登入頁計入驗收；登入後390px間距24px、三個入口保留。正式目視證據/tmp/sakura-mobile-product-catalogue-gap-production.png，數據/tmp/sakura-mobile-product-catalogue-gap-qa.json。自開server已停、viewport還原；未驗實體手機及Safari／Firefox，無CMS／業務資料寫入，正式紀錄只提交README、不為文件再部署。

## 2026-10-30 廚房裝修指南手機小標籤間距

- 依下午6.29.05截圖，/knowledge的STRAIGHT FROM THE NEWSROOM至Explore Our需同加盟品牌信賴28px。正式320／390／430／767px實際36.5px，眉標中心偏左4px；標籤／h2兩套margin及舊br的flex行框共同影響留白。
- 僅修改knowledge/index.vue的max-width:767px：標題外層改直向flex、間距28px，標籤以flex置中且清除下margin，h2清除上margin，移除重新顯示舊br的規則。保留字級、中英分組、配色、文章、連結、其他區塊與768px以上版面；已保存八尺寸的穩定正式修前基準及文章資料。不寫CMS／資料庫。
- pnpm build含typecheck通過；本機320／390／430／767px實際間距均28px，標籤及Explore Our中心分別160／195／215／383.5，無整頁水平溢位。標題字級／行高／配色及三篇文章的標題、圖片來源、連結保留；768／1024／1280／1920px標籤與標題座標、尺寸、樣式及文章資料對修前差異0。390px原生捲動完整目視證據/tmp/sakura-mobile-guide-gap-local.png。
- 4bf00eff已發布；Vercel dpl_2vXUcuS37YXBQ2YZo6fdAN5nL68E為READY／Production、GitHub成功，兩個既有正式網域均接上。主網域四手機尺寸間距28px、雙中心及無溢位通過，四平板／桌面尺寸對修前差異0，三篇文章標題／圖片／連結不變；另一正式網域390px同為28px、雙中心195、三篇文章。正式原生捲動完整目視證據/tmp/sakura-mobile-guide-gap-production.png，數據/tmp/sakura-mobile-guide-gap-qa.json。自開server已停止、viewport還原；未驗實體手機及Safari／Firefox，正式紀錄只提交README、不為文件再部署。

## 2026-10-30 品牌系列推薦案例手機小標籤間距

- 依下午6.28.59截圖，十系列RECOMMENDED CASES至Explore Our也需同加盟品牌信賴28px。正式四種手機寬度原實測35.5px、眉標中心偏左4px，與上方Collections同為舊br參與flex排版造成。
- 移除手機重新顯示舊br的規則，讓兩個雙語標題沿用既有display:none；上輪Collections專用隱藏規則因此刪除，保持同樣結果。僅在max-width:767px將推薦案例h2上padding24→28px；下padding、字級、文案、案例輪播及空狀態保留，768px以上不動。不寫CMS／資料庫；已保存十系列八尺寸80組正式修前基準。
- pnpm build含typecheck通過；本機十系列×320／390／430／767px共40組實際間距28px，標籤與眉標置中、無整頁水平溢位，字級／行高／顏色／對齊與文案保留。十系列×768／1024／1280／1920px共40組的標題、標籤位置／尺寸／樣式對修前差異0；上方Collections用自身原生錨點於穩定進場狀態比對八尺寸差異0，沒有把跨區捲動中的動畫座標當成排版變化。390px Clever完整推薦案例空狀態目視證據/tmp/sakura-mobile-cases-gap-local.png。
- 7a860079已發布；Vercel dpl_DgUydMZvv1TuakfVdtfFxTG21anF為READY／Production，兩個既有正式網域均接上。主網域十系列40組手機間距28px、中心與無溢位通過，40組平板／桌面及上方Collections八尺寸對修前差異0；另一正式網域390px同為28px、標籤與眉標中心195。正式原生捲動目視證據/tmp/sakura-mobile-cases-gap-production.png，數據/tmp/sakura-mobile-cases-gap-qa.json。自開server已停止、viewport還原；未驗實體手機及Safari／Firefox，正式紀錄只提交README、不為文件再部署。

## 2026-10-30 品牌系列內頁手機小標籤間距

- 依下午6.28.51截圖，十系列KITCHEN COLLECTIONS至Explore Our要對齊加盟品牌信賴。正式320／390／430／767px參考皆28px，系列內頁實際35.5px；原gap24px外，舊br被手機display:initial規則重新顯示，在flex標題產生額外行框，眉標也偏左4px。
- 僅修改KitchenSeriesPage.vue的max-width:767px：ai-section-heading間距28px，並只在這個標題隱藏舊換行元素。保留中文／英文分組、字級、文案、圖片與其他標題區塊；768px以上不動。已保存十系列×八尺寸80組正式修前基準。不寫CMS／資料庫。
- pnpm build含typecheck通過；本機十系列×320／390／430／767px共40組實際間距皆28px，小標籤與Explore Our均在畫面中心、無整頁水平溢位，字級／行高／顏色／對齊及文字保留。十系列×768／1024／1280／1920px共40組的標題與標籤尺寸、位置及樣式對修前差異0；390px Clever完整目視證據/tmp/sakura-mobile-collections-gap-local.png。
- 8ba2c749已發布；Vercel dpl_AwFwKqVxjMnrXDnEg7hTZGYrRKMW為READY／Production、GitHub成功，兩個既有正式網域均接上。主網域十系列40組手機間距／中心／無溢位及字樣式保留通過，40組平板／桌面對修前差異0；另一正式網域390px間距28px、標籤與眉標中心均195。正式目視證據/tmp/sakura-mobile-collections-gap-production.png，數據/tmp/sakura-mobile-collections-gap-qa.json。自開server已停止、viewport已還原；未驗實體手機及Safari／Firefox，正式驗收紀錄只提交README、不為文件再部署。

## 2026-10-30 十品牌系列手機首屏標題放大與位置

- 依下午6.28.43截圖，十個品牌系列手機首屏標題需要由Harmony左圖改為右圖的較大字級並下移。正式390px Harmony原標題30px／35px行高、標題框top154px；以手機50px／60px及標題區top80→96px調整，整體標題框下移16px，保留水平置中與白色文字。
- 僅修改KitchenSeriesPage.vue的max-width:767px共用規則，不改首頁Hero或768px以上桌面；保留文案、圖片、輪播、型錄及案例入口。AI Kitchen三張圖文另逐張檢查長標與說明是否需例外，建置、十系列手機／桌面與正式驗收待續記。不寫CMS／資料庫。
- pnpm build含typecheck通過；既有check-kitchen-series安全檢查通過十系列SSR、404、215圖片來源、AI三組圖文配對及輪播／鍵盤回歸。本機十系列×320／390／430／767px共40組均50px／60px、水平置中、標題框top170px且無水平溢位；Clever在320px自然兩行，其餘一行。AI三張×四尺寸共12組保留三層文字，文字至控制區最小淨空164px、Hero內部未被捲動，不需另外縮字。
- 修前正式版與本機768px以上共16組比較（十系列1280px，Harmony／AI另768／1024／1920px），標題、文字、字級、尺寸與位置差異0。本機390px原生進場顯示階段目視符合截圖方向，證據/tmp/sakura-mobile-harmony-title-local.png；動畫過渡中的偏移／透明未誤算成穩定排版。待發布後續記正式結果。
- a8cafcc6已發布；Vercel dpl_35XfzWyzYqkYarenEcBqfXKU2GLs為READY／Production，GitHub成功且兩個既有正式網域均接上。主網域十系列×四手機尺寸40組通過50px／60px、置中、top170px及無水平溢位；AI三張×四尺寸12組逐張白字、圖文與淨空通過，最小164px。正式768px以上16組與修前差異0；另一正式網域390px Harmony同為50px／60px、top170px、中心195。
- 正式安全回歸通過十系列SSR、404、215圖片來源及既有動畫／鍵盤檢查；原生進場顯示階段正式390px目視證據/tmp/sakura-mobile-harmony-title-production.png，數據/tmp/sakura-mobile-series-title-qa.json；本機320px AI FAUCET完整三層文字目視證據/tmp/sakura-mobile-ai-title-local.png。未改動畫、文案、圖片與資料，沒有CMS／資料庫／業務表單寫入；自開server已停、viewport已還原。未驗實體手機及Safari／Firefox，正式紀錄只提交README，不為文件再部署。

## 2026-10-30 手機首頁尋找門市小標籤留白

- 依下午6.28.36截圖，尋找門市STORE LOCATOR標籤至Explore Our間距需同加盟品牌信賴。正式320／390／430／767px原實測20px，標籤與h2均已在畫面中心；參考品牌信賴為28px。
- 僅將.store-location-heading納入現有max-width:767px的28px row-gap規則；保留字級、中英分組、置中、篩選、門市資料及地圖，768px以上原間距與排版不變。不寫CMS或資料庫；建置、手機／桌面及正式驗收待續記。
- pnpm build含typecheck通過；本機320／390／430／767px標籤至Explore Our均28px，標籤／h2中心為160／195／215／383.5，字級與行高保留且無整頁水平溢位。768／1024／1280／1920px有效行框座標、尺寸及樣式與修前差異0；display:contents英文包裹沒有行框，排除其虛構零矩形座標。中途本機預覽Cookie到期時正常重新登入後再驗，登入頁未計入結果。
- f6527f6a已發布；Vercel dpl_8u69HW1UchQKuBP6N7U9REz7trhV為READY／Production／GitHub成功，兩個既有正式網域都已接上。主網域四種手機寬度間距28px及置中皆通過，四桌面尺寸對修前差異0；另一網域390px同為28px、中心195。正式390px原生門市錨點完整目視，地圖與標題正常顯示，證據/tmp/sakura-mobile-store-gap-production.png。
- 本機runtime未設定公開Maps金鑰，其前端完整顯示設定錯誤，未將本機地圖當成通過；正式圖已確認實際地圖呈現且沒有缺金鑰訊息。本輪只改手機間距選擇器，未改金鑰、地圖元件、門市資料或篩選邏輯；無CMS／資料庫／業務表單寫入，只有正常預覽登入。自開server已停止、viewport還原；未驗實體手機或Safari／Firefox，正式紀錄只提交README、不為文件再部署。

## 2026-10-30 手機首頁品牌承諾置中與標籤留白

- 依下午5.11.50截圖，重查首頁品牌承諾的標籤、中英文、說明及CTA。正式站320／390／430／767px在進場完成後，標籤與按鈕框中心已等於viewport中心，標題／副標／段落每行實際文字Range中心誤差皆小於0.01px；不捏造穩定畫面有偏移。手機仍沿用標籤左移入、標題與影片右移入的100px動畫，進場過程會偏離中心。
- 只在max-width:767px讓標題區以直向flex共同置中、h2保持滿欄；標籤margin-bottom20→24px，對齊右圖/products/sakura標籤至中文主標的實測24px。這區手機標籤／標題與影片改用既有fadeIn，進場維持中心，文字／副標／段落字級與CTA連結、桌面動畫不變。建置、實際字行／進場與正式驗收待續記。
- pnpm build含typecheck通過。本機320／390／430／767px標籤到中文主標均24px；標籤、標題、副標、段落與整個CTA框中心分別160／195／215／383.5，標題／副標／段落逐行Range中心最大誤差0.00390625px，沒有水平溢位；不將圓點造成的標籤文字偏移或CTA文字與箭頭分工誤當框體不置中。768／1024／1280／1920px字級、尺寸、位置、留白、文字對齊對修前差異0。
- 390px從無hash首頁以原生PageDown正常捲入，標籤／標題與影片computed animation-name皆fadeIn、transform皆none、中心195；原生錨點會依既有機制直接顯示而animation:none，這部分不冒充動畫驗收。完整本機目視證據/tmp/sakura-mobile-promise-center-local.png；不修改全站reveal或其他區塊動畫。
- d30a64ba已發布，Vercel dpl_CEY4BNuHHbo5g9QBYBN5g7ecJyp4為READY／Production／GitHub成功，兩個既有正式網域均接上。正式主網域四手機尺寸逐行中心最大誤差0.00390625px、整組框中心正確、間距24px且無橫向溢位；四桌面尺寸對修前差異0。正式另從無hash首頁原生捲入確認標籤／主標與影片fadeIn、無transform、中心195，沒有用錨點直接顯示替代正常進場驗收。
- 兩正式網域390px再次逐行核對與目視，證據/tmp/sakura-mobile-promise-center-production.png。來源文案、字級、影片與連結不改；只改這區手機限域CSS，無CMS／資料庫／業務表單寫入。自開本機server停止、viewport還原；未驗實體手機與Safari／Firefox。正式紀錄只提交README，不為文件再部署。

## 2026-10-30 手機首頁設計案例高度與整組位置

- 依下午5.11.41截圖，只修767px以下首頁設計案例：原956px最低高度及120px頂部留白造成上下大片空白。手機解除最低高度、頂部改64px、底部改48px；更多設計的上距40→112px抵消標題上移56px後，讓按鈕／兩張縮圖／左右箭頭相對區塊原位置整組下移16px。
- 保留原標題字級、縮圖尺寸、卡片／箭頭間距、輪播與背景圖連結，768px以上原規則不變；不寫CMS／資料庫。建置、實際尺寸／輪播與正式畫面待續記。
- pnpm build含typecheck、check-gallery-cases.mjs（明確CMS_GALLERY_DB_CHECK=0，無資料庫寫入）通過。本機320／390／430／767px高度依序698.20／733.20／753.20／783.20px（原皆956px），標籤及標題上移56px，按鈕／縮圖／箭頭三者皆下移16px，末端留白48px；字級及卡片寬高不變，整頁無橫向溢位。768／1024／1280／1920px同修前座標尺寸與樣式，最大浮點差0.000061px；只排除原切卡translateX動畫的卡片組瞬間x，不更動動畫。實際原生Tab導覽到箭頭後點下一張／上一張，背景及兩張案例連結同步切換並回復，更多設計仍指向/design-inspiration。
- 3b8113e3已發布；Vercel dpl_J1L5TpQgZUkVy8wXSkdiFh9knFim為READY／Production／GitHub成功，兩個既有正式網域均接上。正式主網域四種手機寬度重驗相同高度、上移56／整組下移16及48px底部留白；768／1024／1280／1920px與修前基準一致。正式實際點下一張／上一張，主圖與兩張縮圖連結同步切換並返回，原更多設計入口保留。
- 正式390px完整可見畫面已目視，證據/tmp/sakura-mobile-gallery-layout-production.png：標籤、標題、更多設計、兩縮圖與左右箭頭均保留。另一正式網域390px高度733.20px及CTA上距112px同樣通過；既有輪播背景轉場保留。使用原生Tab及方向鍵調整檢視位置，未注入捲動／CSS或修改輪播私有狀態；不將離視窗的點擊失敗算成功，移入畫面後實點複驗。
- 本輪只改手機限域CSS，不修改元件／圖文資料、Footer圖示或底部金色服務；無CMS／資料庫／業務表單寫入。自開本機server停止、viewport已還原；未驗實體手機與Safari／Firefox。正式紀錄只提交README，不為文件再部署。

## 2026-10-30 首頁手機小標籤間距統一

- 依下午5.11.34截圖，首頁品牌系列與廚房產品的小標籤至Explore Our留白需同加盟品牌信賴。正式參考區塊320／390／430／767px實際間距皆28px；首頁品牌系列原20px、廚房產品原0px。
- 僅max-width:767px指定.home-project-heading與.home-services-heading的row-gap:28px，保留原標籤／眉標／中英文的字級、內容、動畫及桌面規則；品牌信賴參考區塊不改，不寫CMS或資料庫。建置、手機及桌面實際比對與正式結果待續記。
- pnpm build含typecheck通過；本機320／390／430／767px兩區塊實際標籤底邊至Explore Our行框頂邊均28px，無整頁水平溢位。768／1024／1280／1920px兩區塊外框座標、尺寸、字級、行高、色彩、留白與文字比對修前正式站相同，僅1024px一個文字框有0.000061px浮點差；不將嚴格JSON不等誤當成版面變更。390px實際鍵盤捲至廚房產品目視28px留白，證據/tmp/sakura-mobile-products-gap-local.png；無注入捲動或動畫樣式。
- 6b82553a已發布，Vercel dpl_D4dGA976CDiyrCfhgCc97M1SjpXR為READY／Production／GitHub成功，兩個既有正式網域均接上。主網域四手機尺寸兩區塊均28px，四桌面尺寸比對仍只有最大0.000061px浮點差、樣式無異；另一網域390px兩區塊皆28px。正式390px用原生PageDown／ArrowUp逐區捲動目視，標籤完整在固定導覽下方時保存/tmp/sakura-mobile-series-gap-production.png與/tmp/sakura-mobile-products-gap-production.png，不使用被導覽遮住的小標籤畫面作交付證據。
- 本輪只新增手機CSS兩個選擇器的row-gap；CMS／資料庫、字級／文案、Footer圖示與金色服務列不改。自開本機server已停止、viewport已還原；未驗實體手機或Safari／Firefox。正式紀錄只提交README，不為文件再部署。

## 2026-10-30 手機Footer圖示對齊基準修正

- 使用者指出上一輪目視仍不齊。前次將展板手指末端當作圖示下緣，雖然整圖可見像素下界一致，展板外框與YouTube白色按鈕仍有約5.6px高低差；不能以整圖alpha邊界驗收代替視覺對齊。
- 改以展板螢幕外框底邊對齊YouTube白色按鈕底邊，手指延伸不列入。檢查512px原PNG外框下界392px，僅手機YouTube translate由8.62改3.02px，兩圖scale:.9、原連結點擊寬高、桌面與金色服務列保持不變。建置、實際畫面及正式驗收待續記。
- pnpm build含typecheck通過。修前正式站390px以外框基準重驗落差5.59668px，證明上一輪整圖下緣斷言不能代表所需視覺對齊；修後本機320／390／430／767px，展板外框與YouTube白色按鈕底邊誤差0.00342px，縮小10%、連結40px高度及原金底服務保留。390px捲至Footer目視完整畫面與原始局部截圖，外框底邊對齊、手指自然向下延伸；局部截圖使用頁面座標，未繪製引導線或修改圖片製造對齊。768／1024／1280／1920px對既有修前基準逐節點比對差異0。
- 5e17bf3a已發布；Vercel dpl_41rA7qGvn94yuBPmRwKWLYdHJRks為READY／Production／GitHub成功。正式主網域四種手機寬度依外框基準重驗差0.00342px，圖檔完整載入、90%尺寸及點擊高度保留；另一正式網域390px圖檔完成載入後同樣通過，不將寬度0的中途讀取算通過。正式完整截圖/tmp/sakura-footer-frame-production.png、原始局部/tmp/sakura-footer-frame-detail-production.png，目視展板外框底邊與YouTube按鈕底邊一致。
- 本輪只修正手機限域的位移及說明，來源PNG、模板／script、桌面與資料庫不改。自開本機server已停止、viewport已還原；未驗實體裝置或Safari／Firefox。此次校準以目前展板外框為視覺基準，上一輪以手指末端宣稱已對齊的結論已由本節更正；正式紀錄只提交README，不為文件再部署。

## 2026-10-30 手機Footer圖示縮小與下緣對齊

- 依Footer截圖下午3.21.48，只在max-width:767px用scale:.9將數位展板視覺35→31.5px、YouTube40→36px（各縮小10%），保留原連結寬度與40px高度，不以縮小圖片排版框減少點擊範圍；來源、連結及金色服務列不變。768px以上原樣。
- 兩張512px PNG透明下緣分別29及180px，不能只對齊圖片框。維持原flex置中，依可見像素下界483／332換算YouTube位移8.62px，使縮小後可見下緣一致；覆寫原Tailwind的translate屬性，不疊加transform。建置、瀏覽器及正式驗收待續記。
- 最終pnpm build含typecheck通過。本機320／390／430／767px按真實修前基準比對，兩圖示實際rect寬高均90%，下緣誤差0.001953125px，原連結寬高與金色服務列不變、無整頁橫向溢位。320px原flex會將連結寬度收縮至29.296875／33.4765625px，驗收對原實測寬度而非誤假設所有尺寸皆35／40px；不藉本輪改動原佈局。768／1024／1280／1920px Footer容器與兩連結／圖示共6節點座標、尺寸、間距、位移及來源逐項比對修前正式站，差異0。390px實際按End到Footer目視白色圖示下緣對齊，原Logo／回頂／金底服務保留。
- e44d0817已發布，Vercel dpl_BsYDnjRtnruiFp9YvtXLg3g2jfAe為READY／Production／GitHub成功，兩個既有正式網域皆接上。主網域四種手機寬度複驗90%尺寸、可見下緣誤差0.001953125px、點擊範圍與金底服務均保留；768／1024／1280／1920px六節點對修前差異0。1024px既有resize對位尚未完成的中途讀取不計通過，待原動態定位完成後逐尺寸核對，不修改原對位機制。另一網域390px同尺寸與下緣複驗通過。
- 正式首頁390px捲至Footer目視並保存/tmp/sakura-footer-icons-aligned-production.png。來源PNG未改、模板／script不變、只增加手機限域CSS；本輪無CMS／資料庫／業務表單寫入。自開本機server停止、viewport已還原；未驗實體手機與Safari／Firefox，對透明留白的校準適用目前兩張已發布PNG。正式紀錄只提交README，不為文件再部署。

## 2026-10-30 手機底部服務列金底白字

- 依Footer截圖下午3.21.27，僅max-width:767px將共用底部到府丈量／線上客服／拍立配背景改為既有設計案例金色#B79258；外層安全區與按鈕列同色，文字及圖示沿用白色、白色分隔線保留。所有使用共用服務列的手機頁面一致套用，桌面灰底右側列與Footer原圖／Logo動畫不改。
- 到府丈量SVG內有覆蓋舊文字的灰底矩形，僅改容器會留下灰塊。新增同圖形的手機版SVG，只將該矩形改為同金色，透過picture的max-width:767px來源切換；768px以上沿用原圖。其餘白字／圖示不改，不修改CMS／資料庫、服務連結或高度；建置、手機及桌面邊界與正式驗收待續記。
- 最終pnpm build含typecheck通過；本機首頁／建商／關於我們各320／390／430／767px共12組，外層與內層背景均rgb(183,146,88)、文字white、三連結與圖示完整載入、到府丈量currentSrc為手機圖、滿寬固定貼底且無整頁水平溢位。390px實際按End至Footer，目視金底白字及無圖示灰塊，原頁尾Logo與回頂保留。768／1024／1280／1920px逐項比對修前正式站服務列10節點位置、尺寸、內距、分隔線、背景、文字與圖片來源差異0；這四尺寸仍載入原圖與灰底。安全區延續既有env規則，本機Chromium inset為0，不宣稱已驗實體iOS底部安全區。
- 3aae8930已發布；Vercel dpl_97gcpzSed115ccNKx8tthUzq73Bk為READY／Production／GitHub成功，兩個既有正式網域均接上。主網域相同12組手機頁面複驗通過，另一網域390px同樣金底白字、三圖完整載入、服務連結及72px貼底保留；主網域768／1024／1280／1920px逐節點對修前基準差異0。首次頁面服務列尚未載入及切換picture來源未完成的中途讀取未計通過，待可見且圖示載入後重驗；不修改原載入流程。
- 正式首頁390px按End至Footer目視確認，證據/tmp/sakura-mobile-gold-footer-production.png：底欄與圖檔底色一致、白字白圖與分隔線保留，頁尾Logo及回頂未變。只進行正常已發布頁面讀取，無資料庫更新／業務POST；自開本機server已停止、viewport已還原。未驗實體iOS安全區及Safari／Firefox，本輪為Chromium；正式紀錄只提交本README，不為文件再部署。

## 2026-10-30 手機漢堡移除重複總覽

- 依截圖下午3.21.20，只在lg:hidden漢堡選單排除父路徑/franchising/intro及/builders自動生成的總覽連結，移除「我要加盟總覽」與「建商專區總覽」。保留原加盟介紹／優勢／流程／Q&A、額外申請與下載箭頭，以及建商專區首頁／SAKURA KITCHEN／型錄；優惠消息總覽不變。
- 桌面模板、CSS、CMS與資料庫不改；建置、範圍比對及正式畫面結果待續記。
- pnpm build含typecheck通過；執行實際v-if條件確認只排除兩個指定父路徑，/news總覽仍保留。相對修前桌面nav、整段script與CSS逐字一致。本機正式建置320／390／430／767／1023px，實際展開加盟與建商選單、額外申請／下載箭頭，兩列總覽不存在、其餘子入口完整、Header及整頁scrollWidth皆等於viewport。390px另實際確認優惠消息總覽保留、品牌系列第二層完整十項；應用內瀏覽器以新暫時分頁恢復連線，補上上一輪未完成的窄手機操作檢查。
- 修前正式站與修後本機1024／1280／1920px，各71個主導覽節點實際比對位置、尺寸、字級、行高與色彩差異0。本機check-site-header.mjs原觸控／鍵盤／頁尾回歸及唯讀目的頁檢查通過。8389cc5f已發布，Vercel dpl_CYNa8D6AUhEAjp42PgZ7e7XjonE8為READY／Production，兩個既有正式網域均查得指向此部署。
- 正式主網域五種相同RWD寬度逐一實際開啟兩組選單及額外加盟入口，兩列總覽均不存在、其餘入口完整、無Header或整頁橫向溢位；390px目視與截圖/tmp/sakura-mobile-franchise-no-overview-production.png及/tmp/sakura-mobile-builders-no-overview-production.png。另一正式網域390px正常預覽登入後複驗兩列刪除與優惠消息總覽保留通過。首次正式頁互動尚未載入完成的點擊未計通過，待畫面互動可用後重驗，不修改原載入機制。
- 本輪未寫CMS／資料庫或送出業務表單，只有既有預覽登入。暫時viewport已還原、自開本機server停止；本輪未重驗實體手機／Safari，五寬度為Chromium操作驗收。正式紀錄只提交本README，不為文件再次部署。

## 2026-10-30 手機漢堡品牌系列第二層

- 依截圖2026-10-30下午3.21.08及後續僅調整RWD要求，只改lg:hidden漢堡內容：原12px品牌系列小字及常駐十系列改為14px（text-sm，與設計靈感一致）的第二層展開按鈕，保留原金色。點擊才顯示完整十系列中英文，箭頭與aria-expanded同步，aria-controls對應獨立內容區。
- 切換第一層或關閉漢堡時重設品牌系列為收起；既有設計靈感／廚房裝修指南／型錄等同層入口維持可見。桌面mega-menu、CSS、字級、照片及內容資料不改。pnpm build含typecheck及check-site-header.mjs通過；相對前一版桌面nav模板與CSS逐字一致。Safari本機HTTP無法保留正式建置的Secure登入Cookie，不改驗證設定，待HTTPS正式部署再做原生操作驗收。
- be53fa3cf91f9d3b090981b28aba73580f09735e已發布；Vercel dpl_BkYxRoZAdpCjjigcyQMWmhYxagYP為READY／Production／GitHub成功，sakura-demo-vanlantech.com與header-design-two.vercel.app皆已接上。兩網域check-site-header.mjs正常預覽登入、Header／Footer及目的頁唯讀回歸通過。另直接執行實際Vue watcher，確認主分類切換與漢堡關閉重設第二層，原主分類記憶保留。
- 正式主網域iPad Safari模擬器直向實際輕點：設計案例開啟後品牌系列初始收起、字級同設計靈感；展開完整十系列中英文，再點收起，其他同層入口維持可見。關閉漢堡再開及切換廚房產品後回設計案例均恢復第二層收起。正式圖/tmp/sakura-mobile-series-production-collapsed.png與/tmp/sakura-mobile-series-production-expanded.png。橫向再輕點主導覽，放開後保持展開並可再點收起，證據/tmp/sakura-ipad-safari-final-production.png。
- 本輪沒有修改CMS／資料庫、套件或桌面樣式；自開本機server已停止、暫時viewport已reset、只關閉Sakura iPad Nav QA視窗，既有ReviewTest模擬器保留。QA裝置使用既有官方iOS26.5 runtime且保留可重開。應用內瀏覽器分頁連線無法恢復，因此新第二層未補做390px Chromium實際畫面；原生操作證據來自iPad模擬器直向RWD及橫向，未宣稱實體iPad／iPhone或全瀏覽器通過。正式驗收紀錄只提交本README，不為文件重部署。

## 2026-10-30 iPad 主導覽輕點展開

- e5d33523658c7e0ac923a86e24fe5f52f7055c95已發布；Vercel dpl_5dVkuYTcwdQQmcWYeuR6L15nuSYR為READY／Production，兩個既有正式網域均接上。後續以既有Xcode iOS26.5 runtime建立Sakura iPad Nav QA模擬器（11吋iPad Pro），Safari正式站實際60ms輕點設計案例箭頭，放開後保持展開，再點可收起；品牌承諾、廚房產品及外部點擊收合亦確認。這補上先前無Safari觸控證據的限制，仍不是實體iPad驗收。證據/tmp/sakura-ipad-safari-design-production.png及/tmp/sakura-ipad-safari-brand-production.png。
- 依截圖2026-10-30下午3.21.00，iPad寬版主導覽輕點後下拉跳開、長按才持續出現。直接執行原SiteHeader事件函式重現：touch pointerleave也排入160ms關閉計時，手指放開後即收起；原scroll監聽也會無條件關閉。
- 共用Header按實際pointerType區分操作：只有滑鼠pointerenter／leave使用hover開關；觸控／筆尖箭頭以輕點開啟、再點收起，切換其他主選單會替換，外部pointerdown與Escape／路由切換仍關閉。觸控展開不因放開或意外頁面捲動消失，鍵盤focus只在鍵盤模式開啟；保留滑鼠hover／160ms移出延遲、原連結、選單版型與手機手風琴。
- 新增外部事件監聽與既有scroll一起在卸載時移除，不改CMS／資料庫。事件序列回歸、建置及實際瀏覽器／正式驗收待續記；不以Chromium滑鼠點擊宣稱已驗實體iPad觸控。
- 沿用check-site-header.mjs，從實際Vue script AST取出既有狀態、事件函式及生命週期，新增touch／pen放開後保留、再點收起、左右切換、內外點擊、微捲動、滑鼠hover及原延遲、鍵盤focus／Escape與計時器／監聽清理回歸；不另複製一份選單邏輯或安裝測試套件。
- 鍵盤模式改由document原生keydown記錄，確保從頁面外首次Tab進入主導覽時也能正常焦點展開，不因觸控focus隔離而漏掉第一組；原Header重複監聽移除，新增document監聽同樣卸載清理。這不改任何版面／字級／手機標題規則。
- pnpm build含typecheck、實際事件函式／生命週期回歸與既有Header／Footer唯讀回歸通過。本機正式建置在1024／1194／1366／1920px逐一點七個主選單，28組展開／Escape與水平邊界正常；外部回頂按鈕關閉、內部關於我們導覽後關閉均通過。390／768／834／1023px手機手風琴原生畫面按鈕開啟／收起正常，保留原本關閉總選單後記住已展開分類的行為，檢查不假設每次都是初始收合。
- 最終建置另用真實Tab確認第一次進入即展開設計案例、Tab移入子連結保持展開、Escape關閉。390／768／834／1023／1024／1194／1366／1920px共8尺寸Header／Logo／主選單位置、寬高與字級逐項對正式舊版，差異0。Cua僅支援尺寸與滑鼠／鍵盤，touch／pen來自實際函式事件序列回歸，不宣稱已操作實體iPad／Safari。正式發布待續記。

## 2026-10-28 手機大標按語言分組

- 依IMG_2809.JPG及使用者確認，手機改為中文集中在上方、英文集中在下方；長英文可自然換行，保留可讀字級，Explore Our保留獨立眉標。範圍為既有16組bilingual-heading-lead大標，含首頁、品牌系列、關於我們、品牌優勢通路／FAQ、門市、加盟、建商聯絡、知識及服務指南；不修改文章內文、商品名稱、CMS或資料庫。
- 原英文只加display:contents包裹，維持桌面文字順序、原換行、字級與局部金色；手機共用flex順序將第二段中文移到第一段旁，英文移到全部中文之後，避免四行中英交錯。多段中文僅手機用20–28px流動字級保留單行空間，英文不強制縮成單行；原桌面行框與樣式必須實際比對。建置、手機五尺寸、桌面及正式結果待續記。
- 同步既有來源回歸：保留16組眉標／中文範圍、原大小寫／局部金色與桌面換行斷言，新增英文完整標記及桌面無行框檢查；手機英文隱藏br前保留空白避免That／Designs等詞黏在前字。首頁Smart Appliances原100%寬只在手機取消，讓整段英文自然換行，不改768px以上原規則。
- 第一輪36模板桌面尺寸／字級／色彩及24組邊界樣式皆一致，但SSR來源回歸抓到Vue把新英文span前的原空白裁掉；補上原本已存在的顯式空白，不只靠總寬高宣稱桌面零差異。後續加驗原有中文／眉標／金色片段相對h2的實際位置，避免少一個空白造成桌面字詞位移。
- 最終pnpm build含typecheck通過；既有check-kitchen-series.mjs通過10系列SSR／404／215圖片／圖文配對／動畫／鍵盤回歸。13個來源檔的16組標題、20段英文與4段第二中文已檢查：原文字／大小寫／DOM順序不變、未複製內容；9項已更新來源斷言通過。未執行含業務POST的整份check-frontend-regressions.mjs。
- 本機65網址×320／390／402／430／767px共325組，實際涵蓋16種同款大標：中文同列且在所有英文上方，眉標在中文上方，中英文實際文字框相對標題中心誤差小於2px、無超欄文字或整頁橫向溢位；英文原30／34px不變。度量函式在瀏覽器支援範圍內直接讀DOM，未注入樣式或操作私有router；中途不支援parseFloat的失敗呼叫不計結果，修正後重跑。
- 36公開模板1280px標題與父層字級／色彩／尺寸比對無差異；最後補回原空白後，12相關頁×768／1280／1920px再對可見眉標／中文／既有金色片段做相對h2座標檢查，共36組誤差小於0.1px。隱藏br沒有可見行框，排除其零尺寸座標，不以動畫時間差誤改原版。品牌歷程402px本機目視中文同一列、英文30px自然兩行，/tmp/sakura-language-about-local.png；正式發布待續記。
- 3fa94b4f7c2bea07801c285799ba7cf467e7afca已發布；Vercel dpl_7J5i9GGcyKgYGWQQzc2myzkBjXS5為READY／Production／GitHub成功，兩個既有正式網域均接上本版。正式主網域65網址×320／402／767px共195組完成，16種同款大標均涵蓋：中文單列、所有英文在中文下方、眉標在中文上方，中英文實際框中心與標題中心誤差小於2px，無整頁溢位或字欄裁切。原生動畫保留，未注入CSS或改私有路由。
- 正式12個相關頁面1280px的可見文字片段位置再對修前基準，皆一致；原始碼回歸另只抽執行全站共用雙語段落（含16組完整性與桌面18／40／50px層級），無業務POST。品牌歷程402px英文30px自然兩行、兩段中文在同列，正式圖/tmp/sakura-language-about-production.png；另一網域品牌通路同樣同列中文與在後英文，正式圖/tmp/sakura-language-brand-store-production.png。最近10分鐘最多5筆error查詢無回傳，非持續監控。
- 本輪沒有寫CMS／資料庫、修改文案／商品名、增套件或改桌面規則；僅正常預覽登入POST及已發布內容讀取。自開preview停止、viewport還原，交付品牌歷程正式連結保留。未驗實體iPhone／Safari／Firefox或自訂超長CMS文案；中文單列依目前16組已發布文字驗證，未來更長中文仍應保持可讀並換行，不用裁切或無上限縮字硬塞。正式紀錄只提交本README，不為文件再部署。

## 2026-10-28 手機雙語標題置中補查

- IMG_2803.JPG再次指出推薦案例文字偏左，上一輪「不溢位」與標題框中心檢查不足，不能代表所有字行都置中。正式同網域重新開啟系列頁，402px推薦案例框x15／寬372／文字text-align:center；與截圖仍有不同，未將原因直接歸咎使用者快取，也未宣稱已驗iPhone。
- 重新逐一檢查65個公開網址的h1／h2文字對齊，涵蓋全部36種頁型；另保存真正按template去重的36頁型桌面1280px基準，不沿用上一輪36個網址當36頁型。發現知識延伸區calc(100% - 108px)且靠左、加盟雙語標題與建商聯絡標題仍繼承start、型錄指南仍繼承left，與只檢查對稱padding不同。
- 僅max-width:767px統一現有bilingual-heading-lead標題滿欄／文字置中／左右padding0；保留原字級、行高、斷行與動畫。知識文章共用延伸區改為左右15px並置中小標／標題／CTA，型錄指南文字置中，加盟消息眉標以auto置中。文章內文、產品資料、表單與桌面規則不改。建置、手機實際目視與正式發布結果待續記。
- 本機第一批五尺寸另抓到型錄指南在767px仍被max-width:732px及justify-self:start限制，剩5px欄寬造成中心偏左2.5px；手機補justify-self:center。原有自動進場的短暫位移不以offsetParent虛擬座標誤差修改動畫，文字對齊、內距、實際寬度與穩定後畫面分開核對。
- pnpm build含typecheck通過；全部36種公開模板1280×900標題與父層樣式修前／修後完全一致，12個相關頁面再驗768×1024及1920×1080共24組也無差異。兩個不同分頁尺寸不等的中途嘗試未計入，正式比對使用同一分頁切換新舊來源並斷言實際viewport。
- 本機65網址×320／390／402／430／767px共325組雙語／延伸／型錄標題檢查完成：文字center、左右內距相等、無文字欄裁切與整頁溢位；最後一筆型錄對齊修正再建置後，型錄及品牌館各五尺寸中心誤差0。品牌館原本用translateX(-50%)定位，不能把結構性transform當成進場動畫扣除；更正量測後同樣中心誤差0。知識延伸實際捲動目視小標、標題、CTA置中，截圖/tmp/sakura-heading-knowledge-local.png；不把原有段落／表單／商品資訊靠左當成錯誤強制修改。
- 92505be77b86a6b371abb1fe085f955fcf5fa5ba已發布，Vercel dpl_D937esnz8nQXfM8CeQC2Gxpuq6Ng為READY／Production／GitHub成功，兩個既有正式網域皆已接上。使用者的header-design-two.vercel.app實際65網址×320／402／767px共195組手機標題複驗完成，文字center、左右padding對稱、無超欄裁字與整頁橫向溢位；未把中途預覽登入頁計入，正常重新登入後續驗。
- 正式品牌館另以真實rect重驗三尺寸中心160／201／383.5，誤差0；自動中心候選曾誤將結構性平移扣除，保留原始候選JSON、不把誤報當成版面修正。主網域型錄指南三尺寸中心同樣160／201／383.5；知識延伸進場完成後中心201、欄寬342。推薦案例402px中心201、左右padding0、原底部三服務保留，實際捲動目視標籤／中英文層級與換行，證據/tmp/sakura-heading-recommended-production.png；知識延伸證據/tmp/sakura-heading-knowledge-production.png。
- 既有check-kitchen-series.mjs於本機正式建置通過10系列SSR／404／215圖片來源／原圖文配對、動畫及鍵盤回歸，僅預覽登入POST與已發布資料GET，沒有內容更新。最終部署最近10分鐘最多5筆error查詢無回傳，不代表長期監控。自開preview停止、尺寸還原；不新增套件、不寫CMS／資料庫、不改桌面樣式。未驗實體iPhone／Safari／Firefox，不以Chromium通過宣稱實機已通過；截圖與新開正式頁不同的載入狀態尚無裝置端證據，因此交付連結附一般版本查詢參數方便直接開啟本輪檢查頁，未新增強制重新整理或變更快取／驗證機制。正式後只提交本README紀錄，不為文件再部署。

## 2026-10-28 更新預覽登入密碼

- 依需求將網站預覽入口預設密碼改為指定的新值；沿用伺服器驗證與 3 小時有效期限。舊密碼簽發的預覽權杖失效，訪客須重新登入；管理後台帳號與資料庫不變。
- 使用者已授權發布至正式環境；已確認既有 `header-design` 專案、`main` 分支與兩個正式網域，Production 未設定 `NUXT_PREVIEW_PASSWORD`，會使用本次程式預設值。沿用 Git 發布，部署及線上驗證結果於下方續記。
- 型別檢查與既有預覽登入回歸通過；直接執行實際登入處理器確認新密碼成功、舊密碼 401、非法輸入 400、舊權杖失效及 Cookie 安全屬性與 3 小時期限。開發伺服器因 `EMFILE: too many open files, watch` 無法維持啟動，未完成真實 HTTP／瀏覽器驗收；未重跑正式建置。
- 已發布提交 `6ab47572d4b9fc10c5ab582e6741188666497248`；首次 Git 建置停在套件下載，重試無快取建置成功，正式部署 `dpl_EUgoxhWTmf4khNcTiLAjU8QjSgaA` 為 READY，兩個既有正式網域皆已接上；停滯的首次建置已取消。
- 正式瀏覽器實際輸入指定密碼並按「進入網站」，成功抵達 `https://sakura-demo-vanlantech.com/`，標題為「SAKURA Kitchen｜櫻花整體廚房」、主標為 AI Kitchen，登入輸入框已不存在。兩個正式網域逐一驗證新密碼登入 200／首頁 200、舊密碼 401 且含完整錯誤、舊密碼簽發權杖 302 導回登入頁；Cookie 維持 3 小時、Secure／HttpOnly。未改 CMS／資料庫，未重掃全站或驗實體手機；驗收紀錄僅本 README，不為文件再觸發部署。


- 已發布 `ac11e444a4fadffbe5cb43ccc1b95c898a7039f5`，正式 Vercel `dpl_aW3hbhg9NG7jdNVZMNFuPcrysSQn` READY。以既有 `CMS_NAMES_PRODUCTION=1` 名稱檢查唯讀正式Azure資料：48入口名稱／位置完整，文件與版本指紋前後相同；10個設計入口依新排序為1個品牌系列、4個設計靈感、4個裝修指南（含系統櫃專題）、1個品牌型錄。結果 `/tmp/sakura-cms-design-order-production.log`。
- 正式瀏覽器提案驗證完成，CMS工作階段已到期，目前停在 `/admin/login`；已請使用者直接登入，未新建／重設帳號或繞過授權。登入後實際卡片、搜尋／篩選、返回列表及尺寸操作尚未驗證，不能以唯讀資料檢查當作畫面通過。未改網站內容或資料庫；文件驗收另提交，不為文件再發布。

## 2026-10-28 移除後台頂部橫列

- 移除截圖中包含選單鈕、重複頁名與「網站管理」的整條48px橫列；全後台內容直接從頁面上方開始。桌機收合／展開移到側欄品牌旁，收合後仍可操作；手機選單鈕放在內容右上方，不另保留一條頂列。
- 保留原側欄自動收合、44px按鈕、選單對話框與焦點處理；預覽停留位置同步從60px改為12px。清理已移除橫列的樣式、名稱計算與動效目標，沿用既有動效回歸。登入、內容與資料庫不改。
- 型別檢查、正式建置、側欄動效回歸、既有互動腳本語法及diff檢查通過。正式1512px調整前橫列48px、主標題top64px；畫面發布與操作驗證待續記。

## 2026-10-28 全站手機置中與舊右側避讓清理

- 依IMG_2802.JPG，手機底部服務列已取代舊右側按鈕，但首頁品牌承諾仍留72px右內距，整組實際偏左36px。沿用QA與Ponytail，盤點全部36個公開模板、65個不同內容網址；手機已逐頁重現品牌／FAQ／服務流程／知識／型錄／門市／產品介紹／系列推薦等同類問題，未用單一首頁修正冒充全站完成。
- 只移除767px以下的舊72／78／86／93px側欄預留，內頁共用86px規則限制於768px以上；首頁門市、服務文案與Footer以響應式class恢復手機左右對稱，768px以上保留原值。文章與表單維持原閱讀對齊，未把全站文字強制置中；輪播卡內箭頭與文案的合理留白另外核對，不一律刪掉。
- 修前手機390×844的65頁與36模板清單已核對真實path／viewport／標題，原整頁溢位0但多處中心偏移；截圖/tmp/sakura-mobile-centering-before.png。修前桌面版基準採既有production產物，瀏覽器保存36個網址的尺寸／內外距／字級／對齊；不寫CMS／資料庫或送出業務表單，文件只維護本README。
- 舊前台回歸仍要求手機保留右側服務列避讓，已依本次明確需求同步五組預期；桌面字級、文案、PDF與原導覽等斷言保留。手機服務列已改在底部，原避讓斷言不能再作為正確版面的依據；本輪不執行該大檔其他業務POST。
- pnpm build含typecheck與五組新舊預期檢查通過。修後65頁×320／390／430／640／767px共325組實際瀏覽器留白／橫向溢位／文字欄寬檢查完成，整頁溢位0、實際scrollWidth超欄裁字0；排除進場動畫暫時位移，不以中途getBoundingClientRect誤差改動動畫。保留加盟人物卡內為箭頭預留的36px，這不是整頁右側避讓。
- 桌面實際基準為36個網址1280×900、其中13個網址768×1024與1920×1080，修前／修後62組逐元素比對width／height／padding／margin／字級／行高／對齊／grid／gap，差異0。這36個網址不是全部36種模板，不能將同名數量當作模板覆蓋；AI系列及品牌產品共用元件另以原始碼確認所有差異僅落於max-width:767px。基準與結果存/tmp/sakura-mobile-centering-desktop-before.json及同前綴desktop-after.json；沒有改動768px以上原版面。
- 首頁390×844實際目視標題中心x195等於viewport中心195（原偏左36px），左右內距0／0，原底部三服務保留。副標完整放寬後末字成孤行，僅手機新增既有CSS平台text-wrap:balance平衡兩行，字體與字級不變；此項再建置後重驗首頁五寬度，不重掃未改動的其他頁。正式與互動驗收待續記。
- 最後平衡換行再建置含typecheck通過；首頁五手機寬度及768／1280／1920px重驗，手機balance、桌面原wrap，原30／42px字級行高保留，無裁字或溢位。實際展開／收合手機Footer網站地圖，左右15px、兩欄各168px、連結無裁字；底部服務列390×72px且在y772–844。品牌優勢內文區另目視完整360px欄寬與置中標題；文章正文維持原閱讀對齊。
- 本輪本機preview使用既有Azure runtime唯讀已發布資料，範圍為全部36公開模板的65個內容代表（包含全部十品牌系列、九新聞、三門市故事、三品牌父／葉／詳情與舊網址）；不是重新逐筆掃1119個資料網址。不送出業務表單、不寫CMS／DB，不改後台或其他頁面功能。
- 第一版5193b428已READY；正式複驗另重現MOBILE-CENTER-002：/knowledge在767px時標題繼承桌面justify-self:start，block標題仍縮為435px且x15，中心232.3偏離畫面383.5。這不是舊右側padding，留白掃描不能代替中心檢查。僅手機標題補width:100%，續查其餘正式模板後再發布，不動桌面規則。
- 首版正式已完成65頁×320／390／767px共195組，舊右側避讓與實際裁字皆0；唯一持續的中心偏移為上述知識列表。追加一行手機width:100%後再建置含typecheck通過，本機320／390／430／640／767px標題中心各為160／195／215／320／383.5，等於viewport中心；768／1280／1920px既有桌面基準逐欄比對仍無差異。Header／Footer唯讀回歸在正式主網域通過，原Logo動畫與導覽保留；預覽驗證失效時未把登入頁計入結果，正常重新登入後重跑。
- 最終程式4644143262f83d5683fad926930ff64b09ae9059已發布；Vercel dpl_ABiuVWvUyPcnRMrDbHh2Ny5UREyV為READY／Production，sakura-demo-vanlantech.com與header-design-two.vercel.app皆指向此版。正式知識列表再驗320／390／430／640／767px中心分別160／195／215／320／383.5，768／1280／1920px與修前桌面基準一致；195組是首版全站結果，最後僅追加知識頁及受影響區域複驗，未把它寫成重新全站195組。
- 最終正式11個有相同1280px修前基準的受影響頁面比對無差異；型錄首次讀取遇到媒體尚未載入，待實際載入後重讀一致。兩個正式網域首頁390px品牌承諾中心皆x195、左右padding皆0、無橫向溢位，底部三服務保留；使用者截圖網域的實際目視結果為/tmp/sakura-mobile-centering-production.png。補跑該網域既有Header／Footer導覽及目的頁回歸通過，預覽登入使用目前專案設定，未改驗證邏輯；最終部署最近10分鐘、最多5筆error查詢無回傳錯誤，非持續監控。
- 本輪不寫CMS／資料庫、不送出業務表單；只有既有預覽登入POST。所有自開本機preview已停止、viewport還原。未驗實體iPhone／Safari／Firefox、瀏覽器文字放大及尚未抽樣的每筆資料網址；手機五寬度為Chromium瀏覽器驗收，不宣稱等同實機全瀏覽器驗收。正式紀錄只提交本README，不為文件再次部署。

## 2026-10-28 品牌背景招牌對齊小標籤

- 使用者確認上一版照片右移過多，要求圖片中的SAKURA在OUR COMMITMENT小標籤位置。改以原圖招牌左緣146／500及1770px版心左緣作定位基準，CSS抵消半欄cover的百分比偏移；不再固定35%而隨欄寬漂移。保留垂直安全區、85px最大行高、導覽80px間距、原CMS素材與手機單欄，不改資料庫。
- 沿用frontend-design與Ponytail，限縮共用Hero CSS與既有回歸，不新增套件或JavaScript量測。回歸新增招牌／標籤左緣誤差小於0.01px的幾何斷言，瀏覽器與正式驗收待續記。
- 實際量測將查詢容器設於滿寬Hero，避開intro左右內距造成8.76px偏移；不改原版心、文案欄寬或手機padding。以瀏覽器computed定位與小標籤實際座標核對，不能只用抽象幾何模型宣稱通過。
- pnpm build含typecheck、既有品牌Hero來源／18組原圖幾何／SSR及導覽回歸通過。實際瀏覽器16尺寸（3840至320px，含1280／844×390短窗）核對computed背景偏移、cover縮放後招牌原圖座標與標籤實際座標；桌面誤差小於0.1px，1440px兩者皆x30、1920px皆x75、2560px皆x395、3840px皆x1035，無橫向溢位、標題裁字或導覽覆蓋。1440×900已目視招牌在小標籤正上方；平板手機沿用隱藏照片的原單欄。
- 已發布9349c5d1105d04921213032f5cdf68363ada8252，Vercel dpl_HZP3B4AekMYmcaNjzXmbCDZUsHMa為READY／Production／GitHub成功，兩個既有正式網域已接上此版。正式瀏覽器同16尺寸複驗通過，各桌面實際computed偏移換算招牌左緣與標籤座標誤差小於0.1px；1440×900交付圖/tmp/sakura-brand-logo-label-production.png已目視確認，85px最大行高、原導覽與右欄保留。
- 預覽server停止、viewport還原，未寫CMS／資料庫或執行業務POST；未驗Safari／Firefox及實體裝置，也未驗更換背景圖後的招牌位置，原圖座標校準只適用承德店這張素材。正式後紀錄只提交文件，不為文件再部署。


- 已發布 `5700aa5e3d178138e6bc677ab3d6411f1841e1cb`，正式 `dpl_CoJyGsW2kTYYrG2X5adZeuKE86FV` READY。Chrome圖片庫DOM確認頂列節點為0、同1512px寬主標題top64→16px，無空白占位；實際點側欄收合／展開及主內容自動收合通過。
- 實際1440／1024／768／390px均無根頁水平溢出；390px選單44px可開啟「管理選單」，關閉後焦點返回原按鈕。已清除viewport覆寫並回到原圖片庫；截圖 `/tmp/sakura-cms-no-topbar-final-20261028.png`（上方330px）、調整前 `/tmp/sakura-cms-topbar-before-20261028.png`。
- 建商編輯頁亦無頂列、預覽sticky top為12px、既有內容與儲存停用狀態保留；但新開編輯頁及按重新載入後仍顯示「官網畫面無法載入，請確認網路後重試」，不列為預覽通過，本輪不將其歸因於橫列移除，亦未修復此問題。未輸入或儲存內容、未改資料庫、未驗Safari／Firefox／實體手機或全部後台入口。

## 2026-10-27 編輯頁頂部合併

- 依15:28截圖修正頂端結構：返回、唯一頁面標題、區塊切換與查看官網集中成同一桌機列，刪除重複顯示的路徑名稱；表單與預覽直接接在下方並頂端對齊，不再將區塊切換獨占左側一層。
- 返回連結沿用原 returnLink 與既有 selector，仍保留搜尋／頁碼；區塊切換移出 disabled fieldset 後明確沿用 busy 停用，儲存／發布／預覽流程不改。1199px以下讓區塊切換換列，600px以下長標題獨立一列，保留44px點選範圍與完整名稱。
- 僅共用編輯元件、後台限域CSS及README；型別檢查、正式建置、預覽狀態與側欄動效回歸、互動腳本語法及 diff 檢查通過；正式發布與畫面高度驗證待續記。


- 已發布 `d2f3ac03e9f8e47ff21a9c39beab79cc4bae5f6d`，正式 Vercel `dpl_6KUFiPJVjRb8jvr1rEfcHLNXZpBS` READY。正式 Chrome 1440×900確認所有頂部控制同列，Computed height=44px、下距8px，左右表單／預覽上緣一致，預覽完成套用且儲存停用。對照前 `/tmp/sakura-cms-heading-before-20261027.png`，調整後 `/tmp/sakura-cms-heading-1440-after-20261027.png`。
- 實際檢查1024／768／390×900：依寬度換列，長標題、完整按鈕與固定操作列均保留，目視未見水平溢出；同前綴1024／768／390截圖留存。桌機實際點選「介紹與合作資訊」切到 data-builders，再用頂部返回回到 section=builders 列表，最後恢復建商編輯頁與正常桌機。未輸入／儲存／發布內容，沒有修改資料庫。
- 本輪未重驗全部編輯入口、Safari／Firefox、實體手機或完整業務流程；有待儲存內容時仍應先保留再重整。驗收文件另提交，不為文件再發布。

## 2026-10-27 後台空間利用調整

- 共用後台取消內容最大寬度，縮減外框、標題、表單與清單間距；清單列移除重複的外層 padding，縮圖同步收斂到實際 60px 寬。桌機編輯／預覽比例為 1.1：1，窄螢幕維持修改／效果切換。
- 短文字輸入框依內容自動長高，保留原多行輸入與換行；長文超過 240px 可捲動及手動拉高，不支援 field-sizing 的瀏覽器沿用原兩行框。按鈕與輸入保留至少 44px 高，手機輸入維持 16px 字級。
- 頂列 52→48px、固定操作列 76→64px、首頁卡片縮減圖片與內距；沿用黑金白與既有字體，不改官網、資料、API、登入或側欄動效。調整前正式截圖 `/tmp/sakura-cms-density-before-20261027.png`；型別檢查、最終正式建置、既有側欄動效回歸及 diff 檢查通過；畫面驗證待續記。


- 已發布 `b175b39f576bd9d1bf7d14aa625515317d136ceb`，正式 `dpl_F1DWxTe7HjQrwBgNuUtEf9q6ff4h` READY。正式 Chrome DevTools 1440×900 實測同一首列高度 89→61px、外層 padding 12→0；短文字框 field-sizing=content、高度與最小高度均 44px，14px 字級保留。
- 實際檢查 1440／1024／768／390×900：桌機雙欄，1024 使用內容／效果切換，768 以下導覽收合；長標題、清單、固定操作列皆完整，目視未見水平溢出。390px 以實際點選切到效果並完成套用，再恢復桌機。沒有輸入、儲存或更新內容資料；尚未儲存判斷與預覽正常。截圖 `/tmp/sakura-cms-density-1440-before-20261027.png`、`/tmp/sakura-cms-density-1440-after-20261027.png`，另有同前綴 1024／768／390 檢查畫面。
- 本輪未驗 Safari／Firefox／實體手機、全部管理入口或長文實際輸入；不支援 field-sizing 時保留原兩行輸入，不宣稱自動縮高。DevTools 關閉並恢復正常桌機，文件驗收另提交，不為文件再發布。

## 2026-10-27 建商頁預覽與發布版本修正

- 正式 Chrome 重現預覽載入錯誤；Console 出現多個 `/_nuxt/*.js` 404，瀏覽器 `__vdpl` 仍固定在較舊發布版本。僅清除此版本紀錄後，同一建商頁可載入並回報「目前輸入的效果」，提案與 CMS 登入保留。
- Nitro 明確停用自動文件版本固定，既有共用入口只在收到 `__vdpl` 時將它到期；不清理登入、不修改內容或資料庫。已開著的舊頁仍需重新整理才能載入新版程式。
- `check-preview-access.mjs` 補實際 config／middleware 回歸：啟用 Vercel 環境時仍不固定文件版本；後台、預覽、API、密碼頁僅清版本紀錄；未授權 API 仍為 401，無版本紀錄不重寫 Cookie。舊程式先失敗，修正後含登入逾時／重試的全檢查通過。型別檢查、正式建置、預覽狀態全回歸通過；另以 Vercel preset 與啟用版本保護的環境建置，實際 output/config.json 確認不再產生固定版本的 Set-Cookie 路由。

# SAKURA Kitchen — Nuxt 3 品牌網站

- 已發布 `55a746a4e57b33522a5134a9dceef58737561cd3`，正式 Vercel `dpl_EaNCrBBeVYSsfDSStwCRnGjPfJFM` READY。依平台支援的版本分界將 `skewProtectionBoundaryAt` 設為此版建立時間 `1793084822796`，舊版固定請求改回目前發布；原 `skewProtectionMaxAge=43200` 保留，未調整登入保護。
- 正式 HTTP 以無版本紀錄及舊 `dpl_ETMo…` 紀錄各驗一次：200、各 20 個程式檔全為 200；新訪客不建立版本 Cookie，帶舊紀錄時伺服器回覆到期，未重寫 CMS 工作階段。
- 正式 Chrome 重新整理建商編輯頁，原登入保留；將主視覺標題暫加「【預覽檢查】」，右側實際標題同步並完成套用，再還原原文，儲存恢復停用且顯示官網已更新，未儲存／發布測試內容。成功狀態截圖 `/tmp/sakura-cms-builders-preview-fixed-20261027.png`，還原後 `/tmp/sakura-cms-builders-preview-restored-20261027.png`。首頁品牌系列入口亦完成預覽載入。主控台未見 Nuxt 程式檔 404 或 hydration 錯誤；仍有 Chrome 擴充功能 runtime.lastError 及翻譯訊息。
- 本輪限預覽發布版本問題，未逐一重驗全部入口、其他瀏覽器／手機或完整業務流程。已開著的舊分頁需重新整理；有未儲存輸入時應先保留再重整。文件驗收紀錄另提交，不為文件再觸發發布。

## 2026-10-27 品牌優勢Hero行距與招牌裁切

- 依14:02:53截圖（內容實際為/about/advantage品牌優勢），保留已確認的三行字級與文案；桌面80px字體行高由96px收為85px，依欄寬縮放時同行比例；手機原1.2行高保留。三項導覽上方留白由140px改80px，避免放大字後導覽過低。
- 承德店原背景圖由center改35%水平定位，照片右移保留左上SAKURA招牌；原垂直安全區、CMS素材、遮罩、右欄與進場動畫保留，不改圖片或資料庫。本輪使用frontend-design與Ponytail限縮局部CSS及既有回歸，不新增套件／文件；瀏覽器與正式驗收待續記。
- 既有前台回歸同步85px行高／手機1.2、導覽80px及背景35%定位，補上原圖招牌左右緣幾何斷言；原PPT瀏覽器腳本只同步導覽間距預期，實際UI仍由本輪瀏覽器操作驗證。
- pnpm build含typecheck、既有品牌Hero來源／18組原圖安全區模型／SSR／三個導覽／原進場與減少動態回歸區段通過，未執行大檔其他業務POST。實際瀏覽器15尺寸（2560、1920、1512、1440、1366、1280、1100、1025、1024、768、767、390、320px及1280／844×390短橫窗）皆無水平溢位、標題裁字或導覽被大圖覆蓋；原圖招牌換算左右／上下邊界均在安全區。
- 本機1440×900目視完整招牌，80px標題行高85px、三行總高255px（原288），導覽top565（原658），包含行高縮短共上移93px；右圖與說明位置保留。1025×640最窄雙欄亦目視招牌、三行、導覽完整。僅以既有Azure runtime唯讀已發布內容，不改CMS或資料庫。
- 已發布d585b81b0f52ec30dd4e75dd9d22b9eae3fa1604，Vercel dpl_H7zaUittxge2bH2GYBuapA1kaJnr為READY／Production／GitHub成功，兩個正式網域已對應此版；正式瀏覽器同15尺寸複驗通過，各尺寸確認實際載入35%背景定位，1440px實測80／85px及導覽top565。正式1440×900交付畫面/tmp/sakura-brand-hero-spacing-production.png已目視完整招牌與三行／導覽。
- 最近10分鐘有界error查詢未回傳紀錄，未查長期監控。未驗Safari／Firefox、實體裝置或另換CMS背景素材的招牌位置；未重掃全站，亦未執行PPT腳本其他互動或前台回歸的業務POST。預覽server停止、viewport還原；正式驗收紀錄只提交文件，不再為文件部署。

## 2026-10-27 側欄平順收合

- 依「縮放好卡、動態一點」調整側欄背景滑動、選單文字淡入，以及主內容／底部操作列的位置銜接，統一 240ms 緩出。使用既有 UI/UX Pro Max 的 transform／opacity、可中斷與減少動態原則；不新增套件。
- 版面只在切換時換一次尺寸，再以原生動畫銜接位置，避免每一格改 width／margin 反覆觸發表單與 iframe 重排。固定操作列分開移動，保留貼底；快速反向切換會從目前位置接續。側欄內限制水平溢出，避免展開中出現短暫捲軸。手機沿用原選單，減少動態時直接切換。
- 僅調整共用後台 layout、限域樣式與動效程式，不更動點主內容自動收合、內容輸入或資料儲存。`node nuxt-site/scripts/check-admin-sidebar-motion.mjs` 通過：僅 transform 動畫、底部列對齊、目前位置反向接續、減少動態、手機跳過、節點移除及離開清理；型別、正式建置、既有流程、互動腳本語法及 diff 檢查亦通過。已發布 `3eb563ab5b4681c91af676882606bec9fa837920`（包含 `4cf023de` 動效），Vercel `dpl_BkJTti9CryQp4skKYMsuMswAZvi4` READY。
- 正式 Chrome 在目前建商專區編輯頁驗證：手動展開、連續三次 Enter 反向切換、Tab 抵達文字欄位，再點欄位自動收合且焦點留在原欄位；內容仍為 Property Developers，儲存停用。展開 220px／收合可見 76px 的側欄、主內容及貼底操作列對齊，未見水平捲軸；畫面 `/tmp/sakura-cms-sidebar-motion-20261027.png`。側欄畫布保持 220px 並平移，幾何檢查改看可見右緣。
- 本輪未輸入、儲存或更新官網內容，亦未做真實幀率量測、全部尺寸或完整自動化瀏覽器流程；減少動態／手機分支以動效回歸檢查驗證。建商頁預覽仍顯示載入錯誤，不算預覽驗收通過，本輪未將其歸因於側欄動效。

## 2026-10-27 廚房產品補上系列選擇層

- 依14:00:04截圖，除油煙機分類先顯示八個系列的代表圖、名稱及實際產品數，選系列後才進入該系列產品列表；沿用展板分類API、排序與現有卡片，不寫死截圖數量、不更動或匯入資料庫。
- 共用ProductListPage有子分類時使用系列卡片，沒有子分類及全部產品頁維持原產品／搜尋／分頁；既有帶q搜尋網址仍顯示搜尋結果。父分類不再重複顯示下方系列跑馬燈，既有分類與舊版除油煙機網址共用同一邏輯；手機系列採兩欄，保留圖片錯誤、載入／API錯誤及重試。
- 本輪沿用frontend-design與Ponytail，限縮共用頁、既有回歸與本README；建置、系列到產品導覽、RWD及正式驗收待下方續記。
- 既有唯讀check-product-covers擴充三品牌父／葉分類分流、系列圖／數／網址、除油煙機八系列列表與舊網址、全部產品及搜尋；含匯入的check-products只同步原有斷言，不執行其資料庫寫入流程。
- 原正式建置在新增的「除油煙機有子分類時必須先選系列」斷言確實失敗；另同步check-frontend-regressions原父分類分頁預期，改驗全部產品首頁／中頁／末頁，保留共用分頁測試；不執行該大檔的業務POST。
- pnpm build含typecheck、check-product-covers完整唯讀回歸及check-frontend-regressions產品區段通過：三品牌25個入口、除油煙機8系列各自的產品數／歸屬／詳細頁來源、全部產品搜尋與分頁、舊網址皆核對；總數仍749／60／38，未執行匯入或業務送件。
- 本機實際瀏覽器完成父分類→近吸9項→R7600詳情→返回近吸→麵包屑回父分類；系列頁1920×1080、1512×900、1280×720、1024×768、768×1024、767×720、390×844、320×640、844×390九尺寸皆8卡、無橫向溢位／裁字，8張圖已載入。桌面4欄、平板／手機2欄，沿用既有進場動畫；使用既有Azure runtime唯讀內容、不改連線設定。
- 已發布da06ab6ef92b3baa4db5c6e6f0be9d83f44d2d6d，Vercel dpl_459JruSgnB5YaA56u2dvz8zTCD4Y為READY／Production／GitHub成功，兩個既有正式網域已指向此版。正式check-product-covers完整通過，三品牌25入口、除油煙機八系列及舊網址皆驗證；正式瀏覽器再完成同九尺寸與近吸→R7600→返回近吸→父分類，結果通過。
- 正式1280×1000交付畫面/tmp/sakura-product-series-production.png已目視核對八張圖、名稱／數量及四欄；手機兩欄與底部服務列亦已目視。最近10分鐘有界error查詢未回傳紀錄，不代表長期監控；未驗Safari／Firefox或實體裝置，未重新掃全站。預覽server已停止、viewport還原；正式驗收紀錄僅文件提交，不為純文件再次部署。

## 2026-10-27 AI品牌系列Hero對齊首頁

- 依13:59:37截圖，將/home-style/aikitchen的AI CABINET／AI FAUCET／AI LIGHT文字位置與字體對齊首頁Hero，保留英文大標／中文中標／說明小字三層，文案、圖文配對、輪播／動畫與其他九系列不變；使用frontend-design沿用既有視覺規則、ponytail限縮共用元件及既有驗證，不新增套件／文件，不改CMS或資料庫。
- 已量測正式首頁六尺寸基準：1512與1280px寬大標top318／x70、100px，1024px寬top174／100px、768px寬top174／50px，390與320px寬top154／30px；內文皆15px／26px行高，桌面欄寬522px。AI另設top:auto／bottom150px、較窄主欄與18px內文；手機又另設bottom260px及93px側欄避讓，造成與首頁不同。
- 新回歸要求AI內文實際使用首頁共用欄寬class、不再對story另設靠底／對齊，且保留24px中文中標及15px／26px內文。先在原版確認失敗，再修正及進行瀏覽器／正式驗收，結果待續記。
- 原版在「AI輪播內文需共用首頁欄寬與對齊」確實失敗；現在AI三張故事直接繼承hero-template-top定位／對齊與hero-template-title字體，內文共用hero-template-description，中文中標24px（手機20px）保留。手機僅story取消舊93px右側預留，與首頁同為左右15px；其他九系列原規則不改。只調CSS／class，不更動輪播邏輯、已發布資料或素材。
- 實際鍵盤切換時另外重現Hero自身scrollTop158（clientHeight840／scrollHeight998），使文字／背景上移、底部露出灰色，不能只看CSS top244就算位置正確。僅對含story的AI Hero改overflow:clip，維持裁切但不允許焦點觸發容器內部捲動；其他九系列仍沿用原hidden，正常頁面捲動不變。新增相應回歸，待重新建置及切圖量測。
- pnpm build含typecheck及完整check-kitchen-series通過：三圖配對、原文與schema相容、十系列SSR／404、215個圖片來源檢查、四輪圖文索引、原廚電輪播與鍵盤回歸；未開--images／--cutouts額外遠端掃圖，不執行CMS儲存／發布或業務POST。3100 preview僅沿用既有Azure runtime環境唯讀已發布內容，未重啟Docker、寫DB或切正式連線設定。
- 實際瀏覽器三張×15尺寸共45組與首頁基準比對通過，包含1512×900、1280×720、1024×768、768×1024、390×844、320×640及767／880／881／1025／1200／1201／1920px斷點、1024×390／844×390短橫窗。每組真實path、標題top／欄位x、字體／行高／內文寬度、圖文配對、全文段落數、頁面寬度與控制組不重疊皆核對，切圖後Hero scrollTop=0。桌面三圖同x70／top318、100／24／15px、內文寬522；手機同x15／top154、30／20／15px，文字與原底部服務列目視正常。
- 已發布7257fb043aa34c1d03d8d63bccc62d203945e790／Nuxt／Production，Vercel dpl_3J23y8zHjDMrHF4HLaSRi9VVHdHN為READY／GitHub成功；header-design-ia4ys5wmb-erics-projects-57e51613.vercel.app接上兩個既有正式網域。原專案與環境設定未變，遠端建置時長未另量測。前台變更僅KitchenSeriesPage、既有回歸及本README，不修改CMS／DB／素材。
- 正式主網域再跑三張×同15尺寸共45組全部通過，每組確認實際載入overflow:clip及scrollTop0，不用本機結果代替正式；正式check-kitchen-series十系列完整回歸亦通過。最近10分鐘有界error查詢未回傳內容，未查drain或新增監控，不宣稱長期無錯誤；測試中的not-a-series為預期404。純來源檢查的215圖片不當成215張遠端載入或視覺驗收。
- 正式AI FAUCET交付畫面/tmp/sakura-ai-hero-production-after.png已目視核對：1512×900、首頁同位置、三層完整、原三段文案與龍頭圖片配對、背景不再因容器內部捲動露灰。預覽server已停止、測試viewport已還原、正式頁籤保留。未驗實體觸控裝置／Safari／Firefox，也未重掃全站全部網址；正式後紀錄僅本機文件提交，不為純文件再次部署。

## 2026-10-27 縮短預覽等待

- 使用者確認預覽會完成但過慢；本輪改查重複工作。初次載入同時由 load 與欄位監聽建立兩次預覽，未就緒時第二次會重開 iframe；每次文字更新也重新抓取未修改的其他區塊。
- 回歸先確認兩項失敗：初次實際建立 2 次而非 1 次；跨兩次輸入更新重抓同一未修改資源 2 次而非 1 次。移除 load 裡的重複檢查，改由既有欄位監聽建立一次；初始不等待，輸入停止 300ms 後檢查。
- 僅在當前預覽視窗、依工作區保存已讀成功的其他區塊；目前修改的內容優先。重新載入預覽會建立新視窗並重新取得資料；官網公開請求及伺服器渲染不共用此暫存。權限驗證、資料轉換、錯誤處理與發布資料維持原流程。
- 正式 Chrome 改前實測：一次修改品牌系列標題，Network 的 `/api/content/` 多出 9 筆，包括首頁輪播、設計風格、廚房產品、設計案例、門市、品牌承諾、共用圖片及品牌標誌（共用圖片重抓兩次）。這是實際請求數，不以截圖時間估算載入秒數；測試文字已還原，未儲存／發布。
- 既有預覽回歸加上初次單一檢查、未修改資源重用、目前輸入優先、新預覽重新抓資料、公開站與 SSR 保持新請求檢查，全部通過；實際 HTTP 20 秒中止、型別、正式建置、名稱／流程與 diff 檢查亦通過。已發布 `792e327b53f58470895cc8c3536233bc95e1b46b`，Vercel `dpl_ETMoBug487oPaCdDxCbAmvforMWf` READY。
- 正式改後量測通過：相同品牌系列標題修改，Network 的 `/api/content/` 額外請求由 9 筆降為 0 筆；實際預覽正文出現新標題且狀態完成。再次連續修改以同一個工具呼叫從鍵盤輸入觀察到預覽正文與完成狀態，共 1499ms，仍為 0 筆額外內容請求。此為單次現場觀察（含輸入與畫面觀測），不當成全站／冷啟動保證。證據 `/tmp/sakura-preview-speed-after-20261027.png`。
- 測試途中提案驗證依原有 3 小時設定到期並出現離開提示，已重新通過既有驗證後完成比較；未更改保護、帳號或正式內容。測試文字已還原、篩選恢復 `refresh_status`、維持不節流／快取啟用、關閉開發工具並移除測試網址參數；未按儲存或更新官網。
- 本輪完成桌機同條件修改與連續修改比較；未重跑全部 48 個工作流程、四尺寸或跨瀏覽器效能，初次官網圖片與首次連線仍需載入。

## 2026-10-27 預覽失敗後再次修改的等待問題

- 本輪限縮預覽流程、回歸檢查與本 README。調查發現：舊預覽失敗後，新的檢查成功卻繼續等待未 ready 的 iframe；原載入計時已清除，畫面會一直留在「正在檢查目前輸入」。另檢查請求本身尚未設定逾時。
- `scripts/check-admin-preview-state.mjs` 直接執行編輯器的實際處理函式，以假請求與計時器重現「先載入失敗，再修改內容」；舊程式確實失敗（沿用 snapshot-1，沒有新載入計時），不連資料庫、不儲存內容。
- 失敗時撤銷舊預覽的 ready 狀態，拒絕舊確認訊息清掉錯誤；後續檢查成功改以新快照載入，重新建立 20 秒載入計時。檢查請求亦設定 20 秒逾時與不重試，逾時保留輸入並明確顯示原因。測試包含已就緒後失敗、舊確認訊息、較慢的過時回應，以及以實際 fetch 對本機不回應 HTTP 伺服器驗證中止。回歸檢查、實際無回應 HTTP 20 秒中止、型別、正式建置、名稱與流程檢查皆通過。
- 正式 Chrome 已在舊版重現：離線時按重新載入失敗，恢復「不節流」後修改文字；新檢查 200／186ms，但畫面仍停在「正在檢查目前輸入」，證據 `/tmp/sakura-preview-stuck-before-20261027.png`。這不是僅依使用者截圖猜測，也不以未完成的 HTTP 請求解釋。
- 既有 `check-admin.cjs` 補上相同的離線→恢復連線→再次輸入流程及內容未儲存核對。已發布 `abdf1de2988945963871c9a334d0d1d92e408674`，Vercel `dpl_FWxCgnmb47tYF95EsY2Y1qUu9Vu7` READY，正式網域已對應此版本。
- 發布後 HTTP 核對：正式登入頁引用新 entry `BLX0fR4X.js`，首頁管理模組及其 14 個相依程式檔均 200；`D2IT6bTj.js` 包含新增的 20 秒檢查逾時提示。測試用 Chrome 分頁卻仍引用 `D7yQPOaj.js`（同一路徑直接 HTTP 已 404），因此尚不能把該分頁當成新版驗收結果；待核對瀏覽器取得的版本，不先歸因於單一快取或代理設定。
- **當時畫面複驗中斷**：準備還原測試文字時工具回報 Mac 鎖定，已停止 UI 操作，未繞過鎖定。後續已在本頁「縮短預覽等待」驗收中接續：所有測試文字還原、Network 篩選恢復 `refresh_status`、維持不節流／快取啟用並關閉開發工具；正常網址的預覽已完成、儲存按鈕停用。沒有按儲存或發布，僅沿用短期預覽暫存；連續修改已實測，完整離線恢復與其他頁面仍未逐一複驗。

## 2026-10-27 點擊主內容自動收合選單

- 依最新操作要求調整共用後台 layout：點擊主內容的表單、按鈕、區塊頁籤或空白處，自動收合左側選單；手動展開後再次點主內容仍會收合。頂部開關與側欄本身不觸發此行為，返回不同頁面的既有初始狀態保留。
- 使用 click 捕捉，不在 pointerdown 時改變版面，保留該次按鈕操作與欄位焦點。同網站預覽 iframe 載入後也接上 click，讓點擊預覽正文具有相同行為；不接管外站內容、不攔截點擊或變更預覽資料。
- 既有互動腳本補上區塊切換後收合、點欄位仍可輸入、空白區收合及點預覽正文收合；未儲存／發布內容，不操作資料庫。型別檢查、正式建置、既有名稱／流程檢查、互動腳本語法與 diff 檢查通過。
- 已透過既有 main 流程發布 `1016920e5dfef68097acbe5f60ef6bbcc795d425`，Vercel `dpl_FxmH8kYgTn2cxhJ1js4yn5fFqDQa` READY，正式網域已指向該版本。原生 Chrome 實測：展開後點欄位自動收合且焦點仍在欄位內；可直接輸入並以復原恢復原文；點「系列卡片」同時切換與收合，清單內標題已為「品牌系列」；點主內容空白處收合；點預覽正文收合，原本卡片連結仍正常在預覽內開啟。
- 驗收後已回到原本品牌系列編輯網址，移除測試 query、還原預覽位置；儲存／更新按鈕停用，沒有留下測試文字或儲存內容。此頁已顯示「目前輸入的效果・尚未更新官網」，不是原先的載入錯誤。裝置模擬關閉、測試時的「停用快取」恢復未勾選、開發工具已關閉。畫面紀錄 `/tmp/sakura-cms-content-click-final-20261027.png`。
- 本輪正式互動驗收限桌機點擊收合；沒有重新跑全站全部尺寸與完整自動化瀏覽器腳本，也未宣稱先前所有預覽／hydration 問題已排除。

## 2026-10-27 後台名稱與官網位置對齊

- 「修改網站」依官網提供首頁、設計案例、廚房產品、門市與服務、優惠消息、品牌承諾、我要加盟及建商專區；管理設定保留網站共用內容。48 個既有入口維持獨立，以「官網名稱｜修改用途」辨認，不合併或重建資料。
- 共用名稱只讀取已發布的選單及指定標題欄位，草稿不改入口名稱。首頁沒有標題的位置使用中文位置名稱；共用文章文字不冒用代表文章名稱。選單、卡片、編輯頁、相關入口、頁面選擇器及操作紀錄共用名稱，保留舊名稱搜尋。
- `/api/admin/workspaces` 保留陣列、識別碼與舊分類欄位，補充分類、用途、位置及官網連結名稱。新列表使用 `section`；舊 `area` 可開啟，原其他頁面對應全部可修改頁面。編輯網址、來源資料與官網 URL 不變；返回保留搜尋與頁碼，包括從全部頁面開啟首頁內容後返回原列表。
- 可重跑 `node nuxt-site/scripts/check-admin-names.mjs`：48 個入口完整覆蓋與名稱區分、官網改名／選單換序、缺少名稱、舊名稱搜尋、共用文章文字、連結選項、舊網址與返回條件均通過；直接測試伺服器摘要在草稿／已發布內容不同時只採已發布名稱。既有 `check-admin-workflow.mjs`、型別、正式建置、互動腳本語法及 diff 檢查通過。
- 正式資料唯讀核對：在 `nuxt-site` 執行 `CMS_NAMES_PRODUCTION=1 node --env-file=../.env.azure-runtime.local scripts/check-admin-names.mjs`，固定既有正式 SQL 目標，不接受其他主機。48 筆摘要完整、全部內容與版本指紋不變；不執行初始化、遷移、seed 或真實內容儲存／發布。看效果仍沿用既有短期預覽暫存，不建立內容版本。
- 已發布名稱改版 `dfd21a35`，並在正式登入後台逐一開啟全部 48 個入口，編輯標題均與正式資料對照一致；本機暫存結果為 `/tmp/sakura-admin-names-browser-20261027.json`。正式首頁 SSR、獨立 CMS 登入頁及未登入時內容／收件 API 401、private/no-store 亦通過。
- 檢查時發現原有 hydration 提示：已重現相同時間在 UTC 伺服器與台灣瀏覽器顯示相差八小時。後台日期改以共用台北時區顯示，資料庫時間不變；UTC／Asia/Taipei 兩個獨立程序的日期格式及缺少日期測試通過。
- 名稱改版及日期修正程式為 `e31caa0d15d47765605e151d6de811f251f141f1`，Vercel `dpl_D7BWkx48NDG1xvSL666RzQT3pxQm` READY，包含名稱改版、編輯清單標題與固定台北日期格式。兩既有正式網域均已提供新程式；沒有變更主機環境設定或資料庫權限。
- 解鎖後已實測舊名稱搜尋、從結果進入編輯再返回保留搜尋，以及從全部內容第 2 頁進出後保留頁碼。亦發現編輯器內的文章清單標題仍為舊稱，改用同一份已發布官網名稱；僅投影編輯表單標籤，不修改儲存 schema 或內容，並加入不可變測試。
- 台北時區修正後仍重現載入提示，進一步將日期組裝成固定字串，避免 Node／Chrome 的語系資料使用不同空白；補上台灣跨日、午夜及僅日期測試，仍須以正式畫面確認，不提前宣稱提示已消失。
- 解鎖後的正式 Chrome 操作：舊名稱「廚房知識文章」可找到「廚房裝修指南｜文章內容」，進入編輯再返回保留搜尋；全部內容第 2 頁開啟加盟內容後返回仍是第 2 頁。1440／1024／768／390px 的列表與編輯畫面已實際檢查：桌機旁看效果、窄螢幕切換內容／效果，未見文字裁切或可見水平溢出；未以腳本量測 scrollWidth。畫面紀錄位於本機 `/tmp/sakura-cms-*-20261027.png`，含開發工具，並非乾淨交付截圖。
- 鍵盤實測通過：390px 開啟選單、Escape 關閉後焦點返回原按鈕、選取首頁後自動關閉、以 Tab／Enter 開啟卡片及切換效果；桌機以鍵盤展開側欄、切換區塊內頁籤後保留手動展開狀態。未儲存／更新真實官網內容。
- **仍未通過的畫面驗收**：最後檢查時，瀏覽器出現多筆程式檔 404，預覽停在「正在檢查目前輸入」；同一批抽查檔案以獨立 HTTP 請求均回 200，正式首頁的 34 個 HTML 資產連結也均為 200，尚未定位瀏覽器與直接請求不同的原因。日期固定格式修正後仍須重新確認 hydration 提示，不能宣稱預覽及整體 console 已通過。
- 當時畫面工具再次明確回報 Mac 鎖定，已停止 UI 操作，未繞過鎖定；後續在「點擊主內容自動收合選單」實測時恢復連線，完成最新系列清單標題核對、關閉裝置模擬／開發工具並還原快取選項，取得無開發工具截圖（見上節）。擴充瀏覽器連線逾時，原生 Chrome 是本輪畫面驗證途徑；全站預覽與 hydration 尚待另行完整核對。

## 2026-10-27 編輯時自動收合選單

- 首頁及其他內容進入編輯時，桌面左側選單從 220px 收為 76px，保留不同圖示、簡短中文名稱與完整無障礙名稱；表單、官網效果與底部儲存列同步取得額外 144px。頂部「展開選單／收合選單」可隨時手動切換，鍵盤可操作。
- 同一筆內容切換內部頁籤、輸入、儲存或看效果均保留手動選擇；離開編輯回列表自動展開，換另一筆編輯再自動收合。直接開啟或重新整理編輯網址即使用收合狀態，避免載入後跳動。991px 以下沿用原有彈出選單，內容保持滿寬，不以滑鼠經過自動展開干擾輸入。
- 收合／展開不建立內容版本、不寫入瀏覽器儲存或資料庫；僅調整既有後台 layout 與限域樣式，官網版型、權限與預覽 API 不變。`scripts/check-admin.cjs` 加入桌面幾何對齊、鍵盤切換、內部頁籤／輸入保留狀態、返回列表、再次進入與手機 Escape 焦點返回檢查。
- 已通過 `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、互動腳本語法檢查與 `git diff --check`；另以 Vue 實際 layout 的 setup 驗證初始狀態、手動選擇、內部頁籤保留、切換內容及返回列表。瀏覽器連線逾時，解鎖後原生 Chrome 仍回報操作中斷，尚未完成四種尺寸與實際鍵盤／焦點驗收；不以建置代替畫面驗證。UI/UX Pro Max 採用既有 skill 的導覽／鍵盤／狀態保留原則；本機該 skill 缺少 `scripts/search.py`，未建立另一套設計系統或文件。

- 已透過既有 main 發布流程上線：`d4496ef5483ad9718b545d7a94475d99163a9ba8`，Vercel `dpl_7XaqnTdhmHm9nouZZav3Z9sVQWAZ` READY。兩個既有正式網域均已提供新後台 CSS，確認 76px 收合規則、儲存列共用偏移、減少動畫設定及未登入提案保護正常；這些是 HTTP／發布檢查，尚不代表四種尺寸的視覺與完整操作驗收。沒有資料庫或媒體操作。

## 2026-10-27 線上後台共用預覽修正

- 線上站再次重現預覽 404；原 `Map` 只在建立預覽的程序內有效，以兩份獨立模組重現「剛建立、尚未到期，在另一程序立即 404」。10/21 的自動重新載入只處理失效後的恢復，未解決不同程序無法共用預覽的根因，先前僅首頁的驗收不足以代表線上環境。
- 預覽改存獨立 `cms.PreviewSessions` 暫存表，各程序透過既有 MSSQL 讀取；五分鐘到期，每人最多 40 份／全站 400 份，保留使用者檢查、伺服器驗證及 private/no-store/noindex。使用 Node 標準 gzip 壓縮暫存以減少 SQL 傳輸與空間，解壓上限沿用 2MB 寫入限制。隨機預覽憑證只存雜湊；內容、草稿、發布版本、來源 sync 與操作紀錄不因看效果而改變。這取代舊版「完全不寫入資料庫、只放程序記憶體」的做法：只寫可到期清除的預覽暫存，不等於儲存內容。
- 資料結構採僅新增的冪等 SQL，不覆寫既有表或資料。正式環境需先套用 `nuxt-site/server/cms/schema.sql` 中 `cms.PreviewSessions` 的獨立 CREATE 區段，既有 CMS 帳號沿用 schema 的 SELECT／INSERT／UPDATE／DELETE 權限，不授予建表權限。此表與工作階段一樣不納入正式內容備份；還原後使用者重新看效果即可。
- 重跑共用預覽檢查：在 `nuxt-site` 執行 `node --env-file=.env scripts/check-cms-previews.mjs`，限本機 `SakuraWebsiteDev`，使用可清除的測試編輯帳號；真正啟動另一個 Node 程序建立／讀取預覽，驗證建立端結束仍能讀取、使用者隔離、到期、數量上限及全部工作入口，不以兩次同一程序呼叫代替跨程序驗證。內容／版本指紋必須不變。
- 使用者明確要求以正式端為準，改在既有 Azure `SakuraWebsiteTest` 的獨立預覽範圍驗證，不依賴本機 Docker。新增 `cms-preview-schema.mjs` 僅接受既定正式伺服器與資料庫、私有環境中的既有管理憑證；預設唯讀檢查，`--apply` 才在交易內新增預覽表並核對既有內容未變，遇不同結構拒絕覆蓋，不執行整庫 init／seed／import。共用預覽測試僅以 `CMS_PREVIEW_TEST_TARGET=production` 明確選定此固定正式目標時允許執行，使用臨時編輯帳號並清除，不使用真實申請資料。
- 正式資料庫已以獨立交易新增預覽表及兩個索引，65 份既有內容與 132 份歷史版本保留；未執行整庫初始化／資料匯入、修改連線／帳號權限或升級 SQL 費率。正式指令：於 `nuxt-site` 執行 `node --env-file=../.env.azure-sql.local --env-file=../.env.azure-runtime.local scripts/cms-preview-schema.mjs --apply`；省略 `--apply` 則為檢查。
- 正式 SQL 檢查已通過：`CMS_PREVIEW_TEST_TARGET=production node --env-file=../.env.azure-runtime.local scripts/check-cms-previews.mjs`。建立程序結束後另兩個程序仍可讀取、憑證／作者隔離、不可變快照、到期、每人上限及全部 48 組工作範圍通過；正式內容與全部版本指紋不變，臨時編輯帳號／預覽已清除。`pnpm build`、型別及純流程檢查通過。
- 正式程式已發布：`972b4797909415443e7ebd67a9ca69d858938269`，Vercel `dpl_E5KkVoAFQWQxchqpAzHDxGu2yCCX` READY／Nuxt，兩既有網域均已接上；建置約 64 秒。同期後續建商發布 `cdede08b` 包含本修正，未回退共用預覽。
- 直接在 `https://sakura-demo-vanlantech.com` 的登入後台，從實際分類與分頁收集全部 48 個入口並逐一開啟；均顯示「目前輸入的效果」，預覽框未見 404／503。涵蓋首頁、其他頁面、消息文章、案例、產品、門市與全站設定，不以首頁抽查代替全部入口。另以臨時編輯帳號經正式提案驗證、CMS 登入與 CSRF 流程呼叫正式 API，確認未儲存文字出現在正式預覽 HTML、未登入 CMS 無法讀取、到期回應正確、新預覽可恢復，private/no-store/noindex 保留；正式內容指紋不變，測試帳號、工作階段、暫存及該帳號測試紀錄已清除。
- 最後的瀏覽器即時輸入／到期自動恢復互動仍待確認：一次預覽框載入停滯，但相同預覽網址單獨開啟及正式 HTTP 檢查可顯示未儲存文字；後續原生瀏覽器診斷回報 Mac 鎖定，已請使用者解鎖，未用其他方式繞過。此時不宣稱整段互動驗收通過。部署的有界 runtime error／5xx／4xx 檢查各最多 5 筆、最近 5–10 分鐘均無紀錄，不等於長期監控；未擴大資料庫權限或新增監控。未重測全部後台業務流程與跨瀏覽器。
- 本機 SQL／Docker 連線問題不再作為正式端修正的前置條件；沒有重建資料或重啟其他專案。

## 2026-10-27 建商實力區取消高度縮字

- 依IMG_2798.PNG重現正式/builders：同為1280px寬，高度900／768／600px時，英文60／49.152／38.4px、中文40／33.792／26.4px、數字80／69.12／54px。主因是max-height:899px裡的svh字級公式，另有整組scale最多縮至80%的第二條路徑；不是CMS或正式資料未更新。本次沿用investigate先驗假說、ponytail限縮頁面／兩份既有回歸及本README，不改文案、圖片、資料或其他動畫。
- 新回歸要求短窗CSS不得再改font-size、整組不得scale，內容高度完整量測，只有完整容納時才停在導覽下15px；極矮窗自然讀完且不裁字。先在舊版執行確認會失敗，再修正，實際建置、捲動及正式驗收結果待續記。
- 舊版執行新回歸確實在「短視窗只能調間距，不能因高度縮字」失敗；已移除高度字級公式與整組scale，保留原依寬度的桌面／平板／手機字級，短窗只改gap16px、上下內距8／6px與標題間距。資料庫／CMS不需更新，原左側內容量測、字型／導覽／visualViewport變更及卸載清理保留。
- pnpm build含typecheck、315組幾何／生命週期回歸、原計數器及限定建商SSR／版面／圖片／手機斷言通過，未執行含業務POST的整份frontend-regressions。本機SQL14333未開，未重啟Docker或其他專案；本次3100 production preview明確用既有Azure runtime環境少量唯讀取得已發布內容，尺寸測試只調同一頁viewport，不做CMS／DB寫入或全站遠端掃描。
- 實際瀏覽器11尺寸通過：1280×600／683／768／900、1366×600、1024×600、1920×1080、1280×390、768×1024、390×844、320×640；頁寬不溢出、標題行框不溢出、整組transform:none。1280四種高度皆英文60／中文40／統計80px；600px高內容492.03px可完整容納，左欄top75不動、右欄top63.125→-77.375。1024px寬保留42／32／60px、手機30／28／48px；1280×390自然閱讀不縮字。768px高平板右欄較短時沒有額外固定行程，不宣稱所有尺寸都有視差距離。
- 區塊尾端實際捲動：1280×600左欄top46.27開始自然解除，左右bottom同為538.27，不把固定內容帶入下一區；正常固定期間不以負top藏標題。修前／修後圖片存/tmp/sakura-strengths-small-before.png與/tmp/sakura-strengths-small-local-after.png。這不是全站重新驗收；正式發布與少量正式瀏覽器回歸待完成。
- 正式發布cdede08ba337a97f0766c7e0714896b8eb2eebd0，Nuxt／Production dpl_HHTq95hF4dpMEL769a6KCaQeZg45已READY／GitHub成功；header-design-muqnrlnce-erics-projects-57e51613.vercel.app接上兩既有正式網域，未更動部署／環境設定，遠端建置時長未另量測。兩站check-builder-strengths均通過，實際載入/_nuxt/BVNwZ28H.js已移除整組scale，原文、CMS統計及三圖200保留。最近10分鐘有界error日誌無結果，未查drain或新增監控，不據此宣稱長期無錯誤。
- 正式瀏覽器8尺寸：1280×600／683／768／900、1366×600、1024×600、1280×390、390×844通過。1280四高度字級60／40／80px不變；固定期間連續兩次原生滾動，左欄均top75、右欄持續移動，例如1280×683右欄-39.375→-230.375。量測必須取進入固定區後的兩幀，不能把仍在進場／Lenis尚在捲動的首幀當失敗或成功；本次測試曾因取樣過早擋下，未修改產品程式迎合測試，重新在固定期間取樣後才計通過。
- 正式對照畫面/tmp/sakura-strengths-small-production-after.png：1280×683左欄top75／bottom633、右圖top63.125，中英標題與45+萬完整可見。測試viewport已還原、此輪preview已停止、既有正式頁籤保留。DEBUG REPORT：症狀為矮窗縮字；根因為svh公式與整組scale；修正限本頁／兩份既有回歸；315組斷言、建置、11組本機與8組正式瀏覽器證據完整。Status: DONE_WITH_CONCERNS，未驗實體裝置／Safari／Firefox／實際瀏覽器縮放；沒有宣稱本輪重驗每個全站網址。正式驗收紀錄僅本機文件提交，避免再次純文件部署。

## 2026-10-24 手機底部三項快速服務

- 依手機需求，僅將到府丈量／線上客服／拍立配改為≤767px底部固定三欄；上方金色設計案例不加入底列，≥768px原側欄及捲動跟隨保留。移除依表單／商品等網址直接隱藏服務列的限制，沿用原CMS可見設定、圖示、連結與另開分頁保護，不改CMS或資料庫。
- 共用元件預留72px＋safe-area底部空間，回頂按鈕同步抬高，viewport-fit=cover支援底部安全區；手機覆寫桌面translateY，避免捲動後整列漂移。輸入欄位增加捲動底部安全距，原導覽／搜尋與彈窗層級維持在服務列之上。沒有新增套件、路由或文件；使用frontend-design與ponytail限縮共用版面。實際建置／瀏覽器／正式驗收結果待續記，桌面模擬不當成實體手機鍵盤驗收。
- 首輪瀏覽器390px確認建商sakura-kitchen頁另有:global(.floating-buttons)的display:none!important，載入樣式後連首頁也被隱藏；已移除這條跨頁規則，不用更高優先權硬蓋，避免導頁後重現。
- 本機pnpm build含typecheck、check-site-header唯讀回歸與git diff --check通過。實際瀏覽器64個不同內容網址於320×640逐頁核對真實path、三個連結／圖示載入、72px觸控高度、固定底緣、回頂避讓、底部占位及整頁寬；另首頁320／390／767／768／1024／1366六個斷點驗收，手機三欄、平板桌面原74px側欄與0px底部占位正確。不是以SSR代替實際顯示，也未重掃正式資料庫。
- 首頁實際捲到底，Footer bottom771.78位於390×844底列top772之上；服務列仍在y772–844且transform:none。實際展開／關閉手機選單、搜尋、品牌識別放大圖，覆蓋層均在服務列之上且可關閉。390×360短窗自然捲動後聚焦聯絡電話，input y63–121、服務列y288–360，無遮擋；未輸入或送出業務資料。跨頁至/builders/sakura-kitchen後底列仍正常。實體手機軟鍵盤、Safari安全區與跨瀏覽器仍待硬體驗證，不宣稱模擬等同真機。
- 正式發布：64064778a1372630a083878509d2727d41ab5a17／Nuxt，Production dpl_2ufXyYZaYLLvJBF83kTWn1fAczVk已READY／GitHub成功；header-design-90t70lawe-erics-projects-57e51613.vercel.app接上sakura-demo-vanlantech.com及header-design-two.vercel.app，未改設定／環境／DB，未另量測遠端建置時長。正式瀏覽器品牌館、SAKURA廚電、加盟表單、建商SAKURA KITCHEN及首頁五頁390×844通過；另首頁320／767／768／1366四個斷點與實際捲到底通過，Footer bottom771.78／底列top772／bottom844／回頂bottom752。首次產品頁客服圖示尚未載完時斷言確實擋下，待正常載入後重驗通過，沒有忽略載入狀態。
- 兩正式網域check-site-header唯讀回歸皆通過，最近10分鐘有界error日誌未回傳錯誤；未新增監控或查詢log drain設定，沒有以空日誌宣稱長期穩定。正式手機畫面存於/tmp/sakura-mobile-services-production.png並保留既有驗收頁籤。本機preview已停止；正式驗收後本段僅文件提交、不再觸發純文件部署。外部三服務本身的流程、實體鍵盤與Safari／Firefox未驗，連結及另開分頁設定保留。

## 2026-10-23 全站RWD完整續查（公開前台已完成，跨瀏覽器未驗）

- 使用者再次明確要求檢查全站是否存在爆版，不是只修單一區塊或追求修改數量。本輪以36個公開頁面模板、前輪盤點的1119個有效公開網址為清單；後台與預覽入口另行標記，不用抽查9頁宣稱全站完成。沿用QA與ponytail，確認問題才修，保留README單一文件。
- 已核對本機環境實際連至127.0.0.1／SakuraWebsiteDev，非剛轉Basic的Azure正式資料庫；將用既有production build在3100做大量唯讀瀏覽器檢查，正式站只做少量修正驗收。不執行seed、import、CMS寫入或業務表單提交。完整URL清單暫存/tmp/sakura-rwd-public-routes.json供實際瀏覽器逐筆導頁，清單筆數不當成驗收筆數。
- 尺寸、逐頁檢查、展開狀態、修正及正式驗收逐項記於本節；不把列出清單當成已完成檢查，最終結論與限制見本節末。
- 預覽登入中途到期，首輪928筆實際落在登入頁，已全部剔除並向使用者更正有效數為191；補跑時每頁核對實際path、要求viewport及h1，必要時正常重新登入，錯頁立即停止而不計通過。補跑完成後1119筆唯一有效公開網址、缺漏0、登入頁混入0，320×640未見整頁水平溢出。所有資料來自本機DB，沒有重掃Azure。
- 36個公開模板以64個不同內容網址涵蓋，逐頁驗320×640／390×844／768×1024／1024×768／1280×720／1366×600／1920×1080及844×390／1024×390／993×500，共640組；包含十系列、九新聞、三門市案例、三品牌四層商品及舊型號入口、設計案例。仍須逐一核對裁切候選與展開狀態，不把幾何量測冒充全部視覺通過。
- ISSUE-RWD-004已重現兩次：商品82000等圖片失敗時，縮圖按鈕高76px，內部錯誤節點min-height220px／scrollHeight1056px，畫面只剩被裁斷的網址。共用ProductDetailPage供三品牌及舊近吸型號入口使用；僅對縮圖內fallback縮小內距與字級並隱藏重複alt／URL，保留完整失敗標題、原選圖按鈕及選取後主圖區完整錯誤／URL，不動ProductCategoryImage其他場合、商品資料或圖片來源。純CSS修正，待本機建置及實際畫面重驗。
- ISSUE-RWD-004本機pnpm build含typecheck通過；82000／82022／81606／81608／81427五個實際失效來源×七尺寸共35筆，均有真實錯誤縮圖且scrollHeight=clientHeight、頁寬未溢位。320px縮圖錯誤由220px／1056px修為64px／64px，畫面已核對；實際選圖後aria-pressed=true，主圖區仍有完整中文錯誤、商品與原URL。正常圖片、規格按鈕與商品資料未改，正式驗收待部署。
- ISSUE-RWD-005已重現兩次：/about/exhibition實際開啟影片，844×390時iframe為784×441、top-25.5／bottom415.5，播放器上下超窗且後繪製內容遮住部分關閉鈕。BrandPavilionHero僅此頁使用；將原1100px／100%寬度再限制於扣除既有上下60px內距後的16:9可用高度，並把關閉鈕置於播放器上層，保留影片、原比例、一般大桌面上限及Escape／關閉行為。純CSS，待建置及實際瀏覽器回歸。
- ISSUE-RWD-005本機pnpm build含typecheck通過；七標準尺寸＋三短窗＋1366×280共11筆實際已播放YouTube iframe與關閉鈕均在viewport內。844×390修為480×270／top60／bottom330，1920×1080仍為原1100×618.75；已核對播放畫面並實際按關閉後dialog數0。沒有以載入中畫面替代播放幀驗收，正式部署待完成本輪其他展開狀態檢查。
- ISSUE-RWD-006已重現兩次：/about/introduce品牌銘板放大圖在844×390時，image bottom410.359、caption bottom450.359，圖片及圖說被裁出視窗。identity-lightbox僅此頁使用；只在既有660px／72vh圖片寬度加入扣除上下內距110px與圖說40px後的660:800高度限制，保留原比例、正常桌面660px、手機欄寬、文字、關閉／前後切換。純CSS一行，待建置與實際瀏覽器回歸。
- ISSUE-RWD-006本機pnpm build含typecheck通過；同七標準＋三短窗＋1366×280共11筆圖片、圖說與三顆控制均完整位於實際viewport。844×390修為圖片高240／圖說bottom350，1920×1080仍為660×800。已目視核對完整圖與圖說，實際再連點4次涵蓋五張原圖（品牌銘板、靜音緩衝抽屜邊蓋、不鏽鋼桶身沖印、座式緩衝滑軌蓋沖印、鉸鏈邊蓋），圖說bottom均350，再正常關閉。
- 獨立唯讀重盤本機目前已發布API：SAKURA749產品／161分類、SVAGO60／12、TEKA38／20，產品合計847／分類193，案例28；分頁逐筆比對1119清單，缺漏0。未只用舊清單總數假設資料仍一致，未接觸正式DB或內容更新腳本。
- ISSUE-RWD-007已重現兩次：1024×320的一般加盟下拉展開申請／下載後，下載入口top341／bottom385在畫面外；在選單內滾輪會使背景scrollY2810.5→3332.5並關掉選單，無法捲到下載入口。共用Header的左右兩組一般下拉僅對直接子ul設剩餘高度（扣Header60及上間隔8px）、原生內部捲動及contain，並加既有Lenis支援data-lenis-prevent；兩個大型選單與手機抽屜不受這條規則影響。待建置與瀏覽器回歸。
- ISSUE-RWD-007本機pnpm build含typecheck通過；1024×320選單top68／bottom320、clientHeight250／scrollHeight324，滾輪後scrollTop74、背景scrollY保持0.5，下載入口top267／bottom311，已實際點擊抵達/franchising/download。七組主導覽×1024×320／1366×280／1366×768／1920×1080共28次展開，均確實有一個可見選單且整個外框不超窗；一般大桌面自然高度保留。
- 其他展開狀態：320×320手機抽屜展開十系列後可在內部捲至末端櫻花集團，搜尋覆蓋層的輸入與關閉鈕完整可見；320×640Footer網站地圖六組展開後可自然捲至最後建商入口，整頁width320，Footer高934.5容納完整內容。320×320 TEKA詳細規格可內部捲至220V並正常關閉；92字元產品搜尋實際GET回0項，輸入及空結果未水平溢出。未送出任何加盟／預約業務表單。
- 最終production build再次重跑64頁×10尺寸共640組（與修前矩陣分開）：實際path及viewport逐筆符合，整頁水平溢出0、元素跨出viewport0、代表頁alert0。文字scrollWidth候選僅規格CTA的箭頭裝飾／進場範圍；320px實際捲入後，按鈕x15–305、完整文字span x43–115（72px）且可正常開啟規格，未修改動效以湊修正數量。新聞／案例／指南摘要等垂直候選經來源核對皆為既定-webkit-line-clamp 2／3，保留正常省略設計。SAKURA規格無資料狀態也已實際開啟，未裁錯誤或替換文案。
- 本機check-site-header唯讀回歸及git diff --check通過；四項各自原子提交081537aa（縮圖）、7d7ee4af（影片）、67480ce7（放大圖）、c8e2efb5（一般選單）。沒有更動既有測試、CI、依賴、CMS或資料庫。部署前已核對原erics-projects-57e51613/header-design（prj_TQUBfjU2vY6LFwvf7s5a78Dt7zYy），將正常push既有main；正式READY、四項畫面及導覽回歸結果待續記。
- 覆蓋為全站公開前台；後台登入／管理頁、Safari／Firefox、實體手機與所有滑鼠hover預覽未驗。不以本次RWD結果宣稱所有功能、圖片來源、效能或可用性皆100分。掃描過程另觀察8個商品／分類頁外部圖片失敗，未替換素材，失敗提示縮圖裁切已修；素材失效不是整頁RWD爆版。建商極短窗自然閱讀的既定保護不在本輪RWD範圍中偷偷撤回。
- 正式發布完成：cf37ce413979fe6470370330d5dcee6c3f730b6f／Nuxt，Production dpl_CuUsdRAJCvcvt2PNSsWY6dZBv31Y為READY／GitHub成功，header-design-5vbysjgwa-erics-projects-57e51613.vercel.app接上兩既有正式網域；未改環境或連線，未另量測遠端建置時長。四個原子修正都已發布，不是僅本機有效。
- 正式瀏覽器重驗：影片在320×640／844×390／1024×320／1366×600／1920×1080五尺寸完整，844×390實際播放器480×270；品牌放大圖同五尺寸完整，844×390圖高240／圖說bottom350，已切下一張及關閉；1024×320加盟選單scrollTop74後下載入口267–311，背景scrollY2892.5前後不變，點擊確實抵達正式/franchising/download。商品82000以真實外部失效來源重驗320×640／390×844／768×600／1024×320／1920×1080，縮圖錯誤均不裁字，主圖完整診斷／URL仍保留，320頁寬=320。
- 正式證據：[品牌放大圖](/tmp/sakura-rwd-identity-formal-after.png)、[可捲到的加盟下載入口](/tmp/sakura-rwd-dropdown-formal-after.png)、[商品縮圖錯誤標示](/tmp/sakura-rwd-thumbnail-formal-after.png)。本機修前／修後對照另有/tmp/sakura-rwd-video-landscape-before.png與/tmp/sakura-rwd-video-landscape-after.png、/tmp/sakura-rwd-identity-landscape-before.png與/tmp/sakura-rwd-identity-landscape-after.png、/tmp/sakura-rwd-product-thumbnail-before.png與/tmp/sakura-rwd-product-thumbnail-after.png、/tmp/sakura-rwd-franchise-dropdown-before.png與/tmp/sakura-rwd-franchise-dropdown-after.png；皆為本次實際瀏覽器截圖，暫存證據不保證跨機器保留。
- 兩正式網域check-site-header全數通過，部署最近10分鐘／最多5筆error日誌無結果；沒有新增監控或宣稱零風險。本機preview已停止、測試視窗覆寫已復原，保留正式品牌館頁。最終RWD結論：1119頁窄手機檢查及全36公開模板的640組最終矩陣未見未處理的整頁水平爆版；展開／錯誤狀態確認的四類裁切及不可達問題已修並在正式重驗。狀態DONE_WITH_CONCERNS，限制為本節列出的後台、跨瀏覽器／硬體、hover與外部素材，未提交業務表單或變動任何資料。
- 本輪教訓：單有h1不能證明檢查到目標頁，須逐頁比對實際path與viewport、遇預覽登入失效剔除再補跑；水平scrollWidth也不能取代彈窗高度／圖說／控制鈕的實際展開驗證。以真實錯誤圖片重現縮圖版型，完整診斷留在主圖，不用截掉內容或換圖掩蓋問題。沿用QA逐項重現與ponytail的局部CSS修正，未新增依賴、文件或全站重構。

## 2026-10-23 RWD續查：正式互動重驗與建商相簿短窗修正

- 先依使用者已同意的README提交決定保存Azure恢復紀錄（99e7e28b），再以實際瀏覽器接續正式驗收。僅少量代表頁導航並在同頁切換尺寸，不重跑千頁掃描、不送出業務表單、不寫CMS／資料庫。
- 先前兩項程式已在正式站確認生效：TEKA商品768×1024的型錄標題為43px、欄寬及scrollWidth同為226px；1024×390大型產品選單top60／bottom390、clientHeight330／scrollHeight405，內部捲至74.5後型錄CTA位於306–358px，背景scrollY保持2350，實際點擊成功抵達/catalogues/catalog。另320×640搜尋覆蓋層、型錄FAQ第二題展開、品牌館切換高雄館及加盟表單欄位均未水平溢位；表單另量測768×600／1024×390，未送出任何資料。
- 建商固定欄1280×600實測scrollY2400→2580時左欄top75／bottom550不變、右側首圖top-398.375→-578.375，確認正常短筆電有左右差速。1024×390則觸發既有可讀性保護，position:static、完整內容高371px；此極短窗不是固定效果通過，不以裁中文主標或無限縮字恢復效果，也不把這輪正常尺寸結果當成使用者所有縮放條件均已排除。
- 新問題ISSUE-RWD-003：/builders/sakura-kitchen原色0.5相簿在844×390重複開啟兩次，dialog高360／scrollHeight420，換圖按鈕bottom419.289大於視窗390，初始畫面看不到按鈕。原因是65dvh圖片加上標題／44px操作鈕與間距超出彈窗剩餘高度。僅將既有相簿panel改為有高度上限的直向flex、標題／控制不縮、圖片min-height:0允許縮小；保留原圖片contain比例、44px觸控目標、鍵盤／焦點／關閉與原生溢位閱讀保護，不改CMS或素材。純CSS變更採實際瀏覽器回歸，不改既有測試檔。
- pnpm build（含typecheck）及diff檢查通過；本機production preview以實際瀏覽器驗320×640／390×844／768×600／844×390／1024×390／1280×720／1920×1080七尺寸，相簿均scrollHeight=clientHeight、頁寬未超窗，三顆按鈕完整可見且保留44×44px。844×390的換圖按鈕bottom由419.289修為359，dialog仍高360，圖片等比例縮為剩餘區域；實際點擊換至第2張、鍵盤ArrowRight回第1張，關閉後dialog已關且焦點返回原色0.5入口。修改後正式部署／回歸待續記，不宣稱全站所有狀態或跨瀏覽器驗收完畢。
- 既有check-builder-series純本機回歸通過（9組／20素材、schema與冪等防護、相簿換圖／焦點），未加--http、不執行內容更新腳本。另於正式about/advantage、service-process、news/latest以320×640／768×600／1024×390抽查，實測innerWidth與頁寬一致、操作控制未跨畫面；品牌館手機高雄頁籤已實際切換。合計本輪實際導航9個公開代表網址，不把少量代表頁冒充再次完整掃描1119頁。視窗覆寫依當前分頁套用，追加量測明確核對innerWidth／innerHeight，排除曾套在另一分頁的無效尺寸樣本。
- 正式交付：ab1a0801ab3caa96cbf28e56031429dcf785202e正常push既有main，Vercel Production dpl_C76RYQUNypVMRu7HfynDf2PcUCD1為READY／GitHub成功，Nuxt部署header-design-bmdlrdxgv-erics-projects-57e51613.vercel.app接上sakura-demo-vanlantech.com與header-design-two.vercel.app。未修改專案設定、環境變數或資料庫；未另量測遠端建置時長。
- 最新正式相簿重新導航後，同七尺寸逐一斷言實際viewport與要求相符、頁寬無溢位、dialog scrollHeight=clientHeight、三顆44px按鈕都在畫面內；844×390正式畫面已目視核對及存圖，實際1→2換圖與關閉／入口焦點返回正常。兩正式網域check-site-header唯讀回歸通過；正式相簿分頁console error為0，部署限定最近10分鐘／最多5筆error日誌無結果。未查Drains或新增監控，空日誌不代表未來永不出錯。
- 本機preview已停止，瀏覽器測試尺寸已復原。只有相簿CSS及本README變更，QA／ponytail採最小修正；既有商品外部失效圖片未替換，極短窗建商左欄的可讀性退讓仍在，Safari／Firefox、實體手機觸控／鍵盤及Basic多人效能未驗。沒有跑含業務POST的整份frontend-regressions，也沒有對正式資料庫做大量掃描。

## 2026-10-23 Azure SQL Basic 已生效，正式站恢復

- 使用者在確認固定規格預估US$4.90／月、5 DTU／2 GB及無法恢復此資料庫免費優惠後，明確授權使用Basic方案。Azure Portal實際核對目標為rg-sakura-website-test／sakura-website-test-20260929／SakuraWebsiteTest，原狀態Paused、免費vCore秒數0、資料使用量約132 MB，非儲存空間不足。
- 原地調整服務層為Basic（5 DTU、最大2 GB），套用前成本摘要仍為US$4.90／月；保留原伺服器、資料庫名稱、連線、區域及本地備援，未匯入／重建／刪除資料、未執行seed／accept-data-loss。未啟用原2 vCore Serverless超額計費，也不修改前端或Vercel部署。
- Azure已回報「調整資料庫成功」及「擴充作業已完成」；總覽實際定價層為基本、狀態Online，最大2 GB、使用132.69 MB／配置176 MB，原伺服器及資料庫名稱保留。不是只送出要求或預覽未儲存。月費為入口網站估算，非整個Azure帳單上限，稅及其他服務費另計。
- 兩正式網域check-site-header唯讀檢查均通過：正式CMS Header／Footer、首頁、消息頁與三分類目的頁HTTP200，先前相同CMS API的503已解除。另以實際瀏覽器開啟sakura-demo-vanlantech.com/products/teka/item/82062，既有TEKA商品、圖片／特色／價錢正常顯示，實際點開詳細規格可讀MAESTRO系列、高45cm、220V，再正常關閉。未提交任何業務表單或修改CMS內容。
- 本輪沒有前端程式、環境變數、連線或Vercel部署變更，只更新本README；Azure成功總覽與正式規格視窗另存截圖供交付。僅執行少量恢復檢查，沒有再掃千頁。資料庫額度阻擋已解除，但未做Basic壓力測試／多人同時驗收，也不以本輪HTTP通過宣稱前輪全站所有尺寸或Safari／Firefox視覺驗收完成。

## 2026-10-23 全站公開頁RWD檢查（兩項已修，正式驗收受資料庫額度暫停阻擋）

- 使用者同意先提交上一輪README驗收紀錄，已以9fa34ede保存，工作樹整理後開始QA。只檢查公開網站與公開內容，不登入管理員、不提交加盟／預約表單、不寫CMS／資料庫。主要檢查320／390／768／1024／1280／1366／1920px，手機橫向與短視窗另抽查；採實際瀏覽器，不用建置或SSR代替排版驗證。
- 正式路由／已發布API盤點：24個固定公開路由、10系列、9新聞、3知識、3門市案例、193個產品分類、28個設計靈感案例，另有847筆產品（SAKURA749／SVAGO60／TEKA38）。先建立311個具體網址及60個版型／內容代表頁，後續補齊產品與掃描結果會明確記錄，不將代表頁冒充所有產品內頁。首次knowledge-articles併行讀取503，單獨重試200；降低資料API併發，僅記為暫時服務錯誤，不擅改資料庫設定。
- 新增scripts/check-rwd-browser.js供既有已登入瀏覽器重跑：只允許本機／兩正式origin與公開路由，以Vue Router實際導頁後量測整頁、元素及文字Range溢出，略過隱藏選單、刻意的輪播／跑馬燈與內部橫向捲動容器。幾何掃描暫時將reveal置於完成態，避免進場100px位移誤報；每個確認問題仍須移除檢查樣式、實際截圖再判斷。不以overflow:hidden遮罩當作沒有爆版，不引入套件或新文件。
- 掃描器明確等待Nuxt page:finish、延後路由與網址一致後才採樣；首頁沒有main標籤，另以原版面內容容器納入掃描，避免漏掃首頁。除ev外亦將Hero五秒文字進場置於完成態，避免-48px暫態誤報。初步Harmony候選在移除檢查樣式、等待實際動畫完成後為left15px且畫面完整，故撤回而不改產品；最初60筆因導頁未完全穩定不納入有效結果，修正檢查器後重跑。
- 偵測到的頁外卡片先檢查其裁切容器與輪播行為，不因量測候選便擅改已核准的輪播排版。
- 已確認品牌家庭brand-family-viewport／track及首頁廚電cursor-grab容器為刻意水平輪播，掃描器排除其頁外卡片，不改成堆疊或縮小以消除誤報。
- 有效重跑320／390／1024px各60代表頁未見文字或頁面水平溢位；影片播放鈕雷達裝飾的scrollWidth不當作文字爆版。768px三品牌產品內頁共同回報型錄標題超出自身欄寬，列候選待畫面重現，不先宣稱修好。掃描器另含暫時DOM fixture自檢，驗證能抓文字超框及忽略刻意輪播，結束會移除fixture，不寫網站資料。
- 已完成七尺寸420筆代表頁掃描；自檢passed。768px產品型錄區在三品牌重複量測並實際捲動截圖確認，Catalogue文字236px大於226px左欄，雖未超出整頁，仍吃掉欄間留白。追查所有ProductDetailPage入口後，只將既有平板50px改為clamp(43px,5.5vw,50px)，保留桌面60px／手機43px、行高、兩欄及文案，修正待本機與正式瀏覽器重驗。公開產品分頁GET已讀完72頁、847筆，具體掃描清單擴充為1122個不重複網址；先於最窄320px逐頁檢查，不將產品總數當成已驗筆數。
- 清單校正：設計靈感含三筆storeSlug門市案例，前台實際導向/gallery，不是/design-inspiration/case10等舊ID；剔除三個錯組網址後正確公開清單1119筆。三筆HTTP400屬掃描器輸入錯誤，未修改API驗證。文字超框須同時具備文字Range越界與scrollWidth超框，避免CTA裝飾箭頭／雷達的動畫範圍誤報；保留實際文字及整頁寬度判定。
- 320px1119個正確網址與768px308個具體網址已於正式瀏覽器逐頁完成；平板36產品內頁同為共用型錄標題問題，其餘未見水平爆版。另商品80906之LFD-0211_2.jpg回傳HTTP200但content-type為text/html，前台有完整圖片錯誤提示且未爆版，屬素材來源問題，未擅改圖片或資料庫。修正後本機production build／typecheck、腳本語法、diff檢查、自檢passed；三品牌於320／390／767／768／900／1024／1280／1920px共24筆回歸均無溢位或alert，768px標題43px且scrollWidth226=clientWidth226，已移除檢查樣式並實際捲動核對截圖。
- 短窗互動另外重現：正式1024×390的廚房產品大型選單bottom464.5px，型錄CTA bottom432.5px大於視窗390px，overflowY為visible，重複點選仍相同，底部入口無法在選單內捲到。只對兩個大型選單共用desktop-nav-mega設定可見剩餘高度與內部overflow-y:auto／overscroll containment，並加已安裝Lenis支援的data-lenis-prevent，避免攔截選單原生捲動；正常桌面自然高度及既有關閉行為不改。手機320×640展開系列選單量測width320、bottom640、scrollHeight1132>clientHeight579，內部可捲動且已核對畫面，不改手機選單。
- 第二次pnpm build／typecheck通過；1024×390本機選單bottom390、scrollHeight405>clientHeight330，捲到底scrollTop74.5後型錄按鈕top306／bottom358完整可見、背景scrollY0、wheel未被Lenis阻止，實際點擊可前往型錄。已核對底部截圖。320×640實際開啟TEKA規格dialog位於x15–305／y152–488，表格scrollWidth250=clientWidth250、關閉按鈕在內。既有check-site-header唯讀檢查通過，Footer／原導覽保留，未提交業務表單。
- 額外互動抽查曾遇正式TEKA頁503錯誤畫面，與先前完整掃描結果分開記錄，不以排版修正掩蓋服務問題、不擅改資料庫；正式部署後會再開頁重驗。尚未驗Safari／Firefox／實機觸控，幾何掃描亦不代表所有動畫逐幀皆完成視覺驗收。
- 邊界追加本機844×390／767×600／993×500／1025×600，各8代表頁共32筆無溢位；加盟額外選單1024×390展開未超窗。大型選單1366×768與1920×1080均自然高449px、scrollHeight=clientHeight，正常桌面未強制捲動或縮小。
- 程式分別提交0f9e4b27（平板標題）及2117d9a40ea5b40ae1d517f312c997485cfae0c0（短窗選單），正常push既有main。Vercel Production dpl_rZLSGKVNZRWuhoCBcp3ypJsNiJWg為READY／GitHub成功，header-design-m8280ofy1-erics-projects-57e51613.vercel.app已接上兩個既有正式網域，未變更部署環境、資料表、CMS或任何資料。
- **正式驗收未通過，不能宣稱全站已驗收完成。** 部署後兩站check-site-header在/api/content/view-components-SiteHeader皆503，瀏覽器TEKA頁亦503。Vercel有界error日誌明確回報ELOGIN：Azure SQL已達2026年10月每月免費額度，資料庫被暫停至11月1日00:00 UTC（台灣08:00）。這不是CSS錯誤，也不是要重灌／匯入資料；立即恢復需在Azure該資料庫Compute + Storage選擇Continue using database with additional charges，會產生費用，尚未取得授權，未操作。
- 已停止正式網站／資料API測試與重試，未自動開付費、切資料庫、改連線、重跑seed或降安全設定。本輪大量公開GET可能增加正式資料庫使用量；尚無用量明細，不能斷言是否由本輪掃描耗盡。後續大量RWD矩陣應優先使用獨立測試資料庫／既有資料快照，正式只做少量驗收。待使用者選擇付費恢復或等免費額度更新後，再重跑正式兩項修正／原導覽與關鍵尺寸；目前狀態BLOCKED（正式資料庫額度），本機兩修正與建置通過，另保留失效商品圖片及跨瀏覽器未驗事項。

## 2026-10-23 品牌承諾首屏英文標題放大

- 依12:22:40截圖，只調整/about/advantage首屏Why Choose／SAKURA KITCHEN／For Your Home三行英文；保留原文、Cal Sans、白／金色、背景／右圖、導覽與既有進場，不修改建商實力捲動或CMS／資料庫。
- 舊規則在1440px以下硬降56px，正式1366×768實測左欄638px、標題56px，原共用850px寬度還超出左欄。改由左欄container驅動clamp(56px,12.4cqw,80px)，1366px約79px、1280px約74px、大桌機80px；h1寬度限制於左欄。移除平板固定60px行高，避免放大後三行重疊；手機原clamp(24px,7.8vw,40px)不變。
- 沿用ponytail限縮元件與既有回歸，只維護本README；不生成或替換素材、不新增套件／文件。不執行含業務POST的整份frontend-regressions，會限定跑品牌首屏斷言與瀏覽器RWD／實際畫面核對，結果續記。
- pnpm build（含typecheck）、限定品牌標題回歸／腳本語法及git diff --check通過。本機production preview實際瀏覽器測1366×768、1387×744、1280×720、1025×600、1024×768、768×1024、390×844、320×640、1920×1080；字級依序79.112／80／73.78／57.97／80／80／30.42／24.96／80px。以每行真實文字Range邊界核對三行分行、最長品牌行不跨左欄、頁面無水平溢位、沒有alert；不是以字串公式代替瀏覽器排版。已目視核對1387×744實際畫面：文字明顯放大、白金色及右圖保留，下方三項導覽仍可見。平板單欄可完整容納80px，取消舊60px行高後三行不重疊。
- 已正常push main：5e4274eec8da279a70fd0d8ba0a33ae05f1026e6。Vercel Production dpl_ZUya3XRQFd61iCZV58qy8Msr8tUg為READY／GitHub成功，部署header-design-p28rtp6ux-erics-projects-57e51613.vercel.app接上兩既有正式網域；未改環境變數、專案設定或存取保護。正式sakura-demo-vanlantech.com/about/advantage再以瀏覽器實驗1387×744／1366×768／1280×720／390×844：80／79.112／73.78／30.42px、三行正確、實際文字不超出左欄、無水平溢位，金色rgb(202,160,92)、三個既有導覽目的與Nuxt正常狀態均通過；已核對正式1387px截圖，不是僅驗本機或SSR樣式。未做Safari／Firefox或實體手機硬體驗收，未跑含業務POST的全站測試。

## 2026-10-22 正式站實際捲動重測，尚未重現使用者失效條件

- 使用者回報仍無正確捲動視差，本輪不再把高度mock或已部署當作實際效果驗收。沿用investigate追查容器與Lenis，先以既有Puppeteer直接開啟sakura-demo-vanlantech.com/builders，正常預覽登入後在正式頁量測與截圖；正式域名此次可正常操作，不沿用先前本機IAB拒絕作為所有瀏覽器皆無法驗收的推論，不變更瀏覽器安全設定或存取保護。
- 正式現況1366×768捲動y=2000／2150／2300／2450時，左欄top均75、bottom718，右欄top依序65.05／-84.95／-234.95／-384.95；y2600之後左右底緣相遇而離開固定區，y2750／2900左欄top為-87.27／-237.27。即正常尺寸確實有固定期間，但這不足以否定使用者另有失效條件。檢查body overflow-x:hidden雖值得懷疑，實際固定成立，未據此擅改全站overflow。
- 再實測1366×640、1280×600、1024×600、800×480、1920×1080，分別在右欄進入前、進入100px／300px取樣：固定期間左欄均75px，右欄持續上移；390×844維持單欄static。以上是實際瀏覽器DOM幾何／注入wheel事件經既有Lenis驅動的捲動，不是新一輪315組函式mock，也不是實體觸控板操作。1366×640另外擷取y2165與2465兩張實際畫面，左欄整組不動、右欄移動300px，中文主標及45+萬皆可見。
- 本輪尚未重現使用者所見的錯誤，已詢問出問題的視窗尺寸／縮放比例或短捲動錄影，需先確認實際失效條件及預期解除時機。暫不改前端程式、CMS／資料庫或再部署；保留2bfa9250現況，避免再以未證實假說做第五輪盲改。狀態NEEDS_CONTEXT，不宣稱整個問題修復完成。

## 2026-10-22 建商實力區固定頂部不得遮字

- 15:41:16正式站截圖顯示中文主標被導覽遮住，上一版以負sticky top照顧底部的策略不符合整組可見需求。實跑舊函式：720px視窗／1000px內容會產生-300px，確定不是CMS未同步。撤回「超高先向上捲再貼底」作為此需求的解法。
- 本輪依investigate追查實際函式，沿用ponytail限縮四檔：builders頁、兩份既有回歸及本README。固定位置只准導覽高度＋15px；保留短窗緊湊字級／間距，新增獨立內容層量測完整高度，必要時等比例縮至可見範圍，外層高度同步補償，避免transform留下多餘占位或改到右欄。最低80%避免極矮窗無限縮字；超出此可讀下限時自然閱讀、不固定、不裁切。手機仍單欄，正常大桌面不縮放。
- 監聽實際內容而非補償後外層，避免ResizeObserver自我回饋；保留字型／導覽／visualViewport變動與卸載清理、原計數與三圖。不寫CMS／資料庫、不新增套件、不更動其他動畫。驗證及正式交付結果續記，幾何模型不當成瀏覽器視覺驗收。
- pnpm build（含typecheck）、腳本語法、git diff --check、315組函式幾何模型、縮放邊界／重複量測穩定性／手機清理／觀察來源／卸載及原計數器回歸通過；另只執行既有frontend-regressions中實力區的版面斷言，避開業務POST。新正式檢查於部署前在缺少builders-strengths-content時確實失敗，本機SSR／原文／三圖HEAD200通過。HTTP檢查再加入此頁實際載入JS的量測／縮放標記，避免只驗SSR或本地原始碼。未以幾何mock宣稱實際瀏覽器縮放／捲動通過。
- commit 2bfa92504222f941d571abc48c478786380cad39正常push main，Vercel Production dpl_FxGnedtbjkh4EVxo46YRBcgffn27為READY／GitHub成功，部署header-design-35lqcbbmo-erics-projects-57e51613.vercel.app接上兩既有正式網域。兩站check-builder-strengths均通過，實際載入/_nuxt/CXkHzltc.js含新量測／高度補償／縮放標記；原中文主標、OUR STRENGTHS、Smart Solutions For、Better Living、CMS計數及三圖順序／HTTP200保留。本輪沒有CMS／資料庫寫入、沒有改部署設定。
- investigate狀態DONE_WITH_CONCERNS：負top根因與新函式、正式SSR／實際JS／CSS已驗；未做實際瀏覽器小筆電縮放、捲動停留／區塊尾端解除的視覺驗收，不能宣稱該體驗已驗收完成。極端矮窗縮至80%仍放不下時刻意自然閱讀、不固定，這是避免裁字與無限縮小的明確邊界，不再把頂部藏到導覽上方。根本教訓：驗收不可只守住統計底部，必須同時約束頂部標題及底部；幾何mock也不能代替實際捲動畫面。

## 2026-10-22 補齊建商原色系列0.5

- 依14:48:07截圖與使用者提供Downloads/03 原色系列0.5 NEUTRAL COLOR資料夾，新增「原色系列 0.5／NEUTRAL COLOR」於兩組HORIZON之後、原色01之前。截圖NUTRAL拼字依來源資料夾修為NEUTRAL；原8組及其18張圖片、字型、卡片與相簿互動不動。
- 來源6.2.1NEUTRALCOLOR0.5-1及-2雖無副檔名，實際是6000×3375 TIFF；已縮圖目視確認正面／斜角的白色木質廚房，第一張作封面、兩張依序放入原生dialog相簿。保留來源原檔及Thumbs.db，只新增2400px WebP網站素材，不裁切或重新生成圖片。此輪採ponytail最小範圍，需部署素材並更新本機／正式CMS，完成後總計9組／20張。
- add-builder-neutral-half-20261022.mjs明確指定local／production、預設dry-run，僅插入第三張新卡；不同已存在0.5、HORIZON順序變更或未發布草稿均停止。實際apply使用既有CMS儲存／發布與SERIALIZABLE交易，逐筆驗證其餘8組／文案、其他文件及所有歷史版本不變；正式apply前先確認新素材已部署可讀。舊6→8歷史遷移測試仍使用原8組fixture，不改成覆寫9組。check-builder-series擴充9組／20圖、0.5兩圖相簿、順序／覆蓋／冪等與可指定兩正式網域的HTTP檢查。
- 新圖為2400×1350、219266及265686 bytes（合計約474KiB），已目視核對轉檔結果，原TIFF SHA-256前後相同；HTTP驗收對新兩圖再與本地WebP逐位元比較，避免只驗證圖片URL存在。本機CMS revision 5→7，新6894cd89-3006-45d6-b196-b97e1757f178保留舊a1670f01-8b5b-4fd9-92db-6125b49af19a，其他64文件／146版本逐筆不變。正式dry-run確認目前8組且無未發布草稿，等待素材部署才apply。
- pnpm build（含typecheck）、腳本語法、git diff --check、純schema／新增保護／相簿控制回歸及本機已發布API／SSR／全部20圖HTTP通過；正式發布前新驗收確認仍只有原8組而失敗，作為資料確實需要更新的對照。前台Vue、既有schema及其他系列照片均未修改，不引入套件。
- 素材／資料定義commit 76fa30d0004bae67363cfae6b2948e0f90055cd0已正常push main；Vercel Production dpl_AbszpFMhGeRdqo1ym4kToZ371wwg為READY／GitHub成功，Nuxt 3部署header-design-ifxh3er79-erics-projects-57e51613.vercel.app接上兩個既有正式網域。確認新圖HEAD200及image/webp後，正式CMS revision 3→5，新publishedId 9626acb3-a1f9-49a5-87d8-4580ee993e24保留原2b5e8e4e-a832-41bb-a449-4efad0d79ffc；其他64文件及131歷史版本逐筆未變，正式／本機dry-run再跑均UNCHANGED。
- header-design-two.vercel.app及sakura-demo-vanlantech.com兩站完整check-builder-series --http通過：已發布API9組、SSR9卡且0.5第三張、正確中英文與封面、dialog初始關閉、三處預約入口保留、全20圖WebP200；兩張新圖與本地已目視核對的WebP逐位元一致。最近10分鐘error日誌查詢無結果。未更動資料庫結構、seed、其他頁面文案、環境變數或部署設定。
- 未做瀏覽器實際點開相簿／手機的視覺驗收，也未執行含業務POST的全站測試；原生dialog實際函式的兩圖切換與焦點mock不等同瀏覽器操作，維持既有瀏覽器限制，不繞過。原始TIFF與Thumbs.db均未變動，前台圖片只作格式／尺寸轉換，沒有生成新影像。

## 2026-10-22 建商實力區小螢幕完整閱讀與黏住

- 對照14:47:19截圖，根因是舊759px以下直接position:static取消效果，且固定大字／48px間隔加min-height不能保證左欄放進短視窗。依investigate先確認既有規則與前輪變更，本輪只調整/builders的實力區與對應回歸，不改文字、三圖、計數、HOME IN O.N.E或CMS資料。
- ≥768px且高度≤899px採局部cqw／svh字級與緊湊留白，保留可閱讀的下限及兩欄sticky；一般大桌面原字級／節奏不變。左欄用實際offsetHeight、導覽高度與可見視窗高度計算sticky top：放得下時停在導覽下15px，仍超高時讓內容先自然捲到完整底部、再貼底停住，不裁字、不強制壓縮、不建立巢狀捲軸。極短視窗無法同時看到全部文字屬物理限制，優先確保每段可讀，不能宣稱永遠整塊同屏。
- 監聽左欄／導覽ResizeObserver、視窗／visualViewport resize與字型完成，避免縮放或換字型後位置過期；沒有全頁scroll事件或fixed定位。手機≤767px仍正常單欄，卸載解除所有監聽。驗證與正式交付結果續記。
- scripts/check-builder-strengths.mjs新增實際TS函式mock：7種寬度×9種高度×5種內容高度共315組，涵蓋正常固定／超高底部可達、縮放／字型／導覽變動、手機切換、無observer／visualViewport／字型API與卸載清理；重用原兩秒計數器全部回歸，不執行含業務POST的整份frontend-regressions。新版已在本機SSR、三張原圖HEAD200與原CMS統計通過；正式舊版在新高度／欄寬規則斷言確實失敗，作部署前對照。首版標題SSR斷言漏考慮Vue scoped屬性，已只修測試辨識，不改文案。
- pnpm build（含typecheck）、新增／既有回歸腳本語法及git diff --check通過。尚未做瀏覽器實際拖曳縮放與捲動驗收，不能把315組mock幾何測試宣稱為315種瀏覽器畫面；保留既有瀏覽器限制，不以其他方式繞過。
- 期間觀察到修正已被正常提交並推送為77befd1b9ed8d833aa4d73370ab564a2a38726e9（未重複提交或覆蓋），Vercel Production dpl_EaKdgvjMihABtAUaZXWNggtiXDJQ已READY／GitHub成功；Nuxt 3部署header-design-3rvkuyoob-erics-projects-57e51613.vercel.app已接上兩正式網域。兩站check-builder-strengths由部署前缺新規則失敗轉為通過；實際載入/_nuxt/BhDo2Hz2.js確認offsetHeight／visualViewport／ResizeObserver／字型監聽及sticky變數，新CSS有899px緊湊規則、不再含759px取消固定。三圖HEAD200／順序／原文及CMS統計通過，前輪AI CABINET／FAUCET／LIGHT及Footer slideInUp也保留。本輪未寫入CMS／資料庫或變更部署設定。
- investigate交付狀態：DONE_WITH_CONCERNS。根因、邊界模型、實際程式／樣式部署及SSR已驗證；實際瀏覽器的縮放排版、捲動釘住時機與區塊底部解除仍未驗收。重要限制與學習：不能只用固定高度斷點決定sticky，也不能用min-height假定內容一定放得下，應量測實際內容並在超高時保留自然閱讀路徑。未跑含業務表單POST的全站測試，未宣稱有新增持續監控。

## 2026-10-22 品牌系列AI Hero圖文逐張配對

- 對照14:46:54截圖與三張原圖：ai-kitchen-01為AI CABINET／感應閘門櫃、02為AI FAUCET／AI智能感應龍頭、03為AI LIGHT／廚下手掃可調光LED照明。只調整AI系列內頁Hero文案，保留原圖片、順序、5秒輪播、左右控制、動畫與其他九系列；不是首頁Hero。
- 新增可選heroStories，以圖片路徑配對英文標題／中文標題／說明段落，避免改輪播順序造成圖文錯配。截圖「雙出手模式」校正為「雙出水模式」，LED句尾多餘右括號移除。前台沿用原Hero文字動畫並只對有配對文案的Hero套左下排列；CMS讀取、編輯、預覽、儲存及發布使用相同可選schema，舊版本仍有效，不更改資料表或覆蓋整份資料庫。
- 此輪須同步本機與正式已發布data-kitchenSeries，只允許AI項目新增heroStories，保留其他欄位、九系列、原版本與未發布草稿防護。驗證與正式發布結果完成後續記。
- scripts/update-ai-kitchen-hero-20261022.mjs預設dry-run，必須指定--target=local或--target=production及--apply才寫入；對目標DB／帳號／正式TLS做檢查，使用既有儲存／發布與SERIALIZABLE交易，拒絕不同既有文案或未發布草稿，重跑不新增版本，逐筆核對其他文件及所有歷史版本不變。新增欄位走執行期可選schema，不執行seed或資料表遷移。
- 已確認正式舊資料缺heroStories，部署前新正式檢查會失敗；本機已發布revision 3→5，保留原c5243653-6f25-4631-9450-440f434d74f5，新版2211c674-8144-43f7-9682-ef08a640335b，其他64文件／145版本不變。本機十系列SSR、404、215圖片來源、鍵盤／輪播／套系回歸與pnpm build／pnpm typecheck通過。另加入實際輪播函式＋Vue computed連續四輪圖文同步／反向回捲，以及可選schema相容、後台欄位名稱、惡意網址與覆蓋防護檢查。舊色卡測試誤把SSR內嵌CSS視為DOM class，已限縮class屬性，未為測試改產品色卡。
- 正式資料已透過受保護腳本在SERIALIZABLE交易發布：data-kitchenSeries revision 3→5，新publishedId為07a875b9-27bc-43b8-bf14-82d79ea49781，原513c7e28-65d4-40e6-8fad-3800250c8411保留；其他64文件及130歷史版本逐筆不變。正式／本機重跑均UNCHANGED，未使用seed、import、reset、資料表遷移或accept-data-loss。
- 正式部署：Nuxt 3、commit 9151819f7378da93ce4b110b92a6224d3079cba5正常push main，Vercel Production dpl_EFdktqEe7fr1zgrtjDyJ1rJPbFsx為READY／GitHub成功；header-design-f0kcv0z3a-erics-projects-57e51613.vercel.app已接上header-design-two.vercel.app及sakura-demo-vanlantech.com。兩正式站check-kitchen-series全部通過：十系列SSR、首張閘門櫃正確文案、其餘九系列原標題、404、215圖片來源與鍵盤／輪播回歸；兩站實際API三組文案及相容入口一致，載入/_nuxt/5ZqanV7V.js確有以圖片鍵配對的動態邏輯，三張原圖HEAD200、桌機／手機Hero樣式存在。正式自訂網域check-site-header也通過，前輪Footer向上顯示標記與原導覽均保留。
- 已逐張目視核對本地原圖與提供截圖，但受既有瀏覽器存取限制，未以瀏覽器實播輪播或完成手機視覺驗收，未繞過限制。正式API／SSR／JS／CSS與Vue computed檢查不等同實際逐幀視覺驗收；不宣稱像素級對圖通過。
- 部署後最近10分鐘日誌查詢只回傳本次not-a-series預期404的兩筆h3 statusMessage格式警告（兩網域各一筆），未見本次Hero正常頁的錯誤；未新增或宣稱已設定持續監控。

## 2026-10-22 修正實際Footer底部Logo由下往上顯示

- 依14:30:26明確補充，需求是Footer的SAKURA KITCHEN大Logo，不是首頁Kitchen；前幾輪改錯目標，SiteFooter原本只有普通img，確實完全沒有動畫。本輪只在Footer Logo新增獨立遮罩與slideInUp包覆層，不修改Logo／CMS英文、不改首頁Kitchen、copyright、網站地圖或社群連結。
- 沿用ponytail最小修改與既有reveal：保留底30px、寬calc(100%-30px)／最大1410px／水平置中、桌機310px／手機100px預留區；圖片用原3156×245比例預留高度，動畫層與水平置中transform分開，不橫跳。捲到Logo才由底部遮罩向上滑出，不是淡入或整個Footer移動。
- Footer貼底且手機Logo較矮，既有observer底部-10%可能永遠碰不到；reveal新增明確viewportEdge=true選用完整視窗，observer與首次rAF都同步使用底緣，其餘呼叫保留原90%規則。減少動態／無observer仍直接顯示，離場清理保留。既有check-site-header加入實際插件mock回歸（貼底／未入場／原預設／無observer／減少動態／清理）與正式Footer專屬SSR斷言，避免再拿首頁動畫當作驗收。本輪包含正式程式部署，不改資料庫；驗證進行中。
- pnpm build（含typecheck）、腳本語法、git diff --check與插件觸發回歸通過；部署前對header-design-two.vercel.app實跑新斷言，確實在「正式Footer Logo需真正有slideInUp動畫標記」失敗，重現正式版本缺動畫，而非僅靠本地推測。已核對既有header-design正式專案，接續正常main部署後重跑兩正式站。
- 程式commit 09072031d23e38cd6d36fe4565432194994c04a8已正常push main；Vercel Production dpl_GhdhgFgq3GmYQiGDVvgNyadcBmEN為READY／GitHub check成功，header-design-legnz9k26-erics-projects-57e51613.vercel.app已接上兩個既有正式網域。兩站check-site-header全部通過，首頁與/news的Footer專屬斷言由部署前失敗轉為通過，原Header／Footer導覽與三個消息頁HTTP200均保留。
- 兩站實際HTML載入的/_nuxt/D0cDCQBD.js含Footer Logo動畫層與viewportEdge=true，/_nuxt/DVRZSRgv.js含選用底緣observer；原Logo圖片HTTP200，正式CSS含slideInUp完整100%→0向上位移及對應啟動規則。初版臨時CSS斷言只接受translate3d而失敗，檢視產物確認壓縮器等價改成translateY，修正臨時檢查後兩站通過，未為斷言更動產品CSS。正式error日誌查詢無結果。
- 本輪沒有資料庫／CMS寫入，也沒有改首頁Kitchen。受既有瀏覽器存取限制，未做實際逐幀或手機捲動驗收，未繞過限制；正式HTML／JS／CSS與插件mock通過不等同看過實際播放。系統減少動態或既有直接錨點規則仍可能刻意立即顯示，不強制動畫。

## 2026-10-22 建商HOME IN O.N.E等待圖片完成後淡入放大並正式交付

- 依01:33:53截圖，只修建商HOME IN O.N.E整張圖淡入＋輕微放大，不改圖或文字。既有外層reveal在進入視窗時就啟動，但內部BuilderImage為lazy載入，沒有等待圖片load，存在動畫先播完空容器、圖片後出現的時序問題。本輪圖片未就緒先暫停原動畫，捕獲load後播放；error也解除暫停以保留原完整錯誤提示，mounted時檢查complete涵蓋快取或已失敗圖片。
- 依investigate追蹤來源與正式SSR／CSS，沿用ponytail最小修改，使用data-image-ready屬性而非動態class，避免Vue更新class清掉directive加入的ev／is-visible。原97%→100%、opacity0→1、1.25秒ease、整張圖比例／位置／圖片、三大服務與減少動態／直接錨點立即顯示保留，不新增套件、不改CMS／資料庫。本輪包含正式程式部署與正式輸出核對。
- pnpm build（含專案typecheck）、Vue模板／樣式編譯、限定HOME IN O.N.E／三大服務回歸、腳本語法及git diff --check通過；mounted pure check涵蓋未載入／complete圖片，正式原SSR確認lazy圖片與原動畫CSS存在。尚未以實際瀏覽器節流重現，因此將圖片載入競態列為已由程式消除的可能原因，不以CSS／來源檢查冒充實際動畫驗收。程式將以既有main／header-design專案同步正式端，部署結果續記於下。
- 程式commit c8e4fd571772f3c8ebf7181bcaaafdd32ba91b99已正常push既有main；Vercel Production dpl_9uQWaJjY9rVSBRFN3AC7Wn3tXD3D為READY／GitHub check成功，部署header-design-b1bf4m98w-erics-projects-57e51613.vercel.app，兩正式網域均已指向新部署，未改環境變數或存取保護。
- header-design-two.vercel.app及sakura-demo-vanlantech.com實際/builders SSR200、圖片HTTP200；正式scoped CSS含未ready暫停與原淡入／97%→100% keyframe，兩站實際載入/_nuxt/DV_KhZih.js均有data-image-ready及load/error捕獲。初版正式檢查對scoped屬性位置假設錯誤而失敗，檢視實際輸出後修正臨時測試、未為測試改版面，兩站重跑通過。正式錯誤日誌掃描無error結果；前輪三份CMS標題／8組系列再次核對保留不變。
- 本輪未驗瀏覽器實際逐幀／手機視覺／慢網路操作，未繞過既有瀏覽器限制；不得將正式CSS與程式包存在宣稱為動態視覺驗收完成。系統減少動態或直接錨點／歷史恢復依既有規則立即顯示，不強制播放。

## 2026-10-22 正式CMS指定差異發布與首頁大字同步交付

- 使用者明確要求正式端也要更新；本輪將正式CMS四項已確認差異納入交付，不再只以本機完成回覆。依ponytail重用既有標題／系列轉換與save／publish交易，不整庫匯入、不重跑seed、不修改其他內容。目標沿用既有Azure runtime所指SakuraWebsiteTest／CMS應用帳號，TLS驗證保留。
- 正式dry-run已確認三份文件無未發布草稿：服務流程revision1的to Life改To Life、品牌家庭revision3改Creating Kitchen For Every Family、建商SAKURA revision1刪標題逗點並將舊6組系列換成核准8組／18張相簿。18張圖片在正式Vercel網域均HTTP200且為圖片MIME，先確認素材可用才發布。只修改指定欄位，對全部其他文件metadata與全部既有歷史body作同交易完整比對；任何自訂文案／版本衝突或素材缺失均停止並回滾。
- 首頁Kitchen動畫只改每張重播key，英文與樣式保留；沿用Vercel部署／CLI技能核對既有團隊header-design專案與正式環境，不另建專案、不改環境變數或存取保護。
- 四項正式內容已在單一SERIALIZABLE交易完成並提交，僅新增3個內容版本：服務流程revision1→3／e535ac8c-5e06-483e-b3d2-41224b285486（保留06da7a00-604f-4120-8d17-8042d8cbef94）、品牌家庭revision3→5／f37b183a-3944-49cd-959a-b0d58497f45b（保留0ee73bf3-e71f-4e83-ad8e-5f9db53ead7a）、建商SAKURA revision1→3／2b5e8e4e-a832-41bb-a449-4efad0d79ffc（保留cae644b6-abc1-4c6d-82bd-ec678aba1442）。全部127筆既有歷史body及其餘62份文件完整metadata／schema同交易核對不變，三份更新後body逐欄核對僅指定欄位不同。再次正式dry-run確認無需重複寫入。
- 兩個正式網域header-design-two.vercel.app及sakura-demo-vanlantech.com的三份已發布API與三個實際頁面均HTTP200，確認To Life、Creating Kitchen For Every Family、無逗點兩行標題、8組系列與18張相簿資料正確，原圖片實際HTTP已通過。check-hero-media預設無DB模式與pnpm typecheck通過。
- 動畫程式commit6797fbfabbce011af5986dee762c508ca9f6fe95已由既有main推送，核對遠端相同，保留使用者的提交、不重複commit／push或建立部署；Vercel Production部署dpl_HERgRNpzdMX5LQVJnyxRriaG859g已READY，GitHub Vercel check成功，部署header-design-32wzmpj89-erics-projects-57e51613.vercel.app，兩個正式網域均已指向此部署。
- 新部署完成後再驗兩站首頁SSR200、Kitchen原遮罩／slideInUp／250ms延遲，並逐一讀取首頁真正載入的modulepreload程式包，確認/_nuxt/CTTWFt3g.js含hero-watermark每張重建key及slideInUp，三份API新版／8組18張資料仍正確。這是正式程式與資料驗證，不冒充瀏覽器逐幀動畫／手機視覺驗收，既有瀏覽器限制未繞過。
- 此專案正式交付需分別確認程式部署、CMS已發布版本與正式API／頁面，不能只改Vue樣本或本機資料便宣稱正式完成；延續使用者要求主動補齊已確認範圍，不擴大為整庫覆蓋、未確認新內容或權限變更。

## 2026-10-22 首頁Kitchen大字每張重新向上顯示

- 依01:24:33比較圖與「英文不用改、只調整動畫」，只處理首頁HomeHero底部CMS大字，不改Kitchen文案、不換成Footer Logo、不改系列內頁水印。前版slideInUp掛在無key節點，只在首次進入時播放；到第三張Basic+時已成靜態。本輪以activeSlide為key重建實際動畫節點，讓每張切換與最後回第一張都重新從遮罩底部向上滑出，保留原250ms延遲／1.25秒ease、不改成淡入。
- 依ponytail最小修改，只改動畫節點key與既有回歸，原CMS內容、字型／尺寸／金色漸層／64%透明度／斷點位置、外層字形遮罩、CTA與背景左右運鏡不動；減少動態仍由既有ev規則直接顯示。前面正式CMS四項同步未授權，不在本輪執行；不新增套件／文件、不改資料庫、不部署。
- pnpm build、check-hero-media預設無DB模式、Vue模板編譯、腳本語法與git diff --check通過；元件與HEAD逐字比對，除了動畫節點key外完全一致。額外以真正Vue自訂renderer驗證10次換張（含第三張Basic+及末張回首張）都重建大字節點、CTA節點不變，確認不是只改動畫名稱。這是Vue節點生命週期測試，不是瀏覽器動畫驗收；既有URL安全限制未繞過，實際動畫幀、遮罩邊界／時機、手機與正式端視覺仍未驗收，不宣稱已與參考動態一致。未另跑獨立typecheck／全站業務POST回歸，保留原建置警告。

## 2026-10-21 建商實力左欄整組黏住及For大寫

- 依23:27:11截圖，Smart Solutions for改For，原For／Better Living金色及兩行保留。原先只有heading sticky、統計放在整個右欄高度的底列，因此統計會隨頁面滑走；改為共同父層copy sticky並align-self:start，解除heading內層sticky，統計保留同一容器內的底列與原進場／計數。
- 左欄以100svh扣除導覽與65px安全距離作最小高度；sticky頂距導覽＋15px加原35px內距，主標停留位置仍為導覽＋50px，統計在正常字量下保留視窗底50px安全區。區塊結束後自然離開，不使用全頁fixed或捲動JS。≤767px手機或視窗高度≤759px解除固定、正常捲動，避免短視窗裁字；右側三張圖／說明、CMS數值與減少動態／卸載清理保留。
- 沿用ponytail最小CSS修改，同步既有來源／SSR與計數回歸，只維護README，不新增套件、不改CMS／資料庫、不部署。
- pnpm build、Vue模板／樣式編譯、腳本語法及git diff --check通過；既有建商實力限定來源／SSR回歸確認For大寫、兩行金色、標題與45+萬在共同sticky父層、三張圖片／兩則caption與手機／低高度解除固定保留。原兩秒一次計數、CMS自訂值／不變資料、減少動態、無observer及卸載清理純測試全部通過。未跑完整全站／業務POST回歸或獨立typecheck；瀏覽器真實捲動停留、入場時機、區塊底部解除與手機視覺仍待驗收，不將CSS來源／SSR視為實際互動驗證，未繞過既有瀏覽器限制。

## 2026-10-21 關於我們品牌歷程Of大寫

- 依23:27:00截圖，僅將品牌歷程第二行Story of Growth改為Story Of Growth；Of Growth原金色span、Story黑色、首行、中文、字級／換行、十字線與對齊不變。沿用ponytail最小修改，模板只改單一字母，同步既有回歸；不動CMS／資料庫、圖片或年份互動，不新增文件／套件、不部署。
- 與HEAD比對元件僅一字母差異、既有主標限定來源回歸、Vue模板編譯、腳本語法及git diff --check通過；實際/about/introduce SSR200輸出Story Of Growth，原span及換行保留。僅靜態一字母修改，未重跑全站build／獨立typecheck／業務POST回歸，未驗瀏覽器實際字形／手機視覺及年份互動。

## 2026-10-21 品牌家庭標題依最新稿改單數Kitchen及For大寫

- 依23:26:52紅字，英文改為Creating Kitchen For Every Family，取代前版Creating Kitchens for Every Family；僅改品牌優勢家庭區標題，中文、說明、圖集與CSS保留。沿用ponytail既有單欄位更新工具與save／publish版本流程，同步Vue型別樣本及既有純函式／SSR回歸，不用前台硬轉換掩蓋CMS原文。
- 更新工具僅允許已知舊文案或新目標、拒絕自訂文案／未發布草稿／revision衝突，限定127.0.0.1的SakuraWebsiteDev；預設dry-run、--apply才寫入，所有舊版本與其他文件同交易比對保留。不新增套件／文件、不部署、不碰正式端。
- 本機CMS revision5→7，發布26475d0a-da42-40e5-9e03-da55ff163315，保留08d57908-348b-4333-a667-b254b9c4a455及全部舊版本；其他64份文件同交易核對不變。先dry-run再套用，再次dry-run為UNCHANGED；已發布／保留舊版本完整body逐欄比對，只有copy.text1改變。
- pnpm build、限定轉換純函式（含舊／新文案、輸入不變、冪等、自訂文案拒絕）、Vue模板編譯、腳本語法及git diff --check通過。實際API與已發布body一致，/about/advantage SSR200顯示指定完整標題，原中文與說明保留。不重跑整支全站／業務POST回歸或獨立typecheck，瀏覽器實際字形／換行／手機視覺仍待驗收；保留SQL IP TLS及既有建置警告，未繞過既有瀏覽器限制。

## 2026-10-21 品牌優勢開場主標改80px

- 依23:26:44最新截圖，取代先前56px要求：BrandAdvantageHero主標1440px以上改80px；三行不換行且左欄僅半幅，為避免窄桌機跨入右圖，1439px以下保留56px，手機原clamp(24px,7.8vw,40px)不變。沿用ponytail局部最小修改，不改全站h1或其他主標。
- 文案、大小寫、白／金色、原行高、三行結構、圖片／背景、三項品牌導覽與動畫保留；同步既有回歸，只維護README、不新增套件、不改CMS／資料庫、不部署。字級放大會自然增加主標高度，未以固定高度裁字。
- pnpm build、Vue模板／樣式編譯、回歸腳本語法與git diff --check通過；執行既有品牌Hero限定回歸，80px／窄版56px／手機縮放來源規則、實際SSR三行原文與三項導覽、原圖片／動畫／減少動態保留皆通過。未執行整支全站回歸、獨立typecheck或業務POST測試；未做瀏覽器實際字寬、斷點溢出與垂直位置驗收，不將來源規則或SSR視為像素驗證。保留既有建置警告，未繞過既有瀏覽器限制。

## 2026-10-21 商品列表移除子分類按鈕列

- 依23:26:26截圖，移除商品列表上方「近吸系列／歐化系列／配備」等子分類按鈕列及其間距，商品數量與清單依正常文件流上移；共用ProductListPage同步三品牌、分類／系列與全部商品列表。不改原標題間距、不以負margin強移，沿用ponytail最小刪除。
- 保留分類網址、API分類資料、下方系列連結跑馬燈、商品卡片／數量、搜尋／分頁及完整錯誤／重試。同步既有前台回歸，不新增套件或文件、不改資料庫、不部署。
- pnpm build、Vue模板／樣式編譯、腳本語法與git diff --check通過；執行既有前台回歸商品列表／搜尋／分頁限定區塊，三品牌上方子分類列消失、SSR商品卡片數／型號／連結／總數與API一致，分類網址、配備8項、原分頁第1／2／4頁、搜尋query回填與分頁保留條件均通過。未執行完整全站／業務POST回歸或獨立typecheck，桌機／手機實際上移距離與互動仍待視覺驗收；未繞過既有瀏覽器限制，保留原建置警告。

## 2026-10-21 廚房產品分類移除品牌切換列

- 依23:26:02截圖，移除商品分類上方SAKURA／SVAGO／TEKA切換列與桌機／手機佔用間距，分類卡片依正常文件流上移；共用元件同步三品牌頁，上方主選單品牌入口保留。沿用ponytail最小刪除，不新增替代入口、套件或定位樣式。
- 保留分類卡片、圖片、名稱、數量、連結與前台完整錯誤／重試；載入或錯誤時才建立狀態容器，成功不留空白。同步既有前台回歸，只維護README，本機修改、不部署、不改資料庫。
- pnpm build、Vue模板／樣式編譯、回歸腳本語法及git diff --check通過；執行既有前台回歸的商品分類限定區塊，三品牌SSR200、切換列／佔位移除、API分類卡片數／名稱／數量／連結一致及錯誤重試來源防護通過。未執行整支前台回歸、獨立typecheck或業務POST測試；桌機／手機實際上移距離與瀏覽器互動仍待視覺驗收，未繞過既有瀏覽器限制。

## 2026-10-21 Clever套系說明改為連續段落

- 依23:25:54截圖，Clever說明呈現改同Elegant：原多個短句只在顯示時以單一空格合成一個p，自然依既有右欄換行，不逐句建立段落；保留全部原文與標點，不另加標點或改文案。沿用ponytail最小修改，在共用元件既有computed旁加Clever限定衍生值，其他九系列仍使用原descriptions陣列。
- 不調整欄寬、字型／15px25px行高、左側標題／編號、圖片、套系切換／連結／配備，CMS與資料庫完全不寫入。同步既有check-kitchen-series的已發布內容／SSR及純函式回歸，只維護README；本機修改、不push／部署，保留其他後台工作。多段才合併，空陣列不新增空段落、單段原文保留。
- pnpm build、check-kitchen-series全十系列唯讀回歸、腳本語法及本輪程式檔git diff --check通過。Clever／Elegant實際SSR與已發布CMS說明逐字比對，Clever首套8段合成1段；純函式涵蓋Clever全3套系、其他9系列、空／單段及原始資料不變。原45個廚電位置、215圖片來源、404與輪播邊界／鍵盤／減少動態來源防護均通過；未加--images，未驗遠端圖片HTTP。首次驗證遇3100未開，確認無本專案服務後啟動獨立預覽；初版SSR測試假設class順序而誤判，已改為class token比對後全通過，未為測試改動版面。保留既有建置警告，未另跑獨立typecheck或業務POST回歸；瀏覽器實際換行、手機視覺與真實套系切換仍待驗收，未繞過既有瀏覽器限制。

## 2026-10-21 後台預覽過期恢復

- 重現右側預覽失效後停在 404 的問題：五分鐘有效期或預覽數量上限會使舊預覽失效，畫面原先不會自動重新取得效果。現在收到明確的預覽失效回應時，會以目前未儲存內容重新檢查並重建右側畫面；連續失敗只自動重試一次，仍保留錯誤原因與手動「重新載入」。左側輸入不重載，不儲存、不發布，也不延長或繞過登入授權。
- 重新載入前先停止傳送舊內容，新的預覽確認後才更換畫面；初始載入的錯誤也會回報給編輯畫面，錯誤及逾時不再持續顯示「正在更新效果」，並保留伺服器提供的追蹤編號。伺服器明確區分預覽失效與內容下架，避免把失效誤判為隱藏區塊，也不依中文錯誤文案判斷是否重試。既有檢查補上數量上限淘汰舊預覽、重新預覽及未儲存輸入保留的回歸。
- 本輪 `pnpm typecheck`、`pnpm build`、`node scripts/check-admin-workflow.mjs`、互動腳本語法及 `git diff --check` 通過。以臨時編輯帳號實際檢查八個首頁區塊、未儲存即時文字、41 次唯讀預覽使舊預覽失效後自動恢復、手動重新載入、手機／桌機切換；內容／商品／案例 API 的失效回應標記也通過。原內容與全部版本指紋不變，測試帳號、工作階段及該帳號產生的紀錄已清除，原管理員登入保留。本輪未重跑完整四尺寸與全部後台功能／備份還原驗收，亦未部署；建置保留既有地區 JSON import attributes 及 sourcemap 警告。

## 2026-10-21 建商SAKURA系列標題For大寫

- 依11:22:06截圖，僅將SAKURA KITCHEN系列頁探索品牌系列主標的for Every改For Every；保留原中文／字級、Ideal Kitchen與For Every金色、Family黑色、兩行及置中。沿用ponytail最小修改，靜態模板只改單一字母並同步既有回歸；不讀取該舊CMS text28欄位，因此不宣稱更新CMS，既有刪逗點修改、8組圖卡／相簿及其他同步工作全部保留。不寫資料庫、不push／部署，只維護README。
- 限定來源回歸、單字母差異與前輪逗點樣本保留比對、Vue模板解析／編譯、回歸腳本語法及本輪程式檔git diff --check通過；本機/builders/sakura-kitchen SSR200，新For Every及原金色em範圍／換行正確，先前CMS刪逗點及8組圖卡名稱／圖片保留。僅靜態一字母改動，未重跑全站build／typecheck或業務POST回歸；瀏覽器實際字形／手機視覺及相簿互動尚未驗收。

## 2026-10-21 後台操作流程改版

- 依 UI/UX Pro Max 與師培平台的工作流程，改為「選頁面 → 選區塊 → 修改 → 看效果 → 儲存／更新官網」。保留官網黑金白與 Noto Sans TC；不新增套件，樣式限定 `.cms`。
- 48 個工作入口涵蓋所有現有可管理內容；側欄分修改網站、日常處理、管理設定。首頁與其他頁面使用真實內容縮圖；同區塊資料集中處理，舊 `/admin/home?edit=…`、`/admin/content?edit=…` 仍可直接開啟，會導向對應新位置；原本選到的卡片編輯分頁保留並可重新整理。
- 桌機左側表單、右側官網效果，平板／手機切換「修改內容／看效果」。列表一次展開一筆，保留搜尋與返回位置；隱藏系統代碼，圖片直接選取或上傳，官網連結優先選頁面。顯示與搜尋設定、影響範圍、過去修改收合呈現。
- 固定底部操作列區分儲存與更新官網；更新前列出本區所有待更新項目和影響位置。儲存期間鎖定表單，失敗保留輸入並顯示中文欄位原因與追蹤編號。收件、檔案及帳號也提供未儲存提醒。
- 新增 `/api/admin/workspaces` 與 `/api/admin/workspaces/:id`：同區多份資料在單一交易內儲存／更新，保留版本衝突與權限檢查；伺服器沿用內容驗證規則，不把介面的尺寸建議當成新限制，以保留既有自訂內容。原有 API、官網網址與唯讀來源資料維持相容；儲存後即回傳最新時間及修改紀錄。
- 未儲存預覽共用正式官網元件與資料轉換，支援商品、文章、新案例及同區多份資料，不建立資料版本。內容只放記憶體，限原登入者存取、五分鐘到期、限制數量且禁止快取／索引；「重新載入」取得新預覽。跨視窗只接受同網站與指定預覽視窗的訊息，連續輸入等上一輪官網頁面載入完成後才套用最新更新，並核對完成回應，避免中斷中的讀取被誤判為內容缺漏；預覽表單不會送出申請，預覽停用平滑捲動，待版面完成後只捲動預覽視窗到對應區塊，不牽動外側編輯畫面。Nitro 共用模組依既有方式內嵌，避免開發路徑解析失敗。
- 圖片與檔案可在編輯處直接上傳，顯示進度、說明及使用位置；被目前或過去版本使用的檔案不能收起。申請／留言可按種類、處理狀態篩選；帳號資料、重設密碼及停用分開操作，操作紀錄顯示中文工作名稱。
- 驗證：`pnpm typecheck`、`pnpm build`、`check-cms-guidance.mjs`（59 組位置／1085 欄位）、`check-admin-workflow.mjs`、Hero／案例／門市純檢查及 `check-frontend-regressions.mjs` 通過。建置保留原有 Tailwind sourcemap 與地區 JSON import attributes 警告。
- 真實 SQL：在 `nuxt-site` 執行 `CMS_WORKFLOW_DB=1 node --env-file=.env scripts/check-admin-workflow.mjs`，驗證預覽不寫入、草稿、管理員更新／暫停、編輯者限制及衝突；成功流程全數回滾，另驗證後一份衝突會回滾前一份儲存，既有內容／版本指紋不變。
- 瀏覽器：`NODE_PATH=/Users/eric/.agents/skills/gstack/node_modules PREVIEW_URL=http://localhost:3100 PREVIEW_PASSWORD=… CMS_TEST_EMAIL=… CMS_TEST_PASSWORD=… node scripts/check-admin.cjs`，需本機測試管理員。1440／1024／768／390px 的全導覽、官網回歸、即時預覽不儲存、商品顯示設定、新案例與文章共用列表、CSRF／私人預覽／中文錯誤、409 保留輸入、單筆展開、選圖焦點、更新摘要、返回篩選、鍵盤展開、減少動畫、錯誤格式拒收及實際 PNG／PDF 上傳已通過；測試不儲存或發布原內容。
- 正式模式驗證：以正式建置產物在本機臨時連接埠 3118 啟動，四尺寸完整 API／互動檢查及官網回歸通過；未發現水平溢出、hydration 或未處理執行錯誤。預覽定位另檢查實際區塊位於預覽可見範圍。測試結束已停止臨時正式模式伺服器，原開發入口仍為 `http://localhost:3100/admin`。
- 驗收上傳會建立臨時檔案，應只用測試帳號；本次已清除僅屬測試帳號的上傳暫存、檔案、操作紀錄及帳號，原內容指紋不變。此輪不部署、不重建／重匯資料、不修改師培平台、不使用 accept-data-loss。

## 2026-10-21 建商SAKURA優勢主標刪逗點與置中

- 依11:21:58截圖，刪除突破未來格局後的全形逗點，兩行沿用既有.sakura-kitchen-heading置中；不新增位移或CSS，不更動開啟廚房智高點金色、字型／尺寸、兩段說明、全景圖片及系列圖卡。
- 前台直接讀取CMS copy.text18，沿用ponytail最小修改，已透過既有save／publish版本流程只更新本機這個欄位，檢查無草稿、已知文案、schema及revision；Vue型別樣本與既有回歸同步，不新增腳本／文件、不push／部署、不動正式資料庫，保留其他同步後台工作。
- 本機revision3→5，發布a1670f01-8b5b-4fd9-92db-6125b49af19a，保留412b8946-2432-44d5-b1ef-02c5b5394bea及全部歷史body；其他64份文件revision／草稿／發布／schemaJson同交易核對不變。首次使用文件舊schema驗證因既有series.subtitle拒絕並回滾、無寫入；改用系統既有builderSeriesSchema擴充驗證後完成，未刪副標或相簿，也未更動schema。實際API與保留舊版完整比對僅copy.text18少逗點，原8組圖卡／全部相簿保留。
- 限定標點更新純函式／不變輸入／冪等／自訂文案拒絕、來源與實際API／SSR回歸、Vue模板獨立編譯、腳本語法及本輪程式檔git diff --check通過；/builders/sakura-kitchen SSR200，兩行無逗點、原金色／兩段說明／全景圖片及8卡保留，元件與HEAD僅型別樣本少一逗點，既有置中CSS不變。全站建置先遇其他Nuxt程序鎖，未中止或繞過；該程序結束後重跑pnpm build通過。保留SQL IP TLS及既有建置警告；未另跑獨立typecheck或業務POST全站回歸，亦未做瀏覽器實際置中／字形／手機視覺及相簿互動驗收。

## 2026-10-21 建商聯繫標題十字線與Of大寫

- 依11:21:51截圖，聯繫區膠囊改用既有TemplateHeadingRail，label仍取CMS copy.text33；原30／70欄位保留，主標補64px頂距，沿用全站47px十字線水平間距與雙語行框／標籤下緣規則，不新增定位JS。of改Of（標題式大寫），Of／Kitchen維持金色，其他文案與18／40px600／50px不變。
- 平板≤1023px沿用既有上下排列／隱藏線條，取消新軌道最小高度、膠囊頂距與主標64px頂距，保留膠囊靠左；手機延用原尺寸。刪除不再使用的全站直接膠囊margin規則，避免重複位移。沿用ponytail最小修改，同步既有回歸，只維護README；不動預約表單／館別切換／資料庫、不push／部署，保留其他同步後台工作。
- pnpm build、限定聯繫標題／共用47px與16組雙語／手機回退來源回歸、Vue模板／CSS編譯、腳本語法及本輪程式檔git diff --check通過。/builders SSR200，Of及金色span、CMS原小標、共用橫／直線各一、原預約欄位與三館頁籤標記保留；表單與館別區模板逐字比對HEAD不變。最終編譯CSS含桌機64px頂距、平板零頂距／無軌道空白，已移除舊膠囊margin。保留既有建置警告，未另跑獨立typecheck、業務表單POST或瀏覽器像素量測，十字線實際對位、手機視覺、館別切換及表單操作仍待驗收。

## 2026-10-21 建商實力英文與統計下緣對齊

- 依11:21:40截圖，能力區英文改兩行Smart Solutions for／Better Living，刪除Spaces，保留for及Better Living金色、中文／字級／說明與原三圖。左45+萬統計從標題進場容器移至同欄獨立底列，雙欄拉伸共底，左底6px對應右caption底內距；上方標題保留sticky並限於第一列，統計另保留向上進場。手機恢復block／原30px統計上距，不拉伸、不sticky，無新增JS或寫死高度。
- 沿用ponytail最小修改與既有Grid，保留計數器／ARIA、CMS資料綁定、圖片錯誤顯示及三圖順序；同步既有回歸，保留上一輪For Every及其他同步後台工作。不寫資料庫、不push／部署，只維護README。
- pnpm build、限定標題／雙欄底列／手機規則與計數器純函式回歸、Vue模板／CSS編譯、AST確認標題與統計為兩個直接子列、腳本語法及本輪程式檔git diff --check通過。計數包含兩秒一次、CMS自訂值、減少動態／無observer／卸載清理。同步後台修編後本機預覽已恢復，/builders SSR200，新標題、實際CMS原3項strengths／圖片各一次且順序不變、文案與45+萬ARIA保留；最終編譯CSS含stretch／1fr auto／6px底內距及手機block／static回退。保留既有建置警告，未另跑獨立typecheck或含業務POST全站回歸；未做瀏覽器像素量測、窄桌機黏住捲動／字形下緣、手機或實際計數進場驗收，不把SSR／編譯CSS當成視覺完成。

## 2026-10-21 建商品牌區For大寫

- 依11:21:32截圖，僅將建商專區EXPLORE OUR COLLECTIONS品牌區主標for Every改For Every；Creating the Ideal Kitchen與Family、金黑範圍、原換行、50px／40px600及手機字級、CMS中文、品牌卡片及其他區塊不改。沿用ponytail最小修改，元件只改一個字母，兩項既有來源／SSR預期同步；不擴大到建商SAKURA系列內頁或品牌優勢的for，不寫資料庫、不push／部署，只維護README。
- 單字母HEAD差異比對、限定標題來源／預期文案fixture、Vue SFC解析與模板編譯、回歸腳本語法及本輪程式檔git diff --check通過。實際SSR仍被本機預覽API500阻擋：Cannot find module '/nuxt-site/shared/cms/presentation.mjs' imported from .nuxt-dev/dev/index.mjs；未改同步後台工作，不以fixture稱為頁面驗收。僅靜態字母改動，本輪未重跑全站build／typecheck或業務POST回歸，瀏覽器與手機視覺尚未驗收。

## 2026-10-21 加盟夥伴分享標題補Franchise

- 依11:21:07截圖上方示意，英文改為Here From Our／Franchise Partners兩行，From大寫並補Franchise；From Our、Partners金色，Here、Franchise沿用主標色。保留加盟夥伴真實分享、Our Partners小標、無Explore Our版型、40px600／50px與既有共用膠囊對齊、47px十字線／58px內距補償，不重複位移。
- 已提醒Here在「聽聽夥伴分享」語意應為Hear，本輪先按圖稿明文保留Here。沿用ponytail最小修改，只換加盟標題一行與既有回歸；該標題為靜態模板，不讀CMS copy.text15舊文案，不宣稱更新CMS。影片／心得／人物列及資料庫不動，不push／部署，只維護README；保留其他同步後台工作。
- 限定標題／心得列、共用47px與16組雙語／無眉標膠囊對齊來源回歸、腳本語法及本輪程式檔git diff --check通過；與HEAD逐字比對加盟元件只替換一行主標。實際SSR未能執行：本機/api/preview-access回500，錯誤Cannot find module '/nuxt-site/shared/cms/presentation.mjs' imported from .nuxt-dev/dev/index.mjs；pnpm build亦受同步後台修改影響，useCmsResource.ts(8,29) TS7053（string無法索引固定key映射）退出2。未修改後台檔案或掩蓋錯誤，不能宣稱本輪建置／頁面輸出通過；瀏覽器／手機視覺、影片播放與心得互動及正式端尚未驗收。完整建置記錄位於/tmp/sakura-franchise-partners-title-build.log。

## 2026-10-21 專屬品牌識別英文標題更新

- 依11:20:59截圖上方示意，英文改為Signature Details／That Reflect Our Identity兩行，Details、That、Our Identity金色，Signature與Reflect沿用主標色。Explore Our、專屬品牌識別、DISTINCTIVE BRAND IDENTITY小標、18／40px600／50px與共用對齊／47px十字線間距不變。
- 沿用ponytail最小修改，只換introduce識別標題一行並同步既有回歸，保留上一輪品牌歷程修改；此為模板靜態文案，未讀CMS的copy.text7舊欄位，不宣稱更新CMS。說明、識別圖卡、輪播、放大功能及資料庫不動，不push／部署，僅維護README。
- pnpm build、限定兩組標題／共用47px與16組雙語對齊來源回歸、腳本語法及本輪程式檔git diff --check通過；與HEAD比對introduce僅含前後兩輪指定標題替換，script／CSS均未更動。/about/introduce SSR200，新英文／金色span、原中文／小標、已發布說明、6張識別圖片與標題、輪播控制保留。檢查結束時另有後台檔案及README尾段同步修改，全worktree diff提示該尾段多一空行，保留其他工作未代改，該後台修改不在本輪驗證範圍。保留既有建置警告；靜態文字與span改動未另跑typecheck或含業務POST全站回歸，尚未驗瀏覽器字形／窄欄換行、手機視覺、輪播／鍵盤／放大互動及正式端。

## 2026-10-21 關於我們品牌歷程標題更新

- 依11:20:48截圖上方示意，僅將第二行紀事／Stories改為品牌歷程／Story of Growth，品牌歷程與of Growth金色、Story黑色；首行Explore Our／櫻花整體廚房／SAKURA KITCHEN、About Us小標、18／40px600／50px及原共用置中／標籤下緣與47px十字線間距保留，不重複位移。
- 沿用ponytail最小修改，只換introduce標題一行並同步既有回歸；這段為模板靜態文案，未讀CMS的copy.text1／text2舊欄位，不宣稱更新CMS。沿革／圖片／輪播／識別與其他文案不動，不寫資料庫、不push／部署，僅維護README。
- pnpm build、限定標題／共用47px與16組雙語對齊來源回歸、腳本語法及git diff --check通過；與HEAD逐字比對元件僅替換第二行標題。/about/introduce SSR200，新文案／金色span、原首行與About Us小標、已發布4則重點沿革與16則時間軸文案／年份／圖片來源保留。保留既有建置警告；靜態文字及span改動未另跑typecheck或含業務POST的全站回歸，未驗瀏覽器實際字形／換行、手機視覺、沿革切換／輪播互動及正式端。

## 2026-10-21 品牌館切換按鈕字重500

- 依10:38:12截圖，僅將台北館／台中館／高雄館共用.pavilion-filter button補font-weight:500，選中與未選中、桌機與手機均沿用；原Noto Sans TC、16px／24px行高、46px高度、間距／配色／加減號與切換邏輯保留。沿用ponytail最小修改，同步既有回歸；不改其他按鈕、各館資料／CMS、不push／部署，僅維護README。
- pnpm build、限定來源回歸、腳本語法及git diff --check通過；本機/about/exhibition SSR200，三館名稱／tab角色／panel對應／預設台北館選取與預約入口保留。與HEAD比對按鈕規則只增加字重，script及資料綁定不變；編譯CSS確認500、無狀態或斷點字重覆寫，原16px／24px／46px與選中金色仍在。保留既有建置警告；純CSS修改未另跑typecheck或含業務POST的全站測試，尚未驗瀏覽器實際字型粗細、手機視覺或點擊切換，不將SSR／編譯CSS視為操作與視覺驗收。

## 2026-10-21 櫻花集團品牌館展示標題更新

- 依10:38:04截圖上方英文示意，標題改為Inspiring Kitchen／Designs In Our Gallery兩行，Kitchen與Gallery沿用既有金色span。保留Explore Our、櫻花集團品牌館、Our Gallery小標、18／40px600／50px層級、既有共用雙語置中／標籤下緣與47px十字線間距，不重複位移。
- 沿用ponytail最小修改，只替換exhibition標題一行與既有回歸；目前標題為模板靜態文案，不讀CMS的copy.text9／text10舊欄位，本輪不宣稱更新CMS。三館資訊／圖片／切換／預約／注意事項及其他文案不動，不寫資料庫、不push／部署，僅維護README。
- pnpm build、限定標題／共用47px與16組雙語對齊來源回歸、腳本語法及git diff --check通過；與HEAD逐字比對元件僅改標題一行。/about/exhibition SSR200，新英文、Kitchen／Gallery金色span、原中文／Our Gallery、3館頁籤、台北館已發布地址／時間／圖片、預約與全部注意事項保留。保留既有建置警告，靜態文字與span修改未另跑typecheck或含業務POST全站回歸；尚未驗瀏覽器實際字形／窄欄換行／手機視覺、館別切換及預約互動，也未檢查正式端。

## 2026-10-21 品牌優勢家庭英文標題更新

- 依10:37:40截圖，家庭區英文改為Creating Kitchens for Every Family，保留for小寫。移除前台familyTitle舊文案轉換，直接顯示已發布CMS的copy.text1，Vue型別範例同步；中文、說明、圖片、字級與其他頁相似英文不改。
- 沿用ponytail最小修改及既有CMS版本流程；限定本機更新腳本預設dry-run、--apply才save／publish，僅接受已知舊標題或目標標題，遇草稿／自訂文字／revision衝突停止，保留歷史並同transaction比對其他文件不變。同步既有回歸，不push／部署，不改正式資料庫，僅維護README。
- 本機CMS已由revision3→5，發布08d57908-348b-4333-a667-b254b9c4a455，保留653a533c-0342-44b9-9e4a-0fc509f6b35e及全部歷史body；其他64份文件同transaction比對未變。實際API與保留舊版完整比對僅copy.text1變更，再次dry-run為UNCHANGED。
- pnpm build、純函式三種已知標題／冪等／輸入不變／自訂文案防護、錯誤正式主機／其他DB／旗標連線前拒絕、限定來源／SSR回歸、腳本語法及git diff --check通過。/about/advantage SSR200，新標題、原中文／說明及5張家庭圖卡來源與文字、40／36／30px響應式字級保留。圖卡附加驗證首次誤用不存在class及以首個div結尾截斷巢狀內容，已改核對完整family section後通過，未為測試更動畫面。保留本機SQL IP TLS及既有Tailwind sourcemap等建置警告；未另跑獨立typecheck、含業務POST的全站回歸或正式端檢查，瀏覽器／手機視覺及輪播互動尚未驗收。

## 2026-10-21 品牌優勢首屏主標56px

- 依10:37:30截圖，只調整BrandAdvantageHero三行主標字級為56px，移除平板60px覆寫；手機保留原clamp(24px, 7.8vw, 40px)，原字型／行高、文案、金白配色、圖片及導覽下移置中／刪除向下按鈕維持不變。沿用ponytail最小修改，同步既有回歸；不改CMS／資料庫、不push／部署，僅維護README。
- pnpm build、15項限定Hero來源回歸、腳本語法與git diff --check通過；/about/advantage SSR200，三行文案、原圖片、三項導覽與已刪除向下按鈕狀態保留。最終編譯CSS確認56px、無舊60／80px字級覆寫、手機縮放與桌機白字保留。保留既有Tailwind sourcemap等建置警告；純CSS改動未另跑typecheck或含業務POST的全站測試。瀏覽器實際字形、窄桌機寬度及手機視覺尚未驗收，不以SSR／編譯CSS宣稱像素驗收。

## 2026-10-21 服務流程移除Explore Our、To大寫與標籤對齊

- 依10:36:56截圖，移除服務流程介紹標題上方的Explore Our及未使用樣式，保留FAQ區本來的Explore Our；左Service Process膠囊改對齊中文首行中心。沿用ponytail最小修改，依既有64／70px頂距與40／32px中文1.2倍行高，膠囊頂距為桌機72px、1024px邊界78px、768–1023px73.2px；手機原上下排列／隱藏線及0頂距保留，不挪十字線或右側主標。
- 已確認本機已發布view-pages-service-process的copy.text5仍為「 to Life 」，不是只改Vue樣本就會更新。新增限定本機update-service-title-20261021.mjs，預設dry-run、--apply才經既有save／publish版本流程將單一欄位改「 To Life 」，保留空白、其他文案、歷史與其他文件；遇草稿／自訂文字／revision衝突停止，禁止其他DB／正式端。
- 不改流程圖／八步內容、FAQ、圖片、字級／金黑範圍、47px水平間距或SEO，不push／部署，僅維護README。
- 本機CMS限定更新已完成：revision1→3，發布a39d75d2-478d-4c63-a43c-d3ca45e57ebc，保留06da7a00-604f-4120-8d17-8042d8cbef94及全部歷史body，其他64份文件同transaction比對不變；再次dry-run為UNCHANGED。Vue型別樣本同步To Life，前台仍取真實已發布資料；正式CMS未修改。
- pnpm build、限定To純函式／衝突／冪等／空白保留與介紹／FAQ來源回歸、錯誤正式主機／其他DB／旗標連線前拒絕、兩腳本語法及git diff --check通過。實際本機API與舊版body比對僅copy.text5改T，/service-process SSR200，介紹無Explore Our、主標Bringing Your Dream Kitchen To Life、原金色／描述／流程圖／影片與FAQ眉標保留；編譯CSS三斷點膠囊頂距及刪除介紹眉標樣式確認。未另跑獨立typecheck或含業務POST的全站回歸；未驗瀏覽器實際字形中心／手機視覺／FAQ與流程互動或正式端，不以SSR、編譯CSS與行框公式宣稱像素和操作驗收。保留本機SQL IP TLS既有警告，未降低TLS設定。

## 2026-10-21 無Explore Our的主標與小標籤平行

- 依10:09:36截圖「只調整位置、不調整內容／全站統一」，補齊沒有Explore Our行框的三種同款版型：廚房商品型錄的選購指南、加盟夥伴分享、加盟FAQ。沿用ponytail最小修改，只在既有全站CSS補同一個標籤頂距規則：以原標題頂距（64px／加盟分享70px）加桌機14px／平板9.2px，讓32px膠囊中心對齊50px／42px標題第一行1.2倍行框中心；重用既有TemplateHeadingRail可選頂距，不加JS或位移整個區塊。
- 不改右側標題／FAQ／圖片／分類／原文案、字級、47px十字線水平間距／線長、原16組有Explore Our版型或手機上下排列；不改CMS／資料庫、不push／部署、不新增套件／文件。既有回歸加入三類共享規則與行框公式防護，僅維護README。
- pnpm build、限定共用47px／原16組雙語／三類無眉標行框及選購指南來源回歸、腳本語法與git diff --check通過；本機型錄與加盟頁SSR200，三個標題及小標籤文字不變，選購指南分類／FAQ／媒體區塊保留。最終編譯CSS確認三類桌機14px／平板9.2px補償及分享區原70px頂距存在。僅CSS改動未另跑typecheck或含業務POST的全站測試；未驗實際瀏覽器字形中心／手機視覺、FAQ／篩選互動及正式端，行框公式與SSR不能代替視覺和操作驗收。

## 2026-10-21 商品詳情相關產品英文品牌Noto Sans TC

- 依10:09:28截圖紅框，只將商品詳情KITCHEN PRODUCT輪播標題的英文品牌名（SAKURA／SVAGO／TEKA）改用既有--font-cjk-sans（Noto Sans TC），以span局部套用；中文「廚電」仍沿用原Noto Serif TC，文案／字級／行高／字重、平板38px與手機34px不動。沿用ponytail最小修改，不擴大全站字型或改到商品卡文字。
- 保留原相關商品、圖片／型號／價格／連結、箭頭及輪播操作，三品牌共用ProductDetailPage同步生效；不改CMS／資料庫、不push／部署、不新增套件／文件，既有回歸補字型範圍與控制保留防護，僅維護README。pnpm build、限定字型／中文與原尺寸／箭頭來源回歸、腳本語法及git diff --check通過；三品牌代表詳情80377／82140／82062均SSR200，原18個相關商品位置之型號／價格／連結及控制保留，英文品牌獨立span與中文文字正確。編譯CSS確認英文span用sans token、中文strong仍serif。僅模板span與CSS改動，未另跑typecheck或含資料庫寫入／業務POST的全站測試；未驗實際瀏覽器字型下載／字形／手機寬度、輪播點擊或正式端，不以SSR與編譯CSS宣稱視覺或操作驗收。

## 2026-10-21 三品牌商品列表Smart Kitchen Living

- 依10:09:14截圖，將ProductListPage的英文統一為Smart Kitchen Living，移除原SAKURA部分分類限定Smart Appliances for Better Living、其餘品牌Kitchen Appliances的文字分支；三品牌全部產品／分類頁與除油煙機／近吸舊路徑共用生效。沿用ponytail最小修改，模板僅改一行，保留金色、字級／間距、Kitchen Appliances Hero、中文分類與除油煙機系列副標。
- 不更動商品／總數、篩選／分頁／搜尋、卡片／型錄／SEO或錯誤顯示，不改CMS／資料庫，不push／部署；既有前台及唯讀分類封面回歸同步更新，不新增套件／文件，僅維護README。
- pnpm build、限定前台來源／33組唯讀SSR與API比對、兩腳本語法及git diff --check通過。SAKURA15組、SVAGO／TEKA各9組涵蓋三品牌全部產品、25個頂層分類、除油煙機／近吸舊網址、淨水／龍頭與第2頁；均為Smart Kitchen Living且保留API原中文／總數／當頁型號、搜尋顯示範圍與Kitchen Appliances Hero。編譯CSS仍為#caa05c及原40／36／30px響應式字級。本輪未執行check-products資料庫寫入測試，亦未執行check-product-covers整支的外部圖片HEAD檢查；靜態模板改動未另跑typecheck。未驗瀏覽器實際篩選／搜尋／分頁點擊、手機視覺或正式端，不將SSR視為視覺與互動驗收。

## 2026-10-21 三品牌產品頁Enjoy Kitchen Living With主標題

- 依10:09:03截圖，只改三品牌共用ProductBrandPage故事區主標題：Elevate Your／Kitchen with／品牌改為Enjoy Kitchen／Living With／品牌，Kitchen Living金色，Enjoy／With／品牌黑色，With大寫；品牌仍取已發布CMS的info.name，不硬編碼SVAGO。截圖上方SAAGO為誤植，保留正確SVAGO品牌。
- 沿用ponytail最小修改，模板僅改一行，保留Kitchen Appliances小標、廚房產品中文、原桌機50／40px600與手機尺寸／安全區、品牌圖／介紹／切換／分類／錯誤顯示及SEO，不更改CMS資料、不push／部署。既有前台與產品回歸同步更新，不新增文件／套件，僅維護README。
- pnpm build、限定產品品牌來源與三頁SSR回歸、兩腳本語法及git diff --check通過；/products/sakura、/products/svago、/products/teka均200，逐字核對新標題、三行結構、Kitchen Living金色span與With大寫，已發布CMS的品牌圖／介紹逐值保留，三品牌切換與分類格仍存在。首次測試只比對不帶屬性的br導致丟掉SSR的換行空格，已兼容Vue scoped屬性後三頁通過，未更動畫面補測試空白。check-products含資料庫匯入／回滾／權限操作，本輪只執行其已更新的SSR斷言，不執行整支資料寫入測試；靜態模板文字修改未另跑typecheck。未驗瀏覽器實際配色／字形／手機分行、分類互動或正式端，不把SSR當成視覺與操作驗收。

## 2026-10-21 廚房裝修指南列表標題金色與刪除句點

- 依10:08:44截圖，列表標題已套前一輪共用雙語行框／小標籤下緣對齊，本輪不重複移動版面；沿用ponytail最小修改，只將Look At納入原Our的金色span，並刪除Latest Articles末尾句點。保留Explore Our、廚房裝修指南、完整英文詞句、小標籤、18／40px600／50px、47px十字線、手機分行與文章清單／內容／圖片／路徑。
- 僅改knowledge/index.vue標題一行與既有回歸預期，CMS型別樣本及發布資料不動，不push／部署，不新增文件／套件，僅維護README。pnpm build、限定指南來源／共用47px與16組雙語對齊回歸、腳本語法及git diff --check通過；本機/knowledge SSR200，標題詞句逐字保留且無句點、Look At Our落在原金色span，文章區塊與目的頁連結保留，編譯CSS金色仍#caa05c。首次產物檢查漏含帶數字的index-styles-6檔名，擴充檔名過濾後找到原規則，未為檢查更動CSS。本次僅靜態文字與span範圍，未另跑typecheck或含業務POST的全站測試；未驗瀏覽器實際字形／窄欄分行／手機視覺、文章點擊及正式端，不以SSR或來源公式宣稱像素驗收。

## 2026-10-21 品牌系列推薦案例位置與刪除句點

- 依09:17:38截圖，風格廚房實例區已套前一輪共用行框／左標籤下緣對齊，不重複挪動區塊；沿用ponytail最小修改，僅刪除Take A Look At Our Latest Articles末尾句點，十系列共用元件同步生效。保留Recommended Cases、Explore Our、中文、金黑字範圍、原文案／案例資料／圖片、18／40px600／50px、47px十字線與手機分行；不改廚房裝修指南其他標題的句點。
- 既有check-kitchen-series加入十頁推薦案例標題完整逐字／無句點／共用組檢查，前台來源回歸同步更新；本機修改，不寫CMS／資料庫、不push／部署，僅維護README。pnpm build、check-kitchen-series、限定47px／16組雙語對齊與句點來源回歸、兩腳本語法及git diff --check通過；十系列SSR200且末尾無句點，原套系／板材／45個廚電位置／案例、404及215圖片來源檢查通過。首次標題逐字測試誤假設眉標與中文之間SSR會留空格，已依Vue既有輸出調整預期後十頁通過，沒有為測試新增畫面空白。靜態文字修改未另跑typecheck或含業務POST的全站測試；未驗實際瀏覽器字形位置／輪播與鍵盤互動／手機視覺及正式端，不將SSR或來源防護當作像素與操作驗收。

## 2026-10-21 品牌系列探索廚房美學位置複核

- 依09:17:21截圖「只調整位置、不調整內容」，十個品牌系列共用KitchenSeriesPage，先前已套16組共用雙語行框與左標籤下緣對齊；不重複挪動版面。沿用ponytail最小修改，保留Kitchen Collections、Explore Our、探索廚房美學、Creative Projects That Define Our Style與原70px頂距／30%＋70%欄位、18／40px600／50px、47px十字線水平間距及手機分行，不換成右圖BRAND SERIES或品牌系列文案。
- 本輪只補check-kitchen-series十頁實際SSR標題／小標籤／共用對齊組保留防護及來源位置規則，不改應用程式、CMS資料、Hero、下方文案或圖片，不push／部署，僅維護README。pnpm exec node scripts/check-kitchen-series.mjs、限定47px／16組雙語對齊來源回歸、腳本語法及git diff --check通過；十系列SSR200，原標題與小標籤／套系／色卡／完整45個廚電位置／案例、404、215圖片來源、輪播邊界及鍵盤／減少動態來源防護均通過。僅修改測試與文件，未重建或另跑typecheck；未執行瀏覽器標題位置量測、真實輪播／鍵盤／手機互動或正式端檢查，未加--images檢查遠端圖片HTTP，不將SSR與來源公式稱為像素驗收。

## 2026-10-21 首頁尋找門市位置與At大小寫

- 依09:17:09截圖「只調整位置、不調整內容」，門市標題已套前一輪共用雙語行框置中、左標籤下緣對齊與47px十字線間距，本輪不重複挪動區塊；沿用ponytail最小修改，僅將Stores at改Stores At。保留原CMS中英文、Explore Our、Find Us、SAKURA KITCHEN、金黑配色、18／40px600／50px層級、兩行結構及手機／平板上下排列。
- 不改Google地圖、門市清單／翻牌、篩選／定位、電話及地址資料，不寫CMS或資料庫，不push／部署；既有回歸同步檢查At大寫，僅維護README。pnpm build、限定門市標題／共用47px與雙語對齊回歸、腳本語法及git diff --check通過；本機首頁SSR200確認Stores At、原共用標題、區域／城市選單與定位入口保留。這次只改靜態文字，未另跑typecheck或含業務POST的全站測試，未實測地圖操作／定位權限／篩選互動及瀏覽器字形／手機像素，也未檢查正式端；不將SSR當成視覺驗收。

## 2026-10-21 首頁廚房產品位置與For大小寫

- 依09:11:05截圖「只調整位置、不調整內容」，此區已套前一輪16組共用雙語行框置中與左標籤下緣對齊，不重複搬動標題區／卡片。沿用ponytail最小修改，僅將Designed for改為Designed For，遵照截圖F大寫；Explore Our、原CMS中文、Smart Appliances／Better Living、金白配色、18／40px600／50px層級、47px水平間距、卡片素材與品牌入口均保留。
- 既有前台回歸補For大小寫斷言，僅維護README；本機修改，不push／部署、不寫CMS／資料庫。pnpm build、限定For／共用47px／16組雙語對齊回歸、腳本語法與git diff --check通過；本機首頁SSR200，確認For、共用組、原中文綁定與其他英文／深色小標籤／三品牌入口保留。這次只改靜態文字，未重跑獨立typecheck或含業務POST的全站測試；未驗瀏覽器實際字形位置／手機視覺或正式端，不將SSR與來源公式視為像素驗收。

## 2026-10-21 雙語主標題置中與小標籤下緣對齊

- 依08:46:36截圖，沿用ponytail最小修改，針對Explore Our＋中文的同款標題加入共用inline-flex行框，眉標與中文垂直置中；手機display:contents保留原本分行。桌機統一18／40px SemiBold／50px，平板保留42／32px層級，不更動非同款的獨立眉標、圖卡、Hero或CMS文案。
- 左側標籤以各標題既有頂距加行框補償下移，對齊眉標22px與標籤14px文字行框下緣；47px十字線水平定位、箭頭與線長不變，並保留上下排列區塊不對位、手機十字線隱藏。本機修改，不push／部署或寫入資料庫。
- 共16組同款標題套用，共用CSS取消組內中文原-.06em位移、以主標1.2em行框置中；無Explore Our的標題、服務流程上方獨立眉標、首頁案例80px標題均未改。建商聯繫及加盟消息原16／38／58px改18／40／50px，平板48→42px；服務FAQ眉標16→18px。其他頁文案／CMS綁定及既有手機分行保留。
- pnpm build、建置後pnpm typecheck、限定共用47px及本輪雙語回歸、腳本語法與git diff --check通過；最終編譯CSS確認共同行框、桌機／平板中文字級、標籤補償與原版型回退均存在。10個代表頁SSR均200，共16組標題正確回傳；逐頁h2文字與HEAD比較不變。沒有執行含業務表單POST的全站回歸或瀏覽器視覺量測；補償公式只驗文字行框，不能當成已驗實際字形墨跡下緣、窄欄換行或手機像素結果，不繞過既有瀏覽器URL限制。保留既有建置警告，未更新正式CMS或部署。

## 2026-10-21 全站主標題與十字垂直線間距複核

- 依08:46:23截圖重新盤點，目前程式已具備10月13日完成的共用47px間距，並非本次才修正；沿用ponytail最小修改，不重複移動標題／正文、不改字級或文案，也不把示意圖紅線／藍線加入介面。共13份Vue檔、17處共用標題軌；各來源版型沿用同一水平定位，加盟58px／窄桌機30px內距補償、手機隱藏裝飾線保持不變。
- 既有check-frontend-regressions加入自動掃描components／pages，防止任何標題軌使用者重新覆寫垂直線left／right。限定共用定位回歸、腳本語法與git diff --check通過；本輪沒有應用程式樣式變更、不新增套件或文件，不寫入CMS／資料庫、不push或部署。
- 本機3100原未啟動，已以pnpm dev --port 3100恢復預覽（目前綁定localhost／IPv6，非127.0.0.1）；10個代表頁唯讀SSR均200，共18個標題軌實例（FAQ共用元件會重複呈現）。範圍為首頁、潮派系列、品牌優勢／關於我們／品牌館、服務流程、廚房知識、加盟、廚房商品型錄與case10；進場動畫及手機原規則不更動。dev型別監看0錯誤；因僅補回歸測試與文件，未重建或重跑含表單POST的全站測試。未執行瀏覽器像素量測或正式端檢查，不將來源公式／SSR結果稱為本輪視覺驗收，亦未繞過既有瀏覽器URL限制。

## 2026-10-20 建商廚房系列八組素材與相簿視窗

- 依13:48:46截圖與使用者「請他們補，先上有的」確認，先做資料夾現有8組／18張圖片；缺第03組「原色系列0.5」，不放假圖或拿其他系列補位。順序依素材01／02／04至09；英文依實際資料夾NEUTRAL COLOR（截圖NUTRAL少E），其餘HORIZON／LUMINOUS SPACE／MODERN CHIC保留。
- 沿用ponytail最小修改及既有BuilderImage／原生dialog做法，保留原卡片字型、三欄／手機單欄、圓角及其他Hero／預約內容；新增每卡英文副標與可選相簿，舊版只有單圖的內容仍可使用。後台讀取及儲存／發布／還原在既有schema邊界針對此文件加入可選欄位，不改SQL schema或seed舊資料。
- 新增限定本機的update-builder-series-20261020.mjs，預設dry-run，--apply才透過既有CMS版本流程只改系列。遇草稿、自訂清單、revision衝突停止，其他文件及所有舊版本保留，不整庫匯入／reset。來源原圖不覆蓋，網站新增日期分目錄的WebP版本；本輪只做本機，不commit／push／正式部署。
- 圖片已由218.5MB轉為4.4MB／2400px WebP，原素材未更動；check-builder-series直接測試實際頁面處理函式、換圖首尾／單張／清理焦點、可選schema與舊單圖相容、拒絕不安全URL和自訂清單覆蓋。首次本機HTTP發現新共用schema被Nitro external錯誤解析至工作區外，已依既有hero-media等模式加入inline清單，不以建置成功取代實際HTTP檢查。
- 已先核對本機發布API仍為6組、8組預期確實失敗，再執行限定本機--apply：revision1→3，發布412b8946-2432-44d5-b1ef-02c5b5394bea，保留cae644b6-abc1-4c6d-82bd-ec678aba1442與所有歷史body，其他64份文件同transaction比對不變；再次dry-run為UNCHANGED。不是只改Vue樣本，沒有修改正式CMS。
- pnpm build、pnpm typecheck、pnpm exec node scripts/check-builder-series.mjs --http與腳本語法／git diff --check通過。實際本機API清單與manifest逐值一致，SSR為8卡／中英名稱／封面／關閉的原生dialog，三處預約入口與其他文案保留；18張網址均200及image/webp。編譯CSS保留三欄／手機單欄、原26px／手機23px字型、44px按鈕與開窗背景捲動鎖。首次SSR卡數檢查因既有v-reveal重複ev class被過嚴比對漏算，改為完整卡片class token後通過，未為測試修改版面。保留既有建置及本機SQL IP TLS警告，未降低TLS；未跑含業務POST的全站測試或實際瀏覽器彈窗／鍵盤／手機視覺驗收，不繞過既有URL安全限制，也不把處理函式模擬測試稱作瀏覽器驗收。

## 2026-10-20 建商深色廚房大圖動畫參照品牌優勢

- 依13:48:30截圖，目標為/builders的builders-hero-media深色廚房大圖，參照BrandAdvantageHero白色廚房大圖的「向上淡入後慢速Ken Burns」。原建商僅有向上淡入，保留其220ms延遲與1.25秒進場，在圖片img加入同一個hero-kenburns 5秒ease-out，延遲1.47秒後播放一次並保留終態；不對錯誤提示或整個頁框加運鏡。
- 沿用ponytail最小修改，只加局部圖片動畫及減少動態靜止覆寫，保留CMS圖片／替代文字、優先載入、center58%裁切基準、原高度／圓角／手機尺寸、參考頁與共用關鍵影格；不修改HOME IN O.N.E或其他頁面。既有前台回歸與check-partnership-ppt補入時長／延遲／減少動態防護，不新增套件或其他文件。
- 先改本機，不commit／push／部署或CMS寫入；只維護本README並保留其他既有修改。
- pnpm build、限定來源回歸、與品牌優勢參考時長逐值比對、兩檢查腳本語法與git diff --check通過。編譯CSS確認5秒單次hero-kenburns／1.47秒延遲與減少動態animation:none／transform:none；本機/builders SSR200確認原CMS圖片／alt、220ms外層進場、eager／high載入與下方HOME IN O.N.E保留。初次SSR數量檢查用class前綴誤把__visual子圖也計入，改為完整class token後通過，未為檢查改版面。本次應用程式僅新增兩條圖片CSS，未重跑型別或全站測試，未執行瀏覽器測試與業務表單；實際同視口運鏡／進場時機與手機裁切尚未驗收，不以SSR及編譯CSS宣稱視覺驗收，不繞過既有瀏覽器URL安全限制。

## 2026-10-20 建商SAKURA Hero半透明CTA與16px文字

- 依13:48:22截圖，建商SAKURA KITCHEN頁Hero的「立即／預約」沿用首頁半透明底色。核對本機現有background:#5c5c5c75與border:#ffffff12已和HomeHero一致，不再重改顏色；本輪僅將該按鈕文字15px／21px改16px／24px，保留原兩行文案、110px桌機／90px手機圓形、定位、模糊、水波、Hover／焦點與預約錨點。
- 沿用ponytail最小修改，既有前台回歸補指定字級／行高，check-partnership-ppt同步補實際字級及與當次首頁computed背景色比對，不硬猜透明度序列化字串。不改首頁CTA字級、其他按鈕或CMS，不新增套件與文件；僅維護本README，保留其他既有變更。先改本機，不commit／push／部署。
- pnpm build、限定CTA來源／本機SSR回歸、兩檢查腳本語法與git diff --check通過。來源比對確認與目前HomeHero實際背景／邊框／Hover金字一致、保留尺寸／模糊／水波與減少動態；本機CMS預約網址與兩行文案、三個SSR預約入口保留，編譯CSS確認16px／24px、半透明灰底與110／90px尺寸。未執行check-partnership-ppt的瀏覽器流程或點擊預約，也未重跑型別及全站測試；實際桌機／手機的玻璃感、字形及錨點操作尚未驗收，不以SSR或編譯樣式宣稱互動／像素驗收，未改正式CMS或部署。

## 2026-10-20 HOME IN O.N.E整圖動畫再確認

- 依13:48:14截圖核對既有建商頁實作：HOME IN O.N.E完整原圖包在builders-home-one，以v-reveal可視觸發淡入，局部builders-home-one-reveal為opacity0→1與scale(.97)→scale(1)，沿用1.25秒ease／fill both；非每次捲動重播，不將字拆開或改原圖。減少動態偏好則直接顯示、不播放。
- 沿用ponytail原則，確認本機已有指定效果後不重寫或疊加動畫，也不改下方服務區。既有動畫來源回歸、本機/builders SSR200／原圖及動畫標記、現有編譯CSS的專用關鍵影格與減少動態條件均通過；未修改應用程式或CMS，只補本README核對紀錄，因此未重跑build／typecheck。
- 本輪未commit／push／部署，未據此判定正式端是否已有更新。瀏覽器實際進場時機、淡入節奏與手機視覺仍未驗收，不以SSR或編譯CSS聲稱動畫視覺驗收通過，不繞過既有瀏覽器URL安全限制。

## 2026-10-20 加盟夥伴人物資訊上緣對齊

- 依13:47:36截圖，兩則加盟心得的頭像／姓名／門市資訊改為上緣對齊，不變更心得文字、頭像、年資或店名，不裁字／補空行／寫死卡片高度。沿用ponytail最小修改與同一頁既有subgrid做法，僅min-width768的兩欄共享心得與人物兩列；列距24px取代人物原24px上margin，人物列靠上且內部靠上，避免心得或店名換行造成錯位。
- 手機不套共用列，維持自然單欄及原28px卡片間距。只改加盟頁局部CSS，保留影片、動畫、其他區塊與全部CMS資料；既有前台回歸加入來源防護，check-partnership-ppt補入不同寬度人物／頭像／姓名上緣與加長心得檢查，未另建測試框架或新增套件。
- 先改本機，不commit／push／部署或CMS寫入；僅維護本README，保留其他流程既有修改。
- pnpm build、限定來源回歸、兩檢查腳本語法及git diff --check通過；編譯CSS確認768px以上兩欄共用列、24px列距與人物靠上，手機原單欄／28px間距保留。本機/franchising/intro SSR200，逐項比對已發布data-franchise兩則心得全文、姓名／職稱、年資／門市與原頭像皆保留；實際來源只有新增五行局部CSS。未執行check-partnership-ppt瀏覽器流程、影片播放或全站測試，本次純CSS亦未重跑型別；桌機／手機實際人物座標與加長內容視覺檢查仍未驗收，不把SSR或編譯CSS稱為像素驗收，不繞過既有瀏覽器URL安全限制。

## 2026-10-20 品牌承諾Hero選單再下移與移除向下按鈕

- 依12:12:48截圖，三項品牌導覽仍在左側照片文案欄內，下移並整組置中；刪除其下金色向下按鈕，不移到整個Hero外。保留原三條連結、當前項目標記、570px內等分置中及手機單欄排列。
- 沿用ponytail最小修改：桌機brand-h8-navigation上方留白48→140px，下移92px，正好替代刪除按鈕54px＋上margin38px的高度，避免無意改變照片裁切／右側內容位置。平板／手機仍採24px間距，刪按鈕後不保留空白。清除只供按鈕使用的ArrowDown／三個ref／ResizeObserver與定位函式、按鈕CSS；不動主標、招牌原圖、右側照片、下方大圖動畫或其他頁面。
- 既有前台回歸與check-partnership-ppt對應斷言改驗按鈕移除、三條連結保留及桌機／手機置中與間距，不再要求已刪除箭頭對齊。先改本機，不commit／push／部署或CMS寫入，不新增套件與其他文件，只維護本README。
- pnpm build、建置後pnpm typecheck、限定品牌Hero及相鄰消息Hero來源／實際SSR回歸、兩檢查腳本語法與git diff --check通過。SSR確認按鈕與向下錨點入口移除、三條品牌連結與完整三行主標、原大圖及進場保留；編譯CSS確認桌機140px／平板手機24px、570px內置中與刪除按鈕樣式。與當前HEAD逐段比對右側照片／文案及下方大圖模板、背景／照片及主標幾何規則相同，92px高度抵消僅屬原樣式的靜態模型。沒有執行check-partnership-ppt的瀏覽器流程或其他業務表單，實際下移後與建物招牌的視覺距離、超寬／手機版面仍未驗收，不以來源、SSR或模型宣稱像素一致；未繞過既有瀏覽器URL安全限制，未改正式內容。

## 2026-10-20 媒體影音內頁Media桌機80px

- 依12:12:25截圖，只調媒體影音文章Hero的Media標題，於min-width:1024px局部設80px／1.1行高，保留平板60px／64px及手機30px／35px。保留既有CMS文案、原p標籤／正文h1、松竹店招牌背景及安全區、麵包屑、影片ID／播放器、文章與相關影音，不更改其他消息頁或資料庫。
- 沿用ponytail最小修改，在既有回歸加入桌機／手機尺寸、CMS標題及影片來源防護；不新增套件或文件，僅維護本README，保留其他既有變更。先改本機，不commit／push／部署或正式CMS發布。
- pnpm build、限定來源回歸、檢查腳本語法與git diff --check通過；編譯CSS確認桌機80px／1.1、平板60px／64px及手機30px／35px。實際本機CMS原文已為Media，無須新增內容版本；三篇內頁american_urban、wabisabi、business SSR200，Media文案、招牌背景標記、原麵包屑、正文h1及播放入口保留。初次SSR檢查誤認播放按鈕標籤為「播放影片」而失敗，讀取現有播放器後改驗真實的「播放：文章標題」並重跑通過，未為測試改動播放器。此次僅改CSS，未重跑型別／全站測試，未驗瀏覽器字形／裁切／手機排版或實際影片播放，不以SSR及編譯樣式宣稱互動或像素驗收。

## 2026-10-20 最新消息內頁News大小寫與桌機80px

- 依12:12:17截圖，最新消息文章Hero顯示News（非NEWS），桌機字級80px／1.1行高，保留手機30px／35px與平板60px／64px。與Promotions相同，這裡為獨立p而非h1，需局部桌機樣式；保留CMS原文並明定text-transform:none，不改文章h1、招牌背景／安全區、麵包屑或其他消息頁。
- 沿用ponytail最小修改，同步Vue型別範例與實際本機CMS。新增限定127.0.0.1／SakuraWebsiteDev的update-news-title-20261020.mjs，預設dry-run，--apply才透過既有CMS版本流程只改view-pages-news-latest-slug-的copy.text1；遇未發布草稿／非NEWS或News自訂標題／revision衝突停止，其他欄位、64份文件及舊版本保留，不seed或整庫同步。既有前台回歸增加純轉換與實際已發布CMS、桌機／手機樣式防護。
- 本輪先改本機，不commit／push／部署，不更新正式CMS；僅維護本README，保留其他既有變更。不能以本機CMS或Vue範例更新宣稱正式完成。
- 本機dry-run為revision1，發布前實際已發布API驗收確實因NEWS≠News而失敗；於nuxt-site執行`pnpm exec node --env-file=.env scripts/update-news-title-20261020.mjs --apply`，發布至revision3／874ccd96-f505-48d3-a26a-d2b94195a0eb，保留舊a0afb08f-f0bf-4bc3-a6fd-2fb457780f9e及全部歷史body；其他64份文件revision／草稿／發布ID同transaction不變。再次dry-run為UNCHANGED，不重複新增版本。
- pnpm build、限定純函式／來源／已發布CMS回歸、兩腳本語法、git diff --check及錯誤正式目標／其他DB連線前拒絕通過。編譯CSS確認桌機80px／1.1、平板60px／64px、手機30px／35px及text-transform:none；三篇本機實際SSR（2026-franchise-seminar、kaohsiung_opening、2025-franchise-exhibition）均為News，台中招牌背景標記、麵包屑及正文h1保留。只改尺寸與單一文案，未重跑型別或含業務POST的全站測試；保留本機SQL既有IP TLS ServerName棄用警告，不降低正式TLS。實際瀏覽器字形、背景裁切與手機視覺尚未驗收，不把SSR或編譯樣式當成像素驗收。

## 2026-10-20 優惠活動內頁Promotions桌機80px

- 依12:12:09截圖，只調優惠活動文章Hero的Promotions，非內文文章標題或其他消息頁。原全站桌機80px只套h1，這個Hero為p，仍使用局部60px；在原活動內頁加入min-width:1024px的局部80px／1.1行高，保留原手機30px／35px、平板60px／64px及原CMS文案、標籤、正文h1、招牌圖與安全區、麵包屑和內容。
- 沿用ponytail最小修改，不擴大全站CSS選擇器、不新增套件或修改CMS；既有前台回歸加入桌機80px與手機／文章標題保留防護。先改本機，不commit／push／部署；保留既有其他變更，僅維護本README。
- pnpm build、限定來源回歸、檢查腳本語法與git diff --check通過；編譯CSS確認桌機min-width1024的80px／1.1、平板原60px／64px與手機30px／35px。讀取本機已發布活動資料及Hero文案，比對2025_ro_water_sp、2025KC、2025B2C_Q2SP三篇實際SSR200，原CMS標題、招牌圖標記、麵包屑與正文h1保留。本次僅改CSS，未重跑型別或全站測試；實際瀏覽器字形、裁切與手機排版尚未驗收，不以SSR或編譯樣式宣稱像素驗收，未更新正式CMS或部署。

## 2026-10-20 品牌系列廚電單排五產品與左右箭頭

- 依12:11:45截圖，廚房電器推薦維持桌機一屏五產品，改單排水平輪播，第六個之後不換到第二排；保留全部CMS產品順序、型號／文案、透明圖來源、商品目的頁與新分頁設定，不截斷或複製產品補滿。
- 沿用ponytail及元件既有embla-carousel-vue，不新增套件。每次切換一個產品、不自動輪播，到頭尾或不足一屏時停用對應箭頭；提供44px原生按鈕、方向標籤、左右鍵及觸控滑動，手機沿用一次兩產品。減少動態時輪播duration為0；監聽select／reInit同步按鈕並在清理時解除，產品焦點框改向內避免被輪播視窗裁掉。
- 修改共用KitchenSeriesPage，十系列一起套用；既有十系列回歸加入SSR產品總數／箭頭、桌機與手機來源規則及0／1／4／5／6／10產品的兩種一屏容量邊界／重設／監聽清理檢查。先改本機，不commit／push／部署，不修改CMS或其他內容；僅維護本README。
- pnpm build、建置後pnpm typecheck、check-kitchen-series、腳本語法與git diff --check通過。十系列SSR保留完整45個廚電位置（AI Kitchen的6個也保留）、型錄／Hero／套系／色卡／案例及404，215圖片來源／既有淡化及鍵盤防護通過；新箭頭狀態測試使用實際watch程式配合模擬API驗起點／終點／reInit／清理，並非真實瀏覽器操作。建置CSS確認五欄／兩欄、nowrap、裁切與44px控制；320–1920px只做靜態寬度模型。尚未驗收瀏覽器實際按鈕／拖動／Tab自動帶入可見卡片及桌機／手機版面，不繞過既有瀏覽器URL安全限制；未跑含業務POST的全站測試，保留既有建置警告。

## 2026-10-20 指南文章Hero對齊案例頁

- 依12:11:31截圖的實際頁面，左側是廚房裝修指南systemcabinet文章，並非截圖紅標的品牌系列Hero；以右側門市案例Hero的高度、招牌安全區及麵包屑位置為對齊目標，不改文章內容或將麵包屑文字替換成案例分類。
- 差異在assets/css/main.css：帶data-hero-photo的指南文章額外增加桌機88px／手機120px的標題高度，但這些頁面沒有Hero主標。最小修正移除額外padding-top，麵包屑行高改為與案例一致的20px，沿用共同--hero-copy-top與上下留白；保留display:block避免systemcabinet的網格空列。現有systemcabinet、插座規劃及knowledge31三篇松竹店招牌Hero一起修正，未標記的其他文章及案例頁不改。
- 沿用ponytail與既有版型／真實照片，不新增元件、素材、CMS欄位、資料版本或套件；此為現有網站局部註記調整，非Product Design全頁重製，不啟動生成素材或重建網站流程。既有前台回歸補入共同留白與不留空標題高度防護。修改前該檢查已因額外88／120px而失敗；本次先改本機，不延伸上一項Footer的正式發布授權，不commit／push／部署。
- pnpm build、限定Hero來源回歸、既有檢查腳本語法與git diff --check通過；編譯後CSS確認指南麵包屑20px、沿用共同留白且不含舊額外88／120px規則。本機上述三篇指南及/gallery/case10 HTTP SSR200，招牌Hero、原麵包屑入口／分類與正文標題保留、不新增Hero主標；320／390／768／1024／1440／1920／2560px僅靜態幾何模型檢查招牌位於麵包屑上方。此為CSS修改，未重跑型別及含業務POST的完整測試，未繞過既有瀏覽器URL安全限制；實際同視口裁切／高度／手機視覺與互動仍未驗收，不以SSR、模型或建置宣稱像素一致。未修改正式CMS或其他內容。

## 2026-10-20 正式Footer兩項內容同步

- 使用者12:09截圖回報正式Footer仍舊，唯讀核對兩個正式網域的已發布CMS及首頁SSR皆為「品牌系列・AI 廚房」及單一/news；API為private,no-store／Vercel MISS。本機CMS及SSR已是新名稱與三分類，不能以本機完成或Git更新宣稱正式發布，也不把這項差異說成快取或已發布後回滾。
- 使用者確認「所以去改啊」，本輪授權只涵蓋正式Footer兩項：品牌入口改名「品牌系列」（保留原網址），消息欄改優惠活動／最新消息／媒體影音。沿用ponytail最小修改，在既有修補腳本加入--production與既有Azure目標／應用帳號／TLS守門；預設dry-run，--apply才以CMS版本流程儲存發布。遇草稿、自訂內容／分類衝突停止，其他文件與舊版本保留，不匯入、reset或整庫同步。
- 擴充既有check-site-header.mjs，以明確指定origin檢查Header及Footer已發布API、首頁與/news的實際SSR及三個分類目的頁，不用本機資料代替正式驗收。發布前正式驗收確實因「品牌系列・AI 廚房」不等於「品牌系列」而失敗；dry-run確認revision3及限定兩項修改。
- 執行`pnpm exec node --env-file=../.env.azure-runtime.local scripts/update-footer-navigation-20261020.mjs --production --apply`，正式Footer已發布至revision5／143bc763-a091-4caf-8c21-3fd6ca19f23c；舊7eccba2b-b638-4e95-a97b-0b24da9293c7與全部Footer舊版本body同transaction核對不變，其他64份文件revision／草稿／發布ID不變。再次正式dry-run為UNCHANGED，未重複新增版本。
- 兩個既有正式網域sakura-demo-vanlantech.com與header-design-two.vercel.app分別執行明確TEST_BASE_URL的check-site-header，已發布Header／Footer API、首頁及/news真實SSR、三個消息分類目的頁HTTP200全部通過；原品牌館名稱、加盟箭頭及兩筆額外入口仍保留。Footer純函式的原物件不變、限定修改、其他內容保留、冪等及衝突測試，CLI錯誤目標／資料庫／帳號／降低TLS／未知參數在連線前拒絕、腳本語法與git diff --check通過。
- 此次為正式CMS內容發布，不需重建前端；未commit／push／部署其他功能，未跑build／typecheck或含業務寫入的完整套件，未做瀏覽器桌機／手機展開與像素驗收，不以SSR代替這些檢查。沒有新增套件或其他文件，只維護本README。先前「正式尚未發布」僅描述先前本機回合，本節記錄本次正式發布完成。

## 2026-10-20 品牌系列Hero探索案例字級與箭頭

- 依10:59:21截圖，共用品牌系列Hero右下「探索設計案例」桌機／平板字級由14px改16px，旁邊右上箭頭由18px改22px；保留原控制框、型錄圓鈕、框外分頁箭頭、設計靈感目的頁與鍵盤焦點樣式。不改CMS或新增套件。
- 手機保留12px文字／16px箭頭與既有98px欄寬，避免六字文案加箭頭超出控制框；此處依桌機截圖調整，不把桌機尺寸直接套到手機。既有前台回歸補入指定尺寸與手機適配防護。
- 沿用ponytail最小修改，保留其他本機變更，僅維護本README；不commit／push／部署。`pnpm build`、對應Hero純回歸、既有檢查腳本語法及`git diff --check`通過；建置後CSS再次確認桌機16px／22px及手機12px／16px。本機AI Kitchen與Loft Chic的HTTP SSR確認目的頁、文案、圖示、型錄及框外分頁保留，這不是瀏覽器視覺／點擊驗收。此次僅改CSS尺寸，未重跑型別或全站測試，實際桌機／手機版面尚未驗收；既有建置警告保留。

## 2026-10-20 品牌系列Hero名稱同首頁與刪除左側CTA

- 依10:59:12截圖，品牌系列內頁Hero名稱依首頁對應已發布輪播的標題顯示，不一律刪除Kitchen；本機比對AI Kitchen與Clever Kitchen在首頁帶Kitchen，Loft Chic等七個系列不帶，Basic +另有空格差異。先前Clever內頁只留Clever與這次全面同首頁有衝突，已向使用者單獨確認，不默默把例外當成一致。
- 刪除共用系列Hero左側Start Project圓鈕，右側型錄／探索設計案例與框外左右箭頭、品牌系列抽屜、背景與主標動畫、內文及SEO名稱保留；同步清理僅該圓鈕使用的CSS與標題佔位，其他版面規則不重構。沿用ponytail最小修改，現有前台與十系列回歸同步驗證，不新增套件、CMS欄位或資料版本。
- 延續先保留本機、不commit／push／部署；先前拍立配、Hero運鏡、Kitchen進場及本機Footer內容版本保留。檢查結果待完成後補記，實際瀏覽器視覺／互動尚未驗收。
- 標題直接讀取view-components-home-HomeHero已發布slides，依對應/home-style/slug（可帶query／hash）取得非空標題；找不到對應或名稱空白才回退原data.name，不硬編碼刪字清單。首頁文件未發布時沿用既有useCmsResource的404隱藏樣本回退，服務錯誤仍完整拋出，不吞錯；SEO、圖片替代文字與系列資料名稱不改寫。
- 新標題回歸於修改前確實失敗（Loft Chic Kitchen≠Loft Chic），修改後通過AI保留Kitchen／Loft刪後綴／Basic +空格／目前依最新規則Clever Kitchen、query／hash、缺少首頁對應／空白回退、自訂名稱及原SEO／右側控制／五秒動畫。Clever的舊例外已提出確認，目前先依本次「同首頁」完整規則，不宣稱使用者已另行確認撤銷例外。
- pnpm build、建置後pnpm typecheck、限定前台來源／純函式回歸、check-kitchen-series --cutouts、腳本語法與git diff --check通過；十個系列SSR名稱皆與實際已發布首頁一致且不含左側CTA，右側控制全保留。另通過45個廚電位置／29個透明來源／215圖片來源／無效系列404等原內容防護。未新增CMS版本、未送表單；保留原Tailwind sourcemap及地區JSON匯入警告。沒有實際桌機／手機瀏覽器視覺與控制點擊驗收，不把SSR／來源檢查當作像素或互動驗收。

## 2026-10-20 頁尾品牌系列名稱與三個消息分類

- 依10:58:56截圖，僅將Footer「品牌系列・AI 廚房」改名「品牌系列」，保留/home-style/aikitchen原目的頁；「優惠消息」欄由原單一/news入口改為優惠活動/news/activities、最新消息/news/latest、媒體影音/news/video。標題「優惠消息」及其他頁尾欄、Logo／社群／版權、排版與展開功能不變，不將紅色註記當成字色設計。
- ponytail以本機已發布CMS為資料來源，不只改Vue範例或重跑seed。新增限定本機的scripts/update-footer-navigation-20261020.mjs，預設dry-run、--apply才儲存／發布；強制127.0.0.1／SakuraWebsiteDev，遇草稿、分類重複、自訂內容或revision衝突停止。轉換純函式與實際CMS／Footer SSR加入既有回歸；保留其他文件與舊版本，重跑冪等，不寫正式CMS。
- 本機dry-run先確認revision3原內容；純函式防護通過、實際本機CMS／SSR回歸先因舊「品牌系列・AI 廚房」確實失敗。於nuxt-site執行`pnpm exec node --env-file=.env scripts/update-footer-navigation-20261020.mjs --apply`，本機發布至revision5／8bafa374-ab23-4e26-ac3e-3bac9c59f7d0，舊5a182e33-b3df-4a8e-ae84-aae4c68e5168保留，其餘64份文件revision／草稿／發布ID同transaction核對不變；再次dry-run為UNCHANGED。
- 修正後本機已發布CMS與首頁、/news/latest實際Footer SSR均通過指定名稱與三入口檢查，三個消息分類目的頁均HTTP200；另驗純函式不修改輸入、保留其他欄位／原品牌目的頁／設定、冪等及自訂內容衝突，CLI正式目標於連線前拒絕。兩腳本node --check與git diff --check通過；保留本機SQL既有IP TLS ServerName棄用警告，不降低正式TLS設定。純內容變更未改Vue版型，未重跑build／typecheck或含業務POST的完整回歸，未驗瀏覽器展開排版。
- 延續使用者「先保留本機，暫不部署」，不commit／push／部署；既有拍立配、Hero運鏡及Kitchen進場修改保留。本輪只發布本機CMS，不是正式發布；之後單推Git也不會把本機Footer版本同步到正式CMS，正式更新仍需另行明確執行與驗收，不能據本機revision5宣稱正式完成。

## 2026-10-20 首頁Kitchen大字由下向上顯示

- 依10:58:36比較圖註記，目標為首頁Hero底部Kitchen大字，不替換成左圖Footer的SAKURA Logo，也不修改Footer。現有大字為fadeInUp；按註記改成在自身遮罩內由下向上滑出，沿用既有slideInUp、250ms延遲、1.25秒ease及可見時只播一次，背景五秒輪播不重啟大字。
- ponytail只改首頁大字的遮罩class與現有reveal種類，保持字族／字級／金色漸層／64%透明度／位置／斷點、CMS文案、CTA及前輪左右交替背景與拍立配連結不變。先加入既有check-hero-media的遮罩／方向／原文案／不重播防護，再修改元件，不寫資料庫或新增套件／文件。
- 延續「先保留本機，暫不部署」，不commit／push／部署或修改正式CMS；尚未作實際瀏覽器動畫驗收，不以靜態截圖、SSR或建置通過宣稱動態與左圖完全一致。
- 遮罩僅加在大字自身容器，不加在固定120px高的watermark-slot（桌機字行高240px），避免將最終字形硬裁成120px，也不裁切旁邊的圓形CTA；沿用全站減少動態偏好的ev立即顯示與animation:none!important。
- 建置後pnpm typecheck通過。未執行帶DB模式的CMS驗證或業務表單POST，未新增資料版本；瀏覽器URL安全限制不繞過，實際上滑節奏／遮罩邊界與手機視覺仍待驗收。
- check-hero-media新增斷言於修改前確實因缺少遮罩失敗，修改後通過；本機首頁SSR200確認大字自身遮罩、data-ev=slideInUp與250ms延遲，原字族／64%透明度／金色漸層／Kitchen、Footer原Logo及前輪左右運鏡／拍立配入口保留。pnpm build、既有純檢查、腳本語法與git diff --check通過；編譯模板／CSS核對遮罩、slideInUp、原時長與減少動態。第一次CSS驗證假定overflow-hidden獨立rule而誤報，實際與truncate合併同樣overflow:hidden，依真實規則重跑通過，未為檢查改樣式。

## 2026-10-20 右側拍立配指定網址另開分頁

- 依10:52:16截圖，將共用FloatingButtons的停用拍立配button換成原生a，完整網址為https://sakura-ai-one.vercel.app/consumer?entry=official，target=_blank及rel=noopener noreferrer；ARIA明示另開分頁。原拍立配SVG／70px圖示／72px與74px入口／灰色列／分隔線／位置及捲動、手機顯示規則保留，其他設計案例／丈量／客服入口不變。
- 原來沒有拍立配CMS網址欄位，程式明確disabled；本輪修正固定服務入口，不新增CMS欄位、不更新或同步資料庫，保留原有圖示來源及全部版本。舊copy.field3「拍立配連結待提供」不刪資料，只移除已過期的title顯示；不將Vue範例當作資料庫已更新。
- 沿用ponytail最小修改，既有前台回歸補實際首頁SSR的精確網址／entry參數、安全新分頁／原圖示／不得停用與舊提示防護。延續使用者「先保留本機，暫不部署」，不commit／push／部署，不操作外站表單；未經瀏覽器點擊前不宣稱外站流程或新分頁互動已驗收。
- 本次限定回歸以既有腳本的實際斷言分別驗首頁、/design-inspiration及/home-style/loft-chic，均SSR200、指定完整網址／target／rel／可用入口／原SVG通過；其他三個浮動目的地與已發布CMS相符，SVG HTTP200。pnpm build、建置後pnpm typecheck、腳本語法、git diff --check及編譯SSR入口檢查通過；保留既有Tailwind sourcemap與地區JSON匯入屬性警告。編譯碼的中文標籤為Unicode escape，初次直接搜尋中文字誤報後改以實際渲染SSR核對中文、不改元件。沒有執行完整含業務POST回歸，未修改CMS或外站資料，未驗瀏覽器實際開新分頁與外站功能。

## 2026-10-20 首頁Hero背景逐張左右交替

- 依10:42:08截圖註記，只調整首頁背景照片：第一張向左、第二張向右，依CMS輪播順序奇偶交替；文字、原五秒輪播、雙層向下揭幕、圖片／手機選圖／焦點／連結保留。既有共用Ken Burns固定向左，首頁與系列頁共用，不可直接反轉全部頁面。
- 先擴充既有check-hero-media的方向回歸，覆蓋活動兩層／上一張終態、十張尾首接縫、後台裁切預覽、縮放留邊與減少動態；先驗失敗再修改共用方向參數。其餘既有未提交後台／首頁／捲動修改保留，不同步CMS、不匯入資料、不新增套件或其他文件。
- 共用動畫加入可繼承的--hero-pan-x，預設-4%保留系列頁、品牌及加盟原方向；首頁活動層依當前索引設定±4%，上一張底圖依它自己的索引保留終態，避免換圖時被新方向拉回。原1.06→1.16縮放／5秒ease-out及減少動態保留；後台同一列的末端裁切預覽同步方向，不讓偶數張仍顯示左移構圖。
- 後台僅在AdminHeroImages掛載處由既有path列索引傳遞CSS變數，不新增資料欄位或改動共享圖片元件與儲存格式；調整排序後依新位置重新決定左右方向。
- 使用者明確選擇「先保留本機，暫不部署」；本輪不commit／push／部署，不更新正式CMS。首次建置遇Nuxt既有PID92971建置鎖而拒絕啟動，未kill或設定忽略鎖；原程序結束後正常重跑，不把該失敗算成成功。
- 方向回歸先重現固定向左而失敗，修改後純檢查通過；後台使用實際列path的方向運算另驗0／1／8／9及缺省值，其他資源未設定變數時仍以-4%為預設。這些為程式與幾何防護，不等同逐幀瀏覽器動畫驗收。
- 本輪pnpm build、建置後pnpm typecheck、check-hero-media（不指定DB寫入模式）、腳本語法及git diff --check通過；保留既有Tailwind sourcemap與地區JSON匯入屬性警告。正式編譯CSS確認方向變數／-4%預設／5秒動畫／上一張終態／減少動態仍有效；初次只掃外部CSS而漏掉Nuxt內嵌entry樣式，及假定未合併CSS selector造成檢查誤報，核對實際編譯規則後重跑通過，沒有為檢查改動畫。
- 本機3100預覽已啟動，正常預覽登入後首頁SSR200，首張輸出--hero-pan-x:-4%、兩個同步活動圖層、原標題及CTA保留。未送業務表單或儲存CMS，不新增資料版本；沒有瀏覽器逐幀／同視口截圖比較，五項視覺面向的字體、版面、配色、真實圖像、文案皆以保留原始實作為範圍，未據此宣稱像素或動態驗收通過。正式端未變更。
- image-to-code／ponytail採現有真實照片及原設計，只做動畫註記的局部修正，不重製資產或新增設計。來源/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_WfJ7L5/截圖 2026-10-20 上午10.42.08.png，1964×880註記畫布，內嵌頁面約1219×650，原CSS viewport／密度未提供。瀏覽器URL安全限制不繞過，尚無本輪實作截圖／同視口動畫比較，視覺QA final result: blocked；QA依使用者規則只維護本README，不新增design-qa.md。

## 2026-10-20 Chrome 預覽入口長等待定位

- 對照使用者 10:32:48 截圖及正式 Vercel 原始 request logs：10:32:35 的 `/api/preview-access` 執行 11ms 並回 200，接續首頁 `/` 執行 53,654ms；另一筆同時進站的首頁等候排程後執行 28,721ms。Vercel 未標示該次為冷啟動，不能將 54 秒算成密碼驗證或 Chrome 本身卡住。原 CLI 摘要省略 duration，本輪沿用同一唯讀 logs API 取得原始 duration，不輸出權杖、IP 或 Cookie。
- 正式 SQL 唯讀查核為 `GeneralPurpose / GP_S_Gen5_2`（Serverless），與本 README 既有免費 Azure SQL 閒置休眠、60 秒連線等待設定一致；Microsoft 說明自動喚醒通常約 1 分鐘，為本次現象最符合的原因，但尚未取得 Azure Activity Log 的確切 resume 事件。資料庫已啟動後，正式登入 HTTP 約 163ms，三次首頁約 560／340／257ms；同一個 Chrome 實際點擊約 835ms 進入首頁，不能據此宣稱休眠延遲已根治。
- 密碼頁原本在 `location.assign()` 後立刻解除 pending，首頁仍在等待時按鈕卻顯示「進入網站」。改為驗證成功後顯示「載入網站中…」與首次啟動等待提示，期間不重送密碼；75 秒仍未完成導航則完整顯示階段及等待秒數，解除鎖定可重試。從瀏覽器歷史快取返回時重置等待，保留原 15 秒驗證逾時、底層錯誤細節、密碼／Cookie／期限及指定目的頁。
- 使用者明確選擇「維持免費，改善等待提示」。`pnpm exec node scripts/check-preview-access.mjs` 通過真實 15 秒驗證逾時、錯誤細節／不重送／重試／目的頁保留，以及目的頁等待保持 pending、75 秒模擬時鐘逾時、歷史快取返回重置；舊版成功後 pending=false、新版保持 true 的對照亦通過。`pnpm typecheck`、`pnpm build`、腳本語法與 `git diff --check` 通過，保留既有建置警告。Chrome 本機正式產物搭配暫存代理，實際延後目的頁 8 秒仍可完成導覽，返回後表單可再次操作；導航中的 DOM 觀察受到瀏覽器等待限制，未取得過渡狀態截圖，該狀態以行為測試驗證。
- 僅修改預覽頁、既有檢查與本 README；正式 SQL 只做服務層級 SELECT，未變更 Azure 計費、自動休眠或資料庫內容，未建立保活排程、未新增套件。本對話未執行提交、推送或部署；工作期間其他流程提交為 `6bfdda39`，正式站於 10:50:35 更新為 Ready 部署 `dpl_8MFf23utEtXWr57rXhEiHz6H13xi`，最後唯讀核對實際網域載入的 `CAikS-9U.js` 已包含載入網站提示、75 秒及原 15 秒處理，不將原部署狀態沿用為「尚未上線」。初次舊新版對照誤取已更新的 HEAD，已改用原始 `14e7951d` 重驗並通過。
- 測試密碼僅用於 localhost，測試分頁／暫存服務於驗收後關閉；不將提示改善稱為消除資料庫喚醒時間。Chrome 已正常進入正式首頁，但閒置後仍可能需要喚醒；未驗證 Safari／Firefox，未強制正式資料庫休眠重測，未取得 Azure Activity Log 的 resume 事件。

## 2026-10-20 主導覽品牌館名稱正式發布漏項追查

- 正式兩個網域的Header API及/news SSR均重現「集團品牌館」，API為private,no-store及Vercel MISS，不能推給瀏覽器快取。唯讀Azure正式CMS：Header仍revision3，三個歷史版本皆為舊名稱，10/15的版本只從四個加盟入口補到六個，沒有改名或restore稽核紀錄；目前main仍97aafa0d且部署success。根因為此前只改本機與Vue型別範例，正式CMS漏發布，不是有證據顯示正式名稱發布後被覆蓋。前次未逐欄核對正式Header而宣稱完成的交付不實，這筆紀錄明確更正。
- useCmsResource的_sample不是正式內容fallback；Vue範例改名、Git push與重建不會寫Azure CMS。沿用既有Header修補CLI，增加明確--production／正式目標與TLS保護；正式模式斷言只許一個品牌館label變更，原六個加盟入口、其他欄位、其他文件與舊版本皆不得改動，未發布草稿／自訂名稱／revision衝突即停止，不seed或整庫同步。
- 新增scripts/check-site-header.mjs，需以TEST_BASE_URL明確指向實際網域，檢查該站已發布API與首頁、消息頁的真實Header，並防護加盟兩入口及伸縮箭頭；只允許本機與兩個既有正式HTTPS網域，避免將預覽認證送往外站。不以本機CMS或Footer同名文字當成正式Header驗收。發布前在正式端確實失敗：actual「集團品牌館」≠expected「櫻花集團品牌館」；此檢查不是只驗本機或程式字串。
- dry-run確認revision3只有一個label差異，再以既有Azure runtime執行`pnpm exec node --env-file=../.env.azure-runtime.local scripts/update-header-content-20261003.mjs --production --apply`，正式發布至revision5／cbe20b43-6f2d-4004-9836-9702dc392348；舊6f0098f4-c7b9-4df6-bc0c-5c6a3539eb17及其他歷史全部保留，其餘64份文件revision／草稿／發布ID同transaction不變。再次dry-run為UNCHANGED，沒有重複新增版本。兩個既有正式網域各以`TEST_BASE_URL=https://對應正式網域 pnpm exec node scripts/check-site-header.mjs`，Header API與首頁、/news四項真實SSR檢查均通過，名稱正確且加盟箭頭與兩入口保留。
- 腳本語法、錯誤origin／HTTP正式網址／非標準port／內頁path在認證前拒絕、正式CLI拒絕本機目標、git diff --check通過；另唯讀重查確認整份新Header還原該label即與前版deepEqual，僅新增一個版本及save／publish稽核。此修正為即時CMS內容發布，不需重建或部署前端。未跑含收件寫入的完整測試，未驗手機展開／像素排版，不將API／SSR當成這些互動驗收，也未替既有未提交的其他功能宣稱測試通過。
- 本輪保留既有後台、首頁、捲動等未提交修改，不混推部署；不修改Vue顯示層掩蓋CMS、不新增套件或其他文件、不刪除歷史或業務資料。

## 2026-10-18 進站與返回位置閃動修正

- 主網址新開／重新輸入／重新載入從首頁頂端開始，內頁與錨點直連仍照網址進入；瀏覽器上一頁／下一頁按歷史項目恢復位置，不將內頁強制導回首頁。啟動時停用瀏覽器原生自動捲動恢復，避免 hydration 期間短暫顯示舊位置；跨文件歷史返回仍使用保存的位置。
- 實際逐幀重現：返回建商專區時，先顯示頂端，下一幀才回到 1400px，接著可見區域有六個元素重新播放 Reveal。共用路由在頁面渲染完成後立即定位，不再等待 rAF 才首次捲動，並於掛載效果後再次校正；返回時已瀏覽區域立即顯示，未瀏覽的下方區域維持原進場效果。慣性捲動提前於路由保存歷史位置前停止，避免點擊位置與保存位置不一致。
- 擴充測試另抓到商品分頁讀取時移除清單、導致頁面高度縮短並瞬間壓回頂端。更新期間保留既有清單與高度，以 `aria-busy`／讀取提示標示並暫停舊卡操作；錯誤仍完整顯示。歷史恢復期間觀察後續卡片替換，即使高度相同也讓返回區域立即可見；使用者互動或新導航即解除觀察。商品 API 延後 800ms 納入回歸，麵包屑使用歷史返回時按原位置驗收。
- 錨點直連同時停用目標、子元素及包住目標的 Reveal 動畫，避免祖先元素的 100px 位移動畫讓錨點短暫偏離固定導覽下方的位置。
- 既有 `scripts/check-route-scroll.cjs` 增加返回／前進逐幀檢查，同時檢查位置、隱藏內容與重播動畫；保留延後圖片、桌機／手機／減少動態、錨點與同路徑分頁情境，補驗內頁錨點直連、跨文件歷史返回與內頁重新載入。`pnpm typecheck`、`pnpm build`、腳本語法與 `git diff --check` 通過；建置保留原有 Tailwind sourcemap 與門市 JSON 匯入屬性警告。
- 本機正式產物於 3147 使用既有 Playwright／Chromium 通過 `SCROLL_HISTORY_ONLY=1` 及 `SCROLL_FLOWS_ONLY=1` 三模式：1440px 一般動畫、390px 一般動畫、1440px 減少動態。圖片延後 1200ms／商品 API 延後 800ms 時逐幀檢查仍通過；最終一般返回分別穩定於 1279／1094／1382px，跨文件返回均為 600px。主網址新開／重輸／重整、內頁重整保留網址並回頂、錨點直連、帶 hash／query 歷史、三品牌商品分頁、推薦商品、麵包屑、案例、消息、指南、首頁入口與同頁篩選通過，無前端或 hydration 錯誤。沒有新增套件、資料庫／CMS 寫入、提交、推送或部署；保留其他既有變更，文件只維護本 README。未驗證 Safari／Firefox。

## 2026-10-16 設計案例標題與按鈕欄位名稱

- 首頁設計案例的文字群組改為「標題與按鈕設定」，四個欄位依實際用途固定顯示「英文小標」「區塊標題」「按鈕連結」「按鈕文字」，不以目前文案或網址當作欄位名稱。只有此區塊改用該群組名稱，其他內容仍依各自用途呈現。
- 只調整呈現對照，保留既有文案、連結、欄位代碼、草稿／發布版本與官網效果。既有位置及互動檢查補入固定中文名稱與群組驗證。
- `pnpm typecheck`、內容位置檢查、互動腳本語法與 `git diff --check` 通過。1440／1024／768／390px 瀏覽器確認四個固定中文欄位、原文案及網址、逐項修改後標籤不變、Tab 順序、還原未修改狀態及其他群組維持原名；無水平溢出或 hydration／執行錯誤，桌機／手機截圖已檢視。
- 未儲存或發布內容，臨時測試帳號與工作階段已清除，所有內容及歷史版本指紋未變。本輪僅調整呈現名稱，未重跑正式建置及完整 CMS 驗收；無新套件，僅維護本 README，未部署。

## 2026-10-16 設計案例輪播清單名稱

- 首頁分頁與編輯標題保留「設計案例」，內部清單統一為「輪播案例」，由呈現設定傳入清單元件，避免各處各自寫死名稱；位置說明同步使用「輪播圖片、門市與按鈕」。
- 收合列優先顯示門市名稱，門市未提供或只有空白時改用案例標題，兩者皆未提供時顯示案例識別碼。僅整理顯示文字，不將案例標題寫入門市欄位；名稱隨編輯、選取及排序同步，保留既有案例庫、連結與儲存格式。
- 1440／1024／768／390px 瀏覽器通過分頁／編輯標題「設計案例」、清單「輪播案例」、既有門市名稱、鍵盤展開、門市名稱即時更新及空白回退；從真實已發布案例庫選取沒有門市欄位的來源案例，確認列名使用案例標題、門市欄位仍留空，填入／清空門市名稱後同步切換。上下移動後名稱仍對應案例，移除測試新增項後回到原內容及未修改狀態；無水平溢出或 hydration／執行錯誤，桌機／手機截圖已檢視。
- `pnpm build`、建置後 `pnpm typecheck`、案例／內容位置純檢查、既有互動腳本語法及 `git diff --check` 通過；保留既有 Tailwind sourcemap／地區 JSON import 屬性警告。既有 `scripts/check-admin.cjs` 同步驗證清單名稱及無障礙名稱，純檢查加入門市優先、空白回退與識別碼回退。本輪執行對應範圍驗證，未重跑完整 CMS 驗收。
- 未儲存或發布內容；臨時測試帳號與工作階段已清除，全部內容及歷史版本指紋前後一致。無新套件，僅維護本 README，未部署。

## 2026-10-16 移除浮動服務後台管理項目

- 從後台文件清單移除「浮動服務入口」，工作台內容數量、最近編輯、待發布草稿及網站內容搜尋／分類／分頁同步排除。舊編輯網址與該項目的後台讀取／寫入 API 回傳明確 404，不留下可直接編輯的入口。
- 官網「快速服務」仍讀取原已發布內容，保留官網按鈕、既有資料與全部歷史版本；僅移除後台管理入口，不刪資料表、不下架或改寫內容。
- 1440／1024／768／390px 瀏覽器驗證清單搜尋、全站分類、全部分頁及總覽數量均已排除該項目，本機可管理資源為 58 項；舊編輯頁沒有儲存入口，明確顯示移除原因與追蹤編號。實際已登入 GET（含大小寫及尾端空白網址）與 POST 皆拒絕存取，沒有執行下架或內容寫入。
- 官網公開內容 API 維持 200，前後回應一致；實際首頁快速服務按鈕可見、設計案例／丈量／客服連結與發布資料相符。無水平溢出或 hydration／執行錯誤；臨時帳號／工作階段已清除，所有內容與版本指紋不變。
- `pnpm build`、建置後 `pnpm typecheck`、內容位置檢查、既有互動腳本語法與 `git diff --check` 通過；位置檢查仍涵蓋官網保留的 59 份資源，與後台可管理清單的 58 項有意區分。保留既有 Tailwind sourcemap／地區 JSON import 屬性警告。既有 `scripts/check-admin.cjs` 補入清單排除、後台讀寫拒絕及官網 API 保留檢查，本輪未重跑完整 CMS 驗收。無新套件，僅維護本 README，未部署。

## 2026-10-16 設計風格名稱與縮圖

- 首頁「設計風格」沿用已統一的分頁與編輯標題，清單名稱同步為「設計風格」，收合列顯示實際中文風格名稱（現代風、輕奢風等），並以第一張預覽照片作為縮圖，與官網滑過風格時首先顯示的照片一致。
- 名稱與縮圖隨編輯及排序更新，未設定圖片時提供提示，載入失敗沿用既有前端圖片錯誤與重新選圖後恢復機制。縮圖設定僅套用於此清單，保留原生 details／summary 鍵盤展開，不改官網、內容、網址或儲存格式。
- 收起曾誤標為「按鈕連結」的 `body` 欄位；它實際控制預覽圖片的 Teleport 掛載位置，屬於固定版型技術設定，不應交由內容管理者修改。保留原值，不改寫資料庫。
- 1440／1024／768／390px 實際通過六筆風格名稱、縮圖來源及替代文字、鍵盤展開、名稱與圖片即時更新、未設定提示、圖片失敗／恢復、上下移動後名稱與縮圖對應及恢復未修改狀態；其他未指定縮圖的清單維持原樣。桌機／手機截圖已檢視，無水平溢出或 hydration／執行錯誤，技術欄位已確認不出現在介面。
- `pnpm build`、建置後 `pnpm typecheck`、內容位置檢查、既有互動腳本語法與 `git diff --check` 通過；建置仍有 Tailwind sourcemap 及共用地區 JSON import 屬性警告，本輪未調整地區模組。既有 `scripts/check-admin.cjs` 納入名稱、縮圖及隱藏技術欄位檢查，本輪執行對應範圍驗證，未重跑完整 CMS 驗收。
- 未儲存或發布內容，臨時測試帳號與工作階段均已清除，所有內容與歷史版本指紋未變。無新套件，僅維護本 README，未部署。

## 2026-10-16 門市識別碼與區域縣市

- 首頁管理「門市」新增時自動產生隨機的非負安全整數識別碼，檢查目前清單不重複，避免以列表位置或刪除後最大值重新編號；既有識別碼（含 0）保留，介面唯讀。新增空白門市表單不複製既有地址及電話。門市區域／縣市改為中文連動選單，切換區域後清空縣市並提示重新選擇，保留名稱、地址及電話。
- 兩個地區編輯介面共用原有分類來源，抽出小型 JSON 供前後端使用，分類、順序及既有內容不變。伺服器檢查識別碼、區域及縣市配對；草稿可暫缺縣市，發布須填妥且存在於首頁啟用縣市中，失敗沿用既有前端錯誤及追蹤編號。沒有變更資料庫結構、初始化或改寫內容。
- 修正清單 key 的 `id || index` 為 `id ?? index`，避免識別碼 0 在排序時誤用位置、撞到其他門市；只對門市清單啟用新的自動編號規則。純驗證 `node nuxt-site/scripts/check-store-location.mjs` 通過 1000 次安全整數／去重、原值與分類保留、跨區／無效／缺漏縣市、未啟用縣市及草稿／發布差異。
- 在 `nuxt-site` 執行 `CMS_STORE_DB_CHECK=1 node --env-file=.env scripts/check-store-location.mjs` 通過本機 SQL 真實儲存、原識別碼保留、草稿隔離、發布、錯誤配對／重複編號拒絕、409 及歷史還原；全數 ROLLBACK，所有文件、版本與素材引用指紋一致，未保留測試內容。UI 外另以實際已登入 API 呼叫驗證 400 與追蹤編號，無草稿版本寫入。
- 瀏覽器於 1440／1024／768／390px 通過唯讀識別碼、鍵盤操作、五區連動與縣市清空、地址／電話保留、排序維持編號、連續新增／移除的自動編號及恢復未修改狀態；桌機／手機截圖已檢視，無水平溢出、hydration、重複 key 或執行錯誤。僅用瀏覽器暫時資料驗證官網能選取新編號門市，未儲存或發布官網內容。臨時帳號／工作階段已清除，所有內容與歷史版本指紋未變。
- `pnpm build`、建置後 `pnpm typecheck`、門市／輪播／案例／位置純檢查、互動腳本語法及 `git diff --check` 通過；保留既有 Tailwind sourcemap 警告。既有 `scripts/check-admin.cjs` 已補此流程，本輪執行對應範圍檢查，未重跑完整 CMS 驗收。無新套件、僅維護本 README，未部署。

## 2026-10-16 門市查詢地區與縣市選單

- 首頁門市查詢的 `regions` 改為「地區與縣市設定」，以「區域」下拉選單切換北部／中部／南部／東部／離島，各筆「縣市」改為連動下拉選單，只列出所選區域的縣市，沿用現有 `data/storeCases.ts` 的分類，不另外改動縣市歸屬。
- 支援新增、移除與調整縣市順序；已選縣市不可重複，每區至少保留一個。新增／移除後將焦點移至對應選單；原有跨區或未知值明確提示且不自動改寫。切換區域僅改變正在查看的分組，不觸發內容變更，編輯一區保留其他區域及門市資料，沿用既有草稿／發布與未儲存提醒。
- 新增 `AdminStoreRegions.vue`，由首頁該欄位的呈現設定啟用；不改其他內容類型的分類編輯、官網元件、後端 API 或儲存格式。既有 `scripts/check-admin.cjs` 納入五區切換、縣市值、切換不產生未儲存狀態、新增／移除還原及焦點檢查。
- 1440／1024／768／390px 實際通過五區連動選項、重複選項停用、新增／移除／上下移動、每區至少一項、焦點移動、跨區切換保留編輯、還原未修改狀態及未知／跨區原值提示；桌機／手機截圖已檢視，無水平溢出或 hydration／執行錯誤。另僅在瀏覽器攔截資料，驗證真正官網縣市順序、臺北市門市篩選及切換區域時清空縣市，不寫入草稿或發布版本。
- `pnpm build`、建置後 `pnpm typecheck`、內容位置檢查、互動腳本語法及 `git diff --check` 通過，保留既有 Tailwind sourcemap 警告。本輪執行對應範圍的瀏覽器檢查，未重跑完整 CMS 驗收。臨時帳號與工作階段已清除，所有內容與歷史版本指紋未變；無新套件，僅維護本 README，未部署。

## 2026-10-16 廚房產品標誌與排版欄位

- 廚房產品的 `logo` 顯示「品牌標誌」，白色透明標誌預覽使用深色底。`logoClass` 改為「標誌尺寸」下拉選單，提供既有的小／中／大三組響應尺寸，保留原儲存值與官網效果；若已有其他自訂值，保留並顯示「目前自訂尺寸（保留）」，不自動改寫。
- `captionTop` 改為「品牌標誌與介紹置於圖片上方」，補充實際生效範圍（569px 起、較窄螢幕固定在圖片下方），提示以獨立說明及 aria-describedby 關聯，不混入欄位名稱。只針對此區塊開放安全的既有尺寸選項，不開放直接輸入 CSS；其他版型代碼維持收起，不改官網元件、資料庫 schema 或內容。
- 選單使用獨立 label／for／id，避免選項文字混入欄位名稱；說明以 aria-describedby 關聯。修正後台通用欄位樣式，將 checkbox 排除文字輸入框與 label grid 規則，保留原生勾選框及文字並排；尺寸選單沿用後台輸入框外觀。
- `pnpm build`、建置後 `pnpm typecheck`、內容位置檢查、既有互動腳本語法與 `git diff --check` 通過，保留既有 Tailwind sourcemap 警告。既有 `scripts/check-admin.cjs` 補入標誌欄位、三個尺寸、鍵盤切換及還原輸入檢查；本輪執行對應範圍的瀏覽器驗證，未重跑完整 CMS 流程。
- 1440／1024／768／390px 實際通過中文欄位、尺寸切換及原值還原、鍵盤勾選、無障礙說明、白色標誌深底預覽、未知自訂尺寸保留、未修改狀態及無水平溢出；桌機／手機截圖已檢視。另以瀏覽器暫時攔截資料，對真正官網元件驗證三組響應標誌高度、568／569px 排版切換，無 hydration／執行錯誤，沒有儲存或發布內容。
- 臨時本機帳號及工作階段已清除，所有內容與歷史版本指紋前後一致。無新套件，僅維護本 README；未部署。

## 2026-10-16 首頁管理名稱與產品欄位

- 首頁管理統一使用「廚房產品／設計案例／設計風格」，由同一份呈現對照套用於分頁、編輯標題、位置示意、影響範圍及網站內容清單。廚房產品內保留三品牌清單名稱「廚電品牌」，項目仍直接顯示 SAKURA／SVAGO／TEKA。
- 產品的 `n` 與 `img` 欄位顯示「顯示編號」「產品圖片」；圖片名稱僅套用於此區塊，不影響其他卡片。只調整後台呈現，不改官網文案、內容識別碼、儲存格式、資料庫或版本。既有位置及互動檢查補入對應名稱與欄位驗證。
- `pnpm typecheck`、`node nuxt-site/scripts/check-cms-guidance.mjs`、互動腳本語法及 `git diff --check` 通過。實際瀏覽器於 1440／1024／768／390px 驗證三個分頁切換、編輯標題、位置／影響名稱、查看位置連結、網站內容搜尋、品牌名稱與產品欄位值、鍵盤展開及輸入後恢復未修改狀態；無水平溢出或 hydration／執行錯誤，桌機／手機截圖亦已檢視。檢查等待 Nuxt 切頁及資源載入完成後再讀取欄位，避免誤讀上一個區塊。
- 僅為後台名稱呈現調整，未重跑正式建置及整站回歸；臨時本機測試帳號與工作階段均已清除，全部內容與歷史版本指紋未變。未儲存／發布官網內容，未部署。

## 2026-10-16 廚房產品品牌清單名稱

- 「首頁管理 → 廚房產品」的「廚電品牌」清單直接顯示 SAKURA／SVAGO／TEKA，名稱隨實際品牌資料與排序更新。使用此資源專屬的呈現欄位指定品牌名稱，不將其他圖片的替代文字誤用為清單標題。
- 僅調整後台清單名稱，不改官網品牌、圖片、連結、內容或版本；既有位置檢查及 `scripts/check-admin.cjs` 納入品牌標題、名稱即時更新、移動後對應及恢復原狀檢查。實際瀏覽器於 1440／1024／768／390px 通過三品牌標題、鍵盤展開、即時改名、上下移動後名稱對應及恢復未修改狀態，無水平溢出或 hydration／執行錯誤。測試帳號與工作階段已清除，全部內容與版本指紋未變。
- `pnpm typecheck`、內容位置檢查、互動腳本語法及 `git diff --check` 通過。本輪僅清單呈現調整，未重跑正式建置及整站回歸，未部署。
- 品牌檢查等待後台既有進場動畫顯示完成；另以 390px 整頁截圖確認三個名稱實際可見，不改動網站動畫或捲動。

## 2026-10-16 首頁設計案例選取

- 「首頁管理 → 精選設計案例」將清單改為「設計案例」，收合列顯示門市／案例名稱。使用「新增案例／更換案例」從案例庫搜尋已發布案例，自動帶入識別碼、門市、圖片與連結，提供「查看案例」、排序、移除及媒體庫換圖。識別碼／目的頁唯讀，沿用真實草稿／發布流程。來源／自建案例沒有門市欄位，不冒用案例標題；清楚標示缺漏並允許補填，以 aria-describedby 關聯提示，維持固定可辨識的欄位名稱。
- 新增授權限定 GET `/api/admin/case-library`，只讀取已發布門市、自建及依已發布上架設定啟用的來源案例。伺服器發布前再次檢查重複識別碼、案例公開狀態、圖片及正確目的頁。相容既有 schema，新增選用標題／連結，不重跑 seed、不改寫初始三筆或 SPA／sync 資料。官網維持版型與動畫：門市使用 `/gallery/:slug`，來源／自建使用 `/design-inspiration/:id`；單筆案例的兩張預覽卡採獨立 key。首頁精選圖與排序保有獨立範圍，另提供三種來源的編輯入口。
- `node nuxt-site/scripts/check-gallery-cases.mjs` 通過相容性、欄位／連結、重複／缺漏／不安全網址拒絕。在 `nuxt-site` 執行 `CMS_GALLERY_DB_CHECK=1 node --env-file=.env scripts/check-gallery-cases.mjs` 亦通過真實儲存／草稿隔離／發布／下架／還原／409／未發布不可選／來源上架設定／錯誤連結拒絕；所有交易最後 ROLLBACK，全部文件、版本、素材引用與來源案例指紋一致。
- 本機正式建置於 3139 完整執行 `scripts/check-admin.cjs` 通過：1440／1024／768／390px 案例庫搜尋、重複阻擋、匿名 401、自動帶入、唯讀欄位、補填門市、排序／移除／更換、錯誤原因與追蹤編號、重試、Escape／焦點返回及原內容保留，無水平溢出、hydration、重複 key 或執行錯誤。真正來源詳情頁回傳 200；另外僅在瀏覽器攔截測試資料，驗證單筆來源案例的主圖與雙卡正確連結，未寫入 CMS。原系列入口、輪播裁切、草稿預覽及官網四尺寸亦回歸通過；測試帳號／工作階段已清除，所有內容與歷史版本未變。
- `pnpm build`、`pnpm typecheck`、案例／輪播／位置檢查、腳本語法與 `git diff --check` 通過；未安裝新套件、僅更新本 README，未提交／推送／部署或發布既有內容。3139 驗收程序關閉，3100 開發預覽保留。

## 2026-10-16 設計系列導覽名稱

- 依截圖將系列卡片的管理名稱統一為「設計系列導覽」，套用於網站內容清單、編輯標題、相關入口與總覽。系列清單使用實際名稱（例如 Basic+），中文名稱未填時可改用英文名稱；編輯名稱後收合標題即時更新。
- 只改後台呈現及名稱回退，不改系列網址識別碼、官網內容、資料庫名稱或版本。沿用「管理系列卡片」入口，既有位置／互動檢查同步新名稱。實際瀏覽器於 1440／390px 確認新標題、新名稱搜尋、10 筆真實系列標題（含 Basic+）、鍵盤展開、名稱即時更新與英文回退，恢復原輸入後回到未修改狀態；無水平溢出或 hydration／執行錯誤。臨時測試帳號及工作階段已清除，所有內容／版本指紋不變。
- `pnpm typecheck`、`node nuxt-site/scripts/check-cms-guidance.mjs`、互動腳本語法及 `git diff --check` 通過；本輪為管理名稱與清單標題調整，未重跑正式建置及整站回歸，未部署。

## 2026-10-16 品牌系列卡片管理入口

- 「首頁管理 → 品牌系列」在內容狀態列下方新增金色「管理系列卡片」按鈕，直接開啟既有廚房系列導覽資料（`/admin/content?edit=data-kitchenStyles`），管理卡片圖片、名稱、介紹、連結及順序。區塊標題與介紹仍在原畫面編輯，不複製資料或改寫資料庫；未儲存離開提醒沿用既有機制。
- 更新位置說明及既有 `scripts/check-admin.cjs` 的入口操作。實際瀏覽器於 1440／390px 通過按鈕位置、目的頁、Enter 鍵操作、無水平溢出、未儲存取消後保留輸入、確認後進入既有卡片編輯與五處影響範圍；未見 hydration／執行錯誤。`pnpm typecheck`、內容位置檢查、腳本語法與 `git diff --check` 通過。本輪為導覽入口調整，未重跑正式建置或整站回歸；本機臨時測試帳號及工作階段已移除，所有內容及版本指紋不變。未部署。

## 2026-10-16 首頁輪播桌機／手機圖片與裁切

- 首頁管理 → 主視覺輪播，每張輪播提供桌機／手機選圖、建議尺寸、各自水平／垂直焦點與兩種比例的即時裁切預覽，可查看進場及停留末端構圖。桌機建議 1920×1280、手機 780×1174；參考畫面為 1440×952／390×587，實際裁切隨視窗比例調整。沿用黑／金／白及既有字體，移除重複可見標籤，窄螢幕上下排列。
- 官網輪播與編輯器共用圖片元件、焦點及既有縮放平移設定；767px 以下使用手機圖，未設定時沿用桌機圖。保留 `image` 為桌機圖，新增可選 `mobileImage` 與四個焦點欄位（預設置中，0–100）；伺服器讀取／儲存／發布／還原使用相容 schema，手機素材同樣驗證引用、存取與發布檔案存在。無須重跑 seed 或改寫既有內容、歷史版本；共用模組納入 Nitro inline，開發與正式建置均可載入。
- `node nuxt-site/scripts/check-hero-media.mjs` 通過舊版本、手機回退、獨立焦點、越界／非數字／不安全素材拒絕及整合檢查。在 `nuxt-site` 執行 `CMS_HERO_DB_CHECK=1 node --env-file=.env scripts/check-hero-media.mjs` 亦通過本機 SQL 儲存／草稿隔離／發布／歷史還原／409／缺失手機圖片拒絕，最後全部 ROLLBACK；所有文件、版本及素材引用指紋前後一致，沒有留下測試內容。
- `pnpm build`、`pnpm typecheck`、`node nuxt-site/scripts/check-cms-guidance.mjs`、腳本語法及 `git diff --check` 通過。既有 `scripts/check-admin.cjs` 使用既有 Playwright（`NODE_PATH=/Users/eric/.agents/skills/gstack/node_modules`），指定 `PREVIEW_URL`、`PREVIEW_PASSWORD`、`CMS_TEST_EMAIL`、`CMS_TEST_PASSWORD` 可重跑；只允許 localhost／127.0.0.1。等待 hydration／內容載入後操作，失敗時輸出前端錯誤、網址與截圖，不輸出密碼。
- 本機正式產物於 3139 實際通過 1440／1024／768／390px 後台及官網回歸：切頁、搜尋／分類、選圖即時更新／回退、鍵盤焦點、載入失敗、官網草稿預覽、焦點返回、減少動態，無水平溢出或 hydration／執行錯誤；官網保留原 Hero 高度與圖片滿版。另以僅限瀏覽器的圖片／焦點 fixture 驗證真正官網元件斷點切圖與獨立裁切，未寫入 CMS。暫時測試帳號及工作階段均已清除，所有內容與歷史版本指紋不變。無新套件、僅維護本 README、未提交／推送／部署，未發布既有內容。

## 2026-10-15 後台內容位置與操作說明

- 為「網站內容」與編輯頁加入官網位置、位置示意、影響範圍、查看官網位置與相關編輯入口。首頁各區塊直接連至共用卡片、案例或影片資料，區分版面文字與內容清單。
- 欄位名稱改用固定中文用途說明，不使用英文代碼或目前整段文案當名稱；既有官網已不引用的舊版文案、固定版型的 CSS 樣式代碼在編輯介面收起。另查核伺服器整合：門市案例也影響設計靈感列表與篩選、共用品牌影片也影響品牌館主視覺，均列入影響範圍。呈現資訊由程式維護，不更動資料庫內容、版本、儲存格式或發布權限。僅為首頁風格及標誌區補定位錨點。
- 通過 `node nuxt-site/scripts/check-cms-guidance.mjs`：59 個資源位置、全部可見欄位名稱、8 個首頁入口、共用影響範圍、內頁代表連結、目前文案引用及原 schema 不變。加上 `CMS_GUIDANCE_READ_DB=1`、載入本機 `.env` 後，以 SELECT 檢查目前資料庫 59 份實際 schema 亦通過，不執行 seed 或初始化。新增純呈現對照 `shared/cms/presentation.mjs`／`presentation-copy.json`，後續新增內容類型或版面欄位時須同步維護位置／中文名稱，檢查會攔下漏填欄位。
- `pnpm typecheck`、`pnpm build` 通過；保留既有 Tailwind sourcemap 警告。Puppeteer 實際操作確認「首頁 品牌系列」搜尋結果可區分卡片與標題、首頁管理連至共用卡片編輯、五處影響清單、背景素材中文用途名稱、文字輸入與未儲存狀態。查看位置的首頁 `#kitchen-series` 實際落於導覽下方 60px；1440／1024／768／390px 首頁管理與網站內容清單的位置說明均無水平溢出、未見前端錯誤。原始標題已還原，未按儲存或發布。
- 既有 `scripts/check-admin.cjs` 已同步新的欄位名稱／清單選擇器，加入位置示意、共用範圍、首頁捷徑與錨點檢查；本輪只作語法檢查，瀏覽器互動由 Puppeteer 工具執行，未執行會建立有效業務資料的整站測試。測試帳號限定本機臨時編輯者，驗收後撤銷並清除；65 份文件與全部版本於前後作指紋比對，確認無內容、schema 或發布版本改寫。無新套件、僅維護本 README、未提交／推送／部署。

## 2026-10-15 確認後補完與正式Header發布

- 依使用者三項明確答覆：品牌Hero三項選單留在左側照片內，整組下移48px並置中、各項等分置中，平板手機改24px間距；向下按鈕保留在同組及原中央文字對齊。建商首頁Hero原按鈕改回「立即預約」，不新增第二個入口，保留原表單錨點與其他自訂CMS文案。
- 本次正式CMS獲授權僅補「加盟申請表單」及「加盟資料下載」兩筆並發布；先唯讀／dry-run確認，遇未發布草稿或連結衝突即停止，沿用既有版本與revision保護，不匯入或重置資料庫、不覆蓋其他內容與歷史。
- 正式Header限定修補工具：nuxt-site/scripts/update-header-franchise-links-20261015.mjs，必須--production且預設dry-run，--apply才寫入；純轉換函式納入既有回歸，檢查原內容保留、冪等、重複與衝突，測試匯入不會連線或操作資料庫。
- pnpm build、建置後pnpm typecheck、完整前台回歸（含純函式修補保護）、兩腳本語法、git diff --check與正式編譯scoped CSS的48px／24px及置中檢查通過；沒有新增套件。限定CMS dry-run確認revision1、加盟4→6，實際save／publish後revision3、published=6f0098f4-c7b9-4df6-bc0c-5c6a3539eb17，保留舊784926d3-e6d1-442d-b9cb-dab53f2c9d9b；同transaction核對其他64份文件revision／草稿／發布ID完全不變，再dry-run回傳UNCHANGED。
- 正式HTTP第一次內容讀取45秒逾時；重試已取得六筆正確內容與桌機箭頭，但檢查誤將關閉手機選單的SSR視為必須有箭頭而失敗。原手機選單v-if需客戶端開啟才建立，不為通過檢查而改元件；正式SSR僅驗桌機，手機保留來源／純函式防護並待實際操作驗收。瀏覽器URL安全限制不繞過；SSR與CSS不等於實際手機視覺或返回捲動已驗收。
- 正式兩個既有網域Header API均200／六筆原序及新增連結逐字相符，首頁SSR200確認展開箭頭與兩個目的頁入口已出現。接續以正常main push觸發既有Vercel Git部署，不建立新專案或改正式環境設定。
- 本輪程式3938db42c2c5ebba873637e612daec89fa8a70a1已push main，Vercel與GitHub Production deployment7082245378均success；部署https://header-design-18f37pveh-erics-projects-57e51613.vercel.app。部署後兩個既有正式網域各驗證首頁、品牌優勢、建商首頁、加盟表單／PDF五頁200且不誤轉首頁，品牌左欄三項／向下入口及48px／24px／置中正式CSS、建商單一立即預約／#appointment、六筆Header及桌機伸縮控制均通過。分頁純函式與媒體分塊回歸亦重跑通過；本次三項已確認修改及限定CMS發布完成，不將仍待實際操作的返回位置／手機視覺記為完成。部署結果回寫README正常另commit／push，不amend或force push。

## 2026-10-15 全量檢查與Git正式部署

- 使用者要求跑完檢查、push及部署；使用ponytail／Vercel部署與CLI指引，確認目前main、origin=Eric920418/Header-Design且HEAD／origin main一致。八份未提交檔均為本對話前輪修改，保留相關程式與單一README。只部署已實作且檢查通過的程式，不自行決定尚待確認的品牌Hero選單位置或建商Hero新增預約入口；返回位置先前26px差異及瀏覽器驗收未通過不記為完成。
- Vercel MCP在已知team取得零專案且既有id／header-design皆404，CLI無登入憑證，已停止自動開啟的登入流程；不能據此宣稱專案不存在。GitHub最新main的Vercel status與Production deployment成功紀錄確認既有header-design專案／erics-projects-57e51613，將沿用Git integration推送觸發，不建立新專案、不改環境變數／資料庫或保護設定。
- 全量回歸發現建商品牌區仍要求舊兩行中文，改為明確比對已確認「嚴選國內外優質品牌＋Creating the Ideal Kitchen for Every Family」，僅正規化br與模板原空白，不放寬文案；系列獨立回歸亦同步Clever Hero已確認刪Kitchen，其他系列仍逐字比對原名，不放寬驗收或略過斷言。
- 本輪pnpm build、建置完成後typecheck、完整check-frontend-regressions、check-kitchen-series --cutouts（10系列／45廚電位置／29透明來源／215圖片來源／404）、商品分類封面三品牌749／60／38項、分頁純函式、媒體分塊／格式驗證及preview-access真實15秒逾時／重試／目的頁驗證全通過；腳本語法與git diff --check通過。全量回歸一次在開發SSR商品頁500中止，全部建置／型別作業結束後單獨完整重跑通過，不忽略失敗或修改API回應。保留既有Tailwind sourcemap與Node型別移除實驗警告。
- 九份程式／測試／README已提交並推送main（原八份前輪修改及本輪系列回歸修正），程式commit=2099b50b996a5b610d559153e94fc6bf3aaefe1c。Vercel check為success／Deployment has completed，GitHub Production deployment7072654031亦success，部署網址https://header-design-9nxu2ozhx-erics-projects-57e51613.vercel.app。部署紀錄回寫README另作正常文件commit／push，不amend或force push。
- https://header-design-two.vercel.app及https://sakura-demo-vanlantech.com均已在正常預覽登入後驗證首頁／品牌優勢／加盟介紹／加盟PDF／建商首頁／建商SAKURA六頁SSR200，沒有跳往上次內頁；正式新三行標題、Home7／45+萬、原生required同意label、預約／PDF入口皆存在。每站內嵌style與八份外部CSS200證實招牌20%焦點、19px勾選框、40px PDF標題、輪播pointer、97%進場及同首頁CTA配色都已上線，不只確認Git部署成功。
- 正式驗證初次一個GET遇20秒逾時，正常重試／45秒上限後兩站六頁與樣式全部通過；不關閉安全驗證、不更動資料庫。Nuxt正式版部分CSS直接內嵌HTML，已納入驗證，不能只用link stylesheets判斷未更新。未取得Vercel runtime error logs／drains／建置耗時，不能宣稱監控無錯誤；HTTP／SSR檢查通過不等於實際瀏覽器互動／捲動與視覺验收。
- 未同步正式Header CMS，該兩筆資料是否發布另待使用者確認，推Git本身不會讓缺少的加盟額外入口出現；品牌Hero選單位置、建商Hero預約入口方案及返回位置實際驗收仍待處理，本次發布不宣稱全部需求皆已完成。
- 限定本地前台／SSR／純函式與安全負向驗證，不執行會seed、匯入、還原、建立帳號或插入有效業務收件的資料庫測試。全量前台唯一業務POST為非法team選項，已查server在收件transaction前拒絕，預期400而非新增加盟收件；沒有使用accept-data-loss。瀏覽器URL安全限制不繞過，不將SSR或deployment success當成動態／手機視覺驗收。

## 2026-10-15 建商SAKURA Hero圓形CTA同首頁顏色

- 依00:25:55截圖，只調/builders/sakura-kitchen Hero左下「立即／預約」圓形CTA顏色，以實際HomeHero同款程式為準，不用截圖猜色：#5C5C5C75半透明灰底、#FFFFFF12淡白邊、白字；hover／focus-visible為#CAA05C金字，保持灰底、不再整顆金底黑字，焦點框亦為金色。
- ponytail只改顏色相關宣告，不換CTA結構或動全站樣式；原110px圓鈕／手機90px、位置、14px模糊、2.4秒水波、hover上提、兩行文案、aria-label、CMS入口/builders#appointment及減少動態保留。下方其他預約CTA、Homepage本身與前輪未提交變更不動，無CMS／資料庫寫入或業務POST。
- 既有回歸直接擷取Homepage CTA的底色／邊框／hover色，核對建商局部CSS，另防護原尺寸／水波／手機與SSR預約入口；限定執行通過，/builders/sakura-kitchen與原預約目標SSR均200，該頁所有非CSS內容與HEAD逐字相同。pnpm build、唯一該頁scoped編譯CSS的底色／邊框／白字／金字／焦點及110px／2.4秒動畫、腳本語法、git diff --check通過，保留既有Tailwind sourcemap警告。本輪只改CSS，未重跑typecheck或全站業務POST回歸；只維護README、不新增套件／文件、不提交／推送或部署。
- 尚未作本輪瀏覽器實際hover／鍵盤／手機視覺驗收，不以CSS／SSR或建置宣稱畫面已同色，透明背景受兩頁原照片／遮罩影響，規格相同不代表截圖取色必然相同。

## 2026-10-15 建商預約同意勾選框跑版修正

- 依00:25:41截圖，根因為BuilderAppointmentForm通用input滿寬／58px高／21px內距與文字輸入焦點樣式誤套原生checkbox。ponytail局部修正，在共用表單的文字輸入樣式排除checkbox，不只用一個height覆蓋症狀；一般文字欄位與textarea原樣式保留。
- 同意列改為同一label包input與span，以19px＋可收縮文字欄、11px間距向上對齊，原生勾選框19px／零內距／品牌金色，文字於窄螢幕自然換行；整個同意列最小44px且可點擊文字勾選，保留鍵盤focus-visible。不重畫勾選圖示、不預設勾選，不改文字／隱私入口、required／v-model／提交中停用、驗證、收件API、完整錯誤或資料庫。
- 該元件僅/builders使用，未擴大全站表單樣式；前輪Home7／數字與兩段動畫、Hero待確認CTA、其他表單不動。既有回歸補輸入樣式排除、19px／44px同意列、換行、SSR單一原生checkbox／同一label／required及原綁定／驗證／錯誤保護；限定執行通過，實際/builders SSR200，表單script與HEAD逐字相同，沒有驗證／API改動或表單送出。
- pnpm build、編譯scoped CSS19px勾選框／44px雙欄label／文字輸入58px排除checkbox／焦點框、腳本語法及git diff --check通過，保留既有Tailwind sourcemap警告。模板只包原文字span與新增class，未重跑typecheck或全站含業務POST回歸。
- 只維護README、不新增套件／文件、無CMS／資料庫寫入或表單POST、無Git提交／推送／部署，保留前輪未提交變更；未作本輪瀏覽器實際勾選／鍵盤／手機換行與視覺驗收，不以source／SSR或編譯CSS當成完整畫面驗收。

## 2026-10-15 建商HOME IN O.N.E及三大服務進場動畫

- 依00:16:56截圖，只調/builders內HOME IN O.N.E整張圖為淡入＋輕微放大；使用ponytail局部修改，原全站opalScaleUp由60%放大，過於劇烈，改為此圖專用97%→100%、opacity0→1，僅無減少動態偏好時啟用。不改全站keyframe或其他圖片，不加JS／套件／新圖片。
- 沿用原reveal可見觸發、1.25秒ease／fill both，動畫套外層整圖，不拆圖中字樣或裁切素材；原2.7／1比例、間距、圖片及完整錯誤保留。三大服務已有整組opalMoveUp（100px下方→原位、opacity0→1），保留單一外層包住圖片和三項文字，不拆逐張動畫或重複疊加。
- 減少動態沿用全站直接顯示／動畫none!important，直接錨點仍可跳過reveal；前輪Home7／45+萬、Hero待確認CTA、後續iCare及表單不動。既有回歸補專用97%放大／局部媒體條件、服務整組、原週期／減少動態及SSR標記；限定執行通過。實際/builders SSR200、兩圖各出現一次／HEAD200、三項原服務與兩組data-ev正確；沒有送出表單。
- pnpm build、唯一建商scoped動畫名稱／no-preference條件／97%→100%及opacity0→1編譯keyframe、腳本語法及git diff --check通過；保留既有Tailwind sourcemap警告。僅改動畫屬性與CSS，未重跑typecheck或全站含業務POST回歸。
- 未取得本輪瀏覽器動畫錄影或實作截圖，source／SSR／編譯不代表實際動畫節奏或視覺已驗收。無CMS／資料庫寫入、無提交／推送或部署，只維護README、不新增.md或套件，保留前輪未提交變更。

## 2026-10-15 建商實力Home7版型與45+萬動畫

- 依00:16:44截圖，把/builders#builders-solutions前三項實力改為Home7左文右圖，原Home7 XML的Projects區確認50%／50%、30px間距、#241C18底色、75／105px上下距、左文35px頂距、sticky top110及opal-move-up；沿用既有Vue reveal與本地正式三圖，不引入WordPress／jQuery、不另建頁或生成圖片。手機單欄、取消sticky，設計模組／平台圖contain；已檢視AI工廠原图上方大段空白，沿用原1280／460及bottom cover裁去空白，沒有重新裁製圖片；24／18px圓角。
- 以指定OUR STRENGTHS、智能整合，打造建築新價值、Smart Solutions for Better Living Spaces及整合服務說明取代此區舊Have A Project文案；for Better／Living金色，其餘白色，中文用原襯線、英文用原display字族。原strengths CMS數值／名稱／圖片保留，沒有覆寫CMS／資料庫；45+萬移至左文下方，右欄依序為設計模組／AI工廠／案件管理平台，後面的HOME IN O.N.E、三項服務、iCare及表單不變。
- 45數字進入視窗後以rAF兩秒ease-out計數一次，+萬保留；SSR顯示CMS最終值，不先輸出0。減少動態或無IntersectionObserver直接顯示最終值，偏好切換立即取消動畫；卸載清理observer及rAF並阻止遲到observer啟動，不用setInterval。ARIA提供最終數值、動畫span隱藏於輔助閱讀，等寬數字及固定行盒避免位數變動跳動。既有回歸新增實際計數程式的模擬視窗／時鐘生命週期測試：兩秒終值、只播一次、動態偏好切換、無observer、卸載／遲到callback、非數字／零／負值不動畫、自訂72不改成45及CMS陣列不變；另核對文案、雙欄／sticky、手機、SSR與原六圖。舊「不得有builders-strength」子字串防護誤報新的builders-strengths容器，改為精確class token，仍禁止舊卡片。
- 限定計數／Home7回歸通過；實際/builders SSR200含三筆圖文／指定中英文／最終45+萬及ARIA、六圖HTTP200／WebP尺寸／順序與單次出現、三項服務、iCare樣式與後續聯繫區銜接。原Hero專人聯繫／#appointment仍保留，唯讀CMS確認45數值及舊文案仍原值。pnpm build、建置後typecheck、編譯scoped CSS棕黑／雙欄／sticky／手機static、腳本語法及git diff --check通過，保留既有Tailwind sourcemap警告；未執行包含業務表單POST的全站回歸，沒有送出表單。
- 本輪使用image-to-code／ponytail，文件只維護README、無新套件、无提交／推送或部署，保留前輪未提交變更；上一張Hero立即預約的新增／改字範圍未獲確認，本輪不動該入口。
- 設計QA來源/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_JgyW4u/截圖 2026-10-15 凌晨12.16.44.png（1916×910含拼貼標註，未附CSS viewport／密度）；來源與三張原WebP已開啟檢視，原素材無UI字體需重畫。字體／圖文節奏按原Home7與指定文案、棕黑／金／白色、原圖與原裁切及新文案待實際視覺核對；無實作截圖與同viewport整體／局部並排比較，不以SSR／編譯或函式測試取代瀏覽器動畫／sticky／手機驗收，安全限制不繞過。final result: blocked。依使用者要求QA只維護README、不新增design-qa.md。

## 2026-10-15 加盟資料PDF標題40px與Logo同比例

- 依00:12:04截圖，只調/franchising/download文件介紹的「櫻花整體廚房／加盟簡介」h2，由54px改40px；上方英文Hero不動。ponytail局部修改，保留原中文襯線、字重、兩行文案、配色、欄位與間距；手機保留原38px。
- 標題與Logo共用局部字級變數，依原360／54比例縮放Logo：桌機約266.67px、手機約253.33px，最大不超過欄寬；保留原PNG與3156／245比例，不重新生成或拉伸品牌圖。預覽／下載網址、PDF內容、檔名、載入檢查／完整錯誤與重試不改，無CMS／資料庫寫入、新套件或新文件。
- 既有回歸補局部字級／Logo同比例／手機、兩行SSR文案／原素材、兩個PDF入口及HEAD200防護；初次SSR檢查因圖片元件合併自身class而誤報，已改為比對class token，不放寬素材要求。限定回歸通過、本地頁SSR200／Logo PNG200／PDF HEAD200；未執行業務表單POST或改動原PDF。pnpm build、編譯scoped CSS40px／手機38px及Logo公式、腳本語法、git diff --check通過，保留既有Tailwind sourcemap警告；本輪僅改CSS，未重跑typecheck。保留前輪未提交變更，未Git提交／推送、部署或驗正式端。
- image-to-code局部截圖對照：來源/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_qgdJJJ/截圖 2026-10-15 凌晨12.12.04.png（1582×816含標註畫布，原CSS viewport／密度未提供）；已開啟來源，沿用原Logo、背景、預覽圖片及圖示。字體／顏色／文案不變，尺寸按標註調整，實際換行／欄位／圖片縮放仍需畫面驗收。沒有新的實作截圖、同viewport整體與局部並排比較，不能以source／SSR／編譯CSS宣稱視覺通過；瀏覽器安全限制不繞過，final result: blocked。依使用者要求只維護README，不新增design-qa.md。

## 2026-10-15 我要加盟名人輪播可點擊區手指游標

- 依00:11:51截圖，ponytail核對/franchising/intro名人案例輪播：五筆卡片只有article及Embla拖曳，無點擊事件、URL或案例導頁；可點擊區為下方上一個／暫停繼續／下一個三個button。只對此三個按鈕加cursor:pointer，不對卡片加假連結提示或臆造點擊功能。
- 原44px觸控高度、hover／focus、3.5秒自動循環、暫停切換、減少動態、鍵盤方向鍵、五筆資料／兩輪交錯及圖片不變，不全站改button或動其他輪播。若後續要求卡片導頁，需另確認對應案例連結；前一張品牌選單「下移置中」範圍仍待使用者確認，未移動選單。
- 既有回歸新增局部手指游標、無點擊卡片不顯示pointer、三個SSR按鈕及無障礙狀態防護。限定輪播回歸通過：本地頁SSR200、三個控制按鈕／標籤／播放狀態、五筆原案例及圖片200、十個交錯顯示位置／五個輔助閱讀隱藏位置、01–05編號／雙接縫、空／奇／偶數資料、方向及減少動態函式；未執行含業務表單POST的全站腳本。
- pnpm build、編譯後scoped按鈕CSS的cursor:pointer、回歸腳本語法及git diff --check通過，保留原Tailwind sourcemap警告。本輪只改一項CSS，未重跑typecheck；未作瀏覽器實際滑鼠游標／點擊／鍵盤／手機視覺验收，不將SSR或編譯CSS當成實際互動驗收。只維護README，不新增套件／文件、不寫CMS／資料庫、不Git提交／推送或部署、不驗正式端，保留前輪未提交招牌／標題變更。

## 2026-10-15 品牌承諾Hero完整三行標題

- 依00:11:21截圖，只將/about/advantage主標題改為Why Choose／SAKURA KITCHEN／For Your Home三行；桌機首尾白色、中間整行品牌金色，保留OUR COMMITMENT、既有品牌導覽及向下按鈕。使用ponytail局部修改，前輪招牌焦點與文案安全間距、右側圖文及後續大圖保持不變。
- 原全站桌機80px!important會強制覆寫局部字級；這個固定長標題沿用已有hero-template-title排除機制，局部採clamp(40px,4vw,80px)、不額外拆行，平板原60px保留，手機clamp(24px,7.8vw,40px)。不修改全站標題規則／字型，不縮放整張Hero或改其他頁面。
- 既有回歸加入完整文案／兩個換行、金色範圍、局部響應式及全站覆寫排除、SSR內容防護；SSR只正規化br／span的scoped屬性，不放寬文案或分行要求。限定品牌Hero回歸通過，實際/about/advantage SSR200含完整三行，前輪招牌安全規則、原大圖進場／減少動態、圖片／向下連結防護仍通過。
- pnpm build、建置後typecheck、回歸腳本語法及git diff --check通過，保留原Tailwind sourcemap警告。未作本輪瀏覽器換行／字體／招牌及左右欄位實際視覺驗收，不把CSS規格／SSR確認當成無溢出或像素驗收。只維護README，不新增套件／文件、不改CMS／資料庫、不Git提交／推送或部署，不驗正式端；保留前輪未提交招牌定位變更。

## 2026-10-15 品牌承諾Hero背景招牌完整露出

- 依00:10:49截圖定位Why／SAKURA KITCHEN的品牌承諾Hero（/about/advantage），使用者澄清「要出現背景圖片的招牌，不能被擋住」；以此為準，不按初步猜測刪掉招牌或將照片裁到招牌以下。image-to-code／ponytail保留承德店原圖及CMS素材變數，只修背景焦點與左側文案安全間距，不改文字、字級、右側圖／說明或其他頁面。
- 已檢視原store-chengde.jpg（500×371），上方SAKURA文字約在y74–84；原背景往上延伸25%並底部cover，使招牌落入固定導覽覆蓋區。改背景焦點為20%，背景層上移量補償「導覽高度＋16px」安全區，桌機左側copy增加32px上距；平板／手機既有背景隱藏及單欄規則不動，不修改或生成圖片資產。
- 既有回歸加入素材／焦點／導覽變數、桌機局部間距、手機原規則及1025–3840px／900–1200px容器高度的靜態招牌幾何防護；限定執行通過。實際site-visuals API200確認背景仍為已量測的store-chengde.jpg，/about/advantage SSR200及原大圖進場／替代文字／優先載入／向下連結防護通過。pnpm build、腳本語法及git diff --check通過，保留原Tailwind sourcemap警告；本輪只改CSS，未重跑typecheck或全站業務表單回歸。
- image-to-code設計QA：來源/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_pUW1hi/截圖 2026-10-15 凌晨12.10.49.png（890×648，未附原CSS viewport）。原圖已開啟檢視，未編輯素材；字體／字級／配色／原圖片及文案不變，僅改焦點與左側間距。沒有新瀏覽器實作截圖、同viewport比較及實際動態驗收；幾何模型不是畫面驗收，瀏覽器URL安全限制不以替代工具繞過。final result: blocked（需實際裁切截圖确认，不能宣稱招牌於所有實際畫面皆无遮挡）。依使用者規則只寫README、不新增design-qa.md。
- 未改CMS／資料庫、不Git提交／推送或部署、不驗正式端。工作區在本輪檢查前已由其他流程提交為a8977c1c；本輪只新增BrandAdvantageHero兩項CSS、限定回歸及README紀錄，保留該提交既有內容，不更改已完成的其他頁面。

## 2026-10-15 廚電三品牌切換按鈕16px SemiBold

- 依2026-10-14 23:43:37截圖，ponytail只把共用ProductBrandPage的SAKURA／SVAGO／TEKA品牌切換按鈕由14px改16px、font-weight600；桌機／平板／手機套用同一規格。不改原字型、等寬116px欄、52px最小高度、12／8px內距、20px間距或手機三等分／12px間距。
- 原品牌切換網址、當前品牌aria-current、hover／鍵盤focus與商品分類內容保留，其他導覽／CTA／列表標籤不套用本次規格。既有回歸新增16px600及原高度／內距防護，文件只維護README，不新增套件／文件、不修改CMS／資料庫或部署。
- 限定品牌回歸通過16px600、等寬／手機三欄、原52px高度／12px8px內距；三品牌頁SSR均200且保留三個品牌網址及唯一aria-current。本次pnpm build通過、建置後唯一品牌按鈕scoped CSS規則含font-size16px／font-weight600，腳本node --check及git diff --check通過，保留既有Tailwind sourcemap警告。
- 本輪僅修改兩項CSS屬性，未重跑typecheck或含業務表單POST的全站回歸；未作瀏覽器字體實際呈現／視覺／互動驗收，不將編譯CSS當成畫面像素驗收。未Git提交／推送、部署或驗正式端；保留前輪未提交變更，正式需部署本次程式才會更新。

## 2026-10-15 品牌系列推薦電器導向產品介紹頁

- 依2026-10-14 23:43:25截圖，用ponytail核對共用推薦卡；原模板只有equipment.route非空才是NuxtLink，Clever五筆CMS網址皆空，導致圖片／型號／名稱均不可點擊。修改前實際SSR斷言五個a連結失敗（0≠5）。其他系列亦有空白或誤指/products/sakura品牌首頁的入口，不直接拼型號或將全部送到產品列表。
- 已核對本站產品API／來源資料：EG2350GB對应EG2350G id81546、Q7585BL對應Q7585B id82121、DR7397XL對應DR7397 id82131；VE7770A是SVAGO id82164，G2926G是SAKURA id80339。規格型號歸屬另以官方2024型錄、Q7585手冊及DR7397官方商品頁驗證，不用去尾碼猜測或跨品牌取第一筆。原卡的型號／名稱／圖片保持不變。
- 在既有kitchenSeries.ts加入15個已核對的詳細頁入口，KitchenSeriesPage只補空白或品牌首頁route，已有明確自訂／官方入口保留；未知型號仍不臆造網址。沿用整卡NuxtLink及外連安全屬性，CMS資料不覆寫；不新增API／套件／文件、不改商品資料、圖片、Hero或其他區塊，只維護README。
- 官方核對來源：https://www.sakura.com.tw/Uploads/Catalog/6516c7d9-7c55-4723-8027-f224d2e65dd8/%E7%B6%B2%E8%B7%AF%E7%94%A8_SAKURA_%E5%85%A8%E7%94%A2%E5%93%81%E5%9E%8B%E9%8C%84_%E7%94%9F%E6%B4%BB%E9%A4%A8_240418.pdf、https://buy.sakura.com.tw/files/11984/Q7585%E8%AA%AA%E6%98%8E%E6%9B%B8_250522.pdf、https://shop.sakura.com.tw/zh-TW/products/dr7397。不修改資料庫或正式端。
- 修正後15個新增入口的產品API均200且主型號／品牌／route符合對應；十個系列SSR共45張推薦卡全部為連結，圖片／型號／名稱在同一a內，CMS原始equipment不變。Clever五個目標頁SSR皆200、主商品型號正確且沒有role=alert。既有回歸加入純函式解算、自訂／官方及未知型號保留、五個目標API品牌／主型號及整卡SSR連結防護；只限定執行，不跑業務表單POST。
- pnpm build、建置後typecheck、限定回歸、腳本語法及git diff --check通過，保留既有Tailwind sourcemap警告。未執行本輪瀏覽器點擊／鍵盤／觸控及返回位置驗收，SSR連結和目標頁200不等同實際互動驗收；未驗正式端、不Git提交／推送或部署，正式需部署程式修改。保留原未提交Hero／門市／Footer CLI變更；目前為本地連結與資料／建置驗證完成、瀏覽器互動待確認。

## 2026-10-15 品牌系列Hero動畫與首頁一致核對

- 依2026-10-14 23:43:14截圖指定標題區動畫同首頁，以ponytail比對目前HomeHero／KitchenSeriesPage及實際共用src/styles/globals.css；兩頁現有主標題皆包在hero-slide-copy內，已共用hero-copy-cycle 5s ease both，由左48px淡入、停留、後段淡出，5秒換圖時透過key重建文字包層；系列手動換圖亦增加heroTransition重播。
- 截圖含AI LIGHT／龍頭說明及已刪除的舊底欄，不代表目前本地內容；本輪不恢復舊文字、不新增介紹內容、不改Hero字級／定位／圖片、底部框外箭頭＋型錄／探索CTA或Clever標題，不另疊加v-reveal／新動畫。首頁與系列皆保留減少動態停播／文字直接顯示。
- 只在既有回歸補共用class、動畫階段／5秒週期、換圖key及減少動態一致性防護，限定執行通過；回歸腳本node --check及git diff --check通過。本地3100首頁／aikitchen／clever SSR均200、h1在hero-slide-copy包層内，兩系列新底部控制組保留且舊文案節點不存在；實際/_nuxt/assets/css/main.css200含共用hero-copy-cycle及hero-slide-copy規則。
- 本輪未修改Vue／CSS，無需再次建置；不把source／SSR／CSS確認當成瀏覽器實際動畫或像素驗收，未重新捕捉動畫，亦未驗正式端。文件只維護README、不新增文件／套件，不修改CMS／資料庫、不Git提交／推送或部署，原未提交變更保留。結論為本地動畫規則已符合，不新增重複動畫；若正式端畫面仍不同須另驗正式部署，不能以本地結果代替。

## 2026-10-15 品牌系列Hero框外箭頭與探索設計案例CTA

- 依2026-10-14 23:43:00截圖及使用者明確確認「箭頭放框外左側；框內保留型錄＋探索設計案例」，共用KitchenSeriesPage底部由左側前後箭頭與右側玻璃框組成；框內保留品牌系列型錄圓鈕，新增探索設計案例連到/design-inspiration（設計靈感），並使用既有Lucide右上箭頭。
- 沿用ponytail局部改模板／CSS，保留上一輪已刪除的前段及Clever Hero文案修正、不重建Hero。輪播函式／自動播放／單張停用／無障礙標籤、型錄query／另開新分頁及安全屬性、Start Project／圖片／系列抽屜與CMS內容不動。
- 桌機箭頭在框外左側；手機原安全距離下無法容納整排，因此框外箭頭置於框上方靠右，框內70／98px兩欄。保留原深色背景／模糊／圓角，新增CTA最小44px觸控高度及鍵盤focus。既有回歸同步更新以防舊欄位驗收誤報；只維護README，不新增套件／文件、不寫資料庫或部署。
- 限定回歸通過：框外控制組在框前、框內兩連結及右上圖示、型錄query／安全屬性、箭頭事件及單張停用、自動輪播／減少動態保留、三斷點CSS與320／390／767px靜態寬度容納。3100的aikitchen／clever SSR均200，框內無button／控制組、探索CTA href=/design-inspiration、圖示存在，控制組在框前；Clever單張仍停用箭頭、兩頁Hero文字及前段刪除保留。目標/design-inspiration SSR200且含設計靈感內容，未送業務表單。
- pnpm build、建置後typecheck、回歸腳本語法及git diff --check通過，保留既有Tailwind sourcemap警告；未作本輪瀏覽器視覺、實際點擊／鍵盤／觸控或返回捲動驗收，不能把SSR及靜態欄寬檢查當成互動／無溢出完整驗收。未Git提交／推送或部署，正式端需部署此程式更新；原門市／Footer CLI等未提交變更保留。

## 2026-10-15 品牌系列內頁Hero底欄只保留後段

- 依2026-10-14 23:40:49截圖刪除共用KitchenSeriesPage Hero底欄前段縮圖／眉標／標題／說明，只保留後段品牌系列型錄及上一張／下一張箭頭；適用品牌系列內頁共用底欄。使用ponytail局部刪除，不重建Hero、不刪上方標題／Start Project、其他區塊或CMS資料。
- 刪除失去引用的heroStories／activeHeroStory與專用CSS動畫；底欄改靠右max-content兩欄，保留桌機位置／高度／深色背景／圓角，手機改98px高70／88px兩欄，不留下整條空框或236px舊文案留白。型錄系列query及新分頁安全屬性、單張系列箭頭停用、showHero循環及5秒自動輪播／減少動態設定保留。
- 限定回歸通過移除內容、型錄query／安全屬性、前後箭頭與单張停用、三斷點欄位及320／390／767px靜態寬度可容納防護；以元件實際showHero函式驗證一張／三張圖片的前後循環與轉場計數。3100本地aikitchen／clever SSR均200、前段縮圖／文案節點不存在、型錄及兩箭頭／Start Project／背景保留，Clever單張兩箭頭停用、AI三張可用。未跑含業務表單POST的全站回歸。
- pnpm build、建置後typecheck、回歸腳本語法及git diff --check通過，保留既有Tailwind sourcemap警告。未作本輪瀏覽器視覺／觸控互動驗收，靜態寬度檢查不代表真實畫面無溢出；狀態為本地實作及邏輯／SSR驗證完成、視覺驗收待確認。文件只維護README，不新增套件／文件，不Git提交／推送或部署、不修改CMS／資料庫或正式端；不包含其他待處理項目並保留前輪變更。

## 2026-10-14 Clever品牌系列內頁Hero刪除Kitchen

- 依23:40:33截圖只將/home-style/clever的Hero「Clever Kitchen」呈現為「Clever」，保留原字級、白色、定位、圖片、Start Project及系列抽屜。image-to-code／ponytail採既有頁面局部文案修正，不重建頁面或生成資產；文件只維護本README。
- 共用KitchenSeriesPage限定slug=clever且CMS名稱為Clever Kitchen時改Hero顯示；其他系列（含AI Kitchen）、CMS自訂名称、SEO、圖片alt與其他區塊仍取原data.name。不修改CMS／資料庫，避免全域刪除Kitchen或覆寫系列資料。
- 既有回歸加入限定Hero文案及其他系列／自訂CMS名称／SEO保留檢查，限定區塊執行通過，未跑包含業務表單POST的全站回歸。本地3100實際SSR兩頁均200，clever的h1為Clever、aikitchen仍為AI Kitchen，原標題class／CTA保留；pnpm build、建置後typecheck、回歸腳本語法及git diff --check通過，保留既有Tailwind sourcemap警告（驗證跨至2026-10-15）。
- 設計QA來源為/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_hGkYMW/截圖 2026-10-14 晚上11.40.33.png。五項範圍檢查：字體／字級、定位／間距、配色、圖片資產均無程式變更；Hero文案經SSR確認。瀏覽器先前受URL安全限制，本輪未改用替代方式繞過；無新瀏覽器截圖、未作同viewport視覺比較，image-to-code設計QA final result: blocked（僅文案邏輯／SSR及建置已驗證，不宣稱像素或互動驗收通過）。依使用者規則只寫README、不新增design-qa.md。
- 正式端需要部署程式修改，不能把本地改好當成正式生效；本輪未Git提交／推送、部署、修改CMS或資料庫，亦不包含其他待處理項目，原未提交門市及Footer CLI變更保留。

## 2026-10-14 正式Footer網站地圖對齊已確認版本

- 依23:38:13截圖與要求處理正式頁尾，gstack-openclaw-investigate／ponytail核對正式SiteFooter API200仍為舊內容，本地已確認入口數4／4／4／1／3／2。只修兩個品牌名稱、補到府丈量／線上客服、移除指定五個多餘Footer入口；不把截圖舊文字當新版設計，也不修改其他CMS文件。
- 正式Azure既有SakuraWebsiteTest／CMS應用帳號唯讀核對Footer revision1、draftId等於publishedId，沒有未發布草稿；沿用現有update-footer-content-20261003.mjs交易save／publish與revision衝突檢查，保留80a65fb3-1243-4c4f-8972-e64a0d1c3f81舊版本。新增明確--production且必須匹配既有.env.azure-runtime.local目標／固定庫名／CMS應用帳號／正式TLS驗證；預設仍只允許本機，沒有擴權或改憑證。
- 執行以nuxt-site為cwd：node --env-file=../.env.azure-runtime.local scripts/update-footer-content-20261003.mjs --production先做dry-run，確認後同指令加--apply。保護copy（圖片／社群／版權）、cmsSettings及設計案例／優惠消息欄完全不變；不seed、整庫import或修改主導覽。
- 更新前正式入口數4／6／2／1／3／5的驗收斷言失敗；版本化發布後Footer revision3、draftId等於publishedId 7eccba2b-b638-4e95-a97b-0b24da9293c7，原80a65fb3-1243-4c4f-8972-e64a0d1c3f81版本仍存在。與舊版本核對copy／cmsSettings及兩個未修改分類完全相同，其他CMS文件的revision／draftId／publishedId在發布前後完全一致。
- sakura-demo-vanlantech.com與header-design-two.vercel.app的正式Footer API及首頁SSR均200；兩站API全文與新發布版本相同，六欄18個指定入口全部存在、五個多餘入口及舊「關於櫻花」名稱不存在於Footer。只檢查Footer範圍，未誤把主導覽中的同名入口當成頁尾殘留。本輪修復為正式CMS發布，不需重建部署；未驗收瀏覽器展開互動／像素排版，亦未處理待授權的Header加盟箭頭或尚未通過的歷史捲動驗收。
- 發布後重跑正式dry-run回UNCHANGED，沒有建立額外版本；腳本node --check及git diff --check通過。只修改此限定CLI與本README，保留既有HomeStoreLocation及回歸腳本未提交變更；未新增套件、提交Git或部署。調查結論：正式CMS頁尾舊資料為根因，內容已發布並經兩網域API／SSR驗證；狀態DONE_WITH_CONCERNS（瀏覽器展開及像素驗收未執行）。

## 2026-10-14 首頁門市翻牌不重複

- 依23:36:56截圖，gstack-openclaw-investigate／ponytail確認本地九筆門市無重複，同時四卡原已依ID排重；真正缺口為隨機抽選只排除當前四家，剛離場者可在其他門市尚未顯示前立即再出現。
- 規則採同一篩選範圍內全數顯示過再開下一輪，當前四卡始終不同；門市有限，不承諾永遠不重播。篩選不足四家只顯示實際數量，選取門市、翻牌動畫／間隔、地圖及資料庫內容保留。驗收與調查只寫README，不新增文件。
- 先補既有回歸的確定性抽選測試：首輪九家完整且未顯示完前不重抽、跨輪四卡唯一、選店保留、零至四筆不翻牌及暫停／減少動態，預期舊邏輯失敗後再做最小修正。
- 測試夾具保留原760ms常數，以原runFlip函式直接執行並固定隨機值，避免只測重寫的模擬演算法。
- 舊程式已確定性重現「本輪全部門市未顯示完之前不得重抽」失敗；新增已顯示ID集合，優先抽未顯示候選者，全輪完成才以當前四卡開新輪，切換篩選重新初始化集合。只改HomeStoreLocation的抽選狀態，不變更門市內容或其他輪播。
- 修正後限定回歸通過：首輪完整九家、不重抽、多輪四卡唯一、手動選店保留、零至四笔不補重複卡，以及暫停／減少動態。另以實際元件script經TypeScript轉譯搭配Vue ref／computed／watch及可控計時器執行，北部五家仍翻牌、中部四家停止、無符合城市顯示空清單、清除篩選回九家時已顯示集合重新初始化，全部通過；補入篩選reset來源防護。
- pnpm build／建置後typecheck、回歸腳本語法及diff檢查通過，保留原Tailwind sourcemap警告。未執行含業務表單POST的全站回歸，也未重新做瀏覽器動畫視覺驗收；本輪只確認抽選／響應狀態邏輯與建置。調查報告：隨機抽選缺少本輪已顯示記錄，已加集合並以舊失敗／新通過證據確認；狀態DONE_WITH_CONCERNS（視覺及正式端未驗）。未部署、提交或更改CMS／資料庫，正式端需部署此程式修改才會生效。

## 2026-10-14 正式加盟選單伸縮箭頭未顯示根因

- investigate／ponytail及Vercel部署檢查只做診斷，不改正式資料。Git main與origin/main均為14e7951d；SiteHeader伸縮功能已於184fb7db提交。Vercel CLI目前沒有登入憑證、MCP對既有team／project回404，不能由此確認正式部署的完整commit；已改以正式實際SSR及公開JS取證，不宣稱取得Vercel部署metadata。
- 本地及兩正式網域header-design-two.vercel.app／sakura-demo-vanlantech.com的view-components-SiteHeader均HTTP200：本地加盟children六筆，正式均四筆，正式缺加盟申請表單/franchising/form與加盟資料下載/franchising/download。使用同一navChildren分組函式可重現本地extras=2、正式extras=0；箭頭v-if依extras.length決定，正式條件為false。
- 正式首頁SSR均200且沒有franchise-extra-desktop；x-vercel-cache=MISS、age=0。首頁引用的/_nuxt/SrV8HtzE.js HTTP200，含桌機／手機franchise-extra-desktop／mobile、展開加盟申請與下載選項及對應額外選單過濾邏輯，證實這項程式已在線上，不是只憑本地source推測部署。此檢查排除「箭頭程式完全沒部署」及本次回應的舊快取，未驗其他新版功能或完整commit一致性。
- 根因是程式與正式CMS資料不同步。useCmsResource的_sample只提供型別，不會把Git中示範選單合併進正式發布內容；推Git／重建部署不會更新Azure CMS。本機update-header-content-20261003.mjs亦明確只允許本機SakuraWebsiteDev，不能直接用於正式。
- 調查結論：原因已確認、尚未修復。建議僅替正式Header新增／發布上述兩筆，保留原四筆、其他所有欄位、歷史版本，先检查未發布草稿及revision衝突後才更新；不得整份seed或覆寫資料庫。先前只驗本地而未驗正式CMS的交付缺口已記錄。本轮只补README，不修改程式／CMS、不部署、不送業務表單；後續正式修改待使用者授權。

## 2026-10-14 主導覽品牌館名稱核對（23:17截圖）

- 依截圖指定「櫻花集團品牌館」，以ponytail先核對共用SiteHeader與實際發布內容。本地/api/content/view-components-SiteHeader200，品牌承諾下唯一/about/exhibition入口已為「櫻花集團品牌館」；首頁SSR200亦輸出相同文字，非只看程式範例。桌機及手機由同一rightNav／navChildren來源輸出。
- 此需求在本地已完成，因此本輪不重複修改Vue／CMS、不新增版本／套件或文件，只補本README與既有SSR回歸防護。截圖含旧名稱不能視為目前本地状态；本輪未確認正式網站，也未執行瀏覽器互動，未部署或修改資料庫。原瀏覽器返回位置修正仍待完整驗收，不將本輪文字核對視為其驗收完成。

## 2026-10-14 預覽登入長時間等待調查

- 使用者回報 Chrome 停在「驗證中…」。線上獨立量測登入 API 200 約430ms、首頁 HTML 200 約1638ms；同一台 Chrome 實際點擊約977ms進首頁，本輪尚未重現間歇性長等待。Vercel 23:18:03 的 Chrome POST 紀錄顯示執行11ms、回應66ms且無對外請求，不能認定資料庫或密碼比對變慢，也不能把目前正常當成原問題已消失。
- 確認登入請求原本沒有逾時限制，連線卡住會持續鎖在驗證中。限定修正登入頁的15秒逾時、不自動重送、防止等待中重複送出與前端錯誤細節；不變更驗證密碼、簽章、Cookie期限或其他頁面。此修正限制等待並讓使用者可重試，不宣稱已找到間歇性網路延遲來源。
- 新增 `pnpm --dir nuxt-site exec node scripts/check-preview-access.mjs`，使用真實ofetch與本機無回應HTTP服務驗證逾時，另驗錯誤密碼、重試、成功返回指定內頁及外站導向防護。文件僅維護本README，不新增套件、不寫CMS／資料庫、不部署；保留原有未提交的router捲動修改。
- 回歸先在未修正頁面執行失敗，再於修正後通過真實15秒逾時／不重送／解除pending／錯誤細節／錯誤密碼與成功重試檢查。`pnpm build`、建置後`pnpm typecheck`、腳本語法及`git diff --check`通過；保留原Tailwind sourcemap警告。
- Chrome搭配獨立3048建置預覽／3049暫存代理，讓第一筆POST真正無回應，確認15秒後role=alert顯示逾時與底層TimeoutError、按鈕可重試；再次送錯誤密碼正確顯示401，再用正確密碼可返回指定的站內Logo資源，沒有讀寫CMS或提交業務表單。使用者補充為偶爾無規律發生，原間歇性延遲尚未定位，investigate狀態為DONE_WITH_CONCERNS；確認的缺陷為缺少等待上限，並非已證實的伺服器效能退化。
- 本輪未執行Git提交／推送或Vercel部署；驗證期間工作區由其他流程提交為14e7951d，最後唯讀抓取正式網域登入頁及其JS，已確認線上程式包含「驗證連線超過15秒」處理。暫存測試服務於驗證後關閉。

## 2026-10-14 首頁進站與歷史捲動恢復

- 依需求區分新網址進站與瀏覽器Back／Forward：官網根網址只進首頁、直接內頁網址仍進指定內頁，不加入「上次頁面」導頁或覆寫地址。新載入不沿用history中的舊捲動值；明確錨點仍定位原區塊。瀏覽器「恢復整個分頁」若恢復的是內頁網址，與直接內頁連結無法只靠URL區分，因此不強制將所有內頁載入導回首頁。
- ponytail最小範圍修改共用router.options.ts：原實作忽略savedPosition並將返回固定到0；改為歷史返回優先恢復Vue Router依history entry保存的位置（包含同頁query及帶hash歷史位置），一般新頁仍從頂端開始，原同頁篩選維持位置。
- 跨頁定位先等待Nuxt page:loading:end及兩次rAF，舊導航可取消；恢復位置後以scroll與ResizeObserver處理延後圖片／CMS高度變化和捲動範圍初期不足，使用者wheel／touch／pointer／keyboard／focus或新導航即解除固定，保留Lenis慣性終止及原錨點reveal處理。不新增套件、資料庫／CMS寫入或部署，文件只維護README。
- 既有check-route-scroll.cjs改掉「後退／前進必須回頂」的舊驗收，新增SCROLL_HISTORY_ONLY唯讀模式：桌機／手機／減少動態分別測主網址、新分頁／重整、內頁直連、中段品牌卡返回與前進、延後圖片1200ms、帶hash及同路徑分頁歷史位置；不送聯繫表單。
- 2026-10-14再次詢問狀態時，確認修正已在14e7951d，補跑本地SCROLL_HISTORY_ONLY實際瀏覽器回歸。1440px一般動畫的中段品牌卡跳頁可從新頁頂端開始；返回且延後圖片1200ms時，點擊事件記錄1278px、返回後三次取樣均1304px（差26px），超出2px驗收容差而停止。未回到頂端、返回後也沒有後續跳動，但慣性捲動的取樣時間差或位置保存偏差尚未釐清，不能認定整項已完成。
- 本輪為状态查核，不改實作或放寬測試門檻，不部署或修改資料庫；手機、減少動畫及正式端尚未完成本次驗收。当前状态：程式已加入／完整驗收未通過，不能把建置成功或Git已提交當成互動驗收完成。

## 2026-10-14 建商專區聯繫品牌館標題

- 依15:29:26右圖將聯繫區標題改Explore Our／櫻花集團品牌館 The Art of Kitchen Showrooms，中文及of／Kitchen金色、其他英文黑色。明列規格採眉標16px、中文38px／SemiBold（600）、英文58px；同列中文-.06em基線補償，眉標字距0。平板32／48px、手機28／34px與中文分行，不誤套前兩區40／50px。
- 使用image-to-code及ponytail只改本頁聯繫標題／局部字級，保留GET IN TOUCH膠囊、館別切換／聯絡資訊／圖片、表單欄位與驗證、其他標題及錨點。CMS舊文字不覆寫，未新增素材／套件／文件、不寫資料庫、送表單或部署；文件只維護README。
- 既有回歸新增完整中英文／金色範圍及16／38px600／58px防護，限定執行，不跑全站表單POST。
- pnpm build／建置後typecheck、限定兩項回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px：眉標均16px、中文38／38／32／28／28px600、英文58／58／48／34／34px，標題及全頁水平溢出0。表單六個input／textarea節點保留，未填寫或提交。
- 館別鍵盤驗證：台北focus後ArrowRight選取／聚焦台中（aria-selected=true）、地址更新公益路二段858號；End選取高雄並更新美術東二路26號。前後唯讀view-pages-builders-index200且內容一致，pageerror／console error為空；未寫CMS／資料庫或部署。
- 設計QA來源/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_3TfnYI/截圖 2026-10-14 下午3.29.26.png（2020×706像素，右側約968px縮放示意）；實作/tmp/sakura-builder-contact-vjJFz8/contact-1280.png及同名1024／900／390／320.png，各為同名CSS寬度×900、deviceScaleFactor=1，以台北初始選取狀態比較。來源與實作在同一檢視輸入對照；來源未附原始CSS viewport，不宣稱逐像素零差異。
- QA五項：字體／字級／權重／基線與換行、原30／70%標題欄及垂直間距、指定黑金配色、既有館別／背景素材品質、指定中英文內容皆通過。標題細節在完整比較可讀，不另加放大裁切；原表單內標題「預約品牌館參訪」與截圖不同但不屬本次標題變更範圍，刻意保留。無待解P0–P2，final result: passed；驗收只寫本README、不新增design-qa.md。

## 2026-10-14 建商SAKURA KITCHEN品牌系列標題

- 依15:29:19右圖新增探索品牌系列40px／SemiBold（600）襯線中文、英文Creating the Ideal Kitchen for Every Family50px，Ideal Kitchen及for Every金色、其他英文黑色。中文置中獨立行，沿用前頁40／50px規則，不套同列基線補償；平板32／42px、手機28／30px。
- image-to-code及ponytail局部修改系列標題、眉標間距及區塊上距，保留EXPLORE OUR COLLECTIONS、原說明、完整六個系列（截圖僅顯示第一排三個）、原素材、hover與預約CTA。未覆寫CMS文字／資料、不新增素材或套件、不送表單或部署，文件只維護README。
- 既有回歸加入完整文案／金色範圍、40px600／50px與原完整清單／說明防護；只執行限定三項，不跑全站表單POST。
- 首次手機QA發現本頁浮動按鈕已隱藏，系列區卻仍保留86px右避讓，320px內容僅204px、眉標及說明過度擠壓（P2）；只移除系列區手機避讓，桌機與其他區塊維持原樣，重新擷取驗證。
- 修正後pnpm build／建置後typecheck、限定四項回歸、腳本語法及diff檢查通過，建置保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px：英文50／50／42／30／30px，中文40／40／32／28／28px600，置中且全頁／標題水平溢出0；手機右避讓0、320px內容恢復290px，其他尺寸仍86px。六個系列與六張圖片正常保留載入。
- 預約CTA在可見狀態下focus／Enter抵達/builders#appointment，聯繫區可見，未提交表單；前後唯讀view-pages-builders-sakura-kitchen200且內容一致，pageerror／console error為空。未部署或測表單送出。
- 設計QA：來源/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_miQRtu/截圖 2026-10-14 下午3.29.19.png（2014×714像素，右側約968px縮放示意）；證據/tmp/sakura-builder-series-SlnZeQ/series-1280-final.png及同名1024／900／390／320-final.png，各為同名CSS寬度×900、deviceScaleFactor=1。來源與最後截圖於相同比較輸入檢視，對照內容比例／指定字級，來源未附原始viewport，因此不宣稱逐像素零差異。
- QA五項：字體／字級／權重／換行、置中與間距、黑金配色、既有系列素材品質、完整指定文案及原說明皆通過。首次P2手機86px空白已修正，最後320px截圖再對照來源確認，眉標與內容完整；標題細節在完整圖可讀，不另加放大裁切。無未解P0–P2，final result: passed；文件僅本README，不新增design-qa.md。

## 2026-10-14 建商專區品牌區塊標題

- 依15:29:11右圖改置中EXPLORE OUR COLLECTIONS眉標／嚴選國內外優質品牌／Creating the Ideal Kitchen for Every Family，Ideal Kitchen及for Every金色、其他英文黑色。沿用中文40px600襯線／英文50px，中文獨立行不套同列補償；平板32／42px，手機28／30px。原中文副標改為灰色內文並接品牌說明，保留正常「風格」用字。
- 使用image-to-code及ponytail僅改本頁品牌標題／局部置中版面與區塊上距，保留四張卡、原圖片／Logo、Coming Soon、hover／focus與建商介紹連結。CMS舊欄位不覆寫，不新增素材、套件或文件；只维护README，不寫資料庫、送表單或部署。
- 既有回歸新增置中結構、眉標／英文完整文案及金色範圍、中文40px600獨立行／英文50px防護；限定執行此三項，不送全站表單。
- pnpm build／建置後typecheck、三項限定回歸、腳本語法及diff檢查通過，仍有原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px：英文50／50／42／30／30px、中文40／40／32／28／28px600，皆置中；全頁與標題水平溢出0。四張卡與五個圖片節點（含Logo）皆正常載入；鍵盤focus／Enter可進入/builders/sakura-kitchen，pageerror／console error為空，前後唯讀view-pages-builders-index皆200且內容一致。未測表單提交或部署。
- 設計QA：來源/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_BTGfnC/截圖 2026-10-14 下午3.29.11.png（2022×718像素，右側約968px寬的縮放示意）；實作證據/tmp/sakura-builder-brand-XytkcY/desktop-1280.png、desktop-1024.png、desktop-900.png、desktop-390.png、desktop-320.png，各為同名CSS寬度×900、deviceScaleFactor=1。以同一比較輸入開啟原图與實作，依內容區比例比較，來源未提供原始CSS viewport，故不宣稱逐像素零差異；保留四張卡未改的hover／focus及手機單欄。
- QA五項：字體／字級／權重／換行、置中版面／垂直間距、黑金／灰色說明、原品牌圖片與Logo品質、指定中英文內容均通過。標題細節在完整對照已可讀，不另加放大裁切；無待解P0–P2，final result: passed。只維護本README驗收紀錄，未新增design-qa.md。

## 2026-10-14 加盟品牌信賴／FAQ／資訊標題

- 依15:28:48右圖，品牌行銷案例標題改Explore Our／品牌信賴 Celebrity Stories／Of Inspired Living，中文及Stories／Living金色、其餘英文黑色。沿用18px眉標、中文40px600／英文50px與-.06em同列補償，平板32／42px，手機28／30px中文獨立行。
- 使用image-to-code與ponytail僅改本區標題／局部字級，CMS舊文字不覆寫，原段落／五張案例及無縫輪播／控制不改。不新增素材／套件／文件、不寫CMS或資料庫、不部署或送表單，只維護README。
- 同回合15:28:56截圖上方指最新加盟消息Franchise Updates、右圖卻是FAQ；使用者已確認改FAQ，採了解加盟資訊Clear Answers To Your Main Questions，中文40px600／英文50px、Answers／Main金色，手機中文分行。僅修改本頁FAQ，不動其他頁共用問答。
- 新增15:29:04最新消息區需求，依右圖改最新加盟資訊Latest Franchise News With SAKURA KITCHEN，中文與品牌金色。依明確規格採Explore Our16px、中文38px600／英文58px，標題用满原版心以容納長句；平板32／48px，手機28／34px與中文獨立行，不套前兩區40／50px。右圖未顯示Explore Our但規格明列，因此加入；原三則消息、連結與更多消息入口不改。
- 既有回歸加入三區完整文案／金色範圍與各自字級、消息眉標16px防護，限定執行，不跑全站表單POST。
- 畫面檢查修正手機FAQ隱藏br後To Your缺少空格，以及Explore Our眉標繼承大標負字距的擠壓；保留大標原字距，眉標獨立設0。
- 最終pnpm build／建置後typecheck、限定六項標題回歸、腳本語法與diff檢查通過，建置仍有原Tailwind sourcemap警告。獨立瀏覽器重驗1280／1024／900／390／320px：行銷及FAQ中文40／40／32／28／28px600、英文50／50／42／30／30px；消息中文38／38／32／28／28px600、英文58／58／48／34／34px，消息眉標16px。三區標題及全頁水平溢出皆0。
- 互動驗證：FAQ第二題Enter展開true、Space收合false；行銷輪播暫停及方向鍵Right可移動，保留五個案例；原三則消息href不改，第一則鍵盤Enter抵達/news/latest/2026-franchise-seminar。前後唯讀view-pages-franchising-intro皆200且內容一致，pageerror／console error為空。未提交表單／播放外部影片／部署。
- 設計驗收（僅此次三區標題）：來源為15:28:48／15:28:56／15:29:04右圖，依使用者確認以FAQ右圖及消息明列字級優先；以相同檢視輸入對照來源與最後桌機／手機截圖。字體／色彩／中文同列基線、標題換行／層級、間距／版心、既有素材／內容及響應式／操作五項通過，無未解P0–P2。證據在/tmp/sakura-franchise-three-titles-OrE9XC/marketing-1280.png、faq-1280.png、news-1280.png及同名1024／900／390／320.png；final result: passed。

## 2026-10-14 加盟專業品牌實力標題

- 依14:08:32截圖及使用者確認，英文採Success Starts Here、移除Franchise，不照右圖重複的Success Starts Starts。中文新增專業品牌實力40px600、英文50px，中文與Starts金色、Success／Here黑色，兩行英文；中文獨立置於上方、間距8px，不套同列基線位移。平板32／42px，手機28／30px。
- 使用image-to-code與ponytail僅改加盟優勢左側標題／局部字級，保留原黏性側欄、介紹說明、數字、六大優勢圖卡／資料、右側圖文與其他區塊。不新增素材／套件／文件、不写CMS或資料庫、不部署或送表單，只維護README。
- 既有回歸加入確認後中英文案／移除舊字與重複Starts、中文獨立行及50／40px600規格，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px，Starts金色、頁面及標題水平溢出0，原六張圖卡保持。桌機捲到第二組數字由01更新02且側欄position:sticky，前後唯讀view-pages-franchising-intro回應200且內容相同，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_0JeujB/截圖 2026-10-14 下午2.08.32.png`（1402×714比較畫布、右圖被裁到約353px；主要比較左側標題）與 `/tmp/sakura-franchise-strength-SOH09r/1280.png`、`320.png`（1280×900／320×900 CSS／1×）於同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、40px600中文／50px英文、中文獨立行與8px間距，英文Success／Starts Here分行；原黏性側欄／版心／說明及數字间距／圖卡與圖片圓角／雙欄保持，手機原單欄適配；中文與Starts金色、Success／Here黑色，原線稿背景與灰色數字保持；原工廠／市場趨勢等六張圖卡、徽標與功能圖示不替換；依使用者確認移除Franchise與重複Starts，文案為Success Starts Here，原說明／圖卡文字不變。有限進場完成後取證，標題清晰無需裁切，本次範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器／全頁其他互動，不部署；已排入加盟品牌實力本機預覽。

## 2026-10-14 加盟夥伴真實分享標題

- 依14:08:24上方明確註記，夥伴區改加盟夥伴真實分享 Here from Our Partners，不加入右圖多出的Franchise；中文及from Our／Partners金色、Here黑色，固定Partners起第二行。保留註記Here拼字，已提醒若意思是聽夥伴分享应为Hear，不擅自改字。中文40px600／英文50px、-.06em同列補償，平板32／42px，手機28／30px中文獨立行。
- 使用image-to-code與ponytail只修改夥伴區標題與局部字級，不新增未要求眉標／白色圖稿遮罩，不改原十字軌、影片／分享內容／圖片／CMS／Hero或其他區塊。不新增素材／套件／文件、不寫CMS或資料庫、不部署或送表單，只維護README。
- 既有回歸補上完整雙語／金色範圍與局部50／40px600補償規格，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px，頁面與標題水平溢出0；原兩則分享保留，播放入口aria-label保留且鍵盤可聚焦，不實播YouTube。前後唯讀view-pages-franchising-intro回應200且內容相同，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_v4PPoi/截圖 2026-10-14 下午2.08.24.png`（2020×710比較畫布、右側約968px頁面）與 `/tmp/sakura-partners-title-XHucps/1280.png`、`320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、40px600中文／50px英文、同列字形補償與手機中文獨立行；原十字軌／標題內距58px及70px頂距／到影片50px間距、右欄／影片16:9圓角保持，手機原版心保持；中文及from Our／Partners金色、Here黑色，原建築線稿背景不改、不加入右圖白色遮罩；原三位加盟夥伴影片封面／裁切、兩位經理照片及分享保留；以上方指定完整Here from Our Partners為準，不加右圖Franchise，已提醒英文聽取分享應為Hear而註記為Here，先照註記保留待確認。有限進場完成後取證，標題清楚無需裁切，本次視覺範圍無剩餘P0／P1／P2，final result: passed；Here文案用字屬已揭露待確認，不擅自修訂。未驗正式端／真實手機／其他瀏覽器／影片實播／其他全頁互動，不部署；已排入夥伴分享本機預覽。

## 2026-10-14 加盟 Hero 與建商字型再確認

- 依14:08:16註記「Font同建商專區Hero」重新核對。此項已於前輪套用，原碼及實際瀏覽器兩頁的font-family／font-size／font-weight／line-height／letter-spacing完全一致，因此不重複改元件或共用樣式；保留加盟文案、白金兩行、背景／大圖／CTA與布局。本回合僅補README驗證紀錄，不寫CMS或資料庫、不送表單／部署、不新增文件／套件。
- 使用image-to-code與ponytail核對既有實作，局部既有字型回歸通過；瀏覽器兩頁皆Noto Sans TC字族、700字重，1280／1024／900／390／320px的字級皆56.32／45.056／39.6／28.47／24px、行高90.112／72.0896／63.36／42.705／36px，字距normal，頁面與標題水平溢出0，pageerror／console error為空。本回合未改程式碼，不重跑建置／typecheck。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_tcexgK/截圖 2026-10-14 下午2.08.16.png`（2022×722比較畫布、內嵌頁面約968px）與 `/tmp/sakura-franchise-hero-font-BqIkIA/franchise-1280.png`、`builders-1280.png`、`franchise-320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗1024／900／390px計算樣式。五項檢查：兩頁相同黑體／字重／字級／行高／字距，手機相同縮放規則；各頁原布局／段落／CTA／圖片間距不改，不將建商版型套到加盟；保留加盟白色第一行／金色第二行、建商原反向白金配色；原建築／門面／建商廚房照片與裁切不改；加盟文案仍為為什麼選擇加盟／櫻花整體廚房?，建商文案不複製過來。首次取證在祖先ev進場前，重截明確is-visible及有限動畫完成狀態；曾用transform:none等待而完成狀態實為單位matrix，調整驗證等待方式後重截，未為測試改動畫。最新標題清晰無需裁切，本次字型範圍無剩餘P0／P1／P2，final result: passed。未重驗CTA導頁／表單／正式端／真實手機／其他瀏覽器，已排入加盟Hero本機預覽。

## 2026-10-14 關於我們專屬品牌識別標題

- 依14:08:08上方明確註記，識別圖區改Explore Our／專屬品牌識別／Signature Brand Identity，不採右圖不同的Signature Details That Reflect Our Identity。中文與Brand Identity金色、Signature黑色，固定Brand Identity起第二行；沿用18px眉標、中文40px600／英文50px及-.06em同列補償，平板32／42px，手機28／30px中文獨立行並避讓右側72px。
- 使用image-to-code與ponytail僅改識別圖區標題／字級，不改前一輪廚房紀事標題、CMS、說明、原圖／輪播／放大功能與其他區塊。移除本標題舊44px覆蓋，不新增素材／套件／文件、不寫CMS或資料庫、不部署或送表單，只維護README。
- 既有回歸加入完整雙語／英文金色範圍及50／40px600補償防護，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px、眉標18px，頁面及標題水平溢出0，原六張識別卡與說明保持。鍵盤Enter開啟品牌銘板大圖、下一張顯示靜音緩衝抽屜邊蓋，Escape關閉dialog；廚房紀事標題仍為前輪指定文案，前後唯讀data-aboutUs相同，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_nnk3dk/截圖 2026-10-14 下午2.08.08.png`（2038×726比較畫布、右側約968px頁面）與 `/tmp/sakura-identity-title-GnjrKu/1280.png`、`320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、18px眉標、40px600中文／50px英文及同列補償，手機中文獨立行；原十字軌47px起點距離／70px頂距／標題至說明及圖片間距、圖片圓角／四張可見桌機圖卡保持，手機標題避讓72px、輪播維持原比例；中文及Brand Identity金色、Signature黑色，原灰底／灰線不變；六張真實銘板／抽屜／沖印等原圖與裁切保留，不製造替代素材；以上方指定完整英文Signature Brand Identity為準，不混用右圖Signature Details That Reflect Our Identity，原說明與卡片名稱不改。有限進場完成後取證，標題清楚無需裁切，本次標題範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器或逐張全部燈箱，不部署；已排入本機專屬品牌識別預覽。

## 2026-10-14 關於我們廚房紀事標題

- 依14:08:00上方明確註記，關於我們年份展開區標題使用SAKURA KITCHEN Stories／櫻花整體廚房紀事，不採右圖不同的Story of Growth／品牌歷程。沿用右圖兩列排列，第一列Explore Our／櫻花整體廚房／SAKURA KITCHEN，第二列紀事／Stories，中文與Stories金色。18px眉標、中文40px600／英文50px與-.06em同列補償，平板32／42px、手機28／30px中文獨立行並避讓右側72px。
- 使用image-to-code與ponytail只修改本區標題／字級，移除本標題舊52／44px覆蓋，品牌識別標題及原斷點不改。CMS舊文字不覆寫，原年份／圖片／展開邏輯／其他區塊不變，不新增素材／套件／文件、不寫CMS或資料庫、不部署或送表單；只維護README。
- 既有回歸加入明確文案／金色範圍及50／40px600補償，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px、眉標18px，頁面與標題水平溢出0。1978／1992／2016／2020年份保持；鍵盤Enter選1992回報aria-expanded=true、1978=false，圖片alt更新1992且原描述正確，前後唯讀data-aboutUs一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_1dnZXD/截圖 2026-10-14 下午2.08.00.png`（2050×726比較畫布、右側約968px頁面；工具展示縮至2048×725）與 `/tmp/sakura-about-stories-zgddFq/1280.png`、`320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、18px眉標、40px600中文／50px英文，同列中文補償及手機獨立行；原十字軌47px距離／70px標題頂距／58px到年份區間距、圖片與年份雙欄／手機單欄保持，手機標題避讓右側72px；中文與Stories金色、英文品牌黑色，原灰底／分隔線不變；1978原公司建築圖／圓角／圖片比例及年份連動不改；以上方完整指定SAKURA KITCHEN Stories／櫻花整體廚房紀事為準，不混用右圖Story of Growth／品牌歷程，原年份文字與描述保持。有限進場完成後取證，標題清楚无需裁切，本次標題範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器／全頁其他輪播或所有年份逐題，不部署；已排入關於我們本機預覽。

## 2026-10-14 集團品牌館館別區標題

- 依14:07:46上方明確註記，館別區使用Memories are made／when we’re together，不採右圖不同的Inspiring Kitchen Designs In Our Gallery；合併註記we’ re為正常we’re。新增Explore Our18px與金色櫻花集團品牌館40px600、英文50px，when we’re together沿用原金色範圍，中文同列-.06em補償；平板32／42px，手機28／30px中文獨立行。
- 使用image-to-code與ponytail重用原字型／十字軌／館別按鍵／原圖片，只改標題及相關字級，CMS舊英文不覆寫，館別／地址／時間／預約入口與其他內容不改。不新增素材／套件／文件、不寫CMS或資料庫、不部署或送表單，只維護README。
- 標題的1023px向下適配與原1024px圖文版型斷點分開，避免改標題連帶改館別圖文排版。既有回歸新增指定雙語／金色範圍及50／40px600補償，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px，眉標18px，頁面及標題水平溢出0。台中／高雄／台北三館鍵盤Enter切換皆aria-selected=true且tabpanel館名正確，預約入口皆維持 `/builders#appointment`；前後唯讀view-pages-about-exhibition相同，pageerror／console error為空，未進行表單送出。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_h98SYB/截圖 2026-10-14 下午2.07.46.png`（2038×730比較畫布、右側约968px頁面）與 `/tmp/sakura-pavilion-title-FzU2be/1280.png`、`320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、18px眉標與40px600中文／50px英文、同列中文補償，手機中文獨立行；原十字軌47px起點距離／右欄／70px標題頂距／53px到館別間距、原按鍵／圖文欄／手機單欄保持；中文及when we’re together金色、英文前半黑色，灰線／白底／原選中金色保持；原台北館門面、其他館圖及圓角／裁切未改；依上方英文註記而非右圖另一句，修正we’ re排版空白、不混用兩份文字，原館名／地址／時間及預約入口保留。有限進場完成後取證，標題清楚無需裁切，本次範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器／預約表單送出，不部署；已排入集團品牌館本機預覽。

## 2026-10-14 品牌優勢 FAQ 雙語標題

- 依13:23:59右圖，品牌優勢FAQ透過既有title插槽改Explore Our／一站式專業服務 Clear Answers To／實現理想廚房 Your Main Questions，中文與Answers／Main金色。沿用18px眉標、中文40px600／英文50px與-.06em同列補償；平板32／42px，手機28／30px中文獨立行、取消位移，保留原72px安全距離。
- 使用image-to-code與ponytail只修改品牌優勢頁標題插槽與局部樣式，標題填滿原右欄避免舊732px上限造成額外換行；保留問答資料／展開邏輯／十字軌與服務流程頁FAQ。不新增套件／素材／文件，不寫CMS或資料庫、不部署或送表單；只維護README。
- 既有回歸加入雙語兩列、金色範圍及局部50／40px600與寬度防護，限定執行，不跑全站表單POST。
- 初次1280px視覺對稿發現To孤行，右欄原66.6666%寬度不足；局部改30%／70%用足原右側留白，左欄及標題起點不變，手機保持單欄，原字級／文案／右側安全距離不縮改，並補回歸。
- 最終建置、建置後typecheck、限定品牌FAQ回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px，眉標18px、Answers／Main金色；頁面及標題水平溢出0，原12題保持，Enter展開true、Space收合false。服務流程FAQ仍為Explore Our／服務指南／Clear Answers To Your Main Questions，品牌自訂中文DOM為0；前後唯讀data-brandAdvantage一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_gBp6so/截圖 2026-10-14 下午1.23.59.png`（2028×706比較畫布、右側約968px頁面）與 `/tmp/sakura-brand-faq-RQ5npH/1280.png`、`320.png`（1280×900／320×900 CSS／1×）於同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、18px眉標、40px600中文／50px英文及同列補償，較窄螢幕自然增行不截斷；十字軌／左欄／標題起點與60px問答間距保持，僅右欄用足剩餘留白，手機72px安全距離不變；中文與Answers／Main金色、其餘英文黑色，原灰底與灰線保持；沿用原加減符號與固定服務列，不新增圖像；指定兩列雙語文案，原12題／答案／群組與服務流程頁不變。初次To孤行P2調整右欄比例後重截，同源重新比對確認兩行；等待有限進場完成再取證，標題清楚無需裁切，本次範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器或所有問答逐題操作，不部署，已排入品牌FAQ本機預覽。

## 2026-10-14 全台廚具通路專業服務標題

- 依13:23:49右圖，BrandStoreSection加入Explore Our18px及金色全台廚具通路／專業服務，英文完整Shaping Kitchens Across Taiwan，只有Kitchens／Taiwan金色。兩列依右圖配置中文與英文，沿用中文40px600／英文50px、-.06em同列補償；平板32／42px，手機28／30px中文獨立行、移除位移與保留原72px安全距離。
- 使用image-to-code與ponytail重用字型／十字軌／原圖，只改標題，原副標題、說明、門市圖片、資料與其他區塊不變。不新增素材／套件／文件，不寫CMS／資料庫、不部署或送表單，只維護README。
- 既有回歸補上兩列指定文案／金色範圍及50／40px600補償防護，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px、眉標18px，頁面與標題水平溢出0；Kitchens／Taiwan金色，原副標題、三民店／河南店圖源不變且載入正常，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_SNdsDo/截圖 2026-10-14 下午1.23.49.png`（2026×710比較畫布、右側約968px頁面）與 `/tmp/sakura-store-title-nMt0DN/1280.png`、`320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、18px眉標、40px600中文與50px英文，同列基線補償及手機中文獨立行；原十字軌／右欄／版心、標題64px頂距及副標題原35px間距保留，沒有因比較圖額外留白重排段落，手機72px安全距離維持；中文與Kitchens／Taiwan金色，其他英文黑色、原白底灰線不變；保留原三民店／河南店圖片與圓角，來源未截到照片不因此刪除；指定完整兩列雙語文字，原副標題與段落不改。有限進場完成後取證，標題清楚无需裁切，本次標題範圍無剩餘P0／P1／P2，final result: passed。此區沒有新增互動；未驗正式端／真實手機／其他瀏覽器及全頁其他互動，不部署、不送表單，已排入本機標題預覽。

## 2026-10-14 櫻花品牌優勢雙語標題

- 依13:23:41右圖，BrandBenefits標題新增金色櫻花品牌優勢40px600，英文沿用完整Discover What Makes SAKURA KITCHEN Different、改50px，只有SAKURA KITCHEN金色。中文上方獨立分行、與英文間距16px，不套同列基線位移；平板32／42px，手機28／30px與原72px安全距離保留。
- 使用image-to-code與ponytail重用原字型／素材／樣式，僅改標題，保留原段落、三卡／動畫／資料、其他區塊。不新增素材／套件／文件，不寫CMS或資料庫、不送表單或部署；只維護README。
- 既有回歸補上完整雙語文案、中文獨立分行及50／40px600規格，局部執行，不跑全站表單POST。
- 首次視覺對稿發現50px自然換行把Different單独放第二行，與右圖不同；已固定KITCHEN起第二行，保留完整文案及手機向下適配，並補回歸。
- 最終建置、建置後typecheck、限定雙語標題及原循環／減少動態靜態回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。独立瀏覽器1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px；頁面與標題水平溢出0，三張原圖正常載入，原benefit-first／second／third循環動畫保留。減少動態偏好下三卡animation:none、opacity:1，前後唯讀data-brandAdvantage相同，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_FcGJWq/截圖 2026-10-14 下午1.23.41.png`（2042×726比較畫布、右側約968px頁面）與 `/tmp/sakura-benefits-title-RjrALe/1280.png`、`320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、中文40px600／英文50px，中文上方獨立分行不套同列位移，英文固定KITCHEN起行；原900px標題版心／置中、段落與卡片間距／圓角／原手機72px安全距離保留，僅中文與英文增加16px間距；中文及SAKURA KITCHEN金色，其餘黑色、原灰底及白卡不變；三張原設計／服務／工廠實景圖及裁切／圖片圓角／卡片內容保持；完整指定中文與英文、原說明不變，不加入未要求眉標。初次Different孤行P2加KITCHEN換行後重截、最新圖再同源比對；等待標題有限進場與三卡不透明階段完成後取證，標題清楚無需裁切，本次標題範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器或全頁其他互動，不部署；已排入品牌優勢本機預覽。

## 2026-10-14 品牌優勢家庭區英文標題

- 依13:23:26上方明確註記，家庭區標題使用Creating the Ideal Kitchen for Every Family，不採右圖不同的Creating Kitchens for Every Family。修正會把指定文案改回舊複數版本的相容分支，只校正既有舊標題，其他CMS自訂標題仍原樣顯示；沿用已有text-transform:none以保留the／for小寫。原40px字級與響應式、中文、段落、四張家庭圖片、其他區塊不變。
- 使用image-to-code與ponytail做最小局部調整，不覆寫CMS或資料庫、不新增素材／套件／文件、不部署或送表單。只維護README。
- 更新既有家庭標題回歸，保護單數Kitchen、the／for小寫與後台自訂文案不被替換；局部執行，不跑全站表單POST。
- 最終建置、建置後typecheck、局部相容分支／自訂文案回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。瀏覽器1280／900／390／320px與實際SSR皆顯示指定文字，英文40／36／30／30px、text-transform:none，頁面及標題水平溢出0，五張原家庭圖片載入正常。原拖曳輪播可移動，前後唯讀view-pages-about-advantage及data-brandAdvantage一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_FVX2Rx/截圖 2026-10-14 下午1.23.26.png`（2024×718比較畫布、右側約968px頁面）與 `/tmp/sakura-family-title-bz6QYm/1280.png`、`320.png`（1280×900／320×900 CSS／1×）同一比較輸入，另驗900／390px。五項檢查：原Cal Sans／CJK字型、字級／字重／行高不改，小寫the／for及單數Kitchen正確；原版心／中文與說明間距／圖卡圓角／四欄保持，手機安全距離與自然換行保留；英文黑色／白底與原色彩不變；保留五張家庭原圖及自動轮播、桌機可見四張，與截圖圖片順序差異是輪播時點，沒有替換素材；以上方明確註記為準，不混用右圖Creating Kitchens for Every Family，原中文及段落不變。有限进場完成後比對，標題清楚不需裁切；本次文字範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器或全頁其他互動，不部署，已排入家庭區本機預覽。

## 2026-10-14 門市案例內頁相關案例標題

- 依13:23:13右圖，`/gallery/[slug]`相關案例標題改Explore Our／精選廚房案例／Real Spaces That Inspire Living，中文及Spaces That金色，其餘黑色。沿用同列中文40px600／英文50px、-.06em基線補償及既有18px眉標；平板32／42px，手機28／30px分行並避讓右側72px。保留原標題到卡片間距，不改门市筛选列表页。
- 使用image-to-code與ponytail重用字型／十字軌／卡片／圖片，僅調整共用案例內頁標題，原CMS舊文案不覆寫，案例資料、輪播／連結／SEO／錯誤提示不改。不新增素材／套件／文件、不寫資料庫、不部署或送表單。
- 既有回歸新增指定文案／金色範圍、50／40px600同列補償與原Embla／資料來源防護；僅執行相關靜態斷言，不執行全站表單POST。
- 首次桌機對稿發現That因自然換行留在第一行，與右圖分行不同；已在That前加換行並同步回歸，手機仍可依行寬自然延伸分行，其他卡片不改。
- 最終建置、建置後typecheck、限定標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器case10驗1280／1024／900／390／320px，中文40／40／32／28／28px600、英文50／50／42／30／30px，眉標18px；頁面／標題水平溢出0、原三張案例圖片正常載入。手機拖曳輪播track確實移動，相關卡片鍵盤Enter抵達case56，新頁亦顯示同標題；前後唯讀data-storeCases相同，pageerror／console error為空。未觸發LINE／預約表單。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_NV9e5s/截圖 2026-10-14 下午1.23.13.png`（2002×714註記畫布、右側約968px頁面）與 `/tmp/sakura-case-related-rZ0EHf/1280.png`（1280×900 CSS／1×）、`320.png`於同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、18px眉標／40px600中文與50px英文、同列視覺等高補償；原十字軌／版心／卡片間距／圓角／三欄保持，手機文字72px避讓及自然分行；中文與Spaces／That金色、其他英文黑色，原灰底／灰線不變；同三張實景案例圖片／裁切／中卡featured樣式與圖示保留；指定完整新文案、不再顯示Blog與Articles，原卡片內容及連結不改。初次That分行P2以換行修正，最新桌機與手機截圖重新同源比對，等待有限進場完成，標題清楚不需裁切；本次標題範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器／所有案例頁互動或LINE，不部署，已排入本機相關案例預覽。

## 2026-10-14 服務流程 FAQ 標題

- 依13:22:56截圖，僅服務流程頁FAQ改「服務指南 Clear Answers To Your Main Questions」，中文、Answers及Main金色，其餘英文黑色。依上方規格加入Explore Our 16px（右側示意未顯示），中文40px600／英文50px，同列中文沿用-.06em基線補償；平板32／42px，手機28／30px並分行。
- 使用image-to-code與ponytail，共用FAQ只加入具原標題fallback的title插槽，由服務流程頁填入，不改品牌優勢頁、問題／答案／展開邏輯、十字軌與原安全距離。既有回歸增加局部插槽／fallback及文案／字級防護，僅執行本次靜態斷言。不新增套件／素材／文件，不寫CMS或資料庫、不送表單、不部署。
- 首次桌機檢查發現插槽文字不受共用元件scoped span色彩作用，Answers／Main仍黑色；已用本頁專用accent規則修正並補回歸防護，避免影響其他FAQ。
- 最終建置、建置後typecheck、限定FAQ靜態回歸、腳本語法及diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／1024／900／390／320px，眉標16px，中文40／40／32／28／28px600、英文50／50／42／30／30px；頁面與標題水平溢出皆0，15題保留，Enter展開aria-expanded=true、Space收合false。品牌優勢頁原Quick And Clear Answers To Your Key Questions與無自訂中文確認保留，前後唯讀data-service相同，pageerror為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_e3v1H4/截圖 2026-10-14 下午1.22.56.png` 與 `/tmp/sakura-service-faq-TT5wm0/1280.png`、`390.png`同一比較輸入（1280×900／390×900 CSS，1×），另驗1024／900／320px。五項檢查：原Cal Sans／Noto Serif TC、16／40px600／50px及同列中文基線補償，手機中文獨立分行；原十字軌、版心／問答間距、灰線與手機72px安全距離不改；中文及Answers／Main金色，其餘英文黑色，初次插槽金色問題已修正重截；沿用原加減符號／固定服務列，無新增圖片；指定文案／原15題與答案保留，Explore Our依上方規格加入而非完全複製右圖缺漏。標題及FAQ進場完成後截圖，範圍內無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器及全頁其他互動，不部署／送表單；已排入本機FAQ預覽。

## 2026-10-14 服務流程介紹標題

- 依12:32:34註記，`/service-process`介紹區加入Explore Our 16px眉標，原CMS中文從設計到實現，打造理想廚房改金色40px600，英文50px／Dream Kitchen金色，其餘黑色、小寫to保留。原中英分行不套用同列位移，中文均衡換行；平板32／42px、手機28／30px及原72px安全距離保留。右圖沒有明顯顯示Explore Our但上方規格明確列出，因此依註記加入；流程圖上方重複截斷英文視為示意稿殘留，不加入UI。
- 使用image-to-code與ponytail重用既有CMS文案／字型／十字軌／流程圖示，僅改介紹標題，保留原段落、服務流程／互動連結、影片及下方FAQ，不新增素材／套件／文件、不部署／送表單／寫入CMS或資料庫，只維護README。
- 既有回歸新增Explore Our16px、中文金色40px600／英文50px、to大小寫与CMS欄位保留斷言，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定服務介紹回歸、腳本語法与diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／1024／900／390／320px，眉標皆16px，中文40／40／32／28／28px600、英文50／50／42／30／30px，水平溢出0；桌機／平板軌距47px，手機原72px文字安全距離保留。八步流程仍在，可展開步驟鍵盤Enter回報aria-expanded=true，再次Enter=false；前後唯讀view-pages-service-process及data-service一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_s2Bwx5/截圖 2026-10-14 中午12.32.34.png`（2032×742註記畫布、右側約968px頁面）與 `/tmp/sakura-process-title-dli7fM/1280.png`（1280×900 CSS／1×）、`390.png`於同一比較輸入，另測1024／900／320px。五項檢查：原Cal Sans／Noto Serif TC、16px眉標／40px600中文／50px英文與小寫to正確，手機中文均衡分行；原30／70布局／47px軌距／64px介紹頂距、段落及八步流程保留，只為眉標與中文加入8px層級間距；中文及Dream Kitchen金色、其他英文黑色，原灰線／灰底／流程金線一致；原八步圖示／箭頭／圖片與影片封面不替换；中英文及說明沿用CMS，依明確註記加入Explore Our，不複製流程上方截斷英文。首次流程圖仍在有限進場狀態，後續移除測試焦點偏移、等待有限動畫完成再重截，最終標題及流程圖示清晰無需裁切；本次範圍無剩餘P0／P1／P2，final result: passed。未驗影片播放／下方全FAQ／正式端／真實手機／其他瀏覽器，不部署／送表單；保留本機服務流程預覽。

## 2026-10-14 型錄頁選購問答雙語標題

- 依12:32:13截圖，僅 `/catalogues/catalog` 問答區新增金色廚房選購指南，英文改Clear Answers To Your Questions，Answers／Questions金色，其餘黑色。原CMS舊英文不覆寫；分類／問題／答案／右側圖卡／型錄列表與下載、其他頁FAQ不改。沿用image-to-code與ponytail及既有字型／共用十字軌，不新增素材／套件／文件，不部署／送表單／寫CMS或資料庫，只維護README。
- 桌機中文40px600／英文50px，同列baseline上移0.06em補償，保留原64px頂距／732px上限／47px共用軌距；平板32／42px，手機中文28px獨立行／英文30px，不套用獨立行位移。字形與配色沿用本站既有慣例，沒有新增Explore Our或改其他FAQ。
- 既有回歸增加指定中文／英文／金色範圍及50／40px600／baseline斷言，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定問答標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／900／390／320px，中文40／32／28／28px600、英文50／42／30／30px，水平溢出0；桌機／平板軌距47px，手機保留原93px右側避讓。鍵盤Enter第二題aria-expanded=true、第一題false；切換瓦斯爐分類aria-pressed=true且回到首題，原圖卡與問題資料正常。前後唯讀data-productCatalogues及view-pages-catalogues-catalog回應一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_zosipc/截圖 2026-10-14 中午12.32.13.png`（約2036×740註記畫布、右側約968px頁面）與 `/tmp/sakura-care-title-Ii0dfT/1280.png`（1280×900 CSS／1×）、`390.png`於同一比較輸入，另測900／320px。五項檢查：原Cal Sans／Noto Serif TC，中文40px600／英文50px、baseline上移0.06em，同列中英視覺等高，手機中文獨立行；原分欄／64px頂距／732px上限／47px十字距／分類按鍵／FAQ與圖卡布局保留，手機原避讓不變；中文及Answers／Questions金色，其他英文黑色，原灰底淺灰線不變；原保養圖解、箭頭、分類與型錄素材／比例／圓角保留；指定新文案完整，沒有Explore Our或來源沒有的句點，不動CMS問題／答案。等待header有限進場完成後截圖，標題全景清楚無需裁切；本次範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器／完整圖片新分頁與實際型錄下載，不部署／送表單；保留本機選購問答預覽。

## 2026-10-14 廚電列表型錄介紹雙語標題

- 依12:31:56截圖，ProductListPage型錄介紹新增金色廚房商品型錄，英文改兩行Kitchen Product／Catalogues（複數），Kitchen黑色、Product與Catalogues金色。沿用本輪獨立中文40px600／英文50px、平板32／42px、手機28／30px及8px層級間距，不套用同列基線位移。這是共用型錄區，各品牌／分類列表同步，原眉標動態品牌保留。
- 使用image-to-code與ponytail，僅改標題與相關字級／分行，不改型錄資料／封面／名稱／下載入口／保養說明／卡片／原CTA動效，不更換圖中舊型錄封面或名称（此次截图未要求）。不新增套件／素材／文件、不部署／送表單／寫CMS或資料庫，僅維護README。
- 既有回歸新增中文／複數英文／分行、50／40px600及原CTA入口斷言，限定執行此區与同頁標題檢查，不跑全站表單POST。
- 建置、建置後typecheck、限定型錄／同頁列表標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／900／390／320px，中文40／32／28／28px600、英文50／42／30／30px，水平溢出0；兩张原型錄封面正常載入、名稱／順序保留，前後唯讀data-productCatalogues一致，pageerror／console error為空。CTA鍵盤Enter正常抵達 `/catalogues/catalog`；只驗入口，不觸發實際PDF下載。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_blZHsc/截圖 2026-10-14 中午12.31.56.png`（2014×696註記畫布、右側約968px頁面）與 `/tmp/sakura-catalogue-title-jONJk8/1280.png`（1280×900 CSS／1×）、`390.png`於同一比較輸入，另驗900／320px。五項檢查：原Cal Sans／Noto Serif TC、中文40px600／英文50px、獨立中文与兩行英文；原左右欄比例／照片版心／圓角／留白／CTA尺寸保持，僅指定中英8px層級間距；中文、Product与Catalogues金色／Kitchen黑色，原白底灰說明維持；保留當前CMS型錄封面（配備白色新版，不回退截圖的深灰舊版）、原圖示／裁切；複數Catalogues與中文符合右圖，CTA／說明／已確認過的配備型錄名稱不回退。原CTA樣式保持一般白底与hover品牌金，不因來源黑底狀態另改全站按鈕；此次僅標題調整。等待介紹及卡片有限進場完成後取證，標題清楚不需裁切；本次標題範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器／實際PDF下載，不部署，保留本機型錄介紹預覽。

## 2026-10-14 SAKURA近吸系列英文標題

- 依11:07:16截圖，沿用上方註記Smart Appliances for Better Living（非右圖Smart Kitchen Living），只把近吸分類83205納入上一輪英文標題條件。兩個既有入口 `/products/sakura/range-hood/near-suction` 與 `/products/sakura/category/83205` 共用變更，中文仍取CMS近吸系列，不追加或重複系列；其他品牌／分類、原9商品、圖片／名稱／價格／連結／分頁／錯誤顯示與資料不改，分類搜尋保持先前移除。
- 使用image-to-code與ponytail，只改一個共用條件及既有回歸，只維護README，不新增素材／套件／文件，不部署／送表單／寫CMS或資料庫。
- 建置、建置後typecheck、限定列表標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／900／390／320px：新英文與近吸系列皆正確、水平溢出0、原9商品／1頁及搜尋DOM0保留。兩個入口皆顯示新英文，前後唯讀商品API回應一致，pageerror／console error為空。首次Enter在路由剛載入的DOM過渡期未導頁；等頁面穩定並確認焦點href後重驗，正常抵達 `/products/sakura/item/80794?category=83205&page=1`，未改導頁邏輯。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_UEKhx3/截圖 2026-10-14 上午11.07.16.png`（2020×744註記畫布、右側約968px頁面）與 `/tmp/sakura-near-title-LMZjUs/1280.png`（1280×900 CSS／1×）、`390.png`於同一比較輸入，另測900／320px。五項檢查：原Cal Sans／中文宋體、英文40／36／30px及中文30px、字重／上下層級不變，小寫for保留；原版心／留白／四欄及手機單欄／卡片比例／圓角不改；原英文金色、中文黑色與灰底保持；同一九項商品圖／裁切／型號／價格／箭頭保留；以上方明確英文註記為準，不複製右圖Smart Kitchen Living或舊搜尋列，中文不重複系列。等待標題有限進場完成再截圖，標題清楚無需裁切；本次範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器或所有商品詳情，不部署；保留本機近吸系列預覽。

## 2026-10-14 SAKURA除油煙機列表標題

- 依11:07:08截圖，SAKURA除油煙機分類6英文改為上方註記指定Smart Appliances for Better Living，不混用右图Smart Kitchen Living；中文仍取原分類heading，只在該分類追加系列（已有系列不重複），顯示除油煙機系列。原分類9已有相同英文不撤回，其他品牌／分類標題不改；不改字級／版心／搜尋／分類篩選／分頁／商品卡／SEO／錯誤顯示及資料。截圖仍有舊搜尋列，但沿用先前已確認的分類頁隱藏搜尋，不重加。
- 使用image-to-code與ponytail做兩行局部調整，重用原素材與樣式，不新增套件／文件，不部署、送表單或改CMS／資料庫；文件只維護README。
- 英文標題局部關閉共用capitalize，保留註記小寫for，其他原品牌文字大小寫不變。
- 既有回歸加入分類6／9英文範圍、系列不重複、for大小寫與原分類搜尋隱藏防護，限定執行，不跑全站表單POST。
- 建置、建置後typecheck、限定列表標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／900／390／320px，水平溢出0，沿用原英文40／36／30／30px、中文30px與金黑配色；原40項／4頁、8分類保留，分類搜尋DOM仍0。鍵盤第2頁回報40項／第2頁，近吸子分類抵達原 `/products/sakura/category/83205`，回報9項／第1頁。早期測試誤用另一路徑及頁碼文字而非aria-label造成等待逾時，改用實際href及「第2頁」後通過，未因此修改路由或分頁；最後pageerror為空，視覺驗證console error為空。商品API／CMS寫入、表單送出皆未執行。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_kpZUuq/截圖 2026-10-14 上午11.07.08.png`（2040×810註記畫布、右側約968px頁面）與 `/tmp/sakura-list-title-kZoUWP/1280.png`（1280×900 CSS／1×）、`390.png`於同一比較輸入，另驗900／320px。五項檢查：原Cal Sans／中文宋體、字重／字級與上下層級不改，保留小寫for；原版心／標題到分類間距／按鍵／分頁／四欄卡片與手機單欄保留；英文金色／中文黑色、灰底及框線不變；原商品圖／型號／價格／圖片比例與圓角未改；以上方明確英文註記為準，不用右圖Smart Kitchen Living，中文顯示除油煙機系列。來源含先前已移除的分類搜尋，本輪不重加，屬已说明差異。等待有限進場完成後取證，標題清晰不需裁切；本次範圍無剩餘P0／P1／P2，final result: passed。未驗正式端／真實手機／其他瀏覽器或所有商品詳情，不部署；保留本機除油煙機列表預覽。

## 2026-10-14 廚電品牌介紹雙語標題

- 依11:06:38截圖，ProductBrandPage三品牌共用介紹區統一Kitchen Appliances眉標與金色「廚房產品」，英文三行Elevate Your／Kitchen with／原動態品牌名稱，只有Kitchen with金色，品牌名稱黑色。截圖註記寫SAKURA但示意為SVAGO，保留info.name避免錯置品牌，不把SVAGO或TEKA硬改SAKURA，不將紅色註記加入UI。桌機中文40px600／英文50px，平板32／42px、手機28／30px；上下排列不套用同列位移。只在手機文字欄加原本站72px安全距離，圖片保持滿寬。
- 使用image-to-code與ponytail重用字型／眉標／圖片／原CSS，不新增素材／套件／文件；保留品牌說明／圖片／三品牌切換／分類／產品資料／SEO／错误显示与重試，不寫入CMS／資料庫、不送表單／部署；文件只維護README。
- 既有回歸加入三品牌共用文案、動態品牌黑色／英文金色範圍、50／40px600與手機72px避讓斷言，限定執行標題檢查，不跑全站表單POST。
- 初次對稿發現共用h2 capitalize會把with變成With（P2），只在本標題關閉自動大寫，保留來源with；重新截圖確認，不改品牌名稱本身。
- 回歸同步保護text-transform:none，避免再被全站大寫慣例覆蓋。
- 最終建置、建置後typecheck、限定品牌標題回歸、脚本語法及diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器SVAGO驗1280／1024／900／390／320px，桌機40px600／50px、平板32／42px、手機28／30px，水平溢出0；原圖片正常載入、8個分類仍在。鍵盤切換SAKURA及TEKA抵達原路由，等待新頁DOM及進場完成後標題／aria-current與品牌一致（只等URL變動會讀到上一頁過渡DOM，未因此改路由邏輯）。前後唯讀data-productBrands相同，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_kiKr2f/截圖 2026-10-14 上午11.06.38.png`（2034×742註記畫布、右側約968px頁面）與 `/tmp/sakura-brand-title-H9p84D/1280.png`（1280×900 CSS／1×）、`320.png`於同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、中文40px600／英文50px，三行英文及小寫with符合來源；原左右欄比例／間距／照片版心與圓角／三品牌按鍵保留，手機文字避讓72px但照片仍滿寬；中文與Kitchen with金色、英文首行及品牌黑色，英文眉標在原膠囊而非新增紅色註記；同一SVAGO酒櫃照片／比例／裁切／原圖示保留；保留動態品牌、描述與分類資料，不因上方SAKURA註記覆寫SVAGO。初次With大寫P2已修正重截確認，進場完成後比對；本次標題範圍無剩餘P0／P1／P2，final result: passed，標題全景清楚不需裁切。未驗正式端／真實手機／其他瀏覽器或所有分類詳情，不改資料／部署，保留SAKURA本機介紹預覽。

## 2026-10-14 裝修指南文章頁延伸文章標題

- 依09:23:59截圖，KnowledgeRelatedCarousel的home07呈現新增金色「廚房知識與靈感」，英文三行Take A Look／At Our Latest／Articles，第二行金色，移除Blog／&／驚嘆號及原英文說明段落；CTA改「更多廚房知識」，仍到 `/knowledge`。中文40px600／英文50px，平板32／42px、手機28／30px；上下排列不套用同列基線補償。保留原眉標、三欄／两欄／手機單欄、CTA尺寸與動效／卡片／圖片／分類／摘要／文章連結。
- 使用image-to-code與ponytail，只改home07文案及相關字級，沿用既有字型／素材，不新增套件／文件。home07實際為兩張靜態推薦卡，另一路cards才是Embla輪播；不將兩者誤認或重寫。所有指南文章頁共用此次變更，不影響cards版本；不寫入CMS／資料庫、不送表單或部署，僅維護README。
- 既有回歸補上指定中文／三行英文／中文CTA、移除舊說明、原入口及40／50px斷言；限定執行此區檢查，不跑全站表單POST。
- 初次320px視覺比較發現眉標最小內容寬度把手機1fr撐大，介紹／卡片被父層裁切（P2）。只把home07手機單欄改為minmax(0,1fr)，讓眉標／長中文自然換行、卡片依原版心縮放，不縮字、不截斷文字；修正後重截驗收。
- 回歸補上手機欄位minmax防護，避免後續恢復會裁切的隱含最小寬度。
- 320px中文需要兩行，加入原生text-wrap:balance避免最後單獨一個「感」字；不改文案或指定字級，桌機單行不受影響。
- 最終建置、建置後typecheck、限定延伸標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／1024／900／390／320px，桌機中文40px600／英文50px，平板32／42px、手機28／30px，水平溢出0。320px介紹實寬182px、內部溢出0，眉標與中文自然兩行，原兩卡圖片正常載入、連結／順序不變；CTA鍵盤Enter回到 `/knowledge`。前後唯讀data-kitchenGuides一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_BpA7Ms/截圖 2026-10-14 上午9.23.59.png`（2016×806註記畫布、右側約968px頁面）與 `/tmp/sakura-guide-related-UpiCkx/1280.png`（1280×900 CSS／1×）、`320.png`於同一比較輸入，另驗1024／900／390px。五項檢查：原Cal Sans／Noto Serif TC、上方中文40px600／下方英文50px，英文依右圖三行，手機中文均衡兩行；原三欄／兩欄／單欄、版心／卡片／圖框／CTA圓角尺寸與間距保留，僅修正手機min-content裁切；中文及At Our Latest金色、其餘英文黑色，原淡菱格背景不變；兩張原實景圖片、裁切／圓角／分類badge及箭頭保留；依右圖移除英文說明与Blog／&／驚嘆號，CTA以註記改中文，卡片內容不改。初次320px裁切P2修正後重截，中文末字孤行以balance修正，等待介紹及兩卡有限進場／上方內容穩定後再取證；本次範圍無剩餘P0／P1／P2，final result: passed，標題清晰無需另裁切。未重排原桌機固定服務列與卡片、未驗cards輪播版本／正式端／真實手機／其他瀏覽器／全文互動，不部署／送表單，保留本機文章預覽。

## 2026-10-14 廚房裝修指南列表標題

- 依09:23:49截圖，只改 `/knowledge` 列表區標題：Explore Our／廚房裝修指南／Take A Look At Our Latest Articles.，移除Blog &，中文與Our金色、其餘黑色。桌機18／40／50px、中文600／baseline上移0.06em，平板18／32／42px、手機18／28／30px及中文後分行。保留原30／70分欄、760px上限、64px頂距、共用47px十字間距與手機93px右側避讓，不套用舊45px桌機邊界覆寫。
- 使用image-to-code與ponytail重用原字型／元件／素材，只維護README；不新增套件／文件、不部署／送出表單／寫入CMS或資料庫。前端固定新標題，原CMS欄位及資料不覆寫；Hero中文／英文原CMS欄位、可見性／SEO、文章資料／图片／日期／分類／連結／列表／文章頁相關輪播都不改。
- 既有回歸新增指南完整中英文案、50／40px600／基線補償及原手機93px安全距離斷言，限定執行此區檢查，不跑全站表單POST。
- 建置、建置後typecheck、限定指南標題回歸、腳本語法及diff檢查通過；保留原Tailwind sourcemap警告。已核准獨立瀏覽器驗1280／1024／900／390／320px，字級18／40／50、18／40／50、18／32／42、18／28／30、18／28／30px，中文600、水平溢出0；桌機及平板軌距47px、手機沿用原避讓與隱藏軌線。三篇文章／分類／日期／順序／圖片及連結保留，可見圖片載入正常；鍵盤Enter第一篇抵達 `/knowledge/design/systemcabinet`。前後唯讀data-kitchenGuides與view-pages-knowledge-index回應一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_O4drt7/截圖 2026-10-14 上午9.23.49.png`（2042×726註記畫布、右側約968px頁面）與 `/tmp/sakura-guide-heading-zKkiCX/1280.png`（1280×900 CSS／1×）、`390.png`於同一比較輸入，另驗1024／900／320px。五項檢查：沿用Cal Sans／Noto Serif TC、18／40／50px、中文600與baseline／0.06em補償，分行與大小寫符合右圖；原30／70分欄／47px十字間距／64px頂距／60px標題底距及文章布局保留，手機原右側避讓使標題完整；金色中文／Our、黑色其餘英文與灰底／淺灰線保持；原實景封面／裁切／圓角及圖示保留，沒有新增素材；英文依右圖刪除Blog &且保留句點，文章資料与Hero原CMS文案不改。等待is-visible及有限進場完成後截圖，標題清楚可辨不需另裁切；本次標題範圍無剩餘P0／P1／P2，final result: passed。未重設原桌機文章與固定服務列布局、未驗正式端／真實手機／其他瀏覽器或全文互動；不送出表單／部署，保留本機指南列表預覽。

## 2026-10-14 品牌系列推薦案例標題

- 依09:23:41截圖，KitchenSeriesPage推薦案例標題新增Explore Our／風格廚房實例，英文改為Take A Look At Our Latest Articles.，刪除Blog &，中文與Look At Our金色、其他文字黑色。沿用共用同列18／40／50px、中文600／baseline上移0.06em字形補償、手機分行28／30px與平板32／42px；保留30／70分欄、47px十字間距、原64px頂距／60px底距。只改共用標題，不動案例CMS／圖片／文案／連結／首尾複製／輪播／鍵盤／自動播放／暫停／空狀態。
- 使用image-to-code與ponytail重用既有字型、雙語樣式與素材；不新增套件／文件，不送出表單／部署／寫入CMS或資料庫，QA只維護README。
- 既有回歸增加案例指定文案／50px桌機／42px平板斷言，限定執行本區及前兩區標題檢查，不跑含表單POST的全站流程。
- 初次視覺比較發現手機新標題被原固定服務列遮住（本次P2），只在手機標題增加72px右側安全距離；桌機文字欄上限750px讓Our依示意換到第二行，其他欄位／卡片不改。修正後重新截圖驗收，不把原卡片服務列遮擋納入本輪重排。
- 回歸補上手機72px避讓防護，避免後續又移除標題安全距離。
- 最終建置、建置後typecheck、限定案例／色卡／廚電標題回歸、腳本語法與diff檢查通過，保留原Tailwind sourcemap警告。獨立瀏覽器驗1280／1024／900／390／320px，字級18／40／50、18／40／50、18／32／42、18／28／30、18／28／30px，中文600、各寬水平溢出0；桌機及平板十字間距47px，手機軌線隱藏。手機標題內容右緣303／233px，與固定服務列有15px安全距離。原輪播ArrowRight／ArrowLeft有位置變化，圖片載入正常；最初未載入的離屏複製圖為原lazy loading，進入視口後正常，不修改載入策略。前後唯讀CMS一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_7dh2EJ/截圖 2026-10-14 上午9.23.41.png`（2016×736註記畫布、右側約968px頁面）與 `/tmp/sakura-cases-heading-vvTkY5/1280-final.png`（1280×900 CSS／1×）、`390-final.png`於同一比較輸入，另測1024／900／320px。五項檢查：原Cal Sans／Noto Serif TC、18／40／50px、中文600／baseline上移0.06em，中文與英文視覺等高；原30／70分欄及47px軌距保留，750px文字上限讓Our換到第二行，僅手機標題加72px避讓；中文與Look At Our金色、其餘黑色及原灰線一致；原案例圖／比例／圓角／中央變形卡片保留，輪播測試後選取位置與來源不同，不照抄圖片次序；完整指定文案保留句點且移除Blog &，CMS案例內容不改。初次手機標題遮擋P2已修正並重截對稿；標題範圍無剩餘P0／P1／P2，final result: passed，標題全景清楚不需另裁切。卡片被手機服務列遮住屬既有標題外问题，未重排；未驗正式端／真實手機／外部案例文章，不送出表單／部署，保留本機预覽。

## 2026-10-14 品牌系列廚電推薦標題

- 依09:23:31截圖，所有KitchenSeriesPage共用廚電推薦區改為Explore Our灰色眉標、廚房電器推薦黑色中文主標、Kitchen Appliance金色英文。英文按來源單數，不擅自改文案。桌機中文40px／600、英文50px，平板32／42px、手機28／30px；上下排列沿用色卡標題8px層級間距，不套用同列基線位移。重用上一輪置中雙語CSS，排除舊48px斷點覆寫；色卡本身樣式不變。
- 使用image-to-code與ponytail，只改標題與既有回歸，保留原產品資料／圖片／型號／順序／連結／卡片／背景／錯誤顯示與CTA，不新增素材／套件／文件，不部署、送出表單或寫入CMS／資料庫；文件只更新README。
- 既有回歸新增廚電中英文案與字級斷言，色卡斷言同步容許共用CSS選擇器；限定執行色卡／廚電標題檢查，不執行含表單POST的全站流程。
- 建置、建置後typecheck、限定色卡／廚電標題回歸、腳本語法與diff檢查通過；保留原Tailwind sourcemap警告。已核准獨立瀏覽器驗1280／1024／900／390／320px，桌機中文40px600／英文50px，平板32／42px、手機28／30px，水平溢出0；六筆產品圖片皆載入，型號／名稱／連結不變，第一張鍵盤Enter抵達原DR7396詳情路由。前後唯讀CMS回應一致，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_1mxvaD/截圖 2026-10-14 上午9.23.31.png`（2018×740註記畫布、右側約968px頁面）與 `/tmp/sakura-appliance-heading-UaeM8M/1280.png`（1280×900 CSS／1×）、`390.png`於同一比較輸入，另測1024／900／320px。五項檢查：原Cal Sans／Noto Serif TC、中文40px600／英文50px、灰色12pxExplore Our眉標，獨立中英層級；原置中版心／網格／卡片／17px眉標距與產品區留白保留，中英8px間距；中文黑色、英文金色與原灰白格線背景一致；原去背產品圖比例／contain／圖示未替換；文案依右圖及註記使用單數Kitchen Appliance，不保留錯誤Newsletter文案，不刪除截圖第一排外的原第六項E3625。等待標題及產品網格進場完成後取證，標題範圍無剩餘P0／P1／P2，final result: passed；全景可辨無需另裁切。既有手機固定服務列仍遮部分產品卡，屬標題外問題，不宣稱整頁手機QA通過。未驗正式端／其他瀏覽器／真實手機或外部產品連結，未送出表單／部署；保留本機預覽。

## 2026-10-14 品牌系列板材色卡標題

- 依09:23:21截圖，以明確文字註記「板材顏色選擇 Explore Our Color Collection」為準，不混入右圖額外的探索色彩美學或刪掉Explore Our。共用KitchenSeriesPage色卡標題上方保留Material Selection小標，中文改為黑色40px／600獨立行，英文50px、Explore Our黑色／Color Collection金色；上下排列不套用同列基線補償。平板32／42px，手機28／30px。僅改此標題，不影響廚電等其他置中標題、原色卡圖片／代碼／名稱／順序／網格／CTA與CMS資料。
- 使用image-to-code與ponytail重用既有字型／樣式／素材，不新增套件或文件，QA紀錄只維護README；不部署、不送出表單、不寫入CMS／資料庫。
- 首次響應式驗證發現1024px舊共用樣式覆寫英文為48px（P2），已將色卡標題排除於舊覆寫，保留其他置中區塊48px；重新擷取驗證桌機50px。
- 既有回歸腳本補上此區完整文案、40px／600独立中文與桌機覆寫防護斷言，限定執行本次檢查，不執行全站表單POST流程。
- 最終建置、建置後typecheck、限定色卡回歸、脚本語法及diff檢查通過。獨立瀏覽器驗1280／1024／900／390／320px：水平溢出0、字級依序40／50、40／50、32／42、28／30、28／30px，中文600；六張原色卡圖片載入成功，代碼／名稱／順序與原CTA URL保留，前後唯讀CMS回應相同，無pageerror／console error。建置重載曾使舊驗證頁面回到登入／空DOM，重新登入且等進場完成後取證，非修改登入邏輯。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_6bAKNL/截圖 2026-10-14 上午9.23.21.png`（2026×730註記畫布、右側約968px頁面）與 `/tmp/sakura-color-title-d1x11B/1280-final.png`（1280×900 CSS／1×）、`390-final.png`於同一比較輸入，另以`1024-final.png`驗覆寫修正。五項檢查：現有Cal Sans／Noto Serif TC，中文獨立行40px600／英文50px，層級清楚；置中、原17px眉標距離／55px網格距離／卡片比例／圓角不变，僅中英間8px；中文與Explore Our黑色、Color Collection金色、小標灰色；原六張門板素材／圖示／框線保留，未用CSS或新素材取代；以明確註記文案為準，右圖額外中文與刪除Explore Our為已說明差異。最初1024px字級P2修正後重截確認，標題範圍無剩餘P0／P1／P2，final result: passed；標題清楚可辨不需另裁切。原右側服務列仍遮部分手機色卡，屬既有標題外問題，不宣稱整頁手機通過。未實際開啟外部預約、送出表單、部署或驗真實手機。

## 2026-10-14 品牌系列內頁介紹標題

- 依09:12:52截圖，共用KitchenSeriesPage介紹區加入Explore Our／探索廚房美學，英文保留先前確認的完整「Creative Projects That Define Our Style」；右圖漏掉Define造成不完整句子，不照抄缺字。套用18／40／50px、中文600、baseline與0.06em字形補償，中文及Projects That金色，其他英文黑色；手機28／30px、平板32／42px自然分行。保留原70px標題頂距、30／70分欄與47px十字線間距，不改其他區塊標題。
- 所有品牌系列內頁共用此次標題，不只AI Kitchen。保留各系列CMS資料、下方副標／正文／分隔線、Hero／圖片／套系／色卡／廚電／案例／快速選單及其互動。重用image-to-code與ponytail，不新增套件／素材／文件，僅維護README，不部署或寫入CMS／資料庫。重新啟動原已停止的本機3100預覽，沿用使用者核准的獨立瀏覽器驗證。
- 建置、建置後typecheck、限定此標題的回歸斷言、脚本語法與diff檢查通過。AI Kitchen驗1512／1280／1190／1024／900／390／320px，潮派系列驗1280px：水平溢出0，桌機18／40／50px、中文600、十字間距47px；平板18／32／42px、手機18／28／30px。實際Canvas字形高中文37.30px／英文Creative36.75px，中文上移2.4px補償基線。套系ArrowDown／Home選取與焦點、圖片01↔02切換正常；前後唯讀CMS回應完全相同，pageerror／console error為空。未跑含表單POST的全站回歸，不送出表單、不部署。
- image-to-code／design-qa：來源09:12:52（2040×698註記畫布、右侧约968px內嵌頁面）與 `/tmp/sakura-series-heading-J0WwBh/desktop.png`（1280×684 CSS／1×）、`ai-390.png`於同一比較輸入，另以`ai-900.png`、`ai-320.png`與`loft-desktop.png`驗響應式及共用系列。五項檢查：原Cal Sans／Noto Serif TC、指定字級／600字重、同列中文字形及基線對齊；保留30／70分欄、70px頂距、47px十字間距、下方分隔與段落版型；中文／Projects That金色、其他英文黑色、線條淺灰；未更換Hero／套系／圖示／背景素材；新增文字符合指定，完整英文保留Define，各系列原CMS副標與正文不變。等待is-visible及有限進場動畫完成再取證，本次標題範圍無剩餘P0／P1／P2，final result: passed。
- 手機原有下方正文與套系tabs被固定右側服務列遮擋，屬本次標題以外的既有P2；此次未擴改下方版型，不能宣稱整頁手機QA全通過。未驗正式端／其他瀏覽器／真實手機；保留本機品牌系列預覽。

## 2026-10-13 首頁尋找門市雙語標題

- 依15:47:52截圖，首頁尋找門市加入Explore Our、原CMS中文「櫻花整體廚房／全台門市據點」及英文「Find Us Stores at／SAKURA KITCHEN」。桌機18／40／50px，中文600並沿用baseline／0.06em字形補償，金色中文／Stores at、其他英文黑色，現有Cal Sans／Noto Serif TC不變；手機分行28／30px、平板32／42px。
- 新標題比舊版左移，標題區沿用30／70分欄及共用47px十字軌，線條使用現有淺灰而非來源編輯選取藍色。窄於1024px上下排列時隱藏十字裝飾；下方地圖／門市卡片、篩選、翻牌、選取／暫停及定位按鍵不改，原手機右側安全距離保留。不把截圖的金色選取門市變成預設鎖定，也不更換店名／資料。使用image-to-code與ponytail重用現有元件，僅更新README，無新套件／素材／文件、部署或CMS／資料庫寫入。
- 建置、建置後typecheck、本次限定門市標題回歸、腳本語法與diff檢查通過。獨立瀏覽器驗1512／1280／1190／1024／900／390／320px，水平溢出0；所有桌機18／40／50px、中文600、十字間距47px，900px小標／中文／英文為18／32／42px，手機18／28／30px。平板／手機上下排列且十字線隱藏，文字保留既有右側安全空間。Google地圖實際載入、無錯誤提示；中部／臺中市篩出中港、松竹、台中復興、博館4店，鍵盤Enter選取回報aria-pressed=true，重設篩選後取消選取且城市恢復停用。前後CMS唯讀回應相同、原9筆資料保留，pageerror／console error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_rN5L4Y/截圖 2026-10-13 下午3.47.52.png`（2036×722註記畫布、右側約968×518頁面）與 `/tmp/sakura-store-heading-cDlrIz/desktop.png`（1280×684 CSS／1×）、`heading.png`（約791×184標題近拍）、`390.png`（390×900）於同一比較輸入，按約0.756倍率核對標題；另測1512px全景與900px平板。五項檢查：18／40／50px、字族／600字重／英文大小寫／基線補償符合指定，長文案自然分行；標題使用30／70分欄、47px共用十字間距，地圖與列表保持原62%布局、圓角與控制尺寸；中文／Stores at金色、其他英文黑色，線條沿用本站淺灰而不加入編輯藍色；實際Google圖磚、S pin、Logo与原圖示保留，篩選後等待圖磚回復清晰再截圖；兩段中文與9店資料來自原CMS，英文符合來源，不複製截圖隨機店序或金底選取状态。原標題缺少英文層級P2已修正，無剩餘本次P0／P1／P2，final result: passed。第一次滾輪碰到地圖顯示原Google操作提示遮罩，已移開指標、等待恢復後重截，未修改地圖程式。
- 既有「我的位置」按鍵在元件中沒有綁定定位事件；這是原程式的功能缺口，本次僅註記、不擴大到GPS或權限串接，不宣稱定位已驗證。沒有新增其他功能、真實定位、表單送出或部署，未驗正式端／其他瀏覽器／真實手機。保留本機 `/#contact` 預覽。

## 2026-10-13 首頁品牌承諾雙語標題

- 依15:32:54截圖，首頁品牌承諾主標加入上方金色「品牌承諾」，英文仍沿用目前CMS的Why／SAKURA KITCHEN。示意圖SKITCHEN為誤植，不帶入前台或覆寫資料。沿用本輪雙語規格：桌機中文40px／600、英文50px，現有Noto Serif TC／Cal Sans；上下排列不套用同列字形位移，手機28／30px、平板32／42px。中文與英文留8px層級間距。
- 保留Brand Commitment小標、正文、副標、CTA、影片／封面、背景、版心與進場；只有標題新增中文及字級／行高调整。使用image-to-code與ponytail重用既有元件／CSS／回歸，僅更新本README，不新增套件／素材／文件，不部署、不改CMS／資料庫。
- 手機QA發現長英文及正文被固定右側服務列遮住（P2），僅此區塊≤767px文字欄加入72px安全距離，沿用本站卡片文字避讓尺寸；保留手機影片滿寬及原上下排列，桌機／平板版型不改。文字自然折行，不縮小字級或截斷文案。
- 建置、建置後typecheck、本次限定品牌承諾回歸、腳本語法及diff檢查通過。已獲同意的獨立瀏覽器驗1280／1190／1024／900／390／320px，水平溢出0；桌機中文40px／600、英文50px，900px為32／42px，手機28／30px。390px文字右緣303px、320px233px，與右側服務列有15px安全空間；影片仍滿寬且原封面載入正常。鍵盤Enter櫻花優勢抵達 `/about/advantage`；影片按鍵可鍵盤聚焦且啟用，不觸發外部串流播放。前後唯讀CMS回應完全相同，pageerror／console error為空；未執行含表單POST的全站回歸。
- 來源畫布實測2030×734px，包含左右比較與註記，不將整張畫布當網站視口；對稿按右側內嵌頁面縮放。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_yTFf2y/截圖 2026-10-13 下午3.32.54.png` 的右側約968px頁面，與 `/tmp/sakura-promise-heading-cdtIxR/desktop.png`（1280×684 CSS／1×）、`390.png`（390×844）及 `heading.png`（約446×176標題近拍）於同一比較輸入，依約0.756比例核對指定標題。五項檢查：沿用Cal Sans／Noto Serif TC，上中文、下英文的分行／字級／600字重清楚；保留版心、左右文字影片比例、原圓角與段落间距，僅手機增加文字安全距離；金色中文／SAKURA KITCHEN、黑色Why及灰色正文一致；影片封面、藍圖背景與播放icon未重製，圖片載入完整；英文依上方註記使用正確KITCHEN，不複製示意圖SKITCHEN或舊標題，其他CMS內容不變。初次手機英文被遮住P2已修正，重截確認完整可讀；首次重截發生在CSS進場delay階段，後續改為等待is-visible及有限動畫完成後才驗收，最終證據无過渡偏移。本次無剩餘P0／P1／P2，final result: passed。未驗真實YouTube播放、正式端／其他瀏覽器／真實手機；保留本機預覽，不部署。

## 2026-10-13 同列中英文標題等高對齊慣例

- 依15:11:34截圖修正首頁「品牌系列」中文向下偏移。Canvas實測Noto Serif TC 40px／600字形高37.50px，Cal Sans 50px英文Creative字形高36.75px，原問題主要是middle垂直對齊而非中文太小。保留原40／50px與18px小標，中文改為baseline並上移0.06em（桌機2.4px）補償中英字形；不擴大中文到50px，不改文字、色彩、47px十字間距、輪播或其他頁標題。
- 沿用image-to-code與ponytail做局部修正，重用既有字型與回歸腳本，只維護本README，不新增套件／素材／文件，不部署、不改CMS／資料庫。
- 依使用者「剛剛改的都改一遍，之後也是」，廚房產品同列中文同步baseline／0.06em字形補償。後續新增或修改同列中英主標時，必須檢查实际字形高度與垂直對齊，不能只按font-size或middle認定已等高；沿用現有字型時可用本次40／50px組合及補償。換字型時重新量測，不盲套偏移值。上下排列的獨立中文小標（如設計案例38px／英文80px）保留使用者指定層級，不硬改成同高。
- 本次建置、建置完成後重跑typecheck、限定雙語標題回歸與腳本語法／diff檢查通過。獨立瀏覽器測1280／1190／900／390／320px，兩區均為baseline且水平溢出0；手機中文28px、平板32px、桌機40px不變，品牌十字線最終仍47px。排除進場尚未結束的47.02px過渡讀數後精確確認47px；型別檢查引發dev reload時測試helper曾讀到空DOM，重新載入後完整驗證，最終pageerror／console error為空。沒有送出表單或執行全站資料回歸。
- image-to-code／design-qa：缺陷來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_x6Uepp/截圖 2026-10-13 下午3.11.34.png`（1386×270、約2×標題近拍）與 `/tmp/sakura-brand-align-MwMPin/heading.png`（766×120 CSS／1×）、`services-heading.png`（769×120）於同一比較輸入。品牌中文字像素頂緣／底緣11／47、英文Creative11／46，頂緣同高，底緣僅1px字形柵格差；未追求拉伸字形。五項檢查：字型、字重、40／50px及小標18px保留，修正的是基線與字形位置；欄位、段落、卡片、47px橫距與手機換行不變；金黑白配色及下劃線不變；原圖片／Logo未編輯，另檢查 `brand-1280.png`／`services-1280.png`全景與兩張390px手機證據；所有文案及資料不變。來源是偏低缺陷，不重現偏移；中文下沉P2已修正，無剩餘本次P0／P1／P2，final result: passed。未驗正式端、其他瀏覽器或真實手機，不部署；不同字型／其他上下排列標題不自動套用本補償。

## 2026-10-13 首頁品牌系列與設計案例雙語標題

- 依14:38:02截圖及使用者確認，品牌系列保留英文「Creative Projects That Define Our Style」，加入Explore Our及原CMS中文「品牌系列」。桌機18px／中文40px、600／英文50px，沿用金黑色與現有Cal Sans／Noto Serif TC，保持47px十字線間距、正文與輪播不變。
- 依14:38:45截圖，設計案例把原CMS中文作為英文上方的38px／600小標，加入80px「Kitchen／Design」兩行英文；手機／平板縮小適配。不改進場、背景／縮圖、原案例資料、輪播、更多設計CTA或資料庫。沿用image-to-code與ponytail，只維護本README，無新增套件／素材／文件或部署。
- 建置、建置後typecheck、既有前台回歸新增的本次限定斷言、腳本語法及 `git diff --check` 通過；沒有執行含表單POST的完整回歸。已獲同意的獨立瀏覽器驗證1920／1280／1190／1024／900／390／320px：水平溢出0，桌機品牌50／18／40px、案例80／38px，兩區中文600；品牌所有左右排列間距47px，手機保留隱藏十字線。900px品牌42／18／32px、案例60／32px；手機品牌30／18／28px、案例40／26px。品牌與案例的下一張皆可鍵盤Enter切換，「更多設計」Enter抵達原 `/design-inspiration`，兩區圖片完整載入，pageerror／console error為空。
- image-to-code／design-qa：來源14:38:02（2028×746）與14:38:45（2008×726）註記畫布中的右側約968px頁面，分別與 `/tmp/sakura-dual-heading-0s0bpN/brand-desktop.png`、`case-desktop.png`（1280×900 CSS／1×）於同一比較輸入，依約0.756比例聚焦雙語標題；另查看同目錄 `brand-900.png`／`brand-390.png`／`case-390.png`。五項檢查：現有Cal Sans／Noto Serif TC對應英文與中文，指定字級／600字重／分行正確；保留共用47px、原欄位／區塊頂距／圖卡佈局與CTA，品牌標題寬度由639改為沿用正文的766px以容納新增內容，手機分行不擠出畫面；品牌金黑灰、案例白字與原深色遮罩不變；原案例／廚房素材、Logo、圖片品質与裁切未修改，當前輪播頁與來源不同屬原自動切換狀態；品牌英文依使用者確認保留完整文案，中文仍取CMS，案例補Kitchen Design，不加入註記或舊Lorem ipsum。初次品牌截圖受建置／typecheck後dev重新載入影響、進場尚不可見，作為無效證據捨棄；待動畫與hover收束後重截比對。原雙語層級缺失P2已修正，最終沒有本次P0／P1／P2，final result: passed。標題可清楚辨識且有實測邊界證據，不需另裁切；未驗正式端、其他瀏覽器／真實手機或所有案例詳情，保留本機預覽。

## 2026-10-13 首頁廚房產品雙語標題

- 依14:38:23截圖，首頁廚房產品標題加入Explore Our與英文「Smart Appliances Designed for Better Living」；保留原CMS中文兩欄合併顯示「廚房產品」，不覆寫資料。桌機沿用本輪指定的18px／中文40px、600／英文50px，使用現有Cal Sans與Noto Serif TC；中文及Better Living沿用金色，其他英文白色。手機／窄平板自然分行縮小，不加入示意圖文字背後的編輯遮罩。
- 使用image-to-code與ponytail，只改HomeServices標題／局部響應式樣式，保留共用47px十字線間距、原進場／輪播／圖片／卡片／品牌連結。QA與驗證記錄僅維護本README；品牌系列的英文選擇仍待確認，不連帶修改。不新增套件／素材／文件，不部署、不寫入CMS或資料庫。
- `pnpm --dir nuxt-site build`、建置後順序執行的 `pnpm --dir nuxt-site typecheck`、瀏覽器字級／字重／間距斷言及 `git diff --check` 通過。沿用已獲同意的獨立Playwright驗證1920／1280／1190／1024／900／820／390／320px，水平溢出皆0；左右版型皆47px，上下排列仍隱藏裝飾線。1280px主標左緣419.80px、線右緣372.80px，桌機三種字級為18／40／50px、中文600；1024px自然三行，不壓縮桌機字級。900px兩欄自動輪播會切換，1280px三卡全部可見時不需捲動。鍵盤Enter原SAKURA卡片抵達 `/products/sakura`，圖片與Logo均正常載入；首次SPA跳頁曾短暫報內容初始化錯誤，等待載入並重新導航後品牌頁與首頁pageerror／console error均為空，未更改資料或錯誤處理。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_Qnh7yD/截圖 2026-10-13 下午2.38.23.png`（2048×750註記畫布、約968×516內嵌頁面）與最終 `/tmp/sakura-services-heading-t80ah9/desktop.png`（1280×684 CSS／1×、進場完成）於同一比較輸入，另檢查同目錄 `900.png`／`390.png`，聚焦標題而非來源舊卡片英文示意文。五項檢查：沿用Cal Sans／Noto Serif TC，新增小標、中文與英文分級，字重／行高及英文大小寫正確；保留標題欄位、47px共用間距、原標題頂距與卡片版型，窄螢幕分行無裁切；白色英文及金色中文／Better Living符合示意，原背景遮罩保留，不複製編輯黑色背板；圖片／Logo仍為原素材、載入完整，無生成替代品；中文取原CMS欄位，新增英文逐字符合右圖，未變更其他文案。全景中文字與間距清楚可辨，搭配字級邊界量測，無需另裁切；既有標題缺少指定英文／中文階層的P2已修正，本次無剩餘P0／P1／P2，final result: passed。未重跑含表單POST的全站回歸、其他品牌目的頁、正式端或真實手機，不部署。

## 2026-10-13 全站十字線與主標題間距

- 依14:05:14截圖，統一所有使用 `InternalTemplateHeadingRail` 的並排標題：沿用首頁既有47px作為垂直線到主標題左緣的共用間距，定義於全站CSS；移除Home06／Home05／Home01來源版型與斷點的固定座標覆寫。既有箭頭15px圖框／14px定位補償保留，不重製素材，不改主標題或小標文案、字級、配色、橫線長度、區塊頂距、reveal或資料。
- 同步首頁廚房產品的十字軌定位到第一欄；加盟介紹與行銷區保留原58px／窄桌機30px文字內距，只補償十字線位置，避免移動正文／影片／卡片。所有其他共用使用者（首頁品牌系列、品牌系列內頁、推薦案例、FAQ、品牌館、品牌介紹／優勢、建商能力區、廚房知識、服務流程、型錄保養區）沿用共用定位。手機既有上下排列與十字線隱藏保留；首頁廚房產品768–880px及建商≤1023px的上下排列也隱藏無對應左右標題的裝飾線，不強套47px水平距離。
- 使用image-to-code與ponytail重用既有共用元件／CSS／回歸腳本；只維護本README，不新增文件／套件／素材。回歸補上共用47px、來源覆寫移除、加盟內距補償、首頁欄位定位與多寬度間距公式。`pnpm --dir nuxt-site build`、建置後 `pnpm --dir nuxt-site typecheck`、限定共用定位回歸、腳本語法及 `git diff --check` 通過，保留既有Tailwind sourcemap警告。10頁唯讀SSR皆200、共17個標題軌內容完整。
- 原內建瀏覽器控制不可用，使用者已同意以獨立瀏覽器驗證；使用既有bundled Playwright，不引入套件。35組核心頁面／尺寸組合：10頁各驗1280／900／390px，另首頁與加盟1920／1190px、首頁820px。44個仍採左右排列的標題皆實測47px、所有組合水平溢出0；900px建商與820px首頁廚電上下排列不顯示十字線，390px所有共用十字線沿用隱藏。首頁1280px標題左緣419.80px、線右緣372.80px；加盟1280px為437.19／390.19px、1190px為382.19／335.19px，均47px。以正常滾輪觸發進場並等待文字／十字軌動畫完成後量測，不將進場中的移動誤判為間距漂移。首頁下一個廚房系列按鈕正常切換，操作後間距仍47px，瀏覽器pageerror／console error為空。保留本機dev server與 `/#kitchen-series` 預覽，不部署、不送出表單、不寫入CMS／資料庫。
- image-to-code／design-qa：來源 `/Users/eric/Documents/截圖/截圖 2026-10-13 下午2.05.14.png`（2030×992註記畫布、约968×516內嵌頁面）與 `/tmp/sakura-heading-gap-VlbaAN/home-desktop.png`（1280×684 CSS／1×、首頁品牌系列一般狀態，比例約0.756）於同一比較輸入，聚焦垂直線到標題左緣的距離；另同時查看 `franchise-desktop.png`（1280×900）、`home-tablet.png`（900×900）、`home-mobile.png`（390×900）。來源紅色十字／虛線／箭頭為註記，不加入UI；當前首頁已發布中文「品牌系列」與BRAND SERIES小標屬既有內容，保留不換回截圖英文示意字，亦不加入Explore Our。五項檢查：現有字族／字重／字級／行高和斷行不變；只有十字軌水平定位與上下排列的裝飾顯示改動，原主標題／正文位置、區塊內距、橫線長度及卡片比例保留；原金黑灰白配色、線條顏色與粗細不變；重用原圖片、箭頭與Logo，未生成或重製素材；原標題／文案及輪播／頁面資料不變。原Home06固定left、Home05／Home01來源與斷點偏移造成間距不一致（P2），已由共用token與加盟內距補償修正，最終跨頁及三斷點無剩餘P0／P1／P2。全景可清楚辨識十字與標題關係，搭配瀏覽器邊界量測，無需另裁切；不宣稱全頁文案或像素與舊截圖一致，final result: passed。未重跑包含表單POST的全站回歸、正式端、其他瀏覽器、真實手机或所有品牌系列／文章網址；共用元件以潮派系列與10個代表頁驗證。

## 2026-10-11 建商型錄說明行距

- 依12:34:16截圖，只調整 `/builders/catalogues` 底部用途說明：原16px字級／18px行高增加為1.75倍（28px），手機移除舊22px覆寫並沿用相同行高；保留原字族／字重／置中、兩段文案與平衡換行、桌機56px／手機40px頂距。增加的是文字行距，不是型錄卡片或整個區塊間距；不改型錄素材、預覽／下載入口、CMS／資料庫或前台錯誤顯示。手機QA發現原右側浮標遮住此段文字（P2），僅在此段手機樣式沿用本頁卡片文字的72px右側安全距離，不改浮標或其他區塊。
- 使用image-to-code與ponytail做局部修正，重用現有CSS、圖片與回歸腳本，不新增套件／素材／文件，只維護本README。回歸補上16px／1.75倍行高、兩段分行、手機繼承與浮標避讓斷言；修正後 `pnpm --dir nuxt-site build`、建置後 `pnpm --dir nuxt-site typecheck`、限定建商型錄SSR／完整警語／原預覽及下載入口／響應式行高回歸、腳本語法與 `git diff --check` 通過。原PDF唯讀請求回傳200及%PDF-檔頭，保留既有Tailwind sourcemap警告。
- IAB實測1190×634桌機、900×900平板、390×844手機：字級皆16px、行高28px；桌機／平板兩行共56px，手機兩段各換成兩行、共112px，頂距仍56px／40px，水平溢出均0。手機段落右緣303px、浮標左緣318px，文字已有15px安全空間，不被服務列蓋住；原圖片載入成功、預覽／下載URL及檔名保留、瀏覽器error為空。測試viewport已還原並保留本機型錄預覽，不填寫／送出表單，不操作CMS／資料庫或部署。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_5afLDG/截圖 2026-10-11 中午12.34.16.png`（1986×836註記畫布、1190×634內嵌頁面）與 `/tmp/sakura-builders-notice-Dz5CE6/desktop.png`（1190×634 CSS／1×、型錄頁底部一般狀態）、`tablet.png`、`mobile-before-safety.png`、`mobile.png`於同一比較輸入。聚焦兩段用途說明，來源為調整前，不重現舊18px行高或將紅框加入UI；桌機最終兩行上緣475.79／503.79px，清楚相隔28px。五項檢查：原中文字族／16px／400字重保留，行高增加而非放大文字；原卡片版心、頂距、圓角及區塊padding保留，只修文字行距與手機浮標安全區；原灰字#59585d／浅底／品牌金配色保留；同一型錄封面、裁切與背景品质不變；兩段全文、型錄標題與描述、預覽／下載入口完整保留。首次手機QA（`mobile-before-safety.png`）發現浮標遮字P2，局部增加72px避讓後再擷取`mobile.png`，全文清楚可讀且右緣位於浮標左側。全景足以辨識文字與上下文，不需另裁切；本次範圍無剩餘P0／P1／P2，final result: passed。未重跑全站回歸、正式端／其他瀏覽器／真實手機或完整PDF閱讀器下載互動。

## 2026-10-11 建商品牌館切換按鈕尺寸

- 依12:34:06截圖，只調整 `/builders#appointment` 的台北／台中／高雄橢圓切換按鈕：三斷點統一高42px、字級15px，保留20px行高、原等寬三欄／間距／999px圓角與金色選取樣式。移除手機原38px／13px覆寫，手機仍沿用10px左右內距。不改文案、品牌館資料／照片、表單、原點擊／方向鍵／Home／End切換、ARIA或錯誤顯示，不操作CMS／資料庫。
- 使用image-to-code與ponytail做局部樣式修正，重用現有按鈕／字型／素材與回歸腳本，不新增套件或文件，只維護本README。回歸補上42px／15px、手機繼承、三個原tab／單一選取與點擊／鍵盤入口斷言；`pnpm --dir nuxt-site build`、建置後 `pnpm --dir nuxt-site typecheck`、限定建商SSR／按鈕／原CTA／服務間距／圓角與圖片品質回歸、腳本語法及 `git diff --check` 通過，保留既有Tailwind sourcemap警告。
- IAB實測1280×684桌機、900×900平板、390×844手機：三個按鈕皆高42px、字級15px、行高20px，各斷點等寬約136.63／117.66／114.66px；原12px／手機8px間距、999px圓角和金色狀態保留，水平溢出均0。桌機點台中後地址／照片同步，End切到高雄、ArrowLeft切回台中、Home回台北；手機點台中與Home回台北也正常，ARIA面板與選取狀態一致。原照片載入成功，表單保持空白未送出，瀏覽器error為空。測試viewport已還原並保留 `/builders#appointment` 本機預覽，不操作CMS／資料庫或部署。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_hW9G0Q/截圖 2026-10-11 中午12.34.06.png`（1500×744註記畫布，約992×530內嵌頁面）與 `/tmp/sakura-builders-tabs-YYizxy/desktop.png`（1280×684 CSS／1×、台北選取一般狀態）、`tablet.png`、`mobile.png`於同一比較輸入，聚焦指定切換列，以42px／15px註記為準而非重現修改前尺寸，不把紅框加入UI。五項檢查：原中文字族／字重保留，字級15px、行高20px；三欄等寬／原間距／圓角不變，僅統一高度與字級；金白灰配色和原hover／focus／選取效果保留；同一品牌館實景照片與背景、裁切比例與品質未改；三城市文案、資料、表單及原切換功能完整保留。來源與預覽尺度不同，不宣稱全頁像素一致；預覽表單標題沿用先前修改，本次不更動。全景可清楚閱讀切換列，無須另裁切；本次範圍無剩餘P0／P1／P2，final result: passed。未重跑全站回歸、正式端／其他瀏覽器／真實手機及表單送出流程。

## 2026-10-11 加盟行銷輪播首尾交錯修正

- 依12:03:02截圖與使用者確認，修正 `/franchising/intro` 的05→01接縫同高：奇數案例只在前端呈現兩輪，利用既有單雙CSS讓第二輪高低反轉，包含第二輪05→第一輪01都持續一上一下。CMS／seed／資料庫仍是原五筆，不改順序、圖片或文案，偶數筆不複製；沿用Embla無限輪播、左右按鈕／方向鍵／觸控、3.5秒自動切換、暫停與減少動態偏好。顯示編號維持01–05、Vue key唯一，第二輪aria-hidden避免輔助閱讀重複宣告案例。
- 使用image-to-code與ponytail做最小局部修正，重用原圖／字體／CSS／回歸腳本，不新增套件、素材或文件，只維護本README。舊五卡固定交錯的首尾斷言先驗證預期失敗；既有回歸更新兩輪SSR／編號／無障礙／接縫，加入空／奇／偶數資料自我檢查。`pnpm --dir nuxt-site build`、建置後 `pnpm --dir nuxt-site typecheck`、限定加盟Hero／圖片／行銷輪播的SSR與接縫回歸、腳本語法及 `git diff --check` 通過，保留原Tailwind sourcemap警告。
- IAB實測1280×900桌機：第一接縫05／01／02的上距為0／50／0px，第二接縫為50／0／50px，左緣等距約398px；900×900平板兩欄保持35px交錯，390×844手機沿用0px齊平、84vw卡寬。三斷點水平溢出均0，原五張圖片載入成功。上一張／下一張、左右方向鍵、手機尺寸下的滑鼠拖曳切換、暫停與恢復後自動切換皆生效；原3.5秒間隔與reduced-motion邏輯保留。原生AX清單只宣告五個案例，沒有重複的第二輪內容；瀏覽器error為空。測試viewport已還原、恢復自動播放並保留本機預覽；不填寫／送出表單，不操作CMS／資料庫或部署。
- 最後再將同一來源與 `/tmp/sakura-franchise-seam-vPBxjP/desktop-second-seam.png` 置於同一比較輸入，完整確認第二輪05（y=352.91）→第一輪01（y=302.91）→02（y=352.91），首尾三張圖片／文案／控制按鈕清楚可見，原型持續運行。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_Lh6hDD/截圖 2026-10-11 中午12.03.02.png` 與 `/tmp/sakura-franchise-seam-vPBxjP/desktop.png`（1280×900 CSS／1×、05／01／02暫停狀態）於同一比較輸入，聚焦卡片區域；來源是缺陷截圖，修正目標為首尾也持續交錯，不重現其中的05／01同高。來源與預覽視口／截圖倍率不同，不宣稱全頁像素一致。五項檢查：原字族／字重／字級／行高保留；僅改前端循環顯示位置，原三欄／兩欄／手機卡寬、間距、圓角與控制器保留；金灰黑白配色保留；同一實景照片、比例與裁切品質未改；五筆文案、圖內01–05編號與順序完整保留。`tablet.png`／`mobile.png`補充響應式驗證，接縫同高P2已修正，本次範圍final result: passed。未重跑全站回歸、正式端／其他瀏覽器／真實手機觸控或表單送出流程。

## 2026-10-11 建商合作 Logo 區塊移除

- 依11:43:54截圖，從 `/builders` 完整移除OUR CLIENTS標題、裝飾線、兩排合作建商Logo、輔助閱讀清單與區塊背景／留白，讓含iCare的能力區直接接到原聯繫區。不僅隱藏Logo，避免留下空白或可聚焦的空輪播。同步移除本頁專用輪播複製資料、動畫／響應式／reduced-motion樣式與全域失效字型選擇器；不改其他頁或共用圖片元件。
- 使用image-to-code做局部刪除，不新增素材、JS、套件或文件，QA僅維護本README。保留CMS／seed／data中的合作建商資料與原Logo檔案，不做資料刪除／同步／發布，前台程式可由Git還原。保留iCare圓角／比例、前輪服務間距、原#appointment入口、品牌館切換／表單及錯誤顯示。既有回歸的能力區擷取終點改為聯繫區，補上完整移除／直接相鄰／無失效樣式斷言；`pnpm --dir nuxt-site build`、建置後 `pnpm --dir nuxt-site typecheck`、限定建商SSR／圖片品質／原CTA／服務間距／圓角與刪除區塊回歸、腳本語法及 `git diff --check` 通過。API唯讀確認合作建商資料仍保留9筆。
- IAB實測1190×634桌機與390×844手機：合作建商DOM節點0、能力區後直接相鄰聯繫區，水平溢出0；iCare圖片下緣至聯繫區頂緣沿用原能力區底距72px／40px，沒有合作建商空容器或專用留白。原#appointment能定位到聯繫區、表單欄位完整；台中tab選取狀態、地址與圖片面板正常，檢查後回復台北；不填寫／送出表單。瀏覽器error為空，測試viewport已還原，本機預覽保留，未部署。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_QVMtwg/截圖 2026-10-11 上午11.43.54.png`（1522×866註記畫布、1190×634內嵌頁面）與 `/tmp/sakura-builders-remove-clients-WIrRBD/desktop.png`（1190×634 CSS／1×、iCare至聯繫區、進場完成）、`mobile.png`（390×844）於同一比較輸入。来源為刪除前，按紅框要求確認標題、線條、兩排Logo及區塊均消失，不將註記加入UI。五項檢查：相鄰標題原字體／字級／字重及響應式換行保留；移除完整區塊並保留原iCare與聯繫版心／間距／圓角；原金黑灰白配色保留；原iCare圖片與聯繫背景品質／比例未改，沒有新增素材；除指定合作建商區外文案與表單完整保留。全景足以辨識銜接，不需另裁切，本次範圍無剩餘P0／P1／P2，final result: passed。未重跑全站回歸、平板實機、正式端／其他瀏覽器／真實手機及表單送出流程。

## 2026-10-11 建商 iCare 大圖四角圓角

- 依11:43:45截圖，只在 `/builders` 的iCare圖片外框加入四角圓角：桌機／平板24px、手機18px，沿用本頁Hero大圖的既有尺寸。利用BuilderImage原有overflow:hidden裁切，不修改共用圖片元件，不影響其他五張能力圖、圖片載入錯誤提示、16:9比例、原contain、reveal動畫或上一輪服務區間距；不改素材、CMS／資料庫、文案或表單。
- 使用image-to-code與既有CSS／回歸腳本，只維護本README，不新增套件／JS／文件。新增桌機／手機圓角與原比例斷言；`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定圓角／contain／外框裁切／錯誤提示／上一輪三斷點間距回歸、腳本語法與 `git diff --check` 通過。
- IAB實測桌機1190×900：四角皆24px、overflow:hidden，圖片1074×604.125、contain與reveal終態opacity1；390×844手機四角皆18px、圖片360×202.5。圖片均載入、水平溢出0，服務文字留白仍為桌機60／120px、手機30／60px，瀏覽器error為空。保留原底部QR Code與所有圖中文字，未另改手機字級；測試viewport已還原，本機預覽保留，不部署或送出表單。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_X50qh2/截圖 2026-10-11 上午11.43.45.png`（1518×842註記畫布、1190×634內嵌頁面）與 `/tmp/sakura-builders-radius-WhDZzf/desktop.png`（1190×634 CSS／1×、同服務／iCare銜接區、進場完成）置於同一比較輸入，另同時查看 `desktop-four-corners.png`（1190×900 CSS／1×）完整圖框四角，`mobile.png`確認手機四角。字體／字級／文案保留；此輪僅將原直角（P2）改為24px／18px，上一輪指定留白、版心、16:9及周邊版型不變；原金／黑／灰配色保留；使用同一iCare圖、比例與contain，無重製／拉伸，角落裁切不遮擋Logo或QR Code；三項服務文字與圖內文字原樣保留。全圖四角清楚可辨，不需另外裁切；本次範圍無剩餘P0／P1／P2，final result: passed。未重跑全站回歸、平板實機、正式端／其他瀏覽器／真實手機及表單送出流程。

## 2026-10-11 建商服務區上下間距

- 依11:43:34截圖，只調整 `/builders` 專業銷講／專屬監工／專人驗收的文字區上下留白。原本2cqw／3cqw會隨圖片版心縮小，改參考原Antra模板的區塊節奏：桌機上60／下120px、平板上40／下80px、手機上30／下60px。參考本機 `antra-full 2/antra/dummy-data/homepage/home-6.xml` 的d0bd50f／f0420ee與Home07的fdd7770：桌機120px、平板80px、手機60px；上距使用一半，區別同組圖片說明與下個iCare區塊，不把兩側padding與額外margin重複相加。
- 沿用image-to-code與既有CSS斷點，保留三欄、所有文案／字型、圖片／比例／順序、原reveal動畫與前台錯誤提示；不新增素材、套件、JS或文件，不修改CMS／資料庫。既有回歸加入三斷點留白斷言，QA僅維護本README。`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定CSS／建商SSR回歸、腳本語法及 `git diff --check` 通過；六張圖、三項服務文字與前一輪專人聯繫／原預約入口保留。
- IAB實測1190×634桌機上60／下120px、768×900平板上40／下80px、390×844手機上30／下60px，皆量測圖片邊緣至服務文字行盒；圖片載入成功、reveal終態opacity1、水平溢出0，瀏覽器error為空。保留手機原三欄字級，此輪未另外放大文字。測試viewport已還原，本機預覽保留；不送出表單，未部署。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_RRcyny/截圖 2026-10-11 上午11.43.34.png`（1724×854註記畫布、1190×634內嵌頁面）與 `/tmp/sakura-builders-spacing-EmqhdG/desktop.png`（1190×634 CSS／1×，同服務與iCare銜接區、進場完成）於同一比較輸入。以內嵌頁面對齊，不將紅線與右側註記加入UI；來源為調整前，新的間距以原Antra XML尺寸為準。五項檢查：原中文字族／字重／字級與兩行說明保留；只修改服務文字區上下留白，不改版心／三欄／圖框或其他區塊；原金灰底／黑字配色保留；同一專屬服務與iCare實景圖片，無重製、拉伸或裁切改動；三項服務文案完整不變。原留白隨版心縮成約21／32px（P2）已調整為60／120px，`tablet.png`／`mobile.png`確認響應式留白與完整內容。桌機文字細節清楚可讀，無需另裁切，本次範圍無剩餘P0／P1／P2，final result: passed。未重跑全站回歸、正式端／其他瀏覽器／真實手機及表單送出流程。

## 2026-10-11 建商頁首專人聯繫

- 依11:43:12截圖，將 `/builders` 頁首CTA舊文案「立即預約」顯示為「專人聯繫」。沿用品牌優勢英文標題修正的既有前台相容方式，只轉換CMS中完全相同的舊值，其他自訂文案不變；不覆寫CMS／資料庫。保留原 `#appointment` 入口、金色圓形箭頭動畫、按鈕尺寸、字型、Hero版型及圖片；旁邊大字、紅框與標線視為註記，不加入UI。
- 使用image-to-code做局部調整，不生成素材、加套件或新增文件，QA僅維護本README。更新既有SSR文案回歸，補上舊值／新值／自訂值相容自我檢查及原錨點保留；`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定回歸、腳本語法及 `git diff --check` 通過，保留既有Tailwind sourcemap警告。SSR已顯示專人聯繫，API唯讀確認CMS的text5仍為立即預約；不執行內容同步或資料發布。
- IAB實測1280×684與390×844：按鈕均顯示專人聯繫、149×60px，`href=#appointment`不變，無水平溢出。桌面點擊後URL為 `/builders#appointment`，區塊頂緣60.008px、opacity=1且表單已出現；不填入或送出表單。瀏覽器error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_P4yVoY/截圖 2026-10-11 上午11.43.12.png`（1224×860註記畫布，1190×634內嵌頁面）與 `/tmp/sakura-builders-contact-9uV0Ls/desktop.png`（1280×684 CSS／1×、頁首進場完成）置於同一比較輸入，按內嵌比例對照相同頁首，聚焦專人聯繫註記，不把旁邊立即預約大字加入UI。五項檢查：原字族／字級／字重與標題換行保留；Hero比例、CTA外框／尺寸／位置與圓角保留；金白灰配色與箭頭效果保留；原實景圖片、裁切／品質與背景保留；只變更指定CTA文案，其餘標題與內容不動。按鈕文字在全景可清楚閱讀，無需另做裁切；`mobile.png`確認單行按鈕與原手機版型。舊CTA文案P2已修正，本次範圍無剩餘P0／P1／P2，final result: passed。未重跑全站回歸、正式端／其他瀏覽器／真實手機及表單送出流程，未部署。

## 2026-10-11 我要加盟行銷圖卡交錯

- 依11:43:01截圖，只調整 `/franchising/intro` 名人行銷輪播圖卡：桌面原 `3n + 2` 導致第3／4張同高、第5張下移，改用偶數卡下移50px，1／3／5在上、2／4在下；刪除失效的平板三張分組重置，保留平板35px偏移、手機單卡0偏移。整張圖片與內容一起交錯，不改五筆資料、順序、圖片、文案、圓角、寬度、控制按鈕、循環與3.5秒節奏，不修改CMS／資料庫。
- image-to-code沿用現有實景素材與CSS，不生成圖片、加套件或新增文件；QA僅維護本README。既有回歸加入桌面單雙交錯、移除三張分組、平板35px與手機齊平斷言；`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定回歸、腳本語法及 `git diff --check` 通過，保留既有Tailwind sourcemap警告。未重跑全站資料／表單回歸、未部署或寫入資料庫。
- IAB實測1280×684：五張margin-top為0／50／0／50／0px，截圖同樣對齊03／04／05，top為127.406／177.406／127.406px；下一張與暫停控制正常。900×684維持0／35／0／35／0px；390×844五張均0px、寬327.594px，單卡與下一張部分可見維持原版型。五張原圖載入成功、無水平溢出、瀏覽器error為空。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_37rvUY/截圖 2026-10-11 上午11.43.01.png`（1730×838註記畫布、1190×634內嵌頁面）與 `/tmp/sakura-franchise-stagger-oKcBBr/desktop.png`（1280×684 CSS／1×、03／04／05暫停狀態）置於同一比較輸入，按內嵌比例聚焦圖卡交錯，垂直差異來自捲動位置。五項檢查：字族／字級／行高與換行保留；桌面50px高低節奏修正、原寬度／間距／圓角與操作按鈕保留；金灰白配色保留；原圖主體／比例／裁切與品質保留；五筆藝人與標題文案保留，不把註記加入UI。全景可清楚辨識所需交錯，不另做裁切；`mobile-natural.png`為手機完整區塊證據，較早 `mobile.png` 是捲動到控制按鈕後的部分截圖，不用作完整版型驗收。03／04同高及05下移P2已修正，本次01至05固定卡序範圍無剩餘P0／P1／P2，final result: passed。
- 當時已知範圍限制：五筆為奇數，只用五個固定CSS位置會讓05與01同高；此限制已在上方「加盟行銷輪播首尾交錯修正」改為前端兩輪交錯處理，不修改原輪播／CMS資料。當輪未驗證正式端、其他瀏覽器或真實手機。

## 2026-10-11 我要加盟門市大圖動態

- 依11:42:42截圖，在 `/franchising/intro` 門市大圖保留原opalMoveUp進場及260ms延遲，再沿用首頁既有 `hero-kenburns`：等待1.51秒後，5秒緩慢由1.06倍放大至1.16倍並往左移4%，完成後停在終態，不新增無限循環。以原is-visible觸發，未進入畫面不啟動；減少動態偏好保持原圖靜止。原圖片／替代文字／載入失敗完整提示、object-position、圓角、圖片框尺寸、版型、標題與CTA不變，不修改資料庫。
- 使用image-to-code，沿用原keyframes／reveal，不加JS計時器、套件、路由、圖片或文件；QA只維護本README。既有回歸補上原進場、260ms＋1.25秒先後順序、首頁同款動態與減少動態斷言；`pnpm --dir nuxt-site build`、建置完成後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定回歸、腳本語法及 `git diff --check` 通過。保留既有Tailwind sourcemap警告；未重跑全站資料／表單回歸，未送出表單或部署。
- IAB實測：631ms時外框仍進場、圖片維持1.06倍；1642ms時外框已完整顯示、圖片才開始縮放；3161ms為1.106倍，6679ms達1.16倍／左移4%，後續8484ms與18994ms仍停在同一終態。390×844時圖片框360×280／18px圓角、原圖載入成功、無水平溢出；瀏覽器error為空。減少動態以CSS／回歸斷言驗證，未切換作業系統偏好。
- image-to-code／design-qa：11:42:42來源截圖（1786×840註記畫布，內嵌頁面1190×634）與 `/tmp/sakura-franchise-photo-GweUmm/desktop.png`（1280×684 CSS／1×，動畫終態）置於同一比較輸入，按內嵌比例對照同一門市大圖；垂直位置差異來自捲動位置。五項檢查：版型／外框尺寸與圓角保留；字體及CTA未改；真實圖片、原裁切基準與品質保留，放大／平移造成邊緣內容被裁切是首頁同款動畫的預期效果；右側操作按鈕與原間距保留；原配色及文案保留，不把紅框／箭頭／說明加入UI。`mobile.png`確認手機無跑版，原缺少後續動態P2已修正，本次範圍無剩餘P0／P1／P2，final result: passed。未驗證正式端、其他瀏覽器或真實手機，不修改CMS／資料庫。

## 2026-10-11 我要加盟 Hero 標題字體

- 依11:42:23截圖，只調整 `/franchising/intro` 頁首兩行標題：由明體38px／400改成右側建商Hero的黑體 `--font-cjk-sans`、700字重、`clamp(32px, 4.4vw, 76px)` 字級及1.6行高；手機沿用建商 `clamp(24px, 7.3vw, 32px)`／1.5行高。保留加盟文案、第一行白色／第二行金色、原間距、背景實景、進場動畫、說明與兩個新分頁CTA，不修改建商頁或CMS／資料庫。
- 使用image-to-code，沿用現有字體與素材，不新增套件／路由／文件，QA僅維護本README。既有前台回歸補上兩頁標題字族／字級／字重／行高／字距一致與手機縮放斷言；`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定回歸、腳本語法及 `git diff --check` 通過，保留既有Tailwind sourcemap警告。此次未重跑全站資料／表單回歸，不送出表單或部署。
- IAB已恢復可用，1280×684實測兩頁標題同為Noto Sans TC、56.32px／700、90.112px行高。1512／1024／768px分別為66.528／45.056／33.792px；390×844為28.47px／42.705px行高、320px為24px／36px，均維持兩行、無水平溢出且不壓到說明／CTA／下方圖片。兩入口維持 `/franchising/form`、`/franchising/download`、target=_blank及rel=noopener；IAB點申請未回報新頁籤，因此僅確認可點與既有連結屬性，未宣稱另開分頁目的頁驗收。瀏覽器error為空、尺寸已還原、本機預覽保留。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_brJTyZ/截圖 2026-10-11 上午11.42.23.png`（2002×722註記畫布、860×459內嵌頁面）與 `/tmp/sakura-franchise-type-msI42c/desktop.png`、`builders-reference.png`（1280×684 CSS／1×）置於同一比較輸入，按內嵌比例聚焦右側字體／大小要求，不把紅框與箭頭加入UI。字族／字級／字重／行高與右側基準一致，版型／背景圖片品質與裁切、CTA、原金白配色與加盟文案保留；放大後標題在原grid內自然重新對齐，不另更改Hero間距。標題可清楚閱讀，無需額外裁切。`mobile-stable.png`（390×844／1×）確認手機閱讀完整；快速縮放時的首張 `mobile.png` 是截圖尚未穩定，不作驗收證據。原明體與字級偏小P2已修正，本次範圍無剩餘P0／P1／P2，final result: passed。未檢查正式端、其他瀏覽器或真實手機，不修改資料庫。

## 2026-10-11 品牌紀事首尾淡出淡入

- 依01:02:25截圖，調整 `/about/introduce` 品牌紀事：原末端 `scrollTo(0, false)` 會倒滑跨越整段年份，改採指定方案一「450ms淡出 → 隱藏時立即回到1978 → 450ms淡入 → 繼續輪播」。向前到末端與向後越過首張使用同一轉場，正常相鄰年份滑動與3.5秒自動節奏不變；既有圖片、年份順序、文案、字型、金色、尺寸及桌機／手機版型保留。
- 轉場中以aria-disabled回報兩顆按鈕暫不可操作，保留鍵盤焦點與原暫停狀態；共用操作函式阻擋點擊／鍵盤／自動輪播連續呼叫，並暫停拖曳，淡入結束恢復操作。使用viewport本身的transitionend事件完成復位／解鎖，不依賴猜測延遲或新增計時器；子元素事件不觸發復位。保留鍵盤焦點暫停、滑鼠Hover不中止規則；減少動態偏好不自動輪播、手動切換／復位均立即完成，單筆及無API不空轉；偏好／API改變解除轉場狀態。不修改CMS／資料庫。
- 使用image-to-code，沿用現有Embla／元件與真實品牌素材，不生成圖片、不新增套件／路由／文件；QA依專案規則只維護本README。既有回歸補上淡出前不復位、隱藏時立即復位、淡入完成再解鎖、連點防護、正常續播、反向回末端、減少動態、單筆／無API及原生事件完成轉場斷言。最終 `pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、完整 `check-frontend-regressions.mjs`、本次限定斷言、腳本語法及 `git diff --check` 全部通過。建置保留既有Tailwind sourcemap警告。
- Chrome實測1512×773與390×844：末端回1978時，桌機約445ms／手機約451ms opacity=0且已隱藏復位，約904ms／909ms恢復opacity=1、aria-busy=false；沒有整段年份倒滑，轉場期間重複方向鍵不會重啟或超前。反向回末端同樣正常，鍵盤焦點保留且仍暫停自動輪播；滑鼠操作後約3532ms繼續前進一張。原圖片載入成功、無水平溢出，瀏覽器error為空；手機沿用原單卡與下一卡部分可見版型。減少動態以CSS／執行斷言驗證，未切換作業系統偏好。測試viewport已還原、3100預覽保留；未部署、未改CMS／資料庫。
- image-to-code／design-qa：本次01:02:25來源截圖與 `/tmp/sakura-history-reset-jDuU9Z/desktop-matched.png`（1280×682 CSS／1×，1978／1992／1994／1997及上一則按鈕焦點）於同一比較輸入，按來源1190×634內嵌頁面比例核對；垂直位置差異是截圖捲動位置，非本次版型變更。字體／字級／字重、四欄及間距、130px原圖／裁切／24px圓角、48px箭頭、年份文案與金色均保留；不把紅框／說明加入UI。`fade-out.png`、`fade-in.png`與取樣記錄證明動畫，`mobile.png`確認手機可讀。原回捲過快P2已修正，本次範圍無剩餘P0／P1／P2，final result: passed；未驗證正式端及其他瀏覽器／真實手機。

## 2026-10-11 品牌館預約跳轉空白修正

- 依01:02:12截圖，使用investigate重現 `/about/exhibition` 的「立即預約」跳到 `/builders#appointment`：定位與資料正常，但14秒後預約標題／館別／表單仍被reveal的visibility:hidden隱藏，捲動也未恢復；直接重新載入目標URL則正常。暫加僅輸出靜態CSS／observer狀態的本機診斷，確認站內跳轉的進場生命週期，不記錄表單個資、不提交或修改CMS／資料庫。
- 診斷確認觀察器在page:finish取得跳轉前的4812／4998px位置並回報不相交；異常跳轉完成後三區實際已在180／366px，卻一直隱藏，另一次相同流程才補收到相交通知。修正共用錨點定位：沿用等待頁面完成與兩次rAF，定位前只標記目標本身及其reveal子元素，CSS立即顯示並跳過進場動畫，不再以觀察器通知作為表單可用前提；一般捲動進場、其他未定位區塊、Lenis、影片、表單驗證／完整錯誤與CMS資料保留。暫時診斷已移除。共用前台回歸補上實際執行標記／失效錨點／即時可見／一般動畫保留斷言。
- 驗證：`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次錨點限定回歸、腳本語法與 `git diff --check` 通過；同一標記斷言在HEAD舊版失敗、修正版通過（RED／GREEN），失效錨點不拋錯。建置保留既有Tailwind sourcemap警告。完整前台回歸兩次均在第一個商品SSR頁 `/products/sakura` 等待45秒逾時，並非新錨點斷言失敗；獨立建置預覽回歸則因本機SQL Server自簽憑證連線失敗在同頁回傳503，未關閉憑證驗證或更動資料庫設定，不能據此宣稱完整回歸通過。獨立3101測試伺服器已停止，原3100開發伺服器保留。
- 初次investigate驗收狀態：BLOCKED（當時修正已寫入、實際畫面驗收未完成）。修正後原預覽與新測試頁籤皆出現瀏覽器CDP控制逾時，連新頁籤導覽／觀察也無法完成，產品面板開啟請求亦回報queued；當時沒有修正後桌機／手機截圖，不能宣稱已完成實機跳轉驗收。修正前證據在 `/tmp/sakura-booking-jump-ySHlLC/before.jpg`。僅改router／CSS／既有測試與本README，不新增套件／文件；未部署、未送出有效表單、未修改CMS／資料庫。
- 01:02:25品牌紀事調整時補驗：重新啟動原本機3100開發伺服器後完整前台回歸全部通過；IAB仍無法控制，改用Chrome恢復畫面驗收。品牌館「立即預約」跨頁跳到 `/builders#appointment`，桌機約262ms／390×844手機約456ms表單即可見，錨點top約60px；預約標題、館別、表單三區皆data-reveal-direct且visibility=visible、animation=none。建商頁Hero同頁「立即預約」及手機直接重新載入目標URL同樣正常，無水平溢出、瀏覽器error為空，沒有提交表單。修正後證據在 `/tmp/sakura-history-reset-jDuU9Z/booking-jump.png`、`booking-mobile.png`；原畫面驗收阻塞已解除，final result: passed。此次僅補本README紀錄，未再改錨點實作、未部署或變更資料庫／憑證設定。

## 2026-10-11 品牌館 Hero 中文小標與249px定位

- 依00:51:24截圖，只調整 `/about/exhibition` 的 `BrandPavilionHero`：在原英文h1前加入「櫻花集團品牌館」，桌機以固定導覽底緣往下249px為小標定位基準（扣除圖片20px上間距，並沿用導覽高度變數）。保留英文字型／字級／金色、背景圖片／遮罩／圓角、影片入口及原進場動畫；手機保留距底190px的彈性位置，縮小中文小標，避免套用桌機固定距離。
- 使用image-to-code，沿用既有元件與CSS，不新增套件／素材／文件，不修改CMS／資料庫或部署。共用回歸補上小標SSR／順序、定位基準、平板／手機避讓及原圖／動畫／影片入口斷言；768px驗收發現照搬桌機249px會使標題被原影片卡遮住，因此768～1023px保留底部200px彈性定位。最終 `pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定前台回歸（含原預約CTA／警語／目標錨點）、腳本語法與 `git diff --check` 通過。保留既有Tailwind sourcemap警告，未重跑完整表單／資料回歸。
- 本機1512×982／1280×900／1024×768頁首實量：導覽底緣60px、中文小標框上緣309px，相差249px；1280英文維持Cal Sans 60/69px、400、兩行及原金色，字形與影片卡不重疊。768×900標題框與影片卡上下相隔20px；390×844中文18/26px、英文38px完整兩行，影片卡前留50px，各尺寸圖片載入、無水平溢出。鍵盤Enter仍可開啟原影片dialog，Escape可關閉，瀏覽器error為空；影片完整播放與OS減少動態偏好未另驗證。1024第一次取樣受先前焦點捲動38px影響，使用原回到頂端後重測正好249px；測試尺寸已還原，預覽保留。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_NTK1Bo/截圖 2026-10-11 凌晨12.51.24.png` 與 `/tmp/sakura-pavilion-hero-N3EUWq/desktop.jpg`（1280×900 CSS／1×）、`desktop-1512.jpg`於同一比較輸入，聚焦右側目標小標與249px註記，不把紅框／標註加入頁面。原英文字體／字級／字重、圖片品質／裁切、背景／遮罩色彩、圓角及影片卡版型不變；新增中文小標與標題定位依註記完成。以明確249px尺寸為準，不按簡報縮放畫布推算CSS像素。小標缺失／桌機定位不符（P2）及新增定位導致的平板遮擋（P1）均已修正；`tablet-768.jpg`、`mobile.jpg`重截確認內容可讀，本次範圍無剩餘P0／P1／P2，final result: passed。QA只維護本README，未驗證正式端／其他瀏覽器。

## 2026-10-11 品牌優勢02／03圖卡提前出現

- 依00:51:11截圖，只調整 `BrandBenefits` 的02／03循環動畫關鍵影格：02開始時間從3秒提前到0.6秒、完整顯示從3.96秒提前到1.56秒；03從6秒提前到1.2秒、完整顯示從6.96秒提前到2.16秒。01的0～0.96秒進場、每張0.96秒淡入／上移、12秒循環及92%開始退場不變，因此文字閱讀時間不會被縮短；保留原可見時啟動、減少動態靜態顯示、卡片文字、圖片、尺寸、圓角、響應式與CMS錯誤提示。
- 使用image-to-code，沿用既有CSS keyframes，不新增JS／套件或文件，不部署或寫入資料庫。同步既有前台回歸的舊時間斷言並驗證01不變／02與03新節奏；`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定前台回歸（含優勢卡原檢查區塊）、腳本語法及 `git diff --check` 通過。保留既有Tailwind sourcemap警告，未重跑完整表單／資料回歸。
- 實際1280×900動畫取樣：起始01 opacity .113、02／03=0；約0.8秒後01=1、02=.431、03=0；約1.7秒後01／02=1、03=.857；約2.4秒後三張均opacity1、transform=none，確認提前且依序出現。三卡358×601.23px、28px圓角及三張原圖載入成功、無水平溢出；390×844維持原288px單欄，02／03可完整捲動閱讀。瀏覽器error為空，減少動態以既有CSS及回歸斷言確認，未切換作業系統偏好；測試尺寸已還原，預覽保留。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_JyP51D/截圖 2026-10-11 凌晨12.51.11.png`（1776×908註記畫布、1190px內嵌頁面）與 `/tmp/sakura-benefit-timing-rAty4C/desktop.jpg`（1280×900 CSS／1×、三卡完整顯示終態）於同一比較輸入，按內嵌比例聚焦三卡，不複製紅框／右側註記。字體／字級／字重、三欄及間距／圓角／陰影、色彩、三張實景圖片品質／裁切與文案均不變；此輪只改進場節奏，靜態截圖另搭配取樣證明速度。原02／03等待3／6秒（P2）已改為0.6／1.2秒；`desktop-entry.jpg`為約2.4秒進場證據，`mobile-02.jpg`、`mobile-03.jpg`重截確認內容完整。文字細節可讀，無需另裁切，本次範圍无剩餘P0／P1／P2，final result: passed。QA僅維護本README，未驗證正式端／其他瀏覽器。

## 2026-10-11 品牌優勢家庭區塊英文標題

- 依00:51:00截圖，`/about/advantage` 的家庭區塊英文標題改為「Creating Ideal Kitchens for Every Family」；只對既有CMS舊標題做前台相容校正，其他後台自訂標題原樣顯示，不寫入或覆蓋資料庫。同步程式範例並停用此h2的capitalize，保留for的小寫；中文、說明、字型／字級、版型、家庭輪播與上一輪大圖動畫均不變。
- 沿用image-to-code、既有內容取得及前台回歸；新增舊標題校正／自訂標題保留／SSR文案與大小寫／中文說明斷言，不新增套件或文件。`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定前台回歸、腳本語法及 `git diff --check` 通過；建置保留既有Tailwind sourcemap警告，不重跑完整表單／資料回歸。
- 本機1280×900／390×844驗收：實際h2與SSR均為完整新標題，桌機維持Cal Sans 40/44px、400、#1c1c1d單行；手機30/35px、原288px安全欄位內三行且無截字／水平溢出。鍵盤Enter啟動原向下導覽可到 `#brand-family-title`，中文、說明、家庭圖片／輪播及上一輪Hero動畫保留；瀏覽器error為空。測試尺寸已還原、預覽保留，未部署或寫入資料庫，後台原始舊標題仍保留。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_mPlfgc/截圖 2026-10-11 凌晨12.51.00.png`（1954×838註記畫布、1190px內嵌頁面）與 `/tmp/sakura-family-title-UnItaf/desktop.jpg`（1280×900 CSS／1×）於同一比較輸入，聚焦紅框標題及右側指定文字，按照內嵌比例比較，不把註記加入頁面。字型／字級／字重、版型間距、色彩、原家庭圖片品質均保持；新英文文案與for小寫一致，輪播當下顯示順序差異是既有4秒自動切換，未改圖片或順序資料。文字細節清楚可讀，無需額外裁切；原單數／多餘冠詞與CSS大寫不符（P2）已修正，`mobile.jpg`重截確認完整换行，本次範圍無剩餘P0／P1／P2，final result: passed。QA只維護本README，不新增文件，未驗證正式端／其他瀏覽器。

## 2026-10-11 品牌優勢大圖接續首頁 Hero 動態

- 依 00:39:07 截圖，只在 `BrandAdvantageHero` 下方大圖的實際 img 重用首頁 `hero-kenburns`：進入可見狀態後先等待原1.25秒 opalMoveUp 進場，再執行5秒 ease-out 緩放大／向左平移並保留終態。沒有新增輪播、循環、計時器或重製素材；上方小圖、文字、原進場、圓角、尺寸、圖片載入錯誤及頁面導覽保留。
- 減少動態偏好取消新增動畫及縮放；不修改共用首頁動畫、CMS／資料庫或其他頁。沿用 image-to-code，新增既有前台回歸斷言；最終 `pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、本次限定前台／SSR回歸、腳本語法與 `git diff --check` 通過。首次SSR斷言未接受既有reveal指令重複附加的ev class，已限定接受該輸出，未更動原進場指令；保留既有Tailwind sourcemap警告，未重跑完整表單／資料回歸。
- 手機驗收發現既有最小高度260px未讓圖片填滿，會露出框底色；僅將此大圖img設為絕對定位填滿原框、保留object-cover與錯誤提示，桌機及手機圖片框尺寸／圓角不變，並增加填滿斷言。
- 本機1280×900／390×844實際取樣：進場初期外層translateY(98.10px)、opacity .019，內層保持scale1.06／x=0；約1.7秒後外層已到原位且opacity1，內層開始scale1.076／x=-8.57px，終態scale1.16／桌機x=-56.608px。桌機框1220×610、手機360×260且img同高，手機離屏時animation=none，進入視窗後才開始；小圖animation=none、圖片均載入成功、無水平溢出及露底，瀏覽器error為空。減少動態驗證為CSS／回歸斷言，未切換作業系統偏好或驗證其他瀏覽器。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_CPvrFS/截圖 2026-10-11 凌晨12.39.07.png`（1776×854註記畫布、1190px內嵌頁面）與 `/tmp/sakura-brand-hero-motion-lafwi8/desktop.jpg`（1280×900 CSS／1×）於同一比較輸入。字體／文案、版型／框距／24px圓角、色彩與UI不變；沿用同一實景照片且不重製，終態裁切是指定首頁動態的緩放大／左移，而非換圖或更改框尺寸。原缺少接續動態及手機露底（P2）均已修正；`mobile.jpg`重截確認填滿，畫面細節可讀，無需額外裁切，本次範圍無剩餘P0／P1／P2，final result: passed。僅維護本README、不新增文件；測試尺寸已還原，預覽保留，不部署或寫入資料庫。

## 2026-10-11 門市資訊到店預約 Hover 動畫

- 依 00:35:31 截圖，只調整三篇門市案例共用文章頁「門市資訊」旁的金色到店預約 CTA：預設右上箭頭，Hover／鍵盤 focus-visible 時以300ms轉成向右；金底白字、原尺寸／位置、焦點框與預約網址／新分頁安全設定保留。減少動態偏好停用轉場，不添加水波、不修改上方另一顆預約CTA、CMS或資料庫。
- 沿用 image-to-code 與現有 ArrowUpRight 圖示，不新增套件或文件；既有前台回歸補上三篇SSR、箭頭互動樣式、減少動態與兩處連結保留斷言。本次限定前台回歸、`pnpm --dir nuxt-site build`、建置後順序執行 `pnpm --dir nuxt-site typecheck`、腳本語法及 `git diff --check` 通過；建置保留既有 Tailwind sourcemap 警告，未重跑完整表單／資料回歸。
- 本機1280×900與390×844：CTA維持154×50px、Noto Sans TC 18/24px、白字與 `#CAA05C`；預設SVG transform=none、Hover及鍵盤焦點為rotate(45deg)，右上箭頭變向右，離開恢復。焦點框2px、手機無水平溢出，既有網址、`_blank`／`noopener noreferrer` 均保留；本輪沒有點開或提交外部預約，瀏覽器error為空。Google Maps既有12秒載入逾時提示在本輪可見，不隱藏錯誤、也不將此次CTA驗收誤當地圖正常；此第三方載入問題不在本次修改範圍。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_CMo2xw/截圖 2026-10-11 凌晨12.35.31.png`（1894×878註記畫布，1190px內嵌頁面）與 `/tmp/sakura-store-booking-hover-IXjK21/default.jpg`、`hover.jpg`（1280×900 CSS／1×）於同一比較輸入，聚焦指定CTA及右側互動示意，按內嵌比例比對，不把红框或兩個示意按鈕加入頁面。原固定箭頭／深色Hover（P2）改為300ms轉向且金色不變，預设及純Hover重截均符合；保持字體、圓角、尺寸、標題旁間距、原圖像與「到店預約」文案。圖片／地圖區無改動，地圖逾時另列範圍外風險；按鈕細節可讀，無需另裁切。手機焦點證據為同目錄 `mobile-focus.jpg`，本次CTA範圍無剩餘P0／P1／P2，final result: passed。QA僅維護本README，不部署、不改資料庫，未驗證正式端／其他瀏覽器；測試尺寸已還原，保留案例預覽。

## 2026-10-11 型錄列表配備型錄名稱

- 依 23:44:46 截圖，`/catalogues/catalog` 的 `kitchenware-2026` 前台顯示名稱改為「櫻花整廚廚房配備型錄」，與商品頁預覽一致；標題、封面 alt、開啟及下載 PDF 的 aria-label 都由同一展示資料產生。只複製該筆標題，不修改後台資料、封面、PDF、ID、下載檔名、其他型錄或版型。不新增套件、抽象元件或文件。
- 既有回歸腳本補上列表新名稱／舊名稱移除、無障礙操作名稱、PDF／封面／下載連結不變、其他型錄標題不變及真實 PDF 標頭斷言。初次斷言未接受 Vue SSR 的 scoped attribute，已改成讀取 strong 的文字而非精確比對開標籤。建置期間的開發SSR曾短暫回500，建置完成後重跑本次限定回歸全部通過；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、腳本語法與 `git diff --check` 通過，保留既有Tailwind sourcemap警告，未重跑全部資料／表單回歸。
- 本機1280×900與390×844：新名稱完整顯示，沿用 Noto Serif TC 20/28px、600，沒有水平溢出；封面載入成功、鍵盤焦點與操作名稱正常，下载API返回 `%PDF-` 真實PDF。瀏覽器 error 為空；測試尺寸已還原，型錄頁預覽保留。沒有點開外部PDF或測試正式端，不部署或寫入資料庫。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_WPfXsJ/截圖 2026-10-10 晚上11.44.46.png`（1292×940註記畫布，1190px內嵌頁面）與 `/tmp/sakura-catalogue-title-fpWziU/desktop.jpg`（1280×900 CSS／1×）置於同一比較輸入，按内嵌頁面比例聚焦第二張名稱；來源hover金字與完成版預設黑字是原互動狀態差異，不改色彩規則。文字清楚可讀，無需裁切；字型／字級／字重、三欄版型／間距／圓角、色彩與hover、三張封面品質均保留，文案依紅字指定的新名稱替換，不複製紅色註記。原列表與預覽不同名（P2）已修正，首次截圖舊hover尚在淡出，最終重截無殘留遮罩。手機焦點證據為同目錄 `mobile.jpg`，本次範圍無剩餘P0／P1／P2，final result: passed。QA只維護本README，不新增文件。

## 2026-10-11 廚房產品內頁型錄預覽與金色 CTA 動畫

- 依 23:44:33 截圖，商品清單／分類系列與商品詳情的型錄預覽固定使用現有整體廚房及廚房配備型錄，第二張顯示「櫻花整廚廚房配備型錄」。整張卡片可點至 `/catalogues/catalog`，保留封面、鍵盤連結語意與焦點框；只複製前台預覽標題，不更改 CMS 原標題、PDF、封面或資料庫。三品牌共用此預覽。
- 內容型 CTA 的金色箭頭圓集中使用產品型錄既有實心水波：`#CAA05C`、2秒 ease-out、opacity .55→0、scale 1→1.55；hover／鍵盤焦點／停用時停止，減少動態偏好仍關閉。影片播放鍵、首頁整顆 Start Project、商品圖片 hover 按鈕與分頁圓點不套用，不改連結、表單驗證或送出行為。沿用 image-to-code 與既有元件，不新增套件或其他文件。
- 已移除商品／建商／加盟頁各自重複的水波定義（含加盟介紹頁四個箭頭圓），統一從共用樣式繼承。既有前台回歸腳本補上三品牌／商品詳情兩張卡片、目的網址、已發布封面、CMS資料不變及共用動畫／停止／減少動態斷言。本次限定 SSR／樣式斷言、`pnpm --dir nuxt-site build`、建置後順序執行的 `pnpm --dir nuxt-site typecheck`、腳本語法與 `git diff --check` 通過；建置保留既有 Tailwind sourcemap 警告。沒有重跑完整資料／表單回歸。
- 本機 1280×900 兩張卡片各309.52px寬、30px間距，封面均成功載入；390×844 為兩張172px、16px間距，較長配備名稱自然折行、無水平溢出。滑鼠第一張／鍵盤 Enter 第二張都抵達 `/catalogues/catalog`。實測共用偽元素為實心金色、2s ease-out、無外框，opacity及縮放隨時間變化；鍵盤焦點時 animation=none／opacity=0。加盟介紹四個箭頭圓均40×40px且共用同一動畫。減少動態與停用規則由回歸斷言確認，未更改作業系統偏好或送出表單；瀏覽器 error 為空，測試尺寸已還原。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_2FA9ZM/截圖 2026-10-10 晚上11.44.33.png`（1884×980註記畫布，內嵌1190px寬頁面）與 `/tmp/sakura-catalogue-preview-3MSaAp/desktop.jpg`（1280×900 CSS／1×）放入同一比較輸入。按內嵌比例核對標題字型／階層、左文右卡的間距與版型、金色CTA、兩張實際封面及預覽文案；第二張符合來源灰白配備型錄，不新增圖片、不搬入紅色註記。維持原24px圓角與cover裁切，不改區塊尺寸；原錯誤紅色全產品封面及不可點卡片（P2）已修正。手機證據為同目錄 `mobile.jpg`，本次範圍無剩餘P0／P1／P2，final result: passed。只維護本README，不部署、不檢查正式端／其他瀏覽器、不寫入資料庫；型錄總覽原CMS名稱／PDF下載未改，動畫其他使用頁以共用樣式及來源回歸驗證、非逐頁視覺全測。

## 2026-10-11 廚房產品共用分頁樣式

- 依再次提供的 23:57:16 截圖重新核對，現有共用分頁已符合右側設計，不重複修改元件。本機1280×900第1頁為40px金色圓底、其餘黑字無框、斜向下一頁箭頭；鍵盤 Enter 下一頁到第2頁、上一頁回第1頁，40項及4頁保留、跳頁 scrollY=0，瀏覽器 error 為空。既有前台回歸前段（含第1／2／4頁、單頁、搜尋 query 與其他列表共用分頁）重跑通過。來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_E2OJOZ/截圖 2026-10-10 晚上11.57.16.png`（1866×682註記畫布）與 `/tmp/sakura-product-pagination-check-QFKx5U/desktop.jpg`（1280×900 CSS／1×）於同一比較輸入聚焦分頁，按內嵌比例核對字型、居中間距、金底白字／黑字、現有圖示及頁碼文案；產品圖與其他版型不變，不複製紅框，無本次P0／P1／P2，final result: passed。只補本README驗收記錄，未重跑手機、建置、完整表單或正式端，不部署、不改資料庫；測試尺寸還原，保留本機預覽。
- 依 23:44:09 截圖，`ProductListPage` 改用設計靈感頁既有 `InternalListPagination`：選中頁金色圓底、其他頁無框、斜向上一頁／下一頁箭頭，沿用桌機40px／手機44px控制尺寸與間距。刪除原頁碼計算、文字下一頁及橢圓外框樣式；保留 `product-pagination` class，既有路由滾動測試定位不變。
- 共用元件保留所有網址 query，搜尋條件、預覽參數與分類路徑不會因翻頁遺失；商品 API 與資料不變，單頁仍隱藏分頁。不新增套件、不修改 CMS／資料庫。首次回歸發現 NuxtLink 只比對路徑、不比對頁碼 query，把所有分頁連結錯標為目前頁面（5個）；共用元件為非當前連結設定 `aria-current-value="false"`，只由選中頁碼 span 回報目前頁面，其他使用頁的外觀／行為不變。既有前台回歸腳本補上第1／2／4頁、單頁配備、搜尋條件與首末頁箭頭，以及設計靈感／案例門市／優惠活動共用分頁斷言。搜尋翻頁測試改用實際有31筆／3頁的「除油」，原DR只有11筆／1頁，第2頁被API正確拒絕。
- `pnpm --dir nuxt-site build`、建置完成後重新執行的 `pnpm --dir nuxt-site typecheck`、本次限定SSR回歸、既有 `check-list-pagination.mjs` 與 `git diff --check` 通過。最終建置與typecheck並行時Nuxt生成檔曾短暫缺少 `#components` 型別，順序重跑後通過，不修改其他元件。工具未安裝tsx，故既有純型別工具測試改以Node22 `--experimental-strip-types` 執行，沒有新增依賴；保留既有Tailwind sourcemap及Node型別移除實驗警告。
- 本機1280×900 實測頁碼40×40px、10px間隔、0px外框，選中底色 `#CAA05C`；390×844末頁為44×44px、無水平溢出且不顯示下一頁。滑鼠下一頁抵達第2／4頁，鍵盤上一頁回第1頁，跳頁scrollY=0；搜尋「除油」Enter下一頁保留q、31筆與第2／3頁。瀏覽器error為空。商品名、價格、素材、分類篩選及單頁行為保留，未執行其他資料／表單完整回歸或原瀏覽器自動化腳本。
- image-to-code／design-qa：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_Tr5GUG/截圖 2026-10-10 晚上11.44.09.png`（1894×694，兩個860px寬縮放頁面）與 `/tmp/sakura-product-pagination-WvkCpV/desktop.jpg`（1280×900 CSS／1×）放入同一比較輸入，依嵌入頁面比例核對右側分頁，保留左側同一排產品。字體／文字沿用共用元件16px UI字體，版型居中、40px圓底與10px間距一致；色彩金底白字／非選中黑字無框一致，斜向箭頭沿用既有icon，圖片不替換。末頁手機證據為同目錄 `mobile.jpg`。沒有抄入紅色框／說明文字，原舊外框與文字CTA（P2）已修正；最終於進場opacity=1後重截，分頁清楚可讀無需另裁切，本次範圍無剩餘P0／P1／P2，final result: passed。只維護本README，未部署、未檢查正式端／其他瀏覽器，沒有寫入資料庫。

## 2026-10-11 廚房產品分類／系列篩選列

- 依 23:43:53 截圖，在共用 `ProductListPage` 僅移除有 category 的分類／系列內頁搜尋表單；保留全部產品頁與主導覽搜尋、既有 query、商品／分類資料、分頁及完整錯誤與重試。八個子分類（含「配備」）橢圓統一 144px 寬、至少 46px 高，窄螢幕自然換行，不影響分頁按鈕寬度。不改 CMS／資料庫、不新增套件或文件。
- 既有前台回歸腳本補上分類／系列 SSR 無搜尋表單、全部產品搜尋保留、配備數量／連結及分頁斷言；本次限定斷言、`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。沒有執行其他 API／表單完整回歸；僅維護本 README。
- 本機 1280×900 與 1024×768 八個按鈕均為 144×46px；修改前前七個寬 142.891px、配備僅110.891px，修改後等寬。搜尋列移除後篩選列自然上移114px，不補回空白。390×844 採兩欄、320×844 自然單欄，均無水平溢出。鍵盤 Enter 點配備實際抵達原 category/34，標題為「配備」、共8項；第二頁回報40項／第2頁，全部產品頁 Enter 搜尋 DR7396 回傳1項正確型號。瀏覽器 error 為空，預覽尺寸還原；沒有修改商品名称、數量或價格。
- image-to-code／design-qa：来源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_2CMuCp/截圖 2026-10-10 晚上11.43.53.png`（1414×874註記畫布，內嵌1190px寬頁面）與 `/tmp/sakura-product-subcategories-vvWybY/desktop.jpg`（1280×900 CSS／1×）置於同一比較輸入，按嵌入頁面比例聚焦搜尋列刪除及配備外框，沒有將「調整後」空白區或紅色註記轉為 UI。文字／字型與金色細框、透明底、商品素材及文案沿用既有設計；版型只刪除搜尋與統一篩選寬度。原搜尋仍存在／配備較短的P2已修正；最終於進場 opacity=1 後重截，控制項足夠清楚，無需另裁切。手機證據為同目錄 `mobile.jpg`，本次範圍無剩餘P0／P1／P2，final result: passed。未檢查正式端與其他瀏覽器、不部署、不寫入資料庫。

## 2026-10-10 廚房產品品牌切換列

- 依 23:43:11 截圖右側，三品牌共用 `ProductBrandPage` 將 SAKURA／SVAGO／TEKA 橢圓按鈕統一為 116×52px、20px 間距，品牌列與分類卡片左緣對齊；移除「查看全部產品／搜尋型號」CTA，品牌列上方增加 80px 留白、下方距分類卡片 30px。手機採三欄等寬縮小、12px 間距與 32px 上方留白，不換行。
- 保留品牌連結、目前品牌 aria-current、鍵盤金色焦點框、商品分類載入／完整錯誤與重試；主導覽搜尋及原 `/products/[brand]/all` 路由仍可使用。不新增素材、套件或文件，不修改 CMS／資料庫，既有回歸腳本補上三品牌 SSR 與等寬／手機規則斷言。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、本次三品牌限定 SSR／樣式回歸斷言、腳本語法及 `git diff --check` 通過。初次限定測試以 data URL 匯入整段腳本，遇到依賴相對路徑解析錯誤；改為只執行本次自包含斷言區段後通過，不改正式測試腳本執行方式。未執行其他資料／表單完整回歸，建置保留既有 Tailwind sourcemap 警告。
- 實測 768／1024／1280／1512px 三按鈕皆 116×52px，同列、等距、左緣與分類卡片一致；390×844 為三個 112×52px、12px 間隔，沒有水平溢出。1280px 分類第一卡的文件 top 維持 1045.695px，品牌列由 x=30／不等寬 115.125、102.805、91.766px 改為 x=73／等寬116px。鍵盤 Enter 切換 SAKURA／SVAGO／TEKA，當前品牌標記與文案正常，跳頁 scrollY=0；滑鼠另驗證 SVAGO，主導覽搜尋可以開啟／關閉。瀏覽器無 error，原九張 SAKURA 分類圖載入正常。
- image-to-code／design-qa 比對：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_mIXFwN/截圖 2026-10-10 晚上11.43.11.png`（2068×706，含前後縮放頁面與紅色註記），與 `/tmp/sakura-product-brands-zah33o/desktop.jpg`（1280×900 CSS／1×）置於同一比較輸入，聚焦來源右側「調整後」品牌列及第一排分類卡片；另檢查 `mobile.jpg`（390×844／1×）。來源為約 860px 寬的縮放頁面，不把整張註記畫布當網站尺寸，依比例核對 116×52px 橢圓、20px 間距、下方30px空隙及卡片左緣；不複製註記或截圖中的錯誤選取品牌狀態。
- 字體／文案：品牌列沿用既有字體與品牌名稱，統一 14px 居中不折行；間距／版型：修正原不等寬、左緣錯位及多餘 CTA（P2），分類卡片位置／圓角維持。色彩：保留 `#CAA05C` 細金框，預設透明、当前深字、Hover／鍵盤金底白字；圖像：不生成、更換或裁切商品素材。修改後重截比對無本次範圍 P0／P1／P2，final result: passed。QA 僅維護本 README，不建立其他文件。
- 驗收範圍為三品牌分類入口的切換列，非所有系列商品清單；不修改先前 R3750B 名稱、CMS／資料庫，不部署。測試尺寸已還原，保留本機產品頁預覽；未檢查正式端、其他瀏覽器或完整搜尋結果流程。

## 2026-10-10 首頁品牌輪播貼齊浮標

- 依 22:50:47 截圖，將首頁 `HomeProject` 輪播外層從文字共用的 64px 安全距離分離，桌機 ≥1024px 改為 40px，圖片裁切邊緣貼齊固定品牌浮標右緣，移除 24px 空隙。標題／內文保留 64px，其他 section、手機／平板、抽屜及內頁不變；使用 frontend-design 沿用現有版型，不改 CMS／資料庫或圖片。
- 既有前台回歸腳本補上輪播 40px 與文字 64px 分離斷言，本次限定浮標／Hero 斷言、`pnpm --dir nuxt-site build` 及 `git diff --check` 通過；保留既有 Tailwind sourcemap 警告。未重跑完整前台 API／表單腳本，本次未修改 TS／Vue。
- 本機 1024×768、1280×900、1512×982 實量浮標右緣與輪播左緣均為 40px，間隔為 0；標題 padding-left=64px。768×900／390×844 浮標隱藏、輪播左緣=0，標題仍為原 30px／15px，各尺寸無水平溢出，瀏覽器無 error。截圖：`/tmp/sakura-home-rail-flush-8GanH0/desktop.jpg`；測試尺寸已還原，預覽留於首頁輪播區。未部署、未改資料庫、未檢查其他瀏覽器，僅維護本 README。

## 2026-10-10 巧域／BASIC+ 白色色卡外框

- 依 22:50:00 截圖，在共用 `KitchenSeriesPage` 將巧域 `D8410 雪絨白` 套用既有 1px `#e3e3e8` 白色色卡框；AI Kitchen `D0032` 原框保留。BASIC+ `K540D 瓷白` 的灰框經原圖確認為 JPG 自帶，不是 CSS；只以既有 `scale(1.012)`／overflow 裁去極外緣，不重製圖片或改板材顏色。
- 僅處理指定系列／色號，其他色卡、圓角、尺寸、文字框、Hover、CTA 與資料保留，不更新 CMS／資料庫或安裝套件。使用 frontend-design 沿用現有版型。既有系列回歸腳本補上十系列 SSR 外框／無框範圍及裁邊斷言。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`pnpm --dir nuxt-site exec node scripts/check-kitchen-series.mjs`（十系列 SSR／404／215 張來源與本次外框斷言）及 `git diff --check` 通過；保留既有 Tailwind sourcemap 警告。1280×900 實看 BASIC+ 瓷白無圖片灰框、巧域雪絨白有 1px 淡灰框；390×844 兩頁卡片均為 173×173px、正確框線與裁邊、圖片載入、無水平溢出，無瀏覽器 error。
- 截圖：`/tmp/sakura-white-finishes-twSkO8/basic-plus.jpg`、`clever.jpg`。第一次重新載入截圖遇進場動畫未完成，已重拍完成画面。測試尺寸已還原，預覽留於巧域板材區。未部署、未檢查其他瀏覽器／正式端；若將來 K540D 改成無框原圖，仍會裁去 0.6% 四邊，屆時可移除此規則。僅維護本 README。

## 2026-10-10 全品牌系列推薦廚電去背

- 依 22:49:49 截圖盤點十個系列的已發布推薦廚電：AI Kitchen 六張既有透明圖保留，其他系列共九個仍有白底的來源；同款跨系列只處理一次。優先重用對應產品現有透明素材，其餘使用 imagegen 內建工具對原開版圖片進行 background-extraction，不換型號、不改名稱或連結。
- 新增 `public/section-1/brand-series/equipment-cutouts/` 九張透明 PNG：EG2350GB 重用 Joyful 原廠透明圖；G2112G、R605、EG2501GC、Q7585BL、DR7397XL、Q7693、DR7790A、G2932AG 使用各型號原開版圖去背。提示要求只移除白底、保留輪廓、控制介面、標誌、材質、視角、比例與原構圖，不新增陰影／物件；生成圖並非逐像素相同的原始產品照，細小標誌仍需品牌最終核稿。
- 共用 `KitchenSeriesPage` 僅替換九個已知舊網址（`kitchenEquipmentCutouts.ts`），原圖及 CMS 原資料保留；其他來源含未來後台新圖不變。既有 `check-kitchen-series.mjs` 加入九圖透明通道／非空白及新 CMS 網址保留斷言；`--cutouts` 讀取已發布十系列逐張驗證透明與 SSR 對應。正在進行建置與瀏覽器驗證。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`pnpm --dir nuxt-site exec node scripts/check-kitchen-series.mjs --cutouts` 與 `git diff --check` 通過。讀取本機已發布十系列 45 個廚電位置、29 個不同來源皆含真正透明背景，SSR 對應正確，另保留十系列／404／215 張來源、輪播與鍵盤回歸；建置保留既有 Tailwind sourcemap 警告。
- 1280×900 實看 Clever、Basic+、Loft Chic：白色矩形底消失，全部圖片載入，無水平溢出，Loft Chic 新圖 Hover 淡化約 0.6、文字=1、原外連與安全 rel 保留。390×844 Clever 五張載入、opacity=1、無水平溢出，瀏覽器無 error。既有右侧懸浮服務列會覆蓋最右部分內容，本次不擴大調整該共用版面。第一次 Basic+ 截圖遇到進場動畫未結束，已重拍完成畫面。
- 截圖：`/tmp/sakura-equipment-cutouts-IYjPXw/clever-desktop.jpg`、`basic-plus.jpg`、`loft-hover.jpg`、`clever-mobile.jpg`。尺寸已還原，預覽留於 Clever 廚電區塊。去背素材以新檔案保存，不覆蓋原圖、不更新 CMS／資料庫或整份系列資料；原 Hover、尺寸、箭頭、錯誤顯示保留。未部署、未重新檢查正式端／其他瀏覽器，產品細小標誌需原廠素材核稿；僅維護本 README。

## 2026-10-10 推薦廚電圖片 Hover 淡化

- 依 22:49 截圖，在十個系列共用推薦廚電卡片加入 350ms 圖片淡化：可點擊圖片 Hover／鍵盤 focus-visible 時 opacity=0.6，移開後恢復；只作用於實際 img，不影響文字、中央金色箭頭、圖片錯誤提示、尺寸與原連結。沿用 frontend-design 的現有版型微互動，不新增素材或套件。
- Hover 限 ≥768px 且可懸停的精準指標，手機圖片保持清晰，不產生觸控黏住的淡化；減少動態偏好停用轉場。既有系列回歸腳本補上圖片專屬淡化、觸控／鍵盤及減少動態效果斷言。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`pnpm --dir nuxt-site exec node scripts/check-kitchen-series.mjs`（十系列 SSR、404、215 張圖片來源、動畫／鍵盤及本次斷言）與 `git diff --check` 通過；建置保留既有 Tailwind sourcemap 警告。
- 本機 1280×900 AI Kitchen 實際 Hover：P0531 圖片 opacity=0.6、箭頭／文字=1、轉場=350ms；移開恢復 opacity=1，Tab 鍵盤焦點同樣為 0.6 並保留焦點框。390×844 六張圖片皆已載入、opacity=1、箭頭=1，無水平溢出；Enter 實際抵達原 `/products/sakura`。Loft Chic 同款 Hover 生效，文字清晰、原外連 `_blank`／`noopener noreferrer` 保留，期間無新增瀏覽器 error。
- 截圖：`/tmp/sakura-equipment-fade-5OmsGu/hover-final.jpg`、`loft-hover.jpg`、`mobile.jpg`。第一次 Hover 測試拖曳文字產生藍色選取，已取消選取後重拍；最終截圖非該選取狀態。測試尺寸還原，預覽留於 Loft Chic 推薦廚電；未部署、不改 CMS／資料庫，未測其他瀏覽器或實際切換 OS 減少動態偏好（僅檢查 CSS 與回歸斷言），僅維護本 README。

## 2026-10-10 加盟選單小箭頭展開

- 依 22:47 最新說明，桌機「我要加盟」先顯示原四項；底下加 16px 向下箭頭（44px 點擊範圍），點擊才在同一選單下方展開「加盟申請表單／加盟資料下載」，再次點擊收合。手機同樣採額外展開，不是兩項各自新增子選單；原字體、寬度及連結保留。
- 依原 CMS 連結識別額外兩項，不硬切前四筆或覆寫後台資料；切換／關閉主選單後重設收合。支援鍵盤 Enter／Space、焦點提示與 aria-expanded，隱藏連結不進入鍵盤焦點。既有回歸腳本補上 CMS 原四項／額外兩項分組、順序改變、其他選單及空清單的斷言，以及桌機／手機的展開控制與重設檢查。僅調整共用 Header、既有回歸腳本及本 README，不新增套件、不修改 CMS／資料庫。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、本次限定加盟選單回歸斷言、腳本語法及 `git diff --check` 通過；建置保留既有 Tailwind sourcemap 警告。1280×900 選單收合為 190×238px、展開為 190×326px，原四項保留、額外兩項在同一白色外框下方出現，寬度不變；Enter 展開、Space 收合、Tab 選取表單連結、Escape／切換主選單後重設均正常。
- 390×844 手機原兩項隱藏，點小箭頭後出現，Enter／Space 及跳頁後重設收合正常，無水平溢出；實際點選抵達 `/franchising/download` 與 `/franchising/form`，主選單自動關閉，不送出表單或改動資料。建置觸發本機重新整理後重做鍵盤驗證通過，驗證期間無新增瀏覽器 error。截圖：`/tmp/sakura-franchise-dropdown-F5cpRo/final.jpg`、`expanded.jpg`、`mobile-expanded.jpg`；測試尺寸還原，未部署、未重跑完整表單／API 回歸或檢查正式端。

## 2026-10-10 品牌系列 Hero 位置對齊首頁

- 依 22:42 截圖調整十個系列共用的 `KitchenSeriesPage`：標題沿用首頁 `hero-template-top` 的定位與 24px 下移／50px 標籤保留空間，保留各系列名稱及原文字動畫；抽屜浮標以 40×144px 按鈕置中，不再依整個選單面板高度置中。展開時標題同首頁右移，收合選單不進入鍵盤焦點；1024px 起顯示浮標，較小尺寸隱藏。CTA 與 Hero 下方介紹列保留原佔位，不改圖片、名稱、輪播、套系、板材及電器資料。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、本次限定的 Hero 定位回歸斷言、腳本語法與 `git diff --check` 通過。1512×982 實際逐頁確認十個系列：標題 top=318px、浮標 top=419px／40×144px、CTA top=446px，標題不撞 CTA，無水平溢出。相較修正前，標題由 174px 下移至首頁的 318px，浮標由 290px 下移至首頁的 419px，CTA 位置維持不變。
- 1024×768、1280×900、1920×1080、768×900、390×844 分別比較首頁與 Loft Chic：標題垂直位置一致，≥1024px 浮標位置一致；小尺寸浮標隱藏，手機標題保留右側服務列安全距離，各尺寸無水平溢出且標題不碰 CTA。Enter 展開抽屜正常，點君璽連結實際抵達 `/home-style/premium`、scrollY=0、抽屜收合。Loft Chic 桌機／手機 Hero 圖片均完整載入，驗證期間無新增瀏覽器 error，測試尺寸已還原，預覽保留於 Loft Chic。
- 截圖：`/tmp/sakura-series-hero-Psys3l/final.jpg`（1512×982）與 `mobile-final.jpg`（390×844）；初次手機截圖落在進場／淡出時段，已於標題 opacity>0.99、圖片載入後重截。不新增套件、不修改 CMS／資料庫、不部署；未重跑完整 API／表單回歸或檢查正式端，僅維護本 README。

## 2026-10-10 Footer 均分與展板對齊

- 依 21:41 截圖調整全站 Footer：桌機網站地圖六欄起點等距，合作專區文字右緣對齊上方數位展板 icon 右緣。沿用既有 Header／Footer 對齊量測、resize 與字體載入機制，展開網站地圖後重新計算欄距；手機兩欄、平板三欄不變。不改字體、文案、圖片、連結與 CMS，不寫入資料庫、不部署。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、Footer 限定回歸斷言、腳本語法及 `git diff --check` 通過。首頁實測 1024／1280／1512／1920px：六欄起點等距，合作專區與 icon 右緣誤差 ≤0.032px，均無水平溢出。768px 保留三欄、390px 保留兩欄且沒有水平溢出；廚房裝修指南頁 1512px 誤差 0.008px，收合後重開正常。重新導覽後瀏覽器沒有新增 error，已還原視窗尺寸並保留首頁 Footer 預覽。
- 截圖：`/tmp/sakura-footer-align-I2nEKt/final.jpg`、`desktop-1512.jpg` 與 `mobile.jpg`。保留原字體、17px 金色標題、連結文案、底圖與手機欄數；原本 1512px 最後一欄文字比展板右緣偏左 56px，現在依實際 Header 錨點與文字寬度重新計算，避免僅在特定寬度巧合對齊。只維護本 README，不新增文件；未重跑完整資料／表單回歸、未檢查正式端或其他瀏覽器，未部署。

## 2026-10-10 主導覽品牌館名稱再次確認

- 依 21:39 截圖確認指定名稱為「櫻花集團品牌館」，網址仍為 `/about/exhibition`。本機已發布 CMS Header revision 5 與程式範例均為正確名稱，沒有未發布草稿；既有本機修正指令（未加 `--apply`）輸出 `UNCHANGED`，本輪沒有重複寫入或新增 CMS 版本。
- 回歸腳本補上已發布 Header 的品牌館入口唯一性及文案檢查，避免只核對程式範例卻漏掉 CMS；不修改選單寬度、字體、連結與其他導覽。雲端 CMS 唯讀連線在 15 秒內逾時（`ETIMEOUT`），本輪無法確認正式端最新文字，不把 10 月 3 日舊檢查結果當成今天狀態；不擅自整份同步 Header、不覆寫正式資料、不部署。
- 本機已發布內容 API 的限定回歸斷言、腳本語法及 `git diff --check` 通過；1280×900 桌機展開選單與 390×844 手機展開選單均顯示新名稱，連結仍為 `/about/exhibition`。手機點選實際抵達品牌館頁、選單收合且 scrollY=0，瀏覽器 error 為空；已還原視窗尺寸並保留首頁預覽。手機文字驗證截圖：`/tmp/sakura-pavilion-name-cfjUbl/mobile.jpg`。本輪僅補測試及本文件，沒有修改 Vue 元件；未重跑全套回歸、型別檢查或建置，正式端仍未驗證。

## 2026-10-10 首頁左側品牌浮標安全距離

- 依 21:38 截圖修正首頁「品牌系列」固定浮標遮住品牌承諾與設計案例文字。桌機 ≥1024px 為首頁文字／輪播內容保留至少 64px 左側距離（40px 浮標加 24px 間隔），涵蓋風格列、品牌系列、廚房產品、設計案例、品牌承諾、門市及 Footer；Hero 下方 CTA 也移出浮標範圍。只調整內容安全距離，背景仍滿版，保留字型、文案、圖像、浮標位置、選單與輪播功能。
- 使用現有全站版型的首頁路由條件與集中式響應 CSS，不增加套件、偵測碰撞程式或新的文件；手機／平板 <1024px 與其他路由不套用。未修改 CMS／資料庫、未部署；新增限定首頁與桌機斷點及各內容容器的回歸斷言。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、本次限定的浮標安全距離斷言及 `git diff --check` 通過。瀏覽器實測 1024×768、1280×900、1512×982：浮標仍為 40px，品牌承諾／設計案例／廚房產品內容左界 ≥64px；1280px 品牌輪播實際 viewport 與兩組跑馬燈內容左界為 64px，背景 section 左界仍為 0；設計案例定位時標題、小標與 CTA 不與浮標相交。1512px Footer 開啟網站地圖後首欄左界 115px、無水平溢出。1023×768／390×844 浮標仍隱藏，品牌承諾左界仍為原 30px／15px，輪播沒有新增左內距，各尺寸均無水平溢出。滑鼠展開與鍵盤 Enter 展開／收合正常，十個品牌連結保留，Enter 實際抵達 `/home-style/premium`、scrollY=0，該頁不含首頁安全距離 class、Footer 仍為原 30px 內距。本輪瀏覽器 error 為空，測試尺寸已還原，預覽留在首頁。
- 截圖 QA：來源「截圖 2026-10-10 晚上9.38.47.png」（2038×696，兩個縮放頁面與註記）與 `/tmp/sakura-brand-rail-wwOxKj/brand-promise.jpg`、`gallery.jpg`（1280×900／1×）放入同一比較輸入，聚焦各畫面左側浮標與文字；另比對 `desktop-1024.jpg`、`mobile-final.jpg`、`project.jpg`、`products.jpg`，檢查 `footer-1512.jpg`。初始品牌承諾內容 x=30、浮標占 x=0–40，遮住文字（P1）；改成至少 x=64 後重截，與浮標相隔 ≥24px。保留字型、字重、色碼、圓角、原照片與 CMS 文案；只有內容間距及其自然換行調整，背景仍滿版，案例照片差異是既有自動輪播狀態，不是更換素材。初次手機截圖落在 reveal 進場，已在 opacity=1／visible 後重截；本次左側浮標範圍無剩餘 P0／P1／P2，final result: passed。使用 image-to-code／design-qa 比對流程，依專案規則只記錄本 README，不建立其他文件。
- 驗收界線：只修首頁收合中的左側浮標；主動展開品牌選單時仍沿用原抽屜覆蓋行為。手機右側快速服務列仍可能蓋住標題，是既有、另列的 UI 問題，本次沒有調整；不宣稱全站所有浮動元件皆不遮字。未重跑完整資料 API／表單回歸、未檢查正式端或其他瀏覽器。

## 2026-10-10 首頁門市卡片選取色

- 依 21:35 截圖「選定門市後才變金色底」，將正常卡面與三種翻牌過場的金底條件改為已手動選取且 ID 相符，不再用地圖預設門市作為已選取狀態；未點選、自動翻牌或剛切換區域／城市時四卡都維持白底。沿用現有 `focused`／`selected` 狀態，點選後仍鎖定該卡、更新地圖，其他卡繼續翻牌，新增 `aria-pressed` 同步選取狀態。
- 區域與城市變更直接取消選取；修正原本只監看篩選結果 ID、導致「中部 → 臺中市」結果相同時金底殘留的邊界情況。保留字型、尺寸、翻牌間隔與地圖，不修改 CMS／資料庫、不新增套件、不部署；回歸腳本補上四個卡面守衛、選取 ARIA 與篩選變更檢查。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、門市區域限定的回歸斷言及 `git diff --check` 通過。本機 1280×900 實測初始／自動翻牌／僅鍵盤聚焦皆四卡白底；滑鼠點選或 Enter 後只有該卡為 `#CAA05C` 金底、地圖更新，已選卡鎖定且其他卡繼續翻牌。切換區域與城市皆取消選取，包含篩選前後 ID 相同的情況；南部無資料提示正常。390×844 手機重測選取與同結果城市切換，卡片 282×122px、沒有水平溢出，本輪瀏覽器 error 為空。未重跑涉及資料 API／表單的完整回歸套件，未檢查正式端、CMS 或其他瀏覽器。
- 截圖 QA：来源「截圖 2026-10-10 晚上9.35.39.png」與 `/tmp/sakura-store-selection-rYO6dL/default.jpg`、`selected-final.jpg`（1280×900／1×）及 `mobile-selected.jpg`（390×844／1×）放入同一比較輸入；另存 `mobile-default.jpg` 與 `filter-reset.jpg`。只核對門市選取色：保留標題／卡片字型、尺寸與間距、原地圖及門市文案，選取金底白字與 ARIA 狀態一致。驗收中發現篩選結果相同時舊選取殘留（P2），補直接監看區域／城市後已重測通過；本次範圍沒有剩餘 P0／P1／P2，final result: passed。已還原測試視窗尺寸，預覽保持啟動，QA 僅維護本 README。

## 2026-10-10 首頁集團品牌跑馬燈 Logo 放大

- 依 21:33 截圖標註，首頁廚房產品下方跑馬燈的 SAKURA KITCHEN 長條 Logo 由 170px 放大至 266px（約 1.56 倍），保留 SVG 原比例、置中及每格 310×50px；該格左右內距由 70px 改為 22px，其他三品牌大小與位置不變。五組循環都套用，不修改 Header Logo、原連結 `/home-style/aikitchen`、跑馬燈速度或 Hover 行為。
- 只修改 `LogoMarquee.vue` 與本 README，不新增素材或套件、不修改 CMS／資料庫、未部署。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過。1280×900 桌機及 390×844 手機均實測五張重複 Logo 為 266×21.03px、圖片載入正常，其他 Logo 維持 170px 寬，每格 310px 不變、沒有相鄰重疊或水平溢出。輪播仍為 12.8s linear infinite，兩次手機觀察位移持續變化、play-state 為 running；本次未新增暫停條件。鍵盤 Enter 實際抵達 `/home-style/aikitchen`、scrollY=0，本輪瀏覽器 error 為空；未執行正式環境、後台或其他瀏覽器驗收。
- 截圖 QA：來源「截圖 2026-10-10 晚上9.33.35.png」（1646×854，含縮放截圖及註記）与 `/tmp/sakura-marquee-logo-ctJjsS/desktop.jpg`（1280×900／1×）放入同一比較輸入，聚焦底部品牌列，另檢查 `mobile.jpg`、`mobile-final.jpg`（390×844／1×）。保留原 SVG 字形／色彩／比例與品牌名稱，不換字型、拉伸、重畫或更動卡片；維持垂直中心、原格距及白色 Logo，放大後長條 Logo 的視覺份量與左右品牌接近。來源沒有指定等高像素，因此以視覺份量校正而非強制四品牌同高；不將跑馬燈正常進出邊界誤判為圖片裁切錯誤。此 Logo 範圍無 P0／P1／P2，final result: passed；QA 僅維護本 README，測試尺寸已還原，預覽保持啟動。

## 2026-10-10 主導覽型錄 CTA（PPT 第 1 頁）

- 依 10 月 8 日版面調整簡報第一頁，主導覽「廚房商品型錄」維持灰框深字橢圓，預設箭頭朝右上；Hover／鍵盤 focus-visible 轉為 `#CAA05C` 金底白字、箭頭轉向右方，轉場 300ms。減少動態偏好停用轉場，保留原 52px 高度、尺寸、選單排版與 `/catalogues/catalog` 連結。
- 只調整 `SiteHeader.vue` 與本 README，沿用既有圖示與樣式，不新增套件、不更改其他 CTA、CMS 或資料庫，未部署。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過。
- 本機瀏覽器 1280×900 實測：按鈕 200×52px、手指游標，預設透明背景／灰框 `rgb(193,193,196)`／深字、箭頭 -45deg；實際 Hover 為 `rgb(202,160,92)` 金底白字、箭頭 0deg。鍵盤 focus-visible 同款且保留 2px 金色焦點框，Enter 到 `/catalogues/catalog`、scrollY=0。390×844 手機原選單與型錄連結正常、點擊後關閉選單，無水平溢出。本輪瀏覽器 error 為空；未測其他瀏覽器、未執行正式環境或後台資料驗收。
- 截圖 QA：來源「截圖 2026-10-10 晚上8.52.14.png」（1938×838，含縮放頁面與註記）與 `/tmp/sakura-header-cta-FSuIfl/default-final.jpg`、`hover-final.jpg`（1280×550，1280×900 CSS 視窗局部／1×）及 `mobile.jpg`（390×844／1×）置於同一比較輸入。只核對主導覽 CTA，不複製紅框、註記或還原其他舊版內容；字型與 14px 字級、原 52px 高度／間距／圓角、指定色碼、三品牌真實圖像與「廚房商品型錄」文案維持一致，預設與 Hover 箭頭方向符合示意，無 P0／P1／P2，final result: passed。初次截圖位於選單進場轉場、右鍵文字選取階段，已在穩定狀態重新截圖；QA 僅記錄本 README、不建立其他文件，預覽保持啟動，測試尺寸已還原。

## 2026-10-03 正式 CMS 再次唯讀檢查

- 14:30 左右（台灣時間）重新核對 `sakura-demo-vanlantech.com` 與 `header-design-two.vercel.app`，皆指向同一 Production 部署 `dpl_FXy7UHoxsb36ZcBcMWuotj4ha6FE`，READY、建立於 2026-10-03 14:22:43。正式 `/news/activities` SSR 200，含本次新增 `news-category-nav` 與原優惠活動分頁。不能沿用前一輪「本機未部署」或 10 月 2 日舊部署 ID 判斷目前狀態；本輪未部署、未同步或改環境設定。Vercel connector 的 projectId／idOrName 驗證規則衝突，改用既有已登入 CLI 唯讀 inspect／logs，不移除任何存取保護。
- 兩網域未通過提案入口時 `/admin` 302 至 `/preview-access`、內容 API 401，屬預期保護；通過既有提案入口後 `/admin` 302 至 `/admin/login`、登入頁 200。瀏覽器已實際看到 CMS 電子郵件／密碼表單，沒有 console error，截圖 `/tmp/sakura-production-admin-A2htdc/login.jpg`。未嘗試猜測、重設或更換管理員密碼；已請使用者在正式頁登入，登入後的內容／媒體／權限／收件 UI 與儲存、發布、上傳尚未重新驗收，不能宣稱後台全部操作已通過。
- 雲端 `SakuraWebsiteTest` 直接 TLS 唯讀連線成功。65 份文件／123 筆歷史版本／299 份素材及 SQL bytes／33 筆稽核記錄；版本歸屬失聯 0、草稿與已發布本文差異 0、版本或 schema JSON 無效 0、素材引用失聯 0、素材 bytes 遺失／大小或 SHA-256 不符 0。1 個啟用 admin、3 個既有停用驗收帳號，啟用管理員沒有強制改密碼旗標；不輸出密碼雜湊、session、CSRF 或私人資料。收件及留言各 0，不送測試表單。本輪資料狀態與 10 月 2 日同步後記錄一致。
- 五張 DesignCloud 來源表維持 25／46／200／182／200，來源商品 879。兩網域各 65 個已發布內容 API 全部 200；正式設計靈感 filters 與 cases 200，案例總數 28、首頁 9，非法 page=0 為預期 400。SAKURA／SVAGO／TEKA 商品 items API 200、總数 749／60／38。新型錄封面與 PDF HTTP 200、類型與長度正確（68,882／15,529,327 bytes）；HTTP 僅查可讀，不重複下載整份 PDF，完整素材雜湊於 SQL 核對。
- **最新 Header／Footer CMS 內容尚未同步。** 正式已發布 revision 皆為 1，本機 Header 為 5、Footer 為 3，已發布本文直接比對不相同。這是環境內容差異，不是資料損壞；部署程式不會自動把本機 CMS 版本發布到雲端。本輪沒有整庫還原、seed、import、同步、發布或任何資料覆蓋。若要同步必須另行確認指定內容並保留正式舊版本、帳號與收件。
- 正式部署最近 1 小時 error 等級日誌查詢 0（僅當次查詢，不保證長期沒有錯誤）。第一次瀏覽器入口切換快照曾等待逾時，再次觀察已正常進入登入頁，未把一次工具快照逾時列為服務故障。初次本機比對漏用 CMS 資料庫預設回退、誤连 master 後 SELECT 回 `Invalid object name cms.Documents`，改以明確 `SakuraWebsiteDev` 重新查詢成功；沒有資料庫變更，不誤報為正式庫缺表。
- 依 qa-only 的報告流程只檢查，不修程式；因本專案規則，報告僅保留本 README、不建立其他 `.md`，瀏覽器採既有 CUA、不安裝工具、不新增遙測或同步設定。結論：正式部署、資料庫、已發布內容讀取及素材可用；**登入後管理操作尚待使用者登入實測，完整後台驗收為待確認**。未給未測功能虛構健康分數，未更動正式資料。

## 2026-10-03 優惠消息分類與間距（PPT 第 12 頁）

- 優惠活動、最新消息、媒體影音三個列表新增共用分類導覽，沿用文章內頁下方分類樣式：14px 中文、15px 相機／圖片／影音圖示、灰框圓角，當前分類金底白字；保留 Hover、手指游標、鍵盤焦點與減少動態支援。導向既有三個列表路由，切換時移除 page、保留其他 query（包含 CMS 預覽），依既有路由規則從頂端開始。
- Hero 到分類列上方間距由桌機 100px 增為 130px、平板 80px 增為 100px、手機 60px 增為 80px；分類與卡片間距桌機／平板 30px、手機 24px。手機按鈕至少 44px 高、窄版可換行。不修改 Hero、文章照片／文案／後台資料、麵包屑、卡片、既有分頁與底部間距；不新增套件、不寫入 CMS／資料庫、未部署。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`node --experimental-strip-types nuxt-site/scripts/check-list-pagination.mjs`、`git diff --check` 通過。系統 Node 22.14 直接執行含 TS import 的測試會報 `ERR_UNKNOWN_FILE_EXTENSION`，需指定 strip-types，未新增套件；正式建置保留既有 Tailwind sourcemap 警告。桌機實際依序點擊最新消息、鍵盤 Enter 切換媒體影音、回優惠活動，手機亦正常切換，當前分類正確且完成跳轉後 scrollY=0；`?page=1&qa=categories` 切換後移除 page、保留 qa。三分類各三篇資料、原分頁 1 與固定麵包屑維持正常，照片載入成功，本輪瀏覽器 error 為空。
- 響應式：1280×900 桌機分類列與 Hero 間距 130px／卡片間距 30px；768×1024 平板為 100px／30px；390×844 手機 80px／24px、三顆按鈕同列且各 108×44px，320×844 窄版自然換為兩列。各尺寸無水平溢出，平板分類按鈕中心命中正確連結、不被服務列遮住。鍵盤焦點為 2px 金色外框；既有右侧懸浮服務列覆蓋部分平板卡片文字屬原版面，非本次新增分類列影響，未擴大修改範圍。
- 截圖 QA：來源「截圖 2026-10-03 下午2.12.21.png」（1304×608，含三頁縮放截圖與註記）及 `/tmp/sakura-news-categories-qwtFIM/desktop-activities.jpg`、`desktop-latest.jpg`（1280×900／1×）、`tablet-activities.jpg`（768×1024／1×）、`mobile-latest.jpg`（390×844／1×）、`mobile-320.jpg`（320×844／1×）放入同一比較輸入；只比對指定分類列與增加間距，不將來源舊卡片、Footer、紅框做成新內容。聚焦分類字型／14px 字級與 15px 圖示、灰框與金色選中、左側對齊與上下留白、真實照片及指定三分類文案；另存 `desktop-video.jpg`、`desktop-focus.jpg`、`mobile-video.jpg`。新增分類與間距範圍無 P0／P1／P2，final result: passed。QA 只維護本 README，不新增文件；測試尺寸還原、本機預覽保留，未部署。

## 2026-10-03 門市案例到店預約（PPT 第 11 頁）

- 依第 11 頁指定位置，三篇門市案例共用文章頁於「門市資訊」標題旁新增金色橢圓「到店預約」CTA，50px 高、18px 中文、白色右上箭頭；窄版可換行，保留滑鼠手指、Hover、鍵盤 focus-visible 與減少動態偏好。
- 依圖中明確網址導向 `https://www.sakura-kitchenlife.com.tw/measuring`，`target="_blank"`／`rel="noopener noreferrer"` 另開分頁。實際點擊確認此網址會轉至櫻花 iCare 會員登入頁，原案例分頁保留；不自行換成其他短網址。未登入、未提交預約資料，登入後流程非本次驗證範圍，測試外網分頁已關閉。原側欄頂端預約 CTA（`https://pse.is/9kq37z`）、照片、規格、門市資料、地圖、前後篇及推薦文章皆不改；不寫入 CMS／資料庫、不新增套件或其他文件、未部署。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過，保留既有 Tailwind sourcemap 建置警告。安康／承德／松竹三篇案例均顯示新 CTA 與指定網址。1440×900 桌機、768×1024 平板、390×844／320×844 手機的 CTA 均為 154×50px、18px 中文、22px 圖示，標題與按鈕同列垂直置中、間距 16px，無水平溢出；按鈕中心與箭頭點擊位置均落在正確連結，沒有被服務列遮擋。Tab／Shift+Tab 可選取按鈕，焦點具金色外框，滑鼠點擊已驗證另開新分頁；本輪正常瀏覽器 error 紀錄為空。
- 截圖 QA：來源「截圖 2026-10-03 下午2.00.57.png」（1954×922，含註記與縮放截圖）及 `/tmp/sakura-store-cta-b1RS4U/desktop-final.jpg`（1440×900／1×）、`tablet.jpg`（768×1024／1×）、`mobile-final.jpg`（390×844／1×）放入同一比較輸入，聚焦指定標題旁位置與右側獨立 CTA 樣式示意；金色橢圓、中文白字與右上箭頭符合指定，沿用現有字型與品牌金色，不還原來源舊圖片或更動文章排版。另存 `desktop-focus.jpg`、`mobile-320-focus.jpg`。字體／文案、間距／對齊、色彩、原圖品質與鍵盤／新分頁操作已核對，指定 CTA 範圍無 P0／P1／P2，final result: passed。QA 僅記錄本 README，測試尺寸還原、本機預覽保留，未部署。

## 2026-10-03 列表分頁（PPT 第 10 頁）

- 依 `2026.10.02-版面調整(0.0~6.0單元).pptx` 第 10 頁，設計靈感、案例門市、優惠活動、媒體影音及最新消息共用 `InternalListPagination`，參照原 Antra Projects 01 的 40px 圓形頁碼、16px 字級、10px 間距、置中、上方 41px 留白，當頁金底白字，前後頁斜箭頭。四個原缺少分頁的列表補上唯讀每頁 9 筆分頁；單頁顯示「1」，零結果不顯示分頁，未存在的頁面不做假連結。手機上方留白 30px、觸控區 44px，原卡片及素材保留。
- 分頁以網址 page 切換，保留篩選與預覽 query、回第一頁移除 page；案例門市改變區域／縣市時重設第一頁。新 CMS 列表參數不合法回第一頁，超出頁碼採末頁；既有設計靈感 API 的錯誤及載入／重試狀態不變。中央 router 捲動規則新增上述五頁的 page 變更，沿用全站頂端定位與停止慣性，不影響產品分頁及 hash 區塊連結。
- 列表桌機底部留白統一採設計靈感／範本的 130px，手機沿用 60px；不修改 CMS、資料庫、資料順序、標題、麵包屑或詳情頁，不新增套件或其他文件，不部署。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 通過，保留既有 Tailwind sourcemap 警告。`pnpm --dir nuxt-site exec node --experimental-strip-types scripts/check-list-pagination.mjs` 驗證合成 25 筆分成 9／9／7，無遺漏／重複、單頁／空列表、非法及越界頁碼、100 頁省略顯示均通過；測試不寫入 CMS。實際設計靈感 28 筆（保留原三篇門市案例）為 9／9／9／1 筆，末頁沒有下一頁；其餘四頁現有各三筆，顯示單頁「1」，未以假資料製造額外頁碼，因此這四頁多頁操作以純函式測試覆蓋。
- 瀏覽器驗證：1280×900 桌機頁碼 40×40px／16px／gap 10px／上方 41px，768×1024 平板維持同規格，390×844 手機觸控區 44×44px／上方 30px，均無水平溢出。桌機從底部點第 2 頁、手機從第 4 頁點第 3 頁、平板以 Tab／Shift+Tab 選取頁碼後 Enter 換頁，均確認 scrollY=0；鍵盤焦點有金色外框。現代風篩選仍為七筆單頁，案例門市南部篩選為零筆時不顯示分頁；設計靈感非法 page 顯示具體 HTTP 400 原因與重新載入，不顯示假卡片或分頁。正常流程瀏覽器 error 紀錄為空；錯誤參數測試的 HTTP 400 為預期結果。
- 截圖 QA：簡報第 10 頁抽出的 Projects 01 範本 `image15.png`（3280×8046）與 `/tmp/sakura-pagination-zHXO9S/inspiration-final-desktop.jpg`、`gallery-final-desktop.jpg`（1280×900／1×）、`tablet-focus.jpg`（768×1024／1×）、`inspiration-mobile.jpg`（390×844／1×）於同一比較輸入核對，聚焦金色當頁圓形、字級、間距、箭頭與卡片／Footer 留白。原卡片、素材、標題及麵包屑維持現況，不還原 PPT 舊內容；頁碼範圍無 P0／P1／P2，final result: passed。原手機懸浮服務列與卡片內文重疊為既有版面，本次頁碼未被遮擋。QA 僅記錄本 README，測試尺寸還原、本機預覽保留，未部署。

## 2026-10-03 廚房商品型錄下載按鈕（PPT 第 9 頁）

- 依 `2026.10.02-版面調整(0.0~6.0單元).pptx` 第 9 頁「下載按鈕統一同右樣式」，`/catalogues/catalog` 五份型錄的下載按鈕採既有品牌系列型錄同款：透明底、深色字、1px 灰框 `#d7d7dc`、橢圓圓角、桌機最小寬 86px／高 40px、17px 下載圖示及 15px 文案。Hover／鍵盤 focus-visible 為金底白字，保留焦點框；手機沿用品牌系列型錄的 44px 圓形圖示按鈕及完整下載 aria-label，減少動態時關閉轉場。
- 僅修改 `nuxt-site/pages/catalogues/catalog.vue` 與本 README；保留五份現有封面、文案、PDF 預覽網址、下載 API、download 檔名及保養區塊，不修改品牌系列型錄參考頁、CMS 或資料庫，不新增套件、文件，不部署。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過，保留既有 Tailwind sourcemap 建置警告。1280×900 桌機與 768×1024 平板五顆按鈕均為實際 87×40px（原參考頁同尺寸，內容寬度使最小 86px 增為 87px），字體／圖示／灰框與參考頁一致；390×844 手機均為 44×44px、17px 圖示，原下載 aria-label 保留，按鈕右緣 297px 不被浮動列遮擋，各尺寸無水平溢出。Hover 與 Tab／Shift+Tab focus-visible 均為金底白字，手機焦點外框清楚，本輪瀏覽器 error 紀錄為空。
- 下載驗證：五個 API 網址及 download 檔名逐一核對保留。滑鼠點擊後，瀏覽器下載事件等待 45 秒未回報完成；改用已登入瀏覽器的下載連結讀取方式取得 `/Users/eric/Downloads/sakura-kitchen-2026 (1).pdf`，檔案確認為 PDF 1.7、9,787,101 bytes，原 API 可用。未帶登入資訊的 CLI 請求為 401（預覽存取保護），不視為 PDF 來源故障，亦未停用保護；本輪未逐一下載其他四份 PDF，不宣稱全部檔案驗收。
- 截圖 QA：来源「截圖 2026-10-03 下午1.28.40.png」（2004×732，含註記及縮放頁面）、`/tmp/sakura-download-cta-Nkyi9t/desktop-final.jpg`（1280×900／1×）與 `mobile-focus.jpg`（390×844／1×）放入同一比較輸入，聚焦指定下載按鈕。字體／文案、外框留白與圓角、灰框深字及金色狀態、原圖品質均核對；目前已更新的五金封面保留，不還原 PPT 舊素材。另存 `reference-desktop.jpg`、`desktop-hover.jpg`、`tablet-focus.jpg`，一般狀態重新清除預覽 Hover／焦點後拍攝，無剩餘 P0／P1／P2，final result: passed。QA 僅維護本 README，測試尺寸還原、本機預覽保留，未部署。

## 2026-10-03 廚房產品系列型錄 CTA（PPT 第 8 頁）

- 依 `2026.10.02-版面調整(0.0~6.0單元).pptx` 第 8 頁「CTA 統一同右邊樣式」，產品系列列表的「廚房商品型錄下載」由黑底白字改為首頁「櫻花優勢」同款透明底、深色文字 `#1c1c1d`、1px 灰色 `rgb(159 159 164 / 64%)` 橢圓框；60px 外框高度、40px 金色白箭頭圓圈、原文字、間距、動畫及 `/catalogues/catalog` 連結維持不變。Hover／鍵盤 focus-visible 為金底白字，保留原焦點框與減少動態支援。
- 僅修改共用 `ProductListPage.vue` 及本 README，SAKURA／SVAGO／TEKA 同版型系列及全品項列表共用此調整；產品詳細頁、其他 CTA、Hero、產品與型錄素材不變。不修改 CMS／資料庫，不新增套件、文件，不部署。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過，建置保留既有 Tailwind sourcemap 警告。1280×900 SAKURA 近吸系列及 390×844 SVAGO／TEKA 全品項頁的 CTA 均為 209×60px、箭頭圓圈 CSS 尺寸 40px；一般狀態透明底灰框深色字，Hover／focus-visible 為金底白字，保留箭頭旋轉與焦點框。滑鼠點擊及鍵盤 Enter 均抵達 `/catalogues/catalog` 且 scrollY=0，手機頁寬 390px 無水平溢出，本輪瀏覽器 error 紀錄為空。
- 截圖 QA：來源「截圖 2026-10-03 下午1.20.08.png」（2006×716，含註記及縮放頁面）、`/tmp/sakura-product-cta-iLmZSG/desktop.jpg`（1280×900／1×）與 `mobile-teka-final.jpg`（390×844／1×，鍵盤焦點）置於同一比較輸入，核對 CTA 外框、字色、圓圈及原尺寸；另存 `desktop-hover.jpg`、`mobile-focus.jpg`。初次手機截圖受到進場動畫／建置後定位影響，已重新定位並確認 opacity=1 後重拍；保留目前型錄封面，不還原 PPT 舊素材。指定 CTA 範圍無 P0／P1／P2，final result: passed；QA 只記錄本 README，未部署。

## 2026-10-03 廚房裝修指南文章 CTA（PPT 第 7 頁）

- 依 `2026.10.02-版面調整(0.0~6.0單元).pptx` 第 7 頁，將文章頁下方延伸文章區塊的「Explore Blogs」橢圓 CTA 整體高度由 54px 改為 60px；44px 金色箭頭圓圈、字級、寬度、圓角、Hover／焦點及動畫維持原設定，網址仍為 `/knowledge`。
- 僅調整 `KnowledgeRelatedCarousel.vue` 的 `home07` 變體，套用到系統櫃、插座規劃及中島餐桌同版型內頁；不改一般推薦文章輪播、全站 CTA、文案、圖片、CMS 或資料庫，不新增套件或文件，不部署。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過，保留既有 Tailwind sourcemap 建置警告。1280×900 系統櫃文章及 390×844 插座文章的 CTA 均為 169.67×60px，原字級 14px、箭頭圓圈 CSS 尺寸 44px 不變；Hover／focus-visible 維持金底白字、箭頭旋轉。Tab／Shift+Tab 能選取連結，滑鼠點擊與手機尺寸 Enter 均抵達 `/knowledge`，列表 Hero 正常顯示且 scrollY=0，手機頁寬 390px 無水平溢出，本輪瀏覽器未新增 error。
- 截圖 QA：來源「截圖 2026-10-03 下午1.13.23.png」（1364×780，含註記及縮放頁面）、`/tmp/sakura-guide-cta-E6p0mS/desktop.jpg`（1280×900／1×）與 `mobile.jpg`（390×844／1×，鍵盤焦點）置於同一比較輸入，聚焦標註 CTA，不把來源的 60px 示意圖寬度或紅框做進網站。字體／文案、灰框與金色、原圖片及三欄版型維持原有設定，只有 CTA 外框高度增加；另存 `desktop-hover.jpg`、`desktop-focus.jpg`，按鈕範圍無 P0／P1／P2，final result: passed。QA 只記錄本 README，測試尺寸還原、本機預覽保留，未部署。

## 2026-10-03 品牌系列推薦廚電按鈕（PPT 第 6 頁）

- 依同份 `2026.10.02-版面調整(0.0~6.0單元).pptx` 第 6 頁「按鈕統一同右邊樣式」，將十個品牌系列共用推薦廚電卡片的加號改為商品分類卡同款右箭頭：60px 金色 `#caa05c` 圓形、白色 24px 箭頭、1px 半透明白框，Hover／鍵盤 focus-visible 置於圖片正中央，以同款縮放／旋轉漸入；不把 PPT 舊標題、產品及圖片還原至前台。
- 圖片與操作提示共用定位容器，不改卡片寬度、圖片比例、透明素材、文字、原路由與少量卡片置中；無網址的展示產品不顯示按鈕。手機採同款 52px 圓形箭頭、圖片中央常駐，不依賴 Hover；初次 QA 發現手機右下角提示被既有懸浮服務列遮擋（P2），已改為置中，後續重新截圖確認。圖示不增加額外 tab 焦點，原連結可鍵盤操作，減少動態偏好沿用關閉轉場。
- 只改 `KitchenSeriesPage.vue` 與本 README，不新增套件、路由、素材，不修改 CMS／資料庫，不部署。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`node nuxt-site/scripts/check-kitchen-series.mjs`（於 nuxt-site 執行時為 `node scripts/check-kitchen-series.mjs`）及 `git diff --check` 通過；十系列 SSR、404 與 215 個來源圖片回歸正常。建置保留既有 Tailwind sourcemap 警告，無建置失敗。
- 瀏覽器驗證：1280×720 Hover 為 60×60px 金色白箭頭，按鈕與圖片中心差值為 0；Tab 顯示同款按鈕及 2px 金色焦點框，Enter 可啟用原連結。390×844 六個箭頭均為 52×52px 常駐、圖片載入正常、頁寬 390px 無水平溢出，六個按鈕中心的點擊目標均為對應產品連結，不被服務列遮擋。原手機服務列與部分文字重疊為既有版面，本輪未調整。Loft Chic 三卡仍置中，外連 `_blank`／`noopener noreferrer` 保留。正常點擊 P0531 後等待完整頁面，抵達 `/products/sakura`、Hero 及產品分類可見、scrollY=0；快速取消測試跳轉時曾記錄一次既有 CMS loader「內容尚未初始化」錯誤，唯讀查詢確認發布內容存在，完整正常跳轉未新增此錯誤，未重建或覆寫資料。
- 截圖 QA：來源第 6 頁截圖（2006×704，含兩個頁面及註記）、`/tmp/sakura-equipment-eYmjmt/desktop-final.jpg`（1280×720／1×）、`mobile-final.jpg`（390×844／1×）已放入同一比較輸入，聚焦按鈕圖示、金色、白框與圖片中心定位；保留現行標題及原產品圖，不額外複製右圖整張灰色卡片遮罩。另存 `desktop-focus.jpg`、`loft-chic.jpg`；初次手機右下角被遮擋的 P2 已修正並重新截圖與命中測試，按鈕範圍 final result: passed。QA 只記錄本 README，未部署。

## 2026-10-03 Footer 網站地圖（PPT 第 5 頁）

- 依 `2026.10.02-版面調整(0.0~6.0單元).pptx` 第 5 頁及使用者截圖調整六分類：維持桌機六個等寬欄位、標題及首列頂端對齊，平板三欄／手機兩欄；桌機及平板入口字級 16px。保留原背景、金色分類、白色連結、數位展板／YouTube、回頂端與展開收合功能。
- 「門市與服務」新增到府丈量／線上客服，沿用 Header／快速服務的既有 HTTPS 網址並另開分頁。「品牌館、關於櫻花」更名為「櫻花集團品牌館、關於我們」；SVAGO、TEKA、建商專區保留正確名稱。PPT「TELA」為來源筆誤，採實際品牌 TEKA。
- 依圖將廚房產品保留四個入口、合作專區保留我要加盟／建商專區兩個入口；僅移除 Footer 的除油煙機系列、近吸系列、加盟資料下載、建商整體廚房、建商專區型錄入口，相關頁面及 Header 選單不刪除。
- `nuxt-site/scripts/update-footer-content-20261003.mjs` 只修改本機 Footer 文件的指定項目，不重跑 seed、不整筆套用舊範本。於 `nuxt-site` 執行 `node --env-file=.env scripts/update-footer-content-20261003.mjs` 先檢查，追加 `--apply` 才以 CMS save／publish 交易發布；保留舊版本，未發布草稿、文案或 revision 衝突即停止，可重跑。限 `127.0.0.1 / SakuraWebsiteDev`，不修改雲端 CMS 或部署。
- 本機 CMS 已發布 revision 3，保留舊版本 `80a65fb3-1243-4c4f-8972-e64a0d1c3f81`。前後比對確認 copy（含圖示／社群／版權）、cmsSettings、設計案例及優惠消息分類完全不變；各分類入口數為 4／4／4／1／3／2，草稿與發布版本一致，再次執行為 `UNCHANGED`。指令語法、`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過。資料庫連線保留既有 Node IP TLS ServerName 棄用警告，本次未降低 TLS 或修改連線安全設定。
- 瀏覽器驗證：1280px 六欄各 174px、起點等距 198px，1024px 六欄約 131.33px，標題／首列各自同一 Y 座標；768px 三等寬欄、390px 兩欄各 132.5px，各尺寸無水平溢出、欄內溢出 0。兩個新外連為 `_blank`＋`noopener noreferrer`，18 個入口均為手指游標，原圖示及 logo 正常載入；手機實際從 Footer 點服務流程抵達 `/service-process` 且 scrollY=0，網站地圖收合／展開均正常。瀏覽器 error 0，測試尺寸已還原，本機預覽保持開啟。
- 截圖 QA：使用者來源截圖（1610×996，含註記及不同縮放）、`/tmp/sakura-footer-i6jjLo/desktop.jpg`（1280×900／1×）與 `mobile-top.jpg`（390×844／1×）放入同一比較輸入，聚焦展開網站地圖而非把紅字／遮罩做成畫面；字級、均分／頂端对齊、背景與品牌色、真實素材、指定名稱及排列均核對。另存 `desktop-1024.jpg`、`tablet.jpg`、`mobile-bottom.jpg`；原有底部大 logo 保留，來源截圖未顯示不視為刪除要求。無剩餘 P0／P1／P2，final result: passed；僅維護本 README，不新增 QA 文件，未同步正式 CMS 或部署。

## 2026-10-03 Header 新增加盟入口

- 依使用者截圖，在「我要加盟」原四個下拉選項後新增「加盟申請表單」→ `/franchising/form`、「加盟資料下載」→ `/franchising/download`，沿用既有頁面及 PDF 預覽／下載，不新增路由，不改原選項、順序與版型；桌機及手機共用 CMS 資料。
- 延伸同日 `update-header-content-20261003.mjs`，保留上一輪品牌館名稱更新；只追加缺少的兩個選項，遇到重複或同名異址時停止，不覆寫既有項目。仍先 check、加 `--apply` 才交易儲存／發布本機版本，不使用 seed、保留舊版本，不同步正式 CMS 或部署。
- 已套用本機 CMS revision 5，保留原版本 `c1ecc130-b5f6-4ded-97dd-81dc53ff688c`。逐欄比對確認只在原四項後新增兩項，全部其他欄位完整保留；再次執行輸出 `UNCHANGED`，不新增重複版本或項目。型別檢查、指令語法及 `git diff --check` 通過。
- 本機瀏覽器：1280×720 六個選項順序正確、寬度仍 190px，實際點擊進入表單與下載頁且 scrollY=0；下載頁顯示既有兩頁 PDF 預覽／下載入口 `/section-6/franchise/franchising_info.pdf`（此輪未另下載整份檔案、未送出表單）。390×844 手機兩個新入口與網址正確、頁寬 390px 無溢出，已還原尺寸，瀏覽器無 error。
- 截圖 QA：來源「截圖 2026-10-03 上午11.55.57.png」（774×342，含裁切與註記）、`/tmp/sakura-franchise-nav-mHI91V/desktop.jpg`（1280×720／1×）、`mobile.jpg`（390×844／1×）置於同一比較輸入，聚焦我要加盟下拉區域；原字體、列距、白底／灰字及既有圖片不變，新增名稱與排列符合註記，未發現 P0／P1／P2，final result: passed。QA 僅記錄於本 README，未同步正式 CMS 或部署。

## 2026-10-03 Header 品牌館選單文案

- 依使用者截圖，品牌承諾下拉「集團品牌館」改為「櫻花集團品牌館」；保留 `/about/exhibition` 網址、版型及其他文案，手機導覽共用同一來源。
- 修正實際本機 CMS 內容與 SiteHeader 型別範例，不用前台硬蓋 CMS。於 `nuxt-site` 執行 `node --env-file=.env scripts/update-header-content-20261003.mjs` 先檢查，再加 `--apply` 才在交易中儲存並發布指定 Header 修改（現另包含上節兩個加盟入口）；僅限 `127.0.0.1 / SakuraWebsiteDev`，保留舊版本，有草稿／文案衝突時停止，可重跑，不重跑 seed、不修改正式資料庫。
- 已套用本機 CMS revision 3，保留原版本 `784926d3-e6d1-442d-b9cb-dab53f2c9d9b`；逐欄比對確認只改品牌館 label，其他欄位／連結完全相同，草稿與發布版本一致，重跑輸出 `UNCHANGED`。尚未同步正式 CMS 或部署，部署程式本身不會同步這筆資料。
- 驗證：1280×720 桌機顯示新名稱、選單仍 190px 寬／每列 44px／字級 16px，實際點擊 `/about/exhibition` 且 scrollY=0；390×844 手機共用新文案、原網址且無水平溢出，已還原尺寸。型別檢查、指令語法與 `git diff --check` 通過，瀏覽器無 error。
- 截圖 QA：使用者「截圖 2026-10-03 上午11.51.21.png」（1670×250，含裁切與文字註記）及 `/tmp/sakura-pavilion-nav-BQrN40/desktop.jpg`（1280×720／1×）置於同一比較輸入，聚焦相同品牌承諾選單；背景頁面不同不作全頁比例比對。文字依指定更名，字型、留白、原金白色系與圖片均未更動，未發現 P0／P1／P2 差異，final result: passed。只更新本 README，不新增 QA 文件。

## 2026-10-03 Header 門市與服務 iCare logo

- 依使用者截圖，在桌機「門市與服務」的「到府丈量／客服中心」文字右側加上 SAKURA iCare logo；固定維持原有 190px 選單寬度，原文字、間距、兩個外部網址及另開分頁行為保留。
- 使用提供的 `櫻花整體廚房_開版用圖 2/Logo/Global_Icon_SAKURA_iCare_08.svg` 原檔，納入 `public/home-2026/logos/sakura-icare.svg`；80px 等比例顯示、不裁切或拉伸。Logo 是連結內裝飾，不新增重複焦點或更改連結名稱。
- 文字與 logo 間距 4px，保留左右各 20px 原內距；首次 QA 發現全站實際字級為 16px，8px 間距會侵占右側 4px 留白，已收緊為 4px。修正後 1280px／1024px 桌機皆量測為 190px 寬、每列 44px 高、兩個 logo 均載入且左右內距各 20px。390px 手機無水平溢出，原手機選單不變；Tab 可從到府丈量到客服中心、logo 不出現在可存取名稱中，Escape 關閉正常。
- 截圖 QA：來源為使用者「截圖 2026-10-03 上午11.40.57.png」（1560×380、含頁面裁切與註記），修正前 `/tmp/sakura-service-menu-x73Xyc/desktop.jpg`，修正後 `desktop-final.jpg`（1280×720、1×），已在相同 `/knowledge` 路由展開門市與服務，將來源與最終畫面放在同一比較輸入；比較重點為局部選單，不將來源註記留白當網站版型。字體／文案未變、等寬與左右留白確認、logo 紅灰原色保留、原始向量素材等比例清晰顯示（原 SVG 內容相同，僅檔尾換行差異）。前述內距問題已修正並再次截圖，無剩餘 P0／P1／P2，final result: passed；QA 僅記錄於本 README。
- `pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過，瀏覽器沒有 error；上一輪型錄 CTA 高度仍 52px、網址仍 `/catalogues/catalog`。不修改 CMS／資料庫，不部署，本機預覽保留並還原測試尺寸。

## 2026-10-03 Header 廚房產品型錄入口

- 依使用者截圖調整桌機「廚房產品」下拉選單：型錄 CTA 上方與下方各 32px 留白，新增 52px 高橢圓灰色外框，Hover／鍵盤 focus-visible 為品牌金色 `#C4A574` 底、白色文字與箭頭。
- 保留三品牌卡片、型錄 CMS 文案及網址、其他下拉選單與手機導覽。只修改前台樣式，不改 CMS 或資料庫，不部署。
- 本機驗證：1280×720 桌機量測 CTA 為 200×52px、上下各 32px、1px 灰框與手指游標；滑鼠真實懸停時 `:hover=true`，底色 rgb(196,165,116)、文字白色。Tab 可到達 CTA 並顯示金底白字，Escape 關閉選單；點擊進入 `/catalogues/catalog` 且 scrollY=0。390×844 手機展開廚房產品後三品牌與型錄連結正常，頁寬 390px、無水平溢出，驗證後已還原視窗尺寸。
- 截圖 QA：來源為使用者「截圖 2026-10-03 上午11.31.38.png」（1578×462，含裁切與右側註記）；實作為 `/tmp/sakura-header-dmcXFu/default.jpg`、`hover.jpg`（1280×720／1×）、`mobile.jpg`（390×844／1×）。將來源及一般／Hover 畫面放在同一比較輸入，聚焦 CTA 註記而非把裁切圖誤當完整視窗：字體與文案沿用、留白及橢圓外框符合要求、品牌金色與白字正確、三品牌原圖裁切與清晰度不變；無需重新製作素材。此次未發現需修正的 P0／P1／P2 差異，final result: passed；沿用本份 README 記錄，不新增 QA 文件。
- `pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。最初同時執行型別檢查及建置造成 Nuxt 產生檔競爭、`#components` 暫時缺失；停止自行啟動的 dev 後依序重跑型別檢查通過，再啟動 dev 重新驗證畫面。瀏覽器沒有 error，只有既有 Google Maps Marker 棄用 warning；建置保留既有 Tailwind sourcemap warning。本機預覽保持運作，未部署。

## 2026-10-02 最新修改同步正式 CMS（已完成）

- 使用者確認以本次最新本機修改為準，授權同步前次核對的 10 份內容及 2 份型錄素材；不整庫還原、不執行 seed、不修改來源資料、帳號、密碼、權限或收件。
- 固定範圍指令 `nuxt-site/scripts/sync-content-20261002.mjs` 讀取本機已發布內容，不以種子或舊正式內容取代最新文案。只允許既定 Azure 測試庫；預設 check 無寫入，輸出 planHash。`--rollback --expect=<planHash>` 測試整批回滾，`--apply --expect=<planHash>` 才發布；來源或目標變動時拒絕沿用舊計畫。
- 沿用既有 CMS 媒體校驗、儲存及內容 save／publish 流程；`changeDocument` 僅增加可傳入既有交易的內部參數，原 HTTP 呼叫仍沿用原交易方式。同步 10 份內容及素材共用 SERIALIZABLE 交易，建立新版本並保留正式舊版本，先保存型錄檔案、核對 SHA-256，再將本文中的兩個本機媒體 ID 對應到正式媒體 ID；可重跑，不產生重複版本。
- 帳號／工作階段／收件／留言／13 張來源表及其他 55 份文件以同步前後指紋核對，密碼等欄位只在記憶體比對、不輸出。不新增其他說明文件或套件。
- 已以計畫雜湊 `f3c5c33c6c1d59e65c2be6f7142b7b228ceb940b96b8f6ca877355aa77e9485f` 完成整批回滾測試：兩份素材、10 份內容、版本、引用、稽核資料均回到原狀；SQL IDENTITY 在回滾後有流水號空號屬正常，不重設。其後同一計畫正式提交成功，10 份內容均使用本機最新版本，新正式文件 revision 為 3，舊版本不刪除。重跑預設 check 得到 `pending: []`、`newMedia: []`，不建立重複版本。
- 正式新增型錄封面 `/media/af3b40a2-db93-4fb2-bb7f-84b9fa312c17`（68,882 bytes）及 PDF `/media/4c8ad00e-af11-43b1-856c-a49569fe3681`（15,529,327 bytes）。兩個正式網域皆可下載，實際 HTTP 檔案 SHA-256 與本機一致；不再使用只存在本機的兩個 media ID。
- `https://header-design-two.vercel.app` 與 `https://sakura-demo-vanlantech.com`：10 個已發布內容 API 逐欄與本機比對通過（僅將兩個媒體 ID 對應到雲端、沿用 AI Kitchen 既有衍生資料處理）；建商、品牌紀事、品牌館、品牌特色、加盟及型錄六頁 SSR 均讀到新內容。設計靈感仍 28 筆、三品牌商品仍 749／60／38，不新增或重複來源資料。
- 正式瀏覽器重新載入建商頁，確認 Hero 已為「提供一站式整體解決方案／為建案提升價值與銷售力」、CTA「立即預約」，品牌區標題為最新中文；實際捲至新六段圖文，可見模組／AI 工廠／管理平台／HOME IN O.N.E／三項服務／iCare，六張圖片 `complete` 與 `naturalWidth` 載入檢查通過，沒有回退舊底圖。僅通過提案入口，未登入 CMS 或送表單。
- 提交後再核對：65 份文件、123 筆歷史版本、299 份素材／SQL 檔案、33 筆稽核記錄；無未發布文件或草稿差異，299 份素材大小及 SHA-256 均正常。
- 語法檢查、`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過。Vercel 既有 Production 程式已具備這些版型，本次僅更新雲端 CMS，不重新部署或更動網域／環境變數；同步工具及內部交易參數留在本機程式碼。上次唯讀核對的「未同步」為同步前狀態，現已解決本次指定 10 份內容。

## 2026-10-02 正式端 CMS 唯讀核對

- 核對時兩個網域 `header-design-two.vercel.app`、`sakura-demo-vanlantech.com` 都指向 Production 部署 `dpl_dCcwtU5DC1iK9F7z2WnVda3sVFqL`，Ready、Nuxt、Functions `sin1`；建立時間為 2026-10-02 21:58（台灣），Git `978d7caa916b814d889772c7f4e475e4154e6fc6`。因此上方歷次「未部署」記錄代表各修改當時的狀態，不能據此判定現在的程式版本。
- 正式 Azure `SakuraWebsiteTest` 與本機 `SakuraWebsiteDev` 是獨立資料庫。13 張 `sync` 來源表逐列比對本機、雲端與私有 SQL 快照都一致，沒有本次更新造成的來源資料缺漏或改寫：DesignCloud 25 案例／46 標籤／200 關聯／182 檔案／200 屬性；879 筆產品中櫻花 749、SVAGO 60、TEKA 38、其餘 Electrolux 32（目前三品牌 API 不顯示）。
- 正式 CMS 65 份資源皆有草稿及發布版本，版本歸屬、JSON／欄位格式、現行 schema 相容性均通過，無未發布草稿差異、失聯版本或失聯素材關聯；113 筆歷史版本保留。297 份正式媒體都有 SQL bytes，大小及 SHA-256 全部吻合；已發布內容沒有引用不存在或已封存的 `/media` 素材。正式收件及留言目前各 0 筆，此次未送表單，不以測試寫入宣稱送件已驗收。
- 正式 API：65 個內容入口均 HTTP 200；三個舊新聞入口會經既有文章轉接器補出 `cover`／`paragraphs`，不將其與舊種子欄位不同誤判為資料損壞。設計靈感 28 筆（25 設計案例＋3 門市案例）分頁 9／9／9／1、ID 不重複；三品牌 API 總數 749／60／38，SAKURA 入口仍是確認的九類；錯誤頁碼回傳 400。建商、品牌館、加盟、型錄頁 SSR 均 HTTP 200，但正式建商 Hero 實際仍呈現舊 CMS 英文標題。
- **發現 10 份已發布內容未同步，不是資料被破壞。** 正式端這些文件 revision 都為 1，本機已建立新版本；本機與正式 schema 相同，但已發布本文不同。正式稽核記錄未見 10 月 1 日後的內容儲存／發布。

| 未同步資源 | 正式端與本機差異 |
| --- | --- |
| `view-pages-builders-index` | Hero／CTA、品牌大標、三張能力圖片及 iCare；正式仍用舊卡片底圖，與已部署的新分段版型不一致 |
| `view-pages-franchising-intro` | 加盟主標、夥伴分享、加盟 CTA、小標及最新加盟消息文案 |
| `view-pages-about-exhibition`、`data-brandPavilions` | 品牌館區塊標題與移除 TLK 的警語文字 |
| `view-pages-about-introduce`、`view-pages-about-advantage` | 品牌紀事／品牌識別標題及家庭概念標題 |
| `view-components-home-HomeWhatWeDo` | 品牌承諾英文小標 |
| `data-kitchenStyles`、`data-kitchenSeries` | 君璽導覽封面及 18 處廚電去背圖來源 |
| `data-productCatalogues` | 2026 廚房配備型錄 PDF 與封面 |

- 新型錄 PDF 與封面共兩份媒體只在本機；正式 `/media/e6d13491-33e0-448a-af28-67367da919a1`、`/media/f9d2bb24-2df3-4f39-b0c7-da20f8a0c8e4` 均 404。正式當前仍引用舊型錄，沒有因此產生已發布失聯素材；不能只複製本機的新 URL，需先以雲端媒體流程保存檔案並核對雜湊，再更新型錄新版本。建商新靜態 WebP 已隨程式部署，正式 HTTP 200，但 CMS 仍未選用。
- 原始產品快照本來就含 46 筆找不到產品或分類的分類關聯（3 筆缺產品、43 筆缺分類）及 4 筆找不到產品的檔案關聯。本機、雲端、私有快照一致，並非此次前台調整造成；不自行刪除或補造來源資料。設計案例關聯、商品功能與價格關聯沒有失聯。
- 初次 Azure 連線曾回覆 `ELOGIN / database not currently available`，再次唯讀連線及正式 API 已恢復。入口網站顯示 Online、剩餘 90,015 vCore 秒、超額計費 Disabled，不能把一次連線失敗直接認定為額度耗盡或資料遺失；免費環境仍有首次喚醒延遲。
- 本次僅執行 SQL SELECT、部署／日誌／資源狀態查詢及 HTTP GET；只通過既有提案密碼入口取得瀏覽 Cookie，未登入 CMS、未執行 seed／import／發布／同步／部署、未變更帳號／密碼／收件或雲端設定。僅更新本 README 留存結果。結論限目前資料與既有快照，不宣稱有完整歷史備份即可證明所有時間都未被修改。
- 後續若授權同步：先保留正式版本與媒體，再逐欄核對上述 10 份內容並建立新版本；保留正式管理員已修改的密碼、帳號、權限及收件，不做整庫覆蓋，不使用 `accept-data-loss`。此同步尚未執行。

## 2026-10-02 建商型錄用途警語（本機，未部署）

- `/builders/catalogues` 型錄清單下方新增「本專區型錄僅供建設公司、工程專案及設計師等大宗採購參考。／若有個人家用需求，歡迎至櫻花整體廚房門市選購。」；依截圖置中兩行、16px 既有中文無襯線字、`#59585D`，手機自然換行。卡片下留 56px（手機 40px）、警語下留 36px 接頁尾，不加入 Figma 綠色 T。
- 僅新增用途說明並調整區塊底部留白，保留型錄封面、預覽／下載及麵包屑，不修改資料庫或建立新文件；使用 image-to-code 對照警語位置，QA 僅記錄本 README，尚未部署。
- 既有前台回歸加入兩句完整警語及保留型錄預覽／下載入口的 SSR 檢查。
- 首輪同寬比較發現 14px 警語文字偏小，調至 16px 以符合參考圖的比例；型錄卡片原有間距與下載入口保留，不連帶重排。
- 手機警語採平衡換行，避免最後一行只剩「購。」；保留完整內容與 16px 字級。
- 視覺 QA：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_3zOXbW/截圖 2026-10-02 晚上8.06.05.png`（1438×774 局部圖），實作 `http://localhost:3100/builders/catalogues`（1438×834 原生截圖，含 60px 固定導覽）同一比較輸入核對警語區，再以 390×844 檢查手機。五項檢查：既有中文無襯線 400／16px、兩句文案完整、置中及 56／36px 上下距、既有 `#59585D` 色彩、封面與 PDF 不变；保留原卡片／下載入口，不宣稱整頁與局部設計稿像素相同。修正偏小字級後重新比較，手機孤字亦修正再擷取；無待修 P0／P1／P2，細微原稿字距／灰階差異為可接受 P3，`final result: passed`。工具未提供原生截圖存檔路徑，不偽造檔案。
- 驗證：型別檢查、既有前台回歸及差異格式檢查通過；桌機警語高 36px，手機自然分四行、寬 360px，整頁寬 390px、無水平溢出；控制台無 error／warn，PDF 預覽仍另開分頁。測試尺寸已還原，未修改資料庫或部署。

## 2026-10-02 建商品牌館預約表單標題（本機，未部署）

- `/builders#appointment` 表單標題由「預約專人聯繫」改為「預約品牌館參訪」，保留小標、樣式、欄位、驗證、送出功能及錨點。不更動資料庫或既有收件，尚未部署。
- 既有前台回歸加入表單標題的 SSR 檢查，避免改到其他區塊標題。
- 驗證：前台回歸與 `git diff --check` 通過，本機 SSR 已呈現新標題；未送出表單。

## 2026-10-02 建商專區分段圖文改版（本機，未部署）

- 依「晚上7.19.34」新版截圖，將三張能力卡改為設計模組、AI 工廠、案件管理平台的直向圖文，再接 HOME IN O.N.E、三項服務及 iCare。上方 WHY SAKURA／英文大標先保留，已詢問是否移除，不擅自刪小標；Hero、品牌卡片、建商 Logo 及預約表單不改。
- 六張正式素材來源 `/Users/eric/Downloads/提案後新增用圖/6.2建商專區`。採原圖、不生成替代圖，不放入 Figma 綠色 T；輸出至 `public/section-6/builders/proposal-20261002/`，只做等比例 WebP 載入最佳化，保留來源檔。素材自帶的識別／文案保留在圖內。
- 前台移除舊能力卡、金色膠囊 HOME IN O.N.E 與重複的 iCare 英文介紹，改用六張素材和原有 CMS 能力／服務文案，沿用圖片載入失敗提示及捲動進場動畫。AI 工廠僅裁掉圖片上方空白，完整保留三張工廠照片；HOME IN O.N.E 保留原透明識別，不重新繪製。
- 前台回歸新增六圖順序、圖片 HTTP／WebP 尺寸／檔案大小、三項服務、45+萬／AI智能／管理平台及無舊卡片／重複 iCare 標題檢查；素材總計約 756KB，最大圖由約 18MB 降為約 217KB，不改來源檔。
- 首輪桌機檢查發現工廠及模組標題繼承頁面襯線字，已改為與參考圖一致的既有中文無襯線字；上方舊標題原有欄寬／間距保留，不連帶重排。
- 手機同框比較發現「透過專屬的即時監控系統」因三欄間距擠成額外一行，縮小欄距至 `.75cqw`，保留文案與 10px 最小字級，不把字縮成参考圖的極小尺寸。瀏覽器尺寸切換曾逾時，改以同一瀏覽器的新預覽分頁恢復檢查，不影響網站程式。
- 視覺 QA：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_MEPThO/截圖 2026-10-02 晚上7.19.34.png`，實作 `http://localhost:3100/builders#builders-solutions`。來源與 384×1200 原生預覽截圖放在同一比較輸入核對，另檢查 1280×720 桌機各段及 768×1024 平板。檢查字體／字級階層、圖文順序／間距、金／黑色彩、六張素材及文字完整性；HOME IN O.N.E 的三行標語與 iCare QR 圖都未裁掉。參考為局部圖，不宣稱整頁像素一致；手機服務文字刻意較參考清楚、局部比例差异屬可接受 P3，無待修 P0／P1／P2，`final result: passed`。依 image-to-code／frontend-design 沿用現有元件、字型及圖片，不新增套件，QA 僅維護本 README。
- 最終驗證：`pnpm typecheck`、`pnpm build`、`node --env-file=.env scripts/check-frontend-regressions.mjs` 及 `git diff --check` 通過；重跑素材發布不覆寫檔案／舊版本、不建立重複版本。六張圖在瀏覽器均載入，384px／768px 頁寬與視窗一致，手機三項服務文案皆兩行，控制台無 error／warn。實際點 Hero「立即預約」到 `#appointment`，表單頂部約 60px；未填寫或送出資料。暫時尺寸已還原，本機預覽保留，未部署。
- 重跑檢查：於 `nuxt-site` 執行 `BUILDERS_ASSET_DIR='/Users/eric/Downloads/提案後新增用圖/6.2建商專區' node --env-file=.env scripts/update-builders-layout-20261002.mjs`；加 `--apply` 才新增最佳化素材及發布本機 CMS 新版本。只限 `127.0.0.1 / SakuraWebsiteDev`，已有不同素材或未發布草稿時停止，既有檔案與舊內容版本不覆寫，不使用 accept-data-loss。

## 2026-10-02 建商專區 Hero 標題（本機，未部署）

- 品牌區 `Meet The Experts Our Kitchen Designers` 依截圖改為「嚴選國內外優質品牌／打造不同定位與多元風格的理想家居空間」；「風個」依截圖校正為「風格」。兩行金色 `#C4A574`、置中，主標 Noto Sans TC 700／36px、次行 400／22px（手機 28／18px），保留 `OUR BRAND` 小標、卡片及原動畫，忽略 Figma T 註解。同步初始文案及本機 CMS 新版本，只更新 `text9`／`text11`，保留其他內容與舊版本，不部署。
- 本次使用 image-to-code／frontend-design，沿用現有 Nuxt 與字型，截圖僅有可編輯文字，沒有需生成的素材；QA 依使用者規則僅記錄本 README，不新增 `.md`、套件或其他頁面。
- 品牌標題 QA：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_6osqTp/截圖 2026-10-02 下午6.10.38.png`（434×140 局部裁圖）；實作 `http://localhost:3100/builders#builders-team-title`，原生瀏覽器截圖 1280×720 與 390×844。來源及原生實作在同一比較輸入檢視標題區：字重／大小階層、置中、兩行間距與文案一致，金色實測 `rgb(196,165,116)`；原有背景及卡片不改，T 不生成，文字不以點陣圖替代。來源未提供完整視窗及字型檔，僅比較可见標題區，不宣稱整頁像素相同；細微字形差異為可接受 P3，無待修 P0／P1／P2，`final result: passed`。
- 補充驗證：型別檢查及前台回歸通過，390px 頁寬仍為 390px、標題寬 360px，兩段均完整顯示，控制台無 error／warn；測試尺寸已還原。Browser 裁切 API 未反映原生捲動，改用原生截圖驗證，未偽造截圖檔案路徑。
- Hero CTA 文字由「專人聯繫」改為「立即預約」，圓形箭頭樣式、動畫及 `#appointment` 連結維持不變；同步初始文案及本機 CMS 新版本，保留舊版本與其他內容，不同步雲端或部署。SSR 回歸增加 CTA 文字檢查。
- CTA 驗證：前台回歸通過，本機瀏覽器實際點「立即預約」到 `/builders#appointment`，表單區塊距視窗頂部約 60px；未輸入或送出表單。
- 依後續要求刪除 Hero 右側「一站式整體廚房解決方案，為建案提升價值與銷售力。」說明段落，保留小標、大標及「專人聯繫」CTA／預約錨點。只移除前台呈現與無用段落樣式，CMS 歷史內容及資料庫不刪除；回歸檢查確認說明不渲染且 CTA 保留，兼容動畫指令額外加入的 CSS class，未部署。
- 本機瀏覽器確認右側說明已消失，小標與「專人聯繫」按鈕仍顯示；段落回歸只匹配 `<p>` 標籤，避免誤判 CTA 的 SVG `<path>`。
- `/builders` Hero 大標題改為「提供一站式整體解決方案／為建案提升價值與銷售力」，保留原有進場動畫；同步初始化文案及本機 CMS 新版本，只更新標題並保留舊版及其他內容，不同步雲端或部署。
- 依使用者補充恢復原有 `Property Developers` 膠囊小標（保留 CMS 文案管理），其下保留白色粗體「櫻花 HOME IN O.N.E」；大標第一段金色 `#C4A574`、第二段白色，採既有 Noto Sans TC 700 與零字距、1.6 倍行高（手機 1.5），保留標題動畫、右側說明／CTA、背景及圖片。忽略 Figma 的 T 註解，不製成網頁內容。
- 恢復小標時沿用既有元件，標籤下留 16px，三個斷點 Hero 高度各增加 48px，避免新增標籤後被下方照片覆蓋；加入保留膠囊標籤的 SSR 回歸檢查。本機 CMS 以新版本還原小標，保留舊版本及其他內容，不部署。
- 小標恢復後驗證：型別檢查及前台回歸通過；1280px 桌機與 390px 手機截圖確認膠囊、白色品牌字及金／白標題都保留。1920px 標題底部約 491px、圖片始於 508px；768px CTA 底部約 475px、圖片始於 538px；390px CTA 底部約 432px、圖片始於 533px，無遮擋或水平溢出，控制台無 error／warn，測試尺寸已還原。
- 首輪同框比較發現小標偏小、與大標間距偏大；小標上限改 40px、大標上緣距改 8px、行高收至 1.5，重新擷取比對後再驗收。
- 第二輪比較確認小標比例及金色標題上緣一致，再將桌機行高調至 1.6 以對齊原稿第二行的位置；手機仍用 1.5，不增加手機留白。
- 現有前台回歸增加建商標題 SSR、金色段落順序、小標、粗體及排除全站 80px 規則的檢查，不新增測試套件。
- 視覺 QA：來源 `/var/folders/_2/0cgnyjy96gq7clyqpvzrx0vm0000gn/T/TemporaryItems/NSIRD_screencaptureui_Fge8gt/截圖 2026-10-02 下午5.22.54.png`（1056×338），實作 `http://localhost:3100/builders`。以 1920×1080 CSS 視窗擷取 1056×338 標題區，來源與實作截圖在同一比較輸入逐輪檢視，另檢查整頁及 1280／768／390px；Browser 工具未提供截圖檔案路徑，不偽造存檔。參考是局部裁圖，原頁底部照片／紋理保留；T 僅為註解，未生成或置入素材。
- 五項檢查：字體採既有 Noto Sans TC 700，桌機最大 76px、40px 小標與行距修正後接近参考；金／白階層、左對齊與兩段文案一致，金色實測 `rgb(196,165,116)`，不截斷或遮住文字；圖片清晰且沿用原圖，不以截图代替文字。原稿未提供字型檔，細微字形差異列為可接受 P3，無待修 P0／P1／P2；`final result: passed`。
- 驗證：型別檢查與前台回歸通過，390px／768px 頁寬與視窗一致，標題及聯繫 CTA 位於圖片上方；實際點「專人聯繫」到 `#appointment`，區塊距視窗頂部約 60px。控制台無 error／warn，還原暫時尺寸，未送出表單、未部署。
- 字級桌機流動 32–76px、手機 24–32px，僅建商 Hero 排除全站強制 80px；移除舊英文斷點覆寫，避免中文標題換成四行後被負邊距圖片遮住。設計技能要求的 QA 紀錄依使用者規則寫在本 README，不新增 `.md` 或重建專案，不需圖片生成或新增套件。

## 2026-10-02 加盟申請欄位（本機，未部署）

- 加盟申請表姓名欄標籤由「消費者姓名」改為「聯絡姓名」，保留必填星號、原樣式與 `name` 資料欄位，驗證及收件流程不變；本機修改，尚未部署。
- 依申請表截圖補上個人資料及加盟規劃欄位，沿用既有黑／金／白表單，前台與 API 共用選項及驗證；原問題先保留，待確認是否取代。年齡選項保留原稿「46~50／50~55／55歲以上」，50 與 55 歲邊界重疊待客戶確認，不擅改原稿。
- 新申請沿用 CMS JSON 收件儲存，不變更資料表或既有申請紀錄，不同步雲端或部署。
- 個人資料補性別、年齡、居住地、學歷、職業、LINE ID、方便聯繫時間；加盟規劃補資金來源、店面資訊、經營團隊、選擇品牌原因、在意細節、創業原因及訊息來源。複選題標示可複選，居住地／LINE ID／創業原因／訊息來源非必填；自有店面展開地址、寬度（公尺）及坪數必填，承租不傳送隱藏的自有資料。
- 後端檢查允許選項、陣列型別／重複值、長度與店面數值；採選项順序保存複選內容以維持冪等性，未知欄位不入庫。後台收件顯示中文欄名與複選內容，舊紀錄仍可閱讀。
- 現有 `node nuxt-site/scripts/check-frontend-regressions.mjs` 補上表單 SSR、所有必填與允許選項、複選型別／重複、非正數／非法坪數、條件必填與 API 400 拒收檢查；不新增測試框架或套件。
- 回歸的共用 GET 與預覽登入增加 45 秒等待上限，避免測試時碰到 Nuxt 熱更新後無限等待；逾時直接回報，不當作驗證成功。
- 共用表單驗證模組明確內嵌 Nitro；避免開發模式將子工作區路徑錯誤外部化，正式建置同樣包含驗證邏輯。
- 本機 API 入庫驗證通過：自有／承租欄位、完整複選值、複選順序不同仍冪等、不同內容 409、無效坪數 400、未知欄位不保存；僅移除本輪兩筆測試 ID，既有收件逐列比對未變。桌機確認條件欄位展開／隱藏、兩項團隊可同時勾選，空白送出顯示各欄错误並聚焦姓名。
- 非必填欄位也允許 API 省略，回歸加上此情境；新版加盟申請同意版本記錄為 `2026-10-02`，建案及留言版本不變，舊收件不回寫。手機 390px 確認整頁寬 390px、表單寬 360px、選項不溢出、自有店面三個輸入以 288px 單欄排列；控制台無 error／warn，檢查後還原瀏覽器尺寸。型別檢查、正式建置及現有前台回歸通過（既有 Tailwind sourcemap／本機 TLS IP 警告未阻擋）。

## 2026-10-02 加盟介紹標題（本機，未部署）

- 原「Quick And Clear Answers To Your Key Questions」區塊大標題改為「最新加盟消息／Franchise Updates」，中文在上、英文維持金色，保留字級與動畫並清除舊標題多餘換行；本次僅改標題，原 FAQ 問答、小標籤與資料下載仍保留，未改為新聞列表。同步初始化文案及本機 CMS 新版本，保留舊版及其他欄位，未同步雲端或部署。
- 「Celebrity Stories That Inspire Beautiful Living」行銷案例核對 [官網強大廣告行銷](https://www.sakura-kitchenlife.com.tw/franchising/intro)，共有袁艾菲、小蠻與邵翔、徐凱希、荳荳、鍾欣怡五筆；本機已發布 CMS 及五張圖片原已齊全，不新增重複卡片或覆蓋案例資料。將原手動橫向捲動改為既有 Embla 自動循環，每 3.5 秒切換一張，Hover 不暫停；保留卡片與錯位版型，以 margin 取代與輪播衝突的位移及逐卡 reveal。新增左右切換、暫停／繼續控制，支援觸控、方向鍵及減少動態效果；不新增套件，尚未部署。
- 行銷輪播驗證：`pnpm typecheck`、現有前台回歸及差異格式檢查通過，補上五筆 CMS／圖片、五卡 SSR、左右切換、無 API、循環／暫停與減少動態效果的可重跑檢查。瀏覽器確認五張圖片皆載入、自動位移、暫停後位置維持，以及 390px 手機手動切換五次後所有卡片回到原位置，無橫向溢出，控制台無 error／warn；卡片間距使用右邊距確保末張接首張仍為 30px。
- 「Join SAKURA KITCHEN」區塊 CTA 文字改為「立即加盟」，保留原有樣式、動畫與另開加盟表單的連結；同步初始化文案及本機 CMS 新版本，僅修改該文案欄位並保留舊版，未同步雲端或部署。
- 加盟申請區塊大標題改為「Join SAKURA KITCHEN」，品牌名稱保留金色，原有字級、動畫、內文及 CTA 不變；同步初始化文案與本機 CMS 新版本，保留舊版及其他欄位，未同步雲端或部署。
- 加盟申請區塊小標籤由「Subscribe To The Newsletter」改為「BUILD YOUR FUTURE WITH US」，維持原有樣式與動畫；同步初始化文案與本機 CMS 新版本，保留舊版及其他內容，未同步雲端或部署。
- 加盟夥伴分享區塊標題改為「加盟夥伴真實分享／Hear from Our Partners」，中文在上、英文維持金色，保留原有字級與進場動畫；只取消此標題自動首字大寫以保留指定大小寫。同步初始化文案與本機 CMS 新版本，舊版保留，分享影片、人物與內文不變，未同步雲端或部署。
- 移除加盟夥伴分享區塊左側「加盟資料下載」按鈕及其專用樣式／圖示引用；Hero 新增的下載 CTA 與既有下載頁保留，標題、影片及 CMS 原始文案資料不變。本機修改，未部署。
- `/franchising/intro#introduction` Hero 大標題改為「為什麼選擇加盟／櫻花整體廚房?」，所有尺寸維持 38px、中文品牌字體與 1.4 倍行高，保留品牌名稱金色及原有進場動畫；移除原英文標題各斷點的字級覆寫，不改背景、其他文案或連結。
- 同步初始化文案與本機 CMS 新版本，保留舊版及其他欄位，不同步雲端，尚未部署。
- 將此頁排除全站桌機 Hero 強制 80px 規則，確保指定的 38px 不被覆蓋；其餘 Hero 不受影響。
- 移除 Hero 右側重複的「為什麼選擇加盟櫻花整體廚房？」標題及其專用樣式，保留兩段介紹、加盟按鈕、動畫與 CMS 原始文案資料；左側 38px 主標題不變。
- 在「立即申請加盟」右側新增「加盟資料下載」CTA，沿用原圓角箭頭樣式、動畫及 CMS 既有文案／連結，另開 `/franchising/download`；按鈕間距 16px、空間不足自動換行，手機維持滿寬排列，不更動資料庫或另建下載流程。
- CTA 驗證：桌機兩顆按鈕同列、下載在右；390px 手機版換行且未與下方圖片重疊、無橫向溢出。實際點擊另開加盟下載頁，加盟簡介正常顯示；差異格式檢查通過。
- 驗證：本機 CMS 比對確認只修改兩個標題欄位；瀏覽器桌機及 390px 手機量測均為 38px，手機頁寬 390px、無橫向溢出，保留兩行與金色品牌名稱。差異格式檢查通過。

## 2026-10-02 關於我們品牌紀事標題（本機，未部署）

- `/about/introduce` 品牌歷程區塊標題改為「SAKURA KITCHEN Stories／櫻花整體廚房紀事」，英文在上、中文維持金色；依品牌名稱補齊使用者輸入「AKURA」缺少的 S，保留原有動畫及歷程內容。同步初始化文案與本機 CMS 新版本，舊版保留，未同步雲端。
- 品牌識別區塊標題改為「專屬品牌識別／Signature Brand Identity」，中文在上、英文保持金色強調；保留圖片、內文與動畫，同步初始化文案與本機 CMS 新版本，舊版保留，未同步雲端。
- 品牌紀事採客戶第 2 種循環方式：到最後一組（包含 2021）後平滑回捲至第一組 1978，繼續每 3.5 秒輪播。沿用 Embla，關閉逐卡重定位循環並移除與輪播位移衝突的逐卡 reveal，保留整個區塊淡入；自動播放、箭頭及方向鍵共用首尾處理，不再到末端後進入空白。Hover 與滑鼠點按不暫停，鍵盤焦點仍可暫停閱讀；減少動態效果時不自動播放。
- 紀事動畫驗證：`pnpm typecheck` 與現有前台回歸通過，新增首尾回捲、缺少輪播 API、減少動態效果及滑鼠／鍵盤焦點的可重跑檢查。桌機實際確認最後一組 2017／2018／2020／2021 顯示正常，滑鼠停留於輪播箭頭（Hover 為 true）時仍自動返回前段年份、畫面持續有卡片，無整片空白；尚未部署。

## 2026-10-02 集團品牌館 Hero 小標移除（本機，未部署）

- `/about/exhibition` 移除 Hero 的「集團品牌館／SAKURA Brand Pavilion」小標及其專用樣式；保留大標題原有定位、圖片、影片按鈕、導覽名稱與 SEO 資訊。
- Hero 大標題改為「SAKURA BRAND PAVILION」，沿用原有定位、字體、金色強調與動畫；其餘內容不變。
- 空間理念區塊標題改為「Enjoy · Connect · Experience」，同步初始化內容與本機 CMS 發布版本，僅更動標題並保留舊版；中文副標、內文、圖片及動畫不變，尚未同步雲端。
- 注意事項第一項僅移除「TLK」三字，保留其餘文字與電話；同步來源資料、初始化內容及本機 CMS 新版本，舊版保留，未部署或同步雲端。
- 三館展示區塊標題改為「Memories are made when we’re together」，金色強調後半句並保留原有動畫，取消該標題的 CSS 首字大寫以符合指定大小寫；同步初始化內容與本機 CMS 版本，三館資訊及圖片不變，尚未同步雲端。
- 三館資訊右側空白處新增「立即預約」圓角箭頭 CTA，連到 `/builders#appointment` 建商預約表單區塊；下方顯示「※ 本預約服務限建商合作夥伴使用」，並透過 `aria-describedby` 提供同一警語。切換三館皆保留 CTA，不新增或提交預約資料；本機修改，未部署。
- 預約 CTA 與警語改靠右側資訊區底部，以 flex 自動推到底，桌機與左側圖片下緣對齊；手機維持在門市資訊後自然排列，不加入固定高度或額外長留白，按鈕樣式及連結不變。
- 位置驗證：桌機量測圖片與預約組下緣差距為 0px；390px 手機版保持單欄、CTA 在門市資訊下方且無橫向溢出。差異格式檢查通過，未部署。
- 實際點擊測試與瀏覽器警告確認：既有錨點捲動早於非同步 CMS 頁面渲染，當時找不到目標區塊。共享路由跨頁錨點改為等待 Nuxt `page:loading:end` 後即時定位，保留固定導覽列偏移，避免只改網址卻停在中段；一般非錨點跳頁規則不變。
- 預約 CTA 驗證：`pnpm typecheck`、現有前台回歸（已補 CTA／警語／目標錨點檢查）及差異格式檢查通過。測試站熱更新逾時後重啟恢復，瀏覽器實際點擊確認 `/builders#appointment` 定位在距視窗頂端約 60px、與固定導覽列高度一致，表單正常顯示；未送出任何資料，尚未部署。

## 2026-10-02 品牌優勢 Hero 標題（本機，未部署）

- `/about/advantage` 的 Hero 大標題改為「Why SAKURA KITCHEN」，沿用原有字體、金色強調與進場動畫；其餘內容不變。
- 品牌特色區塊標題改為「Discover What Makes SAKURA KITCHEN Different」，沿用原有字體與進場動畫，品牌名稱維持金色強調，其餘內文與卡片不變。
- 全國通路區塊標題改為「Shaping Kitchens Across Taiwan」，保留原有字體、金色強調與動畫，不更動門市圖片及中文內文；本機修改，未部署。
- 品牌特色三張卡片取消滾動進度與 sticky 長捲動留白，進入區塊後改由 CSS 自動依序淡入 01 → 02 → 03，每輪 12 秒（間隔 3 秒，全部出現後停留再循環）。保留三卡排版，不因 Hover 暫停；減少動態效果時完整靜態顯示，不加入輪播套件。
- 動畫驗證：`pnpm typecheck`、`node nuxt-site/scripts/check-frontend-regressions.mjs` 與差異格式檢查通過；本機瀏覽器在捲動位置不變時確認卡片顯示會自行變化，原長捲動區塊恢復為卡片自然高度。尚未部署。
- 家庭型態區塊標題改為「Creating the Ideal Kitchen for Every Family」。同步初始化內容與本機 CMS 發布版本，只改標題欄位並保留舊版，不重匯或覆蓋其他內容；內容比對確認其他欄位不變，本機瀏覽器確認新標題顯示，尚未同步雲端。

## 2026-10-02 SAKURA 廚電分類確認（本機，未部署）

- `/products/sakura` 依客戶截圖只保留九張分類卡片並依序顯示：除油煙機、瓦斯爐、IH 感應爐、殺菌烘碗機、洗碗機、烤箱與電器收納櫃、瓦斯熱水器、電能熱水器、淨水設備。每張仍連至原對應分類列表。
- 調整入口的顯示範圍；原始商品資料、既有產品網址與 CMS 設定保留。SVAGO、TEKA 的分類不受影響。唯讀回歸沿用 `node nuxt-site/scripts/check-product-covers.mjs`，驗證九項順序、SSR、圖片與分類列表連結。
- 驗證：`pnpm typecheck`、分類封面回歸與 `git diff --check` 通過；本機瀏覽器確認九張卡片順序正確。尚未部署。

## 2026-09-29 Vercel／Azure SQL 雲端測試站

- 已完成並切換兩個既有網域：`https://header-design-two.vercel.app`、`https://sakura-demo-vanlantech.com`。Production 部署 `dpl_4WcSWWzCCXvUY2KEVU5SZZR7fcnX`（2026-09-29，Ready，Functions `sin1`）；後台路徑 `/admin`。網站與後台連 Azure，不依賴本機開機；既有提案密碼與 CMS 帳密沿用。依 Vercel deployments-cicd／env-vars 技能採伺服器端環境變數、分階段部署、測試通過再 promote；未加購服務。
- SQL 素材儲存模式為 `CMS_MEDIA_STORAGE=sql`（測試上限 2GB）與每段 2MiB 上傳，保留圖片 10MB／PDF 30MB、登入／CSRF／私有素材權限。新增資料表採 additive schema，不刪除或覆寫既有資料。本機初始化／啟動指令沿用下方章節；Vercel 只設定 Production 資料庫憑證，Preview 未共用此 CMS 寫入權限。
- 最終版本正式建置及線上端對端重測通過後已 promote；兩個正式網址均再次確認首頁、登入、設計靈感、SAKURA 頁面 200，案例總數 25、第三頁 7 筆。部署 error 等級查詢未找到紀錄（當次查詢，非長期監控）；型別檢查、素材單元檢查、匯入回滾／重複比對均通過。既有 Tailwind sourcemap 警告未阻擋建置。程式變更保留本機，尚未 commit／push；後續 Git 自動部署須包含本次檔案。
- 雲端專用匯入：`node --env-file=.env.design-db.local --env-file=.env.azure-sql.local --env-file=nuxt-site/.env nuxt-site/scripts/azure-test-db.mjs import`；目標固定為本次 Azure 測試庫，只允許空庫整批交易匯入，既有資料必須完全一致才可跳過，衝突拒絕而非覆蓋。`verify` 檢查逐表內容及素材 SHA-256；`AZURE_TEST_ROLLBACK=1` 可在空庫測試完整交易回滾。來源只讀，保留 ID／CMS 密碼雜湊，不移轉登入工作階段。產生的 `.env.azure-runtime.local` 只包含兩個最小權限應用帳號，不含管理員密碼。`.vercelignore` 排除憑證及私有快照。
- 素材測試：`node nuxt-site/scripts/check-media-chunks.mjs`，涵蓋檔案驗證、區塊超限／缺段／重送衝突。分段上傳暫存一小時，最多 100MB，發布前素材仍需登入；不新增付費 Blob。
- Vercel Functions 設為 `sin1`，與 Southeast Asia 資料庫靠近；不啟用固定出口 IP。匯入演練發現 Audit identity 的 SQL batch 範圍問題，已改為同批次保留原序號；失敗交易已回滾，未留下部分資料。
- 免費 SQL 閒置後會休眠；來源與 CMS 連線等待延長至 60 秒，首次開啟可能較慢，額度耗盡則暫停至下月。這是成本受限測試環境，不保證正式站 SLA。
- 匯入驗證要求內容一致；Audit 的時間欄位明確綁定 DateTime2，避免驅動程式推斷為 DateTime 後四捨五入。素材批次匯入並於 SQL 計算 SHA-256，減少測試庫往返流量。
- 雲端端對端檢查：`TEST_BASE_URL=https://header-design-<deployment>.vercel.app node --env-file=.env.azure-runtime.local nuxt-site/scripts/check-cloud-site.mjs`。僅接受本次測試庫／暫存部署；檢查 SSR、品牌總數、案例分頁、超過 4.5MB 的 PDF 分段上傳／串流下載、CSRF 與素材權限，只建立並清除本輪隨機驗收帳號及其資料。
- 完整匯入／回滾演練、正式測試庫匯入及再次內容比對已通過（25 案例、879 來源商品、65 CMS 資源、297 素材）。Vercel Production 環境已設定獨立應用帳號；暫存部署以 `--prod --skip-domain` 建立，驗收透過已登入 Vercel CLI 取得測試存取 cookie，不關閉部署保護，不輸出憑證。
- 已驗證來源唯讀帳號無法讀取 CMS 帳號表，兩個應用帳號均被拒絕修改 `sync` 資料；首頁／案例／三品牌／門市線上 SSR 已回應 200。後台未登入時的 302 導向登入頁為預期行為，驗收直接檢查登入頁。
- 暫存部署端對端已通過：25 案例分頁 9／9／7、三品牌商品 749／60／38、5MB 以上 PDF 分段上傳及完整 SHA-256 下載、缺段／重送、CSRF 拒絕、私人素材 401／已發布素材可讀。驗收資料已清除，原始 CMS 資源未修改。本機亦已 additive 初始化新素材表；檔案模式遇交易回滾會清除該次新檔。

- 2026-09-29 使用者已同意測試期間放寬來源 IP，不加購固定 IP／Blob。CMS 素材使用既有 SQL 免費額度；一次性移轉管理密碼僅填入被 Git 忽略的 `.env.azure-sql.local`，不傳入 Vercel。
- Azure 已完成部署：資源群組 `rg-sakura-website-test`、伺服器 `sakura-website-test-20260929.database.windows.net`、資料庫 `SakuraWebsiteTest`，區域為 Southeast Asia。入口網站確認資料庫為 Online、免費方案，超額計費 Disabled，免費額度用完即暫停。
- 建立時使用「沒有存取權」；依使用者本次確認，已儲存並重新載入驗證測試規則 `VercelTestPublic-TLSRequired`（`0.0.0.0`–`255.255.255.255`），允許所有 IPv4 來源嘗試連線，仍須資料庫認證；規則名稱本身不負責強制 TLS，應用連線仍必須啟用加密及憑證驗證。Azure 服務通用存取例外未勾選、未啟用 Defender 付費試用。此設定降低網路隔離，僅供測試，正式公開前應收緊。
- 未加購固定 IP、Blob 或其他服務；SQL 免費額度用完暫停，不承諾其他既有雲端服務的流量完全不計費。
- Vercel 專案 `header-design` 同時綁定 `header-design-two.vercel.app` 與 `sakura-demo-vanlantech.com`。之後雲端後台變更只寫 Azure，本機仍用 `SakuraWebsiteDev`，不自動雙向同步；既有本機備份指令仍只適用檔案儲存模式，不當作雲端 SQL 素材備份。
- 原本機匯入器仍只允許 `127.0.0.1:14333/SakuraWebsiteDev`；本次使用另有固定目標保護的 Azure 匯入指令，不移除本機保護、不修改 SPA。
- 管理員密碼不存入本文件、Git、前端或聊天；官網應使用獨立最小權限帳號，不使用 SQL 管理員。Azure 簡易建立流程切換進階設定可能把輸入值帶入網址，避免分享建立流程網址或未遮蔽的診斷紀錄；先前輸入已要求更換，不應重用。

## 2026-09-29 正式 CMS（本機版本）

後台入口 `/admin`；本機正式建置驗收入口 `http://localhost:3120/admin`，原開發入口為 `http://localhost:3100/admin`。提案密碼仍保留；通過提案保護後，另以 CMS 帳號登入。此版本需要 Node 伺服器與 MSSQL，不能以純靜態網站部署。

### 操作與資料範圍

- 59 個編輯資源涵蓋首頁 8 個區塊、10 個廚房系列、消息／活動／影音、知識文章、門市／品牌館／設計案例、品牌介紹、服務／FAQ、加盟／建案、型錄與全站設定。資料庫保留 65 個資源，包含 6 個舊資料介面的相容版本；後台不顯示相容版本。
- 依固定結構編輯文字、圖片、連結、SEO、顯示與項目順序。集合中可新增、移除、搜尋及分頁，圖片集逐張使用媒體選擇器；來源商品／案例僅可設定上架、推薦與排序，新匯入來源項目會出現在管理介面，原名稱／規格／價格／圖片不回寫。
- 以「內容區域」為儲存及發布單位；同區域列表與內文原子發布。草稿不影響官網；預覽儲存後直接開啟同一套官網元件，可選擇內頁。版本還原產生新草稿，管理員另行發布。下架使資料 API 不再公開；單一項目可從集合移除或取消上架，再發布。全站共用資料下架會影響所有引用頁面，隱藏單一版面請使用「顯示此區塊」。
- 首次匯入是官網原始內容，沒有後台假資料。297 個既有素材已登錄媒體庫；新的圖片經 Sharp 解碼並轉為 WebP，PDF 使用 pdf-lib 解析驗證。圖片上限 10MB、PDF 上限 30MB；影片接受 HTTPS YouTube 連結或影片 ID，伺服器驗證網域並轉成固定 ID。僅被目前發布版本引用的上傳素材可匿名讀取，歷史／草稿引用素材不能封存，不提供永久刪除。
- 管理員管理帳號、發布／下架、版本還原、收件與留言；編輯者只能編輯草稿、上傳及預覽。8 小時工作階段存於 MSSQL，HttpOnly／SameSite Cookie、同來源及 CSRF 檢查、登入限速；停用／重設撤銷所有工作階段，最後一位管理員不能停用或降級。
- 加盟與建案表單真正入庫，保留同意版本／時間，以冪等識別碼避免重複建單。失敗保留輸入；收件有四種處理狀態與內部備註。留言待審核，公開結果僅含姓名、留言及日期。
- 欄位、權限與 409 衝突訊息在前端呈現，包含追蹤編號；連線資訊、密碼與伺服器堆疊只留伺服器日誌。全站錯誤頁不依賴 CMS 讀取，資料庫失聯時仍能顯示安全訊息與追蹤編號。後台使用原生捲動及 Noto Sans TC，沿用官網黑／金／白色系。

### 初始化與帳號

以下命令從專案根目錄執行。沿用 `.env.design-db.local` 的本機 SQL 管理連線及 `nuxt-site/.env` 的來源唯讀連線；管理連線只用於建置 schema／還原，Web 應用不使用 SA。

```sh
pnpm --dir nuxt-site cms:init
pnpm --dir nuxt-site cms:seed
pnpm --dir nuxt-site cms:assets
pnpm --dir nuxt-site dev --port 3100
```

`cms:init` 只新增 `cms` schema／必要資料表與 `sakura_website_cms` 帳號，權限為 `cms` CRUD + `sync` SELECT，保留原有帳號。CMS 密碼與儲存目錄追加至忽略版本控制的 `nuxt-site/.env`。`cms:seed` 相同基準內容跳過、保留所有使用者版本；可更新程式定義的欄位結構與介面標題。基準內容不同會整批回滾並列出衝突 ID，不覆蓋、不清表。不可直接修改 seed 後強制重匯既有資料；正式內容請透過後台編輯。

設定 `CMS_ADMIN_EMAIL`、`CMS_ADMIN_PASSWORD` 環境變數後執行 `pnpm --dir nuxt-site cms:admin` 建立首位管理員；救援使用 `cms:reset`，會撤銷工作階段且要求首次變更密碼。密碼須 12–128 字，採 Node scrypt 雜湊。後續帳號從後台建立，無郵件找回密碼。

本機管理員為 `admin@sakura.local`；臨時密碼只存於 `/Users/eric/.sakura-cms/local-admin.env`（權限 600，版本庫外），首次登入必須變更。驗收帳號在交付前停用。不要把這個憑證檔加入 Git。

### 持久化、備份與隔離還原

- `CMS_DB_USER`／`CMS_DB_PASSWORD`：CMS 專用登入。`CMS_DB_DATABASE` 可覆寫 CMS 資料庫，預設沿用 `NUXT_DESIGN_DB_DATABASE`；來源商品仍由 `NUXT_DESIGN_DB_*` 唯讀連線讀取。
- `CMS_MEDIA_DIR`：預設 `/Users/eric/.sakura-cms/media`，必須是建置目錄與版本庫以外的持久化絕對目錄；重啟不會清除。建議僅伺服器帳號可讀寫。
- 備份包含 CMS 內容／版本／媒體／帳號／收件／留言／操作紀錄及檔案；不備份工作階段、限速紀錄與 SPA 唯讀來源。來源資料由原有匯入與備份流程管理，CMS 不修改來源。

```sh
pnpm --dir nuxt-site cms:backup /absolute/path/to/new-backup
CMS_RESTORE_DATABASE=SakuraCmsRestore_example pnpm --dir nuxt-site cms:restore /absolute/path/to/new-backup
```

備份路徑必須全新；預設建立在 `~/.sakura-cms/backup-<timestamp>`，目錄權限 700、資料檔 600。還原只允許全新的 `SakuraCmsRestore_*` 資料庫，拒絕覆寫既有資料庫及素材目錄；還原逐表比對筆數，逐素材比對 SHA-256。切換驗證時設 `CMS_DB_DATABASE` 與還原命令輸出的 `CMS_MEDIA_DIR`，來源連線保持唯讀。本輪備份位於 `/Users/eric/.sakura-cms/acceptance-backup-20260929`，已還原至 `SakuraCmsRestore_acceptance_20260929`。使用 `scripts/check-cms-restore.mjs` 啟動自行管理的 3141 埠隔離伺服器，驗證登入、首次改密碼、最後管理員保護、發布內容與素材雜湊；測試只改隔離帳號密碼，因此每次須使用新還原環境。執行前設定 `CMS_RESTORE_DATABASE`、備份中的 `CMS_ADMIN_EMAIL`／`CMS_ADMIN_PASSWORD`，並以備份路徑作為參數。正式環境未變更；正式主機備份排程、加密保存、保存期限與災難復原切換於主機交接設定。

### 驗證與限制

```sh
pnpm typecheck
pnpm build
PREVIEW_URL=http://localhost:3120 pnpm --dir nuxt-site test:cms
# 僅在本機驗收資料庫：暫時發布測試文章／案例及商品下架，完成後依版本還原原始內容。
CMS_TEST_REAL_CONTENT=1 PREVIEW_URL=http://localhost:3120 pnpm --dir nuxt-site test:cms
TEST_BASE_URL=http://localhost:3120 node nuxt-site/scripts/check-kitchen-series.mjs
TEST_BASE_URL=http://localhost:3120 node nuxt-site/scripts/check-product-covers.mjs
# 本機正式建置啟動（另開終端）
cd nuxt-site
PORT=3120 HOST=127.0.0.1 node --env-file=.env .output/server/index.mjs
```

本輪通過：`pnpm typecheck`、`pnpm build`、41 個官網 SSR 路由、65 個內容 API、10 個系列與 215 張來源圖片、三品牌商品封面與總數回歸。受控瀏覽器實際驗證四種寬度的後台與首頁、搜尋／篩選／編輯／選圖／草稿預覽／發布、未儲存提醒、失敗保留輸入與追蹤編號、Escape／焦點返回；無水平溢出與 hydration 錯誤。減少動畫規則與動態偏好切換已實作；保留腳本的模擬環境檢查。

API 檢查自建並清除當次測試帳號、素材、收件及留言；預設只操作測試文件。擴充模式拒絕覆蓋已有未發布工作的正式資源，還原也使用版本條件，不靜默覆蓋並行編輯。驗證包含登入／角色／CSRF、私人草稿與素材、發布／下架／還原／409、三種圖片及 PDF、偽裝與超限拒絕、重複表單、留言審核、帳號重設與停用、工作階段撤銷、重跑匯入與衝突回滾，以及來源筆數／checksum 不變。並行儲存以同一 revision 同時送出兩次，驗證只有一次成功、另一次回傳 409。

`nuxt-site/scripts/check-admin.cjs` 保留可重跑的瀏覽器檢查；使用既有 Playwright 安裝（`NODE_PATH`），設定 `PREVIEW_URL`、`PREVIEW_PASSWORD`、`CMS_TEST_EMAIL`、`CMS_TEST_PASSWORD`。測試帳號須已完成首次改密碼；編輯測試只定位已展開的項目，避免與其他隱藏欄位混淆。腳本涵蓋搜尋／篩選、編輯、預覽、媒體選擇、焦點返回、減少動畫與 1440／1024／768／390px；截圖寫到系統暫存目錄。本輪互動驗收透過受控瀏覽器實際操作，未由終端執行 Playwright 腳本。

正式主機尚未部署、不寄信、不串外部 CRM、不回寫 SPA；也未提供自由拖拉版型、外部影片上傳或永久刪除。部署需 Node 執行環境、MSSQL 連線、HTTPS、持久化媒體目錄與備份排程，不能把舊 Vite 靜態部署設定直接當成正式 CMS 主機。Google Maps 現有 Marker 棄用警告仍存在，未影響本次 CMS 功能。

## 2026-09-28 案例門市卡片按鈕

- `/gallery` 門市卡片按鈕由「預約門市」改為「查看門市」，保留各自 `/gallery/:slug` 連結、樣式與動畫；其他真正的預約入口不變。本機修改，未部署。

## 2026-09-28 服務流程介紹標題

- `/service-process` 介紹區標題改為「從設計到實現，打造理想廚房」＋「Bringing Your Dream Kitchen to Life」。中文獨立一行，沿用既有中文字型；保留英文金色強調、響應式尺寸、區塊版型與進場動畫。Hero `Our Process`、說明內文與流程內容不變。本機修改，未部署。

## 2026-09-28 淨水設備分類標題

- `/products/sakura/category/9` 商品列表區的英文標題由 `SAKURA Kitchen Appliances` 改為 `Smart Appliances for Better Living`。保留原樣式與動畫，上方 Hero `Kitchen Appliances`、中文分類名稱與其他分類不變。`check-product-covers.mjs` 加入此頁及相鄰分類的 SSR 標題檢查。本機修改，未部署。

## 2026-09-28 商品分類封面對照 SPA 修正

- 修正原本直接取分類下第一項商品作封面的問題：淨水設備、龍頭、水槽、收納五金、門板、檯面使用 SPA `frontend/public/menu-*` 的六張專用分類封面，原檔複製至 `public/products/categories/`；不再用濾芯、皂液器或單色色樣代表整類產品。
- 其餘分類沿 SPA 的分類 Sort 順序向下找商品主圖，保持品牌隔離並排除明確標記的配件／情境圖；三品牌共用選圖邏輯。僅分類封面改變，商品內頁圖集、資料庫、數量、連結及排序不變。分類卡片維持原版型，圖片完整 contain 並補上留白，避免產品貼邊。
- 本機修改，未部署；SPA 原始專案及資料庫不修改。
- 驗證通過：`pnpm typecheck`、`node nuxt-site/scripts/check-product-covers.mjs`（唯讀測試，不寫資料庫），涵蓋三品牌 32 張分類封面 HTTP／SSR、分類連結、子分類選圖、六張本機素材內容及原產品總數。瀏覽器確認 SAKURA 16 張圖片均載入，1280px 桌機及 390px 手機使用 contain 留白、無水平溢出。

## 2026-09-28 SAKURA 介紹區中英文主標修正

- `/products/sakura` 的介紹區大標改為「廚房產品」＋「Elevate Your Kitchen with SAKURA」；中文不再只放在小標籤，移入同一個 h2 並獨立一行，使用既有中文字型。移除該區重複的中文小標籤，保留英文金色強調與進場動畫。上方 Hero `Kitchen Appliances`、SVAGO／TEKA 文案均不變。本機修改，未部署。

## 2026-09-28 商品 Hero 標題統一

- 三品牌 SAKURA／SVAGO／TEKA 的品牌頁、全部商品與分類列表（含舊 SAKURA 除油煙機網址），Hero 大標統一為 `Kitchen Appliances`，移除品牌前綴。僅修改兩個共用 Hero 的文字，保留樣式、動畫、麵包屑及下方區塊文案；商品詳情原本沒有這段 Hero 大標，不另新增。本機修改，未部署。

## 2026-09-28 產品系列跑馬燈連結

- 商品列表下方的品牌／產品系列文字改為整個項目可點擊的 NuxtLink，直接沿用資料庫分類 route 導向對應產品列表；三品牌共用，不導回品牌總覽。保留原尺寸、顏色及 Hover 持續播放，加入手指游標與鍵盤焦點框；無縫輪播的複製組仍可滑鼠點擊，但不重複進入 Tab 順序。本機修改，未部署。
- `check-products.mjs` 加入三品牌跑馬燈 SSR 驗證：每個系列與複製組都必須連到自己的分類列表，複製組不重複進入鍵盤順序。
- 驗證通過：型別檢查、三品牌系列連結及 847 項商品回歸；瀏覽器實測「歐化系列」導向 `/products/sakura/category/29`、顯示 7 項且 `scrollY=0`，跑馬燈維持 running、游標為 pointer。

## 2026-09-28 三品牌商品資料串接（本機）

- 使用 SPA `KitchenBuy/` 2026-03-19 快照，原檔複製至非公開 `private/kitchen-buy/`；只解析 literal INSERT，絕不執行來源 DROP／ALTER。與 SPA 相同採「展板」通路，避免混入另一通路重複資料；原始混合通路快照保留。SPA 專案與資料庫不修改、不部署。
- 在既有獨立 `127.0.0.1:14333/SakuraWebsiteDev` 新增八張 `sync.BuyKitchen*` 表，共用伺服器端唯讀連線。先 `node --env-file=.env.design-db.local nuxt-site/scripts/product-db.mjs init`，再 `node --env-file=.env.design-db.local nuxt-site/scripts/product-db.mjs import`；`inspect` 只檢查快照。匯入使用原有獨立 INSERT 帳號、SERIALIZABLE 交易，相同資料跳過、衝突整批回滾、不 UPDATE／DELETE。
- 上游規格表同一 ID 包含多項規格及尺寸版本，因此保留原始 id，另以完整資料列 SHA-256 作 rowKey；只去掉完全相同資料列，不依 ID 丟棄其他規格。其餘表沿用來源 ID／複合關聯鍵。價格、附件與規格僅呈現來源實際存在的內容，不以別款商品補缺漏。
- 三品牌共 **847 項：SAKURA 749、SVAGO 60、TEKA 38**（包括五金／板材等 SPA 產品，不等於 847 款廚電）。八表 Classes／Products／Features／ProductClass／ProductFeatures／ProductPrices／ProductProperties／PublicFiles 匯入數為 **226／879／1150／2282／2713／539／6632／2288**；Products 中另有 Electrolux 32 項，API 不開放該品牌。來源 46 筆跨通路／缺項分類關聯原樣保留，網站依 SPA 使用的產品分類路徑及實際品牌成員產生可用分類。
- `/products/{sakura,svago,teka}` 共用原 SAKURA 品牌版型；`/all`、`/category/:category` 為每頁 12 筆的搜尋／分類列表，`/item/:id` 共用原商品內頁、圖集、特色、價格、規格對話框、官方附件及相關商品。SAKURA 舊除油煙機／近吸／型號網址保留。首頁品牌卡片、跑馬燈、選單及 Footer 連結已接入；型錄預覽依品牌選用櫻花或進口廚電型錄。固定分類麵包屑，返回列表保留搜尋及頁碼，不加入上一個商品名稱。
- 唯讀 API：`GET /api/products/:brand/categories`、`GET /api/products/:brand/items?category=&q=&page=1`、`GET /api/products/:brand/items/:id`。查詢綁定參數、品牌隔離，非法參數 400、不存在商品／分類 404；資料庫失敗沿用已遮蔽機密的 503 原因及重試畫面，不回退舊靜態資料。圖片／附件限官方 HTTPS 來源。舊 `public.sakuraProductEndpoint` 不再供商品頁使用。
- 驗證指令：`node --env-file=.env.design-db.local nuxt-site/scripts/check-products.mjs --assets`。八表筆數、重複匯入零新增、衝突交易回滾、唯讀拒絕寫入、原 25 筆設計案例、三品牌全部分頁／分類／847 個內頁／規格比對及舊網址均通過；2,202 個不重複外部圖片／附件 HTTP 檢查零失敗。型別檢查及正式建置通過（既有 Tailwind sourcemap 警告仍在）。
- **來源缺項不等於串接失敗**：SAKURA 有 1 項無圖片、375 項無特色、388 項無正價售價、64 項無規格、421 項無附件；SVAGO 有 8 項無規格、2 項無附件；TEKA 有 12 項無附件。前端顯示缺項／洽門市提示。此為 SQL 快照匯入後由官網 MSSQL 提供資料，**不是即時同步 SPA**；後續快照更新須先審核衝突，不自動覆寫。正式公開前須確認展板通路商品的上架範圍及可連線 MSSQL，本次不部署。
- 響應式保留既有 SAKURA 版型，長尺寸／型號允許換行，避免手機上擠壓價格；手機規格表兩欄自動換行，不需橫向捲動才能讀取完整內容。
- 商品分頁／搜尋變更只改 query，原路由原本略過這類捲動重設；共用 router 現在針對商品 `page`／`q` 變更回到頁首，其他頁的 query 與錨點行為不變。
- 既有 `check-route-scroll.cjs` 更新商品 ID 連結，加入三品牌分頁→商品→返回第二頁的回歸情境。
- 瀏覽器實測 1280px 桌機／390px 手機：SVAGO 列表→內頁→規格→返回搜尋（VEG）條件保留，TEKA 圖片／手機規格表／分頁無橫向溢出，修正後分頁 `scrollY=0`。不存在商品前端顯示 404 與原因；另啟隔離正式建置程序以錯誤 DB 連接埠模擬斷線，品牌頁／列表／內頁／API 均回 503、原因及重試可見，不改動正常資料庫。測試程序已停止，正常預覽維持 `http://localhost:3100`。

## 2026-09-28 SAKURA 廚房產品文案

- `/products/sakura` 介紹區塊的小標改為「廚房產品」，主標改為「Elevate Your Kitchen with SAKURA」。沿用原金色強調、版型及進場動畫；不修改加盟頁的同名舊標題。僅本機修改，尚未部署。

## 2026-09-28 十個品牌系列完整內頁

- `/home-style/{aikitchen,basic-plus,clever,loft-chic,joyful,premium,elegant,chef,country,harmony}` 共用原 AI Kitchen 的 Hero、套系／特色圖集、板材顏色、iCare 預約、廚電推薦及案例區塊。Hero 整體布局保留待確認；標題改為各系列名稱，沿用首頁 `hero-template-title` 字型／斷點與每 5 秒重啟的 `hero-copy-cycle` 動畫，減少動態偏好下停播。
- AI Kitchen 原資料保留於 `data/kitchenSeries.ts`；其餘九系列依櫻花正式網站各品牌頁於 2026-09-28 取得的內容，保存於 `data/kitchenSeriesContent.json`，每筆附來源 URL。Hero 使用已提供的 10BN 圖片，其他圖片使用官方來源；沒有捏造規格或複製 AI 套系。來源未提供個別廚電連結者使用靜態卡片，已有外部產品連結者另開分頁；五金型錄保留原連結。
- Basic+、Clever、Country 官方未提供推薦案例，保留推薦區塊並顯示空狀態與設計靈感入口。所有系列保留立即預約 SAKURA iCare；首頁 Hero、品牌卡片、Header 及系列抽屜已啟用對應內頁。未知系列回傳 404，跨系列重新建立頁面狀態，避免沿用前一個系列內容。
- 本次僅本機修改、不部署、不修改 SPA 或資料庫。驗證指令：`pnpm typecheck`、`pnpm build`、`node nuxt-site/scripts/check-kitchen-series.mjs`。
- 驗證完成：十頁 SSR、未知系列 404、215 個圖片來源（本機檔案存在／外部 HTTP 圖片回應；加上 `--images` 可重跑外部檢查）、套系鍵盤操作及動畫回歸。瀏覽器實測 1280px 桌機與 390px 手機、巧域切換潮派後 `scrollY=0` 且套系重設、五金型錄另開分頁與無橫向溢出。型別檢查與正式建置通過；建置仍有 Tailwind sourcemap 警告，不影響產出。只有一張 Hero 圖片時停用前後切換按鈕，標題動畫仍依首頁週期播放。

## 2026-09-28 設計靈感 MSSQL 串接

- 本次以 SPA DesignCloud 快照建立獨立 `SakuraWebsiteDev` 開發資料庫；容器使用 `compose.design-db.yml`，僅綁定 `127.0.0.1:14333`，不共用或修改 SPA 資料。Apple Silicon 的 SQL Server 2022 amd64 模擬環境需通過啟動驗證才能進行匯入；本次不部署。

### 本機啟動與匯入

1. 安裝 Node.js 22+、pnpm、Docker Desktop。將根目錄 `.env.design-db.example` 複製為 `.env.design-db.local`，填入三組不同的強密碼；此檔已被 Git 忽略。本機已完成設定，**不要覆蓋現有環境檔或重設既有帳號密碼**。
2. 在專案根目錄執行：

   ```sh
   pnpm install
   docker compose --env-file .env.design-db.local -f compose.design-db.yml up -d
   docker compose --env-file .env.design-db.local -f compose.design-db.yml logs --tail 30
   pnpm --dir nuxt-site db:init
   pnpm --dir nuxt-site db:import
   ```

3. 按 `nuxt-site/.env.example` 將 `NUXT_DESIGN_DB_*` 加到既有 `nuxt-site/.env`，保留 Google Maps 等其他設定。`NUXT_DESIGN_DB_PASSWORD` 使用 `WEBSITE_DB_READER_PASSWORD`，不使用 SA／匯入帳號。這些設定只在 Nuxt 伺服器端；修改後重啟 `pnpm dev --port 3100`。本機預覽為 `http://localhost:3100/design-inspiration`，仍需原有提案預覽密碼。
4. 停用只執行 `docker compose --env-file .env.design-db.local -f compose.design-db.yml stop`，重啟使用 `start`。資料存於獨立 volume `sakura-website-dev_website-sql-data`；**不要使用 `down -v` 或刪除 volume**。

### 資料與權限

- 五份來源為 SPA `DesignCloud/` 的 2026-02-11 SQL 快照，保留於根目錄 `private/design-cloud/`，不放 `public/`、不打包進前端。只解析 allowlist 資料表、欄位及 INSERT literal，原檔的 DROP／CREATE／ALTER 絕不執行。來源中 PDF、CaseFile 記錄為維持關聯原樣匯入，但網站 API **只公開 Image**，不提供報價或 ZIP 下載。
- `db:init` 只建立缺少的 `SakuraWebsiteDev`／`sync` 表／帳號與 nullable `Tags.Sort`，不清空資料、不重設既有登入。ID 與 FK 保留；中文字串用 Unicode，案例說明用 `nvarchar(max)` 避免截斷來源長文。
- `sakura_website_import` 只有 sync SELECT／INSERT；`sakura_website_reader` 只有 sync SELECT。兩者均禁止 UPDATE／DELETE／ALTER；SA 僅供本機初始化及驗收臨時資料。所有帳密留在被忽略的環境檔。
- 匯入器只接受 `127.0.0.1:14333/SakuraWebsiteDev`，每批使用 SERIALIZABLE 交易：相同 ID 且內容相同跳過；不同內容列出 ID／衝突欄位並整批回滾；不覆寫、不刪除、不使用 data-loss 指令。預期案例／標籤／關聯／檔案／屬性依序為 **25／46／200／182／200**。只在這份固定開發快照執行驗收，不針對正式庫。

### API 與頁面

- `GET /api/design-inspiration/filters`、`GET /api/design-inspiration/cases?form=&style=&page=1`、`GET /api/design-inspiration/cases/:id`；固定 9 筆一頁，名稱＋ID 排序，型式與風格交集。僅 `IsWebsite=1` 可見，不受 `IsBoard` 限制。清理標籤尾端空白，接受舊 `ㄇ型+中島` 別名。重複參數、非法頁碼／未知篩選回 400，未公開／不存在 ID 回 404，連線／查詢錯誤回 503 並顯示已遮蔽機密的原因與重試按鈕。
- 列表保留原 Hero／卡片版型，改為 25 筆設計案例，說明最多兩行；內頁 `/design-inspiration/:id` 使用原案例輪播、實際八項規格與說明。固定麵包屑「首頁／設計靈感／設計案例」，返回連結保留篩選／頁碼。SSR 讀取，不用舊靜態門市故事掩蓋連線失敗；原 `/gallery` 門市案例繼續保留。
- 移除設計靈感專用的舊靜態列表／型別，門市故事本體 `data/storeCases.ts` 保留。共用案例輪播的縮圖改為僅橫向捲動縮圖列，避免 `scrollIntoView` 初始化時帶動整頁；不改門市案例視覺。

### 驗收與部署限制

```sh
pnpm --dir nuxt-site test:design-db
pnpm typecheck
pnpm build
```

- `test:design-db` 驗證解析、筆數、重複匯入、衝突／外鍵失敗回滾、FK、最小權限、API 9／9／7 分頁、42 種篩選交集、空集合／400／404、25 筆內頁、未公開／IsBoard=0、SSR 與密碼未外洩。預設測試 `http://localhost:3100`，可設 `PREVIEW_URL`／`PREVIEW_PASSWORD`；只短暫新增並清理隨機 ID 的驗收資料，不修改原 25 筆案例。既有 `check-route-scroll.cjs`、`check-smart-breadcrumbs.cjs` 已補新內頁驗證（需原有 Playwright 測試環境，本次未跑全站迴圈，改以瀏覽器實際操作相關路徑）。
- 已通過本機 SQL Server 2022 Developer CU27 啟動與連線、匯入筆數及上述資料庫／API 測試；132 個圖片 URL HEAD 均為有效圖片。桌機 1280px／手機 390px 檢查列表、圖片、8 項規格、輪播、麵包屑及跳轉頂端；無水平溢出。型別檢查與正式建置通過。
- 正式建置以 Node server 本機啟動後也通過完整 `test:design-db`。另實際停止／重啟獨立官網容器：前端顯示 `HTTP 503 / ESOCKET` 與原因，點「重新載入」恢復 9 筆第二頁卡片；手機分頁進入案例再點麵包屑返回，仍是第 2 頁且 `scrollY=0`，桌機風格篩選返回也保留。原 `/gallery/case56` 標題、版面及頂端定位正常。
- 本機已驗證但未部署；**Vercel 無法連到開發者電腦的 localhost**。正式部署前必須配置可連線的 MSSQL／憑證／防火牆及唯讀帳號，正式環境 `NUXT_DESIGN_DB_TRUST_SERVER_CERTIFICATE=false`。Docker amd64 在 Apple Silicon 的模擬執行不屬 Microsoft 官方支援環境，不作正式主機；不使用已退役 SQL Edge。

## 2026-09-28 全站輪播 Hover 複查

- AI Kitchen 最後的推薦設計案例輪播原已在 Hover 時持續播放，本機停留 4.5 秒確認滑至下一張。掃描 Nuxt 站的輪播與跑馬燈後，發現首頁門市名單翻牌仍在 Hover 時暫停；已移除這兩個滑鼠進出暫停事件，讓四個標籤在懸停時也持續翻牌。本機重測 Hover 4.2 秒後門市標籤確實更換；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。鍵盤焦點暫停、系統減少動態效果及其他輪播原有的拖曳處理不變。本次未部署。

## 2026-09-28 AI Kitchen 廚電推薦標題

- AI Kitchen 廚電推薦區塊的小標由 `Kitchen Appliances` 改為「廚房電器推薦」，主標由電子報佔位文案 `Join Our Newsletter Stay Up To Date` 改為 `Explore Our Kitchen Appliances`；保留兩行版型、動畫與推薦商品卡片。本機預覽確認雙語標題與五張商品卡片正常顯示；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。本次未部署。

## 2026-09-28 AI Kitchen 板材色卡預約 CTA

- 板材色卡下方新增獨立的置中「立即預約」CTA 區塊，沿用全站圓角文字＋金色箭頭的按鈕樣式；點擊以新分頁開啟指定的 `https://pse.is/9kq37z`，並加上 `noopener noreferrer`。短網址目前轉向 SAKURA iCare 登入頁，但轉址所帶 token 的到期時間為 2026-05-27，已過期；同一短網址也用在案例內頁，若預約流程失效，需由對方提供新的有效連結。本機確認按鈕位於六張色卡下方、游標為手指、連結具備 `_blank` 與安全屬性，頁面無主控台錯誤；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。本次未部署。

## 2026-09-28 AI Kitchen 板材顏色標題

- AI Kitchen 板材顏色區塊的小標由 `Material Selection` 改為「板材顏色選擇」，主標由 `Gallery Of Inspiring Kitchen Designs` 改為 `Explore Our Color Collection`；沿用原本兩行標題、字級、動畫及圖片卡片。本機預覽確認小標、主標與六張色卡正常顯示，`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。本次未部署。

## 2026-09-28 AI Kitchen 去小標後位置

- 移除 Hero 小標後，主標與 CTA 維持移除前的原位置；原標籤高度實測為 32px，於桌機及手機標題上距補回同等空間，不把標籤或隱藏文字留在 DOM。本機桌機實測主標 top=174px、CTA top=352.8px，與保留原標籤時完全一致；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。本次未部署。

## 2026-09-28 AI Kitchen Hero CTA 動畫

- AI Kitchen 首屏圓形 CTA 改用首頁 Hero 相同的 900ms 延遲、慢速淡入；動畫改掛在實際 DOM 容器上，修正原本掛於 `NuxtLink` 卻未生效的問題。解除按鈕裁切，讓既有共用金色水波能完整向外擴散。保留 AI Kitchen 原有的文案、尺寸、位置與 Hover 換字／填色。本機確認按鈕位置仍為原座標、動畫標記與水波正常；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 通過。本次未部署。

## 2026-09-28 AI Kitchen Hero 小標

- `/home-style/aikitchen` 的 Hero 移除 `Trusted Design Partner` 小標籤，其餘標題、CTA 與區塊內容保持不變。本機預覽確認小標消失、主標與 CTA 正常顯示；`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。本次未部署。

## 2026-09-28 首頁門市翻牌與游標

- 未篩選、未手動選店時，右側四張門市卡片依序輪流翻牌，不再固定保留預設的承德店；若翻到目前選取的門市，翻牌完成後同步更新地圖標記。選擇區域或手動點選門市後，保留選取卡片，避免查看地圖時突然換店。可點選卡片明確顯示手指游標。本機連續觀察五次翻牌，四個位置均有更換；卡片及文字區的游標皆為 `pointer`，頁面無主控台錯誤。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。本次未部署。

## 2026-09-28 首頁門市地圖標記外連

- 首頁門市地圖的黑色「S」標記改為可點擊，以新分頁在 Google Maps 定位目前選取門市的地址；標記標題同步顯示門市名稱，游標為手指。右側門市卡片仍只負責切換地圖，不改原操作；快速切換門市時忽略較舊的定位回應，避免標記與連結指向不同門市。原本試用「門市名稱＋地址」搜尋，但民權店會停在搜尋列表，故改用地址定位；若須保證開啟每間店的商家資料頁，需取得各店 Place ID 或官方 Maps 分享連結。本次未部署。
- 本機實測承德與松竹切換後標記名稱同步更新；點擊松竹標記另開 Google Maps 並定位至松竹路一段 763 號，民權路二段 68 號亦以地址查詢確認可定位。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。

## 2026-09-28 首頁門市區塊標題

- 首頁 `STORE LOCATOR` 區塊主標由 `Have a Project in Mind? Let’s Make It Happen` 改為「櫻花整體廚房／全台門市據點」兩行，第一行黑色、第二行金色；改用既有中文襯線標題字型與強調字重。建商專區的同類英文標題不屬此首頁區塊，未更動。本次未部署。

## 2026-09-28 全站可點選區塊游標

- 共用樣式將可點選的連結、按鈕、選單、分頁、表單選項及關聯標籤顯示為手指游標；停用項目不套用，原有拖曳／放大游標保留。僅調整游標，不改連結或點擊行為。
- 本機抽查首頁、設計靈感列表、廚電列表、優惠活動列表、品牌介紹及後台：可用連結／按鈕均為手指；品牌介紹的六個放大圖片鈕保留更明確的放大游標，首頁停用「拍立配」維持預設游標。`pnpm --dir nuxt-site build` 與 `git diff --check` 通過；本次未部署。

## 2026-09-28 首頁品牌承諾標題

- 首頁品牌承諾區塊的小標由 `Brand Commitment` 改為「品牌承諾」，主標由 `SAKURA has created exceptional` 改為 `Why SAKURA KITCHEN`；保留原本黑金分色、版型與內文。本次未部署。

## 2026-09-27 首頁設計案例輪播導向

- 「設計案例」主背景圖與兩張縮圖依序對應安康 `case10`、承德 `case56`、松竹 `case35` 的現有案例內頁；圖片及箭頭改用手指游標。內容容器讓出背景空白處的點擊層，保留標題、CTA、縮圖與箭頭各自的操作；拖曳縮圖仍只切換輪播、不誤觸導覽，鍵盤 Enter 仍可開啟連結。背景自動輪播不因滑鼠 Hover 暫停，只在按住背景／縮圖時暫停，避免點擊期間換張；減少動態效果偏好仍生效。既有路由捲動回歸腳本納入首頁案例縮圖跳轉。本次未部署。
- 本機瀏覽器確認背景空白處、縮圖及箭頭游標皆為手指；停留標題超過一個 3.2 秒週期後背景仍換張。實際點擊背景進入承德 `case56`，縮圖分別進入安康 `case10`、松竹 `case35`；拖曳只換圖、不跳頁。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、回歸腳本語法及 `git diff --check` 通過；未重跑完整路由捲動回歸。

## 2026-09-27 首頁設計案例佔位文案

- 移除「設計案例」標題下方的 `Lorem ipsum` 英文佔位段落及不再使用的專屬樣式；保留 `SHOWROOM PROJECTS` 分類標籤、標題、輪播與「更多設計」CTA。段落移除後 CTA 自然上移，不新增空白佔位。本機預覽確認文案消失、CTA 可見，`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過；本次未部署。

## 2026-09-27 首頁設計案例標題

- 首頁原 `Kitchen Design` 區塊標題改為「設計案例」，使用既有中文襯線標題字型；原標題尺寸、區塊位置、案例輪播及「更多設計」連結不變。本機預覽確認標題正常顯示，`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。本次未部署。

## 2026-09-27 首頁品牌 Logo 跑馬燈

- 廚房產品下方跑馬燈移除 TLK Kitchens 與 SAKURA Home，加入沿用網站頁首素材的 SAKURA KITCHEN。SAKURA 連至 `/products/sakura` 廚電列表，SAKURA KITCHEN 連至 `/home-style/aikitchen`；可點區域涵蓋 Logo 周圍原有留白，方便在移動中點選。四款 Logo 改為重複五組並調整位移週期，避免 4K 寬螢幕露白，同時維持原本跑動速度與樣式。
- 本站目前沒有 TEKA、SVAGO 列表頁；其 Logo 暫時保留但不連到不存在的頁面，待確認確切網址或建頁內容後補上連結。本機瀏覽器確認四款 Logo 順序、兩個已存在頁面的導向及動畫週期；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。本次未部署。

## 2026-09-27 首頁廚房產品卡片文案

- 首頁「廚房產品」三張卡片依序以指定的 SAKURA、SVAGO、TEKA 中文文案取代原英文範本；移除舊三行截斷，確保較窄版面也顯示完整文案。文案改用既有正文灰色，手機版右側預留浮動按鈕寬度，避免句尾被遮住；圖片、品牌順序、卡片連結與整體版型不變。本次未部署。

## 2026-09-27 首頁廚房產品主標

- 首頁 `KITCHEN PRODUCTS` 區塊主標由 `Explore Our Comprehensive Kitchen Design Services` 改為「廚房產品」；維持原本白色／金色分段、各斷點字級與區塊版型，改用既有中文襯線標題字型與 600 字重，避免英文標題樣式直接套到中文。本次未部署。

## 2026-09-27 首頁品牌系列中文字型

- 「品牌系列」由英文模板標題改為中文後，原本仍使用 `font-display` 與 400 字重，視覺偏細。已改用全站既有的中文襯線標題字型與強調字重，微調行高、字距；保留標題字級、黑金分色與區塊版型。本機預覽確認，尚未部署。

## 2026-09-27 全站輪播 Hover 行為

- 首頁風格、品牌系列、廚房商品、門市案例、品牌家族、關於我們品牌紀事與 AI 廚房推薦案例輪播，及產品分類、建商合作、加盟頁跑馬燈，均改為滑鼠懸停時持續播放；原有播放間隔與切換動畫不變。
- 保留鍵盤焦點暫停、手動拖曳後停播（原本有此行為的輪播）、系統「減少動態效果」設定及產品跑馬燈進入可視範圍才播放的邏輯。首頁門市名單當時因可點選而保留懸停暫停，已於 2026-09-28 補齊持續翻牌。本次未部署。
- 本機實測品牌系列輪播在 Hover 且未取得鍵盤焦點時持續換張，近吸系列產品跑馬燈在 Hover 時的播放狀態仍為 `running`；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 通過。

## 2026-09-27 首頁品牌系列標題與內文

- 首頁原 `Creative Projects That Define Our Style` 區塊主標改為「品牌系列」，沿用原標題的黑色與金色分段樣式；同區塊英文小標同步由 `FEATURED PROJECTS` 改為 `BRAND SERIES`，避免標示不一致。底部引言改為「櫻花整體廚房用心找出未曾注意的生活需求，發展出不同生活行為的廚房空間概念、並融合多元設計風格，與消費者一起打造符合每個家庭的理想廚房」。本機預覽與 `pnpm --dir nuxt-site typecheck` 已確認；本次未部署。

## 2026-09-27 首頁風格跑馬燈圖片對應

- 首頁 Hero 下方六種風格的懸浮預覽改用 `提案後新增用圖/0.0首頁/10BN-搭配風格` 對應圖片，重用前次匯入的 `public/home-2026/hero/10bn/*.webp`，不重複存檔：現代風→Chef、輕奢風→Clever／Premium、北歐風→Joyful、工業風→Loft Chic、美式風→Elegant、鄉村風→Country。僅輕奢風在兩張同風格圖片間輪替，其餘固定顯示；圖示、文字、設計靈感篩選連結及跑馬燈版型不變。本機逐項焦點測試六種風格圖片均對應正確，輕奢風輪替正常；手機預覽隱藏且最終無水平溢出，`pnpm --dir nuxt-site typecheck` 與 `pnpm --dir nuxt-site build` 通過。本次未部署。

## 2026-09-27 首頁品牌系列 Hero 素材

- 依 `提案後新增用圖/0.0首頁/10BN-搭配風格` 的 1–10 編號圖片，轉為 1920px 以下的 WebP 放在 `public/home-2026/hero/10bn/`；首頁 Hero 輪播改為 10 張，文字採 `品牌系列-10BN介紹文案.docx` 的對應系列段落，沿用原版型與轉場。為避免十張圖同時下載，僅預載下一張。本機確認圖片正常載入、無水平溢出，`pnpm --dir nuxt-site typecheck` 與 `pnpm --dir nuxt-site build` 通過。
- 本站目前只有 `/home-style/aikitchen` 一個品牌系列內頁，其餘九頁尚未建置；已向使用者確認連結處理方式，未建立虛構連結。本次未部署。

## 2026-09-27 拍立配浮動圖示

- 從使用者提供的 `提案後新增用圖/0.0首頁/拍立配icon.svg` 找到專用白色圖示，原圖已含「拍立配」文字；加入 `public/floating-icons/pailipei.svg`，替換臨時純文字標籤，維持右側灰色按鈕列與原圖完整比例。目標連結尚未提供，按鈕仍停用；本次未部署。本機預覽已確認圖示顯示正常、檔案可讀取，`pnpm --dir nuxt-site typecheck` 通過。

## 2026-09-27 右側懸浮拍立配標籤

- 右側懸浮快捷列的兩顆灰色服務按鈕下方新增等寬灰色「拍立配」標籤，先以停用按鈕呈現；icon 與目標連結待提供後再啟用，避免暫時導向錯誤頁面。沿用原有懸浮位置與捲動行為，本次未部署。
- 本機 1440／390px 確認新標籤緊接兩顆灰色按鈕、寬度分別為 74／72px、頁面完成進場後無水平溢出；開發型別檢查與 `git diff --check` 通過。

## 2026-09-27 右側懸浮設計案例入口

- 全站右側懸浮主按鈕文字由「案例門市」改為「設計案例」，連結改為 1.2 設計靈感列表 `/design-inspiration`；圖示、尺寸、位置及其他服務按鈕維持原樣。本次未部署。
- 本機 1440／390px 從首頁捲動後實際點擊，均進入設計靈感列表且停在頁首，無 JavaScript 錯誤；開發型別檢查與 `git diff --check` 通過。

## 2026-09-27 首頁 Hero 圓形 CTA 文字

- 首頁 Hero 圓形 CTA 一般狀態與滑鼠移入狀態均改顯示「探索設計案例」，無障礙名稱同步更新；維持原有圓形尺寸、水波與淡入淡出動畫，連結仍通往設計靈感頁。本次未部署。
- 本機 1440／390px 確認 CTA 文字與連結、120px 圓形及水波動畫，桌機滑鼠移入後兩層文字透明度由 `1/0` 切換為 `0/1`；開發型別檢查與 `git diff --check` 通過。

## 2026-09-27 首頁品牌系列游標

- 首頁 Hero 邊緣「品牌系列」開合按鈕及展開後的可點選系列按鈕使用手指游標；保留原有點擊、選單與響應式行為。本次僅調整游標樣式，未部署。
- 本機桌機瀏覽器確認兩處計算後的 `cursor` 均為 `pointer`，品牌系列選單可正常展開；`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。

## 2026-09-23 更新預覽密碼

- 依需求恢復含符號與年份後綴的預覽預設密碼，取代 09-11 的密碼設定；保留登入成功後固定 3 小時到期與原有驗證流程。舊密碼簽發的權杖不再通過伺服器驗證，需重新登入。
- 本次未推送或部署；若部署環境設有 `NUXT_PREVIEW_PASSWORD`，需同步更新該環境變數並重新部署，否則仍會覆蓋程式預設值。
- 本機驗證新密碼登入 200 且可存取受保護頁面、舊密碼 401 並附完整錯誤、舊密碼簽發的權杖被導回登入頁；兩顆 Cookie 與權杖期限仍為 3 小時。開發型別檢查、既有期限自我檢查及 `git diff --check` 通過；未重跑正式建置或全站回歸。

## 2026-09-17 專案合約草案

- 依提供之球類俱樂部開發合約格式，產出 `output/doc/SAKURA_Kitchen_品牌網站開發委託合約書_草案.docx` 及對應 `output/pdf/SAKURA_Kitchen_品牌網站開發委託合約書_草案.pdf`；沿用黑白條款與雙欄簽署區並置入提供之公司大小章。
- 依目前 Nuxt 多頁官網整理範圍，CMS 按展示雛形擬定，正式 CMS 與表單收件服務須另列確認；補充交付、驗收、素材授權及獨立保密協議。開發金額為未稅新臺幣 120,000 元、營業稅 6,000 元、含稅總價 126,000 元；不收訂金或預付款，改為驗收通過後 7 日內一次支付 126,000 元，開工不再以款項入帳為條件。保固自驗收通過之日起一年，年度代管維護仍另行約定。甲方、工期、修改輪次及附件版本待填；桃園管轄沿用範本，保密 5 年、24 小時事故通知與 15 日資料處理為本次擬定條件，仍需雙方確認。
- 乙方公司、負責人、統編、電話及匯款資料沿用使用者提供之範本；原 PDF 與公司章壓縮檔均保留。合約包含用印影像，不作為公開網站素材，未推送或部署。
- 本次修訂：依指定刪除第一條第三款整段（交付清單／設計稿版本欄位、附件確認及約定優先順序）；移除標題下方「報價單編號」及空白線，保留專案標的；保固確認為驗收通過之日起一年，移除簽約待填欄位中的保固日數；付款修訂已移除 30%／70% 分期表、簽約款及預付款入帳條件；保留終止結算、原始碼交付及保密條款。刪除第一條第三款後已逐頁檢查 4 頁 Word／PDF，無多餘空白頁，全文與表格文字一致；未稅、稅額及含稅總價正確，舊分期與開工付款條件已移除，公司章保持原檔。
- 條款參考：[智慧財產局著作權法第 12 條](https://www.tipo.gov.tw/tw/copyright/694-17729.html)、[營業秘密 FAQ](https://www.tipo.gov.tw/tw/tradesecrets/242.html)；合約保密範圍與法定營業秘密要件分別處理。


## 2026-09-14 CMS 提案雛形

- **精簡與官網配色**：後台直接沿用官網共用品牌金 `--gold`（#CAA05C）、近黑 `--ink`（#1C1C1D）、灰字 `--ink-80`（#59585D）、白色卡片與淺灰背景，移除橄欖綠。移除側欄宣傳文字、英文副標、頁尾標語、內容／媒體頁介紹大卡和重複的展示說明；保留固定展示標記、必要操作提示及完整錯誤。縮小頁首、卡片與表單間距；非主視覺區塊移除右側說明欄，預覽填滿剩餘空間。本輪型別檢查、正式建置、回歸腳本語法與差異檢查通過；透過瀏覽器驗證四路由 × 1440／1024／768／390px，無水平溢出或圖片錯誤。實測主視覺改字、換圖、放大預覽、焦點返回、四區塊切換、手機選單、內容搜尋／分類／狀態篩選、內容編輯預覽及發布展示提示、素材搜尋／詳情／上傳提示；官網首頁回歸正常，檢查過程無前端錯誤紀錄。既有腳本更新精簡版面與品牌色斷言，本輪未重跑完整腳本。3019 正式建置預覽及原開啟分頁已更新，未部署。

- **區塊預覽修正**：修正選取「廚房系列」等區塊時只更新右側說明、中間仍停留主視覺的問題。中間預覽與放大預覽共用元件，依選取區塊顯示主視覺、三系列圖片、設計案例、品牌理念或門市版面；明確標出目前預覽區塊。主視覺編輯值在切換後保留，桌機／手機預覽模式同步，其他區塊維持假資料展示。回歸腳本補上五區塊切換及放大預覽內容斷言；本輪透過瀏覽器實際驗證主視覺文字同步、其餘四區塊的中間／放大預覽、手機預覽模式及切回主視覺保留編輯值。型別檢查、正式建置、腳本語法與差異檢查通過；3019 已更新，原開啟分頁實際點擊「廚房系列」已顯示三系列圖片。本輪未重跑全站或四尺寸完整腳本，未部署。

- **字體修訂**：後台統一使用 Noto Sans TC 無襯線字體，移除明體、Bodoni 及斜體混排；主標題 700 字重，正文與操作文字以 14–15px 為主，輔助文字至少 12px（品牌眉標與縮小的網站示意預覽除外）。總覽改為清楚的管理標題與快捷操作，減少裝飾性英文標語；窄桌機編輯欄改至下方，避免較大文字擠壓預覽。只影響後台，官網字體不變。手機輸入欄位提高至 16px，移除統計卡重複的小字說明。既有檢查腳本補上全後台無襯線字體及主標題字重斷言；本輪型別檢查、正式建置及正式版四路由 × 四尺寸的完整 CMS 檢查通過，已檢視新版桌機／手機總覽、內容列表與窄桌機編輯畫面。原本的本機 3019 預覽已更新，未部署。

- 新增 `/admin` 工作台、`/admin/home` 首頁管理、`/admin/content` 內容管理、`/admin/media` 品牌媒體庫；沿用官網黑、金、白色票的獨立後台版面，沿用提案密碼保護，固定顯示「提案展示・假資料」。
- 管理紀錄為獨立假資料，圖片沿用本機品牌素材。搜尋、篩選、文字預覽、編輯面板與選圖可操作；儲存／發布／上傳只提示展示性質，不寫入資料或修改正式內容。重新整理還原；內容編輯關閉後捨棄輸入。首頁除主視覺外的區塊提供對應版面預覽。
- 使用既有 Nuxt、Vue、Lucide 與字體，未新增套件、登入帳號、權限或 API。樣式限定在 `.cms`；後台原生捲動，返回官網恢復 Lenis。原生 dialog 支援 Escape、焦點限制與焦點返回；直接編輯網址會於掛載後開啟，瀏覽器返回列表會關閉。
- 圖片載入失敗會顯示完整來源與說明，包含 hydration 前已失敗的圖片；後台元件執行錯誤顯示訊息與堆疊。支援鍵盤操作及減少動畫偏好。
- 驗證通過：型別檢查、正式建置、`git diff --check`；正式版四路由 × 1440／1024／768／390px 無水平溢出或破圖。桌機／手機實際搜尋、篩選、編輯、換圖、預覽、提示、重整還原、深連結及焦點操作通過，無寫入請求或非預期前端／hydration 錯誤。另驗證密碼保護、圖片失敗提示、減少動畫、官網往返的 Lenis 與主視覺高度／字體；官網桌機／手機於字體與有限進場動畫完成後無水平溢出。已檢視桌機、平板及手機截圖，建置只有既有 Tailwind sourcemap 警告。
- 回歸腳本：`nuxt-site/scripts/check-admin.cjs`。設定 `PREVIEW_URL`（預設 `http://127.0.0.1:3018`）、`PREVIEW_PASSWORD` 及指向既有 Playwright 安裝的 `NODE_PATH` 後，執行 `node nuxt-site/scripts/check-admin.cjs`；截圖存入系統暫存目錄。本次正式版測試位址為 `http://127.0.0.1:3019`。未推送、未部署。

## 2026-09-13 首頁更多設計 CTA

- 首頁 `Kitchen Design / SHOWROOM PROJECTS` 區塊「更多設計」由 `/gallery` 改連至 `/design-inspiration`；沿用既有 Nuxt 站內導覽，保留文字、樣式、輪播及其他案例入口。本次未推送或部署。
- 本機 1440／390px 實際點擊皆進入設計靈感，跳轉後立即及等待後 `scrollY=0`、麵包屑為「首頁／設計靈感」，無 JavaScript 錯誤；開發型別檢查及 `git diff --check` 通過。本次僅檢查此 CTA，未重跑全站回歸或正式建置。

## 2026-09-13 Footer 外部連結

- 共用 Footer「數位展板」連至 `https://board.sakura-kitchenlife.com.tw/`，「YouTube」連至 `https://www.youtube.com/channel/UCvI2keNeq7WKawIU5ct1h9A`；兩者使用原生外部連結、`target="_blank"` 及 `rel="noopener noreferrer"`，保留圖示、尺寸、排版與原網站分頁。
- 本機 1440／390px 於首頁及設計靈感內頁實際點擊兩個 Footer 連結，共 8 次皆另開指定網址、`window.opener` 為 null，原分頁網址不變；無 JavaScript 錯誤，`git diff --check` 通過。測試攔截外站回應以驗證導向與分頁行為，未驗證外站內容或可用性；本次未重跑正式建置或全站版面回歸。
- 「重新開啟網站回首頁」需求仍待使用者確認，本次未實作；本次未推送或部署。

## 2026-09-11 更新預覽密碼

- 依需求更新預覽預設密碼，移除原符號與年份後綴；保留登入後固定 3 小時到期、簽章驗證與 Cookie 安全設定。修改密碼後，原密碼簽發的登入權杖不再通過伺服器驗證，需重新登入。
- 若部署環境設有 `NUXT_PREVIEW_PASSWORD`，必須同步更新該環境變數並部署，否則它會覆蓋程式預設值。本次未推送或部署。
- 本機登入 API 驗證通過：新密碼登入成功且可存取受保護頁面，原密碼回傳 401 與完整錯誤訊息，兩顆 Cookie 仍為 `Max-Age=10800`；型別檢查與 `git diff --check` 通過。本次未重跑正式建置或全站版面回歸。

## 2026-09-09 預覽登入改為 3 小時到期

- 預覽登入由 1 小時改為登入成功後固定 3 小時到期；簽章權杖與兩顆 Cookie 共用 `PREVIEW_ACCESS_TTL_MS`，避免 Cookie 提早失效。前端沿用伺服器提供的絕對到期時間，保留計時、切頁與重新取得焦點時的到期檢查，不改密碼驗證或安全屬性。
- 舊登入仍按原簽發期限到期；新版部署後重新登入才取得 3 小時期限，不會在每次操作後重新延長。既有自我檢查補上精確 3 小時及 1 小時後仍有效的斷言。
- 驗證通過：權杖自我檢查（含到期與竄改拒絕）、型別檢查、登入 API 的兩顆 Cookie `Max-Age=10800` 與簽章期限一致；瀏覽器模擬時鐘確認 1 小時後與 3 小時前 1 秒仍登入，到期立即轉回密碼頁且保留原頁返回網址，無 JavaScript 錯誤。`git diff --check` 通過；本次未重跑完整網站回歸或正式建置，未推送或部署。

## 2026-09-09 全站麵包屑共用規則檢查

- 全面檢查所有既有麵包屑模板與來源紀錄，新增測試重現指南正文前往品牌系列型錄被插入指南長標題。根因是共用元件預設把瀏覽來源當作父分類，逐頁加入固定分類例外仍會漏掉新頁面；以下歷史紀錄的逐路由例外規則由本次共用規則取代。
- `SmartBreadcrumb` 全站統一保留各頁原本分類、順序、名稱與層數；來源只有在對應既有非首頁父分類時，才能補回該連結的篩選／錨點與 history 返回，不再插入來源標題、刪除中間分類或新增上一頁區塊。指南既有固定返回行為保留，`from=inspiration` 與已知 `series` 提示仍由各頁決定；不改版型與捲動機制。
- 既有麵包屑腳本補上正文型錄、關於我們實際點擊，以及從路由表和站內連結自動發現頁面的桌機／手機跨頁分類比較；不再只檢查手動列出的頁面是否顯示或溢出。合法父頁的 SEO 標題也刻意替換成另一個長標題，驗證不會改名或刪掉中間分類。
- 正式建置本機驗證完成：`check-smart-breadcrumbs.cjs` 自動發現 51 個網址（43 個有麵包屑，含三個 `from=inspiration` 案例及 `series=aikitchen` 型錄），1440／390px 跨頁分類、名稱、順序及連結皆與直接進入一致；既有推薦、列表返回、篩選、歷史、重整、鍵盤、新分頁及不可信來源檢查全部通過。Chrome 實際品牌優勢 → 關於我們顯示「首頁／關於我們」、scrollY=0。
- `check-route-scroll.cjs` 完整通過 47 頁 × 桌機一般動畫／390px 手機／桌機減少動畫，共 141 次路由落點檢查；三模式的商品、消息、指南、案例、首頁卡片、麵包屑、型錄、篩選與錨點操作通過，落點立即與等待後皆檢查。兩套測試無前端或 hydration 錯誤；型別檢查、正式建置與 `git diff --check` 通過，建置僅有既有 Tailwind sourcemap 警告。本次未推送或部署，線上新版尚未驗證。
- 維護規則：麵包屑代表網站層級，不是瀏覽足跡；新增頁面只提供自己的既有分類，不得再新增網址例外或使用來源標題覆寫。修改導覽後重跑上述兩個現有腳本，使用 `PREVIEW_URL`、`PREVIEW_PASSWORD` 與既有 Playwright 的 `NODE_PATH`；自動發現路由及站內連結，避免新頁漏進手動測試清單。

## 2026-09-09 設計靈感與案例門市返回列表麵包屑

- 線上重現 `/gallery/case10?from=inspiration` 點麵包屑返回 `/design-inspiration` 後插入案例長標題；原因是案例內頁已有父分類檢查，但列表仍被上一頁來源覆寫。於共用 `SmartBreadcrumb` 固定分類規則補上 `/design-inspiration` 與 `/gallery` 兩個列表，分別維持「首頁／設計靈感」與「首頁／案例門市」，不改案例內頁的父分類、篩選、錨點或歷史返回機制。
- 依 investigate 先確認新增測試因「袁艾菲…」案例長標題而失敗。既有麵包屑腳本補上桌機／手機直接案例返回列表、推薦案例返回列表、重整與前進後退的完整分類斷言，以及設計靈感篩選後返回保留風格與歷史的檢查；本次未推送或部署。
- 修後完整 `check-smart-breadcrumbs.cjs` 通過：1440／390px 上述返回流程、三案例推薦、消息／商品／型錄／指南 16 頁固定分類及既有 24 頁麵包屑回歸，無前端或 hydration 錯誤。Chrome 實際案例返回設計靈感顯示「首頁／設計靈感」、scrollY=0，已檢視截圖；型別檢查、正式建置與 `git diff --check` 通過，建置僅有既有 Tailwind sourcemap 警告。以上是本機驗證，我未執行部署，線上新版尚未驗證。

## 2026-09-09 設計模組數字與加號放大

- 第一張能力卡片將「45」獨立放大為原字級 1.2 倍，「＋」由 0.5em 改為 0.65em（放大 30%）；「萬」維持原字級，沿用既有響應式縮放，其他卡片與黑金置中對齊不變。既有 PPT 測試加入字級比例斷言，本次未執行推送或部署。
- 本機 1920／1440／1024／820／768／390／320px 驗證字級比例、數字與加號無裁切、左右金字無重疊；已檢視桌機／手機截圖。桌機「45」為 64.8px、加號 35.1px，「萬」仍為 54px；`git diff --check` 通過，本次未重跑完整 PPT 回歸。

## 2026-09-09 AI 與智能置中對齊

- 建商能力卡片的第二張「廚衛工廠」右欄補上文字置中，讓較窄的 `AI` 與下方「智能」共用垂直中線；不移動右欄、不改字級、顏色或其他文字。既有 PPT 回歸加入置中斷言，本次未執行推送或部署。
- 本機 1440／820／390／320px 以 DOM Range 量測實際文字範圍（非外框），`AI` 與「智能」中線完全一致；`git diff --check` 通過，本次未重跑完整 PPT 回歸。

## 2026-09-09 建商能力卡片黑金文字對齊

- 三張能力卡片改以共用左右欄排列，左欄上方黑色標題、金色「累積／超過」「全台／最大」「獨家／智能」及下方黑色說明統一垂直置中對齊；右側大金字保留於右欄。保留字級、顏色、底圖、背景、圓角與響應式斷點，本次未執行推送或部署。
- 1920／1440／1024／820／768／390／320px 三張卡片實測黑金文字水平中心差小於 1px，文字無互相重疊或超出卡片，頁面無水平溢出；完成掛載後實際捲動並檢視桌機／手機截圖，確認卡片與文字正常顯示。既有 `check-partnership-ppt.cjs` 加入對齊斷言，`git diff --check` 通過；本次未重跑完整 PPT 回歸。

## 2026-09-09 建商 SAKURA KITCHEN CTA 預約入口

- `/builders/sakura-kitchen` 中間全景圖的 CTA 從「產品型錄」改為「立即預約」，連結改成 `/builders#appointment`，與首屏及系列區底部的預約 CTA 一致。保留三顆按鈕原樣式、品牌優勢卡片及既有跨頁錨點定位；不送出預約表單，本次未執行推送或部署。
- 本機以 1440／390px 實際點擊三顆 CTA，共 6 次都抵達 `/builders#appointment`；預約區頂端約 60px，對齊固定導覽列下緣，等待後不漂移且表單存在，無 JavaScript 執行錯誤。既有 `check-partnership-ppt.cjs` 加入三顆連結及中間按鈕文字斷言，`git diff --check` 通過；本次僅驗證 CTA，不重跑完整 PPT 回歸。

## 2026-09-09 廚房裝修指南固定麵包屑

- 線上重現從插座規劃文章點分類返回 `/knowledge`，麵包屑被插入上一篇長標題。指南列表及所有文章統一採固定「首頁／廚房裝修指南」，停用來源覆寫與額外「返回上一頁」，取代先前指南保留獨立返回連結的設計；正文、推薦卡、分類連結、捲動機制與其他頁面樣式不變。
- 既有麵包屑測試加入文章返回列表不得帶入標題的斷言，並更新桌機／手機文章推薦、重新整理、瀏覽器前進後退及鍵盤分類返回預期。本次未推送、未部署。
- investigate 先確認新增測試因插入「廚房插座該如何規劃…」而失敗，再於共用固定分類判斷加入 `knowledge`。修後完整 `check-smart-breadcrumbs.cjs` 通過：1440／390px 指南列表與三篇文章、推薦文章、鍵盤分類返回、重整及前進後退；包含門市案例、消息／商品／型錄／指南共 16 個固定分類頁與既有 24 頁麵包屑回歸，無前端或 hydration 錯誤。Chrome 實際文章回列表顯示「首頁／廚房裝修指南」、額外返回連結 0 個、scrollY=0；型別檢查、正式建置、`git diff --check` 通過，建置只有既有 Tailwind sourcemap 警告。
- 維護注意：只在文章模板設定保留分類仍會漏掉列表的來源覆寫；指南整個路由區需共用固定分類規則。以上為本機驗證，我未執行部署，線上新版狀態尚未再驗證。

## 2026-09-09 門市案例麵包屑分類修正

- 線上重現安康 case10 → case56：上層分類被上一個案例長標題覆蓋，回頂位置為 0。門市案例需僅接受既有父分類的來源，不把另一個案例當成上層；保留案例門市／設計靈感入口以及父列表篩選、錨點返回，其他頁面規則不變。
- 既有 `check-smart-breadcrumbs.cjs` 新增桌機／手機三案例推薦、下一篇、設計靈感入口、重新整理、前進後退及分類返回回歸，取代先前允許案例長標題的預期。本次未推送、未部署。
- 依 investigate 先確認新增測試因「袁艾菲…」取代「案例門市」失敗，再修共用來源判斷。修後完整腳本通過：1440／390px 三案例兩種入口交叉推薦、下一篇、重整與前進後退；消息／商品／型錄 12 頁分類、Header／Footer、指南、列表篩選／錨點返回與既有 24 頁麵包屑回歸皆通過，無前端或 hydration 錯誤。Chrome 實際 case10 → case56 顯示「首頁／案例門市／門市案例」，scrollY=0；型別檢查、正式建置與 `git diff --check` 通過，建置僅有既有 Tailwind sourcemap 警告。
- 維護注意：案例的上一頁標題不是父分類；只在來源路徑對應既有非首頁父分類時保留列表篩選／錨點及 history 返回，不要為移除長標題而一併破壞這些既有行為。

## 2026-09-09 首頁 Kitchen Design 門市案例大圖

- 補上先前漏換的首頁 `HomeGallery`：`Kitchen Design / SHOWROOM PROJECTS` 區塊背景輪播與右側兩張卡片一起改用客戶補交的安康、承德、松竹三張 `20260904.webp` 新圖。沿用既有網站用圖，不新增副本；原本版型、遮罩、輪播順序、自動切換、箭頭與卡片操作不變。未推送、未部署。
- 本機 Chrome 確認三張背景與兩張卡片皆載入新版圖片；實際點「下一張」由安康切到承德，再點松竹卡片切換背景成功，無水平溢出。`git diff --check` 通過；本次僅檢查首頁換圖與上述操作，未重跑全站回歸。

## 2026-09-09 建商能力區恢復原始淺灰

- 依再次回饋「還是太黑」，`/builders` 能力區背景由 `#f2f2f2` 恢復最初的 `#f6f6f6`，取代下方先前兩版加深色值；保留卡片白底、60% 白色淡化圖層、陰影及版型，不再加深背景來拉開對比。
- 同步更新既有測試預期為 `rgb(246, 246, 246)`；原始碼色值／卡片白色圖層檢查及 `git diff --check` 通過。本次未重跑瀏覽器或全站回歸，未推送、未部署；線上版本須另確認部署狀態。

## 2026-09-09 建商能力區背景提亮

- 依「背景太黑」回饋，`/builders` 能力區背景由 `#e7e7e7` 提亮為 `#f2f2f2`，取代下方前一版色值。保留三張卡片白底、60% 白色淡化圖層、原陰影、金色文字與版型，僅調整此區塊背景；同步更新既有回歸測試預期值，未部署。
- 本機 Chrome 確認實際背景為 `rgb(242, 242, 242)`，三張卡片仍為白底及 60% 白色圖層，桌機無水平溢出；`git diff --check` 通過。本次為單一共用色值調整，未重跑全站回歸。

## 2026-09-09 門市案例高解析首圖

- 替換客戶「門市案例大圖」提供的安康店（case10）、承德店（case56）、松竹店（case35）首圖；同步更新案例輪播／縮圖、SEO 分享圖及設計靈感封面。門市外觀封面、其他案例照片、文字與版型不變。
- 網站用圖採 WebP 品質 90、等比例且不放大：安康／松竹維持 1536 × 1024，承德由 9269 × 6179 縮為寬 2560，避免直接載入 33MB 原檔。使用 `20260904` 日期檔名避免舊快取；Downloads 原檔及網站舊圖均保留，未新增套件。本次尚未部署。
- 三張輸出分別為安康 104,284 bytes、承德 233,122 bytes（2560 × 1706）、松竹 152,722 bytes。本機 Chrome 驗證三個案例首圖與分享圖 URL、設計靈感三張封面皆指向新版，圖片完整載入且自然尺寸正確，未出現圖片錯誤提示；Nuxt 開發型別檢查 0 errors、`git diff --check` 通過。本次僅驗證圖片替換範圍，未重跑全站回歸或正式建置。

## 2026-09-09 建商能力卡片與背景對比

- 依最新回饋，`/builders` 三張能力卡所在區塊背景由 `#f6f6f6` 加深為 `#e7e7e7`，取代先前簡報指定的淺灰。卡片保留 `#fff` 底色，於既有底圖上疊加 60% 白色，讓卡片更白、裝飾圖案更淡；保留金色文字、圓角、陰影、尺寸及排列。
- 更新既有 `check-partnership-ppt.cjs` 的背景斷言及三張卡片白色圖層檢查，不新增套件或文件；本次尚未部署。
- 本機 Chrome 於 1512／820／390px 實測三張卡片皆為白底並帶 60% 白色圖層，背景皆為 `rgb(231, 231, 231)`，沒有水平溢出；桌機截圖確認卡片與灰底清楚分離。本次僅做此區塊檢查，未重跑完整跨頁 PPT 測試。

## 2026-09-09 品牌館首屏英文標題

- `/about/exhibition` 的標題原本被全域 Hero 規則強制放大到 80px，行距卻保留 58px。將品牌館加入該規則的既有例外，恢復元件設定的桌機 60px／平板 48px／手機 38px，行距統一為字級的 1.15 倍；保留 Cal Sans、金白配色與原本文字。
- 首屏圖片容器最小高度設為 520px，避免窄桌機／平板因圖片比例縮短而裁切絕對定位的標題。修改僅影響品牌館，保留其他頁面的 80px Hero；本次尚未部署。
- 本機 Chrome 已驗證 1512、1025、1024、820、768、390、320px：標題行距皆大於字級，文字不超出容器、不裁切，亦不與下方影片卡重疊；桌機恢復兩行呈現。另確認型錄頁 Hero 仍為 80px，未受本次例外影響。

## 2026-09-09 廚房商品型錄與 FAQ 間距

- `/catalogues/catalog` 縮小型錄清單底部與 FAQ 區塊頂部相疊的留白：桌機由 130 + 116px 改為 60 + 48px；平板由 105 + 100px 改為 48 + 40px；手機由 80 + 82px 改為 36 + 32px。
- 僅修改該頁 scoped CSS，保留標題與裝飾線對齊、型錄卡片、下載連結、FAQ 操作、字體配色與其他頁面。已於本機 Chrome 實測 1512／820／390px 三種寬度，間距分別為 60 + 48、48 + 40、36 + 32px，均無頁面水平溢出；桌機截圖確認標題與裝飾線仍對齊。本次尚未部署。

## 2026-09-09 線上既有分頁版本差異確認

- investigate 線上實查：使用者既有 Chrome 分頁仍載入 `/_nuxt/DL2H6zn4.js`，並顯示舊版來源麵包屑；同網址新開分頁載入 `/_nuxt/BdAHe9Ib.js`。新資源 HTTP 200 且包含慣性清除與回頂落點保護；舊資源當下已 HTTP 404。已開啟的 SPA 分頁不會因部署而自動換掉記憶體中的程式，不能以本機測試或新分頁結果代替既有分頁驗證。
- 重新載入使用者原分頁後，確認資源切換為新版、分類麵包屑恢復；實際捲至 `/news/activities/2025KC` 底部，點擊推薦的 `/news/activities/2025_ro_water_sp`，落點 `scrollY = 0`。另於線上新分頁操作 `/products/sakura` → 除油煙機系列 → 近吸系列 → R7615，每次落點皆為 0。
- 本次處理為更新瀏覽器已開分頁並驗證線上實際操作，沒有新增程式修補或部署。舊版資源已下架，未重新執行舊版來重現錯誤；新版上述情境未重現非頂端落點。日後回報相同症狀，先比對原分頁與新載入頁面的資源版本，再判斷是否需要改動捲動程式。

## 2026-09-09 優惠消息與廚房產品麵包屑

- 優惠消息、廚房產品及廚房商品型錄恢復既有分類層級，不再將上一則文章／商品標題當成上層分類，也不新增返回連結。優惠活動內頁固定為「首頁 → 優惠消息 → 優惠活動」；商品保留品牌、產品系列、子系列及原本的當前商品名稱。
- 共用麵包屑停用上述頁面的來源覆寫與歷史返回攔截；其他頁面既有來源返回、指南分類與全站跳轉回頂端機制不變。
- 驗證通過：`check-smart-breadcrumbs.cjs` 的 12 個消息／商品／型錄頁面 × 1440／390px 固定分類檢查（含真實推薦卡跳轉、重新整理、前進後退及分類返回），以及既有 24 頁麵包屑回歸；`check-route-scroll.cjs` 以 `SCROLL_FLOWS_ONLY=1` 通過桌機一般動畫、手機與桌機減少動畫三模式的實際導覽、分類返回及錨點操作。未捕獲前端或 hydration 錯誤；型別檢查、正式建置、`git diff --check` 通過，建置僅有既有 Tailwind sourcemap 警告。本次未重跑全路由掃描，未推送或部署。

## 2026-09-09 全站頁面跳轉頂端檢查

- **慣性捲動補查**：一般桌面模式下，Lenis 未完成的動畫會在路由回頂後再寫入舊座標；R7600 → R7615 已重現回頂後被拉至約 1,727px。成功切換網址時透過 Lenis 公開的即時定位 API 清除舊動畫，再由 Router 決定落點，保留原有捲動手感、路由頂端與錨點規則；此情境不能只用減少動畫模式驗證。
- **頁面掛載時序**：首頁視差效果啟用後，後續 `ScrollTrigger.refresh()` 會重設捲動位置並中斷跨頁錨點定位。Router 改在兩個繪製幀後套用最終位置，讓頁面掛載／視差重整先完成；快速連續換頁時忽略已過時的定位請求，不新增固定秒數延遲或各卡片的個別補丁。
- **落點保護**：瀏覽器可能在即時回頂後繼續舊滾輪動畫，較晚執行的版面效果也可能再寫入舊座標。跨頁落點保護會維持頂端，並在下一次滾輪、觸控、按鍵、點擊、焦點移動或導航時立即解除；不鎖住頁面、不改樣式、不使用任意秒數定時器。測試的程式化捲動準備也先送出新的使用者互動，與實際操作一致。
- **麵包屑歷史寫入**：帶上一頁來源再操作案例篩選／同頁錨點時，Vue reactive 物件曾造成 `History.replaceState` 的 `DataCloneError`。寫入前重用 `readBreadcrumbSource` 產生可序列化的純資料，保留來源與原有安全驗證。
- `nuxt-site/scripts/check-route-scroll.cjs` 在桌機一般動畫、手機與桌機減少動畫三種模式下，從路由表與實際站內連結掃描頁面；於滾輪動畫進行中換頁，檢查立即落點及 1.4 秒後位置，另外以滑鼠／鍵盤操作商品、活動、指南、案例、首頁卡片、麵包屑與型錄入口，並檢查篩選與跨頁錨點。執行需 `PREVIEW_URL`、`PREVIEW_PASSWORD` 及既有 Playwright 執行環境；`SCROLL_FLOWS_ONLY=1`／`SCROLL_ROUTES_ONLY=1` 可分別單獨重跑路徑操作／路由掃描，預設執行全部。
- `nuxt-site/app/router.options.ts` 直接覆寫 Nuxt 的路由落點並忽略歷史 `savedPosition`，取代較晚執行、會被 Nuxt 內建邏輯覆蓋的 client 外掛；卡片、推薦文章、麵包屑、上一頁／下一頁與瀏覽器前進後退等跨頁跳轉一律從頂端開始，明確的 `#錨點` 仍前往指定區塊。
- `nuxt-site/scripts/check-smart-breadcrumbs.cjs` 新增文章卡片、推薦文章、麵包屑返回與瀏覽器前進的捲動落點回歸，防止全站導覽再次保留舊位置。
- 推薦卡操作測試排除指向目前文章的卡片與斷點隱藏的重複連結；先捲動觸發既有 Reveal，再操作控制，避免把測試工具自動移動視窗誤當頁面跳轉。所有模式完成後彙整落點偏差與前端錯誤，不能以中途部分通過當作全站驗收。
- 路由掃描以實際 URL 與 Nuxt 已渲染路由作為完成條件，不跨瀏覽器除錯通道等待 Vue 的導航 Promise，避免長批次測試遇到遠端 Promise 被回收而中斷。
- **最終驗證（2026-09-09）**：以正式建置在本機驗證 47 個站內頁面 × 桌機一般動畫／390px 手機／桌機減少動畫，共 141 次路由落點檢查；三模式的商品、優惠活動、指南、案例、首頁卡片、麵包屑、型錄、篩選與錨點操作全部通過。另通過既有 24 頁桌機／手機麵包屑回歸，未捕獲 JavaScript 執行或 hydration 錯誤；`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 與 `git diff --check` 均通過。未改版面樣式或內容，未推送、未部署。

## 2026-09-09「2026.09.08 版面調整」

- `/privacy` 與 `/franchising/download` 的 Hero 主標依簡報改為 `Privacy Policy`、`Franchise Information`，桌機使用模板 Cal Sans 80px／400；中文麵包屑與 SEO 標題保留，平板與手機維持縮小字級，避免長英文溢出。
- `/builders` 能力區改為純 `rgb(246, 246, 246)` 背景；PPT 明確標註的「全台／最大」維持兩行並置中、字重 600，其餘三張能力卡內容與版型不動。
- `/builders/sakura-kitchen` 的 `for Every Family` 移除誤套的中文襯線強調規則，沿用同一標題既有的模板 Cal Sans／400。回歸檢查沿用 `nuxt-site/scripts/check-partnership-ppt.cjs`，不新增套件或文件。

## 2026-09-08 指南文章分類與來源返回

- 修正文章把實際來源誤排成分類上層的問題：文章頁維持「首頁／廚房裝修指南」，分類連結永遠前往指南列表；來源不是既有分類時，原導覽內另提供「返回上一頁」連結，不把文章冒充分類。沿用原生 history 返回，保留重新整理、鍵盤與新分頁行為，不新增麵包屑區塊，不更動其他頁面的來源規則。
- 依 investigate 先加入會失敗的斷言，確認舊程式插入上一篇標題，再修共用元件並只在兩個指南文章模板啟用。既有 `check-smart-breadcrumbs.cjs` 的 1440／390px 列表 → 文章 → 延伸文章、分類連結、Enter 返回、重新整理及前進後退通過；24 頁原回歸通過，無前端或 hydration 錯誤。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、`git diff --check` 通過，建置僅有既有 Tailwind sourcemap 警告。本機已更新；本次不推送、不部署。

## 2026-09-08 主選單入口的麵包屑

- Header（包含桌面下拉／大型選單及手機選單）與 Footer 是全站導覽入口，應使用目的頁原分類，不把剛才瀏覽的產品或文章當成內容來源；內容卡片進入仍保留實際來源與篩選條件。這項規則修正下方 9/7 將所有站內路由切換都當成來源的做法。
- 根因：`breadcrumb-source.client.ts` 原本未辨識連結入口，將主選單切頁誤當內容來源。現在 Header／Footer 標記 `data-breadcrumb-root`，共用程式將入口資訊隨 Vue Router 的 history state 寫入目的頁，不用容易殘留的「下一次點擊」旗標；原網址、query／hash、外站連結與新分頁操作保留。同頁重選也清除來源，舊版沒有入口資訊的歷史紀錄重新整理後不再採用。
- 依 investigate 除錯流程，先以 R7600 → Header「SAKURA 廚電」重現失敗斷言（錯誤來源為 `R7600 近吸除油煙機`），再修共用判斷。`scripts/check-smart-breadcrumbs.cjs` 驗證 1440／390px Header 與手機選單、Enter、Footer、同頁重選、舊紀錄失效、重新整理及前進後退全部通過；內容卡片來源、篩選、錨點、長標題與 24 頁麵包屑無溢出／前端／hydration 錯誤。`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 及 `git diff --check` 通過。
- 回歸測試需等待 Nuxt 的延後頁面路由 `_route` 完成更新，不能只看網址或原生 history；Header 本來會在切頁／捲動時關閉，過早開選單會造成假失敗。狀態：本機 DONE；未 push、未部署，線上版本不在本輪驗收結果內。所有紀錄僅維護本 README。

## 2026-09-07 近吸系列型錄標題與上層一致

- 實測除油煙機系列的型錄標題是 Cal Sans／400，近吸系列與產品詳細頁則被共用「中文襯線標題」規則的 `!important` 誤加粗到 600。從該規則移除這兩個英文型錄標題選擇器，恢復既有模板字重，未改字級、版型、文案及 Product 的品牌金色。
- 既有 `check-partnership-ppt.cjs` 補上英文標題及 Product 的 400 字重斷言，避免只檢查字型名稱而漏掉加粗覆蓋。本輪未推送或部署；線上密碼頁的登入檢查被安全審查阻擋，沒有將預覽密碼傳送至 Vercel。
- 驗證：型別檢查通過；本機上層系列、近吸系列、R7600 產品頁在 1440／1024／390px 的字型、字重、字級、正體與顏色逐項一致。Chromium 實際字形檢查確認三頁使用 Cal Sans，而非只確認 CSS 字型名稱，無前端執行錯誤；未重跑整份 PPT 回歸。

## 2026-09-07 既有麵包屑依實際來源返回

- 僅調整既有 24 處麵包屑，共用 renderless `InternalSmartBreadcrumb`，保留各頁原有 nav、字型、樣式及動畫，沒有新增區塊。可靠站內來源存在時顯示「首頁／實際上一頁／目前頁面」，來源名稱取自該頁標題；首頁與同名分類不重複顯示。較長的來源標題在窄螢幕自然換行。
- 分頁自己的原生 History state 記錄來源名稱、完整 query／hash 與位置；一般返回使用原歷史項目，不把 A→B 的返回變成 B→A→B 循環。篩選與錨點變化不當成新的上一頁；重新整理、瀏覽器前進後退保留各自來源。
- 首頁連結永遠回首頁；沒有可信來源（直接開啟、新分頁、外站進入、密碼頁）時使用原分類路徑，保留既有 `from`／`series` 來源提示。不新增外站跳轉，不讀取瀏覽器私有歷史，不改動登入機制。不推送、不部署。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 通過；`nuxt-site/scripts/check-smart-breadcrumbs.cjs` 實測 24 個對應頁面在 1440／390px 的麵包屑無溢出，篩選結果、跨分類來源、錨點、重新整理、前進後退、無循環返回、Enter／新分頁、原分類與 series 回退、外站／登入／無效來源拒絕全部通過，無前端或 hydration 錯誤。長來源手機換行已截圖目視確認。重跑需提供 `PREVIEW_PASSWORD`，並讓 Node 可載入既有 Playwright（本機透過 `NODE_PATH` 使用工具環境，未新增套件）。本機 `127.0.0.1:3018` 包含修改；Vercel 尚未更新。

## 2026-09-07 網站地圖回歸 Footer

- 依合約範圍移除 `nuxt-site/pages/sitemap.vue`，不再提供獨立 Site Map Hero／頁面；舊 `/sitemap` 網址以 301 轉至首頁 Footer，避免已分享的連結變成死路。
- 參考舊官網在原頁 Footer 集中連結的方式，保留新版既有背景、社群位置、版權與大 Logo；「網站地圖」改成原地展開／收合六組既有分類，不跳新頁、不新增內容頁。手機兩欄、平板三欄、桌機六欄；按鈕提供展開狀態與鍵盤操作，收合後保留原 Footer 高度。
- 此要求取代下方簡報第 2 頁原先「保留不動」的決定。原頁可從 Git 歷史還原；前一輪未提交修改全部保留。本次不 push、不部署。
- 展開時縮短入口與分類間留白；分類保留右側 86px 安全距離，避免手機版連結被浮動服務按鈕遮擋。`pnpm --dir nuxt-site typecheck` 通過；以 `CHECK_FOOTER_ONLY=1` 執行既有 `check-ppt-adjustments.cjs`，1440／768／390px 的 Enter／Space 展開收合、分類連結全部回應 200、右側安全區、社群對齊與 `/sitemap` 實際 301 轉址通過，截圖目視確認。完整舊回歸另在隱私頁 768px 高度比例檢查失敗（336.27／356.16px），未擴大修改隱私頁；一次重跑也碰到舊選單截圖等待逾時，因此提供僅驗證 Footer 的執行選項。上述頁尾驗證通過不代表完整舊回歸全數通過。

## 2026-09-07「0.0～6.0 單元」11 頁簡報

- 第 1／3／6／7 頁：保留既有首頁與品牌辨識左右箭頭、型錄已知來源麵包屑，以及三處 Kitchen Product Catalogue 的 Cal Sans／Product 品牌金；以瀏覽器回歸確認，不重複新增。
- 第 2 頁：只有網站地圖截圖、沒有修改標註，經確認保留不動。
- 第 4–5 頁：移除兩篇指南文章覆蓋共用 Hero 定位的 `center 36%`，維持招牌安全區與純麵包屑結構。
- 第 8 頁：加盟簡介主標 Noto Serif TC／600／#1C1C1D，桌機 54px、手機 38px；下方使用指定原始金色橫式 Logo，保留圖片載入錯誤提示與 PDF 操作。
- 第 9–11 頁：建商首頁說明 16px、使用完整右欄寬度；三張 Coming／Soon 固定兩行、Cal Sans 32–44px、黑色 60% 遮罩，首張品牌卡不動。能力標語獨立 54／48／44px，窄版按比例縮小，欄內列距 8px，保留原圖、文案及圓角。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build` 通過；建置只有既有 Tailwind sourcemap 警告。擴充既有 `check-partnership-ppt.cjs`，1920／1440／1024／768／390px 的新字級、圖片比例、卡片內容邊界與三處型錄字型全部通過；品牌按鈕對齊、加盟卡片等高等既有回歸也通過。另確認兩組輪播 Enter／Space 操作、品牌辨識首尾停用及加盟 PDF 原檔讀取。`check-hero-backgrounds.cjs` 納入兩篇文章，13 頁 × 7 種寬度共 91 項招牌安全區檢查通過；桌機與手機截圖已目視核對。README 為唯一更新文件；本機 3018 已含修改，本次未 push、未部署。

## 2026-09-07 新版 PPT 逐頁調整

- 加盟優勢 01／02 與其餘雙欄組改用 CSS subgrid 共用圖片、編號、標題、內文、特色列的高度；移除特色列自動頂部留白，讓分隔線與圖示頂端對齊，不因說明換行數不同而錯位。1024px 以下維持原本單欄自然高度，沒有固定段落高度或裁切文字。型別檢查通過；1920／1440／1280／1025px 三組卡片的內文高度與分隔線位置誤差均為 0px，768／390px 三組內容與單欄排版正常、沒有橫向溢出。

- 後續修正 `/about/advantage`：箭頭改以「集團品牌館」文字實際中心對齊，不再以整排導覽中心計算；沿用原生 ResizeObserver 做尺寸變化校正。OUR COMMITMENT 上方桌機 padding 165／140px 收為 104px（扣除 60px Header 後留白 44px），平板 92px、手機 84px；字型、文案、導覽排列與箭頭連結保持原樣。此修正通過型別檢查；1920／1440／1366／1024／768／390px 實測文字與按鈕中心誤差皆為 0px，沒有橫向溢出。

依「2026.09.05-版面調整(4.0優惠消息、5.0品牌承諾、6.0合作專區)」18 頁核對。使用既有輪播、CTA、字型與驗證機制，不新增套件。

- 第 1–4 頁：高雄品牌館文章首圖裁掉原圖內建上下各 50px 白邊；品牌優勢左側背景上移，向下按鈕以三個品牌導覽的中間欄置中；關於我們歷史題目與答案共用年份欄位寬度；品牌辨識主標桌機 60px，加入左右箭頭，首頁品牌系列同步加入箭頭操作。
- 第 5–10 頁：加盟主標 Success Starts 金色；三項特色不再佔四欄網格、加寬間距；行銷標題改 Celebrity Stories That Inspire / Beautiful Living，Stories That 與 Beautiful 金色、小標 CELEBRITY STORIES；資格區外框四角 24px、CTA 改輪廓加金色箭頭；FAQ 型錄封面加入置中雷達箭頭；申請主標 38px，移除黄色靜態串接提示但保留驗證、未串接時的送出錯誤及正式表單連結；資料下載 Hero 桌機 64px、內文主標 38px，櫻花整體廚房金色／加盟簡介黑色，刪除「兩頁雙面六折頁」。
- 第 11–14 頁：三張 Coming Soon 使用 PPT 內嵌的三張暫用圖片，白字加深色遮罩；Logo 的 hover 不再被背景圖片縮放覆蓋。能力卡依圖改上標／中間雙欄／下標，保留原三張卡底圖；取用 Home 01 原始 XML 指定的 h1-bg01.png 建築線稿及左右／向上進場，底灰上深下淺、簡介 15px；HOME in O.N.E 服務主標 Noto Serif TC、文字中心對齊標籤，內文 #59585D、上距 16px、行距 8px；預約館別選中白字。
- 第 15–18 頁：Brand Commitment 文案；首屏取消入場等待，既有同圖產生 WebP（原 JPG/JPEG 保留），減少圖片傳輸量；系列主標採模板 Cal Sans 60/64px（平板 36/42px、手機 30/35px）；Developer Catalogue 單數，獨立 PDF 下載按鈕，預覽功能保留。
- 待確認：第 11 頁「會再更換」的正式背景尚未提供，目前使用 PPT 暫圖；第 15 頁「立即預約」僅圈紅框而未註明修改方式，維持既有樣式與連結。
- 窄版能力卡另外調整中間雙欄字級，避免平板把兩行文字擠成四行；45萬的加號獨立靠右上、隨字級縮放，不與「萬」重疊。首頁輪播暫停事件移到包含新箭頭的外框，滑鼠移到箭頭時仍保持暫停。逐頁驗證腳本為 `nuxt-site/scripts/check-partnership-ppt.cjs`，沿用已安裝 Playwright，設定 `NODE_PATH`、`PREVIEW_PASSWORD` 後執行；涵蓋箭頭操作、Logo hover、字型尺寸、表單錯誤保留、真實 PDF 下載及 1440／768／390px 畫面，截圖僅寫入系統暫存目錄。
- 驗證結果：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`、新版逐頁 Playwright 檢查均通過；既有 `check-hero-backgrounds.cjs` 的 11 頁 × 7 種寬度共 77 項回歸也通過。表單未填完整與未設定後台時仍完整顯示錯誤，測試沒有送出個資；此次僅更新本機，未 push 或部署。

## 2026-09-06 PPT 逐頁調整

依「2026.09.04-版面調整(0.0首頁、1.0設計案例、2.0廚房產品、3.0門市與服務)」30 頁逐頁核對；只改標註明確的項目，未指定的替換內容不自行補寫。

- 第 1 頁：廚電 Mega Menu 圖片縮為 16:9、上下內距縮短；捲動頁面即關閉展開選單。
- 第 2–4 頁：首頁風格輪播帶入設計靈感 `style` 分類，品牌系列換指定中文，SAKURA 廚電卡片連往產品頁；品牌系列既有左右輪播保留。
- 第 6–8 頁：品牌優勢中文副標 30px；加入 PPT 指定四間台中門市；翻牌間隔由 2200ms 改 1400ms，保留停留／聚焦暫停。
- 第 10 頁：到府丈量改另開分頁。
- 第 5、9、11 頁：首頁輪播箭頭 hover 金底白箭頭；頁尾網站地圖導覽、社群圖示與 Header 指定文字左緣對齊；隱私政策另開分頁、縮短 Hero 並設定 38px 標題。第 9 頁數位展板與 YouTube 的正式網址未提供，先保留並列待確認。
- 第 12–17 頁：AI 廚房副標 30px、內文段距 8px；型式新增 ㄇ型＋中島，風格調整為美式風／輕奢風；指南文章 Hero 補足標題區高度，Explore Blogs 沿用首頁 CTA 動畫；Series Catalogue 支援已知來源系列的麵包屑與 AI 廚房另開分頁。未帶來源的直接進站不杜撰系列名稱。
- 第 18–24 頁：產品麵包屑統一 SAKURA 廚電；相關產品使用既有 Embla 平滑輪播；規格視窗排除 Lenis 攔截；型錄預覽標題字重 600，Product 品牌金；Kitchen Catalogue 預覽／下載分開；沿用既有白名單下載 API；保養 FAQ 換成黑金模板標題、淺深灰白分區及置中雷達按鈕。
- 第 25–30 頁：服務流程影片改松竹店底圖與 Coming Soon；門市分類按鈕 16px／500；案例預約連結依 PPT 使用 SAKURA iCare 並另開分頁；case35 原素材的人像與空景對調，推薦輪播同步。
- 規格捲動根因：除了將對話框排除 Lenis 平滑捲動，內層表格的 `overscroll-behavior` 僅限制橫向，讓垂直滾輪能傳遞到真正可捲動的面板。
- 驗證：`pnpm --dir nuxt-site typecheck`、`pnpm --dir nuxt-site build`；提供現有 Playwright 的 `NODE_PATH` 與 `PREVIEW_PASSWORD` 後執行 `node nuxt-site/scripts/check-ppt-adjustments.cjs`。檢查選單關閉、首頁分類、四間台中門市、頁尾對齊、網站地圖連結、系列來源驗證、產品輪播、矮視窗規格滾輪、五份真實 PDF 下載、指定圖片，以及 1440／768／390px 的字級、高度與橫向溢出。截圖寫入系統暫存目錄；不儲存密碼、不推送或部署。
- 回歸：既有 `check-hero-backgrounds.cjs` 的 11 頁 × 7 種寬度共 77 項檢查通過，招牌仍在 Hero 內且不被導覽或文案遮擋。

- **2026-09-06 Header 搜尋位置**：只將桌機搜尋容器（含分隔線與放大鏡）相對右移，1440px 以上移動 40px、較窄桌機移動 8px；不改動導覽欄配置、選項、中央 Logo 或手機 Header。

- **2026-09-06 建商專區版心加寬**：品牌卡片、WHY SAKURA、終身服務與聯絡區塊沿用加盟頁的 1770px 版心上限，移除重複水平留白；桌機保留 86px 右側安全距離（含 Section 外距），手機內容填滿 Section，保留兩側 15px 外距。Hero、四張品牌卡片與合作建商輪播維持原有內容。

- **2026-09-06 加盟介紹頁版心加寬**：故事、加盟優勢、行銷、流程、FAQ 與消息區塊統一使用最高 1770px 版心，移除重複扣除的水平留白；桌機右側由 Section 30px 外距加 56px 安全距離避開浮動按鈕，手機僅保留 Section 15px 外距。Hero 與圖片內容不變。

- **2026-09-06 Hero 高度與文字位置**：縮小招牌上下留白、標題與麵包屑間距，以及區塊底部 padding；保留主招牌完整性與桌機 80px 主標。依最新更正，將標題及麵包屑整組在 1200px 以上上移 12px、較窄螢幕上移 4px，底部補回等量間距以維持縮短後的區塊高度；背景圖與 Logo 定位不變。驗證依字型的實際字形頂緣判斷遮擋，排除字型行框內的空白。

- **2026-09-05 內頁 Hero 招牌定位**：服務流程及同類型麵包屑 Hero 依松竹店／台中品牌館原圖共用 `data-hero-photo` 定位，取消視窗固定背景；以導覽下方 24px 作為招牌安全區起點，標題與麵包屑排在招牌下方。窄螢幕限制背景最小呈現寬度並依招牌左右位置裁切，保留完整主招牌；招牌區遮罩減淡、文案區加深。首頁與非麵包屑式主視覺不受影響。
  - 驗證：提供現有 Playwright 的 `NODE_PATH` 與 `PREVIEW_PASSWORD` 後執行 `node nuxt-site/scripts/check-hero-backgrounds.cjs`，檢查 11 個代表頁面（含純麵包屑版）、320–2560px 七種寬度的招牌裁切、導覽／文案遮擋，以及視窗高度改變時的背景定位；截圖輸出至系統暫存目錄。台中馆窄螢幕圖片底緣以漸層銜接，避免出現硬切接縫。

- **2026-09-04 內頁 Hero 標題尺寸**：全站使用 `hero-includes-header` 的內頁 Hero 主標於桌機統一為 80px；首頁主視覺、產品詳情與純視覺型建商 Hero 不套用，手機與平板保留既有響應式尺寸，避免長標題溢出。
- **2026-09-02 寬桌機導覽展開間距**：1440px 以上 Header 左右導覽選項欄距由最高 6px 放寬為 14–22px；左側選項向左、右側選項向右展開，中央 Logo 與搜尋按鈕位置維持不變，較窄桌機與手機導覽不受影響。
- **2026-09-02 英文小標與合作建商標題**：`/about/introduce` 品牌辨識小標改為 `DISTINCTIVE BRAND IDENTITY`；`/builders` 的 `OUR TEAM`／`OUR BRANDS` 分別改為 `OUR BRAND`／`WHY SAKURA`。合作建商標題 `OUR CLIENTS` 完整沿用廚房產品內頁的左右細線、Serif TC 25/36px、英文 700 字重與置中排列，手機版同步縮為 20/28px。
- **2026-09-02 建商能力區分層**：`/builders` 的能力數據與 `HOME in O.N.E` 服務內容由單一大白框拆成上下兩個獨立圓角容器，保留原有內容與背景圖，並統一陰影、邊框及響應式間距。
- **2026-09-02 案例延伸標題配色**：`/gallery/[slug]` 的 `Take a look at our latest blog & articles.` 改為黑金混排，`our latest blog` 使用品牌金色，其餘文字維持黑色。
- **2026-09-02 建商合作夥伴標題**：`/builders` Logo 輪播區小標由 `Our Website 75000+ VIP Customer` 精簡為 `OUR CLIENTS`，保留既有置中版面與字型規格。
- **2026-09-02 全站細節校正**：商品型錄 Hero 改為 `Kitchen Product Catalogue`，保留中文麵包屑；保養分類改為三顆直接切換按鈕，「廚房產品保養」中心線精確對齊中間的「除油煙機」按鈕。產品型錄的 `Product`、加盟優勢的 `Success` 改為品牌金色，行銷卡內文固定 600 字重，品牌優勢三張文章卡同步縮短。建商頁 Hero 小標改為 `Property Developers`，設計師區恢復一張正式卡與三張同尺寸 `Coming Soon` 卡，兩處專案標題改於問號後分行；同時縮限舊的全域中文字重規則，讓 One-Click、Creating the Ideal Kitchen 與產品型錄等英文標題真正使用模板字型。SAKURA KITCHEN 型錄入口改用站內導航，確保切頁回到頁首。
- **提案預覽密碼鎖（2026-09-04，期限於 09-09、密碼於 10-28 更新）**：全站頁面由 Nitro 伺服器中介層保護，未驗證訪客會導向 `/preview-access`；預設密碼依最新需求更新，詳見 10-28 紀錄。密碼經伺服器端 SHA-256 定長比對後，簽發包含絕對到期時間與 HMAC 簽章的 3 小時 HttpOnly Cookie。伺服器會拒絕過期或遭竄改的權杖，前端也會在到期、分頁重新取得焦點或切頁時立即導回密碼頁，不再只依賴瀏覽器刪除 Cookie。正式環境可用 `NUXT_PREVIEW_PASSWORD` 覆蓋；靜態圖片與 Nuxt 執行資源維持可載入，API 未授權時回傳完整 401 錯誤。

## 3.1 服務流程／FAQ（2026-08-30 調整）

- 依 `2026.08.21_3.0門市與服務、4.0優惠消息 _調整.pptx` 第 2 頁修正 `/service-process`：Hero 標題改為模板英文字型的 `Our Process`，保留既有安全頂距，不與置中 Logo 重疊。
- 移除影片區底部多餘的 100px padding，改由 FAQ 自身頂部留白負責兩區間距；FAQ 分類標題下方 12px 間距改為 0，分類間距與題目列垂直留白同步縮小。
- 共用 FAQ 分類標題統一為 Noto Serif TC 20px SemiBold，題目統一為 Noto Serif TC 18px SemiBold；服務流程頁與品牌優勢頁沿用同一元件，不重複維護樣式。
- 2026-08-31 將 Hero 台中品牌館背景的垂直焦點由 88% 改為 61%，與 `/about/introduce` 使用相同裁切位置；Hero 高度、遮罩與文字位置不變。
- 服務流程頁 FAQ 題目獨立調為 Noto Serif TC 20/30px，展開內文的頂部 padding 由 12px 收為 0；共用 FAQ 元件及品牌優勢等其他頁面的 18px 題目規格不變。

## 3.2 案例門市列表頁（2026-08-30 調整）

- 依同份調整簡報第 3 頁修正 `/gallery`：Hero 標題改為模板英文字型的 `Stores`，背景改用素材包 `3.2_案例門市` 的松竹店正式門市照片，麵包屑統一 Noto Sans TC 15px。
- 篩選列維持固定橢圓寬度，橫向間距由 26px 精確收為 25px；選取區域後只顯示該區縣市，刪除重複的「全部縣市」按鈕，篩選狀態仍由網址 query 保存。
- 門市卡標題統一 Noto Serif TC 18px SemiBold，地址改為 Noto Sans TC 16px 並加入金色定位圖示；預約門市按鈕改為 Noto Sans TC 15px，地址與 CTA 間距收為 25px。
- 2026-08-31 桌機版「區域／縣市」選項改用共用 7 欄網格，修正原 flex 因 60px／72px 按鈕寬度不同而逐欄錯位；1024px 以下仍保留原本可換行配置。
- 同日將篩選按鈕文字改為 Noto Sans TC 18/26px，桌機膠囊最小高度由 34px 微增至 40px、水平 padding 由 14px 增至 18px；區域與縣市按鈕寬度同步擴為 74px／至少 90px，仍維持共用欄線。
- 7 欄不再使用會隨版心撐滿的 `1fr`，改為固定 94px 欄寬與 25px 欄距；超寬螢幕不會把篩選項目拉散，上下兩列仍共用相同起點。
- 修正固定欄寬後三字縣市名稱被 padding 擠成兩行：按鈕統一採 `border-box` 與 `white-space: nowrap`，桌機共用欄寬及縣市按鈕最小寬度微調為 94px，區域與縣市仍不換行且逐欄對齊。

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
- 2026-09-01 商品型號／售價列改為左側固定欄位對齊，R7600 的 `$18,000` 不再貼齊資訊欄最右側；同一共用詳情模板的其餘型號價格同步維持一致欄線。
- 2026-09-01 商品內頁「詳細規格」與底部「廚房商品型錄下載」主 CTA 統一套用全站標準 Hover：按鈕轉金並上移 2px、箭頭由 -45° 旋正、金色雷達波紋停止；鍵盤 Focus 與減少動態偏好同步支援，附件下載維持次要按鈕樣式。
- 2026-09-01 Related Products 區的 `KITCHEN PRODUCT` 改用全站既有 `InternalSectionPill` 膠囊小標，呈現圓角細框、金色圓點與大寫文字；中文「SAKURA 廚電」維持主標層級，移除重複的 `Kitchen Appliances` 英文副標。
- 2026-09-01 Related Products 的 720×540 商品 PNG 為不透明白底，圖片位移校正後曾露出卡片的 `#fafafa` 灰底；圖片容器改為同色白底，保留各型號既有置中與 Hover 縮放，同時消除四邊灰條。
- 2026-09-01 七個近吸商品內頁的麵包屑品牌名稱、頁面標題與 Open Graph 標題同步上層，統一改為 `SAKURA Kitchen Appliances`；產品系列與商品名稱維持中文。商品 Hero 直接對齊 `/gallery/case10` 的共用案例規格：桌面 366px、相同背景 48% 定位、麵包屑字體與四段響應式高度。
- Related Products 區改為新版指定的 `KITCHEN PRODUCT` 眉標，以及「SAKURA 廚電 / Kitchen Appliances」雙語標題；中文使用 Noto Serif TC Medium 40px、英文使用 Bodoni Moda 40px。四張關聯商品的名稱改用 Noto Serif TC，型號與售價改用 Noto Sans TC，商品透明主體依各圖實際邊界校正視覺中心；既有上一組／下一組切換與真實商品連結保留。
- 型錄段落比照上一層 `/products/sakura/range-hood/near-suction`，統一為單一 `Kitchen Product Catalogue` 英文主標、白色區塊、淺灰封面底與 Noto Serif TC Medium 20px 型錄名稱；標準 CTA 動畫維持共通規格。詳細規格 Dialog 的型號改為 Noto Sans TC 16px、標題改為 Noto Serif TC，表格使用 Noto Sans TC 並保留上下及窄螢幕橫向捲動，不用縮字或裁掉規格列；關閉鈕鍵盤 Focus 改用外框提示，不再因自動聚焦整顆填金而偏離 PPT 的白色圓鈕。

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
- 中段「除油煙機系列」改為 Noto Serif TC Medium 25px，左右加入 1px 細灰線；八個同層名稱改為 Noto Sans TC 20px，商品數量改為 Noto Sans TC 13px。底部型錄區補齊「廚房商品型錄 / Kitchen Product Catalog」雙語標題、白色 CTA 箭頭；「櫻花整體廚房型錄」與「五金收納／水槽／龍頭／把手型錄」統一使用 Noto Serif TC Medium 20px。
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

- **最新 PPT 第 10 頁（2026-08-23）**：`/builders/catalogues` 改以 `2026.08.19_6.0合作專區_調整.pptx` 第 10 頁為最新真值；Hero 主標英文化為 `Developer Catalogues`，並與其他型錄頁共用松竹店背景、36% 構圖、64% 遮罩與 60px 英文標題規格，中文麵包屑保留。依投影片三組紅色刪除標記，頁面只保留新增的 `Developer Catalogs／建商專區型錄 2026`，舊版 `iPremium／Joyful／Premium／Harmony／Loft Chic／Elegant` 六本品牌系列型錄不再於建商專區渲染。一般品牌系列型錄仍維持既有 `/catalogues/kitchenware-catalog` 路由，避免兩種型錄資訊架構再次混用。
- **字體、狀態與互動**：Hero 使用 Cal Sans 60／72px 英文主標，卡片標題維持 Noto Serif TC SemiBold 25／34px；麵包屑、說明與預覽操作使用 Noto Sans TC 15px。正式 PDF 已接入並由整張卡片直接開啟，舊 Dialog 與紅色待提供狀態已移除；主標、麵包屑與卡片分層進場，卡片 Hover／Focus 維持模板的深色覆蓋、圖片縮放與圓形箭頭。
- **第 10 頁 Design QA（2026-08-23）**：最新簡報標註與 1440×1000 實作已合併於 `/private/tmp/builders-catalogues-slide10-design-qa.png` 核對；桌機與手機 390×844 均檢查 Hero、單一卡片、Footer 與 Dialog。卡片數量 1、圖片失敗 0、未完成 Reveal 0，兩種尺寸皆 `scrollWidth === innerWidth`。手機快捷列依頁面既有安全規則隱藏，預覽鈕常駐且不遮住標題；Dialog 開啟後焦點落在「關閉型錄預覽」，支援 Escape，狀態文案完整可見。沒有剩餘 P0／P1／P2 差異，最終結果：`passed`。
- **建置驗證**：`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過；production build 只有專案既有的 Tailwind CSS v4 sourcemap warning，沒有第 10 頁新增的 compile error。
- 新增正式 SSR 路由 `/builders/catalogues`，依 `2026.08.14_6.0合作專區_櫻花整體廚房頁面開版.pptx` 第七頁實作；沿用 Antra Projects 01 的 360px 麵包屑 Hero、1410px 版心、3／2／1 欄型錄卡、24px 圓角與 Projects hover 節奏，並依 PPT 指示刪除篩選列。
- **舊版紀錄（已由最新第 10 頁覆蓋）**：第七頁曾要求在本頁同時保留六本品牌系列型錄與新增建商型錄；2026-08-23 最新稿已明確把六本舊卡全部標示刪除，因此現行頁面不再沿用這項舊決策。
- 2026 建商型錄封面直接取自 PPT 第七頁內嵌的 1241×1654 正式原圖，整理至 `public/section-6/builders/catalogues/developer-catalogue-2026.jpg`；卡片標題使用「建商專區型錄」。正式 78 頁 PDF 已放入 `public/section-6/builders/catalogues/developer-catalogue-2026.pdf`，Hover／Focus 維持深色覆蓋、預覽文字與右側箭頭，點擊卡片直接以新分頁開啟正式 PDF。
- 已移除過時的「正式 PDF 待甲方提供」文字、假預覽 Dialog 與未提供說明；Header「建商專區型錄」及 6.2.1 的兩個產品型錄入口均維持 `/builders/catalogues`，一般「品牌系列型錄」仍走 `/catalogues/kitchenware-catalog`。
- **舊版手機紀錄（已由最新第 10 頁覆蓋）**：舊版曾為右側快捷列預留 78px；現行手機頁依全站內容安全規則隱藏快捷列，卡片改用完整欄寬。Dialog 仍使用原生 top layer，支援關閉鈕、`cancel`／Escape 與點擊遮罩關閉；圖片失敗會在原卡片完整顯示素材資訊，reduced-motion 下停用縮放與位移。
- 首輪 1280px QA 發現共用 Header 在 `xl` 斷點同時放大 Logo、導覽內距與外框內距，造成 Logo 壓到「品牌承諾」；完整桌面間距改由 1440px 才啟用，1024–1439px 維持既有 160px Logo 框與緊湊導覽，未改 60px 高度、字級或下拉互動。型錄 Dialog 另明確設為 viewport 置中，開啟時焦點直接落在關閉鈕，移除瀏覽器加在整個可捲動 panel 外的金色焦點框，同時保留關閉鈕的可見焦點環。
- **舊版 Design QA（已由最新第 10 頁覆蓋）**：2026-08-15 曾驗收七張封面與六個品牌 PDF；該資料量及手機快捷列結論不再適用，現行驗收結果以上方「第 10 頁 Design QA」為準。

## 6.2.1 SAKURA KITCHEN 介紹頁（2026-08-15）

- **最新 PPT 第 9 頁（2026-08-23）**：`/builders/sakura-kitchen` 改以 `2026.08.19_6.0合作專區_調整.pptx` 第 9 頁為最新真值，保留投影片指定的 Home／Virtual Tours 長頁結構，不重做另一套近似版。桌機 Header 與 Hero 間距校正為 20px；Hero 英文／中文 Logo 直接使用投影片內嵌的正式透明圖，不再把頁尾金色 Logo 透過 CSS 濾鏡偽裝成白色版本。品牌介紹、玻璃卡與 Hero 文案明確使用 Noto Sans TC，玻璃卡連結依註記改為 `Our Advantages` 並維持 `/about/advantage`。
- **標題、文案與 CTA 校正**：品牌優勢中文主標維持 Noto Serif TC SemiBold 40／50px，系列主標改為 `Creating the Ideal Kitchen / for Every Family`，第二行保留金色強調；說明段落、`EXPLORE OUR COLLECTIONS`、產品型錄與立即預約使用 Noto Sans TC 15px。Hero 圓形「立即預約」依 PPT 移除箭頭，保留模板色彩／透明度並加入金色雷達動畫；產品型錄與頁尾預約 CTA 則維持全站 60px 膠囊、40px 金色圓箭頭、雷達水波與 Hover 旋轉。標題、說明、全景圖、六張系列卡及 CTA 均分層使用既有 `opalMoveUp／opalScaleUp`，reduced-motion 下停止水波與轉場但內容立即可見。
- **第 9 頁最終 Design QA（2026-08-23）**：將 PPT 內嵌的 2880×6996 長頁參考與 1440×1000 實作首屏、逐段桌機截圖放進同一張比較圖核對；頁面維持 Hero、品牌優勢全景、系列六卡與 Footer 的模板順序，桌機 `scrollWidth === innerWidth === 1440`，390×844 手機 `scrollWidth === innerWidth === 390`，圖片失敗 0、未完成 reveal 0、唯一 `h1`。Hero 預約 CTA 實際導向 `/builders#appointment` 且定位成功、品牌優勢卡導向 `/about/advantage`、產品型錄以 `_blank`＋`noopener noreferrer` 開啟 `/builders/catalogues`；手機另在此頁隱藏會覆蓋主要內容的右側快捷列，最終結果 passed。
- 新增正式路由 `/builders/sakura-kitchen`，依 `2026.08.14_6.0合作專區_櫻花整體廚房頁面開版.pptx` 第六頁與其中的 Antra Virtual Tours 參考頁重製；原 `/builders` 頁移至 `pages/builders/index.vue` 以建立正確父子路由，Header「建商專區」同步補上首頁、SAKURA KITCHEN 與型錄三項下拉導覽。
- 2026-08-15 依畫面回饋重新逐項拆解第六頁：前版雖使用正式圖片，但把 Antra Virtual Tours 的 Hero 比例、右下玻璃導覽卡與低矮全景區塊改成自訂版型，並把產品型錄錯放進 Hero，判定不符合模板後已撤除。現行 Hero 直接沿用專案既有 Home 09 的 1410px／`2.203125:1`／24px 圓角舞台，右下玻璃導覽卡保留 PPT 指定的左圖右文模板結構，並連到本頁品牌優勢；立即預約維持左下圓形入口。
- Hero、品牌優勢橫幅與六張品牌系列圖直接取自 PPT 第六頁內嵌的正式原圖；玻璃導覽卡依模板改為真實 HTML／CSS 元件，保留模板英文標題 `Project Excellence`，英文連結依最新第 9 頁更新為 `Our Advantages`，中段說明換成 PPT 指定的「源自於全台數百萬戶家庭生活研究與觀察」。文字可選取、整張可點擊並導向正式品牌優勢頁 `/about/advantage`。先前誤把 `Project Excellence` 參考圖當成正式網頁素材的作法已撤除，網站不再載入帶字卡片截圖。
- 文案採用 PPT 指定的 700 萬用戶數據、45 萬套設計模組、AI 科技應用與家庭生活研究內容；品牌優勢兩段正文的桌面版心由 970px 收窄為 760px，系列區共用文案寬度不受影響。品牌系列名稱使用 Libre Baskerville，Nuxt Google Fonts 載入設定已補齊 400／700 字重。
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

`StoreLocationSection.tsx`：套 Antra「Contact Us」視覺（淺灰底 `#fafafa`、膠囊 eyebrow、雙色大標、白色圓角卡片、金色 `#C9AA79`），並把原本的空佔位地圖與無效搜尋**做成真的能用**：

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
- **Antra Single Post 規格**：標題與主圖使用 1410px 置中版心，主圖保留 24px 圓角與下方 30px；內文使用模板原生 930px 置中欄、`16/24px` 內文、`40/44px` `h4` 區段標題與 30px 段距。文章主標依 2026-08-28 最新全站內容頁規格在桌機與手機統一為 `30/41px`，內文 `h4` 手機為 `30/33px`、左右 15px。
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

- **PPT／Antra 結構**：使用 `Single Post 01` 的 185px 小型 Breadcrumb、文章 Meta 與最新統一的 `30/41px` 文章標題；主影片改用 PPT 指定的 Home One Video Popup 元素，接著為 930px 正式內文、Projects Details 四分類 Tab 及三篇媒體影音輪播。未加入 PPT 沒有的 Sidebar、搜尋、分享、留言、前後篇卡或額外區段標題。
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

- **2026-08-30 品牌承諾 PPT 第 2 頁更新**：依 `2026.08.21_5.0品牌承諾_.pptx` 重核 `/about/advantage`。Hero 小標改為 `OUR COMMITMENT`，左半加入承德店正式影像與淺灰遮罩，右側摘要改用 Noto Serif TC 18px SemiBold，圓形向下按鈕移到左欄水平中央，摘要另保留右側快捷列安全欄；三張品牌優勢卡撤除舊 Hover 覆蓋層，改為白色 28px 圓角終態卡並沿用既有 `v-reveal` 依序向上出場，01／02／03 統一固定在卡片右下顯示 80px。優勢、門市與 FAQ 背景依 Home 07 節奏交替為上淺下深／上深下淺／上淺下深；三民店圖說更新為「櫻花廚藝生活館_三民店」，FAQ 仍沿用服務流程共用元件。
- **Hero 遮罩（2026-08-31）**：桌機左半承德店背景由 91% 淺灰覆蓋改為 48% 黑色遮罩，讓門市影像更清楚；同一背景欄內的主標、膠囊與導覽同步改為白色系以維持對比。1024px 以下原本即隱藏背景圖，仍保留淺底深字，不套用桌機反白。
- **Hero CTA 波紋（2026-08-31）**：向下箭頭按鈕直接沿用首頁 `hero-start-project` 的金色擴散波紋、Hover 停止與減少動態保護，不另建重複動畫。
- **品牌優勢卡滾動敘事（2026-08-31）**：`Take A Look At Our Latest Blog & Articles.` 的三張優勢卡改為桌機 sticky 滾動出場；01 先固定，02／03 分兩段滑程由下方依序滑入，三張完整停留後才釋放區塊。外層裁切改用不建立捲動容器的 `overflow: clip`，避免阻斷 sticky；1200px 以下及 `prefers-reduced-motion` 維持原本靜態／直排顯示。
- **全頁 Section 背景層次（2026-08-31）**：品牌家庭、三項優勢、門市與 FAQ 改為暖石色／白色／暖灰／淺象牙的交替漸層，讓每個 section 有清楚分段而不改成另一套深色視覺；既有文字、十字線、卡片及 sticky 滾動行為不變。
- **FAQ 規格同步（2026-08-31）**：品牌優勢頁沿用 `/service-process` 已驗收的頁面級 FAQ 規格，問題標題改為 Noto Serif TC 20/30px，展開答案的頂部 padding 由 12px 收為 0；不修改共用 FAQ 元件與其他頁面。
- **2026-08-20 新版調整 PPT 第二頁**：依 `2026.08.15_5.0品牌承諾_調整.pptx` 的紅線標註校正 5.1，不拿整頁參考截圖當網頁素材。Hero 三個導覽序號改為 PPT 指定的 `。`，導覽統一 `Noto Sans TC 16px`；五種家庭中文標籤改為 `Noto Sans TC 18px`、英文標籤加入正式 `Bodoni Moda 20px`；兩處中文段落標題改為 `Noto Serif TC 25px`；河南店標籤更新為簡報指定的「櫻花廚藝生活館_河南店」並使用 `Noto Sans TC 16px`。門市與 FAQ 間距縮短 40px，FAQ 維持母版全寬三組 12 題、問題 `Noto Sans TC 20px`，並增加展開答案上方內距，修正簡報指出的內文上緣壓迫；同時啟用既有右側快捷列安全欄，避免固定的案例門市／到府丈量／客服中心蓋住 FAQ 加減號。
- **2026-08-20 5.1 Design QA**：來源真值為 PPT 第二頁內嵌的 2880×16040 原頁截圖與頁面紅線標註；以 1440×900 同尺寸擷取 FAQ 並和來源放入 `/private/tmp/sakura-brand-ppt.IaJdHi/faq-comparison-board.png` 同畫面檢查。桌機實測三組 12 題、單題展開、滑鼠與 Enter 切換、`Bodoni Moda` 載入、圖片錯誤 0、水平溢位 0；390×844 實測 `scrollWidth === 390`，FAQ rail 為 x=15–375、操作內容為 x=15–303、快捷列為 x=318–390，互不重疊。型別檢查與 production build 均通過；建置只保留 Tailwind v4 既有 sourcemap warning。最終無剩餘可執行的 P0／P1／P2，右側安全欄屬避免固定工具列遮擋操作的必要差異。
- **2026-08-20 新版調整 PPT 第三頁**：重新放大檢查「步驟二／步驟三」而不是沿用舊筆記。第三頁把三項優勢指定為 Home 01 的 Blog 三欄卡與 `Initial Consultation` 向上覆蓋動畫，不是三組左文右圖寬版列；現已把英文母版標題還原為 `Take A Look At Our Latest / Blog & Articles.` 的兩行節奏，三張卡依 01 Digitization／02 Safety／03 Professional 使用正式圖片與逐字文案，桌機 Hover 會讓白色圓角詳情卡由卡底完整向上覆蓋，reduced-motion 停用轉場，平板與手機則維持不依賴 Hover 的完整靜態內容。Hero 補回 PPT 標示的 Home 01 圓形向下控制，實際捲到家庭型態段落；優勢與門市背景回到母版連續的 `#fafafa`，家庭、優勢、門市三段也加入快捷列安全欄，避免第三欄內容被固定服務按鈕覆蓋。
- **2026-08-20 第三頁 Design QA**：專案規則只維護 README，本段取代額外 `design-qa.md`。來源真值為 `/private/tmp/sakura-brand-ppt.IaJdHi/template-inspect/source-slides/source-slide-03.png`（3179×2245）與聚焦裁切 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-benefits-detail.png`（900×600）；實作以 1440×900、DPR 1 的 Hero／家庭／優勢／門市／FAQ 五個終態擷取合成 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-implementation-sequence.png`，全段同畫面比較為 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-full-comparison-v2.png`。三欄卡 Hover 終態另以 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-benefits-slide3-hover-v2.png`（1440×1000）與來源同框於 `/private/tmp/sakura-brand-ppt.IaJdHi/slide3-benefits-comparison-v2.png`；390×844 靜態手機證據為 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-benefits-mobile-slide3.png` 與 `/private/tmp/sakura-brand-ppt.IaJdHi/brand-faq-mobile-slide3.png`。字型／兩行標題、30px 三欄節奏、`#fafafa` 背景、正式圖片裁切、三組逐字文案與 FAQ 內容均對齊；桌機覆蓋卡的 Y 位移實測由 610px 經 111.78px 到 0px、終態 `opacity:1`，手機覆蓋層為 `display:none` 且三卡保持完整可讀。Hero 向下控制實測停在目標頂部 100px；FAQ 共 12 題、切換後只開一題。桌機與手機皆水平溢位 0、圖片錯誤 0、可見錯誤區塊 0、console error／warning 0，最終結果 `passed`，無剩餘 P0／P1／P2。
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

- **2026-08-30／新版 PPT 第 3 頁校正**：5.2 的正確頁面是「集團品牌館」，不是再次建立 5.1 品牌優勢 FAQ。保留既有 Home 09 Hero、嵌入影片及台北／台中／高雄三館切換，將 Gallery 主標的 `Interior` 改為 `Kitchen`、注意事項英文標題改為 `Important Information & Guidelines`；Fundamentals 標題依標註使用 Noto Serif TC 30px SemiBold，頁面內容底色套用 Home 07 的上淺下深、再上深下淺漸層。
- **Hero 重新校正（2026-08-31）**：依 `antra-full 2/antra/dummy-data/homepage/home-9.xml` 的 `64201fc` 原始 Elementor 設定，保留 `Creative Projects That Define Our Style` 與集團品牌館雙語可見標題，撤除自行製作的 01／02／03 三欄導覽，右下改為 Home 09 的 560px 玻璃影片卡：Cal Sans 26/34px 的 `Watch a Video About Us`、170×130px 封面、70px 白底金色播放鈕及 2 秒雷達波紋；桌機只為本站固定快捷列保留安全間距，大標上移避免和影片卡重疊。點擊影片卡直接載入既有嵌入影片，12 秒逾時、完整錯誤原因與 YouTube 備援仍保留。

- **導覽與 Hero（2026-08-20 第四頁校正）**：Header「品牌承諾 → 集團品牌館」在桌面與手機均已接到 `/about/exhibition`；Hero 使用正式 `Exhibition_Banner_Asset_01`，依 Home 09 的 1410px／24px 圓角影像舞台與左下 60/58px 英文大標重建，保留 `Creative Projects That Define Our Style`。重新放大 PPT 第四頁後，確認右側 Home 09 參考圖確實標示「嵌入影片」，舊版 README 將其判讀成「影片彈窗應撤除」並不成立；現行玻璃元件仍保留品牌優勢／集團品牌館／關於我們三個節點，但目前頁「集團品牌館」改為可操作的影片入口，開啟既有正式 SAKURA 品牌承諾影片，保留載入中、12 秒逾時、完整錯誤原因與 YouTube 備援。Hero 與 Header 的桌面／手機間距同步依紅字改為 20px，三個節點文字依註記改為 Noto Sans TC 16px。
- **正式內容**：依 PPT 第四頁逐字呈現「享受、交流、體驗」、六感體驗與現代美術館空間敘述；台北館、台中館、高雄館使用各自正式圖片、地址及週一至週五 8:30–17:30 營業時間。館別詳情補上 PPT 指定的「注意事項」標題，四點參觀須知逐字保存建設公司預約範圍、客服電話、門市服務、維修限制與全預約制資訊；官方頁面目前另有不同拆分方式，但不覆蓋 PPT 的四點版本。
- **關於我們標題英文化（2026-08-31）**：`/about/introduce` Hero 主標與下方 section 膠囊小標均由「關於我們」改為 `About Us`；中文麵包屑維持原導覽語意。
- **品牌紀事輪播調整（2026-08-31）**：`/about/introduce` 年份卡片桌面改為四張並排、平板三張並排，縮短水平間距；輪播改為每 3.5 秒自動循環，滑鼠停留、鍵盤聚焦及減少動態偏好時暫停；中小型桌面另保留右側安全區，避免卡片文字被懸浮服務按鈕遮擋。
- **全站 Kitchen 文案統一（2026-08-31）**：啟用中的 Nuxt 頁面與共用元件內，所有使用者可見的 `Interior`／`interior` 字樣統一改為 `Kitchen`／`kitchen`；圖片資源檔名與程式識別名稱維持不變，避免破壞載入與樣式。
- **SAKURA 廚電頁標題英文化（2026-08-31）**：`/products/sakura` 的 Hero 主標簡化為 `Kitchen Appliances`；麵包屑、頁面標題與 Open Graph 標題維持完整品牌名稱 `SAKURA Kitchen Appliances`，產品分類與內文維持中文。
- **SAKURA 商品分類卡片調整（2026-08-31）**：`/products/sakura` 所有商品分類圖片容器統一使用固定 4:3 比例、1px 淺灰邊線與 24px 圓角矩形外框（手機 18px）；依標註只保留 6 個 `SUKURA Products` 廚電分類、2 個 `Water Heater` 與 1 個 `Water Purifier／淨水設備`，共 9 張卡片，RO、SQC、熱飲機、淨熱飲與濾心等產品系列不再顯示於分類首頁。
- **SAKURA 廚電分類原圖修正（2026-09-02）**：`/products/sakura` 前 6 張廚電分類圖改回 `/Users/eric/Desktop/SPA/KitchenBuy` 資料表所指向的櫻花官方透明背景主圖，移除先前 720×540 二次輸出檔內建的 `#fafafa` 上下灰帶；卡片 4:3 尺寸、產品比例與圓角外框不變。
- **熱水器／淨水設備素材統一（2026-08-31）**：`/products/sakura` 最後三張分類圖改採 `/Users/eric/Desktop/SPA` 的正式素材來源：瓦斯熱水器與淨水設備使用 800×800 分類圖，電能熱水器使用 SPA 商品資料所引用的 390×390 SH-125 透明背景產品圖；移除舊素材內建的灰色上下條、不同留白及截斷畫布。
- **SAKURA 商品卡片 Hover／系列 Hero（2026-08-31）**：`/products/sakura` 可點擊卡片沿用 `/products/sakura/range-hood` 的互動：Hover／鍵盤 focus 時出現深色遮罩，金色圓形箭頭由圖片正中央縮放旋正；手機維持右下固定 CTA。`/products/sakura/range-hood` Hero 主標簡化為 `Kitchen Appliances`，麵包屑、頁面標題與 Open Graph 標題維持完整品牌名稱 `SAKURA Kitchen Appliances`。
- **商品層級小標校正（2026-09-02）**：`/products/sakura` 第一層分類卡保留原本 13px、全大寫呈現的 `SUKURA Products`，不套用品牌優勢頁的大型標題；`/products/sakura/range-hood` 與 `/products/sakura/range-hood/near-suction` 兩層商品區的小標才使用 `Industrial Elegance Condo` 及對應的展示字體規格。
- **商品型錄標題字體（2026-09-02）**：除油煙機系列、近吸系列與商品內頁三個重複的 `Kitchen Product Catalogue` 型錄區塊，英文大標統一由 Bodoni Moda 改為模板圓體 Cal Sans；中文型錄名稱、字級、版面與 CTA 保持不變。
- **型錄預覽卡文字精簡（2026-09-02）**：`/catalogues/catalog` 五張預覽卡的主標在桌機與手機統一使用 Noto Serif TC Medium 20/28px；保留 15px 小字，但刪除與主標重複的型錄名稱，只呈現年份與不重複的版本資訊，例如「2026 年綜合商品版」。
- **商品保養 FAQ 樣式（2026-09-02）**：`/catalogues/catalog` 保留分類下拉與右側圖解，問答列完整同步 `/service-process` 的灰色 SemiBold 兩位數編號、20/30px Noto Serif TC 題目、純文字加減號、分隔線與答案間距；預設除油煙機四題及第一題圖解說明逐字維持正式內容。
- **商品保養分類字級（2026-09-02）**：三個分類膠囊的下拉文字在桌機與手機統一為 16px。
- **商品保養主標字型（2026-09-02）**：「廚房產品保養」在桌機、平板與手機統一改為 Noto Serif TC SemiBold 30/40px。
- **商品保養標籤裝飾（2026-09-02）**：移除商品保養區塊左側標籤旁的水平裝飾線，FAQ 題目分隔線維持不變。
- **案例門市篩選按鈕（2026-09-02）**：`/gallery` 的區域／縣市膠囊加寬可點擊範圍，桌機左右 padding 由 18px 增至 26px，區域與縣市最小寬度分別調為 104px／110px；未選取狀態固定顯示 `#d0d0d5` 邊框，Hover 與選取金色狀態維持原規格。
- **品牌優勢 Hero 遮罩（2026-09-02）**：`/about/advantage` 桌機 Hero 左半部背景圖的黑色遮罩由 48% 微調至 54%，提高白色標題與導覽的對比，同時保留背景空間細節；平板與手機原本不顯示該背景圖，不受影響。
- **品牌優勢卡片高度（2026-09-02）**：`Take A Look At Our Latest Blog & Articles.` 三張卡片的桌機最小高度由 730px 收至 650px，內容區由 360px 收至 300px，圖片比例由 1.48 調為 1.62 並同步縮減內距；卡片列下方 Section 留白由 120px 收至 60px，長文仍可自然撐高，手機既有自適應高度維持不變。
- **品牌優勢背景色統一（2026-09-02）**：`/about/advantage` 移除品牌理念、優勢、門市與 FAQ Section 的米黃色漸層，改用全站既有白／`#fafafa` 交錯節奏；品牌理念與門市為白底，優勢卡與 FAQ 為灰底，卡片維持白色以保留層次。
- **除油煙機列表標題層級（2026-08-31）**：`/products/sakura/range-hood` 與 `/products/sakura/range-hood/near-suction` 的商品區標題統一為上方 13px `SUKURA Products` 小標、下方 30px 中文主標，移除所有頁面可見的 `Range Hood Series`；近吸頁中段「除油煙機系列」桌面同步調整為 30px。
- **近吸系列下層同步（2026-09-01）**：`/products/sakura/range-hood/near-suction` 的 Hero 主標簡化為 `Kitchen Appliances`，麵包屑維持完整品牌名稱 `SAKURA Kitchen Appliances`；Hero 字體同步上一層為 Cal Sans 80px，不再誤用 Noto Serif TC。中段輪播改用上一層相同的全品類資料、滿寬標題線、48 秒連續移動與進場後才播放規則。下方型錄區同步改為單一英文 `Kitchen Product Catalogue`、標準金色 CTA Hover／雷達動畫，兩張型錄名稱改用 Noto Serif TC Medium。1280×720 瀏覽器實測父子層輪播均為 48 秒且進場後正常播放，子層水平溢位為 0、console error 為 0；CTA Hover 實測轉金、上移 2px、箭頭旋正，型錄標題為 Noto Serif TC 20px／500，最終結果：`passed`。
- **除油煙機系列卡片分隔線（2026-08-31）**：`/products/sakura/range-hood` 圖片與文字區之間的 1px 灰線不再延伸至卡片邊緣，桌機左右各內縮 24px、手機內縮 18px，避開圓角外框。
- **除油煙機分類輪播進場修正（2026-08-31）**：`/products/sakura/range-hood` 的分類跑馬燈改由外層獨立播放 Reveal，內層循環軌道在區塊進入視窗並等待 650ms 後才啟動；兩套動畫不再共用進場時機或互相覆蓋，Hover 暫停與減少動態模式維持不變。
- **除油煙機分類標題飾線（2026-08-31）**：`/products/sakura/range-hood` 的「SAKURA 廚電產品」標題左右裝飾線改為彈性填滿標題兩側至內容邊界，不再受固定最大寬度限制；手機維持 42px，避免窄螢幕擠壓標題。
- **除油煙機型錄標題英文化（2026-08-31）**：`/products/sakura/range-hood` 型錄區主標由「廚房商品型錄」改為單一英文 `Kitchen Product Catalogue`，移除下方重複的 `Kitchen Product Catalog`，並沿用英文 Editorial 字型層級。
- **除油煙機型錄 CTA 動畫（2026-08-31）**：`/products/sakura/range-hood` 的「廚房商品型錄下載」按鈕套用站內標準 CTA 互動：金色 Hover、整體上移、箭頭由 -45° 旋正、圖示外圈持續擴散波紋，Hover／鍵盤聚焦與減少動態模式時停止波紋。
- **注意事項結構修正**：完整放大檢查 PPT 第四頁紅線後，確認注意事項不是館別 Sidebar 的內容，而是指定放入 Single Post 02 最下方 `Exploring Design Styles` 複製文字區塊。現已移除底部錯誤重複的「透過鏡面…」段落，改成全寬「注意事項」與四點正式文案；館別 Projects 01 只保留各館圖片、地址及營業時間，結構與 PPT 一致。四點內容逐字校正 `SAKURA KITCHEN與TLK`、客服電話與標點，且不依賴 Reveal 才能存在於 DOM。
- **Antra 版型與第四頁標註**：Hero 下沿用 Single Post 02 的 930px `single-content / entry-content` 文章欄與 1290px `image-content` breakout 雙圖；依 PPT 將 Hero 下方與 Fundamentals 內文兩段的上下順序校正，逐字改回「以人為主…現代美術館」及「透過鏡面…感官饗宴」。`Understanding The Fundamentals` 使用英文模板圓體 Cal Sans 30/40px，「享受、交流、體驗」統一使用 Noto Serif TC SemiBold 30/40px，段落與 Gallery 膠囊使用 Noto Sans TC；雙圖至 Gallery 標題、Gallery 標題至館別篩選、篩選至館別內容分別採 100／53／40px。三館仍使用 Projects 01 的三個圓角篩選與單一詳情區，館名為 Noto Serif TC 30/40px，篩選／地址／營業時間為 Noto Sans TC 16px。最後接 Single Post 02 的 `Exploring Design Styles` 文字區，標題與四點注意事項依標註使用 Noto Sans TC，內文為 15/24px；大型英文標題維持模板原文。
- **素材與錯誤**：六張正式素材整理至 `public/section-5/brand-pavilion/`，最長邊限制為 2800px 或 1800px，避免原始 6720／8256／7295px 圖片直接拖慢首屏。所有圖片經共用 `InternalBrandImage` 呈現；錯誤時在原容器顯示「品牌頁面圖片載入失敗」、替代文字及素材路徑。
- **手機內容安全（2026-08-20）**：390px 回查時發現右側快速服務列會同時壓住 Hero 第三個節點、首段文案與 Fundamentals 標題，這不是 PPT 的桌面版面要求，而是固定工具列造成的手機可用性缺陷；`/about/exhibition` 在 767px 以下改為隱藏快速服務列，桌機仍完整保留三個固定入口，頁面內容不再為工具列額外縮窄。
- **RWD／QA**：390px 為單欄、768px 三館為兩欄、1024px 起為三欄；1512／1920／2560／3840px Hero 固定 1410px 置中，不隨超寬螢幕無限制放大。390、768、1024、1512、1920、2560、3840px 實測皆 `scrollWidth === clientWidth`、錯誤提示 0，六張正式圖片均成功載入，Hero 目前頁標示正確。
- **Design QA（2026-08-20 PPT 第四頁複核）**：依專案只維護 README 的規則，本節取代額外的 `design-qa.md`。真值來源為 `/Users/eric/Downloads/2026.08.15_5.0品牌承諾_調整.pptx` 第 4 頁、3179×2245 標註頁與其內嵌 3440×7317 長頁；長頁以 2× 比例正規化成 1720×3560，和 1720×1000 實作的 Hero、Gallery、注意事項分別放入 `/private/tmp/sakura-brand-ppt.IaJdHi/slide4-top-comparison.png`、`slide4-gallery-comparison.png`、`slide4-bottom-comparison.png` 同畫面比對，最終結果 `passed`。桌面實測 Hero 與 Header 間距 20px、三個玻璃節點皆完整顯示、影片視窗可開啟／播放／Escape 關閉、三館圖片與地址會同步切換；Gallery 間距為 100／53／40px，Noto Serif TC 與 Noto Sans TC 套用位置正確。390×844 實測 360px 單欄、快速服務列隱藏、水平溢位 0；桌機與手機圖片錯誤、Reveal 隱藏、console error／warning 皆為 0。
- **建置**：`pnpm typecheck` 與 `NUXT_IGNORE_LOCK=1 pnpm build` 通過；production build 只有 Tailwind CSS v4 既有 sourcemap warning，沒有新增型別或 SSR 錯誤。

## Nuxt 3 — 5.3 關於我們（2026-08-20）

`nuxt-site/pages/about/introduce.vue` 依品牌承諾 PPT 第 5 頁調整既有 `/about/introduce`，保留已符合 Antra 模板的 Breadcrumb、Service 01、品牌紀事、四欄 Process 與 Gallery 結構，不另造一套近似版型。

- **2026-08-30／新版 PPT 第 4 頁校正**：5.3 的正確頁面是「關於我們」，不是品牌優勢 FAQ。Hero 繼續使用能同時露出 `SAKURA GROUP／O.N.E` 的台中館正式影像與既有裁切；「櫻花整體廚房記事」依 PPT 指定資料夾及官方頁面補齊 1978–2021 共 16 筆正式影像與文案，改用專案既有 Embla 實作每次三筆、左右箭頭及鍵盤方向鍵切換。右箭頭另向內預留全站快捷列寬度，避免點擊被「案例門市」攔截；上方 Service 01 大圖問答仍只保留 1978、1992、2016、2020 四個重點年份，避免完整年表反向撐壞版面。
- **Hero 圖片焦點（2026-08-31）**：只將台中品牌館背景的垂直焦點由 58% 調為 61%，讓圖片稍微上移；Hero 高度、遮罩、標題與麵包屑位置不變。

- **Hero 與字體**：Breadcrumb 底圖依標註改用 5.2 集團品牌館的台中館正式照片，麵包屑逐字維持「首頁／關於我們」並改為 Noto Sans TC 15/22px。內頁膠囊、說明文、歷史內容與品牌辨識使用 Noto Sans TC；Service 01 年表問題改為 Noto Serif TC 20px Medium；四項品牌承諾標題改為 Noto Serif TC 30/40px。
- **重點年表 FAQ 樣式（2026-09-02）**：1978、1992、2016、2020 四個重點年份完整同步 `/service-process` 的 20/30px Noto Serif TC 題目列、灰色 SemiBold 編號、純文字加減號、分隔線與答案間距；左側年份圖片及原有正式文案維持不變。
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
- **Home 03 推薦案例校正**：初版誤把 `Recommended Cases` 與 `Take A Look At Our Latest Blog & Articles.` 套進置中標題共用元件，未還原 Home 03。現已改回原始 30／70 標題列：左側膠囊、金色圓點、水平／垂直裝飾線，右側 60/64px 大標並將 `Our Latest Blog` 標為模板金色。三案依 `post-style-3` 重製為 560px 舞台，第二個可見案例使用直式滿版圖片、底部漸層與白字覆蓋，左右案例維持 1.40625 圖片比例、20/30px 標題及三行官方中文摘要；PPT 標示刪除的假分類與模板英文摘要沒有加回。1024px 以下解除中央特殊卡，回復一致的 2／1 欄內容流。2026-08-28 自動輪播頻率由每 5 秒提高為每 4 秒，Embla 轉場 duration 仍維持 24，避免提高頻率後產生瞬移。

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
- **加盟故事標題還原（2026-09-01）**：`/franchising/intro#introduction` 的故事區主標還原 Home 05 原版英文結構與金色分段；依全站既有規則將原文 `Interior` 改為 `Kitchen`，呈現 `We Shape Kitchen Designs, Crafting Timeless and Inspiring Spaces`。影片封面的 `Partner Stories`／店經理故事標籤整組移除，只保留封面、遮罩與中央播放按鈕；播放標題維持英文無障礙名稱。
- **加盟資料下載按鈕修正（2026-09-01）**：故事區左側的 Outline 下載按鈕不再繼承箭頭 CTA 專用的右側雷達偽元素，避免 38px 動畫圓圈壓住「載」字；下載圖示、膠囊外框與 Hover 顏色維持原樣。
- **第 3 頁 Design QA（2026-08-24）**：將 PPT 第 3 頁完整標註與 1440×1000 實作的故事、優勢、行銷三段放入同一張 `/private/tmp/franchise-slide3-copy-design-qa.png` 核對；390×844 另逐段驗證中文主標、內容寬度與手機安全欄。桌機與手機皆無水平溢位或失效圖片，唯一 `h1` 保留英文模板標題；Hero 申請 CTA 為 `/franchising/form`、`target="_blank"` 且含 `rel="noopener"`。初驗唯一 P2 為手機主標孤字，修正後三組標題均維持單行，沒有剩餘 P0／P1／P2 差異，最終結果：`passed`。
- **最新 PPT 真值與 Hero**：SSR 路由 `/franchising/intro` 改以 `2026.08.19_6.0合作專區_調整.pptx` 第 2 頁為唯一主規格，只採用該頁明確引用的第 3 頁加盟內容，覆蓋 8 月 14 日舊版。Hero 維持 Antra Home 05、從 `y=0` 開始且高度包含 60px Header；pill 依第 3 頁文案更新為「我要加盟」，英文大標保留 `Find Your Inspired / Interior Design`，右欄以 Noto Sans TC 16／15px 呈現 73%、700 萬戶、36 年品牌內容。申請 CTA 以新分頁開啟站內 `/franchising/form` 並含 `rel="noopener"`。
- **加盟故事與正式素材**：保留 Home 05 30／70 標題軌、YouTube `sAuAjtpvZYk` 與兩位店經理訪談，標籤更新為 `Our Partners`。原本把文案壓成圖片的 `story-strip.png` 已停止渲染，改用甲方 `marquee-1.webp`、`marquee-2.webp` 建立雙排反向循環；桌機輪播圖高 180px、手機 112px，維持原比例且不裁圖。Hover、鍵盤焦點暫停，reduced-motion 停止移動。圖片及影片失敗時仍在原位置完整顯示檔案路徑、原因與備援操作。
- **加盟優勢英文標題（2026-09-02）**：`加盟創業首選品牌` 改為精簡英文 `Franchise Success Starts Here`，並移除誤套的 Noto Serif TC ID 覆蓋，恢復英文模板圓體 Cal Sans；不套回 Home 05 的部落格假文案，區塊排版與六項正式優勢內容維持不變。
- **加盟優勢卡片對齊（2026-09-01）**：同組兩張優勢卡改為等高，文字長短不同時仍將下方分隔線與圖示列固定對齊；桌機圖示列改為四欄、圖示縮至 34px、欄距縮至 4px，手機維持兩欄以避免中文標籤過度換行。2026-09-02 移除每組卡片強制 `100vh` 的桌機高度，保留原本 46px 上下 padding 與左側 sticky 導覽，避免高螢幕在組間產生大片空白。
- **AI 導入圖示更正（2026-09-01）**：依甲方 `01_AI 導入` 資料夾提供的三張 SVG，將第一張加盟優勢卡的圖示索引由錯誤的 01／02／03 改為既有且雜湊完全相同的 02／03／04，依序呈現 AI 腦部、QR 掃描與生產數據圖表；不重複複製相同素材。
- **加盟 Hero 英文小標（2026-09-01）**：`/franchising/intro` Hero 膠囊小標由「我要加盟」改為 `FRANCHISE WITH US`，主標、加盟說明與申請 CTA 維持不變。
- **加盟插頁英文主標（2026-09-01）**：加盟頁中段、對應建商專區 SAKURA KITCHEN 的深色轉換插頁，主標由 Newsletter 模板假文案改為 `Franchise With SAKURA`；背景改用建商專區原始 `builder-hero.jpg`，既有遮罩、說明與表單 CTA 維持不變。
- **加盟行銷案例標題（2026-09-02）**：行銷案例卡依正式版配置，圖片內只顯示「藝人＋姓名」短標，完整故事標題移至圖片下方並使用 20px Noto Serif TC；不再以長標題遮住人物與畫面。
- **加盟轉換 CTA（2026-09-01）**：加盟金／補助金表單按鈕直接共用站內既有 `source-round-link--news` 規格，改為白色膠囊底、金色圓形箭頭；Hover 反轉為金底、白色圓形箭頭並保留波紋，不另建重複樣式。
- **加盟流程標題與按鈕（2026-09-01）**：`加盟流程與辦法` 在桌機與行動版統一為 30/40px；左側補助面板的 `我要加盟` 改為內容寬度、32px 水平內距與 999px 圓角的金色膠囊，既有呼吸與 Hover 動畫維持不變。
- **加盟流程 CTA 置中（2026-09-02）**：左側補助面板的「我要加盟」膠囊按鈕改為水平置中，面板文字、背景與互動效果不變。
- **加盟 FAQ 對齊服務流程（2026-09-01）**：`/franchising/intro#franchise-faq` 的題目維持 20/30px，並同步 `/service-process` 的 18px 題目列上下內距、純文字加減號、答案頂部 0px padding 與行動版 18/28px 題目、15/25px 答案規格；加盟資料下載側欄與正式 FAQ 文案不變。
- **加盟資料封面換圖（2026-09-01）**：FAQ 右側加盟資料下載封面改用甲方提供的 780×1082 `IMG_1399.PNG`，存為 `franchise-download-cover.png`；原始比例與既有 774×1074 容器相符，因此不裁切、不拉伸，連結與下方說明維持不變。
- **加盟資料文案置中（2026-09-01）**：FAQ 右側下載卡的標題與說明在桌機、手機皆置中；說明改為「報名加盟培訓課程，透過專業教育訓練與實戰支持，掌握廚具銷售核心技巧，為您開啟成功創業之路！」並移除原先重複的前導句。
- **加盟資料說明文字（2026-09-02）**：FAQ 右側加盟培訓說明同步商品型錄右側圖解文字規格，統一為 Noto Sans TC 15/25px 與 `#737278`。
- **加盟行銷英文標題（2026-09-01）**：`強大廣告行銷` 改為精簡英文 `Powerful Marketing`，並於 2026-09-02 移除中文明體覆蓋、恢復模板 Cal Sans；案例輪播與正式中文案例標題維持不變。
- **加盟行銷卡片摘要（2026-09-01）**：依櫻花官網加盟頁連結的五篇正式案例首段內容，為 `Powerful Marketing` 五張圖片卡補上精簡中文摘要；卡片維持原本的圖片覆蓋標題與序號，另在圖片下方以 122px 白底內容區顯示摘要。媒體層依 1860×1400 原始素材比例顯示，避免共用圖片元件撐滿整張卡並裁掉文字，也移除卡片陰影產生的灰邊；輪播與圖片 Hover 維持不變。
- **六大優勢與行銷案例**：依 PPT 第二頁的「一個螢幕頁面」要求，把六張優勢卡重組為 `01／02／03` 三個 `100vh` 桌機畫面狀態；每次顯示兩張，左側 30% 標題與大型序號固定，右側下一組由下方進入並更新序號，不再把六張做成普通錯落長列表。1024px 以下解除 sticky 並自然單欄排列。`FranchiseAdvantage` 仍使用 `features[]` 逐項載入甲方 `Global_Icon_Asset_01–20.svg` 與可選取 HTML 文字；優勢徽章及 icon 說明明確使用 `--font-cjk-sans`，瀏覽器 computed style 為 Noto Sans TC 15px。品牌行銷維持 Home 01 五筆正式素材、3／2／1 張 scroll-snap，無可見箭頭、可觸控拖曳及鍵盤左右瀏覽。
- **CTA、流程與資格**：區塊順序依 PPT 修正為「六大優勢 → Home 07 深色圖片 CTA → 品牌行銷案例」，CTA 使用既有 Antra 深色室內素材與上淺下深遮罩，文案逐字改回簡報指定內容，並保留分層進場、金色雷達水波、箭頭旋轉與 Hover 填色。原 `franchise-overview.png` 已停止渲染；流程區維持三張桌機原生 sticky 覆蓋卡，使用甲方七步流程 SVG、PPT 完整四段高額補助／加盟補助金／業績獎金／教育訓練文字與四項資格 SVG，1024px 以下自然堆疊且不搶奪頁面捲動。
- **FAQ、動畫與可用性**：FAQ 已依後續 Home 04 原始碼回查結果，改為上方 30／70 標題軌、下方 71% Accordion／29% 加盟資料卡；`Franchise FAQs` 使用 Noto Sans TC，四題原生 Accordion 問題為 Noto Serif TC SemiBold 20px、答案為 Noto Sans TC 15px，並保留鍵盤操作與清楚焦點。跑馬燈、品牌案例軌與 FAQ button 均有金色鍵盤焦點；小標、主標、內文、圖片、卡片與 CTA 分別使用既有 `opalMove*／opalScaleUp`，reduced-motion 會停用跑馬燈、sticky 覆蓋、序號轉場、水波與自動進場，但內容立即可見。
- **手機 CTA 安全區**：390px 實機尺寸檢查發現右側快速服務列會覆蓋 Home 07 文案與申請按鈕，因此 `/franchising/intro` 在 767px 以下沿用表單頁既有的隱藏規則；桌機快速服務列保持原位置與功能，CTA、案例與 FAQ 皆無水平溢位或操作遮擋。
- **招商訊息截圖逐項修正（2026-08-22）**：補上前次驗收漏掉的頁尾招商訊息區塊。小標由「招商訊息」改為 `Franchise Information` 並明確使用 Noto Sans TC；三篇新聞標題由 Cal Sans 25px 改為 Noto Serif TC SemiBold 20／30px。底部「查看更多」改用 PPT 指定的 60px 外框膠囊、Noto Sans TC 15px 與 box-sizing 鎖定 40×40px 的金色圓形箭頭，保留進場、水波、箭頭旋轉及 Hover 金底狀態。
- **加盟流程／Home 04 FAQ 原模板回復（2026-08-22）**：依 PPT 第 2 頁的放大標註撤除自創的英文大標、三張深色 sticky 卡。加盟流程改回單一 Noto Serif TC SemiBold 25／35px 中文標題、甲方 1410×251 七步流程 SVG，以及同畫面左右並排的深色補助／白色資格內容；所有文字維持可選取 HTML，背景使用原始線稿素材而非把 `franchise-overview.png` 當網頁。補助圖文區本身的 CTA 已依標註改成無箭頭「我要加盟」，保留進場並增加金色呼吸動畫；手機同步移除多餘右側安全距離，避免大型圖文區被壓窄。FAQ 再依 `home-4.xml` 的 `83319f9` 原始結構完整重建：上方 `Franchise FAQs` 十字線標題軌與 `Quick And Clear Answers To Your Key Questions`，下方左側 71% 四題 Accordion、右側 29% 加盟資料卡；正式直式「櫻花加盟總部優勢」圖取自最新 PPT `image30.png`，整理為 `public/section-6/franchise/franchise-benefits-sheet.png`，圖片與標題皆連至 `/franchising/download`，不再使用門市照片圓形 CTA 代替 Home 04 資訊卡。
- **Home 04 FAQ Design QA**：來源為最新 PPT 內 548×416px 的 `image29.png` Home 04 區塊與第 2 頁標註；實作以 1512px CSS viewport、1× density 擷取完整區段，正規化為 548×416px 後合併比對。第一次比較的 P1 為內容欄左右反置、英文模板主標缺失、資訊卡錯用門市照片與圓形 CTA；修正後 30／70 標題軌、71／29 內容比例、Accordion 線條／編號／展開狀態及右側資料卡均與模板對齊。字體、間距、`#fafafa／#caa05c` 色彩、PPT 正式圖片清晰度與中文文案五項皆通過；直式圖片因使用正式原比例而不裁切，屬預期差異。桌機 1512px 與手機 390px 皆為水平溢位 0、圖片錯誤 0，第二題展開後僅一個 panel 開啟，兩個資料下載連結皆指向 `/franchising/download`。比對圖：`/Users/eric/.codex/visualizations/2026/08/14/019fffeb-5d3d-7d91-b40f-009022fb2247/franchise-faq-home4-design-qa.png`；最終結果：`passed`。
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
- **PPT 第六頁 Design QA（2026-08-23）**：來源視覺由第 5 頁最終長頁 `image51.png` 與第 6 頁的 Single Post 02 `image52.png`、正式案例門市 `image44.jpg` 及紅線流程共同構成；第 6 頁屬結構來源，不把整張提案投影片當網站截圖。實作以 1440×980 CSS viewport、DPR 1、動畫完成狀態擷取，和 1440×980 正規化來源同畫面比較於 `/Users/eric/.codex/visualizations/2026/08/14/019fffeb-5d3d-7d91-b40f-009022fb2247/franchise-form-slide6-design-qa.png`；表單欄位的聚焦比較沿用 `franchise-form-slide5-qa-form.png`，390×844 手機證據為 `franchise-form-slide6-mobile.png`。首輪互動檢查的 P2 為 6.1 Landing Page 只有 Hero CTA 另開分頁，其餘兩個 CTA 與表單內下載會帶離目前頁面；補齊 `target="_blank"／rel="noopener"` 後，三個申請入口與資料下載皆符合第 6 頁「此頁另開分頁」，且保留填寫狀態。最終比較確認 Header 採最新版首頁白色 Logo（PPT 舊截圖藍色 Logo 為已被新版首頁覆蓋的可接受差異）、主標／卡片標題的 Noto Serif TC SemiBold、說明／欄位的 Noto Sans TC、930px 表單寬度、圓角與陰影、`#fafafa`／白／金色票、線稿背景清晰度及全部正式文案；1440px／390px 水平溢位與圖片錯誤皆為 0，手機快速服務列正確隱藏，無剩餘可執行的 P0／P1／P2，最終結果：`passed`。
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
- **建商 Hero 對齊微調（2026-09-01）**：`/builders` 右側「專人聯繫」CTA 底部依 `Kitchen Design` 字形的視覺底線上提 16px，不再只對齊標題行盒；1023px 以下恢復既有單欄間距。
- **Home 07／能力／iCare／Home 01**：團隊區只保留最左側正式 SAKURA KITCHEN 專案卡、Logo 與 `/builders/sakura-kitchen` 入口；右側三欄移除人物卡，改為置中的 `Coming Soon`。45 萬+ 設計模組、AI 智能工廠、管理平台與銷講／監工／驗收保留為可選取 HTML；「一鍵登錄 終身服務」改用甲方 `6-1developers-icare.png` 原圖，不再以自創深色資訊卡代替。九組正式合作建商 Logo 依 Home 01 改為雙排反向循環，Hover 暫停，reduced-motion 下改靜態 Grid，語意清單仍可被輔助技術讀取。
- **PPT 第 8 頁 Design QA／建置**：依專案只保留 README 的規則，本段取代額外的 `design-qa.md`。PPT 內嵌 505×2474px Antra 長頁與六個 1440×1000 實作 viewport 已放進同一張 `/private/tmp/builders-slide8-design-qa.png` 比對；模板留白區依投影片紅線補入正式建商內容，而不是自行填入 Antra 假資料。桌機 1440px 與手機 390px 皆無水平溢位、破圖、Nuxt 錯誤或未完成 Reveal；Hero CTA 正確落到 `#appointment`，空白送出顯示三個必填錯誤並聚焦聯絡人。手機 QA 發現的 iCare 主標末字孤行（P2）已改為完整「終身服務」詞組換行；Logo 輪播取得鍵盤焦點時會暫停。`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只有既有的 Tailwind CSS v4 sourcemap warning，最終結果：`passed`。
- **預約 CTA 一致性修正（2026-08-15）**：6.2-S1「立即預約」移除獨有的黑底、18px gap、黑色箭頭與向上位移 Hover，改用全站內容型 CTA 真值：60px 高、`30 / 9 / 9px` 內距、灰色 64% 細框、15/22px 字級、40px 金色圓箭頭、初始 `-45deg` 與既有 2 秒雷達水波；Hover／鍵盤 Focus 後整顆填金、文字反白且箭頭轉正。手機維持內容寬度，不再把按鈕拉成滿欄。

## Nuxt 3 — 3.2.1 案例門市內頁（2026-08-30 最新調整）

- **PPT 第四頁真值**：`/gallery/case10` 依 `2026.08.21_3.0門市與服務、4.0優惠消息 _調整.pptx` 第 4 頁重整；Breadcrumb Hero 保留案例門市店面底圖與「首頁 / 案例門市 / 門市案例」，內容主標改為 Noto Serif TC SemiBold 30/40px，並維持 900px 上限避免長標題壓到右欄與固定快捷列。
- **字級與案例規格**：到店預約改為 Noto Sans TC 18/24px；規格值使用 Noto Serif TC SemiBold 16/24px。前後篇標題與底部案例卡統一為 Noto Serif TC SemiBold 20px，相關案例小標改為全站既定的 `FEATURED PROJECTS`，不照抄簡報中的拼字錯誤 `FEATRRED`。
- **評論與區塊間距**：三則正式評論改用模板的圓形人物圖示＋文字列，不加入沒有功能的 Reply 假按鈕，也不捏造評論者姓名或日期。評論末線到推薦案例頂線原本多出的 108px 空白已移除，推薦區連同頂部分隔線直接上移；文章、輪播、Sticky 門市資訊與正式外部連結維持不變。
- **本輪 QA（2026-08-30）**：來源改以 `/Users/eric/Downloads/2026.08.21_3.0門市與服務、4.0優惠消息 _調整.pptx` 第 4 頁為準。1280px 瀏覽器實測主標 30/40px、到店預約 18/24px、規格 16/24px、前後篇與三張推薦卡 20px，三列評論圖示皆存在，評論末線與推薦區頂線間距精確為 0；390×844 實測 `scrollWidth === innerWidth === 390`、快捷列隱藏、圖片破損 0。Google Maps 無法連線時會依既有規則完整顯示 12 秒逾時與門市地址，不把錯誤藏掉；Console error／warning 0、Reveal 隱藏 0，`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。

## Nuxt 3 — 3.2.2 老宅廚房案例內頁（2026-08-30 最新調整）

- **PPT 第五頁真值**：`/gallery/case56` 沿用 3.2.1 已核准的 Antra 案例內頁結構，不建立另一套相近版型；共用標題已依 2026-08-30 最新第 4 頁規格同步為 Noto Serif TC SemiBold 30/40px。Breadcrumb 依入口判斷：案例門市維持「首頁 / 案例門市 / 門市案例」，設計靈感卡改帶 `from=inspiration`，顯示「首頁 / 設計靈感 / 門市案例」，canonical 仍維持無 query 的正式案例網址；前後篇與更多案例連結也會保留同一來源，避免進下一篇後麵包屑無故跳回案例門市。
- **第 5 頁指定換圖**：依簡報兩個紅框，只調整老宅案例自己的圖片索引。主輪播首圖由無人物全景改為 `case56_content_asset_04_2026.jpg` 的設計師入鏡照；首段雙圖左圖改為 `case56_content_asset_07_2026.jpg` 的爐台近景，右圖維持原正式素材。兩張來源都已存在甲方 `3.2.2` 素材目錄，不複製檔案、不壓縮重存，也不改其他案例資料。
- **本輪換圖 QA（2026-08-30）**：1280px 桌機與 390×844 手機實測首圖、首段雙圖順序皆符合第 5 頁紅框，圖片破損 0、Console error／warning 0；手機 `scrollWidth === innerWidth === 390`，桌機主標維持 30px。`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。
- **承德店正式資料**：案例規格依簡報補齊北歐風、單色系（非白色）、其他、一字型、400CM以上、2-4坪、35萬以上、櫻花石、陳冠瑋共 9 項，移除不在新版規格表的「家的組成」。門市資訊改為週一至週六 10:30–21:00、`02- 2883 9919`、士林區後港里完整地址；到店預約與 LINE 諮詢都使用 PPT 指定的承德店 `https://lin.ee/50meLfG`。
- **文章刪減與評論**：保留首段兩張正式案例圖及主輪播；依五個紅框移除後續「格局動線、門板、中島、抽屜、廚電」圖片區塊，並刪除 PPT 單獨標示的廚房電器型號段落，產品延伸連結仍保留。顧客評論依簡報逐字放入 3 則相同內容，留言表單不渲染；此評論提到「紀先生」但本案設計師為「陳冠瑋」，屬來源簡報本身的內容不一致，前端先照稿呈現，正式上線前應由內容端確認。
- **Design QA／建置**：因專案規則禁止新增第二份 `.md`，本節取代 Product Design 預設的 `design-qa.md`。已把 PPT 第 5 頁、內嵌 `image19.png` 長頁與實作畫面合併比對，證據為 `/private/tmp/case56-qa-*.png`、`/private/tmp/case56-mobile-top.png` 與 `/private/tmp/case56-design-qa-*.png`，最終結果 `passed`。1512×980 實測 9 項規格、承德店資料／LINE、3 則評論、1 個文章圖組、0 個留言表單皆正確；Sidebar 在 500／1300／2200px 捲動位置皆固定於 96px，輪播可由第 1 張切至第 2 張，來源感知 Breadcrumb、前後篇及推薦連結都會保留 `from=inspiration`。桌面與 390×844 手機完整捲動後圖片錯誤、Reveal 隱藏、Nuxt 錯誤、console error／warning、水平溢位皆為 0；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 僅有 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 3.2.3 量身打造型男夢想廚房案例內頁（2026-08-30 最新核對）

- **PPT 第 6 頁真值**：`/gallery/case35` 依 `2026.08.21_3.0門市與服務、4.0優惠消息 _調整.pptx` 第 6 頁核對；不建立新頁面骨架，直接沿用 3.2.1／3.2.2 已核准的案例內頁、桌機 30/40px Noto Serif TC SemiBold 標題、來源感知 Breadcrumb、Sticky 右欄、Previous／Next、評論與更多案例輪播。
- **指定圖片位置**：頁首主輪播首圖已是 `case35_content_asset_03_2026.jpg` 的完整中島全景，文章末段已是 `case35_content_asset_11_2026.jpg` 的沈志剛設計師入鏡照，與第 6 頁兩個紅框內嵌素材一致；兩張皆沿用既有正式素材，不複製、不重存，也不為製造差異而改動正確的圖片索引。
- **松竹店正式資料**：案例規格改為現代風、石紋色、潮派廚房、L型+中島、400CM以上、4坪以上、35萬以上、櫻花石、沈志剛共 9 項，移除舊版不在規格表的「家的組成」。門市資訊補齊週一至週六 09:30–21:00、`04-2239 7068`、軍功里完整地址；卡片、到店預約與 LINE 諮詢統一使用 PPT 指定松竹店連結 `https://lin.ee/xIPto4o`。
- **文章圖片與評論**：主輪播、首段雙圖及最後一段屋主實景圖保留；依三個紅框移除清水模單圖、多功能中島雙圖與收納廚電雙圖，文章文字與最後三個延伸連結維持。顧客評論依簡報逐字放入 3 則相同內容，留言表單不渲染；評論提到「紀先生」但本案設計師為「沈志剛」，屬來源簡報的內容不一致，前端先照稿呈現，正式上線前須由內容端確認。
- **本輪 QA（2026-08-30）**：1280px 桌機實測標題 30/40px，首圖與設計師照皆落在第 6 頁指定位置；390×844 手機實測 `scrollWidth === innerWidth === 390`、首圖順序不變、圖片破損 0。桌機／手機 Console error／warning 0，頁面已恢復桌機版並停在頂端；`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。

## Nuxt 3 — 4.0 優惠消息總覽頁（2026-08-30 最新調整）

- **PPT 第七頁真值**：`/news` 依 `2026.08.21_3.0門市與服務、4.0優惠消息 _調整.pptx` 第 7 頁調整；保留 Antra News List 的首篇大圖、後續左右圖文與右側欄結構。Hero 主標由中文「優惠消息」改為模板英文字型 `Updates`（Cal Sans 60/64px、Regular），麵包屑維持 Noto Sans TC 15/20px；首篇文章標題改為 Noto Serif TC SemiBold 30/40px，後續文章層級與正式內容不變。
- **側欄與實際導覽**：依紅框刪除 `Categories` 與 `Popular Tags`，保留「優惠消息」分類膠囊及「最新文章」。分類膠囊不再是不可操作的 `span`，而是分別連到 `/news/activities`、`/news/latest`、`/news/video` 的正式列表頁；主列表與最新文章的圖片、標題也接上既有正式文章路由，並補齊鍵盤 Focus 樣式。側欄兩個標題為 Noto Serif TC 25/31px；2026-08-28 四筆最新文章標題改為 Noto Serif TC SemiBold 18/24px，日期仍維持 Noto Sans TC，文章列間保留一個文字框的間距。
- **手機可讀性**：390px 實機寬度回查時發現右側快速服務列會直接遮住文章標題與摘要，因此在全部 `/news…` 路由的 767px 以下隱藏該列；桌機優惠消息頁及其他非新聞路由維持原行為，不為了容納固定列而壓窄文章內容。
- **本輪 QA（2026-08-30）**：1280px 桌機實測 Hero 為 Cal Sans 60/64px Regular、麵包屑為 Noto Sans TC 15/20px、首篇標題為 Noto Serif TC SemiBold 30/40px、側欄文章為 18/24px SemiBold；圖片破損 0。390×844 手機實測 `scrollWidth === innerWidth === 390`，側欄與快速服務列維持隱藏，Hero 與首篇標題正常換行；桌機／手機 Console error／warning 0。`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。

## Nuxt 3 — 4.1／4.2／4.3 優惠消息分類列表頁（2026-08-30 最新調整）

- **PPT 第八頁真值**：第 8 頁同時指定 4.1／4.2／4.3，因此 `/news/activities`、`/news/latest`、`/news/video` 三頁同步處理，不只修改示意圖中的優惠活動。Hero 主標依序改為模板英文字型 `Promotions`、`NEWS`、`Media`（Cal Sans 60/64px、Regular），完整中文麵包屑維持 Noto Sans TC 15/20px。
- **卡片層級**：維持 Antra 三欄文章卡、24px 圓角、金色分類膠囊、Hover 圖片放大與整卡正式文章連結；分類膠囊改用 Noto Sans TC，卡片標題依第 8 頁統一為 Noto Serif TC SemiBold 20/30px，手機不再降回舊版 18px。摘要維持 Noto Sans TC 15/22px、兩行限制，日期及正式資料、圖片與路由皆不變。
- **手機可讀性**：快速服務列的手機隱藏條件由單一 `/news` 擴充至全部 `/news…` 路由，避免三個列表及後續文章內頁的標題、摘要與操作區被固定列遮擋；桌機仍保留原快捷列。
- **本輪 QA（2026-08-30）**：1280px 桌機逐頁實測三個英文 Hero 均為 Cal Sans 60/64px Regular，麵包屑為 Noto Sans TC 15/20px，分類膠囊為 Noto Sans TC，卡片標題為 Noto Serif TC SemiBold 20/30px；三頁圖片破損皆為 0。390×844 手機三頁皆 `scrollWidth === innerWidth === 390`，Hero 正常縮為 30/35px、卡片標題維持 20/30px；Console error／warning 0。`pnpm --dir nuxt-site typecheck` 與 `git diff --check` 通過。

## Nuxt 3 — 4.1／4.2／4.3 優惠消息文章內頁（2026-08-30 最新調整）

- **三套文章 Hero 統一（2026-08-31）**：完整掃描 `/news/activities/[slug]`、`/news/latest/[slug]`、`/news/video/[slug]`，三套內容頁全部改為與各自列表頁一致的 360／285／204px Hero、置中展示標題與麵包屑；展示標題分別沿用 `Promotions／NEWS／Media`。文章正式標題仍是每頁唯一 `h1`，各分類既有正式背景素材不互相覆蓋。
- **PPT 第九頁真值與範圍**：第 9 頁左側再次標示「文章頁同內容調整」，因此修改範圍是 `/news/activities/[slug]`、`/news/latest/[slug]`、`/news/video/[slug]` 三套正式文章模板，不是只修示意圖中的優惠活動。三頁麵包屑底圖統一換成 3.1 案例門市店面圖，文字使用 Noto Sans TC 15/20px 並加寬字距。
- **2026-08-30 第 9 頁複核**：麵包屑維持投影片示意的水平／垂直置中；三套文章主標統一為 Noto Serif TC 30/41px、SemiBold，底部推薦卡標題則由舊版 25px（手機 22px）修正為全斷點 Noto Serif TC 20/30px、SemiBold。第 10 頁兩篇指定文章的內容例外未提前混入本次共用模板調整。
- **文章版面與字級**：文章 Header、主圖／影片與內文改為廚房裝修指南文章內頁相同的 930px 版心；分類日期列間距由 12.5px 校正為 15px，標題至主圖間距由 30px 改為 40px。優惠活動、最新消息與媒體影音三種內容頁的文章大標在所有斷點統一為 Noto Serif TC 30/41px，段落標題為 Noto Serif TC 25/32px，段落、清單及文章連結為 Noto Sans TC 15/26px；三頁都不再由 Cal Sans／Golos Text 搶先顯示中文字。
- **分類狀態**：文章底部移除 PPT 指定刪除的「廚房裝修指南」，只保留優惠活動、最新消息、媒體影音；每一頁只有目前分類使用金底白字，另外兩個維持白底灰字及可操作 Hover，不再出現優惠活動頁四顆按鈕全部金底的錯誤。
- **輪播改成列表卡排版**：`InternalActivityRelatedCarousel`、`InternalLatestRelatedCarousel`、`InternalMediaRelatedCarousel` 保留 Embla 拖曳與正式文章連結，但圖片比例改為優惠活動列表使用的 `1.40625`、金色分類膠囊改置於左上 20px、移除黑色遮罩；卡片下方只保留完整日期與標題，標題使用 Noto Serif TC SemiBold 20/30px，桌面卡片間距由 30px 改為 40px。
- **Design QA／建置**：依專案只維護 README 的規則，本節取代額外的 `design-qa.md`。來源視覺為 PPT 第 9 頁與內嵌文章長頁，實作證據為 `/private/tmp/slide9-activity-top-1512.png`、`/private/tmp/slide9-activity-middle-1512.png`、`/private/tmp/slide9-activity-bottom-final-1512.png`，同畫面比較板為 `/private/tmp/slide9-article-design-qa.png`，最終結果 `passed`。1512×980 三類文章均確認底圖、930px 版心、25px 段落標題、15px 內文、正確目前分類與 3 張正式輪播卡；2026-08-28 文章大標另依最新回饋統一更新為 30px。輪播第二張可實際跳轉。390×844 實測無水平溢位，文章為 360px 版心、快速服務列隱藏。Noto Serif TC／Noto Sans TC 字型載入檢查皆為 `true`，圖片載入錯誤與 console error／warning 為 0；`pnpm --dir nuxt-site typecheck`、`NUXT_IGNORE_LOCK=1 pnpm --dir nuxt-site build` 與 `git diff --check` 均通過，production build 只保留 Tailwind CSS v4 既有 sourcemap warning。

## Nuxt 3 — 4.2 最新消息指定文章調整（2026-08-30 最新調整）

- **文章內頁 Hero（2026-08-31）**：`/news/latest/[slug]` 由原本僅 185px 的麵包屑帶改為與最新消息列表一致的 360px 桌機／285px 平板／204px 手機 Hero，補回 `NEWS` 展示標題與相同置中節奏；展示標題使用一般文字，文章正式標題仍是頁面唯一 `h1`。第 10 頁指定的台中品牌館背景、遮罩及麵包屑內容不變。
- **PPT 第十頁真值與範圍**：第 10 頁不是第 9 頁共用文章模板的再版，而是 `/news/latest/2026-franchise-seminar` 與 `/news/latest/kaohsiung_opening` 兩篇指定文章的內容例外；共用的 930px 版心、30px 文章標題、15px 正文、三分類 Tab 與推薦文章維持不動。最新消息文章的麵包屑背景依指定改用素材庫 `5.2 集團品牌館／Taichung` 的台中集團品牌館正面照，定位沿用 3.1 已驗收的 `center 88%`。
- **加盟說明會**：依第 10 頁最新標註刪除主圖下方的歡迎短句；QR Code 改到台北／台中／高雄三張場次表之後，縮為 128px 並顯示「報名QR code」，不再把 QR 與文字連結放在文章前段。三個場次標題維持 `【地區加盟說明會場次】`，並修正為 PPT 指定的 Noto Serif TC SemiBold 20/30px；三張正式場次圖維持約 500px 窄版置中。
- **高雄品牌館**：首段介紹保留單欄；PPT 點名的張永杰董事長段落改為 Home Six 參考的左圖右文雙欄，左側使用同一段原官網現場圖、右側保留指定原文，既有 `opalMoveUp／opalScaleUp` 進場語彙不另造動畫。第二張 HOME in O.N.E 現場圖與其後核心價值／結語仍完整保留；767px 以下依閱讀順序改為圖片在上、文字在下。
- **Design QA／建置**：2026-08-30 於 1280px 實測加盟頁文章主標為 Noto Serif TC 30/41px、SemiBold，三個場次標題為 20/30px、SemiBold；三張場次圖後才出現 128px QR 與「報名QR code」，歡迎短句及舊報名連結皆已移除。高雄品牌館仍使用指定台中品牌館麵包屑圖與 930px 雙欄段落。兩頁圖片破損 0、`scrollWidth === innerWidth`；390×844 手機同樣維持 30px 主標、20px 場次標題、128px QR、單欄品牌館段落且無水平溢位，console error／warning 0。

## Nuxt 3 — 全站內頁版面一致性（2026-08-21）

- **全站淺灰統一（2026-09-02）**：全站既有的 `#f6f6f6` 次要灰階統一提亮為 `#fafafa`，同步套用於 Section、卡片畫布、表單與地圖中原本共用該灰階的區域；純白、品牌金、文字與邊框色維持不變，避免各頁各自出現不同灰底。
- **建商能力卡回歸模板（2026-09-01）**：`/builders` 的 `Have A Project In Mind? Let’s Make It Happen` 能力卡改用原版三張 Banner 的完整背景構圖；只移除前景的型錄、金管與鋼條，保留淡灰圓角幾何、工程線稿與抽象圖形。版型維持無圓角、`#f9f9f9` 與 Flex 左文右標語，左側以 Noto Sans TC 顯示黑／金／黑三行大字，右側以 Noto Serif TC 顯示 `45萬+／AI 智能／管理平台`；手機維持同一左右結構的單欄 Banner。
- **建商 HOME in O.N.E. 區塊（2026-09-01）**：依提供的 `IMG_1403.JPG` 重做為白底置中版型：42px 金色中文主標與 420×64px 膠囊置頂，三欄採 214×92px 金框分類、實心尖角、金色勾選標題與兩行黑色說明；文字更新為 `一站式服務／多樣產品選擇／輕鬆擁有`、`專業銷講／專屬監工／專人驗收` 及指定說明，移除原本的大白卡、頂部分隔線與建築線稿背景。
- **建商能力 Section 視覺整合（2026-09-01）**：能力 Banner 與 `HOME in O.N.E` 收進同一張 36px 圓角展示底板，Section 統一使用其他內頁既有的 `#fafafa` 中性灰，展示底板改用中性低對比陰影，分類框維持純白；淡金僅保留在邊框、文字與 CTA。展示底板到 `One-Click Registration Lifetime Service` 標題的桌面交界留白由 270px 收為 144px，平板／手機同步按比例收斂。三張能力 Banner 為 22px 圓角，三個分類框為 14px 圓角，手機展示底板同步收為 26px 圓角，膠囊字級與字距會縮放且維持單行。
- **建商團隊卡與聯絡區顯示修正（2026-09-01）**：保留最左側原本的 SAKURA KITCHEN 專案卡，固定在第一欄且不再受 Reveal 初始透明狀態影響；只有右側三欄是 `Coming Soon` 空白區。聯絡區的台北／台中／高雄切換改為平均排列在展館圖片外部上方的三顆膠囊 Tab，並移除表單上方「線上送出服務正在串接中」提示卡；未設定端點時送出後仍顯示完整錯誤資訊且不傳送資料。

- **全站桌面捲動重量（2026-08-31）**：Lenis 慣性時間由 1.5 秒收為 1.2 秒，降低滾動拖尾與沉重感；滾輪距離、既有 expo ease-out、`prefers-reduced-motion` 保護及 992px 以下原生捲動皆不變。
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
# 2026-10-02 前台修正（本機，未部署）

- 修復首頁廚房產品、Footer 的 CMS 背景樣式被空白拆開；保留 CMS 圖片設定。
- 區域篩選不再視為選定門市；切換篩選會取消門市鎖定，只有點選門市才固定該張卡片。
- 品牌系列板材 CTA 移除上方橫線、縮小與推薦電器的留白；少量板材／電器卡片置中，保留響應式卡片尺寸。
- 案例門市的區域標籤與結果筆數統一為 16px、#59585D。
- 設計靈感重新納入 CMS 原有門市故事，與資料庫案例共同篩選／每頁 9 筆；門市故事仍使用原 `/gallery/:slug`，返回設計靈感保留型式、風格與頁碼，不複製或覆寫資料庫案例。
- 標示「提供樣式後再修改」的標題／Hero／產品版型暫不調整；尋找門市的新標題、Figma 提案商品範圍待確認。
- 內容修正使用 CMS 版本機制（保留原版本、有未發布草稿或 revision 衝突即停止），不重跑 seed、不修改 SPA／sync 資料。先在 `nuxt-site` 執行 `FRONTEND_ASSET_DIR='/Users/eric/Downloads/提案後新增用圖/2.2廚房產品型錄' node --env-file=.env scripts/update-frontend-content-20261002.mjs` 檢查，再加 `--apply` 套用本機：君璽導覽圖片對齊 Hero、Brand Commitment 小標、廚房配備 PDF／封面與已核實的同型號去背圖。指令拒絕非本機 SakuraWebsiteDev；正式 CMS 尚未套用，部署程式不會自動發布這些內容。
- 推薦電器 28 型號中 19 個已有／找到透明原圖。仍缺原始去背素材：G2112G、R605、EG2501GC、EG2350GB、Q7585BL、DR7397XL、Q7693、DR7790A、G2932AG；暫保留原圖，不替換其他型號或 AI 重繪產品。
- 唯讀回歸：啟動本機 3100 後，在 `nuxt-site` 執行 `node scripts/check-frontend-regressions.mjs`；驗證 25 個來源案例加 3 門市案例（9／9／9／1）、交集篩選、錯誤參數、返回列表、背景與 PDF 預覽／下載一致。可指定上述 `FRONTEND_ASSET_DIR` 另比對 PDF SHA-256。原匯入驗證指令的來源資料庫筆數仍為 25，列表驗收更新為 28。
- 已驗證：`pnpm typecheck`、`pnpm build`、`node scripts/check-frontend-regressions.mjs`、`node scripts/check-kitchen-series.mjs` 通過；內容更新重跑四筆皆 `UNCHANGED`。瀏覽器確認 1218px／390px 卡片置中、無水平溢出、CTA 上框線為 0px、四張北部門市卡片輪替、君璽導覽圖載入、背景恢復、門市篩選文字 16px／rgb(89,88,93)，以及「工業風 → 安康案例 → 設計靈感」保留篩選、麵包屑固定、scrollY=0。
- 另以 3121 啟動正式建置產物並重跑上述唯讀回歸通過；測試程序已關閉，3100 開發預覽保留。沒有部署或修改雲端 CMS。

## 2026-10-31 手機加盟雙排影像循環

- 依凌晨1.46.01截圖，實際核對原官網加盟介紹：手機上排200px、下排180px、排距24px；目前正式版雖已有兩排38秒／34秒反向無限循環，但每排只有112px。本次僅max-width:767px恢復原官網手機比例，保留既有兩張完整長圖及各自相同副本，不改768px以上尺寸、速度、動畫或CMS／資料庫。
- 手機整組輪播直接可見，取消外層opalScaleUp進場，避免圖片區顯示依賴一次性Reveal class；內層連續循環仍保留，鍵盤聚焦暫停及減少動態效果時可手動橫向捲動的規則不變。修前正式站已觀察超過一輪並捲出再返回，尚未重現使用者的空白，不能宣稱已證實空白根因；後續以實際完整循環、重載及返回畫面驗證。
- pnpm build含typecheck通過（既有JSON import attributes及Tailwind sourcemap警告保留）。對照正式修前320／390／430／767／768／1024／1280／1920px八尺寸，本機四組手機上排200px、下排180px、排距24px，無水平溢位；四組768px以上的輪播及圖片尺寸、速度、循環設定與修前完全一致。
- 本機390×844實際觀察79秒，超過38秒及34秒兩個完整循環，兩排均持續移動、四張圖載入，影像盒連續覆蓋可見寬度，外層visibility:visible／opacity:1／animation:none。實際聚焦暫停、移開繼續均正常，捲出三屏再捲回與重新載入後仍顯示，瀏覽器console error 0。未播放影片或提交業務表單；降低動態效果的既有規則未改，但本輪未切換系統偏好實測。
- 34b5f738已發布至dpl_FeqpoRHHzyP1kxRmjyZQ6kWQkji3，Vercel READY／Production、GitHub成功；分別inspect兩個既有正式網域皆確認同一版本。主網域八尺寸與本機一致，四組768px以上輪播／圖片幾何及循環設定與修前一致，無水平溢位。正式390×844在兩排完整入畫後觀察102秒，0／58.509／102.196秒抽樣皆visibility:visible、opacity:1、播放running，四張圖皆載入，兩副本接縫誤差小於0.1px且覆蓋可視寬度；超過兩輪後兩排仍可見。實際捲出三屏再返回正常，console error 0；另一正式網域390px亦200／180px、持續反向循環、外層animation:none且無溢位。
- 修前基準/tmp/sakura-franchise-marquee-before.json；本機畫面/tmp/sakura-franchise-marquee-local.png、正式畫面/tmp/sakura-franchise-marquee-production.png、超過兩輪後/tmp/sakura-franchise-marquee-production-after-loops.png，完整量測/tmp/sakura-franchise-marquee-qa.json。沒有重現修前空白，這次是依參考修正比例並移除手機外層隱藏進場依賴，未宣稱已證實Safari空白根因；未驗實體手機或Safari／Firefox。自開server已停、viewport已還原；無CMS／資料庫寫入，完成紀錄只提交README、不為文件再次部署。
