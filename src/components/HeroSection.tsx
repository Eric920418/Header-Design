import React from 'react';
import { Facebook, Youtube } from 'lucide-react';

const KITCHEN_BG =
  'https://images.unsplash.com/photo-1610177534644-34d881503b83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4Mzc2MTc3fDA&ixlib=rb-4.1.0&q=80&w=1600';

export function HeroSection() {
  const brands = ['SAKURA', 'TLA', 'TEKA', 'svago', '---'];

  return (
    <div className="flex">
      {/* ── 左側邊欄 ── */}
      <aside
        className="hidden lg:flex flex-col bg-white border-gray-100 shrink-0 gap-[40px]"
        style={{ width: '400px', padding: '36px 0 0 100px' }}
      >
        {/* 導航連結 */}
        <nav className="flex flex-col gap-7">
          {['Home', 'Stores', 'Product', 'Appliances'].map((item) => (
            <a
              key={item}
              href="#"
              className="text-gray-700 text-[15px] hover:text-[#C4A574] transition-colors"
            >
              {item}
            </a>
          ))}
        </nav>



        {/* 分隔線 + Franchise */}
        <div>
          <hr className="border-gray-200 mb-7" />
          <div className="text-gray-600 text-sm leading-relaxed">
            <div>Franchise</div>
            <div className="font-medium text-gray-800">SAKURA KITCHEN</div>
          </div>
        </div>

        {/* 社交媒體 — 灰色方框，grow 填滿至底部 */}
        <div className="flex flex-col items-start gap-[30px] bg-gray-100 py-[60px] grow">
          <a href="#" className="text-gray-400 hover:text-gray-600 transition-colors ps-[20px]">
            <Facebook size={36} />
          </a>
          <a href="#" className="text-gray-400 hover:text-gray-600 transition-colors ps-[20px]">
            <Youtube size={42} />
          </a>
        </div>
      </aside>

      {/* ── 右側主視覺 ── */}
      <div className="flex-1 flex flex-col">
        {/* 主 Banner */}
        <div
          className="relative overflow-hidden"
          style={{
            height: '590px',
            /* 天空漸層 — 由上至下由中灰藍到亮白藍 */
            background:
              'linear-gradient(180deg, #b2c4d4 0%, #bccbd8 18%, #c6d2db 38%, #cfd8e1 58%, #d8e2ea 76%, #dce5ec 88%, #d4dfe9 100%)',
          }}
        >

          {/* 廚具產品圖 — 疊在下半部 */}
          <img
            src={KITCHEN_BG}
            alt="AI Kitchen Products"
            className="absolute bottom-0 left-0 w-full"
            style={{
              height: '68%',
              objectFit: 'cover',
              objectPosition: 'center top',
              opacity: 0.88,
              mixBlendMode: 'multiply',
              maskImage: 'linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.7) 30%, rgba(0,0,0,1) 100%)',
              WebkitMaskImage:
                'linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.7) 30%, rgba(0,0,0,1) 100%)',
            }}
          />

          {/* 中央內容 */}
          <div
            className="absolute inset-0 flex flex-col items-center z-10"
            style={{ paddingTop: '110px', gap: '18px' }}
          >
            {/* AI KITCHEN 標題 */}
            <div className="text-center">
              <div
                className="flex items-center justify-center gap-3"
                style={{ color: 'rgba(255,255,255,0.88)' }}
              >
                {/* AI 部分 — 電路板風格 */}
                <span
                  style={{
                    fontFamily: '"Courier New", Courier, monospace',
                    fontSize: '72px',
                    fontWeight: 200,
                    letterSpacing: '0.05em',
                    lineHeight: 1,
                    /* 用文字陰影模擬電路板感 */
                    textShadow: '0 0 1px rgba(255,255,255,0.9)',
                  }}
                >
                  AI
                </span>

                {/* KITCHEN 用 SVG 畫邊框 */}
                <svg
                  viewBox="0 0 430 85"
                  style={{ height: '72px', overflow: 'visible' }}
                >
                  {/* 左上角括號 */}
                  <polyline
                    points="14,18 2,18 2,2"
                    fill="none"
                    stroke="rgba(255,255,255,0.78)"
                    strokeWidth="2.5"
                  />
                  {/* 右下角括號 */}
                  <polyline
                    points="416,67 428,67 428,83"
                    fill="none"
                    stroke="rgba(255,255,255,0.78)"
                    strokeWidth="2.5"
                  />
                  <text
                    x="215"
                    y="68"
                    textAnchor="middle"
                    fontFamily='"Courier New", Courier, monospace'
                    fontSize="64"
                    fontWeight="200"
                    fill="rgba(255,255,255,0.86)"
                    letterSpacing="8"
                  >
                    KITCHEN
                  </text>
                </svg>
              </div>

              {/* 副標題 */}
              <p
                className="mt-3 text-white/72"
                style={{ fontSize: '17px', letterSpacing: '0.28em' }}
              >
                突破未來格局，開啟廚房智高點
              </p>
            </div>

            {/* 播放按鈕 */}
            <button
              className="flex items-center justify-center rounded-full transition-all hover:scale-105"
              style={{
                width: '120px',
                height: '120px',
                background: 'rgba(18,26,38,0.62)',
                backdropFilter: 'blur(3px)',
                border: '1px solid rgba(255,255,255,0.15)',
                marginTop: '8px',
              }}
            >
              {/* 三角形 */}
              <div
                style={{
                  width: 0,
                  height: 0,
                  borderTop: '18px solid transparent',
                  borderBottom: '18px solid transparent',
                  borderLeft: '30px solid rgba(255,255,255,0.82)',
                  marginLeft: '8px',
                }}
              />
            </button>
          </div>
        </div>

        {/* ── 品牌 Logo 條 ── */}
        <div
          className="flex items-center justify-around px-8"
          style={{
            height: '52px',
            background: 'rgba(16,22,32,0.90)',
          }}
        >
          {brands.map((brand, i) => (
            <span
              key={i}
              className="text-white/45 text-sm font-light"
              style={{ letterSpacing: '0.22em' }}
            >
              {brand}
            </span>
          ))}
        </div>
      </div>
    </div>
  );
}
