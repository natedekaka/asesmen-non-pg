<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();
$total_soal = $conn->query("SELECT COUNT(*) AS c, tipe FROM bank_soal GROUP BY tipe")->fetch_all(MYSQLI_ASSOC);
$total_siswa = $conn->query("SELECT COUNT(*) AS c FROM siswa WHERE is_active = 1")->fetch_row()[0];
$total_ujian = $conn->query("SELECT COUNT(*) AS c FROM ujian")->fetch_row()[0];
$sesi_pending = $conn->query("SELECT COUNT(*) AS c FROM sesi_ujian WHERE status IN ('submitted','berlangsung')")->fetch_row()[0];
$ujian_terbaru = $conn->query("SELECT u.*, (SELECT COUNT(*) FROM ujian_soal us WHERE us.id_ujian = u.id) AS jml_soal FROM ujian u ORDER BY u.id DESC LIMIT 5")->fetch_all(MYSQLI_ASSOC);

$title = 'Dashboard';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">Dashboard Admin</h1>

<div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Bank Soal</div>
    <div class="mt-1 text-3xl font-bold text-slate-800"><?= array_sum(array_column($total_soal, 'c')) ?></div>
    <div class="mt-2 text-xs text-slate-400">
      <?php foreach ($total_soal as $t): ?>
        <?= e(tipe_soal_label($t['tipe'])) ?>: <?= (int)$t['c'] ?><br>
      <?php endforeach; ?>
    </div>
  </div>
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Siswa Aktif</div>
    <div class="mt-1 text-3xl font-bold text-slate-800"><?= (int)$total_siswa ?></div>
  </div>
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Total Ujian</div>
    <div class="mt-1 text-3xl font-bold text-slate-800"><?= (int)$total_ujian ?></div>
  </div>
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Sesi Perlu Dikoreksi</div>
    <div class="mt-1 text-3xl font-bold text-amber-600"><?= (int)$sesi_pending ?></div>
  </div>
</div>

<div class="mt-8">
  <h2 class="mb-3 text-lg font-semibold text-slate-800">Ujian Terbaru</h2>
  <div class="overflow-hidden rounded-2xl bg-white shadow">
    <table class="w-full text-left text-sm">
      <thead class="bg-slate-50 text-slate-500">
        <tr>
          <th class="px-4 py-3 font-medium">Judul</th>
          <th class="px-4 py-3 font-medium">Mapel</th>
          <th class="px-4 py-3 font-medium">Jumlah Soal</th>
          <th class="px-4 py-3 font-medium">Status</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-slate-100">
        <?php if (!$ujian_terbaru): ?>
          <tr><td colspan="4" class="px-4 py-6 text-center text-slate-400">Belum ada ujian.</td></tr>
        <?php endif; ?>
        <?php foreach ($ujian_terbaru as $u): ?>
          <tr class="hover:bg-slate-50">
            <td class="px-4 py-3 font-medium text-slate-800"><?= e($u['judul']) ?></td>
            <td class="px-4 py-3 text-slate-600"><?= e($u['mata_pelajaran'] ?? '-') ?></td>
            <td class="px-4 py-3 text-slate-600"><?= (int)$u['jml_soal'] ?></td>
            <td class="px-4 py-3">
              <span class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium <?= $u['status'] === 'aktif' ? 'bg-green-100 text-green-800' : ($u['status'] === 'selesai' ? 'bg-slate-200 text-slate-700' : 'bg-amber-100 text-amber-800') ?>">
                <?= e(ucfirst($u['status'])) ?>
              </span>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>