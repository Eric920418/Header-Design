<?php
if (!defined('ABSPATH')) {
    exit;
}
if (!class_exists('Antra_Customize')) {

    class Antra_Customize {


        public function __construct() {
            add_action('customize_register', array($this, 'customize_register'));
        }

        private function get_block($kw) {
            global $post;

            $options[''] = esc_html__('Select Block', 'antra');
            if (!antra_is_elementor_activated()) {
                return;
            }
            $args = array(
                'post_type'      => 'elementor_library',
                'posts_per_page' => -1,
                'orderby'        => 'title',
                's'              =>  $kw,
                'order'          => 'ASC',
                'post_status'          => 'publish',
            );

            $query1 = new WP_Query($args);
            while ($query1->have_posts()) {
                $query1->the_post();
                if (!empty($post->post_name)) {
                    $options[$post->post_name] = $post->post_title;
                }
            }

            wp_reset_postdata();
            return $options;
        }
        
        public function get_cf7_forms() {
            $cf7               = get_posts('post_type="wpcf7_contact_form"&numberposts=-1');
            $contact_forms[''] = esc_html__('Please select form', 'antra');
            if ($cf7) {
                foreach ($cf7 as $cform) {
                    $hash = get_post_meta( $cform->ID, '_hash', true );
                    if ($hash) {
                        $contact_forms[$hash] = $cform->post_title;
                    }
                }
            } else {
                $contact_forms[0] = esc_html__('No contact forms found', 'antra');
            }

            wp_reset_postdata();
            return $contact_forms;
        }

        public function customize_register($wp_customize) {

            /**
             * Theme options.
             */
            require_once get_theme_file_path('inc/customize-control/editor.php');
            $this->init_antra_blog($wp_customize);
            $this->antra_register_theme_customizer($wp_customize);


            if (antra_is_woocommerce_activated()) {
                $this->init_woocommerce($wp_customize);
            }
            
            if (post_type_exists('service')) {
                $this->init_antra_service($wp_customize);
            }
            
            if (post_type_exists('project')) {
                $this->init_antra_project($wp_customize);
            }

            if (post_type_exists('team')) {
                $this->init_antra_team($wp_customize);
            }

            do_action('antra_customize_register', $wp_customize);
        }

        function antra_register_theme_customizer($wp_customize) {

        } // end antra_register_theme_customizer

        public function antra_active_callback_show_top_block($control) {
            $setting = $control->manager->get_setting( 'antra_options_show_top_blog' );
            $show = $setting->value();

            return $show === 'yes';
        }

        /**
         * @param $wp_customize WP_Customize_Manager
         *
         * @return void
         */
        public function init_antra_blog($wp_customize) {

            $wp_customize->add_panel('antra_blog', array(
                'title' => esc_html__('Blog', 'antra'),
            ));

            // =========================================
            // Blog Archive
            // =========================================
            $wp_customize->add_section('antra_blog_archive', array(
                'title'      => esc_html__('Archive', 'antra'),
                'panel'      => 'antra_blog',
                'capability' => 'edit_theme_options',
            ));

            if (antra_is_elementor_activated()) {
                $wp_customize->add_setting('antra_options_show_top_blog', array(
                    'type'              => 'option',
                    'default'           => 'no',
                    'sanitize_callback' => 'sanitize_text_field',
                ));
    
                $wp_customize->add_control('antra_options_show_top_blog', array(
                    'section' => 'antra_blog_archive',
                    'label'   => esc_html__('Show Top Block', 'antra'),
                    'type'    => 'select',
                    'choices' => [
                        'no' => esc_html__('No', 'antra'),
                        'yes' => esc_html__('Yes', 'antra'),
                    ]
                ));

                $wp_customize->add_setting('antra_options_top_blog_template', array(
                    'type'              => 'option',
                    'default'           => '',
                    'sanitize_callback' => 'sanitize_text_field',
                ));

                $wp_customize->add_control('antra_options_top_blog_template', array(
                    'section'     => 'antra_blog_archive',
                    'label'       => esc_html__('Choose Block', 'antra'),
                    'type'        => 'select',
                    'description' => __('Block will take templates name prefix is "Blog"', 'antra'),
                    'choices'     => $this->get_block('Blog'),
                    'active_callback' => [$this, 'antra_active_callback_show_top_block'],
                ));
            }

            $wp_customize->add_setting('antra_options_navigation_blog', array(
                'type'              => 'option',
                'default'           => 'no',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_navigation_blog', array(
                'section' => 'antra_blog_archive',
                'label'   => esc_html__('Show Categories Navigation', 'antra'),
                'type'    => 'select',
                'choices' => [
                    'no' => esc_html__('No', 'antra'),
                    'yes' => esc_html__('Yes', 'antra'),
                ]
            ));

            $wp_customize->add_setting('antra_options_blog_sidebar', array(
                'type'              => 'option',
                'default'           => 'left',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_sidebar', array(
                'section' => 'antra_blog_archive',
                'label'   => esc_html__('Sidebar Position', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'none'  => esc_html__('None', 'antra'),
                    'left'  => esc_html__('Left', 'antra'),
                    'right' => esc_html__('Right', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_blog_style', array(
                'type'              => 'option',
                'default'           => 'standard',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_style', array(
                'section' => 'antra_blog_archive',
                'label'   => esc_html__('Blog style', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'standard' => esc_html__('Blog Standard', 'antra'),
                    'list'     => esc_html__('Blog List', 'antra'),
                    'style-1'  => esc_html__('Blog Grid', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_blog_columns', array(
                'type'              => 'option',
                'default'           => 3,
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_columns', array(
                'section' => 'antra_blog_archive',
                'label'   => esc_html__('Colunms', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    1 => esc_html__('1', 'antra'),
                    2 => esc_html__('2', 'antra'),
                    3 => esc_html__('3', 'antra'),
                    4 => esc_html__('4', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_blog_columns_laptop', array(
                'type'              => 'option',
                'default'           => 3,
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_columns_laptop', array(
                'section' => 'antra_blog_archive',
                'label'   => esc_html__('Colunms Laptop', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    1 => esc_html__('1', 'antra'),
                    2 => esc_html__('2', 'antra'),
                    3 => esc_html__('3', 'antra'),
                    4 => esc_html__('4', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_blog_columns_tablet', array(
                'type'              => 'option',
                'default'           => 2,
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_columns_tablet', array(
                'section' => 'antra_blog_archive',
                'label'   => esc_html__('Colunms Tablet', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    1 => esc_html__('1', 'antra'),
                    2 => esc_html__('2', 'antra'),
                    3 => esc_html__('3', 'antra'),
                    4 => esc_html__('4', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_blog_columns_mobile', array(
                'type'              => 'option',
                'default'           => 1,
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_columns_mobile', array(
                'section' => 'antra_blog_archive',
                'label'   => esc_html__('Colunms Mobile', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    1 => esc_html__('1', 'antra'),
                    2 => esc_html__('2', 'antra'),
                    3 => esc_html__('3', 'antra'),
                    4 => esc_html__('4', 'antra'),
                ),
            ));

            // =========================================
            // Blog Single
            // =========================================
            $wp_customize->add_section('antra_blog_single', array(
                'title'      => esc_html__('Singular', 'antra'),
                'panel'      => 'antra_blog',
                'capability' => 'edit_theme_options',
            ));

            $wp_customize->add_setting('antra_options_blog_single_sidebar', array(
                'type'              => 'option',
                'default'           => 'left',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_single_sidebar', array(
                'section' => 'antra_blog_single',
                'label'   => esc_html__('Sidebar Position', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'none'  => esc_html__('None', 'antra'),
                    'left'  => esc_html__('Left', 'antra'),
                    'right' => esc_html__('Right', 'antra'),
                ),
            ));
            
            $wp_customize->add_setting('antra_options_blog_single_style', array(
                'type'              => 'option',
                'default'           => '',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_blog_single_style', array(
                'section' => 'antra_blog_single',
                'label'   => esc_html__('Template style', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    ''  => esc_html__('Style 1', 'antra'),
                    '2'  => esc_html__('Style 2', 'antra'),
                ),
            ));
        }

        /**
         * @param $wp_customize WP_Customize_Manager
         *
         * @return void
         */


        public function init_woocommerce($wp_customize) {

            $wp_customize->add_panel('woocommerce', array(
                'title' => esc_html__('Woocommerce', 'antra'),
            ));

            $wp_customize->add_section('antra_woocommerce_archive', array(
                'title'      => esc_html__('Archive', 'antra'),
                'capability' => 'edit_theme_options',
                'panel'      => 'woocommerce',
                'priority'   => 1,
            ));

            if (antra_is_elementor_activated()) {
                $wp_customize->add_setting('antra_options_shop_banner', array(
                    'type'              => 'option',
                    'default'           => '',
                    'sanitize_callback' => 'sanitize_text_field',
                ));

                $wp_customize->add_control('antra_options_shop_banner', array(
                    'section'     => 'antra_woocommerce_archive',
                    'label'       => esc_html__('Banner', 'antra'),
                    'type'        => 'select',
                    'description' => __('Banner will take templates name prefix is "Banner"', 'antra'),
                    'choices'     => $this->get_block('Banner')
                ));

                $wp_customize->add_setting('antra_options_shop_banner_position', array(
                    'type'              => 'option',
                    'default'           => 'top',
                    'sanitize_callback' => 'sanitize_text_field',
                ));

                $wp_customize->add_control('antra_options_shop_banner_position', array(
                    'section' => 'antra_woocommerce_archive',
                    'label'   => esc_html__('Banner Position', 'antra'),
                    'type'    => 'select',
                    'choices' => array(
                        'top'     => __('Top Page', 'antra'),
                        'content' => __('Before Products', 'antra'),
                    ),
                ));

            }

            $wp_customize->add_setting('antra_options_woocommerce_archive_layout', array(
                'type'              => 'option',
                'default'           => 'default',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_woocommerce_archive_layout', array(
                'section' => 'antra_woocommerce_archive',
                'label'   => esc_html__('Layout Style', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'default'  => esc_html__('Sidebar', 'antra'),
                    'canvas'   => esc_html__('Canvas Filter', 'antra'),
                    'dropdown' => esc_html__('Dropdown Filter', 'antra'),
                    'drawing'  => esc_html__('Drawing Filter', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_woocommerce_archive_sidebar', array(
                'type'              => 'option',
                'default'           => 'left',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_woocommerce_archive_sidebar', array(
                'section' => 'antra_woocommerce_archive',
                'label'   => esc_html__('Sidebar Position', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'left'  => esc_html__('Left', 'antra'),
                    'right' => esc_html__('Right', 'antra'),

                ),
            ));

            $wp_customize->add_setting('antra_options_woocommerce_shop_pagination', array(
                'type'              => 'option',
                'default'           => 'default',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_woocommerce_shop_pagination', array(
                'section' => 'antra_woocommerce_archive',
                'label'   => esc_html__('Products pagination', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'default'  => esc_html__('Pagination', 'antra'),
                    'more-btn' => esc_html__('Load More', 'antra'),
                    'infinit'  => esc_html__('Infinit Scroll', 'antra'),
                ),
            ));

            // =========================================
            // Single Product
            // =========================================

            $wp_customize->add_section('antra_woocommerce_single', array(
                'title'      => esc_html__('Singular', 'antra'),
                'capability' => 'edit_theme_options',
                'panel'      => 'woocommerce',
                'priority'   => 1,
            ));

            $wp_customize->add_setting('antra_options_wocommerce_single_sidebar', array(
                'type'              => 'option',
                'default'           => '',
                'transport'         => 'refresh',
                'sanitize_callback' => 'sanitize_text_field',
            ));
            
            $wp_customize->add_control('antra_options_wocommerce_single_sidebar', array(
                'section' => 'antra_woocommerce_single',
                'label'   => esc_html__('Single Sidebar', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    '' => esc_html__('Hidden', 'antra'),
                    'show' => esc_html__('Show Sidebar', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_single_product_gallery_layout', array(
                'type'              => 'option',
                'default'           => 'horizontal',
                'transport'         => 'refresh',
                'sanitize_callback' => 'sanitize_text_field',
            ));
            $wp_customize->add_control('antra_options_single_product_gallery_layout', array(
                'section' => 'antra_woocommerce_single',
                'label'   => esc_html__('Gallery Style', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'horizontal'     => esc_html__('Bottom Thumbnail', 'antra'),
                    'vertical'       => esc_html__('Left Thumbnail', 'antra'),
                    'right_vertical' => esc_html__('Right Thumbnail', 'antra'),
                    'without-thumb'  => esc_html__('Without Thumbnail', 'antra'),
                    'gallery'        => esc_html__('Gallery Thumbnail', 'antra'),
                    'sticky'         => esc_html__('Sticky Content', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_single_product_tab_layout', array(
                'type'              => 'option',
                'default'           => 'horizontal',
                'transport'         => 'refresh',
                'sanitize_callback' => 'sanitize_text_field',
            ));
            $wp_customize->add_control('antra_options_single_product_tab_layout', array(
                'section'     => 'antra_woocommerce_single',
                'label'       => esc_html__('Content In Tabs?', 'antra'),
                'description' => esc_html__('Show content in tabs or accordion .....?', 'antra'),
                'type'        => 'select',
                'choices'     => array(
                    'default'       => esc_html__('Default Tabs', 'antra'),
                    'vertical'      => esc_html__('Vertical Tabs', 'antra'),
                    'accordion'     => esc_html__('Accordion', 'antra'),
                    'expand'        => esc_html__('Expand all', 'antra'),
                ),
            ));

            $wp_customize->add_setting(
                'antra_options_single_security_logo',
                array(
                    /* translators: %s privacy policy page name and link */
                    'type'              => 'upload',
                    'sanitize_callback' => 'wp_kses_post',
                    'capability'        => 'edit_theme_options',
                    'transport'         => 'postMessage',
                )
            );

            $wp_customize->add_control(
                'antra_options_single_security_logo',
                array(

                    'label'    => esc_html__('Security logo', 'antra'),
                    'section'  => 'antra_woocommerce_single',
                    'settings' => 'antra_options_single_security_logo',
                    'context'    => '' ,
                    'priority'   => 30,
                )
            );

            $wp_customize->add_setting(
                'antra_options_single_product_content_meta',
                array(
                    /* translators: %s privacy policy page name and link */
                    'type'              => 'option',
                    'sanitize_callback' => 'wp_kses_post',
                    'capability'        => 'edit_theme_options',
                    'transport'         => 'postMessage',
                )
            );

            $wp_customize->add_control(new Antra_Customize_Control_Editor($wp_customize, 'antra_options_single_product_content_meta', array(
                'section' => 'antra_woocommerce_single',
                'label'   => esc_html__('Single extra description', 'antra'),
            )));
            
            $wp_customize->add_setting('antra_options_single_product_ask', array(
                'type'              => 'option',
                'default'           => '',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_single_product_ask', array(
                'section'     => 'antra_woocommerce_single',
                'label'       => esc_html__('Form asking question', 'antra'),
                'type'        => 'select',
                'choices'     => $this->get_cf7_forms()
            ));

            // =========================================
            // Product Item Reponsive
            // =========================================
            $wp_customize->add_setting('antra_options_wocommerce_row_laptop', array(
                'type'              => 'option',
                'default'           => 3,
                'transport'         => 'postMessage',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_wocommerce_row_laptop', array(
                'section' => 'woocommerce_product_catalog',
                'label'   => esc_html__('Products per row Laptop', 'antra'),
                'type'    => 'number',
            ));

            $wp_customize->add_setting('antra_options_wocommerce_row_tablet', array(
                'type'              => 'option',
                'default'           => 2,
                'transport'         => 'postMessage',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_wocommerce_row_tablet', array(
                'section' => 'woocommerce_product_catalog',
                'label'   => esc_html__('Products per row tablet', 'antra'),
                'type'    => 'number',
            ));

            $wp_customize->add_setting('antra_options_wocommerce_row_mobile', array(
                'type'              => 'option',
                'default'           => 1,
                'transport'         => 'postMessage',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_wocommerce_row_mobile', array(
                'section' => 'woocommerce_product_catalog',
                'label'   => esc_html__('Products per row mobile', 'antra'),
                'type'    => 'number',
            ));

            // =========================================
            // Product Item Reponsive List View
            // =========================================
            $wp_customize->add_setting('antra_options_wocommerce_column_list_view', array(
                'type'              => 'option',
                'default'           => 2,
                'transport'         => 'postMessage',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_wocommerce_column_list_view', array(
                'section' => 'woocommerce_product_catalog',
                'label'   => esc_html__('Products per row list view Laptop', 'antra'),
                'description' => esc_html__('The number of products in each row of the list view)', 'antra'),
                'type'    => 'number',
            ));

            // =========================================
            // Product
            // =========================================


            $wp_customize->add_section('antra_woocommerce_product', array(
                'title'      => esc_html__('Product Block', 'antra'),
                'capability' => 'edit_theme_options',
                'panel'      => 'woocommerce',
            ));
            $attribute_array      = [
                '' => esc_html__('None', 'antra')
            ];
            $attribute_taxonomies = wc_get_attribute_taxonomies();

            if (!empty($attribute_taxonomies)) {
                foreach ($attribute_taxonomies as $tax) {
                    if (taxonomy_exists(wc_attribute_taxonomy_name($tax->attribute_name))) {
                        $attribute_array[$tax->attribute_name] = $tax->attribute_label;
                    }
                }
            }

            $wp_customize->add_setting('antra_options_wocommerce_attribute', array(
                'type'              => 'option',
                'default'           => '',
                'transport'         => 'refresh',
                'sanitize_callback' => 'sanitize_text_field',
            ));
            $wp_customize->add_control('antra_options_wocommerce_attribute', array(
                'section' => 'antra_woocommerce_product',
                'label'   => esc_html__('Attributes Show', 'antra'),
                'type'    => 'select',
                'choices' => $attribute_array,
            ));

            $wp_customize->add_setting('antra_options_wocommerce_grid_list_layout', array(
                'type'              => 'option',
                'default'           => '',
                'transport'         => 'refresh',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_wocommerce_grid_list_layout', array(
                'section' => 'antra_woocommerce_product',
                'label'   => esc_html__('Grid - List Layout', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    ''     => esc_html__('Grid', 'antra'),
                    'list' => esc_html__('List', 'antra'),
                ),
            ));

            $wp_customize->add_setting('antra_options_woocommerce_product_hover', array(
                'type'              => 'option',
                'default'           => 'none',
                'transport'         => 'refresh',
                'sanitize_callback' => 'sanitize_text_field',
            ));
            $wp_customize->add_control('antra_options_woocommerce_product_hover', array(
                'section' => 'antra_woocommerce_product',
                'label'   => esc_html__('Animation Image Hover', 'antra'),
                'type'    => 'select',
                'choices' => array(
                    'none'          => esc_html__('None', 'antra'),
                    'bottom-to-top' => esc_html__('Bottom to Top', 'antra'),
                    'top-to-bottom' => esc_html__('Top to Bottom', 'antra'),
                    'right-to-left' => esc_html__('Right to Left', 'antra'),
                    'left-to-right' => esc_html__('Left to Right', 'antra'),
                    'swap'          => esc_html__('Swap', 'antra'),
                    'fade'          => esc_html__('Fade', 'antra'),
                    'zoom-in'       => esc_html__('Zoom In', 'antra'),
                    'zoom-out'      => esc_html__('Zoom Out', 'antra'),
                ),
            ));
        }

        /**
         * @param $wp_customize WP_Customize_Manager
         *
         * @return void
         */
        public function init_antra_service($wp_customize) {

            $wp_customize->add_panel('antra_service', array(
                'title' => esc_html__('Service', 'antra'),
            ));
            
            $wp_customize->add_section('antra_service_settings', array(
                'title'      => esc_html__('Settings', 'antra'),
                'panel'      => 'antra_service',
                'capability' => 'edit_theme_options',
            ));

            $wp_customize->add_setting(
                'antra_options_service_slug',
                array(
                    'default'    => antra_get_theme_option('service_slug', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_title'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_service_slug',
                array(
                    'label'   => __( 'Service Slug', 'antra' ),
                    'section' => 'antra_service_settings',
                    /* translators: %s: Admin Url */
                    'description' => sprintf(__('After change the slug, If error 404 appears, please update <a target="_blank" href="%s">the permalinks</a> in the Settings page', 'antra'), esc_url(admin_url('options-permalink.php'))),
                )
            );
            
            $wp_customize->add_setting(
                'antra_options_service_label',
                array(
                    'default'    => antra_get_theme_option('service_label', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_text_field'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_service_label',
                array(
                    'label'   => __( 'Service Label', 'antra' ),
                    'section' => 'antra_service_settings',
                )
            );
        }
        
        /**
         * @param $wp_customize WP_Customize_Manager
         *
         * @return void
         */
        public function init_antra_project($wp_customize) {

            $wp_customize->add_panel('antra_project', array(
                'title' => esc_html__('Project', 'antra'),
            ));

            $wp_customize->add_section('antra_project_settings', array(
                'title'      => esc_html__('Settings', 'antra'),
                'panel'      => 'antra_project',
                'capability' => 'edit_theme_options',
            ));

            $wp_customize->add_setting(
                'antra_options_project_slug',
                array(
                    'default'    => antra_get_theme_option('project_slug', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_title'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_project_slug',
                array(
                    'label'   => __( 'Project Slug', 'antra' ),
                    'section' => 'antra_project_settings',
                    /* translators: %s: Admin Url */
                    'description' => sprintf(__('After change the slug, If error 404 appears, please update <a target="_blank" href="%s">the permalinks</a> in the Settings page', 'antra'), esc_url(admin_url('options-permalink.php'))),
                )
            );
            
            $wp_customize->add_setting(
                'antra_options_project_label',
                array(
                    'default'    => antra_get_theme_option('project_label', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_text_field'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_project_label',
                array(
                    'label'   => __( 'Project Label', 'antra' ),
                    'section' => 'antra_project_settings',
                )
            );

            $wp_customize->add_setting(
                'antra_options_project_category_slug',
                array(
                    'default'    => antra_get_theme_option('project_category_slug', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_title'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_project_category_slug',
                array(
                    'label'   => __( 'Project Category Slug', 'antra' ),
                    'section' => 'antra_project_settings',
                    /* translators: %s: Admin Url */
                    'description' => sprintf(__('After change the slug, If error 404 appears, please update <a target="_blank" href="%s">the permalinks</a> in the Settings page', 'antra'), esc_url(admin_url('options-permalink.php'))),
                )
            );
            
            $wp_customize->add_setting(
                'antra_options_project_category_label',
                array(
                    'default'    => antra_get_theme_option('project_category_label', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_text_field'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_project_category_label',
                array(
                    'label'   => __( 'Project Categoty Label', 'antra' ),
                    'section' => 'antra_project_settings',
                )
            );

            $wp_customize->add_setting(
                'antra_options_project_category_single_label',
                array(
                    'default'    => antra_get_theme_option('project_category_single_label', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_text_field'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_project_category_single_label',
                array(
                    'label'   => __( 'Project Categoty Single Label', 'antra' ),
                    'section' => 'antra_project_settings',
                )
            );

            if (antra_is_elementor_activated()) {
                $wp_customize->add_section('antra_project_single', array(
                    'title'      => esc_html__('Single Project', 'antra'),
                    'panel'      => 'antra_project',
                    'capability' => 'edit_theme_options',
                ));

                $wp_customize->add_setting('antra_options_project_template', array(
                    'type'              => 'option',
                    'default'           => '',
                    'sanitize_callback' => 'sanitize_text_field',
                ));

                $wp_customize->add_control('antra_options_project_template', array(
                    'section'     => 'antra_project_single',
                    'label'       => esc_html__('Choose Template', 'antra'),
                    'type'        => 'select',
                    'description' => __('Block will take templates name prefix is "Project"', 'antra'),
                    'choices'     => $this->get_block('Project'),
                ));
            }
            
        }

        /**
         * @param $wp_customize WP_Customize_Manager
         *
         * @return void
         */
        public function init_antra_team($wp_customize) {

            $wp_customize->add_panel('antra_team', array(
                'title' => esc_html__('Team', 'antra'),
            ));
            
            $wp_customize->add_section('antra_team_settings', array(
                'title'      => esc_html__('Settings', 'antra'),
                'panel'      => 'antra_team',
                'capability' => 'edit_theme_options',
            ));

            $wp_customize->add_setting(
                'antra_options_team_slug',
                array(
                    'default'    => antra_get_theme_option('team_slug', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_title'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_team_slug',
                array(
                    'label'   => __( 'Team Slug', 'antra' ),
                    'section' => 'antra_team_settings',
                    /* translators: %s: Admin Url */
                    'description' => sprintf(__('After change the slug, If error 404 appears, please update <a target="_blank" href="%s">the permalinks</a> in the Settings page', 'antra'), esc_url(admin_url('options-permalink.php'))),
                )
            );
            
            $wp_customize->add_setting(
                'antra_options_team_label',
                array(
                    'default'    => antra_get_theme_option('team_label', ''),
                    'type'       => 'option',
                    'sanitize_callback' => 'sanitize_text_field'
                    // 'capability' => 'manage_options',
                )
            );
    
            $wp_customize->add_control(
                'antra_options_team_label',
                array(
                    'label'   => __( 'Team Label', 'antra' ),
                    'section' => 'antra_team_settings',
                )
            );

            $wp_customize->add_section('antra_team_single_page', array(
                'title'      => esc_html__('Single Page', 'antra'),
                'panel'      => 'antra_team',
                'capability' => 'edit_theme_options',
            ));

            $wp_customize->add_setting('antra_options_team_form', array(
                'type'              => 'option',
                'default'           => '',
                'sanitize_callback' => 'sanitize_text_field',
            ));

            $wp_customize->add_control('antra_options_team_form', array(
                'section'     => 'antra_team_single_page',
                'label'       => esc_html__('Form Contact Team', 'antra'),
                'type'        => 'select',
                'choices'     => $this->get_cf7_forms()
            ));
        }
    }
}
return new Antra_Customize();
