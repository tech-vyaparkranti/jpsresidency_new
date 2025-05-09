<?php
define( 'WPCACHEHOME', '/home/u200826204/domains/jpsresidency.in/public_html/wp-content/plugins/wp-super-cache/' );

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'u200826204_hguCN' );

/** Database username */
define( 'DB_USER', 'u200826204_YxTVu' );

/** Database password */
define( 'DB_PASSWORD', '4EwQuAdknF' );

/** Database hostname */
define( 'DB_HOST', '127.0.0.1' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          '2rpUsp+Ej+i6]=u7HK5Fv&_UTZw;w)y9BRL~UF Z2Ksg4/$cHc?wff[,m%Sf~]bS' );
define( 'SECURE_AUTH_KEY',   '}grv~)c&YMKx1%gQX-i2(1v&g4=My]_$IUujnu9U<5?bYbN-Z*[|hLv)O`GwTuGs' );
define( 'LOGGED_IN_KEY',     'AGXr4|3e<y3.Ur4 2?e5FVEUo]TPTkjZ};^tJX9H5LgI.sW[oyo2x`XS p6YyDT!' );
define( 'NONCE_KEY',         '5:HU!&}IWpIsYJ@EJm_3TSL7[y<[XtR_R>#5C0k8uq7dt2H=,odHN9h3wz)E;gK/' );
define( 'AUTH_SALT',         'dV %i{$K=7>;p{,M.Tdt>}UW;9!w51_V4,;,v%x}m]kQmB,sS1eT9BMak$0h?l5F' );
define( 'SECURE_AUTH_SALT',  '|wLt9r2WFnw)&GfO=A##)y{IA+Z&#z*H!c*[YiuGXgw,h!8/+AA:?74x$BUXGN_S' );
define( 'LOGGED_IN_SALT',    '#RkL)+f*+}LE->I;O{gjPL? ]S(s#;*6BVG^qG5}i^N.Vuz;$XtZy-CS4F=>=Jk$' );
define( 'NONCE_SALT',        '-31w3_-qsn[vz/)Z]nwGby0O]>:K%)s}S0r[0b=m&Q15.a:.kvS0Y_ncEg|8VUDX' );
define( 'WP_CACHE_KEY_SALT', 'Dpl#EL_dbM#xH:~m:G9p5&EY8MY{ynGc%6!dhG%XQ~|-R`>+nf?]>I(s^rg-;b&&' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );


/* Add any custom values between this line and the "stop editing" line. */



define( 'FS_METHOD', 'direct' );
define( 'WP_AUTO_UPDATE_CORE', 'minor' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
