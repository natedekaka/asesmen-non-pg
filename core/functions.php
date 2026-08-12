<?php
require_once __DIR__ . '/Database.php';

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

function e($value) {
    return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8');
}

function redirect($url) {
    header('Location: ' . $url);
    exit;
}

function flash_set($key, $msg) {
    $_SESSION['flash'][$key] = $msg;
}

function flash_get($key) {
    if (isset($_SESSION['flash'][$key])) {
        $msg = $_SESSION['flash'][$key];
        unset($_SESSION['flash'][$key]);
        return $msg;
    }
    return null;
}

function require_admin() {
    if (!isset($_SESSION['admin_id'])) {
        redirect('/login.php?role=admin');
    }
}

function require_siswa() {
    if (!isset($_SESSION['siswa_id'])) {
        redirect('/login.php?role=siswa');
    }
}

function get_siswa_kelas($siswa_id) {
    $stmt = db()->prepare(
        "SELECT s.*, k.nama_kelas FROM siswa s LEFT JOIN kelas k ON k.id = s.kelas_id WHERE s.id = ?"
    );
    $stmt->bind_param('i', $siswa_id);
    $stmt->execute();
    return $stmt->get_result()->fetch_assoc();
}

function tipe_soal_label($tipe) {
    $map = ['essay' => 'Essay', 'isian' => 'Isian Singkat', 'menjodohkan' => 'Menjodohkan'];
    return $map[$tipe] ?? $tipe;
}

function tipe_soal_badge($tipe) {
    $warna = ['essay' => 'bg-blue-100 text-blue-800', 'isian' => 'bg-green-100 text-green-800', 'menjodohkan' => 'bg-purple-100 text-purple-800'];
    $c = $warna[$tipe] ?? 'bg-gray-100 text-gray-800';
    return '<span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ' . $c . '">' . e(tipe_soal_label($tipe)) . '</span>';
}

function json_response($data, $http_code = 200) {
    http_response_code($http_code);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data);
    exit;
}

function umumkan_alert($key) {
    $msg = flash_get($key);
    if ($msg === null) return '';
    if ($key === 'sukses') {
        return '<div class="mb-4 rounded-lg border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-800">' . e($msg) . '</div>';
    }
    return '<div class="mb-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-800">' . e($msg) . '</div>';
}