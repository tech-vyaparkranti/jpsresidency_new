<?php

namespace Inavii\Instagram\Cron;

use  Inavii\Instagram\Cron\Feeds\UpdateFeedAddNewMedia ;
use  Inavii\Instagram\Media\CleanUpMedia ;
use  Inavii\Instagram\PostTypes\Account\Account ;
use  Inavii\Instagram\PostTypes\Account\AccountPostType ;
use  Inavii\Instagram\Cron\Accounts\AddNewMedia ;
use  Inavii\Instagram\Cron\Accounts\DeleteMedia ;
use  Inavii\Instagram\Services\Instagram\InstagramOAuthException ;
use  Inavii\Instagram\Services\Instagram\MessageNotProvidedException ;
use  Inavii\Instagram\SystemStatus\EmailNotification ;
use  Inavii\Instagram\SystemStatus\TokenIssues ;
use  Inavii\Instagram\Utils\TransformRemotenIstagramData ;
use  Inavii\Instagram\Utils\VersionChecker ;
class Schedule
{
    private  $accountPostType ;
    use  RequestMedia ;
    public function __construct()
    {
        add_action( 'inavii_social_feed_update_media', [ $this, 'updateMedia' ] );
        add_action( 'inavii_social_feed_refresh_token', [ $this, 'refreshAccessToken' ] );
        $this->accountPostType = new AccountPostType();
    }
    
    public function updateMedia() : void
    {
        //TODO remove this in next release
        ( new CleanUpMedia() )->cleanUp();
        foreach ( $this->accountPostType->posts() as $account ) {
            $accountObj = new Account( $account );
            try {
                $remoteMedia = TransformRemotenIstagramData::transform( $this->remoteMedia( $accountObj ) );
                ( new DeleteMedia( $accountObj, $remoteMedia ) )->delete();
                ( new AddNewMedia( $accountObj, $remoteMedia ) )->addMedia();
                ( new UpdateFeedAddNewMedia( $accountObj ) )->update();
                $this->accountPostType->instagramFeedsLastUpdate( $accountObj->wpAccountID() );
                $this->accountPostType->setAccountIssues( $accountObj->wpAccountID(), '', true );
            } catch ( InstagramOAuthException $e ) {
                $this->accountPostType->setAccountIssues( $accountObj->wpAccountID(), $e->getType() );
            } catch ( MessageNotProvidedException $e ) {
            }
        }
    }
    
    public function updateSingleAccount( $accountID )
    {
        //TODO remove this in next release
        ( new CleanUpMedia() )->cleanUp();
        $account = $this->accountPostType->get( $accountID );
        try {
            $remoteMedia = TransformRemotenIstagramData::transform( $this->remoteMedia( $account ) );
            ( new DeleteMedia( $account, $remoteMedia ) )->delete();
            ( new AddNewMedia( $account, $remoteMedia ) )->addMedia();
            ( new UpdateFeedAddNewMedia( $account ) )->update();
            $this->accountPostType->instagramFeedsLastUpdate( $accountID );
            $this->accountPostType->setAccountIssues( $accountID, '', true );
        } catch ( InstagramOAuthException $e ) {
            $this->accountPostType->setAccountIssues( $accountID, $e->getType() );
        } catch ( MessageNotProvidedException $e ) {
        }
        return $account->wpAccountID();
    }
    
    /**
     * @throws InstagramOAuthException
     * @throws MessageNotProvidedException
     */
    public function refreshAccessToken() : void
    {
        foreach ( $this->accountPostType->posts() as $account ) {
            ( new RefreshAccessToken( new Account( $account ) ) )->refresh();
        }
    }

}