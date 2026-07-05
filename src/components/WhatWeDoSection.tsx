import React, { useRef } from 'react';
import { Check, ArrowRight, Play } from 'lucide-react';
import { Reveal } from '../motion/Reveal';
import { useParallax } from '../motion/useParallax';

// 品牌重點金（沿用原站色）
const GOLD = '#C4A574';

const ITEMS = ['Residence And Condo', 'Modern Kitchen Renovate', 'Interior House Decoration'];

// 16:9 影片區塊縮圖（poster）；待接真實影片 / YouTube 後替換
const VIDEO_POSTER =
  'https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?auto=format&fit=crop&w=1280&h=720&q=80';

// 壓底圖：影片區下方的淡色建築線稿/藍圖背景（仿 Home One 模板；佔位圖，可替換為正式線稿）
const BLUEPRINT =
  'https://images.unsplash.com/photo-1503387762-592deb58ef4e?auto=format&fit=crop&w=1200&q=80';

export function WhatWeDoSection() {
  const sectionRef = useRef<HTMLElement>(null);
  // 裝飾藍圖隨捲動輕微位移（GSAP scrub 視差）
  useParallax(sectionRef, { targets: '.wwd-blueprint', fromY: -6, toY: 6 });
  return (
    // 間距依模板實測（Home 6 兩欄區）：py 120、欄距 90、文欄 600
    <section ref={sectionRef} className="relative bg-white py-[120px] overflow-hidden">
      <div className="max-w-[1410px] mx-auto flex flex-col lg:flex-row items-center gap-[90px]">
        {/* 左：文字（整欄淡入上升，內部清單再逐項 stagger — 仿 Elementor 巢狀進場） */}
        <Reveal className="lg:w-[600px] lg:shrink-0">
          <span className="inline-flex items-center gap-2 rounded-full border border-gray-300 px-4 py-2 mb-5 text-[15px] tracking-[1px] uppercase text-[#1c1c1d]">
            <span
              className="inline-block w-1.5 h-1.5 rounded-full"
              style={{ background: GOLD }}
            />
            what we do
          </span>

          <h2 className="text-[#1c1c1d] font-bold text-[60px] leading-[64px]">
            Antra Has{" "}
            <span style={{ color: GOLD }}>
              Brand
              <br />
              Promise
            </span>
            <br />
            Architectural
          </h2>

          {/* 打勾清單（含分隔線） */}
          <ul className="mt-9 border-t border-gray-200">
            {ITEMS.map((t, i) => (
              <Reveal
                as="li"
                key={i}
                inner
                delay={(i + 1) as 1 | 2 | 3}
                className="flex items-center gap-3 py-4 border-b border-gray-200 text-[#1c1c1d] text-[18px] leading-[24px] font-medium"
              >
                <span
                  className="inline-flex items-center justify-center w-6 h-6 rounded-full shrink-0"
                  style={{ background: GOLD }}
                >
                  <Check className="w-3.5 h-3.5 text-white" strokeWidth={3} />
                </span>
                {t}
              </Reveal>
            ))}
          </ul>

          <p className="text-gray-500 mt-7 max-w-md text-[16px] leading-[24px]">
            We specialize in transforming visions into reality. Explore our
            portfolio of innovative architectural and interior design projects
            crafted with precision.
          </p>

          {/* CTA：依模板改為外框圓箭頭，hover 填金 + 箭頭右移 */}
          <a
            href="#"
            className="group inline-flex items-center justify-between gap-4 mt-8 rounded-full border border-gray-300 pl-[30px] pr-[9px] py-[8px] text-[#1c1c1d] hover:border-[#C4A574] transition-colors"
          >
            <span className="text-[19px]">櫻花優勢</span>
            <span className="inline-flex items-center justify-center w-[47px] h-[47px] rounded-full border border-gray-300 text-[#1c1c1d] transition-all duration-300 group-hover:bg-[#C4A574] group-hover:border-[#C4A574] group-hover:text-white">
              <ArrowRight className="w-5 h-5 transition-transform duration-300 group-hover:translate-x-0.5" />
            </span>
          </a>
        </Reveal>

        {/* 右：16:9 影片區塊（整塊淡入上升；影片卡自有 hover:scale，故 Reveal 掛在外層不搶 transform） */}
        <Reveal className="relative flex-1 w-full">
         
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
              <span
                className="relative flex items-center justify-center w-20 h-20 rounded-full text-white shadow-lg transition-transform duration-300 group-hover:scale-110"
                style={{ background: GOLD }}
              >
                {/* 脈動光圈（icon 動畫） */}
                <span
                  className="absolute inset-0 rounded-full animate-ping opacity-30"
                  style={{ background: GOLD }}
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
