<?php
/**
 * =================================================
 * Hook antra_single_elementor_builder
 * =================================================
 */

/**
 * =================================================
 * Hook antra_page
 * =================================================
 */

/**
 * =================================================
 * Hook antra_single_post_top
 * =================================================
 */

/**
 * =================================================
 * Hook antra_single_post
 * =================================================
 */

/**
 * =================================================
 * Hook antra_single_post_bottom
 * =================================================
 */

/**
 * =================================================
 * Hook antra_loop_post
 * =================================================
 */

/**
 * =================================================
 * Hook antra_after_container
 * =================================================
 */

/**
 * =================================================
 * Hook antra_before_footer
 * =================================================
 */

/**
 * =================================================
 * Hook antra_footer
 * =================================================
 */

/**
 * =================================================
 * Hook antra_after_footer
 * =================================================
 */
add_action('antra_after_footer', 'antra_sticky_single_add_to_cart', 999);

/**
 * =================================================
 * Hook wp_footer
 * =================================================
 */
add_action('wp_footer', 'antra_render_woocommerce_shop_canvas', 1);

/**
 * =================================================
 * Hook wp_head
 * =================================================
 */

/**
 * =================================================
 * Hook antra_before_header
 * =================================================
 */

/**
 * =================================================
 * Hook antra_before_content
 * =================================================
 */

/**
 * =================================================
 * Hook antra_before_container
 * =================================================
 */

/**
 * =================================================
 * Hook antra_content_top
 * =================================================
 */
add_action('antra_content_top', 'antra_shop_messages', 10);

/**
 * =================================================
 * Hook antra_post_content_before
 * =================================================
 */

/**
 * =================================================
 * Hook antra_post_content_after
 * =================================================
 */

/**
 * =================================================
 * Hook antra_sidebar
 * =================================================
 */

/**
 * =================================================
 * Hook antra_loop_before
 * =================================================
 */

/**
 * =================================================
 * Hook antra_loop_after
 * =================================================
 */

/**
 * =================================================
 * Hook antra_page_after
 * =================================================
 */

/**
 * =================================================
 * Hook antra_single_project_top
 * =================================================
 */

/**
 * =================================================
 * Hook antra_single_project
 * =================================================
 */

/**
 * =================================================
 * Hook antra_single_project_bottom
 * =================================================
 */

/**
 * =================================================
 * Hook antra_project_after_content
 * =================================================
 */

/**
 * =================================================
 * Hook antra_service_header
 * =================================================
 */

/**
 * =================================================
 * Hook antra_service_content
 * =================================================
 */

/**
 * =================================================
 * Hook antra_team_thumbnail
 * =================================================
 */

/**
 * =================================================
 * Hook antra_team_header
 * =================================================
 */

/**
 * =================================================
 * Hook antra_team_contact_data
 * =================================================
 */

/**
 * =================================================
 * Hook antra_team_more_section_content
 * =================================================
 */

/**
 * =================================================
 * Hook antra_woocommerce_list_item_title
 * =================================================
 */
add_action('antra_woocommerce_list_item_title', 'antra_product_label', 5);
add_action('antra_woocommerce_list_item_title', 'antra_woocommerce_product_list_image', 10);

/**
 * =================================================
 * Hook antra_woocommerce_list_item_content
 * =================================================
 */
add_action('antra_woocommerce_list_item_content', 'woocommerce_template_loop_product_title', 10);
add_action('antra_woocommerce_list_item_content', 'antra_woocommerce_get_product_description', 15);
add_action('antra_woocommerce_list_item_content', 'woocommerce_template_loop_rating', 15);
add_action('antra_woocommerce_list_item_content', 'woocommerce_template_loop_price', 20);
add_action('antra_woocommerce_list_item_content', 'antra_stock_label', 25);

/**
 * =================================================
 * Hook antra_woocommerce_before_shop_loop_item
 * =================================================
 */

/**
 * =================================================
 * Hook antra_woocommerce_before_shop_loop_item_image
 * =================================================
 */
add_action('antra_woocommerce_before_shop_loop_item_image', 'antra_product_label', 10);
add_action('antra_woocommerce_before_shop_loop_item_image', 'woocommerce_template_loop_product_thumbnail', 15);

/**
 * =================================================
 * Hook antra_woocommerce_after_shop_loop_item_image
 * =================================================
 */
add_action('antra_woocommerce_after_shop_loop_item_image', 'antra_woocommerce_product_loop_action_start', 20);
add_action('antra_woocommerce_after_shop_loop_item_image', 'antra_wishlist_button', 20);
add_action('antra_woocommerce_after_shop_loop_item_image', 'antra_quickview_button', 20);
add_action('antra_woocommerce_after_shop_loop_item_image', 'antra_compare_button', 20);
add_action('antra_woocommerce_after_shop_loop_item_image', 'antra_woocommerce_product_loop_action_close', 20);

/**
 * =================================================
 * Hook antra_woocommerce_shop_loop_item_caption
 * =================================================
 */
add_action('antra_woocommerce_shop_loop_item_caption', 'antra_woocommerce_get_product_category', 5);
add_action('antra_woocommerce_shop_loop_item_caption', 'antra_single__rating_brands', 10);
add_action('antra_woocommerce_shop_loop_item_caption', 'woocommerce_template_loop_product_title', 15);
add_action('antra_woocommerce_shop_loop_item_caption', 'antra_woocommerce_get_product_description', 20);
add_action('antra_woocommerce_shop_loop_item_caption', 'woocommerce_template_loop_price', 30);
add_action('antra_woocommerce_shop_loop_item_caption', 'antra_single_product_extra_label', 25);
add_action('antra_woocommerce_shop_loop_item_caption', 'antra_single__quantity_cart', 35);

/**
 * =================================================
 * Hook antra_woocommerce_after_shop_loop_item
 * =================================================
 */

/**
 * =================================================
 * Hook antra_product_list_start
 * =================================================
 */

/**
 * =================================================
 * Hook antra_product_list_image
 * =================================================
 */
add_action('antra_product_list_image', 'antra_woocommerce_product_list_image', 10);

/**
 * =================================================
 * Hook antra_product_list_content
 * =================================================
 */
add_action('antra_product_list_content', 'woocommerce_template_loop_product_title', 10);
add_action('antra_product_list_content', 'antra_single_product_extra_label', 15);
add_action('antra_product_list_content', 'woocommerce_template_loop_rating', 15);
add_action('antra_product_list_content', 'woocommerce_template_loop_price', 20);

/**
 * =================================================
 * Hook antra_product_list_end
 * =================================================
 */
