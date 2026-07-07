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
use Elementor\Group_Control_Text_Stroke;
use Antra\Elementor\Antra_Group_Control_Typography;

/**
 * Elementor tabs widget.
 *
 * Elementor widget that displays vertical or horizontal tabs with different
 * pieces of content.
 *
 * @since 1.0.0
 */
class Antra_Elementor_Widget_Project_Gallery extends Antra_Base_Widgets {


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
        return 'antra-project-gallery';
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
        return esc_html__('Antra Project Gallery', 'antra');
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
        return 'eicon-slider-push';
    }

    public function get_script_depends() {
        return ['antra-elementor-project-gallery', 'antra-fancybox'];
    }

    public function get_style_depends() {
        return ['antra-fancybox'];
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
            'style',
            [
                'label'        => esc_html__('Style', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'render_type'        => 'template',
                'default'      => 'slideshow',
                'options'      => [
                    'slideshow' => __('Slideshow', 'antra'),
                    'grid' => __('Grid', 'antra'),
                    'mansory' => __('Masonry', 'antra'),
                ],
                'prefix_class' => 'project-gallery-style-'
            ]
        ); 
                
        $this->end_controls_section();

        $this->start_controls_section(
            'section_content_project_style',
            [
                'label' => esc_html__('Gallery', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'img_height',
            [
                'label'      => esc_html__('Image Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 500,
                    ],
                ],
                'size_units' => ['px'],
                'selectors'  => [
                    '{{WRAPPER}}' => '--gallery-height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'bar_border_radius',
            [
                'label'      => esc_html__('Image Radius', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-wrapper .project-slideshow-inner img' => 'border-radius: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}} .project-slideshow-item.last-item .project-gallery-viewmore' => 'border-radius: {{SIZE}}{{UNIT}};',
                ],
            ]
        );
        
        $this->end_controls_section();

        $this->get_controls_column();
        // Carousel Option

        $carousel_condition = [
            'style' => 'slideshow'
        ];
        $this->get_control_carousel($carousel_condition, true);
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

        $gallery = get_post_meta( $project_id, '_project_gallery', 1 );
        
        if (has_post_thumbnail($project_id)) {
            $thumb_id = get_post_thumbnail_id($project_id);
            $thumb_url = get_the_post_thumbnail_url($project_id,'full');
            if (empty($gallery)) {
                $gallery = [$thumb_id => $thumb_url];
            } else {
                $gallery[$thumb_id] = $thumb_url;
            }
        }

        if (!empty($gallery)) {
            $style = empty($settings['style']) ? 'slideshow' : $settings['style'];
            $count = count((array) $gallery);
            if ($style == 'slideshow') {
                $swiper_pagination = $this->get_swiper_navigation($count, false);
            }
            $inner_class = 'elementor-widget-inner';
            if ($count < 2) {
                $inner_class .= ' single-gallery';
            }
            echo '<div class="'.$inner_class.'" data-viewmore="'.__('View more', 'antra').'">';
                get_template_part('template-parts/project/gallery/'.$style, '', [
                    'project_id' => $project_id,
                    'gallery' => $gallery,
                    'swiper_pagination' => $swiper_pagination ?? ''
                ]);
            echo '</div>';
        } else {
            ?><pre><?php _e('Please add the gallery for this project!', 'antra'); ?></pre><?php
        }
    }

    protected function get_controls_column($condition = false, $default = 4) {
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
                'default'            => $default,
                'options'            => [
                    '' => esc_html__('Default', 'antra'),
                ] + $column,
                'frontend_available' => true,
                'render_type'        => 'template',
                'prefix_class'       => 'antra-list-template elementor-grid%s-',
                'selectors'          => [
                    '{{WRAPPER}}' => '--e-global-column-to-show: {{VALUE}}',
                ],
                'condition'          => [
                    'style!' => 'mansory',
                ],
            ]
        );

        $this->add_control(
            'column_mansory',
            [
                'label'              => esc_html__('Columns', 'antra'),
                'type'               => Controls_Manager::HIDDEN,
                'default'            => 4,
                'frontend_available' => true,
                'prefix_class'       => 'antra-list-template elementor-grid-',
                'selectors'          => [
                    '{{WRAPPER}}' => '--e-global-column-to-show: {{VALUE}}',
                ],
                'condition'          => [
                    'style' => 'mansory',
                ],
            ]
        );

        $this->add_responsive_control(
            'column_spacing_swiper',
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
                'condition'          => [
                    'enable_carousel' => 'yes',
                    'style' => 'slideshow',
                ],
                'frontend_available' => true,
                'render_type'        => 'template',
                'separator'          => 'after',
                'selectors'          => [
                    '{{WRAPPER}} .swiper-slide' => '--grid-column-gap: {{SIZE}}{{UNIT}}; --grid-row-gap: {{SIZE}}{{UNIT}};',
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
                'condition'          => [
                    'style!' => 'slideshow',
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

$widgets_manager->register(new Antra_Elementor_Widget_Project_Gallery());
