(function($){
	'use strict';
	
    var panorama, viewer, container;
    var antra_panorama = $('.single-virtual_tour .antra-panorama-image'),
        data = antra_panorama.data('settings');
    container = document.querySelector('.antra-panorama-image');
    panorama = new PANOLENS.ImagePanorama(data.img);
    viewer = new PANOLENS.Viewer({container: container});
    viewer.add(panorama);

})(jQuery);

