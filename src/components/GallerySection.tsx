import React, { useState, useEffect, useCallback, useRef } from 'react';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import { Reveal, useReveal } from '../motion/Reveal';
import { useParallax } from '../motion/useParallax';

// 全區顏色使用 Antra 模板色盤（單一來源）。
import { GOLD } from '../theme/cis';

// 門市案例；輪播規則：背景 = 目前主圖(#1)，右邊兩張卡 = 下兩張(#2、#3)，前進時聯動輪替。
// 圖片來源：首頁用圖_2026.07.21/影像/門市案例 → public/home-2026/gallery/*.jpg
const CASES = [
  { image: '/home-2026/gallery/yuan-aifei.jpg' },
  { image: '/home-2026/gallery/old-house-kitchen.jpg' },
  { image: '/home-2026/gallery/custom-kitchen.jpg' },
];

// Antra Home Three「Our Gallery」原始段落；文字與既有輪播互動維持不變。
const GALLERY_DESCRIPTION =
  'Lorem ipsum dolor sit amet consectetur. Magna nunc porttitor convallis faucibus laoreet.';

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
  const cards = [1, 2].map((offset) => {
    const caseIndex = (active + offset) % len;
    return { ...CASES[caseIndex], caseIndex };
  });

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

            {/* 大標：Home Three 原始響應式字級 desktop 110/100、tablet-extra 76/90、tablet 42、mobile 40/45。 */}
            <h2 className="font-display text-white capitalize text-[40px] leading-[45px] md:text-[42px] md:leading-[50px] lg:text-[76px] lg:leading-[90px] antra:text-[110px] antra:leading-[100px]">
              Interior design
            </h2>

            {/* 段落：Home Three 原始文案、白色、18/24、寬 378。 */}
            <p className="text-white mt-[37px] w-[378px] max-w-full text-[18px] leading-[24px]">
              {GALLERY_DESCRIPTION}
            </p>

            {/* CTA — 依主題原始碼 antra-elementor-button 真值：透明底/灰框、字 15px、
                圖示圈 40（箭頭 20）金底白箭頭、預設 rotate(-45°)；hover 整顆填金(bg+border) + 圖示轉正 rotate(0)。
                （模板底色淺→字深；本區深底故字用白，其餘尺寸/hover 完全一致。demo 站 root 20px 會放大成 18.75/45，勿量網頁。） */}
            <a
              href="#"
              className="site-content-cta group/cta mt-[40px] inline-flex h-[60px] shrink-0 items-center gap-[8px] whitespace-nowrap rounded-full border border-[rgba(159,159,164,0.64)] py-[9px] pl-[30px] pr-[9px] text-white capitalize transition-colors duration-500 hover:border-[#CAA05C] hover:bg-[#CAA05C]"
            >
              <span className="text-[15px] leading-[22px]">更多設計</span>
              <span
                className="site-cta-icon inline-flex h-[40px] w-[40px] shrink-0 items-center justify-center rounded-full text-white transition-transform duration-500 -rotate-45 group-hover/cta:rotate-0"
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
            className="gallery-case-row ev flex select-none justify-end touch-pan-y lg:min-w-0 lg:flex-1"
            onPointerDown={onPointerDown}
            onPointerUp={onPointerUp}
          >
            {/* 左側控制區 + 右側縮圖區：箭頭在剩餘空間水平置中，縮圖維持靠右。 */}
            <div className="gallery-case-layout flex w-full flex-col items-center lg:grid lg:grid-cols-[minmax(104px,1fr)_auto] lg:items-end">
            {/* 縮圖放大；點擊任一張即可直接切換成背景主案例。 */}
            <div key={active} className="order-1 flex gap-[20px] animate-gallery-card lg:order-2 lg:col-start-2 antra:gap-[30px]">
              {cards.map((c) => (
                <button
                  key={c.caseIndex}
                  type="button"
                  onClick={() => setActive(c.caseIndex)}
                  aria-label={`切換至門市案例 ${c.caseIndex + 1}`}
                  className="group/card shrink-0 rounded-3xl text-left focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-white"
                >
                  {/* hover：陰影加深 + 圖片微放大（overflow 裁切） */}
                  <div
                    data-gallery-card
                    className="gallery-case-card aspect-square overflow-hidden rounded-3xl shadow-[0_24px_60px_-12px_rgba(0,0,0,0.55)] transition-shadow duration-500 group-hover/card:shadow-[0_32px_80px_-8px_rgba(0,0,0,0.7)]"
                  >
                    <img
                      src={c.image}
                      alt=""
                      draggable={false}
                      className="w-full h-full object-cover transition-transform duration-700 ease-out group-hover/card:scale-[1.06]"
                    />
                  </div>
                </button>
              ))}
            </div>

            </div>
          </div>
        </div>

        {/* 箭頭必須是 Section 內容層的直接子元素，不能留在右側 Grid 裡；
            否則 absolute left:50% 會以 Grid 為參考而壓到第一張卡片後面。 */}
        <div data-gallery-controls className="gallery-case-controls mt-[30px] flex items-center justify-center gap-5 lg:mt-0">
          <button
            onClick={prev}
            aria-label="上一張"
            className="w-[42px] h-[42px] rounded-full border border-white/25 bg-black/20 text-white flex items-center justify-center backdrop-blur-sm hover:border-white hover:bg-black/35 transition-colors"
          >
            <ArrowLeft className="w-[18px] h-[18px]" />
          </button>
          <button
            onClick={next}
            aria-label="下一張"
            className="w-[42px] h-[42px] rounded-full border border-white/25 bg-black/20 text-white flex items-center justify-center backdrop-blur-sm hover:border-white hover:bg-black/35 transition-colors"
          >
            <ArrowRight className="w-[18px] h-[18px]" />
          </button>
        </div>
      </div>
    </section>
  );
}
