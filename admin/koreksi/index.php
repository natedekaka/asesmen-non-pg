<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$conn = db();
$ujian_list = $conn->query("
    SELECT u.id, u.judul, u.mata_pelajaran, u.status, u.tampilkan_hasil,
        (SELECT COUNT(*) FROM sesi_ujian s WHERE s.id_ujian = u.id) AS jml_sesi,
        (SELECT COUNT(*) FROM sesi_ujian s WHERE s.id_ujian = u.id AND s.status IN ('submitted','dinilai')) AS jml_sumbit,
        (SELECT COUNT(*) FROM sesi_ujian s WHERE s.id_ujian = u.id AND s.status = 'dinilai') AS jml_nilai,
        (SELECT COUNT(*) FROM sesi_ujian s WHERE s.id_ujian = u.id AND s.status = 'berlangsung') AS jml_proses
    FROM ujian u ORDER BY u.id DESC
")->fetch_all(MYSQLI_ASSOC);

$title = 'Koreksi & Nilai';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<h1 class="text-2xl font-bold text-slate-800">Koreksi &amp; Penilaian</h1>
<p class="mt-1 text-sm text-slate-500">Isian singkat & menjodohkan dikoreksi otomatis; essay dinilai manual.</p>

<div class="mt-5 overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">Ujian</th>
        <th class="px-4 py-3 font-medium text-center">Total Sesi</th>
        <th class="px-4 py-3 font-medium text-center">Berlangsung</th>
        <th class="px-4 py-3 font-medium text-center">Menunggu</th>
        <th class="px-4 py-3 font-medium text-center">Dinilai</th>
        <th class="px-4 py-3 font-medium">Status</th>
        <th class="px-4 py-3 font-medium text-right">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (!$ujian_list): ?>
        <tr><td colspan="7" class="px-4 py-8 text-center text-slate-400">Belum ada ujian.</td></tr>
      <?php endif; ?>
      <?php foreach ($ujian_list as $u): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3">
            <div class="font-medium text-slate-800"><?= e($u['judul']) ?></div>
            <div class="text-xs text-slate-400"><?= e($u['mata_pelajaran'] ?? '-') ?></div>
          </td>
          <td class="px-4 py-3 text-center text-slate-600"><?= (int)$u['jml_sesi'] ?></td>
          <td class="px-4 py-3 text-center text-slate-600"><?= (int)$u['jml_proses'] ?></td>
          <td class="px-4 py-3 text-center text-amber-600 font-medium"><?= max(0, (int)$u['jml_sumbit'] - (int)$u['jml_nilai']) ?></td>
          <td class="px-4 py-3 text-center text-green-700"><?= (int)$u['jml_nilai'] ?></td>
          <td class="px-4 py-3">
            <span class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium <?= $u['status'] === 'aktif' ? 'bg-green-100 text-green-800' : ($u['status'] === 'selesai' ? 'bg-slate-200 text-slate-700' : 'bg-amber-100 text-amber-800') ?>">
              <?= e(ucfirst($u['status'])) ?>
            </span>
          </td>
          <td class="px-4 py-3 text-right">
            <a href="rekap.php?ujian=<?= (int)$u['id'] ?>" class="text-indigo-600 hover:underline">Rekap</a>
            <span class="mx-1 text-slate-300">|</span>
            <a href="nilai.php?ujian=<?= (int)$u['id'] ?>" class="font-semibold text-indigo-600 hover:underline">Koreksi</a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>