import React, { useEffect, useRef, useState } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import { useReveal } from '../motion/Reveal';
import { useParallax } from '../motion/useParallax';

// 10 種廚房風格（依對照表：英文標題 / 中文膠囊 / hover 描述；Basic+ 無中文）
const STYLES = [
  {
    en: "Basic+",
    zh: "Basic+",
    desc: "Basic+廚房系列 以生活的基本為出發",
    image: "/kitchen-styles/basic-plus.jpg",
  },
  {
    en: "AI Kitchen",
    zh: "AI廚房",
    desc: "突破未來格局 開啟廚房智高點",
    image: "/kitchen-styles/ai-kitchen.jpg",
  },
  {
    en: "Clever Kitchen",
    zh: "巧域廚房",
    desc: "極致收納 在廚房",
    image: "/kitchen-styles/clever.jpg",
  },
  {
    en: "Loft Chic Kitchen",
    zh: "潮派廚房",
    desc: "品味浪漫 在廚房",
    image: "/kitchen-styles/loft-chic.jpg",
  },
  {
    en: "Joyful Kitchen",
    zh: "童樂廚房",
    desc: "幸福享樂 在廚房",
    image: "/kitchen-styles/joyful.jpg",
  },
  {
    en: "Premium Kitchen",
    zh: "君璽廚房",
    desc: "成就不凡 在廚房",
    image: "/kitchen-styles/premium.jpg",
  },
  {
    en: "Elegant Kitchen",
    zh: "臻美廚房",
    desc: "臻萃美緻 在廚房",
    image: "/kitchen-styles/elegant.jpg",
  },
  {
    en: "Chef Kitchen",
    zh: "大廚廚房",
    desc: "心滿藝足 在廚房",
    image: "/kitchen-styles/chef.jpg",
  },
  {
    en: "Country Kitchen",
    zh: "鄉村廚房",
    desc: "鄉村慢活 在廚房",
    image: "/kitchen-styles/country.jpg",
  },
  {
    en: "Harmony Kitchen",
    zh: "閣樂廚房",
    desc: "天倫團聚 在廚房",
    image: "/kitchen-styles/harmony.jpg",
  },
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
    <section ref={sectionRef} data-ev="slideInUp" className="ev relative z-10 bg-[#f6f6f6]">
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

                {/* 左上膠囊：中文名（粗體；無中文則不顯示） */}
                {s.zh && (
                  <span className="absolute top-8 left-8 z-[2] inline-block rounded-full border border-white/50 text-white text-[16px] font-bold px-4 py-1.5 backdrop-blur-sm">
                    {s.zh}
                  </span>
                )}

                {/* 底部：英文大標（hover 轉金 #C9AA79）+ 描述（hover 由下淡入浮現） */}
                <div className="absolute inset-x-0 bottom-0 z-[2] px-8 pb-9">
                  <h3 className="text-white text-[36px] font-semibold leading-[44px] group-hover:text-[#C9AA79] transition-colors duration-300">
                    {s.en}
                  </h3>
                  {s.desc && (
                    <p className="text-white/90 text-[16px] leading-[24px] max-h-0 opacity-0 overflow-hidden group-hover:max-h-20 group-hover:opacity-100 group-hover:mt-2.5 transition-all duration-500 ease-out">
                      {s.desc}
                    </p>
                  )}
                </div>
              </article>
            </div>
          ))}
        </div>
      </div>

      {/* 左右兩側 prev/next 箭頭 — 依主題原始碼 antra swiper button（style.css 13949）：
          48×48 白圓 + 1px 邊框 + icon 24；hover 金底(#C9AA79)白箭頭。可點觸發 embla scrollPrev/Next。 */}
      <button
        onClick={() => emblaApi?.scrollPrev()}
        aria-label="上一個"
        className="absolute left-[30px] top-1/2 -translate-y-1/2 z-20 w-12 h-12 rounded-full border border-white/30 bg-white/10 backdrop-blur-md text-white flex items-center justify-center transition-colors duration-300 hover:bg-[#C9AA79] hover:border-[#C9AA79] hover:text-white"
      >
        <ArrowLeft className="w-6 h-6" />
      </button>
      <button
        onClick={() => emblaApi?.scrollNext()}
        aria-label="下一個"
        className="absolute right-[30px] top-1/2 -translate-y-1/2 z-20 w-12 h-12 rounded-full border border-white/30 bg-white/10 backdrop-blur-md text-white flex items-center justify-center transition-colors duration-300 hover:bg-[#C9AA79] hover:border-[#C9AA79] hover:text-white"
      >
        <ArrowRight className="w-6 h-6" />
      </button>
    </section>
  );
}
