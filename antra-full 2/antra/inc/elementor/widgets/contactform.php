<?php
if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}
if (!antra_is_contactform_activated()) {
    return;
}

use Elementor\Controls_Manager;


class Antra_Elementor_ContactForm extends Elementor\Widget_Base {

    public function get_name() {
        return 'antra-contactform';
    }

    public function get_title() {
        return esc_html__('Antra Contact Form', 'antra');
    }

    public function get_categories() {
        return array('antra-addons');
    }

    public function get_icon() {
        return 'eicon-form-horizontal';
    }

    protected function register_controls() {
        $this->start_controls_section(
            'contactform7',
            [
                'label' => esc_html__('General', 'antra'),
                'tab'   => Controls_Manager::TAB_CONTENT,
            ]
        );
        $cf7               = get_posts('post_type="wpcf7_contact_form"&numberposts=-1');
        $contact_forms[''] = esc_html__('Please select form', 'antra');
        if ($cf7) {
            foreach ($cf7 as $cform) {
                $hash = get_post_meta( $cform->ID, '_hash', true );
                if ($hash) {
                    $contact_forms[$hash] = $cform->post_title;
                }
            }
        } else {
            $contact_forms[0] = esc_html__('No contact forms found', 'antra');
        }

        $this->add_control(
            'cf_id',
            [
                'label'   => esc_html__('Select contact form', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'options' => $contact_forms,
                'default' => ''
            ]
        );

        $this->add_control(
            'form_name',
            [
                'label'   => esc_html__('Form name', 'antra'),
                'type'    => Controls_Manager::TEXT,
                'default' => esc_html__('Contact form', 'antra'),
            ]
        );

        $this->add_responsive_control(
            'align',
            [
                'label'        => esc_html__('Alignment', 'antra'),
                'type'         => Controls_Manager::CHOOSE,
                'options'      => [
                    'left'   => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center' => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'right'  => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                ],
                'default' => '',
                'selectors' => [
                    '{{WRAPPER}} .wpcf7-form'  => 'text-align: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'contactform7_style',
            [
                'label' => esc_html__('Form', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'form_background_color',
            [
                'label'     => esc_html__('Background color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} input[type="text"],  
                    {{WRAPPER}} input[type="number"], 
                     {{WRAPPER}} input[type="email"], 
                     {{WRAPPER}} input[type="tel"], 
                     {{WRAPPER}} input[type="url"], 
                     {{WRAPPER}} input[type="password"], 
                     {{WRAPPER}} input[type="search"], 
                     {{WRAPPER}} input[type="date"], 
                     {{WRAPPER}} textarea, 
                      {{WRAPPER}} select:not([size]):not([multiple]), 
                     {{WRAPPER}} input[type="time"]' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'form_label',
            [
                'label' => esc_html__('Label', 'antra'),
                'type'  => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'label_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .wpcf7-form .wpcf7-checkbox label' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .wpcf7-form label' => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_section();
    }

    protected function render() {
        $settings = $this->get_settings_for_display();
        if (!$settings['cf_id'] || empty($settings['cf_id'])) {
            return;
        }


        $form = wpcf7_get_contact_form_by_hash($settings['cf_id']);

        if (!$form) return;
        $id = $form->id();
        
        $args['id']    = $id;
        $args['title'] = $settings['form_name'];

        echo antra_do_shortcode('contact-form-7', $args);
    }
}

$widgets_manager->register(new Antra_Elementor_ContactForm());
