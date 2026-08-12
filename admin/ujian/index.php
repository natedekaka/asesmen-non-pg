<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$ujian = db()->query("
    SELECT u.*,
        (SELECT COUNT(*) FROM ujian_soal us WHERE us.id_ujian = u.id) AS jml_soal,
        (SELECT COUNT(*) FROM ujian_kelas uk WHERE uk.id_ujian = u.id) AS jml_kelas,
        (SELECT COUNT(*) FROM sesi_ujian su WHERE su.id_ujian = u.id) AS jml_sesi
    FROM ujian u ORDER BY u.id DESC
")->fetch_all(MYSQLI_ASSOC);

$title = 'Ujian';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Ujian / Asesmen</h1>
  <a href="tambah.php" class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700">+ Buat Ujian</a>
</div>

<div class="mt-5 overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">Judul</th>
        <th class="px-4 py-3 font-medium">Mapel</th>
        <th class="px-4 py-3 font-medium">Soal</th>
        <th class="px-4 py-3 font-medium">Kelas</th>
        <th class="px-4 py-3 font-medium">Sesi</th>
        <th class="px-4 py-3 font-medium">Durasi</th>
        <th class="px-4 py-3 font-medium">Status</th>
        <th class="px-4 py-3 font-medium text-right">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (!$ujian): ?>
        <tr><td colspan="8" class="px-4 py-8 text-center text-slate-400">Belum ada ujian.</td></tr>
      <?php endif; ?>
      <?php foreach ($ujian as $u): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3 font-medium text-slate-800"><?= e($u['judul']) ?></td>
          <td class="px-4 py-3 text-slate-600"><?= e($u['mata_pelajaran'] ?? '-') ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$u['jml_soal'] ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$u['jml_kelas'] ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$u['jml_sesi'] ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$u['durasi_menit'] ?> mnt</td>
          <td class="px-4 py-3">
            <a href="edit.php?id=<?= $u['id'] ?>" class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium <?= $u['status'] === 'aktif' ? 'bg-green-100 text-green-800' : ($u['status'] === 'selesai' ? 'bg-slate-200 text-slate-700' : 'bg-amber-100 text-amber-800') ?>">
              <?= e(ucfirst($u['status'])) ?>
            </a>
          </td>
          <td class="px-4 py-3 text-right whitespace-nowrap space-x-3 text-indigo-600">
            <a href="soal.php?id=<?= $u['id'] ?>" class="hover:underline">Soal</a>
            <a href="kelas.php?id=<?= $u['id'] ?>" class="hover:underline">Kelas</a>
            <a href="edit.php?id=<?= $u['id'] ?>" class="hover:underline">Edit</a>
            <a href="hapus.php?id=<?= $u['id'] ?>" class="text-red-600 hover:underline" onclick="return confirm('Hapus ujian beserta semua sesi dan jawaban?')">Hapus</a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>