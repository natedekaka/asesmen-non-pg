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

<div class="page-header">
  <div>
    <ul class="breadcrumb-custom">
      <li class="active">Dashboard</li>
    </ul>
    <h3>
      <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z"/></svg>
      Dashboard
    </h3>
  </div>
</div>

<div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
  <div class="stat-card stat-primary">
    <div class="stat-icon">
      <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
    </div>
    <div class="stat-value"><?= array_sum(array_column($total_soal, 'c')) ?></div>
    <div class="stat-label">Bank Soal</div>
    <div class="stat-trend text-muted">
      <?php foreach ($total_soal as $t): ?>
        <span><?= e(tipe_soal_label($t['tipe'])) ?>: <?= (int)$t['c'] ?></span>
      <?php endforeach; ?>
    </div>
  </div>
  <div class="stat-card stat-success">
    <div class="stat-icon">
      <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z"/></svg>
    </div>
    <div class="stat-value"><?= (int)$total_siswa ?></div>
    <div class="stat-label">Siswa Aktif</div>
  </div>
  <div class="stat-card stat-warning">
    <div class="stat-icon">
      <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
    </div>
    <div class="stat-value"><?= (int)$total_ujian ?></div>
    <div class="stat-label">Total Ujian</div>
  </div>
  <div class="stat-card stat-info">
    <div class="stat-icon">
      <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M12 6v6h4.5m4.5 0a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
    </div>
    <div class="stat-value"><?= (int)$sesi_pending ?></div>
    <div class="stat-label">Sesi Perlu Dikoreksi</div>
  </div>
</div>

<div class="mt-8">
  <h2 class="mb-3 text-lg font-semibold text-slate-800">Ujian Terbaru</h2>
  <div class="card overflow-hidden">
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