<?php

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

use \Elementor\Control_Font;

/**
 * Producta_Control control.
 *
 */
class Antra_Font_Control extends Control_Font {

    /**
	 * Render font control output in the editor.
	 *
	 * Used to generate the control HTML in the editor using Underscore JS
	 * template. The variables for the class are available using `data` JS
	 * object.
	 *
	 * @since 1.0.0
	 * @access public
	 */
	public function content_template() {
		?>
		<div class="elementor-control-field cvmcxnvm">
			<label for="<?php $this->print_control_uid(); ?>" class="elementor-control-title">{{{ data.label }}}</label>
			<div class="elementor-control-input-wrapper elementor-control-unit-5">
				<select id="<?php $this->print_control_uid(); ?>" class="elementor-control-font-family" data-setting="{{ data.name }}">
					<option value=""><?php echo esc_html__( 'Default', 'antra' ); ?></option>
                    <optgroup label="<?php esc_attr_e('Antra Font', 'antra') ?>">
                        <option value="Cal Sans">Cal Sans</option>
                    </optgroup>
					<# _.each( data.groups, function( group_label, group_name ) {
						var groupFonts = getFontsByGroups( group_name );
						if ( ! _.isEmpty( groupFonts ) ) { #>
						<optgroup label="{{ group_label }}">
							<# _.each( groupFonts, function( fontType, fontName ) { #>
								<option value="{{ fontName }}">{{{ fontName }}}</option>
							<# } ); #>
						</optgroup>
						<# }
					}); #>
				</select>
			</div>
		</div>
		<# if ( data.description ) { #>
			<div class="elementor-control-field-description">{{{ data.description }}}</div>
		<# } #>
		<?php
	}
}
