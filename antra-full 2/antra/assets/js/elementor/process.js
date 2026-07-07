(function ($) {
    "use strict";

    function hoverProcess($element) {
        var items = $element.find('.antra-inner-process');
        if (items.length) {
            items.on({
                mouseenter: function() {
                    var index = $(this).data('index'),
                        targetImg = $element.find(`.antra-process-image.img-${index}`);

                    if($(this).hasClass('activate')) return;

                    items.removeClass('activate');
                    $(this).addClass('activate');

                    $element.find('.antra-process-image').removeClass('show');
                    targetImg.addClass('show');
                },
                mouseleave: function() {
                    //stuff to do on mouse leave
                }
            });
        }
    }

    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                $element,
            });

            if ($element.hasClass('elementor-process-layout-2')) {
                if ($element.find('.antra-swiper').length) {
                    $element.find('.antra-swiper').on('swiperInit', function(e, slider) {
                        hoverProcess($(slider.el));
                    })
                }
                else {
                    hoverProcess($element);
                }
            }
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-process.default', addHandler);
    });
})(jQuery);

