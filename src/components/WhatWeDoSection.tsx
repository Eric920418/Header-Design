import React, { useRef } from 'react';
import { Check, ArrowRight } from 'lucide-react';
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
    // Home 6 原始 Section：desktop 120/30/115、tablet-extra 100/30、tablet 80/30、mobile 60/15。
    <section
      ref={sectionRef}
      className="relative overflow-hidden bg-white px-[15px] py-[60px] md:px-[30px] md:py-[80px] lg:py-[100px] antra:pb-[115px] antra:pt-[120px]"
    >
      {/* 背景右下半透明建築圖 = 模板 f0420ee 的 h6-bg-3.png（原尺寸 821×520；bg-position 100% 100% / no-repeat）。
          PNG 本身半透明，opacity 用 1（同模板 layer opacity）；掛 .wwd-blueprint 讓既有 useParallax 做輕微視差。 */}
      <img
        src={BLUEPRINT}
        alt=""
        aria-hidden
        className="wwd-blueprint pointer-events-none select-none absolute bottom-0 right-0 z-0 w-[821px] max-w-none"
      />
      <div className="relative z-10 mx-auto grid max-w-[1410px] grid-cols-1 items-center gap-[30px] lg:grid-cols-[51fr_49.5fr] antra:gap-[90px]">
        {/* 左：文字（整欄淡入上升，內部清單再逐項 stagger — 仿 Elementor 巢狀進場） */}
        <Reveal anim="slideInLeft" className="min-w-0">
          {/* Elementor 的 heading widget：subtitle 與 title 是同一組，整組下方 margin 40。 */}
          <div className="mb-[40px] text-center lg:text-left">
            <span className="mb-[20px] inline-flex items-center gap-[6px] rounded-[24px] border border-[rgba(114,114,114,0.18)] pb-[3px] pl-[10px] pr-[13px] pt-[3px] font-display text-[12px] uppercase leading-[22px] tracking-[1px] text-[#1C1C1D]">
              <span
                className="inline-block h-[6px] w-[6px] rounded-full"
                style={{ background: GOLD }}
              />
              What we do
            </span>

            {/* Home Six 逐字；不手動斷行，由模板的 670px heading 寬度自然換行。 */}
            <h2 className="mx-auto max-w-[670px] font-display text-[30px] capitalize leading-[35px] text-[#1C1C1D] sm:text-[45px] sm:leading-[50px] lg:mx-0 lg:text-[60px] lg:leading-[64px]">
              SAKURA has <span style={{ color: GOLD }}>created exceptional</span>{' '}
              architectural designs.
            </h2>
          </div>

          {/* 打勾清單（含分隔線） */}
          <ul className="border-t border-[#E3E3E8]">
            {ITEMS.map((t, i) => (
              <li
                key={i}
                className="flex items-center gap-[7px] border-b border-[#E3E3E8] py-[16px] font-display text-[18px] font-normal leading-[24px] text-[#1C1C1D]"
              >
                {/* 打勾：照模板為純金 check icon（~19px、無圓底） */}
                <Check className="w-[19px] h-[19px] shrink-0" strokeWidth={3} style={{ color: GOLD }} />
                {t}
              </li>
            ))}
          </ul>

          <p className="mx-auto mb-[30px] mt-[30px] max-w-[645px] text-center text-[16px] leading-[24px] text-[#59585D] lg:mx-0 lg:mb-[50px] lg:mt-[29px] lg:text-left">
            We specialize in transforming visions into reality. Explore our
            portfolio of innovative architectural and interior design projects
            crafted with precision.
          </p>

          {/* CTA — 依主題原始碼 elementor-button-default（=antra 標準款，elementor.css 9147）：
              透明底、border 1px rgba(159,159,164,.64)、字 15、金圓 40 箭頭預設 -45°；
              hover 整顆填模板金 + 字白 + 箭頭轉正 rotate(0)；中文內容保留「櫻花優勢」。 */}
          <a
            href="#"
            className="group mx-auto inline-flex w-fit items-center gap-[8px] rounded-full border border-[rgba(159,159,164,0.64)] py-[9px] pl-[30px] pr-[9px] text-[#1C1C1D] transition-colors duration-500 hover:border-[#CAA05C] hover:bg-[#CAA05C] hover:text-white lg:mx-0"
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
        <Reveal anim="slideInRight" delayMs={300} className="relative min-w-0 w-full">
         
          {/* 影片卡：hover 依比例微放大 */}
          <div className="group relative aspect-video rounded-3xl overflow-hidden shadow-2xl bg-black transition-transform duration-500 hover:scale-[1.02]">
            <img
              src={VIDEO_POSTER}
              alt=""
              className="absolute inset-0 w-full h-full object-cover"
            />
            <div className="absolute inset-0 flex items-center justify-center">
              {/* Home 6 widget 63f4833：原生玻璃膠囊、29px blur、lexus-scale 雷達圈與 play-fill 字型圖示。 */}
              <button
                type="button"
                aria-label="播放影片"
                className="antra-template-video-popup"
              >
                <span className="antra-template-video-icon" aria-hidden="true" />
              </button>
            </div>
          </div>
        </Reveal>
      </div>
    </section>
  );
}
