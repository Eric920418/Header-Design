<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('project')) {
    return;
}

use Antra\Elementor\Antra_Base_Widgets;
use Elementor\Controls_Manager;
use Elementor\Repeater;

/**
 * Elementor tabs widget.
 *
 * Elementor widget that displays vertical or horizontal tabs with different
 * pieces of content.
 *
 * @since 1.0.0
 */
class Antra_Elementor_Widget_Project_Meta extends \Elementor\Widget_Base {


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
        return 'antra-project-meta';
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
        return esc_html__('Antra Project Meta', 'antra');
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

        $repeater = new Repeater();

        $repeater->add_control(
            'meta_type',
            [
                'type'    => Controls_Manager::HIDDEN,
                'default' => '',
            ]
        );
        $repeater->add_control(
            'meta_show',
            [
                'type'    => Controls_Manager::SWITCHER,
                'label'       => esc_html('Show meta', 'antra'),
                'default' => 'yes',
            ]
        );
        $repeater->add_control(
            'meta_title',
            [
                'label'       => esc_html__('Meta title', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'dynamic'     => [
                    'active' => true,
                ],
                'default'     => '',
                'placeholder' => esc_html__('Type something...', 'antra'),
            ]
        );

        $this->add_control(
            'meta_list',
            [
                'label'       => esc_html__('Meta Show', 'antra'),
                'type'        => Controls_Manager::REPEATER,
                'fields'      => $repeater->get_controls(),
                'title_field' => '{{{ meta_type.charAt(0).toUpperCase() + meta_type.slice(1) }}}',
                'min_items' => 7,
                'max_items' => 7,
                'default' => [
					[
						'meta_type' => 'category',
						'meta_title' => esc_html__( 'Project Type', 'antra' ),
					],
					[
						'meta_type' => 'architect',
						'meta_title' => esc_html__( 'Architect', 'antra' ),
					],
					[
						'meta_type' => 'client',
						'meta_title' => esc_html__( 'Client', 'antra' ),
					],
					[
						'meta_type' => 'terms',
						'meta_title' => esc_html__( 'Terms', 'antra' ),
					],
					[
						'meta_type' => 'strategy',
						'meta_title' => esc_html__( 'Strategy', 'antra' ),
					],
					[
						'meta_type' => 'location',
						'meta_title' => esc_html__( 'Location', 'antra' ),
					],
					[
						'meta_type' => 'date',
						'meta_title' => esc_html__( 'Date', 'antra' ),
					],
				],
            ]
        );

        $this->add_control(
            'hide_empty',
            [
                'type'    => Controls_Manager::SWITCHER,
                'label'       => esc_html('Hide Empty', 'antra'),
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
        $hide_empty = $settings['hide_empty'] ?? 'no';
        $meta_html = '';
        if (!empty($settings['meta_list'])) {
            foreach ($settings['meta_list'] as $field) {
                if (empty($field['meta_show']) || $field['meta_show'] !== 'yes') {
                    continue;
                }
                
                $type = $field['meta_type'] ?? '';
                $title = !empty($field['meta_title']) ? $field['meta_title'] : ucfirst($type);
                $content = '';

                if (in_array($type, ['architect', 'client', 'terms', 'strategy', 'location', 'date'])) {
                    $field = get_post_meta( $project_id, '_project_'.$type, true );
                    if (!empty($field)) {
                        $content = $field;
                    }
                } elseif ($type == 'category') {
                    $terms = get_the_terms($project_id, 'project-category');
                    if (!empty($terms) && !is_wp_error($terms)) {
                        $term_names = wp_list_pluck($terms, 'name');
                        $content = implode(', ', $term_names);
                    }
                }

                if (!empty($content)) {
                    $meta_html .= self::get_meta_html($title, $content);
                }
                elseif ($hide_empty !== 'yes') {
                    $meta_html .= self::get_meta_html($title, 'N/A');
                }

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
            ?><pre><?php _e('No meta to show!', 'antra'); ?></pre><?php
        }
    }

    protected static function get_meta_html($title = '', $content = '') {
        ob_start();
        ?>
        <div class="project-meta-item">
            <div class="project-meta-inner">
                <span class="project-meta-title"><?php echo wp_kses_post($title) ?>:</span>
                <span class="project-meta-content"><?php printf('%s', $content) ?></span>
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
            ]
        );

        $this->end_controls_section();
    }
}

$widgets_manager->register(new Antra_Elementor_Widget_Project_Meta());
