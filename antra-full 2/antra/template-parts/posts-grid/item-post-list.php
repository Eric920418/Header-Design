<article id="post-<?php the_ID(); ?>" <?php post_class('article-default'); ?>>
    <?php antra_post_thumbnail('post-thumbnail', true, true); ?>
    <div class="post-content">
        <?php
        antra_post_header();
        /**
         * Functions hooked in to antra_loop_post action.
         *
         * @see antra_post_content         - 30
         */
        do_action('antra_loop_post');
        ?>
    </div>
</article><!-- #post-## -->