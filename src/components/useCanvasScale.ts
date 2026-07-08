import { useLayoutEffect, useRef } from 'react';

// 設計基準寬：整站以此寬度當「畫布」，等比縮放填滿視窗寬（單一來源；ScaleToFit / StickyHeader / FloatingButtons 共用）
export const DESIGN_W = 1512;

/**
 * 回傳一個 ref，掛上後該元素會隨視窗寬 `transform: scale(innerWidth/1512)`（指定 transform-origin）。
 * 供畫布外、需自行補回等比縮放的 fixed 層使用（StickyHeader、FloatingButtons）。
 * ScaleToFit 另有同步高度的邏輯，故只共用 DESIGN_W、不用此 hook。
 */
export function useCanvasScale<T extends HTMLElement>(origin: string) {
  const ref = useRef<T>(null);
  useLayoutEffect(() => {
    const el = ref.current;
    if (!el) return;
    el.style.transformOrigin = origin;
    const apply = () => {
      el.style.transform = `scale(${window.innerWidth / DESIGN_W})`;
    };
    window.addEventListener('resize', apply);
    apply();
    return () => window.removeEventListener('resize', apply);
  }, [origin]);
  return ref;
}
