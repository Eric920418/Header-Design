<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

use Elementor\Controls_Manager;
use Elementor\Group_Control_Typography;
use Elementor\Group_Control_Background;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;
use Antra\Elementor\Antra_Group_Control_Typography;
use Antra\Elementor\Antra_Base_Widgets;

class Antra_Elementor_Antra_Virtual_Tour extends Antra_Base_Widgets {

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
        return 'antra-virtual-tour';
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
        return esc_html__('Antra Virtual Tour', 'antra');
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
        return 'eicon-gallery-grid';
    }

    public function get_script_depends() {
        return ['antra-elementor-virtual-tour', 'slick'];
    }

    public function get_categories() {
        return array('antra-addons');
    }

    protected function get_virtual_tour() {
        $params  = array(
            'posts_per_page' => -1,
            'post_type'      => [
                'virtual_tour',
            ],
        );
        $query   = new WP_Query($params);
        $options = array();
        while ($query->have_posts()): $query->the_post();
            $options[get_the_ID()] = get_the_title();
        endwhile;

        return $options;
    }

    public static function get_query_args($settings) {
        $query_args = [
            'post_type'           => 'virtual_tour',
            'ignore_sticky_posts' => 1,
            'post_status'         => 'publish', // Hide drafts/private posts for admins
        ];

        if (isset($settings['virtual_tour']) && !empty($settings['virtual_tour']) && $settings['type'] == 'name') {
            $query_args['post__in'] = $settings['virtual_tour'];
        }
        $query_args['posts_per_page'] = $settings['posts_per_page'];

        if (is_front_page()) {
            $query_args['paged'] = (get_query_var('page')) ? get_query_var('page') : 1;
        } else {
            $query_args['paged'] = (get_query_var('paged')) ? get_query_var('paged') : 1;
        }

        return $query_args;
    }

    public function query_posts() {
        $query_args = $this->get_query_args($this->get_settings());
        return new WP_Query($query_args);
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
            'section_content',
            [
                'label' => esc_html__('Antra Virtual Tour', 'antra'),
            ]
        );

        $this->add_control(
            'type',
            [
                'label'   => esc_html__('Query', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => 'ranrom',
                'options' => [
                    'ranrom' => esc_html__('Random', 'antra'),
                    'name'   => esc_html__('Name', 'antra')
                ],
            ]
        );

        $this->add_control(
            'virtual_tour',
            [
                'label'     => esc_html__('Show Virtual Tour', 'antra'),
                'type'      => \Elementor\Controls_Manager::SELECT2,
                'multiple'  => true,
                'options'   => $this->get_virtual_tour(),
                'condition' => [
                    'type' => 'name'
                ]
            ]
        );

        $this->add_control(
            'posts_per_page',
            [
                'label'     => esc_html__('Posts Per Page', 'antra'),
                'type'      => Controls_Manager::NUMBER,
                'default'   => 6,
                'condition' => [
                    'type' => 'ranrom'
                ]
            ]
        );

        $this->add_control(
            'view',
            [
                'label'   => esc_html__('View', 'antra'),
                'type'    => Controls_Manager::HIDDEN,
                'default' => 'traditional',
            ]
        );

        $this->add_control(
            'hidden_title',
            [
                'label' => esc_html__('Hidden Title', 'antra'),
                'type'  => Controls_Manager::SWITCHER,
                'prefix_class' => 'hidden-title-',
            ]
        );

        $this->add_group_control(
            Elementor\Group_Control_Image_Size::get_type(),
            [
                'name'      => 'image_thumbnail',
                'default'   => 'medium_large',
                'exclude' => ['custom']
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'style',
            [
                'label' => esc_html__('Style', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'image_style',
            [
                'label'     => esc_html__('Image', 'antra'),
                'type'      => Controls_Manager::HEADING,
            ]
        );

        $this->add_group_control(
            Group_Control_Background::get_type(),
            [
                'name'           => 'img_overlay',
                'label'          => __( 'Overlay', 'antra' ),
                'types'          => [ 'classic', 'gradient' ],
                'selector'       => '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-image::before',
            ]
        );

        $this->add_responsive_control(
            'image_height',
            [
                'label'      => esc_html__('Image Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 100,
                        'max' => 1000,
                    ],
                ],
                'default'    => [
                    'unit' => 'px',
                    'size' => 400,
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper' => '--image-height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'img_border_radius',
            [
                'label'      => esc_html__('Border Radius', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-image img' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-image::before' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'icon_style',
            [
                'label'     => esc_html__('Icon', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'color_icon',
            [
                'label'   => esc_html__('Color Icon', 'antra'),
                'type'    => Controls_Manager::COLOR,
                'default' => '',                
                'selectors'  => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-image i' => 'color: {{VALUE}}',
                ],
            ]
        );

        $this->add_control(
            'color_icon_hover',
            [
                'label'   => esc_html__('Color Icon Hover', 'antra'),
                'type'    => Controls_Manager::COLOR,
                'default' => '',                
                'selectors'  => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .elementor-virtual-tour:hover .virtual-tour-image i' => 'color: {{VALUE}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'icon_width',
            [
                'label'     => esc_html__('Icon Size', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 50,
                        'max' => 300,
                    ],
                    '%' => [
                        'min' => 10,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-image i' => 'font-size: {{SIZE}}{{UNIT}}',
                ],
            ]
        );

        $this->add_control(
            'box_title_head',
            [
                'label'     => esc_html__('Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_responsive_control(
            'title_align',
            [
                'label'        => esc_html__('Text Align', 'antra'),
                'type'         => Controls_Manager::CHOOSE,
                'options'      => [
                    'left'    => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center' => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'right' => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                    'justify' => [
                        'title' => esc_html__('Justify', 'antra'),
                        'icon'  => 'eicon-text-align-justify',
                    ],
                ],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-title' => 'text-align: {{value}}',
                ],
            ]
        );

        $this->add_responsive_control(
            'title_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-title'      => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
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
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-title'   => 'color: {{VALUE}};',
                ],
            ]
        );

         $this->add_control(
            'title_color_hover',
            [
                'label'     => esc_html__('Text Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-virtual-tour-wrapper .elementor-virtual-tour:hover .virtual-tour-title'   => 'color: {{VALUE}};',
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
                'selector' => '{{WRAPPER}} .elementor-virtual-tour-wrapper .virtual-tour-title',
            ]
        );

        $this->end_controls_section();

        $this->get_controls_column();
        // Carousel options
        $this->get_control_carousel();
    }

    /**
     * Render testimonial widget output on the frontend.
     *
     * Written in PHP and used to generate the final HTML.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function render() {
        $settings = $this->get_settings_for_display();
        $query    = $this->query_posts();

        if (!$query->found_posts) {
            return;
        }

        // wrapper
        $this->add_render_attribute('wrapper', 'class', 'elementor-virtual-tour-wrapper');
        if (absint($query->found_posts) < 2) {
            $this->add_render_attribute('container', 'class', 'elementor-single-item');
        }
        // Item
        $this->add_render_attribute('item', 'class', 'antra-virtual-tour-item');

        $this->get_data_elementor_columns();

        ?>
        <div <?php $this->print_render_attribute_string('wrapper', $this); // WPCS: XSS ok. ?>>
            <div <?php $this->print_render_attribute_string('container', $this); // WPCS: XSS ok. ?>>
                <div <?php $this->print_render_attribute_string('inner'); ?>>
                    <?php
                    while ($query->have_posts()) : $query->the_post(); ?>
                        <div <?php $this->print_render_attribute_string('item', $this); // WPCS: XSS ok. ?>>
                            <div class="item-inner">
                                <div data-link="<?php the_permalink(); ?>" class="elementor-virtual-tour">
                                    <figure class="virtual-tour-image">
                                        <?php if (has_post_thumbnail()) : ?>
                                            <?php the_post_thumbnail($settings['image_thumbnail_size'] ?? 'large'); ?>
                                        <?php else: ?>
                                        <img src="<?php echo esc_url(antra_get_placeholder_image()); ?>"/>
                                        <?php endif; ?><!-- .post-thumbnail -->
                                        <i class="antra-icon-360"></i>
                                    </figure>
                                    <div class="virtual-tour-title"><?php the_title(); ?></div>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; 
                    wp_reset_postdata();
                    ?>
                </div>
            </div>
        </div>
        <?php
    }
}

$widgets_manager->register(new Antra_Elementor_Antra_Virtual_Tour());

