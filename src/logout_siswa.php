<?php
require_once __DIR__ . '/core/init.php';

unset($_SESSION['siswa_id']);
unset($_SESSION['siswa_nama']);
unset($_SESSION['siswa_nis']);
unset($_SESSION['role']);

session_destroy();
redirect('/login_siswa.php');
