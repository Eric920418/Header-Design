<?php
if ( ! function_exists( 'antra_get_thumbnail_service_url' ) ) {
	/**
	 * Output the end of a service loop. By default this is a UL.
	 *
	 * @param bool $echo Should echo?.
	 * @return string
	 */
	function antra_get_thumbnail_service_url() {
		$id = get_the_ID();
		$size = 'large';
		if (has_post_thumbnail( $id ) ) {
			$image = wp_get_attachment_image_src( get_post_thumbnail_id( $id ), $size );
			return $image[0];
		}

		// use first attached image
		$images = get_children( 'post_type=attachment&post_mime_type=image&post_parent=' . $id );
		if (!empty($images)) {
			$image = reset($images);
			$image_data = wp_get_attachment_image_src( $id, $size );
			return $image_data[0];
		}

		// use no preview fallback
		return Elementor\Utils::get_placeholder_image_src();
	}
}


if (!function_exists('antra_service_loop_title')) {
    function antra_service_loop_title(bool $show_link = true) {
        ?>
        <h3 class="service-loop-title">
            <?php 
            if ($show_link) {
                printf('<a href="%s">', get_the_permalink());
            }
            the_title();
            if ($show_link) {
                printf('</a>');
            }
            ?>
		</h3>
        <?php
    }
}

if (!function_exists('antra_service_loop_excerpt')) {
    function antra_service_loop_excerpt() {
        ?>
        <div class="service-loop-exerpt"><?php the_excerpt(); ?></div>
        <?php
    }
}

if (!function_exists('antra_service_loop_index')) {
    function antra_service_loop_index($index, $before = '', $after = '') {
        if (is_int($index)) {
            $index = str_pad($index, 2, '0', STR_PAD_LEFT);
        }
		?>
        <div class="service-index-item"><span><?php printf('%1$s%2$s%3$s', $before, esc_html($index), $after ); ?></span></div>
        <?php
    }
}

if (!function_exists('antra_service_loop_button')) {
    function antra_service_loop_button($post = 0) {
        ?>
        <div class="service-button">
            <a class="more-link" href="<?php the_permalink($post) ?>">
                  <span class="elementor-button-content-wrapper">
                     <span class="elementor-button-icon-inner"><i class="antra-icon-arrow-right"></i></span>
                  </span>
            </a>
        </div>
        <?php
    }
}

if (!function_exists('antra_service_loop_icon')) {
    function antra_service_loop_icon($icon = '') {
		if (!empty($icon)) {
			?>
			<div class="service_icon">
				<?php printf('%s', $icon); ?>
			</div>
			<?php
		}
    }
}

if (!function_exists('antra_service_thumbnail')) {
    /**
     * Display service thumbnail
     *
     */
    function antra_service_thumbnail($size = 'post-thumbnail') {
        ?>
        <figure class="post-thumbnail service-image" data-cursor-text="<?php esc_attr_e('View', 'antra') ?>">
            <a href="<?php the_permalink() ?>" title="<?php the_title() ?>">
            <?php 
            if (has_post_thumbnail()) {
                the_post_thumbnail(!is_singular('service') ? $size : 'full'); 
            } else {
                antra_print_placeholder_image(['class' => '']);
            }
            ?>
            </a>
        </figure>
        <?php
        
    }
}

