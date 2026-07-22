import React from 'react';

const TEXT_LINKS = [
  { label: '網站地圖', href: '#' },
  { label: '隱私權政策', href: '/privacy.html' },
];

const ICON_LINKS = [
  { label: '數位展板', href: '#', icon: '/icons/digital-board.png', size: 35, offsetY: 0 },
  { label: 'YouTube', href: '#', icon: '/icons/youtube.png', size: 40, offsetY: 5 },
];

export function Footer() {
  return (
    <footer
      className="relative isolate h-[420px] overflow-hidden bg-[#1C1C1D] bg-cover bg-center text-white lg:h-[650px]"
      style={{ backgroundImage: "url('/footer-antra-bg.jpg')" }}
    >
      <div aria-hidden className="absolute inset-0 -z-10 bg-black/75" />

      {/* 簡化模板上半資訊區：只保留 SAKURA 原有連結與圖示。 */}
      <div className="relative z-10 h-[220px] bg-[rgba(28,28,29,0.64)]">
        <div className="mx-auto flex h-full max-w-[1410px] flex-col justify-between px-[15px] py-[36px] md:flex-row md:items-start md:px-[30px] md:py-[48px] lg:px-[51px]">
          <nav aria-label="頁尾連結" className="flex flex-col items-start gap-4 md:flex-row md:gap-8">
            {TEXT_LINKS.map((link) => (
              <a
                key={link.label}
                href={link.href}
                className="text-[16px] leading-6 text-white transition-colors duration-300 hover:text-[#CAA05C]"
              >
                {link.label}
              </a>
            ))}
          </nav>

          <div className="flex items-center gap-7">
            {ICON_LINKS.map((link) => (
              <a
                key={link.label}
                href={link.href}
                aria-label={link.label}
                title={link.label}
                className="opacity-85 transition-opacity duration-300 hover:opacity-100"
              >
                <img
                  src={link.icon}
                  alt={link.label}
                  style={{
                    width: link.size,
                    height: link.size,
                    transform: link.offsetY ? `translateY(${link.offsetY}px)` : undefined,
                  }}
                  className="object-contain"
                />
              </a>
            ))}
          </div>
        </div>
      </div>

      {/* 模板同位置的獨立版權帶。 */}
      <div className="relative z-10 flex h-[70px] items-center justify-center border-y border-white/10 bg-[rgba(28,28,29,0.64)] px-[15px] text-center md:px-[30px]">
        <p className="text-[13px] leading-5 text-white/70 md:text-[14px]">
          Copyright © Taiwan Sakura Corporation. All rights reserved
        </p>
      </div>

      {/* SAKURA KITCHEN 金色品牌字標：保留原始比例、完整顯示並貼齊 Footer 底部。 */}
      <div aria-hidden className="pointer-events-none absolute inset-x-0 bottom-0 z-0 flex select-none justify-center">
        <img
          src="/home-2026/footer/sakura-kitchen.png"
          alt=""
          className="h-auto w-[calc(100%-30px)] max-w-[1410px] object-contain md:w-[calc(100%-60px)] lg:w-[calc(100%-102px)]"
        />
      </div>
    </footer>
  );
}
