import React from 'react';
import { Header } from './components/Header';
import { HeroSection } from './components/HeroSection';
import { ProjectSection } from './components/ProjectSection';
import { ProductsSection } from './components/ProductsSection';
import { GallerySection } from './components/GallerySection';
import { WhatWeDoSection } from './components/WhatWeDoSection';
import { StoreLocationSection } from './components/StoreLocationSection';
import { Footer } from './components/Footer';
import { FloatingButtons } from './components/FloatingButtons';
import { ScaleToFit } from './components/ScaleToFit';

export default function App() {
  return (
    <ScaleToFit>
    <div className="bg-white">
      {/* Header 完全獨立，滿寬 */}
      <Header />

      {/* Header 以下：主內容 + 右側按鈕並排 */}
      <div className="flex">
        <div className="flex-1 min-w-0">
          <HeroSection />
          {/* 專案輪播（取代原本 Hero 內的 Gallery，採 Home Six 版型） */}
          <ProjectSection />
          {/* 三大廚房產品品牌（SAKURA 廚電 / SVAGO / TEKA） */}
          <ProductsSection />
          {/* 圖庫輪播（採 Antra Home Three antra-image-carousel 版型） */}
          <GallerySection />
          {/* What we do（採 Antra Home Six 版型：左文字 + 右錯位交疊雙圖 + 視差） */}
          <WhatWeDoSection />
          <StoreLocationSection />
        </div>

        {/* 右側按鈕欄（桌面版） */}
        <FloatingButtons />
      </div>

      {/* Footer 獨立在 flex 外，滿寬 */}
      <Footer />
    </div>
    </ScaleToFit>
  );
}
