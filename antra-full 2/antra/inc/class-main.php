<?php

if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra')) :

    /**
     * The main Antra class
     */
    class Antra {

        /**
         * Setup class.
         *
         * @since 1.0
         */
        public function __construct() {
            add_action('after_setup_theme', array($this, 'setup'));
            add_action('wp_head', [$this, 'preload'], 1);
            add_action('widgets_init', array($this, 'widgets_init'));
            add_filter('antra_theme_sidebar', array($this, 'set_sidebar'), 20);
            add_action('admin_enqueue_scripts', [$this, 'admin_scripts']);
            add_action('wp_enqueue_scripts', array($this, 'register_scripts_addon'), 5);
            add_action('wp_enqueue_scripts', array($this, 'scripts'), 10);
            add_action('wp_enqueue_scripts', array($this, 'child_scripts'), 30); // After WooCommerce.
            add_action('enqueue_block_assets', array($this, 'block_assets'));
            add_filter('body_class', array($this, 'body_classes'));
            add_filter('wp_page_menu_args', array($this, 'page_menu_args'));
            add_filter('navigation_markup_template', array($this, 'navigation_markup_template'));
            add_filter('block_editor_settings_all', array($this, 'custom_editor_settings'), 10, 2);
            add_action('tgmpa_register', [$this, 'register_required_plugins']);
            add_filter('gutenberg_use_widgets_block_editor', '__return_false');
            add_filter('use_widgets_block_editor', '__return_false');
            add_filter('dynamic_sidebar_params', [$this, 'check_sidebar_params']);
            add_filter('post_class', [$this, 'add_custom_post_class'], 10, 3);

            add_action('wpcf7_init', [$this,'custom_add_form_tag_time_selector']);
        }

        public function preload() {
            get_template_part('template-parts/preload');
        }

        public function register_required_plugins() {
            /**
             * Array of plugin arrays. Required keys are name and slug.
             * If the source is NOT from the .org repo, then source is also required.
             */
            $plugins = array(
                //====start_premium
                array(
                    'name'     => 'Revslider',
                    'slug'     => 'revslider',
                    'required' => true,
                    'source'   => esc_url('http://source.wpopal.com/plugins/new/revslider.zip'),
                ),
                //====end_premium
                array(
                    'name'     => 'Elementor – Header, Footer & Blocks Template',
                    'slug'     => 'header-footer-elementor',
                    'required' => true,
                ),

                array(
                    'name'     => 'Safe SVG',
                    'slug'     => 'safe-svg',
                    'required' => true,
                ),

                array(
                    'name'     => 'Make Column Clickable Elementor',
                    'slug'     => 'make-column-clickable-elementor',
                    'required' => true,
                ),

                array(
                    'name'     => 'Elementor',
                    'slug'     => 'elementor',
                    'required' => true,
                ),
                array(
                    'name'     => 'Mailchimp For Wordpress',
                    'slug'     => 'mailchimp-for-wp',
                    'required' => true,
                ),
                array(
                    'name'     => 'Contact Form 7',
                    'slug'     => 'contact-form-7',
                    'required' => true,
                ),
                array(
                    'name'     => 'CMB2',
                    'slug'     => 'cmb2',
                    'required' => false,
                ),
                //====start_premium
                array(
                    'name'     => 'Classic Editor',
                    'slug'     => 'classic-editor',
                    'required' => true,
                ),

                array(
                    'name'     => 'Classic Widgets',
                    'slug'     => 'classic-widgets',
                    'required' => true,
                ),

                array(
                    'name'     => 'ThemeLexus Debug',
                    'slug'     => 'themelexus-debug',
                    'required' => true,
                    'source'   => esc_url('http://source.wpopal.com/plugin_update/themelexus-debug.zip?ver='.time()),
                ),
                //====end_premium
                array(
                    'name'     => 'Woocommerce',
                    'slug'     => 'woocommerce',
                    'required' => true,
                ),
                array(
                    'name'     => 'Variation Swatches for WooCommerce',
                    'slug'     => 'woo-variation-swatches',
                    'required' => false,
                ),

                array(
                    'name'     => 'WPC Smart Compare for WooCommerce',
                    'slug'     => 'woo-smart-compare',
                    'required' => false,
                ),
                array(
                    'name'     => 'WPC Smart Wishlist for WooCommerce',
                    'slug'     => 'woo-smart-wishlist',
                    'required' => false,
                ),
                array(
                    'name'     => 'WPC Smart Quick View for WooCommerce',
                    'slug'     => 'woo-smart-quick-view',
                    'required' => false,
                )
            );

            /*
             * Array of configuration settings. Amend each line as needed.
             *
             * TGMPA will start providing localized text strings soon. If you already have translations of our standard
             * strings available, please help us make TGMPA even better by giving us access to these translations or by
             * sending in a pull-request with .po file(s) with the translations.
             *
             * Only uncomment the strings in the config array if you want to customize the strings.
             */
            $config = array(
                'id'           => 'antra',
                // Unique ID for hashing notices for multiple instances of TGMPA.
                'default_path' => '',
                // Default absolute path to bundled plugins.
                'menu'         => 'tgmpa-install-plugins',
                // Menu slug.
                'has_notices'  => true,
                // Show admin notices or not.
                'dismissable'  => true,
                // If false, a user cannot dismiss the nag message.
                'dismiss_msg'  => '',
                // If 'dismissable' is false, this message will be output at top of nag.
                'is_automatic' => false,
                // Automatically activate plugins after installation or not.
                'message'      => '',
            );

            tgmpa($plugins, $config);
        }

        /**
         * Sets up theme defaults and registers support for various WordPress features.
         *
         * Note that this function is hooked into the after_setup_theme hook, which
         * runs before the init hook. The init hook is too late for some features, such
         * as indicating support for post thumbnails.
         */
        public function setup() {

            // Loads wp-content/themes/child-theme-name/languages/antra.mo.
            load_theme_textdomain('antra', get_stylesheet_directory() . '/languages');

            // Loads wp-content/themes/antra/languages/antra.mo.
            load_theme_textdomain('antra', get_template_directory() . '/languages');

            /**
             * Add default posts and comments RSS feed links to head.
             */
            add_theme_support('automatic-feed-links');

            /*
             * Enable support for Post Thumbnails on posts and pages.
             *
             * @link https://developer.wordpress.org/reference/functions/add_theme_support/#Post_Thumbnails
             */
            add_theme_support('post-thumbnails');
            set_post_thumbnail_size(1000, 731, true);
            add_image_size('antra-post-defautl', 860, 629, true);
            add_image_size('antra-post-grid', 860, 629, false);

            /**
             * Register menu locations.
             */
            register_nav_menus(
                apply_filters(
                    'antra_register_nav_menus', array(
                        'primary'  => esc_html__('Primary Menu', 'antra'),
                        'handheld' => esc_html__('Handheld Menu', 'antra'),
                        'vertical' => esc_html__('Vertical Menu', 'antra'),
                    )
                )
            );

            // Add theme support for Custom Logo.
            add_theme_support('custom-logo', array(
                'width'       => 300,
                'height'      => 200,
                'flex-width'  => true,
                'flex-height' => true,
            ));

            /*
             * Switch default core markup for search form, comment form, comments, galleries, captions and widgets
             * to output valid HTML5.
             */
            add_theme_support(
                'html5', apply_filters(
                    'antra_html5_args', array(
                        'search-form',
                        'comment-form',
                        'comment-list',
                        'gallery',
                        'caption',
                        'widgets',
                        'script',
                        'style',
                    )
                )
            );

            /**
             * Declare support for title theme feature.
             */
            add_theme_support('title-tag');

            /**
             * Declare support for selective refreshing of widgets.
             */
            add_theme_support('customize-selective-refresh-widgets');

            /**
             * Add support for Block Styles.
             */
            add_theme_support('wp-block-styles');

            /**
             * Add support for full and wide align images.
             */
            add_theme_support('align-wide');

            /**
             * Add support for editor styles.
             */
            add_theme_support('editor-styles');

            /**
             * Add support for editor font sizes.
             */
            add_theme_support('editor-font-sizes', array(
                array(
                    'name' => esc_html__('Small', 'antra'),
                    'size' => 14,
                    'slug' => 'small',
                ),
                array(
                    'name' => esc_html__('Normal', 'antra'),
                    'size' => 16,
                    'slug' => 'normal',
                ),
                array(
                    'name' => esc_html__('Medium', 'antra'),
                    'size' => 23,
                    'slug' => 'medium',
                ),
                array(
                    'name' => esc_html__('Large', 'antra'),
                    'size' => 26,
                    'slug' => 'large',
                ),
                array(
                    'name' => esc_html__('Huge', 'antra'),
                    'size' => 37,
                    'slug' => 'huge',
                ),
            ));

            /**
             * Enqueue editor styles.
             */
            add_editor_style(array('assets/css/base/gutenberg-editor.css', $this->google_fonts()));

            /**
             * Add support for responsive embedded content.
             */
            add_theme_support('responsive-embeds');
        }

        /**
         * Register widget area.
         *
         * @link https://codex.wordpress.org/Function_Reference/register_sidebar
         */
        public function widgets_init() {
            $sidebar_args['sidebar']        = array(
                'name'        => esc_html__('Sidebar Archive', 'antra'),
                'id'          => 'sidebar-blog',
                'description' => '',
            );
            $sidebar_args['sidebar-single'] = array(
                'name'        => esc_html__('Sidebar Single Post', 'antra'),
                'id'          => 'sidebar-single',
                'description' => '',
            );

            $sidebar_args = apply_filters('antra_sidebar_args', $sidebar_args);

            foreach ($sidebar_args as $sidebar => $args) {
                $widget_tags = array(
                    'before_widget' => '<div id="%1$s" class="widget %2$s">',
                    'after_widget'  => '</div>',
                    'before_title'  => '<span class="gamma widget-title">',
                    'after_title'   => '</span>',
                );

                $filter_hook = sprintf('antra_%s_widget_tags', $sidebar);
                $widget_tags = apply_filters($filter_hook, $widget_tags);

                if (is_array($widget_tags)) {
                    register_sidebar($args + $widget_tags);
                }
            }
        }

        public function check_sidebar_params($params) {
            global $wp_registered_widgets;
            $settings_getter = $wp_registered_widgets[$params[0]['widget_id']]['callback'][0];
            $settings        = $settings_getter->get_settings();
            $settings        = $settings[$params[1]['number']];
            if (in_array($params[0]['after_widget'], ['</nav>', '</div>']) && !empty($settings['title'])) {
                if (in_array($settings_getter->option_name, ['widget_search', 'widget_text', 'widget_calendar'])) {
                    if (!empty($settings['title'])) {
                        $params[0]['after_title']  .= '<div class="widget-content">';
                        $params[0]['after_widget'] .= '</div>';
                    }
                } else {
                    $params[0]['after_title']  .= '<div class="widget-content">';
                    $params[0]['after_widget'] .= '</div>';
                }
            }

            return $params;
        }

        public function add_custom_post_class($classes, $css_class, $post_id) {
            if (is_singular('post')) {
                $style = antra_get_theme_option('blog_single_style', '');
                if ($style == '') {
                    $style = 1;
                }
                $classes[] = 'antra-style-post-'.$style;
            }

            return $classes;
        }
        
        public function admin_scripts() {
            wp_enqueue_style('antra-admin-style', get_theme_file_uri('assets/css/admin/admin.css'));
        }

        public function register_scripts_addon() {
            global $antra_version;
            $suffix = (defined('SCRIPT_DEBUG') && SCRIPT_DEBUG) ? '' : '.min';
            /**
             * Scripts antra
             */
            wp_register_script('antra-theme', get_template_directory_uri() . '/assets/js/frontend/main.js', array('jquery', 'wp-util', 'swiper'), $antra_version, true);
            wp_register_script('antra-virtual-tour', get_template_directory_uri() . '/assets/js/frontend/virtual-tour.js', array('jquery', 'three', 'panolens'), $antra_version, true);
            wp_register_script('antra-swiper', get_template_directory_uri() . '/assets/js/frontend/swiper.js', array('jquery', 'wp-util', 'swiper'), $antra_version, true);
            wp_register_script('antra-countdown', get_template_directory_uri() . '/assets/js/frontend/countdown.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-text-editor', get_template_directory_uri() . '/assets/js/frontend/text-editor.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-nav-mobile', get_template_directory_uri() . '/assets/js/frontend/nav-mobile.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-search-popup', get_template_directory_uri() . '/assets/js/frontend/search-popup.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-smoothscroll', get_template_directory_uri() . '/assets/js/frontend/scroll-smoother.js', array('jquery', 'antra-lenis'), $antra_version, true);
            wp_register_script('antra-mouse-cursor', get_template_directory_uri() . '/assets/js/frontend/mouse-cursor.js', array('jquery', 'antra-gsap'), $antra_version, true);
            wp_register_script('antra-skip-link-focus-fix', get_template_directory_uri() . '/assets/js/skip-link-focus-fix' . $suffix . '.js', array('jquery'), $antra_version, true);

            //Scripts libs
            wp_register_script('tooltipster', get_template_directory_uri() . '/assets/js/libs/tooltipster.bundle.js', array(), $antra_version, true);
            wp_register_script('beforeafter', get_template_directory_uri() . '/assets/js/libs/beforeafter.jquery.js', array(), $antra_version, true);
            wp_register_script('masonry-pkgd', get_template_directory_uri() . '/assets/js/libs/masonry.pkgd.min.js', array(), $antra_version, true);
            wp_register_script('jquery-scrollbar', get_template_directory_uri() . '/assets/js/libs/jquery.scrollbar.min.js', array(), $antra_version, true);
            wp_register_script('isotope', get_template_directory_uri() . '/assets/js/libs/isotope.pkgd.min.js', array(), $antra_version, true);
            wp_register_script('swiper', get_template_directory_uri() . '/assets/js/libs/swiper.js', array(), $antra_version, true);
            wp_register_script('magnific-popup', get_template_directory_uri() . '/assets/js/libs/jquery.magnific-popup.min.js', array('jquery'), $antra_version, true);
            wp_register_script('spritespin', get_template_directory_uri() . '/assets/js/libs/spritespin.js', array('jquery'), $antra_version, true);
            wp_register_script('sticky-kit', get_template_directory_uri() . '/assets/js/libs/jquery.sticky-kit.min.js', array('jquery'), $antra_version, true);
            wp_register_script('three', get_template_directory_uri() . '/assets/js/libs/three.min.js', array('jquery'), $antra_version, true);
            wp_register_script('panolens', get_template_directory_uri() . '/assets/js/libs/panolens.js', array('jquery'), $antra_version, true);
            wp_register_script('ipanorama', get_template_directory_uri() . '/assets/js/libs/ipanorama.min.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-fancybox', get_template_directory_uri() . '/assets/js/libs/jquery.fancybox.pack.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-waypoints', get_template_directory_uri() . '/assets/js/libs/waypoints.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-gsap', get_template_directory_uri() . '/assets/js/libs/gsap.min.js', array('jquery'), $antra_version, true);
            wp_register_script('antra-scrolltrigger', get_template_directory_uri() . '/assets/js/libs/gsap-scrolltrigger.min.js', array('antra-gsap'), $antra_version, true);
            wp_register_script('antra-scrollsmoother', get_template_directory_uri() . '/assets/js/libs/gsap-scrollsmoother.min.js', array('antra-gsap'), $antra_version, true);
            wp_register_script('antra-lenis', get_template_directory_uri() . '/assets/js/libs/lenis.min.js', array(), $antra_version, true);

            /**
             * Styles antra
             */
            wp_register_style('antra-style', get_template_directory_uri() . '/style.css', '', $antra_version);
            wp_register_style('antra-elementor-grid', get_template_directory_uri() . '/assets/css/base/elementor-grid.css', '', $antra_version);

            //Style libs
            wp_register_style('tooltipster', get_template_directory_uri() . '/assets/css/libs/tooltipster.bundle.min.css', '', $antra_version);
            wp_register_style('jquery-scrollbar', get_template_directory_uri() . '/assets/css/libs/jquery.scrollbar.css', '', $antra_version);
            wp_register_style('magnific-popup', get_template_directory_uri() . '/assets/css/libs/magnific-popup.css', '', $antra_version);
            wp_register_style('antra-fancybox', get_template_directory_uri() . '/assets/css/libs/jquery.fancybox.css', '', $antra_version);
        }

        /**
         * Enqueue scripts and styles.
         *
         * @since  1.0.0
         */
        public function scripts() {
            /**
             * Google Fonts Default
             */
            wp_enqueue_style('antra-fonts', $this->google_fonts(), array(), null);

            /**
             * Styles
             */
            wp_enqueue_style('antra-style');
            wp_style_add_data('antra-style', 'rtl', 'replace');

            if (!antra_is_elementor_activated()) {
                wp_enqueue_style('antra-elementor-grid');
            }

            /**
             * Scripts
             */
            wp_enqueue_script('antra-theme');
            wp_localize_script('antra-theme', 'antraAjax', array('ajaxurl' => admin_url('admin-ajax.php')));
            wp_enqueue_script('imagesloaded');
            wp_enqueue_script('antra-skip-link-focus-fix');
            wp_enqueue_script('antra-search-popup');
            wp_enqueue_script('antra-smoothscroll');
            wp_enqueue_script('antra-mouse-cursor');
            
            if (is_singular() && comments_open() && get_option('thread_comments')) {
                wp_enqueue_script('comment-reply');
            }

            if (antra_is_elementor_activated()) {
                wp_enqueue_script('antra-text-editor');
            }
            if (isset(get_nav_menu_locations()['handheld'])) {
                wp_enqueue_script('antra-nav-mobile');
            }
        }

        /**
         * Register Google fonts.
         *
         * @return string Google fonts URL for the theme.
         * value : 'londrina-solid' => 'Londrina+Solid:300,400,900',
         * @since 2.4.0
         */
        public function google_fonts() {
            $google_fonts = apply_filters('antra_google_font_families',
                [
                    'Cal Sans'   => 'Cal+Sans',
                    'Golos Text' => 'Golos+Text:wght@400..900',
                ]
            );

            if (count($google_fonts) <= 0) {
                return false;
            }

            $query_args = array(
                'family'  => implode('&family=', $google_fonts),
                'subset'  => rawurlencode('latin,latin-ext'),
                'display' => 'swap',
            );

            $fonts_url = add_query_arg($query_args, '//fonts.googleapis.com/css2');

            return $fonts_url;
        }

        /**
         * Enqueue block assets.
         *
         * @since 2.5.0
         */
        public function block_assets() {
            global $antra_version;

            // Styles.
            wp_enqueue_style('antra-gutenberg-blocks', get_template_directory_uri() . '/assets/css/base/gutenberg-blocks.css', '', $antra_version);
            wp_style_add_data('antra-gutenberg-blocks', 'rtl', 'replace');
        }

        /**
         * Enqueue child theme stylesheet.
         * A separate function is required as the child theme css needs to be enqueued _after_ the parent theme
         * primary css and the separate WooCommerce css.
         *
         * @since  1.5.3
         */
        public function child_scripts() {
            if (is_child_theme()) {
                $child_theme = wp_get_theme(get_stylesheet());
                wp_enqueue_style('antra-child-style', get_stylesheet_uri(), array(), $child_theme->get('Version'));
            }
        }

        /**
         * Get our wp_nav_menu() fallback, wp_page_menu(), to show a home link.
         *
         * @param array $args Configuration arguments.
         *
         * @return array
         */
        public function page_menu_args($args) {
            $args['show_home'] = true;

            return $args;
        }

        /**
         * Adds custom classes to the array of body classes.
         *
         * @param array $classes Classes for the body element.
         *
         * @return array
         */
        public function body_classes($classes) {
            global $is_lynx, $is_gecko, $is_IE, $is_opera, $is_NS4, $is_safari, $is_chrome, $is_iphone;
            if ($is_lynx) {
                $classes[] = 'lynx';
            } elseif ($is_gecko) {
                $classes[] = 'gecko';
            } elseif ($is_opera) {
                $classes[] = 'opera';
            } elseif ($is_NS4) {
                $classes[] = 'ns4';
            } elseif ($is_safari) {
                $classes[] = 'safari';
            } elseif ($is_chrome) {
                $classes[] = 'chrome';
            } elseif ($is_IE) {
                $classes[] = 'ie';
            }

            if ($is_iphone) {
                $classes[] = 'iphone';
            }

            // Adds a class to blogs with more than 1 published author.
            if (is_multi_author()) {
                $classes[] = 'group-blog';
            }

            if (antra_get_theme_option('header_type', 1) == 'side') {
                $classes[] = 'antra-header-side';
            }

            /**
             * Adds a class when WooCommerce is not active.
             *
             * @todo Refactor child themes to remove dependency on this class.
             */
            $classes[] = 'no-wc-breadcrumb';
            $sidebar   = antra_get_theme_option('blog_archive_sidebar', 'right');


            if (is_singular('post')) {
                if (!is_active_sidebar('sidebar-single')) {
                    $classes[] = 'antra-full-width-content';
                } else {
                    if (antra_get_theme_option('blog_single_sidebar', 'right') == 'none') {
                        $classes[] = 'antra-full-width-content';
                    } else {
                        $classes[] = 'antra-sidebar-' . antra_get_theme_option('blog_single_sidebar', 'right');
                        if ($sidebar == 'left') {
                            $classes[] = 'antra-sidebar-left';
                        }
                    }
                }
            } else {
                $check_woo = false;
                if (antra_is_woocommerce_activated()) {
                    if (is_shop() || is_product_category()) {
                        $check_woo = true;
                    }
                }
                if (!$check_woo) {
                    if (is_tax('project-category')) {
                        $classes[] = 'antra-full-width-content';
                    } else {
                        if (is_archive() || is_home() || is_category() || is_tag() || is_author() || is_search()) {
                            if (!is_active_sidebar('sidebar-blog') || (is_post_type_archive('antra_service') || is_tax('antra_service_cat')) || (is_post_type_archive('antra_project') || is_tax('antra_project_cat'))) {
                                $classes[] = 'antra-full-width-content';
                            } else {
        
                                if (antra_get_theme_option('blog_sidebar') == 'none') {
                                    $classes[] = 'antra-full-width-content';
                                } else {
                                    $classes[] = 'antra-sidebar-' . antra_get_theme_option('blog_sidebar');
                                }
                            }
                        }
                    }
                }
            }

            if (is_singular('antra_service')) {
                $classes[] = 'antra-full-width-content';
            }

            if (is_singular('antra_project')) {
                $classes[] = 'antra-full-width-content';
            }

            // Add class when using homepage template + featured image.
            if (has_post_thumbnail()) {
                $classes[] = 'has-post-thumbnail';
            }

            return $classes;
        }

        public function set_sidebar($name) {
            if (is_tax('project-category')) {
                return $name;
            }
            if (is_singular('post')) {
                if (is_active_sidebar('sidebar-single') && antra_get_theme_option('blog_single_sidebar') != 'none') {
                    $name = 'sidebar-single';
                }
            } else {
                if (is_archive() || is_home() || is_category() || is_tag() || is_author() || is_search()) {
                    if (is_active_sidebar('sidebar-blog') && (!is_post_type_archive('antra_service') && !is_tax('antra_service_cat')) && (!is_post_type_archive('antra_project') && !is_tax('antra_project_cat')) && antra_get_theme_option('blog_sidebar') != 'none') {
                        $name = 'sidebar-blog';
                    }
                }
            }

            return $name;
        }

        /**
         * Adds a custom parameter to the editor settings that is used
         * to track whether the main sidebar has widgets.
         *
         * @param array $settings Default editor settings.
         * @param WP_Post $post Post being edited.
         *
         * @return array Filtered block editor settings.
         * @since 2.4.3
         *
         */
        public function custom_editor_settings($settings, $post) {
            $settings['mainSidebarActive'] = false;

            if (is_active_sidebar('sidebar-blog')) {
                $settings['mainSidebarActive'] = true;
            }

            return $settings;
        }

        /**
         * Custom navigation markup template hooked into `navigation_markup_template` filter hook.
         */
        public function navigation_markup_template() {
            $template = '<nav id="post-navigation" class="navigation %1$s" role="navigation" aria-label="' . esc_attr__('Post Navigation', 'antra') . '">';
            $template .= '<h2 class="screen-reader-text">%2$s</h2>';
            $template .= '<div class="nav-links">%3$s</div>';
            $template .= '</nav>';

            return apply_filters('antra_naigation_markup_template', $template);
        }
 
        public function custom_add_form_tag_time_selector() {
            wpcf7_add_form_tag( 'time_selector', [$this, 'custom_time_selector_form_tag_handler'] ); 
        }
        
        public function custom_time_selector_form_tag_handler( $tag ) {	

            if( ! $tag instanceof WPCF7_FormTag ) return '';

            $name = $tag->name;
            if (empty($name)) {
                $name = 'time_selector';
            }

            ob_start();
            ?>
            <span class="wpcf7-form-control-wrap" data-name="<?php $name ?>">
                <input class="wpcf7-form-control" type="time" name="<?php $name ?>" value="" />
            </span>
            <?php
            $html_time = ob_get_clean();
            
            return $html_time;
        }

    }
endif;

return new Antra();
