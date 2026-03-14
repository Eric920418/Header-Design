import React from 'react';
import { Header } from './components/Header';
import { HeroSection } from './components/HeroSection';
import { BrandsSection } from './components/BrandsSection';
import { DesignCaseSection } from './components/DesignCaseSection';
import { AboutSection } from './components/AboutSection';
import { StoreLocationSection } from './components/StoreLocationSection';
import { Footer } from './components/Footer';
import { FloatingButtons } from './components/FloatingButtons';

export default function App() {
  return (
    <div className="min-h-screen bg-white pb-14 lg:pb-0">
      {/* Header 完全獨立，滿寬 */}
      <Header />

      {/* Header 以下：主內容 + 右側按鈕並排 */}
      <div className="flex">
        <div className="flex-1 min-w-0">
          <HeroSection />
          {/* 梯形灰色背景橫跨三個 section */}
          <div className="relative isolate">
            <div
              className="absolute inset-0 bg-gray-100 pointer-events-none z-[-1]"
              style={{ clipPath: 'polygon(50% 0%, 100% 0%, 100% 100%, 20% 100%)', top: '-350px', left: 0, width: '100%', height: '85%' }}
            />
            <BrandsSection />
            <DesignCaseSection />
          </div>
            <AboutSection />
          <StoreLocationSection />
        </div>

        {/* 右側按鈕欄（桌面版） */}
        <FloatingButtons />
      </div>

      {/* Footer 獨立在 flex 外，滿寬 */}
      <Footer />
    </div>
  );
}
