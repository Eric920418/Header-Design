<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<div class="single-content">
		<div class="entry-header">
			<?php
			/**
			 * Functions hooked in to antra_service_header action
			 *
			 */
			do_action('antra_service_header');
			?>
			<?php the_title('<h1 class="alpha entry-title">', '</h1>'); ?>
		</div>
		<div class="antra-service-content">
			<?php
			/**
			 * Functions hooked in to antra_service_content action
			 *
			 */
			do_action('antra_service_content');
			?>
			<div class="entry-content">
				<?php
				the_content(
					sprintf(
						/* translators: %s: post title */
						esc_html__('Read More', 'antra') . ' %s',
						'<span class="screen-reader-text">' . get_the_title() . '</span>'
					)
				);
				?>
			</div>
		</div>
	</div>
</article><!-- #post-## -->
