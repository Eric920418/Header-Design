<?php
/**
 * Pagination - Show numbered pagination for catalog pages
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/loop/pagination.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce\Templates
 * @version 9.3.0
 */

if (!defined('ABSPATH')) {
    exit;
}

global $wp_query;

$total   = isset($total) ? $total : wc_get_loop_prop('total_pages');
$current = isset($current) ? $current : wc_get_loop_prop('current_page');
$base    = isset($base) ? $base : esc_url_raw(str_replace(999999999, '%#%', remove_query_arg('add-to-cart', get_pagenum_link(999999999, false))));
$format  = isset($format) ? $format : '';
?>
<div class="woocommerce-pagination-wrap">
    <?php
    if ($total >= 1) {
        $pagination = antra_get_theme_option('woocommerce_shop_pagination', 'default');
        $pagination_text = esc_html__('Load more','antra');
        if ('infinit' == $pagination) :
            $pagination_text = esc_html__('Loading...','antra');
            wp_enqueue_script('antra-waypoints');
        endif;
        if ($pagination == 'more-btn' || $pagination == 'infinit') :
            if (get_next_posts_link()) : ?>
                <a href="<?php echo next_posts($wp_query->max_num_pages, false); ?>" rel="nofollow noopener" class="products-load-more-btn button load-on-<?php echo 'more-btn' === $pagination ? 'click' : 'scroll'; ?>"><span><?php printf('%s',$pagination_text); ?></span></a>
            <?php endif;
        else : ?>
            <nav class="woocommerce-pagination">
                <?php
                echo paginate_links(
                    apply_filters(
                        'woocommerce_pagination_args',
                        array( // WPCS: XSS ok.
                               'base'      => $base,
                               'format'    => $format,
                               'add_args'  => false,
                               'current'   => max(1, $current),
                               'total'     => $total,
                               'next_text' => __('Next', 'antra'),
                               'prev_text' => __('Prev', 'antra'),
                               'type'      => 'list',
                               'end_size'  => 3,
                               'mid_size'  => 3
                        )
                    )
                );
                ?>
            </nav>
        <?php endif;
    } ?>
</div>
