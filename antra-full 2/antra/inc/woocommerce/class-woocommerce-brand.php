<?php

/**
 * Main class of plugin for admin
 */
class Antra_Woocommerce_Brand {
    /**
     * Class constructor.
     */
    public function __construct() {
        add_action('product_brand_add_form_fields', array($this, 'add_product_brand_image'), 10, 2);
        add_action('created_product_brand', array($this, 'save_product_brand_image'), 10, 2);
        add_action('product_brand_edit_form_fields', array($this, 'update_product_brand_image'), 10, 2);
        add_action('edited_product_brand', array($this, 'updated_product_brand_image'), 10, 2);
        add_action('admin_enqueue_scripts', array($this, 'load_media'));
        add_filter("manage_edit-product_brand_columns", array($this, 'taxonomy_columns'));
        add_filter("manage_product_brand_custom_column", array($this, 'taxonomy_column'), 10, 3);
    }

    public function load_media() {
        global $antra_version;

        wp_enqueue_media();
        wp_enqueue_script('shoppic-admin-woocommerce-brand-scripts', get_theme_file_uri('assets/js/admin/woocommerce-brand.js'), array('jquery'), $antra_version, true);
    }

    public function taxonomy_columns($columns) {
        $new_columns = array();
        if (isset($columns['cb'])) {
            $new_columns['cb'] = $columns['cb'];
        }

        $new_columns['product-meta-preview'] = '';

        if (isset($columns['cb'])) {
            unset($columns['cb']);
        }

        return array_merge($new_columns, $columns);
    }

    public function taxonomy_column($columns, $column, $term_id) {
        $image_id = get_term_meta($term_id, 'product_brand_logo', true); ?>
        <div class="product_brand_preview"><?php if ($image_id) :echo wp_get_attachment_image($image_id, 'thumbnail', false, array(
                'style' => 'max-width:70px; object-fit:contain;'
            )); endif; ?></div>
        <?php
    }

    /*
     * Add a form field in the new product_brand page
     * @since 1.0.0
    */
    public function add_product_brand_image($taxonomy) { ?>
        <div class="form-field term-group">
            <label for="product_brand_logo"><?php esc_html_e('Image', 'antra'); ?></label>
            <input type="hidden" id="product_brand_logo" name="product_brand_logo" class="custom_media_url" value="">
            <div id="product_brand-image-wrapper"></div>
            <p>
                <input type="button" class="button button-secondary ct_tax_media_button" id="ct_tax_media_button" name="ct_tax_media_button" value="<?php esc_attr_e('Add Image', 'antra'); ?>"/>
                <input type="button" class="button button-secondary ct_tax_media_remove" id="ct_tax_media_remove" name="ct_tax_media_remove" value="<?php esc_attr_e('Remove Image', 'antra'); ?>"/>
            </p>
        </div>
        <?php
    }

    /*
     * Save the form field
     * @since 1.0.0
    */
    public function save_product_brand_image($term_id, $tt_id) {
        if (isset($_POST['product_brand_logo']) && '' !== $_POST['product_brand_logo']) {
            $image = absint($_POST['product_brand_logo']);
            add_term_meta($term_id, 'product_brand_logo', $image, true);
        }
    }

    /*
     * Edit the form field
     * @since 1.0.0
    */
    public function update_product_brand_image($term, $taxonomy) { ?>
        <tr class="form-field term-group-wrap">
            <th scope="row">
                <label for="product_brand_logo"><?php esc_html_e('Image', 'antra'); ?></label>
            </th>
            <td>
                <?php $image_id = get_term_meta($term->term_id, 'product_brand_logo', true); ?>
                <input type="hidden" id="product_brand_logo" name="product_brand_logo" value="<?php echo esc_attr($image_id); ?>">
                <div id="product_brand-image-wrapper">
                    <?php if ($image_id) { ?>
                        <?php echo wp_get_attachment_image($image_id, 'thumbnail'); ?>
                    <?php } ?>
                </div>
                <p>
                    <input type="button" class="button button-secondary ct_tax_media_button" id="ct_tax_media_button" name="ct_tax_media_button" value="<?php esc_attr_e('Add Image', 'antra'); ?>"/>
                    <input type="button" class="button button-secondary ct_tax_media_remove" id="ct_tax_media_remove" name="ct_tax_media_remove" value="<?php esc_attr_e('Remove Image', 'antra'); ?>"/>
                </p>
            </td>
        </tr>
        <?php
    }

    /*
     * Update the form field value
     * @since 1.0.0
     */
    public function updated_product_brand_image($term_id, $tt_id) {
        if (isset($_POST['product_brand_logo']) && '' !== $_POST['product_brand_logo']) {
            $image = absint($_POST['product_brand_logo']);
            update_term_meta($term_id, 'product_brand_logo', $image);
        } else {
            update_term_meta($term_id, 'product_brand_logo', '');
        }
    }

}

new Antra_Woocommerce_Brand;
