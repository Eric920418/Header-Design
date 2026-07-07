<?php

if (!function_exists('antra_before_content')) {
    /**
     * Before Content
     * Wraps all WooCommerce content in wrappers which match the theme markup
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_before_content() {
        echo <<<HTML
<div id="primary" class="content-area">
    <main id="main" class="site-main">
HTML;

    }
}


if (!function_exists('antra_after_content')) {
    /**
     * After Content
     * Closes the wrapping divs
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_after_content() {
        echo <<<HTML
	</main><!-- #main -->
</div><!-- #primary -->
HTML;

        do_action('antra_sidebar');
    }
}

if (!function_exists('antra_cart_link_fragment')) {
    /**
     * Cart Fragments
     * Ensure cart contents update when products are added to the cart via AJAX
     *
     * @param array $fragments Fragments to refresh via AJAX.
     *
     * @return array            Fragments to refresh via AJAX
     */
    function antra_cart_link_fragment($fragments) {
        ob_start();
        antra_cart_link();
        $fragments['a.cart-contents'] = ob_get_clean();

        ob_start();

        return $fragments;
    }
}

if (!function_exists('antra_cart_link')) {
    /**
     * Cart Link
     * Displayed a link to the cart including the number of items present and the cart total
     *
     * @return void
     * @since  1.0.0
     */
    function antra_cart_link() {
        $cart = WC()->cart;
        ?>
        <a class="cart-contents" href="<?php echo esc_url(wc_get_cart_url()); ?>"
           title="<?php esc_attr_e('View your shopping cart', 'antra'); ?>">
            <?php if ($cart): ?>
                <span class="count"><?php echo wp_kses_data(sprintf(_n('%d', '%d', WC()->cart->get_cart_contents_count(), 'antra'), WC()->cart->get_cart_contents_count())); ?></span>
                <?php echo WC()->cart->get_cart_subtotal(); ?>
            <?php endif; ?>
        </a>
        <?php
    }
}

if (!function_exists('antra_show_categories_dropdown')) {
    function antra_show_categories_dropdown() {
        static $id = 0;
        $args  = array(
            'hide_empty' => 1,
            'parent'     => 0
        );
        $terms = get_terms('product_cat', $args);
        if (!empty($terms) && !is_wp_error($terms)) {
            ?>
            <div class="search-by-category input-dropdown">
                <div class="input-dropdown-inner antra-scroll-content">
                    <!--                    <input type="hidden" name="product_cat" value="0">-->
                    <a href="#" data-val="0"><span><?php esc_html_e('All category', 'antra'); ?></span></a>
                    <?php
                    $args_dropdown = array(
                        'id'               => 'product_cat' . $id++,
                        'show_count'       => 0,
                        'class'            => 'dropdown_product_cat_ajax',
                        'show_option_none' => esc_html__('All category', 'antra'),
                    );
                    wc_product_dropdown_categories($args_dropdown);
                    ?>
                    <div class="list-wrapper antra-scroll">
                        <ul class="antra-scroll-content">
                            <li class="d-none">
                                <a href="#" data-val="0"><?php esc_html_e('All category', 'antra'); ?></a></li>
                            <?php
                            if (!apply_filters('antra_show_only_parent_categories_dropdown', false)) {
                                require_once get_theme_file_path('inc/woocommerce/class-product-category-list-walker.php');
                                $args_list = array(
                                    'title_li'           => false,
                                    'taxonomy'           => 'product_cat',
                                    'use_desc_for_title' => false,
                                    'walker'             => new Antra_Custom_Walker_Category(),
                                );
                                wp_list_categories($args_list);
                            } else {
                                foreach ($terms as $term) {
                                    ?>
                                    <li>
                                        <a href="#"
                                           data-val="<?php echo esc_attr($term->slug); ?>"><?php echo esc_html($term->name); ?></a>
                                    </li>
                                    <?php
                                }
                            }
                            ?>
                        </ul>
                    </div>
                </div>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_product_search')) {
    /**
     * Display Product Search
     *
     * @return void
     * @uses  antra_is_woocommerce_activated() check if WooCommerce is activated
     * @since  1.0.0
     */
    function antra_product_search() {
        if (antra_is_woocommerce_activated()) {
            static $index = 0;
            $index++;
            ?>
            <div class="site-search ajax-search">
                <div class="widget woocommerce widget_product_search">
                    <div class="ajax-search-result d-none"></div>
                    <form method="get" class="woocommerce-product-search"
                          action="<?php echo esc_url(home_url('/')); ?>">
                        <label class="screen-reader-text"
                               for="woocommerce-product-search-field-<?php echo isset($index) ? absint($index) : 0; ?>"><?php esc_html_e('Search for:', 'antra'); ?></label>
                        <input type="search"
                               id="woocommerce-product-search-field-<?php echo isset($index) ? absint($index) : 0; ?>"
                               class="search-field"
                               placeholder="<?php echo esc_attr__('Search products&hellip;', 'antra'); ?>"
                               autocomplete="off" value="<?php echo get_search_query(); ?>" name="s"/>
                        <button type="submit"
                                value="<?php echo esc_attr_x('Search', 'submit button', 'antra'); ?>"><?php echo esc_html_x('Search', 'submit button', 'antra'); ?></button>
                        <input type="hidden" name="post_type" value="product"/>
                        <?php antra_show_categories_dropdown(); ?>
                    </form>
                </div>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_header_cart')) {
    /**
     * Display Header Cart
     *
     * @return void
     * @uses  antra_is_woocommerce_activated() check if WooCommerce is activated
     * @since  1.0.0
     */
    function antra_header_cart() {
        if (antra_is_woocommerce_activated()) {
            if (!antra_get_theme_option('show_header_cart', true)) {
                return;
            }
            ?>
            <div class="site-header-cart menu">
                <?php antra_cart_link(); ?>
                <?php

                if (!apply_filters('woocommerce_widget_cart_is_hidden', is_cart() || is_checkout())) {

                    if (antra_get_theme_option('header_cart_dropdown', 'side') == 'side') {
                        add_action('wp_footer', 'antra_header_cart_side');
                    } else {
                        the_widget('WC_Widget_Cart', 'title=');
                    }
                }
                ?>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_header_cart_side')) {
    function antra_header_cart_side() {
        if (antra_is_woocommerce_activated()) {
            ?>
            <div class="site-header-cart-side">
                <div class="cart-side-heading">
                    <span class="cart-side-title"><?php echo esc_html__('Shopping cart', 'antra'); ?></span>
                    <a href="#" class="close-cart-side"><?php echo esc_html__('close', 'antra') ?></a></div>
                <?php the_widget('WC_Widget_Cart', 'title='); ?>
            </div>
            <div class="cart-side-overlay"></div>
            <?php
        }
    }
}

if (!function_exists('antra_sorting_wrapper')) {
    /**
     * Sorting wrapper
     *
     * @return  void
     * @since   1.4.3
     */
    function antra_sorting_wrapper() {
        echo '<div class="antra-sorting">';
    }
}

if (!function_exists('antra_sorting_wrapper_close')) {
    /**
     * Sorting wrapper close
     *
     * @return  void
     * @since   1.4.3
     */
    function antra_sorting_wrapper_close() {
        echo '</div>';
    }
}

if (!function_exists('antra_product_columns_wrapper')) {
    /**
     * Product columns wrapper
     *
     * @return  void
     * @since   2.2.0
     */
    function antra_product_columns_wrapper() {
        $columns = antra_loop_columns();
        echo '<div class="columns-' . absint($columns) . '">';
    }
}

if (!function_exists('antra_loop_columns')) {
    /**
     * Default loop columns on product archives
     *
     * @return integer products per row
     * @since  1.0.0
     */
    function antra_loop_columns() {
        $columns = 3; // 3 products per row

        if (function_exists('wc_get_default_products_per_row')) {
            $columns = wc_get_default_products_per_row();
        }

        return apply_filters('antra_loop_columns', $columns);
    }
}

if (!function_exists('antra_product_columns_wrapper_close')) {
    /**
     * Product columns wrapper close
     *
     * @return  void
     * @since   2.2.0
     */
    function antra_product_columns_wrapper_close() {
        echo '</div>';
    }
}

if (!function_exists('antra_product_block_wrapper_start')) {
    /**
     * Product Block wrapper Start
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_block_wrapper_start() {
        echo '<div class="product-block">';
    }
}

if (!function_exists('antra_product_block_wrapper_close')) {
    /**
     * Product Block wrapper close
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_block_wrapper_close() {
        echo '<div class="product-hover"></div>';
        echo '</div>';
    }
}

if (!function_exists('antra_product_add_to_cart_wrapper_start')) {
    /**
     * Product Block wrapper Start
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_add_to_cart_wrapper_start() {
        echo '<div class="product-add-to-cart-form">';
    }
}

if (!function_exists('antra_product_add_to_cart_wrapper_close')) {
    /**
     * Product Block wrapper close
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_add_to_cart_wrapper_close() {
        echo '</div>';
    }
}

if (!function_exists('antra_product_transition_wrapper_start')) {
    /**
     * Product transition wrapper Start
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_transition_wrapper_start() {
        echo '<div class="product-transition">';
    }
}

if (!function_exists('antra_product_transition_wrapper_close')) {
    /**
     * Product Block transition close
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_transition_wrapper_close() {
        echo '</div>';
    }
}

if (!function_exists('antra_product_caption_wrapper_start')) {
    /**
     * Product caption wrapper Start
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_caption_wrapper_start() {
        echo '<div class="product-caption">';
    }
}

if (!function_exists('antra_product_caption_wrapper_close')) {
    /**
     * Product caption wrapper close
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_caption_wrapper_close() {
        echo '</div>';
    }
}

if (!function_exists('antra_product_caption_bottom_wrapper_start')) {
    /**
     * Product caption wrapper Start
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_caption_bottom_wrapper_start() {
        echo '<div class="product-caption-bottom">';
    }
}

if (!function_exists('antra_product_caption_bottom_wrapper_close')) {
    /**
     * Product caption wrapper close
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_product_caption_bottom_wrapper_close() {
        echo '</div>';
    }
}

if (!function_exists('antra_woocommerce_product_loop_action_start')) {
    /**
     * Product group action wrapper start
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_woocommerce_product_loop_action_start() {
        ?>
        <div class="group-action">
        <div class="shop-action">
        <?php
    }
}
if (!function_exists('antra_woocommerce_product_loop_action_close')) {
    /**
     * Product group action wrapper close
     *
     * @return  void
     * @since   1.0.0
     */
    function antra_woocommerce_product_loop_action_close() {
        ?>
        </div>
        </div>
        <?php
    }
}

if (!function_exists('antra_shop_messages')) {
    /**
     * ThemeBase shop messages
     *
     * @since   1.4.4
     * @uses    antra_do_shortcode
     */
    function antra_shop_messages() {
        if (!is_checkout()) {
            echo antra_do_shortcode('woocommerce_messages');
        }
    }
}


if (!function_exists('antra_woocommerce_pagination')) {
    /**
     * ThemeBase WooCommerce Pagination
     * WooCommerce disables the product pagination inside the woocommerce_product_subcategories() function
     * but since ThemeBase adds pagination before that function is excuted we need a separate function to
     * determine whether or not to display the pagination.
     *
     * @since 1.4.4
     */
    function antra_woocommerce_pagination() {
        if (woocommerce_products_will_display()) {
            woocommerce_pagination();
        }
    }
}

if (!function_exists('antra_get_review_counting')) {
    /**
     * Get review counting
     * @since 1.0.0
     */
    function antra_get_review_counting() {
        global $post;
	    $output = array();

	    for ($i = 1; $i <= 5; $i++) {
	        $args = array(
	            'post_id' => ( $post->ID ),
	            'meta_query' => array(
	                array(
	                    'key' => 'rating',
	                    'value' => $i
	                )
	            ),
	            'count' => true
	        );
	        $output[$i] = get_comments( $args );
	    }
	    return $output;
    }
}


if (!function_exists('antra_single_product_pagination')) {
    /**
     * Single Product Pagination
     *
     * @since 2.3.0
     */
    function antra_single_product_pagination() {

        // Show only products in the same category?
        $in_same_term   = apply_filters('antra_single_product_pagination_same_category', true);
        $excluded_terms = apply_filters('antra_single_product_pagination_excluded_terms', '');
        $taxonomy       = apply_filters('antra_single_product_pagination_taxonomy', 'product_cat');

        $previous_product = antra_get_previous_product($in_same_term, $excluded_terms, $taxonomy);
        $next_product     = antra_get_next_product($in_same_term, $excluded_terms, $taxonomy);

        if ((!$previous_product && !$next_product) || !is_product()) {
            return;
        }

        ?>
        <div class="antra-product-pagination-wrap">
            <nav class="antra-product-pagination" aria-label="<?php esc_attr_e('More products', 'antra'); ?>">
                <?php if ($previous_product) : ?>
                    <a href="<?php echo esc_url($previous_product->get_permalink()); ?>" rel="prev">
                        <span class="pagination-prev "><i
                                    class="antra-icon-chevron-left"></i><?php echo esc_html__('Prev', 'antra'); ?></span>
                        <div class="product-item">
                            <?php echo sprintf('%s', $previous_product->get_image()); ?>
                            <div class="antra-product-pagination-content">
                                <span class="antra-product-pagination__title"><?php echo sprintf('%s', $previous_product->get_name()); ?></span>
                                <?php if ($price_html = $previous_product->get_price_html()) :
                                    printf('<span class="price">%s</span>', $price_html);
                                endif; ?>
                            </div>
                        </div>
                    </a>
                <?php endif; ?>

                <?php if ($next_product) : ?>
                    <a href="<?php echo esc_url($next_product->get_permalink()); ?>" rel="next">
                        <span class="pagination-next"><?php echo esc_html__('Next', 'antra'); ?><i
                                    class="antra-icon-chevron-right"></i></span>
                        <div class="product-item">
                            <?php echo sprintf('%s', $next_product->get_image()); ?>
                            <div class="antra-product-pagination-content">
                                <span class="antra-product-pagination__title"><?php echo sprintf('%s', $next_product->get_name()); ?></span>
                                <?php if ($price_html = $next_product->get_price_html()) :
                                    printf('<span class="price">%s</span>', $price_html);
                                endif; ?>
                            </div>
                        </div>
                    </a>
                <?php endif; ?>
            </nav><!-- .antra-product-pagination -->
        </div>
        <?php

    }
}

if (!function_exists('antra_sticky_single_add_to_cart')) {
    /**
     * Sticky Add to Cart
     *
     * @since 2.3.0
     */
    function antra_sticky_single_add_to_cart() {
        global $product;

        if (!is_product()) {
            return;
        }

        $show = false;

        if ($product->is_purchasable() && $product->is_in_stock()) {
            $show = true;
        } else if ($product->is_type('external')) {
            $show = true;
        }

        if (!$show) {
            return;
        }

        $params = apply_filters(
            'antra_sticky_add_to_cart_params', array(
                'trigger_class' => 'entry-summary',
            )
        );

        wp_localize_script('antra-sticky-add-to-cart', 'antra_sticky_add_to_cart_params', $params);
        ?>

        <section class="antra-sticky-add-to-cart">
            <div class="col-full">
                <div class="antra-sticky-add-to-cart__content">
                    <?php echo woocommerce_get_product_thumbnail(); ?>
                    <div class="antra-sticky-add-to-cart__content-product-info">
						<span class="antra-sticky-add-to-cart__content-title"><?php esc_html_e('You\'re viewing:', 'antra'); ?>
							<strong><?php the_title(); ?></strong></span>
                        <span class="antra-sticky-add-to-cart__content-price"><?php echo sprintf('%s', $product->get_price_html()); ?></span>
                        <?php echo wc_get_rating_html($product->get_average_rating()); ?>
                    </div>
                    <a href="<?php echo esc_url($product->add_to_cart_url()); ?>"
                       class="antra-sticky-add-to-cart__content-button button alt">
                        <?php echo esc_attr($product->add_to_cart_text()); ?>
                    </a>
                </div>
            </div>
        </section><!-- .antra-sticky-add-to-cart -->
        <?php
    }
}

if (!function_exists('antra_woocommerce_product_loop_unit')) {
    function antra_woocommerce_product_loop_unit() {
        global $product;
        $unit = get_post_meta($product->get_id(), '_deal_unit', true);
        if (empty($unit)) {
            return;
        }
        ?>
        <div class="product-unit">
            <span class="title"><?php echo esc_html__('Unit:', 'antra'); ?></span>
            <span class="value"><?php echo esc_html($unit); ?></span>
        </div>
        <?php
    }
}

if (!function_exists('antra_add_quantity_field')) {
    function antra_add_quantity_field() {
        global $product;

        if (!$product->is_sold_individually() && 'variable' != $product->get_type() && $product->is_in_stock()) {
            ?>
            <div class="product-input-quantity">
                <?php
                woocommerce_quantity_input(array('min_value' => 1, 'max_value' => $product->backorders_allowed() ? '' : $product->get_stock_quantity()));
                antra_woocommerce_product_loop_unit();
                ?>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_woocommerce_product_loop_action')) {
    function antra_woocommerce_product_loop_action() {
        ?>
        <div class="group-action">
            <div class="shop-action">
                <?php do_action('antra_woocommerce_product_loop_action'); ?>
            </div>
        </div>
        <?php
    }
}

if (!function_exists('antra_stock_label')) {
    function antra_stock_label() {
        global $product;
        if ($product->is_in_stock()) {
            echo '<span class="inventory_status attr_prod_label"><span class="stock-title screen-reader-text">' . esc_html__('Availability:', 'antra') . '</span> ' . esc_html__('In Stock', 'antra') . '</span>';
        } else {
            echo '<span class="inventory_status attr_prod_label out-stock"><span class="stock-title screen-reader-text">' . esc_html__('Availability:', 'antra') . '</span> ' . esc_html__('Out of Stock', 'antra') . '</span>';
        }
    }
}

if (!function_exists('antra_shipping_label')) {
    function antra_shipping_label() {
        global $product;
        $shipping_class_id   = $product->get_shipping_class_id();
        $shipping_class_term = get_term($shipping_class_id, 'product_shipping_class');

        if( ! is_wp_error($shipping_class_term) && is_a($shipping_class_term, 'WP_Term') ) {
            $shipping_class_name  = $shipping_class_term->name;
            echo '<span class="shipping_class attr_prod_label">'.$shipping_class_name.'</span>';
        }
    }
}

if (!function_exists('antra_woocommerce_content_product_imagin')) {
    function antra_woocommerce_content_product_imagin() {
        echo '<div class="content-product-imagin"></div>';
    }
}

if (!function_exists('antra_single_product_summary_top')) {
    function antra_single_product_summary_top() {
        ?>
        <div class="entry-summary-top">
            <?php
            antra_single_product_pagination();
            ?>
        </div>
        <?php
    }
}

if (!function_exists('antra_single__quantity_cart')) {
    function antra_single__quantity_cart () {
        ?>
        <div class="quantity_cart">
            <?php
            woocommerce_quantity_input();
            woocommerce_template_loop_add_to_cart();
            // antra_wishlist_button();
            // antra_compare_button();
            // antra_quickview_button();
            ?>
        </div>
        <?php
    }
}
if (!function_exists('antra_single__rating_brands')) {
    function antra_single__rating_brands () {
        ?>
        <div class="rating_brands">
            <?php
            antra_woocommerce_single_brand();
            woocommerce_template_single_rating();
            antra_stock_label();
            ?>
        </div>
        <?php
    }
}
if (!function_exists('antra_single_product_after_title')) {
    function antra_single_product_after_title() {
        global $product;
        ?>
        <div class="product_after_title">
            <?php
            antra_woocommerce_single_brand();
            if (wc_product_sku_enabled() && ($product->get_sku() || $product->is_type('variable'))) :
                $sku = $product->get_sku() ? $product->get_sku() : esc_html__('N/A', 'antra');
                ?>
                <span class="label-wrapper"><?php esc_html_e('SKU:', 'antra'); ?> <span>
                            class="sku"><?php printf('%s', $sku); ?></span></span>
            <?php endif; ?>
        </div>
        <?php
    }
}

if (!function_exists('antra_product_label')) {
    function antra_product_label($loop = false) {
        global $product;

        $output = array();

        $newness_days = 30;
        $created      = strtotime($product->get_date_created());
//        if ((time() - (60 * 60 * 24 * $newness_days)) < $created) {
//            $output[] = '<span class="new-label">' . esc_html__('New', 'antra') . '</span>';
//        }
        if ($product->is_on_sale()) {

            $percentage = '';

            if ($product->get_type() == 'variable') {

                $available_variations = $product->get_variation_prices();
                $max_percentage       = 0;

                foreach ($available_variations['regular_price'] as $key => $regular_price) {
                    $sale_price = $available_variations['sale_price'][$key];

                    if ($sale_price < $regular_price) {
                        $percentage = round((($regular_price - $sale_price) / $regular_price) * 100);

                        if ($percentage > $max_percentage) {
                            $max_percentage = $percentage;
                        }
                    }
                }
                $percentage = $max_percentage;
            } elseif (($product->get_type() == 'simple' || $product->get_type() == 'external')) {
                $percentage = round((($product->get_regular_price() - $product->get_sale_price()) / $product->get_regular_price()) * 100);
            }
            if ($percentage) {
                $sale_text = $loop ? '-' : __('Sale ', 'antra');
                $output[] = '<span class="onsale">'. $sale_text . $percentage . '%' . '</span>';
            } else {
                $output[] = '<span class="onsale">' . esc_html__('Sale', 'antra') . '</span>';
            }

        }


        if ($output) {
            echo '<div class="label-wrapper">' . implode('', $output) . '</div>';
        }
    }
}

if (!function_exists('antra_woocommerce_get_product_label_new')) {
    function antra_woocommerce_get_product_label_new() {
        global $product;
        $newness_days = 30;
        $created      = strtotime($product->get_date_created());
        if ((time() - (60 * 60 * 24 * $newness_days)) < $created) {
            echo '<span class="new-label">' . esc_html__('New!', 'antra') . '</span>';
        }
    }
}


if (!function_exists('antra_woocommerce_product_gallery_image')) {
    function antra_woocommerce_product_gallery_image() {
        /**
         * @var $product WC_Product
         */
        global $product;
        $gallery = $product->get_gallery_image_ids();
        if (count($gallery) > 0) {
            $size = apply_filters('woocommerce_product_loop_size', 'woocommerce_thumbnail');
            echo '<div class="product-gallery woocommerce-loop-product__gallery">';
            $url1    = wp_get_attachment_image_src($product->get_image_id(), $size);
            $srcset1 = wp_get_attachment_image_srcset($product->get_image_id(), $size);

            echo '<span class="gallery_item active" data-image="' . $url1[0] . '"  data-scrset="' . $srcset1 . '">' . $product->get_image('thumbnail') . '</span>';
            foreach ($gallery as $attachment_id) {
                $url    = wp_get_attachment_image_src($attachment_id, $size);
                $srcset = wp_get_attachment_image_srcset($attachment_id, $size);
                echo '<span class="gallery_item" data-image="' . $url[0] . '" data-scrset="' . $srcset . '">' . wp_get_attachment_image($attachment_id, 'thumbnail') . '</span>';
            }
            echo '</div>';
        }
    }
}

if (!function_exists('antra_template_loop_product_thumbnail')) {
    function antra_template_loop_product_thumbnail($size = 'woocommerce_thumbnail', $deprecated1 = 0, $deprecated2 = 0) {
        global $product;
        if (!$product) {
            return '';
        }
        $gallery    = $product->get_gallery_image_ids();
        $hover_skin = antra_get_theme_option('woocommerce_product_hover', 'none');
        $image_size = apply_filters('single_product_archive_thumbnail_size', $size);
        
        $link = get_the_permalink();
        $title = get_the_title();

        if ($hover_skin == 'none' || count($gallery) <= 0) {
            echo '<div class="product-image"><a href="'.$link.'" title="'.$title.'">' . $product->get_image('woocommerce_thumbnail') . '</a></div>';

            return '';
        }
        $image_featured = '<div class="product-image">' . $product->get_image('woocommerce_thumbnail') . '</div>';
        $image_featured .= '<div class="product-image second-image">' . wp_get_attachment_image($gallery[0], 'woocommerce_thumbnail') . '</div>';


        echo <<<HTML
<div class="product-img-wrap {$hover_skin}">
    <div class="inner">
        <a href="{$link}" title="{$title}">
            {$image_featured}
        </a>
    </div>
</div>
HTML;
    }
}


if (!function_exists('antra_woocommerce_product_list_image')) {
    function antra_woocommerce_product_list_image() {
        /**
         * @var $product WC_Product
         */
        global $product; ?>
        <a href="<?php echo esc_url($product->get_permalink()); ?>" class="menu-thumb">
            <?php echo wp_kses_post($product->get_image()); ?>
        </a>
        <?php
    }
}


if (!function_exists('antra_woocommerce_single_product_image_thumbnail_html')) {
    function antra_woocommerce_single_product_image_thumbnail_html($image, $attachment_id) {
        return wc_get_gallery_image_html($attachment_id, true);
    }
}

if (!function_exists('antra_update_woo_flexslider_options')) {
    function antra_update_woo_flexslider_options( $options ) {
        
        $options['directionNav'] = true;
        
        // echo '<pre>'; print_r($options); echo '</pre>'; die();
        return $options;
    }
}

if (!function_exists('woocommerce_template_loop_product_title')) {

    /**
     * Show the product title in the product loop.
     */
    function woocommerce_template_loop_product_title() {
        echo '<h3 class="woocommerce-loop-product__title"><a href="' . esc_url_raw(get_the_permalink()) . '">' . get_the_title() . '</a></h3>';
    }
}

if (!function_exists('antra_woocommerce_get_product_category')) {
    function antra_woocommerce_get_product_category() {
        global $product;
        echo antra_get_the_term_list( $product->get_id(), 'product_cat', '<div class="posted-in">', ' / ', '</div>');
    }
}

if (!function_exists('antra_woocommerce_above_title')) {
    function antra_woocommerce_above_title() {
        echo '<div class="woocommerce-above-title">';
        antra_woocommerce_get_product_category();
        // antra_woocommerce_render_variable();
        echo '</div>';
    }
}

if (!function_exists('antra_get_the_term_list')) {
    function antra_get_the_term_list( $post_id, $taxonomy, $before = '', $sep = '', $after = '', $number = 'all') {
        $terms = get_the_terms( $post_id, $taxonomy );

        if ( is_wp_error( $terms ) ) {
            return $terms;
        }

        if ( empty( $terms ) ) {
            return false;
        }

        if ($number != 'all' && absint($number) > 0) {
            $terms = array_slice($terms, 0, $number); 
        }

        $links = array();

        foreach ( $terms as $term ) {
            $link = get_term_link( $term, $taxonomy );
            if ( is_wp_error( $link ) ) {
                return $link;
            }
            $links[] = '<a href="' . esc_url( $link ) . '" rel="tag">' . $term->name . '</a>';
        }

        /**
         * Filters the term links for a given taxonomy.
         *
         * The dynamic portion of the hook name, `$taxonomy`, refers
         * to the taxonomy slug.
         *
         * Possible hook names include:
         *
         *  - `term_links-category`
         *  - `term_links-post_tag`
         *  - `term_links-post_format`
         *
         * @since 2.5.0
         *
         * @param string[] $links An array of term links.
         */
        $term_links = apply_filters( "term_links-{$taxonomy}", $links );  // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores

        return $before . implode( $sep, $term_links ) . $after;
    }
}

if (!function_exists('antra_woocommerce_get_product_description')) {
    function antra_woocommerce_get_product_description() {
        global $post;

        $short_description = apply_filters('woocommerce_short_description', $post->post_excerpt);

        if ($short_description) {
            ?>
            <div class="short-description">
                <?php echo sprintf('%s', $short_description); ?>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_woocommerce_get_product_short_description')) {
    function antra_woocommerce_get_product_short_description() {
        global $post;
        $short_description = wp_trim_words(apply_filters('woocommerce_short_description', $post->post_excerpt), 10);
        if ($short_description) {
            ?>
            <div class="short-description">
                <?php echo sprintf('%s', $short_description); ?>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_header_wishlist')) {
    function antra_header_wishlist() {
        if (function_exists('yith_wcwl_count_all_products')) {
            if (!antra_get_theme_option('show_header_wishlist', true)) {
                return;
            }
            ?>
            <div class="site-header-wishlist">
                <a class="header-wishlist"
                   href="<?php echo esc_url(get_permalink(get_option('yith_wcwl_wishlist_page_id'))); ?>">
                    <i class="antra-icon-heart"></i>
                    <span class="count"><?php echo esc_html(yith_wcwl_count_all_products()); ?></span>
                </a>
            </div>
            <?php
        } elseif (function_exists('woosw_init')) {
            if (!antra_get_theme_option('show_header_wishlist', true)) {
                return;
            }
            $key = WPCleverWoosw::get_key();

            ?>
            <div class="site-header-wishlist">
                <a class="header-wishlist" href="<?php echo esc_url(WPCleverWoosw::get_url($key, true)); ?>">
                    <i class="antra-icon-heart"></i>
                    <span class="count"><?php echo esc_html(WPCleverWoosw::get_count($key)); ?></span>
                </a>
            </div>
            <?php
        }
    }
}

if (!function_exists('woosw_ajax_update_count') && function_exists('woosw_init')) {
    function woosw_ajax_update_count() {
        $key = WPCleverWoosw::get_key();

        wp_send_json(array(
            'text' => esc_html(_nx('Item', 'Items', WPCleverWoosw::get_count($key), 'items wishlist', 'antra'))
        ));
    }

    add_action('wp_ajax_woosw_ajax_update_count', 'woosw_ajax_update_count');
    add_action('wp_ajax_nopriv_woosw_ajax_update_count', 'woosw_ajax_update_count');
}

if (!function_exists('antra_button_grid_list_layout')) {
    function antra_button_grid_list_layout() {
        $layout = antra_get_theme_option('wocommerce_grid_list_layout', 'grid');
        if (isset($_GET['layout']) && in_array($_GET['layout'], ['grid', 'list'])) {
            $layout = $_GET['layout'];
        }
        $layout = apply_filters('antra_shop_layout', $layout);

        $active_grid = $layout == 'list' ? '' : 'active';
        $active_list = $layout == 'list' ? 'active' : '';
        ?>
        <div class="gridlist-toggle desktop-hide-down">
            <label class="label-gridlist-toggle"><?php _e('View As', 'antra') ?></label>
            <a href="<?php echo esc_url(add_query_arg('layout', 'grid')); ?>" id="grid" class="<?php echo esc_attr($active_grid); ?>" title="<?php echo esc_attr__('Grid View', 'antra'); ?>">
                <i class="antra-icon-view-line-2"></i>
            </a>
            <a href="<?php echo esc_url(add_query_arg('layout', 'list')); ?>" id="list" class="<?php echo esc_attr($active_list); ?>" title="<?php echo esc_attr__('List View', 'antra'); ?>">
                <i class="antra-icon-list-2"></i>
            </a>
        </div>
        <?php
    }
}

if (!function_exists('antra_button_drawing_sidebar')) {
    function antra_button_drawing_sidebar() {
        if (antra_get_theme_option('woocommerce_archive_layout') == 'drawing') {
            ?>
            <div class="sidebar-drawing-toggle">
                <a href="javascript:void(0)" title="<?php esc_attr_e('Hide Filters', 'antra'); ?>">
                    <i class="antra-icon-sliders-v"></i>
                    <span class="filter__text_hide filter__text"><?php esc_html_e('Hide Filters', 'antra'); ?></span>
                    <span class="filter__text_show filter__text"><?php esc_html_e('Show Filters', 'antra'); ?></span>
                </a>
            </div>
            <?php
        }
    }
}


if (!function_exists('antra_catalog_ordering')) {
    function antra_catalog_ordering() {
        ?>
        <div class="antra-woocommerce-ordering">
            <label><?php esc_html_e('Short by:', 'antra') ?></label>
            <?php
            woocommerce_catalog_ordering();
            ?>
        </div>
        <?php
    }
}


if (!function_exists('antra_woocommerce_list_get_rating')) {
    function antra_woocommerce_list_show_rating() {
        global $product;
        $count = $product->get_review_count();
        echo '<div class="woo-wrap-rating">';
        echo wc_get_rating_html($product->get_average_rating());
        if ($count) {
            $count_str = str_pad($count, 2, '0', STR_PAD_LEFT);
            echo '<span class="count">('. $count_str . '<span> ' ._n('review', 'reviews', $count, 'antra') . '</span>' .')</span>';
        }
        echo '</div>';
    }
}

if (!function_exists('antra_woocommerce_grid_get_rating')) {
    function antra_woocommerce_grid_show_rating() {
        global $product;
        $average_rating = $product->get_average_rating();
        if ($average_rating) {
            echo '<div class="woo-wrap-rating">';
            echo '<i class="antra-icon-star" aria-hidden="true"></i><span class="average_rating">'.esc_html($average_rating).'</span>';
            echo '</div>';
        }
    }
}

if (!function_exists('antra_woocommerce_time_sale')) {
    function antra_woocommerce_time_sale($is_not_single = false) {
        /**
         * @var $product WC_Product
         */
        global $product;

        if (!$product->is_on_sale()) {
            return;
        }

        $time_sale = get_post_meta($product->get_id(), '_sale_price_dates_to', true);
        if ($time_sale) {
            wp_enqueue_script('antra-countdown');
            $deal_text = $is_not_single ? esc_html__('End in:', 'antra') : esc_html__('Hurry up! Sale ends in:', 'antra');
            ?>
            <div class="time-sale">
                <div class="deal-text text-notice-countdown">
                    <span><?php printf('%s', $deal_text); ?></span>
                </div>
                <div class="antra-countdown" data-countdown="true" data-date="<?php echo esc_html($time_sale); ?>">
                    <div class="countdown-item">
                        <span class="countdown-digits countdown-days"></span>
                        <span class="countdown-label"><?php echo esc_html__('Days', 'antra') ?></span>
                    </div>
                    <div class="countdown-item">
                        <span class="countdown-digits countdown-hours"></span>
                        <span class="countdown-label"><?php echo esc_html__('Hrs', 'antra') ?></span>
                    </div>
                    <div class="countdown-item">
                        <span class="countdown-digits countdown-minutes"></span>
                        <span class="countdown-label"><?php echo esc_html__('Mins', 'antra') ?></span>
                    </div>
                    <div class="countdown-item">
                        <span class="countdown-digits countdown-seconds"></span>
                        <span class="countdown-label"><?php echo esc_html__('Secs', 'antra') ?></span>
                    </div>
                </div>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_woocommerce_deal_progress')) {
    function antra_woocommerce_deal_progress() {
        global $product;

        $limit = get_post_meta($product->get_id(), '_deal_quantity', true);
        $sold  = intval(get_post_meta($product->get_id(), '_deal_sales_counts', true));
        if (empty($limit)) {
            return;
        }

        ?>

        <div class="deal-sold">
            <div class="deal-progress">
                <div class="progress-bar">
                    <div class="progress-value" style="width: <?php echo trim($sold / $limit * 100) ?>%"></div>
                </div>
            </div>
            <div class="deal-sold-text">
                <span><?php echo esc_html__('Available: ', 'antra'); ?></span>
                <span class="value"><?php echo esc_html(absint($limit - $sold)); ?>/<?php echo esc_html($limit); ?></span>
            </div>
        </div>

        <?php
    }
}

if (!function_exists('antra_single_product_extra')) {
    function antra_single_product_extra() {
        global $product;
        $product_extra = antra_get_theme_option('single_product_content_meta', '');
        $product_extra = get_post_meta($product->get_id(), '_extra_info', true) !== '' ? get_post_meta($product->get_id(), '_extra_info', true) : $product_extra;

        if ($product_extra !== '') {
            echo '<div class="antra-single-product-extra">' . apply_filters( 'the_content', $product_extra) . '</div>';
        }
    }
}

if (!function_exists('antra_single_product_extra_label')) {
    function antra_single_product_extra_label() {
        global $product;
        $product_extra_label = get_post_meta($product->get_id(), '_product_extra_label', true);
        if ($product_extra_label !== '') {
            echo '<div class="antra-single-product-extra-label">' . wp_kses_post(wpautop($product_extra_label)) . '</div>';
        }
    }
}

if (!function_exists('antra_button_shop_canvas')) {
    function antra_button_shop_canvas() {
        if (is_active_sidebar('sidebar-woocommerce-shop')) { ?>
            <a href="#" class="filter-toggle" aria-expanded="false">
                <i class="antra-icon-sliders-v"></i><span><?php esc_html_e('Filter', 'antra'); ?></span></a>
            <?php
        }
    }
}

if (!function_exists('antra_button_shop_dropdown')) {
    function antra_button_shop_dropdown() {
        if (is_active_sidebar('sidebar-woocommerce-shop')) { ?>
            <a href="#" class="filter-toggle-dropdown" aria-expanded="false">
                <i class="antra-icon-plus-o"></i><span><?php esc_html_e('Filter', 'antra'); ?></span></a>
            <?php
        }
    }
}

if (!function_exists('antra_render_woocommerce_shop_canvas')) {
    function antra_render_woocommerce_shop_canvas() {
        if (is_active_sidebar('sidebar-woocommerce-shop') && antra_is_product_archive()) {
            ?>
            <div id="antra-canvas-filter" class="antra-canvas-filter">
                <span class="filter-close"><i class="antra-icon-times"></i></span>
                <div class="antra-canvas-filter-wrap">
                    <?php if (antra_get_theme_option('woocommerce_archive_layout') == 'canvas' || antra_get_theme_option('woocommerce_archive_layout') == 'fullwidth') {
                        dynamic_sidebar('sidebar-woocommerce-shop');
                    }
                    ?>
                </div>
            </div>
            <div class="antra-overlay-filter"></div>
            <?php
        }
    }
}
if (!function_exists('antra_render_woocommerce_shop_dropdown')) {
    function antra_render_woocommerce_shop_dropdown() {
        if (antra_get_theme_option('woocommerce_archive_layout') == 'dropdown') {
        ?>
        <div id="antra-dropdown-filter" class="antra-dropdown-filter">
            <div class="antra-dropdown-filter-wrap">
                <?php
                dynamic_sidebar('sidebar-woocommerce-shop');
                ?>
            </div>
        </div>
        <?php
        }
    }
}


if (!function_exists('antra_render_woocommerce_shop_menu')) {
    function antra_render_woocommerce_shop_menu() {
        ?>
        <div id="antra-menu-filter" class="antra-menu-filter">
            <div class="antra-menu-filter-wrap">
                <?php
                dynamic_sidebar('sidebar-woocommerce-shop');
                ?>
            </div>
        </div>
        <?php
    }
}

if (!function_exists('woocommerce_checkout_order_review_start')) {

    function woocommerce_checkout_order_review_start() {
        echo '<div class="checkout-review-order-table-wrapper">';
    }
}

if (!function_exists('woocommerce_checkout_order_review_end')) {

    function woocommerce_checkout_order_review_end() {
        echo '</div>';
    }
}

if (!function_exists('antra_woocommerce_get_product_label_stock')) {
    function antra_woocommerce_get_product_label_stock() {
        /**
         * @var $product WC_Product
         */
        global $product;
        if ($product->get_stock_status() == 'outofstock') {
            echo '<span class="stock-label">' . esc_html__('Out Of Stock', 'antra') . '</span>';
        }
    }
}

if (!function_exists('antra_woocommerce_single_content_wrapper_start')) {
    function antra_woocommerce_single_content_wrapper_start() {
        echo '<div class="content-single-wrapper">';
    }
}

if (!function_exists('antra_woocommerce_single_content_wrapper_end')) {
    function antra_woocommerce_single_content_wrapper_end() {
        echo '</div>';
    }
}

if (!function_exists('antra_woocommerce_single_product_summary_left_start')) {
    function antra_woocommerce_single_product_summary_left_start() {
        echo '<div class="left">';
    }
}

if (!function_exists('antra_woocommerce_single_product_summary_left_end')) {
    function antra_woocommerce_single_product_summary_left_end() {
        echo '</div>';
    }
}

if (!function_exists('antra_woocommerce_single_product_summary_sidebar_left_start')) {
    function antra_woocommerce_single_product_summary_sidebar_left_start() {
        echo '<div class="single-sidebar-left">';
    }
}

if (!function_exists('antra_woocommerce_single_product_summary_sidebar_left_end')) {
    function antra_woocommerce_single_product_summary_sidebar_left_end() {
        echo '</div>';
    }
}

if (!function_exists('antra_woocommerce_single_brand')) {
    function antra_woocommerce_single_brand() {
        $id = get_the_ID();

        $terms = get_the_terms($id, 'product_brand');

        if (is_wp_error($terms)) {
            return $terms;
        }

        if (empty($terms)) {
            return false;
        }

        $links = array();

        foreach ($terms as $term) {
            $link = get_term_link($term, 'product_brand');
            if (is_wp_error($link)) {
                return $link;
            }
            $links[] = '<a href="' . esc_url($link) . '" rel="tag">' . $term->name . '</a>';
        }
        echo '<div class="product-brand">' . esc_html__('Brands: ', 'antra') . join('', $links) . '</div>';
    }
}

if (!function_exists('antra_single_product_video_360')) {
    function antra_single_product_video_360() {
        global $product;
        echo '<div class="product-video-360">';
        $images = get_post_meta($product->get_id(), '_product_360_image_gallery', true);
        $video  = get_post_meta($product->get_id(), '_video_select', true);

        if ($video && wc_is_valid_url($video)) {
            echo '<a class="product-video-360__btn btn-video" href="' . $video . '"><i class="antra-icon-video"></i><span>' . esc_html__('Video', 'antra') . '</span></a>';
        }

        if ($images) {
            $array      = explode(',', $images);
            $images_url = [];
            foreach ($array as $id) {
                $url          = wp_get_attachment_image_src($id, 'full');
                $images_url[] = $url[0];
            }

            echo '<a class="product-video-360__btn btn-360" href="#view-360"><i class="antra-icon-360"></i><span>' . esc_html__('360 View', 'antra') . '</span></a>';
            ?>
            <div id="view-360" class="view-360 zoom-anim-dialog mfp-hide">
                <div id="rotateimages" class="opal-loading"
                     data-images="<?php echo implode(',', $images_url); ?>"></div>
                <div class="view-360-group">
                    <span class='view-360-button view-360-prev'><i class="antra-icon-angle-left"></i></span>
                    <i class="antra-icon-360 view-360-svg"></i>
                    <span class='view-360-button view-360-next'><i class="antra-icon-angle-right"></i></span>
                </div>
            </div>
            <?php
        }

        echo '</div>';
    }
}

if (!function_exists('antra_output_product_data_accordion')) {
    function antra_output_product_data_accordion() {
        $product_tabs = apply_filters('woocommerce_product_tabs', array());
        if (!empty($product_tabs)) : ?>
            <div id="antra-accordion-container" class="woocommerce-tabs wc-tabs-wrapper product-accordions">
                <?php $_count = 0; ?>
                <?php foreach ($product_tabs as $key => $tab) : 
                    $active = ($_count == 0) ? 'active' : '';
                    ?>
                    <div class="accordion-item">
                        <div class="accordion-head <?php echo esc_attr($key); ?>_tab js-btn-accordion <?php echo esc_html($active) ?>"
                             id="tab-title-<?php echo esc_attr($key); ?>">
                            <div class="accordion-title"><?php echo apply_filters('woocommerce_product_' . $key . '_tab_title', esc_html($tab['title']), $key); ?></div>
                        </div>
                        <div class="accordion-body js-card-body <?php echo esc_html($active) ?>">
                            <?php call_user_func($tab['callback'], $key, $tab); ?>
                        </div>
                    </div>
                    <?php $_count++; ?>
                <?php endforeach; ?>
            </div>
        <?php endif;
    }
}

if (!function_exists('antra_output_product_data_expand')) {
    function antra_output_product_data_expand() {
        $product_tabs = apply_filters('woocommerce_product_tabs', array());
        if (!empty($product_tabs)) : ?>
            <div class="woocommerce-tabs wc-tabs-wrapper product-tab-expand">
                <?php $_count = 0; ?>
                <?php foreach ($product_tabs as $key => $tab) : ?>
                    <div class="expand-item">
                        <div class="expand-title"><?php echo apply_filters('woocommerce_product_' . $key . '_tab_title', esc_html($tab['title']), $key); ?></div>
                        <div class="expand-body">
                            <?php call_user_func($tab['callback'], $key, $tab); ?>
                        </div>
                    </div>
                    <?php $_count++; ?>
                <?php endforeach; ?>
            </div>
        <?php endif;
    }
}

if (!function_exists('antra_quickview_button')) {
    function antra_quickview_button() {
        if (function_exists('woosq_init')) {
            echo do_shortcode('[woosq]');
        }
    }
}
if (!function_exists('antra_single__product_button')) {
    function antra_single__product_button () {
        ?>
        <div class="product_button">
            <div class="product_action_btn">
                <?php
                antra_wishlist_button();
                antra_compare_button();
                ?>
            </div>
        </div>
        <?php
    }
}
if (!function_exists('antra_single_product_question_chart')) {
    function antra_single_product_question_chart() {
        ?>
        <div class="product_group_action">
            <?php antra_single__product_button(); ?>
            <div class="product_question_chart">
                <?php
                $ask_a_question_form = antra_get_theme_option('single_product_ask', false);
                $show_ask_action = antra_is_contactform_activated() && $ask_a_question_form;
                if ($show_ask_action) {
                    $form = wpcf7_get_contact_form_by_hash($ask_a_question_form);
                    if ($form) {
                        ?>
                        <a class="product_question ask-a-question-button" data-effect="mfp-move-horizontal" href="#product-ask-a-question-popup" title="<?php __('Ask a Question', 'antra') ?>">
                            <i class="antra-icon-envelope"></i>
                            <?php echo __('Ask about product', 'antra') ?>
                        </a>
                        <?php
                        echo '<div id="product-ask-a-question-popup" class="mfp-hide single-product-popup mfp-with-anim"><div class="popup-content">' . antra_do_shortcode('contact-form-7', ['id' => $ask_a_question_form]) . '</div></div>';
                    }    
                }
                Antra_WooCommerce_Settings::instance()->render_sizechart_button();
                ?>
            </div>
        </div>
        <?php
    }
}
if (!function_exists('antra_compare_button')) {
    function antra_compare_button() {
        if (function_exists('woosc_init')) {
            echo do_shortcode('[woosc]');
        }
    }
}
if (!function_exists('antra_wishlist_button')) {
    function antra_wishlist_button() {
        if (function_exists('woosw_init')) {
            echo do_shortcode('[woosw]');
        }
    }
}


if (!function_exists('antra_quick_shop')) {
    function antra_quick_shop($id = false) {
        if (isset($_GET['id'])) {
            $id = sanitize_text_field((int)$_GET['id']);
        }
        if (!$id || !antra_is_woocommerce_activated()) {
            return;
        }

        global $post;

        $args = array('post__in' => array($id), 'post_type' => 'product');

        $quick_posts = get_posts($args);

        foreach ($quick_posts as $post) :
            setup_postdata($post);
            woocommerce_template_single_add_to_cart();
        endforeach;

        wp_reset_postdata();

        die();
    }

    add_action('wp_ajax_antra_quick_shop', 'antra_quick_shop');
    add_action('wp_ajax_nopriv_antra_quick_shop', 'antra_quick_shop');

}

if (!function_exists('antra_quick_shop_wrapper')) {
    function antra_quick_shop_wrapper() {
        global $product;
        ?>
        <div class="quick-shop-wrapper">
            <div class="quick-shop-close cross-button"></div>
            <div class="quick-shop-form">
            </div>
        </div>
        <?php
    }
}

function antra_ajax_add_to_cart_handler() {
    WC_Form_Handler::add_to_cart_action();
    WC_AJAX::get_refreshed_fragments();
}

function antra_ajax_add_to_cart_add_fragments($fragments) {
    $all_notices  = WC()->session->get('wc_notices', array());
    $notice_types = apply_filters('woocommerce_notice_types', array('error', 'success', 'notice'));

    ob_start();
    foreach ($notice_types as $notice_type) {
        if (wc_notice_count($notice_type) > 0) {
            wc_get_template("notices/{$notice_type}.php", array(
                'notices' => array_filter($all_notices[$notice_type]),
            ));
        }
    }
    $fragments['notices_html'] = ob_get_clean();

    wc_clear_notices();

    return $fragments;
}

if (!function_exists('antra_ajax_search_result')) {
    function antra_ajax_search_result() {
        ?>
        <div class="ajax-search-result d-none">
        </div>
        <?php
    }
}

if (!function_exists('antra_ajax_live_search_template')) {
    function antra_ajax_live_search_template() {
        echo <<<HTML
        <script type="text/html" id="tmpl-ajax-live-search-template">
        <div class="product-item-search">
            <# if(data.url){ #>
            <a class="product-link" href="{{{data.url}}}" title="{{{data.title}}}">
            <# } #>
                <# if(data.img){#>
                <img src="{{{data.img}}}" alt="{{{data.title}}}">
                 <# } #>
                <div class="product-content">
                <h3 class="product-title">{{{data.title}}}</h3>
                <# if(data.price){ #>
                {{{data.price}}}
                 <# } #>
                </div>
                <# if(data.url){ #>
            </a>
            <# } #>
        </div>
        </script>
HTML;
    }
}
add_action('wp_footer', 'antra_ajax_live_search_template');

if (!function_exists('antra_single_product_review_template')) {
    function antra_single_product_review_template() {
        global $product;

        if (comments_open()) {
            ?>
            <div class="single-product-reviews-wrap">
                <?php
                echo '<h3 class="review-title">' . esc_html__('Reviews', 'antra') . '<sup class="count">' . $product->get_review_count() . '</sup></h3>';
                comments_template();
                ?>
            </div>
            <?php
        }
    }
}

if (!function_exists('antra_single_product_tabs_template')) {
    function antra_single_product_tabs_template() {
        $product_tabs = apply_filters('woocommerce_product_tabs', array());
        if (!empty($product_tabs)) : ?>
            <div class="antra-woocommerce-tabs">
                <?php foreach ($product_tabs as $key => $product_tab) : ?>
                    <div class="umimi-woocommerce-tabs-panel">
                        <?php
                        if (isset($product_tab['callback'])) {
                            call_user_func($product_tab['callback'], $key, $product_tab);
                        }
                        ?>
                    </div>
                <?php endforeach; ?>
            </div>
        <?php endif;
    }
}

if (!function_exists('antra_woocommerce_render_color')) {

    function antra_woocommerce_render_color() {
        /**
         * @var $product WC_Product_Variable
         */
        global $product;

        if (!function_exists('Woo_Variation_Swatches')) {
            return;
        }

        if ($product->is_type('variable')) {
            $attr_name           = 'pa_color';
            $product_color_terms = wc_get_product_terms($product->get_id(), $attr_name, array('fields' => 'all'));
            $tax                 = Woo_Variation_Swatches_Backend::instance()->get_attribute_taxonomy($attr_name);
            $options             = $product->get_available_variations();

            if (!empty($product_color_terms)) {
                echo '<div class="product-color">';

                foreach ($product_color_terms as $term) {
                    $thumbnail = [];
                    foreach ($options as $option) {
                        foreach ($option['attributes'] as $_k => $_v) {
                            if ($_k === 'attribute_' . $attr_name && $_v === $term->slug) {
                                $thumbnail = $option['image'];
                                break;
                            }
                            if (count($thumbnail) > 0) {
                                break;
                            }
                        }
                    }

                    if (woo_variation_swatches()->get_frontend()->is_color_attribute($tax)) {
                        // Global Color
                        $color = sanitize_hex_color(woo_variation_swatches()->get_frontend()->get_product_attribute_color($term));
                        echo '<div class="item color-item" data-image="' . htmlspecialchars(wp_json_encode($thumbnail)) . '"  style="background-color:' . esc_attr($color) . '"><span>' . esc_html($term->name) . '</span></div>';
                    } elseif (woo_variation_swatches()->get_frontend()->is_image_attribute($tax)) {
                        $attachment_id = absint(woo_variation_swatches()->get_frontend()->get_product_attribute_image($term));
                        $image_size    = woo_variation_swatches()->get_option('attribute_image_size');
                        $image         = wp_get_attachment_image_src($attachment_id, $image_size);

                        echo sprintf('<div class="item image-item" data-image="' . htmlspecialchars(wp_json_encode($thumbnail)) . '"><img aria-hidden="true" alt="%s" src="%s" width="%d" height="%d" /></div>', esc_attr($term->name), esc_url($image[0]), esc_attr($image[1]), esc_attr($image[2]));
                    }
                }
                echo '</div>';
            }
        }
    }
}


if (!function_exists('antra_woocommerce_render_variable')) {
    function antra_woocommerce_render_variable() {
        /**
         * @var $product WC_Product_Variable
         */

        global $product;
        $attr_name = antra_get_theme_option('wocommerce_attribute', '');
        if (!$attr_name) {
            return;
        }
        if (!taxonomy_exists(wc_attribute_taxonomy_name($attr_name))) {
            return;
        }
        $attr_name = apply_filters('antra_swatch_attribute', 'pa_' . $attr_name);

        if ($product->is_type('variable')) {

            if (!isset($product->get_variation_attributes()[$attr_name])) {
                return;
            }

            $variables = $product->get_variation_attributes()[$attr_name];

            $options = $product->get_available_variations();
            $html    = '<div class="antra-wrap-swatches"><div class="inner">';
            $terms   = wc_get_product_terms($product->get_id(), $attr_name, array('fields' => 'all'));
            foreach ($terms as $term) {
                if (in_array($term->slug, $variables)) {
                    $html .= antra_woocommerce_get_swatch_html($term, $options, $attr_name);
                }
            }
            $html .= '</div></div>';
            printf('%s', $html);
        }
    }
}

if (!function_exists('antra_woocommerce_get_swatch_html')) {
    function antra_woocommerce_get_swatch_html($term, $options, $attr_name) {
        $html      = '';
        $attr_name = 'attribute_' . $attr_name;
        $name      = esc_html(apply_filters('woocommerce_variation_option_name', $term->name));
        $image     = '';
        foreach ($options as $option) {
            foreach ($option['attributes'] as $_k => $_v) {
                if ($_k === $attr_name && $_v === $term->slug) {
                    $image = $option['image'];
                    break;
                }

                if ($image !== '') {
                    break;
                }
            }
        }

        if (class_exists('Woo_Variation_Swatches')) {
            $attribute      = woo_variation_swatches()->get_backend()->get_attribute_taxonomy($term->taxonomy);
            $attribute_type = $attribute->attribute_type;

            if (isset($attribute_type)) {
                switch ($attribute_type) {
                    case 'color':
                        $color = get_term_meta($term->term_id, 'product_attribute_color', true);
                        $html  = sprintf(
                            '<span class="antra-tooltip antra-product-swatches swatches-color" data-image="%s" title="%s" data-value="%s"><span class="color" style="background-color:%s;"></span><span class="screen-reader-text">%s</span></span>',
                            htmlspecialchars(wp_json_encode($image)),
                            esc_attr($name),
                            esc_attr($term->slug),
                            esc_attr($color),
                            $name
                        );
                        break;

                    case 'image':
                        $attachment_id = absint(get_term_meta($term->term_id, 'product_attribute_image', true));
                        $image_size    = woo_variation_swatches()->get_option('attribute_image_size');
                        $image2        = wp_get_attachment_image_src($attachment_id, apply_filters('wvs_product_attribute_image_size', $image_size));
                        $image_url     = $image2 ? $image2[0] : WC()->plugin_url() . '/assets/images/placeholder.png';

                        $html = sprintf(
                            '<span class="antra-tooltip antra-product-swatches swatches-image" data-image="%s" title="%s" data-value="%s"><img src="%s" alt="%s"><span class="screen-reader-text">%s</span></span>',
                            htmlspecialchars(wp_json_encode($image)),
                            esc_attr($name),
                            esc_attr($term->slug),
                            esc_url($image_url),
                            esc_attr($name),
                            esc_attr($name)
                        );
                        break;
                    default:
                        $html = sprintf(
                            '<span class="antra-product-swatches swatches-label" data-image="%s" title="%s" data-value="%s">%s</span>',
                            htmlspecialchars(wp_json_encode($image)),
                            esc_attr($name),
                            esc_attr($term->slug),
                            esc_attr($name)
                        );
                        break;
                }
            } else {
                $html = sprintf(
                    '<span class="antra-product-swatches swatches-label" data-image="%s" title="%s" data-value="%s">%s</span>',
                    htmlspecialchars(wp_json_encode($image)),
                    esc_attr($name),
                    esc_attr($term->slug),
                    esc_attr($name)
                );
            }
        } else {
            $html = sprintf(
                '<span class="antra-product-swatches swatches-label" data-image="%s" title="%s" data-value="%s">%s</span>',
                htmlspecialchars(wp_json_encode($image)),
                esc_attr($name),
                esc_attr($term->slug),
                esc_attr($name)
            );
        }

        return $html;
    }
}

if (!function_exists('antra_shop_page_link')) {
    function antra_shop_page_link($keep_query = false, $taxonomy = '') {
        // Base Link decided by current page
        if (is_post_type_archive('product') || is_page(wc_get_page_id('shop')) || is_shop()) {
            $link = get_permalink(wc_get_page_id('shop'));
        } elseif (is_product_category()) {
            $link = get_term_link(get_query_var('product_cat'), 'product_cat');
        } elseif (is_product_tag()) {
            $link = get_term_link(get_query_var('product_tag'), 'product_tag');
        } else {
            $queried_object = get_queried_object();
            $link           = get_term_link($queried_object->slug, $queried_object->taxonomy);
        }

        if ($keep_query) {

            // Min/Max
            if (isset($_GET['min_price'])) {
                $link = add_query_arg('min_price', wc_clean($_GET['min_price']), $link);
            }

            if (isset($_GET['max_price'])) {
                $link = add_query_arg('max_price', wc_clean($_GET['max_price']), $link);
            }

            // Orderby
            if (isset($_GET['orderby'])) {
                $link = add_query_arg('orderby', wc_clean($_GET['orderby']), $link);
            }

            if (isset($_GET['woocommerce_catalog_columns'])) {
                $link = add_query_arg('woocommerce_catalog_columns', wc_clean($_GET['woocommerce_catalog_columns']), $link);
            }

            if (isset($_GET['woocommerce_archive_layout'])) {
                $link = add_query_arg('woocommerce_archive_layout', wc_clean($_GET['woocommerce_archive_layout']), $link);
            }

            if (isset($_GET['layout'])) {
                $link = add_query_arg('layout', wc_clean($_GET['layout']), $link);
            }

            if (isset($_GET['wocommerce_block_style'])) {
                $link = add_query_arg('wocommerce_block_style', wc_clean($_GET['wocommerce_block_style']), $link);
            }

            /**
             * Search Arg.
             * To support quote characters, first they are decoded from &quot; entities, then URL encoded.
             */
            if (get_search_query()) {
                $link = add_query_arg('s', rawurlencode(wp_specialchars_decode(get_search_query())), $link);
            }

            // Post Type Arg
            if (isset($_GET['post_type'])) {
                $link = add_query_arg('post_type', wc_clean($_GET['post_type']), $link);
            }

            // Min Rating Arg
            if (isset($_GET['min_rating'])) {
                $link = add_query_arg('min_rating', wc_clean($_GET['min_rating']), $link);
            }

            // All current filters
            if ($_chosen_attributes = WC_Query::get_layered_nav_chosen_attributes()) {
                foreach ($_chosen_attributes as $name => $data) {
                    if ($name === $taxonomy) {
                        continue;
                    }
                    $filter_name = sanitize_title(str_replace('pa_', '', $name));
                    if (!empty($data['terms'])) {
                        $link = add_query_arg('filter_' . $filter_name, implode(',', $data['terms']), $link);
                    }
                    if ('or' == $data['query_type']) {
                        $link = add_query_arg('query_type_' . $filter_name, 'or', $link);
                    }
                }
            }
        }

        if (is_string($link)) {
            return $link;
        } else {
            return '';
        }
    }
}

if (!function_exists('antra_products_per_page_select')) {

    function antra_products_per_page_select() {
        if ((wc_get_loop_prop('is_shortcode') || !wc_get_loop_prop('is_paginated') || !woocommerce_products_will_display())) return;

        $row          = wc_get_default_products_per_row();
        $max_col      = apply_filters('antra_products_row_step_max', 6);
        $array_option = [];
        if ($max_col > 2) {
            for ($i = 2; $i <= $max_col; $i++) {
                $array_option[] = $row * $i;
            }
        } else {
            return;
        }

        $col = wc_get_default_product_rows_per_page();

        $products_per_page_options = apply_filters('antra_products_per_page_options', $array_option);

        $current_variation = isset($_GET['per_page']) ? $_GET['per_page'] : $col * $row;
        ?>

        <div class="antra-products-per-page">

            <label for="per_page" class="per-page-title"><?php esc_html_e('Show', 'antra'); ?></label>
            <select name="per_page" id="per_page">
                <?php
                foreach ($products_per_page_options as $key => $value) :

                    ?>
                    <option value="<?php echo add_query_arg('per_page', $value, antra_shop_page_link(true)); ?>" <?php echo esc_attr($current_variation == $value ? 'selected' : ''); ?>>
                        <?php echo esc_html($value); ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>
        <?php
    }
}

if (isset($_GET['per_page'])) {
    add_filter('loop_shop_per_page', 'antra_loop_shop_per_page', 20);
}

function antra_loop_shop_per_page($cols) {
    $cols = isset($_GET['per_page']) ? $_GET['per_page'] : $cols;

    return $cols;
}

if (!function_exists('antra_active_filters')) {
    function antra_active_filters() {
        global $wp;
        $url             = home_url(add_query_arg(array(), $wp->request));
        $link_remove_all = strtok($url, '?');
        echo '<div class="antra-active-filters">';
        the_widget('WC_Widget_Layered_Nav_Filters');
        echo '<a class="clear-all" href="' . esc_url($link_remove_all) . '">' . esc_html__('Clear All', 'antra') . '</a></div>';
    }
}

if (!function_exists('antra_get_shop_banner')) {

    function antra_get_shop_banner() {
        if (!antra_is_elementor_activated() || is_singular('product') || !antra_is_product_archive()) {
            return;
        }
        $slug = antra_get_theme_option('shop_banner');
        $queried_post = get_page_by_path($slug, OBJECT, 'elementor_library');
        if (isset($queried_post->ID)) {
            echo Elementor\Plugin::instance()->frontend->get_builder_content($queried_post->ID);
            $css_file = Elementor\Core\Files\CSS\Post::create( $queried_post->ID );
            $css_file->enqueue();
        }

    }
}

if (!function_exists('antra_wcc_list_layout_loop')) {

    function antra_wcc_list_layout_loop($layout) {
        $layout = 'list';

        return $layout;
    }
}

if (!function_exists('antra_wcc_grid_layout_loop')) {

    function antra_wcc_grid_layout_loop($layout) {
        $layout = 'grid';

        return $layout;
    }
}

if (!function_exists('antra_wcc_add_class_list_style_2')) {

    function antra_wcc_add_class_list_style_2($classes, $product) {
        array_unshift($classes , 'list_style_2');

        return $classes;
    }
}


if (!function_exists('antra_woocommerce_price_add_to_cart')) {

    function antra_woocommerce_price_add_to_cart() {
        echo '<div class="antra-woocommerce-price-atc">';
            antra_single__quantity_cart();
            woocommerce_template_loop_price();
        echo '</div>';
    }
}

