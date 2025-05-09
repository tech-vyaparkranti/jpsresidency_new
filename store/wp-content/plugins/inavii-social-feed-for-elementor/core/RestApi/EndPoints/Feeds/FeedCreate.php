<?php

namespace Inavii\Instagram\RestApi\EndPoints\Feeds;

use Inavii\Instagram\PostTypes\Account\AccountPostType;
use Inavii\Instagram\PostTypes\Feed\FeedPostType;
use Inavii\Instagram\Wp\ApiResponse;
use WP_REST_Request;
use WP_REST_Response;

class FeedCreate
{
    private $api;
    private $account;
    private $feed;

    public function __construct()
    {
        $this->api = new ApiResponse();
        $this->account = new AccountPostType();
        $this->feed = new FeedPostType();
    }

    /**
     * @param WP_REST_Request $request
     *
     * Takes the data in $request
     *
     * @accountID => Account ID from AccountPostType
     * @title     => Post title name
     *
     * @return WP_REST_Response
     */
    public function create(WP_REST_Request $request): WP_REST_Response
    {
        $data = $request->get_params();

        $title = $data['title'];
        $accountID = $data['accountID'];
        $settings = $data['settings'];
        $posts = $data['posts'] ?? null;

        if (empty($title)) {
            return $this->api->response([], false, 'Feed name is required');
        }

        if (empty($accountID)) {
            return $this->api->response([], false, 'Account ID is required');
        }

        if (empty($settings)) {
            return $this->api->response([], false, 'Settings are required');
        }

        $instagramMedia = $posts ?? $this->account->getMedia($accountID);

        $newPostsID = $this->feed->insert($title, $instagramMedia, $accountID);

        $this->feed->addRelatedAccount($newPostsID, $accountID);

        $this->feed->addOrUpdateSettings($newPostsID, $settings);

        return $this->api->response([$this->feed->post($newPostsID)]);
    }
}