<header id="masthead" class="site-header header-1" role="banner">
    <div class="header-container">
        <div class="container header-main">
            <div class="header-left">
                <?php
                antra_site_branding();
                if (antra_is_woocommerce_activated()) {
                    ?>
                    <div class="site-header-cart header-cart-mobile">
                        <?php antra_cart_link(); ?>
                    </div>
                    <?php
                }
                ?>
                <?php antra_mobile_nav_button(); ?>
            </div>
            <div class="header-center">
                <?php antra_primary_navigation(); ?>
            </div>
            <div class="header-right desktop-hide-down">
                <div class="header-group-action">
                    <?php
                    antra_header_account();
                    if (antra_is_woocommerce_activated()) {
                        antra_header_wishlist();
                        antra_header_cart();
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</header><!-- #masthead -->
