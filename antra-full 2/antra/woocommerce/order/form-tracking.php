<?php
/**
 * Order tracking form
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/order/form-tracking.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce/Templates
 * @version 7.0.1
 */

defined( 'ABSPATH' ) || exit;

global $post;
?>

<form action="<?php echo esc_url( get_permalink( $post->ID ) ); ?>" method="post" class="woocommerce-form woocommerce-form-track-order track_order">
    <?php
    /**
     * Action hook fired at the beginning of the form-tracking form.
     *
     * @since 6.5.0
     */
    do_action( 'woocommerce_order_tracking_form_start' );
    ?>

    <div class="order-text"><p><?php esc_html_e( 'To track your order please enter your Order ID in the box below and press the "Track" button. This was given to you on your receipt and in the confirmation email you should have received.', 'antra' ); ?></p></div>
    <div class="row">
        <div class="column-desktop-5 column-12"><label for="orderid"><?php esc_html_e( 'Order ID', 'antra' ); ?></label> <input class="input-text" type="text" name="orderid" id="orderid" value="<?php echo isset( $_REQUEST['orderid'] ) ? esc_attr( wp_unslash( $_REQUEST['orderid'] ) ) : ''; ?>" placeholder="<?php esc_attr_e( 'Found in your order confirmation email.', 'antra' ); ?>" /></div>
        <div class="column-desktop-5 column-12"><label for="order_email"><?php esc_html_e( 'Billing email', 'antra' ); ?></label> <input class="input-text" type="text" name="order_email" id="order_email" value="<?php echo isset( $_REQUEST['order_email'] ) ? esc_attr( wp_unslash( $_REQUEST['order_email'] ) ) : ''; ?>" placeholder="<?php esc_attr_e( 'Email you used during checkout.', 'antra' ); ?>" /></div>

        <?php
        /**
         * Action hook fired in the middle of the form-tracking form (before the submit button).
         *
         * @since 6.5.0
         */
        do_action( 'woocommerce_order_tracking_form' );
        ?>

        <div class="column-desktop-2 column-12"><button type="submit" class="button" name="track" value="<?php esc_attr_e( 'Track', 'antra' ); ?>"><?php esc_html_e( 'Track', 'antra' ); ?></button></div>
    </div>
	<?php wp_nonce_field( 'woocommerce-order_tracking', 'woocommerce-order-tracking-nonce' ); ?>

    <?php
    /**
     * Action hook fired at the end of the form-tracking form (after the submit button).
     *
     * @since 6.5.0
     */
    do_action( 'woocommerce_order_tracking_form_end' );
    ?>
</form>
