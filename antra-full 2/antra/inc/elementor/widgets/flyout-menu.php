<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

use Elementor\Controls_Manager;
use Elementor\Utils;
use Elementor\Group_Control_Typography;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;
use Elementor\Group_Control_Border;
use Elementor\Group_Control_Box_Shadow;
use Elementor\Group_Control_Background;
use Elementor\Widget_Base;
use Elementor\Plugin;

class Antra_Elementor_Flyout_Group extends Elementor\Widget_Base {

    public function get_name() {
        return 'antra-flyout-group';
    }

    public function get_title() {
        return esc_html__('Antra Flyout Group', 'antra');
    }

    public function get_icon() {
        return 'eicon-mega-menu';
    }

    public function get_categories() {
        return array('antra-addons');
    }

    public function get_script_depends() {
        return ['antra-elementor-flyout-menu'];
    }

    private function get_template_flyout() {
        global $post;

        $options[''] = esc_html__('Select Template', 'antra');
        if (!antra_is_elementor_activated()) {
            return;
        }
        $args = array(
            'post_type'      => 'elementor_library',
            'posts_per_page' => -1,
            'orderby'        => 'title',
            's'              => 'flyout',
            'order'          => 'ASC',
        );

        $query1 = new WP_Query($args);
        while ($query1->have_posts()) {
            $query1->the_post();
            $options[$post->ID] = $post->post_title;
        }

        wp_reset_postdata();
        return $options;
    }

    protected function register_controls() {

        $this->start_controls_section(
            'flyout_group_config',
            [
                'label' => esc_html__('Content', 'antra'),
            ]
        );

        $this->add_control(
            'flyout_template',
            [
                'label'   => esc_html__('Flyout Template', 'antra'),
                'description' => __('Please create a template with the prefix "Flyout"', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'options' => $this->get_template_flyout(),
            ]
        );

        $this->add_control(
            'flyout_layout',
            [
                'label'     => __( 'Flyout Orientation', 'antra' ),
                'type'      => Controls_Manager::SELECT,
                'default'   => 'left',
                'options'   => [
                    'left'  => __( 'Left', 'antra' ),
                    'right' => __( 'Right', 'antra' ),
                ],
                'prefix_class' => 'antra-flyout-orientation-',
            ]
        );

        $this->add_control(
            'icon_style',
            [
                'label'     => __( 'Icon Style', 'antra' ),
                'type'      => Controls_Manager::SELECT,
                'default'   => 'selector',
                'options'   => [
                    'selector'  => __( 'Icon Selector', 'antra' ),
                    'dynamic' => __( 'Dynamic Icon', 'antra' ),
                ],
                'prefix_class' => 'antra-flyout-icon-',
                'render_type' => 'template'
            ]
        );

        $this->add_control(
            'open_icon',
            [
                'label'       => __( 'Open Icon', 'antra' ),
                'type'        => Controls_Manager::ICONS,
                'label_block' => 'true',
                'default'     => [
                    'value'   => 'fas fa-align-justify',
                    'library' => 'fa-solid',
                ],
                'condition' => [
                    'icon_style' => 'selector'
                ]
            ]
        );

        $this->add_control(
            'close_icon',
            [
                'label'       => __( 'Close Icon', 'antra' ),
                'type'        => Controls_Manager::ICONS,
                'label_block' => 'true',
                'default'     => [
                    'value'   => 'far fa-window-close',
                    'library' => 'fa-regular',
                ],
                'condition' => [
                    'icon_style' => 'selector'
                ]
            ]
        );

        $this->end_controls_section();

		$this->start_controls_section(
			'style_action',
			[
				'label'     => __( 'Action', 'antra' ),
				'tab'       => Controls_Manager::TAB_STYLE,
			]
		);

        $this->add_control(
            'padding_action',
            [
                'label'      => __( 'Padding', 'antra' ),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => [ 'px', '%' ],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-header-flyout-action .icon' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
			'toggle_size',
			[
				'label'              => __( 'Icon Size', 'antra' ),
				'type'               => Controls_Manager::SLIDER,
				'range'              => [
					'px' => [
						'min' => 15,
					],
				],
				'selectors'          => [
					'{{WRAPPER}} .elementor-header-flyout-action .icon'     => 'font-size: {{SIZE}}{{UNIT}};',
					'{{WRAPPER}} .elementor-header-flyout-action .icon svg' => 'font-size: {{SIZE}}px;line-height: {{SIZE}}px;height: {{SIZE}}px;width: {{SIZE}}px;',
					'{{WRAPPER}} .elementor-flyout-dynamic-icon .icon .dynamic-icon-inner' => 'width: {{SIZE}}{{UNIT}};',
				],
			]
		);

        $this->start_controls_tabs( '_button_style' );

            $this->start_controls_tab(
                '_button_normal',
                [
                    'label' => __( 'Open', 'antra' ),
                ]
            );

                $this->add_control(
                    'all_text_color',
                    [
                        'label'     => __( 'Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'default'   => '',
                        'selectors' => [
                            '{{WRAPPER}} .elementor-header-flyout-action .icon' => 'color: {{VALUE}};',
                            '{{WRAPPER}} .elementor-flyout-dynamic-icon .icon .dynamic-icon-inner > span' => 'background-color: {{VALUE}};',
                        ],
                    ]
                );

                $this->add_control(
                    'all_background_color',
                    [
                        'label'     => __( 'Background Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'default'   => '',
                        'selectors' => [
                            '{{WRAPPER}} .elementor-header-flyout-action .icon' => 'background-color: {{VALUE}};',
                        ],
                    ]
                );

                $this->add_group_control(
                    Group_Control_Border::get_type(),
                    [
                        'name'     => 'all_border',
                        'label'    => __( 'Border', 'antra' ),
                        'selector' => '{{WRAPPER}} .elementor-header-flyout-action .icon',
                    ]
                );

                $this->add_control(
                    'all_border_radius',
                    [
                        'label'      => __( 'Border Radius', 'antra' ),
                        'type'       => Controls_Manager::DIMENSIONS,
                        'size_units' => [ 'px', '%' ],
                        'selectors'  => [
                            '{{WRAPPER}} .elementor-header-flyout-action .icon' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                        ],
                    ]
                );

                $this->add_group_control(
                    Group_Control_Box_Shadow::get_type(),
                    [
                        'name'     => 'all_button_box_shadow',
                        'selector' => '{{WRAPPER}} .elementor-header-flyout-action .icon',
                    ]
                );

            $this->end_controls_tab();

            $this->start_controls_tab(
                'icon_button_hover',
                [
                    'label' => __( 'Hover', 'antra' ),
                ]
            );

                $this->add_control(
                    'icon_hover_color',
                    [
                        'label'     => __( 'Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'selectors' => [
                            '{{WRAPPER}} .elementor-header-flyout-action .icon:hover' => 'color: {{VALUE}};',
                            '{{WRAPPER}} .elementor-flyout-dynamic-icon .icon:hover .dynamic-icon-inner > span' => 'background-color: {{VALUE}};',
                        ],
                    ]
                );

                $this->add_control(
                    'icon_background_hover_color',
                    [
                        'label'     => __( 'Background Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'default'   => '',
                        'selectors' => [
                            '{{WRAPPER}} .elementor-header-flyout-action .icon:hover' => 'background-color: {{VALUE}};',
                        ],
                    ]
                );


                $this->add_control(
                    'icon_border_hover_color',
                    [
                        'label'     => __( 'Border Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'default'   => '',
                        'selectors' => [
                            '{{WRAPPER}} .elementor-header-flyout-action .icon:hover' => 'background-color: {{VALUE}};',
                        ],
                    ]
                );

                $this->add_group_control(
                    Group_Control_Box_Shadow::get_type(),
                    [
                        'name'      => 'icon_button_hover_box_shadow',
                        'selector'  => '{{WRAPPER}} .elementor-header-flyout-action .icon:hover',
                        'separator' => 'after',
                    ]
                );

            $this->end_controls_tab();

            $this->start_controls_tab(
                'all_button_hover',
                [
                    'label' => __( 'Close', 'antra' ),
                ]
            );

                $this->add_control(
                    'all_hover_color',
                    [
                        'label'     => __( 'Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'selectors' => [
                            '{{WRAPPER}} .elementor-header-flyout-action .elementor-flyout-close-icon .icon' => 'color: {{VALUE}};',
                            '{{WRAPPER}} .flyout-action-close .elementor-flyout-dynamic-icon .icon .dynamic-icon-inner > span' => 'background-color: {{VALUE}};',
                        ],
                    ]
                );

                $this->add_control(
                    'all_background_hover_color',
                    [
                        'label'     => __( 'Background Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'default'   => '',
                        'selectors' => [
                            '{{WRAPPER}} .flyout-action-close.elementor-header-flyout-action .icon' => 'background-color: {{VALUE}};',
                        ],
                    ]
                );


                $this->add_control(
                    'all_border_hover_color',
                    [
                        'label'     => __( 'Border Color', 'antra' ),
                        'type'      => Controls_Manager::COLOR,
                        'default'   => '',
                        'selectors' => [
                            '{{WRAPPER}} .flyout-action-close.elementor-header-flyout-action .icon' => 'border-color: {{VALUE}};',
                        ],
                    ]
                );

                $this->add_group_control(
                    Group_Control_Box_Shadow::get_type(),
                    [
                        'name'      => 'all_button_hover_box_shadow',
                        'selector'  => '{{WRAPPER}} .flyout-action-close.elementor-header-flyout-action .icon',
                        'separator' => 'after',
                    ]
                );

            $this->end_controls_tab();

        $this->end_controls_tabs();

        $this->end_controls_section();

		$this->start_controls_section(
			'style_content',
			[
				'label'     => __( 'Content', 'antra' ),
				'tab'       => Controls_Manager::TAB_STYLE,
			]
		);

        $this->add_responsive_control(
            'flyout_content_spacing',
            [
                'label'     => esc_html__('Flyout Spacing', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'selectors' => [
                    '{{WRAPPER}} .elementor-antra-flyout-content'  => '--wp-admin--admin-bar--height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'content_bg_color',
            [
                'label'     => __( 'Background Color', 'antra' ),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-antra-flyout-content' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
			'content_toggle_duration',
			[
				'label' => esc_html__( 'Transition Duration', 'antra' ) . ' (s)',
				'type' => Controls_Manager::SLIDER,
				'range' => [
					'px' => [
						'max' => 3,
						'step' => 0.1,
					],
				],
				'selectors' => [
					'{{WRAPPER}} .elementor-antra-flyout-content' => 'transition-duration: {{SIZE}}s',
				],
			]
		);

        $this->end_controls_section();
    }

    public function render_template_flyout() {
        $settings = $this->get_settings_for_display();

        if (!empty($settings['flyout_template'])) {
            ?>
            <div class="elementor-antra-flyout-content">
                <?php
                echo Elementor\Plugin::instance()->frontend->get_builder_content_for_display($settings['flyout_template']);
                $css_file = Elementor\Core\Files\CSS\Post::create( $settings['flyout_template']);
                $css_file->enqueue();
                ?>
            </div>
            <?php
        }
    }

    protected function render() {
        $settings = $this->get_settings_for_display();
        $this->add_render_attribute('wrapper', 'class', 'elementor-flyout-group-wrapper');

        $icon_style = !empty($settings['icon_style']) ? $settings['icon_style'] : 'selector';
        ?>
        <div <?php $this->print_render_attribute_string('wrapper'); ?>>
            <div class="elementor-header-flyout-action">
                <?php 
                if ($icon_style == 'dynamic') {
                    ?>
                    <div class="elementor-flyout-dynamic-icon">
                        <a href="javascript:void(0)" class="icon">
                            <span class="dynamic-icon-inner">
                                <span class="dynamic-icon-top"></span>
                                <span class="dynamic-icon-down"></span>
                                 <span class="dynamic-icon-bottom"></span>
                            </span>
                        </a>
                    </div>
                    <?php
                } else {
                    ?>
                    <div class="elementor-flyout-open-icon">
                        <?php
                        if (!empty($settings['open_icon'])) { ?>
                            <a href="javascript:void(0)" class="icon">
                                <?php \Elementor\Icons_Manager::render_icon($settings['open_icon'], ['aria-hidden' => 'true']); ?>
                            </a>
                        <?php }
                        ?>
                    </div>
                    <div class="elementor-flyout-close-icon">
                        <?php
                        if (!empty($settings['close_icon'])) { ?>
                            <a href="javascript:void(0)" class="icon">
                                <?php \Elementor\Icons_Manager::render_icon($settings['close_icon'], ['aria-hidden' => 'true']); ?>
                            </a>
                        <?php }
                        ?>
                    </div>
                    <?php
                }
                ?>
            </div>
            <?php $this->render_template_flyout(); ?>
        </div>
        <?php
    }
}

$widgets_manager->register(new Antra_Elementor_Flyout_Group());
