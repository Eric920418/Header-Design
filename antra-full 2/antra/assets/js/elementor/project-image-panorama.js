(function ($) {
    "use strict";

    function init_view($scope) {
        if ($scope.find('.antra-panorama').hasClass('init-panorama')) {
            return;
        }

        var panorama, viewer, container;
        var antra_panorama = $('.antra-panorama', $scope),
            data = antra_panorama.data('settings');
        
        container = $scope[0].querySelector('.antra-panorama');
        panorama = new PANOLENS.ImagePanorama(data.img);
        viewer = new PANOLENS.Viewer({
            container: container,
            cameraFov: 100
        });
        viewer.add(panorama);

        $scope.find('.antra-panorama').addClass('init-panorama');
    }

    $(window).on('elementor/frontend/init', () => {
        elementorFrontend.hooks.addAction('frontend/element_ready/antra-project-image-panorama.default', ($scope) => {
            if ($scope.closest('.e-n-tabs-content').length) {
                elementorFrontend.elements.$window.on('elementor/nested-tabs/activate', function($requestedContent) {
                    setTimeout(() => {
                        init_view($scope);
                    }, 1000);
                });
            } else {
                init_view($scope);
            }
        });
    });
})
(jQuery);