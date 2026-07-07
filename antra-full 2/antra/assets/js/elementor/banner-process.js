(function ($) {
    "use strict";

    function initAntraBannerProcess($element) {
        let addHandler = $('.antra-swiper-wrapper', $element);
        if (addHandler.length > 0) {
            elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                $element,
            });
        }

        let items = $('.elementor-banner-process-item', $element);
        let images = $('.banner-process-image-list .banner-process-img', $element);
        let imageList = $('.banner-process-image-list', $element);

        let originalItems = items.filter(function () {
            return !$(this).hasClass('swiper-slide-duplicate') && !$(this).hasClass('cloned');
        });

        originalItems.each(function (i) {
            $(this).attr('data-index', i);
        });

        items.each(function () {
            let originalIndex = $(this).attr('data-index');
            if (originalIndex === undefined) {
                let matchingOriginal = originalItems.eq($(this).index() % originalItems.length);
                originalIndex = matchingOriginal.attr('data-index');
                $(this).attr('data-index', originalIndex);
            }
        });

        items.off('mouseenter').on('mouseenter', function () {
            if (imageList.hasClass('running')) return;
            let index = parseInt($(this).attr('data-index'), 10);
            if (isNaN(index) || index >= images.length || index < 0) return;

            let curImgShow = images.filter('.show');
            let targetImg = images.eq(index);
            if (targetImg.hasClass('show')) return;

            imageList.addClass('running');
            $('.banner-process-caption', $element).removeClass('active');
            $(this).find('.banner-process-caption').addClass('active');

            let isAfter = index > images.index(curImgShow);

            if (isAfter) {
                targetImg.addClass('showing');
            } else {
                curImgShow.addClass('showing');
            }
            targetImg.show();
            curImgShow.slideUp(500, () => {
                curImgShow.removeClass('show').hide();
                if (!isAfter) {
                    curImgShow.removeClass('showing');
                }
                targetImg.removeClass('showing').addClass('show');
                imageList.removeClass('running');
            });
        });
    }

    $(window).on('elementor/frontend/init', () => {
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-banner-process.default', ($element) => {
            initAntraBannerProcess($element);
        });
    });

    $(document).on('antraCarouselInit', function (e, $element) {
        initAntraBannerProcess($element);
    });

})(jQuery);
