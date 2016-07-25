<?php

namespace Flarum\Search\Listener;

use Flarum\Event\ConfigureDiscussionGambits;
use Flarum\Event\ConfigureDiscussionSearch;
use Flarum\Event\DiscussionWillBeSaved;
use Flarum\Search\Gambit\ArticleGambit;

use Illuminate\Contracts\Events\Dispatcher;

class Article
{
    /**
     * @param Dispatcher $events
     */
    public function subscribe(Dispatcher $events)
    {
        $events->listen(ConfigureDiscussionGambits::class, [$this, 'addArticleGambit']);
        $events->listen(ConfigureDiscussionSearch::class, [$this, 'reorderSearch']);
        $events->listen(DiscussionWillBeSaved::class, [$this, 'whenDiscussionWillBeSaved']);
    }

    /**
     * @param ConfigureDiscussionGambits $event
     */
    public function addArticleGambit(ConfigureDiscussionGambits $event)
    {
        $event->gambits->add(ArticleGambit::class);
    }


    /**
     * @param ConfigureDiscussionSearch $event
     */
    public function reorderSearch(ConfigureDiscussionSearch $event)
    {
        if ($event->criteria->sort === null) {
            $search = $event->search;
            $query = $search->getQuery();

            foreach ($search->getActiveGambits() as $gambit) {
                if ($gambit instanceof ArticleGambit) {
                    return;
                }
            }
            //$query->where(array("is_article"=>false),"=");
        }
    }

    public function whenDiscussionWillBeSaved(DiscussionWillBeSaved $event)
    {
        // TODO: clean up, prevent discussion from being created without tags

        if (isset($event->data['relationships']['isArticle']['data'])) {
            $data =  $event->data['relationships']['isArticle']['data'];
            if ($data["id"]){
              $event->discussion->setAttribute("is_article",true);
            }

            /*$discussion->afterSave(function ($discussion) use ($newTagIds) {
                $discussion->tags()->sync($newTagIds);
            });*/
        }
    }

}