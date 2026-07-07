import React from 'react';
import { StickyHeader, HEADER_H } from './components/StickyHeader';
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
    {/* 固定頁首：抽到 ScaleToFit 畫布外自成 fixed 層，才能真正釘住視窗頂 */}
    <StickyHeader />
    <ScaleToFit>
    <div className="bg-white">
      {/* 頂端 spacer：等於 Header 高度，避免內容被固定頁首蓋住（同在畫布內、同步縮放） */}
      <div style={{ height: HEADER_H }} aria-hidden />

      {/* 主內容 */}
      <div className="flex-1 min-w-0">
        {/* Hero 首屏：section 級 fadeInDown（模板 Home Six hero）；不碰內部抽屜 transform */}
        <Reveal anim="fadeInDown"><HeroSection /></Reveal>
        {/* 專案輪播（取代原本 Hero 內的 Gallery，採 Home Six 版型）— 出場/視差在元件內 */}
        <ProjectSection />
        {/* 價目表（Antra Pricing 忠實複刻；保留底部跑馬燈）— 三卡 stagger 在元件內 */}
        <PricingSection />
        {/* 圖庫輪播（採 Antra Home Three antra-image-carousel 版型）— 出場/視差在元件內 */}
        <GallerySection />
        {/* What we do（採 Antra Home Six 版型：左文字 + 右錯位交疊雙圖 + 視差） */}
        <WhatWeDoSection />
        <Reveal anim="slideInUp"><StoreLocationSection /></Reveal>
      </div>

      {/* Footer 滿寬（模板頁尾無進場動畫，不包 Reveal） */}
      <Footer />
    </div>
    </ScaleToFit>
    {/* 右側浮動按鈕：抽到 ScaleToFit 外自成 fixed 層，才能真正釘住視窗右側（同 StickyHeader 做法） */}
    <FloatingButtons />
    </ScrollMotionProvider>
  );
}
