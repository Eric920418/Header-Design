<!doctype html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo('charset'); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	<link rel="profile" href="//gmpg.org/xfn/11">
	<?php
	/**
	 * Functions hooked in to wp_head action
	 *
	 * @see antra_pingback_header - 1
	 */
	wp_head();

	?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>
<?php do_action('antra_before_site'); ?>

<div id="page" class="hfeed site">
	<?php
	/**
	 * Functions hooked in to antra_before_header action
	 *
	 */
	do_action('antra_before_header');
    if (antra_is_elementor_activated() && function_exists('hfe_init') && hfe_header_enabled()) {
        do_action('hfe_header');
    } else {
        get_template_part('template-parts/header/header-1');
    }

	/**
	 * Functions hooked in to antra_before_content action
	 *
	 * @see antra_archive_blog_top          - 10
	 * 
	 */
	do_action('antra_before_content');

	$is_e = antra_check_post_is_elementor();

	$full_width = $is_e && !is_archive();

	$full_width = apply_filters('antra_check_full_width_container', $full_width);
	$col_class = ($full_width) ? 'col-fluid' : 'col-full';
	$content_class = ($full_width) ? 'site-content-fluid' : '';
	?>

	<div id="content" class="site-content <?php echo esc_attr($content_class) ?>" tabindex="-1">
		<?php
		/**
		 * Functions hooked in to antra_before_container action
		 *
		 */
		do_action('antra_before_container');
		?>
		<div class="<?php echo esc_attr($col_class) ?>">

<?php
/**
 * Functions hooked in to antra_content_top action
 *
 * @see antra_shop_messages - 10 - woo
 *
 */
do_action('antra_content_top');

