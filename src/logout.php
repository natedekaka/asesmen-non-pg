<?php
require_once __DIR__ . '/core/init.php';

$role = $_SESSION['role'] ?? '';
session_unset();
session_destroy();

if ($role === 'admin') {
    redirect('/login_admin.php');
} else {
    redirect('/login_siswa.php');
}