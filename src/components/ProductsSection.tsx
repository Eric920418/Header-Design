import React from 'react';
import { ArrowUpRight } from 'lucide-react';

// 品牌重點金（沿用原站色）
const GOLD = '#C4A574';

// 三大廚房產品品牌（圖片來源：影像/廚房產品 → public/products/*.jpg）
const BRANDS = [
  {
    name: 'SAKURA 廚電',
    image: '/products/sakura.jpg',
    desc: '從料理、淨水到熱水，打造安心的廚房生活。',
    tags: ['廚房商品', '淨水器', '熱水器'],
    href: '#',
  },
  {
    name: 'SVAGO',
    image: '/products/svago.jpg',
    desc: '義式精品家電，為居家注入質感與品味。', // 佔位描述，待正式文案
    tags: ['紅酒櫃', '精品家電'], // 佔位分類，待正式資料
    href: '#',
  },
  {
    name: 'TEKA',
    image: '/products/teka.jpg',
    desc: '德國進口廚電，專業級的料理表現。', // 佔位描述，待正式文案
    tags: ['嵌入式烤箱', '進口廚電'], // 佔位分類，待正式資料
    href: '#',
  },
];

export function ProductsSection() {
  return (
    <section className="relative bg-[#f6f6f6] pt-20 overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 lg:px-12">
        {/* 雙色大標題（eyebrow 已移除） */}
        <div className="mb-12 lg:mb-16">
          <h2 className="text-4xl lg:text-6xl font-bold leading-[1.08] text-[#1c1c1d] max-w-3xl">
            Search Your <span style={{ color: GOLD }}>Kitchen</span>
            <br />
            <span style={{ color: GOLD }}>Product</span> The OOOO
          </h2>
        </div>

        {/* 三大品牌卡 */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 items-stretch">
          {BRANDS.map((b, i) => (
            <div
              key={i}
              className="group rounded-3xl overflow-hidden bg-white flex flex-col shadow-sm"
            >
              {/* 產品圖 */}
              <div className="relative aspect-[4/3] bg-gray-900 overflow-hidden">
                <img
                  src={b.image}
                  alt={b.name}
                  className="absolute inset-0 w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
                />
              </div>

              {/* 內容 */}
              <div className="p-7 lg:p-8 flex flex-col flex-1">
                <h3 className="text-2xl lg:text-[28px] font-bold text-[#1c1c1d]">{b.name}</h3>
                <p className="mt-3 text-gray-500 leading-relaxed">{b.desc}</p>

                {/* 分類標籤 */}
                <div className="mt-5 flex flex-wrap gap-2">
                  {b.tags.map((t, j) => (
                    <span
                      key={j}
                      className="rounded-full border border-gray-200 px-3 py-1 text-sm text-gray-600"
                    >
                      {t}
                    </span>
                  ))}
                </div>

                {/* 了解更多（沿用金色圓箭頭按鈕，縮小版） */}
                <a
                  href={b.href}
                  className="mt-auto pt-7 inline-flex items-center gap-3 text-[#1c1c1d] hover:text-[#C4A574] transition-colors"
                >
                  <span className="text-sm tracking-wider">了解更多</span>
                  <span
                    className="inline-flex items-center justify-center w-9 h-9 rounded-full text-white transition-transform group-hover:rotate-45"
                    style={{ background: GOLD }}
                  >
                    <ArrowUpRight className="w-4 h-4" />
                  </span>
                </a>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* 底部跑馬燈（採 Home Two elementor-scrolling；文字改為 kitchen product） */}
      <div className="mt-16 lg:mt-24 overflow-hidden select-none" aria-hidden>
        <div className="flex w-max animate-marquee">
          {[0, 1].map((group) => (
            <div key={group} className="flex shrink-0">
              {Array.from({ length: 4 }).map((_, i) => (
                <span
                  key={i}
                  className="block font-bold leading-[0.9] whitespace-nowrap pr-[0.2em] text-[72px] md:text-[140px] lg:text-[220px]"
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
