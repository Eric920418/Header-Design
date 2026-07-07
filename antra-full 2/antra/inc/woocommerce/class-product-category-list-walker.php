<?php
/**
 * Antra_Custom_Walker_Category class
 *
 * @extends    Walker
 * @class        Antra_Custom_Walker_Category
 * @version        1.0.0
 * @package        WooCommerce/Classes/Walkers
 * @author        WooThemes
 */

if (!defined('ABSPATH')) {
	exit; // Exit if accessed directly
}

if (!class_exists('Antra_Custom_Walker_Category', false)) :

	class Antra_Custom_Walker_Category extends Walker_Category {

		public function start_el(&$output, $category, $depth = 0, $args = array(), $id = 0) {
			/** This filter is documented in wp-includes/category-template.php */
			$cat_name = apply_filters(
				'list_cats',
				esc_attr($category->name),
				$category
			);
	
			// Don't generate an element if the category name is empty.
			if (!$cat_name) {
				return;
			}
	
			$link = '<a class="pf-value" href="' . esc_url(get_term_link($category)) . '" data-val="' . esc_attr($category->slug) . '" data-title="' . esc_attr($category->name) . '" ';
			if ($args['use_desc_for_title'] && !empty($category->description)) {
				/**
				 * Filters the category description for display.
				 *
				 * @param string $description Category description.
				 * @param object $category Category object.
				 *
				 * @since 1.2.0
				 *
				 */
				$link .= 'title="' . esc_attr(strip_tags(apply_filters('category_description', $category->description, $category))) . '"';
			}
	
			$link .= '>';
			$link .= $cat_name . '</a>';
	
			if (!empty($args['feed_image']) || !empty($args['feed'])) {
				$link .= ' ';
	
				if (empty($args['feed_image'])) {
					$link .= '(';
				}
	
				$link .= '<a href="' . esc_url(get_term_feed_link($category->term_id, $category->taxonomy, $args['feed_type'])) . '"';
	
				if (empty($args['feed'])) {
					$alt = ' alt="' . sprintf(esc_html__('Feed for all posts filed under %s', 'antra'), $cat_name) . '"';
				} else {
					$alt  = ' alt="' . $args['feed'] . '"';
					$name = $args['feed'];
					$link .= empty($args['title']) ? '' : $args['title'];
				}
	
				$link .= '>';
	
				if (empty($args['feed_image'])) {
					$link .= $name;
				} else {
					$link .= "<img src='" . $args['feed_image'] . "'$alt" . ' />';
				}
				$link .= '</a>';
	
				if (empty($args['feed_image'])) {
					$link .= ')';
				}
			}
	
			if (!empty($args['show_count'])) {
				$link .= ' (' . number_format_i18n($category->count) . ')';
			}
			if ('list' == $args['style']) {
				$output      .= "\t<li";
				$css_classes = array(
					'cat-item',
					'cat-item-' . $category->term_id,
				);
	
				if (!empty($args['current_category'])) {
					// 'current_category' can be an array, so we use `get_terms()`.
					$_current_terms = get_terms(
						$category->taxonomy,
						array(
							'include'    => $args['current_category'],
							'hide_empty' => false,
						)
					);
	
					foreach ($_current_terms as $_current_term) {
						if ($category->term_id == $_current_term->term_id) {
							$css_classes[] = 'current-cat pf-active';
						} elseif ($category->term_id == $_current_term->parent) {
							$css_classes[] = 'current-cat-parent';
						}
						while ($_current_term->parent) {
							if ($category->term_id == $_current_term->parent) {
								$css_classes[] = 'current-cat-ancestor';
								break;
							}
							$_current_term = get_term($_current_term->parent, $category->taxonomy);
						}
					}
				}
	
				/**
				 * Filters the list of CSS classes to include with each category in the list.
				 *
				 * @param array $css_classes An array of CSS classes to be applied to each list item.
				 * @param object $category Category data object.
				 * @param int $depth Depth of page, used for padding.
				 * @param array $args An array of wp_list_categories() arguments.
				 *
				 * @since 4.2.0
				 *
				 * @see wp_list_categories()
				 *
				 */
				$css_classes = implode(' ', apply_filters('category_css_class', $css_classes, $category, $depth, $args));
	
				$output .= ' class="' . $css_classes . '"';
				$output .= ">$link\n";
			} elseif (isset($args['separator'])) {
				$output .= "\t$link" . $args['separator'] . "\n";
			} else {
				$output .= "\t$link<br />\n";
			}
		}
	}

endif;
