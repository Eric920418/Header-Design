<?php

use Elementor\Controls_Manager;
use Elementor\Element_Base;
use Elementor\Widget_Base;


if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly
}

class Antra_Elementor_Sticky_Section {

    public function __construct() {
        add_action('elementor/element/section/section_effects/after_section_start', [$this, 'register_controls']);
        add_action('elementor/element/common/section_effects/after_section_start', [$this, 'register_controls']);
        add_action('elementor/element/container/section_effects/after_section_start', [$this, 'register_controls']);
        add_action('elementor/frontend/after_enqueue_scripts', [$this, 'scripts']);
    }

    public function scripts() {
        global $antra_version;
        wp_register_script('elementor-sticky', get_template_directory_uri() . '/assets/js/vendor/elementor-sticky.js', ['jquery'], $antra_version, true);
        wp_enqueue_script('antra-elementor-sticky', get_template_directory_uri() . '/assets/js/vendor/sticky.js', ['jquery', 'elementor-frontend', 'elementor-sticky'], $antra_version, true);
    }

    /**
     * Check if `$element` is an instance of a class in the `$types` array.
     *
     * @param $element
     * @param $types
     *
     * @return bool
     */
    private function is_instance_of($element, array $types) {
        foreach ($types as $type) {
            if ($element instanceof $type) {
                return true;
            }
        }

        return false;
    }

    public function register_controls(Element_Base $element) {
        $element->add_control(
            'sticky_show_up',
            [
                'label'              => esc_html__('Sticky When Up', 'antra'),
                'type'               => Controls_Manager::SWITCHER,
                'render_type'        => 'none',
                'frontend_available' => true,
                'condition'          => [
                    'sticky' => '',
                ],
            ]
        );

        $element->add_control(
            'sticky',
            [
                'label'              => esc_html__('Sticky', 'antra'),
                'type'               => Controls_Manager::SELECT,
                'options'            => [
                    ''       => esc_html__('None', 'antra'),
                    'top'    => esc_html__('Top', 'antra'),
                    'bottom' => esc_html__('Bottom', 'antra'),
                ],
                'separator'          => 'before',
                'render_type'        => 'none',
                'frontend_available' => true,
            ]
        );

        // TODO: In Pro 3.5.0, get the active devices using Breakpoints/Manager::get_active_devices_list().
        $active_breakpoint_instances = Elementor\Plugin::$instance->breakpoints->get_active_breakpoints();
        // Devices need to be ordered from largest to smallest.
        $active_devices = array_reverse(array_keys($active_breakpoint_instances));

        // Add desktop in the correct position.
        if (in_array('widescreen', $active_devices, true)) {
            $active_devices = array_merge(array_slice($active_devices, 0, 1), ['desktop'], array_slice($active_devices, 1));
        } else {
            $active_devices = array_merge(['desktop'], $active_devices);
        }

        $sticky_device_options = [];

        foreach ($active_devices as $device) {
            $label                          = 'desktop' === $device ? esc_html__('Desktop', 'antra') : $active_breakpoint_instances[$device]->get_label();
            $sticky_device_options[$device] = $label;
        }

        $element->add_control(
            'sticky_on',
            [
                'label'              => esc_html__('Sticky On', 'antra'),
                'type'               => Controls_Manager::SELECT2,
                'multiple'           => true,
                'label_block'        => true,
                'default'            => $active_devices,
                'options'            => $sticky_device_options,
                'condition'          => [
                    'sticky!' => '',
                ],
                'render_type'        => 'none',
                'frontend_available' => true,
            ]
        );

        $element->add_responsive_control(
            'sticky_offset',
            [
                'label'              => esc_html__('Offset', 'antra'),
                'type'               => Controls_Manager::NUMBER,
                'default'            => 0,
                'min'                => 0,
                'max'                => 500,
                'required'           => true,
                'condition'          => [
                    'sticky!' => '',
                ],
                'render_type'        => 'none',
                'frontend_available' => true,
            ]
        );

        $element->add_responsive_control(
            'sticky_effects_offset',
            [
                'label'              => esc_html__('Effects Offset', 'antra'),
                'type'               => Controls_Manager::NUMBER,
                'default'            => 0,
                'min'                => 0,
                'max'                => 1000,
                'required'           => true,
                'condition'          => [
                    'sticky!' => '',
                ],
                'render_type'        => 'none',
                'frontend_available' => true,
            ]
        );

        

        // Add `Stay In Column` only to the following types:
        $types = [
            Elementor\Element_Section::class,
            Widget_Base::class,
        ];

        if (Elementor\Plugin::$instance->experiments->is_feature_active('container')) {
            $types[] = Elementor\Includes\Elements\Container::class;
        }

        if ($this->is_instance_of($element, $types)) {
            $conditions = [
                'sticky!' => '',
            ];

            // Target only inner sections.
            // Checking for `$element->get_data( 'isInner' )` in both editor & frontend causes it to work properly on the frontend but
            // break on the editor, because the inner section is created in JS and not rendered in PHP.
            // So this is a hack to force the editor to show the `sticky_parent` control, and still make it work properly on the frontend.
            if ($element instanceof Elementor\Element_Section && Elementor\Plugin::$instance->editor->is_edit_mode()) {
                $conditions['isInner'] = true;
            }

            $element->add_control(
                'sticky_parent',
                [
                    'label'              => esc_html__('Stay In Column', 'antra'),
                    'type'               => Controls_Manager::SWITCHER,
                    'condition'          => $conditions,
                    'render_type'        => 'none',
                    'frontend_available' => true,
                ]
            );
        }

        $element->add_control(
            'sticky_divider',
            [
                'type' => Controls_Manager::DIVIDER,
            ]
        );
    }


    private function get_asset_conditions_data() {
        return [
            'scripts' => [
                [
                    'name'       => 'e-sticky',
                    'conditions' => [
                        'terms' => [
                            [
                                'name'     => 'sticky',
                                'operator' => '!==',
                                'value'    => '',
                            ],
                        ],
                    ],
                ],
            ],
        ];
    }
}

new Antra_Elementor_Sticky_Section();
