import React, { useLayoutEffect, useRef } from 'react';
import { Header } from './Header';

// 與 ScaleToFit 同一基準寬
const DESIGN_W = 1512;

// 頁首高度（Header bar `h-[72px]`）；App 內容頂端要留同高 spacer 避免被固定頁首蓋住。
export const HEADER_H = 72;

/**
 * 固定頁首（sticky）。
 * 因為整站被 ScaleToFit 的 `transform: scale()` 包住、頁面用 body 原生捲動——
 * 在畫布內用 sticky/fixed 都無法真正釘在視窗頂（transform 祖先會讓 fixed 相對畫布、
 * overflow:hidden 祖先又讓 sticky 失效）。故把 Header 抽到畫布外，自成一層
 * `position: fixed` 頂欄，並用同一 scale 等比縮放，維持與全站一致的比例。
 */
export function StickyHeader() {
  const scalerRef = useRef<HTMLDivElement>(null);

  useLayoutEffect(() => {
    const scaler = scalerRef.current;
    if (!scaler) return;
    const apply = () => {
      scaler.style.transform = `scale(${window.innerWidth / DESIGN_W})`;
    };
    window.addEventListener('resize', apply);
    apply();
    return () => window.removeEventListener('resize', apply);
  }, []);

  return (
    // 固定於視窗頂、滿寬；mega-menu 需往下展開，故不加 overflow-hidden
    <div className="fixed top-0 left-0 right-0 z-50">
      <div ref={scalerRef} style={{ width: DESIGN_W, transformOrigin: 'top left' }}>
        <Header />
      </div>
    </div>
  );
}
