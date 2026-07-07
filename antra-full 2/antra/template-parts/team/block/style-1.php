<?php
/**
 * The template for displaying team content within loops
 *
 */

defined('ABSPATH') || exit;

extract($args);

$image_size = antra_get_object_loop_prop('image_size');
?>
    <li class="<?php echo esc_attr($class); ?>">
        <div class="team-block">
            <?php
            do_action('antra_loop_team_open', $args);
            ?>
            <div class="team-transition">
                <?php
                antra_team_thumbnail($image_size, 1);

                do_action('antra_loop_team_thumbnail', $args);
                ?>

            </div>
            <div class="team-content">
                <div class="team-caption">
                    <?php
                    antra_team_loop_title();
                    antra_team_loop_job();

                    do_action('antra_loop_team_caption', $args);
                    ?>
                </div>
                <div class="team-actions">
                    <?php
                    antra_object_socials();

                    do_action('antra_loop_team_actions', $args);
                    ?>
                </div>
            </div>
            <?php
            do_action('antra_loop_team_close', $args);
            ?>
        </div>
    </li>
<?php
