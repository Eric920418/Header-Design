import React, { useRef } from 'react';
import { Check, ArrowRight, Play } from 'lucide-react';
import { Reveal } from '../motion/Reveal';
import { useParallax } from '../motion/useParallax';

// 全區顏色使用 Antra 模板色盤（單一來源）。
import { GOLD } from '../theme/cis';

const ITEMS = ['Residence And Condo', 'Modern Kitchen Renovate', 'Interior House Decoration'];

// 16:9 影片區塊縮圖（poster）；待接真實影片 / YouTube 後替換
const VIDEO_POSTER =
  'https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?auto=format&fit=crop&w=1280&h=720&q=80';

// 背景右下裝飾圖 = 模板 Home Six 的 h6-bg-3.png（下載至 public/decor；PNG 本身半透明，故不再壓 opacity）
const BLUEPRINT = '/decor/h6-bg-3.png';

export function WhatWeDoSection() {
  const sectionRef = useRef<HTMLElement>(null);
  // 裝飾藍圖隨捲動輕微位移（GSAP scrub 視差）
  useParallax(sectionRef, { targets: '.wwd-blueprint', fromY: -6, toY: 6 });
  return (
    // 間距依模板實測（Home 6 兩欄區）：py 120、欄距 90、文欄 600
    <section ref={sectionRef} className="relative bg-white py-[120px] overflow-hidden">
      {/* 背景右下半透明建築圖 = 模板 f0420ee 的 h6-bg-3.png（原尺寸 821×520；bg-position 100% 100% / no-repeat）。
          PNG 本身半透明，opacity 用 1（同模板 layer opacity）；掛 .wwd-blueprint 讓既有 useParallax 做輕微視差。 */}
      <img
        src={BLUEPRINT}
        alt=""
        aria-hidden
        className="wwd-blueprint pointer-events-none select-none absolute bottom-0 right-0 z-0 w-[600px] max-w-[48%]"
      />
      <div className="relative z-10 max-w-[1410px] mx-auto flex flex-col lg:flex-row items-center gap-[90px]">
        {/* 左：文字（整欄淡入上升，內部清單再逐項 stagger — 仿 Elementor 巢狀進場） */}
        <Reveal anim="slideInLeft" className="lg:w-[600px] lg:shrink-0">
          {/* 副標膠囊：模板 lighter 色透明邊框、radius 24、padding 3/13/3/10。 */}
          <span className="font-display inline-flex items-center gap-2 rounded-[24px] border border-[rgba(159,159,164,0.18)] pt-[3px] pr-[13px] pb-[3px] pl-[10px] mb-5 text-[15px] tracking-[1px] uppercase text-[#1C1C1D]">
            <span
              className="inline-block w-2 h-2 rounded-full"
              style={{ background: GOLD }}
            />
            What we do
          </span>

          {/* 模板 Home Six 逐字：SAKURA has [created exceptional] architectural designs.（Antra→SAKURA；金字重點 created exceptional） */}
          <h2 className="font-display text-[#1C1C1D] text-[60px] leading-[64px] capitalize">
            SAKURA has
            <br />
            <span style={{ color: GOLD }}>created exceptional</span>
            <br />
            architectural designs.
          </h2>

          {/* 打勾清單（含分隔線） */}
          <ul className="mt-9 border-t border-[#E3E3E8]">
            {ITEMS.map((t, i) => (
              <li
                key={i}
                className="flex items-center gap-3 py-4 border-b border-[#E3E3E8] text-[#1C1C1D] text-[18px] leading-[24px] font-normal"
              >
                {/* 打勾：照模板為純金 check icon（~19px、無圓底） */}
                <Check className="w-[19px] h-[19px] shrink-0" strokeWidth={3} style={{ color: GOLD }} />
                {t}
              </li>
            ))}
          </ul>

          <p className="text-[#59585D] mt-7 max-w-md text-[16px] leading-[24px]">
            We specialize in transforming visions into reality. Explore our
            portfolio of innovative architectural and interior design projects
            crafted with precision.
          </p>

          {/* CTA — 依主題原始碼 elementor-button-default（=antra 標準款，elementor.css 9147）：
              透明底、border 1px rgba(159,159,164,.64)、字 15、金圓 40 箭頭預設 -45°；
              hover 整顆填模板金 + 字白 + 箭頭轉正 rotate(0)。文字保留「櫻花優勢」。 */}
          <a
            href="#"
            className="group inline-flex items-center gap-4 mt-8 rounded-full border border-[rgba(159,159,164,0.64)] pl-[30px] pr-[7px] py-[7px] text-[#1C1C1D] transition-colors duration-500 hover:border-[#CAA05C] hover:bg-[#CAA05C] hover:text-white"
          >
            <span className="text-[15px]">櫻花優勢</span>
            <span
              className="inline-flex items-center justify-center w-[40px] h-[40px] rounded-full text-white transition-transform duration-500 -rotate-45 group-hover:rotate-0"
              style={{ background: GOLD }}
            >
              <ArrowRight className="w-5 h-5" />
            </span>
          </a>
        </Reveal>

        {/* 右：16:9 影片區塊（整塊淡入上升；影片卡自有 hover:scale，故 Reveal 掛在外層不搶 transform） */}
        <Reveal anim="slideInRight" delayMs={300} className="relative flex-1 w-full">
         
          {/* 影片卡：hover 依比例微放大 */}
          <div className="group relative aspect-video rounded-3xl overflow-hidden shadow-2xl bg-black transition-transform duration-500 hover:scale-[1.02]">
            <img
              src={VIDEO_POSTER}
              alt=""
              className="absolute inset-0 w-full h-full object-cover"
            />
            <button
              type="button"
              aria-label="播放影片"
              className="absolute inset-0 flex items-center justify-center"
            >
              {/* 依模板 .elementor-video-popup：半透明白圓 rgba(255,255,255,0.36) + 白播放三角（非金） */}
              <span
                className="relative flex items-center justify-center w-20 h-20 rounded-full text-white shadow-lg backdrop-blur-sm transition-transform duration-300 group-hover:scale-110"
                style={{ background: 'rgba(255,255,255,0.36)' }}
              >
                {/* 脈動光圈（icon 動畫）— 同白色 */}
                <span
                  className="absolute inset-0 rounded-full animate-ping opacity-30"
                  style={{ background: 'rgba(255,255,255,0.36)' }}
                  aria-hidden
                />
                <Play className="relative w-7 h-7 translate-x-0.5" fill="currentColor" />
              </span>
            </button>
          </div>
        </Reveal>
      </div>
    </section>
  );
}
