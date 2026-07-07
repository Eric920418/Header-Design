<article id="post-<?php the_ID(); ?>" <?php post_class('article-default'); ?>>
    <div class="post-inner">
        <?php antra_post_thumbnail('post-thumbnail', true, true); ?>
        <div class="post-content">
            <div class="entry-meta-top">
                <?php antra_post_meta(['show_cat' => true, 'show_date' => true, 'show_author' => true, 'show_comment' => false]); ?>
            </div>
            <header class="entry-header">
                <?php the_title('<h3 class="entry-title"><a href="' . esc_url(get_permalink()) . '" rel="bookmark">', '</a></h3>'); ?>
            </header><!-- .entry-header -->
            <?php
            /**
             * Functions hooked in to antra_loop_post action.
             *
             * @see antra_post_content         - 30
             */
            do_action('antra_loop_post');
            ?>
        </div>
    </div>
</article><!-- #post-## -->