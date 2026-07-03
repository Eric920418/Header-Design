import React from 'react';
import { Check, ArrowRight, Play } from 'lucide-react';

// 品牌重點金（沿用原站色）
const GOLD = '#C4A574';

const ITEMS = ['Residence And Condo', 'Modern Kitchen Renovate', 'Interior House Decoration'];

// 16:9 影片區塊縮圖（poster）；待接真實影片 / YouTube 後替換
const VIDEO_POSTER =
  'https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?auto=format&fit=crop&w=1280&h=720&q=80';

export function WhatWeDoSection() {
  return (
    <section className="relative bg-white py-20 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 lg:px-12 flex flex-col lg:flex-row items-center gap-12 lg:gap-[56px]">
        {/* 左：文字 */}
        <div className="lg:w-[460px] lg:shrink-0">
          <span className="inline-flex items-center gap-2 rounded-full border border-gray-300 px-4 py-2 mb-6 text-[11px] tracking-[0.2em] uppercase text-[#1c1c1d]">
            <span
              className="inline-block w-1.5 h-1.5 rounded-full"
              style={{ background: GOLD }}
            />
            what we do
          </span>

          <h2 className="text-[#1c1c1d] font-bold leading-[1.12] text-4xl lg:text-[56px]">
            Antra<span style={{ color: GOLD }}>BrandPromise</span>{" "}
            Architectural Designs.
          </h2>

          {/* 打勾清單（含分隔線） */}
          <ul className="mt-9 border-t border-gray-200">
            {ITEMS.map((t, i) => (
              <li
                key={i}
                className="flex items-center gap-3 py-4 border-b border-gray-200 text-[#1c1c1d] font-medium"
              >
                <span
                  className="inline-flex items-center justify-center w-6 h-6 rounded-full shrink-0"
                  style={{ background: GOLD }}
                >
                  <Check className="w-3.5 h-3.5 text-white" strokeWidth={3} />
                </span>
                {t}
              </li>
            ))}
          </ul>

          <p className="text-gray-500 mt-7 max-w-md leading-relaxed">
            We specialize in transforming visions into reality. Explore our
            portfolio of innovative architectural and interior design projects
            crafted with precision.
          </p>

          <a
            href="#"
            className="group inline-flex items-center justify-between gap-4 mt-8 rounded-full border border-gray-300 pl-7 pr-1.5 py-1.5 text-[#1c1c1d] hover:border-[#C4A574] transition-colors"
          >
            <span className="text-sm tracking-wider">櫻花優勢</span>
            {/* 箭頭包成主色金圓底、白色箭頭（與產品區按鈕一致） */}
            <span className="inline-flex items-center justify-center w-10 h-10 rounded-full bg-[#C4A574] text-white transition-transform group-hover:translate-x-0.5">
              <ArrowRight className="w-5 h-5" />
            </span>
          </a>
        </div>

        {/* 右：16:9 影片區塊（縮圖 + 主色金播放鈕；待接真實影片） */}
        <div className="flex-1 w-full">
          <div className="relative aspect-video rounded-3xl overflow-hidden shadow-2xl bg-black">
            <img
              src={VIDEO_POSTER}
              alt=""
              className="absolute inset-0 w-full h-full object-cover"
            />
            <button
              type="button"
              aria-label="播放影片"
              className="group absolute inset-0 flex items-center justify-center"
            >
              <span
                className="flex items-center justify-center w-20 h-20 rounded-full text-white shadow-lg transition-transform group-hover:scale-105"
                style={{ background: GOLD }}
              >
                <Play className="w-7 h-7 translate-x-0.5" fill="currentColor" />
              </span>
            </button>
          </div>
        </div>
      </div>
    </section>
  );
}
