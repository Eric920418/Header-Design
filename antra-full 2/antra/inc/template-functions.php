<?php

if (!function_exists('antra_blog_category_navigation')) {
    /**
     * Gintea display top blog content
     *
     * @since  1.0.0
     */
    function antra_blog_category_navigation() {
        if (!(is_category() || (!is_front_page() || !is_home()))) return;

        $show_category_navigation = antra_get_theme_option('navigation_blog', 'no');
        if ($show_category_navigation != 'yes') return;

        $cats = get_terms(['taxonomy' => 'category', 'hide_empty' => true]);

        ?>
        <nav class="antra-category-navigation">
            <h2 class="antra-title-navigation"><?php esc_html_e('Latest', 'antra'); ?></h2>
            <ul class="antra-list-categories">
                <?php
                if ($cats && !empty($cats)) {
                    $blog_page = get_option( 'page_for_posts' );
                    if ($blog_page || $blog_page !== '0') {
                        $actived = (!is_category()) ? 'actived' : '';
                        $blog_page_url = esc_url(add_query_arg($_GET, get_permalink($blog_page)).'#content');
                        $blog_all = __('All', 'antra');

                        echo <<<HTML
                        <li class="antra-item-category {$actived}">
                            <a href="{$blog_page_url}" title="{$blog_all}">{$blog_all}</a>
                        </li>
                        HTML;
                    }
                    foreach ($cats as $cat) {
                        $actived = '';
                        if (is_category()) {
                            $cur_term = get_queried_object();
                            if (isset($cur_term->term_id) && $cur_term->term_id == $cat->term_id) {
                                $actived = 'actived';
                            }
                        }
                        $cat_link = esc_url(add_query_arg($_GET, get_category_link($cat)).'#content');
                        $cat_name = esc_html($cat->name);

                        echo <<<HTML
                        <li class="antra-item-category {$actived}">
                            <a href="{$cat_link}" title="{$cat_name}">{$cat_name}</a>
                        </li>
                        HTML;
                    }
                }
                else {
                    printf('<li class="antra-no-cats"><p>%s</p></li>', __('There are no categories!', 'antra'));
                }
                ?>
            </ul>
        </nav>
        <?php
    }
}

if (!function_exists('antra_display_comments')) {
    /**
     * Antra display comments
     *
     * @since  1.0.0
     */
    function antra_display_comments() {
        // If comments are open or we have at least one comment, load up the comment template.
        if (comments_open() || 0 !== intval(get_comments_number())) :
            comments_template();
        endif;
    }
}

if (!function_exists('antra_comment')) {
    /**
     * Antra comment template
     *
     * @param array $comment the comment array.
     * @param array $args the comment args.
     * @param int $depth the comment depth.
     *
     * @since 1.0.0
     */
    function antra_comment($comment, $args, $depth) {
        if ('div' === $args['style']) {
            $tag       = 'div';
            $add_below = 'comment';
        } else {
            $tag       = 'li';
            $add_below = 'div-comment';
        }
        ?>
        <<?php echo esc_attr($tag) . ' '; ?><?php comment_class(empty($args['has_children']) ? '' : 'parent'); ?> id="comment-<?php comment_ID(); ?>">

        <div class="comment-body">
            <div class="comment-author vcard">
                <?php echo get_avatar($comment, 50); ?>
            </div>
            <?php if ('div' !== $args['style']) : ?>
            <div id="div-comment-<?php comment_ID(); ?>" class="comment-content">
                <?php endif; ?>
                <div class="comment-head">
                    <div class="comment-meta comment-meta-data">

                        <?php printf('<cite class="fn">%s</cite>', get_comment_author_link()); ?>

                        <a href="<?php echo esc_url(htmlspecialchars(get_comment_link($comment->comment_ID))); ?>" class="comment-date">
                            <?php echo '<time datetime="' . get_comment_date('c') . '">' . get_comment_date() . '</time>'; ?>
                        </a>

                        <?php if ('0' === $comment->comment_approved) : ?>
                            <em class="comment-awaiting-moderation"><?php esc_html_e('Your comment is awaiting moderation.', 'antra'); ?></em>
                            <br/>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="comment-text">
                    <?php comment_text(); ?>
                </div>

                <div class="reply">
                    <?php
                    comment_reply_link(
                        array_merge(
                            $args, array(
                                'add_below' => $add_below,
                                'depth'     => $depth,
                                'max_depth' => $args['max_depth'],
                            )
                        )
                    );
                    ?>
                    <?php edit_comment_link(esc_html__('Edit', 'antra'), '  ', ''); ?>
                </div>
                <?php if ('div' !== $args['style']) : ?>
            </div>
        <?php endif; ?>
        </div>
        <?php
    }
}

if (!function_exists('antra_credit')) {
    /**
     * Display the theme credit
     *
     * @return void
     * @since  1.0.0
     */
    function antra_credit() {
        ?>
        <div class="site-info">
            <?php echo apply_filters('antra_copyright_text', $content = '&copy; ' . date('Y') . ' ' . '<a class="site-url" href="' . esc_url(home_url()) . '">' . esc_html(get_bloginfo('name')) . '</a>' . esc_html__('. All Rights Reserved.', 'antra')); ?>
        </div><!-- .site-info -->
        <?php
    }
}

if (!function_exists('antra_social')) {
    function antra_social() {
        $social_list = antra_get_theme_option('social_text', []);
        if (empty($social_list)) {
            return;
        }
        ?>
        <div class="antra-social">
            <ul>
                <?php

                foreach ($social_list as $social_item) {
                    ?>
                    <li><a href="<?php echo esc_url($social_item); ?>"></a></li>
                    <?php
                }
                ?>

            </ul>
        </div>
        <?php
    }
}

if (!function_exists('antra_site_branding')) {
    /**
     * Site branding wrapper and display
     *
     * @return void
     * @since  1.0.0
     */
    function antra_site_branding() {
        ?>
        <div class="site-branding">
            <?php echo antra_site_title_or_logo(); ?>
        </div>
        <?php
    }
}

if (!function_exists('antra_site_title_or_logo')) {
    /**
     * Display the site title or logo
     *
     * @param bool $echo Echo the string or return it.
     *
     * @return string
     * @since 2.1.0
     */
    function antra_site_title_or_logo() {
        ob_start();
        the_custom_logo(); ?>
        <div class="site-branding-text">
            <?php if (is_front_page()) : ?>
                <h1 class="site-title"><a href="<?php echo esc_url(home_url('/')); ?>"
                                          rel="home"><?php bloginfo('name'); ?></a></h1>
            <?php else : ?>
                <p class="site-title"><a href="<?php echo esc_url(home_url('/')); ?>"
                                         rel="home"><?php bloginfo('name'); ?></a></p>
            <?php endif; ?>

            <?php
            $description = get_bloginfo('description', 'display');

            if ($description || is_customize_preview()) :
                ?>
                <p class="site-description"><?php echo esc_html($description); ?></p>
            <?php endif; ?>
        </div><!-- .site-branding-text -->
        <?php
        $html = ob_get_clean();
        return $html;
    }
}

if (!function_exists('antra_primary_navigation')) {
    /**
     * Display Primary Navigation
     *
     * @return void
     * @since  1.0.0
     */
    function antra_primary_navigation() {
        ?>
        <nav class="main-navigation" role="navigation"
             aria-label="<?php esc_attr_e('Primary Navigation', 'antra'); ?>">
            <?php
            wp_nav_menu(apply_filters('antra_nav_menu_args', [
                'fallback_cb'     => '__return_empty_string',
                'theme_location'  => 'primary',
                'container_class' => 'primary-navigation',
                'link_before'     => '<span class="menu-title">',
                'link_after'      => '</span>'
            ]));
            ?>
        </nav>
        <?php
    }
}

if (!function_exists('antra_mobile_navigation')) {
    /**
     * Display Handheld Navigation
     *
     * @return void
     * @since  1.0.0
     */
    function antra_mobile_navigation() {
        ?>
        <div class="mobile-nav-tabs">
            <ul>
                <?php if (isset(get_nav_menu_locations()['handheld'])) { ?>
                    <li class="mobile-tab-title mobile-pages-title active" data-menu="pages">
                        <span><?php echo esc_html(get_term(get_nav_menu_locations()['handheld'], 'nav_menu')->name); ?></span>
                    </li>
                <?php } ?>
                <?php if (isset(get_nav_menu_locations()['vertical'])) { ?>
                    <li class="mobile-tab-title mobile-categories-title" data-menu="categories">
                        <span><?php echo esc_html(get_term(get_nav_menu_locations()['vertical'], 'nav_menu')->name); ?></span>
                    </li>
                <?php } ?>
            </ul>
        </div>
        <nav class="mobile-menu-tab mobile-navigation mobile-pages-menu active"
             aria-label="<?php esc_attr_e('Mobile Navigation', 'antra'); ?>">
            <?php
            wp_nav_menu(
                array(
                    'theme_location'  => 'handheld',
                    'container_class' => 'handheld-navigation',
                )
            );
            ?>
        </nav>
        <nav class="mobile-menu-tab mobile-navigation-categories mobile-categories-menu"
             aria-label="<?php esc_attr_e('Mobile Navigation', 'antra'); ?>">
            <?php
            wp_nav_menu(
                array(
                    'theme_location'  => 'vertical',
                    'container_class' => 'handheld-navigation',
                )
            );
            ?>
        </nav>
        <?php
    }
}

if (!function_exists('antra_homepage_header')) {
    /**
     * Display the page header without the featured image
     *
     * @since 1.0.0
     */
    function antra_homepage_header() {
        edit_post_link(esc_html__('Edit this section', 'antra'), '', '', '', 'button antra-hero__button-edit');
        ?>
        <header class="entry-header">
            <?php
            the_title('<h1 class="entry-title">', '</h1>');
            ?>
        </header><!-- .entry-header -->
        <?php
    }
}

if (!function_exists('antra_page_header')) {
    /**
     * Display the page header
     *
     * @since 1.0.0
     */
    function antra_page_header() {

        if (is_front_page() || !is_page_template('default')) {
            return;
        }

        if (antra_is_elementor_activated() && function_exists('hfe_init')) {
            if (!class_exists('Lexus_breadcrumb') || Lexus_breadcrumb::get_template_id() !== '') {
                return;
            }
        }

        ?>
        <header class="entry-header">
            <?php
            if (has_post_thumbnail()) {
                antra_post_thumbnail('full');
            }
            the_title('<h1 class="entry-title">', '</h1>');
            ?>
        </header><!-- .entry-header -->
        <?php
    }
}

if (!function_exists('antra_page_content')) {
    /**
     * Display the post content
     *
     * @since 1.0.0
     */
    function antra_page_content() {
        do_action('antra_before_page_content');
        ?>
        <div class="entry-content">
            <?php the_content(); ?>
            <?php
            wp_link_pages(
                array(
                    'before' => '<div class="page-links">' . esc_html__('Pages:', 'antra'),
                    'after'  => '</div>',
                    )
                );
                ?>
        </div><!-- .entry-content -->
        <?php
        do_action('antra_after_page_content');
    }
}

if (!function_exists('antra_post_header')) {
    /**
     * Display the post header with a link to the single post
     *
     * @since 1.0.0
     */
    function antra_post_header() {
        ?>
        <header class="entry-header">
            <?php
            if (is_single()) { ?>
                <div class="entry-meta-top">
                    <?php antra_post_meta(['show_cat' => true, 'show_author' => true, 'show_date' => true, 'show_comment' => false]); ?>
                </div>
                <?php the_title('<h1 class="alpha entry-title">', '</h1>'); ?>
                <?php
            } else { ?>
                <?php if ('post' == get_post_type()) { ?>
                    <div class="entry-meta-top">
                        <?php antra_post_meta(['show_cat' => true, 'show_author' => true, 'show_date' => true, 'show_comment' => false]); ?>
                    </div>
                    <?php the_title('<h3 class="entry-title"><a href="' . esc_url(get_permalink()) . '" rel="bookmark">', '</a></h3>'); ?>
                <?php } ?>
            <?php } ?>
        </header><!-- .entry-header -->
        <?php
    }
}

if (!function_exists('antra_post_excerpt')) {
    /**
     * Display post description
     *
     * @since 1.0.0
     */
    function antra_post_excerpt() {
        echo '<div class="post-excerpt">';
        the_excerpt();
        echo '</div>';
    }
}

if (!function_exists('antra_post_content')) {
    /**
     * Display the post content with a link to the single post
     *
     * @since 1.0.0
     */
    function antra_post_content() {
        ?>
        <div class="entry-content">
            <?php

            /**
             * Functions hooked in to antra_post_content_before action.
             *
             */
            do_action('antra_post_content_before');


            if (is_single()) {
                the_content(
                    sprintf(
                    /* translators: %s: post title */
                        esc_html__('Read More', 'antra') . ' %s',
                        '<span class="screen-reader-text">' . get_the_title() . '</span>'
                    )
                );
            } else {
                ?>
                <div class="entry-excerpt"><?php the_excerpt(); ?></div>
                <?php echo '<div class="more-link-wrap">
                    <a class="more-link" href="' . get_permalink() . '"></span>' . esc_html__('read more', 'antra') . '</span></a>';
            }

            /**
             * Functions hooked in to antra_post_content_after action.
             *
             */
            do_action('antra_post_content_after');

            wp_link_pages(
                array(
                    'before' => '<div class="page-links">' . esc_html__('Pages:', 'antra'),
                    'after'  => '</div>',
                )
            );
            ?>
        </div><!-- .entry-content -->
        <?php
    }
}

if (!function_exists('antra_post_meta')) {
    /**
     * Display the post meta
     *
     * @since 1.0.0
     */
    function antra_post_meta($atts = array()) {
        global $post;
        if ('post' !== get_post_type()) {
            return;
        }

        extract(
            shortcode_atts(
                array(
                    'show_cat'     => true,
                    'show_date'    => true,
                    'show_author'  => true,
                    'show_comment' => true,
                ),
                $atts
            )
        );

        $author = '';
        // Author.
        if ($show_author == 1) {
            $author_id = $post->post_author;
            $author    = sprintf(
                '<div class="post-author">%1$s<span>' . esc_html__('By ', 'antra') . '<a href="%2$s" class="url fn" rel="author">%3$s</a></span></div>',
                get_avatar( get_the_author_meta( 'ID', $author_id ), $size = '30', $default = '', $alt = '', $args = array( 'class' => 'wt-author-img' ) ),
                esc_url(get_author_posts_url(get_the_author_meta('ID'))),
                esc_html(get_the_author_meta('display_name', $author_id))
            );
        }

        $categories_list = get_the_category_list('<span class="dot"></span>');
        $categories      = '';
        if ($show_cat && $categories_list) {
            // Make sure there's more than one category before displaying.
            $categories = '<div class="categories-link"> <span class="screen-reader-text">' . esc_html__('Categories', 'antra') . '</span> ' .  $categories_list  . ' </div>';
        }

        $posted_on = '';
//         Posted on.
        if ($show_date) {
            $posted_on = '<div class="posted-on">' . esc_html__('', 'antra') . sprintf('<a href="%1$s" rel="bookmark">%2$s</a>', esc_url(get_permalink()), get_the_date()) . '</div>';
        }

        echo wp_kses(
            sprintf('%1$s %2$s %3$s', $categories, $author, $posted_on), array(
                'div'  => array(
                    'class' => array(),
                ),
                'span' => array(
                    'class' => array(),
                ),
                'a'    => array(
                    'href'  => array(),
                    'rel'   => array(),
                    'class' => array(),
                ),
                'time' => array(
                    'datetime' => array(),
                    'class'    => array(),
                )
            )
        );

        if ($show_comment) { ?>
            <div class="meta-reply">
                <?php
                comments_popup_link(esc_html__('0 comments', 'antra'), esc_html__('1 comment', 'antra'), esc_html__('% comments', 'antra'));
                ?>
            </div>
            <?php
        }

    }
}

if (!function_exists('antra_post_date_with_format')) {
    /**
     * Display the post meta
     *
     * @since 1.0.0
     */
    function antra_post_date_with_format($format = '') {
        global $post;
        ?>
        <div class="posted-on">
            <a href="<?php the_permalink() ?>">
                <span class="posted-on-day"><?php echo esc_html(get_the_date('d')) ?></span><span class="posted-on-month"><?php echo esc_html(get_the_date('M')) ?></span><span class="posted-on-year"><?php echo esc_html(get_the_date('Y')) ?></span>
            </a>
        </div>
        <?php
    }
}

if (!function_exists('antra_get_allowed_html')) {
    function antra_get_allowed_html() {
        return apply_filters(
            'antra_allowed_html',
            array(
                'br'     => array(),
                'i'      => array(),
                'b'      => array(),
                'u'      => array(),
                'em'     => array(),
                'del'    => array(),
                'a'      => array(
                    'href'  => true,
                    'class' => true,
                    'title' => true,
                    'rel'   => true,
                ),
                'strong' => array(),
                'span'   => array(
                    'style' => true,
                    'class' => true,
                ),
            )
        );
    }
}

if (!function_exists('antra_edit_post_link')) {
    /**
     * Display the edit link
     *
     * @since 2.5.0
     */
    function antra_edit_post_link() {
        edit_post_link(
            sprintf(
                wp_kses(__('Edit <span class="screen-reader-text">%s</span>', 'antra'),
                    array(
                        'span' => array(
                            'class' => array(),
                        ),
                    )
                ),
                get_the_title()
            ),
            '<div class="edit-link">',
            '</div>'
        );
    }
}

if (!function_exists('antra_categories_link')) {
    /**
     * Prints HTML with meta information for the current cateogries
     */
    function antra_categories_link() {

        // Get Categories for posts.
        $categories_list = get_the_category_list('');

        if ('post' === get_post_type() && $categories_list) {
            // Make sure there's more than one category before displaying.
            echo '<div class="categories-link"><span class="screen-reader-text">' . esc_html__('Categories', 'antra') . '</span>' . $categories_list . '</div>';
        }
    }
}

if (!function_exists('antra_post_taxonomy')) {
    /**
     * Display the post taxonomies
     *
     * @since 2.4.0
     */
    function antra_post_taxonomy() {
        /* translators: used between list items, there is a space after the comma */

        /* translators: used between list items, there is a space after the comma */
        $tags_list = get_the_tag_list('', '');
        ?>
        <aside class="entry-taxonomy">
            <?php if ($tags_list) : ?>
                <div class="tags-links">
                    <span class="screen-reader-text"><?php echo esc_html(_n('Tag:', 'Tags:', count(get_the_tags()), 'antra')); ?></span>
                    <?php printf('%s', $tags_list); ?>
                </div>
            <?php endif;
            ?>
        </aside>
        <?php
    }
}

if (!function_exists('antra_paging_nav')) {
    /**
     * Display navigation to next/previous set of posts when applicable.
     */
    function antra_paging_nav() {
        global $wp_query;

        $args = array(
            'type'      => 'list',
            'next_text' => '<span>' . esc_html__('', 'antra') . '<i class="antra-icon-arrow-right"></i></span>',
            'prev_text' => '<span><i class="antra-icon-arrow-left"></i>' . esc_html__('', 'antra') . '</span>',
        );

        the_posts_pagination($args);
    }
}

if (!function_exists('antra_post_nav')) {
    /**
     * Display navigation to next/previous post when applicable.
     */
    function antra_post_nav() {

        $prev_post      = get_previous_post();
        $next_post      = get_next_post();
        $args           = [];
        $thumbnail_prev = '';
        $thumbnail_next = '';

        if ($prev_post) {
            $thumbnail_prev = get_the_post_thumbnail($prev_post->ID, array(60, 60));
        };

        if ($next_post) {
            $thumbnail_next = get_the_post_thumbnail($next_post->ID, array(60, 60));
        };
        if ($next_post) {
            $args['next_text'] = '<span class="nav-content"><span class="reader-text">' . esc_html__('Next Post', 'antra') . '<span><i class="antra-icon-chevron-right"></i></span>' . ' </span><span class="title">%title</span></span>' . $thumbnail_next;
        }
        if ($prev_post) {
            $args['prev_text'] = $thumbnail_prev . '<span class="nav-content"><span class="reader-text">' .'<span><i class="antra-icon-chevron-left"></i></span>' . esc_html__('Previous Post', 'antra') . ' </span><span class="title">%title</span></span> ';
        }

        the_post_navigation($args);

    }
}

if (!function_exists('antra_posted_on')) {
    /**
     * Prints HTML with meta information for the current post-date/time and author.
     *
     * @deprecated 2.4.0
     */
    function antra_posted_on() {
        _deprecated_function('antra_posted_on', '2.4.0');
    }
}

if (!function_exists('antra_homepage_content')) {
    /**
     * Display homepage content
     * Hooked into the `homepage` action in the homepage template
     *
     * @return  void
     * @since  1.0.0
     */
    function antra_homepage_content() {
        while (have_posts()) {
            the_post();

            get_template_part('content', 'homepage');

        } // end of the loop.
    }
}

if (!function_exists('antra_get_sidebar')) {
    /**
     * Display antra sidebar
     *
     * @uses get_sidebar()
     * @since 1.0.0
     */
    function antra_get_sidebar() {
        get_sidebar();
    }
}

if (!function_exists('antra_post_thumbnail')) {
    /**
     * Display post thumbnail
     *
     * @param string $size the post thumbnail size.
     *
     * @uses has_post_thumbnail()
     * @uses the_post_thumbnail
     * @var $size . thumbnail|medium|large|full|$custom
     * @since 1.5.0
     */
    function antra_post_thumbnail($size = 'post-thumbnail', $showcate = false, $default = false ) {
        echo '<div class="post-thumbnail">';
        if (has_post_thumbnail()) {
            if ($showcate) { ?>
                <?php antra_post_meta(['show_cat' => true, 'show_date' => false, 'show_author' => false, 'show_comment' => false]); ?>
            <?php }
            the_post_thumbnail(!is_singular() ? $size : 'full');
        } elseif ($default) {
            ?>
            <img src="<?php echo esc_url(antra_get_placeholder_image()); ?>" class="antra-default-thumb-post wp-post-image" alt="">
            <?php antra_post_meta(['show_cat' => true, 'show_date' => false, 'show_author' => false, 'show_comment' => false]); ?>
            <div class="post-meta">
                <div class="entry-meta-top">
                    <?php antra_post_meta(['show_cat' => false, 'show_date' => false, 'show_author' => false, 'show_comment' => false]); ?>
                </div>
            </div>
            <?php
        }
        echo '</div>';
    }
}

if (!function_exists('antra_primary_navigation_wrapper')) {
    /**
     * The primary navigation wrapper
     */
    function antra_primary_navigation_wrapper() {
        echo '<div class="antra-primary-navigation"><div class="col-full">';
    }
}

if (!function_exists('antra_primary_navigation_wrapper_close')) {
    /**
     * The primary navigation wrapper close
     */
    function antra_primary_navigation_wrapper_close() {
        echo '</div></div>';
    }
}

if (!function_exists('antra_header_container')) {
    /**
     * The header container
     */
    function antra_header_container() {
        echo '<div class="col-full">';
    }
}

if (!function_exists('antra_header_container_close')) {
    /**
     * The header container close
     */
    function antra_header_container_close() {
        echo '</div>';
    }
}

if (!function_exists('antra_header_custom_link')) {
    function antra_header_custom_link() {
        echo antra_get_theme_option('custom-link', '');
    }

}

if (!function_exists('antra_header_contact_info')) {
    function antra_header_contact_info() {
        echo antra_get_theme_option('contact-info', '');
    }

}

if (!function_exists('antra_header_account')) {
    function antra_header_account() {

        if (!antra_get_theme_option('show_header_account', true)) {
            return;
        }

        if (antra_is_woocommerce_activated()) {
            $account_link = get_permalink(get_option('woocommerce_myaccount_page_id'));
        } else {
            $account_link = wp_login_url();
        }
        ?>
        <div class="site-header-account">
            <a href="<?php echo esc_url($account_link); ?>">
                <i class="antra-icon-user"></i>
            </a>
            <div class="account-dropdown">

            </div>
        </div>
        <?php
    }

}

if (!function_exists('antra_template_account_dropdown')) {
    function antra_template_account_dropdown() {
        if (!antra_get_theme_option('show_header_account', true)) {
            return;
        }
        ?>
        <div class="account-wrap d-none">
            <div class="account-inner <?php if (is_user_logged_in()): echo "dashboard"; endif; ?>">
                <?php if (!is_user_logged_in()) {
                    antra_form_login();
                } else {
                    antra_account_dropdown();
                }
                ?>
            </div>
        </div>
        <?php
    }
}

if (!function_exists('antra_form_login')) {
    function antra_form_login() {
        if (antra_is_woocommerce_activated() && 'yes' === get_option('woocommerce_enable_myaccount_registration')) {
            $register_link = get_permalink(get_option('woocommerce_myaccount_page_id'));
        } else {
            $register_link = wp_registration_url();
        }
        ?>
        <div class="login-form-head">
            <span class="login-form-title"><?php esc_html_e('Sign in', 'antra') ?></span>
            <span class="pull-right">
                <a class="register-link" href="<?php echo esc_url($register_link); ?>"
                   title="<?php esc_attr_e('Register', 'antra'); ?>"><?php esc_html_e('Create an Account', 'antra'); ?></a>
            </span>
        </div>
        <form class="antra-login-form-ajax" data-toggle="validator">
            <p>
                <label><?php esc_html_e('Username or email', 'antra'); ?> <span class="required">*</span></label>
                <input name="username" type="text" required placeholder="<?php esc_attr_e('Username', 'antra') ?>">
            </p>
            <p>
                <label><?php esc_html_e('Password', 'antra'); ?> <span class="required">*</span></label>
                <input name="password" type="password" required
                       placeholder="<?php esc_attr_e('Password', 'antra') ?>">
            </p>
            <button type="submit" data-button-action
                    class="btn btn-primary btn-block w-100 mt-1"><?php esc_html_e('Login', 'antra') ?></button>
            <input type="hidden" name="action" value="antra_login">
            <?php wp_nonce_field('ajax-antra-login-nonce', 'security-login'); ?>
        </form>
        <div class="login-form-bottom">
            <a href="<?php echo wp_lostpassword_url(get_permalink()); ?>" class="lostpass-link"
               title="<?php esc_attr_e('Lost your password?', 'antra'); ?>"><?php esc_html_e('Lost your password?', 'antra'); ?></a>
        </div>
        <?php
    }
}

if (!function_exists('')) {
    function antra_account_dropdown() { ?>
        <?php if (has_nav_menu('my-account')) : ?>
            <nav class="social-navigation" role="navigation" aria-label="<?php esc_attr_e('Dashboard', 'antra'); ?>">
                <?php
                wp_nav_menu(array(
                    'theme_location' => 'my-account',
                    'menu_class'     => 'account-links-menu',
                    'depth'          => 1,
                ));
                ?>
            </nav><!-- .social-navigation -->
        <?php else: ?>
            <ul class="account-dashboard">
                <?php if (antra_is_woocommerce_activated()): ?>
                    <li>
                        <a href="<?php echo esc_url(wc_get_page_permalink('myaccount')); ?>"
                           title="<?php esc_attr_e('My account', 'antra'); ?>"><?php esc_html_e('Dashboard', 'antra'); ?></a>
                    </li>
                    <li>
                        <a href="<?php echo esc_url(wc_get_account_endpoint_url('orders')); ?>"
                           title="<?php esc_attr_e('Orders', 'antra'); ?>"><?php esc_html_e('Orders', 'antra'); ?></a>
                    </li>
                    <li>
                        <a href="<?php echo esc_url(wc_get_account_endpoint_url('downloads')); ?>"
                           title="<?php esc_attr_e('Downloads', 'antra'); ?>"><?php esc_html_e('Downloads', 'antra'); ?></a>
                    </li>
                    <li>
                        <a href="<?php echo esc_url(wc_get_account_endpoint_url('edit-address')); ?>"
                           title="<?php esc_attr_e('Edit Address', 'antra'); ?>"><?php esc_html_e('Edit Address', 'antra'); ?></a>
                    </li>
                    <li>
                        <a href="<?php echo esc_url(wc_get_account_endpoint_url('edit-account')); ?>"
                           title="<?php esc_attr_e('Account Details', 'antra'); ?>"><?php esc_html_e('Account Details', 'antra'); ?></a>
                    </li>
                <?php else: ?>
                    <li>
                        <a href="<?php echo esc_url(get_dashboard_url(get_current_user_id())); ?>"
                           title="<?php esc_attr_e('Dashboard', 'antra'); ?>"><?php esc_html_e('Dashboard', 'antra'); ?></a>
                    </li>
                <?php endif; ?>
                <li>
                    <a title="<?php esc_attr_e('Log out', 'antra'); ?>" class="tips"
                       href="<?php echo esc_url(wp_logout_url(home_url())); ?>"><?php esc_html_e('Log Out', 'antra'); ?></a>
                </li>
            </ul>
        <?php endif;

    }
}

if (!function_exists('antra_header_search_popup')) {
    function antra_header_search_popup() {
        ?>
        <div class="site-search-popup">
            <div class="site-search-popup-wrap">
                <a href="#" class="site-search-popup-close">
                    <svg class="close-icon" xmlns="http://www.w3.org/2000/svg" width="23.691" height="22.723" viewBox="0 0 23.691 22.723">
                        <g transform="translate(-126.154 -143.139)">
                            <line x2="23" y2="22" transform="translate(126.5 143.5)" fill="none" stroke="CurrentColor" stroke-width="1"></line>
                            <path d="M0,22,23,0" transform="translate(126.5 143.5)" fill="none" stroke="CurrentColor" stroke-width="1"></path>
                        </g>
                    </svg>
                </a>
                <?php
                if (antra_is_woocommerce_activated() && false) {
                    antra_product_search();
                } else {
                    ?>
                    <div class="site-search">
                        <?php get_search_form(); ?>
                    </div>
                    <?php
                }
                ?>
            </div>
        </div>
        <div class="site-search-popup-overlay"></div>
        <?php
    }
}

if (!function_exists('antra_header_search_button')) {
    function antra_header_search_button() {

        add_action('wp_footer', 'antra_header_search_popup', 1);
        ?>
        <div class="site-header-search">
            <a href="#" class="button-search-popup"><i class="antra-icon-search"></i></a>
        </div>
        <?php
    }
}


if (!function_exists('antra_header_sticky')) {
    function antra_header_sticky() {
        get_template_part('template-parts/header', 'sticky');
    }
}

if (!function_exists('antra_mobile_nav')) {
    function antra_mobile_nav() {
        if (isset(get_nav_menu_locations()['handheld'])) {
            ?>
            <div class="antra-mobile-nav">
                <div class="menu-scroll-mobile">
                    <a href="#" class="mobile-nav-close"><i class="antra-icon-times"></i></a>
                    <?php
                    antra_mobile_navigation();
                    antra_social();
                    ?>
                </div>
                <?php if (antra_is_elementor_activated()) antra_language_switcher_mobile(); ?>
            </div>
            <div class="antra-overlay"></div>
            <?php
        }
    }
}

if (!function_exists('antra_mobile_nav_button')) {
    function antra_mobile_nav_button() {
        if (isset(get_nav_menu_locations()['handheld'])) {
            ?>
            <a href="#" class="menu-mobile-nav-button">
				<span
                        class="toggle-text screen-reader-text"><?php echo esc_html(apply_filters('antra_menu_toggle_text', esc_html__('Menu', 'antra'))); ?></span>
                <div class="antra-icon">
                    <span class="icon-1"></span>
                    <span class="icon-2"></span>
                    <span class="icon-3"></span>
                </div>
            </a>
            <?php
        }
    }
}

if (!function_exists('antra_language_switcher')) {
    function antra_language_switcher() {
        $languages = apply_filters('wpml_active_languages', []);
        if (antra_is_wpml_activated() && count($languages) > 0) {
            ?>
            <div class="antra-language-switcher">
                <ul class="menu">
                    <li class="item">
                        <div class="language-switcher-head">
                            <span class="title"><?php echo esc_html($languages[ICL_LANGUAGE_CODE]['translated_name']); ?></span>
                            <i aria-hidden="true" class="antra-icon-angle-down"></i>
                        </div>
                        <ul class="sub-item">
                            <?php
                            foreach ($languages as $key => $language) {
                                if (ICL_LANGUAGE_CODE === $key) {
                                    continue;
                                }
                                ?>
                                <li>
                                    <a href="<?php echo esc_url($language['url']) ?>">
                                        <img width="18" height="12"
                                             src="<?php echo esc_url($language['country_flag_url']) ?>"
                                             alt="<?php esc_attr($language['default_locale']) ?>">
                                        <span><?php echo esc_html($language['translated_name']); ?></span>
                                    </a>
                                </li>
                                <?php
                            }
                            ?>
                        </ul>
                    </li>
                </ul>
            </div>
            <?php
        }

    }
}

if (!function_exists('antra_language_switcher_mobile')) {
    function antra_language_switcher_mobile() {
        $languages = apply_filters('wpml_active_languages', []);
        if (antra_is_wpml_activated() && count($languages) > 0) { ?>
            <div class="antra-language-switcher-mobile">
                <ul class="menu">
                    <li class="item">
                        <div class="language-switcher-head">
                            <img src="<?php echo esc_url($languages[ICL_LANGUAGE_CODE]['country_flag_url']) ?>"
                                 alt="<?php esc_attr($languages[ICL_LANGUAGE_CODE]['default_locale']) ?>">
                        </div>
                    </li>
                    <?php foreach ($languages as $key => $language) {
                        if (ICL_LANGUAGE_CODE === $key) {
                            continue;
                        } ?>
                        <li class="item">
                            <div class="language-switcher-img">
                                <a href="<?php echo esc_url($language['url']) ?>">
                                    <img src="<?php echo esc_url($language['country_flag_url']) ?>"
                                         alt="<?php esc_attr($language['default_locale']) ?>">
                                </a>
                            </div>
                        </li>
                    <?php } ?>
                </ul>
            </div>
            <?php
        }
    }
}


if (!function_exists('antra_footer_default')) {
    function antra_footer_default() {
        get_template_part('template-parts/copyright');
    }
}

if (!function_exists('antra_pingback_header')) {
    /**
     * Add a pingback url auto-discovery header for single posts, pages, or attachments.
     */
    function antra_pingback_header() {
        if (is_singular() && pings_open()) {
            echo '<link rel="pingback" href="', esc_url(get_bloginfo('pingback_url')), '">';
        }
    }
}

if (!function_exists('antra_update_comment_fields')) {
    function antra_update_comment_fields($fields) {

        $commenter = wp_get_current_commenter();
        $req       = get_option('require_name_email');
        $aria_req  = $req ? "aria-required='true'" : '';

        $fields['author']
            = '<p class="comment-form-author">
			<input id="author" name="author" type="text" placeholder="' . esc_attr__('Name *', 'antra') . '" value="' . esc_attr($commenter['comment_author']) .
              '" size="30" ' . $aria_req . ' />
		</p>';

        $fields['email']
            = '<p class="comment-form-email">
			<input id="email" name="email" type="email" placeholder="' . esc_attr__('Email *', 'antra') . '" value="' . esc_attr($commenter['comment_author_email']) .
              '" size="30" ' . $aria_req . ' />
		</p>';

        $fields['url']
            = '<p class="comment-form-url">
			<input id="url" name="url" type="url"  placeholder="' . esc_attr__('Your Website', 'antra') . '" value="' . esc_attr($commenter['comment_author_url']) .
              '" size="30" />
			</p>';

        return $fields;
    }
}

add_filter('comment_form_default_fields', 'antra_update_comment_fields');


function custom_comment_form_defaults($defaults) {
    $defaults['submit_button'] = '<button type="submit" id="%2$s" class="%3$s" value="%4$s"><span>%4$s</span></button>';
    $defaults['class_submit'] = 'submit';
    return $defaults;
}

add_filter('comment_form_defaults', 'custom_comment_form_defaults');


if (!function_exists('antra_update_comment_review_fields')) {
    function antra_update_comment_review_fields($comment_form) {
        $commenter = wp_get_current_commenter();

        $name_email_required = (bool)get_option('require_name_email', 1);
        $fields              = array(
            'author' => array(
                'label'    => esc_html__('Name', 'antra'),
                'type'     => 'text',
                'value'    => $commenter['comment_author'],
                'required' => $name_email_required,
            ),
            'email'  => array(
                'label'    => esc_html__('Email', 'antra'),
                'type'     => 'email',
                'value'    => $commenter['comment_author_email'],
                'required' => $name_email_required,
            ),
        );

        $comment_form['fields'] = array();

        foreach ($fields as $key => $field) {
            $field_html = '<p class="comment-form-' . esc_attr($key) . '">';

            $field_html .= '<input id="' . esc_attr($key) . '" name="' . esc_attr($key) . '" type="' . esc_attr($field['type']) . '" value="' . esc_attr($field['value']) . '" size="30" ' . ($field['required'] ? 'required' : '') . ' placeholder="' . esc_html($field['label']) . ' *"' . ' />';

            $field_html .= '</p>';

            $comment_form['fields'][$key] = $field_html;
        }

        if (wc_review_ratings_enabled()) {
            $comment_form['comment_field'] = '<div class="comment-form-rating"><label for="rating">' . esc_html__('Your rating', 'antra') . (wc_review_ratings_required() ? '&nbsp;<span class="required">*</span>' : '') . '</label><select name="rating" id="rating" required> 
						<option value="">' . esc_html__('Rate&hellip;', 'antra') . '</option>
						<option value="5">' . esc_html__('Perfect', 'antra') . '</option>
						<option value="4">' . esc_html__('Good', 'antra') . '</option>
						<option value="3">' . esc_html__('Average', 'antra') . '</option>
						<option value="2">' . esc_html__('Not that bad', 'antra') . '</option>
						<option value="1">' . esc_html__('Very poor', 'antra') . '</option>
					</select></div>';
        }
        $comment_form['comment_field'] .= '<p class="comment-form-comment"><label for="comment">' . esc_html__('Your review', 'antra') . (wc_review_ratings_required() ? '&nbsp;<span class="required">*</span>' : '') . '</label><textarea id="comment" name="comment" cols="45" rows="3" required placeholder="' . esc_html__('Your review *', 'antra') . '"></textarea></p>';

        return $comment_form;
    }
}
add_filter('woocommerce_product_review_comment_form_args', 'antra_update_comment_review_fields');


function antra_replace_categories_list($output, $args) {
    if ($args['show_count'] = 1) {
        $pattern     = '#<li([^>]*)><a([^>]*)>(.*?)<\/a>\s*\(([0-9]*)\)\s*#i';  // removed ( and )
        $replacement = '<li$1><a$2><span class="cat-name">$3</span> <span class="cat-count">($4)</span></a>';
        return preg_replace($pattern, $replacement, $output);
    }
    return $output;
}

add_filter('wp_list_categories', 'antra_replace_categories_list', 10, 2);

function antra_replace_archive_list($link_html, $url, $text, $format, $before, $after, $selected) {
    if ($format == 'html') {
        $pattern     = '#<li><a([^>]*)>(.*?)<\/a>&nbsp;\s*\(([0-9]*)\)\s*#i';  // removed ( and )
        $replacement = '<li><a$1><span class="archive-name">$2</span> <span class="archive-count">($3)</span></a>';
        return preg_replace($pattern, $replacement, $link_html);
    }
    return $link_html;
}

add_filter('get_archives_link', 'antra_replace_archive_list', 10, 7);


add_filter('bcn_breadcrumb_title', 'antra_breadcrumb_title_swapper', 3, 10);
function antra_breadcrumb_title_swapper($title, $type, $id) {
    if (in_array('home', $type)) {
        $title = esc_html__('Home', 'antra');
    }
    return $title;
}

add_action('wp_footer', 'antra_render_html_back_to_top');
function antra_render_html_back_to_top() {
    echo sprintf('<a href="#" class="scrollup"><span class="scrollup-icon antra-icon-arrow-up"></span><span class="scrollup-label">%s</span></a>',
        esc_html__('', 'antra'));

}

if (!function_exists('antra_single_author')) {
    function antra_single_author() {
        get_template_part('template-parts/author');
    }
}

if (!function_exists('antra_archive_blog_top')) {
    function antra_archive_blog_top() {
        if (is_home() || is_category()) {
            $show_top_blog = antra_get_theme_option('show_top_blog');
            if ($show_top_blog === 'yes') {
                $slug = antra_get_theme_option('top_blog_template');
                $queried_post = get_page_by_path($slug, OBJECT, 'elementor_library');
                if (isset($queried_post->ID)) {
                    echo Elementor\Plugin::instance()->frontend->get_builder_content_for_display($queried_post->ID);
                    $css_file = Elementor\Core\Files\CSS\Post::create( $queried_post->ID );
                    $css_file->enqueue();
                }
            }
        }
    }
}


if (!function_exists('antra_output_related_products')) {
    /**
     * Get related product
     * @since 1.0.0
     */
    function antra_output_related_products() {
        if (antra_is_woocommerce_activated() && is_product()) {
            echo <<<HTML
            <div class="col-full antra-related-product-section">
            HTML;
                woocommerce_output_related_products();
            echo <<<HTML
            </div>
            HTML;
        }
    }
}
