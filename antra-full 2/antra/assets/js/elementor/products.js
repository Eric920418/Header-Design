(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            const Swipes_wrap = $('.antra-swiper', $element),
                gallery = $('.product-block .gallery_item', $element);

            if (Swipes_wrap.length > 0) {
                elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                    $element,
                });
            }

            if (gallery.length > 0) {
                gallery.on('click', function (e) {
                    const $this = $(this), $parent = $this.closest('.product-block'),
                        $image = $parent.find('.product-image > img'), image = $this.data('image'),
                        scrset = $this.data('scrset');
                    $this.addClass('active');
                    $this.siblings('.active').removeClass('active');
                    $image.attr('src', image);
                    $image.attr('srcset', scrset);
                });

                gallery.on('click', function (e) {
                    const image = $(this).data('image');
                    const $product = $(this).closest('li.product');
                    const $image = $product.find('.menu-thumb img');
                    $image.attr('src', image);
                    if ($(this).hasClass('active')) {
                        return;
                    }
                    $(this).parent().find('.active').removeClass('active');
                    $(this).addClass('active');
                });
            }
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-products.default', addHandler);
    });

})(jQuery);
