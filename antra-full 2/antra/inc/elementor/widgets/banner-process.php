<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

use Elementor\Group_Control_Box_Shadow;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Typography;
use Elementor\Group_Control_Background;
use Elementor\Group_Control_Text_Stroke;
use Elementor\Group_Control_Image_Size;
use Elementor\Group_Control_Border;
use Elementor\Repeater;
use Antra\Elementor\Antra_Base_Widgets;
use Elementor\Utils;
use Elementor\Icons_Manager;

class Antra_Elementor_Banner_Process extends Antra_Base_Widgets {

    /**
     * Get widget name.
     *
     * Retrieve testimonial widget name.
     *
     * @return string Widget name.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_name() {
        return 'antra-banner-process';
    }

    /**
     * Get widget title.
     *
     * Retrieve testimonial widget title.
     *
     * @return string Widget title.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_title() {
        return esc_html__('Antra Banner Process', 'antra');
    }

    /**
     * Get widget icon.
     *
     * Retrieve testimonial widget icon.
     *
     * @return string Widget icon.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_icon() {
        return 'eicon-image-rollover';
    }

    public function get_script_depends() {
        return ['antra-elementor-banner-process'];
    }

    public function get_categories() {
        return array('antra-addons');
    }

    public function get_style_depends() {
        return ['e-swiper'];
    }

    /**
     * Register testimonial widget controls.
     *
     * Adds different input fields to allow the user to change and customize the widget settings.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function register_controls() {
        $this->start_controls_section(
            'section_banner_service',
            [
                'label' => esc_html__('Item', 'antra'),
            ]
        );
        $repeater = new Repeater();
        $repeater->add_control(
            'banner_service_image',
            [
                'label'      => esc_html__('Choose Image', 'antra'),
                'default'    => [
                    'url' => Elementor\Utils::get_placeholder_image_src(),
                ],
                'type'       => Controls_Manager::MEDIA,
                'show_label' => false,
            ]
        );
        $repeater->add_control(
            'banner_service_title',
            [
                'label'   => esc_html__('Title', 'antra'),
                'default' => 'Stop Animal Poaching',
                'type'    => Controls_Manager::TEXT,
            ]
        );

        $repeater->add_control(
            'banner_service_content',
            [
                'label'   => esc_html__('Content', 'antra'),
                'default' => 'Protect wildlife from the threats and illegal trade',
                'type'    => Controls_Manager::TEXTAREA,
            ]
        );
        $repeater->add_control(
            'link',
            [
                'label'       => esc_html__('Link to', 'antra'),
                'type'        => Controls_Manager::URL,
                'dynamic'     => [
                    'active' => true,
                ],
                'placeholder' => esc_html__('https://your-link.com', 'antra'),
            ]
        );
        $this->add_control(
            'banner_service_item',
            [
                'label'       => esc_html__('Items', 'antra'),
                'type'        => Controls_Manager::REPEATER,
                'fields'      => $repeater->get_controls(),
                'title_field' => '{{{ banner_service_title }}}',
            ]
        );
        $this->add_group_control(
            Group_Control_Image_Size::get_type(),
            [
                'name'      => 'banner_service_image', // Usage: `{name}_size` and `{name}_custom_dimension`, in this case `testimonial_image_size` and `testimonial_image_custom_dimension`.
                'default'   => 'full',
                'separator' => 'none',
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_style_banner_service_image',
            [
                'label' => esc_html__('Image', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );
        $this->add_responsive_control(
            'testimonial_height_img',
            [
                'label'      => esc_html__('Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 10,
                        'max' => 500,
                    ],
                    'vh' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', 'vh', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .banner-process-image-list .banner-process-img .process-image img' => 'height: {{SIZE}}{{UNIT}}',
                ],
            ]
        );
        $this->end_controls_section();

        $this->start_controls_section(
            'section_style_banner_service_content',
            [
                'label' => esc_html__('Content', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );
        $this->add_responsive_control(
            'banner_service_content_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption ' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'heading_banner_sv_title',
            [
                'label'     => esc_html__('Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'banner_sv_title_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-title'   => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-title a' => 'color: {{VALUE}};',
                ],
            ]
        );
        $this->add_control(
            'banner_sv_title_color_hover',
            [
                'label'     => esc_html__('Color Title Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-title:hover'   => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-title:hover a' => 'color: {{VALUE}};',

                ],
            ]
        );
        $this->add_group_control(
            Group_Control_Typography::get_type(),
            [
                'name'     => 'banner_sv_title_typography',
                'selector' => '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-title',
            ]
        );
        $this->add_responsive_control(
            'banner_sv_title_padding',
            [
                'label'      => esc_html__('Title Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-title' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
                ],
            ]
        );
        $this->add_control(
            'heading_banner_sv_description',
            [
                'label'     => esc_html__('Description', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );
        $this->add_control(
            'banner_sv_des_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-content' => 'color: {{VALUE}};',
                ],
            ]
        );
        $this->add_group_control(
            Group_Control_Typography::get_type(),
            [
                'name'     => 'banner_sv_des_typography',
                'selector' => '{{WRAPPER}} .elementor-banner-process-item .banner-process-caption .banner-process-content',
            ]
        );
        $this->end_controls_section();

        // Carousel column
        $this->get_controls_column();
        // Carousel options
        $this->get_control_carousel();
    }

    protected function render() {
        $settings = $this->get_settings_for_display();

        if (!empty($settings['banner_service_item']) && is_array($settings['banner_service_item'])) {
            $this->get_data_elementor_columns();
            $this->add_render_attribute('wrapper', 'class', 'elementor-banner-process-wrapper');
            $this->add_render_attribute('container', 'class', 'elementor-banner-process-container');
            $this->add_render_attribute('inner', 'class', 'elementor-banner-process-inner');
            $this->add_render_attribute('item', 'class', 'elementor-banner-process-item');

            $image_output = '';

            ?>
            <div <?php $this->print_render_attribute_string('wrapper'); ?>>
                <div <?php $this->print_render_attribute_string('container'); ?>>
                    <div <?php $this->print_render_attribute_string('inner'); ?>>
                        <?php foreach ($settings['banner_service_item'] as $index => $item):
                            $image_item_key = 'image-repeater-item' . $index;
                            $this->add_render_attribute($image_item_key, 'class', 'banner-process-img');
                            $this->add_render_attribute($image_item_key, 'class', 'image-item-' . esc_attr($item['_id']));


                            $pad_index = str_pad($index + 1, 2, '0', STR_PAD_LEFT);
                            $str_index = sprintf(__('%s step', 'antra'), $pad_index);

                            if ($index == 0) {
                                $this->add_render_attribute($image_item_key, 'class', 'show');
                            } else {
                                $this->add_render_attribute($image_item_key, 'style', 'display: none;');
                            }

                            ob_start();
                            ?>
                            <div <?php $this->print_render_attribute_string($image_item_key); ?>>
                                <?php $this->render_image($settings, $item); ?>
                            </div>
                            <?php
                            $image_output .= ob_get_clean();
                            ?>

                            <div <?php $this->print_render_attribute_string('item'); ?>>
                                <div class="banner-process-caption">
                                    <span class="number"><?php echo esc_html($pad_index); ?></span>
                                    <div class="banner-process-title">
                                        <?php
                                        $banner_service_title_html = esc_html($item['banner_service_title']);
                                        if (!empty($item['link']['url'])) :
                                            $banner_service_title_html = '<a href="' . esc_url($item['link']['url']) . '">' . esc_html($banner_service_title_html) . '</a>';
                                        endif;
                                        echo wp_kses_post($banner_service_title_html);
                                        ?>
                                    </div>
                                    <div class="banner-process-content"><?php echo esc_html($item['banner_service_content']); ?></div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <div class="banner-process-image-list">
                        <?php
                        printf('%s', $image_output);
                        ?>
                    </div>
                    <?php $this->get_swiper_navigation(count($settings['banner_service_item'])); ?>
                </div>
            </div>

            <?php
        }
    }

    private function render_image($settings, $item) {
        if (!empty($item['banner_service_image']['url'])) :
            ?>
            <div class="process-image">
                <?php
                $item['banner_service_image_size']             = $settings['banner_service_image_size'];
                $item['banner_service_image_custom_dimension'] = $settings['banner_service_image_custom_dimension'];
                echo Group_Control_Image_Size::get_attachment_image_html($item, 'banner_service_image');
                ?>
            </div>
        <?php
        endif;
    }
}

$widgets_manager->register(new Antra_Elementor_Banner_Process());
