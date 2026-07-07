(function ($) {
    'use strict';
    function cart_side() {
        var $cart_side = $('.site-header-cart-side');
        var $body = $('body');
        if (!$cart_side.length) {
            return;
        }

        $body.on('click', '.cart-contents', function (e) {
            e.preventDefault();
            $cart_side.toggleClass('active');
        });

        $('.close-cart-side,.cart-side-overlay').on('click', function (e) {
            e.preventDefault();
            $cart_side.removeClass('active');
        });

        $body.on('added_to_cart', function () {
            if (!$cart_side.hasClass('active')) {
                $cart_side.addClass('active');
            }
        });
    }

    $(document).ready(function () {
        cart_side();
    });

})(jQuery);


(function ($) {
    'use strict';
    function account_side() {
        var $account_side = $('body .header-group-action .site-header-account a');
        var $account_active = $('body .header-group-action .site-header-account .account-dropdown');
        $(document).on('mouseup', function (e) {
            if ($account_side.has(e.target).length == 0 && !$account_active.is(e.target) && $account_active.has(e.target).length == 0) {
                $account_active.removeClass('active');
            }
        });
        $account_side.on('click', function (e) {
            e.preventDefault();
            e.stopPropagation();
            $account_active.toggleClass('active');
        });
    }
    $(document).ready(function () {
        account_side();
    });
})(jQuery);
