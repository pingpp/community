<?php

use Flarum\Database\Migration;

return Migration::addColumns('posts', [
    'is_start' => ['boolean', 'default' => false]
]);