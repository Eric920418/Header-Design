import React from 'react';
import { Facebook, Youtube } from 'lucide-react';

export function HeroSection() {
  return (
    <div className="flex min-h-[600px]">
      {/* 左側邊欄 */}
      <aside className="w-[132px] bg-white border-r border-gray-200 flex flex-col justify-between py-8 px-4">
        {/* 上方導航 */}
        <nav className="flex flex-col gap-6">
          <a href="#" className="text-gray-600 hover:text-[#C4A574] text-sm transition-colors">
            Home
          </a>
          <a href="#" className="text-gray-600 hover:text-[#C4A574] text-sm transition-colors">
            Stores
          </a>
          <a href="#" className="text-gray-600 hover:text-[#C4A574] text-sm transition-colors">
            Product
          </a>
          <a href="#" className="text-gray-600 hover:text-[#C4A574] text-sm transition-colors">
            Appliances
          </a>
        </nav>

        {/* 中間品牌資訊 */}
        <div className="flex flex-col gap-1 text-xs text-gray-700">
          <div>Franchise</div>
          <div className="font-medium">SAKURA KITECEN</div>
        </div>

        {/* 底部社交媒體圖示 */}
        <div className="flex flex-col gap-4">
          <a href="#" className="text-gray-400 hover:text-[#C4A574] transition-colors">
            <Facebook size={20} />
          </a>
          <a href="#" className="text-gray-400 hover:text-[#C4A574] transition-colors">
            <Youtube size={20} />
          </a>
        </div>
      </aside>

      {/* 右側主視覺區 */}
      <div className="flex-1 relative bg-gradient-to-br from-gray-100 to-gray-300">
        {/* 內容層 */}
        <div className="relative h-full flex flex-col items-center justify-center">
          {/* 標題文字 */}
          <div className="text-center mb-12">
            <h1 className="text-6xl font-light tracking-widest mb-4" style={{ color: 'rgba(255, 255, 255, 0.7)' }}>
              AI <span className="italic">z</span>KITCHEN
            </h1>
            <p className="text-white/60 text-lg tracking-wider">
              全球手未來智能廚房首高端
            </p>
          </div>

          {/* 播放按鈕 */}
          <button className="group">
            <div className="w-32 h-32 rounded-full bg-gray-800/70 flex items-center justify-center group-hover:bg-gray-700/70 transition-colors">
              <div className="w-0 h-0 border-t-[20px] border-t-transparent border-l-[32px] border-l-white border-b-[20px] border-b-transparent ml-2"></div>
            </div>
          </button>
        </div>
      </div>
    </div>
  );
}