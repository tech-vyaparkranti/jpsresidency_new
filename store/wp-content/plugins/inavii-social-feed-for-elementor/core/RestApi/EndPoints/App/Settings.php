<?php

namespace Inavii\Instagram\RestApi\EndPoints\App;

use  Inavii\Instagram\Media\Media ;
use  Inavii\Instagram\Utils\VersionChecker ;
use  Inavii\Instagram\Wp\ApiResponse ;
use  Inavii\Instagram\Wp\AppGlobalSettings ;
use  WP_REST_Request ;
use  WP_REST_Response ;
class Settings
{
    private  $api ;
    private  $appGlobalSettings ;
    public function __construct()
    {
        $this->api = new ApiResponse();
        $this->appGlobalSettings = new AppGlobalSettings();
    }
    
    public function settings() : WP_REST_Response
    {
        return $this->api->response( [
            'isPro'                 => VersionChecker::version()->can_use_premium_code(),
            'gdLibraryAvailability' => Media::checkGDLibraryAvailability(),
            'timeZone'              => wp_timezone_string(),
            'globalSettings'        => [
            'cronInterval'          => $this->appGlobalSettings->getCronInterval(),
            'availableSchedules'    => $this->appGlobalSettings->getAvailableSchedules() ?? [],
            'numberOfPostsToImport' => $this->appGlobalSettings->getNumberOfPostsImported(),
            'emailNotifications'    => $this->appGlobalSettings->getEmailNotifications(),
            'email'                 => $this->appGlobalSettings->getEmail(),
        ],
        ] );
    }
    
    public function updateGlobalSettings( WP_REST_Request $request ) : WP_REST_Response
    {
        $data = $request->get_params();
        $cronInterval = filter_var( $data['cronInterval'], FILTER_SANITIZE_STRING, [
            'options' => [
            'default' => 'once-hourly',
        ],
        ] );
        $numberOfPostsToImport = filter_var( $data['numberOfPostsToImport'], FILTER_VALIDATE_INT, [
            'options' => [
            'default'   => 50,
            'min_range' => 1,
        ],
        ] );
        $emailNotifications = filter_var( $data['emailNotifications'], FILTER_VALIDATE_BOOLEAN );
        $email = sanitize_email( $data['email'] ) ?? '';
        $this->updateScheduledMediaUpdateTask( $cronInterval );
        $this->appGlobalSettings->saveCronInterval( $cronInterval );
        $this->appGlobalSettings->saveNumberOfPostsImported( $numberOfPostsToImport );
        $this->appGlobalSettings->saveEmailNotifications( $emailNotifications );
        return $this->api->response( [
            'message' => 'Settings updated successfully',
        ] );
    }
    
    private function updateScheduledMediaUpdateTask( $cronInterval )
    {
        $timestamp = wp_next_scheduled( AppGlobalSettings::CRON_SCHEDULE_UPDATE_MEDIA_TASK );
        if ( $timestamp ) {
            wp_unschedule_event( $timestamp, AppGlobalSettings::CRON_SCHEDULE_UPDATE_MEDIA_TASK );
        }
        if ( !wp_next_scheduled( AppGlobalSettings::CRON_SCHEDULE_UPDATE_MEDIA_TASK ) ) {
            wp_schedule_event( time(), $cronInterval, AppGlobalSettings::CRON_SCHEDULE_UPDATE_MEDIA_TASK );
        }
    }

}