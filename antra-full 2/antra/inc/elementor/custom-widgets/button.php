<?php
// Button
use Elementor\Controls_Manager;
use Elementor\Group_Control_Background;
use Elementor\Includes\Widgets\Traits\Button_Trait;
use Elementor\Plugin;

add_action('elementor/element/button/section_button/before_section_end', function ($element, $args) {
    $element->update_control(
        'size',
        [
            'label' => esc_html__( 'Size', 'antra' ),
            'type' => Controls_Manager::SELECT,
            'default' => 'md',
            'options' => (new class { use Button_Trait; })::get_button_sizes(),
            'style_transfer' => true,
            'condition' => false
        ]
    );

    $element->update_control(
        'selected_icon',
        [
            'label' => esc_html__( 'Icon', 'antra' ),
            'type' => Controls_Manager::ICONS,
            'fa4compatibility' => 'icon',
            'skin' => 'inline',
            'label_block' => false,
            'condition' => false,
            'icon_exclude_inline_options' => [],
            'default' => [
                'value' => 'fas fa-arrow-right',
                'library' => 'fa-solid',
            ],
        ]
    );

}, 10, 2);


add_action('elementor/element/button/section_button/after_section_end', function ($element, $args) {
    $element->update_control(
        'button_type',
        [
            'label'        => esc_html__('Type', 'antra'),
            'type'         => Controls_Manager::SELECT,
            'default'      => 'default',
            'options'      => [
                'default'  => esc_html__('Default', 'antra'),
                'secondary'=> esc_html__('Secondary', 'antra'),
                'outline'  => esc_html__('OutLine', 'antra'),
                'info'     => esc_html__('Info', 'antra'),
                'success'  => esc_html__('Success', 'antra'),
                'warning'  => esc_html__('Warning', 'antra'),
                'danger'   => esc_html__('Danger', 'antra'),
                'link'     => esc_html__('Link', 'antra'),
            ],
            'prefix_class' => 'elementor-button-',
        ]
    );

}, 10, 2);

add_action( 'elementor/element/button/section_style/after_section_end', function ($element, $args ) {

    $element->update_control(
        'background_color',
        [
            'global' => [
                'default' => '',
            ],
            'selectors' => [
                '{{WRAPPER}} .elementor-button' => ' background-color: {{VALUE}};',
            ],
        ]
    );

    antra_update_selector_group_control($element, 'typography', [
        '{{WRAPPER}} .elementor-button.antra-button-effect .hover-text',
        '{{WRAPPER}} .elementor-button:not(.antra-button-effect)'
    ]);

}, 10, 2 );

add_action('elementor/element/button/section_style/before_section_end', function ($element, $args) {

    $element->add_control(
        'icon_button_size',
        [
            'label' => esc_html__('Icon Size', 'antra'),
            'type' => Controls_Manager::SLIDER,
            'range' => [
                'px' => [
                    'min' => 6,
                    'max' => 300,
                ],
            ],
            'selectors' => [
                '{{WRAPPER}} .elementor-button .elementor-button-icon i' => 'font-size: {{SIZE}}{{UNIT}};',
                '{{WRAPPER}} .elementor-button .elementor-button-icon'   => 'display: flex; align-items: center;',
            ],
            'condition' => [
                'selected_icon[value]!' => '',
            ],
        ]
    );

    $element->add_control(
        'button_icon_color',
        [
            'label'     => esc_html__('Icon Color', 'antra'),
            'type'      => Controls_Manager::COLOR,
            'default'   => '',
            'selectors' => [
                '{{WRAPPER}} .elementor-button .elementor-button-icon i' => 'fill: {{VALUE}}; color: {{VALUE}};',
                '{{WRAPPER}}.elementor-button-link .elementor-button:after' => 'color: {{VALUE}};',
                '{{WRAPPER}}.elementor-button-link .elementor-button:hover:before' => 'background-color: {{VALUE}};',
            ],

        ]
    );

    $element->add_control(
        'button_icon_color_hover',
        [
            'label'     => esc_html__('Icon Color Hover', 'antra'),
            'type'      => Controls_Manager::COLOR,
            'default'   => '',
            'selectors' => [
                '{{WRAPPER}} .elementor-button:hover .elementor-button-icon i' => 'fill: {{VALUE}}; color: {{VALUE}};',
                '{{WRAPPER}}.elementor-button-link .elementor-button:hover:after' => 'color: {{VALUE}};',
                '{{WRAPPER}}.elementor-button-link .elementor-button:hover:before' => 'background-color: {{VALUE}};',
            ],

        ]
    );

    $element->add_control(
        'button_icon_background_color',
        [
            'label'     => esc_html__('Icon Background Color', 'antra'),
            'type'      => Controls_Manager::COLOR,
            'default'   => '',
            'selectors' => [
                '{{WRAPPER}} .elementor-button .elementor-button-icon i' => 'fill: {{VALUE}}; background-color: {{VALUE}};',
            ],

        ]
    );

    $element->add_control(
        'button_icon_padding',
        [
            'label'     => esc_html__('Padding', 'antra'),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', '%', 'em',],
            'selectors' => [
                '{{WRAPPER}} .elementor-button .elementor-button-icon i' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],

        ]
    );

    $element->add_control(
        'button_icon_margin',
        [
            'label'     => esc_html__('Margin', 'antra'),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', '%', 'em',],
            'selectors' => [
                '{{WRAPPER}} .elementor-button .elementor-button-icon i' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],

        ]
    );

    $element->add_control(
        'icon_button_rotate',
        [
            'label' => esc_html__('Icon Rotate', 'antra'),
            'type' => Controls_Manager::SLIDER,
            'range' => [
                'px' => [
                    'min' => 0,
                    'max' => 360,
                ],
            ],
            'separator'    => 'before',
            'selectors' => [
                '{{WRAPPER}} .elementor-button .elementor-button-icon i' => 'transform: rotate({{SIZE}}deg);',
            ],
            'condition' => [
                'selected_icon[value]!' => '',
            ],
        ]
    );

    $element->add_control(
        'icon_button_rotate_hover',
        [
            'label' => esc_html__('Icon Rotate Hover', 'antra'),
            'type' => Controls_Manager::SLIDER,
            'range' => [
                'px' => [
                    'min' => 0,
                    'max' => 360,
                ],
            ],
            'separator'    => 'after',
            'selectors' => [
                '{{WRAPPER}} .elementor-button:hover .elementor-button-icon i' => 'transform: rotate({{SIZE}}deg);',
            ],
            'condition' => [
                'selected_icon[value]!' => '',
            ],
        ]
    );


}, 10, 2);
