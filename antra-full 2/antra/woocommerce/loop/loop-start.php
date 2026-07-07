<?php
/**
 * Product Loop Start
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/loop/loop-start.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see        https://docs.woocommerce.com/document/template-structure/
 * @package    WooCommerce/Templates
 * @version     3.3.0
 */


if (!defined('ABSPATH')) {
    exit;
}

$classe         = ['antra-products'];
$classe_wrapper = ['antra-con'];
$layout = antra_get_theme_option('wocommerce_grid_list_layout', 'grid');
if (isset($_GET['layout']) && in_array($_GET['layout'], ['grid', 'list'])) {
    $layout = $_GET['layout'];
}
$layout         = apply_filters('antra_shop_layout', $layout);
$classe[]       = ($layout == 'list') ? 'products-list' : 'products';
if (wc_get_loop_prop('enable_carousel', false) == true) {
    $classe_wrapper[] = 'antra-swiper';
    $classe[]         = 'swiper-wrapper';
    if (antra_is_elementor_activated()) {
        $classe_wrapper[] = Elementor\Plugin::$instance->experiments->is_feature_active('e_swiper_latest') ? 'swiper' : 'swiper-container';
    }
} else {
    $classe[] = 'elementor-grid';
}
$classe_wrapper = esc_attr(implode(' ', array_unique($classe_wrapper)));
$classe         = esc_attr(implode(' ', array_unique($classe)));
wc_set_loop_prop('product-class', $classe);
wc_set_loop_prop('product-class-wrapper', $classe_wrapper);
?>

<div class="<?php echo esc_attr(wc_get_loop_prop('product-class-wrapper', 'products-wrapper')); ?>">
    <ul class="<?php echo esc_attr(wc_get_loop_prop('product-class', 'products')); ?>">

