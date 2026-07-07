<?php

if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

use Elementor\Controls_Manager;
use Elementor\Controls_Stack;
use Elementor\Element_Base;
use Elementor\Core\Files\CSS;

class Antra_Elementor_Custom_Css {
    public function __construct() {
        add_action( 'elementor/init', [ $this, 'on_elementor_init' ] );
    }

    public function on_elementor_init(){
        add_action( 'elementor/element/after_section_end', [ $this, 'register_controls' ], 10, 2 );
        add_action( 'elementor/element/parse_css', [ $this, 'add_post_css' ], 10, 2 );
        add_action( 'elementor/css-file/post/parse', [ $this, 'add_page_settings_css' ] );
        add_action( 'elementor/editor/before_enqueue_scripts', [ $this, 'add_scripts_editor' ] );

        add_action('elementor/element/container/section_layout_container/before_section_end', function ($container) {
            $container->add_responsive_control(
                'antra_container_fix_height',
                [
                    'label' => esc_html__( 'Height', 'antra' ),
                    'type' => Controls_Manager::SLIDER,
                    'size_units' => [ 'px', 'em', 'rem', 'vh', 'custom' ],
                    'range' => [
                        'px' => [
                            'max' => 1440,
                        ],
                    ],
                    'description' => esc_html__( 'Fix height for Container', 'antra' ),
                    'selectors' => [
                        '{{WRAPPER}}' => '--height: {{SIZE}}{{UNIT}};',
                    ],
                ]
            );
        });
    }

    public function add_scripts_editor() {
        global $antra_version;
        wp_enqueue_script( 'antra-elementor-custom-css', get_theme_file_uri( '/assets/js/elementor-custom-css.js' ), [], $antra_version, true );
    }

    /**
     * @param $post_css CSS\Post
     * @param $element Element_Base
     */
    public function add_post_css( $post_css, $element ) {
        $element_settings = $element->get_settings();

        if ( !$element_settings['custom_css'] || empty( $element_settings['custom_css'] ) ) {
            return;
        }

        $css = trim( $element_settings['custom_css'] );

        if ( empty( $css ) ) {
            return;
        }
        $css = str_replace( 'selector', $post_css->get_element_unique_selector( $element ), $css );

        // Add a css comment
        $css = sprintf( '/* Start custom CSS for %s, class: %s */', $element->get_name(), $element->get_unique_selector() ) . $css . '/* End custom CSS */';

        $post_css->get_stylesheet()->add_raw_css( $css );
    }

    /**
     * @param $element Controls_Stack
     * @param $section_id string
     */
    public function register_controls( Controls_Stack $element, $section_id ) {
        // Remove Custom CSS Banner (From free version)
        if ( 'section_custom_css_pro' !== $section_id ) {
            return;
        }

        $old_section = \Elementor\Plugin::instance()->controls_manager->get_control_from_stack( $element->get_unique_name(), 'section_custom_css_pro' );
        $controls_to_remove = [ 'section_custom_css_pro', 'custom_css_pro' ];

        \Elementor\Plugin::instance()->controls_manager->remove_control_from_stack( $element->get_unique_name(), $controls_to_remove );

        $element->start_controls_section(
            'section_custom_css',
            [
                'label' => esc_html__( 'Custom CSS', 'antra' ),
                'tab' => $old_section['tab'],
            ]
        );

        $element->add_control(
            'custom_css_title',
            [
                'raw' => esc_html__( 'Add your own custom CSS here', 'antra' ),
                'type' => Controls_Manager::RAW_HTML,
            ]
        );

        $element->add_control(
            'custom_css',
            [
                'type' => Controls_Manager::CODE,
                'label' => esc_html__( 'Custom CSS', 'antra' ),
                'language' => 'css',
                'render_type' => 'ui',
                'show_label' => false,
                'separator' => 'none',
            ]
        );

        $element->add_control(
            'custom_css_description',
            [
                'raw' => wp_kses_post(__( 'Use "selector" to target wrapper element. Examples:<br>selector {color: red;} // For main element<br>selector .child-element {margin: 10px;} // For child element<br>.my-class {text-align: center;} // Or use any custom selector', 'antra' )),
                'type' => Controls_Manager::RAW_HTML,
                'content_classes' => 'elementor-descriptor',
            ]
        );

        $element->end_controls_section();
    }

    /**
     * @param $post_css CSS\Post
     */
    public function add_page_settings_css( $post_css ) {
        $document = \Elementor\Plugin::instance()->documents->get( $post_css->get_post_id() );
        $custom_css = $document->get_settings( 'custom_css' );

        if ( empty( $custom_css ) ) {
            return;
        }
        
        $custom_css = trim( $custom_css );


        $custom_css = str_replace( 'selector', 'body.elementor-page-' . $post_css->get_post_id(), $custom_css );

        // Add a css comment
        $custom_css = '/* Start custom CSS for page-settings */' . $custom_css . '/* End custom CSS */';

        $post_css->get_stylesheet()->add_raw_css( $custom_css );
    }

    /**
     * @param $element Element_Base
     */
    public function remove_go_pro_custom_css( $element ) {
        $controls_to_remove = [ 'section_custom_css_pro', 'custom_css_pro' ];

        \Elementor\Plugin::instance()->controls_manager->remove_control_from_stack( $element->get_unique_name(), $controls_to_remove );
    }
}

return new Antra_Elementor_Custom_Css();
