<?php
require_once __DIR__ . '/core/init.php';

unset($_SESSION['admin_id']);
unset($_SESSION['admin_nama']);
unset($_SESSION['role']);

session_destroy();
redirect('/login_admin.php');
