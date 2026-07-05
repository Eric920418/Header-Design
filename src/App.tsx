import React from 'react';
import { Header } from './components/Header';
import { HeroSection } from './components/HeroSection';
import { ProjectSection } from './components/ProjectSection';
import { PricingSection } from './components/PricingSection';
import { GallerySection } from './components/GallerySection';
import { WhatWeDoSection } from './components/WhatWeDoSection';
import { StoreLocationSection } from './components/StoreLocationSection';
import { Footer } from './components/Footer';
import { FloatingButtons } from './components/FloatingButtons';
import { ScaleToFit } from './components/ScaleToFit';
import { ScrollMotionProvider } from './motion/ScrollMotionProvider';
import { Reveal } from './motion/Reveal';

export default function App() {
  return (
    // 平滑捲動阻尼（Lenis）啟動點，掛在 ScaleToFit 外層
    <ScrollMotionProvider>
    <ScaleToFit>
    <div className="bg-white">
      {/* Header 完全獨立，滿寬 */}
      <Header />

      {/* Header 以下：主內容 + 右側按鈕並排 */}
      <div className="flex">
        <div className="flex-1 min-w-0">
          {/* Hero 為首屏，載入即淡入上升（section 級 Reveal，不碰內部抽屜 transform） */}
          <Reveal><HeroSection /></Reveal>
          {/* 專案輪播（取代原本 Hero 內的 Gallery，採 Home Six 版型）— 出場/視差在元件內 */}
          <ProjectSection />
          {/* 價目表（Antra Pricing 忠實複刻；保留底部跑馬燈）— 三卡 stagger 在元件內 */}
          <PricingSection />
          {/* 圖庫輪播（採 Antra Home Three antra-image-carousel 版型）— 出場/視差在元件內 */}
          <GallerySection />
          {/* What we do（採 Antra Home Six 版型：左文字 + 右錯位交疊雙圖 + 視差） */}
          <WhatWeDoSection />
          <Reveal><StoreLocationSection /></Reveal>
        </div>

        {/* 右側按鈕欄（桌面版） */}
        <FloatingButtons />
      </div>

      {/* Footer 獨立在 flex 外，滿寬 */}
      <Reveal><Footer /></Reveal>
    </div>
    </ScaleToFit>
    </ScrollMotionProvider>
  );
}
