<?php

/*
 * This file is part of Flarum.
 *
 * (c) Toby Zerner <toby.zerner@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Flarum\Tags\best\Listener;

use Flarum\Core\Discussion;
use Flarum\Core\User;
use Flarum\Event\ConfigurePostTypes;

use Flarum\Tags\best\Event\DiscussionWasBest;
use Flarum\Tags\best\Event\DiscussionWasUnbest;
use Flarum\Tags\best\Post\DiscussionBestPost;

use Illuminate\Contracts\Events\Dispatcher;

class CreatePostWhenDiscussionsBest
{
    /**
     * @param Dispatcher $events
     */
    public function subscribe(Dispatcher $events)
    {
        $events->listen(ConfigurePostTypes::class, [$this, 'configurePostTypes']);
        $events->listen(DiscussionWasBest::class, [$this, 'whenDiscussionWasBest']);
        $events->listen(DiscussionWasUnbest::class, [$this, 'whenDiscussionWasUnbest']);
    }

    /**
     * @param ConfigurePostTypes $event
     */
    public function configurePostTypes(ConfigurePostTypes $event)
    {
        $event->add(DiscussionBestPost::class);
    }

    /**
     * @param DiscussionWasStickied $event
     */
    public function whenDiscussionWasStickied(DiscussionWasBest $event)
    {
        $this->stickyChanged($event->discussion, $event->user, true);
    }

    /**
     * @param DiscussionWasUnstickied $event
     */
    public function whenDiscussionWasUnstickied(DiscussionWasUnbest $event)
    {
        $this->stickyChanged($event->discussion, $event->user, false);
    }

    /**
     * @param Discussion $discussion
     * @param User $user
     * @param bool $isSticky
     */
    protected function stickyChanged(Discussion $discussion, User $user, $isSticky)
    {
        $post = DiscussionBestPost::reply(
            $discussion->id,
            $user->id,
            $isSticky
        );

        $discussion->mergePost($post);
    }
}
