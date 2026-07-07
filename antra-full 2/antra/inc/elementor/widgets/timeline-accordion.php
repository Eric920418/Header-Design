<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
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
use Elementor\Group_Control_Image_Size;
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
class Antra_Elementor_Widget_Timeline_Accordion extends Antra_Base_Widgets {


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
        return 'antra-timelines-accordion';
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
        return esc_html__('Antra Timelines Accordion', 'antra');
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
            'antra-elementor-timeline-accordion',
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

        $repeater = new Repeater();

        $repeater->add_control(
            'year',
            [
                'label'       => esc_html__('Year', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'default'     => '2024',
                'label_block' => true,
            ]
        );
        
        $repeater->add_control(
            'title',
            [
                'label'       => esc_html__('Title', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'default'     => 'title',
                'label_block' => true,
            ]
        );

        $repeater->add_control(
            'description',
            [
                'label'       => esc_html__('Description', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'placeholder'     => esc_html__('Description', 'antra'),
                'label_block' => true,
            ]
        );

        $repeater->add_control(
            'image_link_source',
            [
                'label'      => esc_html__('Choose Image', 'antra'),
                'default'    => [
                    'url' => Elementor\Utils::get_placeholder_image_src(),
                ],
                'type'       => Controls_Manager::MEDIA,
                'show_label' => false,
            ]
        );

        $this->add_control(
            'timeline',
            [
                'label'       => esc_html__('Timelines', 'antra'),
                'type'        => Controls_Manager::REPEATER,
                'fields'      => $repeater->get_controls(),
                'default' => [
                    [
                        'image_title' => '',
                    ],
                ],
                'separator' => 'after'
            ]
        );

        $this->add_group_control(
            Elementor\Group_Control_Image_Size::get_type(),
            [
                'name'      => 'image',
                'default'   => 'medium_large',
                // 'exclude' => ['custom']
            ]
        );

        $this->end_controls_section();
    
        $this->start_controls_section(
            'section_timeline_left',
            [
                'label' => esc_html__('Box Left', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'timeline_item_height',
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
                'separator' => 'none',
            ]
        );

        $this->add_control(
            'image_border_radius',
            [
                'label' => esc_html__( 'Border radius', 'antra' ),
                'type' => Controls_Manager::DIMENSIONS,
                'size_units' => [ 'px', '%' ],
                'selectors' => [
                    '{{WRAPPER}} .timeline-block img' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_timeline_right',
            [
                'label' => esc_html__('Box Right', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'box_item_list',
            [
                'label'     => esc_html__('Timeline List', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_responsive_control(
            'item_padding_list',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-timeline-item-titles'    => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'item_margin_list',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-timeline-list-titles'     => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_year_head',
            [
                'label'     => esc_html__('Timeline Year', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'year',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
                'selector' => '{{WRAPPER}} .antra-timeline-item-titles .timeline-year-item span',
            ]
        );

        $this->add_control(
            'year_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .antra-timeline-item-titles .timeline-year-item span'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'year_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-timeline-list-titles .timeline-year-item'     => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_title_head',
            [
                'label'     => esc_html__('Timeline Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'title',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_PRIMARY,
                ],
                'selector' => '{{WRAPPER}} .antra-timeline-item-titles .timeline-title',
            ]
        );

        $this->add_control(
            'title_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .antra-timeline-item-titles .timeline-title'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'title_color_hover',
            [
                'label'     => esc_html__('Text Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .antra-timeline-item-titles .timeline-title:hover'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'box_description_head',
            [
                'label'     => esc_html__('Timeline Description', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'description',
                'global'   => [
                    'default' => Global_Typography::TYPOGRAPHY_TEXT,
                ],
                'selector' => '{{WRAPPER}} .antra-timeline-item-titles .timeline-description',
            ]
        );

        $this->add_control(
            'description_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .antra-timeline-item-titles .timeline-description'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'description_padding_list',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-timeline-item-titles .timeline-description'    => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        
        $this->end_controls_section();

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
        if (empty($settings['timeline'])) {
            ?>
            <pre><?php _e('Please add the timelines!', 'antra'); ?></pre>
            <?php
        } else {
            $this->add_render_attribute('timeline-wrapper', 'class', 'antra-timeline-wrapper');
            $this->add_render_attribute('timeline-wrapper-titles', 'class', 'antra-timeline-side-titles');
            ?>
            <div <?php $this->print_render_attribute_string('timeline-wrapper-titles'); ?>>
                <ul class="antra-timeline-list-titles">
                <?php
                foreach ($settings['timeline'] as $index => $item) {
                    $item_class = 'antra-timeline-item-titles';
                    if ($index == 0) {
                        $item_class .= ' show';
                    }
                    ?>
                    <li class="<?php echo esc_attr($item_class); ?>" data-id="<?php echo esc_attr($item['_id']) ?>">
                        <div class="timeline-year-item">
                            <span><?php echo esc_html($item['year'] ?? '2024'); ?></span>
                        </div>
                        <div class="timeline-item-bottom">
                            <span class="timeline-title"><?php echo esc_html($item['title']) ?></span>
                            <span class="timeline-description"><?php echo esc_html($item['description']) ?></span>
                        </div>
                    </li>
                    <?php
                }
                ?>
                </ul>
            </div>
            <div <?php $this->print_render_attribute_string('timeline-wrapper'); ?>>
                <ul class="antra-timeline antra-list-wrapper clear-list-style">
                    <?php
                    foreach ($settings['timeline'] as $index => $item) {
                        $item_class = 'antra-item timeline timeline-style-accordion elementor-repeater-item-'.$item['_id'];
                        if ($index == 0) {
                            $item_class .= ' actived';
                        }
                        ?>
                        <li class="<?php echo esc_attr($item_class) ?>">
                            <div class="timeline-block">
                                <figure class="timeline-image">
                                    <?php
                                    $image_url = Group_Control_Image_Size::get_attachment_image_src($item['image_link_source']['id'], 'image', $settings);
                                    if (empty($image_url)) {
                                        $image_url = antra_get_placeholder_image();
                                    }
                                    ?>
                                    <img class="image" src="<?php echo esc_url($image_url); ?>" alt="<?php echo esc_attr($item['title']) ?>">
                                </figure>
                            </div>
                        </li>
                        <?php
                    }
                    ?>
                </ul>
            </div>
            <?php
            
        }
        
    }

}

$widgets_manager->register(new Antra_Elementor_Widget_Timeline_Accordion());
