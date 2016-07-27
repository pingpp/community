<?php return array (
  'debug' => false,
  'database' => array (
    'driver' => 'mysql',
    'host' => '{{ community_db }}:{{ community_db_port }}',
    'database' => '{{ community_db_name }}',
    'username' => '{{ community_db_user }}',
    'password' => '{{ community_db_passwd }}',
    'charset' => 'utf8mb4',
    'collation' => 'utf8mb4_unicode_ci',
    'prefix' => '',
    'strict' => false,
  ),
  'url' => '{{ community_url }}',
  'search_url' => '{{ community_search_url }}',
  'paths' => array (
    'api' => 'api',
    'admin' => 'admin',
  ),
);