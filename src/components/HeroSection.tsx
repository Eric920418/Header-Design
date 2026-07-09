import React, { useState, useEffect, useRef } from 'react';
import { ChevronRight } from 'lucide-react';
import { Reveal, useReveal } from '../motion/Reveal';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';
// 品牌金 = CIS 466c #C9AA79（單一來源）
import { GOLD } from '../theme/cis';

const KITCHEN_BG =
  'https://images.unsplash.com/photo-1556912173-3bb406ef7e77?auto=format&fit=crop&w=1920&h=1080&q=80';

// 單張停留時間（ms）＝底圖 Ken Burns 一輪時長；亦為自動輪播間隔。
const SLIDE_MS = 6000;

// 英雄輪播 3 張：底圖往左跑（hero-kenburns）＋內文逐張切換。
// ⚠ 底圖（Unsplash 外連，已實測可載入）與英文文案皆為 SAKURA 佔位，正式素材請替換 bg/eyebrow/title/subtitle。
const SLIDES: {
  bg: string;
  eyebrow: string;
  title: React.ReactNode;
  subtitle: string;
}[] = [
  {
    bg: KITCHEN_BG,
    eyebrow: 'Trusted Design Partner',
    // 金字重點跨行斷點（對位模板 Home Six 大標結構）
    title: (
      <>
        Find Your{' '}
        <span style={{ color: GOLD }}>
          Inspired
          <br />
          Interior
        </span>{' '}
        Design
      </>
    ),
    subtitle:
      'Transform your vision into reality with our innovative designs, creating modern spaces that blend functionality, aesthetics, and sustainability.',
  },
  {
    bg: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?auto=format&fit=crop&w=1920&h=1080&q=80',
    eyebrow: 'Bespoke Kitchen Craft',
    title: (
      <>
        Design That{' '}
        <span style={{ color: GOLD }}>
          Elevates
          <br />
          Your
        </span>{' '}
        Everyday
      </>
    ),
    subtitle:
      'Where thoughtful layouts meet premium materials — kitchens engineered around the way you cook, host, and truly live.',
  },
  {
    bg: 'https://images.unsplash.com/photo-1600489000022-c2086d79f9d4?auto=format&fit=crop&w=1920&h=1080&q=80',
    eyebrow: 'Crafted Since 1989',
    title: (
      <>
        Built For{' '}
        <span style={{ color: GOLD }}>
          Modern
          <br />
          Living
        </span>{' '}
        Spaces
      </>
    ),
    subtitle:
      'From first concept to final installation, we shape lasting beauty and function into every corner of your home.',
  },
];

// 品牌系列中文名（品牌系列 10 款中有中文的 8 款；Basic+ / AI kitchen 無中文故略）
const SERIES = ['巧域廚房', '潮派廚房', '童樂廚房', '君璽廚房', '臻美廚房', '大廚廚房', '鄉村廚房', '閣樂廚房'];

// 風格條 6 項：每項對應一個模板品牌 logo（Home Four 6 個 elementor-brand，依 Image #40 配對）；
// logo 在上、中文(粗)/英文在下；整條 marquee 輪播（同模板動態）。
const STYLE_TAGS = [
  { zh: '現代風', en: 'Modern', logo: '/brand-logos/5.svg' },        // ARCHITECT REAL ESTATE
  { zh: '輕奢風', en: 'Modern Luxury', logo: '/brand-logos/6.svg' }, // BUILDING CONSTRUCTION（圓）
  { zh: '北歐風', en: 'Scandinavian', logo: '/brand-logos/4.svg' },  // BUILDING CONSTRUCTION（2）
  { zh: '工業風', en: 'Industrial', logo: '/brand-logos/3.svg' },     // REAL ESTATE
  { zh: '美式風', en: 'American', logo: '/brand-logos/1.svg' },       // TREND INTERIORS
  { zh: '鄉村風', en: 'Country', logo: '/brand-logos/2.svg' },        // INTERIOR PREMIUM
];

function BrandTag({ zh, en, logo }: { zh: string; en: string; logo: string }) {
  return (
    <a href="#" title={zh} className="group shrink-0 flex items-center gap-4 px-14  border-[#E3DED7]">
      <img
        src={logo}
        alt=""
        className="h-[44px] w-auto opacity-70 group-hover:opacity-100 transition-opacity shrink-0"
      />
      <span className="leading-tight text-[#3E3A39] group-hover:text-[#C9AA79] transition-colors">
        <span className="block font-bold text-[15px]">{zh}</span>
        <span className="block text-[13px] tracking-wide">{en}</span>
      </span>
    </a>
  );
}

export function HeroSection() {
  // 左側品牌系列抽屜：展開時把內容/按鈕/浮水印一起右推，避免被蓋
  const [open, setOpen] = useState(false);

  // 容器級進場：整個英雄區（含底圖）fadeInDown 落下（對位模板 section ee91316：1.25s normal）。
  // 與內層 slideInLeft 巢狀複合，形成模板「邊落下邊左推」的斜向動態，而非單一由下往上。
  const heroRef = useReveal<HTMLElement>();
  // 左下圓鈕進場：fadeIn 延遲 900 slow（對位模板 Start Project heading）。
  const startBtnRef = useReveal<HTMLButtonElement>();

  // ── 英雄輪播狀態（底圖往左跑 + 內文逐張切換）──
  const [reduce] = useState(() => prefersReducedMotion()); // reduced-motion：靜態顯示第 0 張、不輪播、不 Ken Burns
  const [active, setActive] = useState(0);
  const pausedRef = useRef(false);                        // hover 英雄區暫停自動輪播
  const bgRefs = useRef<(HTMLImageElement | null)[]>([]); // 供 reflow 重啟 Ken Burns

  // 自動輪播：每 SLIDE_MS 前進一張；hover 暫停；reduced-motion 或單張時不啟動。
  useEffect(() => {
    if (reduce || SLIDES.length < 2) return;
    const id = setInterval(() => {
      if (!pausedRef.current) setActive((a) => (a + 1) % SLIDES.length);
    }, SLIDE_MS);
    return () => clearInterval(id);
  }, [reduce]);

  // 每次切到某張，對該圖重啟 Ken Burns：animation='none' → 讀 offsetWidth 強制回流 → 再設回。
  // 若不 reflow，輪回同一張時 inline animation 字串不變、React 不會重播（會停在放大終態）。
  useEffect(() => {
    if (reduce) return;
    const el = bgRefs.current[active];
    if (!el) return;
    el.style.animation = 'none';
    void el.offsetWidth;
    el.style.animation = `hero-kenburns ${SLIDE_MS}ms ease-out both`;
  }, [active, reduce]);

  return (
    <div className="relative z-10">
      {/* ──────────────────────────────────────────────
          主視覺 Hero — 依 Antra Home Six 實測「零誤差」對位（@1512）：
          section 958、內容左緣 30 / 上緣 244；eyebrow 15/ls1、大標 100/110 capitalize、
          副標 18/24/500；圓鈕 120 (L30/底82)、浮水印 320 (下方)。
          進場動畫比照模板 home-6；輪播（底圖往左跑 + 內文切換）為 SAKURA 加值（模板 hero 無輪播）。
      ────────────────────────────────────────────── */}
      <section
        ref={heroRef}
        data-ev="fadeInDown"
        className="ev relative w-full overflow-hidden"
        style={{ height: '958px' }}
        onMouseEnter={() => { pausedRef.current = true; }}
        onMouseLeave={() => { pausedRef.current = false; }}
      >
        {/* 背景輪播：多張底圖疊放，active 者 opacity 1（交叉淡入 1s）+ Ken Burns 往左跑；其餘 opacity 0 */}
        {SLIDES.map((s, i) => (
          <img
            key={i}
            ref={(el) => { bgRefs.current[i] = el; }}
            src={s.bg}
            alt={i === 0 ? 'SAKURA Kitchen' : ''}
            aria-hidden={i !== active}
            onError={(e) => {
              // 外連圖萬一失效 → 退回已知可用底圖，避免破圖
              if (e.currentTarget.src !== KITCHEN_BG) e.currentTarget.src = KITCHEN_BG;
            }}
            className="absolute inset-0 w-full h-full object-cover transition-opacity duration-1000 ease-out"
            style={{ opacity: i === active ? 1 : 0, willChange: 'transform, opacity' }}
          />
        ))}
        {/* 深色遮罩：左深右淺，確保左側文字可讀（Home Six 手法） */}
        <div
          className="absolute inset-0"
          style={{
            background:
              'linear-gradient(90deg, rgba(0,0,0,0.82) 0%, rgba(0,0,0,0.55) 50%, rgba(0,0,0,0.5) 100%)',
          }}
        />

        {/* 巨型浮水印（對位模板：下方、320px、低透明）；抽屜展開時往右推 */}
        <div
          className="absolute left-0 top-[725px] w-full overflow-hidden pointer-events-none select-none z-[1] transition-transform duration-500 ease-out"
          style={{ transform: open ? 'translateX(250px)' : 'translateX(0)' }}
        >
          {/* 浮水印進場：模板 fadeInUp、延遲 900、slow=2s（在抽屜 translateX 的內層，不衝突） */}
          <Reveal anim="fadeInUp" delayMs={900} speed="slow">
            {/* 依模板實測：金漸層(金頂→透明底) + background-clip:text + opacity 0.75 */}
            <span
              className="block whitespace-nowrap font-display font-normal leading-[0.75] pl-[426px]"
              style={{
                fontSize: '320px',
                opacity: 0.75,
                backgroundImage:
                  'linear-gradient(#C9AA79 14.9%, rgba(153,153,153,0) 80.95%)',
                WebkitBackgroundClip: 'text',
                backgroundClip: 'text',
                WebkitTextFillColor: 'transparent',
                color: 'transparent',
              }}
            >
              SAKURA
            </span>
          </Reveal>
        </div>

        {/* 內容層：絕對定位對齊模板（left 30 / top 244）；抽屜展開時整體右移 */}
        <div
          className="relative z-10 h-full px-6 lg:px-0 transition-transform duration-500 ease-out"
          style={{ transform: open ? 'translateX(200px)' : 'translateX(0)' }}
        >
          {/* 內容進場：模板 Home Six 標題區 slideInLeft（slow=2s，與容器 fadeInDown 巢狀複合）；在抽屜 translateX 的內層，不衝突 */}
          <Reveal anim="slideInLeft" speed="slow" className="lg:absolute lg:left-[30px] lg:top-[244px] flex flex-col justify-center h-full lg:h-auto lg:block">
            {/* 內文逐張切換：各張疊放，active 者 relative(定高)+滑入+淡入，其餘 absolute+左移+淡出（transition-all 700） */}
            <div className="relative">
              {SLIDES.map((s, i) => {
                const on = i === active;
                return (
                  <div
                    key={i}
                    aria-hidden={!on}
                    className={`transition-all duration-700 ease-out ${
                      on
                        ? 'relative opacity-100 translate-x-0'
                        : 'absolute inset-0 opacity-0 -translate-x-6 pointer-events-none'
                    }`}
                  >
                    {/* eyebrow（模板：膠囊外框 border rgba(114,114,114,.18) / radius 24 / padding 3·13·3·10；字 15/ls1/uppercase/白 + 金點） */}
                    <div className="mb-4 lg:mb-[33px]">
                      <span className="inline-flex items-center gap-2 rounded-[24px] border border-[rgba(114,114,114,0.18)] pt-[3px] pr-[13px] pb-[3px] pl-[10px]">
                        <span className="inline-block w-2 h-2 rounded-full shrink-0" style={{ background: GOLD }} />
                        <span className="font-display text-white text-[13px] lg:text-[15px] tracking-[1px] uppercase">
                          {s.eyebrow}
                        </span>
                      </span>
                    </div>

                    {/* 雙色大標（金字重點跨行斷點） */}
                    <h1 className="font-display text-white capitalize text-5xl lg:text-[100px] lg:leading-[110px]">
                      {s.title}
                    </h1>

                    {/* 副標（模板：18/24、字重 500、白、寬 522，距大標 30px） */}
                    <p className="mt-5 lg:mt-[30px] text-white text-sm lg:text-[18px] lg:leading-[24px] font-medium lg:w-[522px] leading-relaxed">
                      {s.subtitle}
                    </p>
                  </div>
                );
              })}
            </div>
          </Reveal>
        </div>

        {/* ── 左側「品牌系列」伸縮抽屜（桌面）── 不動 */}
        <div className="hidden lg:flex absolute left-0 top-[40%] -translate-y-1/2 z-30 items-stretch">
          {/* 抽屜面板：w-0 ↔ w-190 伸縮 */}
          <div
            className={`overflow-hidden transition-all duration-500 ease-out ${
              open ? 'w-[190px] opacity-70' : 'w-0 opacity-0'
            }`}
          >
            <div className="w-[190px] bg-[rgba(0,0,0,0.55)] backdrop-blur-md border-y border-white/10 py-3">
              <ul>
                {SERIES.map((name, i) => (
                  <li key={i}>
                    <a
                      href="#"
                      className="block pl-6 pr-4 py-2 text-base text-white border-l-2 border-transparent hover:border-[#C9AA79] hover:text-[#C9AA79] hover:bg-white/5 transition-colors whitespace-nowrap"
                    >
                      {name}
                    </a>
                  </li>
                ))}
              </ul>
            </div>
          </div>

          {/* 把手：點擊伸縮，隨抽屜滑出 */}
          <button
            onClick={() => setOpen((v) => !v)}
            aria-label={open ? '收合品牌系列選單' : '展開品牌系列選單'}
            className="self-center flex flex-col items-center justify-center gap-2 w-10 h-36 bg-[rgba(0,0,0,0.55)] backdrop-blur-md border border-white/10 rounded-r-2xl text-white/85 hover:text-[#C9AA79] transition-colors"
          >
            <ChevronRight className={`w-5 h-5 transition-transform ${open ? 'rotate-180' : ''}`} />
            <span className="writing-vertical text-base tracking-[0.3em]">品牌系列</span>
          </button>
        </div>

        {/* 左下圓形按鈕（對位模板 Home Six：120×120 / L30 / 底82 / 半透灰底 + 細白框）；抽屜展開時右移 */}
        <button
          ref={startBtnRef}
          data-ev="fadeIn"
          className="ev ev-slow hidden lg:flex absolute left-[30px] bottom-[82px] z-20 items-center justify-center rounded-full transition-transform duration-500 hover:scale-105"
          style={{
            width: '120px',
            height: '120px',
            background: 'rgba(92,92,92,0.46)',
            backdropFilter: 'blur(4px)',
            border: '1px solid rgba(255,255,255,0.07)',
            color: 'white',
            transform: open ? 'translateX(200px)' : 'translateX(0)',
            animationDelay: '900ms',
          }}
        >
          <span className="font-display text-[16px] leading-tight text-center">
            Start
            <br />
            Project
          </span>
        </button>

        {/* 輪播指示點（右下）：active 為金色長條、可點擊跳張 */}
        <div className="hidden lg:flex absolute right-[40px] bottom-[70px] z-20 items-center gap-2">
          {SLIDES.map((_, i) => (
            <button
              key={i}
              onClick={() => setActive(i)}
              aria-label={`切換到第 ${i + 1} 張主視覺`}
              aria-current={i === active}
              className="h-[6px] rounded-full transition-all duration-300"
              style={{
                width: i === active ? '30px' : '10px',
                background: i === active ? GOLD : 'rgba(255,255,255,0.45)',
              }}
            />
          ))}
        </div>
      </section>

      {/* ── 以下：品牌條與 Gallery，維持原樣不變 ── */}

      {/* 風格條：marquee 輪播（同模板 elementor-brand 動態）；內容重複兩組 -50% 無縫循環、hover 暫停 */}
      <div
        className="group/marquee overflow-hidden flex items-center py-4"
        style={{ minHeight: 'var(--hero-brand-h)', background: '#f6f6f6' }}
      >
        <div className="flex w-max items-center animate-marquee group-hover/marquee:[animation-play-state:paused]">
          {[...STYLE_TAGS, ...STYLE_TAGS].map((t, i) => (
            <BrandTag key={i} zh={t.zh} en={t.en} logo={t.logo} />
          ))}
        </div>
      </div>

      {/* Gallery 已移除：改由 App.tsx 的 ProjectSection（Home Six 專案輪播）取代 */}
    </div>
  );
}
