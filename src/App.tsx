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
          <BrandsSection />
          <DesignCaseSection />
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
