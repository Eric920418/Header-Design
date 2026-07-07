(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            gsap.registerPlugin(ScrollTrigger);

            gsap.config({
                force3D: true
            });

            const $imageSections = $element.find('.elementor-widget-container');

            $imageSections.each(function () {
                const $section = $(this);
                const $imageContainer = $section.find('.elementor-antra-gallery-scroll');
                const containerWidth = $imageContainer.width();
                const windowWidth = $(window).width();

                let scrollDistance = -(windowWidth / 3);

                $imageContainer.append($imageContainer.html());
                if ($element.hasClass('antra-gallery-scroll-direction-ltr')) {
                    scrollDistance = scrollDistance * -1;
                }

                gsap.to($imageContainer, {
                    x: scrollDistance,
                    ease: "sine.out",
                    scrollTrigger: {
                        trigger: $section,
                        start: "top bottom",
                        end: "bottom top",
                        scrub: 0.5,
                        markers: false,
                        anticipatePin: 1
                    }
                });
            });

            let resizeTimer;
            $(window).on('resize', function () {
                clearTimeout(resizeTimer);
                resizeTimer = setTimeout(() => {
                    ScrollTrigger.refresh();
                }, 200);
            });

            $('.gallery-image-link', $element).fancybox({
                loop: false,
                clickOutside: "close",
                thumbs: {
                    autoStart: true
                }
            });
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-gallery-scroll.default', addHandler);
    });

})(jQuery);
