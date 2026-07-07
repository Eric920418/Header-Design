(function ($) {
    'use strict';
    var $body = $('body');

    function singleProductGalleryImages() {
        var rtl = $body.hasClass('rtl') ? true : false;

        var lightbox = $('.single-product .woocommerce-product-gallery__image > a');
        var thumb_signle = $('.flex-control-thumbs img', '.woocommerce-product-gallery');

        if (lightbox.length) {
            lightbox.attr("data-elementor-open-lightbox", "no");
        }

        var galleryHorizontal = $('.woocommerce-product-gallery.woocommerce-product-gallery-horizontal .flex-control-thumbs');
        // var galleryVertical = $('.woocommerce-product-gallery.woocommerce-product-gallery-vertical .woocommerce-product-gallery-right_vertical .flex-control-thumbs');
        var galleryVertical = $('.woocommerce-product-gallery.woocommerce-product-gallery-vertical .flex-control-thumbs');

        if (galleryHorizontal.length > 0) {
            galleryHorizontal.wrap("<div class='swiper swiper-thumbs-horizontal'></div>").addClass('swiper-wrapper').find('li').addClass('swiper-slide');
            $('<div class="swiper-button-next swiper-button"></div><div class="swiper-button-prev swiper-button"></div>').insertAfter(galleryHorizontal);
            new Swiper('.swiper-thumbs-horizontal', {
                slidesPerView: 'auto',
                spaceBetween: 20,
                navigation: { 
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        }

        if (galleryVertical.length > 0) {
            galleryVertical.wrap("<div class='swiper swiper-thumbs-vertical'></div>").addClass('swiper-wrapper').find('li').addClass('swiper-slide');
            $('<div class="swiper-button-next swiper-button"></div><div class="swiper-button-prev swiper-button"></div>').insertAfter(galleryVertical);
            new Swiper('.swiper-thumbs-vertical', {
                slidesPerView: 'auto',
                spaceBetween: 20,
                autoHeight: true,
                direction: 'vertical',
                breakpoints: {
                    0: {
                        direction: 'horizontal',
                    },
                    426: {
                        direction: 'vertical',
                    }
                },
                navigation: { 
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        }

        $('.woocommerce-product-gallery .flex-control-thumbs li').each(function () {
            $(this).has('.flex-active').addClass('active');
        });

        thumb_signle.on('click',function () {
            thumb_signle.parent().removeClass('active');
            $(this).parent().addClass('active');
        });

        $('.woocommerce-product-gallery-gallery .flex-control-thumbs li').on('click', function(e) {
            var curIndex = $('.woocommerce-product-gallery-gallery .flex-control-thumbs li').index(this) + 1,
                targetEle = $('.woocommerce-product-gallery-gallery .woocommerce-product-gallery__wrapper .woocommerce-product-gallery__image:nth-child('+curIndex+')');
			
        	console.log(curIndex);
            $('body, html').animate({
                scrollTop: targetEle.offset().top - 50
            }, 1000);
            
        })
    }

    function popup_video() {
        $('a.btn-video').magnificPopup({
            type: 'iframe',
            disableOn: 700,
            removalDelay: 160,
            midClick: true,
            closeBtnInside: true,
            preloader: false,
            fixedContentPos: false
        });

        $('a.btn-360').magnificPopup({
            type: 'inline',

            fixedContentPos: false,
            fixedBgPos: true,

            overflowY: 'auto',

            closeBtnInside: true,
            preloader: false,

            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in',
            callbacks: {
                open: function () {
                    var spin = $('#rotateimages');
                    var images = spin.data('images');
                    var imagesarray = images.split(",");
                    var api;
                    spin.spritespin({
                        source: imagesarray,
                        width: 800,
                        height: 800,
                        sense: -1,
                        responsive: true,
                        animate: false,
                        onComplete: function () {
                            $(this).removeClass('opal-loading');
                        }
                    });

                    api = spin.spritespin("api");

                    $('.view-360-prev').on('click',function () {
                        api.stopAnimation();
                        api.prevFrame();
                    });

                    $('.view-360-next').on('click',function () {
                        api.stopAnimation();
                        api.nextFrame();
                    });

                }
            }
        });
    }

    function single_popup() {

        $('.sizechart-button').on('click', function (e) {
            e.preventDefault();
            $('.sizechart-popup').toggleClass('active');
        });

        $('.sizechart-close,.sizechart-overlay').on('click', function (e) {
            e.preventDefault();
            $('.sizechart-popup').removeClass('active');
        });

        var $button_ask = $('.ask-a-question-button');
        if ($button_ask.length > 0) {
            $button_ask.magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in',
                callbacks: {
                    beforeOpen: function() {
                        this.st.mainClass = this.st.el.attr('data-effect');
                    }
                }
            });
        }
    }

    $('.woocommerce-product-gallery').on('wc-product-gallery-after-init', function () {
        singleProductGalleryImages();
    });

    function onsale_gallery_vertical() {
        $('.woocommerce-product-gallery.woocommerce-product-gallery-vertical:not(:has(.flex-control-thumbs))').css('max-width', '690px').next().css('left', '10px');
    }

    function output_accordion() {
        $('.js-card-body.active').slideDown();
        /*   Produc Accordion   */
        $('.js-btn-accordion').on('click', function () {
            if (!$(this).hasClass('active')) {
                $('.js-btn-accordion').removeClass('active');
                $('.js-card-body').removeClass('active').slideUp();
            }
            $(this).toggleClass('active');
            var card_toggle = $(this).parent().find('.js-card-body');
            card_toggle.slideToggle();
            card_toggle.toggleClass('active');

            setTimeout(function () {
                $('.product-sticky-layout').trigger('sticky_kit:recalc');
            }, 1000);
        });
    }

    function _makeStickyKit() {
        var top_sticky = 0,
            $adminBar = $('#wpadminbar');

        if ($adminBar.length > 0) {
            top_sticky += $adminBar.height();
        }

        if (window.innerWidth < 992) {
            $('.product-sticky-layout').trigger('sticky_kit:detach');
            $('.single-product-type-gallery .flex-control-thumbs').trigger('sticky_kit:detach');
        } else {
            $('.product-sticky-layout').stick_in_parent({
                offset_top: top_sticky
            });
            $('.single-product-type-gallery .flex-control-thumbs').stick_in_parent({
                offset_top: top_sticky
            });

        }
    }

    $body.on('click', '.wc-tabs li a, ul.tabs li a', function (e) {
        e.preventDefault();
        var $tab = $(this);
        var $tabs_wrapper = $tab.closest('.wc-tabs-wrapper, .woocommerce-tabs');
        var $control = $tab.closest('li').attr('aria-controls');
        $tabs_wrapper.find('.resp-accordion').removeClass('active');
        $('.' + $control).addClass('active');

    }).on('click', 'h2.resp-accordion', function (e) {
        e.preventDefault();
        var $tab = $(this);
        var $tabs_wrapper = $tab.closest('.wc-tabs-wrapper, .woocommerce-tabs');
        var $tabs = $tabs_wrapper.find('.wc-tabs, ul.tabs');

        if ($tab.hasClass('active')) {
            return;
        }
        $tabs_wrapper.find('.resp-accordion').removeClass('active');
        $tab.addClass('active');
        $tabs.find('li').removeClass('active');
        $tabs.find($tab.data('control')).addClass('active');
        $tabs_wrapper.find('.wc-tab, .panel:not(.panel .panel)').hide(300);
        $tabs_wrapper.find($tab.attr('aria-controls')).show(300);

    });

    $(document).ready(function () {
        single_popup();
        // onsale_gallery_vertical();
        popup_video();
        output_accordion();

        if ($('.variations_form .reset_variations').length) {
            $('.variations_form .reset_variations').on('click', function() {
                $(this).slideUp();
            });
            $('.variations_form').on('reset_data', function() {
                if (!$(this).hasClass('wvs-loaded')) {
                    $(this).find('.reset_variations').slideUp();
                }
            })
        }

        if ($('.product-sticky-layout').length > 0) {
            _makeStickyKit();
            $(window).resize(function () {
                setTimeout(function () {
                    _makeStickyKit();
                }, 100);
            });
        }
    });

})(jQuery);
