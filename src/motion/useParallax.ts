import { useEffect, RefObject } from 'react';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { smoothScrollEnabled } from './prefersReducedMotion';

gsap.registerPlugin(ScrollTrigger);

type ParallaxOptions = {
  /** gsap.context 內的選擇器（相對 scopeRef 範圍），例如 '.project-parallax-img' */
  targets: string;
  /** 進場時的 yPercent 起點 */
  fromY: number;
  /** 離場時的 yPercent 終點 */
  toY: number;
  /** 底圖放大倍率，給位移留出血（避免露邊）。預設不縮放。 */
  scale?: number;
  /** ScrollTrigger scrub 阻尼，對齊模板 0.5 */
  scrub?: number;
};

/**
 * 對 scopeRef 內符合 targets 的元素掛「隨捲動位移」視差（GSAP ScrollTrigger，純 scrub、不 pin）。
 * 只寫內層元素的 transform；reduced-motion / ≤992px 時 no-op。
 */
export function useParallax(
  scopeRef: RefObject<HTMLElement>,
  { targets, fromY, toY, scale, scrub = 0.5 }: ParallaxOptions,
) {
  useEffect(() => {
    const scope = scopeRef.current;
    if (!scope || !smoothScrollEnabled()) return;

    const ctx = gsap.context(() => {
      if (scale) gsap.set(targets, { scale, transformOrigin: 'center center' });
      gsap.fromTo(
        targets,
        { yPercent: fromY },
        {
          yPercent: toY,
          ease: 'none',
          scrollTrigger: {
            trigger: scope,
            start: 'top bottom',
            end: 'bottom top',
            scrub,
          },
        },
      );
    }, scope);

    return () => ctx.revert();
  }, [scopeRef, targets, fromY, toY, scale, scrub]);
}
