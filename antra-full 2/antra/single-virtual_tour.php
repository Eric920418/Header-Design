<!doctype html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <link rel="profile" href="//gmpg.org/xfn/11">
    <?php
    wp_head();
    ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<div id="page" class="hfeed site">
    <div id="content" class="site-content-fluid" tabindex="-1">
        <div class="col-fluid">
            <div id="primary" class="content-area">
                <main id="main" class="site-main">

                    <?php
                    while (have_posts()) :
                        the_post();
        
                        do_action('antra_single_virtual_tour_before');
        
                        $id = get_the_ID();
                        $image = get_post_meta( $id, '_panorama_image', 1 );
                        if (!empty($image)) {
                            $data = [
                                'img' => esc_url($image)
                            ];
                            ?>
                            <div class="antra-panorama-image" data-settings="<?php echo esc_attr(wp_json_encode($data)) ?>"></div>
                            <?php
                        }
                        
                        do_action('antra_single_virtual_tour_after');
        
                    endwhile; // End of the loop.
                    ?>

                </main><!-- #main -->
            </div><!-- #primary -->

        </div><!-- .col-full -->
    </div><!-- #content -->

</div><!-- #page -->

<?php
wp_footer();
?>
</body>
</html>

