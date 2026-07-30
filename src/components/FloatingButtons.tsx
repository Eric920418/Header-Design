import React, { useEffect, useRef } from 'react';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';

// 視覺尺寸依 SAKURA 官網 quick links 實測還原；連結、文字與既有三項功能維持本站版本。
const TOP = {
  href: 'https://www.sakura-kitchenlife.com.tw/franchising/intro',
  icon: '/floating-icons/case.png',
  label: '案例門市',
};

const GROUP = [
  { href: 'https://www.sakura-kitchenlife.com.tw/measuring', icon: '/floating-icons/measure.png', label: '到府丈量' },
  { href: 'https://icare.sakura.com.tw', icon: '/floating-icons/service.png', label: '客服中心', external: true },
];

function ButtonContent({ icon, label }: { icon: string; label: string }) {
  return (
    <span className="flex h-14 w-14 flex-col items-center justify-center gap-[2px] sm:h-[58px] sm:w-[58px]">
      <img src={icon} alt="" className="h-[34px] w-auto shrink-0 object-contain" />
      <span className="whitespace-nowrap text-center text-[13px] leading-[16px] text-white">{label}</span>
    </span>
  );
}

export function FloatingButtons() {
  const railRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const rail = railRef.current;
    if (!rail) return;

    let frame = 0;

    const updatePosition = () => {
      frame = 0;

      if (prefersReducedMotion()) {
        rail.style.transform = 'translate3d(0, 0, 0)';
        return;
      }

      const page = document.documentElement;
      const maxScroll = Math.max(1, page.scrollHeight - window.innerHeight);
      const progress = Math.min(1, Math.max(0, window.scrollY / maxScroll));
      const bottom = Number.parseFloat(window.getComputedStyle(rail).bottom) || 0;
      const restingTop = window.innerHeight - bottom - rail.offsetHeight;
      const safeTop = 112; // 60px fixed Header + 52px breathing room.
      const maximumLift = Math.max(0, restingTop - safeTop);
      const lift = maximumLift * progress;

      rail.style.transform = `translate3d(0, -${lift.toFixed(2)}px, 0)`;
    };

    const requestUpdate = () => {
      if (frame) return;
      frame = window.requestAnimationFrame(updatePosition);
    };

    const resizeObserver = new ResizeObserver(requestUpdate);
    resizeObserver.observe(rail);
    window.addEventListener('scroll', requestUpdate, { passive: true });
    window.addEventListener('resize', requestUpdate);
    requestUpdate();

    return () => {
      if (frame) window.cancelAnimationFrame(frame);
      resizeObserver.disconnect();
      window.removeEventListener('scroll', requestUpdate);
      window.removeEventListener('resize', requestUpdate);
    };
  }, []);

  return (
    <div
      ref={railRef}
      className="pointer-events-none fixed right-0 bottom-[70px] z-20 will-change-transform sm:bottom-9"
    >
      <div className="pointer-events-auto">
        <a href={TOP.href} aria-label={TOP.label} className="mb-5 block bg-[#B79258] p-2">
          <ButtonContent icon={TOP.icon} label={TOP.label} />
        </a>

        <div className="bg-[#737373]">
          {GROUP.map((button, index) => (
            <React.Fragment key={button.href}>
              {index > 0 && <div aria-hidden="true" className="h-px w-full bg-white/50" />}
              <a
                href={button.href}
                aria-label={button.label}
                {...(button.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
                className="block p-2"
              >
                <ButtonContent icon={button.icon} label={button.label} />
              </a>
            </React.Fragment>
          ))}
        </div>
      </div>
    </div>
  );
}
