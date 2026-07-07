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
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-teams-list.default', addHandler);
    });
})(jQuery);

