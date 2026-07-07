(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                $element,
            });
            jQuery(document).ready(function($) {
                let $layout = $('.antra-testimonial-layout-2');

                if ($layout.length) {
                    let $sections = $layout.find('.elementor-testimonial-item');

                    function updateActiveSections() {
                        let scrollMiddle = $(window).scrollTop() + ($(window).height() / 2);

                        $sections.each(function () {
                            let $section = $(this);
                            let sectionTop = $section.offset().top;

                            if (scrollMiddle >= sectionTop) {
                                $section.addClass('active');
                            } else {
                                $section.removeClass('active');
                            }
                        });
                    }

                    updateActiveSections();
                    $(window).on('scroll', function () {
                        updateActiveSections();
                    });
                }
            });



        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-testimonials.default', addHandler);
    });
})(jQuery);