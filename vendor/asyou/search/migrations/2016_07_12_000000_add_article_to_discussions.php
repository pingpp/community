<?php

use Flarum\Database\Migration;

return Migration::addColumns('discussions', [
    'is_article' => ['boolean', 'default' => 0]
]);
