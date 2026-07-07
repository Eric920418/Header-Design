(function ($) {
    "use strict";
    $(window).on('elementor/frontend/init', function () {

        elementorFrontend.hooks.addAction('frontend/element_ready/column', function ($scope) {
            if ($scope.hasClass('animated-slide-column')) {
                new Waypoint({
                    element: $scope, offset: '50%', handler: function () {
                        $scope.addClass('col-loaded');
                    }
                });
            }

            if ($scope.hasClass('animated-bg-parallax')) {
                var $wrap = $scope.find('>[class*="elementor-column-"]');
                var linkImage = $wrap.css('backgroundImage').replace('url(', '').replace(')', '').replace(/\"/gi, "");
                if (linkImage === 'none') {
                    return;
                }
                $wrap.prepend('<img src="' + linkImage + '" class="img-banner-parallax" alt="banner-parallax"/>')

                $wrap.find('>.img-banner-parallax').panr({
                    moveTarget: $wrap,
                    sensitivity: 20,
                    scale: false,
                    scaleOnHover: true,
                    scaleTo: 1.1,
                    scaleDuration: .25,
                    panY: true,
                    panX: true,
                    panDuration: 1.25,
                    resetPanOnMouseLeave: true
                });
            }
        });
        elementorFrontend.hooks.addAction('frontend/element_ready/section', function ($scope) {
            $(window).load(function () {
                if ($scope.hasClass('animated-bg-parallax')) {
                    var linkImage = $scope.css('backgroundImage').replace('url(', '').replace(')', '').replace(/\"/gi, "");
                    if (linkImage === 'none') {
                        return;
                    }
                    $scope.prepend('<img src="' + linkImage + '" class="img-banner-parallax" alt="banner-parallax" />')
                    $scope.find('>.img-banner-parallax').panr({
                        moveTarget: $scope,
                        sensitivity: 20,
                        scale: false,
                        scaleOnHover: true,
                        scaleTo: 1.1,
                        scaleDuration: .25,
                        panY: true,
                        panX: true,
                        panDuration: 1.25,
                        resetPanOnMouseLeave: false
                    });
                }

                
            })
        });

        elementorFrontend.hooks.addAction('frontend/element_ready/button.default', function ($scope) {
            if ($scope.find('.elementor-button-text').length) {
                var $text = $scope.find('.elementor-button-text').text();
                $scope.find('.elementor-button').addClass('btn-slip-effect');
                $scope.find('.elementor-button-text').attr('data-text', $text);
                $scope.find('.elementor-button').attr('data-text', $text);
            }
        });

        elementorFrontend.hooks.addAction('frontend/element_ready/container', function ($scope) {
            if ($scope.hasClass('mostion_image')) {
                $('.mostion_image').each(function() {
                    $(this).mousemove(function(e){
                        var imageBox = $(this).find('.elementor-widget-image .elementor-widget-container img');
                        imageBox.each(function(index) {
                            var mouseX = (e.pageX / 50),
                                mouseY = (e.pageY / 50); 
    
                            var arrow = (index % 2 == 0) ? '-' : '';
                            
                            $(this).css({
                                'transform' : 'translateX(var(--translateX)) translateY(var(--translateY))',
                                '--translateX' : arrow + mouseX + 'px',
                                '--translateY' : arrow + mouseY + 'px',
                            });
                        });
                    });
                })
            }

            if($('.effects-background-deco-yes').length > 0) {
                $('.effects-background-deco-yes .elementor-icon').each(function() {
                    var icon = $(this);
                    icon.mousemove(function(e){
                        var heightBox = $(this).outerHeight(),
                            widthBox = $(this).outerWidth()
                        
                        var offsetBox = $(this).offset(),
                            offsetTop = offsetBox.top,
                            offsetLeft = offsetBox.left;
                            
                        var mouseX = (e.pageX),
                            mouseY = (e.pageY); 
                    
                        var beforeTop = mouseY - offsetTop,
                            beforeLeft = mouseX - offsetLeft;
                        
                        var typeY = '',
                            typeX = '';
                        
                        if(beforeTop < (heightBox / 2)) {
                            var typeY = '-';
                        }
                        if(beforeLeft < (widthBox / 2)) {
                            var typeX = '-';
                        }
                        
                        icon.css({
                            '--top-before' : typeY + '5%',
                            '--left-before' : typeX + '5%',
                        });
                    });
                })
            }
        })

        elementorFrontend.hooks.addAction('frontend/element_ready/counter.default', function ($element) {

            elementorFrontend.elementsHandler.addHandler(antraCounter, {
                $element,
            })
    
		});
    })

})(jQuery)
