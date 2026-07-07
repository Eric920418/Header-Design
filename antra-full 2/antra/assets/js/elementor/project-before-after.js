(function ($) {
    "use strict";

    function init_view($scope) {
        if ($scope.hasClass('init-before-after')) {
            return;
        }

        let $beforeAfter = $('.elementor-image-before-after', $scope);
        $beforeAfter.beforeAfter({
            movable: true,
            clickMove: true,
            position: 60,
            separatorColor: '#fafafa5c',
            bulletColor: '#fafafa',
            width: 2,
            onMoveStart: function(e) {
                // console.log(e.target);
            },
            onMoving: function() {
                // console.log(e.target);
            },
            onMoveEnd: function() {
                // console.log(e.target);
            },
        });

        $scope.addClass('init-before-after');
    }


    $(window).on('elementor/frontend/init', () => {
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-project-before-after.default', ($scope) => {
            if ($scope.closest('.e-n-tabs-content').length) {
                elementorFrontend.elements.$window.on('elementor/nested-tabs/activate', function($requestedContent) {
                    init_view($scope);
                });
            } else {
                init_view($scope);
            }
        });
    });

})(jQuery);
