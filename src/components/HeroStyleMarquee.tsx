import React, { useEffect, useRef } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';

const STYLES = [
  { zh: '現代風', en: 'Modern', logo: '/brand-logos/5.svg' },
  { zh: '輕奢風', en: 'Modern Luxury', logo: '/brand-logos/6.svg' },
  { zh: '北歐風', en: 'Scandinavian', logo: '/brand-logos/4.svg' },
  { zh: '工業風', en: 'Industrial', logo: '/brand-logos/3.svg' },
  { zh: '美式風', en: 'American', logo: '/brand-logos/1.svg' },
  { zh: '鄉村風', en: 'Country', logo: '/brand-logos/2.svg' },
];

function StyleItem({ item, duplicate = false }: { item: (typeof STYLES)[number]; duplicate?: boolean }) {
  return (
    <div
      role="group"
      aria-roledescription="slide"
      aria-hidden={duplicate || undefined}
      className="brand-carousel-slide group/item mr-[120px] flex h-[62px] min-w-0 shrink-0 items-center justify-center overflow-visible"
    >
      <a
        href="#"
        title={item.zh}
        tabIndex={duplicate ? -1 : undefined}
        className="flex h-[62px] shrink-0 items-center justify-center gap-4 p-[2px]"
      >
        <img
          src={item.logo}
          alt=""
          draggable={false}
          className="h-[58px] w-auto shrink-0 transition-[filter,opacity] duration-300 group-hover/brands:opacity-50 group-hover/brands:grayscale group-hover/item:!opacity-100 group-hover/item:!grayscale-0"
        />
        <span className="shrink-0 leading-tight text-[#59585D] transition-colors duration-300 group-hover/item:text-[#CAA05C]">
          <span className="block text-[15px] font-bold">{item.zh}</span>
          <span className="block text-[13px] tracking-wide">{item.en}</span>
        </span>
      </a>
    </div>
  );
}

/**
 * Hero 下方風格品牌輪播。
 * 尺寸與運動對應 Antra Home 4 `antra-brand`：62px、gap 120、loop、500ms step、5s autoplay。
 */
export function HeroStyleMarquee() {
  const [emblaRef, emblaApi] = useEmblaCarousel({
    loop: true,
    align: 'start',
    duration: 25,
    skipSnaps: false,
  });
  const pausedRef = useRef(false);
  const interactedRef = useRef(false);

  useEffect(() => {
    if (!emblaApi) return;

    const root = emblaApi.rootNode();
    const pause = () => { pausedRef.current = true; };
    const resume = () => { pausedRef.current = false; };
    const stopAfterInteraction = () => { interactedRef.current = true; };

    root.addEventListener('mouseenter', pause);
    root.addEventListener('mouseleave', resume);
    emblaApi.on('pointerDown', stopAfterInteraction);

    const timer = prefersReducedMotion()
      ? undefined
      : window.setInterval(() => {
          if (!pausedRef.current && !interactedRef.current) emblaApi.scrollNext();
        }, 5000);

    return () => {
      if (timer) window.clearInterval(timer);
      root.removeEventListener('mouseenter', pause);
      root.removeEventListener('mouseleave', resume);
      emblaApi.off('pointerDown', stopAfterInteraction);
    };
  }, [emblaApi]);

  return (
    <section
      aria-label="廚房風格"
      aria-roledescription="carousel"
      className="group/brands overflow-hidden bg-[#f6f6f6] px-[15px] py-3 md:px-[30px] md:py-4"
    >
      <div ref={emblaRef} className="h-[62px] overflow-hidden">
        <div className="flex h-[62px] touch-pan-y">
          {[0, 1, 2].flatMap((setIndex) =>
            STYLES.map((item) => (
              <StyleItem
                key={`${setIndex}-${item.en}`}
                item={item}
                duplicate={setIndex > 0}
              />
            )),
          )}
        </div>
      </div>
    </section>
  );
}
