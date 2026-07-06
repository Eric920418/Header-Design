import React, { useState } from 'react';
import { ChevronRight } from 'lucide-react';

const KITCHEN_BG =
  'https://images.unsplash.com/photo-1556912173-3bb406ef7e77?auto=format&fit=crop&w=1920&h=1080&q=80';

// 品牌金 = CIS 466c #C9AA79（單一來源）
import { GOLD } from '../theme/cis';

// 品牌系列中文名（品牌系列 10 款中有中文的 8 款；Basic+ / AI kitchen 無中文故略）
const SERIES = ['巧域廚房', '潮派廚房', '童樂廚房', '君璽廚房', '臻美廚房', '大廚廚房', '鄉村廚房', '閣樂廚房'];

// 佔位品牌 logo（inline SVG：線條 icon + 品牌名，灰階、hover 轉金）
// 待正式 logo 檔提供後，把 <svg> 內容替換為真實 logo 即可。
function BrandLogo({ name }: { name: string }) {
  return (
    <a
      href="#"
      title={name}
      className="shrink-0 text-gray-400 hover:text-[#C9AA79] transition-colors"
    >
      <svg
        viewBox="0 0 150 40"
        className="h-8 lg:h-9 w-auto"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <rect x="1" y="7" width="26" height="26" rx="5" stroke="currentColor" strokeWidth="1.6" />
        <path
          d="M7 27l7-11 6 11"
          stroke="currentColor"
          strokeWidth="1.6"
          strokeLinecap="round"
          strokeLinejoin="round"
        />
        <text
          x="38"
          y="27"
          fill="currentColor"
          style={{ fontFamily: 'inherit', fontSize: 17, fontWeight: 600, letterSpacing: 1 }}
        >
          {name}
        </text>
      </svg>
    </a>
  );
}

export function HeroSection() {
  const brands = ['現代風', '輕奢風', '北歐風', '工業風', '美式風', '鄉村風'];
  // 左側品牌系列抽屜：展開時把內容/按鈕/浮水印一起右推，避免被蓋
  const [open, setOpen] = useState(false);

  return (
    <div className="relative z-10">
      {/* ──────────────────────────────────────────────
          主視覺 Hero — 採 Home Six 版型（滿版深色大圖 + 左對齊雙色大標題）
          色系字型沿用原站；文案皆為佔位，待正式文案替換。
          高度沿用 var(--hero-h)，維持下方 Gallery 絕對定位不受影響。
      ────────────────────────────────────────────── */}
      <section
        className="relative w-full overflow-hidden"
        style={{ height: '850px' }}
      >
        {/* 背景大圖 */}
        <img
          src={KITCHEN_BG}
          alt="SAKURA Kitchen"
          className="absolute inset-0 w-full h-full object-cover"
        />
        {/* 深色遮罩：左深右淺，確保左側文字可讀（Home Six 手法） */}
        <div
          className="absolute inset-0"
          style={{
            background:
              'linear-gradient(90deg, rgba(0,0,0,0.82) 0%, rgba(0,0,0,0.55) 50%, rgba(0,0,0,0.5) 100%)',
          }}
        />

        {/* 底部浮水印大字（裝飾層，佔位）；抽屜展開時往右推、避免被蓋 */}
        <div className="absolute bottom-0 left-0 w-full overflow-hidden pointer-events-none select-none z-[1]">
          <span
            className="block whitespace-nowrap font-bold leading-none transition-transform duration-500 ease-out"
            style={{
              color: 'rgba(201,170,121,0.14)',
              fontSize: 'clamp(72px, 17vw, 240px)',
              transform: open ? 'translateX(250px) translateY(24%)' : 'translateX(0) translateY(24%)',
            }}
          >
            SAKURA KITCHEN
          </span>
        </div>

        {/* 內容層：左對齊、垂直置中；抽屜展開時整體右移、避免被蓋 */}
        <div
          className="relative z-10 h-full flex flex-col justify-center px-6 lg:pl-[100px] lg:pr-[60px] transition-transform duration-500 ease-out"
          style={{ transform: open ? 'translateX(200px)' : 'translateX(0)' }}
        >
          {/* eyebrow */}
          <div className="flex items-center gap-2.5 mb-4 lg:mb-6">
            <span
              className="inline-block w-2 h-2 rounded-full shrink-0"
              style={{ background: GOLD }}
            />
            <span className="text-white/85 text-[11px] lg:text-xs tracking-[0.25em] uppercase">
              Welcome to SAKURA Kitchen
            </span>
          </div>

          {/* 雙色大標題（佔位） */}
          <h1 className="text-white font-bold leading-[1.05] text-4xl md:text-6xl lg:text-7xl">
            We Shape
            <br />
            <span style={{ color: GOLD }}>Inspiring Spaces</span>
          </h1>

          {/* 副標（佔位） */}
          <p className="mt-5 lg:mt-7 text-white/70 text-sm lg:text-base max-w-md leading-relaxed">
            We transform your vision into reality — thoughtfully designed, beautifully
            crafted spaces built for the way you live.
          </p>
        </div>

        {/* ── 左側「品牌系列」伸縮抽屜（桌面）── */}
        <div className="hidden lg:flex absolute left-0 top-1/2 -translate-y-1/2 z-30 items-stretch">
          {/* 抽屜面板：w-0 ↔ w-190 伸縮 */}
          <div
            className={`overflow-hidden transition-all duration-500 ease-out ${
              open ? 'w-[190px] opacity-100' : 'w-0 opacity-0'
            }`}
          >
            <div className="w-[190px] bg-[rgba(0,0,0,0.55)] backdrop-blur-md border-y border-white/10 py-3">
              <ul>
                {SERIES.map((name, i) => (
                  <li key={i}>
                    <a
                      href="#"
                      className="block pl-6 pr-4 py-2 text-sm text-white/85 border-l-2 border-transparent hover:border-[#C9AA79] hover:text-[#C9AA79] hover:bg-white/5 transition-colors whitespace-nowrap"
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
            <span className="writing-vertical text-[11px] tracking-[0.3em]">品牌系列</span>
          </button>
        </div>

        {/* 左下圓形按鈕（佔位，桌面版）；抽屜展開時同步右移 */}
        <button
          className="hidden lg:flex absolute left-[100px] bottom-10 z-20 items-center justify-center rounded-full transition-transform duration-500 hover:scale-105"
          style={{
            width: '120px',
            height: '120px',
            background: 'rgba(0,0,0,0.55)',
            backdropFilter: 'blur(4px)',
            border: '1px solid rgba(255,255,255,0.18)',
            color: 'white',
            transform: open ? 'translateX(200px)' : 'translateX(0)',
          }}
        >
          <span className="text-sm leading-tight text-center">
            Discover
            <br />
            More
          </span>
        </button>
      </section>

      {/* ── 以下：品牌條與 Gallery，維持原樣不變 ── */}

      {/* 品牌 Logo 條 — 採 Home Four 版型：淺色背景 + 灰階 SVG logo 列（logo 為佔位，待正式檔替換） */}
      <div
        className="flex flex-wrap items-center justify-around gap-x-6 gap-y-4 px-8 py-3 lg:py-0"
        style={{ minHeight: 'var(--hero-brand-h)', background: '#f6f6f6' }}
      >
        {brands.map((brand, i) => (
          <BrandLogo key={i} name={brand} />
        ))}
      </div>

      {/* Gallery 已移除：改由 App.tsx 的 ProjectSection（Home Six 專案輪播）取代 */}
    </div>
  );
}
