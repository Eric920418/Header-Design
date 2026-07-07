<?php
if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

/**
 * Init post types for theme
 */
add_filter('themelexus_add_post_types', function($post_types) {

    $post_types = [
        'service' => [
            'label' => antra_get_theme_option('service_label', __( 'Services', 'antra' )),
            'rewrite' => [ 
                'slug' => antra_get_theme_option('service_slug', 'service'),
            ],
            'menu_icon' => 'dashicons-feedback',
        ],
        'project' => [
            'label' => antra_get_theme_option('project_label', __( 'Projects', 'antra' )),
            'rewrite' => [ 
                'slug' => antra_get_theme_option('project_slug', 'project'),
            ],
            'menu_icon' => 'dashicons-portfolio',
        ],
        'team' => [
            'label' => antra_get_theme_option('team_label', __( 'Teams', 'antra' )),
            'rewrite' => [
                'slug' => antra_get_theme_option('team_slug', 'team'),
            ],
            'menu_icon' => 'dashicons-groups',
            'taxonomies' => array('post_tag'),
        ],
        'virtual_tour' => [
            'label' => antra_get_theme_option('virtual_tour_label', __( 'Virtual tours', 'antra' )),
            'rewrite' => [
                'slug' => antra_get_theme_option('virtual_tour_slug', 'virtual-tour'),
            ],
            'menu_icon' => 'dashicons-embed-photo',
            "supports" => [ "title", "thumbnail", "author" ],
        ],
    ];

    return apply_filters('antra_add_custom_post_types', $post_types);
});

/**
 * Init taxonomies for theme
 */
add_filter('themelexus_add_taxonomies', function($taxonomies) {

    $taxonomies = [
        'project-category' => [
            'post_types' => [
                'project',
            ],
            'args' => [
                'labels' => [
                    "name" => antra_get_theme_option('project_category_label', __( "Categories", 'antra' )),
                    "singular_name" => antra_get_theme_option('project_category_single_label', __( "Category", 'antra' )),
                ],
                'rewrite' => [ 
                    'slug' => antra_get_theme_option('project_category_slug', 'project-category'),
                ],
            ]
        ],
    ];

    return apply_filters('antra_add_custom_taxonomies', $taxonomies);

});

/**
 * Init sidebars for theme
 */
add_filter('themelexus_custom_sidebar', function($sidebars) {

    $sidebars = [
        'service' => array(
            'name'          => __( 'Sidebar Single Service', 'antra' ),
            'id'            => 'sidebar-service',
            'description'   => __( 'Display in service single page', 'antra' ),
            'before_widget' => '<div id="%1$s" class="widget %2$s">',
            'after_widget'  => '</div>',
            'before_title'  => '<span class="gamma widget-title">',
            'after_title'   => '</span>',
        ),
    ];

    return apply_filters('antra_add_custom_sidebars', $sidebars);

});

/**
 * Init widgets for theme
 */
add_filter('themelexus_custom_widgets', function($widgets) {
    require get_theme_file_path('inc/post-type/widgets/class-wp-widget-services-list.php');

    $widgets = [
        'Antra_WP_Widget_Service'
    ];

    return apply_filters('antra_add_custom_widgets', $widgets);

});

add_action( 'body_class', function($classes) {
	if (is_singular('service') && is_active_sidebar('sidebar-service') && !antra_check_post_is_elementor()) {
		$classes[] = 'antra-sidebar-service';
		$classes[] = 'antra-sidebar-left';
	}
	return $classes;
});

add_action( 'antra_theme_sidebar', function($name) {
    if (is_singular('service')) {
        $name = 'sidebar-service';
    }
    return $name;
});

add_filter( 'antra_post_type_block_style', function($style, $post_type, $item_args) {
    if ($post_type == 'project') {
        $style = 'default';
    }
    return $style;
}, 10, 3);

add_action('wp_enqueue_scripts', function() {
    global $antra_version;
    wp_register_script('antra-virtual-tour', get_template_directory_uri() . '/assets/js/frontend/virtual-tour.js', array('jquery', 'three', 'panolens'), $antra_version, true);
    if (is_singular('virtual_tour')) {
        wp_enqueue_script('antra-virtual-tour');
    }
});