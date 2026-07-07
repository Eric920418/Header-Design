<?php
/**
 * Object Loop Start
 *
 */

if (!defined('ABSPATH')) {
    exit;
}

$post_type = antra_get_object_loop_prop('post_type');

$classe         = ['antra-'.$post_type, 'antra-list-wrapper', 'clear-list-style'];
$classe_wrapper = ['antra-con'];
if (antra_get_object_loop_prop('wrap_container', false)) {
    $classe_wrapper[] = 'container';
}
if (antra_get_object_loop_prop('enable_carousel', false)) {
    $classe_wrapper[] = 'antra-swiper';
    $classe[]         = 'swiper-wrapper';
} else {
    $classe[] = 'elementor-grid';
}
$classe_wrapper = esc_attr(implode(' ', array_unique($classe_wrapper)));
$classe         = esc_attr(implode(' ', array_unique($classe)));
antra_set_object_loop_prop('object-class', $classe);
antra_set_object_loop_prop('object-class-wrapper', $classe_wrapper);
?>

<div class="<?php echo esc_attr(antra_get_object_loop_prop('object-class-wrapper', $post_type.'-wrapper')); ?>">
    <ul class="<?php echo esc_attr(antra_get_object_loop_prop('object-class', $post_type)); ?>">

