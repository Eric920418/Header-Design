<?php

if (!defined('ABSPATH')) {
    exit; // Exit if accessed directly.
}

if (!post_type_exists('project')) {
    return;
}

use Elementor\Controls_Manager;
use Elementor\Group_Control_Image_Size;

class Antra_Elementor_Project_Before_After extends Elementor\Widget_Base {

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
        return 'antra-project-before-after';
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
        return esc_html__('Antra Project Before After', 'antra');
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
        return 'eicon-image-before-after';
    }

    public function get_script_depends() {
        return ['antra-elementor-project-before-after', 'beforeafter'];
    }

    public function get_categories() {
        return array('antra-addons');
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
                'label' => esc_html__('Image', 'antra'),
            ]
        );

        $this->add_control(
            'project_show',
            [
                'label'        => esc_html__('Project Show', 'antra'),
                'type'         => Controls_Manager::SELECT,
                'default'      => 'single',
                'options'      => [
                    'single' => __('Single/Loop Project', 'antra'),
                    'select' => __('Selected Project', 'antra'),
                ],
            ]
        );

        $this->add_control(
            'choose_project',
            [
                'label'     => __('Project', 'antra'),
                'type'      => 'project',
                'multiple'    => false,
                'condition' => [
                    'project_show' => 'select'
                ],
            ]
        );

        $this->add_group_control(
            Elementor\Group_Control_Image_Size::get_type(),
            [
                'name'      => 'image', // Usage: `{name}_size` and `{name}_custom_dimension`, in this case `brand_image_size` and `brand_image_custom_dimension`.
                'default'   => 'full',
                'separator' => 'none',
            ]
        );

        $this->end_controls_section();

        $this->start_controls_section(
            'section_style',
            [
                'label' => esc_html__('Wrapper', 'antra'),
                'tab'   => Controls_Manager::TAB_STYLE,
            ]
        );

        $this->add_responsive_control(
            'image_width',
            [
                'label'          => esc_html__('Width', 'antra'),
                'type'           => Controls_Manager::SLIDER,
                'default'        => [
                    'unit' => 'px',
                    'size' => '970',
                ],
                'tablet_default' => [
                    'unit' => 'px',
                ],
                'mobile_default' => [
                    'unit' => 'px',
                ],
                'size_units'     => ['px', '%'],
                'range'          => [
                    'px' => [
                        'min' => 1,
                        'max' => 1500,
                    ],
                    '%'  => [
                        'min' => 1,
                        'max' => 100,
                    ],
                ],
                'selectors'      => [
                    '{{WRAPPER}} .elementor-image-before-after' => 'max-width: {{SIZE}}{{UNIT}};',
                ],
            ]
        );

        $this->add_responsive_control(
            'image_height',
            [
                'label'          => esc_html__('Height', 'antra'),
                'type'           => Controls_Manager::SLIDER,
                'default'        => [
                    'unit' => 'px',
                    'size' => '600',
                ],
                'tablet_default' => [
                    'unit' => 'px',
                ],
                'mobile_default' => [
                    'unit' => 'px',
                ],
                'size_units'     => ['px', 'vh'],
                'range'          => [
                    'px' => [
                        'min' => 1,
                        'max' => 500,
                    ],
                    'vh' => [
                        'min' => 1,
                        'max' => 100,
                    ],
                ],
                'selectors'      => [
                    '{{WRAPPER}} .elementor-image-before-after-wrapper' => 'height: {{SIZE}}{{UNIT}};',
                    '{{WRAPPER}} .elementor-image-before-after'         => 'height: {{SIZE}}{{UNIT}};',
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
                    '{{WRAPPER}} .elementor-image-before-after-wrapper' => 'border-radius: {{TOP}}{{UNIT}} {{RIGHT}}{{UNIT}} {{BOTTOM}}{{UNIT}} {{LEFT}}{{UNIT}}; overflow: hidden',
                ],
            ]
        );

        $this->end_controls_section();
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
        $project_show = empty($settings['project_show']) ? 'single' : $settings['project_show'];
        if ($project_show == 'single') {
            if (is_singular('project') || get_post_type() == 'project') {
                $project_id = get_the_ID();
            }
        } else {
            if (!empty($settings['choose_project'])) {
                $project_id = absint($settings['choose_project']);
            }
        }
        $project_id = $project_id ?? antra_get_default_project();
        $before_after = get_post_meta($project_id, '_project_before_after', true);
        if (!isset($before_after[0])) {
            return;
        }
        $before_after = $before_after[0];
        
        if (!empty($before_after['before_image_id']) && !empty($before_after['after_image_id'])) {
            // wrapper
            $this->add_render_attribute('wrapper', 'class', 'elementor-image-before-after-wrapper');
            $this->add_render_attribute('inner', 'class', 'elementor-image-before-after');
            $image_before = Group_Control_Image_Size::get_attachment_image_src($before_after['before_image_id'], 'image', $settings);
            $image_after  = Group_Control_Image_Size::get_attachment_image_src($before_after['after_image_id'], 'image', $settings);
            ?>
            <div <?php $this->print_render_attribute_string('wrapper'); // WPCS: XSS ok.?>>
                <div <?php $this->print_render_attribute_string('inner'); // WPCS: XSS ok.?>>
                     <div class="item-image before-image">
                        <img class="content-image" src="<?php echo esc_url($image_before); ?>" draggable="false"/>
                     </div>
                    <div class="item-image after-image">
                        <img class="content-image" src="<?php echo esc_url($image_after); ?>" draggable="false"/>
                    </div>
                </div>
            </div>
            <?php
        } else {
            ?><pre><?php _e('Please add the before-after image for this project!', 'antra'); ?></pre><?php
        }
    }
}

$widgets_manager->register(new Antra_Elementor_Project_Before_After());

