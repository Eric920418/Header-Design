<?php
namespace Antra\Elementor;

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

use Elementor\Controls_Manager;
use Elementor\Group_Control_Box_Shadow;
use Elementor\Icons_Manager;
use Elementor\Group_Control_Border;
use Elementor\Group_Control_Image_Size;
use Antra\Elementor\Antra_Group_Control_Typography;

class Antra_Video_Popup extends \Elementor\Widget_Base {


    public function get_name() {
        return 'antra-video-popup';
    }

    public function get_title() {
        return esc_html__('Antra Video', 'antra');
    }

    public function get_icon() {
        return 'eicon-youtube';
    }

    public function get_script_depends() {
        return ['antra-elementor-video', 'magnific-popup'];
    }

    public function get_style_depends() {
        return ['magnific-popup'];
    }


    protected function register_controls() {
        $this->start_controls_section(
            'section_videos',
            [
                'label' => esc_html__('General', 'antra'),
                'tab'   => Controls_Manager::TAB_CONTENT,
            ]
        );

        $this->add_control(
            'video_link',
            [
                'label'       => esc_html__('Link to', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'description' => esc_html__('Support video from Youtube and Vimeo', 'antra'),
                'placeholder' => esc_html__('https://your-link.com', 'antra'),
            ]
        );

        $this->add_control(
            'video_style',
            [
                'label' => esc_html__( 'Video Style', 'antra' ),
                'type' => Controls_Manager::SELECT,
                'default' => 'popup',
                'options' => [
                    'popup' => esc_html__( 'Popup', 'antra' ),
                    'background' => esc_html__( 'Background', 'antra' ),
                ],
                'render_type' => 'template',
                'prefix_class' => 'elementor-antra-video-style-'
            ]
        );

        $this->add_control(
            'title',
            [
                'label'       => esc_html__('Title', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'placeholder' => esc_html__('Tile', 'antra'),
                'default'     => '',
            ]
        );
        $this->add_control(
            'description',
            [
                'label'       => esc_html__('Description', 'antra'),
                'type'        => Controls_Manager::TEXT,
                'placeholder' => esc_html__('Description', 'antra'),
                'default'     => '',
            ]
        );

        $this->add_responsive_control(
            'video_align',
            [
                'label'     => esc_html__('Alignment', 'antra'),
                'type'      => Controls_Manager::CHOOSE,
                'options'   => [
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
                'default'   => 'center',
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-wrapper' => 'text-align: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'video_icon',
            [
                'label' => esc_html__( 'Icon', 'antra' ),
                'type' => Controls_Manager::ICONS,
                'fa4compatibility' => 'icon',
                'default' => [
                    'value' => 'fas fa-play-circle',
                    'library' => 'fa-solid',
                ]
            ]
        );

        $this->end_controls_section();

        //Wrapper
        $this->start_controls_section(
            'section_video_wrapper',
            [
                'label' => esc_html__('Wrapper', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->start_controls_tabs('tabs_wrapper_style');

        $this->start_controls_tab(
            'tab_wrapper_normal',
            [
                'label' => esc_html__('Normal', 'antra'),
            ]
        );

        $this->add_control(
            'background_wrapper',
            [
                'label'     => esc_html__('Background', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-popup:after' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_tab();

        $this->start_controls_tab(
            'tab_wrapper_hover',
            [
                'label' => esc_html__('Hover', 'antra'),
            ]
        );

        $this->add_control(
            'background_wrapper_hover',
            [
                'label'     => esc_html__('Background', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-popup:hover:after' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'border_wrapper_hover',
            [
                'label'     => esc_html__('Border Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-popup:hover' => 'border-color: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_tab();

        $this->end_controls_tabs();


        $this->add_group_control(

            Group_Control_Border::get_type(),
            [
                'name'        => 'border_wrapper',
                'placeholder' => '1px',
                'default'     => '1px',
                'selector'    => '{{WRAPPER}} .elementor-video-popup',
                'separator'   => 'before',
            ]
        );

        $this->add_control(
            'wrapper_border_radius',
            [
                'label'      => esc_html__('Border Radius', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-video-popup' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'wrapper_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-video-popup' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );
        $this->add_responsive_control(
            'wrapper_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-video-popup' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_control(
            'background_blur_filter',
            [
                'label'        => esc_html__('Background Blur Filter', 'antra'),
                'type'         => Controls_Manager::SWITCHER,
                'prefix_class' => 'background-blur-filter-'
            ]
        );

        $this->add_control(
            'radar-animation',
            [
                'label'        => esc_html__('Radar Animation', 'antra'),
                'type'         => Controls_Manager::SWITCHER,
                'prefix_class' => 'radar-animation-'
            ]
        );

        $this->end_controls_section();

        //Icon
        $this->start_controls_section(
            'section_video_style',
            [
                'label' => esc_html__('Icon', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
                'condition' => [
                    'video_icon[value]!' => '',
                ],
            ]
        );

        $this->add_responsive_control(
            'video_size',
            [
                'label'     => esc_html__('Font Size', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'range'     => [
                    'px' => [
                        'min' => 0,
                        'max' => 200,
                    ],
                ],
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selectors' => [
                    '{{WRAPPER}} .antra-video-popup .elementor-video-icon' => 'font-size: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'video_width',
            [
                'label'     => esc_html__('Width', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'range'     => [
                    'px' => [
                        'min' => 0,
                        'max' => 200,
                    ],
                ],
                'default'   => [
                    'size' => 50,
                    'unit' => 'px',
                ],
                'condition' => [
                    'video_icon[value]!' => '',
                ],

                'selectors' => [
                    '{{WRAPPER}} .elementor-video-popup .elementor-video-icon ' => 'width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'video_height',
            [
                'label'     => esc_html__('Height', 'antra'),
                'type'      => Controls_Manager::SLIDER,
                'range'     => [
                    'px' => [
                        'min' => 0,
                        'max' => 250,
                    ],
                ],
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-popup .elementor-video-icon' => 'height: {{SIZE}}{{UNIT}};',
                ],
            ]
        );


        $this->start_controls_tabs('tabs_video_style');

        $this->start_controls_tab(
            'tab_video_normal',
            [
                'label' => esc_html__('Normal', 'antra'),
                'condition' => [
                    'video_icon[value]!' => '',
                ],
            ]
        );

        $this->add_control(
            'video_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selectors' => [
                    '{{WRAPPER}} .antra-video-popup .elementor-video-icon ' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .antra-video-popup .elementor-video-icon svg' => 'fill: {{VALUE}};',
                    '{{WRAPPER}} .antra-video-popup .elementor-video-icon svg path' => 'fill: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'video_background_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selectors' => [
                    '{{WRAPPER}} .antra-video-popup .elementor-video-icon' => 'background-color: {{VALUE}};',
                ],
            ]
        );

        $this->end_controls_tab();

        $this->start_controls_tab(
            'tab_video_hover',
            [
                'label' => esc_html__('Hover', 'antra'),
                'condition' => [
                    'video_icon[value]!' => '',
                ],
            ]
        );

        $this->add_control(
            'video_hover_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-icon:hover' => 'color: {{VALUE}};',
                    '{{WRAPPER}} .elementor-video-icon:hover svg' => 'fill: {{VALUE}};',
                    '{{WRAPPER}} .elementor-video-icon:hover svg path' => 'fill: {{VALUE}};',
                ],
            ]
        );
        $this->add_control(
            'video_hover_background_color',
            [
                'label'     => esc_html__('Background Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selectors' => [
                    '{{WRAPPER}}  .elementor-video-icon:hover' => 'background: {{VALUE}};',
                ],
            ]
        );

        $this->add_control(
            'video_hover_border_color',
            [
                'label'     => esc_html__('Border Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-icon:hover' => 'border-color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Box_Shadow::get_type(),
            [
                'name'     => 'video_hover_box_shadow',
                'condition' => [
                    'video_icon[value]!' => '',
                ],
                'selector' => '{{WRAPPER}} .antra-video-popup:hover .elementor-video-icon',
            ]
        );

        $this->end_controls_tab();

        $this->end_controls_tabs();


        $this->add_group_control(
            Group_Control_Border::get_type(),
            [
                'name'        => 'border_video',
                'placeholder' => '1px',
                'default'     => '1px',
                'selector'    => '{{WRAPPER}} .elementor-video-popup .elementor-video-icon',
                'separator'   => 'before',
            ]
        );


        $this->add_control(
            'video_border_radius',
            [
                'label'      => esc_html__('Border Radius', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .elementor-video-popup .elementor-video-icon' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',
                ],
            ]
        );

        $this->add_group_control(
            Group_Control_Box_Shadow::get_type(),
            [
                'name'     => 'video_box_shadow',
                'selector' => '{{WRAPPER}} .antra-video-popup .elementor-video-icon',
            ]
        );

        $this->add_responsive_control(
            'video_padding',
            [
                'label'      => esc_html__('Padding', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-video-popup .elementor-video-icon' => 'padding: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',

                ],
            ]
        );
        $this->add_responsive_control(
            'video_margin',
            [
                'label'      => esc_html__('Margin', 'antra'),
                'type'       => Controls_Manager::DIMENSIONS,
                'size_units' => ['px', 'em', '%'],
                'selectors'  => [
                    '{{WRAPPER}} .antra-video-popup .elementor-video-icon' => 'margin: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}};',

                ],
            ]
        );

        $this->end_controls_section();

        //title
        $this->start_controls_section(
            'section_video_title',
            [
                'label' => esc_html__('Title', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'title_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .antra-video-popup .elementor-video-title' => 'color: {{VALUE}};',

                ],
            ]
        );

        $this->add_control(
            'title_hover_color',
            [
                'label'     => esc_html__('Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-popup:hover .elementor-video-title' => 'color: {{VALUE}};',
                ],
            ]
        );

        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'typography',
                //'scheme' => Scheme_Typography::TYPOGRAPHY_1,
                'selector' => '{{WRAPPER}} .antra-video-popup .elementor-video-title',
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_video_description',
            [
                'label' => esc_html__('Description', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_control(
            'description_color',
            [
                'label'     => esc_html__('Color', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .antra-video-popup .elementor-video-description' => 'color: {{VALUE}};',

                ],
            ]
        );

        $this->add_control(
            'description_hover_color',
            [
                'label'     => esc_html__('Color Hover', 'antra'),
                'type'      => Controls_Manager::COLOR,
                'default'   => '',
                'selectors' => [
                    '{{WRAPPER}} .elementor-video-popup:hover .elementor-video-description' => 'color: {{VALUE}};',
                ],
            ]
        );


        $this->add_group_control(
            Antra_Group_Control_Typography::get_type(),
            [
                'name'     => 'typography_description',
                //'scheme' => Scheme_Typography::TYPOGRAPHY_1,
                'selector' => '{{WRAPPER}} .antra-video-popup .elementor-video-description',
            ]
        );

        $this->end_controls_section();

    }

    protected function render() {
        $settings = $this->get_settings_for_display();
        $this->handle_render($settings);
    }

    public function has_widget_inner_wrapper(): bool {
		return true;
	}

    protected function handle_render($settings) {
        if (empty($settings['video_link'])) {
            return;
        }

        $this->add_render_attribute('wrapper', 'class', 'elementor-video-wrapper');
        $this->add_render_attribute('wrapper', 'class', 'antra-video-popup');

        $this->add_render_attribute('button', 'class', 'elementor-video-popup');
        $this->add_render_attribute('button', 'role', 'button');
        
        if (!empty($settings['video_style']) && $settings['video_style'] == 'background') {
            $this->add_render_attribute('button', 'data-url', esc_url($settings['video_link']));
            $this->add_render_attribute('button', 'href', 'javascript:void(0)');
        }
        else {
            $this->add_render_attribute('button', 'href', esc_url($settings['video_link']));
        }
        $this->add_render_attribute('button', 'data-effect', 'mfp-zoom-in');

        $this->add_render_attribute('video-icon', 'class', 'elementor-video-icon');
        $titleHtml = !empty($settings['title']) ? '<span class="elementor-video-title">' . $settings['title'] . '</span>' : '';
        $this->add_render_attribute('description', 'class', ['elementor-video-description',]);

        $_tag = 'ifram'.'e';
        ?>
        <div <?php $this->print_render_attribute_string('wrapper'); ?>>
            <a <?php $this->print_render_attribute_string('button'); ?>>
                <?php if (!empty($settings['title'])) : ?>
                    <span class="video-content">
                        <?php printf('%s', $titleHtml); ?>
                    </span>
                <?php endif; ?>

                <span <?php $this->print_render_attribute_string('video-icon'); ?>>
                    <?php  Icons_Manager::render_icon( $settings['video_icon'], [ 'aria-hidden' => 'true' ] ); ?>
                </span>

                <?php if (!empty($settings['description'])) : ?>
                <span class="video-description">
                    <span <?php $this->print_render_attribute_string('description'); ?>>
                            <?php printf('%s', $settings['description']); ?>
                    </span>
                </span>
                <?php endif; ?>        
            </a>
            <?php if (!empty($settings['video_style']) && $settings['video_style'] == 'background') : ?>
                <div class="video-background">
                    <?php
                    $video_url = esc_url($settings['video_link']);

                    if (preg_match('/\.mp4$/i', $video_url)) : ?>
                        <video autoplay loop muted playsinline class="video-element">
                            <source src="<?php echo esc_url($video_url); ?>" type="video/mp4">
                        </video>
                    <?php elseif (preg_match('/youtube\.com|youtu\.be/', $video_url)) : ?>
                        <<?php printf('%s', $_tag); ?> src="https://www.youtube.com/embed/<?php echo preg_replace('/.*(?:v=|vi\/|\/embed\/|\/)([\w-]+)/', '$1', $video_url); ?>?autoplay=1&loop=1&mute=1&controls=0&modestbranding=1&playsinline=1&rel=0&playlist=<?php echo preg_replace('/.*(?:v=|vi\/|\/embed\/|\/)([\w-]+)/', '$1', $video_url); ?>"
                                allow="autoplay; encrypted-media" allowfullscreen class="video-element">
                        </<?php printf('%s', $_tag); ?>>
                    <?php elseif (strpos($video_url, 'vimeo.com') !== false) : ?>
                        <<?php printf('%s', $_tag); ?> src="https://player.vimeo.com/video/<?php echo preg_replace('/.*\/(\d+)/', '$1', $video_url); ?>?autoplay=1&loop=1&muted=1&background=1"
                                allow="autoplay; encrypted-media" allowfullscreen class="video-element">
                        </<?php printf('%s', $_tag); ?>>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>
        <?php
    }
}

$widgets_manager->register(new Antra_Video_Popup());
