<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <div class="single-content">
        <?php
        /**
         * Functions hooked in to antra_single_project_top action
         *
         */
        do_action('antra_single_project_top');

        /**
         * Functions hooked in to antra_single_project action
         * @see antra_project_thumbnail     - 10
         * @see antra_post_content       - 30
         */
        do_action('antra_single_project');

        /**
         * Functions hooked in to antra_single_project_bottom action
         */
        do_action('antra_single_project_bottom');
        ?>

    </div>
    <?php
    /**
     * Functions hooked in to antra_project_after_content action
     *
     * @see antra_post_nav        - 10
     */
    do_action('antra_project_after_content');
    ?>
</article><!-- #post-## -->
