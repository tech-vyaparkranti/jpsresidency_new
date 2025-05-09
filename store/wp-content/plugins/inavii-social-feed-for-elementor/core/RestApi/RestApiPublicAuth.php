<?php

namespace Inavii\Instagram\RestApi;

use WP_REST_Request;

class RestApiPublicAuth
{
    public static function isAuthorized(WP_REST_Request $request): bool
    {
        $authToken = filter_var($request->get_header('Inavii-SF-Auth-Token'), FILTER_SANITIZE_STRING);

        return $authToken === get_option('inavii_social_feed_public_auth_token');
    }
}