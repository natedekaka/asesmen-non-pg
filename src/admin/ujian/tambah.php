<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$error = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $judul = trim($_POST['judul'] ?? '');
    $mapel = trim($_POST['mata_pelajaran'] ?? '');
    $deskripsi = trim($_POST['deskripsi'] ?? '');
    $mulai = $_POST['tanggal_mulai'] ?: null;
    $selesai = $_POST['tanggal_selesai'] ?: null;
    $durasi = (int)($_POST['durasi_menit'] ?? 0);
    $status = $_POST['status'] ?? 'draft';
    $acak = isset($_POST['acak_soal']) ? 1 : 0;
    $tampil = isset($_POST['tampilkan_hasil']) ? 1 : 0;

    if ($judul === '' || $durasi < 1 || !in_array($status, ['draft', 'aktif', 'selesai'])) {
        $error = 'Data tidak lengkap atau tidak valid.';
    } else {
        $stmt = db()->prepare("INSERT INTO ujian (judul, mata_pelajaran, deskripsi, tanggal_mulai, tanggal_selesai, durasi_menit, status, acak_soal, tampilkan_hasil, created_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param('ssssssiiii', $judul, $mapel, $deskripsi, $mulai, $selesai, $durasi, $status, $acak, $tampil, $_SESSION['admin_id']);
        $stmt->execute();
        flash_set('sukses', 'Ujian berhasil dibuat. Silakan atur soal dan kelas peserta.');
        redirect('soal.php?id=' . db()->insert_id);
    }
}

$ujian = [];
$title = 'Buat Ujian';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Buat Ujian</h1>
  <a href="index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Kembali</a>
</div>

<?php if ($error): ?>
  <div class="mt-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700"><?= e($error) ?></div>
<?php endif; ?>

<form method="post">
  <?php require '_form.php'; ?>
  <div class="mt-4">
    <button type="submit" class="rounded-lg bg-indigo-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-indigo-700">Simpan & Lanjutkan</button>
  </div>
</form>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>