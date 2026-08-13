<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();

$ujian_list = $conn->query("
    SELECT u.*, 
        (SELECT COUNT(*) FROM sesi_ujian WHERE id_ujian = u.id AND status = 'berlangsung') AS sedang_berlangsung,
        (SELECT COUNT(*) FROM sesi_ujian WHERE id_ujian = u.id AND status = 'submitted') AS sudah_submit,
        (SELECT COUNT(*) FROM sesi_ujian WHERE id_ujian = u.id AND status = 'dinilai') AS sudah_dinilai,
        (SELECT COUNT(*) FROM ujian_soal WHERE id_ujian = u.id) AS jml_soal
    FROM ujian u
    WHERE u.status = 'aktif'
    ORDER BY u.tanggal_mulai DESC
")->fetch_all(MYSQLI_ASSOC);

$title = 'Monitor Ujian';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">📊 Monitor Ujian Berlangsung</h1>

<?php if (empty($ujian_list)): ?>
  <div class="rounded-2xl border border-dashed border-slate-300 bg-white p-8 text-center text-slate-400">
    Tidak ada ujian yang sedang berlangsung.
  </div>
<?php else: ?>
  <div class="space-y-6">
    <?php foreach ($ujian_list as $u): ?>
      <?php
      $total_peserta = $u['sedang_berlangsung'] + $u['sudah_submit'] + $u['sudah_dinilai'];
      $persen_selesai = $total_peserta > 0 ? round(($u['sudah_submit'] + $u['sudah_dinilai']) / $total_peserta * 100) : 0;
      ?>
      <div class="rounded-2xl bg-white p-6 shadow">
        <div class="mb-4 flex items-start justify-between">
          <div>
            <h2 class="text-xl font-bold text-slate-800"><?= e($u['judul']) ?></h2>
            <p class="text-sm text-slate-500"><?= e($u['mata_pelajaran'] ?? 'Umum') ?></p>
          </div>
          <div class="flex items-center gap-2">
            <span class="inline-flex rounded-full bg-green-100 px-3 py-1 text-xs font-medium text-green-800">Aktif</span>
            <span class="text-sm text-slate-500"><?= (int)$u['jml_soal'] ?> soal</span>
          </div>
        </div>

        <!-- Progress Bar -->
        <div class="mb-4">
          <div class="mb-1 flex items-center justify-between text-sm">
            <span class="text-slate-600">Progres Pengerjaan</span>
            <span class="font-semibold text-slate-800"><?= $persen_selesai ?>%</span>
          </div>
          <div class="h-3 w-full overflow-hidden rounded-full bg-slate-200">
            <div class="h-full rounded-full bg-blue-500 transition-all duration-500" style="width: <?= $persen_selesai ?>%"></div>
          </div>
        </div>

        <!-- Statistik -->
        <div class="grid grid-cols-4 gap-4">
          <div class="rounded-lg bg-blue-50 p-4 text-center">
            <div class="text-2xl font-bold text-blue-600"><?= $total_peserta ?></div>
            <div class="text-xs text-blue-600">Total Peserta</div>
          </div>
          <div class="rounded-lg bg-amber-50 p-4 text-center">
            <div class="text-2xl font-bold text-amber-600"><?= (int)$u['sedang_berlangsung'] ?></div>
            <div class="text-xs text-amber-600">Sedang Mengerjakan</div>
          </div>
          <div class="rounded-lg bg-green-50 p-4 text-center">
            <div class="text-2xl font-bold text-green-600"><?= (int)$u['sudah_submit'] ?></div>
            <div class="text-xs text-green-600">Sudah Submit</div>
          </div>
          <div class="rounded-lg bg-purple-50 p-4 text-center">
            <div class="text-2xl font-bold text-purple-600"><?= (int)$u['sudah_dinilai'] ?></div>
            <div class="text-xs text-purple-600">Sudah Dinilai</div>
          </div>
        </div>

        <!-- Info Waktu -->
        <div class="mt-4 flex flex-wrap gap-4 text-sm text-slate-500">
          <span>📅 Mulai: <?= $u['tanggal_mulai'] ? (new DateTime($u['tanggal_mulai']))->format('d M Y H:i') : '-' ?></span>
          <span>📅 Selesai: <?= $u['tanggal_selesai'] ? (new DateTime($u['tanggal_selesai']))->format('d M Y H:i') : '-' ?></span>
          <span>⏱️ Durasi: <?= (int)$u['durasi_menit'] ?> menit</span>
        </div>

        <!-- Aksi -->
        <div class="mt-4 flex gap-2">
          <a href="/admin/koreksi/index.php?ujian=<?= $u['id'] ?>" class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700">
            Koreksi Jawaban
          </a>
          <a href="/admin/rekap_nilai.php?ujian=<?= $u['id'] ?>" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">
            Rekap Nilai
          </a>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
<?php endif; ?>

<!-- Auto-refresh setiap 30 detik -->
<script>
setTimeout(function() {
    location.reload();
}, 30000);
</script>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
