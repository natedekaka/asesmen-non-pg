<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$conn = db();
$siswa_id = (int)$_SESSION['siswa_id'];

// Ambil data siswa lengkap
$stmt = $conn->prepare("
    SELECT s.*, k.nama_kelas 
    FROM siswa s 
    LEFT JOIN kelas k ON k.id = s.kelas_id 
    WHERE s.id = ?
");
$stmt->bind_param('i', $siswa_id);
$stmt->execute();
$siswa = $stmt->get_result()->fetch_assoc();

// Ambil statistik ujian
$stats = $conn->prepare("
    SELECT 
        COUNT(*) AS total_ujian,
        SUM(CASE WHEN status = 'dinilai' THEN 1 ELSE 0 END) AS ujian_dinilai,
        SUM(CASE WHEN status = 'submitted' THEN 1 ELSE 0 END) AS ujian_menunggu,
        COALESCE(AVG(CASE WHEN status = 'dinilai' THEN total_skor END), 0) AS rata_rata_skor
    FROM sesi_ujian 
    WHERE id_siswa = ?
");
$stats->bind_param('i', $siswa_id);
$stats->execute();
$statistik = $stats->get_result()->fetch_assoc();

$title = 'Profil Saya';
require __DIR__ . '/../views/layout_siswa_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">Profil Saya</h1>

<div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
  <!-- Kartu Profil -->
  <div class="lg:col-span-1">
    <div class="rounded-2xl bg-white p-6 shadow text-center">
      <div class="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-blue-100 text-3xl font-bold text-blue-600">
        <?= strtoupper(substr($siswa['nama_lengkap'], 0, 1)) ?>
      </div>
      <h2 class="text-xl font-bold text-slate-800"><?= e($siswa['nama_lengkap']) ?></h2>
      <p class="mt-1 text-sm text-slate-500">NIS: <?= e($siswa['nis']) ?></p>
      <p class="text-sm text-slate-500">Kelas: <?= e($siswa['nama_kelas'] ?? '-') ?></p>
      
      <div class="mt-4 flex flex-col gap-2">
        <a href="/siswa/ganti_password.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">
          🔒 Ganti Kata Sandi
        </a>
        <a href="/siswa/index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">
          ← Kembali ke Beranda
        </a>
      </div>
    </div>
  </div>

  <!-- Detail Profil -->
  <div class="lg:col-span-2">
    <div class="rounded-2xl bg-white p-6 shadow">
      <h3 class="mb-4 text-lg font-semibold text-slate-800">Informasi Akun</h3>
      
      <dl class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <div class="rounded-lg bg-slate-50 p-4">
          <dt class="text-sm font-medium text-slate-500">NIS</dt>
          <dd class="mt-1 text-lg font-semibold text-slate-800"><?= e($siswa['nis']) ?></dd>
        </div>
        <div class="rounded-lg bg-slate-50 p-4">
          <dt class="text-sm font-medium text-slate-500">Nama Lengkap</dt>
          <dd class="mt-1 text-lg font-semibold text-slate-800"><?= e($siswa['nama_lengkap']) ?></dd>
        </div>
        <div class="rounded-lg bg-slate-50 p-4">
          <dt class="text-sm font-medium text-slate-500">Kelas</dt>
          <dd class="mt-1 text-lg font-semibold text-slate-800"><?= e($siswa['nama_kelas'] ?? '-') ?></dd>
        </div>
        <div class="rounded-lg bg-slate-50 p-4">
          <dt class="text-sm font-medium text-slate-500">Status Akun</dt>
          <dd class="mt-1">
            <?php if ($siswa['is_active']): ?>
              <span class="inline-flex rounded-full bg-green-100 px-2 py-1 text-xs font-medium text-green-800">Aktif</span>
            <?php else: ?>
              <span class="inline-flex rounded-full bg-red-100 px-2 py-1 text-xs font-medium text-red-800">Nonaktif</span>
            <?php endif; ?>
          </dd>
        </div>
      </dl>
    </div>

    <!-- Statistik Ujian -->
    <div class="mt-6 rounded-2xl bg-white p-6 shadow">
      <h3 class="mb-4 text-lg font-semibold text-slate-800">Statistik Ujian</h3>
      
      <div class="grid grid-cols-2 gap-4 sm:grid-cols-4">
        <div class="rounded-lg bg-blue-50 p-4 text-center">
          <div class="text-2xl font-bold text-blue-600"><?= (int)$statistik['total_ujian'] ?></div>
          <div class="text-xs text-blue-600">Total Ujian</div>
        </div>
        <div class="rounded-lg bg-green-50 p-4 text-center">
          <div class="text-2xl font-bold text-green-600"><?= (int)$statistik['ujian_dinilai'] ?></div>
          <div class="text-xs text-green-600">Dinilai</div>
        </div>
        <div class="rounded-lg bg-amber-50 p-4 text-center">
          <div class="text-2xl font-bold text-amber-600"><?= (int)$statistik['ujian_menunggu'] ?></div>
          <div class="text-xs text-amber-600">Menunggu</div>
        </div>
        <div class="rounded-lg bg-purple-50 p-4 text-center">
          <div class="text-2xl font-bold text-purple-600"><?= number_format($statistik['rata_rata_skor'], 1) ?></div>
          <div class="text-xs text-purple-600">Rata-rata Skor</div>
        </div>
      </div>
    </div>

    <!-- Riwayat Terakhir -->
    <div class="mt-6 rounded-2xl bg-white p-6 shadow">
      <h3 class="mb-4 text-lg font-semibold text-slate-800">Riwayat Ujian Terakhir</h3>
      
      <?php
      $riwayat = $conn->prepare("
          SELECT u.judul, u.mata_pelajaran, s.status, s.total_skor, s.submitted_at
          FROM sesi_ujian s 
          JOIN ujian u ON u.id = s.id_ujian
          WHERE s.id_siswa = ? AND s.status IN ('submitted','dinilai')
          ORDER BY s.submitted_at DESC LIMIT 5
      ");
      $riwayat->bind_param('i', $siswa_id);
      $riwayat->execute();
      $riwayat_list = $riwayat->get_result()->fetch_all(MYSQLI_ASSOC);
      ?>
      
      <?php if (empty($riwayat_list)): ?>
        <p class="text-center text-sm text-slate-400">Belum ada riwayat ujian.</p>
      <?php else: ?>
        <div class="space-y-3">
          <?php foreach ($riwayat_list as $r): ?>
            <div class="flex items-center justify-between rounded-lg border border-slate-200 p-3">
              <div>
                <div class="font-medium text-slate-800"><?= e($r['judul']) ?></div>
                <div class="text-xs text-slate-500"><?= e($r['mata_pelajaran'] ?? 'Umum') ?></div>
              </div>
              <div class="text-right">
                <?php if ($r['status'] === 'dinilai'): ?>
                  <div class="font-bold text-green-600"><?= (int)$r['total_skor'] ?></div>
                  <div class="text-xs text-green-600">Dinilai</div>
                <?php else: ?>
                  <div class="text-slate-400">-</div>
                  <div class="text-xs text-amber-600">Menunggu</div>
                <?php endif; ?>
              </div>
            </div>
          <?php endforeach; ?>
        </div>
      <?php endif; ?>
    </div>
  </div>
</div>

<?php require __DIR__ . '/../views/layout_siswa_bottom.php'; ?>
