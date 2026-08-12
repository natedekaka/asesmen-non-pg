<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$id_ujian = (int)($_GET['ujian'] ?? 0);
$conn = db();

$stmt = $conn->prepare("SELECT * FROM ujian WHERE id = ?");
$stmt->bind_param('i', $id_ujian);
$stmt->execute();
$ujian = $stmt->get_result()->fetch_assoc();
if (!$ujian) {
    flash_set('error', 'Ujian tidak ditemukan.');
    redirect('index.php');
}

$stmt = $conn->prepare("
    SELECT s.*, s.id AS id_sesi, s.status AS status_sesi, sis.nis, sis.nama_lengkap, k.nama_kelas
    FROM sesi_ujian s
    JOIN siswa sis ON sis.id = s.id_siswa
    LEFT JOIN kelas k ON k.id = sis.kelas_id
    WHERE s.id_ujian = ?
    ORDER BY k.nama_kelas, sis.nis
");
$stmt->bind_param('i', $id_ujian);
$stmt->execute();
$sesi_list = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

$title = 'Koreksi: ' . $ujian['judul'];
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Koreksi: <?= e($ujian['judul']) ?></h1>
  <a href="index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Kembali</a>
</div>
<p class="mt-1 text-sm text-slate-500">Sesi "menunggu koreksi" memiliki soal essay yang belum dinilai.</p>

<div class="mt-5 overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">NIS</th>
        <th class="px-4 py-3 font-medium">Nama</th>
        <th class="px-4 py-3 font-medium">Kelas</th>
        <th class="px-4 py-3 font-medium">Status</th>
        <th class="px-4 py-3 font-medium text-right">Skor</th>
        <th class="px-4 py-3 font-medium text-center">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (!$sesi_list): ?>
        <tr><td colspan="6" class="px-4 py-8 text-center text-slate-400">Belum ada siswa yang mengerjakan ujian ini.</td></tr>
      <?php endif; ?>
      <?php foreach ($sesi_list as $s): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3 font-mono text-slate-700"><?= e($s['nis']) ?></td>
          <td class="px-4 py-3 font-medium text-slate-800"><?= e($s['nama_lengkap']) ?></td>
          <td class="px-4 py-3 text-slate-600"><?= e($s['nama_kelas'] ?? '-') ?></td>
          <td class="px-4 py-3">
            <?php if ($s['status_sesi'] === 'dinilai'): ?>
              <span class="inline-flex rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">Dinilai</span>
            <?php elseif ($s['status_sesi'] === 'submitted'): ?>
              <span class="inline-flex rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">Menunggu koreksi</span>
            <?php elseif ($s['status_sesi'] === 'berlangsung'): ?>
              <span class="inline-flex rounded-full bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-800">Sedang berlangsung</span>
            <?php endif; ?>
          </td>
          <td class="px-4 py-3 text-right font-semibold text-slate-700">
            <?= $s['status_sesi'] === 'dinilai' ? (int)$s['total_skor'] : '-' ?>
          </td>
          <td class="px-4 py-3 text-center">
            <?php if (in_array($s['status_sesi'], ['submitted', 'dinilai'])): ?>
              <a href="koreksi_sesi.php?sesi=<?= (int)$s['id_sesi'] ?>" class="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-indigo-700">
                <?= $s['status_sesi'] === 'dinilai' ? 'Lihat / Edit' : 'Koreksi' ?>
              </a>
            <?php else: ?>
              <span class="text-xs text-slate-300">—</span>
            <?php endif; ?>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>