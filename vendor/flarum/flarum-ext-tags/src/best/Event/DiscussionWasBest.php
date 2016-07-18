<?php


namespace Flarum\Tags\best\Event;

use Flarum\Core\Discussion;
use Flarum\Core\User;

class DiscussionWasBest
{
    /**
     * @var Discussion
     */
    public $discussion;

    /**
     * @var User
     */
    public $user;

    /**
     * @param Discussion $discussion
     * @param User $user
     */
    public function __construct(Discussion $discussion, User $user)
    {
        $this->discussion = $discussion;
        $this->user = $user;
    }
}

