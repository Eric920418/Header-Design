<?php

use Elementor\Control_Media;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Border;
use Elementor\Icons_Manager;
use Elementor\Utils;
use Elementor\Widget_Icon_Box;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;

add_action( 'elementor/element/icon-box/section_icon/after_section_end', function ($element, $args ) {

    $element->update_control( 'shape', [
        'options' => [
            'circle' => esc_html__( 'Circle', 'antra' ),
            'square' => esc_html__( 'Square', 'antra' ),
            'dashed-circle' => esc_html__( 'Dashed Circle', 'antra' ),
        ],
    ] );

}, 10, 2 );

add_action('elementor/element/icon-box/section_icon/before_section_end', function ($element, $args) {
    $element->add_responsive_control(
        'icon-line-gradient-color',
        [
            'label' => esc_html__('Icon gradient color', 'antra'),
            'type'         => Controls_Manager::SWITCHER,
            'prefix_class' => 'show-line-gradient-color-',
        ]
    );
}, 10, 2);


add_action('elementor/element/icon-box/section_style_content/before_section_end', function ($element, $args) {
	$element->add_control(
		'icon_box_title_hover',
		[
			'label'     => esc_html__('Color Title Hover', 'antra'),
			'type'      => Controls_Manager::COLOR,
			'default'   => '',
			'selectors' => [
				'{{WRAPPER}} .elementor-icon-box-wrapper:hover .elementor-icon-box-content .elementor-icon-box-title' => 'color: {{VALUE}};',
			],
            'separator'    => 'before',
		]
	);
}, 10, 2);

add_action('elementor/element/icon-box/section_style_content/before_section_end', function ($element, $args) {
    $element->add_responsive_control(
        'icon_box_title_margin',
        [
            'label' => esc_html__('Title Margin', 'antra'),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => ['px', 'em'],
            'selectors' => [
                '{{WRAPPER}} .elementor-icon-box-title' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
            ],
        ]
    );
}, 10, 2);

add_action('elementor/element/icon-box/section_style_content/before_section_end', function ($element, $args) {
    $element->add_responsive_control(
        'icon_box_description_margin',
        [
            'label' => esc_html__('Description Margin', 'antra'),
            'type' => Controls_Manager::DIMENSIONS,
            'size_units' => ['px', 'em'],
            'selectors' => [
                '{{WRAPPER}} .elementor-icon-box-description' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
            ],
        ]
    );
}, 10, 2);

class Antra_Elementor_Icon_Box extends Widget_Icon_Box {

    public function get_script_depends() {
        return ['antra-elementor-icon-box'];
    }

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

    		$this->add_render_attribute( 'icon', 'class', [ 'elementor-icon', 'elementor-animation-' . $settings['hover_animation'] ] );

    		$icon_tag = 'span';

    		if ( ! isset( $settings['icon'] ) && ! Icons_Manager::is_migration_allowed() ) {
    			// add old default
    			$settings['icon'] = 'fa fa-star';
    		}

    		$has_icon = ! empty( $settings['icon'] );

    		if ( ! empty( $settings['link']['url'] ) ) {
    			$icon_tag = 'a';

    			$this->add_link_attributes( 'link', $settings['link'] );
    		}

    		if ( $has_icon ) {
    			$this->add_render_attribute( 'i', 'class', $settings['icon'] );
    			$this->add_render_attribute( 'i', 'aria-hidden', 'true' );
    		}

    		$this->add_render_attribute( 'description_text', 'class', 'elementor-icon-box-description' );

    		$this->add_inline_editing_attributes( 'title_text', 'none' );
    		$this->add_inline_editing_attributes( 'description_text' );
    		if ( ! $has_icon && ! empty( $settings['selected_icon']['value'] ) ) {
    			$has_icon = true;
    		}
    		$migrated = isset( $settings['__fa4_migrated']['selected_icon'] );
    		$is_new = ! isset( $settings['icon'] ) && Icons_Manager::is_migration_allowed();

    		?>
    		<div class="elementor-icon-box-wrapper">
    			<?php if ( $has_icon ) : ?>
    			<div class="elementor-icon-box-icon">
    				<<?php Utils::print_validated_html_tag( $icon_tag ); ?> <?php $this->print_render_attribute_string( 'icon' ); ?> <?php $this->print_render_attribute_string( 'link' ); ?>>
    				<?php
    				if ( $is_new || $migrated ) {
    					Icons_Manager::render_icon( $settings['selected_icon'], [ 'aria-hidden' => 'true' ] );
    				} elseif ( ! empty( $settings['icon'] ) ) {
    					?><i <?php $this->print_render_attribute_string( 'i' ); ?>></i><?php
    				}
    				?>




    				</<?php Utils::print_validated_html_tag( $icon_tag ); ?>>

    			</div>
    			<?php endif; ?>
    			<div class="elementor-icon-box-content">
    				<<?php Utils::print_validated_html_tag( $settings['title_size'] ); ?> class="elementor-icon-box-title">
    					<<?php Utils::print_validated_html_tag( $icon_tag ); ?> <?php $this->print_render_attribute_string( 'link' ); ?> <?php $this->print_render_attribute_string( 'title_text' ); ?>>
    						<?php $this->print_unescaped_setting( 'title_text' ); ?>
    					</<?php Utils::print_validated_html_tag( $icon_tag ); ?>>
    				</<?php Utils::print_validated_html_tag( $settings['title_size'] ); ?>>
    				<?php if ( ! Utils::is_empty( $settings['description_text'] ) ) : ?>
    					<p <?php $this->print_render_attribute_string( 'description_text' ); ?>>
    						<?php $this->print_unescaped_setting( 'description_text' ); ?>
    					</p>
    				<?php endif; ?>
    			</div>

    		</div>
    		<?php
    	}

    	/**
    	 * Render icon box widget output in the editor.
    	 *
    	 * Written as a Backbone JavaScript template and used to generate the live preview.
    	 *
    	 * @since 2.9.0
    	 * @access protected
    	 */
    	protected function content_template() {
    		?>
    		<#
    		var link = settings.link.url ? 'href="' + settings.link.url + '"' : '',
    			iconTag = link ? 'a' : 'span',
    			iconHTML = elementor.helpers.renderIcon( view, settings.selected_icon, { 'aria-hidden': true }, 'i' , 'object' ),
    			migrated = elementor.helpers.isIconMigrated( settings, 'selected_icon' );

    		view.addRenderAttribute( 'description_text', 'class', 'elementor-icon-box-description' );

    		view.addInlineEditingAttributes( 'title_text', 'none' );
    		view.addInlineEditingAttributes( 'description_text' );
    		#>
    		<div class="elementor-icon-box-wrapper">
    			<?php // settings.icon is needed for older version ?>
    			<# if ( settings.icon || settings.selected_icon.value ) { #>
    			<div class="elementor-icon-box-icon">
    				<{{{ iconTag + ' ' + link }}} class="elementor-icon elementor-animation-{{ settings.hover_animation }}">
    					<# if ( iconHTML && iconHTML.rendered && ( ! settings.icon || migrated ) ) { #>
    						{{{ iconHTML.value }}}
    						<# } else { #>
    							<i class="{{ settings.icon }}" aria-hidden="true"></i>
    						<# } #>
    				</{{{ iconTag }}}>
    			</div>
    			<# } #>
    			<div class="elementor-icon-box-content">
    				<# var titleSizeTag = elementor.helpers.validateHTMLTag( settings.title_size ); #>
    				<{{{ titleSizeTag }}} class="elementor-icon-box-title">
    					<{{{ iconTag + ' ' + link }}} {{{ view.getRenderAttributeString( 'title_text' ) }}}>{{{ settings.title_text }}}</{{{ iconTag }}}>
    				</{{{ titleSizeTag }}}>
    				<# if ( settings.description_text ) { #>
    				<p {{{ view.getRenderAttributeString( 'description_text' ) }}}>{{{ settings.description_text }}}</p>
    				<# } #>
    			</div>
    		</div>
    		<?php
    	}

}

$widgets_manager->register(new Antra_Elementor_Icon_Box());
