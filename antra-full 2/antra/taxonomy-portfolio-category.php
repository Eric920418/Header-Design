<?php
get_header(); ?>

    <div id="primary" class="content-area">
        <main id="main" class="site-main">

            <?php 
            if ( have_posts() ) {
                ?>
                <header class="page-header" style="display: none;">
                    <?php
                    the_archive_description( '<div class="taxonomy-description">', '</div>' );
                    ?>
                </header><!-- .page-header -->
                <?php
                $term = get_queried_object();
                $atts = [
                    'limit' => get_option( 'posts_per_page', 10 ),
                    'orderby' => 'date',
                    'order' => 'desc',
                    'taxonomy' => 'portfolio-category',
                    'category' => isset($term->slug) ? $term->slug : false,
                    'cat_operator' => 'IN',
                    'style' => '2',
                    'paginate' => 1,
                    'paginate_type' => 'pagination',
                    'class' => ' antra-portfolio-grid-style',
                ];

                echo (new Antra_Posttype('portfolio', $atts))->get_content(); // WPCS: XSS ok

            } else {
                get_template_part( 'content', 'none' );
            }
            ?>

        </main><!-- #main -->
    </div><!-- #primary -->

<?php
do_action( 'antra_sidebar' );
get_footer();
