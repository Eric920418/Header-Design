import React, { useEffect, useState } from 'react';
import { ChevronRight, Circle } from 'lucide-react';
import { Reveal, useReveal } from '../motion/Reveal';
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
  const [activeSlide, setActiveSlide] = useState(0);
  const heroRef = useReveal<HTMLElement>();
  const desktopShift = seriesOpen ? 'lg:translate-x-[200px]' : 'lg:translate-x-0';

  useEffect(() => {
    if (prefersReducedMotion()) return;
    const timer = window.setInterval(() => {
      setActiveSlide((current) => (current + 1) % HERO_SLIDES.length);
    }, 5000);
    return () => window.clearInterval(timer);
  }, []);

  return (
    <section
      ref={heroRef}
      data-ev="fadeInDown"
      className="ev relative h-[587px] w-full overflow-hidden bg-black md:h-[489px] lg:h-[719px] antra:h-[952px]"
      aria-labelledby="hero-title"
    >
      {HERO_SLIDES.map((image, index) => (
        <img
          key={image}
          src={image}
          alt=""
          aria-hidden="true"
          className={`absolute inset-0 h-full w-full object-cover object-center transition-opacity duration-1000 ${
            index === activeSlide ? 'opacity-100' : 'opacity-0'
          }`}
        />
      ))}

      {/* 模板原生斷點：390 / 768 / 1024 置中，1200px 起回到桌面左對齊。 */}
      <div
        className={`absolute left-[15px] right-[15px] top-[80px] z-10 text-center transition-transform duration-500 md:left-[30px] md:right-[30px] md:top-[100px] antra:right-auto antra:top-[244px] antra:w-[850px] antra:text-left ${desktopShift}`}
      >
        <Reveal anim="slideInLeft" speed="slow">
          <div className="mb-[20px] flex justify-center antra:justify-start">
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
            className="m-0 w-full font-display text-[30px] font-normal capitalize leading-[35px] tracking-[-1px] text-white md:text-[50px] md:leading-[60px] lg:text-[100px] lg:leading-[110px] antra:w-[850px]"
          >
            Find Your <span style={{ color: TEMPLATE_GOLD }}>Inspired</span>
            <br />
            <span style={{ color: TEMPLATE_GOLD }}>Kitchen</span> Design
          </h1>

          <p className="mx-auto mt-[30px] w-full font-sans text-[18px] font-medium leading-[24px] text-white antra:mx-0 antra:w-[522px]">
            Transform your vision into reality with our innovative designs, creating modern spaces that blend functionality, aesthetics, and sustainability.
          </p>
        </Reveal>
      </div>

      <div
        aria-hidden="true"
        className="absolute inset-x-0 top-[356px] h-px bg-white/25 md:top-[318px] lg:top-[478px] antra:top-[691px]"
      />

      <div
        className={`absolute left-1/2 top-[387px] z-20 h-[120px] w-[120px] -translate-x-1/2 transition-transform duration-500 md:left-[30px] md:top-[349px] md:translate-x-0 lg:top-[539px] antra:top-[750px] ${desktopShift}`}
      >
        <Reveal
          anim="fadeIn"
          delayMs={900}
          speed="slow"
          className="h-full w-full rounded-[100px] border border-[rgba(255,255,255,0.07)] bg-[rgba(89,88,93,0.46)] backdrop-blur-[58px]"
        >
          <a
            href="#"
            className="flex h-full w-full items-center justify-center rounded-[100px] text-center font-display text-[18px] font-normal leading-[24px] text-white transition-colors duration-300 hover:text-[#CAA05C] focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-white"
          >
            Start
            <br />
            Project
          </a>
        </Reveal>
      </div>

      <div
        className={`pointer-events-none absolute right-[14px] top-[507px] z-10 select-none whitespace-nowrap text-right font-display text-[90px] font-normal leading-[120px] opacity-[0.64] transition-transform duration-500 md:right-[29px] md:top-[349px] md:text-[150px] lg:top-[539px] lg:text-[200px] lg:leading-[155px] antra:right-[4.83vw] antra:top-[719px] antra:text-[320px] antra:leading-[240px] ${desktopShift}`}
      >
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

      {/* 既有桌面品牌系列側抽屜：功能保留，關閉時不影響模板基準外觀。
          把手鈕垂直中心固定在 top-[15%]（容器改 block、高度=按鈕高，-translate-y-1/2 只吃按鈕高，不被面板撐高）；
          面板改 absolute top-0 與把手鈕「頂端對齊、向下展開」——不再置中撐高容器，避免展開時面板頂被 hero 上緣切掉。 */}
      <div className="absolute left-0 top-[15%] z-30 hidden -translate-y-1/2 lg:block">
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
