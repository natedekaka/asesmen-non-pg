<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$id = (int)($_GET['id'] ?? 0);
$conn = db();

$stmt = $conn->prepare("SELECT id FROM ujian WHERE id = ?");
$stmt->bind_param('i', $id);
$stmt->execute();
if (!$stmt->get_result()->fetch_assoc()) {
    flash_set('error', 'Ujian tidak ditemukan.');
    redirect('index.php');
}

$conn->prepare("DELETE FROM ujian WHERE id = ?")->execute([$id]);
flash_set('sukses', 'Ujian beserta semua sesi dan jawaban telah dihapus.');
redirect('index.php');