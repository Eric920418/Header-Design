<?php
if (!function_exists('antra_project_category')) {
    function antra_project_category($before = '', $after = '', $separator = ', ', $post_id = 0) {
        $post_id = empty($post_id) ? get_the_ID() : absint( $post_id );
		echo '<span class="project-category">'.wp_kses_post(get_the_term_list($post_id, 'project-category', $before, $separator, $after)).'</span>';
    }
}

if (!function_exists('antra_project_tag')) {
    function antra_project_tag($before = '', $after = '', $separator = ', ', $post_id = 0) {
        $post_id = empty($post_id) ? get_the_ID() : absint( $post_id );
		echo '<span class="project-tag">'.wp_kses_post(get_the_term_list($post_id, 'post_tag', $before, $separator, $after)).'</span>';
    }
}

if (!function_exists('antra_project_gallery')) {
    function antra_project_gallery($project_id = 0) {
        $project_id = empty($project_id) ? get_the_ID() : absint( $project_id );
        $gallery = get_post_meta( $project_id, '_gallery', 1 );
        
        if (has_post_thumbnail($project_id)) {
            $thumb_id = get_post_thumbnail_id($project_id);
            $thumb_url = get_the_post_thumbnail_url($project_id,'full');
            if (empty($gallery)) {
                $gallery = [$thumb_id => $thumb_url];
            } else {
                $gallery = [$thumb_id => $thumb_url] + $gallery;
            }
        }

        if (!empty($gallery)) {
            $count = count((array) $gallery);
            $inner_class = 'project-gallery-inner';
            if ($count < 2) {
                $inner_class .= ' single-gallery';
            }
            echo '<div class="'.$inner_class.'" data-viewmore="'.__('View more', 'antra').'">';
                get_template_part('template-parts/project/content-single', 'gallery', [
                    'project_id' => $project_id,
                    'gallery' => $gallery,
                ]);
            echo '</div>';
        }
    }
}

if (!function_exists('antra_project_loop_title')) {
    function antra_project_loop_title(bool $show_link = true) {
        ?>
        <h3 class="project-loop-title">
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

if (!function_exists('antra_project_loop_button')) {
    function antra_project_loop_button() {
        ?>
        <div class="project-button">
            <a class="more-link" href="<?php the_permalink() ?>" title="<?php the_title() ?>"><?php _e('More Details', 'antra') ?></a>
        </div>
        <?php
    }
}

if (!function_exists('antra_project_loop_excerpt')) {
    function antra_project_loop_excerpt() {
        ?>
        <div class="project-loop-exerpt"><?php the_excerpt(); ?></div>
        <?php
    }
}

if (!function_exists('antra_project_thumbnail')) {
    /**
     * Display project thumbnail
     *
     */
    function antra_project_thumbnail($size = 'post-thumbnail', $show_button = false, $button_text = '') {
        ?>
        <figure class="post-thumbnail project-image">
            <a href="<?php the_permalink() ?>" title="<?php the_title() ?>" data-cursor-text="<?php esc_attr_e('View', 'antra') ?>">
                <?php if ($show_button) { 
                    $button_text = empty($button_text) ? __('View', 'antra') : $button_text;
                    ?>
                    <span class="view-btn"><span><?php echo esc_html($button_text) ?></span></span>
                <?php } ?>
                <?php 
                if (has_post_thumbnail()) {
                    the_post_thumbnail(!is_singular('project') ? $size : 'full'); 
                } else {
                    antra_print_placeholder_image(['class' => '']);
                }
                ?>
            </a>
        </figure>
        <?php
    }
}

if (!function_exists('antra_project_socials')) {
    function antra_project_socials() {
		$project_socials_group = get_post_meta(get_the_ID(), 'project_socials_group', true);
        ob_start();
		if($project_socials_group) { 
            ?>
            <ol class="project_socials">
                <?php if(!empty($project_socials_group[0]['fb_url'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($project_socials_group[0]['fb_url']) ?>" target="_blank"><i class="antra-icon-facebook-f"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($project_socials_group[0]['x_url'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($project_socials_group[0]['x_url']) ?>" target="_blank"><i class="antra-icon-twitter"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($project_socials_group[0]['pin_url'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($project_socials_group[0]['pin_url']) ?>" target="_blank"><i class="antra-icon-pinterest-p"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($project_socials_group[0]['ig_url'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($project_socials_group[0]['ig_url']) ?>" target="_blank"><i class="antra-icon-instagram"></i></a>
                    </li>
                <?php } ?>
                <?php do_action('antra_project_more_socials'); ?>
            </ol>
            <?php 
        }
        echo wp_kses_post( apply_filters('antra_template_project_socials', ob_get_clean()) );
    }
}

if (!function_exists('antra_project_meta')) {
    /**
     * Show meta of current project
     *
     * @param boolean $show_category
     * @param boolean $show_tag
     * @param boolean $show_social
     */
    function antra_project_meta($show_category = true, $show_tag = true, $show_social = true, $post_id = 0) {
        $post_id = empty($post_id) ? get_the_ID() : absint( $post_id );
		
        $html = '';
        if ($show_category) {
            $terms = get_the_terms( $post_id, 'project-category' );
            if (!empty($terms) && !is_wp_error($terms)) {
                ob_start();
                ?>
                <div class="project-item-meta">
                    <span class="meta-label"><?php echo esc_html(_n( 'Category', 'Categories', count($terms), 'antra' )); ?>:</span>
                    <?php antra_project_category(); ?>
                </div>
                <?php
                $html .= ob_get_clean();
            }
        }
        if ($show_tag) {
            $terms = get_the_terms( $post_id, 'post_tag' );
            if (!empty($terms) && !is_wp_error($terms)) {
                ob_start();
                ?>
                <div class="project-item-meta">
                    <span class="meta-label"><?php echo esc_html(_n( 'Tag', 'Tags', count($terms), 'antra' )); ?>:</span>
                    <?php antra_project_tag('', '', ''); ?>
                </div>
                <?php
                $html .= ob_get_clean();
            }
        }
        if ($show_social) {
            $terms = get_the_terms( $post_id, 'post_tag' );
            if (!empty($terms) && !is_wp_error($terms)) {
                ob_start();
                ?>
                <div class="project-item-meta">
                    <span class="meta-label"><?php esc_html_e('Share', 'antra'); ?>:</span>
                    <?php antra_project_socials(); ?>
                </div>
                <?php
                $html .= ob_get_clean();
            }
        }

        echo wp_kses_post('<div class="project-metas-data">'.$html.'</div>');
    }
}

if (!function_exists('antra_project_footer_meta')) {
    /**
     * Show meta of current project
     *
     */
    function antra_project_footer_meta() {
        antra_project_meta($show_category = true, $show_tag = true, $show_social = true);
    }
}

if (!function_exists('antra_project_location')) {
    function antra_project_location($post_id = 0) {
        $post_id = empty($post_id) ? get_the_ID() : absint( $post_id );
        $project_location = get_post_meta(get_the_ID(), '_project_location', true);
        if (!empty($project_location)) {
            echo '<span class="project-location">'.esc_html($project_location).'</span>';
        }
    }
}

if (!function_exists('antra_project_date')) {
    function antra_project_date($format = 'm/d/Y') {
        $post_id = empty($post_id) ? get_the_ID() : absint( $post_id );
        $project_date = get_post_meta(get_the_ID(), '_project_date', true);
        if (!empty($project_date)) {
            $date = DateTime::createFromFormat('m/d/Y', $project_date);
            $date = $date->format($format);
            echo '<span class="project-date">'.esc_html($date).'</span>';
        }
    }
}

if (!function_exists('antra_get_default_project')) {
    function antra_get_default_project() {
        $args = [
            'numberposts' => 1,
            'post_type'   => 'project',
            'fields' => 'ids',
            'orderby' => 'date',
            //'order' => 'ASC'
        ];
        $post_id = get_posts($args);
        if(!empty($post_id) && isset($post_id[0])){
            return $post_id[0];
        }else{
            return false;
        }

    }
}

if (!function_exists('antra_project_loop_index')) {
    function antra_project_loop_index($index, $before = '', $after = '') {
        if (is_int($index)) {
            $index = str_pad($index, 2, '0', STR_PAD_LEFT);
        }
		?>
        <div class="project-index-item"><span><?php printf('%1$s%2$s%3$s', $before, esc_html($index), $after ); ?></span></div>
        <?php
    }
}
