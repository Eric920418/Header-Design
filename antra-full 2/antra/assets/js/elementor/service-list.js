(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            elementorFrontend.elementsHandler.addHandler(antraSwiperBase, {
                $element,
            });
            elementorFrontend.elementsHandler.addHandler(antraLoadmorePost, {
                $element,
            });

            if ($element.hasClass('antra-services-style-2')) {
                const DEFAULT_ROTATE = 8.83,
                    ROTATE_RANGE = 3,
                    TRANSLATE_X_RANGE = 1.5,
                    TRANSLATE_Y_RANGE = 1.3,
                    RESET_DURATION = 300;
    
                var items = $element.find('.antra-item');
                if (items.length) {
                    items.find('.service-block').on('mousemove', function (e) {
                        const $img = $(this).find('.post-thumbnail'),
                            imgRect = $img[0].getBoundingClientRect(),
                            centerX = imgRect.left + imgRect.width / 2,
                            centerY = imgRect.top + imgRect.height / 2,
                            normX = (e.clientX - centerX) / (imgRect.width / 2),
                            normY = (e.clientY - centerY) / (imgRect.height / 2),
                            translateX = normX * TRANSLATE_X_RANGE,
                            translateY = normY * TRANSLATE_Y_RANGE,
                            rotateDegree = DEFAULT_ROTATE + (normX * ROTATE_RANGE);
        
                        $img.css('transform', `translate3d(${translateX}rem, ${translateY}rem, 0) rotateZ(${rotateDegree}deg)`);
                    });
        
                    items.find('.service-block').on('mouseleave', function () {
                        var $img = $(this).find('.post-thumbnail');
                        $img.css('transition', `transform ${RESET_DURATION}ms ease-out`);
                        $img.css('transform', `rotateZ(8.83deg)`);
                        setTimeout(() => $img.css('transition', 'none'), RESET_DURATION);
                    });
                }
            }

        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-services-list.default', addHandler);
    });
})(jQuery);

