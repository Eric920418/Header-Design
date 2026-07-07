<?php
/**
 * The template for displaying project content within loops
 *
 */

defined('ABSPATH') || exit;

extract($args);

$button_text = antra_get_object_loop_prop('button_text');
?>
    <li class="<?php echo esc_attr($class); ?>">
        <div class="project-block">
            <?php
            do_action('antra_loop_project_open', $args);
            ?>
            <div class="project-transition">
                <?php
                antra_project_category($before = '', $after = '', $separator = '');
                antra_project_thumbnail($image_size, true, $button_text);
                if (antra_get_object_loop_prop('show_index')) {
                    antra_project_loop_index($index);
                }

                do_action('antra_loop_project_thumbnail', $args);
                ?>
            </div>
            <div class="project-text-box">
                <?php
                antra_project_category($before = '', $after = '', $separator = '');
                ?>
                <div class="project-caption">
                    <?php
                    
                    antra_project_loop_title();

                    do_action('antra_loop_project_caption', $args);
                    ?>
                </div>
                <div class="project-content">
                    <?php
                    antra_project_location();
                    antra_project_date('Y');

                    do_action('antra_loop_project_content', $args);
                    ?>
                </div>
            </div>
            <?php
            do_action('antra_loop_project_close', $args);
            ?>
        </div>
    </li>
<?php
