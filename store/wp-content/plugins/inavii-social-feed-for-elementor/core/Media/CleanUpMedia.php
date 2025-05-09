<?php

namespace Inavii\Instagram\Media;

use Inavii\Instagram\PostTypes\Account\Account;
use Inavii\Instagram\PostTypes\Account\AccountPostType;

//TODO this class should be removed in the next release
class CleanUpMedia
{
    private $excludeFiles = [];

    public function __construct()
    {
        $this->excludeFiles = $this->getAvatars();
    }

    public function cleanUp(): void
    {
        if (get_option('inavii_social_feed_e_cleanup_media') === false) {
            $this->removeMedia($this->getSmallMedia());
            $this->removeMedia($this->getFullMedia());
        }
        update_option('inavii_social_feed_e_cleanup_media', true);
    }

    private function getAllMedia()
    {
        $files = scandir(Media::baseDir());

        return array_diff($files, ['.', '..']);
    }

    private function getAvatars(): array
    {
        $accounts = (new AccountPostType());
        $avatarsUrl = [];

        foreach ($accounts->posts() as $account) {
            $account = new Account($account);
            $avatarsUrl[] = $account->avatar();
        }

        return $this->extractFileNamesFromUrls($avatarsUrl);
    }

    private function extractFileNamesFromUrls($urls): array
    {
        return array_map(function ($url) {
            $path = parse_url($url, PHP_URL_PATH);
            return basename($path);
        }, $urls);
    }

    private function removeMedia($media): void
    {
        foreach ($media as $element) {
            $path = Media::baseDir() . DIRECTORY_SEPARATOR . $element;
            if (file_exists($path)) {
                unlink($path);
            }
        }
    }

    private function getFullMedia(): array
    {
        if (Media::checkGDLibraryAvailability() === false) {
            return [];
        }

        return array_filter($this->getAllMedia(), function ($element) {
            return preg_match('/^[^-]*\.jpg$/', $element);
        });
    }

    private function getSmallMedia(): array
    {
        return array_filter($this->getAllMedia(), function ($element) {
            return !in_array($element, $this->excludeFiles) && preg_match('/-s\.jpg$/', $element);
        });
    }
}
