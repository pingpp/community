<?php

use Flarum\Database\Migration;
use Illuminate\Database\Schema\Blueprint;

return Migration::createTable(
    'feedback',
    function (Blueprint $table) {
        $table->increments('id');
        $table->integer('user_id')->unsigned();
        $table->string('user_name',40);
        $table->string('user_mail',40;
        $table->string('text',255);
        $table->dateTime('updated_at')->nullable();
        $table->dateTime('created_at')->nullable();
        $table->integer('status')->unsigned();
    }
);