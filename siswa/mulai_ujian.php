<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$id_ujian = (int)($_GET['ujian'] ?? 0);
$siswa_id = (int)$_SESSION['siswa_id'];
$conn = db();

$stmt = $conn->prepare("SELECT kelas_id, nis FROM siswa WHERE id = ?");
$stmt->bind_param('i', $siswa_id);
$stmt->execute();
$data_siswa = $stmt->get_result()->fetch_assoc();
$kelas_id = (int)($data_siswa['kelas_id'] ?? 0);

// Validasi ujian aktif & kelas peserta
$stmt = $conn->prepare("
    SELECT u.* FROM ujian u
    JOIN ujian_kelas uk ON uk.id_ujian = u.id
    WHERE u.id = ? AND u.status = 'aktif' AND uk.id_kelas = ? LIMIT 1
");
$stmt->bind_param('ii', $id_ujian, $kelas_id);
$stmt->execute();
$ujian = $stmt->get_result()->fetch_assoc();

if (!$ujian) {
    flash_set('error', 'Ujian tidak ditemukan atau belum aktif untuk kelas Anda.');
    redirect('index.php');
}

if ($ujian['tanggal_mulai'] && strtotime($ujian['tanggal_mulai']) > time()) {
    flash_set('error', 'Ujian belum dimulai.');
    redirect('index.php');
}

// Cek sesi yang sudah ada
$stmt = $conn->prepare("SELECT id, status, berakhir_pada FROM sesi_ujian WHERE id_ujian = ? AND id_siswa = ?");
$stmt->bind_param('ii', $id_ujian, $siswa_id);
$stmt->execute();
$sesi = $stmt->get_result()->fetch_assoc();

if ($sesi && in_array($sesi['status'], ['submitted', 'dinilai'])) {
    flash_set('error', 'Anda sudah mengumpulkan ujian ini.');
    redirect('index.php');
}

if (!$sesi) {
    $durasi_menit = (int)$ujian['durasi_menit'];
    $berakhir = date('Y-m-d H:i:s', time() + $durasi_menit * 60);
    // Batasi agar tidak melebihi tanggal_selesai
    if ($ujian['tanggal_selesai'] && strtotime($ujian['tanggal_selesai']) < strtotime($berakhir)) {
        $berakhir = $ujian['tanggal_selesai'];
    }
    $stmt = $conn->prepare("INSERT INTO sesi_ujian (id_ujian, id_siswa, mulai_pada, berakhir_pada, status, ip_address) VALUES (?, ?, NOW(), ?, 'berlangsung', ?)");
    $ip = $_SERVER['REMOTE_ADDR'] ?? null;
    $stmt->bind_param('iiss', $id_ujian, $siswa_id, $berakhir, $ip);
    $stmt->execute();
    $id_sesi = $conn->insert_id;
} else {
    $id_sesi = (int)$sesi['id'];
}

redirect('ujian.php?sesi=' . $id_sesi);