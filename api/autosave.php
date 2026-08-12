<?php
require_once __DIR__ . '/../core/init.php';

if (!isset($_SESSION['siswa_id'])) {
    json_response(['ok' => false, 'error' => 'Sesi siswa tidak ada.'], 401);
}

$json = json_decode(file_get_contents('php://input'), true);
if (!is_array($json)) {
    json_response(['ok' => false, 'error' => 'JSON tidak valid.'], 400);
}

$id_sesi = (int)($json['sesi_id'] ?? 0);
$siswa_id = (int)$_SESSION['siswa_id'];

$conn = db();

$stmt = $conn->prepare("SELECT id, status, berakhir_pada, id_ujian FROM sesi_ujian WHERE id = ? AND id_siswa = ?");
$stmt->bind_param('ii', $id_sesi, $siswa_id);
$stmt->execute();
$sesi = $stmt->get_result()->fetch_assoc();

if (!$sesi) {
    json_response(['ok' => false, 'error' => 'Sesi ujian tidak ditemukan.'], 404);
}
if ($sesi['status'] !== 'berlangsung') {
    json_response(['ok' => false, 'error' => 'Ujian sudah dikumpulkan.'], 409);
}
if ($sesi['berakhir_pada'] && strtotime($sesi['berakhir_pada']) < time()) {
    json_response(['ok' => false, 'error' => 'Waktu ujian habis.', 'habis' => true], 409);
}

$jawaban = $json['jawaban'] ?? [];
if (!is_array($jawaban) || count($jawaban) === 0) {
    json_response(['ok' => true, 'status' => 'tidak_ada_perubahan']);
}

$stmt_us = $conn->prepare("SELECT id, id_soal FROM ujian_soal WHERE id_ujian = ? AND id = ?");
$stmt_jaw = $conn->prepare("INSERT INTO jawaban (id_sesi, id_ujian_soal, jawaban) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE jawaban = VALUES(jawaban)");

foreach ($jawaban as $id_us => $val) {
    $id_us = (int)$id_us;
    if ($id_us < 1) continue;
    $stmt_us->bind_param('ii', $sesi['id_ujian'], $id_us);
    $stmt_us->execute();
    $us = $stmt_us->get_result()->fetch_assoc();
    if (!$us) continue;

    $teks = null;
    if (is_array($val)) {
        $teks = json_encode($val, JSON_UNESCAPED_UNICODE);
    } else {
        $teks = (string)$val;
    }
    $stmt_jaw->bind_param('iis', $id_sesi, $id_us, $teks);
    $stmt_jaw->execute();
}

json_response(['ok' => true, 'status' => 'tersimpan']);