<?php
if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra_CMB2_Options_Admin')) :

    /**
     * Custom Admin Field By CMB2
     */
    class Antra_CMB2_Options_Admin {

        /**
         * Setup class.
         *
         * @since 1.0
         */
        public function __construct() {
            add_action( 'cmb2_init', [$this, 'add_project_metabox'] );
            add_action( 'cmb2_init', [$this, 'add_team_metabox'] );
            add_action( 'cmb2_init', [$this, 'add_virtual_tour_metabox'] );
        }

        public function add_project_metabox() {

            $objs = apply_filters('antra_meta_apply_for_project', ['project']); 

            $cmb = new_cmb2_box( array(
                'id'           => 'project_meta',
                'title'        => __( 'Project Detail', 'antra' ),
                'object_types' => $objs,
                'context'      => 'normal',
                'priority'     => 'high',
            ) );

            do_action('antra_before_project_meta', $cmb);

            $cmb->add_field( array(
                'name' => __( 'Client:', 'antra' ),
                'id' => '_project_client',
                'type' => 'text',
            ) );
            $cmb->add_field( array(
                'name' => __( 'Location:', 'antra' ),
                'id' => '_project_location',
                'type' => 'text',
            ) );
            $cmb->add_field( array(
                'name' => __( 'Architect:', 'antra' ),
                'id' => '_project_architect',
                'type' => 'text',
            ) );
            $cmb->add_field( array(
                'name' => __( 'Terms:', 'antra' ),
                'id' => '_project_terms',
                'type' => 'text',
            ) );
            $cmb->add_field( array(
                'name' => __( 'Strategy:', 'antra' ),
                'id' => '_project_strategy',
                'type' => 'text',
            ) );
            $cmb->add_field( array(
                'name' => __( 'Date:', 'antra' ),
                'id' => '_project_date',
                'type' => 'text_date',
            ) );

            $group_field_id = $cmb->add_field( array(
                'id'          => '_project_statistics',
                'type'        => 'group',
                'options'     => array(
                    'closed'         => false,
                    'group_title' => __('Project Statistics', 'antra')
                ),
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => __( 'Number', 'antra' ),
                'id'   => 'number',
                'type' => 'text',
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => __( 'Name', 'antra' ),
                'id'   => 'name',
                'type' => 'text',
            ) );

            do_action('antra_cmb2_project_statistics', $group_field_id, $cmb);

            $cmb->add_field( array(
                'name'    => __( 'Result Description', 'antra' ),
                'id'      => '_project_result_description',
                'type'    => 'wysiwyg',
                'options' => array(
                    'textarea_rows' => 15
                ),
            ) );
            $cmb->add_field( array(
                'name' => __( 'Video Youtube', 'antra' ),
                'id'   => '_project_video',
                'type' => 'oembed',
            ) );
            $cmb->add_field( array(
                'name' => __( 'Gallery', 'antra' ),
                'id'   => '_project_gallery',
                'type' => 'file_list',
                'query_args' => array( 'type' => 'image' ),
            ) );
            $before_after = $cmb->add_field( array(
                'id'   => '_project_before_after',
                'type'        => 'group',
                'repeatable'  => false,
                'options'     => array(
                    'closed'         => false,
                    'group_title' => __('Before - After Image', 'antra')
                ),
            ) );
            $cmb->add_group_field($before_after, array(
                'name'    => __('Before Image', 'antra'),
                'id'      => 'before_image',
                'type'    => 'file',
                'options' => array(
                    'url' => false,
                ),
                'query_args' => array( 'type' => 'image' ),
                'preview_size' => 'medium',
            ) );
            $cmb->add_group_field($before_after, array(
                'name'    => __('After Image', 'antra'),
                'id'      => 'after_image',
                'type'    => 'file',
                'options' => array(
                    'url' => false,
                ),
                'query_args' => array( 'type' => 'image' ),
                'preview_size' => 'medium',
            ) );
            $cmb->add_field( array(
                'name' => __( 'Image Virtual tours', 'antra' ),
                'id'   => '_project_panorama',
                'type'    => 'file',
                // 'options' => array(
                //     'url' => false,
                // ),
                'query_args' => array( 'type' => 'image' ),
                'preview_size' => 'medium',
            ) );

            do_action('antra_after_project_meta', $cmb);
        }

        public function add_team_metabox() {

            $objs = apply_filters('antra_cmb2_meta_apply_for_team', ['team']);

            $cmb = new_cmb2_box( array(
                'id'           => 'team_meta',
                'title'        => __( 'Team Meta', 'antra' ),
                'object_types' => $objs,
                'context'      => 'normal',
                'priority'     => 'high',
            ) );

            do_action('antra_cmb2_before_team_meta', $cmb);

            $cmb->add_field( array(
                'name' => __( 'Job position', 'antra' ),
                'id' => 'team_job',
                'type' => 'text',
            ) );

            $cmb->add_field( array(
                'name' => __( 'Phone number', 'antra' ),
                'id' => 'team_phone',
                'type' => 'text',
            ) );
            
            $cmb->add_field( array(
                'name' => __( 'Email', 'antra' ),
                'id' => 'team_email',
                'type' => 'text_email',
            ) );

            $cmb->add_field( array(
                'name' => __( 'Experience:', 'antra' ),
                'id' => 'team_experience',
                'type' => 'text',
            ) );

            $cmb->add_field( array(
                'name' => __( 'Responsibility:', 'antra' ),
                'id' => 'team_responsibility',
                'type' => 'text',
            ) );

            $cmb->add_field( array(
                'name' => __( 'Address:', 'antra' ),
                'id' => 'team_address',
                'type' => 'textarea_small',
            ) );

            $group_field_id = $cmb->add_field( array(
                'id'          => '_antra_socials_group',
                'type'        => 'group',
                'repeatable'  => false,
                'options'     => array(
                    'closed'         => false,
                    'group_title' => __('Socials', 'antra')
                ),
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => __( 'Facebook', 'antra' ),
                'id'   => 'social_fb',
                'type' => 'text_url',
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => __( 'X', 'antra' ),
                'id'   => 'social_x',
                'type' => 'text_url',
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => __( 'Instagram', 'antra' ),
                'id'   => 'social_ig',
                'type' => 'text_url',
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => __( 'LinkedIn', 'antra' ),
                'id'   => 'social_in',
                'type' => 'text_url',
            ) );

            do_action('antra_cmb2_team_socials', $group_field_id, $cmb);

            $cmb->add_field( array(
                'name' => __('Professional Skills', 'antra'),
                'id'   => 'team_professional_title',
                'type' => 'title',
            ) );

            $cmb->add_field( array(
                'name' => 'Professional Skills Description',
                'id' => 'team_description',
                'type' => 'textarea_small'
            ) );

            $group_field_id = $cmb->add_field( array(
                'id'          => 'team_skills_group',
                'type'        => 'group',
                // 'repeatable'  => false, // use false if you want non-repeatable group
                'options'     => array(
                    'group_title'       => __( 'Skill {#}', 'antra' ),
                    'add_button'        => __( 'Add Another Skill', 'antra' ),
                    'remove_button'     => __( 'Remove Skill', 'antra' ),
                    'sortable'          => true,
                    'closed'         => false,
                ),
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => 'Skill Title',
                'id'   => 'title',
                'type' => 'text',
            ) );
            $cmb->add_group_field( $group_field_id, array(
                'name' => 'Skill Level',
                'id'   => 'level',
                'type' => 'text_small',
                'attributes' => array(
                    'type' => 'number',
                    'pattern' => '\d*',
                    'min' => 0,
                    'max' => 100,
                ),
                'sanitization_cb' => 'absint',
                'escape_cb'       => 'absint',
            ) );
            
            do_action('antra_team_skills_group', $group_field_id, $cmb);

            do_action('antra_cmb2_after_team_meta', $cmb);
        }

        public function add_virtual_tour_metabox() {

            $objs = apply_filters('antra_meta_apply_for_virtual_tour', ['virtual_tour']);

            $cmb = new_cmb2_box( array(
                'id'           => 'virtual_tour_meta',
                'title'        => __( 'Virtual Tours Detail', 'antra' ),
                'object_types' => $objs,
                'context'      => 'normal',
                'priority'     => 'high',
            ) );

            do_action('antra_before_virtual_tour_meta', $cmb);

            $cmb->add_field( array(
                'name'    => __('Panorama Image', 'antra'),
                'desc'    => __('To create an image panorama, an equirectangular image (2 to 1 ratio e.g. width and height is 1024 x 512) is required. The following code creates a viewer and an image panorama with given url.', 'antra'),
                'id'      => '_panorama_image',
                'type'    => 'file',
                'options' => array(
                    'url' => true,
                ),
                'text'    => array(
                    'add_upload_file_text' => __('Add image', 'antra')
                ),
                'query_args' => array(
                    'type' => array(
                    	'image/jpeg',
                    	'image/png',
                    	'image/jpg',
                    ),
                ),
                'preview_size' => 'large',
            ) );
            
            do_action('antra_after_virtual_tour_meta', $cmb);
        }

    }

endif;

return new Antra_CMB2_Options_Admin();