<?php

if (!defined('ABSPATH')) {
    exit;
}

if (!class_exists('Antra_CF7_Service')) :

    /**
     * The CF7 Antra class
     */
    class Antra_CF7_Service {

        /**
         * Setup class.
         *
         * @since 1.0
         */
        public function __construct() {

            add_action( 'wpcf7_init', [$this, 'wpcf7_add_form_tag_antra_service'], 10, 0 );
            add_action( 'wpcf7_swv_create_schema', [$this, 'wpcf7_swv_add_antra_service_rules'], 10, 2 );
            add_action( 'wpcf7_admin_init', [$this, 'wpcf7_add_tag_generator_antra_service_menu'], 100, 0 );

        }

        public function wpcf7_add_form_tag_antra_service() {
            wpcf7_add_form_tag( array( 'antraservice', 'antraservice*' ),
                [$this, 'antra_select_service_form_tag_handler'],
                array(
                    'name-attr' => true,
                    'selectable-values' => true,
                )
            );
        }


        public function antra_select_service_form_tag_handler( $tag ) {
            if ( empty( $tag->name ) ) {
                return '';
            }

            $validation_error = wpcf7_get_validation_error( $tag->name );

            $class = wpcf7_form_controls_class( $tag->type );

            if ( $validation_error ) {
                $class .= ' wpcf7-not-valid';
            }

            $atts = array();

            $atts['class'] = $tag->get_class_option( $class );
            $atts['id'] = $tag->get_id_option();
            $atts['tabindex'] = $tag->get_option( 'tabindex', 'signed_int', true );

            if ( $tag->is_required() ) {
                $atts['aria-required'] = 'true';
            }

            if ( $validation_error ) {
                $atts['aria-invalid'] = 'true';
                $atts['aria-describedby'] = wpcf7_get_validation_error_reference(
                    $tag->name
                );
            } else {
                $atts['aria-invalid'] = 'false';
            }

            if ( $tag->has_option( 'size' ) ) {
                $size = $tag->get_option( 'size', 'int', true );

                if ( $size ) {
                    $atts['size'] = $size;
                } else {
                    $atts['size'] = 1;
                }
            }

            $placeholder = (string) reset( $tag->values );
            if (empty($placeholder)) {
                $placeholder = __('Choose service', 'antra');
            }
            $values = [''];
            $labels = [$placeholder];

            $args_service = [
                'post_type'        => 'service',
                'posts_per_page'   => -1,
                'post_status' => 'publish'
            ];

            $query_service = new WP_Query( $args_service );

            if ( $query_service->have_posts() ) {
                while ( $query_service->have_posts() ) {
                    $query_service->the_post();
                    $values[] = get_the_title();
                    $labels[] = get_the_title();
                }
            }
            wp_reset_query();

            $html = '';

            foreach ( $values as $key => $value ) {
                $item_atts = array(
                    'value' => $value
                );

                $label = isset( $labels[$key] ) ? $labels[$key] : $value;

                $html .= sprintf(
                    '<option %1$s>%2$s</option>',
                    wpcf7_format_atts( $item_atts ),
                    esc_html( $label )
                );
            }

            $atts['name'] = $tag->name;

            $html = sprintf(
                '<span class="wpcf7-form-control-wrap" data-name="%1$s"><select %2$s>%3$s</select>%4$s</span>',
                esc_attr( $tag->name ),
                wpcf7_format_atts( $atts ),
                $html,
                $validation_error
            );

            return $html;
        }

        public function wpcf7_swv_add_antra_service_rules( $schema, $contact_form ) {
            $tags = $contact_form->scan_form_tags( array(
                'basetype' => array( 'antraservice' ),
            ) );

            foreach ( $tags as $tag ) {
                $schema->add_rule(
                    wpcf7_swv_create_rule( 'required', array(
                        'field' => $tag->name,
                        'error' => wpcf7_get_message( 'invalid_required' ),
                    ) )
                );
            }
        }
        public function wpcf7_add_tag_generator_antra_service_menu() {
            $tag_generator = WPCF7_TagGenerator::get_instance();
            $tag_generator->add(
                'antraservice',
                __('antra service', 'antra'),
                [$this, 'antra_service_tag_generator_menu'],
                ['version' => '2']
            );
        }

        public function antra_service_tag_generator_menu( $contact_form, $args = '' ) {
            $field_types = array(
                'antraservice' => array(
                    'display_name' => __( 'Service', 'antra' ),
                    'heading' => __( 'Drop-down menu form-tag generator', 'antra' ),
                    'description' => __( 'Generates a form-tag for Service post type', 'antra' ),
                ),
            );
        
            $tgg = new WPCF7_TagGeneratorGenerator( $args['content'] );
            ?>
            <header class="description-box">
                <h3><?php
                    echo esc_html( $field_types['antraservice']['heading'] );
                ?></h3>

                <p><?php
                    echo wp_kses(
                        $field_types['antraservice']['description'],
                        array(
                            'a' => array( 'href' => true ),
                            'strong' => array(),
                        ),
                        array( 'http', 'https' )
                    );
                ?></p>
            </header>

            <div class="control-box">
                <?php
                    $tgg->print( 'field_type', array(
                        'with_required' => true,
                        'select_options' => array(
                            'antraservice' => $field_types['antraservice']['display_name'],
                        ),
                    ) );

                    $tgg->print( 'field_name' );

                    $tgg->print( 'class_attr' );

                    $tgg->print( 'default_value', array(
                        'type' => 'text',
                        'title' => __('Placeholder', 'antra'),
                        // 'with_placeholder' => true,
                    ) );
                ?>
            </div>

            <footer class="insert-box">
                <?php
                    $tgg->print( 'insert_box_content' );

                    $tgg->print( 'mail_tag_tip' );
                ?>
            </footer>
            <?php
        }
    
    }

endif;

return new Antra_CF7_Service();