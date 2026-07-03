# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 專案性質

SAKURA Kitchen 品牌行銷頁，**單頁靜態網站**，由 Figma 設計稿用 Figma Make 匯出後手工調整而成。
無路由、無後端、無狀態管理、無測試、無 lint。React 18 + Vite 6 + Tailwind CSS v4。

設計稿：https://www.figma.com/design/TTt0ua7aR3ayd8zsIkTBPa/Header-Design

## 指令（只用 pnpm）

```bash
pnpm install
pnpm dev      # http://localhost:3000，自動開瀏覽器（vite.config.ts server.open）
pnpm build    # 輸出到 build/（非預設的 dist/）
```

- **沒有測試指令、沒有 lint 指令、沒有 type-check**。`pnpm build` 用 SWC 轉譯，**不做 TypeScript 型別檢查**（專案無 `tsconfig.json`）。改 `.tsx` 時型別錯誤不會在 build 時被擋下。
- 部署：Vercel（`vercel.json` 指定 framework=vite、outputDirectory=`build`）。

## 架構

進入點：`index.html` → `src/main.tsx` → `src/App.tsx`。

`App.tsx` 是唯一的組裝點，垂直串接 8 個 section 元件（`src/components/*.tsx`），順序固定：
Header → HeroSection → BrandsSection → DesignCaseSection → AboutSection → StoreLocationSection → Footer，外加桌面版右側的 `FloatingButtons`。

兩個跨元件的版面機制（改版面前必須知道）：
1. **梯形灰底**：`App.tsx` 用一個 `clipPath: polygon(...)` 的絕對定位 div 橫跨 BrandsSection + DesignCaseSection 兩個 section，其 `top` 由 `var(--clip-top)` 控制。動到這兩個 section 的間距時要連帶檢查這塊背景。
2. **flex 並排**：Header / Footer 滿寬獨立；中間主內容與 `FloatingButtons` 用一個 `flex` 包起來並排。

## 響應式系統（本專案最重要的慣例）

斷點邏輯**集中在 `src/styles/globals.css`**，用 CSS 自訂變數驅動，元件只是讀取值。三斷點：
- 手機 `<768px`：`:root` 預設值（較小固定值）
- 平板 `768–1023px`：`min()` + `dvh` 流動縮放
- 桌面 `≥1024px`：**還原成 Figma 原始像素值，要求視覺零差異**

存在**兩套並行機制**，改一個值前先確認它走哪一套：
- **inline `style`** 的值 → 引用 CSS 變數，例如 `style={{ height: "var(--hero-h)" }}`。改尺寸要去 `globals.css` 改三個斷點的變數定義，**不是改元件**。
- **className** 的值 → 直接用 Tailwind 響應式前綴，例如 `h-[280px] md:h-[380px] lg:h-[450px]`。改尺寸直接改元件。

驗證標準：桌面 ≥1024px 必須與設計稿像素級一致；手機/平板向下適配即可。

## 樣式慣例

- **Tailwind v4**，透過 `@tailwindcss/vite` plugin，**無 `tailwind.config.js`、無 PostCSS**。設定全在 `globals.css` 裡用 `@theme inline` 與 `@custom-variant` 完成。
- 顏色等 design token 是 `globals.css` `:root` 的 CSS 變數，再經 `@theme inline` 暴露給 Tailwind。品牌金色 `#C4A574`。
- 大量 **inline `style={{}}` 寫死像素值 / 漸層**（Figma 匯出的精確值），這是刻意的還原手段，**不要當技術債去「重構成 class」**——會破壞與設計稿的對位。
- class 合併用 `cn()`（`src/components/ui/utils.ts`，clsx + tailwind-merge）。
- 垂直中文排版用 `.writing-vertical` utility（定義在 `globals.css`）。
- 圖片來源是**寫死在元件裡的 Unsplash 外連 URL**；`src/components/figma/ImageWithFallback.tsx` 提供載入失敗的 fallback。

## Figma Make 遺留物（不要動）

- `vite.config.ts` 的 `resolve.alias` 有一堆 `'sonner@2.0.3': 'sonner'` 這類**帶版本號的別名**——因為匯出的程式碼 import 時帶了版本後綴，移掉會讓 build 壞掉。`@` → `./src` 也在這裡。
- `src/components/ui/`：整套 Radix-based shadcn 元件庫，**頁面幾乎沒用到**，是樣板殘留。要找頁面實際邏輯看 `src/components/*.tsx`（section 層級），不是 `ui/`。
- `src/guidelines/Guidelines.md` 是空白範本，可忽略。

## 注意事項

- `build/` 產物**被 commit 進 git**。改完原始碼後 `build/` 會與原始碼不同步；除非要部署，否則別誤以為 `build/` 反映最新狀態。
- 依使用者全域規則：所有錯誤完整顯示在前端、文件更新只維護 `README.md` 一份、不要新增其他 `.md`。
