<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

use Elementor\Controls_Manager;

class Antra_Elementor_Info_Canvas extends Elementor\Widget_Base {

    public function get_name() {
        return 'antra-info-canvas';
    }

    public function get_title() {
        return esc_html__('Antra Info Canvas', 'antra');
    }

    public function get_icon() {
        return 'eicon-nav-menu';
    }

    public function get_categories() {
        return ['antra-addons'];
    }

    public function get_info() {
        global $post;

        $options[''] = esc_html__('Select Info', 'antra');
        if (!antra_is_elementor_activated()) {
            return;
        }
        $args = array(
            'post_type'      => 'elementor_library',
            'posts_per_page' => -1,
            'orderby'        => 'title',
            's'              => 'Info',
            'order'          => 'ASC',
        );

        $query1 = new WP_Query($args);
        while ($query1->have_posts()) {
            $query1->the_post();
            $options[$post->post_name] = $post->post_title;
        }

        wp_reset_postdata();
        return $options;
    }

    protected function register_controls() {
        $this->start_controls_section(
            'info_sesion_content',
            [
                'label' => esc_html__('Content', 'antra'),
            ]
        );

        $this->add_control(
            'info',
            [
                'label'   => esc_html__('Info Page', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'options' => $this->get_info(),
            ]
        );

        $this->add_responsive_control(
            'align',
            [
                'label'   => esc_html__('Alignment', 'antra'),
                'type'    => Controls_Manager::CHOOSE,
                'options' => [
                    'left'  => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'right' => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                ],
                'default' => 'left',
            ]
        );

        $this->add_control(
            'button_style_theme',
            [
                'label'        => esc_html__('Style', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'options'      => [
                    '1'  => esc_html__('Style 1', 'antra'),
                    '2'     => esc_html__('Style 2', 'antra'),
                ],
                'default'      => '1',
                'prefix_class' => 'icon-canvas-',
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'icon_info_style',
            [
                'label' => esc_html__('Icon', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->start_controls_tabs('color_tabs');

        $this->start_controls_tab('colors_normal',
            [
                'label' => esc_html__('Normal', 'antra'),
            ]
        );

        $this->add_control(
            'info_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-canvas-info-wrapper .antra-info-button:before' => 'color: {{VALUE}};',
                ],
            ]
        );


        $this->add_control(
            'info_bg_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-canvas-info-wrapper .antra-info-button' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'info_border_color',
            [
                'label'     => esc_html__('Border Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-canvas-info-wrapper .antra-info-button' => 'border-color: {{VALUE}};',
                ],
            ]
        );


        $this->end_controls_tab();

        $this->start_controls_tab(
            'colors_hover',
            [
                'label' => esc_html__('Hover', 'antra'),
            ]
        );

        $this->add_control(
            '_menu_color_hover',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-canvas-info-wrapper .antra-info-button:hover:before' => 'color: {{VALUE}};',
                ],
            ]
        );


        $this->add_control(
            '_menu_bg_color_hover',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-canvas-info-wrapper .antra-info-button:hover' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            '_menu_border_color_hover',
            [
                'label'     => esc_html__('Border Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-canvas-info-wrapper .antra-info-button:hover' => 'border-color: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_tab();

        $this->end_controls_tabs();

        $this->end_controls_section();

        $this->start_controls_section(
            'popup_info_style',
            [
                'label' => esc_html__('Popup Info', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'popup_width',
            [
                'label'          => esc_html__('Width', 'antra'),
                'type'           => Controls_Manager::SLIDER,
                'default'        => [
                    'unit' => 'px',
                ],
                'tablet_default' => [
                    'unit' => '%',
                ],
                'mobile_default' => [
                    'unit' => '%',
                ],
                'size_units'     => ['%', 'px', 'vw'],
                'range'          => [
                    '%'  => [
                        'min' => 1,
                        'max' => 100,
                    ],
                    'px' => [
                        'min' => 1,
                        'max' => 1000,
                    ],
                    'vw' => [
                        'min' => 1,
                        'max' => 100,
                    ],
                ],
                'selectors'      => [
                    'body .antra-canvas-info' => '--e-global-info-width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'icon_close_color',
            [
                'label'     => esc_html__('Icon close', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    'body .antra-canvas-info .antra-canvas-info-close' => 'color: {{VALUE}};',
                ],
            ]
        );


        $this->add_control(
            'icon_close_color_hover',
            [
                'label'     => esc_html__('Icon close hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    'body .antra-canvas-info .antra-canvas-info-close:hover' => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'popup_bg_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    'body .antra-canvas-info' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'size_icon',
            [
                'label'      => esc_html__('Size Icon', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'size_units' => ['px'],
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-canvas-info-wrapper .antra-info-button:before' => 'font-size: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

    }

    public function render_info() {
        $settings     = $this->get_settings_for_display();
        $slug         = $settings['info'];
        $queried_post = get_page_by_path($slug, OBJECT, 'elementor_library');
        ?>
        <div class="antra-canvas-info antra-canvas-info-<?php echo esc_attr($settings['align']) ?>">
            <a href="#" class="antra-canvas-info-close"><i class="antra-icon-plus2"></i></a>
            <?php if (isset($queried_post->ID)) {
                echo Elementor\Plugin::instance()->frontend->get_builder_content($queried_post->ID);
            } else {
                echo '<p>' . esc_html__('No Content', 'antra') . '</p>';
            }
            ?>
        </div>

        <div class="antra-info-overlay"></div>
        <?php
    }

    protected function render() {
        $settings = $this->get_settings_for_display();
        $slug     = $settings['info'];
        add_action('wp_footer', array($this, 'render_info'));

        $this->add_render_attribute('wrapper', 'class', 'elementor-canvas-info-wrapper');

        ?>
        <div <?php $this->print_render_attribute_string('wrapper'); ?>>
            <a href="#" class="antra-info-button">
                <div class="antra-icon">
                    <span class="icon-1"></span>
                    <span class="icon-2"></span>
                    <span class="icon-3"></span>
                </div>
            </a>
        </div>
        <?php
    }
}

$widgets_manager->register(new Antra_Elementor_Info_Canvas());
