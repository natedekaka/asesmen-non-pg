<?php
$host = getenv('DB_HOST') ?: 'db';
$user = getenv('DB_USER') ?: 'root';
$password = getenv('DB_PASS') ?: 'rootpass';
$database = getenv('DB_NAME') ?: 'asesmen_non_pg';

define('DB_HOST', $host);
define('DB_USER', $user);
define('DB_PASS', $password);
define('DB_NAME', $database);
define('BASE_URL', '/');