<?php
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

if (!class_exists('Antra_WQFSP')) :

    class Antra_WQFSP {

        /**
         * @var The single instance of the class
         */
        private static $_instance = null;

        /**
         * Main Antra_WQFSP Instance
         *
         * Ensures only one instance of WooCommerce is loaded or can be loaded.
         *
         * @static
         * @return Antra_WQFSP main instance
         * @see Antra_WQFSP()
         */
        public static function instance() {
            if (is_null(self::$_instance)) {
                self::$_instance = new self();
            }
            return self::$_instance;
        }

        /**
         * Antra_WQFSP Constructor.
         */
        public function __construct() {
            // add_action('init', array($this, 'quantity_handler'));
            // add_action('init', array($this, 'woa_confirm_add'));
            // add_filter('woocommerce_loop_add_to_cart_link', array($this, 'add_quantity_fields'), 10, 2);
            // add_filter('woocommerce_quantity_input_args', array($this, 'woa_woocommerce_quantity_input_args'), 10, 2);

            add_filter('woocommerce_loop_add_to_cart_args', [$this, 'loop_add_to_cart_args'], 10, 2);
        }

        /**
         * Add to cart Args
         */
        public function loop_add_to_cart_args($args, $product) {
            if (isset($args['attributes']['aria-describedby'])) {
                unset($args['attributes']['aria-describedby']);
            }

            return $args;
        }

        /**
         * Add quantity fields.
         */
        public function add_quantity_fields($html, $product) {
            //add quantity field only to simple products
            if ($product && $product->is_type('simple') && $product->is_purchasable() && $product->is_in_stock() && !$product->is_sold_individually()) {
                //rewrite form code for add to cart button
                $html = '<form action="' . esc_url($product->add_to_cart_url()) . '" class="cart" method="post" enctype="multipart/form-data">';
                $html .= woocommerce_quantity_input(array(), $product, false);
                $html .= '<button type="submit" data-quantity="1" data-product_id="' . $product->get_id() . '" class="button alt ajax_add_to_cart add_to_cart_button product_type_simple">' . esc_html($product->add_to_cart_text()) . '</button>';
                $html .= '</form>';
            }
            return $html;
        }

        /**
         * Adjust the quantity input values
         */
        function woa_woocommerce_quantity_input_args($args, $product) {
            if (is_singular('product') && $product->is_type('simple') && $product->is_purchasable() && $product->is_in_stock() && !$product->is_sold_individually()) {
                $args['input_value'] = 1;    // Starting value (we only want to affect product pages, not cart)
            }
            $args['max_value'] = $product->get_stock_quantity();    // Maximum value
            $args['min_value'] = 0;    // Minimum value
            $args['step']      = 1;    // Quantity steps
            return $args;
        }

        /**
         * add AJAX support.
         * synchs quantity field
         */
        public function quantity_handler() {
            wc_enqueue_js('
		jQuery(function($) {
		$("form.cart").on("change", "input.qty", function() {
        $(this.form).find("[data-quantity]").attr("data-quantity", this.value);  //used attr instead of data, for WC 4.0 compatibility
		});
		');

            wc_enqueue_js('
		$(document.body).on("adding_to_cart", function() {
			$("a.added_to_cart").remove();
		});
		});
		');
        }

        /**
         * add checkmark
         *
         */
        public function woa_confirm_add() {
            wc_enqueue_js('
		jQuery(document.body).on("added_to_cart", function( data ) {

		jQuery(".added_to_cart").after("<p class=\'confirm_add\'>Item Added</p>");
});

		');
        }

    }

endif; // ! class_exists()
Antra_WQFSP::instance();
