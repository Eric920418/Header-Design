<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<?php
	/**
	 * Functions hooked in to antra_page action
	 *
	 * @see antra_page_header          - 10
	 * @see antra_page_content         - 20
	 *
	 */
	do_action( 'antra_page' );
	?>
</article><!-- #post-## -->
