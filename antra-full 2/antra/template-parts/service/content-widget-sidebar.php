<?php
/**
 * The template for displaying team content within loops
 *
 */

defined('ABSPATH') || exit;

extract($args);

?>
<li class="<?php echo esc_attr(apply_filters('antra_item_class_widget_sidebar', 'service-item', $args)) ?>" <?php printf('%s', $aria_current); ?>>
    <a href="<?php the_permalink( $post->ID ); ?>"<?php printf('%s', $aria_current); ?>><i class="antra-icon-dot"></i><?php echo esc_html($post_title); ?></a>
</li>
<?php
