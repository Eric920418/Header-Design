<?php

/**
 * Sets up the antra_object_loop global from the passed args or from the main query.
 *
 * @since 3.3.0
 * @param array $args Args to pass into the global.
 */
function antra_setup_object_loop( $args = array() ) {
	$default_args = array(
		'loop'         => 0,
		'columns'      => 4,
		'name'         => '',
		'is_shortcode' => false,
		'is_paginated' => true,
		'is_search'    => false,
		'is_filtered'  => false,
		'total'        => 0,
		'total_pages'  => 0,
		'per_page'     => 0,
		'current_page' => 1,
	);

	$default_args = array_merge(
		$default_args,
		array(
			'is_search'    => $GLOBALS['wp_query']->is_search(),
			'total'        => $GLOBALS['wp_query']->found_posts,
			'total_pages'  => $GLOBALS['wp_query']->max_num_pages,
			'per_page'     => $GLOBALS['wp_query']->get( 'posts_per_page' ),
			'current_page' => max( 1, $GLOBALS['wp_query']->get( 'paged', 1 ) ),
		)
	);

	// Merge any existing values.
	if ( isset( $GLOBALS['antra_object_loop'] ) ) {
		$default_args = array_merge( $default_args, $GLOBALS['antra_object_loop'] );
	}

	$GLOBALS['antra_object_loop'] = wp_parse_args( $args, $default_args );

    // echo '<pre>'; print_r($GLOBALS['antra_object_loop']); echo '</pre>';
}

/**
 * Resets the antra_object_loop global.
 *
 * @since 3.3.0
 */
function antra_reset_object_loop() {
	unset( $GLOBALS['antra_object_loop'] );
}

/**
 * Gets a property from the antra_object_loop global.
 *
 * @since 3.3.0
 * @param string $prop Prop to get.
 * @param string $default Default if the prop does not exist.
 * @return mixed
 */
function antra_get_object_loop_prop( $prop, $default = '' ) {
	antra_setup_object_loop(); // Ensure shop loop is setup.

	return isset( $GLOBALS['antra_object_loop'], $GLOBALS['antra_object_loop'][ $prop ] ) ? $GLOBALS['antra_object_loop'][ $prop ] : $default;
}

/**
 * Sets a property in the antra_object_loop global.
 *
 * @since 3.3.0
 * @param string $prop Prop to set.
 * @param string $value Value to set.
 */
function antra_set_object_loop_prop( $prop, $value = '' ) {
	if ( ! isset( $GLOBALS['antra_object_loop'] ) ) {
		antra_setup_object_loop();
	}
	$GLOBALS['antra_object_loop'][ $prop ] = $value;
}


if ( ! function_exists( 'antra_object_loop_start' ) ) {

	/**
	 * Output the start of a object loop. By default this is a UL.
	 *
	 * @param bool $echo Should echo?.
	 * @return string
	 */
	function antra_object_loop_start( $echo = true ) {
		ob_start();

		antra_set_object_loop_prop( 'loop', 0 );

		// wc_get_template( 'loop/loop-start.php' );
        get_template_part( 'template-parts/loop/loop', 'start' );

		$loop_start = apply_filters( 'antra_object_loop_start', ob_get_clean() );

		if ( $echo ) {
			// phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
			printf('%s', $loop_start);
		} else {
			return $loop_start;
		}
	}
}

if ( ! function_exists( 'antra_object_loop_end' ) ) {

	/**
	 * Output the end of a object loop. By default this is a UL.
	 *
	 * @param bool $echo Should echo?.
	 * @return string
	 */
	function antra_object_loop_end( $echo = true ) {
		ob_start();

		// wc_get_template( 'loop/loop-end.php' );
        get_template_part( 'template-parts/loop/loop', 'end' );

		$loop_end = apply_filters( 'antra_object_loop_end', ob_get_clean() );

		if ( $echo ) {
			// phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
			printf('%s', $loop_end);
		} else {
			return $loop_end;
		}
	}
}

/**
 * Resets the antra_object_loop global.
 *
 * @since 3.3.0
 */
function antra_object_reset_loop() {
	unset( $GLOBALS['antra_object_loop'] );
}

if ( ! function_exists( 'antra_get_thumbnail_object_url' ) ) {
	/**
	 * Output the end of a object loop. By default this is a UL.
	 *
	 * @param bool $echo Should echo?.
	 * @return string
	 */
	function antra_get_thumbnail_object_url() {
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

if ( ! function_exists( 'antra_related_object_exclude_current_object' ) ) {
	/**
	 * Filter exclude current object in related objects
	 *
	 * @return void
	 */
	function antra_related_object_exclude_current_object($args) {
		$cur_object = get_the_ID();
		$args['post__not_in'] = [$cur_object];

		return $args;
	}
}

if (!function_exists('antra_object_header')) {
    /**
     * Display the post header with a link to the single post
     *
     * @since 1.0.0
     */
    function antra_object_header() {
        ?>
        <header class="entry-header">
			<?php the_title('<h1 class="alpha entry-title">', '</h1>'); ?>
        </header><!-- .entry-header -->
        <?php
    }
}

if (!function_exists('antra_object_thumbnail')) {
    /**
     * Display object thumbnail
     *
     */
    function antra_object_thumbnail($size = 'post-thumbnail') {
        if (has_post_thumbnail()) {
			?>
            <figure class="post-thumbnail object-image">
				<a href="<?php the_permalink() ?>" title="<?php the_title() ?>">
					<?php the_post_thumbnail(!is_singular() ? $size : 'full'); ?>
				</a>
			</figure>
			<?php
        }
    }
}

if (!function_exists('antra_object_tags')) {
    /**
     * Display the post taxonomies
     *
     * @since 2.4.0
     */
    function antra_object_tags() {
        /* translators: used between list items, there is a space after the comma */

        /* translators: used between list items, there is a space after the comma */
        $tags_list = get_the_tag_list('', '  ');
        ?>
        <aside class="entry-taxonomy">
            <?php if ($tags_list) : ?>
                <div class="tags-links">
                    <span class="screen-reader-text"><?php echo esc_html(_n('Tag:', 'Tags:', count(get_the_tags()), 'antra')); ?></span>
                    <?php printf('%s', $tags_list); ?>
                </div>
            <?php endif; ?>
        </aside>
        <?php
    }
}

if (!function_exists('antra_object_date_with_format')) {
    /**
     * Display the post meta 
     *
     * @since 1.0.1
     */
    function antra_object_date_with_format($format = '') {
        $object_id = get_the_ID();
		$object_time_start = get_post_meta($object_id, 'object_time_start', true);
		$d = get_the_date('d');
		$m = get_the_date('M');
		$y = get_the_date('Y');
		if(!empty($object_time_start)) {
			$d = wp_date('d', $object_time_start);
			$m = wp_date('M', $object_time_start);
			$y = wp_date('Y', $object_time_start);
		}
        ?>
        <div class="posted-on">
            <a href="<?php the_permalink() ?>">
                <span class="posted-on-day"><?php echo esc_html($d) ?></span><span class="posted-on-month"><?php echo esc_html($m) ?></span><span class="posted-on-year"><?php echo esc_html($y) ?></span>
            </a>
        </div>
        <?php
    }
}

if (!function_exists('antra_object_loop_title')) {
    function antra_object_loop_title() {
        ?>
        <h3 class="object-loop-title">
			<a href="<?php the_permalink() ?>"><?php the_title() ?></a>
		</h3>
        <?php
    }
}

if (!function_exists('antra_object_loop_excerpt')) {
    function antra_object_loop_excerpt() {
        ?>
        <div class="object-loop-exerpt"><?php the_excerpt(); ?></div>
        <?php
    }
}

if (!function_exists('antra_object_loop_author')) {
    function antra_object_loop_author() {
		$field = get_post_meta( get_the_ID(), '_created_by', 1 );
		if (!empty($field)) {
			?>
			<div class="object-loop-author"><?php echo esc_html($field); ?></div>
			<?php
		}
    }
}

if (!function_exists('antra_object_loop_date')) {
    function antra_object_loop_date() {
		$field = get_post_meta( get_the_ID(), '_inauguration_date', 1 );
		if (!empty($field)) {
			?>
			<div class="object-loop-date"><?php echo esc_html($field); ?></div>
			<?php
		}
    }
}

if (!function_exists('antra_object_loop_button')) {
    function antra_object_loop_button() {
        ?>
        <div class="object-button"><a class="more-link" href="<?php the_permalink() ?>" title="<?php the_title() ?>"><i class="antra-icon-a-long-right"></i></a></div>
        <?php
    }
}

if (!function_exists('antra_get_default_object')) {
    function antra_get_default_object() {
        $args = [
            'numberposts' => 1,
            'post_type'   => 'object',
            'fields' => 'ids',
            'orderby' => 'date',
            'order' => 'ASC'
        ];
        $post_id = get_posts($args);
        if(!empty($post_id) && isset($post_id[0])){
            return $post_id[0];
        }else{
            return false;
        }

    }
}


if (!function_exists('antra_object_meta')) {
    /**
     * Display the post meta
     *
     * @since 1.0.0
     */
    function antra_object_meta($atts = array()) {
        global $post;
        if ('post' !== get_post_type()) {
            return;
        }

        extract(
            shortcode_atts(
                array(
                    'show_date'    => true,
                    'show_author'  => true,
                ),
                $atts
            )
        );

		?>
		<div class="object-meta">
			<?php 
			if ($show_author) {
				antra_object_loop_author();
			}
			if ($show_date) {
				antra_object_loop_date();
			}
			?>
		</div>
		<?php
	}
}

if (!function_exists('antra_object_socials')) {
    function antra_object_socials() {
		$post_id = get_the_ID();
		$team_socials_group = get_post_meta($post_id, '_antra_socials_group', true);
		if($team_socials_group) { ?>
            <ol class="object_socials_list">
                <?php if(!empty($team_socials_group[0]['social_fb'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['social_fb']) ?>" target="_blank"><i class="antra-icon-facebook-f"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($team_socials_group[0]['social_x'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['social_x']) ?>" target="_blank"><i class="antra-icon-twitter"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($team_socials_group[0]['social_ig'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['social_ig']) ?>" target="_blank"><i class="antra-icon-instagram"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($team_socials_group[0]['social_in'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['social_in']) ?>" target="_blank"><i class="antra-icon-linkedin-in"></i></a>
                    </li>
                <?php } ?>
                <?php do_action('antra_object_more_socials', $post_id); ?>
            </ol>
        <?php }
    }
}
