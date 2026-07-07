(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            if ($element.hasClass('antra-scroll-sticky-yes')) {
                $('body').addClass('antra-scroll-sticky');
                let items = $element.find('li.antra-item');
                let offset = parseInt($element.data('sticky-offset') ?? 40);
                if (items.length) {
                    items.each(function (index) {
                        var index_start = index + 1;
                        $(this).css('--offset', `${index_start * offset}px`);
                    })
                }

                gsap.registerPlugin(ScrollTrigger);
                const scaleIncrement = 0.03; // Each section after scale more 0.03

                items.each(function (index) {
                    const section = $(this);
                    const baseScale = 0.85 + (index * scaleIncrement);
                    const baseOpacity = 0.9;

                    gsap.to(section, {
                        scrollTrigger: {
                            trigger: section,
                            start: "top top",
                            end: "+=100%",
                            scrub: 0.5,
                            markers: false
                        },
                        scale: baseScale,
                        opacity: baseOpacity,
                        ease: "power1.out"
                    });
                });

                gsap.config({ force3D: true });
                $(window).on('resize', ScrollTrigger.refresh);

            } else {
                elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                    $element,
                });
            }
            elementorFrontend.elementsHandler.addHandler(antraLoadmorePost, {
                $element,
            });
            elementorFrontend.elementsHandler.addHandler(antraAjaxFilter, {
                $element,
            });

            $element.find('.antra-swiper').on('swiperInit', function(e, slider) {
                var slideSize = slider.slides[0].swiperSlideSize;

                $(this).css('--slider-item-width', slideSize+'px');
            })
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-project.default', addHandler);
    });
})(jQuery);

