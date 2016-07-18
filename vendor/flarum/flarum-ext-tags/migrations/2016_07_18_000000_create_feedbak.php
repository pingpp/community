<?php

use Flarum\Database\Migration;
use Illuminate\Database\Schema\Blueprint;

return Migration::createTable(
    'discussions_tags',
    function (Blueprint $table) {
        $table->integer('discussion_id')->unsigned();
        $table->integer('tag_id')->unsigned();
        $table->primary(['discussion_id', 'tag_id']);
    }
);