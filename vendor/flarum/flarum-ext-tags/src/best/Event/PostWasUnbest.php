<?php

namespace Flarum\Tags\best\Event;

use Flarum\Core\Post;
use Flarum\Core\User;

class PostWasUnbest
{
    /**
     * @var Discussion
     */
    public $post;

    /**
     * @var User
     */
    public $user;

    /**
     * @param Discussion $discussion
     * @param User $user
     */
    public function __construct(Post $post, User $user)
    {
        $this->post = $post;
        $this->user = $user;
    }
}

