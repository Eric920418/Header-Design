import React from 'react';
import { Ruler, MessageCircle, MapPin } from 'lucide-react';

export function FloatingButtons() {
  return (
    <>
      {/* 桌面版 - 右側 sticky 欄，跟主內容並排 */}
      <div className="hidden lg:flex flex-col sticky top-0 h-screen w-[75px] shrink-0 z-50 justify-center">
        <a
          href="#"
          className="w-[75px] h-[80px] flex flex-col items-center justify-center gap-1 bg-[#c9a961] text-white hover:bg-[#b89551] transition-colors mb-8"
        >
          <span className="text-[12px] font-medium whitespace-nowrap tracking-[2px]">門市案例</span>
        </a>
        <a
          href="#"
          className="w-[75px] h-[70px] flex flex-col items-center justify-center gap-1 bg-[#5a5a5a] text-white hover:bg-[#4a4a4a] transition-colors"
        >
          <Ruler className="w-5 h-5" />
          <span className="text-[12px] font-medium whitespace-nowrap tracking-[2px]">到府丈量</span>
        </a>
        <a
          href="#"
          className="w-[75px] h-[70px] flex flex-col items-center justify-center gap-1 bg-[#5a5a5a] text-white hover:bg-[#4a4a4a] transition-colors"
        >
          <MessageCircle className="w-5 h-5" />
          <span className="text-[12px] font-medium whitespace-nowrap tracking-[2px]">線上諮詢</span>
        </a>
      </div>

      {/* 手機版 - 底部固定導航 */}
      <div className="flex lg:hidden fixed bottom-0 left-0 right-0 z-[9999] bg-white border-t border-gray-200">
        <a
          href="#"
          className="flex-1 flex items-center justify-center gap-2 py-3 bg-[#c9a961] text-white text-sm font-medium"
        >
          <MapPin className="w-4 h-4" />
          <span>門市案例</span>
        </a>
        <a
          href="#"
          className="flex-1 flex items-center justify-center gap-2 py-3 bg-[#5a5a5a] text-white text-sm font-medium"
        >
          <Ruler className="w-4 h-4" />
          <span>到府丈量</span>
        </a>
        <a
          href="#"
          className="flex-1 flex items-center justify-center gap-2 py-3 bg-[#5a5a5a] text-white text-sm font-medium"
        >
          <MessageCircle className="w-4 h-4" />
          <span>線上諮詢</span>
        </a>
      </div>
    </>
  );
}
