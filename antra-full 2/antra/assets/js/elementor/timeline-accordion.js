(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            $('li.antra-timeline-item-titles', $element).on('click', function(e) {
                let id = $(this).data('id');

                $(this).toggleClass('show');
                $(this).siblings().removeClass('show');

                $('.antra-list-wrapper .antra-item', $element).removeClass('actived');
                $(`.antra-list-wrapper .antra-item.elementor-repeater-item-${id}`, $element).addClass('actived');
            });

            $('li.antra-timeline-item-titles', $element).hover(
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
                    if ($('li.antra-timeline-item-titles.show', $element).length === 0) {
                        let id = $(this).data('id');
                        $(this).removeClass('show');
                        $(`.antra-list-wrapper .antra-item.elementor-repeater-item-${id}`, $element).removeClass('actived');

                        if ($('.antra-list-wrapper .antra-item.actived', $element).length === 0) {
                            $('li.antra-timeline-item-titles:first', $element).addClass('show');
                            $('.antra-list-wrapper .antra-item:first', $element).addClass('actived');
                        }
                    }
                }
            );
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-timelines-accordion.default', addHandler);
    });

})(jQuery);
