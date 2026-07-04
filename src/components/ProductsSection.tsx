import React from 'react';
import { ArrowUpRight, Check } from 'lucide-react';

// 品牌重點金（沿用原站色）
const GOLD = '#C4A574';

// 欄 2/3：方案卡構造的品牌卡（圖片來源：影像/廚房產品 → public/products/*.jpg）
const PLAN_BRANDS = [
  {
    name: 'SVAGO',
    image: '/products/svago.jpg',
    desc: '義式精品家電，為居家注入質感與品味。', // 佔位描述，待正式文案
    features: ['紅酒櫃', '精品家電'], // 佔位項目，待正式資料
    href: '#',
  },
  {
    name: 'TEKA',
    image: '/products/teka.jpg',
    desc: '德國進口廚電，專業級的料理表現。', // 佔位描述，待正式文案
    features: ['嵌入式烤箱', '進口廚電'], // 佔位項目，待正式資料
    href: '#',
  },
];

export function ProductsSection() {
  return (
    <section className="relative bg-[#f6f6f6] pt-[120px] overflow-hidden">
      <div className="max-w-[1410px] mx-auto">
        {/* 標題列（照模板：eyebrow 膠囊在左、大標右移約 1/3 處，同一列） */}
        <div className="mb-[60px] flex items-start">
          <div className="w-1/3 shrink-0 pt-2">
            <span className="inline-flex items-center gap-2 rounded-full border border-gray-300 bg-white px-4 py-2 text-[15px] tracking-[1px] uppercase text-[#1c1c1d]">
              <span className="inline-block w-1.5 h-1.5 rounded-full" style={{ background: GOLD }} />
              our kitchen products
            </span>
          </div>
          <h2 className="text-[60px] font-bold leading-[64px] text-[#1c1c1d]">
            Search Your <span style={{ color: GOLD }}>Kitchen</span>
            <br />
            <span style={{ color: GOLD }}>Product</span> The OOOO
          </h2>
        </div>

        {/* 三欄（照模板：深色標語圖卡 + 2 張方案卡） */}
        <div className="grid grid-cols-3 gap-[30px] items-stretch">
          {/* 欄1：SAKURA 廚電 — 深色標語圖卡（模板 statement 卡位） */}
          <div className="relative rounded-3xl overflow-hidden min-h-[673px]">
            <img
              src="/products/sakura.jpg"
              alt="SAKURA 廚電"
              className="absolute inset-0 w-full h-full object-cover"
            />
            <div
              className="absolute inset-0"
              style={{
                background:
                  'linear-gradient(180deg, rgba(14,16,18,0.72) 0%, rgba(14,16,18,0.25) 45%, rgba(14,16,18,0.15) 100%)',
              }}
            />
            <div className="relative z-10 p-8 lg:p-10">
              <h3 className="text-white text-[36px] leading-[44px] font-bold">
                SAKURA <span style={{ color: GOLD }}>廚電</span>
              </h3>
              <p className="mt-3 text-white/80 text-[20px] leading-[30px]">
                從料理、淨水到熱水，打造安心的廚房生活。
              </p>
            </div>
          </div>

          {/* 欄2/3：方案卡構造（標題→描述→分隔線→金勾清單 + 下半部清晰產品圖鋪底，如 SAKURA 卡） */}
          {PLAN_BRANDS.map((b, i) => (
            <div
              key={i}
              className="rounded-3xl bg-white overflow-hidden flex flex-col min-h-[673px]"
            >
              {/* 上：文字內容 */}
              <div className="px-8 lg:px-10 pt-10">
                <h3 className="text-[45px] leading-[50px] font-bold text-[#1c1c1d]">{b.name}</h3>
                <p className="mt-4 text-gray-500 text-[20px] leading-[30px]">{b.desc}</p>

                <hr className="border-gray-200 my-7" />

                {/* 金圓底白勾清單（模板 features list） */}
                <ul className="space-y-4">
                  {b.features.map((f, j) => (
                    <li key={j} className="flex items-center gap-3 text-[#1c1c1d] text-[20px] leading-[36px]">
                      <span
                        className="inline-flex items-center justify-center w-6 h-6 rounded-full shrink-0"
                        style={{ background: GOLD }}
                      >
                        <Check className="w-3.5 h-3.5 text-white" strokeWidth={3} />
                      </span>
                      {f}
                    </li>
                  ))}
                </ul>
              </div>

              {/* 下：清晰產品圖鋪滿卡片下半部（如最左 SAKURA 卡）+ CTA 疊在左下 */}
              <div className="relative mt-8 flex-1 min-h-[260px]">
                <img
                  src={b.image}
                  alt={b.name}
                  className="absolute inset-0 w-full h-full object-cover object-center"
                />
                {/* CTA 膠囊（依模板實測：高 65、字 19、內圓 47） */}
                <a
                  href={b.href}
                  className="group absolute left-8 bottom-8 inline-flex items-center justify-between gap-4 rounded-full bg-white pl-[30px] pr-[9px] py-[8px] text-[#1c1c1d] shadow-md hover:shadow-lg transition-shadow"
                >
                  <span className="text-[19px]">了解更多</span>
                  <span
                    className="inline-flex items-center justify-center w-[47px] h-[47px] rounded-full text-white transition-transform group-hover:rotate-45"
                    style={{ background: GOLD }}
                  >
                    <ArrowUpRight className="w-5 h-5" />
                  </span>
                </a>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* 底部跑馬燈（採 Home Two elementor-scrolling；文字改為 kitchen product） */}
      <div className="mt-24 overflow-hidden select-none" aria-hidden>
        <div className="flex w-max animate-marquee">
          {[0, 1].map((group) => (
            <div key={group} className="flex shrink-0">
              {Array.from({ length: 4 }).map((_, i) => (
                <span
                  key={i}
                  className="block font-bold leading-[0.9] whitespace-nowrap pr-[0.2em] text-[220px]"
                  style={{
                    backgroundImage:
                      'linear-gradient(rgb(216,216,216) 0%, rgba(153,153,153,0) 90%)',
                    WebkitBackgroundClip: 'text',
                    backgroundClip: 'text',
                    WebkitTextFillColor: 'transparent',
                    color: 'transparent',
                  }}
                >
                  kitchen product
                </span>
              ))}
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
