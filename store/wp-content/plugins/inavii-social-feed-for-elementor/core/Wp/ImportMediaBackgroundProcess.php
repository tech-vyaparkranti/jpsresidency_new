<?php

namespace Inavii\Instagram\Wp;

use Inavii\Instagram\RestApi\EndPoints\Media\GenerateThumbnailsProcessor;
use Inavii\Instagram\RestApi\EndPoints\Media\ImporterMediaProcessor;

class ImportMediaBackgroundProcess
{
    public function __construct()
    {
        add_action('inavii_instagram_import_hook', [$this, 'fetchInstagramMedia']);
    }

    public function registerEvents()
    {
        if (!wp_next_scheduled('inavii_instagram_import_hook')) {
            wp_schedule_single_event(time(), 'inavii_instagram_import_hook');
        }
    }

    public function scheduleMediaDownload($media)
    {
        update_option('inavii_instagram_media_to_download', $media);
    }

    public function fetchInstagramMedia()
    {
        $media = get_option('inavii_instagram_media_to_download', []);

        (new ImporterMediaProcessor())->task($media);
        (new GenerateThumbnailsProcessor())->task($media);

        delete_option('inavii_instagram_media_to_download');

        wp_clear_scheduled_hook('inavii_instagram_import_hook');
    }
}
