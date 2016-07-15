<?php

use Flarum\Database\Migration;

return Migration::addColumns('tags', [
    'is_article' => ['boolean', 'default' => 0]
]);
