import React, { useEffect, useRef } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { MarqueeBand } from './MarqueeBand';
import { Reveal } from '../motion/Reveal';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';
import { GOLD } from '../theme/cis';

// Antra home-6「Our Services」= antra-services-list style-3。
// 依使用者指示僅保留已替換品牌素材的三張卡片；圖片已本地化，避免 demo 外連失效造成視覺漂移。
const SERVICES = [
  { n: '01', title: 'Outdoor & Landscape Design', excerpt: 'Extending design services to outdoor spaces such as gardens, patios, and decks.', img: '/services/sakura-product.png', logo: '/services/sakura-logo-white.png', logoAlt: 'SAKURA', logoClass: 'h-[24px] w-auto sm:h-[26px] antra:h-[28px]', captionTop: false },
  { n: '02', title: 'Renovation and Remodeling', excerpt: 'Overhauling existing spaces to modernize and improve functionality and aesthetics.', img: '/services/svago-product.png', logo: '/services/svago-logo-white.png', logoAlt: 'SVAGO', logoClass: 'h-[31px] w-auto sm:h-[35px] antra:h-[38px]', captionTop: true },
  { n: '03', title: 'Interior 2D/3D Layouts', excerpt: 'Realistic 3D visualizations to help you envision your space before it is built in real life.', img: '/services/teka-product.png', logo: '/services/teka-logo-white.svg', logoAlt: 'TEKA', logoClass: 'h-[32px] w-auto sm:h-[36px] antra:h-[39px]', captionTop: false },
];
const SVC_FALLBACK = '/kitchen-styles/elegant.jpg';

export function ServicesSection() {
  const [emblaRef, emblaApi] = useEmblaCarousel({ loop: true, align: 'start' });
  const pausedRef = useRef(false);

  useEffect(() => {
    if (!emblaApi) return;
    const root = emblaApi.rootNode();
    const pause = () => { pausedRef.current = true; };
    const resume = () => { pausedRef.current = false; };
    root.addEventListener('mouseenter', pause);
    root.addEventListener('mouseleave', resume);

    let timer: ReturnType<typeof setInterval> | undefined;
    if (!prefersReducedMotion()) {
      timer = setInterval(() => {
        if (!pausedRef.current) emblaApi.scrollNext();
      }, 4000);
    }

    return () => {
      if (timer) clearInterval(timer);
      root.removeEventListener('mouseenter', pause);
      root.removeEventListener('mouseleave', resume);
    };
  }, [emblaApi]);

  return (
    <section
      aria-labelledby="services-heading"
      className="relative overflow-hidden bg-cover bg-top bg-no-repeat px-[15px] pt-[60px] min-[768px]:px-[30px] min-[768px]:pt-[80px] min-[1025px]:pt-[100px] min-[1201px]:pt-[125px]"
      style={{
        backgroundImage: "url('/services/h6-bg-2.jpg')",
        backdropFilter: 'blur(29px)',
      }}
    >
        {/* Page 6 原生背景：黑色 76% overlay；29px backdrop-filter 掛在 section selector，而非模糊背景圖。 */}
        <div aria-hidden className="absolute inset-0 bg-black/[0.76]" />

        <div className="relative z-10 mx-auto max-w-[1410px]">
          <Reveal anim="slideInUp" className="relative mx-auto mb-[30px] max-w-[1083px] min-[768px]:mb-[60px]">
            {/* Page 6 不是單獨的 15px 圖示：Elementor 用 border 拉出長線，再把原版 SVG 尖端接在線尾。 */}
            <div
              aria-hidden
              className="absolute left-0 top-0 hidden h-[15px] w-[502px] border-b border-white/[0.18] min-[881px]:block"
            >
              <img
                src="/services/deco-horizontal.svg"
                alt=""
                className="absolute bottom-[-1px] right-0 h-[15px] w-[15px] invert opacity-[0.18]"
              />
            </div>
            <div
              aria-hidden
              className="absolute left-[345px] top-0 hidden h-[179px] w-[15px] border-r border-white/[0.18] min-[881px]:block"
            >
              <img
                src="/services/deco-vertical.svg"
                alt=""
                className="absolute bottom-0 right-[-1px] h-[15px] w-[15px] invert opacity-[0.18]"
              />
            </div>

            <div className="flex flex-col items-center gap-[15px] text-center min-[768px]:gap-[30px] min-[768px]:pt-[38px] min-[881px]:flex-row min-[881px]:items-start min-[881px]:gap-0 min-[881px]:text-left">
              <div className="min-[881px]:w-[30%] min-[881px]:shrink-0 min-[881px]:pt-[8px]">
                <span className="inline-flex items-center gap-1.5 rounded-[24px] border border-white/[0.18] pb-[6px] pl-[9px] pr-[13px] pt-[7px] font-display text-[12px] uppercase leading-[14px] tracking-[1px] text-white">
                  <span className="inline-block h-1.5 w-1.5 rounded-full" style={{ background: GOLD }} />
                  廚房產品
                </span>
              </div>

              <h2
                id="services-heading"
                className="w-full max-w-[769px] font-display text-[30px] capitalize leading-[35px] text-white min-[768px]:text-[45px] min-[768px]:leading-[50px] min-[881px]:w-[70%] min-[881px]:text-[60px] min-[881px]:leading-[64px]"
              >
                Explore Our <span style={{ color: GOLD }}>Comprehensive Interior Design</span> Services
              </h2>
            </div>
          </Reveal>

          <Reveal anim="slideInUp">
            <div className="cursor-grab overflow-hidden active:cursor-grabbing" ref={emblaRef}>
              <div className="-ml-[30px] flex">
                {SERVICES.map((service) => {
                  const captionTop = service.captionTop;

                  return (
                    <div
                      key={service.n}
                      className="min-w-0 flex-[0_0_100%] pl-[30px] min-[768px]:flex-[0_0_50%] min-[1201px]:flex-[0_0_33.333%]"
                    >
                      <article
                        className={`group/svc flex flex-col overflow-hidden rounded-[24px] bg-white p-[10px] ${captionTop ? 'min-[569px]:flex-col-reverse' : ''}`}
                      >
                        <div className="relative h-[250px] overflow-hidden rounded-[24px] md:h-[310px]">
                          <img
                            src={service.img}
                            alt={service.title}
                            draggable={false}
                            onError={(event) => {
                              if (!event.currentTarget.src.endsWith(SVC_FALLBACK)) {
                                event.currentTarget.src = SVC_FALLBACK;
                              }
                            }}
                            className="h-full w-full object-cover transition-transform duration-300 ease-linear group-hover/svc:scale-110"
                          />
                          <span aria-hidden className="absolute inset-0 bg-black/[0.11]" />
                        </div>

                        <div className="services-card-caption px-0 pb-[30px] pt-[20px] min-[768px]:px-[20px] min-[768px]:pb-[35px] min-[768px]:pt-[30px]">
                          <div className="flex items-start justify-between">
                            {service.logo ? (
                              <h3
                                aria-label={service.logoAlt ?? service.title}
                                className="mr-[30px] flex flex-1 items-center min-[768px]:mr-[10px] min-[881px]:mr-[30px] min-[1201px]:mr-[80px]"
                              >
                                {/* 原圖為白色；此處標題區為白底，依原 h3 深色視覺呈現以避免 logo 消失。 */}
                                <img
                                  src={service.logo}
                                  alt=""
                                  draggable={false}
                                  className={`max-w-full shrink-0 brightness-0 opacity-[0.89] ${service.logoClass}`}
                                />
                              </h3>
                            ) : (
                              <h3 className="mr-[30px] flex-1 line-clamp-2 font-display text-[25px] leading-[30px] text-[#1C1C1D] sm:mr-[10px] md:mr-[30px] antra:mr-[80px] antra:text-[28px] antra:leading-[35px]">
                                {service.title}
                              </h3>
                            )}
                            <span className="shrink-0 font-display text-[30px] leading-none text-[#E3E3E8]">
                              {service.n}
                            </span>
                          </div>

                          <p className="mt-[10px] line-clamp-3 text-[16px] leading-[24px] text-[#9F9FA4] min-[768px]:mr-[70px] min-[768px]:mt-[23px]">
                            {service.excerpt}
                          </p>
                        </div>
                      </article>
                    </div>
                  );
                })}
              </div>
            </div>
          </Reveal>
        </div>

      {/* 品牌 Logo 跑馬燈：視覺與 DOM 都併入 Services，同背景、全出血。 */}
      <div className="relative z-10 -mx-[15px] pt-24 md:-mx-[30px]">
        <MarqueeBand />
      </div>
    </section>
  );
}
