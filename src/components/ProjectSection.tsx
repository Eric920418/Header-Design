import React, { useEffect, useRef, useState } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { ArrowLeft, ArrowRight } from 'lucide-react';
import { useReveal } from '../motion/Reveal';
import { KITCHEN_STYLES } from '../data/kitchenStyles';

export function ProjectSection() {
  // 一格一格步進輪播：吸附(snap)模式——刻意「不用 dragFree」。
  // dragFree 會讓 scrollNext 變慣性滑動、在 loop 環繞重定位時對不齊而露縫；
  // snap 模式每次精準走一格、於乾淨的卡邊界重定位，既是「一格一格」又不露縫。
  const [emblaRef, emblaApi] = useEmblaCarousel({ loop: true, align: 'start' });
  // 拖曳中暫停 hover 變寬（否則卡片一碰就展開、拖曳會被打斷）
  const [dragging, setDragging] = useState(false);
  const pausedRef = useRef(false);

  // section 進場淡入上升。
  // ※ 已移除照片視差(useParallax)：視差給每張照片獨立 transform→GPU 獨立圖層，
  //   輪播移動時相鄰圖層在環繞接縫對不齊而露縫（「照片才會、到點才合併」）。移除後照片與軌道同層、無縫。
  const sectionRef = useReveal<HTMLElement>();

  useEffect(() => {
    if (!emblaApi) return;
    const onDown = () => setDragging(true);
    const onUp = () => setDragging(false);
    emblaApi.on('pointerDown', onDown);
    emblaApi.on('pointerUp', onUp);

    // 自動輪播：依最新需求由每 3.5s 加快為 2.8s 前進一格；滑鼠移入暫停。
    const root = emblaApi.rootNode();
    const tick = () => { if (!pausedRef.current) emblaApi.scrollNext(); };
    const timer = setInterval(tick, 2800);
    // 延遲 560ms 恢復：hover 卡片的 500ms 展開/收回動畫期間輪播保持停住，
    // 避免「寬度還在變、輪播就移動」導致迴圈總長過期而露縫。
    let resumeTimer: ReturnType<typeof setTimeout> | undefined;
    const pause = () => { if (resumeTimer) { clearTimeout(resumeTimer); resumeTimer = undefined; } pausedRef.current = true; };
    const resume = () => { if (resumeTimer) clearTimeout(resumeTimer); resumeTimer = setTimeout(() => { pausedRef.current = false; }, 560); };
    root.addEventListener('mouseenter', pause);
    root.addEventListener('mouseleave', resume);

    return () => {
      clearInterval(timer);
      if (resumeTimer) clearTimeout(resumeTimer);
      emblaApi.off('pointerDown', onDown);
      emblaApi.off('pointerUp', onUp);
      root.removeEventListener('mouseenter', pause);
      root.removeEventListener('mouseleave', resume);
    };
  }, [emblaApi]);

  return (
    <section id="kitchen-series" ref={sectionRef} data-ev="slideInUp" className="ev relative z-10 bg-[#f6f6f6]">
      {/* bg 深色：作為次像素髮絲縫的保險——即使卡間偶有 <1px 縫，透出的是深色(近卡片暗部)而非亮背景，肉眼難察 */}
      <div className="overflow-hidden cursor-grab active:cursor-grabbing bg-[#1C1C1D]" ref={emblaRef}>
        <div className="flex">
          {/* 卡片複製兩份(10→20)：給 Embla loop 足夠緩衝，避免捲動動畫中接縫來不及補齊而露縫 */}
          {[...KITCHEN_STYLES, ...KITCHEN_STYLES].map((s, i) => (
            <div
              key={i}
              className={`group shrink-0 transition-[width] duration-500 ease-out
                w-[280px] md:w-[340px] lg:w-[378px]
                ${dragging ? '' : 'hover:w-[420px] md:hover:w-[510px] lg:hover:w-[567px]'}`}
            >
              {/* 固定高度、hover 變寬（伸縮）+ 底部漸層 + 左上膠囊 + 英中標。
                  w-[calc(100%+2px)] + -ml-px：內容比卡槽左右各寬 1px（共 +2px），
                  接縫「兩側」都被相鄰卡內容蓋住 → 軌道以小數 transform 位移(如 -3004.36)時，
                  不論往左往右移，卡間都不露出次像素髮絲縫（背景 #f6f6f6 透出）。
                  卡槽(.group)仍是 378，Embla 量測/迴圈總長不受影響。 */}
              <article className="relative overflow-hidden w-[calc(100%+2px)] -ml-px h-[480px] md:h-[640px] lg:h-[880px]">
                <img
                  src={s.image}
                  alt={s.zh ? `${s.en} ${s.zh}` : s.en}
                  draggable={false}
                  className="project-parallax-img absolute inset-0 w-full h-full object-cover object-center"
                />

                {/* 底部黑色漸層 scrim */}
                <div
                  className="absolute inset-x-0 bottom-0 h-2/5 z-[1] pointer-events-none"
                  style={{
                    background:
                      'linear-gradient(rgba(0,0,0,0) 0%, rgba(0,0,0,0.64) 30%, rgba(0,0,0,1) 100%)',
                  }}
                />

                {/* 左上膠囊：英文系列名。 */}
                {s.en && (
                  <span className="absolute top-8 left-8 z-[2] inline-block rounded-full border border-white/50 text-white text-[16px] font-bold px-4 py-1.5 backdrop-blur-sm">
                    {s.en}
                  </span>
                )}

                {/* 底部：中文大標（hover 轉模板金）+ 描述（hover 由下淡入浮現） */}
                <div className="absolute inset-x-0 bottom-0 z-[2] px-8 pb-9">
                  <h3 className="w-fit font-display text-white text-[36px] leading-[44px] transition-colors duration-300 hover:text-[#CAA05C]">
                    {s.zh}
                  </h3>
                  {s.desc && (
                    <p className="text-white/90 text-[16px] leading-[24px] max-h-0 opacity-0 overflow-hidden group-hover:max-h-20 group-hover:opacity-100 group-hover:mt-2.5 transition-all duration-500 ease-out">
                      {s.desc}
                    </p>
                  )}
                </div>
              </article>
            </div>
          ))}
        </div>
      </div>

      {/* 左右兩側方向箭頭 — 依主題原始碼 antra swiper button（style.css 13949）：
          48×48 白圓 + 1px 邊框 + icon 24；hover 模板金底、白箭頭。
          Embla 的 prev/next 指的是索引而非軌道視覺方向，因此依箭頭視覺互換呼叫。 */}
      <button
        onClick={() => emblaApi?.scrollNext()}
        aria-label="向左瀏覽"
        className="absolute left-[30px] top-1/2 -translate-y-1/2 z-20 w-12 h-12 rounded-full border border-white/30 bg-white/10 backdrop-blur-md text-white flex items-center justify-center transition-colors duration-300 hover:bg-[#CAA05C] hover:border-[#CAA05C] hover:text-white"
      >
        <ArrowLeft className="w-6 h-6" />
      </button>
      <button
        onClick={() => emblaApi?.scrollPrev()}
        aria-label="向右瀏覽"
        className="absolute right-[30px] top-1/2 -translate-y-1/2 z-20 w-12 h-12 rounded-full border border-white/30 bg-white/10 backdrop-blur-md text-white flex items-center justify-center transition-colors duration-300 hover:bg-[#CAA05C] hover:border-[#CAA05C] hover:text-white"
      >
        <ArrowRight className="w-6 h-6" />
      </button>
    </section>
  );
}
