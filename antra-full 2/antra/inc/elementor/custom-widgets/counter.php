<?php
use Elementor\Controls_Manager;
use Elementor\Group_Control_Border;

add_action( 'elementor/element/counter/section_title/before_section_end', function ($element, $args ) {
    $element->add_group_control(
        Group_Control_Border::get_type(),
        [
            'name' => 'image_border',
            'selector' => '{{WRAPPER}} .elementor-counter .elementor-counter-title',
            'separator' => 'before',
        ]
    );
    $element->add_responsive_control(
        'title_margin',
        [
            'label' => esc_html__('Title Margin', 'antra'),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => ['px', 'em'],
            'selectors' => [
                '{{WRAPPER}} .elementor-counter .elementor-counter-title' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
            ],
        ]
    );

    $element->add_responsive_control(
        'title_padding',
        [
            'label' => esc_html__( 'Padding', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', 'em', '%' ],
            'selectors' => [
                '{{WRAPPER}} .elementor-counter .elementor-counter-title' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ]
    );

}, 10, 2 );
