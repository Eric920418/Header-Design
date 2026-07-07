<?php

use Elementor\Controls_Manager;

add_action('elementor/element/heading/section_title/before_section_end', function ($element, $args) {
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

add_action('elementor/widget/before_render_content', function ($element) {
    if ($element->get_name() != 'heading') {
        return;
    }

    $settings = $element->get_settings_for_display();
    if (!empty($settings['mouse_cursor'])) {
        $element->add_render_attribute('title', 'data-cursor', '-' . sanitize_title($settings['mouse_cursor']));
        if ($settings['mouse_cursor'] == 'text') {
            $element->add_render_attribute('title', 'data-cursor-text', !empty($settings['cursor_text']) ? $settings['cursor_text'] : __('View', 'antra'));
        }
    }

});


class Antra_Elementor_Heading_Widget_Override extends Elementor\Widget_Heading {

    /**
	 * Render heading widget output in the editor.
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
$widgets_manager->register(new Antra_Elementor_Heading_Widget_Override());