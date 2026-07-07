<?php

if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra_Elementor_Control')) :

    /**
     * The Antra Elementor Integration class
     */
    class Antra_Elementor_Control {

        public function __construct() {

            add_action('elementor/ajax/register_actions', [$this, 'register_ajax_actions']);
            add_action('elementor/controls/register', [$this, 'on_controls_registered']);
        }

        public function ajax_posts_filter_autocomplete(array $data) {
            if (empty($data['q'])) {
                throw new \Exception('Bad Request');
            }

            $type = !empty($data['type']) ? $data['type'] : 'post';

            $results = [];

            $query_params = [
                'post_type'      => $type,
                's'              => $data['q'],
                'posts_per_page' => -1,
            ];

            $query = new WP_Query($query_params);

            foreach ($query->posts as $post) {

                $results[] = [
                    'id'   => $post->ID,
                    'text' => esc_html($post->post_title),
                ];
            }

            return [
                'results' => $results,
            ];
        }

        public function ajax_query_control_value($request) {
            $ids = (array)$request['id'];

            $results = [];
            $query   = new \WP_Query(
                [
                    'post_type'      => 'any',
                    'post__in'       => $ids,
                    'posts_per_page' => -1,
                ]
            );

            foreach ($query->posts as $post) {
                $results[$post->ID] = esc_html($post->post_title);
            }
            return $results;
        }

        public function register_ajax_actions($ajax_manager) {
            $ajax_manager->register_ajax_action('antra_panel_posts_control_filter', [$this, 'ajax_posts_filter_autocomplete']);
            $ajax_manager->register_ajax_action('antra_query_control_value', [$this, 'ajax_query_control_value']);
        }

        public function on_controls_registered() {
            $this->register_control();
        }

        private function register_control() {
            require get_theme_file_path('inc/elementor/elementor-control/class-cpt-control.php');
            require get_theme_file_path('inc/elementor/elementor-control/class-font-control.php');

            $controls_manager = \Elementor\Plugin::instance()->controls_manager;

            $controls_manager->register(new Antra_Font_Control());

            if (antra_is_woocommerce_activated()) {
                $controls_manager->register((new Antra_CPT_Control())->set_type('product'));
            }
            $controls_manager->register((new Antra_CPT_Control())->set_type('service'));
            $controls_manager->register((new Antra_CPT_Control())->set_type('project'));
            $controls_manager->register((new Antra_CPT_Control())->set_type('team'));
        }

    }

endif;

return new Antra_Elementor_Control();
