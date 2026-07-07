(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            let itemTitle = $element.find('li.antra-service-item-titles');
            if (itemTitle.length) {
                if ($element.hasClass('antra-service-accordion-layout-1')) {
                    itemTitle.hover(
                        // Mouse enter
                        function() {
                            let id = $(this).data('id');
                            $(this).addClass('show');
                            $(this).siblings().removeClass('show');
        
                            $('.antra-list-wrapper .antra-item', $element).removeClass('actived');
                            $(`.antra-list-wrapper .antra-item.elementor-repeater-item-${id}`, $element).addClass('actived');
                        },
                        // Mouse leave
                        function() {
                            if ($('li.antra-service-item-titles.show', $element).length === 0) {
                                let id = $(this).data('id');
                                $(this).removeClass('show');
                                $(`.antra-list-wrapper .antra-item.elementor-repeater-item-${id}`, $element).removeClass('actived');
        
                                if ($('.antra-list-wrapper .antra-item.actived', $element).length === 0) {
                                    $('li.antra-service-item-titles:first', $element).addClass('show');
                                    $('.antra-list-wrapper .antra-item:first', $element).addClass('actived');
                                }
                            }
                        }
                    );
                } else {
                    itemTitle.on('click', function(e) {
                        let id = $(this).data('id');
                        if ($(this).hasClass('show')) {
                            return;
                        }
                        
                        $(this).toggleClass('show');
                        $(this).siblings().removeClass('show');
        
                        $element.find('.antra-list-wrapper .antra-item').removeClass('actived');
                        $element.find(`.antra-list-wrapper .antra-item.elementor-repeater-item-${id}`).addClass('actived');

                        if ($element.hasClass('antra-service-accordion-layout-2')) {
                            $(this).siblings().find('.service-loop-exerpt').slideUp();
                            $(this).find('.service-loop-exerpt').slideDown();
                        }

                        if ($element.hasClass('antra-service-accordion-layout-3')) {
                            $element.find('.antra-item-service-excerpt.actived').hide().removeClass('actived');
                            $element.find(`.antra-item-service-excerpt.elementor-excerpt-item-${id}`).fadeIn().addClass('actived');
                        }
                    });
                }
            }

        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-services-accordion.default', addHandler);
    });

})(jQuery);
