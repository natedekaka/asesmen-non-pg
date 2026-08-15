<?php
require_once __DIR__ . '/core/init.php';

if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin') {
    redirect('/admin/index.php');
}
if (isset($_SESSION['role']) && $_SESSION['role'] === 'siswa') {
    redirect('/siswa/index.php');
}
redirect('/login.php');