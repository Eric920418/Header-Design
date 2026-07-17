import React from 'react';

// 右側固定側邊欄 —— 配色/位置沿用官網 .l-quick-links 實測（金頂鈕 CIS 金 #C9AA79 + 灰群組 #737373 +
// 白分隔線、底部對齊貼右）；圖示＝使用者提供的品牌 icon（純白去背 PNG，public/floating-icons/），圖下加中文文字標籤。
// icon 非正方（案例門市 33×30、到府丈量/客服中心 38×40），故用 h-[40px] w-auto 依高度正規化、不塞正方以免變形。
// ⚠ 頂鈕『案例門市』的連結目前仍是官網『加盟』(franchising)——待提供正確 URL 再換。
const TOP = { href: 'https://www.sakura-kitchenlife.com.tw/franchising/intro', icon: '/floating-icons/case.png', label: '案例門市' };
// 灰底群組（到府丈量 / 客服中心），項間白色分隔線
const GROUP = [
  { href: 'https://www.sakura-kitchenlife.com.tw/measuring', icon: '/floating-icons/measure.png', label: '到府丈量' },
  { href: 'https://icare.sakura.com.tw', icon: '/floating-icons/service.png', label: '客服中心', external: true },
];

// 單顆按鈕內容：圖 58 + 下方白字標籤
function BtnInner({ icon, label }: { icon: string; label: string }) {
  return (
    <span className="flex flex-col items-center gap-1.5">
      <img src={icon} alt="" className="h-[40px] w-auto" />
      <span className="text-white text-[13px] leading-tight text-center whitespace-nowrap">{label}</span>
    </span>
  );
}

export function FloatingButtons() {
  return (
    <>
      {/* 桌面：原生 fixed 右側欄。 */}
      <div className="hidden lg:flex fixed inset-y-0 right-0 z-50 items-end pb-[36px] pointer-events-none">
        <div className="pointer-events-auto">
          {/* 金頂鈕（案例門市）：block p-2 mb-[20px] */}
          <a
            href={TOP.href}
            aria-label={TOP.label}
            className="block p-2 mb-[20px] bg-[#C9AA79] transition-opacity hover:opacity-90"
          >
            <BtnInner icon={TOP.icon} label={TOP.label} />
          </a>

          {/* 灰底群組：項間白色 h-px 分隔線 */}
          <div className="bg-[#737373]">
            {GROUP.map((b, i) => (
              <React.Fragment key={b.href}>
                {i > 0 && <div aria-hidden className="w-full h-px bg-white/50" />}
                <a
                  href={b.href}
                  aria-label={b.label}
                  {...(b.external ? { target: '_blank', rel: 'noopener noreferrer' } : {})}
                  className="block p-2 transition-opacity hover:opacity-90"
                >
                  <BtnInner icon={b.icon} label={b.label} />
                </a>
              </React.Fragment>
            ))}
          </div>
        </div>
      </div>

      {/* 手機／平板：底部固定列。 */}
      <div className="flex lg:hidden fixed bottom-0 left-0 right-0 z-[9999]">
        {[TOP, ...GROUP].map((b) => (
          <a
            key={b.href}
            href={b.href}
            aria-label={b.label}
            className={`flex-1 flex flex-col items-center justify-center gap-1 py-2 ${b === TOP ? 'bg-[#C9AA79]' : 'bg-[#737373]'}`}
          >
            <img src={b.icon} alt="" className="h-9 w-auto" />
            <span className="text-white text-[11px] leading-tight">{b.label}</span>
          </a>
        ))}
      </div>
    </>
  );
}
