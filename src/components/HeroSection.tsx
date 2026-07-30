import React, { useEffect, useState } from 'react';
import { ChevronRight, Circle } from 'lucide-react';
import { Reveal } from '../motion/Reveal';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';

const TEMPLATE_GOLD = '#CAA05C';
const HERO_SLIDES = [
  '/home-2026/hero/ai-kitchen.jpg',
  '/home-2026/hero/clever-kitchen.jpg',
  '/home-2026/hero/basic-plus.jpg',
];

// 使用者原有的自訂功能；疊在模板 Hero 上，不屬於模板外觀替換範圍。
const SERIES = ['巧域廚房', '潮派廚房', '童樂廚房', '君璽廚房', '臻美廚房', '大廚廚房', '鄉村廚房', '閣樂廚房'];

/** Antra Home 6 Hero（ee91316）＋既有品牌系列側抽屜。 */
export function HeroSection() {
  const [seriesOpen, setSeriesOpen] = useState(false);
  const [{ activeSlide, previousSlide }, setSlideState] = useState<{
    activeSlide: number;
    previousSlide: number | null;
  }>({ activeSlide: 0, previousSlide: null });
  const desktopShift = seriesOpen ? 'lg:translate-x-[200px]' : 'lg:translate-x-0';

  useEffect(() => {
    if (prefersReducedMotion()) return;
    const timer = window.setInterval(() => {
      setSlideState(({ activeSlide: current }) => ({
        activeSlide: (current + 1) % HERO_SLIDES.length,
        previousSlide: current,
      }));
    }, 5000);
    return () => window.clearInterval(timer);
  }, []);

  return (
    <section
      className="hero-template-section relative w-full overflow-hidden bg-[#9F9FA4]"
      aria-labelledby="hero-title"
    >
      {/* 保留三張圖的預載，不讓下一張進場時才開始下載。 */}
      <div className="hidden" aria-hidden="true">
        {HERO_SLIDES.map((image) => <img key={image} src={image} alt="" />)}
      </div>

      {/* Antra Page 1 Slider Revolution `slidingoverlaydown / double`：
          首次載入最底層是模板灰，後續換圖則保留上一張完整圖片；
          第一份新圖片帶暫時性深色遮罩先向下展開，
          第二份原色圖片延遲 333ms 再覆蓋，於總長 2000ms 完成。
          key 跟著 activeSlide 更新，首次載入與每次輪播換圖都會重播。 */}
      <div
        key={`hero-page1-slide-${activeSlide}`}
        aria-hidden="true"
        className="pointer-events-none absolute inset-0 overflow-hidden"
      >
        {previousSlide === null ? (
          <span className="absolute inset-0 bg-[#9F9FA4]" />
        ) : (
          <img
            src={HERO_SLIDES[previousSlide]}
            alt=""
            className="absolute inset-0 h-full w-full object-cover object-center"
          />
        )}

        <span className="hero-page1-image-layer hero-page1-image-layer-masked">
          <img
            src={HERO_SLIDES[activeSlide]}
            alt=""
            className="absolute inset-0 h-full w-full object-cover object-center"
          />
          <span className="absolute inset-0 bg-[rgba(16,8,1,0.46)]" />
        </span>

        <span className="hero-page1-image-layer hero-page1-image-layer-final">
          <img
            src={HERO_SLIDES[activeSlide]}
            alt=""
            className="absolute inset-0 h-full w-full object-cover object-center"
          />
        </span>
      </div>

      {/* 只壓暗 Hero 下半部，增加 Kitchen 浮水印對比；
          位於圖片轉場之上、所有文字與互動內容之下。 */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute inset-x-0 bottom-0 z-[3] h-[58%]"
        style={{
          background: 'linear-gradient(180deg, rgba(0,0,0,0) 0%, rgba(0,0,0,0.42) 42%, rgba(0,0,0,0.86) 100%)',
        }}
      />

      {/* Elementor 原生五段 RWD：上層內容使用 1584px 置中版心。 */}
      <div
        className={`hero-template-top z-10 transition-transform duration-500 ${desktopShift}`}
      >
        <Reveal anim="slideInLeft" speed="slow">
          <div className="hero-template-eyebrow-row mb-[20px] flex justify-center">
            <span className="inline-flex h-[30px] items-center gap-[10px] rounded-[24px] border border-[rgba(159,159,164,0.18)] py-[3px] pl-[10px] pr-[13px] font-display text-[12px] font-normal uppercase leading-[22px] tracking-[1px] text-white">
              <Circle
                aria-hidden="true"
                className="h-[5px] w-[5px] shrink-0 fill-current stroke-0"
                style={{ color: TEMPLATE_GOLD }}
              />
              Trusted Design Partner
            </span>
          </div>

          <h1
            id="hero-title"
            className="hero-template-title m-0 font-display font-normal capitalize tracking-[-1px] text-white"
          >
            Find Your <span style={{ color: TEMPLATE_GOLD }}>Inspired</span>
            <br />
            <span style={{ color: TEMPLATE_GOLD }}>Kitchen</span> Design
          </h1>

          <p className="hero-template-description mt-[30px] font-sans text-[18px] font-medium leading-[24px] text-white">
            Transform your vision into reality with our innovative designs, creating modern spaces that blend functionality, aesthetics, and sustainability.
          </p>
        </Reveal>
      </div>

      <div
        aria-hidden="true"
        className="hero-template-divider absolute inset-x-0 z-10 h-px bg-white/25"
      />

      <div
        className={`hero-template-bottom z-20 transition-transform duration-500 ${desktopShift}`}
      >
        <div className="hero-template-cta h-[120px] w-[120px] shrink-0">
          <Reveal
            anim="fadeIn"
            delayMs={900}
            speed="slow"
            className="h-full w-full rounded-[200px] backdrop-blur-[58px]"
          >
            <a
              href="#"
              className="hero-start-project flex h-full w-full items-center justify-center rounded-[100px] border border-[#FFFFFF12] bg-[#5C5C5C75] text-center font-display text-[18px] font-normal leading-[24px] text-white transition-colors duration-300 hover:text-[#CAA05C] focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-white"
            >
              <span className="relative z-[1]">
                Start
                <br />
                Project
              </span>
            </a>
          </Reveal>
        </div>

        <div className="hero-template-watermark-slot pointer-events-none">
          <div className="hero-template-watermark select-none whitespace-nowrap text-right font-display font-normal opacity-[0.64]">
            <Reveal anim="fadeInUp" delayMs={900} speed="slow">
              <span
                aria-hidden="true"
                className="block"
                style={{
                  backgroundImage: 'linear-gradient(180deg, #CAA05C 14.9%, rgba(159,159,164,0) 80.95%)',
                  WebkitBackgroundClip: 'text',
                  backgroundClip: 'text',
                  WebkitTextFillColor: 'transparent',
                  color: 'transparent',
                }}
              >
                Kitchen
              </span>
            </Reveal>
          </div>
        </div>
      </div>

      {/* 既有桌面品牌系列側抽屜：改為 viewport fixed，捲離 Hero 後仍固定在左側中線。
          面板與把手維持頂端對齊；展開時把手向右移 190px、繼續貼住面板右緣。 */}
      <div className="fixed left-0 top-1/2 z-40 hidden -translate-y-1/2 lg:block">
        <div className="relative">
          {/* 面板：absolute 不撐高容器；寬 0↔190 滑出，頂端對齊把手鈕、向下展開 */}
          <div
            className={`absolute left-0 top-0 overflow-hidden transition-all duration-500 ease-out ${
              seriesOpen ? 'w-[190px] opacity-70' : 'w-0 opacity-0'
            }`}
          >
            <div className="w-[190px] border-y border-white/10 bg-[rgba(0,0,0,0.55)] py-3 backdrop-blur-md">
              <ul>
                {SERIES.map((name) => (
                  <li key={name}>
                    <a
                      href="#"
                      className="block whitespace-nowrap border-l-2 border-transparent py-2 pl-6 pr-4 text-base text-white transition-colors hover:border-[#CAA05C] hover:bg-white/5 hover:text-[#CAA05C]"
                    >
                      {name}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* 把手鈕：展開時向右滑出面板寬度（190px），露出面板、鈕貼面板右緣 */}
          <button
            type="button"
            onClick={() => setSeriesOpen((value) => !value)}
            aria-expanded={seriesOpen}
            aria-label={seriesOpen ? '收合品牌系列選單' : '展開品牌系列選單'}
            className={`flex h-36 w-10 flex-col items-center justify-center gap-2 rounded-r-2xl border border-white/10 bg-[rgba(0,0,0,0.55)] text-white/85 backdrop-blur-md transition-all duration-500 ease-out hover:text-[#CAA05C] ${
              seriesOpen ? 'translate-x-[190px]' : 'translate-x-0'
            }`}
          >
            <ChevronRight className={`h-5 w-5 transition-transform ${seriesOpen ? 'rotate-180' : ''}`} />
            <span className="writing-vertical text-base tracking-[0.3em]">品牌系列</span>
          </button>
        </div>
      </div>
    </section>
  );
}
