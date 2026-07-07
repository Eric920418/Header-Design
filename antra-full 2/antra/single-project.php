<?php
get_header(); ?>

    <div id="primary" class="content-area">
        <main id="main" class="site-main">
            <?php
            while (have_posts()) :
                the_post();

                do_action('antra_single_project_before');

                $template = false;
                if (antra_get_theme_option('project_template', '') != '') {
                    $template = antra_get_page_by_slug(antra_get_theme_option('project_template', ''), 'elementor_library');
                    if (is_object($template)) {
                        $id_template = $template->ID;    
                        echo Elementor\Plugin::instance()->frontend->get_builder_content_for_display($id_template);
                        $template = true;
                    }
                }

                if (!$template) {
                    if (antra_check_post_is_elementor()) {
                        get_template_part('content', 'elementor-builder');
                    } else {
                        get_template_part('template-parts/project/content', 'single');
                    }
                }
                
                do_action('antra_single_project_after');

            endwhile; // End of the loop.
            ?>

        </main><!-- #main -->
    </div><!-- #primary -->
<?php
if (!antra_check_post_is_elementor()) {
    do_action('antra_sidebar');
}
get_footer();
