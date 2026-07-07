(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {
        const addHandler = ($element) => {
            $('.elementor-price-table__button', $element).initAntraBtn();
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-pricing.default', addHandler);
    });

})(jQuery);
