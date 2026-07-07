import React from 'react';

// 文字連結（網站地圖、隱私權政策）— 字級 14
const TEXT_LINKS = [
  { label: '網站地圖', href: '#' },
  // 隱私權政策 → 由 docx 內文抽出、產生的輕量靜態頁 public/privacy.html
  { label: '隱私權政策', href: '/privacy.html' },
];

// icon 連結：數位展板 30×30、YouTube 33×33（白色去背 PNG，暗底顯白）
// offsetY：兩張 PNG 內容在畫布內的垂直位置不同（YouTube logo 畫在上半、tablet 置中），
// 掃描非透明邊界得 YT 視覺偏上 6px，故單獨往下推 6px 讓「可見圖案」的中心對齊。
const ICON_LINKS = [
  { label: '數位展板', href: '#', icon: '/icons/digital-board.png', size: 35, offsetY: 0 },
  { label: 'YouTube', href: '#', icon: '/icons/youtube.png', size: 35, offsetY: 6 },
];

export function Footer() {
  return (
    <footer className="bg-[#f6f6f6]">
      <div className="relative overflow-hidden">
        {/* 上半：灰底 + 巨型 SAKURA 浮水印（淡金，下緣被暗色版權列蓋住） */}
        <div aria-hidden className="pointer-events-none select-none flex justify-center pt-20">
          <span
            className="font-bold leading-none whitespace-nowrap text-[330px]"
            style={{ color: '#C9AA79', opacity: 0.18 }}
          >
            SAKURA
          </span>
        </div>

        {/* 版權列：模板暗色 #3E3A39，滿寬、負 margin 疊在浮水印下緣之上 */}
        <div className="relative -mt-[90px] bg-[#3E3A39] text-white">
          <div className="relative max-w-[1410px] mx-auto px-[51px] py-24 flex items-center justify-between gap-6">
            {/* 左：文字連結（字級 14） */}
            <nav className="flex items-center gap-6 shrink-0">
              {TEXT_LINKS.map((l) => (
                <a
                  key={l.label}
                  href={l.href}
                  className="text-[15px] text-white hover:text-[#C9AA79] transition-colors"
                >
                  {l.label}
                </a>
              ))}
            </nav>

            {/* 中：版權（絕對置中，不受左右欄寬影響） */}
            <p className="absolute left-1/2 -translate-x-1/2 whitespace-nowrap text-[14px] text-white/70">
              Copyright © Taiwan Sakura Corporation. All rights reserved
            </p>

            {/* 右：icon 30×30 / 33×33 */}
            <div className="flex items-center gap-6 shrink-0">
              {ICON_LINKS.map((l) => (
                <a
                  key={l.label}
                  href={l.href}
                  aria-label={l.label}
                  title={l.label}
                  className="opacity-85 hover:opacity-100 transition-opacity"
                >
                  <img
                    src={l.icon}
                    alt={l.label}
                    style={{
                      width: l.size,
                      height: l.size,
                      transform: l.offsetY ? `translateY(${l.offsetY}px)` : undefined,
                    }}
                    className="object-contain"
                  />
                </a>
              ))}
            </div>
          </div>
        </div>
      </div>
    </footer>
  );
}
