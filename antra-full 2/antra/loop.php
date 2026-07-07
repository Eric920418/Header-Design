<?php
/**
 * The loop template file.
 *
 * Included on pages like index.php, archive.php and search.php to display a loop of posts
 * Learn more: https://codex.wordpress.org/The_Loop
 *
 * @package antra
 */

/**
 * Functions hooked in to antra_loop_before action
 *
 *  * @see antra_blog_category_navigation - 10
 *
 */
do_action('antra_loop_before');

$blog_style  = antra_get_theme_option('blog_style');
$check_style = $blog_style && $blog_style !== 'standard';
$class       = '';
if ($check_style) {
    if ($blog_style == 'list') {
        $class = 'blog-style-list elementor-grid-1';
    } else {
        $class = 'blog-style-grid';
        $class .= ' elementor-grid-' . antra_get_theme_option('blog_columns', 3);
        $class .= ' elementor-grid-laptop-' . antra_get_theme_option('blog_columns_laptop', 3);
        $class .= ' elementor-grid-tablet-' . antra_get_theme_option('blog_columns_tablet', 2);
        $class .= ' elementor-grid-mobile-' . antra_get_theme_option('blog_columns_mobile', 1);
    }
}
?>
    <div class="<?php echo esc_attr($class) ?>">
        <div class="elementor-grid">
            <?php
            while (have_posts()) :
                the_post();
                /**
                 * Include the Post-Format-specific template for the content.
                 * If you want to override this in a child theme, then include a file
                 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
                 */
                if ($check_style) {
                    get_template_part('template-parts/posts-grid/item-post-' . $blog_style);
                } else {
                    get_template_part('content', get_post_format());
                }


            endwhile; ?>
        </div>
    </div>
<?php

/**
 * Functions hooked in to antra_loop_after action
 *
 * @see antra_paging_nav - 10
 */
do_action('antra_loop_after');