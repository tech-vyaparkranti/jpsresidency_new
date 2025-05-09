<?php

namespace Inavii\Instagram\Utils;

use DateTime;

class TimeChecker
{
    /**
     * Checks if the provided date is more than an hour old.
     *
     * @param string $date The date to check.
     * @return bool True if more than an hour old, false otherwise.
     */
    public static function isMoreThanAnHourOld(string $date): bool
    {
        $difference = self::calculateTimeDifference($date);

        if ($difference->days > 0 || ($difference->h >= 7 && $difference->i >= 3)) {
            return true;
        }

        return false;
    }

    /**
     * Gets a human-readable time since the last update.
     *
     * @param string $date The date of the last update.
     * @return string Time since the update in a human-readable format.
     */
    public static function getTimeSinceUpdate(string $date): string
    {
        $difference = self::calculateTimeDifference($date);

        if ($difference->days > 0) {
            return 'Last update was ' . $difference->days . ' days ago';
        } elseif ($difference->h > 0) {
            return 'Last update was ' . $difference->h . ' hours ago';
        } elseif ($difference->i > 0) {
            return 'Last update was ' . $difference->i . ' minutes ago';
        } elseif ($difference->s > 0) {
            return 'Last update was ' . $difference->s . ' seconds ago';
        }

        return 'Last update time unknown';
    }

    /**
     * Calculates the time difference between now and the provided date.
     *
     * @param string $date The date to compare with the current time.
     * @return \DateInterval The difference as a DateInterval object.
     */
    public static function calculateTimeDifference(string $date): \DateInterval
    {
        $providedDate = new DateTime($date);
        $now = new DateTime();

        return $now->diff($providedDate);
    }
}
