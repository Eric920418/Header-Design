import React from 'react';
import { Check, ArrowUpRight } from 'lucide-react';
import { MarqueeBand } from './MarqueeBand';
import { Reveal } from '../motion/Reveal';

import { GOLD } from '../theme/cis'; // 品牌金 = CIS 466c #C9AA79（單一來源）

// SAKURA 廚電（深色卡）的三個產品線
const SAKURA_ITEMS = ['廚房商品', '淨水器', '熱水器'];

// SVAGO / TEKA（白卡 + 產品圖；圖源 影像/廚房產品 → public/products/*.jpg，描述為佔位）
// logoH：各品牌 SVG 內部留白不同（svago 貼字無留白、teka 內含留白），故用各自高度讓「可見字形」視覺一致；
// logo 置於固定 48px 高的列並垂直置中（見卡片），故高度差不影響描述/圖片對齊。
const BRANDS = [
  { name: 'SVAGO', logo: '/brand-logos/svago.svg', logoH: 38, desc: '義式精品家電，為居家注入質感與品味。', image: '/products/svago.jpg' },
  { name: 'TEKA', logo: '/brand-logos/teka.svg', logoH: 48, desc: '德國進口廚電，專業級的料理表現。', image: '/products/teka.jpg' },
];

export function PricingSection() {
  return (
    <section className="relative bg-[#f6f6f6] pt-[125px] overflow-hidden">
      <div className="max-w-[1410px] mx-auto">
        {/* 標題列（座標依模板實測，相對 1410 版心）：十字裝飾線 + eyebrow(左,top46) + 大標(left424） */}
        <Reveal anim="slideInUp" className="relative mb-[60px]">
          {/* 十字裝飾線（桌面，模板實測照抄）：橫線 y16 寬502、直線 x363 上臂54/下臂125、兩端箭頭 15px；線與箭頭同色 #e3e3e8 */}
          <div
            aria-hidden
            className="hidden lg:block absolute left-[-13px] top-[16px] w-[502px] h-px bg-[#e3e3e8]"
          />
          <div
            aria-hidden
            className="hidden lg:block absolute left-[363px] top-[-38px] h-[179px] w-px bg-[#e3e3e8]"
          />
          <svg
            aria-hidden
            className="hidden lg:block absolute left-[474px] top-0 text-[#e3e3e8]"
            width="15"
            height="15"
            viewBox="0 0 15 15"
          >
            <path d="M15 15L3 11L0 11L12 15L15 15Z" fill="currentColor" />
          </svg>
          <svg
            aria-hidden
            className="hidden lg:block absolute left-[347px] top-[126px] text-[#e3e3e8]"
            width="15"
            height="15"
            viewBox="0 0 15 15"
          >
            <path d="M15 15L11 3L11 0L15 12L15 15Z" fill="currentColor" />
          </svg>

          <div className="flex items-start pt-[46px]">
            <div className="w-[424px] shrink-0">
              <span className="inline-flex items-center gap-1.5 rounded-[24px] border border-[rgba(114,114,114,0.18)] pt-[7px] pr-[13px] pb-[6px] pl-[9px] text-[12px] tracking-[1px] uppercase text-[#000000]">
                <span
                  className="inline-block w-1.5 h-1.5 rounded-full"
                  style={{ background: GOLD }}
                />
                our pricing plans
              </span>
            </div>
            <h2 className="w-[661px] text-[60px] font-bold leading-[64px] capitalize text-[#000000]">
              Design your <span style={{ color: GOLD }}>space,</span>
              <br />
              <span style={{ color: GOLD }}>know</span> the cost
            </h2>
          </div>
        </Reveal>

        {/* 三欄：SAKURA 廚電（深色圖卡）+ SVAGO / TEKA（白卡 + 產品圖）；高度維持 min-h-[673px] */}
        <div className="grid grid-cols-3 gap-[30px] items-stretch">
          {/* 欄1：SAKURA 廚電 — 深色圖卡 + 三產品線金勾（stagger 首張，無延遲） */}
          <Reveal
            anim="slideInUp"
            className="relative rounded-3xl overflow-hidden min-h-[771px]"
          >
            <img
              src="/products/sakura.jpg"
              alt="SAKURA 廚電"
              className="absolute inset-0 w-full h-full object-cover"
            />
            <div
              className="absolute inset-0"
              style={{
                background:
                  "linear-gradient(180deg, rgba(0,0,0,0.8) 0%, rgba(0,0,0,0.35) 45%, rgba(0,0,0,0.5) 100%)",
              }}
            />
            <div className="relative z-10 p-8 lg:p-10 flex flex-col h-full">
              {/* 品牌 logo（替代文字標題）：SAKURA KITCHEN 官方白色字標，深卡上直接可讀；高度對齊原 44px 標題行高 */}
              <img
                src="/sakura-kitchen-logo.png"
                alt="SAKURA"
                className="h-[28px] w-auto self-start"
              />
              <h3 className="sr-only">SAKURA 廚電</h3>
              <ul className="mt-7 space-y-4">
                {SAKURA_ITEMS.map((item, j) => (
                  <li
                    key={j}
                    className="flex items-center gap-3 text-white text-[20px] leading-[36px] font-semibold"
                  >
                    <span
                      className="inline-flex items-center justify-center w-6 h-6 rounded-full shrink-0"
                      style={{ background: GOLD }}
                    >
                      <Check
                        className="w-3.5 h-3.5 text-white"
                        strokeWidth={3}
                      />
                    </span>
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          </Reveal>

          {/* 欄2/3：SVAGO / TEKA — 白卡；slideInUp stagger（模板 300 / 500） */}
          {BRANDS.map((b, i) => (
            <Reveal
              key={i}
              anim="slideInUp"
              delayMs={300 + i * 200}
              className="rounded-3xl bg-white overflow-hidden flex flex-col min-h-[771px]"
            >
              <div className="px-8 lg:px-10 pt-10">
                {/* 品牌 logo（替代文字標題）：SVAGO / TEKA 官方 SVG。
                    固定 48px 高的列 + 垂直置中：兩卡 logo 區等高，下方描述橫向對齊、產品圖等高；
                    各品牌 logoH 只控制字大小（svago 38 / teka 48），高度差不再推歪版面。 */}
                <div className="h-[48px] flex items-center">
                  <img src={b.logo} alt={b.name} style={{ height: b.logoH }} className="w-auto" />
                </div>
                <h3 className="sr-only">{b.name}</h3>
                <p className="mt-4 text-[#3E3A39] text-[20px] leading-[30px]">
                  {b.desc}
                </p>
              </div>
              {/* 產品圖鋪滿卡片下半 + CTA 疊左下（沿用金填滿白字 + 箭頭旋轉 hover） */}
              <div className="relative mt-8 flex-1 min-h-[260px]">
                <img
                  src={b.image}
                  alt={b.name}
                  className="absolute inset-0 w-full h-full object-cover object-center"
                />
                <a
                  href="#"
                  className="group absolute left-8 bottom-8 inline-flex items-center justify-between gap-4 rounded-full border border-transparent bg-white pl-[30px] pr-[7px] py-[7px] text-[#000000] transition-colors duration-500 hover:bg-[#C9AA79] hover:text-white"
                >
                  <span className="text-[15px] font-normal">更多廚電</span>
                  <span
                    className="inline-flex items-center justify-center w-[40px] h-[40px] rounded-full text-white transition-transform duration-500 group-hover:rotate-45"
                    style={{ background: GOLD }}
                  >
                    <ArrowUpRight className="w-5 h-5" />
                  </span>
                </a>
              </div>
            </Reveal>
          ))}
        </div>
      </div>

      {/* 跑馬燈：Pricing 區最底部 */}
      <div className="mt-24">
        <MarqueeBand />
      </div>
    </section>
  );
}
