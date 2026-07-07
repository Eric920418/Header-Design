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
$base    = isset( $base ) ? $base : esc_url_raw( str_replace( 999999999, '%#%', get_pagenum_link( 999999999, false ) ) );
$format  = isset( $format ) ? $format : '';

if ( $total <= 1 ) { 
	return;
}
?>
<nav class="antra-pagination-list <?php echo esc_attr($post_type) ?>-pagination pagination">
	<?php
	echo paginate_links(
		apply_filters(
			'object_pagination_args',
			array( // WPCS: XSS ok.
				'base'      => $base,
				'format'    => $format,
				'add_args'  => false,
				'current'   => max( 1, $current ),
				'total'     => $total,
				'prev_text' => '<i class="antra-icon-arrow-left"></i>',
				'next_text' => '<i class="antra-icon-arrow-right"></i>',
				'type'      => 'list',
				'end_size'  => 3,
				'mid_size'  => 3,
			),
			$post_type
		)
	);
	?>
</nav>
