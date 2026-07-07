<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('team')) {
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
class Antra_Elementor_Widget_Team_Accordion extends Antra_Base_Widgets {


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
        return 'antra-teams-accordion';
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
        return esc_html__('Antra Teams Accordion', 'antra');
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
            'antra-elementor-team-accordion',
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
                'label'   => esc_html__('Show Team', 'antra'),
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
            'choose_team',
            [
                'label'     => __('Team', 'antra'),
                'type'      => 'team',
                'multiple'    => false,
                'label_block' => true,
                // 'separator' => 'before'
            ]
        );

        $this->add_control(
            'teams_list',
            [
                'label'       => esc_html__('Teams', 'antra'),
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
            'limit',
            [
                'label'   => esc_html__('Posts Per Page', 'antra'),
                'type'    => Controls_Manager::NUMBER,
                'default' => 6,
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
                'default'   => 'medium_large',
                'exclude' => ['custom']
            ]
        );

        $this->add_control(
            'style',
            [
                'label'     => esc_html__('Block Style', 'antra'),
                'type'      => Controls_Manager::HIDDEN,
                'default'   => 'accordion',
            ]
        );

        $this->end_controls_section();


        //Section Title
        $this->start_controls_section(
            'section_team_title',
            [
                'label' => esc_html__('Left Side', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'team_item_height',
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

        $this->add_responsive_control(
            'box_content_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .team-block'      => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();


        //Section Query
        $this->start_controls_section(
            'section_team_style',
            [
                'label' => esc_html__('Right Side', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'box_wrapper',
            [
                'label'     => esc_html__('Wrapper', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_responsive_control(
            'title_margin_list',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-team-list-titles'     => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_list',
            [
                'label'     => esc_html__('Team List', 'antra'),
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
                    '{{WRAPPER}} .antra-team-item-titles'      => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
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
                    '{{WRAPPER}} .antra-team-item-titles'    => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'box_title_head',
            [
                'label'     => esc_html__('Team Title', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
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
                    '{{WRAPPER}} .team-title'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'title_color_hover',
            [
                'label'     => esc_html__('Text Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .team-title:hover'   => 'color: {{VALUE}};',
                    '{{WRAPPER}} .antra-team-item-titles.show .team-title'   => 'color: {{VALUE}};',
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
                'selector' => '{{WRAPPER}} .team-title',
            ]
        );

        $this->add_control(
            'box_excerpt_head',
            [
                'label'     => esc_html__('Team Job', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before'
            ]
        );

        $this->add_control(
            'excerpt_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .team-loop-job'   => 'color: {{VALUE}};',
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
                'selector' => '{{WRAPPER}} .team-loop-job',
            ]
        );

        $this->add_responsive_control(
            'excerpt_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .team-loop-job'   => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'excerpt_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .team-loop-job'     => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
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
        $class = '';
        $atts  = [
            'limit'          => $settings['limit'],
            'columns'        => 1,
            'orderby'        => $settings['orderby'],
            'order'          => $settings['order'],
            'active_first'    => 'yes',
            'wrap_container' => 'yes'
        ];

        $image_size = $settings['image_thumbnail_size'] ?? 'medium_large';

        $class         .= ' elementor-team';
        $class         .= ' elementor-team-style-' . $settings['style'];
        
        if (isset($settings['style']) && $settings['style'] !== '') {
            $atts['style'] = $settings['style'];
        }

        $atts['class'] = $class;

        $classes = [];
        $list_titles = [];
        if (isset($settings['show_option']) && $settings['show_option'] == 'select') {
            if (!empty($settings['teams_list'])) {
                $ids = [];
                foreach ($settings['teams_list'] as $item) {
                    if (empty($item['choose_team'])) {
                        continue;
                    }
                    $id = absint($item['choose_team']);
                    if (!in_array($id, $ids)) {
                        $ids[] = $id;
                        $classes[$id] = ' elementor-repeater-item-'.$item['_id'];
                    }

                    $list_titles[$id] = [
                        '_id' => $item['_id'],
                        'id' => $id,
                        'title' => get_the_title($id)
                    ];
                }
                if (!empty($ids)) {
                    $atts['ids'] = implode(',', $ids);
                }
            }
        }


        if (empty($atts['ids'])) {
            ?>
            <pre><?php _e('Please choose the team!', 'antra'); ?></pre>
            <?php
        } else {
            $this->add_render_attribute('team-wrapper', 'class', 'antra-team-wrapper');
            $pt = new Antra_Posttype('team', $atts);
            $first_item = $pt->get_first_item();
            $ids = $pt->get_ids();
            if (!empty($ids)) {
                $this->add_render_attribute('team-wrapper-titles', 'class', 'antra-team-side-titles');
                ?>
                <div <?php $this->print_render_attribute_string('team-wrapper-titles'); ?>>
                    <ul class="antra-team-list-titles">
                    <?php
                    foreach ($ids as $index => $id) {
                        if (isset($list_titles[$id])) {
                            $show = $id == $first_item;
                            self::render_side_titles($show, $list_titles[$id], $index + 1);
                        }
                    }
                    ?>
                    </ul>
                </div>
                <div <?php $this->print_render_attribute_string('team-wrapper'); ?>>
                    <ul class="antra-team antra-list-wrapper clear-list-style">
                        <?php
                        foreach ($ids as $id) {
                            if (isset($list_titles[$id])) {
                                $show = $id == $first_item;
                                self::render_side_images($show, $list_titles[$id], $image_size);
                            }
                        }
                        ?>
                    </ul>
                </div>
                <?php
            }
            
        }
        
    }

    private static function render_side_titles($show, $item, $index) {
        $item_class = 'antra-team-item-titles';
        if ($show) {
            $item_class .= ' show';
        }
        ?>
        <li class="<?php echo esc_attr($item_class); ?>" data-id="<?php echo esc_attr($item['_id']) ?>">
            <div class="team-index-item">
                <span><?php echo esc_html(str_pad($index, 2, '0', STR_PAD_LEFT)); ?></span>
            </div>
            <div class="team-item-bottom">
                <span class="team-title"><?php echo esc_html($item['title']) ?></span>
                <?php
                antra_team_loop_job($item['id']);
                antra_team_loop_button_icon($item['id']);
                ?>
            </div>

        </li>
        <?php
    }

    private static function render_side_images($show, $item, $image_size) {
        $item_class = 'antra-item team team-style-accordion elementor-repeater-item-'.$item['_id'];
        if ($show) {
            $item_class .= ' actived';
        }
        ?>
        <li class="<?php echo esc_attr($item_class) ?>">
            <div class="team-block">
                <figure class="post-thumbnail team-image">
                    <?php
                    if (has_post_thumbnail($item['id'])) {
                        echo wp_kses_post(get_the_post_thumbnail($item['id'], $image_size));
                    } else {
                        antra_print_placeholder_image(['class' => '']);
                    }
                    ?>
                </figure>
            </div>
        </li>
        <?php
    }



}

$widgets_manager->register(new Antra_Elementor_Widget_Team_Accordion());
