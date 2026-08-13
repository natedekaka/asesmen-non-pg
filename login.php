<?php
require_once __DIR__ . '/core/init.php';

if (isset($_SESSION['admin_id'])) {
    redirect('/admin/index.php');
}
if (isset($_SESSION['siswa_id'])) {
    redirect('/siswa/index.php');
}

$role = $_GET['role'] ?? '';
if ($role === 'admin') {
    redirect('/login_admin.php');
} elseif ($role === 'siswa') {
    redirect('/login_siswa.php');
}

redirect('/login_siswa.php');
