<?php

namespace Elementor;


if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}


class Antra_Elementor_Progress extends Widget_Progress {


    public function get_title() {
        return __('Antra Progress Bar', 'antra');
    }


    protected function register_controls() {
        $this->start_controls_section(
            'section_progress',
            [
                'label' => __('Progress Bar', 'antra'),
            ]
        );

        $this->add_control(
            'title',
            [
                'label'       => __('Title', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'dynamic'     => [
                    'active' => true,
                ],
                'placeholder' => __('Enter your title', 'antra'),
                'default'     => __('My Skill', 'antra'),
                'label_block' => true,
            ]
        );

        $this->add_control(
            'percent',
            [
                'label'       => __('Percentage', 'antra'),
                'type'        => Controls_Manager::SLIDER,
                'default'     => [
                    'size' => 50,
                    'unit' => '%',
                ],
                'label_block' => true,
            ]
        );

        $this->add_control('display_percentage', [
            'label'   => __('Display Percentage', 'antra'),
            'type'    => Controls_Manager::SELECT,
            'default' => 'show',
            'options' => [
                'show' => __('Show', 'antra'),
                'hide' => __('Hide', 'antra'),
            ],
        ]);

        $this->add_control(
            'view',
            [
                'label'   => __('View', 'antra'),
                'type'    => Controls_Manager::HIDDEN,
                'default' => 'traditional',
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_progress_style',
            [
                'label' => __('Progress Bar', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'bar_bg_color',
            [
                'label'     => __('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-progress-wrapper:before' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'progress_bg_color',
            [
                'label'     => __('Background Color Progress', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-progress-wrapper .elementor-progress-bar' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'progress_height',
            [
                'label'      => esc_html__('Height', 'antra'),
                'type'       => Controls_Manager::SLIDER,
                'range'      => [
                    'px' => [
                        'min' => 0,
                        'max' => 100,
                    ],
                ],
                'size_units' => ['px'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-progress-bar' => 'height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_title',
            [
                'label' => __('Title Style', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'title_color',
            [
                'label'     => __('Text Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-title' => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Typography::get_type(),
            [
                'name'     => 'title_typography',
                'selector' => '{{WRAPPER}} .elementor-title',
            ]
        );

        $this->add_responsive_control(
            'title_margin',
            [
                'label'      => esc_html__('Title Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-title' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
                ],
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_percentage',
            [
                'label' => __('Percentage Style', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'percentage_text_heading',
            [
                'label'     => esc_html__('Percentage Text', 'antra'),
                'type'      => Controls_Manager::HEADING,
                'separator' => 'before',
            ]
        );

        $this->add_control(
            'percentage_text_color',
            [
                'label'     => esc_html__('Percentage Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-progress-percentage' => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Typography::get_type(),
            [
                'name'     => 'percentage_typography',
                'selector' => '{{WRAPPER}} .elementor-progress-percentage',
                'exclude'  => [
                    'line_height',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Text_Shadow::get_type(),
            [
                'name'     => 'percentage_shadow',
                'selector' => '{{WRAPPER}} .elementor-progress-percentage',
            ]
        );

        $this->add_responsive_control(
            'percentage_margin',
            [
                'label'      => esc_html__('Percentage Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-progress-percentage' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}',
                ],
            ]
        );

        $this->end_controls_section();
    }

    protected function render() {
        $settings = $this->get_settings_for_display();

        $this->add_render_attribute('wrapper', [
            'class'         => 'elementor-progress-wrapper',
            'role'          => 'progressbar',
            'aria-valuemin' => '0',
            'aria-valuemax' => '100',
            'aria-valuenow' => $settings['percent']['size'],
        ]);

        if (!empty($settings['progress_type'])) {
            $this->add_render_attribute('wrapper', 'class', 'progress-' . $settings['progress_type']);
        }

        $this->add_render_attribute('progress-bar', [
            'class'    => 'elementor-progress-bar',
            'data-max' => $settings['percent']['size'],
        ]);


        if (!empty($settings['title'])) { ?>
            <div class="elementor-content">
                <span class="elementor-title"><?php printf('%s', $settings['title']); ?></span>
                <?php if ('hide' !== $settings['display_percentage']) { ?>
                    <span class="elementor-progress-percentage" style="<?php echo esc_attr('--progress-percent:'.$settings['percent']['size'].'%') ?>"><?php printf('%s', $settings['percent']['size']); ?>%</span>
                <?php } ?>
            </div>
        <?php } ?>

        <div <?php $this->print_render_attribute_string('wrapper'); ?>>
            <div <?php $this->print_render_attribute_string('progress-bar'); ?>></div>
        </div>
        <?php

    }

    protected function _content_template() {
        ?>
        <#
        view.addRenderAttribute( 'progressWrapper', {
        'class': [ 'elementor-progress-wrapper', 'progress-' + settings.progress_type ],
        'role': 'progressbar',
        'aria-valuemin': '0',
        'aria-valuemax': '100',
        'aria-valuenow': settings.percent.size,
        } );


        #>
        <# if ( settings.title ) { #>
        <div class="elementor-content">
            <span class="elementor-title">{{{ settings.title }}}</span><#
            } #>
            <# if ( 'hide' !== settings.display_percentage ) { #>
            <span class="elementor-progress-percentage" style="--progress-percent:{{{ settings.percent.size }}}%  ">{{{ settings.percent.size }}}%</span>
            <# } #>
        </div>
        <div {{{ view.getRenderAttributeString( 'progressWrapper' ) }}}>
        <div class="elementor-progress-bar" data-max="{{ settings.percent.size }}"></div>
        </div>
        <?php
    }
}

$widgets_manager->register(new Antra_Elementor_Progress());