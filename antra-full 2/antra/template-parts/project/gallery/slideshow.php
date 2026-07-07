<?php
/** 
 * Project Gallery slideshow
 * 
 * @uses $args['project_id']
 * @uses $args['gallery']
 * @uses $args['swiper_pagination']
 * 
*/
extract($args);

?>
<div class="antra-wrapper swiper" data-project="<?php echo esc_attr($project_id) ?>">
    <div class="antra-gallery-slideshow antra-con antra-swiper">
        <div class="swiper-wrapper">
            <?php
            foreach ( (array) $gallery as $attachment_id => $attachment_url ) {
                $size = 'large';
                $img = wp_get_attachment_image( $attachment_id, $size );
                if ($img) {
                    ?>
                    <div class="swiper-slide project-slideshow-item">
                        <a class="project-slideshow-inner" data-fancybox="gallery" data-elementor-open-lightbox="no" href="<?php echo esc_url($attachment_url) ?>">
                            <?php printf('%s', $img); ?>
                        </a>
                    </div>
                    <?php
                }
            }
            ?>
        </div>
    </div>
    <?php printf('%s', $swiper_pagination); ?>
</div>
