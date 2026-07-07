(function ($) {
    $(function () {
        $('.main-navigation .has-mega-menu.has-stretchwidth').hover(function (e) {
            let $body = $('body');
            var pleft = $(this).offset().left,
                bodyleft = $body.offset().left;

            if ($body.hasClass('rtl')) {
                var pright = pleft + $(this).outerWidth(),
                    bodyright = bodyleft + $body.outerWidth();
                $('.mega-stretchwidth', this).css({
                    right: - (bodyright - pright),
                    width: $body.width()
                });
            }
            else {
                $('.mega-stretchwidth', this).css({
                    left: -pleft + bodyleft,
                    width: $body.width()
                });
            }
        });

        $('.main-navigation .has-mega-menu.has-containerwidth').hover(function (e) {
            let $parent = $(this).closest('.container , .elementor-container, .col-full, .header-container, .e-con-inner'),
                pleft = $parent.offset().left + parseInt($parent.css('padding-left')),
                cleft = $(this).offset().left;

            $('.mega-containerwidth', this).css({
                left: pleft - cleft,
                width: $parent.width()
            });
        });

        $('.main-navigation .has-mega-menu.has-fullwidth').hover(function (e) {
            let $parent = $(this).parents('.container , .elementor-container, .col-full, .header-container, .e-con-inner').last(),
                pleft = $parent.offset().left + parseInt($parent.css('padding-left')),
                cleft = $(this).offset().left; 

            $('.mega-fullwidth', this).css({
                left: pleft - cleft,
                width: $parent.width()
            });
        });

		$('.main-navigation .has-mega-menu').has('ul.custom-subwidth').hover(function (e) {
			let pleft = parseFloat($(this).children('a').css('padding-left')),
				$oleft = $(this).offset().left + pleft,
			    $itemwidth = parseInt($(this).children('.custom-subwidth').css('width')),
			    $bodywidth = $('body').width();

			let $offset = $oleft + $itemwidth - $bodywidth;

			if ($offset >= 0){
				$('.mega-menu.custom-subwidth', this).css({
					left: -$offset + pleft
				});
			}
			else{
				$('.mega-menu.custom-subwidth', this).css({
					left: pleft
				});
			}
		});
    });
})(jQuery);
