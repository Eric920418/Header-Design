import React from 'react';
import { Play } from 'lucide-react';

export function AboutSection() {
  return (
    <div className="bg-white py-24">
      <div className="max-w-7xl mx-auto px-12">
        <div className="flex gap-16 items-center">
          {/* 左側文字區 */}
          <div className="w-[400px] flex-shrink-0">
            <div className="space-y-6">
              {/* 標題區 */}
              <div>
                <p className="text-gray-500 text-sm tracking-wider mb-2">About us</p>
                <h2 className="text-4xl mb-2">這麼承諾</h2>
                <p className="text-sm tracking-[0.3em] text-gray-600">Brand Promise</p>
              </div>

              {/* 描述文字 */}
              <p className="text-gray-600 text-sm leading-relaxed">
                The kitchen is the heart of modern living.<br />
                Sakura's integrated service lets you enjoy<br />
                every happy moment—worry-free
              </p>

              {/* 按鈕 */}
              <button className="bg-gray-600 text-white px-8 py-3 text-sm tracking-[0.2em] hover:bg-gray-700 transition-colors">
                關於我們
              </button>

              {/* 底部標語 */}
              <div className="pt-12 mt-12 border-t border-gray-200">
                <div className="text-sm">
                  <div className="mb-1 tracking-wider">
                    <span className="font-semibold">SAKURA</span> x <span className="font-semibold">KITCHEN</span>
                  </div>
                  <p className="text-gray-600 tracking-wider">一起擁走，擁有幸福</p>
                </div>
              </div>
            </div>
          </div>

          {/* 右側影片區 */}
          <div className="flex-1">
            <div className="relative aspect-video bg-gray-200 rounded-lg overflow-hidden group cursor-pointer">
              <img
                src="https://images.unsplash.com/photo-1758522490602-bebf6a55fcd1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxzbWFydHBob25lJTIwaGFuZCUyMGtpdGNoZW58ZW58MXx8fHwxNzY4NDU2Njg5fDA&ixlib=rb-4.1.0&q=80&w=1080&utm_source=figma&utm_medium=referral"
                alt="Kitchen video"
                className="w-full h-full object-cover"
              />
              
              {/* 播放按鈕 */}
              <div className="absolute inset-0 flex items-center justify-center bg-black/20 group-hover:bg-black/30 transition-colors">
                <div className="w-20 h-20 rounded-full bg-white/90 flex items-center justify-center group-hover:scale-110 transition-transform">
                  <Play className="w-8 h-8 text-gray-800 ml-1" fill="currentColor" />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
