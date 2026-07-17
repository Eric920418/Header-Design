import React, { useEffect, useRef } from 'react';
import useEmblaCarousel from 'embla-carousel-react';
import { MarqueeBand } from './MarqueeBand';
import { Reveal } from '../motion/Reveal';
import { prefersReducedMotion } from '../motion/prefersReducedMotion';
import { GOLD } from '../theme/cis';

// Antra home-6「Our Services」= antra-services-list style-3。
// 6 筆服務內容與圖片均沿用模板；圖片已本地化，避免 demo 外連失效造成視覺漂移。
const SVC_IMG = '/services';
const SERVICES = [
  { n: '01', title: 'Residential Interior Design', excerpt: 'Tailored design services for private homes, including room makeovers and complete home transformations.', img: `${SVC_IMG}/service-6.jpg` },
  { n: '02', title: 'Renovation and Remodeling', excerpt: 'Overhauling existing spaces to modernize and improve functionality and aesthetics.', img: `${SVC_IMG}/service-2.jpg` },
  { n: '03', title: 'Interior 2D/3D Layouts', excerpt: 'Realistic 3D visualizations to help you envision your space before it is built in real life.', img: `${SVC_IMG}/service-1.jpg` },
  { n: '04', title: 'Outdoor & Landscape Design', excerpt: 'Extending design services to outdoor spaces such as gardens, patios, and decks.', img: `${SVC_IMG}/service-4.jpg` },
  { n: '05', title: 'Interior Design Consultation', excerpt: 'Providing professional advice on concepts, color schemes & material selection.', img: `${SVC_IMG}/service-3.jpg` },
  { n: '06', title: 'Commercial Interior Design', excerpt: 'Designing functional and attractive interiors for businesses, including offices, retail spaces, and hospitality venues.', img: `${SVC_IMG}/service-5.jpg` },
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
      }, 5000);
    }

    return () => {
      if (timer) clearInterval(timer);
      root.removeEventListener('mouseenter', pause);
      root.removeEventListener('mouseleave', resume);
    };
  }, [emblaApi]);

  return (
    <div>
      <section
        aria-labelledby="services-heading"
        className="relative mt-[60px] overflow-hidden bg-cover bg-top bg-no-repeat px-[15px] pb-[60px] pt-[60px] md:px-[30px] md:py-[80px] lg:pb-[60px] lg:pt-[100px] antra:mt-[80px] antra:pb-[129px] antra:pt-[125px]"
        style={{ backgroundImage: "url('/services/h6-bg-2.jpg')" }}
      >
        {/* Page 6 原生背景設定：黑色 76% overlay + 29px backdrop blur。 */}
        <div aria-hidden className="absolute inset-0 bg-black/[0.76] backdrop-blur-[29px]" />

        <div className="relative z-10 mx-auto max-w-[1410px]">
          <Reveal anim="slideInUp" className="relative mb-[30px] antra:mb-[60px]">
            {/* 使用 Page 6 原始裝飾素材，不用近似的 inline SVG。 */}
            <img
              aria-hidden
              src="/services/deco-horizontal.svg"
              alt=""
              className="absolute left-[474px] top-0 hidden h-[15px] w-[15px] invert opacity-[0.18] antra:block"
            />
            <img
              aria-hidden
              src="/services/deco-vertical.svg"
              alt=""
              className="absolute left-[347px] top-[126px] hidden h-[15px] w-[15px] invert opacity-[0.18] antra:block"
            />

            <div className="flex flex-col items-center gap-[15px] text-center sm:gap-[30px] antra:flex-row antra:items-start antra:gap-0 antra:pt-[38px] antra:text-left">
              <div className="antra:w-[424px] antra:shrink-0 antra:pt-[8px]">
                <span className="inline-flex items-center gap-1.5 rounded-[24px] border border-white/[0.18] pb-[6px] pl-[9px] pr-[13px] pt-[7px] font-display text-[12px] uppercase leading-[14px] tracking-[1px] text-white">
                  <span className="inline-block h-1.5 w-1.5 rounded-full" style={{ background: GOLD }} />
                  Our Services
                </span>
              </div>

              <h2
                id="services-heading"
                className="max-w-[769px] font-display text-[30px] capitalize leading-[35px] text-white sm:text-[45px] sm:leading-[50px] antra:w-[769px] antra:text-[60px] antra:leading-[64px]"
              >
                Explore Our <span style={{ color: GOLD }}>Comprehensive Interior Design</span> Services
              </h2>
            </div>
          </Reveal>

          <Reveal anim="slideInUp">
            <div className="cursor-grab overflow-hidden active:cursor-grabbing" ref={emblaRef}>
              <div className="-ml-[30px] flex">
                {SERVICES.map((service, index) => {
                  const captionTop = index % 2 === 1;

                  return (
                    <div
                      key={service.n}
                      className="min-w-0 flex-[0_0_100%] pl-[30px] md:flex-[0_0_50%] antra:flex-[0_0_33.333%]"
                    >
                      <article
                        className={`group/svc flex flex-col overflow-hidden rounded-[24px] bg-white p-[10px] ${captionTop ? 'sm:flex-col-reverse' : ''}`}
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

                        <div className="px-0 pb-[30px] pt-[20px] sm:px-[20px] sm:pb-[35px] sm:pt-[30px]">
                          <div className="flex items-start justify-between">
                            <h3 className="mr-[30px] flex-1 line-clamp-2 font-display text-[25px] leading-[30px] text-[#1C1C1D] sm:mr-[10px] md:mr-[30px] antra:mr-[80px] antra:text-[28px] antra:leading-[35px]">
                              {service.title}
                            </h3>
                            <span className="shrink-0 font-display text-[30px] leading-none text-[#E3E3E8]">
                              {service.n}
                            </span>
                          </div>

                          <p className="mt-[10px] line-clamp-3 text-[16px] leading-[24px] text-[#9F9FA4] antra:mr-[70px] antra:mt-[23px]">
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
      </section>

      {/* 使用者自訂功能：獨立淺灰 Section，內容與動畫不可隨模板服務區移除。 */}
      <div className="bg-[#f6f6f6] pt-24">
        <MarqueeBand />
      </div>
    </div>
  );
}
