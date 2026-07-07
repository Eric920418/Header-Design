(function ($) {
    "use strict";

    function addLastItem($element) {
        var max = 6;
        if ($element.hasClass('project-gallery-style-grid')) {
            if ($(window).width() <= 1024) {
                max = 4;
            }
            if ($(window).width() <= 567) {
                max = 2;
            }
        }
        if ($element.hasClass('project-gallery-style-mansory')) {
            max = 4;
            if ($(window).width() <= 567) {
                max = 2;
            }
        }

        var lastItem = $('.last-item.project-slideshow-item', $element);
        if (lastItem.length) {
            lastItem.removeClass('last-item');
            lastItem.find('.project-gallery-viewmore').remove();
        }
        if ($('.project-slideshow-item', $element).length > max) {
            const moreText = $('.elementor-widget-inner', $element).data('viewmore');
            lastItem = $(`.project-slideshow-item:nth-child(${max})`, $element),
            lastItem.addClass('last-item');
            $('.project-slideshow-inner', lastItem).append(`<span class="project-gallery-viewmore"><i class="antra-icon-galleries"></i>${moreText}</span>`);
        }
    }

    function initFancyBox($element) {
        $('.project-slideshow-inner', $element).fancybox({
            loop: false,
            clickOutside: "close",
            thumbs: {
                autoStart: true
            }
        });
    }

    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                $element,
            });

            if ($element.hasClass('project-gallery-style-slideshow')) {
                $('.antra-swiper', $element).on('swiperInit', function(e, slider) {
                    initFancyBox($element);
                })
            } else {
                initFancyBox($element);

                addLastItem($element);
                $(window).on('resize', function() {
                    addLastItem($element);
                })
            }


        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-project-gallery.default', addHandler);
    });
})(jQuery);

