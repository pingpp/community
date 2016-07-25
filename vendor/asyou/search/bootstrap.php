<?php

use Flarum\Search\Listener;
use Illuminate\Contracts\Events\Dispatcher;

return function (Dispatcher $events)
{
  $events->subscribe(Listener\Article::class);
};