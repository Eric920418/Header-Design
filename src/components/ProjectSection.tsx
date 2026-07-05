import React, { useEffect, useRef, useState } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { useReveal } from '../motion/Reveal';
import { useParallax } from '../motion/useParallax';

// 10 種廚房風格（英中雙標 + 本地圖；Basic+ / AI kitchen 僅英文）
const STYLES = [
  { en: 'Basic+', zh: '', image: '/kitchen-styles/basic-plus.jpg' },
  { en: 'AI kitchen', zh: '', image: '/kitchen-styles/ai-kitchen.jpg' },
  { en: 'Clever', zh: '巧域廚房', image: '/kitchen-styles/clever.jpg' },
  { en: 'Loft Chic', zh: '潮派廚房', image: '/kitchen-styles/loft-chic.jpg' },
  { en: 'Joyful', zh: '童樂廚房', image: '/kitchen-styles/joyful.jpg' },
  { en: 'premium', zh: '君璽廚房', image: '/kitchen-styles/premium.jpg' },
  { en: 'Elegant', zh: '臻美廚房', image: '/kitchen-styles/elegant.jpg' },
  { en: 'Chef', zh: '大廚廚房', image: '/kitchen-styles/chef.jpg' },
  { en: 'Country', zh: '鄉村廚房', image: '/kitchen-styles/country.jpg' },
  { en: 'Harmony', zh: '閣樂廚房', image: '/kitchen-styles/harmony.jpg' },
];

export function ProjectSection() {
  const [emblaRef, emblaApi] = useEmblaCarousel({
    loop: true,
    align: 'start',
    dragFree: true,
  });
  // 拖曳中暫停 hover 變寬（否則卡片一碰就展開、拖曳會被打斷）
  const [dragging, setDragging] = useState(false);
  const pausedRef = useRef(false);

  // section 進場淡入上升 + 每張圖隨捲動視差（皆不碰 Embla 的軌道 transform）
  const sectionRef = useReveal<HTMLElement>();
  useParallax(sectionRef, { targets: '.project-parallax-img', fromY: -8, toY: 8, scale: 1.08 });

  useEffect(() => {
    if (!emblaApi) return;
    const onDown = () => setDragging(true);
    const onUp = () => setDragging(false);
    emblaApi.on('pointerDown', onDown);
    emblaApi.on('pointerUp', onUp);

    // 自動輪播（每 3.5s 前進一張；滑鼠移入暫停）
    const root = emblaApi.rootNode();
    const tick = () => {
      if (!pausedRef.current) emblaApi.scrollNext();
    };
    let timer = setInterval(tick, 3500);
    const pause = () => (pausedRef.current = true);
    const resume = () => (pausedRef.current = false);
    root.addEventListener('mouseenter', pause);
    root.addEventListener('mouseleave', resume);

    return () => {
      clearInterval(timer);
      emblaApi.off('pointerDown', onDown);
      emblaApi.off('pointerUp', onUp);
      root.removeEventListener('mouseenter', pause);
      root.removeEventListener('mouseleave', resume);
    };
  }, [emblaApi]);

  return (
    <section ref={sectionRef} className="reveal relative z-10 bg-[#f6f6f6]">
      <div className="overflow-hidden cursor-grab active:cursor-grabbing" ref={emblaRef}>
        <div className="flex">
          {STYLES.map((s, i) => (
            <div
              key={i}
              className={`group shrink-0 transition-[width] duration-500 ease-out
                w-[280px] md:w-[340px] lg:w-[378px]
                ${dragging ? '' : 'hover:w-[420px] md:hover:w-[510px] lg:hover:w-[567px]'}`}
            >
              {/* 固定高度、hover 變寬（伸縮）+ 底部漸層 + 左上膠囊 + 英中標 */}
              <article className="relative overflow-hidden w-full h-[480px] md:h-[640px] lg:h-[880px]">
                <img
                  src={s.image}
                  alt={s.zh ? `${s.en} ${s.zh}` : s.en}
                  draggable={false}
                  className="project-parallax-img absolute inset-0 w-full h-full object-cover object-center"
                />

                {/* 底部黑色漸層 scrim */}
                <div
                  className="absolute inset-x-0 bottom-0 h-2/5 z-[1] pointer-events-none"
                  style={{
                    background:
                      'linear-gradient(rgba(0,0,0,0) 0%, rgba(0,0,0,0.64) 30%, rgba(0,0,0,1) 100%)',
                  }}
                />

                {/* 左上膠囊：中文名（無中文則不顯示） */}
                {s.zh && (
                  <span className="absolute top-8 left-8 z-[2] inline-block rounded-full border border-white/50 text-white text-[16px] px-4 py-1.5 backdrop-blur-sm">
                    {s.zh}
                  </span>
                )}

                {/* 底部：英文大標 + 中文 */}
                <div className="absolute inset-x-0 bottom-0 z-[2] px-8 pb-9">
                  <h3 className="text-white text-[36px] font-semibold leading-[44px] group-hover:text-[#C4A574] transition-colors">
                    {s.en}
                  </h3>
                  {s.zh && (
                    <p className="text-white/85 text-[20px] leading-[30px] mt-1.5">{s.zh}</p>
                  )}
                </div>
              </article>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
