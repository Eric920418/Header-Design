import React from 'react';
import { Ruler, MessageCircle, MapPin } from 'lucide-react';

export function FloatingButtons() {
  return (
    <>
      {/* 桌面版 - 右側浮動欄（釘在視窗右側垂直置中）：左圓角 + 陰影 的整組 tab，圓/深灰用 CIS，三顆統一有 icon */}
      <div className="hidden lg:flex flex-col fixed right-0 top-1/2 -translate-y-1/2 z-50 rounded-l-2xl overflow-hidden shadow-[0_12px_40px_-8px_rgba(0,0,0,0.28)]">
        <a
          href="#"
          className="w-[80px] h-[86px] flex flex-col items-center justify-center gap-1.5 bg-[#C9AA79] text-white hover:bg-[#B8965F] transition-colors"
        >
          <MapPin className="w-5 h-5" />
          <span className="text-[12px] font-medium whitespace-nowrap tracking-[2px]">門市案例</span>
        </a>
        <a
          href="#"
          className="w-[80px] h-[86px] flex flex-col items-center justify-center gap-1.5 bg-[#3E3A39] text-white hover:bg-[#2E2B2A] transition-colors border-t border-white/10"
        >
          <Ruler className="w-5 h-5" />
          <span className="text-[12px] font-medium whitespace-nowrap tracking-[2px]">到府丈量</span>
        </a>
        <a
          href="#"
          className="w-[80px] h-[86px] flex flex-col items-center justify-center gap-1.5 bg-[#3E3A39] text-white hover:bg-[#2E2B2A] transition-colors border-t border-white/10"
        >
          <MessageCircle className="w-5 h-5" />
          <span className="text-[12px] font-medium whitespace-nowrap tracking-[2px]">客服中心</span>
        </a>
      </div>

      {/* 手機版 - 底部固定導航 */}
      <div className="flex lg:hidden fixed bottom-0 left-0 right-0 z-[9999] bg-white border-t border-[#E3DED7]">
        <a
          href="#"
          className="flex-1 flex items-center justify-center gap-2 py-3 bg-[#C9AA79] text-white text-sm font-medium"
        >
          <MapPin className="w-4 h-4" />
          <span>門市案例</span>
        </a>
        <a
          href="#"
          className="flex-1 flex items-center justify-center gap-2 py-3 bg-[#3E3A39] text-white text-sm font-medium"
        >
          <Ruler className="w-4 h-4" />
          <span>到府丈量</span>
        </a>
        <a
          href="#"
          className="flex-1 flex items-center justify-center gap-2 py-3 bg-[#3E3A39] text-white text-sm font-medium"
        >
          <MessageCircle className="w-4 h-4" />
          <span>客服中心</span>
        </a>
      </div>
    </>
  );
}
