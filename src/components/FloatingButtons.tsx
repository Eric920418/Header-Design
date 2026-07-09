import React from 'react';
import { useCanvasScale } from './useCanvasScale';

// 右側固定側邊欄 —— 對齊官網 sakura-kitchenlife.com.tw 的 .l-quick-links（實測）：
// 純圖示按鈕、圖 58px、p-2(8px)、金頂鈕(CIS 金 #C9AA79) + 灰群組(#737373，官網值) + 白分隔線、底部對齊貼右、無文字。
// ⚠ 圖示直接引用官網資產（quick-link-{2,3,4}.svg，已實測可載入）；要本地化可下載到 public/floating-icons/。
// ⚠ 金頂鈕金色＝使用者指定改回本專案 CIS 金 #C9AA79（非官網 #B79258）；灰群組仍用官網值 #737373。
const ICON = 'https://www.sakura-kitchenlife.com.tw/images';

// 金頂鈕（加盟）：與下方群組間隔 mb-20
const TOP = { href: 'https://www.sakura-kitchenlife.com.tw/franchising/intro', icon: `${ICON}/quick-link-4.svg`, alt: '加盟門市' };
// 灰底群組（到府丈量 / 客服），項間白色分隔線（VR 賞屋已移除）
const GROUP = [
  { href: 'https://www.sakura-kitchenlife.com.tw/measuring', icon: `${ICON}/quick-link-2.svg`, alt: '到府丈量' },
  { href: 'https://icare.sakura.com.tw', icon: `${ICON}/quick-link-3.svg`, alt: '客服中心', external: true },
];

export function FloatingButtons() {
  // 與全站同步等比縮放（畫布外 fixed 層需自行補回 scale）；底部貼右故 origin = right bottom。
  const scalerRef = useCanvasScale<HTMLDivElement>('right bottom');

  return (
    <>
      {/* 定位層：滿高右側條 + 底部對齊(items-end) + pb-[36px]（官網 bottom-9）→ scaler(等比縮放) → 按鈕。
          pointer-events-none 讓空條不擋點擊，內層 pointer-events-auto 收回可點。 */}
      <div className="hidden lg:flex fixed inset-y-0 right-0 z-50 items-end pb-[36px] pointer-events-none">
        <div ref={scalerRef} className="pointer-events-auto">
          {/* 金頂鈕（加盟）：block p-2 mb-[20px]，圖 58 */}
          <a
            href={TOP.href}
            aria-label={TOP.alt}
            className="block p-2 mb-[20px] bg-[#C9AA79] transition-opacity hover:opacity-90"
          >
            <img src={TOP.icon} alt={TOP.alt} className="w-[58px] h-[58px]" />
          </a>

          {/* 灰底群組：3 顆，項間白色 h-px 分隔線 */}
          <div className="bg-[#737373]">
            {GROUP.map((b, i) => (
              <React.Fragment key={b.href}>
                {i > 0 && <div aria-hidden className="w-full h-px bg-white/50" />}
                <a
                  href={b.href}
                  aria-label={b.alt}
                  {...(b.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
                  className="block p-2 transition-opacity hover:opacity-90"
                >
                  <img src={b.icon} alt={b.alt} className="w-[58px] h-[58px]" />
                </a>
              </React.Fragment>
            ))}
          </div>
        </div>
      </div>

      {/* 手機版底列（凍結斷點後 lg:hidden 恆隱藏、不顯示；保留為一致性）：4 顆純圖示 */}
      <div className="flex lg:hidden fixed bottom-0 left-0 right-0 z-[9999]">
        {[TOP, ...GROUP].map((b) => (
          <a
            key={b.href}
            href={b.href}
            aria-label={b.alt}
            className={`flex-1 flex items-center justify-center py-2 ${b === TOP ? 'bg-[#C9AA79]' : 'bg-[#737373]'}`}
          >
            <img src={b.icon} alt={b.alt} className="w-9 h-9" />
          </a>
        ))}
      </div>
    </>
  );
}
