<?php

use Elementor\Controls_Manager;
use Elementor\Group_Control_Border;
use Antra\Elementor\Antra_Group_Control_Typography;
use Elementor\Group_Control_Image_Size;
use Elementor\Repeater;
use Antra\Elementor\Antra_Base_Widgets;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

/**
 * Elementor image gallery widget.
 *
 * Elementor widget that displays a set of images in an aligned grid.
 *
 * @since 1.0.0
 */
class Antra_Elementor_Gallery_Scroll extends Antra_Base_Widgets {

    /**
     * Get widget name.
     *
     * Retrieve image gallery widget name.
     *
     * @return string Widget name.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_name() {
        return 'antra-gallery-scroll';
    }

    /**
     * Get widget title.
     *
     * Retrieve image gallery widget title.
     *
     * @return string Widget title.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_title() {
        return esc_html__('Antra Gallery Scroll', 'antra');
    }

    public function get_script_depends() {
        return [
            'antra-elementor-gallery-scroll',
            'antra-scrolltrigger',
            'antra-fancybox',
        ];
    }

    public function get_style_depends() {
        return ['antra-fancybox'];
    }

    public function get_categories() {
        return ['antra-addons'];
    }

    /**
     * Get widget icon.
     *
     * Retrieve image gallery widget icon.
     *
     * @return string Widget icon.
     * @since  1.0.0
     * @access public
     *
     */
    public function get_icon() {
        return 'eicon-slider-push';
    }

    /**
     * Get widget keywords.
     *
     * Retrieve the list of keywords the widget belongs to.
     *
     * @return array Widget keywords.
     * @since  2.1.0
     * @access public
     *
     */
    public function get_keywords() {
        return ['image', 'photo', 'visual', 'gallery'];
    }

    /**
     * Register image gallery widget controls.
     *
     * Adds different input fields to allow the user to change and customize the widget settings.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function register_controls() {
        $this->start_controls_section(
            'section_gallery',
            [
                'label' => esc_html__('Gallery Scroll', 'antra'),
            ]
        );

        $this->add_control(
            'wp_gallery',
            [
                'label'      => esc_html__('Add Images', 'antra'),
                'type'       => Controls_Manager::GALLERY,
                'show_label' => false,
                'dynamic'    => [
                    'active' => true,
                ],
            ]
        );

        $this->add_control(
            'direction',
            [
                'label'        => esc_html__('Scroll Direction', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'default'      => 'rtl',
                'options'      => [
                    'rtl' => esc_html__('Right to Left', 'antra'),
                    'ltr' => esc_html__('Left to Right', 'antra'),
                ],
                'render_type' => 'template',
                'prefix_class' => 'antra-gallery-scroll-direction-'
            ]
        );

        $this->add_responsive_control(
            'spacing',
            [
                'label'          => esc_html__('Spacing', 'antra'),
                'type'           => Controls_Manager::SLIDER,
                'default'        => [
                    'unit' => 'px',
                ],
                'size_units'     => ['px','%'],
                'range'          => [
                    'px' => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'selectors'      => [
                    '{{WRAPPER}} .elementor-antra-gallery-scroll'     => 'gap: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Image_Size::get_type(),
            [
                'name'      => 'thumbnail',
                // Usage: `{name}_size` and `{name}_custom_dimension`, in this case `thumbnail_size` and `thumbnail_custom_dimension`.
                'exclude'   => ['custom'],
                'separator' => 'none',
                'default'   => 'medium_large'
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

        $this->end_controls_section();

        $this->start_controls_section(
            'section_image_size',
            [
                'label' => esc_html__('Gallery Image Size', 'antra'),
            ]
        );

        for ($i = 1; $i <= 3; $i++) { 
            $this->add_control(
                'image_size_'.$i,
                [
                    'label'     => esc_html__('Size', 'antra'). " $i",
                    'type'      => Controls_Manager::HEADING,
                    'separator' => $i === 1 ? false : 'before',
                ]
            );
    
            $this->add_responsive_control(
                'image_width_'.$i,
                [
                    'label'          => esc_html__('Width', 'antra'),
                    'type'           => Controls_Manager::SLIDER,
                    'default'        => [
                        'unit' => 'px',
                    ],
                    'size_units'     => ['px','%','vh'],
                    'range'          => [
                        'px' => [
                            'min' => 1,
                            'max' => 1000,
                        ],
                    ],
                    'selectors'      => [
                        "{{WRAPPER}} .elementor-antra-item-gallery-scroll:nth-child(3n+{$i})"  => 'width: {{SIZE}}{{UNIT}};',
                    ],
                ]
            );

            $this->add_responsive_control(
                'image_height_'.$i,
                [
                    'label'          => esc_html__('Height', 'antra'),
                    'type'           => Controls_Manager::SLIDER,
                    'default'        => [
                        'unit' => 'px',
                    ],
                    'size_units'     => ['px','%','vh'],
                    'range'          => [
                        'px' => [
                            'min' => 1,
                            'max' => 1000,
                        ],
                    ],
                    'selectors'      => [
                        "{{WRAPPER}} .elementor-antra-item-gallery-scroll:nth-child(3n+{$i})"  => 'height: {{SIZE}}{{UNIT}};',
                    ],
                ]
            );
        }

        $this->end_controls_section();

        $this->start_controls_section(
            'section_design_image',
            [
                'label' => esc_html__('Image', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'vertical_align',
            [
                'label'        => esc_html__('Vertical Align', 'antra'),
                'type'         => Controls_Manager::CHOOSE,
                'options'      => [
                    'flex-start'    => [
                        'title' => esc_html__('Top', 'antra'),
                        'icon'  => 'eicon-v-align-top',
                    ],
                    'center' => [
                        'title' => esc_html__('Middle', 'antra'),
                        'icon'  => 'eicon-v-align-middle',
                    ],
                    'flex-end' => [
                        'title' => esc_html__('Bottom', 'antra'),
                        'icon'  => 'eicon-v-align-bottom',
                    ],
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-antra-gallery-scroll' => 'align-items: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'image_radius',
            [
                'label'      => esc_html__('Border Radius', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-antra-item-gallery-scroll a img' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'        => 'content_border',
                'placeholder' => '1px',
                'default'     => '1px',
                'selector'    => '{{WRAPPER}} .elementor-antra-item-gallery-scroll a img',
            ]
        );

        // $this->add_responsive_control(
        //     'image_height',
        //     [
        //         'label'          => esc_html__('Height', 'antra'),
        //         'type'           => Controls_Manager::SLIDER,
        //         'default'        => [
        //             'unit' => 'px',
        //         ],
        //         'tablet_default' => [
        //             'unit' => 'px',
        //         ],
        //         'mobile_default' => [
        //             'unit' => 'px',
        //         ],
        //         'size_units'     => ['px','%', 'vh'],
        //         'range'          => [
        //             'px' => [
        //                 'min' => 1,
        //                 'max' => 500,
        //             ],
        //             'vh' => [
        //                 'min' => 1,
        //                 'max' => 100,
        //             ],
        //         ],
        //         'selectors'      => [
        //             '{{WRAPPER}}:not(.antra-gallery-scroll-masonry) .elementor-antra-item-gallery-scroll a img'     => 'height: {{SIZE}}{{UNIT}};',
        //             '{{WRAPPER}}'     => '--gallery-height: {{SIZE}}{{UNIT}};',
        //         ],
        //     ]
        // );

        $this->end_controls_section();

    }

    /**
     * Render image gallery widget output on the frontend.
     *
     * Written in PHP and used to generate the final HTML.
     *
     * @since  1.0.0
     * @access protected
     */
    protected function render() {
        $settings      = $this->get_settings_for_display();
        $image_gallery = array();
        if (!empty($settings['wp_gallery'])):
            foreach ($settings['wp_gallery'] as $items => $attachment) {
                $image_gallery[]             = $attachment;
            }
        endif;

        $this->add_render_attribute('wrapper', 'class', 'elementor-antra-gallery-scroll');
        $this->add_render_attribute('item', 'class', 'elementor-antra-item-gallery-scroll');
        
        ?>
        <div <?php $this->print_render_attribute_string('wrapper'); ?>>
            <?php 
            foreach ($image_gallery as $index => $item) {
                $image_url                = Group_Control_Image_Size::get_attachment_image_src($item['id'], 'thumbnail', $settings);
                $image_url_full           = wp_get_attachment_image_url($item['id'], 'full');

                ?>
                <div <?php $this->print_render_attribute_string('item'); ?>>
                    <a class="gallery-image-link" data-fancybox="gallery" data-elementor-open-lightbox="no" href="<?php echo esc_url($image_url_full); ?>">
                        <img class="antra-elementor-src-gallery" src="<?php echo esc_url($image_url); ?>" alt="<?php echo esc_attr(Elementor\Control_Media::get_image_alt($item)); ?>"/>
                    </a>
                </div>
                <?php 
            } 
            ?>
        </div>
        <?php
    }
}

$widgets_manager->register(new Antra_Elementor_Gallery_Scroll());