<?php


if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra_Elementor')) :

    /**
     * The Antra Elementor Integration class
     */
    class Antra_Elementor {
        private $suffix = '';

        public function __construct() {
            $this->suffix = (defined('SCRIPT_DEBUG') && SCRIPT_DEBUG) ? '' : '.min';

            add_action('elementor/frontend/after_enqueue_scripts', [$this, 'register_auto_scripts_frontend']);
            add_action('elementor/init', array($this, 'add_category'));
            add_action('wp_enqueue_scripts', [$this, 'add_scripts'], 15);
            add_action('elementor/widgets/register', array($this, 'include_widgets'));
            add_action('elementor/frontend/after_enqueue_scripts', [$this, 'add_js']);
            add_action('elementor/controls/register', array($this, 'include_controls'));
            
            // Custom Animation Scroll
            add_filter('elementor/controls/animations/additional_animations', [$this, 'add_animations_scroll']);

            // Elementor Fix Noitice WooCommerce
            add_action('elementor/editor/before_enqueue_scripts', array($this, 'woocommerce_fix_notice'));

            // Backend
            add_action('elementor/editor/after_enqueue_styles', [$this, 'add_style_editor'], 99);

            // Add Icon Custom
            add_action('elementor/icons_manager/native', [$this, 'add_icons_native']);
            add_action('elementor/controls/register', [$this, 'add_icons']);


            // Add Breakpoints
            add_action('wp_enqueue_scripts', 'antra_elementor_breakpoints', 9999);

            if (!antra_is_elementor_pro_activated()) {
                require trailingslashit(get_template_directory()) . 'inc/elementor/class-custom-css.php';
                require trailingslashit(get_template_directory()) . 'inc/elementor/class-section-sticky.php';
                if (is_admin()) {
                    add_action('manage_elementor_library_posts_columns', [$this, 'admin_columns_headers']);
                    add_action('manage_elementor_library_posts_custom_column', [$this, 'admin_columns_content'], 10, 2);
                }
                require get_theme_file_path('inc/elementor/motion-fx/controls-group.php');
                require get_theme_file_path('inc/elementor/motion-fx/module.php');
            }

            add_filter('elementor/fonts/additional_fonts', [$this, 'additional_fonts']);
            
            add_action('wp_print_styles', [$this, 'load_style_custom_template_elementor']);

            add_filter('antra_check_full_width_container', [$this, 'check_full_width']);
        }

        public function include_controls( $manager ) {
            require get_theme_file_path('inc/elementor/elementor-control/class-custom-typography.php');
            $manager->add_group_control( Antra\Elementor\Antra_Group_Control_Typography::get_type(), new Antra\Elementor\Antra_Group_Control_Typography() );
        }

        public function additional_fonts($fonts) {
            $fonts["Outfit"] = 'googlefonts';
            return $fonts;
        }

        public function admin_columns_headers($defaults) {
            $defaults['shortcode'] = esc_html__('Shortcode', 'antra');

            return $defaults;
        }

        public function admin_columns_content($column_name, $post_id) {
            if ('shortcode' === $column_name) {
                ob_start();
                ?>
                <input class="elementor-shortcode-input" type="text" readonly onfocus="this.select()" value="[hfe_template id='<?php echo esc_attr($post_id); ?>']"/>
                <?php
                ob_get_contents();
            }
        }

        public function add_js() {
            global $antra_version;
            $suffix = (defined('SCRIPT_DEBUG') && SCRIPT_DEBUG) ? '' : '.min';
            wp_enqueue_script('antra-elementor-frontend', get_theme_file_uri('/assets/js/elementor-frontend' . $suffix . '.js'), [], $antra_version);
            wp_enqueue_script('antra-elementor-classes', get_theme_file_uri('/assets/js/elementor-classes' . $suffix . '.js'), [], $antra_version);
        }

        public function add_style_editor() {
            global $antra_version;
            wp_enqueue_style('antra-elementor-editor-icon', get_theme_file_uri('/assets/css/admin/elementor/icons.css'), [], $antra_version);
        }

        public function add_scripts() {
            global $antra_version;
            $suffix = (defined('SCRIPT_DEBUG') && SCRIPT_DEBUG) ? '' : '.min';
            wp_enqueue_style('antra-elementor', get_template_directory_uri() . '/assets/css/base/elementor.css', '', $antra_version);
            wp_style_add_data('antra-elementor', 'rtl', 'replace');

            // Add Scripts
            wp_register_script('tweenmax', get_theme_file_uri('/assets/js/libs/TweenMax.min.js'), array('jquery'), '1.11.1');
            wp_enqueue_script('tweenmax');

            // Odometer Counter
            wp_register_script('odometer', get_theme_file_uri('/assets/js/libs/odometer.min.js'), array('jquery'), '');
            wp_register_style('odometer', get_template_directory_uri() . '/assets/css/libs/odometer.css', '', '');

            wp_register_script('velocity', get_theme_file_uri('/assets/js/libs/velocity.min.js'), array('jquery'), '');

            if (antra_elementor_check_type('animated-bg-parallax')) {
                wp_enqueue_script('jquery-panr', get_theme_file_uri('/assets/js/libs/jquery-panr' . $suffix . '.js'), array('jquery'), '0.0.1');
            }

            // GSAP
            wp_register_script('antra-lenis', get_template_directory_uri() . '/assets/js/libs/lenis.min.js', array(), $antra_version, true);
            wp_register_script('antra-gsap', get_template_directory_uri() . '/assets/js/libs/gsap.min.js', array(), $antra_version, true);
            wp_register_script('antra-scrolltrigger', get_template_directory_uri() . '/assets/js/libs/ScrollTrigger.min.js', array('antra-gsap'), $antra_version, true);
            // wp_enqueue_script('antra-lenis');
            // wp_enqueue_script('antra-scrolltrigger');
        }

        public function register_auto_scripts_frontend() {
            global $antra_version;
            wp_register_script('antra-elementor-banner-process', get_theme_file_uri('/assets/js/elementor/banner-process.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-brand', get_theme_file_uri('/assets/js/elementor/brand.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-countdown', get_theme_file_uri('/assets/js/elementor/countdown.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-flyout-menu', get_theme_file_uri('/assets/js/elementor/flyout-menu.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-gallery-scroll', get_theme_file_uri('/assets/js/elementor/gallery-scroll.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-image-carousel', get_theme_file_uri('/assets/js/elementor/image-carousel.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-image-gallery', get_theme_file_uri('/assets/js/elementor/image-gallery.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-posts-grid', get_theme_file_uri('/assets/js/elementor/posts-grid.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-pricing', get_theme_file_uri('/assets/js/elementor/pricing.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-process', get_theme_file_uri('/assets/js/elementor/process.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-product-categories', get_theme_file_uri('/assets/js/elementor/product-categories.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-products', get_theme_file_uri('/assets/js/elementor/products.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-project', get_theme_file_uri('/assets/js/elementor/project.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-project-before-after', get_theme_file_uri('/assets/js/elementor/project-before-after.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-project-gallery', get_theme_file_uri('/assets/js/elementor/project-gallery.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-project-image-panorama', get_theme_file_uri('/assets/js/elementor/project-image-panorama.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-project-statistics', get_theme_file_uri('/assets/js/elementor/project-statistics.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-service-accordion', get_theme_file_uri('/assets/js/elementor/service-accordion.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-service-list', get_theme_file_uri('/assets/js/elementor/service-list.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-team-accordion', get_theme_file_uri('/assets/js/elementor/team-accordion.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-team-list', get_theme_file_uri('/assets/js/elementor/team-list.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-testimonial', get_theme_file_uri('/assets/js/elementor/testimonial.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-timeline', get_theme_file_uri('/assets/js/elementor/timeline.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-timeline-accordion', get_theme_file_uri('/assets/js/elementor/timeline-accordion.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-video', get_theme_file_uri('/assets/js/elementor/video.js'), array('jquery','elementor-frontend'), $antra_version, true);
            wp_register_script('antra-elementor-virtual-tour', get_theme_file_uri('/assets/js/elementor/virtual-tour.js'), array('jquery','elementor-frontend'), $antra_version, true);
           
        }

        public function add_category() {
            Elementor\Plugin::instance()->elements_manager->add_category(
                'antra-addons',
                array(
                    'title' => esc_html__('Antra Addons', 'antra'),
                    'icon'  => 'fa fa-plug',
                ), 1);
        }

        public function add_animations_scroll($animations) {
            $animations['Antra Animation'] = [
                'opal-move-up'    => 'Move Up',
                'opal-move-down'  => 'Move Down',
                'opal-move-left'  => 'Move Left',
                'opal-move-right' => 'Move Right',
                'opal-flip'       => 'Flip',
                'opal-helix'      => 'Helix',
                'opal-scale-up'   => 'Scale',
                'opal-am-popup'   => 'Popup',
            ];

            return $animations;
        }

        /**
         * @param $widgets_manager Elementor\Widgets_Manager
         */
        public function include_widgets($widgets_manager) {
            require get_theme_file_path('inc/elementor/base_widgets.php');

            $files_custom = glob(get_theme_file_path('/inc/elementor/custom-widgets/*.php'));
            foreach ($files_custom as $file) {
                if (file_exists($file)) {
                    require_once $file;
                }
            }

            $files = glob(get_theme_file_path('/inc/elementor/widgets/*.php'));
            $project_video = null;
            foreach ($files as $key => $file) {
                if (basename($file) === 'project-video.php') {
                    $project_video = $file;
                    unset($files[$key]);
                    break;
                }
            }
            if ($project_video) {
                $files[] = $project_video;
            }

            foreach ($files as $file) {
                if (file_exists($file)) {
                    require_once $file;
                }
            }
        }

        public function woocommerce_fix_notice() {
            if (antra_is_woocommerce_activated()) {
                remove_action('woocommerce_cart_is_empty', 'woocommerce_output_all_notices', 5);
                remove_action('woocommerce_shortcode_before_product_cat_loop', 'woocommerce_output_all_notices', 10);
                remove_action('woocommerce_before_shop_loop', 'woocommerce_output_all_notices', 10);
                remove_action('woocommerce_before_single_product', 'woocommerce_output_all_notices', 10);
                remove_action('woocommerce_before_cart', 'woocommerce_output_all_notices', 10);
                remove_action('woocommerce_before_checkout_form', 'woocommerce_output_all_notices', 10);
                remove_action('woocommerce_account_content', 'woocommerce_output_all_notices', 10);
                remove_action('woocommerce_before_customer_login_form', 'woocommerce_output_all_notices', 10);
            }
        }

        public function add_icons( $manager ) {
            $new_icons = json_decode( '{"antra-icon-360-view":"360-view","antra-icon-antra":"antra","antra-icon-architectural":"architectural","antra-icon-ask":"ask","antra-icon-before-after":"before-after","antra-icon-blueprint":"blueprint","antra-icon-breadcrumb":"breadcrumb","antra-icon-bullet-list-line":"bullet-list-line","antra-icon-calendar":"calendar","antra-icon-check":"check","antra-icon-clapperboard":"clapperboard","antra-icon-clock":"clock","antra-icon-consulting":"consulting","antra-icon-dot":"dot","antra-icon-download-file":"download-file","antra-icon-email":"email","antra-icon-filters":"filters","antra-icon-galleries":"galleries","antra-icon-help":"help","antra-icon-house":"house","antra-icon-information1":"information1","antra-icon-interior":"interior","antra-icon-list-2":"list-2","antra-icon-list-ul":"list-ul","antra-icon-management":"management","antra-icon-map-line":"map-line","antra-icon-map-pin":"map-pin","antra-icon-menu-bar":"menu-bar","antra-icon-menu-fly-close":"menu-fly-close","antra-icon-menu-fly":"menu-fly","antra-icon-movies":"movies","antra-icon-phone":"phone","antra-icon-photo":"photo","antra-icon-play-fill":"play-fill","antra-icon-play":"play","antra-icon-plus2":"plus2","antra-icon-quote1":"quote1","antra-icon-receipt":"receipt","antra-icon-reply-line":"reply-line","antra-icon-setting":"setting","antra-icon-share-all":"share-all","antra-icon-shopping-bag":"shopping-bag","antra-icon-shoppingcart-o":"shoppingcart-o","antra-icon-sliders-v":"sliders-v","antra-icon-spaceop":"spaceop","antra-icon-tags":"tags","antra-icon-th-large-o":"th-large-o","antra-icon-time-line":"time-line","antra-icon-two-line":"two-line","antra-icon-user1":"user1","antra-icon-view-line-2":"view-line-2","antra-icon-360":"360","antra-icon-arrow-down":"arrow-down","antra-icon-arrow-left":"arrow-left","antra-icon-arrow-right":"arrow-right","antra-icon-arrow-up":"arrow-up","antra-icon-bars":"bars","antra-icon-bullet-list-line2":"bullet-list-line2","antra-icon-camrera-1":"camrera-1","antra-icon-caret-down":"caret-down","antra-icon-caret-left":"caret-left","antra-icon-caret-right":"caret-right","antra-icon-caret-up":"caret-up","antra-icon-cart-1":"cart-1","antra-icon-cart-empty":"cart-empty","antra-icon-cart":"cart","antra-icon-check-mark":"check-mark","antra-icon-check-square":"check-square","antra-icon-chevron-down":"chevron-down","antra-icon-chevron-left":"chevron-left","antra-icon-chevron-right":"chevron-right","antra-icon-chevron-up":"chevron-up","antra-icon-circle":"circle","antra-icon-Clip-path-group":"Clip-path-group","antra-icon-cloud-download-alt":"cloud-download-alt","antra-icon-comment":"comment","antra-icon-comments":"comments","antra-icon-compare":"compare","antra-icon-credit-card":"credit-card","antra-icon-delivery-truck":"delivery-truck","antra-icon-dot-circle":"dot-circle","antra-icon-edit":"edit","antra-icon-envelope":"envelope","antra-icon-expand-alt":"expand-alt","antra-icon-external-link-alt":"external-link-alt","antra-icon-file-alt":"file-alt","antra-icon-file-archive":"file-archive","antra-icon-filter":"filter","antra-icon-fire1":"fire1","antra-icon-folder-open":"folder-open","antra-icon-folder":"folder","antra-icon-frown":"frown","antra-icon-gift":"gift","antra-icon-grid-view-line":"grid-view-line","antra-icon-grip-horizontal":"grip-horizontal","antra-icon-heart-fill":"heart-fill","antra-icon-heart":"heart","antra-icon-history":"history","antra-icon-home":"home","antra-icon-info-circle":"info-circle","antra-icon-instagram":"instagram","antra-icon-level-up-alt":"level-up-alt","antra-icon-list":"list","antra-icon-mail":"mail","antra-icon-map-marker-check":"map-marker-check","antra-icon-meh":"meh","antra-icon-menu-down":"menu-down","antra-icon-menu":"menu","antra-icon-minus-circle":"minus-circle","antra-icon-minus":"minus","antra-icon-mobile-android-alt":"mobile-android-alt","antra-icon-money-bill":"money-bill","antra-icon-money":"money","antra-icon-Online_Support":"Online_Support","antra-icon-paper-plane":"paper-plane","antra-icon-pencil-alt":"pencil-alt","antra-icon-plus-circle":"plus-circle","antra-icon-plus":"plus","antra-icon-quickview":"quickview","antra-icon-random":"random","antra-icon-rating-stroke":"rating-stroke","antra-icon-rating":"rating","antra-icon-repeat":"repeat","antra-icon-reply-all":"reply-all","antra-icon-reply":"reply","antra-icon-search-plus":"search-plus","antra-icon-search":"search","antra-icon-shield-check":"shield-check","antra-icon-shopping-basket":"shopping-basket","antra-icon-shopping-cart":"shopping-cart","antra-icon-sign-out-alt":"sign-out-alt","antra-icon-smile":"smile","antra-icon-spinner":"spinner","antra-icon-square":"square","antra-icon-star":"star","antra-icon-store":"store","antra-icon-sync_alt":"sync_alt","antra-icon-sync":"sync","antra-icon-tachometer-alt":"tachometer-alt","antra-icon-th-large":"th-large","antra-icon-th-list":"th-list","antra-icon-thumbtack":"thumbtack","antra-icon-ticket":"ticket","antra-icon-times-circle":"times-circle","antra-icon-times":"times","antra-icon-trophy-alt":"trophy-alt","antra-icon-truck":"truck","antra-icon-user-headset":"user-headset","antra-icon-user-shield":"user-shield","antra-icon-user":"user","antra-icon-video":"video","antra-icon-wishlist-empty":"wishlist-empty","antra-icon-wishlist":"wishlist","antra-icon-adobe":"adobe","antra-icon-amazon":"amazon","antra-icon-android":"android","antra-icon-angular":"angular","antra-icon-apper":"apper","antra-icon-apple":"apple","antra-icon-atlassian":"atlassian","antra-icon-behance":"behance","antra-icon-bitbucket":"bitbucket","antra-icon-bitcoin":"bitcoin","antra-icon-bity":"bity","antra-icon-bluetooth":"bluetooth","antra-icon-btc":"btc","antra-icon-centos":"centos","antra-icon-chrome":"chrome","antra-icon-codepen":"codepen","antra-icon-cpanel":"cpanel","antra-icon-discord":"discord","antra-icon-dochub":"dochub","antra-icon-docker":"docker","antra-icon-dribbble":"dribbble","antra-icon-dropbox":"dropbox","antra-icon-drupal":"drupal","antra-icon-ebay":"ebay","antra-icon-facebook-f":"facebook-f","antra-icon-facebook-o":"facebook-o","antra-icon-facebook":"facebook","antra-icon-figma":"figma","antra-icon-firefox":"firefox","antra-icon-google-plus":"google-plus","antra-icon-google":"google","antra-icon-grunt":"grunt","antra-icon-gulp":"gulp","antra-icon-html5":"html5","antra-icon-instagram-o":"instagram-o","antra-icon-joomla":"joomla","antra-icon-link-brand":"link-brand","antra-icon-linkedin-in":"linkedin-in","antra-icon-linkedin":"linkedin","antra-icon-mailchimp":"mailchimp","antra-icon-opencart":"opencart","antra-icon-paypal":"paypal","antra-icon-pinterest-p":"pinterest-p","antra-icon-reddit":"reddit","antra-icon-skype":"skype","antra-icon-slack":"slack","antra-icon-snapchat":"snapchat","antra-icon-spotify":"spotify","antra-icon-trello":"trello","antra-icon-twitter":"twitter","antra-icon-vimeo":"vimeo","antra-icon-whatsapp":"whatsapp","antra-icon-wordpress":"wordpress","antra-icon-yoast":"yoast","antra-icon-youtube":"youtube"}', true );
			$icons     = $manager->get_control( 'icon' )->get_settings( 'options' );
			$new_icons = array_merge(
				$new_icons,
				$icons
			);
			// Then we set a new list of icons as the options of the icon control
			$manager->get_control( 'icon' )->set_settings( 'options', $new_icons ); 
        }

        public function add_icons_native($tabs) {
            global $antra_version;
            $tabs['opal-custom'] = [
                'name'          => 'antra-icon',
                'label'         => esc_html__('Antra Icon', 'antra'),
                'prefix'        => 'antra-icon-',
                'displayPrefix' => 'antra-icon-',
                'labelIcon'     => 'fab fa-font-awesome-alt',
                'ver'           => $antra_version,
                'fetchJson'     => get_theme_file_uri('/inc/elementor/icons.json'),
                'native'        => true,
            ];

            return $tabs;
        }

        public function load_style_custom_template_elementor() {
            if (is_singular('project')) {
                if (antra_get_theme_option('project_template', '') != '') {
                    $template = antra_get_page_by_slug(antra_get_theme_option('project_template', ''), 'elementor_library');
                    if (is_object($template)) {
                        $id_template = $template->ID;    
                    }
                }
            }

            if (isset($id_template)) {
                $css_file = Elementor\Core\Files\CSS\Post::create( $id_template );
                $css_file->enqueue();
            }
        }

        public function check_full_width($full_width) {
            if (is_singular('project')) {
                if (antra_get_theme_option('project_template', '') != '') {
                    $template = antra_get_page_by_slug(antra_get_theme_option('project_template', ''), 'elementor_library');
                    if (is_object($template)) {
                        return true;
                    }
                }
            }
            return $full_width;
        }
    }

endif;

return new Antra_Elementor();
