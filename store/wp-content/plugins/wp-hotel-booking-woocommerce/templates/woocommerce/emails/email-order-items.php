<?php
/**
 * Order hotel item in woocommerce email.
 *
 * This template can be overridden by copying it to yourtheme/wp-hotel-booking-woocommerce/woocommerce/emails/email-order-items.php.
 *
 * @author  ThimPress
 * @package WP-Hotel-Booking/Woocommerce/Template
 * @version 1.8.4
 */

/**
 * Prevent loading this file directly
 */
defined( 'ABSPATH' ) || exit();

/**
 * @var $show_image
 * @var $show_sku
 * @var $plain_text
 */

// get booking items
$booking_id = get_post_meta( $order->get_id(), '_hb_woo_order_id', true );
$room_items = hb_get_order_items( $booking_id );
$all_room_items = array();
foreach($room_items as $r_item){
	$all_room_items[] = $r_item;
	$sub_item = hb_get_order_items( $booking_id, 'sub_item', $r_item->order_item_id );
    if(!empty($sub_item)){
    	foreach($sub_item as $s_item){
        	$all_room_items[] = $s_item;
        }

    }
}
$text_align = is_rtl() ? 'right' : 'left';
$i = 0;
foreach ( $items as $item_id => $item ) {
	$product = $item->get_product();
	/**
	 * @var $product WC_Product
	 */
	if ( apply_filters( 'woocommerce_order_item_visible', true, $item ) ) { ?>
        <tr class="<?php echo esc_attr( apply_filters( 'woocommerce_order_item_class', 'order_item', $item, $order ) ); ?>">
            <td class="td"
                style="text-align:<?php echo $text_align; ?>; vertical-align:middle; border: 1px solid #eee; font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif; word-wrap:break-word;"><?php

				// Show title/image etc
				if ( $show_image ) {
					echo apply_filters( 'woocommerce_order_item_thumbnail', '<div style="margin-bottom: 5px"><img src="' . ( $product->get_image_id() ? current( wp_get_attachment_image_src( $product->get_image_id(), 'thumbnail' ) ) : wc_placeholder_img_src() ) . '" alt="' . esc_attr__( 'Product image', 'wp-hotel-booking-woocommerce' ) . '" height="' . esc_attr( $image_size[1] ) . '" width="' . esc_attr( $image_size[0] ) . '" style="vertical-align:middle; margin-' . ( is_rtl() ? 'left' : 'right' ) . ': 10px;" /></div>', $item );
				}

				// Product name
				echo apply_filters( 'woocommerce_order_item_name', $item->get_name(), $item, false );

				// SKU
				if ( $show_sku && is_object( $product ) && $product->get_sku() ) {
					echo ' (#' . $product->get_sku() . ')';
				}

				// allow other plugins to add additional product information here
				do_action( 'woocommerce_order_item_meta_start', $item_id, $item, $order, $plain_text );

				wc_display_item_meta( $item );

				// allow other plugins to add additional product information here
				do_action( 'woocommerce_order_item_meta_end', $item_id, $item, $order, $plain_text );
				?>
            </td>
			<?php if ( $all_room_items ) {
			    		if ( isset( $all_room_items[$i] ) ) {
                			$room = $all_room_items[$i]; ?>
                    <td class="td"
                        style="text-align:<?php echo $text_align; ?>; vertical-align:middle; border: 1px solid #eee; font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif;"><?php printf( '%s', date_i18n( hb_get_date_format(), hb_get_order_item_meta( $room->order_item_id, 'check_in_date', true ) ) ) ?></td>
                    <td class="td"
                        style="text-align:<?php echo $text_align; ?>; vertical-align:middle; border: 1px solid #eee; font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif;"><?php printf( '%s', date_i18n( hb_get_date_format(), hb_get_order_item_meta( $room->order_item_id, 'check_out_date', true ) ) ) ?></td>
					<?php
				} ?>
			<?php } ?>
            <td class="td"
                style="text-align:<?php echo $text_align; ?>; vertical-align:middle; border: 1px solid #eee; font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif;"><?php echo apply_filters( 'woocommerce_email_order_item_quantity', $item->get_quantity(), $item ); ?></td>
            <td class="td"
                style="text-align:<?php echo $text_align; ?>; vertical-align:middle; border: 1px solid #eee; font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif;"><?php echo $order->get_formatted_line_subtotal( $item ); ?></td>
        </tr>
		<?php
	}

	if ( $show_purchase_note && is_object( $product ) && ( $purchase_note = $product->get_purchase_note() ) ) { ?>
        <tr>
            <td colspan="3"
                style="text-align:<?php echo $text_align; ?>; vertical-align:middle; border: 1px solid #eee; font-family: 'Helvetica Neue', Helvetica, Roboto, Arial, sans-serif;"><?php echo wpautop( do_shortcode( wp_kses_post( $purchase_note ) ) ); ?></td>
        </tr>
	<?php } ?>

<?php $i++;
} ?>
