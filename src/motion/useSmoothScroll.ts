import { useEffect } from 'react';
import Lenis from 'lenis';
import gsap from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { smoothScrollEnabled } from './prefersReducedMotion';

gsap.registerPlugin(ScrollTrigger);

/**
 * 全站平滑捲動阻尼（Lenis），對映 Antra 模板 config（duration 1.5 + expo ease-out）。
 * 用「原生捲動」模式：Lenis 平滑 window 捲動、不設 wrapper/content transform，
 * 不破壞 Header 與 FloatingButtons 的 fixed 定位。
 * 只在桌面(>992px)且非 reduced-motion 啟用；跨 992px / 偏好變更時自動啟停。
 */
export function useSmoothScroll() {
  useEffect(() => {
    let lenis: Lenis | null = null;
    let ro: ResizeObserver | null = null;
    let rafTicker: ((time: number) => void) | null = null;
    let loadHandler: (() => void) | null = null;
    let refreshTimer: number | undefined;

    const start = () => {
      if (lenis) return;
      lenis = new Lenis({
        duration: 1.5,
        easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
        orientation: 'vertical',
        gestureOrientation: 'vertical',
        smoothWheel: true,
        syncTouch: false, // 觸控維持原生（對映模板 smoothTouch:false）
        touchMultiplier: 2,
        wheelMultiplier: 1,
        infinite: false,
      });

      // GSAP 與 Lenis 共用單一 rAF，並讓 ScrollTrigger 隨 Lenis 捲動更新
      lenis.on('scroll', ScrollTrigger.update);
      rafTicker = (time: number) => lenis!.raf(time * 1000);
      gsap.ticker.add(rafTicker);
      gsap.ticker.lagSmoothing(0);

      // 內容高度變動（圖片載入 / 輪播 / 抽屜）不是 window resize，需自行重新量測捲動範圍
      const refresh = () => {
        window.clearTimeout(refreshTimer);
        refreshTimer = window.setTimeout(() => {
          lenis?.resize();
          ScrollTrigger.refresh();
        }, 150);
      };
      ro = new ResizeObserver(refresh);
      ro.observe(document.body);
      loadHandler = refresh;
      window.addEventListener('load', loadHandler);
    };

    const stop = () => {
      if (rafTicker) {
        gsap.ticker.remove(rafTicker);
        rafTicker = null;
      }
      if (loadHandler) {
        window.removeEventListener('load', loadHandler);
        loadHandler = null;
      }
      ro?.disconnect();
      ro = null;
      window.clearTimeout(refreshTimer);
      lenis?.destroy();
      lenis = null;
      gsap.ticker.lagSmoothing(1000, 16); // 還原 GSAP 預設
    };

    const sync = () => (smoothScrollEnabled() ? start() : stop());
    sync();
    window.addEventListener('resize', sync);
    const mq = window.matchMedia('(prefers-reduced-motion: reduce)');
    mq.addEventListener?.('change', sync);

    return () => {
      window.removeEventListener('resize', sync);
      mq.removeEventListener?.('change', sync);
      stop();
    };
  }, []);
}
