<?php

namespace Inavii\Instagram\Cron\ManualRequest;

use Inavii\Instagram\Cron\Accounts\AddNewMedia;
use Inavii\Instagram\Cron\Accounts\DeleteMedia;
use Inavii\Instagram\Cron\Feeds\UpdateFeedAddNewMedia;
use Inavii\Instagram\Cron\RequestMedia;
use Inavii\Instagram\PostTypes\Account\AccountPostType;
use Inavii\Instagram\Services\Instagram\InstagramOAuthException;
use Inavii\Instagram\Services\Instagram\MessageNotProvidedException;
use Inavii\Instagram\Utils\TimeChecker;
use Inavii\Instagram\Utils\TransformRemotenIstagramData;

class ManualRequestAccount
{
    use RequestMedia;

    private $account;
    private $accountPostType;

    public function __construct($accountID)
    {
        $this->accountPostType = new AccountPostType();
        $this->account = $this->accountPostType->get($accountID);
    }

    public function request(): void
    {
        if (!$this->requestShouldBeManually()) {
            return;
        }

        $remoteMedia = $this->requestMedia();

        if (empty($remoteMedia)) {
            return;
        }

        $this->processMedia($remoteMedia);
    }

    private function processMedia(array $remoteMedia): void
    {
        (new AddNewMedia($this->account, $remoteMedia))->addMedia();
        (new DeleteMedia($this->account, $remoteMedia))->delete();
        (new UpdateFeedAddNewMedia($this->account))->update();

        $this->accountPostType->instagramFeedsLastUpdate($this->account->wpAccountID(), 'Frontend Request');
        $this->accountPostType->setAccountIssues($this->account->wpAccountID(), '', true);
    }

    private function requestShouldBeManually(): bool
    {
        return TimeChecker::isMoreThanAnHourOld($this->account->lastUpdate());
    }

    private function requestMedia(): array
    {
        try {
            return TransformRemotenIstagramData::transform($this->remoteMedia($this->account));
        } catch (InstagramOAuthException|MessageNotProvidedException $e) {
            $this->accountPostType->setAccountIssues($this->account->wpAccountID(), $e->getType());
            return [];
        }
    }
}