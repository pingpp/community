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

use Flarum\Core\Access\AssertPermissionTrait;
use Flarum\Event\PostWillBeSaved;
use Flarum\Core\Discussion;

use Flarum\Tags\best\Event\PostWasBest;
use Flarum\Tags\best\Event\PostWasUnbest;

use Illuminate\Contracts\Events\Dispatcher;

class SaveBestToDatabase
{
    use AssertPermissionTrait;

    /**
     * @param Dispatcher $events
     */
    public function subscribe(Dispatcher $events)
    {
        $events->listen(PostWillBeSaved::class, [$this, 'whenDiscussionWillBeSaved']);
    }

    /**
     * @param DiscussionWillBeSaved $event
     */
    public function whenDiscussionWillBeSaved(PostWillBeSaved $event)
    {
        if (isset($event->data['attributes']['Isbest'])&&isset($event->data['attributes']['DiscussionId'])) {
            $isbest = (bool) $event->data['attributes']['Isbest'];
            $DiscussionId = (int)$event->data['attributes']['DiscussionId'];
            $discussion = Discussion::find($DiscussionId);
            $actor = $event->actor;

            if ($actor->id!=$discussion->start_user_id){
                return;
            }

            $post = $event->post;

            if ($isbest){
                $discussion->best_id = $post->id;
            }else{
                $discussion->best_id = 0;
            }

            $discussion->save();
            $post->is_best = $isbest;

            if ($isbest) {
                $post->raise(new PostWasBest($post, $actor));
            } else {
                $post->raise(new PostWasUnbest($post, $actor));
            }
        }
    }
}
