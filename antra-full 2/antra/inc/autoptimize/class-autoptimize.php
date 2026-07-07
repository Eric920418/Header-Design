<?php

if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra_Autoptimize')) :

    /**
     * The Autoptimize Antra class
     */
    class Antra_Autoptimize {

        /**
         * Setup class.
         *
         * @since 1.0
         */
        public function __construct() {
            add_filter('autoptimize_filter_imgopt_lazyload_exclude_array', [$this, 'dentic_custom_exclude_lazyload_autotimize']);
        }

        /**
         * Add Exclude image lazyload autoptimize
         * 
         * @since 1.0
         */
        public function dentic_custom_exclude_lazyload_autotimize($exclude_lazyload_array) {
            $exclude_lazyload_array[] = 'elementor-galerry_image_source';
            $exclude_lazyload_array[] = 'antra-elementor-src-gallery';

            return $exclude_lazyload_array;
        }
    }

endif;

return new Antra_Autoptimize();