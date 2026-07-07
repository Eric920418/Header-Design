<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('project')) {
    return;
}

use Antra\Elementor\Antra_Base_Widgets;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Background;
use Elementor\Group_Control_Border;
use Elementor\Group_Control_Box_Shadow;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;
use Elementor\Group_Control_Text_Shadow;
use Elementor\Repeater;
use Antra\Elementor\Antra_Group_Control_Typography;

/**
 * Elementor tabs widget.
 *
 * Elementor widget that displays vertical or horizontal tabs with different
 * pieces of content.
 *
 * @since 1.0.0
 */
class Antra_Elementor_Widget_Project extends Antra_Base_Widgets {


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
        return 'antra-project';
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
        return esc_html__('Antra Projects List', 'antra');
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
        return 'eicon-bag-medium';
    }


    public function get_script_depends() {
        return [
            'antra-elementor-project',
            'antra-scrolltrigger'
        ];
    }

    protected static function get_taxonomy_options() {
        $taxonomies = get_object_taxonomies( 'project', 'objects' );
        if (empty($taxonomies)) {
            return [];
        }

        $options = [];
        foreach ( $taxonomies as $key => $taxonomy ) {
            if ( $taxonomy->public ) {
                $options[$key] = $taxonomy->label;
            }
        }

        return $options;
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
            'show_option',
            [
                'label'   => esc_html__('Show Project', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => 'all',
                'options' => [
                    'all'  => esc_html__('All', 'antra'),
                    'select' => esc_html__('Select', 'antra'),
                ],
            ]
        );

        $repeater = new Repeater();

        $repeater->add_control(
            'choose_project',
            [
                'label'     => __('Project', 'antra'),
                'type'      => 'project',
                'multiple'    => false,
                'label_block' => true,
            ]
        );

        $this->add_control(
            'projects_list',
            [
                'label'       => esc_html__('Projects', 'antra'),
                'type'        => Controls_Manager::REPEATER,
                'fields'      => $repeater->get_controls(),
                'default' => [
                    [
                        'selected_icon' => '',
                    ],
                ],
                'condition' => [
                    'show_option' => 'select'
                ],
                'separator' => 'after'
            ]
        );

        $this->add_control(
            'limit',
            [
                'label'   => esc_html__('Posts Per Page', 'antra'),
                'type'    => Controls_Manager::NUMBER,
                'default' => 6,
            ]
        );

        $this->add_control(
            'paginate',
            [
                'label'   => esc_html__('Paginate', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => 'none',
                'options' => [
                    'none'       => esc_html__('None', 'antra'),
                    'pagination' => esc_html__('Pagination', 'antra'),
                    'loadmore' => esc_html__('Load More', 'antra'),
                ],
                'condition'          => [
                    'enable_carousel!' => 'yes'
                ],
            ]
        );

        $this->add_responsive_control(
            'paginate_margin',
            [
                'label'      => esc_html__('Paginate Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .pagination'      => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
                'condition' => [
                    'paginate!' => 'none',
                    'enable_carousel!' => 'yes'
                ]
            ]
        );

        $this->add_responsive_control(
            'paginate_align',
            [
                'label'        => esc_html__('Paginate Align', 'antra'),
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
                ],
                'selectors'  => [
                    '{{WRAPPER}} .antra-loadmore' => 'text-align: {{value}}',
                    '{{WRAPPER}} .pagination ul.page-numbers' => 'justify-content: {{value}}',
                ],
                'condition' => [
                    'paginate!' => 'none',
                    'enable_carousel!' => 'yes'
                ],
                'separator' => 'after'
            ]
        );

        $this->add_control(
            'orderby',
            [
                'label'   => esc_html__('Order By', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => 'date',
                'options' => [
                    'date'       => esc_html__('Date', 'antra'),
                    'id'         => esc_html__('Project ID', 'antra'),
                    'menu_order' => esc_html__('Menu Order', 'antra'),
                    'title'      => esc_html__('Project Title', 'antra'),
                    'rand'       => esc_html__('Random', 'antra'),
                ],
            ]
        );

        $this->add_control(
            'order',
            [
                'label'   => esc_html__('Order', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => 'desc',
                'options' => [
                    'asc'  => esc_html__('ASC', 'antra'),
                    'desc' => esc_html__('DESC', 'antra'),
                ],
                'separator' => 'after'
            ]
        );

        $this->add_control(
            'show_filter',
            [
                'type'    => Controls_Manager::SWITCHER,
                'label'       => esc_html('Show Filter Form', 'antra'),
                'prefix_class' => 'elementor-antra-show-filter-',
                'render_type' => 'template',
                'condition' => [
                    'enable_carousel!' => 'yes',
                    'show_option' => 'all'
                ]
            ]
        );

        $this->add_control(
            'taxonomies_filter',
            [
                'label'   => esc_html__('Choose Taxonomies Filter', 'antra'),
                'type'    => Controls_Manager::SELECT2,
                // 'default' => 'none',
                'options' => self::get_taxonomy_options(),
                'multiple' => true,
                'label_block' => true,
                'condition'          => [
                    'enable_carousel!' => 'yes',
                    'show_filter' => 'yes'
                ],
            ]
        );

        $this->add_control(
            'filter_title',
            [
                'label'       => __('Filter Title', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'default'     => '',
                'label_block' => true,
            ]
        );

        $this->add_control(
            'categories',
            [
                'label'       => esc_html__('Show in Categories', 'antra'),
                'type'        => Controls_Manager::SELECT2,
                'options'     => $this->get_project_categories(),
                'label_block' => true,
                'multiple'    => true,
                'condition' => [
                    'show_filter!' => 'yes'
                ],
            ]
        );

        $this->add_control(
            'cat_operator',
            [
                'label'     => esc_html__('Category Operator', 'antra'),
                'type'      => Controls_Manager::SELECT,
                'default'   => 'IN',
                'options'   => [
                    'AND'    => esc_html__('AND', 'antra'),
                    'IN'     => esc_html__('IN', 'antra'),
                    'NOT IN' => esc_html__('NOT IN', 'antra'),
                ],
                'condition' => [
                    'categories!' => '',
                    'show_filter!' => 'yes'
                ],
            ]
        );

        $this->add_control(
            'style',
            [
                'label'     => esc_html__('Block Style', 'antra'),
                'type'      => Controls_Manager::SELECT,
                'default'   => '1',
                'options'   => [
                    '1'  => esc_html__('Style 1', 'antra'),
                    '2'  => esc_html__('Style 2', 'antra'),
                    '3'  => esc_html__('Style 3', 'antra'),
                    '4'  => esc_html__('Style 4', 'antra'),
                    '5'  => esc_html__('Style 5', 'antra'),
                    '6'  => esc_html__('Style 6', 'antra'),
                ],
                'separator' => 'before'
            ]
        );

        $this->add_control(
            'button_text',
            [
                'label'       => __('Button Text', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'dynamic'     => [
                    'active' => true,
                ],
                'placeholder' => __('Typing some text ...', 'antra'),
                'default'     => __('View', 'antra'),
                'label_block' => true,
            ]
        );

        $this->add_control(
            'always_show_button',
            [
                'label'   => esc_html__('Always Show Button', 'antra'),
                'default' => '',
                'type'    => Controls_Manager::SWITCHER,
                'prefix_class' => 'antra-always-show-button-'
            ]
        );

        $this->add_control(
            'effect_image_insufficient',
            [
                'label'   => esc_html__('Effect Insufficient', 'antra'),
                'default' => 'yes',
                'type'    => Controls_Manager::SWITCHER,
                'condition' => [
                    'style' => '3',
                ],
                'prefix_class' => 'antra-effect-insufficient-image-'
            ]
        );

        $this->add_control(
            'show_index',
            [
                'label'   => esc_html__('Show Number', 'antra'),
                'default' => 'no',
                'type'    => Controls_Manager::SWITCHER,
            ]
        );

        $this->add_control(
            'scroll_sticky',
            [
                'label'   => esc_html__('Scroll Sticky', 'antra'),
                'default' => 'yes',
                'type'    => Controls_Manager::SWITCHER,
                'separator' => 'after',
                'condition' => [
                    'style' => '3',
                    'column' => '1',
                    'enable_carousel!' => 'yes',
                ],
                'prefix_class' => 'antra-scroll-sticky-'
            ]
        );

        $this->add_control(
            'scroll_offset',
            [
                'label'      => esc_html__('Sticky Offset', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 200,
                    ],
                ],
                'size_units' => ['px'],
                'condition' => [
                    'style' => '3',
                    'column' => '1',
                    'enable_carousel!' => 'yes',
                    'scroll_sticky' => 'yes',
                ],
                'render_type' => 'template'
            ]
        );

        $this->add_group_control(
            Elementor\Group_Control_Image_Size::get_type(),
            [
                'name'      => 'image_thumbnail',
                'default'   => 'medium_large',
                'exclude' => ['custom']
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_image_project_style',
            [
                'label' => esc_html__('Image', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_group_control(
            Group_Control_Background::get_type(),
            [
                'name'           => 'img_overlay',
                'label'          => __( 'Overlay', 'antra' ),
                'types'          => [ 'classic', 'gradient' ],
                'exclude' => [ 'image' ],
                'selector'       => '{{WRAPPER}} .project-block .project-image a::before',
            ]
        );

        $this->add_responsive_control(
            'image_height',
            [
                'label'      => esc_html__('Image Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 100,
                        'max' => 1000,
                    ],
                ],
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .project-image img' => 'height: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'img_border_radius',
            [
                'label'      => esc_html__('Border Radius', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .project-image img' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                    '{{WRAPPER}} .project-image ' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                    '{{WRAPPER}} .project-transition ' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_button_project_style',
            [
                'label' => esc_html__('Button', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'button_width',
            [
                'label'      => esc_html__('Width', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 100,
                        'max' => 1000,
                    ],
                ],
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn' => 'width: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'button_height',
            [
                'label'      => esc_html__('Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 100,
                        'max' => 1000,
                    ],
                ],
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn' => 'height: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'btn_typography',
                'selector' => '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn',
            ]
        );


        $this->start_controls_tabs('color_tabs');

        $this->start_controls_tab('colors_normal',
            [
                'label' => esc_html__('Normal', 'antra'),
            ]
        );

        $this->add_control(
            'button_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'button_background_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn'   => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'button_border_color',
            [
                'label'     => esc_html__('Border Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn'   => 'border-color: {{VALUE}};',
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
            'button_color_hover',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn:hover'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'button_background_color_hover',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn:hover'   => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'button_border_color_hover',
            [
                'label'     => esc_html__('Border Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn:hover'   => 'border-color: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_tab();

        $this->end_controls_tabs();

        $this->add_responsive_control(
            'button_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}}.elementor-widget-antra-project .project-block .view-btn' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_content_project_style',
            [
                'label' => esc_html__('Content', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'box_content_head',
            [
                'label'     => esc_html__('Box Content', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'none',
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
                    '{{WRAPPER}} .project-text-box' => 'text-align: {{value}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'box_height',
            [
                'label'      => esc_html__('Box Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 1000,
                    ],
                    '%'  => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .project-text-box' => 'min-height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'      => 'box_border',
                'selector'  => '{{WRAPPER}} .project-text-box',
            ]
        );

        $this->add_responsive_control(
            'box_content_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .project-text-box'      => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'box_content_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .project-text-box'      => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
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
                    '{{WRAPPER}} .project-text-box'      => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_location',
            [
                'label'     => esc_html__('Project Location', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );


        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'location_typography',
                'selector' => '{{WRAPPER}} .project-location',
            ]
        );

        $this->add_control(
            'location_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .project-location'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'location_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .project-location'      => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );


        $this->add_control(
            'box_title_head',
            [
                'label'     => esc_html__('Project Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );


        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'title_typography',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_PRIMARY,
                ],
                'selector' => '{{WRAPPER}} .project .project-block .project-loop-title',
            ]
        );

        $this->add_control(
            'title_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'global'    => [
                    'default' => Global_Colors::COLOR_SECONDARY,
                ],
                'selectors' => [
                    '{{WRAPPER}} .project-loop-title a'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'title_color_hover',
            [
                'label'     => esc_html__('Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .project-loop-title a:hover'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'      => 'title_border',
                'selector'  => '{{WRAPPER}} .project-loop-title',
                'separator' => 'before',
            ]
        );

        $this->add_responsive_control(
            'width_title',
            [
                'label'      => esc_html__('Width Title', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 1000,
                    ],
                    '%'  => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-item.project .project-block .project-loop-title' => 'max-width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'title_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-item.project .project-block .project-loop-title'      => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'title_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-item.project .project-block .project-loop-title'      => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_category',
            [
                'label'     => esc_html__('Project Category', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_responsive_control(
            'category_v',
            [
                'label'      => esc_html__('Vertical Position', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => -500,
                        'max' => 500,
                    ],
                    '%'  => [
                        'min' => -50,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-item.project .project-transition .project-category' => 'top: {{SIZE}}{{UNIT}}',
                     '{{WRAPPER}} .antra-item.project-style-5 .project-transition .project-category' => 'bottom: {{SIZE}}{{UNIT}}; top: unset;',
                ],
            ]
        );

        $this->add_responsive_control(
            'category_h',
            [
                'label'      => esc_html__('Horizontal Position', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => -1000,
                        'max' => 1000,
                    ],
                    '%'  => [
                        'min' => -50,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-item.project .project-transition .project-category' => 'left: {{SIZE}}{{UNIT}}',
                    '{{WRAPPER}} .antra-item.project-style-5 .project-transition .project-category' => 'right: {{SIZE}}{{UNIT}}; left:unset',
                ],
            ]
        );
        
        $this->end_controls_section();


        $this->get_controls_column(false, 3);

        $this->get_control_carousel(
            [
                'show_filter!' => 'yes',
                'paginate' => 'none',
            ]
        );
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
        $offset_sticky = !empty($settings['scroll_offset']['size']) ? $settings['scroll_offset']['size'] : 40;
        $this->add_render_attribute('_wrapper', 'data-sticky-offset', $offset_sticky);
        // echo '<pre>'; print_r($settings); echo '</pre>';
        $class = '';
        $atts  = [
            'limit'           => $settings['limit'],
            'columns'         => $settings['enable_carousel'] === 'yes' ? 1 : $settings['column'],
            'orderby'         => $settings['orderby'],
            'order'           => $settings['order'],
            'image_size'      => $settings['image_thumbnail_size'] ?? 'large',
            'show_index'      => 0,
            'button_text'     => empty($settings['button_text']) ? __('View', 'antra') : $settings['button_text']
        ];

        if (!empty($settings['show_index'])) {
            $atts['show_index'] = $settings['show_index'] === 'yes';
        }

        // Project Categories
        if (!empty($settings['categories'])) {
            $atts['taxonomy']     = 'project-category';
            $atts['category']     = implode(',', $settings['categories']);
            $atts['cat_operator'] = $settings['cat_operator'];
        }

        $class         .= ' elementor-project elementor-widget-render';
        $class         .= ' elementor-project-style' . $settings['style'];

        if (isset($settings['style']) && $settings['style'] !== '') {
            $atts['style'] = $settings['style'];
        }

        // Carousel
        if ($settings['enable_carousel'] === 'yes') {
            $atts['enable_carousel']   = 'yes';
            $atts['carousel_settings'] = $this->get_swiper_navigation_for_project();
            $class                     = ' antra-swiper-wrapper swiper';
        }
        if ($settings['paginate'] !== 'none' && $settings['enable_carousel'] !== 'yes') {
            $atts['paginate'] = true;
            $atts['paginate_type'] = empty($settings['paginate']) ? 'pagination' : $settings['paginate'];
        }
        $atts['class'] = $class;

        $classes = [];
        if (isset($settings['show_option']) && $settings['show_option'] == 'select') {
            if (!empty($settings['projects_list'])) {
                $ids = [];
                foreach ($settings['projects_list'] as $item) {
                    if (empty($item['choose_project'])) {
                        continue;
                    }
                    $id = absint($item['choose_project']);
                    if (!in_array($id, $ids)) {
                        $ids[] = $id;
                        $classes[$id] = ' elementor-repeater-item-'.$item['_id'];
                    }
                }
                if (!empty($ids)) {
                    $atts['ids'] = implode(',', $ids);
                }
            }
        }

        if (isset($settings['show_filter']) && $settings['show_filter'] === 'yes') {
            if (!empty($settings['taxonomies_filter'])) {
                $filter_title = $settings['filter_title'] ?? '';
                $this->render_form_filter($settings['taxonomies_filter'], $filter_title);
            }
        }
        $this->get_query_var_term($atts);

        echo (new Antra_Posttype('project', $atts))->get_content(); // WPCS: XSS ok
    }

    protected function get_query_var_term(&$atts) {
        $taxonomy_options = self::get_taxonomy_options();
        $terms_query = [];
        foreach ($taxonomy_options as $taxonomy => $label) {
            if (!empty($_GET[$taxonomy])) {
                $terms_query[$taxonomy] = [
                    'terms' => sanitize_text_field($_GET[$taxonomy]),
                    'operator' => 'IN'
                ];
            }
        }
        
        if (empty($terms_query)) {
            return;
        }

        $atts['taxs_query'] = [
            'terms_query' => $terms_query
        ];
    }

    protected function render_form_filter($taxonomies, $filter_title = '') {
        $taxonomy_options = self::get_taxonomy_options();
        $list_field = '';
        foreach ($taxonomies as $taxonomy) {
            $terms = get_terms([
                'taxonomy' => $taxonomy,
                'hide_empty' => true
            ]);

            if (empty($terms)) {
                continue;
            }
            if (!isset($taxonomy_options[$taxonomy])) {
                continue;
            }

            $label_tax = $taxonomy_options[$taxonomy];

            $options = sprintf(
                '<option value="">%s %s</option>', 
                esc_html__('All', 'antra'),
                esc_html($label_tax),
            );
            foreach ($terms as $term) {
                $term_slug = $term->slug;
                $term_name = $term->name;
                $options .= sprintf(
                    '<option value="%s">%s</option>',
                    esc_attr($term_slug),
                    esc_attr($term_name),
                );
            }

            if (empty($filter_title)) {
                $filter_title = sprintf(__('Filter By %s', 'antra'), ucfirst(esc_html($label_tax)));
            }
            $list_field .= sprintf(
                '<div class="field-wrapper">
                    <div class="field-inner">
                        <label class="field-label">%s</label>
                        <select class="fitler-field" name="%s">%s</select>
                    </div>
                </div>',
                esc_html($filter_title),
                esc_attr($taxonomy),
                $options
            );
        }

        if (empty($list_field)) {
            return;
        }
        ?>
        <form class="filter-form" id="filter-form-<?php echo esc_attr($this->get_id()) ?>">
            <?php printf('%s', $list_field); ?>
            <div class="wrapper-button-submit">
                <button type="button" id="submit-filter-<?php echo esc_attr($this->get_id()) ?>" class="submit-filter btn-slip-effect">
                    <span class="elementor-button-content-wrapper">
                        <span class="hover-text" data-text="<?php echo esc_attr('Filter', 'antra') ?>">
                            <span><?php echo esc_html('Filter', 'antra') ?></span>
                        </span>
                        <i aria-hidden="true" class="antra-icon-arrow-right"></i>
                    </span>
                </button>
            </div>
        </form>
        <?php
    }

    protected function get_swiper_navigation_for_project() {
        $settings = $this->get_settings_for_display();
        if ($settings['enable_carousel'] != 'yes') {
            return;
        }
        $settings_navigation = '';
        $show_dots           = (in_array($settings['navigation'], ['dots', 'both']));
        $show_arrows         = (in_array($settings['navigation'], ['arrows', 'both']));


        if ($show_dots) {
            $settings_navigation .= '<div class="swiper-pagination swiper-pagination-' . $this->get_id() . '"></div>';
        }
        if ($show_arrows && $settings['custom_navigation'] != 'yes') {
            $settings_navigation .= '<div class="elementor-swiper-button elementor-swiper-button-prev elementor-swiper-button-prev-' . $this->get_id() . '">';
            $settings_navigation .= $this->render_swiper_button('previous', true);
            $settings_navigation .= '<span class="elementor-screen-only">' . esc_html__('Previous', 'antra') . '</span>';
            $settings_navigation .= '</div>';
            $settings_navigation .= '<div class="elementor-swiper-button elementor-swiper-button-next elementor-swiper-button-next-' . $this->get_id() . '">';
            $settings_navigation .= $this->render_swiper_button('next', true);
            $settings_navigation .= '<span class="elementor-screen-only">' . esc_html__('Next', 'antra') . '</span>';
            $settings_navigation .= '</div>';
        }
        return $settings_navigation;
    }

    protected function get_project_categories() {
        $categories = get_terms(array(
                'taxonomy'   => 'project-category',
                'hide_empty' => false,
            )
        );
        $results    = array();
        if (!is_wp_error($categories)) {
            foreach ($categories as $category) {
                $results[$category->slug] = $category->name;
            }
        }

        return $results;
    }
}

$widgets_manager->register(new Antra_Elementor_Widget_Project());

add_action('elementor/element/antra-project/section_swiperjs_options/before_section_end', function ($element, $args) {
    $element->add_control(
        'stagger_item',
        [
            'label'   => esc_html__('Stagger Items', 'antra'),
            'default' => '',
            'type'    => Controls_Manager::SWITCHER,
            'separator' => 'before',
            'condition' => [
                'enable_carousel' => 'yes'
            ]
        ],
        [
            'position' => [
                'type' => 'control',
                'at' => 'after',
                'of' => 'enable_carousel',
            ]
        ]
    );

    $element->add_responsive_control(
        'stagger_offset',
        [
            'label'      => esc_html__('Stagger Offset', 'antra'),
            'type'       => Controls_Manager::SLIDER,
            'range'      => [
                'px' => [
                    'min' => 0,
                    'max' => 500,
                ],
            ],
            'size_units' => ['px'],
            'separator' => 'after',
            'condition' => [
                'enable_carousel' => 'yes',
                'stagger_item' => 'yes',
            ],
            'selectors'  => [
                '{{WRAPPER}} .antra-item.swiper-slide:nth-child(2n)' => 'padding-top: {{SIZE}}{{UNIT}}',
            ],
        ],
        [
            'position' => [
                'type' => 'control',
                'at' => 'after',
                'of' => 'stagger_item',
            ]
        ]
    );
}, 10, 2);

