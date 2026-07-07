(function ($) {
    "use strict";

    
    $(window).on('elementor/frontend/init', () => {

        function getBatch(batch_index, per_page, images_arr) {
            var batch_index = batch_index - 1,
                start = batch_index * per_page,
                end = start + per_page;
            
            return images_arr.slice(start, end);
        }

        elementorFrontend.hooks.addAction('frontend/element_ready/antra-image-gallery.default', ($scope) => {
            var btn = $('.loadmore-btn', $scope),
                gallery_list = $('.antra-con-inner', $scope),
                wrapper = $('.elementor-antra-image-gallery', $scope),
                images_arr = wrapper.data('images'),
                per_page = wrapper.data('per_page'),
                max_page = Math.ceil(images_arr.length / per_page);
            
            btn.on('click', function(e) {
                e.preventDefault();
                
                if (btn.hasClass('loading')) {
                    return false;
                }
                btn.addClass('loading');

                let batch_index = parseInt(btn.attr('batch_index') ?? 2);
                let batch = getBatch(batch_index, per_page, images_arr);
                if (batch.length) {
                    var list_more = '';
                    $.each(batch, function(i, val) {
                        var item = $('.elementor-antra-item-image-gallery:nth-child(1)', $scope).clone();
                        item.find('a').attr('href', val.image_url_full);
                        item.find('img').attr({
                            'src': val.image_url,
                            'alt': val.alt_img,
                        });
                        item.addClass('loadmore-item');
                        item.hide();
                        list_more += $('<div>').append(item).html();
                    })
                    
                    setTimeout(function() { 
                        gallery_list.append(list_more);

                        let loadmore_item = $('.loadmore-item', gallery_list);
                        if(loadmore_item.length) {
                            loadmore_item.fadeIn(1000);
                            loadmore_item.removeClass('loadmore-item');
                        }

                        if (batch_index == max_page) {
                            btn.remove();
                        } else {
                            btn.attr('batch_index', batch_index + 1);
                        }

                        btn.removeClass('loading');
                    }, 1000);
                } else {
                    btn.removeClass('loading');
                }
            })
        });
    });
})(jQuery);

