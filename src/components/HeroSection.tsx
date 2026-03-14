import React, { useState } from 'react';
import { Facebook, Youtube } from 'lucide-react';

const KITCHEN_BG =
  'https://images.unsplash.com/photo-1610177534644-34d881503b83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4Mzc2MTc3fDA&ixlib=rb-4.1.0&q=80&w=1600';

const IMGS = {
  topL:
    'https://images.unsplash.com/photo-1639405069836-f82aa6dcb900?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxsdXh1cnklMjBraXRjaGVuJTIwZGVzaWdufGVufDF8fHx8MTc2ODQwMzI2MHww&ixlib=rb-4.1.0&q=80&w=1080',
  topR:
    'https://images.unsplash.com/photo-1610177534644-34d881503b83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4Mzc2MTc3fDA&ixlib=rb-4.1.0&q=80&w=1080',
  t1: 'https://images.unsplash.com/photo-1610177534644-34d881503b83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtb2Rlcm4lMjBraXRjaGVuJTIwaW50ZXJpb3J8ZW58MXx8fHwxNzY4Mzc2MTc3fDA&ixlib=rb-4.1.0&q=80&w=600',
  t2: 'https://images.unsplash.com/photo-1592839656073-833413ae8874?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjb250ZW1wb3JhcnklMjBraXRjaGVuJTIwZGluaW5nfGVufDF8fHx8MTc2ODQ1NTczNHww&ixlib=rb-4.1.0&q=80&w=600',
  t3: 'https://images.unsplash.com/photo-1585128833500-ec98262cb4f5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxtaW5pbWFsaXN0JTIwa2l0Y2hlbnxlbnwxfHx8fDE3NjgzNDM1OTF8MA&ixlib=rb-4.1.0&q=80&w=600',
};

const DOTS = 5;

export function HeroSection() {
  const [current, setCurrent] = useState(0);
  const brands = ['SAKURA', 'TLA', 'TEKA', 'svago', '---'];

  return (
    <div className="flex">
      {/* ── 左側邊欄：跨越 Hero + Gallery ── */}
      <aside
        className="hidden lg:flex flex-col bg-white shrink-0 gap-[60px]"
        style={{ width: "350px", padding: "36px 0 0 100px" }}
      >
        <nav className="flex flex-col gap-7">
          {["Home", "Stores", "Product", "Appliances"].map((item) => (
            <a
              key={item}
              href="#"
              className="text-gray-700 text-[15px] hover:text-[#C4A574] transition-colors"
            >
              {item}
            </a>
          ))}
        </nav>

        <div>
          <hr className="border-gray-200 mb-7" />
          <div className="text-gray-600 text-sm leading-relaxed">
            <div>Franchise</div>
            <div className="font-medium text-gray-800">SAKURA KITCHEN</div>
          </div>
        </div>

        {/* 灰色方塊：grow 填滿剩餘高度（Hero + Gallery 全部） */}
        <div
          className="flex flex-col items-start gap-[30px] bg-gray-100 py-[60px]"
          style={{ height: "350px", width: "100%" }}
        >
          <a
            href="#"
            className="text-gray-400 hover:text-gray-600 transition-colors ps-[20px]"
          >
            <Facebook size={36} />
          </a>
          <a
            href="#"
            className="text-gray-400 hover:text-gray-600 transition-colors ps-[20px]"
          >
            <Youtube size={42} />
          </a>
        </div>
      </aside>

      {/* ── 右側：Hero + Gallery 全部內容 ── */}
      <div className="flex-1 min-w-0">
        {/* Hero Banner */}
        <div
          className="relative overflow-hidden"
          style={{
            height: "590px",
            background:
              "linear-gradient(180deg, #b2c4d4 0%, #bccbd8 18%, #c6d2db 38%, #cfd8e1 58%, #d8e2ea 76%, #dce5ec 88%, #d4dfe9 100%)",
          }}
        >
          <img
            src={KITCHEN_BG}
            alt="AI Kitchen Products"
            className="absolute bottom-0 left-0 w-full"
            style={{
              height: "68%",
              objectFit: "cover",
              objectPosition: "center top",
              opacity: 0.88,
              mixBlendMode: "multiply",
              maskImage:
                "linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.7) 30%, rgba(0,0,0,1) 100%)",
              WebkitMaskImage:
                "linear-gradient(to bottom, transparent 0%, rgba(0,0,0,0.7) 30%, rgba(0,0,0,1) 100%)",
            }}
          />

          <div
            className="absolute inset-0 flex flex-col items-center z-10"
            style={{ paddingTop: "110px", gap: "18px" }}
          >
            <div className="text-center">
              <div
                className="flex items-center justify-center gap-3"
                style={{ color: "rgba(255,255,255,0.88)" }}
              >
                <span
                  style={{
                    fontFamily: '"Courier New", Courier, monospace',
                    fontSize: "72px",
                    fontWeight: 200,
                    letterSpacing: "0.05em",
                    lineHeight: 1,
                    textShadow: "0 0 1px rgba(255,255,255,0.9)",
                  }}
                >
                  AI
                </span>

                <svg
                  viewBox="0 0 430 85"
                  style={{ height: "72px", overflow: "visible" }}
                >
                  <polyline
                    points="14,18 2,18 2,2"
                    fill="none"
                    stroke="rgba(255,255,255,0.78)"
                    strokeWidth="2.5"
                  />
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

              <p
                className="mt-3 text-white/72"
                style={{ fontSize: "17px", letterSpacing: "0.28em" }}
              >
                突破未來格局，開啟廚房智高點
              </p>
            </div>

            <button
              className="flex items-center justify-center rounded-full transition-all hover:scale-105"
              style={{
                width: "120px",
                height: "120px",
                background: "rgba(18,26,38,0.62)",
                backdropFilter: "blur(3px)",
                border: "1px solid rgba(255,255,255,0.15)",
                marginTop: "8px",
              }}
            >
              <div
                style={{
                  width: 0,
                  height: 0,
                  borderTop: "18px solid transparent",
                  borderBottom: "18px solid transparent",
                  borderLeft: "30px solid rgba(255,255,255,0.82)",
                  marginLeft: "8px",
                }}
              />
            </button>
          </div>
        </div>

        {/* 品牌 Logo 條 */}
        <div
          className="flex items-center justify-around px-8"
          style={{ height: "52px", background: "rgba(16,22,32,0.90)" }}
        >
          {brands.map((brand, i) => (
            <span
              key={i}
              className="text-white/45 text-sm font-light"
              style={{ letterSpacing: "0.22em" }}
            >
              {brand}
            </span>
          ))}
        </div>

        {/* Gallery 上方：兩張廚房圖 */}
        <div className="hidden lg:flex relative" style={{ height: "450px" }}>
          {/* 上半段背景 */}
          <div
            className="bg-gray-100"
            style={{
              position: "absolute",
              top: 0,
              left: 0,
              width: "80%",
              height: "25%",
              zIndex: 0,
            }}
          />

          {/* 圖片層 */}
          <div
            className="flex-1 overflow-hidden w-full flex justify-center"
            style={{ position: "relative", zIndex: 0 }}
          >
            <img
              src={IMGS.topL}
              alt="Kitchen Design"
              className="h-full object-cover"
              width={800}
            />
          </div>
        </div>

        {/* Gallery 下方：縮圖 × 3 ＋ 搜尋廚電 ＋ 分頁點 */}
        <div
          className="absolute left-0 top-[1130px] flex  justify-between items-center"
          style={{
            paddingLeft: "8%",
            paddingRight: "3%",
            paddingTop: "36px",
            paddingBottom: "48px",
            background: "#fff",
            width: "75%",
          }}
        >
          <div className="flex gap-5 flex-1 mr-6">
            {[IMGS.t1, IMGS.t2, IMGS.t3].map((src, i) => (
              <button
                key={i}
                onClick={() => setCurrent(i)}
                className="flex-1 overflow-hidden"
                style={{ height: "175px" }}
              >
                <img
                  src={src}
                  alt={`Slide ${i + 1}`}
                  className="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                />
              </button>
            ))}
          </div>

          <div
            className="shrink-0 flex flex-col items-center gap-7"
            style={{ width: "22%" }}
          >
            <button
              style={{
                border: "1px solid rgba(120,120,120,0.65)",
                padding: "14px 28px",
                letterSpacing: "0.32em",
                color: "#888",
                fontSize: "13px",
                background: "transparent",
                whiteSpace: "nowrap",
              }}
              className="hover:bg-gray-50 transition-colors"
            >
              搜 尋 廚 電
            </button>

            <div className="flex items-center gap-[10px]">
              {Array.from({ length: DOTS }).map((_, i) => (
                <button
                  key={i}
                  onClick={() => setCurrent(i)}
                  style={{
                    borderRadius: "50%",
                    width: i === current ? "11px" : "8px",
                    height: i === current ? "11px" : "8px",
                    background: i === current ? "#444" : "#bbb",
                    transition: "all 0.2s",
                    flexShrink: 0,
                  }}
                />
              ))}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
