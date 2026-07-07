<?php
/**
 * Antra functions.
 *
 * @package antra
 */


if (!function_exists('antra_is_bcn_nav_activated')) {
    function antra_is_bcn_nav_activated() {
        return function_exists('bcn_display') ? true : false;
    }
}

if (!function_exists('antra_is_cmb2_activated')) {
    function antra_is_cmb2_activated() {
        return defined('CMB2_LOADED') ? true : false;
    }
}

if (!function_exists('antra_is_revslider_activated')) {
    function antra_is_revslider_activated() {
        return class_exists('RevSliderBase');
    }
}

if (!function_exists('antra_is_wpml_activated')) {
    function antra_is_wpml_activated() {
        return class_exists('SitePress') ? true : false;
    }
}

if (!function_exists('antra_is_woocommerce_activated')) {
    /**
     * Query WooCommerce activation
     */
    function antra_is_woocommerce_activated() {
        return class_exists('WooCommerce') ? true : false;
    }
}


if (!function_exists('antra_is_wcmp_activated')) {
    /**
     * Query WooCommerce activation
     */
    function antra_is_wcmp_activated() {
        return class_exists('WCMp') ? true : false;
    }
}

if (!function_exists('antra_is_elementor_activated')) {
    function antra_is_elementor_activated() {
        return defined('ELEMENTOR_VERSION') ? true : false;
    }
}

if (!function_exists('antra_is_elementor_pro_activated')) {
    function antra_is_elementor_pro_activated() {
        return function_exists('elementor_pro_load_plugin') ? true : false;
    }
}

if (!function_exists('antra_is_redux_activated')) {
    function antra_is_redux_activated() {
        return class_exists('Redux') ? true : false;
    }
}

if (!function_exists('antra_is_contactform_activated')) {
    function antra_is_contactform_activated() {
        return class_exists('WPCF7');
    }
}

if (!function_exists('antra_is_mailchimp_activated')) {
    function antra_is_mailchimp_activated() {
        return function_exists('_mc4wp_load_plugin');
    }
}

if (!function_exists('antra_elementor_check_type')) {
    function antra_elementor_check_type($type = '') {
        if ($type) {
            $data = get_post_meta(get_the_ID(), '_elementor_data', true);
            if ($data) {
                return preg_match('/' . $type . '/', $data);
            }
        }

        return false;
    }
}

if (!function_exists('antra_is_wishlist_activated')) {
    function antra_is_wishlist_activated($type = '') {
        return function_exists( 'woosw_init' );
    }
}

if (!function_exists('antra_is_autoptimize_activated')) {
    function antra_is_autoptimize_activated() {
        return class_exists( 'autoptimizeBase' );
    }
}


/**
 * Call a shortcode function by tag name.
 *
 * @param string $tag The shortcode whose function to call.
 * @param array $atts The attributes to pass to the shortcode function. Optional.
 * @param array $content The shortcode's content. Default is null (none).
 *
 * @return string|bool False on failure, the result of the shortcode on success.
 * @since  1.4.6
 *
 */
function antra_do_shortcode($tag, array $atts = array(), $content = null) {
    global $shortcode_tags;

    if (!isset($shortcode_tags[$tag])) {
        return false;
    }

    return call_user_func($shortcode_tags[$tag], $atts, $content, $tag);
}


/**
 * Adjust a hex color brightness
 * Allows us to create hover styles for custom link colors
 *
 * @param strong $hex hex color e.g. #111111.
 * @param integer $steps factor by which to brighten/darken ranging from -255 (darken) to 255 (brighten).
 *
 * @return string        brightened/darkened hex color
 * @since  1.0.0
 */
function antra_adjust_color_brightness($hex, $steps) {
    // Steps should be between -255 and 255. Negative = darker, positive = lighter.
    $steps = max(-255, min(255, $steps));

    // Format the hex color string.
    $hex = str_replace('#', '', $hex);

    if (3 === strlen($hex)) {
        $hex = str_repeat(substr($hex, 0, 1), 2) . str_repeat(substr($hex, 1, 1), 2) . str_repeat(substr($hex, 2, 1), 2);
    }

    // Get decimal values.
    $r = hexdec(substr($hex, 0, 2));
    $g = hexdec(substr($hex, 2, 2));
    $b = hexdec(substr($hex, 4, 2));

    // Adjust number of steps and keep it inside 0 to 255.
    $r = max(0, min(255, $r + $steps));
    $g = max(0, min(255, $g + $steps));
    $b = max(0, min(255, $b + $steps));

    $r_hex = str_pad(dechex($r), 2, '0', STR_PAD_LEFT);
    $g_hex = str_pad(dechex($g), 2, '0', STR_PAD_LEFT);
    $b_hex = str_pad(dechex($b), 2, '0', STR_PAD_LEFT);

    return '#' . $r_hex . $g_hex . $b_hex;
}

/**
 * Sanitizes choices (selects / radios)
 * Checks that the input matches one of the available choices
 *
 * @param array $input the available choices.
 * @param array $setting the setting object.
 *
 * @since  1.3.0
 */
function antra_sanitize_choices($input, $setting) {
    // Ensure input is a slug.
    $input = sanitize_key($input);

    // Get list of choices from the control associated with the setting.
    $choices = $setting->manager->get_control($setting->id)->choices;

    // If the input is a valid key, return it; otherwise, return the default.
    return (array_key_exists($input, $choices) ? $input : $setting->default);
}

/**
 * Checkbox sanitization callback.
 *
 * Sanitization callback for 'checkbox' type controls. This callback sanitizes `$checked`
 * as a boolean value, either TRUE or FALSE.
 *
 * @param bool $checked Whether the checkbox is checked.
 *
 * @return bool Whether the checkbox is checked.
 * @since  1.5.0
 */
function antra_sanitize_checkbox($checked) {
    return ((isset($checked) && true === $checked) ? true : false);
}

/**
 * Antra Sanitize Hex Color
 *
 * @param string $color The color as a hex.
 *
 * @todo remove in 2.1.
 */
function antra_sanitize_hex_color($color) {
    _deprecated_function('antra_sanitize_hex_color', '2.0', 'sanitize_hex_color');

    if ('' === $color) {
        return '';
    }

    // 3 or 6 hex digits, or the empty string.
    if (preg_match('|^#([A-Fa-f0-9]{3}){1,2}$|', $color)) {
        return $color;
    }

    return null;
}

/*
 * get theme option redux
 * @param string $option_name
 * @param mix $default
 * @return mix
 *
 * */

if (!function_exists('antra_get_theme_option')) {
    function antra_get_theme_option($option_name, $default = false) {

        if ($option = get_option('antra_options_' . $option_name)) {
            $default = $option;
        }

        return $default;
    }
}

if (!function_exists('antra_get_post_meta')) {
    function antra_get_post_meta($post_id, $meta_name, $default = false) {
        $value = get_post_meta($post_id, $meta_name, true);
        if (!$value) {
            return $default;
        }

        return $value;
    }
}

/**
 * @param $value
 *
 * @return string
 */
function antra_sanitize_editor($value) {
    return force_balance_tags(apply_filters('the_content', $value));
}

function antra_sanitize_input($input) {
    return strip_tags(stripslashes($input));
}

function antra_sanitize_select($input, $setting) {
    // Ensure input is a slug.
    $input = sanitize_key($input);
    // Get list of choices from the control associated with the setting.
    $choices = $setting->manager->get_control($setting->id)->choices;
    // If the input is a valid key, return it; otherwise, return the default.
    return (array_key_exists($input, $choices) ? $input : $setting->default);
}

// Disables the block editor from managing widgets in the Gutenberg plugin.
//add_filter( 'gutenberg_use_widgets_block_editor', '__return_false' );
// Disables the block editor from managing widgets.
//add_filter( 'use_widgets_block_editor', '__return_false' );


function antra_get_page_by_title($name, $post_type = 'page') {
    $posts = get_posts(
        array(
            'post_type'              => $post_type,
            'title'                  => $name,
            'post_status'            => 'all',
            'numberposts'            => 1,
            'update_post_term_cache' => false,
            'update_post_meta_cache' => false,
            'orderby'                => 'post_date ID',
            'order'                  => 'ASC',
        )
    );

    if (!empty($posts)) {
        return $posts[0];
    }
    return null;
}

function antra_get_page_by_slug($slug, $post_type = 'page') {
    $posts = get_posts(
        array(
            'post_type'              => $post_type,
            'name'                  => $slug,
            'post_status'            => 'all',
            'numberposts'            => 1,
            'update_post_term_cache' => false,
            'update_post_meta_cache' => false,
            'orderby'                => 'post_date ID',
            'order'                  => 'ASC',
        )
    );

    if (!empty($posts)) {
        return $posts[0];
    }
    return null;
}

if (!function_exists('antra_string_to_bool')) {
    /**
     * Converts a string (e.g. 'yes' or 'no') to a bool.
     *
     * @since 3.0.0
     * @param string|bool $string String to convert. If a bool is passed it will be returned as-is.
     * @return bool
     */
    function antra_string_to_bool( $string ) {
        return is_bool( $string ) ? $string : ( 'yes' === strtolower( $string ) || 1 === $string || 'true' === strtolower( $string ) || '1' === $string );
    }
}

if (!function_exists('antra_bool_to_string')) {
/**
 * Converts a bool to a 'yes' or 'no'.
 *
    * @since 3.0.0
    * @param bool|string $bool Bool to convert. If a string is passed it will first be converted to a bool.
    * @return string
    */
    function antra_bool_to_string( $bool ) {
        if ( ! is_bool( $bool ) ) {
            $bool = antra_string_to_bool( $bool );
        }
        return true === $bool ? 'yes' : 'no';
    }
}

if (!function_exists('antra_get_placeholder_image')) {
    function antra_get_placeholder_image() {
        return apply_filters('antra_get_placeholder_image', get_template_directory_uri() . '/assets/images/base/placeholder.jpg');
    }
}

if (!function_exists('antra_print_placeholder_image')) {
    function antra_print_placeholder_image(array $attr) {
        ?>
        <img src="<?php echo esc_html(antra_get_placeholder_image()) ?>" <?php antra_parse_attr_html($attr, 1); ?>/>
        <?php
    }
}

if (!function_exists('antra_parse_attr_html')) {
    /**
     *
     * @since  1.0.0
     */
    function antra_parse_attr_html(array $attr, $print = false) {
        $attr_return = implode(' ', array_map(function ($key, $value) {
            if (is_array($value)) {
                $value = implode(' ', $value);
            }
    
            return esc_html($key) . "='" . esc_attr($value) . "'";
        }, array_keys($attr), $attr));

        if ($print) {
            printf('%s', $attr_return);
        } 
        else {
            return $attr_return;
        }
    }
}

if (!function_exists('antra_check_post_is_elementor')) {
    /**
     *
     * @since  1.0.0
     */
    function antra_check_post_is_elementor($post_id = null) {
        $post_id = empty($post_id) ? get_queried_object_id() : absint($post_id);

        if (antra_is_elementor_activated()) {
            $page_id     = get_queried_object_id();
            $page_ins = Elementor\Plugin::instance()->documents->get( $page_id );
            if($page_ins) {
                return $page_ins->is_built_with_elementor();
            }
        }

        return false;
    }
}

if (!function_exists('antra_loadmore_link')) {
    /**
     *
     * @since  1.0.0
     */
    function antra_loadmore_link($args = '') {
        global $wp_query, $wp_rewrite;

        // Setting up default values based on the current URL.
        $pagenum_link = html_entity_decode( get_pagenum_link() );
        $url_parts    = explode( '?', $pagenum_link );

        // Get max pages and current page out of the current query, if available.
        $total   = isset( $wp_query->max_num_pages ) ? $wp_query->max_num_pages : 1;
        $current = get_query_var( 'paged' ) ? (int) get_query_var( 'paged' ) : 1;

        // Append the format placeholder to the base URL.
        $pagenum_link = trailingslashit( $url_parts[0] ) . '%_%';

        // URL base depends on permalink settings.
        $format  = $wp_rewrite->using_index_permalinks() && ! strpos( $pagenum_link, 'index.php' ) ? 'index.php/' : '';
        $format .= $wp_rewrite->using_permalinks() ? user_trailingslashit( $wp_rewrite->pagination_base . '/%#%', 'paged' ) : '?paged=%#%';

        $defaults = array(
            'base'               => $pagenum_link,
            'format'             => $format,
            'total'              => $total,
            'current'            => $current,
            'add_args'           => array(),
            'add_fragment'       => '',
        );

        $args = wp_parse_args( $args, $defaults );
    
        if ( ! is_array( $args['add_args'] ) ) {
            $args['add_args'] = array();
        }

        if ( isset( $url_parts[1] ) ) {
            // Find the format argument.
            $format       = explode( '?', str_replace( '%_%', $args['format'], $args['base'] ) );
            $format_query = isset( $format[1] ) ? $format[1] : '';
            wp_parse_str( $format_query, $format_args );
    
            // Find the query args of the requested URL.
            wp_parse_str( $url_parts[1], $url_query_args );
    
            // Remove the format argument from the array of query arguments, to avoid overwriting custom format.
            foreach ( $format_args as $format_arg => $format_arg_value ) {
                unset( $url_query_args[ $format_arg ] );
            }
    
            $args['add_args'] = array_merge( $args['add_args'], urlencode_deep( $url_query_args ) );
        }

        $total = (int) $args['total'];
        if ( $total < 2 ) {
            return;
        }

        $current  = (int) $args['current'];
        $add_args   = $args['add_args'];

        $link = str_replace( '%_%', $args['format'], $args['base'] );
		$link = str_replace( '%#%', $current + 1, $link );
		if ( $add_args ) {
			$link = add_query_arg( $add_args, $link );
		}
		$link .= $args['add_fragment'];

		$loadmore_url = esc_url( apply_filters( 'antra_loadmore_links', $link ) );

        return $loadmore_url;
    }
}