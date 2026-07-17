import React, { useEffect, useRef } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { MarqueeBand } from './MarqueeBand';
import { Reveal } from '../motion/Reveal';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';
import { GOLD } from '../theme/cis'; // Antra 模板金（單一來源）

// 模板 home-6「Our Services」= antra-services-list style-3 服務輪播（照原始碼複刻）。
// ⚠ 6 筆服務內容與圖皆為模板佔位（圖＝demo 伺服器 service-N.jpg，已實測可載入；文案＝模板 dummy-data）。
//    正式上線請把 title/excerpt 換成 SAKURA 服務、img 下載到 public/ 本地化。
const SVC_IMG = 'https://demo2.themelexus.com/antra/wp-content/uploads/2025/06';
const SERVICES = [
  { n: '01', title: 'Residential Interior Design', excerpt: 'Tailored design services for private homes, including room makeovers and complete home transformations.', img: `${SVC_IMG}/service-6.jpg` },
  { n: '02', title: 'Renovation and Remodeling', excerpt: 'Overhauling existing spaces to modernize and improve functionality and aesthetics.', img: `${SVC_IMG}/service-2.jpg` },
  { n: '03', title: 'Interior 2D/3D Layouts', excerpt: 'Realistic 3D visualizations to help you envision your space before it is built in real life.', img: `${SVC_IMG}/service-1.jpg` },
  { n: '04', title: 'Outdoor & Landscape Design', excerpt: 'Extending design services to outdoor spaces such as gardens, patios, and decks.', img: `${SVC_IMG}/service-4.jpg` },
  { n: '05', title: 'Interior Design Consultation', excerpt: 'Providing professional advice on concepts, color schemes & material selection.', img: `${SVC_IMG}/service-3.jpg` },
  { n: '06', title: 'Commercial Interior Design', excerpt: 'Designing functional and attractive interiors for businesses, including offices, retail spaces, and hospitality venues.', img: `${SVC_IMG}/service-5.jpg` },
];
// 破圖 fallback（外連失效時退回本地廚房圖，不破版）
const SVC_FALLBACK = '/kitchen-styles/elegant.jpg';

export function ServicesSection() {
  // 模板輪播設定：3 欄、gap 30、loop、autoplay 5000、drag、hover 暫停（direction rtl 這裡以標準步進呈現同觀感）。
  const [emblaRef, emblaApi] = useEmblaCarousel({ loop: true, align: 'start' });
  const pausedRef = useRef(false);

  useEffect(() => {
    if (!emblaApi) return;
    const root = emblaApi.rootNode();
    const pause = () => { pausedRef.current = true; };
    const resume = () => { pausedRef.current = false; };
    root.addEventListener('mouseenter', pause);
    root.addEventListener('mouseleave', resume);
    // 自動輪播（模板 autoplay_speed 5000）；reduced-motion 不自動播、仍可手動拖曳。
    let timer: ReturnType<typeof setInterval> | undefined;
    if (!prefersReducedMotion()) {
      timer = setInterval(() => { if (!pausedRef.current) emblaApi.scrollNext(); }, 5000);
    }
    return () => {
      if (timer) clearInterval(timer);
      root.removeEventListener('mouseenter', pause);
      root.removeEventListener('mouseleave', resume);
    };
  }, [emblaApi]);

  return (
    <section className="relative bg-[#f6f6f6] pt-[125px] overflow-hidden">
      <div className="max-w-[1410px] mx-auto">
        {/* 標題列（模板 Our Services）：pill(左) + 大標(右 769)；兩個浮動裝飾箭頭（#e3e3e8） */}
        <Reveal anim="slideInUp" className="relative mb-[60px]">
          {/* 裝飾箭頭（模板 Our Services 兩個 absolute icon；形狀照模板路徑，色 #e3e3e8） */}
          <svg
            aria-hidden
            className="hidden lg:block absolute left-[474px] top-0 text-[#e3e3e8]"
            width="15" height="15" viewBox="0 0 15 15"
          >
            <path d="M15 15L3 11L0 11L12 15L15 15Z" fill="currentColor" />
          </svg>
          <svg
            aria-hidden
            className="hidden lg:block absolute left-[347px] top-[126px] text-[#e3e3e8]"
            width="15" height="15" viewBox="0 0 15 15"
          >
            <path d="M15 15L11 3L11 0L15 12L15 15Z" fill="currentColor" />
          </svg>

          <div className="flex items-start pt-[46px]">
            <div className="w-[424px] shrink-0">
              {/* subtitle 膠囊（模板 elementor-title-span，同 Hero eyebrow 款；金點） */}
              <span className="font-display inline-flex items-center gap-1.5 rounded-[24px] border border-[rgba(159,159,164,0.18)] pt-[7px] pr-[13px] pb-[6px] pl-[9px] text-[12px] tracking-[1px] uppercase text-[#1C1C1D]">
                <span className="inline-block w-1.5 h-1.5 rounded-full" style={{ background: GOLD }} />
                Our Services
              </span>
            </div>
            {/* 大標（模板：Explore Our [金]Comprehensive Interior Design[/金] Services；金色→CIS） */}
            <h2 className="font-display w-[769px] text-[60px] leading-[64px] capitalize text-[#1C1C1D]">
              Explore Our <span style={{ color: GOLD }}>Comprehensive Interior Design</span> Services
            </h2>
          </div>
        </Reveal>

        {/* 服務輪播（style-3）：3 欄 / gap 30 / loop / autoplay 5s / drag / hover 暫停 */}
        <Reveal anim="slideInUp">
          {/* Embla 視口；slide 間距用「container -ml-30 + slide pl-30」標準做法（不破 loop 量測） */}
          <div className="overflow-hidden cursor-grab active:cursor-grabbing" ref={emblaRef}>
            <div className="flex -ml-[30px]">
              {SERVICES.map((s, i) => {
                // 模板 nth-child(even)=column-reverse → 偶數卡（第2/4/6，i 為奇）字上圖下；奇數卡圖上字下。
                const captionTop = i % 2 === 1;
                return (
                  <div key={i} className="flex-[0_0_33.333%] min-w-0 pl-[30px]">
                    {/* service-block：padding 10（模板）；交替版式 */}
                    <div className={`group/svc p-[10px] flex flex-col ${captionTop ? 'flex-col-reverse' : ''}`}>
                      {/* service-top：圖 radius24 + overflow hidden；hover 圖 scale(1.1)；薄暗罩 0.11 */}
                      <div className="relative rounded-[24px] overflow-hidden aspect-[1410/1018]">
                        <img
                          src={s.img}
                          alt={s.title}
                          draggable={false}
                          onError={(e) => { if (!e.currentTarget.src.endsWith(SVC_FALLBACK)) e.currentTarget.src = SVC_FALLBACK; }}
                          className="w-full h-full object-cover transition-transform duration-300 ease-linear group-hover/svc:scale-110"
                        />
                        <span aria-hidden className="absolute inset-0 bg-black/[0.11]" />
                      </div>
                      {/* service-caption：padding 30/20/35（模板） */}
                      <div className="pt-[30px] px-[20px] pb-[35px]">
                        {/* content-box：標題左 / 編號右（items-start + justify-between） */}
                        <div className="flex items-start justify-between gap-3">
                          <h3 className="font-display text-[28px] leading-[35px] text-[#1C1C1D] line-clamp-2">
                            {s.title}
                          </h3>
                          {/* 編號：30px 灰（模板 --color-border #e3e3e8） */}
                          <span className="font-display text-[30px] leading-none text-[#e3e3e8] shrink-0">
                            {s.n}
                          </span>
                        </div>
                        {/* 副文：3 行截斷、右縮 70、距標題 23（模板 margin 23px 70px 0 0） */}
                        <p className="mt-[23px] mr-[70px] text-[#59585D] text-[16px] leading-[24px] line-clamp-3">
                          {s.excerpt}
                        </p>
                      </div>
                    </div>
                  </div>
                );
              })}
            </div>
          </div>
        </Reveal>
      </div>

      {/* 跑馬燈（沿用；模板 Our Services 區本身無，此為 SAKURA 既有裝飾，保留於區塊底部） */}
      <div className="mt-24">
        <MarqueeBand />
      </div>
    </section>
  );
}
