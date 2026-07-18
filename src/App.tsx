import React from 'react';
import { StickyHeader, HEADER_H } from './components/StickyHeader';
import { HeroSection } from './components/HeroSection';
import { HeroStyleMarquee } from './components/HeroStyleMarquee';
import { ProjectSection } from './components/ProjectSection';
import { ServicesSection } from './components/ServicesSection';
import { GallerySection } from './components/GallerySection';
import { WhatWeDoSection } from './components/WhatWeDoSection';
import { StoreLocationSection } from './components/StoreLocationSection';
import { Footer } from './components/Footer';
import { FloatingButtons } from './components/FloatingButtons';
import { ScrollMotionProvider } from './motion/ScrollMotionProvider';
import { Reveal } from './motion/Reveal';

export default function App() {
  return (
    <ScrollMotionProvider>
      <StickyHeader />
      <div className="bg-white">
        {/* 頂端 spacer：避免內容被 fixed Header 蓋住。 */}
        <div style={{ height: HEADER_H }} aria-hidden />

        <main className="min-w-0">
          <HeroSection />
          {/* 使用者自訂功能：獨立於模板 Hero，避免更換 Hero 時被刪除。 */}
          <HeroStyleMarquee />
          <ProjectSection />
          <ServicesSection />
          <GallerySection />
          <WhatWeDoSection />
          <Reveal anim="slideInUp"><StoreLocationSection /></Reveal>
        </main>

        <Footer />
      </div>
      <FloatingButtons />
    </ScrollMotionProvider>
  );
}
