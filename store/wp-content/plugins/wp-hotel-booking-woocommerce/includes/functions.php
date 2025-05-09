<?php
/**
 * WP Hotel Booking Woocommerce Functions
 *
 * Define common functions for both front-end and back-end
 *
 * @author   ThimPress
 * @package  WP-Hotel-Booking/Woocommerce/Functions
 * @version  1.8
 */

// Prevent loading this file directly
use Automattic\WooCommerce\Utilities\FeaturesUtil;

defined( 'ABSPATH' ) || exit;

if ( ! function_exists( 'hb_wc_admin_view' ) ) {
	/**
	 * @param $name
	 * @param null $args
	 */
	function hb_wc_admin_view( $name, $args = null ) {
		require hb_wc_get_admin_view( $name, $args );
	}
}

if ( ! function_exists( 'hb_wc_get_admin_view' ) ) {
	/**
	 * @param $name
	 * @param null $args
	 *
	 * @return string
	 */
	function hb_wc_get_admin_view( $name, $args = null ) {
		if ( is_array( $args ) ) {
			extract( $args );
		}
		if ( ! preg_match( '!\.php$!', $name ) ) {
			$ext = '.php';
		} else {
			$ext = '';
		}

		return HB_WC_PLUGIN_PATH . "includes/admin/views/{$name}{$ext}";
	}
}

if ( ! function_exists( 'hb_wc_payment_gateway_enable' ) ) {
	/**
	 * @param $enable
	 * @param $gateway
	 *
	 * @return bool
	 */
	function hb_wc_payment_gateway_enable( $enable, $gateway ) {
		if ( $gateway instanceof WC_Payment_Gateway ) {
			$enable = true;
		}

		return $enable;
	}
}

if ( ! function_exists( 'hb_wc_payment_gateway_form' ) ) {
	/**
	 * Woocommerce payment gateway form.
	 */
	function hb_wc_payment_gateway_form() {
		$parts = explode( '_wc_', current_filter() );
		if ( ! empty( $parts[1] ) ) {
			if ( $wc_payment_gateways = WC()->payment_gateways()->get_available_payment_gateways() ) {
				foreach ( $wc_payment_gateways as $gateway ) {
					if ( $gateway->id == $parts[1] ) {
						echo esc_html( $gateway->description );

						return;
					}
				}
			}
		}
	}
}

if ( ! function_exists( 'hb_wc_payment_gateways' ) ) {
	/**
	 * @param $gateways
	 *
	 * @return mixed
	 */
	function hb_wc_payment_gateways( $gateways ) {
		$wc_payment_gateways = WC()->payment_gateways()->get_available_payment_gateways();
		if ( $wc_payment_gateways ) {
			foreach ( $wc_payment_gateways as $payment_gateway ) {
				$slug = "woo";
				//$checked = checked( WC()->session->get( 'chosen_payment_method') == $payment_gateway->id ? true : false, true, false );
				$gateways[ 'wc_' . $payment_gateway->id ] = $payment_gateway;

				$payment_gateway->slug = 'wc_' . $payment_gateway->id;
				add_filter( 'hb_payment_gateway_enable', 'hb_wc_payment_gateway_enable', 10, 2 );
				add_action( 'hb_payment_gateway_form_wc_' . $payment_gateway->id, 'hb_wc_payment_gateway_form' );
			}
		}

		return $gateways;
	}
}

add_action( 'before_woocommerce_init', function() {
	if ( class_exists( FeaturesUtil::class ) ) {
		FeaturesUtil::declare_compatibility( 'custom_order_tables', __FILE__, false );
	}
} );
