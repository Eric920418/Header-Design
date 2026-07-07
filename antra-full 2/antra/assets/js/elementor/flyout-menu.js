(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', () => {

        const addHandler = ($element) => {

            if (!$('header .elementor-widget-antra-flyout-group').length) {
                $('body').addClass('flyout-menu-outsite-header');
            }

            $(".elementor-header-flyout-action .icon", $element).click(function(e) {
                e.preventDefault();
                
                $('body').toggleClass('flyout-body-hidden');

                $(this)
                    .closest('.elementor-header-flyout-action')
                    .toggleClass('flyout-action-close')
                    .next('.elementor-antra-flyout-content')
                    .toggleClass('flyout-open');

            });
        };
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-flyout-group.default', addHandler);
    });
})(jQuery);

