<?php

namespace Inavii\Instagram\RestApi\EndPoints\Media;

use Inavii\Instagram\PostTypes\Account\AccountPostType;
use Inavii\Instagram\Wp\ImportMediaBackgroundProcess;

class ImportMedia
{
    private $account;

    public function __construct()
    {
        $this->account = new AccountPostType();
    }

    public function import($accountId): void
    {
        $media = $this->account->getMedia((int)$accountId);

        if ($media) {
            $instagramImport = new ImportMediaBackgroundProcess();
            $instagramImport->registerEvents();
            $instagramImport->scheduleMediaDownload($media);
        }
    }
}