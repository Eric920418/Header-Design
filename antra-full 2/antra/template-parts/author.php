<?php if ((bool)get_the_author_meta('description')) : ?>
    <div class="author-wrapper">
        <div class="author-avatar">
            <img src="<?php echo esc_url(get_avatar_url(get_the_author_meta('ID'))); ?>"/>
        </div>
        <div class="author-caption">
            <?php
            // Get the author's website URL
            $author_website = get_the_author_meta('user_url');
            $sidebar = antra_get_theme_option('blog_single_sidebar');

            // Display the author's name and website URL
            printf(
                '<div class="author-name"><a class="author-link" href="%s" rel="author">%s</a></div>',
                esc_url(get_author_posts_url(get_the_author_meta('ID'))),
                get_the_author()
            );

            // Display the author's website URL
            if ($author_website && $sidebar == 'none') {
                printf(
                    '<div class="author-website"><a href="%s" target="_blank">%s</a></div>',
                    esc_url($author_website),
                    esc_html($author_website)
                );
            }
            ?>
            <p class="author-description">
                <?php the_author_meta('description'); ?>
            </p>
            <?php
            if($sidebar != 'none') {
                printf(
                    '<div class="author-website author-website-style-2"><a href="%s" target="_blank">%s</a></div>',
                    esc_url($author_website),
                    __('Website <i class="antra-icon-arrow-right"></i>', 'antra')
                );
            }
            ?>
        </div>
    </div>
<?php endif; ?>
