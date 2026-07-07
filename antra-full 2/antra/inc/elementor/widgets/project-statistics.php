<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('project')) {
    return;
}

use Antra\Elementor\Antra_Base_Widgets;
use Antra\Elementor\Antra_Group_Control_Typography;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Border;

/**
 * Elementor tabs widget.
 *
 * Elementor widget that displays vertical or horizontal tabs with different
 * pieces of content.
 *
 * @since 1.0.0
 */
class Antra_Elementor_Widget_Project_Statistics extends \Elementor\Widget_Base {


    public function get_categories() {
        return array('antra-addons');
    }

    /**
     * Get widget name.
     *
     * Retrieve tabs widget name.
     *
     * @return string Widget name.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_name() {
        return 'antra-project-statistics';
    }

    /**
     * Get widget title.
     *
     * Retrieve tabs widget title.
     *
     * @return string Widget title.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_title() {
        return esc_html__('Antra Project Statistics', 'antra');
    }

    /**
     * Get widget icon.
     *
     * Retrieve tabs widget icon.
     *
     * @return string Widget icon.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_icon() {
        return 'eicon-archive';
    }

    public function get_script_depends() {
        return [
            'antra-elementor-project-statistics',
        ];
    }

    /**
     * Register tabs widget controls.
     *
     * Adds different input fields to allow the user to change and customize the widget settings.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function register_controls() {
        //Section Query
        $this->start_controls_section(
            'section_setting',
            [
                'label' => esc_html__('Settings', 'antra'),
                'tab'   => Controls_Manager::TAB_CONTENT,
            ]
        );

        $this->add_control(
            'project_show',
            [
                'label'        => esc_html__('Project Show', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'default'      => 'single',
                'options'      => [
                    'single' => __('Single/Loop Project', 'antra'),
                    'select' => __('Selected Project', 'antra'),
                ],
            ]
        );

        $this->add_control(
            'choose_project',
            [
                'label'     => __('Project', 'antra'),
                'type'      => 'project',
                'multiple'    => false,
                'condition' => [
                    'project_show' => 'select'
                ],
            ]
        );

        $this->add_control(
			'divider_title',
			[
				'label' => esc_html__( 'Divider', 'antra' ),
				'type' => Controls_Manager::HEADING,
                'separator'          => 'before',
			]
		);

        $this->add_control(
            'show_divider',
            [
                'label' => esc_html__('Show Divider', 'antra'),
                'type'  => Controls_Manager::SWITCHER,
                'prefix_class' => 'show-divider-',
                'frontend_available' => true,
                'render_type' => 'template'
            ]
        );

        $this->add_control(
            'divider_color',
            [
                'label'     => esc_html__('Divider Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}}' => '--divider-color: {{VALUE}};',
                ],
                'condition' => [
                    'show_divider' => 'yes',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_content_project_style',
            [
                'label' => esc_html__('Meta Style', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'box_align',
            [
                'label'        => esc_html__('Box Align', 'antra'),
                'type'         => Controls_Manager::CHOOSE,
                'options'      => [
                    'left'    => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center' => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'right' => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                    'justify' => [
                        'title' => esc_html__('Justify', 'antra'),
                        'icon'  => 'eicon-text-align-justify',
                    ],
                ],
                'selectors'  => [
                    '{{WRAPPER}} .project-statistic-inner' => 'text-align: {{value}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'box_border_radius',
            [
                'label'      => esc_html__('Border Radius', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-wrapper' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'      => 'box_border',
                'selector'  => '{{WRAPPER}} .antra-wrapper',
            ]
        );

        $this->add_responsive_control(
            'box_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .project-statistic-item'      => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'content_spacing',
            [
                'label'      => esc_html__('Spacing', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .project-statistic-number' => 'margin-bottom: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->add_control(
            'statistic_number',
            [
                'label'     => esc_html__('Statistic Number', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );


        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'statistic_number_typography',
                'selector' => '{{WRAPPER}} .project-statistic-number',
            ]
        );

        $this->add_control(
            'statistic_number_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .project-statistic-number'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'statistic_name',
            [
                'label'     => esc_html__('Statistic Name', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );


        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'statistic_name_typography',
                'selector' => '{{WRAPPER}} .project-statistic-name',
            ]
        );

        $this->add_control(
            'statistic_name_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .project-statistic-name'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->get_controls_column();
    }

    /**
     * Render tabs widget output on the frontend.
     *
     * Written in PHP and used to generate the final HTML.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function render() {
        $settings = $this->get_settings_for_display();
        $this->handle_setting($settings);
    }

    private function handle_setting($settings) {
        $project_show = empty($settings['project_show']) ? 'single' : $settings['project_show'];
        if ($project_show == 'single') {
            if (is_singular('project') || get_post_type() == 'project') {
                $project_id = get_the_ID();
            }
        } else {
            if (!empty($settings['choose_project'])) {
                $project_id = absint($settings['choose_project']);
            }
        }
        $project_id = $project_id ?? antra_get_default_project();
        $meta_html = '';

        $statistics = get_post_meta($project_id, '_project_statistics', true);
        if (!empty($statistics)) {
            foreach ($statistics as $field) {
                if (empty($field['number']) && empty($field['name'])) {
                    continue;
                }
                $number = $field['number'] ?? '';
                $name = $field['name'] ?? '';
                $meta_html .= self::get_meta_html($number, $name);
            }
        }

        if (!empty($meta_html)) {
            ?>
            <div class="elementor-widget-inner">
                <div class="antra-wrapper">
                    <div class="antra-con-inner elementor-grid">
                        <?php printf('%s', $meta_html) ?>
                    </div>
                </div>
            </div>
            <?php
        } else {
            ?><pre><?php _e('Please add the statistics for this project!', 'antra'); ?></pre><?php
        }
    }

    protected static function get_meta_html($number = '', $name = '') {
        ob_start();
        ?>
        <div class="project-statistic-item">
            <div class="project-statistic-inner">
                <span class="project-statistic-number"><?php echo esc_html($number) ?></span>
                <span class="project-statistic-name"><?php echo esc_html($name) ?></span>
            </div>
        </div>
        <?php
        return ob_get_clean();
    }

    protected function get_controls_column($condition = false) {
        $column = range(1, 10);
        $column = array_combine($column, $column);

        $this->start_controls_section(
            'section_column_options',
            [
                'label' => esc_html__('Column Options', 'antra')
            ]
        );

        $this->add_responsive_control(
            'column',
            [
                'label'              => esc_html__('Columns', 'antra'),
                'type'               => Controls_Manager::SELECT,
                'default'            => 4,
                'options'            => [
                    '' => esc_html__('Default', 'antra'),
                ] + $column,
                'frontend_available' => true,
                'render_type'        => 'template',
                'prefix_class'       => 'antra-list-template elementor-grid%s-',
                'selectors'          => [
                    '{{WRAPPER}}' => '--e-global-column-to-show: {{VALUE}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'column_spacing',
            [
                'label'              => esc_html__('Column Spacing', 'antra'),
                'type'               => Controls_Manager::SLIDER,
                'range'              => [
                    'px' => [
                        'max' => 100,
                    ],
                ],
                'default'            => [
                    'size' => 30,
                ],
                'frontend_available' => true,
                'separator'          => 'after',
                'selectors'          => [
                    '{{WRAPPER}}' => '--grid-column-gap: {{SIZE}}{{UNIT}}; --grid-row-gap: {{SIZE}}{{UNIT}};',
                ],
                'condition' => [
                    'show_divider!' => 'yes'
                ]
            ]
        );

        $this->end_controls_section();
    }
}

$widgets_manager->register(new Antra_Elementor_Widget_Project_Statistics());
