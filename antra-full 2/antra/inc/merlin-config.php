<?php
class Antra_Merlin_Config {

    private $wizard;

    public function __construct() {
        // Init Setup
        add_action( 'after_setup_theme', function() {
            $this->init();

        } );
        add_filter('merlin_import_files', [$this, 'import_files']);
        add_action('merlin_after_all_import', [$this, 'after_import_setup'], 10, 1);
        add_filter('merlin_generate_child_functions_php', [$this, 'render_child_functions_php']);
        add_action('import_start', function () {
            add_filter('wxr_importer.pre_process.post_meta', [$this, 'fiximport_elementor'], 10, 1);
        });

        add_action('import_end', function () {
            update_option('elementor_experiment-container', 'active');
            update_option('elementor_experiment-nested-elements', 'active');
            update_option('elementor_cpt_support', ['post', 'page', 'service','project']);
        });

        if (class_exists('Woo_Variation_Swatches_Deactivate_Feedback')) {
            remove_action( 'admin_footer', array( Woo_Variation_Swatches_Deactivate_Feedback::instance(), 'dialog' ) );
        }

        
    }

    public function fiximport_elementor($post_meta) {
        if ('_elementor_data' === $post_meta['key']) {
            $post_meta['value'] = wp_slash($post_meta['value']);
        }

        return $post_meta;
    }

    public function import_files(){
            return array(
            array(
                'import_file_name'           => 'home 1',
                'home'                       => 'home-1',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-1.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                'import_rev_slider_file_url' => 'http://source.wpopal.com/antra/dummy_data/revsliders/home-1/slider-1.zip',
                'import_more_revslider_file_url' => [],
                'import_lookbook_revslider_file_url' => [],
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-1.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-1',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 2',
                'home'                       => 'home-2',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-2.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                'import_rev_slider_file_url' => 'http://source.wpopal.com/antra/dummy_data/revsliders/home-2/slider-2.zip',
                'import_more_revslider_file_url' => [],
                'import_lookbook_revslider_file_url' => [],
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-2.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-2',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 3',
                'home'                       => 'home-3',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-3.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                'import_rev_slider_file_url' => 'http://source.wpopal.com/antra/dummy_data/revsliders/home-3/slider-3.zip',
                'import_more_revslider_file_url' => [],
                'import_lookbook_revslider_file_url' => [],
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-3.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-3',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 4',
                'home'                       => 'home-4',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-4.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                'import_rev_slider_file_url' => 'http://source.wpopal.com/antra/dummy_data/revsliders/home-4/slider-4.zip',
                'import_more_revslider_file_url' => [],
                'import_lookbook_revslider_file_url' => [],
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-4.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-4',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 5',
                'home'                       => 'home-5',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-5.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-5.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-5',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 6',
                'home'                       => 'home-6',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-6.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-6.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-6',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 7',
                'home'                       => 'home-7',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-7.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-7.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-7',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 8',
                'home'                       => 'home-8',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-8.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-8.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-8',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
            
            array(
                'import_file_name'           => 'home 9',
                'home'                       => 'home-9',
                'local_import_file'          => get_theme_file_path('/dummy-data/content.xml'),
                'homepage'                   => get_theme_file_path('/dummy-data/homepage/home-9.xml'),
                'local_import_widget_file'   => get_theme_file_path('/dummy-data/widgets.json'),
                
                'import_preview_image_url'   => get_theme_file_uri('/assets/images/oneclick/home-9.jpg'),
                'preview_url'                => 'https://demo2.themelexus.com/antra/home-9',
                'elementor'                  => '{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}',
                'themeoptions'               => '{}',
            ),
                        );           
        }

    public function after_import_setup($selected_import) {
        $selected_import = ($this->import_files())[$selected_import];

        // setup Home page
        $home = get_page_by_path($selected_import['home']);
        if ($home->ID) {
            update_option('show_on_front', 'page');
            update_option('page_on_front', $home->ID);
        }

        $this->set_demo_menus();

        // Setup Options
        $options = $this->get_all_options();
        $theme_options = $options['options'];
        foreach ($theme_options as $key => $option) {
            update_option($key, $option);
        }

        $active_kit_id = Elementor\Plugin::$instance->kits_manager->get_active_id();
        update_post_meta($active_kit_id, '_elementor_page_settings', json_decode($selected_import['elementor'], true));
        set_theme_mod('custom_logo', $this->get_attachment('_logo'));

        // Header Footer Builder
        $this->reset_header_footer();
        $this->set_hf($selected_import['home']);

        // Update Breadcrumb
        $this->update_breadcrumb($selected_import['home']);

        update_option('woocommerce_single_image_width', 1000);
        update_option('woocommerce_thumbnail_image_width', 600);

        \Elementor\Plugin::instance()->files_manager->clear_cache();

        $this->update_nav_menu_item();
        // $this->remove_quick_table_enable();
        $this->update_product();
        $this->setup_project_images();
        
        if (class_exists('Woo_Variation_Swatches')) {
            $this->update_color_attribute();
        }

        $mailchimp = $this->get_mailchimp_id();
        if ($mailchimp) {
            update_option('mc4wp_default_form_id', $mailchimp);
        }

        $home_url = home_url();
        $real_url = preg_replace("(^https?://)", "", $home_url );

        $this->replace_string_in_db('source.wpopal.com/antra', $real_url);
        $this->flush_permalink();

        \Elementor\Utils::replace_urls( 'http://source.wpopal.com/antra', $home_url );
        \Elementor\Utils::replace_urls( 'https://source.wpopal.com/antra', $home_url );
        
        \Elementor\Plugin::instance()->files_manager->clear_cache();

        update_option('lexus_check_oneclick', 1);
    }

    
    public static function replace_string_in_db($old_string, $new_string) {
        global $wpdb;
        
        try {
            $tables = $wpdb->get_col('SHOW TABLES');
            
            foreach ($tables as $table) {
                $columns = $wpdb->get_col("SHOW COLUMNS FROM $table");   
                foreach ($columns as $column) {
                    $wpdb->query(
                        $wpdb->prepare(
                            "UPDATE $table SET $table.$column = REPLACE($table.$column, %s, %s)",
                            $old_string,
                            $new_string
                        )
                    );
                }
            }
            return 'Done!';

        } catch (\Throwable $th) {
            return $th->getMessage();
        }
    }

    private function flush_permalink() {
        global $wp_rewrite;

        $structure = '/%postname%/';
        update_option('permalink_structure', $structure);

        $wp_rewrite->set_permalink_structure($structure);
        $wp_rewrite->flush_rules();
        
        flush_rewrite_rules(true); 
    }

    private static function get_clone_placeholder() {
        $upload_dir = wp_upload_dir();
        $logger_dir = $upload_dir['basedir'] . '/antra-upload';

        if ( ! file_exists( $logger_dir ) ) {
            wp_mkdir_p( $logger_dir );
        }
        
        $source = get_template_directory().'/assets/images/base/placeholder.jpg';
        $gallery = [];

        for ($i = 1; $i <= 5; $i++) { 
            $filename   = $logger_dir . '/placeholder-' . $i . '.jpg';
            $attach_url = $upload_dir['baseurl'].'/antra-upload/placeholder-' . $i . '.jpg';
    
            if ( file_exists( $filename ) ) {
                $attach_id = attachment_url_to_postid($attach_url);
                if ($attach_id) {
                    $gallery[$attach_id] = $attach_url;
                    continue;
                }
            } else {
                copy( $source, $filename ); // @codingStandardsIgnoreLine.
            }

            $filetype   = wp_check_filetype( basename( $filename ), null );
            $attachment = array(
                'guid'           => $attach_url,
                'post_mime_type' => $filetype['type'],
                'post_title'     => preg_replace( '/\.[^.]+$/', '', basename( $filename ) ),
                'post_content'   => '',
                'post_status'    => 'inherit',
            );
    
            $attach_id = wp_insert_attachment( $attachment, $filename );
            if ( is_wp_error( $attach_id ) ) {
                error_log('Error');
                continue;
            }
    
            // Make sure that this file is included, as wp_generate_attachment_metadata() depends on it.
            require_once ABSPATH . 'wp-admin/includes/image.php';
    
            // Generate the metadata for the attachment, and update the database record.
            $attach_data = wp_generate_attachment_metadata( $attach_id, $filename );
            wp_update_attachment_metadata( $attach_id, $attach_data );

            $gallery[$attach_id] = $attach_url;
    
        }

        return $gallery;
    }

    private function setup_project_images() {
        if (!post_type_exists('project')) return;

        $limit = -1;
 
        // getting all products
        $projects_ids = get_posts( array(
            'post_type'        => 'project',
            'numberposts'      => $limit,
            'post_status'      => 'publish',
            'fields'           => 'ids',
        ) );

        if (empty($projects_ids)) return;

        $gallery = self::get_clone_placeholder();

        $before_id = self::get_attachment_id_from_name('gallery-10');
        $after_id = self::get_attachment_id_from_name('gallery-6');
        $before_after = [];
        if ($before_id) {
            $before_after['before_image_id'] = $before_id;
            $before_after['before_image'] = wp_get_attachment_url($before_id);
        }
        if ($after_id) {
            $before_after['after_image_id'] = $after_id;
            $before_after['after_image'] = wp_get_attachment_url($after_id);
        }

        foreach ( $projects_ids as $project_id ) {
            if (!empty($gallery)) {
                update_post_meta($project_id, '_project_gallery', $gallery);
            }
            
            update_post_meta($project_id, '_project_before_after', [$before_after]);
        }
    }

    public static function get_attachment_id_from_name($filename_no_ext) {
        if (!is_string($filename_no_ext) || trim($filename_no_ext) === '') {
            return false;
        }

        global $wpdb;

        $query = $wpdb->prepare(
            "
            SELECT ID
            FROM $wpdb->posts
            WHERE post_type = 'attachment'
            AND post_title LIKE %s
            ORDER BY ID ASC
            LIMIT 1
            ",
            '%' . $wpdb->esc_like($filename_no_ext) . '%'
        );

        $attachment_id = $wpdb->get_var($query);

        return $attachment_id ? (int)$attachment_id : false;
    }

    private function update_product() {
        $limit = -1;
 
        // getting all products
        $products_ids = get_posts( array(
            'post_type'        => 'product', // or ['product','product_variation'],
            'numberposts'      => $limit,
            'post_status'      => 'publish',
            'fields'           => 'ids',
            'meta_query'       => array( array(
                'key'     => '_sync_updated',
                'compare' => 'NOT EXISTS',
            ) )
        ) );

        foreach ( $products_ids as $product_id ) {
            $product = wc_get_product($product_id);
            // Mark product as updated
            $product->update_meta_data( '_sync_updated', true );
            $product->save();
        }

    }

    private function update_color_attribute() {
        $attribute_slug = 'color'; // Replace with your attribute slug
        $attribute_id = wc_attribute_taxonomy_id_by_name( $attribute_slug );

        if ($attribute_id) {
        	wc_update_attribute( $attribute_id, ['type' => 'color'] );
        }

        $taxonomy = wc_attribute_taxonomy_name( $attribute_slug );
        $terms = get_terms([
        	'taxonomy' => $taxonomy,
        	'hide_empty' => false
        ]);

        if ($terms && !empty($terms)) {
        	foreach ($terms as $term) {
        		$color = ! empty( $term->description ) ? sanitize_hex_color( $term->description ) : '';
        		update_term_meta( $term->term_id, 'product_attribute_color', $color );
        	}
        }
    }
 
    //remove quick_table_enable
    private function remove_quick_table_enable() {
        $qte = get_option('woosc_settings');
        if ($qte['quick_table_enable'] == 'yes') {
            $qte['quick_table_enable'] = 'no';
            update_option('woosc_settings', $qte);
        }
    }

    private function update_nav_menu_item() {
        $params = array(
            'posts_per_page' => -1,
            'post_type'      => [
                'nav_menu_item',
            ],
        );
        $query  = new WP_Query($params);
        while ($query->have_posts()): $query->the_post();
            wp_update_post(array(
                // Update the `nav_menu_item` Post Title
                'ID'         => get_the_ID(),
                'post_title' => get_the_title()
            ));
        endwhile;

    }

    private function get_mailchimp_id() {
        $params = array(
            'post_type'      => 'mc4wp-form',
            'posts_per_page' => 1,
        );
        $post   = get_posts($params);

        return isset($post[0]) ? $post[0]->ID : 0;
    }

    private function get_attachment($key) {
        $params = array(
            'post_type'      => 'attachment',
            'post_status'    => 'inherit',
            'posts_per_page' => 1,
            'meta_key'       => $key,
        );
        $post   = get_posts($params);
        if ($post) {
            return $post[0]->ID;
        }

        return 0;
    }

    private function init() {
        $this->wizard = new Merlin(
            $config = array(
                // Location / directory where Merlin WP is placed in your theme.
                'merlin_url'         => 'merlin',
                // The wp-admin page slug where Merlin WP loads.
                'parent_slug'        => 'themes.php',
                // The wp-admin parent page slug for the admin menu item.
                'capability'         => 'manage_options',
                // The capability required for this menu to be displayed to the user.
                'dev_mode'           => true,
                // Enable development mode for testing.
                'license_step'       => false,
                // EDD license activation step.
                'license_required'   => false,
                // Require the license activation step.
                'license_help_url'   => '',
                'directory'          => '/inc/merlin',
                // URL for the 'license-tooltip'.
                'edd_remote_api_url' => '',
                // EDD_Theme_Updater_Admin remote_api_url.
                'edd_item_name'      => '',
                // EDD_Theme_Updater_Admin item_name.
                'edd_theme_slug'     => '',
                // EDD_Theme_Updater_Admin item_slug.
            ),
            $strings = array(
                'admin-menu'          => esc_html__('Theme Setup', 'antra'),

                /* translators: 1: Title Tag 2: Theme Name 3: Closing Title Tag */
                'title%s%s%s%s'       => esc_html__('%1$s%2$s Themes &lsaquo; Theme Setup: %3$s%4$s', 'antra'),
                'return-to-dashboard' => esc_html__('Return to the dashboard', 'antra'),
                'ignore'              => esc_html__('Disable this wizard', 'antra'),

                'btn-skip'                 => esc_html__('Skip', 'antra'),
                'btn-next'                 => esc_html__('Next', 'antra'),
                'btn-start'                => esc_html__('Start', 'antra'),
                'btn-no'                   => esc_html__('Cancel', 'antra'),
                'btn-plugins-install'      => esc_html__('Install', 'antra'),
                'btn-child-install'        => esc_html__('Install', 'antra'),
                'btn-content-install'      => esc_html__('Install', 'antra'),
                'btn-import'               => esc_html__('Import', 'antra'),
                'btn-license-activate'     => esc_html__('Activate', 'antra'),
                'btn-license-skip'         => esc_html__('Later', 'antra'),

                /* translators: Theme Name */
                'license-header%s'         => esc_html__('Activate %s', 'antra'),
                /* translators: Theme Name */
                'license-header-success%s' => esc_html__('%s is Activated', 'antra'),
                /* translators: Theme Name */
                'license%s'                => esc_html__('Enter your license key to enable remote updates and theme support.', 'antra'),
                'license-label'            => esc_html__('License key', 'antra'),
                'license-success%s'        => esc_html__('The theme is already registered, so you can go to the next step!', 'antra'),
                'license-json-success%s'   => esc_html__('Your theme is activated! Remote updates and theme support are enabled.', 'antra'),
                'license-tooltip'          => esc_html__('Need help?', 'antra'),

                /* translators: Theme Name */
                'welcome-header%s'         => esc_html__('Welcome to %s', 'antra'),
                'welcome-header-success%s' => esc_html__('Hi. Welcome back', 'antra'),
                'welcome%s'                => esc_html__('This wizard will set up your theme, install plugins, and import content. It is optional & should take only a few minutes.', 'antra'),
                'welcome-success%s'        => esc_html__('You may have already run this theme setup wizard. If you would like to proceed anyway, click on the "Start" button below.', 'antra'),

                'child-header'         => esc_html__('Install Child Theme', 'antra'),
                'child-header-success' => esc_html__('You\'re good to go!', 'antra'),
                'child'                => esc_html__('Let\'s build & activate a child theme so you may easily make theme changes.', 'antra'),
                'child-success%s'      => esc_html__('Your child theme has already been installed and is now activated, if it wasn\'t already.', 'antra'),
                'child-action-link'    => esc_html__('Learn about child themes', 'antra'),
                'child-json-success%s' => esc_html__('Awesome. Your child theme has already been installed and is now activated.', 'antra'),
                'child-json-already%s' => esc_html__('Awesome. Your child theme has been created and is now activated.', 'antra'),

                'plugins-header'         => esc_html__('Install Plugins', 'antra'),
                'plugins-header-success' => esc_html__('You\'re up to speed!', 'antra'),
                'plugins'                => esc_html__('Let\'s install some essential WordPress plugins to get your site up to speed.', 'antra'),
                'plugins-success%s'      => esc_html__('The required WordPress plugins are all installed and up to date. Press "Next" to continue the setup wizard.', 'antra'),
                'plugins-action-link'    => esc_html__('Advanced', 'antra'),

                'import-header'      => esc_html__('Import Content', 'antra'),
                'import'             => esc_html__('Let\'s import content to your website, to help you get familiar with the theme.', 'antra'),
                'import-action-link' => esc_html__('Advanced', 'antra'),

                'ready-header'      => esc_html__('All done. Have fun!', 'antra'),

                /* translators: Theme Author */
                'ready%s'           => esc_html__('Your theme has been all set up. Enjoy your new theme by %s.', 'antra'),
                'ready-action-link' => esc_html__('Extras', 'antra'),
                'ready-big-button'  => esc_html__('View your website', 'antra'),
                'ready-link-1'      => sprintf('<a href="%1$s" target="_blank">%2$s</a>', 'https://wordpress.org/support/', esc_html__('Explore WordPress', 'antra')),
                'ready-link-2'      => sprintf('<a href="%1$s" target="_blank">%2$s</a>', 'https://themebeans.com/contact/', esc_html__('Get Theme Support', 'antra')),
                'ready-link-3'      => sprintf('<a href="%1$s">%2$s</a>', admin_url('customize.php'), esc_html__('Start Customizing', 'antra')),
            )
        );
    }

    private function get_all_header_footer() {
        $id_home1 = ($obj = antra_get_page_by_slug('home-1')) ? 'post-'.$obj->ID : 'post-19';
        $id_home2 = ($obj = antra_get_page_by_slug('home-2')) ? 'post-'.$obj->ID : 'post-20';
        $id_home3 = ($obj = antra_get_page_by_slug('home-3')) ? 'post-'.$obj->ID : 'post-21';
        $id_home4 = ($obj = antra_get_page_by_slug('home-4')) ? 'post-'.$obj->ID : 'post-22';
        $id_home5 = ($obj = antra_get_page_by_slug('home-5')) ? 'post-'.$obj->ID : 'post-7218';
        $id_home6 = ($obj = antra_get_page_by_slug('home-6')) ? 'post-'.$obj->ID : 'post-7220';
        $id_home7 = ($obj = antra_get_page_by_slug('home-7')) ? 'post-'.$obj->ID : 'post-7223';
        $id_home8 = ($obj = antra_get_page_by_slug('home-8')) ? 'post-'.$obj->ID : 'post-8786';
        $id_home9 = ($obj = antra_get_page_by_slug('home-9')) ? 'post-'.$obj->ID : 'post-8788';
        
        $project_1 = ($obj = antra_get_page_by_slug('projects-01')) ? 'post-'.$obj->ID : 'post-27';
        $project_2 = ($obj = antra_get_page_by_slug('projects-02')) ? 'post-'.$obj->ID : 'post-28';
        $project_3 = ($obj = antra_get_page_by_slug('projects-03')) ? 'post-'.$obj->ID : 'post-29';

        $our_teams = ($obj = antra_get_page_by_slug('our-teams')) ? 'post-'.$obj->ID : 'post-33';
        $pricing_plan = ($obj = antra_get_page_by_slug('pricing-plan')) ? 'post-'.$obj->ID : 'post-34';
        $contact_us = ($obj = antra_get_page_by_slug('contact-us')) ? 'post-'.$obj->ID : 'post-35';

        return [
            'home-1' => [
                'header' => [
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-2' => [
                'header' => [
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-3' => [
                'header' => [
                    [
                        'slug'                         => 'header-2',
                        'ehf_target_include_locations' => ['rule' => ['specifics'], 'specific' => [$id_home3]],
                    ],
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                        'ehf_target_exclude_locations' => ['rule' => ['specifics'], 'specific' => [$id_home3]],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-4' => [
                'header' => [
                    [
                        'slug'                         => 'header-3',
                        'ehf_target_include_locations' => ['rule' => ['specifics'], 'specific' => [$id_home4]],
                    ],
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                        'ehf_target_exclude_locations' => ['rule' => ['specifics'], 'specific' => [$id_home4]],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-5' => [
                'header' => [
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-6' => [
                'header' => [
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-7' => [
                'header' => [
                    [
                        'slug'                         => 'header-2',
                        'ehf_target_include_locations' => ['rule' => ['specifics'], 'specific' => [$id_home7]],
                    ],
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                        'ehf_target_exclude_locations' => ['rule' => ['specifics'], 'specific' => [$id_home7]],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-8' => [
                'header' => [
                    [
                        'slug'                         => 'header-3',
                        'ehf_target_include_locations' => ['rule' => ['specifics'], 'specific' => [$id_home8]],
                    ],
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                        'ehf_target_exclude_locations' => ['rule' => ['specifics'], 'specific' => [$id_home8]],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
            'home-9' => [
                'header' => [
                    [
                        'slug'                         => 'header-2',
                        'ehf_target_include_locations' => ['rule' => ['specifics'], 'specific' => [$id_home9]],
                    ],
                    [
                        'slug'                         => 'header-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                        'ehf_target_exclude_locations' => ['rule' => ['specifics'], 'specific' => [$id_home9]],
                    ],
                    [
                        'slug'                         => 'header-4',
                        'ehf_target_include_locations' => ['rule' => ['special-404'], 'specific' => []],
                    ],
                ],
                'footer' => [
                    [
                        'slug'                         => 'footer-1',
                        'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                    ],
                    [
                        'slug'                         => 'footer-2',
                        'ehf_target_include_locations' => [
                            'rule' => [
                                'service|all',
                                'team|all',
                                'post|all',
                                'special-404',
                                'special-blog',
                                'specifics',
                            ], 
                            'specific' => [
                                $project_1,
                                $project_2,
                                $project_3,
                                $our_teams,
                                $pricing_plan,
                                $contact_us,
                            ]
                        ],
                    ]
                ]
            ],
        ];
    }

    private function get_update_breadcrumbs($home) {
        
        $bc_args = [
            'breadcrumb-single-blog' => [
                'ehf_target_include_locations' => ['rule' => ['basic-global'], 'specific' => []],
                'ehf_target_exclude_locations' => [
                    'rule' => ['post|all'], 
                    'specific' => []
                ],
            ],
        ];

        return $bc_args;
    }

    private function update_breadcrumb($home) {
        $update_bcs = $this->get_update_breadcrumbs($home);

        if (!empty($update_bcs)) {
            foreach ($update_bcs as $slug => $bc) {
                $bc_obj = get_page_by_path($slug, OBJECT, 'lexus-breadcrumb');
                if ($bc_obj) {
                    if (isset($bc['ehf_target_include_locations'])) {
                        update_post_meta($bc_obj->ID, 'ehf_target_include_locations', $bc['ehf_target_include_locations']);
                    }
                    if (isset($bc['ehf_target_exclude_locations'])) {
                        update_post_meta($bc_obj->ID, 'ehf_target_exclude_locations', $bc['ehf_target_exclude_locations']);
                    }
                }
            }
        }
    }

    private function reset_header_footer() {
        $footer_args = array(
            'post_type'      => 'elementor-hf',
            'posts_per_page' => -1,
            'meta_query'     => array(
                array(
                    'key'     => 'ehf_template_type',
                    'compare' => 'IN',
                    'value'   => ['type_footer', 'type_header']
                ),
            )
        );
        $footer      = new WP_Query($footer_args);
        while ($footer->have_posts()) : $footer->the_post();
            update_post_meta(get_the_ID(), 'ehf_target_include_locations', []);
            update_post_meta(get_the_ID(), 'ehf_target_exclude_locations', []);
        endwhile;
        wp_reset_postdata();
    }

    public function set_demo_menus() {
        $main_menu = get_term_by('name', 'Main Menu', 'nav_menu');

        set_theme_mod(
            'nav_menu_locations',
            array(
                'primary'  => $main_menu->term_id,
                'handheld' => $main_menu->term_id,
            )
        );
    }

    private function set_hf($home) {
        $all_hf = $this->get_all_header_footer();
        $datas  = $all_hf[$home];
        foreach ($datas as $item) {
            foreach ($item as $object) {
                $hf = get_page_by_path($object['slug'], OBJECT, 'elementor-hf');
                if ($hf) {
                    update_post_meta($hf->ID, 'ehf_target_include_locations', $object['ehf_target_include_locations']);
                    if (isset($object['ehf_target_exclude_locations'])) {
                        update_post_meta($hf->ID, 'ehf_target_exclude_locations', $object['ehf_target_exclude_locations']);
                    }
                }
            }
        }
    }

    public function render_child_functions_php() {
        $output
            = "<?php
/**
 * Theme functions and definitions.
 */
		 ";

        return $output;
    }

    public function get_all_options(){
        $options = [];
        $options['options']   = json_decode('{"antra_options_team_form":"a35fff57b697e129f3b2d9f2202b36d6c0fba77c","antra_options_blog_single_sidebar":"right","antra_options_blog_single_style":"","antra_options_single_product_gallery_layout":"without-thumb","antra_options_single_product_tab_layout":"default","woocommerce_catalog_columns":"3","antra_options_wocommerce_row_laptop":"2","antra_options_wocommerce_column_list_view":"1","antra_options_woocommerce_product_hover":"fade","antra_options_single_product_content_meta":"<p>[hfe_template id=\'1915\']</p>","antra_options_project_template":"project-single-layout"}', true);
        $options['elementor']   = json_decode('{"system_colors":[{"_id":"primary","title":"Primary","color":"#CAA05C"},{"_id":"secondary","title":"Secondary(Heading)","color":"#1C1C1D"},{"_id":"text","title":"Text","color":"#59585D"},{"_id":"accent","title":"Accent","color":"#1C1C1D"},{"_id":"lighter","title":"Lighter","color":"#9F9FA4"},{"_id":"dark","title":"Dark","color":"#000000"},{"_id":"border","title":"Border","color":"#E3E3E8"},{"_id":"background-field","title":"Background Field","color":"#F6F6F6"}],"custom_colors":[],"system_typography":[{"_id":"primary","title":"Primary","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"secondary","title":"Secondary(Heading)","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"text","title":"Text","typography_typography":"custom","typography_font_family":"Golos Text","typography_font_weight":"400"},{"_id":"accent","title":"Accent","typography_typography":"custom","typography_font_family":"Cal Sans","typography_font_weight":"400"},{"_id":"special","title":"Special","typography_typography":"custom"}],"custom_typography":[],"default_generic_fonts":"Serif","site_name":"Antra","site_description":"Architecture & Interior Design WordPress Theme","page_title_selector":"h1.entry-title","activeItemIndex":1,"active_breakpoints":["viewport_mobile","viewport_mobile_extra","viewport_tablet","viewport_tablet_extra","viewport_laptop"],"viewport_md":768,"viewport_lg":1025,"container_width":{"unit":"px","size":1410,"sizes":[]},"space_between_widgets":{"column":"0","row":"0","isLinked":true,"unit":"px","size":0,"sizes":[]},"body_background_background":"classic","body_background_color":"#F6F6F6","container_padding":{"unit":"px","top":"0","right":"0","bottom":"0","left":"0","isLinked":true},"hfe_scroll_to_top_button_text":"Up","typography_enable_styleguide_preview":"yes"}', true);
        return $options;
    } // end get_all_options
}

return new Antra_Merlin_Config();
