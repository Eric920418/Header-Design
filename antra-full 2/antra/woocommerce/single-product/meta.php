<?php
/**
 * Single Product Meta
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/single-product/meta.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see         https://docs.woocommerce.com/document/template-structure/
 * @package     WooCommerce\Templates
 * @version     9.7.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

global $product;
$product_sku = ($sku = $product->get_sku()) ? $sku : esc_html__('N/A', 'antra');
$separator = '<span style="color:var(--e-global-color-text);">, </span>';

?>
<div class="product_meta">

	<?php do_action( 'woocommerce_product_meta_start' ); ?>

    <?php echo wc_get_product_category_list( $product->get_id(), $separator , '<span class="posted_in">' . _n( 'Category:', 'Categories:', count( $product->get_category_ids() ), 'antra' ) . '  ', '</span>' ); ?>

	<?php echo wc_get_product_tag_list( $product->get_id(), $separator , '<span class="tagged_as">' . _n( 'Tag:', 'Tags:', count( $product->get_tag_ids() ), 'antra' ) . '  ', '</span>' ); ?>

    <?php if (wc_product_sku_enabled() && ($product->get_sku() || $product->is_type('variable'))) : ?>
        <span class="sku_wrapper"><?php esc_html_e('SKU:', 'antra'); ?> <span class="sku"><?php echo esc_html($sku = $product->get_sku()) ? $sku : esc_html__('N/A', 'antra'); ?></span></span>
    <?php endif; ?>

    <?php
    if (function_exists('lexus_post_sharing')) {
        lexus_post_sharing([
            'facebook' => [
                'url' => 'http://www.facebook.com/sharer.php?s=100&amp;p[url]=' . get_the_permalink() . '&amp;p[title]=' . urlencode(get_the_title()),
                'icon' => '<i class="antra-icon-facebook-f"></i>'
            ],
            'x' => [
                'url' => 'https://x.com/intent/post?url='.urlencode(get_the_permalink()).'&text='. urlencode(get_the_title()),
                'icon' => '<i class="antra-icon-twitter"></i>'
            ],
            'instagram' => [
                'url' => 'https://www.instagram.com/?url=' . get_the_permalink() . '&amp;p[title]=' . urlencode(get_the_title()),
                'icon' => '<i class="antra-icon-instagram"></i>'
            ],
            'youtube' => [
                'url' => 'https://www.youtube.com/?url=' . get_the_permalink() . '&amp;p[title]=' . urlencode(get_the_title()),
                'icon' => '<i class="antra-icon-youtube"></i>'
            ],
        ]);
    }
    ?>
</div>


