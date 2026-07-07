<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('project')) {
    return;
}

use Elementor\Controls_Manager;
use Elementor\Group_Control_Image_Size;

class Antra_Elementor_Project_Thumbnail extends Elementor\Widget_Base {

    public function get_name() {
        return 'antra-project-thumbnails';
    }

    public function get_title() {
        return esc_html__('Antra Project Thumbnail', 'antra');
    }

    public function get_icon() {
        return 'eicon-image';
    }

    public function get_categories() {
        return array('antra-addons');
    }


    protected function register_controls() {
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

        $this->end_controls_section();

        $this->start_controls_section(
            'section_config',
            [
                'label' => esc_html__('Style', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE
            ]
        );

        $this->add_group_control(
            Group_Control_Image_Size::get_type(),
            [
                'name'      => 'thumbnails',
                'separator' => 'none',
                'default'   => 'post-thumbnail'
            ]
        );

        $this->add_responsive_control(
            'imgage_border_radius',
            [
                'label' => esc_html__( 'Border Radius', 'antra' ),
                'type' => Controls_Manager::DIMENSIONS,
                'size_units' => [ 'px', '%' ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-post-thumbnail img' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'image_width',
            [
                'label'      => esc_html__('Image Width', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 100,
                        'max' => 1000,
                    ],
                    '%' => [
                        'min' => 5,
                        'max' => 100,
                    ],
                    'vw' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px','%', 'vw'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-post-thumbnail img' => 'width: {{SIZE}}{{UNIT}}',
                ],
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
                    '%' => [
                        'min' => 5,
                        'max' => 100,
                    ],
                    'vh' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%', 'vh'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-post-thumbnail img' => 'height: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->end_controls_section();
    }

    public function render() {
        $settings = $this->get_settings_for_display();
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

        if (has_post_thumbnail($project_id)) {

            $settings['thumbnails']['id']  = get_post_thumbnail_id($project_id);
            $settings['thumbnails']['url'] = get_the_post_thumbnail_url($project_id);
            echo '<div class="elementor-post-thumbnail">';
            Group_Control_Image_Size::print_attachment_image_html($settings, 'thumbnails');
            echo '</div>';
        } else {
            ?><pre><?php _e('Please add the thumbnail for this project!', 'antra'); ?></pre><?php
        }
    }

}

$widgets_manager->register(new Antra_Elementor_Project_Thumbnail());