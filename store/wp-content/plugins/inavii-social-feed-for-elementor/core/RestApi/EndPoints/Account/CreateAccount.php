<?php

namespace Inavii\Instagram\RestApi\EndPoints\Account;

use Inavii\Instagram\PostTypes\Account\AccountPostType;
use Inavii\Instagram\RestApi\EndPoints\Media\ImportMedia;
use Inavii\Instagram\Services\Instagram\Account\AccountCreate;
use Inavii\Instagram\Services\Instagram\Account\InstagramAccount;
use Inavii\Instagram\Services\Instagram\InstagramOAuthException;
use Inavii\Instagram\Services\Instagram\MediaRequest;
use Inavii\Instagram\Services\Instagram\MessageNotProvidedException;

class CreateAccount
{
    private $account;

    private $accountType;

    private $import;

    public function __construct(string $accountType)
    {
        $this->account = new AccountPostType();
        $this->import = new ImportMedia();
        $this->accountType = $accountType;
    }

    /**
     * @throws InstagramOAuthException
     * @throws MessageNotProvidedException
     */
    public function create(InstagramAccount $accountData): array
    {
        $newAccountId = (new AccountCreate($accountData))->create();

        $media = (new MediaRequest($this->account->get($newAccountId), $this->accountType))->request();

        $this->account->addMedia($newAccountId, $media);

        $this->import->import($newAccountId);

        $this->account->instagramFeedsLastUpdate($newAccountId);
        $this->account->setAccountIssues($newAccountId, '', true);

        return [
            'media' => $media,
            'wpAccountID' => $newAccountId,
            'name' => $accountData->userName() ?? $accountData->name(),
        ];
    }
}