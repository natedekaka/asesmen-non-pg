<?php
require_once __DIR__ . '/core/init.php';

session_unset();
session_destroy();
redirect('/login.php');