import React, { useState, useEffect, useCallback, useRef } from 'react';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import { Reveal, useReveal } from '../motion/Reveal';
import { useParallax } from '../motion/useParallax';

// 品牌金 = CIS 466c #C9AA79（單一來源）
import { GOLD } from '../theme/cis';

// 門市案例；輪播規則：背景 = 目前主圖(#1)，右邊兩張卡 = 下兩張(#2、#3)，前進時聯動輪替。
// 圖片來源：影像/門市案例 → public/store-cases/*.jpg
const CASES = [
  { image: '/store-cases/case1.jpg', caption: '袁艾菲與老公結婚二周年甜蜜獻禮' },
  { image: '/store-cases/case2.jpg', caption: '老宅廚房翻新，重拾生活溫度' }, // 佔位文案，待正式替換
  { image: '/store-cases/case3.jpg', caption: '量身打造，成就理想廚房' }, // 佔位文案，待正式替換
];

export function GallerySection() {
  const len = CASES.length;
  const sectionRef = useRef<HTMLElement>(null);
  // 全出血主圖隨捲動輕微位移（scale 留出血避免露邊）
  useParallax(sectionRef, { targets: '.gallery-bg', fromY: -8, toY: 8, scale: 1.12 });
  const [active, setActive] = useState(0);
  const [paused, setPaused] = useState(false);
  // 右卡欄進場：slideInUp 延 400（有拖曳 handler，故用 hook 不用 <Reveal> 包裹）
  const cardsRef = useReveal<HTMLDivElement>();

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

  // 右邊兩張卡 = 主圖之後的兩張（聯動輪替）：背景=#active、卡片=#active+1、#active+2
  const cards = [CASES[(active + 1) % len], CASES[(active + 2) % len]];

  return (
    // 全出血底圖(=當前主圖) + 右 2 卡；section 高度對位模板 956
    <section
      ref={sectionRef}
      className="relative overflow-hidden min-h-[956px]"
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
    >
      {/* 背景 = 目前主圖(#active)，交叉淡入 */}
      {CASES.map((c, i) => (
        <img
          key={i}
          src={c.image}
          alt=""
          className={`gallery-bg absolute inset-0 w-full h-full object-cover transition-opacity duration-700 ${
            i === active ? 'opacity-100' : 'opacity-0'
          }`}
        />
      ))}
      {/* 深色遮罩：整體壓深成模板沉穩深調 + 左側再深保文字可讀 */}
      <div
        className="absolute inset-0"
        style={{
          background:
            'linear-gradient(90deg, rgba(0,0,0,0.82) 0%, rgba(0,0,0,0.62) 45%, rgba(0,0,0,0.5) 100%)',
        }}
      />

      {/* 內容：左標題區 / 右卡欄各自 slideInUp 進場（stagger 200 / 400，同模板 Home Three） */}
      <div className="relative z-10 w-full">
        {/* 內容非置中：照模板 e-con-inner padding-top 推到下半部（內容從 y≈388 起） */}
        <div className="flex flex-col lg:flex-row lg:items-start gap-12 lg:gap-0 pt-[120px] lg:pt-[388px] pl-[51px] lg:pr-[51px]">
          {/* 左：標題區 slideInUp 延 200（照模板 L51/w479；膠囊 → 大標 → 段落 + CTA） */}
          <Reveal anim="slideInUp" delayMs={200} className="lg:w-[479px] lg:shrink-0 pr-4">
            {/* 副標膠囊（照模板 .elementor-title-span：border white/25、radius 24、padding 3/13/3/9、金點 + 15/ls1/uppercase） */}
            <div className="mb-[26px]">
              <span className="inline-flex items-center gap-2 rounded-[24px] border border-white/25 pt-[3px] pr-[13px] pb-[3px] pl-[9px]">
                <span className="inline-block w-2 h-2 rounded-full shrink-0" style={{ background: GOLD }} />
                <span className="text-white text-[15px] tracking-[1px] uppercase">門市案例</span>
              </span>
            </div>

            {/* 大標（模板 110/100、capitalize、粗體） */}
            <h2 className="font-display text-white capitalize text-[75px] leading-[80px]">
              Interior Design
            </h2>

            {/* 段落（模板 18/24、寬 378）：隨主圖聯動（當前案例標題） */}
            <p
              key={active}
              className="text-white/75 mt-[37px] w-[378px] max-w-full text-[18px] leading-[24px] animate-gallery-card"
            >
              {CASES[active].caption}
            </p>

            {/* CTA — 依主題原始碼 antra-elementor-button 真值：透明底/灰框、字 15px、
                圖示圈 40（箭頭 20）金底白箭頭、預設 rotate(-45°)；hover 整顆填金(bg+border) + 圖示轉正 rotate(0)。
                （模板底色淺→字深；本區深底故字用白，其餘尺寸/hover 完全一致。demo 站 root 20px 會放大成 18.75/45，勿量網頁。） */}
            <a
              href="#"
              className="group/cta inline-flex items-center gap-4 mt-[40px] rounded-full border border-[rgba(159,159,164,0.64)] pl-[30px] pr-[7px] py-[7px] text-white capitalize transition-colors duration-500 hover:border-[#C9AA79] hover:bg-[#C9AA79]"
            >
              <span className="text-[15px]">更多設計</span>
              <span
                className="inline-flex items-center justify-center w-[40px] h-[40px] rounded-full text-white transition-transform duration-500 -rotate-45 group-hover/cta:rotate-0"
                style={{ background: GOLD }}
              >
                <ArrowRight className="w-5 h-5" />
              </span>
            </a>
          </Reveal>

          {/* 右：2 張卡 slideInUp 延 400（含拖曳，故用 useReveal ref） */}
          <div
            ref={cardsRef}
            data-ev="slideInUp"
            style={{ animationDelay: '400ms' }}
            className="ev lg:flex-1 lg:min-w-0 flex justify-end select-none touch-pan-y mt-[53px]"
            onPointerDown={onPointerDown}
            onPointerUp={onPointerUp}
          >
            {/* 內層縮到卡片寬度並右對齊；箭頭在其內靠左 → 對齊卡片群左緣 */}
            <div>
            {/* 卡片沿用模板卡尺寸 330×360、圓角 24、gap 30；左側留白露出背景主圖 */}
            <div key={active} className="flex gap-[30px] animate-gallery-card">
              {cards.map((c, i) => (
                <div key={i} className="group/card shrink-0">
                  {/* hover：陰影加深 + 圖片微放大（overflow 裁切） */}
                  <div className="w-[330px] h-[360px] rounded-3xl overflow-hidden shadow-[0_24px_60px_-12px_rgba(0,0,0,0.55)] transition-shadow duration-500 group-hover/card:shadow-[0_32px_80px_-8px_rgba(0,0,0,0.7)]">
                    <img
                      src={c.image}
                      alt=""
                      draggable={false}
                      className="w-full h-full object-cover transition-transform duration-700 ease-out group-hover/card:scale-[1.06]"
                    />
                  </div>
                </div>
              ))}
            </div>

            {/* 箭頭：卡片下方、靠卡片群左緣 40px；42×42 圓框、透明底、白 icon */}
            <div className="flex items-center gap-5 mt-[40px]">
              <button
                onClick={prev}
                aria-label="上一張"
                className="w-[42px] h-[42px] rounded-full border border-white/25 bg-transparent text-white/90 flex items-center justify-center hover:border-white hover:bg-white/10 transition-colors"
              >
                <ArrowLeft className="w-[18px] h-[18px]" />
              </button>
              <button
                onClick={next}
                aria-label="下一張"
                className="w-[42px] h-[42px] rounded-full border border-white/25 bg-transparent text-white/90 flex items-center justify-center hover:border-white hover:bg-white/10 transition-colors"
              >
                <ArrowRight className="w-[18px] h-[18px]" />
              </button>
            </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
