<?php

use Elementor\Controls_Manager;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;
use Elementor\Group_Control_Background;
use Elementor\Group_Control_Border;
use Elementor\Group_Control_Box_Shadow;
use Elementor\Group_Control_Css_Filter;
use Elementor\Group_Control_Text_Shadow;
use Elementor\Widget_Base;
use Antra\Elementor\Antra_Group_Control_Typography;
use Elementor\Icons_Manager;
use Elementor\Repeater;
use Elementor\Utils;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

class Antra_Pricing extends Elementor\Widget_Base {

    public function get_name() {
        return 'antra-pricing';
    }

    public function get_title() {
        return esc_html__('Antra Pricing', 'antra');
    }

    public function get_icon() {
        return 'eicon-price-table';
    }

    public function get_keywords() {
        return ['pricing', 'table', 'product', 'plan', 'button'];
    }

    public function get_script_depends() {
        return [
            'antra-elementor-pricing',
        ];
    }

    protected function register_controls() {
        $this->start_controls_section(
            'section_header',
            [
                'label' => esc_html__('Header', 'antra'),
            ]
        );

        $this->add_control(
            'selected_icon',
            [
                'label'            => esc_html__('Icon', 'antra'),
                'type'             => Controls_Manager::ICONS,
            ]
        );

        $this->add_control(
            'heading',
            [
                'label'   => esc_html__('Title', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => esc_html__('Enter your title', 'antra'),
                'dynamic' => [
                    'active' => true,
                ],
            ]
        );

        $this->add_control(
            'sub_heading',
            [
                'label'   => esc_html__('Description', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => esc_html__('Enter your description', 'antra'),
                'dynamic' => [
                    'active' => true,
                ],
            ]
        );

        $this->add_control(
            'heading_tag',
            [
                'label'   => esc_html__('Title HTML Tag', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'options' => [
                    'h2' => 'H2',
                    'h3' => 'H3',
                    'h4' => 'H4',
                    'h5' => 'H5',
                    'h6' => 'H6',
                ],
                'default' => 'h3',
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_pricing',
            [
                'label' => esc_html__('Pricing', 'antra'),
            ]
        );

        $this->add_control(
            'currency_symbol',
            [
                'label'   => esc_html__('Currency Symbol', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'options' => [
                    ''             => esc_html__('None', 'antra'),
                    'dollar'       => '&#36; ' . _x('Dollar', 'Currency', 'antra'),
                    'euro'         => '&#128; ' . _x('Euro', 'Currency', 'antra'),
                    'baht'         => '&#3647; ' . _x('Baht', 'Currency', 'antra'),
                    'franc'        => '&#8355; ' . _x('Franc', 'Currency', 'antra'),
                    'guilder'      => '&fnof; ' . _x('Guilder', 'Currency', 'antra'),
                    'krona'        => 'kr ' . _x('Krona', 'Currency', 'antra'),
                    'lira'         => '&#8356; ' . _x('Lira', 'Currency', 'antra'),
                    'peseta'       => '&#8359 ' . _x('Peseta', 'Currency', 'antra'),
                    'peso'         => '&#8369; ' . _x('Peso', 'Currency', 'antra'),
                    'pound'        => '&#163; ' . _x('Pound Sterling', 'Currency', 'antra'),
                    'real'         => 'R$ ' . _x('Real', 'Currency', 'antra'),
                    'ruble'        => '&#8381; ' . _x('Ruble', 'Currency', 'antra'),
                    'rupee'        => '&#8360; ' . _x('Rupee', 'Currency', 'antra'),
                    'indian_rupee' => '&#8377; ' . _x('Rupee (Indian)', 'Currency', 'antra'),
                    'shekel'       => '&#8362; ' . _x('Shekel', 'Currency', 'antra'),
                    'yen'          => '&#165; ' . _x('Yen/Yuan', 'Currency', 'antra'),
                    'won'          => '&#8361; ' . _x('Won', 'Currency', 'antra'),
                    'custom'       => esc_html__('Custom', 'antra'),
                ],
                'default' => 'dollar',
            ]
        );

        $this->add_control(
            'currency_symbol_custom',
            [
                'label'     => esc_html__('Custom Symbol', 'antra'),
                'type'      => Controls_Manager::TEXT,
                'condition' => [
                    'currency_symbol' => 'custom',
                ],
            ]
        );

        $this->add_control(
            'price',
            [
                'label'   => esc_html__('Price', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => '39.99',
                'dynamic' => [
                    'active' => true,
                ],
            ]
        );

        $this->add_control(
            'price_range',
            [
                'label'   => esc_html__('Price Range', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => '99.99',
                'dynamic' => [
                    'active' => true,
                ],
            ]
        );

        $this->add_control(
            'currency_format',
            [
                'label'   => esc_html__('Currency Format', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'options' => [
                    ''  => '1,234.56 (Default)',
                    ',' => '1.234,56',
                ],
            ]
        );

        $this->add_control(
            'period',
            [
                'label'   => esc_html__('Period', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => esc_html__('Monthly', 'antra'),
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_features',
            [
                'label' => esc_html__('Features', 'antra'),
            ]
        );

        $repeater = new Repeater();

        $repeater->add_control(
            'item_text',
            [
                'label'   => esc_html__('Text', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => esc_html__('List Item', 'antra'),
            ]
        );

        $default_icon = [
            'value'   => 'far fa-check-circle',
            'library' => 'fa-regular',
        ];

        $repeater->add_control(
            'selected_item_icon',
            [
                'label'            => esc_html__('Icon', 'antra'),
                'type'             => Controls_Manager::ICONS,
                'fa4compatibility' => 'item_icon',
                'default'          => $default_icon,
            ]
        );

        $repeater->add_control(
            'item_icon_color',
            [
                'label'     => esc_html__('Icon Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} {{CURRENT_ITEM}} i'   => 'color: {{VALUE}}',
                    '{{WRAPPER}} {{CURRENT_ITEM}} svg' => 'fill: {{VALUE}}',
                ],
            ]
        );

        $repeater->add_control(
            'item_text_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} {{CURRENT_ITEM}} span'   => 'color: {{VALUE}}',

                ],
            ]
        );

        $this->add_control(
            'features_list',
            [
                'type'        => Controls_Manager::REPEATER,
                'fields'      => $repeater->get_controls(),
                'default'     => [
                    [
                        'item_text'          => esc_html__('List Item #1', 'antra'),
                        'selected_item_icon' => $default_icon,
                    ],
                    [
                        'item_text'          => esc_html__('List Item #2', 'antra'),
                        'selected_item_icon' => $default_icon,
                    ],
                    [
                        'item_text'          => esc_html__('List Item #3', 'antra'),
                        'selected_item_icon' => $default_icon,
                    ],
                ],
                'title_field' => '{{{ item_text }}}',
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_footer',
            [
                'label' => esc_html__('Footer', 'antra'),
            ]
        );

        $this->add_control(
            'button_text',
            [
                'label'   => esc_html__('Button Text', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => esc_html__('Click Here', 'antra'),
                'dynamic' => [
                    'active' => true,
                ],
            ]
        );


        $this->add_control(
            'button_icon',
            [
                'label' => esc_html__('Icon', 'antra'),
                'type'  => Controls_Manager::ICONS,
            ]
        );

        $this->add_control(
            'button_icon_align',
            [
                'label'     => esc_html__('Icon Position', 'antra'),
                'type'      => Controls_Manager::HIDDEN,
                'default'   => 'left',
            ]
        );

        $this->add_control(
            'link',
            [
                'label'       => esc_html__('Link', 'antra'),
                'type'        => Controls_Manager::URL,
                'placeholder' => esc_html__('https://your-link.com', 'antra'),
                'default'     => [
                    'url' => '#',
                ],
                'dynamic'     => [
                    'active' => true,
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_wrapper_style',
            [
                'label' => esc_html__('Wrapper', 'antra'),
                'tab'        => Controls_Manager::TAB_STYLE,
                'show_label' => false,
            ]
        );

        $this->add_responsive_control(
            'wrapper_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'wrapper_background_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'    => '#fff',
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table'   => 'background-color: {{VALUE}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'wrapper_alignment',
            [
                'label'     => esc_html__('Alignment', 'antra'),
                'type'      => Controls_Manager::CHOOSE,
                'options'   => [
                    'left'   => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center' => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'right'  => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table' => 'text-align: {{VALUE}}',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'        => 'wrapper_border',
                'placeholder' => '1px',
                'default'     => '1px',
                'selector'    => '{{WRAPPER}} .elementor-price-table',
                'separator'   => 'before',

            ]
        );

        $this->add_control(
            'border_hover_color',
            [
                'label'     => esc_html__('Border Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table:hover'   => 'border-color: {{VALUE}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'wrapper_border_radius',
            [
                'label' => esc_html__( 'Border Radius', 'antra' ),
                'type' => Controls_Manager::DIMENSIONS,
                'size_units' => [ 'px', '%', 'em', 'rem', 'custom' ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_header_style',
            [
                'label'      => esc_html__('Header', 'antra'),
                'tab'        => Controls_Manager::TAB_STYLE,
                'show_label' => false,
            ]
        );

        $this->add_control(
            'header_bg_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__header' => 'background-color: {{VALUE}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'header_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table__header' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'        => 'header_border',
                'placeholder' => '1px',
                'default'     => '1px',
                'selector'    => '{{WRAPPER}} .elementor-price-table__header',
                'separator'   => 'before',

            ]
        );

        $this->add_control(
            'heading_heading_style',
            [
                'label'     => esc_html__('Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'heading_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__heading' => 'color: {{VALUE}}',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'heading_typography',
                'selector' => '{{WRAPPER}} .elementor-price-table__heading',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_PRIMARY,
                ],
            ]
        );

        $this->add_responsive_control(
            'title_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table__heading' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'heading_sub_heading_style',
            [
                'label'     => esc_html__('Description', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'sub_heading_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__subheading' => 'color: {{VALUE}}',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'sub_heading_typography',
                'selector' => '{{WRAPPER}} .elementor-price-table__subheading',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
            ]
        );

        $this->add_responsive_control(
            'sub_heading_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table__subheading' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_pricing_element_style',
            [
                'label'      => esc_html__('Pricing', 'antra'),
                'tab'        => Controls_Manager::TAB_STYLE,
                'show_label' => false,
            ]
        );

        $this->add_control(
            'pricing_element_bg_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__price' => 'background-color: {{VALUE}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'pricing_element_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table__price' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'pricing_element_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table__price' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'price_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__currency, {{WRAPPER}} .elementor-price-table__integer-part, {{WRAPPER}} .elementor-price-table__fractional-part' => 'color: {{VALUE}}',
                ],
                'separator' => 'before',
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'price_typography',
                // Targeting also the .elementor-price-table class in order to get a higher specificity from the inline CSS.
                'selector' => '{{WRAPPER}} .elementor-price-table__integer-part',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_PRIMARY,
                ],
            ]
        );

        $this->add_responsive_control(
            'align_price',
            [
                'label'     => esc_html__('Alignment Price', 'antra'),
                'type'      => Controls_Manager::CHOOSE,
                'options'   => [
                    'flex-start' => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-h-align-left',
                    ],
                    'center'     => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-h-align-center',
                    ],
                    'flex-end'   => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-h-align-right',
                    ],
                ],
                'default'   => 'center',
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__price' => 'justify-content: {{VALUE}}',
                ],
            ]
        );

        $this->add_control(
            'heading_currency_style',
            [
                'label'     => esc_html__('Currency Symbol', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
                'condition' => [
                    'currency_symbol!' => '',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'      => 'currency_typography',
                'selector'  => '{{WRAPPER}} .elementor-price-table__currency',
                'global'    => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
                'condition' => [
                    'currency_symbol!' => '',
                ],
            ]
        );

        $this->add_control(
            'currency_position',
            [
                'label'   => esc_html__('Position', 'antra'),
                'type'    => Controls_Manager::CHOOSE,
                'default' => 'before',
                'options' => [
                    'before' => [
                        'title' => esc_html__('Before', 'antra'),
                        'icon'  => 'eicon-h-align-left',
                    ],
                    'after'  => [
                        'title' => esc_html__('After', 'antra'),
                        'icon'  => 'eicon-h-align-right',
                    ],
                ],
            ]
        );

        $this->add_control(
            'heading_period_style',
            [
                'label'     => esc_html__('Period', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
                'condition' => [
                    'period!' => '',
                ],
            ]
        );

        $this->add_control(
            'period_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__period' => 'color: {{VALUE}}',
                ],
                'condition' => [
                    'period!' => '',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'      => 'period_typography',
                'selector'  => '{{WRAPPER}} .elementor-price-table__period',
                'global'    => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
                'condition' => [
                    'period!' => '',
                ],
            ]
        );

        $this->add_control(
            'period_position',
            [
                'label'       => esc_html__('Position', 'antra'),
                'type'        => Controls_Manager::SELECT,
                'label_block' => false,
                'options'     => [
                    'below'  => esc_html__('Below', 'antra'),
                    'beside' => esc_html__('Beside', 'antra'),
                ],
                'default'     => 'below',
                'condition'   => [
                    'period!' => '',
                ],
            ]
        );

        $this->add_responsive_control(
            'period_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table__period.elementor-typo-excluded' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_features_list_style',
            [
                'label'      => esc_html__('Features', 'antra'),
                'tab'        => Controls_Manager::TAB_STYLE,
                'show_label' => false,
            ]
        );

        $this->add_control(
            'feature_title_style',
            [
                'label'     => esc_html__('Feature Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                // 'separator' => 'before',
            ]
        );

        $this->add_control(
            'feature_title_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .price-table__features_title' => 'color: {{VALUE}}',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'feature_title_typography',
                'selector' => '{{WRAPPER}} .price-table__features_title',
            ]
        );

        $this->add_responsive_control(
            'feature_title_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .price-table__features_title' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'features_title_alignment',
            [
                'label'     => esc_html__('Alignment', 'antra'),
                'type'      => Controls_Manager::CHOOSE,
                'options'   => [
                    'left'   => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center' => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'right'  => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                ],
                'selectors' => [
                    '{{WRAPPER}} .price-table__features_title' => 'text-align: {{VALUE}}',
                ],
            ]
        );

        $this->add_control(
            'feature_list_style',
            [
                'label'     => esc_html__('Feature List', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );


        $this->add_control(
            'features_list_bg_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__features-list' => 'background-color: {{VALUE}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'features_list_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-price-table__features-list' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'features_list_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'global'    => [
                    'default' => Global_Colors::COLOR_TEXT,
                ],
                'separator' => 'before',
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__features-list' => '--e-price-table-features-list-color: {{VALUE}}',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'features_list_typography',
                'selector' => '{{WRAPPER}} .elementor-price-table__features-list li',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
            ]
        );

        $this->add_control(
            'features_list_alignment',
            [
                'label'     => esc_html__('Alignment', 'antra'),
                'type'      => Controls_Manager::CHOOSE,
                'options'   => [
                    'left'   => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center' => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'right'  => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-price-table__features-list' => 'text-align: {{VALUE}}',
                ],
            ]
        );

        $this->end_controls_section();
    }

    private function render_currency_symbol($symbol, $location, bool $print = true) {
        $html = '';
        $currency_position = $this->get_settings('currency_position');
        $location_setting  = !empty($currency_position) ? $currency_position : 'before';
        if (!empty($symbol) && $location === $location_setting) {
            $html = '<span class="elementor-price-table__currency">' . esc_html($symbol) . '</span>';
        }
        if ($print) {
            printf('%s', $html);
        } else {
            return $html;
        }
    }

    private function get_currency_symbol($symbol_name) {
        $symbols = [
            'dollar'       => '&#36;',
            'euro'         => '&#128;',
            'franc'        => '&#8355;',
            'pound'        => '&#163;',
            'ruble'        => '&#8381;',
            'shekel'       => '&#8362;',
            'baht'         => '&#3647;',
            'yen'          => '&#165;',
            'won'          => '&#8361;',
            'guilder'      => '&fnof;',
            'peso'         => '&#8369;',
            'peseta'       => '&#8359',
            'lira'         => '&#8356;',
            'rupee'        => '&#8360;',
            'indian_rupee' => '&#8377;',
            'real'         => 'R$',
            'krona'        => 'kr',
        ];

        return isset($symbols[$symbol_name]) ? $symbols[$symbol_name] : '';
    }

    protected function render() {
        $settings = $this->get_settings_for_display();
        $symbol   = '';
        $has_icon = !empty($settings['button_icon']);

        $pricing_layout = $settings['pricing_layout'] ?? '1';

        if ($has_icon) {
            $this->add_render_attribute('button-icon', 'class', $settings['button_icon']);
            $this->add_render_attribute('button-icon', 'aria-hidden', 'true');
        }

        if (empty($settings['button_icon']) && !Icons_Manager::is_migration_allowed()) {
            $settings['button_icon'] = 'fa fa-star';
        }

        $this->add_render_attribute('button_text', 'class', [
            'elementor-price-table__button',
            'antra-elementor-button',
            'antra-btn-has-icon',
        ]);

        $this->add_render_attribute('button_icon', 'class', ['elementor-button-icon button-icon']);

        if (!empty($settings['link']['url'])) {
            $this->add_link_attributes('button_text', $settings['link']);
        }

        if (!empty($settings['button_hover_animation'])) {
            $this->add_render_attribute('button_text', 'class', 'elementor-animation-' . $settings['button_hover_animation']);
        }

        if (!empty($settings['button_icon_align'])) {
            $this->add_render_attribute('button_icon', 'class', 'elementor-align-icon-' . $settings['button_icon_align']);
        }

        $this->add_render_attribute('heading', 'class', 'elementor-price-table__heading');
        $this->add_render_attribute('sub_heading', 'class', 'elementor-price-table__subheading');
        $this->add_render_attribute('period', 'class', ['elementor-price-table__period', 'elementor-typo-excluded']);

        $this->add_inline_editing_attributes('heading', 'none');
        $this->add_inline_editing_attributes('sub_heading', 'none');
        $this->add_inline_editing_attributes('period', 'none');

        $heading_tag     = Utils::validate_html_tag($settings['heading_tag']);

        $migration_allowed = Icons_Manager::is_migration_allowed();
        $migrated = isset( $settings['__fa4_migrated']['selected_icon'] );
        $is_new = ! isset( $settings['icon'] ) && Icons_Manager::is_migration_allowed();
        ?>

        <div class="elementor-price-table">
            <div class="elementor-price-table-deco">
                <?php if ($settings['heading'] || $settings['sub_heading']) : ?>
                <div class="elementor-price-table__header">

                    <?php if (!empty($settings['heading'])) : ?>
                    <<?php Utils::print_validated_html_tag($heading_tag); ?> <?php $this->print_render_attribute_string('heading'); ?>>
                    <?php $this->print_unescaped_setting('heading'); ?>
                </<?php Utils::print_validated_html_tag($heading_tag); ?>>
            <?php endif; ?>

                <?php if (!empty($settings['sub_heading'])) : ?>
                    <span <?php $this->print_render_attribute_string('sub_heading'); ?>>
                                <?php $this->print_unescaped_setting('sub_heading'); ?>
                            </span>
                <?php endif; ?>

                <?php if ($pricing_layout == '1') $this->render_table_price($settings); ?>
            </div>
            <?php endif; ?>

            <?php if (!empty($settings['features_list'])) : ?>
                <div class="elementor-price-table__features">
                    <?php
                    if(!empty($settings['feature_title'])) {
                        printf('<h4 class="price-table__features_title">%s</h4>', esc_html($settings['feature_title']));
                    }
                    ?>
                    <ul class="elementor-price-table__features-list">
                        <?php
                        foreach ($settings['features_list'] as $index => $item) :
                            $repeater_setting_key = $this->get_repeater_setting_key('item_text', 'features_list', $index);
                            $this->add_inline_editing_attributes($repeater_setting_key);

                            $migrated = isset($item['__fa4_migrated']['selected_item_icon']);
                            // add old default
                            if (!isset($item['item_icon']) && !$migration_allowed) {
                                $item['item_icon'] = 'fa fa-check-circle';
                            }
                            $is_new = !isset($item['item_icon']) && $migration_allowed;
                            $class_item = 'elementor-repeater-item-' . $item['_id'];
                            ?>
                            <li class="<?php echo esc_attr($class_item) ?>">
                                <div class="elementor-price-table__feature-inner">
                                    <?php if (!empty($item['item_icon']) || !empty($item['selected_item_icon'])) :
                                        if ($is_new || $migrated) :
                                            Icons_Manager::render_icon($item['selected_item_icon'], ['aria-hidden' => 'true']);
                                        else : ?>
                                            <i class="<?php echo esc_attr($item['item_icon']); ?>" aria-hidden="true"></i>
                                        <?php
                                        endif;
                                    endif; ?>
                                    <?php if (!empty($item['item_text'])) : ?>
                                        <span <?php $this->print_render_attribute_string($repeater_setting_key); ?>>
                                                    <?php $this->print_unescaped_setting('item_text', 'features_list', $index); ?>
                                                </span>
                                    <?php
                                    else :
                                        echo '&nbsp;';
                                    endif;
                                    ?>
                                </div>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            <?php endif; ?>

            <?php if($pricing_layout == '1') $this->render_button($settings); ?>
        </div>
        </div>

        <?php
    }

    protected function render_button($settings) {
        if (!empty($settings['button_text'])) { ?>
            <div class="elementor-price-table__footer">
                <?php if (!empty($settings['button_text'])) : ?>
                    <a <?php $this->print_render_attribute_string('button_text'); ?>>
                        <span class="elementor-button-content-wrapper">
                            <span class="elementor-button-text"><?php $this->print_unescaped_setting('button_text'); ?></span>
                            <?php if (!empty($settings['button_icon']['value'])) : ?>
                                <i <?php $this->print_render_attribute_string('button-icon'); ?>></i>
                            <?php endif; ?>
                        </span>
                    </a>
                <?php endif; ?>
            </div>
        <?php }
    }

    protected function render_table_price($settings) {
        if (!empty($settings['currency_symbol'])) {
            if ('custom' !== $settings['currency_symbol']) {
                $symbol = $this->get_currency_symbol($settings['currency_symbol']);
            } else {
                $symbol = $settings['currency_symbol_custom'];
            }
        }
        $currency_format = empty($settings['currency_format']) ? '.' : $settings['currency_format'];
        $price           = explode($currency_format, $settings['price']);
        $intpart         = $price[0];

        if (!empty($settings['price_range'])) {
            $price_range = explode($currency_format, $settings['price_range']);
            $intpart_price_range = $price_range[0];
        }

        $fraction        = '';
        if (2 === count($price)) {
            $fraction = $price[1];
        }

        $period_position = $settings['period_position'];
        $period_element  = '<span ' . $this->get_render_attribute_string('period') . '>' . $settings['period'] . '</span>';
        ?>
        <div class="elementor-price-table__price">
            <?php if (!empty($intpart) || 0 <= $intpart) : ?>
                <span class="elementor-price-table__integer-part">
                    <?php
                    $currency_symbol_before = $this->render_currency_symbol($symbol, 'before', 0);
                    $currency_symbol_after = $this->render_currency_symbol($symbol, 'after', 0);
                    $intpart = sprintf('%1$s%2$s%3$s', $currency_symbol_before, $intpart, $currency_symbol_after);
                    if (isset($intpart_price_range)) {
                        $intpart_price_range = sprintf('%1$s%2$s%3$s', $currency_symbol_before, $intpart_price_range, $currency_symbol_after);
                        echo sprintf('%1s - %2s', $intpart, $intpart_price_range); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
                    } else {
                        echo sprintf('%s', $intpart);  // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
                    }
                    // PHPCS - the main text of a widget should not be escaped.
                    ?>
                </span>
            <?php endif; ?>

            <?php if ('' !== $fraction || (!empty($settings['period']) && 'beside' === $period_position)) : ?>
                <div class="elementor-price-table__after-price">
                    <?php if (!empty($settings['period']) && 'beside' === $period_position) : ?>
                        <?php
                        // PHPCS - already escaped before
                        echo sprintf('%s', $period_element); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
                        ?>
                    <?php endif; ?>
                </div>
            <?php endif; ?>

            <?php if (!empty($settings['period']) && 'below' === $period_position) : ?>
                <?php
                // PHPCS - already escaped before
                echo sprintf('%s', $period_element); // phpcs:ignore WordPress.Security.EscapeOutput.OutputNotEscaped
                ?>
            <?php endif; ?>

        </div>
        <?php
    }
}

$widgets_manager->register(new Antra_Pricing());
