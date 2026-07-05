import React from 'react';
import { useSmoothScroll } from './useSmoothScroll';

/**
 * 掛在 ScaleToFit 外層：啟動全站平滑捲動阻尼（Lenis）。
 * 放在外層是為了讓 ScaleToFit 的 layout effect 先跑、頁面高度就緒後，
 * useSmoothScroll 內的 refresh/load 再校正 ScrollTrigger。
 */
export function ScrollMotionProvider({ children }: { children: React.ReactNode }) {
  useSmoothScroll();
  return <>{children}</>;
}
