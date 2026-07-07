<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
    <div class="single-content">
        <div class="row">
            <div class="column-12 column-tablet-6 team-wrap-left">
                <div class="col-inner">
                    <?php 
                    antra_post_thumbnail('full');

                    /**
                     * Functions hooked in to antra_team_thumbnail action
                     *
                     */
                    do_action('antra_team_thumbnail');
                    ?>
                </div>
            </div>
            <div class="column-12 column-tablet-6 team-wrap-right">
                <div class="col-inner">
                    <div class="entry-header">
                        <?php the_title('<h2 class="alpha entry-title">', '</h2>'); ?>
                        <?php
                        /**
                         * Functions hooked in to antra_team_header action
                         *
                         * @see antra_team_loop_job        - 10
                         */
                        do_action('antra_team_header');
                        ?>
                    </div>
                    <div class="team_contact_wrapper">
                        <?php
                        /**
                         * Functions hooked in to antra_team_contact_data action
                         *
                         * @see antra_object_loop_excerpt        - 10
                         * @see antra_team_contact        - 10
                         * @see antra_object_socials        - 10
                         */
                        do_action('antra_team_contact_data');
                        ?>
                    </div>
                    <?php
                    /**
                     * Functions hooked in to antra_team_more_section_content action
                     *
                     * @see antra_team_section_content        - 10
                     * @see antra_team_section_skills        - 10
                     * @see antra_team_section_form        - 10
                     */
                    do_action('antra_team_more_section_content');
                    ?>
                </div>
            </div>
        </div>
    </div>

</article><!-- #post-## -->