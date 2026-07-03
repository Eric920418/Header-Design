import React from 'react';

// 文字連結（網站地圖、隱私權政策）
const TEXT_LINKS = [
  { label: '網站地圖', href: '#' },
  // 隱私權政策 → 由 docx 內文抽出、產生的輕量靜態頁 public/privacy.html
  { label: '隱私權政策', href: '/privacy.html' },
];

// icon 連結（數位展板、YouTube）— 白色去背 PNG，黑底顯白
const ICON_LINKS = [
  { label: '數位展板', href: '#', icon: '/icons/digital-board.png' },
  { label: 'YouTube', href: '#', icon: '/icons/youtube.png' },
];

export function Footer() {
  return (
    <footer className="bg-black text-white">
      {/* 手機底部有 FloatingButtons 固定列，pb 留高避免被蓋住 */}
      <div className="max-w-7xl mx-auto px-6 lg:px-12 pt-16 pb-28 lg:pb-16">
        {/* 金色 SAKURA KITCHEN logo（僅英文，中文段已裁除） */}
        <img
          src="/sakura-logo-gold.png"
          alt="SAKURA KITCHEN"
          className="h-6 sm:h-7 lg:h-8 w-auto"
        />

        {/* 版權 */}
        <p className="mt-6 text-sm text-gray-400">
          Copyright © Taiwan Sakura Corporation. All rights reserved
        </p>

        {/* 分隔線 + 導覽列（左：文字連結 / 右：icon 連結） */}
        <div className="mt-8 pt-8 border-t border-white/15 flex flex-col gap-6 sm:flex-row sm:items-center sm:justify-between">
          <nav className="flex items-center gap-8">
            {TEXT_LINKS.map((l) => (
              <a
                key={l.label}
                href={l.href}
                className="text-sm text-gray-300 hover:text-[#C4A574] transition-colors"
              >
                {l.label}
              </a>
            ))}
          </nav>

          <div className="flex items-center gap-6">
            {ICON_LINKS.map((l) => (
              <a
                key={l.label}
                href={l.href}
                aria-label={l.label}
                title={l.label}
                className="opacity-90 hover:opacity-100 transition-opacity"
              >
                <img src={l.icon} alt={l.label} className="w-6 h-6 object-contain" />
              </a>
            ))}
          </div>
        </div>
      </div>
    </footer>
  );
}
