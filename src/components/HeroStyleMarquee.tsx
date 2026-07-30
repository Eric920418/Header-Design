import React, { useEffect, useRef, useState } from 'react';
import { createPortal } from 'react-dom';
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

const PREVIEW_IMAGES = [
  '/kitchen-styles/basic-plus.jpg',
  '/kitchen-styles/ai-kitchen.jpg',
  '/kitchen-styles/clever.jpg',
  '/kitchen-styles/loft-chic.jpg',
  '/kitchen-styles/joyful.jpg',
  '/kitchen-styles/premium.jpg',
  '/kitchen-styles/elegant.jpg',
  '/kitchen-styles/chef.jpg',
  '/kitchen-styles/country.jpg',
  '/kitchen-styles/harmony.jpg',
];

type PreviewState = {
  left: number;
  top: number;
  title: string;
};

function StyleItem({
  item,
  itemIndex,
  duplicate = false,
  onPreview,
  onPreviewEnd,
}: {
  item: (typeof STYLES)[number];
  itemIndex: number;
  duplicate?: boolean;
  onPreview: (anchor: HTMLAnchorElement, itemIndex: number, title: string) => void;
  onPreviewEnd: () => void;
}) {
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
        onClick={(event) => event.preventDefault()}
        onMouseEnter={(event) => onPreview(event.currentTarget, itemIndex, item.zh)}
        onMouseLeave={onPreviewEnd}
        onFocus={(event) => onPreview(event.currentTarget, itemIndex, item.zh)}
        onBlur={onPreviewEnd}
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
 * 尺寸與運動對應 Antra Home 4 `antra-brand`：62px、gap 120、loop、500ms step；
 * autoplay 依最新需求由 5s 加快為 4s。
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
  const [preview, setPreview] = useState<PreviewState | null>(null);
  const [previewImageIndex, setPreviewImageIndex] = useState(0);

  const showPreview = (anchor: HTMLAnchorElement, itemIndex: number, title: string) => {
    const rect = anchor.getBoundingClientRect();
    const halfWidth = 120;
    setPreviewImageIndex(itemIndex % PREVIEW_IMAGES.length);
    setPreview({
      left: Math.min(
        window.innerWidth - halfWidth - 12,
        Math.max(halfWidth + 12, rect.left + rect.width / 2),
      ),
      top: Math.max(12, rect.top - 166),
      title,
    });
  };

  useEffect(() => {
    if (!preview || prefersReducedMotion()) return;
    const timer = window.setInterval(() => {
      setPreviewImageIndex((current) => (current + 1) % PREVIEW_IMAGES.length);
    }, 1100);
    return () => window.clearInterval(timer);
  }, [preview]);

  useEffect(() => {
    if (!preview) return;
    const closePreview = () => setPreview(null);
    window.addEventListener('scroll', closePreview, true);
    window.addEventListener('resize', closePreview);
    return () => {
      window.removeEventListener('scroll', closePreview, true);
      window.removeEventListener('resize', closePreview);
    };
  }, [preview]);

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
          if (!pausedRef.current && !interactedRef.current) emblaApi.scrollPrev();
        }, 4000);

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
            STYLES.map((item, itemIndex) => (
              <StyleItem
                key={`${setIndex}-${item.en}`}
                item={item}
                itemIndex={itemIndex}
                duplicate={setIndex > 0}
                onPreview={showPreview}
                onPreviewEnd={() => setPreview(null)}
              />
            )),
          )}
        </div>
      </div>

      {preview && createPortal(
        <div
          aria-hidden="true"
          className="pointer-events-none fixed z-40 hidden w-[240px] overflow-hidden rounded-[14px] border border-white/30 bg-[#1C1C1D] p-1 shadow-[0_18px_45px_rgba(0,0,0,0.38)] md:block"
          style={{
            left: preview.left,
            top: preview.top,
            transform: 'translateX(-50%)',
          }}
        >
          <div className="h-[148px] overflow-hidden rounded-[10px]">
            <img
              key={PREVIEW_IMAGES[previewImageIndex]}
              src={PREVIEW_IMAGES[previewImageIndex]}
              alt={preview.title}
              className="style-preview-image h-full w-full object-cover"
            />
          </div>
        </div>,
        document.body,
      )}
    </section>
  );
}
