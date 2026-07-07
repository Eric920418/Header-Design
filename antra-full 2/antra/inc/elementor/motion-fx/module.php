<?php

use Elementor\Element_Base;
use Elementor\Element_Column;
use Elementor\Element_Section;
use Elementor\Core\Base\Module as Module_Base;

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

class Antra_Elementor_MotionFX {

	public function __construct() {
		$this->add_actions();
	}
	/**
	 * Get module name.
	 *
	 * Retrieve the module name.
	 *
	 * @since  2.5.0
	 * @access public
	 *
	 * @return string Module name.
	 */
	public function get_name() {
		return 'motion-fx';
	}

	public function register_controls_group() {
        \Elementor\Plugin::instance()->controls_manager->add_group_control( 'motion_fx', new Antra_Elementor_Control_MotionFX() );
	}

	public function add_controls_group_to_element( Element_Base $element ) {
		$exclude = [];
		$selector = '{{WRAPPER}}';
		if ( $element instanceof Element_Section ) {
			$exclude[] = 'motion_fx_mouse';
		} elseif ( $element instanceof Element_Column ) {
			$selector .= ' > .elementor-widget-wrap';
		} else {
			$selector .= ' > .elementor-widget-container';
		}

		$element->add_group_control(
            Antra_Elementor_Control_MotionFX::get_type(),
			[
				'name' => 'motion_fx',
				'selector' => $selector,
				'exclude' => $exclude,
			]
		);
	}

	public function add_controls_group_to_element_background( Element_Base $element ) {
		$element->start_injection( [
			'of' => 'background_bg_width_mobile',
		] );

		$element->add_group_control(
            Antra_Elementor_Control_MotionFX::get_type(),
			[
				'name' => 'background_motion_fx',
				'exclude' => [
					'rotateZ_effect',
					'tilt_effect',
					'transform_origin_x',
					'transform_origin_y',
				],
			]
		);

		$options = [
			'separator' => 'before',
			'conditions' => [
				'relation' => 'or',
				'terms' => [
					[
						'name' => 'background_background',
						'value' => 'classic',
					],
					[
						'terms' => [
							[
								'name' => 'background_background',
								'value' => 'gradient',
							],
							[
								'name' => 'background_color',
								'operator' => '!==',
								'value' => '',
							],
							[
								'name' => 'background_color_b',
								'operator' => '!==',
								'value' => '',
							],
						],
					],
				],
			],
		];

		$element->update_control( 'background_motion_fx_motion_fx_scrolling', $options );
		$element->update_control( 'background_motion_fx_motion_fx_mouse', $options );
		$element->end_injection();
	}

	public function scripts(){
		global $antra_version;
        wp_enqueue_script(
            'antra-elementor-motion-fx',
            get_theme_file_uri('inc/elementor/motion-fx/assets/main.js'),
            [
                'jquery',
            ],
            $antra_version,
            true
        );
    }

	private function add_actions() {
		add_action( 'elementor/controls/controls_registered', [ $this, 'register_controls_group' ] );

		add_action( 'elementor/element/section/section_effects/after_section_start', [ $this, 'add_controls_group_to_element' ] );
		add_action( 'elementor/element/column/section_effects/after_section_start', [ $this, 'add_controls_group_to_element' ] );
		add_action( 'elementor/element/common/section_effects/after_section_start', [ $this, 'add_controls_group_to_element' ] );

        add_action('elementor/frontend/after_enqueue_scripts', [$this, 'scripts']);
	}
}
new Antra_Elementor_MotionFX();
