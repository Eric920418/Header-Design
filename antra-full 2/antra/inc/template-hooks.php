<?php
/**
 * =================================================
 * Hook antra_single_elementor_builder
 * =================================================
 */
add_action('antra_single_elementor_builder', 'antra_page_content', 10);

/**
 * =================================================
 * Hook antra_page
 * =================================================
 */
add_action('antra_page', 'antra_page_header', 10);
add_action('antra_page', 'antra_page_content', 20);

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
add_action('antra_single_post', 'antra_post_thumbnail', 20);
add_action('antra_single_post', 'antra_post_excerpt', 15);
add_action('antra_single_post', 'antra_post_header', 10);
add_action('antra_single_post', 'antra_post_content', 30);

/**
 * =================================================
 * Hook antra_single_post_bottom
 * =================================================
 */
add_action('antra_single_post_bottom', 'antra_post_taxonomy', 5);
add_action('antra_single_post_bottom', 'antra_post_nav', 10);
add_action('antra_single_post_bottom', 'antra_single_author', 15);
add_action('antra_single_post_bottom', 'antra_display_comments', 20);

/**
 * =================================================
 * Hook antra_loop_post
 * =================================================
 */
add_action('antra_loop_post', 'antra_post_content', 30);

/**
 * =================================================
 * Hook antra_after_container
 * =================================================
 */
add_action('antra_after_container', 'antra_output_related_products', 20);

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
add_action('antra_footer', 'antra_footer_default', 20);

/**
 * =================================================
 * Hook antra_after_footer
 * =================================================
 */

/**
 * =================================================
 * Hook wp_footer
 * =================================================
 */
add_action('wp_footer', 'antra_template_account_dropdown', 1);
add_action('wp_footer', 'antra_mobile_nav', 1);

/**
 * =================================================
 * Hook wp_head
 * =================================================
 */
add_action('wp_head', 'antra_pingback_header', 1);

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
add_action('antra_before_content', 'antra_archive_blog_top', 10);

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
add_action('antra_sidebar', 'antra_get_sidebar', 10);

/**
 * =================================================
 * Hook antra_loop_before
 * =================================================
 */
add_action('antra_loop_before', 'antra_blog_category_navigation', 10);

/**
 * =================================================
 * Hook antra_loop_after
 * =================================================
 */
add_action('antra_loop_after', 'antra_paging_nav', 10);

/**
 * =================================================
 * Hook antra_page_after
 * =================================================
 */
add_action('antra_page_after', 'antra_display_comments', 10);

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
add_action('antra_single_project', 'antra_project_thumbnail', 10);
add_action('antra_single_project', 'antra_post_content', 30);

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
add_action('antra_project_after_content', 'antra_post_nav', 10);

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
add_action('antra_team_header', 'antra_team_loop_job', 10);

/**
 * =================================================
 * Hook antra_team_contact_data
 * =================================================
 */
add_action('antra_team_contact_data', 'antra_object_loop_excerpt', 10);
add_action('antra_team_contact_data', 'antra_team_contact', 10);
add_action('antra_team_contact_data', 'antra_object_socials', 10);

/**
 * =================================================
 * Hook antra_team_more_section_content
 * =================================================
 */
add_action('antra_team_more_section_content', 'antra_team_section_content', 10);
add_action('antra_team_more_section_content', 'antra_team_section_skills', 10);
add_action('antra_team_more_section_content', 'antra_team_section_form', 10);

/**
 * =================================================
 * Hook antra_woocommerce_list_item_title
 * =================================================
 */

/**
 * =================================================
 * Hook antra_woocommerce_list_item_content
 * =================================================
 */

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

/**
 * =================================================
 * Hook antra_woocommerce_after_shop_loop_item_image
 * =================================================
 */

/**
 * =================================================
 * Hook antra_woocommerce_shop_loop_item_caption
 * =================================================
 */

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

/**
 * =================================================
 * Hook antra_product_list_content
 * =================================================
 */

/**
 * =================================================
 * Hook antra_product_list_end
 * =================================================
 */
