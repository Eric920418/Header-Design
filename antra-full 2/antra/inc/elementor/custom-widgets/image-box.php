<?php

use Elementor\Control_Media;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Border;
use Elementor\Group_Control_Box_Shadow;
use Elementor\Group_Control_Image_Size;
use Elementor\Group_Control_Typography;
use Elementor\Group_Control_Text_Shadow;
use Elementor\Utils;
use Elementor\Widget_Image_Box;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;

add_action('elementor/element/image-box/section_style_box/before_section_end', function ($element, $args) {
    $element->add_control(
        'background_color',
        [
            'label'     => esc_html__('Background Color', 'antra'),
            'type'      => Controls_Manager::COLOR,
            'default'   => '',
            'selectors' => [
                '{{WRAPPER}} .elementor-image-box-wrapper ' => 'background-color: {{VALUE}};',
            ],
            'separator' => 'before',
        ]
    );

    $element->add_control(
        'background_color_hover',
        [
            'label'     => esc_html__('Background Color Hover', 'antra'),
            'type'      => Controls_Manager::COLOR,
            'default'   => '',
            'selectors' => [
                '{{WRAPPER}} .elementor-image-box-wrapper:hover ' => 'background-color: {{VALUE}};',
            ],
        ]
    );

    $element->add_responsive_control(
        'box_padding',
        [
            'label' => esc_html__( 'Padding', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', 'em', '%' ],
            'selectors' => [
                '{{WRAPPER}} .elementor-image-box-wrapper' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ]
    );

    $element->add_responsive_control(
        'box_border_radius',
        [
            'label' => esc_html__( 'Border radius', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', '%', 'em', 'rem', 'vw', 'custom' ],
            'selectors' => [
                '{{WRAPPER}} .elementor-image-box-wrapper ' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ],
    );


}, 10, 2);

add_action('elementor/element/image-box/section_style_image/before_section_end', function ($element, $args) {

    $element->add_control(
        'heading_image_box_shadow',
        [
            'label' => esc_html__( 'Image Box Shadow', 'antra' ),
            'type' => Controls_Manager::HEADING,
            'separator' => 'before',
        ]
    );

    // $element->add_group_control(
    //     Group_Control_Box_Shadow::get_type(),
    //     [
    //         'name' => 'image_box_shadow',
    //         'label' => esc_html__( 'Box Shadow', 'antra' ),
    //         'exclude' => [
    //             'box_shadow_position',
    //         ],
    //         'selector' => '{{WRAPPER}} .elementor-image-box-img img',
    //     ],
    // );

    $element->add_group_control(
        Group_Control_Box_Shadow::get_type(),
        [
            'name' => 'image_box_shadow_hover',
            'label' => esc_html__( 'Box Shadow Hover', 'antra' ),
            'exclude' => [
                'box_shadow_position',
            ],
            'selector' => '{{WRAPPER}} .elementor-image-box-wrapper:hover .elementor-image-box-img img',
        ],
    );

}, 10, 2);

add_action('elementor/element/image-box/section_style_content/before_section_end', function ($element, $args) {
    $element->add_control(
        'title_color_hover',
        [
            'label'     => esc_html__('Hover Title', 'antra'),
            'type'      => Controls_Manager::COLOR,
            'default'   => '',
            'selectors' => [
                '{{WRAPPER}} .elementor-image-box-wrapper:hover .elementor-image-box-title ' => 'color: {{VALUE}};',
                '{{WRAPPER}} .elementor-image-box-wrapper:hover .elementor-image-box-title a ' => 'color: {{VALUE}};',
            ],
            'separator' => 'before',
        ]
    );
    $element->add_responsive_control(
        'content_padding',
        [
            'label' => esc_html__( 'Content padding', 'antra' ),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => [ 'px', 'em', '%' ],
            'selectors' => [
                '{{WRAPPER}} .elementor-image-box-wrapper .elementor-image-box-content' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
            ],
        ]
    );
    $element->add_control(
        'background_text_heading',
        [
            'label' => esc_html__( 'Background Text', 'antra' ),
            'type' => Controls_Manager::HEADING,
            'separator' => 'before',
        ]
    );

    $element->add_group_control(
        Group_Control_Typography::get_type(),
        [
            'name' => 'background_text_typography',
            'selector' => '{{WRAPPER}} .elementor-image-box-background-text',
        ]
    );

    $element->add_control(
        'background_text_color',
        [
            'label' => esc_html__( 'Color', 'antra' ),
            'type' => Controls_Manager::COLOR,
            'default' => '',
            'selectors' => [
                '{{WRAPPER}} .elementor-image-box-background-text' => 'color: {{VALUE}};',
            ],
            'global' => [
                'default' => Global_Colors::COLOR_TEXT,
            ],
        ]
    );

    $element->add_responsive_control('background_text_horizontal_position',
        [
            'label'      => esc_html__('Horizontal Position', 'antra'),
            'type'       => Controls_Manager::SLIDER,
            'size_units' => ['px', 'em', '%'],
            'range'      => [
                'px' => [
                    'min' => 0,
                    'max' => 200,
                ],
                'em' => [
                    'min' => 0,
                    'max' => 20,
                ],
            ],
            'selectors'  => [
                '{{WRAPPER}} .elementor-image-box-background-text ' => 'right: {{SIZE}}{{UNIT}}'
            ],
        ]
    );

    $element->add_responsive_control('background_text_vertical_position',
        [
            'label'      => esc_html__('Vertical Position', 'antra'),
            'type'       => Controls_Manager::SLIDER,
            'size_units' => ['px', 'em', '%'],
            'range'      => [
                'px' => [
                    'min' => 0,
                    'max' => 200,
                ],
                'em' => [
                    'min' => 0,
                    'max' => 20,
                ],
            ],
            'selectors'  => [
                '{{WRAPPER}} .elementor-image-box-background-text ' => 'bottom: {{SIZE}}{{UNIT}}'
            ],
        ]
    );


}, 10, 2);

add_action('elementor/element/image-box/section_image/before_section_end', function ($element, $args) {

    $element->add_control(
        'background_text',
        [
            'label'     => esc_html__('Background Text', 'antra'),
            'type' => Controls_Manager::TEXT,
            'dynamic' => [
                'active' => true,
            ],
            'default' => '',
            'placeholder' => esc_html__( 'Enter your background text', 'antra' ),
            'label_block' => true,
        ],
        [
            'position' => [
                'type' => 'control',
                'at' => 'after',
                'of' => 'description_text',
            ]
        ]
    );

}, 10, 2);

class Antra_Elementor_Image_Box extends Widget_Image_Box {
    /**
	 * Render image box widget output on the frontend.
	 *
	 * Written in PHP and used to generate the final HTML.
	 *
	 * @since 1.0.0
	 * @access protected
	 */
	protected function render() {
		$settings = $this->get_settings_for_display();

		$has_image = ! empty( $settings['image']['url'] );
		$has_content = ! Utils::is_empty( $settings['title_text'] ) || ! Utils::is_empty( $settings['description_text'] );

		if ( ! $has_image && ! $has_content ) {
			return;
		}

		$html = '<div class="elementor-image-box-wrapper">';

		if ( ! empty( $settings['link']['url'] ) ) {
			$this->add_link_attributes( 'link', $settings['link'] );
		}

		if ( $has_image ) {

			$image_html = wp_kses_post( Group_Control_Image_Size::get_attachment_image_html( $settings, 'thumbnail', 'image' ) );

			if ( ! empty( $settings['link']['url'] ) ) {
				$image_html = '<a ' . $this->get_render_attribute_string( 'link' ) . ' tabindex="-1">' . $image_html . '</a>';
			}

			$html .= '<figure class="elementor-image-box-img">' . $image_html . '</figure>';
		}

		if ( $has_content ) {
			$html .= '<div class="elementor-image-box-content">';

			if ( ! Utils::is_empty( $settings['title_text'] ) ) {
				$this->add_render_attribute( 'title_text', 'class', 'elementor-image-box-title' );

				$this->add_inline_editing_attributes( 'title_text', 'none' );

				$title_html = $settings['title_text'];

				if ( ! empty( $settings['link']['url'] ) ) {
					$title_html = '<a ' . $this->get_render_attribute_string( 'link' ) . '>' . $title_html . '</a>';
				}

				$html .= sprintf( '<%1$s %2$s>%3$s</%1$s>', Utils::validate_html_tag( $settings['title_size'] ), $this->get_render_attribute_string( 'title_text' ), $title_html );
			}

			if ( ! Utils::is_empty( $settings['description_text'] ) ) {
				$this->add_render_attribute( 'description_text', 'class', 'elementor-image-box-description' );

				$this->add_inline_editing_attributes( 'description_text' );

				$html .= sprintf( '<p %1$s>%2$s</p>', $this->get_render_attribute_string( 'description_text' ), $settings['description_text'] );
			}

			$html .= '</div>';
		}

        if ( ! Utils::is_empty( $settings['background_text'] ) ) {
            $this->add_render_attribute( 'background_text', 'class', 'elementor-image-box-background-text' );

            $this->add_inline_editing_attributes( 'background_text' );

            $html .= sprintf( '<span %1$s>%2$s</span>', $this->get_render_attribute_string( 'background_text' ), $settings['background_text'] );
        }


		$html .= '</div>';

		Utils::print_unescaped_internal_string( $html );
	}

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
$widgets_manager->register(new Antra_Elementor_Image_Box());
