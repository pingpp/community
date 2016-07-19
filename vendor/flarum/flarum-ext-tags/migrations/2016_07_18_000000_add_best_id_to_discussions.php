<?php

use Flarum\Database\Migration;

return Migration::addColumns('discussions', [
    'best_id' => ['integer', 'default' => 0]
]);