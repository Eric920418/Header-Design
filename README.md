
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

## 響應式設計

採用 **三斷點** 策略，透過 CSS Custom Properties + 媒體查詢實現：

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
| Header | 漢堡選單 | 漢堡選單 | 完整導航 |
| HeroSection | 隱藏側邊欄/Gallery，縮小標題和播放按鈕 | 隱藏側邊欄/Gallery，中等尺寸 | 完整佈局 |
| BrandsSection | `mt-16` 較小間距 | `mt-24` 中等間距 | `mt-[250px]` 原始間距 |
| DesignCaseSection | 上下堆疊，`h-[280px]` | 上下堆疊，`h-[380px]` | 左右分欄，`h-[450px]` |
| StoreLocationSection | 地址電話垂直堆疊，地圖 200px | 地圖 320px | 地圖 400px |
| App 梯形背景 | `top: -150px` | `top: -250px` | `top: -350px` |

### 驗證方式

1. **桌面版（1920x1080）**：逐頁比對確認零視覺差異
2. **桌面邊界（1024x768）**：確認 `lg:` 斷點切換正常
3. **平板（768x1024 iPad）**：佈局合理、字體可讀、間距適當
4. **手機（390x844 iPhone 14）**：佈局不溢出、文字可讀
5. **斷點跳變**：拖動瀏覽器寬度在 768px 和 1024px 附近確認過渡平滑
