<?php

if (!function_exists('antra_elementor_parse_text_editor')) {
    function antra_elementor_parse_text_editor($content, $obj) {
        $content = apply_filters('widget_text', $content, $obj->get_settings());

        $content = shortcode_unautop($content);
        $content = do_shortcode($content);
        $content = wptexturize($content);

        if ($GLOBALS['wp_embed'] instanceof \WP_Embed) {
            $content = $GLOBALS['wp_embed']->autoembed($content);
        }

        return $content;
    }
}

if (!function_exists('antra_elementor_get_strftime')) {
    function antra_elementor_get_strftime($instance, $obj) {
        $string = '';
        if ($instance['show_days']) {
            $string .= $obj->render_countdown_item($instance, 'label_days', 'days', 'elementor-countdown-days');
        }
        if ($instance['show_hours']) {
            $string .= $obj->render_countdown_item($instance, 'label_hours', 'hours', 'elementor-countdown-hours');
        }
        if ($instance['show_minutes']) {
            $string .= $obj->render_countdown_item($instance, 'label_minutes', 'minutes', 'elementor-countdown-minutes');
        }
        if ($instance['show_seconds']) {
            $string .= $obj->render_countdown_item($instance, 'label_seconds', 'seconds', 'elementor-countdown-seconds');
        }

        return $string;
    }
}

if (!function_exists('antra_elementor_breakpoints')) {
    function antra_elementor_breakpoints() {
        $container_width = \Elementor\Plugin::$instance->kits_manager->get_active_kit()->get_settings_for_display('container_width');
        if (!empty($container_width['size']) && !empty($container_width['unit'])) {
            $var = '.col-full{max-width:' . $container_width['size'] . $container_width['unit'] . '}';
            wp_add_inline_style('antra-style', $var);
        }
    }
}

function antra_get_hotspots() {
    global $post;

    $options[''] = esc_html__('Select Hotspots', 'antra');
    if (!antra_is_elementor_activated()) {
        return;
    }
    $args = array(
        'post_type'      => 'elementor_library',
        'posts_per_page' => -1,
        'orderby'        => 'title',
        's'              => 'Hotspots',
        'order'          => 'ASC',
    );

    $query = new WP_Query($args);
    while ($query->have_posts()) {
        $query->the_post();
        $options[$post->post_name] = $post->post_title;
    }
    wp_reset_postdata();
    return $options;
}

function antra_get_file_contents($path) {
    if (is_file($path)) {
        $prifix = 'file_get'.'_contents';
        return $prifix($path);
    }

    return false;
}

function antra_get_icon_svg($path, $color = '', $width = '') {
    $content = antra_get_file_contents($path);
    if ($content) {
        $re = '/<svg(([^\n]*\n)+)<\/svg>/';
        preg_match_all($re, $content, $matches, PREG_SET_ORDER, 0);
        if (count($matches) > 0) {
            $content = $matches[0][0];
            $css     = '';
            if ($color) {
                $content = preg_replace('/stroke="[^"]*"/', 'stroke="' . $color . '"', $content);
                $css     .= 'fill:' . $color . ';';
            }
            if ($width) {
                $css .= 'width:' . $width . '; height: auto;';
            }
            $content = preg_replace("/(<svg[^>]*)(style=(\"|')([^(\"|')]*)('|\"))/m", '$1 style="' . $css . '$4"', $content);
        }
    }

    return $content;
}

function antra_update_selector_group_control(object $element, $group_id, array $selectors) {
    $controls_manager = \Elementor\Plugin::$instance->controls_manager;
    $typographyGroup = $controls_manager->get_control_groups($group_id);

    foreach ($typographyGroup->get_fields() as $field_key => $field) {

        $control_id = "{$group_id}_{$field_key}";
        $old_control_data = $controls_manager->get_control_from_stack($element->get_unique_name(), $control_id);
        $selector_value = ! empty( $old_control_data['selector_value'] ) ? $old_control_data['selector_value'] : str_replace( '_', '-', $field_key ) . ': {{VALUE}};';

        $new_args = [
            'selectors'  => []
        ];

        foreach ($selectors as $item) {
            $new_args['selectors'][$item] = $selector_value;
        }

        if (isset($old_control_data['responsive']) && $old_control_data['responsive']) {
            $element->update_responsive_control($control_id, $new_args);
        } else {
            $element->update_control($control_id, $new_args);
        }        
    }
}

if (!function_exists('antra_get_default_post')) {
    function antra_get_default_post($post_type = 'post') {
        $args = [
            'numberposts' => 1,
            'post_type'   => $post_type,
            'fields' => 'ids',
            'orderby' => 'date',
            'order' => 'ASC'
        ];
        $post_id = get_posts($args);
        if(!empty($post_id) && isset($post_id[0])){
            return $post_id[0];
        }else{
            return false;
        }

    }
}