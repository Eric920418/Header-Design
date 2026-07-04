import React, { useState, useEffect, useCallback, useRef } from 'react';
import { ArrowUpRight } from 'lucide-react';

// 品牌重點金（沿用原站色）
const GOLD = '#C4A574';

// 門市案例（背景=主圖(#1)，右邊 2 張卡=(#2,#3)，聯動輪替）
// 圖片來源：影像/門市案例 → public/store-cases/*.jpg
const CASES = [
  { image: '/store-cases/case1.jpg', caption: '案例1：袁艾菲與老公結婚二周年甜蜜獻禮' },
  { image: '/store-cases/case2.jpg', caption: '案例2：老宅廚房翻新，重拾生活溫度' }, // 佔位文案，待正式替換
  { image: '/store-cases/case3.jpg', caption: '案例3：量身打造，成就理想廚房' }, // 佔位文案，待正式替換
];

export function GallerySection() {
  const len = CASES.length;
  const [active, setActive] = useState(0);
  const [paused, setPaused] = useState(false);

  const next = useCallback(() => setActive((a) => (a + 1) % len), [len]);
  const prev = useCallback(() => setActive((a) => (a - 1 + len) % len), [len]);

  // 自動播放（每 4s，滑鼠移入暫停）
  useEffect(() => {
    if (paused) return;
    const id = setInterval(() => setActive((a) => (a + 1) % len), 4000);
    return () => clearInterval(id);
  }, [paused, len]);

  // 拖曳/滑動切換
  const dragX = useRef<number | null>(null);
  const onPointerDown = (e: React.PointerEvent) => {
    dragX.current = e.clientX;
  };
  const onPointerUp = (e: React.PointerEvent) => {
    if (dragX.current == null) return;
    const dx = e.clientX - dragX.current;
    if (dx < -40) next();
    else if (dx > 40) prev();
    dragX.current = null;
  };

  // 右邊兩張卡 = 主圖之後的兩張
  const cards = [CASES[(active + 1) % len], CASES[(active + 2) % len]];

  return (
    <section
      className="relative overflow-hidden"
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
    >
      {/* 背景 = 主圖(#1)，交叉淡入 */}
      {CASES.map((c, i) => (
        <img
          key={i}
          src={c.image}
          alt=""
          className={`absolute inset-0 w-full h-full object-cover transition-opacity duration-700 ${
            i === active ? 'opacity-100' : 'opacity-0'
          }`}
        />
      ))}
      <div
        className="absolute inset-0"
        style={{
          background:
            'linear-gradient(90deg, rgba(12,12,14,0.76) 0%, rgba(12,12,14,0.48) 42%, rgba(12,12,14,0.26) 100%)',
        }}
      />

      {/* 內容：左文字 + 右 2 卡（中下） */}
      {/* 間距依模板實測（Home 3 antra-image-carousel）：pt 133 / pb 138、左緣對齊 1410 版心（51px） */}
      <div className="relative z-10 pt-[133px] pb-[138px]">
        <div className="flex flex-col lg:flex-row lg:items-center gap-12 pl-[51px]">
          {/* 左：標題區 */}
          <div className="lg:w-[440px] lg:shrink-0 pr-4">
            <div className="flex items-center gap-2.5 mb-5">
              <span className="inline-block w-1.5 h-1.5 rounded-full" style={{ background: GOLD }} />
              <span className="text-white/80 text-[15px] tracking-[0.2em] uppercase">門市案例</span>
            </div>
            <h2 className="text-white font-bold capitalize text-[75px] leading-[80px]">
              Kitchen Design
            </h2>

            {/* 說明文字：隨主圖聯動（案例標題） */}
            <p key={active} className="text-white/75 mt-6 max-w-sm leading-relaxed animate-gallery-card">
              {CASES[active].caption}
            </p>

            {/* CTA 按鈕（深底版：白字白框 + 金色圓箭頭） */}
            <a
              href="#"
              className="group inline-flex items-center gap-4 mt-8 rounded-full border border-white/30 pl-[30px] pr-[9px] py-[8px] text-white hover:border-[#C4A574] transition-colors"
            >
              <span className="text-[19px] tracking-wide">查看所有案例</span>
              <span
                className="inline-flex items-center justify-center w-[47px] h-[47px] rounded-full text-white transition-transform group-hover:rotate-45"
                style={{ background: GOLD }}
              >
                <ArrowUpRight className="w-5 h-5" />
              </span>
            </a>

            {/* 上/下一張箭頭 */}
            <div className="flex items-center gap-3 mt-8">
              <button
                onClick={prev}
                aria-label="上一張"
                className="w-11 h-11 rounded-full border border-white/25 text-white/90 flex items-center justify-center hover:border-white hover:bg-white/10 transition-colors"
              >
                ←
              </button>
              <button
                onClick={next}
                aria-label="下一張"
                className="w-11 h-11 rounded-full border border-white/25 text-white/90 flex items-center justify-center hover:border-white hover:bg-white/10 transition-colors"
              >
                →
              </button>
            </div>
          </div>

          {/* 右：2 張大卡（#2,#3），隨主圖聯動輪替 */}
          <div
            className="lg:flex-1 lg:min-w-0 select-none touch-pan-y"
            onPointerDown={onPointerDown}
            onPointerUp={onPointerUp}
          >
            {/* 卡片依模板實測 450×610（aspect 45/61）、間距 30 */}
            <div key={active} className="flex gap-[30px] animate-gallery-card">
              {cards.map((c, i) => (
                <div
                  key={i}
                  className="shrink-0 basis-[450px]"
                >
                  <div className="aspect-[45/61] rounded-3xl overflow-hidden">
                    <img
                      src={c.image}
                      alt=""
                      draggable={false}
                      className="w-full h-full object-cover"
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
