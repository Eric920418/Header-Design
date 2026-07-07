<?php
/**
 * Cross-sells
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/cart/cross-sells.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce\Templates
 * @version 9.6.0
 */

defined('ABSPATH') || exit;

if ($cross_sells) :
    $class = 'antra-theme-swiper antra-swiper-wrapper swiper ';
    $number = apply_filters('cross-sells-products-number', 2);
    $settings = antra_get_settings_product_caroseul();
    $settings['prevEl'] = '.cross-swiper-button-prev';
    $settings['nextEl'] = '.cross-swiper-button-next';
    $settings['paginationEl'] = '.cross_swiper-pagination';
    $show_dots = (in_array($settings['navigation'], ['dots', 'both']));
    $show_arrows = (in_array($settings['navigation'], ['arrows', 'both']));
    wc_set_loop_prop('enable_carousel', true);

    $settings['breakpoints']['desktop']['column'] = 4;
    ?>

    <div class="cross-sells elementor-element">
        <?php
        $heading = apply_filters('woocommerce_product_cross_sells_products_heading', __('You may be interested in&hellip;', 'antra'));

        if ($heading) :
            ?>
            <h2><?php echo esc_html($heading); ?></h2>
        <?php endif; ?>
        <div class="woocommerce <?php echo esc_attr($class); ?>" data-settings="<?php echo esc_attr(wp_json_encode($settings)) ?>">
            <?php woocommerce_product_loop_start(); ?>

            <?php foreach ($cross_sells as $cross_sell) : ?>

                <?php
                $post_object = get_post($cross_sell->get_id());

                setup_postdata($GLOBALS['post'] =& $post_object); // phpcs:ignore WordPress.WP.GlobalVariablesOverride.Prohibited, Squiz.PHP.DisallowMultipleAssignments.Found

                wc_get_template_part('content', 'product');
                ?>

            <?php endforeach; ?>

            <?php woocommerce_product_loop_end(); ?>
            <?php if ($show_dots) : ?>
                <div class="swiper-pagination swiper-pagination cross_swiper-pagination"></div>
            <?php endif; ?>
            <?php if ($show_arrows) : ?>
                <div class="elementor-swiper-button elementor-swiper-button-prev cross-swiper-button-prev">
                    <i aria-hidden="true" class="antra-icon-chevron-left"></i>
                    <span class="elementor-screen-only"><?php echo esc_html__('Previous', 'antra'); ?></span>
                </div>
                <div class="elementor-swiper-button elementor-swiper-button-next cross-swiper-button-next">
                    <i aria-hidden="true" class="antra-icon-chevron-right"></i>
                    <span class="elementor-screen-only"><?php echo esc_html__('Next', 'antra'); ?></span>
                </div>
            <?php endif; ?>
        </div>
    </div>
<?php
endif;

wp_reset_postdata();
