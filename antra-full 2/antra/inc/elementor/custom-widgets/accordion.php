<?php
//Accordion
use Elementor\Controls_Manager;
use Elementor\Group_Control_Box_Shadow;
use Elementor\Modules\NestedElements\Controls\Control_Nested_Repeater;
use Elementor\Repeater;
use Elementor\Icons_Manager;
use Antra\Elementor\Antra_Group_Control_Typography;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;


add_action( 'elementor/element/nested-accordion/section_header_style/before_section_end', function ( $element, $args ) {

    $element->add_responsive_control(
        'title_margin',
        [
            'label' => esc_html__( 'Margin', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', 'em', '%' ],
            'selectors' => [
                '{{WRAPPER}} .e-n-accordion-item-title-header' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ]
    );

},10,2);

add_action('elementor/element/nested-accordion/section_header_style/before_section_end', function ($element, $args) {
    $element->add_responsive_control(
        'accordion_border_radius_title',
        [
            'label' => esc_html__( 'Border Radius', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', '%', 'em', 'rem', 'vw', 'custom' ],
            'selectors' => [
                '{{WRAPPER}} .e-n-accordion-item-title ' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ],
        [
            'position' => [
                'type' => 'control',
                'at' => 'before',
                'of' => 'normal_title_color',
            ]
        ]
    );

    $element->add_responsive_control(
        'accordion_border_radius_title_active',
        [
            'label' => esc_html__( 'Border Radius', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', '%', 'em', 'rem', 'vw', 'custom' ],
            'selectors' => [
                '{{WRAPPER}} .e-n-accordion-item[open] .e-n-accordion-item-title ' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ],
        [
            'position' => [
                'type' => 'control',
                'at' => 'before',
                'of' => 'active_title_color',
            ]
        ]
    );

}, 10, 2);

add_action('elementor/element/nested-accordion/section_accordion_style/before_section_end', function ($element, $args) {

    $element->update_control(
        'accordion_border_radius',
        [
            'label' => esc_html__( 'Border Radius', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', '%', 'em', 'rem', 'vw', 'custom' ],
            'selectors' => [
                '{{WRAPPER}} .e-n-accordion-item ' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ]
    );

    $element->add_group_control(
        Group_Control_Box_Shadow::get_type(),
        [
            'name' => 'box_shadow',
            'separator' => 'before',
            'selector' => '{{WRAPPER}} .e-n-accordion-item',
        ]
    );

    $element->add_control(
        'effect_background',
        [
            'label'     => esc_html__( 'Backdrop Filter', 'antra' ),
            'type'      => Controls_Manager::SWITCHER,
            'default' => '',
            'prefix_class'	=> 'antra-effect-bg-'
        ]
    );

    $states = ['normal', 'hover', 'active'];
    foreach ($states as $state) {
        $selector = '{{WRAPPER}} > .elementor-widget-container > .e-n-accordion > .e-n-accordion-item';
        switch ( $state ) {
            case 'hover':
                $selector .= ':hover';
                break;
            case 'active':
                $selector = '{{WRAPPER}} > .elementor-widget-container > .e-n-accordion > .e-n-accordion-item[open]';
                break;
        }
        $element->update_control(
            'accordion_border_'.$state.'_border',
            [
                'selectors' => [
                    $selector => 'border-style: {{VALUE}};',
                ],
            ]
        );
        $element->update_responsive_control(
            'accordion_border_'.$state.'_width',
            [
                'selectors' => [
                    $selector => 'border-width: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );
        $element->update_control(
            'accordion_border_'.$state.'_color',
            [
                'selectors' => [
                    $selector => 'border-color: {{VALUE}};',
                ],
            ]
        );
    }

    $element->add_responsive_control(
        'acc_item_margin',
        [
            'label' => esc_html__( 'Margin', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', '%', 'em', 'rem', 'custom' ],
            'selectors' => [
                '{{WRAPPER}} > .elementor-widget-container > .e-n-accordion > .e-n-accordion-item' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ],
        [
            'position' => [
                'type' => 'control',
                'at' => 'after',
                'of' => 'accordion_padding',
            ]
        ]
    );
}, 10, 2);


add_action('elementor/element/nested-accordion/section_items/before_section_end', function ($element, $args) {

    $repeater = new Repeater();

    $repeater->add_control(
        'item_title',
        [
            'label' => esc_html__( 'Title', 'antra' ),
            'type' => Controls_Manager::TEXT,
            'default' => esc_html__( 'Item Title', 'antra' ),
            'placeholder' => esc_html__( 'Item Title', 'antra' ),
            'label_block' => true,
            'dynamic' => [
                'active' => true,
            ],
        ]
    );

    $element->update_control(
        'items',
        [
            'label' => esc_html__( 'Items', 'antra' ),
            'type' => Control_Nested_Repeater::CONTROL_TYPE,
            'fields' => $repeater->get_controls(),
            'default' => [
                [
                    'item_title' => esc_html__( 'Item #1', 'antra' ),
                ],
                [
                    'item_title' => esc_html__( 'Item #2', 'antra' ),
                ],
                [
                    'item_title' => esc_html__( 'Item #3', 'antra' ),
                ],
            ],
            'title_field' => '{{{ item_title }}}',
            'button_text' => 'Add Item',
            'render_type' => 'template'
        ]
    );

    $element->add_control(
        'disable_collapse',
        [
            'label'     => esc_html__('Disable Collapse Icon', 'antra'),
            'type'      => Controls_Manager::SWITCHER,
            'default'   => '',
            'prefix_class'   => 'antra-disable-collapse-icon-',
        ],
        [
            'position' => [
                'type' => 'control',
                'at' => 'after',
                'of' => 'accordion_item_title_icon_position',
            ]
        ]
    );

    $element->update_control(
        'accordion_item_title_icon_active',
        [
            'condition' => [
                'accordion_item_title_icon[value]!' => '',
                'disable_collapse!' => 'yes',
            ],
        ]
    );

}, 10, 2);




