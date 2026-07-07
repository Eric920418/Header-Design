<?php

use Elementor\Control_Media;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Border;
use Elementor\Icons_Manager;
use Elementor\Utils;
use Elementor\Widget_Icon_List;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;

add_action('elementor/element/icon-list/section_icon/before_section_end', function ($element, $args) {
    $element->add_responsive_control(
        'icon_list_hover',
        [
            'label' => esc_html__('Style Text Hover', 'antra'),
            'type'         => Controls_Manager::SWITCHER,
            'prefix_class' => 'icon-list-hover-',
        ]
    );
}, 10, 2);
