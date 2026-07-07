<?php
namespace Antra\Elementor;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('project')) {
    return;
}

use Elementor\Controls_Manager;
use Elementor\Group_Control_Image_Size;
use Antra\Elementor\Antra_Video_Popup;

class Antra_Elementor_Project_Video extends Antra_Video_Popup {

    public function get_name() {
        return 'antra-project-video';
    }

    public function get_title() {
        return esc_html__('Antra Project Video', 'antra');
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
        $video_url = get_post_meta($project_id, '_project_video', true);
        if (!empty($video_url)) {
            $settings['video_link'] = esc_url($video_url);
            $this->handle_render($settings);
        } else {
            ?><pre><?php _e('Please add the YouTube video URL for the project!', 'antra'); ?></pre><?php
        }
    }

}

$widgets_manager->register(new Antra_Elementor_Project_Video());

add_action('elementor/element/antra-project-video/section_videos/before_section_end', function ($element, $args) {
    $element->remove_control('video_link');
}, 10, 2);

add_action('elementor/element/antra-project-video/section_videos/after_section_start', function ($element, $args) {
    $element->add_control(
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

    $element->add_control(
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
}, 10, 2);
