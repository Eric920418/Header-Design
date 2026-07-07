<?php
/**
 * Antra WooCommerce Settings Class
 *
 * @package  aro
 * @since    2.4.3
 */

if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra_WooCommerce_Settings')) :

    /**
     * The Antra WooCommerce Settings Class
     */
    class Antra_WooCommerce_Settings {

        /**
         * @var The single instance of the class
         */
        private static $_instance = null;

        public static function instance() {
            if (is_null(self::$_instance)) {
                self::$_instance = new self();
            }
            return self::$_instance;
        }

        public function __construct() {
            if (antra_is_elementor_activated()) {
                add_filter('woocommerce_product_data_tabs', array($this, 'settings_product_tabs'));
                add_action('woocommerce_product_data_panels', array(
                    $this,
                    'settings_options_product_tab_content'
                ),99);
                add_action('woocommerce_process_product_meta', array($this, 'save_settings_option_fields'));

                // add_action('woocommerce_single_product_summary', array($this, 'render_sizechart_button'), 25);
                add_action('wp_footer', array($this, 'render_sizechart_template'), 1);
                add_action('wp_enqueue_scripts', [$this, 'add_css']);
            }
            add_action( 'woocommerce_variable_product_before_variations', [$this, 'add_timesale_for_all_variable_product']);
        }

        public function settings_product_tabs($tabs) {

            $tabs['sizechart'] = array(
                'label'    => esc_html__('Antra settings', 'antra'),
                'target'   => 'antra_options',
                'class'    => array(),
                'priority' => 80,
            );

            return $tabs;

        }

        private function check_chart($slug = '') {

            if ($slug) {

                $queried_post = get_page_by_path($slug, OBJECT, 'elementor_library');

                if (isset($queried_post->ID)) {
                    return $queried_post->ID;
                }
            }

            return false;
        }

        public function settings_options_product_tab_content() {

            global $post;

            ?>
            <div id='antra_options' class='panel woocommerce_options_panel'>
                <div class='options_group'><?php

                    $value = get_post_meta($post->ID, '_sizechart_select', true);
                    if (empty($value)) {
                        $value = '';
                    }
                    $options[''] = esc_html__('Select size chart', 'antra');

                    $args = array(
                        'post_type'      => 'elementor_library',
                        'posts_per_page' => -1,
                        'orderby'        => 'title',
                        's'              => 'SizeChart ',
                        'order'          => 'ASC',
                    );

                    $query = new WP_Query($args);
                    while ($query->have_posts()) {
                        $query->the_post();
                        $options[$post->post_name] = $post->post_title;
                    }

                    wp_reset_postdata();

                    woocommerce_wp_select(array(
                        'id'      => '_sizechart_select',
                        'label'   => esc_html__('Size chart', 'antra'),
                        'options' => $options,
                        'value'   => $value,
                    ));

                    ?>
                    <p class="form-field form-field-wide wc-customer-custom"><?php echo esc_html__('Size chart will take templates name prefix is "SizeChart"','antra');?></p>

                    <?php
                    woocommerce_wp_text_input(array(
                        'id'    => '_video_select',
                        'label' => esc_html__('Url Video', 'antra'),
                        'value'   => get_post_meta($post->ID, '_video_select', true),
                    ));
                    woocommerce_wp_textarea_input(array(
                        'id'      => '_product_extra_label',
                        'label'   => esc_html__('Product Label', 'antra'),
                        'value'   => get_post_meta($post->ID, '_product_extra_label', true),
                    ));
                    woocommerce_wp_textarea_input(array(
                        'id'      => '_extra_info',
                        'label'   => esc_html__('Extra info', 'antra'),
                        'rows' => 5,
                        'wrapper_class' => 'form-row form-row-full',
                        'value'   => get_post_meta($post->ID, '_extra_info', true),
                    ));
                    ?>
                </div>

            </div>
            <?php
        }

        public function save_settings_option_fields($post_id) {
            if (isset($_POST['_sizechart_select'])) {
                update_post_meta($post_id, '_sizechart_select', esc_attr($_POST['_sizechart_select']));
            }
            if (isset($_POST['_video_select'])) {
                update_post_meta($post_id, '_video_select', esc_attr($_POST['_video_select']));
            }
            if (isset($_POST['_product_extra_label'])) {
                update_post_meta($post_id, '_product_extra_label', esc_attr($_POST['_product_extra_label']));
            }
            if (isset($_POST['_extra_info'])) {
                update_post_meta($post_id, '_extra_info', esc_attr($_POST['_extra_info']));
            }

            if (isset($_POST['_time_sale_for_all'])) {
                update_post_meta($post_id, '_time_sale_for_all', esc_attr($_POST['_time_sale_for_all']));
            }
            else {
                update_post_meta($post_id, '_time_sale_for_all', 'no');
            }
        }

        public function add_css() {
            global $post;
            if (!is_product()) {
                return;
            }
            $slug     = get_post_meta($post->ID, '_sizechart_select', true);
            $chart_id = $this->check_chart($slug);
            if (!empty($slug) && $chart_id) {
                Elementor\Core\Files\CSS\Post::create($chart_id)->enqueue();
            }
        }

        public function render_sizechart_button() {
            global $post;
            if (!is_product()) {
                return;
            }
            $slug     = get_post_meta($post->ID, '_sizechart_select', true);
            $chart_id = $this->check_chart($slug);
            if (!empty($slug) && $chart_id) {
                echo '<a href="#" class="sizechart-button">' . esc_html__('Size guide', 'antra') . '</a>';
            }
        }

        public function render_sizechart_template() {
            global $post;
            if (!is_product()) {
                return;
            }
            $slug     = get_post_meta($post->ID, '_sizechart_select', true);
            $chart_id = $this->check_chart($slug);
            if (!empty($slug) && $chart_id) {
                echo '<div class="sizechart-popup"><a href="#" class="sizechart-close"><i class="antra-icon-times-circle"></i></a>' . Elementor\Plugin::instance()->frontend->get_builder_content($chart_id) . '</div><div class="sizechart-overlay"></div>';
            }
        }

        public function add_timesale_for_all_variable_product () {
            
            $label = '<label for="time_sale_all" style="margin-right: 10px;"><strong>'.__('Enable time sale for all variable', 'antra').': </strong></label>';
            ?>
            <div class="toolbar time_sale_all_variable">
                <p class="form-field">
                    <?php
                    woocommerce_wp_checkbox(array(
                        'id'    => '_time_sale_for_all',
                        'label' => $label,
                    ));
                    ?>
                </p>		
                <div class="woocommerce_options_panel" style="float: unset; width: 100%; min-height: unset; padding: 0"></div>
            </div>
            <script>
                (function ($) {
                "use strict";
                    $(document).ready(function (){
                        $('#general_product_data .form-field.sale_price_dates_fields').appendTo('.time_sale_all_variable .woocommerce_options_panel');
                        if(!$("#_time_sale_for_all")[0].checked) {
                            $('.time_sale_all_variable .woocommerce_options_panel .sale_price_dates_fields').hide();
                        }
                        $("#_time_sale_for_all").change(function() {
                            if(this.checked) {
                                $(this).parents('.time_sale_all_variable').find('.woocommerce_options_panel .sale_price_dates_fields').slideDown();
                                $('.woocommerce_variations .woocommerce_variable_attributes .sale_price_dates_fields').hide();
                            }
                            else {
                                $(this).parents('.time_sale_all_variable').find('.woocommerce_options_panel .sale_price_dates_fields').slideUp();
                                $('.woocommerce_variations .woocommerce_variable_attributes .sale_price_dates_fields').show();
                            }
                        });
                    })
                })(jQuery);
        
            </script>
            <?php
        }
    }

    return new Antra_WooCommerce_Settings();

endif;
