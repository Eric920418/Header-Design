<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

use Elementor\Controls_Manager;
use Elementor\Core\Kits\Documents\Tabs\Global_Colors;
use Elementor\Core\Kits\Documents\Tabs\Global_Typography;
use Elementor\Group_Control_Border;
use Elementor\Group_Control_Text_Shadow;
use Elementor\Group_Control_Text_Stroke;
use Antra\Elementor\Antra_Group_Control_Typography;
use Elementor\Icons_Manager;
use Elementor\Utils;


class Antra_Elementor_Heading extends Elementor\Widget_Base {

    /**
     * Get widget name.
     *
     * Retrieve heading widget name.
     *
     * @return string Widget name.
     * @since 1.0.0
     * @access public
     *
     */
    public function get_name() {
        return 'antra-heading';
    }

    /**
     * Get widget title.
     *
     * Retrieve heading widget title.
     *
     * @return string Widget title.
     * @since 1.0.0
     * @access public
     *
     */
    public function get_title() {
        return esc_html__('Antra Heading', 'antra');
    }

    /**
     * Get widget icon.
     *
     * Retrieve heading widget icon.
     *
     * @return string Widget icon.
     * @since 1.0.0
     * @access public
     *
     */
    public function get_icon() {
        return 'eicon-t-letter';
    }

    /**
     * Get widget categories.
     *
     * Retrieve the list of categories the heading widget belongs to.
     *
     * Used to determine where to display the widget in the editor.
     *
     * @return array Widget categories.
     * @since 2.0.0
     * @access public
     *
     */
    public function get_categories() {
        return ['basic'];
    }

    /**
     * Get widget keywords.
     *
     * Retrieve the list of keywords the widget belongs to.
     *
     * @return array Widget keywords.
     * @since 2.1.0
     * @access public
     *
     */
    public function get_keywords() {
        return ['heading', 'title', 'text'];
    }

    /**
     * Register heading widget controls.
     *
     * Adds different input fields to allow the user to change and customize the widget settings.
     *
     * @since 3.1.0
     * @access protected
     */
    protected function register_controls() {
        $this->start_controls_section(
            'section_title',
            [
                'label' => esc_html__('Title', 'antra'),
            ]
        );

        $this->add_control(
            'title',
            [
                'label'       => esc_html__('Title', 'antra'),
                'type'        => Controls_Manager::TEXTAREA,
                'dynamic'     => [
                    'active' => true,
                ],
                'placeholder' => esc_html__('Enter your title', 'antra'),
                'default'     => esc_html__('Add Your Heading Text Here', 'antra'),
            ]
        );

        $this->add_control(
            'title_icon',
            [
                'label' => esc_html__( 'Icon', 'antra' ),
                'type' => Controls_Manager::ICONS,
                'fa4compatibility' => 'icon',
                'skin' => 'inline',
                'label_block' => false,
            ]
        );

        $this->add_control(
            'title_icon_position',
            [
                'label' => esc_html__( 'Icon Position', 'antra' ),
                'type' => Controls_Manager::SELECT,
                'default' => 'left',
                'options' => [
                    'left' => esc_html__( 'Before', 'antra' ),
                    'right' => esc_html__( 'After', 'antra' ),
                ],
            ]
        );

        $this->add_responsive_control(
            'title_icon_spacing',
            [
                'label'     => esc_html__('Spacing', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'selectors' => [
                    '{{WRAPPER}} .elementor-heading-title .antra-title-icon-left'  => 'margin-right: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}} .elementor-heading-title .antra-title-icon-right' => 'margin-left: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'link',
            [
                'label'     => esc_html__('Link', 'antra'),
                'type'      => Controls_Manager::URL,
                'dynamic'   => [
                    'active' => true,
                ],
                'default'   => [
                    'url' => '',
                ],
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'size',
            [
                'label'   => esc_html__('Size', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'default' => 'default',
                'options' => [
                    'default' => esc_html__('Default', 'antra'),
                    'small'   => esc_html__('Small', 'antra'),
                    'medium'  => esc_html__('Medium', 'antra'),
                    'large'   => esc_html__('Large', 'antra'),
                    'xl'      => esc_html__('XL', 'antra'),
                    'xxl'     => esc_html__('XXL', 'antra'),
                ],
            ]
        );

        $this->add_control(
            'header_size',
            [
                'label'   => esc_html__('HTML Tag', 'antra'),
                'type'    => Controls_Manager::SELECT,
                'options' => [
                    'h1'   => 'H1',
                    'h2'   => 'H2',
                    'h3'   => 'H3',
                    'h4'   => 'H4',
                    'h5'   => 'H5',
                    'h6'   => 'H6',
                    'div'  => 'div',
                    'span' => 'span',
                    'p'    => 'p',
                ],
                'default' => 'h2',
            ]
        );

        $this->add_responsive_control(
            'align',
            [
                'label'        => esc_html__('Alignment', 'antra'),
                'type'         => Controls_Manager::CHOOSE,
                'options'      => [
                    'left'    => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center'  => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'right'   => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                    'justify' => [
                        'title' => esc_html__('Justified', 'antra'),
                        'icon'  => 'eicon-text-align-justify',
                    ],
                ],
                'default'      => '',
                'selectors'    => [
                    '{{WRAPPER}}' => 'text-align: {{VALUE}};',
                    '{{WRAPPER}} .elementor-sub-title span' => 'justify-content: {{VALUE}};',
                ],
                'prefix_class' => 'elementor%s-align-',
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
            'mouse_cursor',
            [
                'label'        => __('Mouse Cursor Effect', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'default'      => '',
                'options'      => [
                    '' => __('None', 'antra'),
                    'opaque' => __('Opaque', 'antra'),
                    'text' => __('Text', 'antra'),
                ],
            ]
        );

        $this->add_control(
            'cursor_text',
            [
                'label'       => esc_html__('Cursor Text', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'dynamic'     => [
                    'active' => true,
                ],
                'placeholder' => esc_html__('Typing some things...', 'antra'),
                'default'     => 'View',
                'condition' => [
                    'mouse_cursor' => 'text'
                ]
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_subtitle',
            [
                'label' => esc_html__('Sub Title', 'antra'),
            ]
        );

        $this->add_control(
            'sub_title',
            [
                'label'       => esc_html__('Sub Title', 'antra'),
                'type'        => Controls_Manager::TEXTAREA,
                'dynamic'     => [
                    'active' => true,
                ],
                'placeholder' => esc_html__('Enter your subtitle', 'antra'),
                'default'     => esc_html__('Add Your Sub Title Text Here', 'antra'),
            ]
        );


        $this->add_control(
            'sub_title_position',
            [
                'label'        => __('Position', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'default'      => 'below',
                'options'      => [
                    'above' => __('Above', 'antra'),
                    'below' => __('Below', 'antra'),
                ],
                'prefix_class' => 'subtitle-position-',
            ]
        );

        $this->add_control(
            'sub_title_icon',
            [
                'label' => esc_html__( 'Icon', 'antra' ),
                'type' => Controls_Manager::ICONS,
                'fa4compatibility' => 'subicon',
                'skin' => 'inline',
                'label_block' => false,
            ]
        );

        $this->add_control(
            'sub_title_icon_position',
            [
                'label' => esc_html__( 'Icon Position', 'antra' ),
                'type' => Controls_Manager::SELECT,
                'default' => 'left',
                'options' => [
                    'left' => esc_html__( 'Before', 'antra' ),
                    'right' => esc_html__( 'After', 'antra' ),
                ],
            ]
        );

        $this->add_responsive_control(
            'sub_title_icon_spacing',
            [
                'label'     => esc_html__('Spacing', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'selectors' => [
                    '{{WRAPPER}} .elementor-sub-title .antra-subtitle-icon-left'  => 'margin-right: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}} .elementor-sub-title .antra-subtitle-icon-right' => 'margin-left: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_title_style',
            [
                'label' => esc_html__('Title', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'title_color',
            [
                'label'     => esc_html__('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-heading-title'     => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-heading-title a'   => 'color: {{VALUE}};',
                ],
            ]
        );

         $this->add_control(
            'title_color_hover',
            [
                'label'     => esc_html__('Text Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-heading-title:hover'   => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-heading-title a:hover'   => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'typography',
                'selector' => '{{WRAPPER}} .elementor-heading-title',
            ]
        );

        $this->add_group_control(
            Group_Control_Text_Stroke::get_type(),
            [
                'name'     => 'text_stroke',
                'selector' => '{{WRAPPER}} .elementor-heading-title',
            ]
        );

        $this->add_group_control(
            Group_Control_Text_Shadow::get_type(),
            [
                'name'     => 'text_shadow',
                'selector' => '{{WRAPPER}} .elementor-heading-title',
            ]
        );

        $this->add_control(
            'blend_mode',
            [
                'label'     => esc_html__('Blend Mode', 'antra'),
                'type'      => Controls_Manager::SELECT,
                'options'   => [
                    ''            => esc_html__('Normal', 'antra'),
                    'multiply'    => 'Multiply',
                    'screen'      => 'Screen',
                    'overlay'     => 'Overlay',
                    'darken'      => 'Darken',
                    'lighten'     => 'Lighten',
                    'color-dodge' => 'Color Dodge',
                    'saturation'  => 'Saturation',
                    'color'       => 'Color',
                    'difference'  => 'Difference',
                    'exclusion'   => 'Exclusion',
                    'hue'         => 'Hue',
                    'luminosity'  => 'Luminosity',
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-heading-title' => 'mix-blend-mode: {{VALUE}}',
                ],
                'separator' => 'none',
            ]
        );

        $this->add_control(
            'title_hover_decoration',
            [
                'label'     => esc_html__( 'Hover Decoration', 'antra' ),
                'type'      => Controls_Manager::SWITCHER,
                'default' => '',
                'prefix_class'	=> 'title-hover-decoration-'
            ]
        );

        $this->add_control(
            'decoration_position',
            [
                'label'        => __('Decoration Position', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'default'      => 'below',
                'options'      => [
                    'above' => __('Above', 'antra'),
                    'below' => __('Below', 'antra'),
                ],
                'prefix_class' => 'decoration-position-',
                'condition' => [
                    'title_hover_decoration' => 'yes',
                ],
            ]
        );

        $this->add_responsive_control(
            'decoration_width',
            [
                'label'      => __('Decoration Size', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 20,
                    ],
                ],
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}}.decoration-position-below .elementor-heading-title'        => 'border-bottom-width: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}}.decoration-position-below .elementor-heading-title:after' => 'height: {{SIZE}}{{UNIT}}; bottom:-{{SIZE}}{{UNIT}}',
                    '{{WRAPPER}}.decoration-position-above .elementor-heading-title'       => 'border-top-width: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}}.decoration-position-above .elementor-heading-title:after' => 'height: {{SIZE}}{{UNIT}}; top:-{{SIZE}}{{UNIT}}',
                ],
                'condition' => [
                    'title_hover_decoration' => 'yes',
                ],
            ]
        );

        $this->add_responsive_control(
            'decoration_padding',
            [
                'label'      => esc_html__('Decoration spacing', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}}.decoration-position-below .elementor-heading-title' => 'padding-bottom: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}}.decoration-position-above .elementor-heading-title' => 'padding-top: {{SIZE}}{{UNIT}};',
                ],
                'condition' => [
                    'title_hover_decoration' => 'yes',
                ],
            ]
        );

        $this->add_control(
            'decoration_color',
            [
                'label'     => esc_html__('Decoration Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}}.decoration-position-below .elementor-heading-title' => 'border-bottom-color: {{VALUE}};',
                    '{{WRAPPER}}.decoration-position-above .elementor-heading-title' => 'border-top-color: {{VALUE}};',
                ],
                'condition' => [
                    'title_hover_decoration' => 'yes',
                ],
            ]
        );

        $this->add_control(
            'decoration_color_hover',
            [
                'label'     => esc_html__('Decoration Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-heading-title:after ' => 'background-color: {{VALUE}};',
                ],
                'condition' => [
                    'title_hover_decoration' => 'yes',
                ],
            ]
        );



        $this->add_control(
            'title_icon_style_heading',
            [
                'type'      => Controls_Manager::HEADING,
                'label'     => esc_html__('Icon', 'antra'),
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'title_icon_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-heading-title .elementor-button-icon i' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-heading-title .elementor-button-icon svg' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-heading-title .elementor-button-icon path' => 'color: {{VALUE}};',

                ],
            ]
        );

        $this->add_control(
            'title_icon_color_hover',
            [
                'label'     => esc_html__('Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-heading-title:hover .elementor-button-icon i' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-heading-title:hover .elementor-button-icon svg' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-heading-title:hover .elementor-button-icon path' => 'color: {{VALUE}};',

                ],
            ]
        );

        $this->add_responsive_control(
            'title_icon_size',
            [
                'label'          => esc_html__('Icon size', 'antra'),
                'type'           => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 30,
                        'max' => 500,
                    ],
                ],
                'size_units' => ['px', 'em', '%'],
                'selectors'      => [
                    '{{WRAPPER}} .elementor-heading-title .elementor-button-icon i' => 'font-size: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}} .elementor-heading-title .elementor-button-icon svg' => 'width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_sub_title_style',
            [
                'label' => __('Sub Title', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'sub_title_color',
            [
                'label'     => __('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-sub-title' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-heading-wrapper-inner .elementor-sub-title:before' => 'background: {{VALUE}};',

                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'subtitle_typography',
                'selector' => '{{WRAPPER}} .elementor-sub-title',
            ]
        );

        $this->add_group_control(
            Group_Control_Text_Shadow::get_type(),
            [
                'label'    => __('Text shadow subtitle', 'antra'),
                'name'     => 'text_shadow_subtitle',
                'selector' => '{{WRAPPER}} .elementor-sub-title',
            ]
        );

        $this->add_responsive_control(
            'sub_title_spacing',
            [
                'label'     => __('Spacing', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'range'     => [
                    'px' => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'selectors' => [
                    '{{WRAPPER}}.subtitle-position-below .elementor-sub-title' => 'margin-top: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}}.subtitle-position-above .elementor-sub-title' => 'margin-bottom: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'        => 'wrapper_border',
                'placeholder' => '1px',
                'default'     => '1px',
                'selector'    => '{{WRAPPER}} .elementor-title-span',
                'separator'   => 'before',

            ]
        );

        $this->add_control(
            'wrapper_radius',
            [
                'label'      => esc_html__('Border Radius', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-title-span' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'padding_sub_title_wrapper',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-title-span' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'subtitle_icon_style_heading',
            [
                'type'      => Controls_Manager::HEADING,
                'label'     => esc_html__('Icon', 'antra'),
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'subtitle_icon_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-sub-title .elementor-button-icon i' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-sub-title .elementor-button-icon svg' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-sub-title .elementor-button-icon path' => 'color: {{VALUE}};',

                ],
            ]
        );

        $this->add_responsive_control(
            'subtitle_icon_size',
            [
                'label'          => esc_html__('Icon size', 'antra'),
                'type'           => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 30,
                        'max' => 500,
                    ],
                ],
                'size_units' => ['px', 'em', '%'],
                'selectors'      => [
                    '{{WRAPPER}} .elementor-sub-title .elementor-button-icon i' => 'font-size: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}} .elementor-sub-title .elementor-button-icon svg' => 'width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );


        $this->add_responsive_control(
            'subtitle_icon_margin',
            [
                'label'      => esc_html__('Icon Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-sub-title .elementor-button-icon i, {{WRAPPER}} .elementor-sub-title .elementor-button-icon svg' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();
    }

    /**
     * Render heading widget output on the frontend.
     *
     * Written in PHP and used to generate the final HTML.
     *
     * @since 1.0.0
     * @access protected
     */

    protected function render() {
        $settings = $this->get_settings_for_display();


        $this->add_render_attribute('title', 'class', 'elementor-heading-title');

        if (!empty($settings['size'])) {
            $this->add_render_attribute('title', 'class', 'elementor-size-' . $settings['size']);
        }

        if (!empty($settings['mouse_cursor'])) {
            $this->add_render_attribute('title', 'data-cursor', '-'.sanitize_title($settings['mouse_cursor']));
            if ($settings['mouse_cursor'] == 'text') {
                $this->add_render_attribute('title', 'data-cursor-text', !empty($settings['cursor_text']) ? $settings['cursor_text'] : __('View', 'antra'));
            }
        }

        $title = $settings['title'];

        $title_html = '';

        $title_html .= '<div class="elementor-heading-wrapper-inner">';

        if($title) {
            $is_new = empty( $settings['icon'] ) && Icons_Manager::is_migration_allowed();
            $migrated = isset( $settings['__fa4_migrated']['title_icon'] );
            $title_icon = '';
            if ( ! empty( $settings['icon'] ) || ! empty( $settings['title_icon']['value'] ) ) :
                ob_start();
                $this->add_render_attribute( [
                    'title_icon_position' => [
                        'class' => [
                            'elementor-button-icon',
                            'antra-title-icon-' . $settings['title_icon_position'],
                        ],
                    ],
                ] );
                ?>
                <span <?php $this->print_render_attribute_string( 'title_icon_position' ); ?>>
                    <?php if ( $is_new || $migrated ) :
                        
                        Icons_Manager::render_icon( $settings['title_icon'], [ 'aria-hidden' => 'true' ] );
                    else : ?>
                        <i class="<?php echo esc_attr( $settings['icon'] ); ?>" aria-hidden="true"></i>
                    <?php endif; ?>
                </span>
                <?php
                $title_icon = ob_get_clean();
            endif;

            if (!empty($title_icon)) {
                $title = ($settings['title_icon_position'] == 'right') ? $title.$title_icon : $title_icon.$title;
            }

            if (!empty($settings['link']['url'])) {
                $this->add_render_attribute('url', 'href', $settings['link']['url']);

                if ($settings['link']['is_external']) {
                    $this->add_render_attribute('url', 'target', '_blank');
                }

                if (!empty($settings['link']['nofollow'])) {
                    $this->add_render_attribute('url', 'rel', 'nofollow');
                }

                $title = sprintf('<a %1$s>%2$s</a>', $this->get_render_attribute_string('url'), $title);
            }

            $title_html .= sprintf('<%1$s %2$s>%3$s</%1$s>', $settings['header_size'], $this->get_render_attribute_string('title'), $title);
        }

        if ($settings['sub_title']) {

            $is_new = empty( $settings['subicon'] ) && Icons_Manager::is_migration_allowed();
            $migrated = isset( $settings['__fa4_migrated']['sub_title_icon'] );
            $subtitle_icon = '';
            if ( ! empty( $settings['subicon'] ) || ! empty( $settings['sub_title_icon']['value'] ) ) :
                ob_start();
                $this->add_render_attribute( [
                    'sub_title_icon_position' => [
                        'class' => [
                            'elementor-button-icon',
                            'antra-subtitle-icon-' . $settings['sub_title_icon_position'],
                        ],
                    ],
                ] );
                ?>
                <span <?php $this->print_render_attribute_string( 'sub_title_icon_position' ); ?>>
                    <?php if ( $is_new || $migrated ) :
                        Icons_Manager::render_icon( $settings['sub_title_icon'], [ 'aria-hidden' => 'true' ] );
                    else : ?>
                        <i class="<?php echo esc_attr( $settings['subicon'] ); ?>" aria-hidden="true"></i>
                    <?php endif; ?>
                </span>
                <?php
                $subtitle_icon = ob_get_clean();
            endif;

            $sub_title = $settings['sub_title'];

            if (!empty($subtitle_icon)) {
                $sub_title = ($settings['sub_title_icon_position'] == 'right') ? $sub_title.$subtitle_icon : $subtitle_icon.$sub_title;
            }

            $title_html .= '<div class="elementor-sub-title"><span class="elementor-title-span">' . $sub_title . '</span></div>';
        }

        $title_html .= '</div>';

        printf('%s', $title_html);
    }
}

$widgets_manager->register(new Antra_Elementor_Heading());