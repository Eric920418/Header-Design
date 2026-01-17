import React from 'react';
import { Header } from './components/Header';
import { HeroSection } from './components/HeroSection';
import { GallerySection } from './components/GallerySection';
import { BrandsSection } from './components/BrandsSection';
import { DesignCaseSection } from './components/DesignCaseSection';
import { AboutSection } from './components/AboutSection';
import { StoreLocationSection } from './components/StoreLocationSection';
import { Footer } from './components/Footer';
import { FloatingButtons } from './components/FloatingButtons';

export default function App() {
  return (
    <div className="min-h-screen bg-gray-50">
      <Header />
      <HeroSection />
      <GallerySection />
      <BrandsSection />
      <DesignCaseSection />
      <AboutSection />
      <StoreLocationSection />
      <Footer />
      <FloatingButtons />
    </div>
  );
}