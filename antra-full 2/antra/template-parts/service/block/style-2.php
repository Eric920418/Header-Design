<?php
/**
 * The template for displaying service content within loops
 *
 */

defined('ABSPATH') || exit;

extract($args);

$image_text_service = antra_get_object_loop_prop('image_text_service');
?>
<li class="<?php echo esc_attr($class); ?>">
    <div class="service-block">
        <?php
        do_action('antra_loop_service_open', $args);

        antra_service_loop_index($index);
        ?>
        <div class="service-caption">
            <div class="service-content-loop">
                <div class="service-content-box">
                    <?php
                    antra_service_loop_title();
                    if (antra_get_object_loop_prop('show_exerpt') == 'yes') {
                        antra_service_loop_excerpt();
                    }

                    do_action('antra_loop_service_content');
                    ?>
                </div>
            </div>
            <?php antra_service_loop_button(); ?>
        </div>
        <?php
        do_action('antra_loop_service_open');

        antra_service_thumbnail($image_size);
        ?>

        <?php
        do_action('antra_loop_service_close');
        ?>
    </div>
</li>