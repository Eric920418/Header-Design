// 使用者是否在系統設定「減少動態」。三個動態功能(Lenis 阻尼、出場動畫、GSAP 視差)都要據此關閉。
export function prefersReducedMotion(): boolean {
  return (
    typeof window !== 'undefined' &&
    typeof window.matchMedia === 'function' &&
    window.matchMedia('(prefers-reduced-motion: reduce)').matches
  );
}

// 平滑捲動 / 視差只在桌面(>992px)啟用，對齊 Antra 模板行為。
export const SMOOTH_MIN_WIDTH = 992;

export function smoothScrollEnabled(): boolean {
  return (
    typeof window !== 'undefined' &&
    !prefersReducedMotion() &&
    window.innerWidth > SMOOTH_MIN_WIDTH
  );
}
