<?php

use Flarum\Database\Migration;

return Migration::addColumns('posts', [
    'best_id' => ['integer', 'default' => 0]
]);