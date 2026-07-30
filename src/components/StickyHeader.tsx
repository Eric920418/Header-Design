import React from 'react';
import { Header } from './Header';

// 頁首高度（對齊 SAKURA 官網固定 Header 的 60px）；App 內容頂端要留同高 spacer。
export const HEADER_H = 60;

/** 原生 RWD fixed 頁首；不再套用 1512px 畫布縮放。 */
export function StickyHeader() {
  return (
    <div className="fixed top-0 left-0 right-0 z-50">
      <Header />
    </div>
  );
}
