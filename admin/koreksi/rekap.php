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
    SELECT sis.nis, sis.nama_lengkap, k.nama_kelas,
           s.status AS status_sesi, s.total_skor, s.total_poin_auto, s.total_poin_manual, s.submitted_at
    FROM siswa sis
    LEFT JOIN kelas k ON k.id = sis.kelas_id
    LEFT JOIN sesi_ujian s ON s.id_siswa = sis.id AND s.id_ujian = ?
    LEFT JOIN ujian_kelas uk ON uk.id_ujian = ? AND uk.id_kelas = k.id
    WHERE uk.id_kelas IS NOT NULL
    ORDER BY k.nama_kelas, sis.nis
");
$stmt->bind_param('ii', $id_ujian, $id_ujian);
$stmt->execute();
$daftar = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

$title = 'Rekap Nilai';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Rekap Nilai: <?= e($ujian['judul']) ?></h1>
  <div class="flex gap-2">
    <a href="nilai.php?ujian=<?= (int)$id_ujian ?>" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">Koreksi</a>
    <a href="rekap_cetak.php?ujian=<?= (int)$id_ujian ?>" class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700">Cetak / PDF</a>
  </div>
</div>

<div class="mt-5 overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">No</th>
        <th class="px-4 py-3 font-medium">NIS</th>
        <th class="px-4 py-3 font-medium">Nama</th>
        <th class="px-4 py-3 font-medium">Kelas</th>
        <th class="px-4 py-3 font-medium">Status</th>
        <th class="px-4 py-3 font-medium text-right">Auto</th>
        <th class="px-4 py-3 font-medium text-right">Manual</th>
        <th class="px-4 py-3 font-medium text-right">Total</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (!$daftar): ?>
        <tr><td colspan="8" class="px-4 py-8 text-center text-slate-400">Tidak ada kelas peserta atau belum ada data.</td></tr>
      <?php endif; ?>
      <?php foreach ($daftar as $i => $d): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3 text-slate-400"><?= $i + 1 ?></td>
          <td class="px-4 py-3 font-mono text-slate-700"><?= e($d['nis']) ?></td>
          <td class="px-4 py-3 font-medium text-slate-800"><?= e($d['nama_lengkap']) ?></td>
          <td class="px-4 py-3 text-slate-600"><?= e($d['nama_kelas'] ?? '-') ?></td>
          <td class="px-4 py-3">
            <?php if ($d['status_sesi'] === 'dinilai'): ?>
              <span class="inline-flex rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">Dinilai</span>
            <?php elseif ($d['status_sesi'] === 'submitted'): ?>
              <span class="inline-flex rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">Menunggu</span>
            <?php elseif ($d['status_sesi'] === 'berlangsung'): ?>
              <span class="inline-flex rounded-full bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-800">Berlangsung</span>
            <?php else: ?>
              <span class="inline-flex rounded-full bg-slate-100 px-2 py-0.5 text-xs font-medium text-slate-500">Belum</span>
            <?php endif; ?>
          </td>
          <td class="px-4 py-3 text-right text-slate-600"><?= $d['status_sesi'] ? (int)$d['total_poin_auto'] : '-' ?></td>
          <td class="px-4 py-3 text-right text-slate-600"><?= $d['status_sesi'] ? (int)$d['total_poin_manual'] : '-' ?></td>
          <td class="px-4 py-3 text-right font-bold text-slate-800"><?= $d['status_sesi'] ? (int)$d['total_skor'] : '-' ?></td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>