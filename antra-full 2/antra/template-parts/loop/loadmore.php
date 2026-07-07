<?php
/**
 * Pagination - Show numbered pagination for catalog pages
 *
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

extract($args);

$post_type = antra_get_object_loop_prop('post_type');

$total   = isset( $total ) ? $total : antra_get_object_loop_prop( 'total_pages' );
$current = isset( $current ) ? $current : antra_get_object_loop_prop( 'current_page' );
$format  = isset( $format ) ? $format : '';

if ( $total <= 1 || $current >= $total ) { 
	return;
}

$next_url = antra_loadmore_link(
    apply_filters(
        'object_loadmore_args',
        array( // WPCS: XSS ok.
            'base'      => $base,
            'format'    => $format,
            'add_args'  => false,
            'current'   => max( 1, $current ),
            'total'     => $total,
        ),
        $post_type
    )
);

?>
<nav class="antra-loadmore <?php echo esc_attr($post_type) ?>-loadmore pagination">
	<?php
    $data_attr = [
        'data-total' => $total,
        'data-current' => $current,
        // 'href' => 'javascript:void(0)',
        'href' => esc_url($next_url),
        'class' => 'antra-post-loadmore loadmore-btn btn-slip-effect',
    ];
    ?>
    <a <?php antra_parse_attr_html($data_attr, 1) ?>>
        <span class="elementor-button-content-wrapper">
            <span class="antra-btn-content">
                <span class="antra-btn-text elementor-button-text" data-text="<?php _e('Load more', 'antra') ?>"><?php _e('Load more', 'antra') ?></span>
            </span>
            <span class="elementor-button-icon-inner">
                <i aria-hidden="true" class="antra-icon-arrow-right"></i></span>
        </span>
    </a>
</nav>
