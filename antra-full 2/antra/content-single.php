<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <div class="single-content">
        <?php
        /**
         * Functions hooked in to antra_single_post_top action
         *
         */
        do_action('antra_single_post_top');

        /**
         * Functions hooked in to antra_single_post action
         * @see antra_post_thumbnail     - 20
         * @see antra_post_excerpt     - 15
         * @see antra_post_header        - 10
         * @see antra_post_content       - 30
         */
        do_action('antra_single_post');

        /**
         * Functions hooked in to antra_single_post_bottom action
         *
         * @see antra_post_taxonomy        - 5
         * @see antra_post_nav             - 10
         * @see antra_single_author        - 15
         * @see antra_display_comments     - 20
         */
        do_action('antra_single_post_bottom');
        ?>

    </div>

</article><!-- #post-## -->
