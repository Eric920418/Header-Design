import React, { useLayoutEffect, useRef } from 'react';
import { DESIGN_W } from './useCanvasScale';

/**
 * 全站等比例縮放外殼（Scale-to-Fit）。
 * 把固定 1512px 寬的畫布用 transform: scale(視窗寬 / 1512) 等比縮放，
 * 大螢幕放大填滿、小螢幕整體縮小塞進畫面——版面永不重排、永不橫向爆版。
 * transform 不改 layout box，故用 ResizeObserver 把外層高度同步為「畫布自然高 × scale」，
 * 否則底部會留下未縮放高度的空白。
 */
export function ScaleToFit({ children }: { children: React.ReactNode }) {
  const outerRef = useRef<HTMLDivElement>(null);
  const canvasRef = useRef<HTMLDivElement>(null);

  useLayoutEffect(() => {
    const outer = outerRef.current;
    const canvas = canvasRef.current;
    if (!outer || !canvas) return;

    const apply = () => {
      const scale = window.innerWidth / DESIGN_W;
      canvas.style.transform = `scale(${scale})`;
      // offsetHeight = 未被 transform 影響的自然高度
      outer.style.height = `${canvas.offsetHeight * scale}px`;
    };

    // 內容高度變化（圖片載入、輪播、抽屜/選單…）時重新同步高度
    const ro = new ResizeObserver(apply);
    ro.observe(canvas);
    window.addEventListener('resize', apply);
    apply();

    return () => {
      ro.disconnect();
      window.removeEventListener('resize', apply);
    };
  }, []);

  return (
    <div ref={outerRef} style={{ position: 'relative', width: '100%', overflow: 'hidden' }}>
      <div
        ref={canvasRef}
        style={{
          width: DESIGN_W,
          transformOrigin: 'top left',
          position: 'absolute',
          top: 0,
          left: 0,
        }}
      >
        {children}
      </div>
    </div>
  );
}
