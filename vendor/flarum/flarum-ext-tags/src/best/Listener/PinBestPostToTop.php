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

use Flarum\Event\ConfigurePostsQuery;
use Flarum\Event\ScopePostVisibility;
use Illuminate\Contracts\Events\Dispatcher;

class PinStickiedDiscussionsToTop
{
    /**
     * @param Dispatcher $events
     */
    public function subscribe(Dispatcher $events)
    {
        $events->listen(ConfigurePostsQuery::class, [$this, 'reorderSearch']);
        $events->listen(ScopePostVisibility::class, [$this, 'reorderSearch2']);
    }

    /**
     * @param ConfigureDiscussionGambits $event

    public function addStickyGambit(ConfigureDiscussionGambits $event)
    {
        $event->gambits->add(StickyGambit::class);
    }*/

    /**
     * @param ConfigureDiscussionSearch $event
     */
    public function reorderSearch(ConfigurePostsQuery $event)
    {
        if ($event->criteria->sort === null) {
            $search = $event->search;
            $query = $search->getQuery();

            if (! is_array($query->orders)) {
                $query->orders = [];
            }

            array_unshift($query->orders, ['column' => 'is_best', 'direction' => 'desc']);
        }
    }

    public function reorderSearch2(ScopePostVisibility $event)
    {
        if ($event->criteria->sort === null) {
            $search = $event->search;
            $query = $search->getQuery();

            if (! is_array($query->orders)) {
                $query->orders = [];
            }

            array_unshift($query->orders, ['column' => 'is_best', 'direction' => 'desc']);
        }
    }
}
