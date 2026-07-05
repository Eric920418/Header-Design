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

type RevealProps = {
  as?: keyof JSX.IntrinsicElements;
  className?: string;
  /** stagger 序位：0 無延遲、1/2/3 對應 .reveal-delay-N */
  delay?: 0 | 1 | 2 | 3;
  /** 內部小元素用較小位移：套 .reveal-inner */
  inner?: boolean;
  children: React.ReactNode;
};

/**
 * 出場動畫包裹元件（淡入 + 上升）。預設 <div>，可用 as 指定標籤。
 * 鐵則：不要包在會被 Embla / animate-gallery-card / hover-scale 佔用 transform 的元素上。
 */
export function Reveal({ as = 'div', className = '', delay = 0, inner = false, children }: RevealProps) {
  const ref = useReveal<HTMLElement>();
  const cls = [
    'reveal',
    inner ? 'reveal-inner' : '',
    delay ? `reveal-delay-${delay}` : '',
    className,
  ]
    .filter(Boolean)
    .join(' ');
  return React.createElement(as, { ref, className: cls }, children);
}
