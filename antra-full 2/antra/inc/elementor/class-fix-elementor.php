<?php

if ( ! defined( 'ABSPATH' ) ) {
    exit;
}

class Lexus_Elementor_Fix_Update {
    public $widgets = [
        'woocommerce-breadcrumb' => 'Antra_Elementor_Breadcrumb',

    ];

    public function __construct() {
        add_action( 'elementor/init', [ $this, 'on_elementor_init' ] );
    }

    public function on_elementor_init(){
        add_filter( 'elementor/editor/localize_settings', function($client_env) {
            $widgets = $this->widgets;

            foreach ($widgets as $key => $widget) {
                $client_env['initial_document']['widgets'][$key]['show_in_panel'] = true;
                $client_env['initial_document']['widgets'][$key]['hide_on_search'] = false;

                if(isset($client_env['promotionWidgets']) && is_array($client_env['promotionWidgets'])){
                    $item = array_search($key, array_column($client_env['promotionWidgets'], 'name'));
                    unset($client_env['promotionWidgets'][$item]);
                }
            }

            return $client_env;
        } );

        add_action('elementor/widgets/register', function($widgets_manager) {
            $widgets = $this->widgets;

            foreach ($widgets as $key => $widget) {
                if (!class_exists($widget)) continue;
                $widgets_manager->unregister( $key );
                $widgets_manager->register(new $widget());
            }

        }, 99);
    }
}

return new Lexus_Elementor_Fix_Update();
