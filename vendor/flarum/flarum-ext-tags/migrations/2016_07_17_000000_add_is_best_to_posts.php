<?php

use Flarum\Database\Migration;

return Migration::addColumns('posts', [
    'is_best' => ['boolean', 'default' => false]
]);