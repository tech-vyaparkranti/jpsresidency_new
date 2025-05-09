<?php

namespace Inavii\Instagram\Cron;

use Inavii\Instagram\PostTypes\Account\Account;
use Inavii\Instagram\PostTypes\Account\AccountPostType;
use Inavii\Instagram\Services\Instagram\InstagramOAuthException;
use Inavii\Instagram\Services\Instagram\MessageNotProvidedException;
use Inavii\Instagram\Services\Instagram\Post\BusinessPosts;
use Inavii\Instagram\Services\Instagram\Post\PrivatePosts;

trait RequestMedia
{
    /**
     * @throws InstagramOAuthException
     * @throws MessageNotProvidedException
     */
    private function remoteMedia(Account $account): array
    {
        if ($account->accountType() === AccountPostType::BUSINESS) {
            $instagramFetch = new BusinessPosts($account->igAccountID());
        } else {
            $instagramFetch = new PrivatePosts();
        }

        return $instagramFetch->posts($account->accessToken());
    }
}