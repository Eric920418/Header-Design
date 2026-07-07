<?php
get_header(); ?>
    <div id="primary" class="content">
        <main id="main" class="site-main">
            <div class="error-404 not-found">
                <div class="page-content">
                    <div class="page-header">
                        <div class="img-404">
                            <img src="<?php echo get_theme_file_uri('assets/images/404/404.png') ?>" alt="<?php echo esc_attr__('404 Page not found', 'antra') ?>">
                        </div>
                        <div class="text">
                            <h2 class="error-subtitle"><?php _e('<span>Oops!</span> Page not found!', 'antra'); ?></h2>
                            <p class="error-text"><?php esc_html_e("We searched everywhere but couldn't find what your'e looking for. Let's find a better place for you to go.", 'antra'); ?></p>
                            <div class="error-button">
                                <a href="<?php echo esc_url(home_url('/')); ?>" class="go-back antra-elementor-button antra-btn-has-icon">
                                    <span><?php esc_html_e('Back To Home', 'antra'); ?></span>
                                </a>
                            </div>
                        </div>
                    </div><!-- .page-content -->
                </div><!-- .error-404 -->
            </div>
        </main><!-- #main -->
    </div><!-- #primary -->
<?php
get_footer();