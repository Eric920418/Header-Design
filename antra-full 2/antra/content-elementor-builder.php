<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<?php
	/**
	 * Functions hooked in to antra_single_elementor_builder action
	 *
	 * @see antra_page_content         - 10
	 *
	 */
	do_action( 'antra_single_elementor_builder' );
	?>
</article><!-- #post-## -->
