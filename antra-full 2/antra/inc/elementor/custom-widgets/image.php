<?php

use Elementor\Controls_Manager;

add_action('elementor/element/image/section_image/before_section_end', function ($element, $args) {
    $element->add_control(
        'mouse_cursor',
        [
            'label'        => __('Mouse Cursor Effect', 'antra'),
            'type'         => Controls_Manager::SELECT,
            'default'      => '',
            'options'      => [
                '' => __('None', 'antra'),
                'opaque' => __('Opaque', 'antra'),
                'text' => __('Text', 'antra'),
            ],
            'render_type' => 'template'
        ]
    );

    $element->add_control(
        'cursor_text',
        [
            'label'       => esc_html__('Cursor Text', 'antra'),
            'type'        => Controls_Manager::TEXT,
            'dynamic'     => [
                'active' => true,
            ],
            'placeholder' => esc_html__('Typing some things...', 'antra'),
            'default'     => 'View',
            'condition' => [
                'mouse_cursor' => 'text'
            ]
        ]
    );
}, 10, 2);

add_filter('elementor/widget/render_content', function ($widget_content, $element) {
    if ($element->get_name() != 'image') {
        return $widget_content;
    }

    $settings = $element->get_settings_for_display();
    $element->add_render_attribute('wrapper_image', 'class', 'antra-wrapper-image-widget');
    if (!empty($settings['mouse_cursor'])) {
        $element->add_render_attribute('wrapper_image', 'data-cursor', '-' . sanitize_title($settings['mouse_cursor']));
        if ($settings['mouse_cursor'] == 'text') {
            $element->add_render_attribute('wrapper_image', 'data-cursor-text', !empty($settings['cursor_text']) ? $settings['cursor_text'] : __('View', 'antra'));
        }
    }

    return '<div '.$element->get_render_attribute_string( 'wrapper_image' ).'>' . $widget_content . '</div>';
}, 99, 2);


class Antra_Elementor_Image_Widget_Override extends Elementor\Widget_Image {

    /**
	 * Render image box widget output in the editor.
	 *
	 * Written as a Backbone JavaScript template and used to generate the live preview.
	 *
	 * @since 2.9.0
	 * @access protected
	 */
	protected function content_template() {
        return;
    }
}
$widgets_manager->register(new Antra_Elementor_Image_Widget_Override());