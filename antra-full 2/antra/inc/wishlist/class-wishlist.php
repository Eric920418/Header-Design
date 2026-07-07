<?php

if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra_WooSW')) :

    /**
     * The CF7 Antra class
     */
    class Antra_WooSW {

        /**
         * Setup class.
         *
         * @since 1.0
         */
        public function __construct() {

            add_action('woosw_wishlist_item_actions_before', [$this, 'antra_woosw_wishlist_item_actions_before'], 10, 2);
            add_action('woosw_wishlist_item_actions_after', [$this, 'antra_woosw_wishlist_item_actions_after'], 10, 2);
        }


        public function antra_woosw_wishlist_item_actions_before($product, $key) {
    
            echo <<<HTML
            <div class="antra_woosw_item_wrapper">
            HTML;
            
        }
    
    
        public function antra_woosw_wishlist_item_actions_after($product, $key) {
    
            echo <<<HTML
            </div>
            HTML;
            
        }
        
        

    }        

endif;

return new Antra_WooSW();