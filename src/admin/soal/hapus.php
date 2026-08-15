<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$id = (int)($_GET['id'] ?? 0);
$conn = db();

$stmt = $conn->prepare("SELECT id, tipe, pertanyaan FROM bank_soal WHERE id = ?");
$stmt->bind_param('i', $id);
$stmt->execute();
$soal = $stmt->get_result()->fetch_assoc();
if (!$soal) {
    flash_set('error', 'Soal tidak ditemukan.');
    redirect('index.php');
}

$stmt2 = $conn->prepare("DELETE FROM bank_soal WHERE id = ?");
$stmt2->bind_param('i', $id);
$stmt2->execute();

flash_set('sukses', 'Soal berhasil dihapus dari bank soal.');
redirect('index.php');