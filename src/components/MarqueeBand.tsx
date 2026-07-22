import React from 'react';

const BRAND_LOGOS = [
  { name: 'SAKURA', src: '/home-2026/logos/sakura.svg' },
  { name: 'TLK Kitchens', src: '/home-2026/logos/tlk.svg' },
  { name: 'TEKA', src: '/home-2026/logos/teka.svg' },
  { name: 'SVAGO', src: '/home-2026/logos/svago.svg' },
  { name: 'SAKURA Home', src: '/home-2026/logos/sakura-home.png' },
];

// Services 底部品牌 Logo 跑馬燈：尺寸、順序、間距與 20s 速度對齊 SAKURA 官網 Footer。
export function MarqueeBand() {
  return (
    <div className="overflow-hidden select-none py-[40px]" role="region" aria-label="集團品牌">
      <div className="flex w-max animate-marquee">
        {[0, 1].map((group) => (
          <div key={group} className="flex shrink-0" aria-hidden={group === 1 || undefined}>
            {BRAND_LOGOS.map((logo) => (
              <span
                key={logo.name}
                className="mx-[70px] inline-flex h-[50px] w-[170px] shrink-0 items-center justify-center"
              >
                <img
                  src={logo.src}
                  alt={group === 0 ? logo.name : ''}
                  draggable={false}
                  className="max-h-[50px] w-[170px] object-contain"
                />
              </span>
            ))}
          </div>
        ))}
      </div>
    </div>
  );
}
