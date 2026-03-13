
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

採用 **Desktop-first** 策略：

- 預設樣式為手機端（< 1024px）
- 使用 `lg:` 前綴（≥ 1024px）標記桌面端樣式
- 斷點：`sm` (640px)、`lg` (1024px)

### 主要響應式適配

| 組件 | 手機版行為 |
|------|-----------|
| Header | 漢堡選單展開/收合 |
| HeroSection | 隱藏左側邊欄，縮小標題和播放按鈕 |
| GallerySection | 全寬大圖，縮圖改為相對定位 |
| BrandsSection | 品牌圖片垂直堆疊 |
| DesignCaseSection | 左右分欄改為上下堆疊 |
| AboutSection | 文字區和影片區垂直堆疊 |
| StoreLocationSection | 地圖和門市列表垂直堆疊，搜尋表單自動換行 |
| Footer | Grid 2 欄重排 |
| FloatingButtons | 右側按鈕隱藏，改為底部固定導航列 |

### 驗證方式

1. 瀏覽器 DevTools → 1280px → 確認桌面版完全不變
2. 375px（iPhone SE）→ 所有區塊垂直堆疊、無水平溢出
3. 414px（iPhone Plus）→ 同上
4. 768px（iPad）→ 中間尺寸過渡正常
