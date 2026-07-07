<?php

/**
 * Antra_CPT_Control control.
 *
 */
class Antra_CPT_Control extends \Elementor\Control_Select2 {

    public $pt;

    public function set_type($pt) {
        $this->pt = $pt;
        return $this;
    }

    public function get_type() {
        return $this->pt;
    }

    public function enqueue() {
		global $antra_version;
        wp_register_script('antra-pt-control', get_theme_file_uri('/inc/elementor/elementor-control/assets/pt-control.js'), ['jquery'], $antra_version, true);
        wp_enqueue_script('antra-pt-control');
    }

    /**
	 * Render select2 control output in the editor.
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
		<div class="elementor-control-field">
			<# if ( data.label ) {#>
				<label for="<?php $this->print_control_uid(); ?>" class="elementor-control-title">{{{ data.label }}}</label>
			<# } #>
			<div class="elementor-control-input-wrapper elementor-control-unit-5">
				<# var multiple = ( data.multiple ) ? 'multiple' : ''; #>
				<select id="<?php $this->print_control_uid(); ?>" class="elementor-select2" data-pt="<?php echo esc_attr($this->pt) ?>" type="select2" {{ multiple }} data-setting="{{ data.name }}">
					<# _.each( data.options, function( option_title, option_value ) {
						var value = data.controlValue;
						if ( typeof value == 'string' ) {
							var selected = ( option_value === value ) ? 'selected' : '';
						} else if ( null !== value ) {
							var value = _.values( value );
							var selected = ( -1 !== value.indexOf( option_value ) ) ? 'selected' : '';
						}
						#>
					<option {{ selected }} value="{{ _.escape( option_value ) }}">{{{ _.escape( option_title ) }}}</option>
					<# } ); #>
				</select>
			</div>
		</div>
		<# if ( data.description ) { #>
			<div class="elementor-control-field-description">{{{ data.description }}}</div>
		<# } #>
		<?php
	}
}
