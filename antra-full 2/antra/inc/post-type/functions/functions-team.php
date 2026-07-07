<?php
if (!function_exists('antra_team_header')) {
    /**
     * Display the post header with a link to the single post
     *
     * @since 1.0.0
     */
    function antra_team_header() {
        ?>
        <header class="entry-header">
			<?php the_title('<h1 class="alpha entry-title">', '</h1>'); ?>
        </header><!-- .entry-header -->
        <?php
    }
}

if (!function_exists('antra_team_thumbnail')) {
    /**
     * Display team thumbnail
     *
     */
    function antra_team_thumbnail($size = 'post-thumbnail', bool $show_default = false) {
        if (has_post_thumbnail()) {
			?>
            <figure class="post-thumbnail team-image" data-cursor-text="<?php esc_attr_e('View', 'antra') ?>">
				<a href="<?php the_permalink() ?>" title="<?php the_title() ?>">
					<?php the_post_thumbnail(!is_singular('team') ? $size : 'full'); ?>
				</a>
			</figure>
			<?php
        } elseif ($show_default) {
            ?>
            <figure class="post-thumbnail team-image" data-cursor-text="<?php esc_attr_e('View', 'antra') ?>">
                <a href="<?php the_permalink() ?>" title="<?php the_title() ?>">
                    <?php antra_print_placeholder_image(['class' => '']) ?>
                </a>
            </figure>
            <?php
        }
        
    }
}

if (!function_exists('antra_team_loop_title')) {
    function antra_team_loop_title() {
        ?>
        <h3 class="team-loop-title">
			<a href="<?php the_permalink() ?>"><?php the_title() ?></a>
		</h3>
        <?php
    }
}

if (!function_exists('antra_team_loop_button')) {
    function antra_team_loop_button() {
        ?>
        <div class="team-button">
            <a class="more-link btn-slip-effect" href="<?php the_permalink() ?>" title="<?php the_title() ?>">
                <span class="elementor-button-text" data-text="<?php _e('Open Profile', 'antra') ?>" ><?php _e('Open Profile', 'antra') ?></span>
            </a>
        </div>
        <?php
    }
}

if (!function_exists('antra_team_loop_button_icon')) {
    function antra_team_loop_button_icon($post = 0) {
        ?>
        <div class="team-button">
            <a class="more-link" href="<?php the_permalink($post) ?>">
                <span class="elementor-button-content-wrapper">
                    <span class="elementor-button-icon-inner"><i class="antra-icon-arrow-right"></i></span>
                </span>
            </a>
        </div>
        <?php
    }
}

if (!function_exists('antra_get_default_team')) {
    function antra_get_default_team() {
        $args = [
            'numberposts' => 1,
            'post_type'   => 'team',
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

if (!function_exists('antra_team_loop_index')) {
    function antra_team_loop_index($index) {
		?><div class="team-index-item"><span><?php echo esc_html(str_pad($index, 2, '0', STR_PAD_LEFT)); ?></span></div><?php
    }
}

if (!function_exists('antra_team_loop_job')) {
    function antra_team_loop_job($post = 0) {
        if (empty($post)) {
            $post = get_the_ID();
        }
		$field = get_post_meta( $post, 'team_job', 1 );
		if (!empty($field)) {
			?>
			<div class="team-loop-job"><?php echo esc_html($field); ?></div>
			<?php
		}
    }
}

if (!function_exists('antra_team_socials')) {
    function antra_team_socials() {
		$team_socials_group = get_post_meta(get_the_ID(), 'team_socials_group', true);
		if($team_socials_group) { ?>
            <ol class="team_socials">
                <?php if(!empty($team_socials_group[0]['team_fb'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['team_fb']) ?>" target="_blank"><i class="antra-icon-facebook-f"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($team_socials_group[0]['team_x'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['team_x']) ?>" target="_blank"><i class="antra-icon-twitter"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($team_socials_group[0]['team_ig'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['team_ig']) ?>" target="_blank"><i class="antra-icon-instagram"></i></a>
                    </li>
                <?php } ?>
                <?php if(!empty($team_socials_group[0]['team_in'])) { ?>
                    <li>
                        <a class="antra-icon-socical" href="<?php echo esc_url($team_socials_group[0]['team_in']) ?>" target="_blank"><i class="antra-icon-pinterest-p"></i></a>
                    </li>
                <?php } ?>
                <?php do_action('antra_team_more_socials'); ?>
            </ol>
        <?php }
    }
}

if (!function_exists('antra_team_contact')) {
    function antra_team_contact() {
        $team_phone = get_post_meta(get_the_ID(), 'team_phone', true);
        $team_email = get_post_meta(get_the_ID(), 'team_email', true);
        $team_experience = get_post_meta(get_the_ID(), 'team_experience', true);
        $team_address = get_post_meta(get_the_ID(), 'team_address', true);
        $team_responsibility = get_post_meta(get_the_ID(), 'team_responsibility', true);
		?>
        <ul class="team_contact">
            <?php if(!empty($team_responsibility)) { ?>
                <li class="team_responsibility">
                    <strong><?php _e('Responsibility:', 'antra') ?></strong>
                    <a href="javascript:void(0)"><?php echo esc_html($team_responsibility) ?></a>
                </li>
            <?php } ?>
            <?php if(!empty($team_address)) { ?>
                <li class="team_address">
                    <strong><?php _e('Address:', 'antra') ?></strong>
                    <a href="javascript:void(0)"><?php echo esc_html($team_address) ?></a>
                </li>
            <?php } ?>
            <?php if(!empty($team_experience)) { ?>
                <li class="team_experience">
                    <strong><?php _e('Experience:', 'antra') ?></strong>
                    <a href="javascript:void(0)"><?php echo esc_html($team_experience) ?></a>
                </li>
            <?php } ?>
            <?php if(!empty($team_email)) { ?>
                <li class="team_email">
                    <strong><?php _e('Email:', 'antra') ?></strong>
                    <a href="mailto:<?php echo esc_attr($team_email) ?>"><?php echo esc_html($team_email) ?></a>
                </li>
            <?php } ?>
            <?php if(!empty($team_phone)) { ?>
                <li class="team_phone">
                    <strong><?php _e('Phone:', 'antra') ?></strong>
                    <a href="tel:<?php echo esc_attr($team_phone) ?>"><?php echo esc_html($team_phone) ?></a>
                </li>
            <?php } ?>
        </ul>
        <?php
    }
}

if (!function_exists('antra_team_section_content')) {
    function antra_team_section_content() {
        if (empty(get_the_content())) {
            return;
        }
        ?>
        <div class="team-single-section">
            <h3 class="team-section-title"><?php echo esc_html(apply_filters('antra_team_single_information_title', __('Educational qualification', 'antra'))); ?></h3>
            <div class="team-section-content">
                <?php
                the_content(
                    sprintf(
                        /* translators: %s: post title */
                        esc_html__('Read More', 'antra') . ' %s',
                        '<span class="screen-reader-text">' . get_the_title() . '</span>'
                    )
                );
                
                do_action('antra_team_info_section_content');
                ?>
            </div>
        </div>
        <?php
    }
}

if (!function_exists('antra_team_section_skills')) {
    function antra_team_section_skills() {
        $team_description = get_post_meta(get_the_ID(), 'team_description', true);
        $team_skills_group = get_post_meta(get_the_ID(), 'team_skills_group', true);

        $skills_content = '';
        if(!empty($team_skills_group)) {
            ob_start();
            foreach ($team_skills_group as $i => $skill) { 
                if(empty($skill['title']) || empty($skill['level'])) continue;
                ?>
                <div class="team_skill_item">
                    <span class="team_skill_title"><?php echo esc_html($skill['title']) ?></span>
                    <span class="team_skill_level" style="--skill-level: <?php echo esc_attr($skill['level']) ?>%"><?php echo esc_html($skill['level']) ?>%</span>
                    <span class="team_skill_line"></span>
                    <span class="team_skill_line level_line" style="width: <?php echo esc_attr($skill['level']) ?>%"></span>
                </div>
                <?php
            }
            do_action('antra_team_more_skill');
            $skills_content = ob_get_clean();
        }

        if (!empty($skills_content)) {
            ?>
            <div class="team-single-section">
                <h3 class="team-section-title"><?php echo esc_html(apply_filters('antra_team_single_skill_title', __('Professional Skills', 'antra'))); ?></h3>
                <div class="team-section-content">
                    <?php 
                    if(!empty($team_description)) {
                        echo wp_kses_post( '<div class="team_skill_description">'.$team_description.'</div>' );
                    } 
                    printf('<div class="team_skills">%s</div>', $skills_content);
                    do_action('antra_team_skill_section_content');
                    ?>
                </div>
            </div>
            <?php
        }
        
    }
}

if (!function_exists('antra_team_section_form')) {
    function antra_team_section_form() {
        $team_form = antra_get_theme_option('team_form');

        if (!empty($team_form) && antra_is_contactform_activated()) {
            $form = wpcf7_get_contact_form_by_hash($team_form);
            if ($form) {
                ?>
                <div class="team-single-section">
                    <h3 class="team-section-title"><?php echo esc_html(apply_filters('antra_team_single_form_title', __('Contact Form', 'antra'))); ?></h3>
                    <div class="team-section-content">
                        <?php 
                        printf('%s', antra_do_shortcode('contact-form-7', ['id' => $team_form]));
                        do_action('antra_team_skill_section_content');
                        ?>
                    </div>
                </div>
                <?php
            }    
            ?>
            <?php
        }
        
    }
}

