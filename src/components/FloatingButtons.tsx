import React from 'react';
import { useCanvasScale } from './useCanvasScale';

// 右側浮動按鈕三顆：圖示改用官方白色 PNG（public/floating-icons/*.png，皆純白，金底/深底皆可見）。
// gold=true → 金底(門市案例)；其餘深灰底。桌面與手機共用同一份資料。
const BUTTONS = [
  { label: '門市案例', icon: '/floating-icons/store.png', gold: true },
  { label: '到府丈量', icon: '/floating-icons/measure.png', gold: false },
  { label: '客服中心', icon: '/floating-icons/service.png', gold: false },
];

export function FloatingButtons() {
  // 與全站同步等比縮放（畫布外的 fixed 層需自行補回 scale）；右側垂直置中故 origin = right center。
  const scalerRef = useCanvasScale<HTMLDivElement>('right center');

  return (
    <>
      {/* 桌面版 - 右側浮動欄：三層＝定位層(滿高右側條 + flex 垂直置中) → scaler(等比縮放) → 按鈕欄。
          pointer-events-none 讓空條不擋點擊，內層 pointer-events-auto 收回可點。 */}
      <div className="hidden lg:flex fixed inset-y-0 right-0 z-50 items-center pointer-events-none">
        <div ref={scalerRef} className="pointer-events-auto">
          <div className="flex flex-col rounded-l-xl overflow-hidden shadow-[0_12px_40px_-8px_rgba(0,0,0,0.28)]">
            {BUTTONS.map((b, i) => (
              <a
                key={b.label}
                href="#"
                className={`w-[75px] h-[80px] flex flex-col items-center justify-center gap-1.5 text-white transition-colors ${
                  b.gold ? 'bg-[#C9AA79] hover:bg-[#B8965F]' : 'bg-[#3E3A39] hover:bg-[#2E2B2A]'
                } ${i > 0 ? 'border-t border-white/10' : ''}`}
              >
                <img src={b.icon} alt="" className="h-5 w-auto" />
                <span className="text-[10px] font-medium whitespace-nowrap tracking-[2px]">{b.label}</span>
              </a>
            ))}
          </div>
        </div>
      </div>

      {/* 手機版 - 底部固定導航 */}
      <div className="flex lg:hidden fixed bottom-0 left-0 right-0 z-[9999] bg-white border-t border-[#E3DED7]">
        {BUTTONS.map((b) => (
          <a
            key={b.label}
            href="#"
            className={`flex-1 flex items-center justify-center gap-2 py-3 text-white text-sm font-medium ${
              b.gold ? 'bg-[#C9AA79]' : 'bg-[#3E3A39]'
            }`}
          >
            <img src={b.icon} alt="" className="h-4 w-auto" />
            <span>{b.label}</span>
          </a>
        ))}
      </div>
    </>
  );
}
