<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('service')) {
    return;
}

use Antra\Elementor\Antra_Base_Widgets;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Background;
use Elementor\Group_Control_Border;
use Elementor\Group_Control_Box_Shadow;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;
use Elementor\Group_Control_Text_Shadow;
use Elementor\Group_Control_Text_Stroke;
use Antra\Elementor\Antra_Group_Control_Typography;
use Elementor\Repeater;
use Elementor\Icons_Manager;

/**
 * Elementor tabs widget.
 *
 * Elementor widget that displays vertical or horizontal tabs with different
 * pieces of content.
 *
 * @since 1.0.0
 */
class Antra_Elementor_Widget_Service_Accordion extends Antra_Base_Widgets {

    private $image_size = 'large';
    
    private $layout = '1';


    public function get_categories() {
        return array('antra-addons');
    }

    /**
     * Get widget name.
     *
     * Retrieve tabs widget name.
     *
     * @return string Widget name.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_name() {
        return 'antra-services-accordion';
    }

    /**
     * Get widget title.
     *
     * Retrieve tabs widget title.
     *
     * @return string Widget title.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_title() {
        return esc_html__('Antra Services Accordion', 'antra');
    }

    /**
     * Get widget icon.
     *
     * Retrieve tabs widget icon.
     *
     * @return string Widget icon.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_icon() {
        return 'eicon-accordion';
    }


    public function get_script_depends() {
        return [
            'antra-elementor-service-accordion',
        ];
    }

    /**
     * Register tabs widget controls.
     *
     * Adds different input fields to allow the user to change and customize the widget settings.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function register_controls() {

        //Section Query
        $this->start_controls_section(
            'section_setting',
            [
                'label' => esc_html__('Settings', 'antra'),
                'tab'   => Controls_Manager::TAB_CONTENT,
            ]
        );

        $this->add_control(
            'show_option',
            [
                'label'   => esc_html__('Show Service', 'antra'),
                'type'    => Controls_Manager::HIDDEN,
                'default' => 'select',
            ]
        );

        $repeater = new Repeater();

        $repeater->add_control(
            'selected_icon',
            [
                'label' => esc_html__('Icon', 'antra'),
                'type'  => Controls_Manager::HIDDEN,
            ]
        );

        $repeater->add_control(
            'choose_service',
            [
                'label'     => __('Service', 'antra'),
                'type'      => 'service',
                'multiple'    => false,
                'label_block' => true,
                // 'separator' => 'before'
            ]
        );

        $this->add_control(
            'services_list',
            [
                'label'       => esc_html__('Services', 'antra'),
                'type'        => Controls_Manager::REPEATER,
                'fields'      => $repeater->get_controls(),
                'default' => [
                    [
                        'selected_icon' => '',
                    ],
                ],
                'condition' => [
                    'show_option' => 'select'
                ],
                'separator' => 'after'
            ]
        );

        $this->add_control(
            'advanced',
            [
                'label' => esc_html__('Advanced', 'antra'),
                'type'  => Controls_Manager::HEADING,
            ]
        );

        $this->add_control(
            'orderby',
            [
                'label'   => esc_html__('Order By', 'antra'),
                'type'    => Controls_Manager::HIDDEN,
                'default' => 'post__in',
                
            ]
        );

        $this->add_control(
            'order',
            [
                'label'   => esc_html__('Order', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => 'desc',
                'options' => [
                    'asc'  => esc_html__('ASC', 'antra'),
                    'desc' => esc_html__('DESC', 'antra'),
                ],
            ]
        );

        $this->add_group_control(
            Elementor\Group_Control_Image_Size::get_type(),
            [
                'name'      => 'image_thumbnail',
                'default'   => 'large',
                'exclude' => ['custom']
            ]
        );

        $this->add_control(
            'layout',
            [
                'label'   => esc_html__('Layout', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => '1',
                'options' => [
                    '1' => esc_html__('Layout 1', 'antra'),
                    '2' => esc_html__('Layout 2', 'antra'),
                    '3' => esc_html__('Layout 3', 'antra'),
                ],
                'render_type' => 'template',
                'prefix_class' => 'antra-service-accordion-layout-'
            ]
        );

        $this->end_controls_section();


        //Section Title
        $this->start_controls_section(
            'section_service_title',
            [
                'label' => esc_html__('Side Left', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'wrapper_heading',
            [
                'label'     => esc_html__('Item', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'none',
            ]
        );

        $this->add_responsive_control(
            'service_item_height',
            [
                'label'      => esc_html__('Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 200,
                        'max' => 1000,
                    ],
                    '%' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-list-wrapper' => 'height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_content_head',
            [
                'label'     => esc_html__('Image', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'separator' => 'none',
            ]
        );

        $this->add_responsive_control(
            'service_image_width',
            [
                'label'      => esc_html__('Width', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 200,
                        'max' => 1000,
                    ],
                    '%' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-image' => 'max-width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'service_image_height',
            [
                'label'      => esc_html__('Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 200,
                        'max' => 1000,
                    ],
                    '%' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-image' => 'height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'box_content_margin',
            [
                'label'      => esc_html__('Margin Title', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'condition' => [
                    'layout' => '2',
                ],
                'selectors'  => [
                    '{{WRAPPER}}.antra-service-accordion-layout-2 .service-block .service-title'     => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'service_caption_head',
            [
                'label'     => esc_html__('Service Caption', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'condition' => [
                    'layout' => '1',
                ],
                'separator' => 'before',
            ]
        );

        $this->add_responsive_control(
            'caption_width',
            [
                'label'     => esc_html__('Width', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 100,
                        'max' => 1000,
                    ],
                    '%' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'condition' => [
                    'layout' => '1',
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-caption' => 'width: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'caption_spacing_x',
            [
                'label'      => esc_html__('Spacing X', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'size_units' => ['px', '%'],
                'range'      => [
                    'px' => [
                        'min'  => -1000,
                        'max'  => 1000,
                        'step' => 1,
                    ],
                    '%'  => [
                        'min' => -100,
                        'max' => 100,
                    ],
                ],
                'default'    => [
                    'unit' => '%',
                    'size' => '',
                ],
                'condition' => [
                    'layout' => '1',
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-caption'   => 'top: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'caption_spacing_y',
            [
                'label'      => esc_html__('Spacing Y', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'size_units' => ['px', '%'],
                'range'      => [
                    'px' => [
                        'min'  => -1000,
                        'max'  => 1000,
                        'step' => 1,
                    ],
                    '%'  => [
                        'min' => -100,
                        'max' => 100,
                    ],
                ],
                'default'    => [
                    'unit' => '%',
                    'size' => '',
                ],
                'condition' => [
                    'layout' => '1',
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-caption'   => 'left: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_excerpt_head',
            [
                'label'     => esc_html__('Service Excerpt', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'condition' => [
                    'layout' => '1',
                ],
                'separator' => 'before'
            ]
        );

        $this->add_control(
            'excerpt_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'global'    => [
                    'default' => Global_Colors::COLOR_TEXT,
                ],
                'condition' => [
                    'layout' => '1',
                ],
                'selectors' => [
                    '{{WRAPPER}} .antra-list-wrapper li.service .service-block .service-loop-exerpt'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'excerpt_typography',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
                'condition' => [
                    'layout' => '1',
                ],
                'selector' => '{{WRAPPER}} .service-loop-exerpt',
            ]
        );

        $this->add_responsive_control(
            'excerpt_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'condition' => [
                    'layout' => '1',
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-content-loop'   => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'excerpt_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'condition' => [
                    'layout' => '1',
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-content-loop'     => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();


        //Section Query
        $this->start_controls_section(
            'section_service_style',
            [
                'label' => esc_html__('Side Right', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'service_item_width',
            [
                'label'      => esc_html__('Width', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 200,
                        'max' => 1000,
                    ],
                    '%' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-service-side-titles' => 'flex: {{SIZE}}{{UNIT}}; max-width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_title_list',
            [
                'label'     => esc_html__('Service List', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_responsive_control(
            'list_spacing_gap',
            [
                'label'      => esc_html__('Gap', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 100,
                        'max' => 1000,
                    ],
                    'vh' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', 'vh'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-service-side-titles li.antra-service-item-titles' => 'gap: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'title_margin_list',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-service-list-titles'     => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_number_color',
            [
                'label'     => esc_html__('Number Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .service-index-item span'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'box_title_head',
            [
                'label'     => esc_html__('Service Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_responsive_control(
            'title_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-service-item-titles'      => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'title_padding_list',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-service-item-titles'    => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'typography',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_PRIMARY,
                ],
                'selector' => '{{WRAPPER}} .antra-service-item-titles .service-title',
            ]
        );

        $this->add_control(
            'title_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'global'    => [
                    'default' => Global_Colors::COLOR_SECONDARY,
                ],
                'selectors' => [
                    '{{WRAPPER}} .antra-service-item-titles .service-title'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'title_color_hover',
            [
                'label'     => esc_html__('Text Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .antra-service-item-titles .service-title:hover'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'box_excerpt_show',
            [
                'label'     => esc_html__('Service Excerpt', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'separator' => 'before'
            ]
        );

        $this->add_control(
            'excerpt_color_show',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'global'    => [
                    'default' => Global_Colors::COLOR_TEXT,
                ],
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'selectors' => [
                    '{{WRAPPER}} .service-loop-exerpt'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'excerpt_typography_show',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'selector' => '{{WRAPPER}} .service-loop-exerpt',
            ]
        );

        $this->add_responsive_control(
            'excerpt_margin_show',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-loop-exerpt'   => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'excerpt_padding_show',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'condition' => [
                    'layout' => ['2', '3'],
                ],
                'selectors'  => [
                    '{{WRAPPER}} .service-loop-exerpt'     => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_tab();
    }

    /**
     * Render tabs widget output on the frontend.
     *
     * Written in PHP and used to generate the final HTML.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function render() {
        $settings = $this->get_settings_for_display();
        $this->handle_setting($settings);
    }

    private function handle_setting($settings) {
        if (!empty($settings['image_thumbnail_size'])) {
            $this->image_size = $settings['image_thumbnail_size'];
        }
        if (!empty($settings['layout'])) {
            $this->layout = $settings['layout'];
        }

        $side_title = '';
        $side_image = '';
        $box_excerpt = '';
        if (!empty($settings['services_list'])) {
            $i = 1;
            foreach ($settings['services_list'] as $item) {
                if (empty($item['choose_service'])) {
                    continue;
                }
                $_id = $item['_id'];
                $id = absint($item['choose_service']);

                global $post;
                $post = get_post($id);
                setup_postdata($post);
                
                $side_title .= $this->get_render_side_titles($i, $_id);
                $side_image .= $this->get_render_side_images($i, $_id);

                if ($this->layout == '3') {
                    $box_excerpt .= $this->get_render_box_excerpts($i, $_id);
                }

                wp_reset_postdata();
                $i++;
            }
        }

        if (empty($side_title)) {
            ?><pre><?php _e('Please choose the service!', 'antra'); ?></pre><?php
            return;
        }

        $this->add_render_attribute('service-wrapper', 'class', 'antra-service-wrapper');
        $this->add_render_attribute('service-wrapper-titles', 'class', 'antra-service-side-titles');
        ?>
        <div <?php $this->print_render_attribute_string('service-wrapper-titles'); ?>>
            <ul class="antra-service-list-titles">
                <?php printf('%s', $side_title); ?>
            </ul>
            <?php if ($this->layout == '3') { ?>
                <ul class="antra-service-list-excerpts">
                    <?php printf('%s', $box_excerpt); ?>
                </ul>
            <?php } ?>
        </div>
        <div <?php $this->print_render_attribute_string('service-wrapper'); ?>>
            <div class="antra-service columns-1 elementor-service elementor-service-style-accordion">
                <div class="antra-con">
                    <ul class="antra-service antra-list-wrapper clear-list-style elementor-grid">
                        <?php printf('%s', $side_image); ?>
                    </ul>
                </div>
            </div>
        </div>
        <?php
        
    }

    private function get_render_side_titles($index, $_id) {
        ob_start();
        $item_class = 'antra-service-item-titles';
        if ($index === 1) {
            $item_class .= ' show';
        }
        ?>
        <li class="<?php echo esc_attr($item_class); ?>" data-id="<?php echo esc_attr($_id) ?>">
            <div class="service-index-item">
                <span><?php echo esc_html(str_pad($index, 2, '0', STR_PAD_LEFT)); ?></span>
            </div>
            <div class="service-item-bottom">
                <span class="service-title"><?php the_title() ?></span>
                <?php
                if ($this->layout == '1') {
                    antra_service_loop_button();
                } 
                if ($this->layout == '2') { ?>
                    <div class="service-loop-exerpt" style="<?php echo $index === 1 ? '' : 'display: none'; ?>">
                        <?php the_excerpt(); ?>
                    </div>
                <?php } ?>
            </div>
        </li>
        <?php
        return ob_get_clean();
    }

    private function get_render_side_images($index, $_id) {
        ob_start();
        $class = 'antra-item service service-style-accordion elementor-repeater-item-'.$_id;
        if ($index === 1) {
            $class .= ' actived';
        }
        ?>
        <li class="<?php echo esc_attr($class); ?>">
            <div class="service-block">
                <?php
                if ($this->layout == '2') { 
                    printf('<span class="service-title">(%s)</span>', get_the_title());
                }

                antra_service_thumbnail($this->image_size);

                if ($this->layout == '1') { ?>
                    <div class="service-caption">
                        <div class="service-content-loop">
                            <div class="service-content-box">
                                <?php antra_service_loop_excerpt(); ?>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </li>
        <?php
        return ob_get_clean();
    }

    private function get_render_box_excerpts($index, $_id) {
        ob_start();
        $class = 'antra-item-service-excerpt elementor-excerpt-item-'.$_id;
        if ($index === 1) {
            $class .= ' actived';
        }
        ?>
        <li class="<?php echo esc_attr($class); ?>" style="<?php echo $index === 1 ? '' : 'display: none'; ?>">
            <div class="service-loop-exerpt">
                <?php the_excerpt(); ?>
            </div>
        </li>
        <?php
        return ob_get_clean();
    }
}

$widgets_manager->register(new Antra_Elementor_Widget_Service_Accordion());
