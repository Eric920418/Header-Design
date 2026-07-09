import React, { useEffect, useState } from 'react';
import { DESIGN_W } from './useCanvasScale';

/**
 * 「對位提示」HUD（僅開發模式）。
 * 全站是 1512px 畫布用 scale(innerWidth/1512) 縮放，**只有視窗＝1512 時才與模板 1:1 同尺寸**。
 * 此 HUD 即時顯示：目前視窗寬 / 縮放係數 / 是否落在 1512 對位點，方便和模板 demo 公平比對。
 * 釘在視窗右下、不被 ScaleToFit 縮放（native px）。按 G 顯示/隱藏。
 * 正式 build（import.meta.env.DEV=false）時整段被 tree-shake 掉、不會上線。
 */
export function ScaleHUD() {
  const [w, setW] = useState<number>(() => (typeof window !== 'undefined' ? window.innerWidth : DESIGN_W));
  const [show, setShow] = useState(true);

  useEffect(() => {
    const onResize = () => setW(window.innerWidth);
    const onKey = (e: KeyboardEvent) => {
      // 純按鍵 G（避免和輸入框/組合鍵衝突）
      if ((e.key === 'g' || e.key === 'G') && !e.metaKey && !e.ctrlKey && !e.altKey) {
        const tag = (e.target as HTMLElement)?.tagName;
        if (tag === 'INPUT' || tag === 'TEXTAREA') return;
        setShow((s) => !s);
      }
    };
    window.addEventListener('resize', onResize);
    window.addEventListener('keydown', onKey);
    return () => {
      window.removeEventListener('resize', onResize);
      window.removeEventListener('keydown', onKey);
    };
  }, []);

  if (!show) return null;

  const scale = w / DESIGN_W;
  const atBase = Math.abs(w - DESIGN_W) <= 2;
  const status = atBase
    ? '✓ 1:1 對位（＝模板同尺寸）'
    : scale > 1
      ? `↑ 放大 ${Math.round((scale - 1) * 100)}%（比模板大）`
      : `↓ 縮小 ${Math.round((1 - scale) * 100)}%（比模板小）`;

  return (
    <div
      style={{
        position: 'fixed',
        right: 12,
        bottom: 12,
        zIndex: 2147483647,
        font: '12px/1.5 ui-monospace, Menlo, monospace',
        background: atBase ? 'rgba(28,132,80,0.94)' : 'rgba(24,24,24,0.9)',
        color: '#fff',
        padding: '7px 11px',
        borderRadius: 9,
        pointerEvents: 'none',
        whiteSpace: 'nowrap',
        boxShadow: '0 6px 20px rgba(0,0,0,0.35)',
        letterSpacing: '0.2px',
      }}
    >
      基準 {DESIGN_W} · 視窗 <b>{w}px</b> · <b>{scale.toFixed(3)}×</b> · {status}
      {!atBase && (
        <span style={{ opacity: 0.7 }}>
          {'　'}模板 100px 標題 ≈ 你 {Math.round(100 * scale)}px
        </span>
      )}
      <span style={{ opacity: 0.5 }}>{'　'}[G 隱藏]</span>
    </div>
  );
}
