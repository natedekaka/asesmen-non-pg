<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();

$total_ujian = $conn->query("SELECT COUNT(*) AS c FROM ujian")->fetch_row()[0];
$ujian_aktif = $conn->query("SELECT COUNT(*) AS c FROM ujian WHERE status = 'aktif'")->fetch_row()[0];
$total_siswa = $conn->query("SELECT COUNT(*) AS c FROM siswa WHERE is_active = 1")->fetch_row()[0];
$total_soal = $conn->query("SELECT COUNT(*) AS c FROM bank_soal")->fetch_row()[0];

$ujian_recent = $conn->query("
    SELECT u.*,
        (SELECT COUNT(*) FROM sesi_ujian WHERE id_ujian = u.id) AS total_peserta,
        (SELECT COUNT(*) FROM sesi_ujian WHERE id_ujian = u.id AND status = 'dinilai') AS sudah_dinilai,
        (SELECT AVG(total_skor) FROM sesi_ujian WHERE id_ujian = u.id AND status = 'dinilai') AS rata_skor,
        (SELECT COUNT(*) FROM ujian_soal WHERE id_ujian = u.id) AS jml_soal
    FROM ujian u
    WHERE u.status IN ('aktif', 'selesai')
    ORDER BY u.id DESC LIMIT 10
")->fetch_all(MYSQLI_ASSOC);

$soal_per_tipe = $conn->query("SELECT tipe, COUNT(*) AS jml FROM bank_soal GROUP BY tipe")->fetch_all(MYSQLI_ASSOC);

$title = 'Analytics';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">📈 Analytics Dashboard</h1>

<!-- Ringkasan Umum -->
<div class="mb-6 grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Total Ujian</div>
    <div class="mt-1 text-3xl font-bold text-slate-800"><?= (int)$total_ujian ?></div>
    <div class="mt-2 text-xs text-slate-400">Aktif: <?= (int)$ujian_aktif ?></div>
  </div>
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Siswa Aktif</div>
    <div class="mt-1 text-3xl font-bold text-slate-800"><?= (int)$total_siswa ?></div>
  </div>
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Bank Soal</div>
    <div class="mt-1 text-3xl font-bold text-slate-800"><?= (int)$total_soal ?></div>
    <div class="mt-2 text-xs text-slate-400">
      <?php foreach ($soal_per_tipe as $t): ?>
        <?= e(tipe_soal_label($t['tipe'])) ?>: <?= (int)$t['jml'] ?>
        <?php if (end($soal_per_tipe) !== $t) echo ' · '; ?>
      <?php endforeach; ?>
    </div>
  </div>
  <div class="rounded-2xl bg-white p-5 shadow">
    <div class="text-sm text-slate-500">Rata-rata Nilai</div>
    <?php
    $avg = $conn->query("SELECT AVG(total_skor) FROM sesi_ujian WHERE status = 'dinilai'")->fetch_row()[0];
    ?>
    <div class="mt-1 text-3xl font-bold <?= $avg >= 70 ? 'text-green-600' : ($avg >= 50 ? 'text-amber-600' : 'text-red-600') ?>">
      <?= $avg ? number_format($avg, 1) : '-' ?>
    </div>
  </div>
</div>

<!-- Daftar Ujian Terakhir -->
<div class="rounded-2xl bg-white p-6 shadow">
  <h2 class="mb-4 text-lg font-semibold text-slate-800">Ringkasan Ujian Terakhir</h2>
  
  <?php if (empty($ujian_recent)): ?>
    <p class="text-center text-sm text-slate-400">Belum ada data ujian.</p>
  <?php else: ?>
    <div class="overflow-x-auto">
      <table class="w-full text-left text-sm">
        <thead class="bg-slate-50 text-slate-500">
          <tr>
            <th class="px-4 py-3 font-medium">Judul</th>
            <th class="px-4 py-3 font-medium">Status</th>
            <th class="px-4 py-3 font-medium">Peserta</th>
            <th class="px-4 py-3 font-medium">Dinilai</th>
            <th class="px-4 py-3 font-medium">Rata-rata</th>
            <th class="px-4 py-3 font-medium">Soal</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-slate-100">
          <?php foreach ($ujian_recent as $u): ?>
            <tr class="hover:bg-slate-50">
              <td class="px-4 py-3 font-medium text-slate-800"><?= e($u['judul']) ?></td>
              <td class="px-4 py-3">
                <span class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium <?= $u['status'] === 'aktif' ? 'bg-green-100 text-green-800' : 'bg-slate-200 text-slate-700' ?>">
                  <?= e(ucfirst($u['status'])) ?>
                </span>
              </td>
              <td class="px-4 py-3 text-slate-600"><?= (int)$u['total_peserta'] ?></td>
              <td class="px-4 py-3 text-slate-600"><?= (int)$u['sudah_dinilai'] ?></td>
              <td class="px-4 py-3">
                <?php if ($u['rata_skor']): ?>
                  <span class="font-semibold <?= $u['rata_skor'] >= 70 ? 'text-green-600' : ($u['rata_skor'] >= 50 ? 'text-amber-600' : 'text-red-600') ?>">
                    <?= number_format($u['rata_skor'], 1) ?>
                  </span>
                <?php else: ?>
                  <span class="text-slate-400">-</span>
                <?php endif; ?>
              </td>
              <td class="px-4 py-3 text-slate-600"><?= (int)$u['jml_soal'] ?></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  <?php endif; ?>
</div>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
