<?php
/** 
 * Project Gallery slideshow
 * 
 * @uses $args['project_id']
 * @uses $args['gallery']
 * 
*/
extract($args);

?>
<div class="antra-wrapper" data-project="<?php echo esc_attr($project_id) ?>">
    <div class="antra-gallery-grid antra-con">
        <div class="antra-con-inner elementor-grid">
            <?php
            $index = 1;
            foreach ( (array) $gallery as $attachment_id => $attachment_url ) {
                $size = $index === 1 ? 'full' : 'medium';
                $img = wp_get_attachment_image( $attachment_id, $size );
                if ($img) {
                    ?>
                    <div class="project-slideshow-item">
                        <a class="project-slideshow-inner" data-fancybox="gallery" data-elementor-open-lightbox="no" href="<?php echo esc_url($attachment_url) ?>">
                            <?php printf('%s', $img); ?>
                        </a>
                    </div>
                    <?php
                }
                $index++;
            }
            ?>
        </div>
    </div>
</div>
