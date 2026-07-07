(function ($) {
    'use strict';

    $(function () {
        var $body = $('body');
        $body.on('click', '.filter-toggle', function (e) {
            e.preventDefault();
            $('html').toggleClass('off-canvas-active');
        });

        $body.on('click', '.filter-close, .antra-overlay-filter', function (e) {
            e.preventDefault();
            $('html').toggleClass('off-canvas-active');
        });

        // Dropdown
		var $dropdownWrapper = $('body .antra-dropdown-filter');

		$body.on('click','.filter-toggle-dropdown',function (e) {
			e.preventDefault();
			$dropdownWrapper.toggleClass('active-dropdown').slideToggle();
		});

		function clone_sidebar() {
		    var $canvas = $('.antra-canvas-filter-wrap');
		    if(!$('body').hasClass('shop_filter_canvas')){
                if($(window).width() < 1024){
                    $('#secondary').children().appendTo(".antra-canvas-filter-wrap");
                    $('.antra-dropdown-filter-wrap').children().appendTo(".antra-canvas-filter-wrap");
                }else {
                    $canvas.children().appendTo("#secondary");

                    $canvas.children().appendTo(".antra-dropdown-filter-wrap");
                }
            }

        }
        $(document).ready(function () {
            clone_sidebar();
            $(window).on( 'resize',function () {
                clone_sidebar();
            });
        });
    });


})(jQuery);
