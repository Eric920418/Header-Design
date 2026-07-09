import React, { useEffect, useRef } from 'react';
import { prefersReducedMotion } from './prefersReducedMotion';

// 進場一次的 IntersectionObserver 設定：捲進視窗 12% 即觸發，觸發後即停止觀察（不重播）。
const IO_OPTIONS: IntersectionObserverInit = {
  threshold: 0.12,
  rootMargin: '0px 0px -8% 0px',
};

/**
 * 對既有元素（例如 <section> 根，不方便再加包裹層）掛出場動畫。
 * 用法：const ref = useReveal<HTMLElement>(); <section ref={ref} className="reveal" />
 * reduced-motion 時直接顯示、不建立 observer。
 */
export function useReveal<T extends HTMLElement>() {
  const ref = useRef<T>(null);
  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    if (prefersReducedMotion()) {
      el.classList.add('is-visible');
      return;
    }
    const io = new IntersectionObserver((entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          io.unobserve(entry.target);
        }
      }
    }, IO_OPTIONS);
    io.observe(el);
    return () => io.disconnect();
  }, []);
  return ref;
}

/** 模板進場動畫名（對應 globals.css 的 @keyframes；slideIn/fadeIn = Elementor 核心 100% 位移，opal = 主題 100px 版備用） */
export type EvName =
  | 'slideInUp' | 'slideInDown' | 'slideInLeft' | 'slideInRight'
  | 'fadeIn' | 'fadeInUp' | 'fadeInDown'
  | 'opalMoveUp' | 'opalMoveDown' | 'opalMoveLeft' | 'opalMoveRight' | 'opalScaleUp';

type RevealProps = {
  as?: keyof JSX.IntrinsicElements;
  className?: string;
  /** 模板進場動畫名（預設 opalMoveUp = 淡入上升 100px） */
  anim?: EvName;
  /** stagger 延遲（毫秒），對應模板 animation_delay */
  delayMs?: number;
  /** 速度檔（對應 Elementor animation_duration）：normal=1.25s、slow=2s、fast=0.75s */
  speed?: 'normal' | 'slow' | 'fast';
  children: React.ReactNode;
};

/**
 * 出場動畫包裹元件（完全比照 Antra 模板）。預設 <div>，可用 as 指定標籤。
 * anim 決定方向（slideInLeft/Right/Up/Down、fadeIn*、opal*），delayMs 決定 stagger。
 * 鐵則：不要包在會被 Embla / animate-gallery-card / hover-scale / GSAP 視差 佔用 transform 的元素上。
 */
export function Reveal({ as = 'div', className = '', anim = 'opalMoveUp', delayMs = 0, speed = 'normal', children }: RevealProps) {
  const ref = useReveal<HTMLElement>();
  const speedCls = speed === 'slow' ? 'ev-slow' : speed === 'fast' ? 'ev-fast' : '';
  const cls = ['ev', speedCls, className].filter(Boolean).join(' ');
  return React.createElement(
    as,
    {
      ref,
      className: cls,
      'data-ev': anim,
      style: delayMs ? { animationDelay: `${delayMs}ms` } : undefined,
    },
    children
  );
}
