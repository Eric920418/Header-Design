<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

use Elementor\Group_Control_Typography;
use Elementor\Controls_Manager;
use Elementor\Group_Control_Border;
use Elementor\Modules\Shapes\Module as Shapes_Module;
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
class Caren_Elementor_Text_Scrolling extends Elementor\Widget_Base {

    public function get_categories() {
        return array('portfolio-addons');
    }

    /**
     * Get widget name.
     *
     * Retrieve tabs widget name.
     *
     * @return string Widget name.
     * @since 1.0.0
     * @access public
     *
     */
    public function get_name() {
        return 'portfolio-text-scrolling';
    }

    /**
     * Get widget title.
     *
     * Retrieve tabs widget title.
     *
     * @return string Widget title.
     * @since 1.0.0
     * @access public
     *
     */
    public function get_title() {
        return esc_html__('Antra Text Scrolling', 'antra');
    }

    /**
     * Get widget icon.
     *
     * Retrieve tabs widget icon.
     *
     * @return string Widget icon.
     * @since 1.0.0
     * @access public
     *
     */
    public function get_icon() {
        return 'eicon-post-slider';
    }

    /**
	 * Get style dependencies.
	 *
	 * Retrieve the list of style dependencies the widget requires.
	 *
	 * @access public
	 *
	 * @return array Widget style dependencies.
	 */
	public function get_style_depends(): array {
		return [ 'widget-text-path' ];
	}

    /**
     * Register tabs widget controls.
     *
     * Adds different input fields to allow the user to change and customize the widget settings.
     *
     * @since 1.0.0
     * @access protected
     */
    protected function register_controls() {

        $this->start_controls_section(
            'section_scrolling',
            [
                'label' => esc_html__('Items', 'antra'),
            ]
        );

        $repeater = new Repeater();

        $repeater->add_control(
            'scrolling_title',
            [
                'label'       => esc_html__('Scrolling name', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'placeholder' => esc_html__('Scrolling Name', 'antra'),
                'label_block' => true,
            ]
        );

        $this->add_control(
            'scrolling',
            [
                'label'       => esc_html__('Items', 'antra'),
                'type'        => Controls_Manager::REPEATER,
                'fields'      => $repeater->get_controls(),
                'title_field' => '{{{ scrolling_title }}}',
            ]
        );


        $this->add_control(
            'heading_settings',
            [
                'label'     => esc_html__('Settings', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );

        $this->add_responsive_control(
            'scrolling_align',
            [
                'label'     => esc_html__('Alignment', 'antra'),
                'type'      => Controls_Manager::CHOOSE,
                'options'   => [
                    'flex-start' => [
                        'title' => esc_html__('Left', 'antra'),
                        'icon'  => 'eicon-text-align-left',
                    ],
                    'center'     => [
                        'title' => esc_html__('Center', 'antra'),
                        'icon'  => 'eicon-text-align-center',
                    ],
                    'flex-end'   => [
                        'title' => esc_html__('Right', 'antra'),
                        'icon'  => 'eicon-text-align-right',
                    ],
                ],
                'default'   => 'center',
                'selectors' => [
                    '{{WRAPPER}} .elementor-scrolling-wrapper .elementor-scrolling-item-inner' => 'align-items: {{VALUE}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'item_spacing',
            [
                'label'      => esc_html__('Spacing', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px', 'em'],
                'selectors'  => [
//                     '{{WRAPPER}} .elementor-scrolling-wrapper .elementor-scrolling-inner' => 'margin-left: calc(-{{SIZE}}{{UNIT}}/2); margin-right: calc(-{{SIZE}}{{UNIT}}/2);',
'{{WRAPPER}} .elementor-scrolling-wrapper .elementor-scrolling-item'  => 'margin-left: calc({{SIZE}}{{UNIT}}/2); margin-right: calc({{SIZE}}{{UNIT}}/2);',
                ],
            ]
        );

        $this->add_responsive_control(
            'duration',
            [
                'label'     => esc_html__('Scrolling duration', 'antra'),
                'type'      => Controls_Manager::NUMBER,
                'default'   => 10,
                'selectors' => [
                    '{{WRAPPER}} .elementor-scrolling-inner' => 'animation-duration: {{VALUE}}s',
                ],
            ]
        );

        $this->add_control(
            'scroll_direction',
            [
                'label'     => esc_html__('Direction', 'antra'),
                'type'      => Controls_Manager::CHOOSE,
                'options'   => [
                    'vertical' => [
                        'title' => esc_html__('Vertical', 'antra'),
                        'icon'  => 'eicon-navigation-vertical',
                    ],
                    'horizontal'     => [
                        'title' => esc_html__('Horizontal', 'antra'),
                        'icon'  => 'eicon-navigation-horizontal',
                    ],
                ],
                'default'   => 'horizontal',
                'prefix_class' => 'antra-textscroll-'
            ]
        );

        $this->add_control(
            'stroke-style',
            [
                'label'        => esc_html__('Stroke style', 'antra'),
                'type'         => Controls_Manager::SWITCHER,
                'prefix_class' => 'stroke-style-'
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'style_scrolling_item',
            [
                'label' => esc_html__('Item', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );


        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'     => 'scrolling_item',
                'selector' => '{{WRAPPER}} .elementor-scrolling-item-inner',
            ]
        );
        $this->add_responsive_control(
            'item_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-scrolling-item-inner' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );
        $this->end_controls_section();

        // Title.
        $this->start_controls_section(
            'section_style_scrolling_title',
            [
                'label' => esc_html__('Title', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'title_text_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .scrolling-title'  => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'title_text_color_hover',
            [
                'label'     => esc_html__('Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .scrolling-title:hover' => 'color: {{VALUE}};',

                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Typography::get_type(),
            [
                'name'     => 'title_typography',
                'selector' => '{{WRAPPER}} .scrolling-title',
            ]
        );

        $this->end_controls_section();
    }

    /**
     * Render tabs widget output on the frontend.
     *
     * Written in PHP and used to generate the final HTML.
     *
     * @since 1.0.0
     * @access protected
     */
    protected function render() {
        $settings = $this->get_settings_for_display();
        if (!empty($settings['scrolling']) && is_array($settings['scrolling'])) {

            $this->add_render_attribute('wrapper', 'class', 'elementor-scrolling-wrapper');


            $this->add_render_attribute('item', 'class', 'elementor-scrolling-item');

            if (!empty($settings['icon_border_style']) && $settings['icon_border_style'] == 'yes') {
                if (!empty($settings['icon_textpath'])) {
                    $icon_textpath = $settings['icon_textpath'];

                    $path_url = Shapes_Module::get_path_url( 'circle' );
                    // Remove the HTTP protocol to prevent Mixed Content error.
                    $path_url = preg_replace( '/^https?:/i', '', $path_url );

                    // Add Text Path attributes.
                    $this->add_render_attribute( 'text_path', [
                        'class' => 'e-text-path',
                        'data-text' => htmlentities( esc_attr( $icon_textpath) ),
                        'data-url' => esc_url( $path_url ),
                        // 'data-link-url' => esc_url( $settings['link']['url'] ?? '' ),
                    ] );
                }
            }
            ?>
            <div class="elementor-scrolling">
                <div <?php $this->print_render_attribute_string('wrapper'); ?>>
                    <?php
                    for ($i = 0; $i <= 3; $i++) {
                        ?>
                        <div class="elementor-scrolling-inner">
                            <?php foreach ($settings['scrolling'] as $item) :
                                $has_icon = ! empty( $item['selected_icon']['value'] );

                                if ( ! isset( $item['icon'] ) && ! Icons_Manager::is_migration_allowed() ) {
                                    // add old default
                                    $item['icon'] = 'fa fa-star';
                                }

                                $this->remove_render_attribute('i');
                                if ( ! empty( $item['icon'] ) ) {
                                    $this->add_render_attribute( 'i', 'class', $item['icon'] );
                                    $this->add_render_attribute( 'i', 'aria-hidden', 'true' );
                                }

                                $migrated = isset( $item['__fa4_migrated']['selected_icon'] );
                                $is_new = ! isset( $item['icon'] ) && Icons_Manager::is_migration_allowed();
                                ?>
                                <div <?php $this->print_render_attribute_string('item'); ?>>
                                    <div class="elementor-scrolling-item-inner">
                                    <?php if ( $has_icon ) : ?>
                                    <span class="elementor-text-icon">
                                        <?php
                                        if ( $is_new || $migrated ) {
                                            Icons_Manager::render_icon( $item['selected_icon'], [ 'aria-hidden' => 'true' ] );
                                        } elseif ( ! empty( $item['icon'] ) ) {
                                            ?><i <?php $this->print_render_attribute_string( 'i' ); ?>></i><?php
                                        }

                                        if (isset($icon_textpath)) {
                                            ?>
                                            <span class="antra-textscrolling-icon-textpath">
                                                <span class="elementor-element rotate elementor-widget elementor-widget-text-path antra-textpath-background-icon"
                                                    data-id="item-scroll-<?php echo esc_attr($item['_id']); ?>"
                                                    data-element_type="widget"
                                                    data-settings='{"text":"","start_point":{"unit":"%","size":"","sizes":[]},"link":{}}'
                                                    data-widget_type="text-path.default">
                                                    <span <?php $this->print_render_attribute_string( 'text_path' ); ?>></span>
                                                </span>
                                            </span>
                                            <?php
                                        }
                                        ?>
                                         <span class="border-one"> </span>
                                         <span class="border-two"> </span>

                                    </span>
                                    <?php endif; ?>
                                        <?php if ($item['scrolling_title']) { ?>
                                            <div class="scrolling-title elementor-repeater-item-<?php echo esc_attr($item['_id']); ?>">
                                                <?php
                                                if (!empty($item['link'])) {
                                                    if (!empty($item['link']['is_external'])) {
                                                        $this->add_render_attribute('scrolling-title', 'target', '_blank');
                                                    }

                                                    if (!empty($item['link']['nofollow'])) {
                                                        $this->add_render_attribute('scrolling-title', 'rel', 'nofollow');
                                                    }

                                                    echo '<a href="' . esc_url($item['link']['url'] ? $item['link']['url'] : '#') . '" ' . $this->get_render_attribute_string('scrolling-title') . ' title="' . esc_attr($item['scrolling_title']) . '">';
                                                } ?>
                                                <?php echo esc_html($item['scrolling_title']); ?>
                                                <?php if (!empty($item['link'])) {
                                                    echo '</a>';
                                                } ?>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                        <?php
                    }
                    ?>
                </div>
            </div>
            <?php
        }
    }
}

$widgets_manager->register(new Caren_Elementor_Text_Scrolling());
