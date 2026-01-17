import React from 'react';
import { Instagram, Youtube, Facebook, ChevronUp } from 'lucide-react';

export function Footer() {
  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };

  return (
    <footer className="bg-[#5a5a5a] text-white">
      <div className="max-w-7xl mx-auto px-12 pt-12 pb-6">
        {/* 主要內容區 */}
        <div className="flex justify-between items-start mb-12">
          {/* Logo */}
          <div className="w-[200px]">
            <div className="text-2xl font-bold tracking-wider">
              SAKURA<br />
              KITCHEN
            </div>
          </div>

          {/* About */}
          <div>
            <h3 className="text-sm mb-4 tracking-wider">About</h3>
            <ul className="space-y-2 text-sm text-gray-300">
              <li><a href="#" className="hover:text-white transition-colors">廚房產品</a></li>
              <li><a href="#" className="hover:text-white transition-colors">整修案例</a></li>
              <li><a href="#" className="hover:text-white transition-colors">優惠消息</a></li>
              <li><a href="#" className="hover:text-white transition-colors">品牌承諾</a></li>
            </ul>
          </div>

          {/* Service */}
          <div>
            <h3 className="text-sm mb-4 tracking-wider">Service</h3>
            <ul className="space-y-2 text-sm text-gray-300">
              <li><a href="#" className="hover:text-white transition-colors">到府丈量</a></li>
              <li><a href="#" className="hover:text-white transition-colors">FAQ</a></li>
              <li><a href="#" className="hover:text-white transition-colors">客服中心</a></li>
            </ul>
          </div>

          {/* Social Media */}
          <div>
            <h3 className="text-sm mb-4 tracking-wider">Social Media</h3>
            <div className="flex gap-4">
              <a href="#" className="hover:opacity-80 transition-opacity">
                <Instagram className="w-6 h-6" />
              </a>
              <a href="#" className="hover:opacity-80 transition-opacity">
                <Youtube className="w-6 h-6" />
              </a>
              <a href="#" className="hover:opacity-80 transition-opacity">
                <Facebook className="w-6 h-6" />
              </a>
            </div>
          </div>

          {/* 回到上方 */}
          <div>
            <button
              onClick={scrollToTop}
              className="flex flex-col items-center gap-1 hover:opacity-80 transition-opacity"
            >
              <ChevronUp className="w-5 h-5" />
              <span className="text-xs tracking-wider">回到上方</span>
            </button>
          </div>
        </div>

        {/* 底部版權資訊 */}
        <div className="pt-6 border-t border-gray-600 flex justify-between items-center text-xs text-gray-400">
          <div className="flex items-center gap-4">
            <span>Copyright © 2025 Taiwan Sakura Corporation.</span>
            <span>|</span>
            <a href="#" className="hover:text-white transition-colors">隱私權聲明</a>
          </div>
          <div>
            All Rights Reserved. Designed website by Valas
          </div>
        </div>
      </div>
    </footer>
  );
}
