<?php

namespace Inavii\Instagram\RestApi\EndPoints\Front;

use Inavii\Instagram\Cron\ManualRequest\ManualRequestAccount;
use Inavii\Instagram\PostTypes\Account\AccountPostType;
use Inavii\Instagram\PostTypes\Feed\FeedPostType;
use Inavii\Instagram\Utils\TimeChecker;
use Inavii\Instagram\Wp\ApiResponse;
use Timber\Timber;
use WP_REST_Request;
use WP_REST_Response;

class FrontFeed
{
    private $api;
    private $feed;
    private $account;
    private $feedId;

    public function __construct()
    {
        $this->api = new ApiResponse();
        $this->feed = new FeedPostType();
        $this->account = new AccountPostType();
    }

    public function get(WP_REST_Request $request): WP_REST_Response
    {
        $widgetData = $request->get_param('settings');

        if (empty($widgetData)) {
            return $this->apiResponse(false, 'No widget data');
        }

        $feedId = $this->sanitizeInt($widgetData['feed_id'] ?? '');
        $postCount = $this->sanitizeInt($widgetData['posts_count'] ?? '');
        $this->feedId = $feedId;

        $posts = $this->feed->get($feedId, true, $postCount);

        if (empty($posts)) {
            return $this->noPostsResponse();
        }

        $this->frontEndRequest($feedId);

        return $this->postsResponse($widgetData, $posts);
    }

    private function noPostsResponse(): WP_REST_Response
    {
        $html = Timber::compile('view/no-posts.twig', ['message' => '<span>No posts</span> to display']);
        return $this->apiResponse(true, '', $html);
    }

    private function postsResponse(array $widgetData, array $posts): WP_REST_Response
    {
        $html = Timber::compile('view/index-dynamic.twig', array_merge($widgetData, ['items' => $posts]));
        return $this->apiResponse(true, '', $html);
    }

    private function sanitizeInt($value): int
    {
        return (int)filter_var($value, FILTER_SANITIZE_STRING);
    }

    /**
     * this function should be called only when CRON is disabled or CRON is not working
     */
    private function frontEndRequest(int $feedId): void
    {
        $account = $this->account->getAccountRelatedWithFeed($feedId);
        (new ManualRequestAccount($account->wpAccountID()))->request();
    }

    private function getStatusInfo(): array
    {
        $account = $this->account->getAccountRelatedWithFeed($this->feedId);

        return [
            'lastUpdate' => TimeChecker::getTimeSinceUpdate($account->lastUpdate()),
            'methodLastUpdate' => $account->methodLastUpdate(),
        ];
    }

    private function apiResponse(bool $success, string $message, $data = []): WP_REST_Response
    {
        return $this->api->response([
            'success' => $success,
            'message' => $message,
            'data' => $data,
            'statusInfo' => $this->getStatusInfo(),
        ]);
    }
}