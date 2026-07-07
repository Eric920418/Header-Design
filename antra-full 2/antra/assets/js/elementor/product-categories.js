(function ($) {
    "use strict";

    $.fn.isAfter = function(sel){
        return this.prevAll().filter(sel).length !== 0;
    };
    
    $.fn.isBefore= function(sel){
        return this.nextAll().filter(sel).length !== 0;
    };

    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            if ($element.hasClass('category-product-style-4')) {
                $element.find('.category-product-caption').on({
                    mouseenter: function() {
                        var itemId = $(this).data('item-id'),
                            targetImg = $element.find(`.category-product-img.image-item-${itemId}`),
                            curImgShow = $element.find('.category-product-img.show'),
                            imageList = $element.find('.elementor-category-image-list'),
                            isAfter = targetImg.isAfter($element.find('.category-product-img.show'));
            
                        if($(this).hasClass('actived')) return;
                        if(imageList.hasClass('running')) return;
                        if(targetImg.hasClass('show')) return;
                        
                        imageList.addClass('running');
                        
                        $element.find('.category-product-caption').removeClass('actived');
                        $(this).addClass('actived');
                        
                        if(isAfter) {
                            targetImg.addClass('showing');
                        }
                        else {
                            curImgShow.addClass('showing');
                        }
                        targetImg.show();
                        curImgShow.slideUp(500, () => {
                            curImgShow.removeClass('show').hide();
                            if(!isAfter) {
                                curImgShow.removeClass('showing');
                            }
                            targetImg.removeClass('showing').addClass('show');
                            imageList.removeClass('running');
                        });
                    },
                    mouseleave: function() {
                        //stuff to do on mouse leave
                    }
                });
            } 
            else {
                elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                    $element,
                });
    
                $element.find('.antra-swiper').on('swiperInit', function(e, slider) {
                    var slideSize = slider.slides[0].swiperSlideSize;
    
                    $(this).css('--slider-item-width', slideSize+'px');
                })
            }

        }
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-product-categories.default', addHandler);
    })
})(jQuery);
