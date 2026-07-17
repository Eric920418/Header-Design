import React from 'react';
import { useSmoothScroll } from './useSmoothScroll';

/** 啟動全站平滑捲動阻尼（Lenis）。 */
export function ScrollMotionProvider({ children }: { children: React.ReactNode }) {
  useSmoothScroll();
  return <>{children}</>;
}
