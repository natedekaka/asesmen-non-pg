<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$conn = db();
$siswa_id = (int)$_SESSION['siswa_id'];
$ujian_id = (int)($_GET['ujian'] ?? 0);

if ($ujian_id <= 0) {
    flash_set('error', 'ID ujian tidak valid.');
    redirect('/siswa/index.php');
}

// Ambil data sesi ujian
$stmt = $conn->prepare("
    SELECT s.*, u.judul, u.mata_pelajaran, u.tampilkan_hasil
    FROM sesi_ujian s 
    JOIN ujian u ON u.id = s.id_ujian
    WHERE s.id_ujian = ? AND s.id_siswa = ?
");
$stmt->bind_param('ii', $ujian_id, $siswa_id);
$stmt->execute();
$sesi = $stmt->get_result()->fetch_assoc();

if (!$sesi) {
    flash_set('error', 'Data ujian tidak ditemukan.');
    redirect('/siswa/index.php');
}

if ($sesi['status'] !== 'dinilai' || !$sesi['tampilkan_hasil']) {
    flash_set('error', 'Hasil ujian belum tersedia atau tidak ditampilkan.');
    redirect('/siswa/index.php');
}

// Ambil detail jawaban
$stmt = $conn->prepare("
    SELECT j.*, us.urutan, b.tipe, b.pertanyaan, b.kunci, b.poin,
           b.pertanyaan AS teks_soal
    FROM jawaban j
    JOIN ujian_soal us ON us.id = j.id_ujian_soal
    JOIN bank_soal b ON b.id = us.id_soal
    WHERE j.id_sesi = ?
    ORDER BY us.urutan
");
$stmt->bind_param('i', $sesi['id']);
$stmt->execute();
$jawaban_list = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

// Hitung total
$total_skor = 0;
$total_maks = 0;
foreach ($jawaban_list as $j) {
    $total_skor += (int)$j['skor'];
    $total_maks += (int)$j['poin'];
}

$title = 'Detail Jawaban - ' . $sesi['judul'];
require __DIR__ . '/../views/layout_siswa_top.php';
?>

<div class="mb-6 flex items-center justify-between">
  <div>
    <h1 class="text-2xl font-bold text-slate-800">Detail Jawaban</h1>
    <p class="text-sm text-slate-500"><?= e($sesi['judul']) ?> — <?= e($sesi['mata_pelajaran'] ?? 'Umum') ?></p>
  </div>
  <a href="/siswa/index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">
    ← Kembali
  </a>
</div>

<!-- Ringkasan Skor -->
<div class="mb-6 rounded-2xl bg-white p-6 shadow">
  <div class="flex items-center justify-between">
    <div>
      <h2 class="text-lg font-semibold text-slate-800">Ringkasan Hasil</h2>
      <p class="text-sm text-slate-500">Dikumpulkan: <?= $sesi['submitted_at'] ? (new DateTime($sesi['submitted_at']))->format('d M Y H:i:s') : '-' ?></p>
    </div>
    <div class="text-right">
      <div class="text-3xl font-bold <?= $total_skor >= $total_maks * 0.7 ? 'text-green-600' : ($total_skor >= $total_maks * 0.5 ? 'text-amber-600' : 'text-red-600') ?>">
        <?= $total_skor ?> / <?= $total_maks ?>
      </div>
      <div class="text-sm text-slate-500">Skor Total</div>
    </div>
  </div>
  
  <!-- Progress Bar -->
  <div class="mt-4 h-3 w-full overflow-hidden rounded-full bg-slate-200">
    <div class="h-full rounded-full <?= $total_skor >= $total_maks * 0.7 ? 'bg-green-500' : ($total_skor >= $total_maks * 0.5 ? 'bg-amber-500' : 'bg-red-500') ?>" 
         style="width: <?= $total_maks > 0 ? round(($total_skor / $total_maks) * 100) : 0 ?>%"></div>
  </div>
  <div class="mt-2 text-right text-sm text-slate-500">
    <?= $total_maks > 0 ? round(($total_skor / $total_maks) * 100, 1) : 0 ?>% Benar
  </div>
</div>

<!-- Detail Per Soal -->
<div class="space-y-4">
  <?php foreach ($jawaban_list as $i => $j): ?>
    <div class="rounded-2xl bg-white p-6 shadow">
      <div class="mb-3 flex items-start justify-between gap-3">
        <div class="flex items-center gap-3">
          <span class="flex h-8 w-8 items-center justify-center rounded-full bg-slate-100 text-sm font-semibold text-slate-600">
            <?= (int)$j['urutan'] ?>
          </span>
          <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium <?= $j['tipe'] === 'essay' ? 'bg-blue-100 text-blue-800' : ($j['tipe'] === 'isian' ? 'bg-green-100 text-green-800' : 'bg-purple-100 text-purple-800') ?>">
            <?= e(tipe_soal_label($j['tipe'])) ?>
          </span>
        </div>
        <div class="text-right">
          <span class="text-lg font-bold <?= $j['skor'] == $j['poin'] ? 'text-green-600' : ($j['skor'] > 0 ? 'text-amber-600' : 'text-red-600') ?>">
            <?= $j['skor'] ?> / <?= $j['poin'] ?>
          </span>
          <div class="text-xs text-slate-400">Poin</div>
        </div>
      </div>

      <h3 class="mb-3 font-medium text-slate-800"><?= $j['teks_soal'] ?></h3>

      <!-- Jawaban Siswa -->
      <div class="mb-3 rounded-lg border border-slate-200 p-3">
        <div class="mb-1 text-xs font-medium text-slate-500">Jawaban Anda:</div>
        <?php if ($j['tipe'] === 'menjodohkan'): ?>
          <?php 
          $pasangan = json_decode($j['jawaban'], true) ?: [];
          if (!empty($pasangan)):
              // Ambil data pasangan
              $stmt_pasangan = $conn->prepare("SELECT * FROM pasangan_menjodohkan WHERE id_soal = ? ORDER BY urutan");
              $stmt_pasangan->bind_param('i', $j['id_soal'] ?? 0);
              $stmt_pasangan->execute();
              $semua_pasangan = $stmt_pasangan->get_result()->fetch_all(MYSQLI_ASSOC);
          ?>
            <div class="space-y-1">
              <?php foreach ($pasangan as $kiri_id => $kanan_id): ?>
                <?php
                $kiri = null;
                $kanan = null;
                foreach ($semua_pasangan as $p) {
                    if ($p['id'] == $kiri_id) $kiri = $p['kolom_kiri'];
                    if ($p['id'] == $kanan_id) $kanan = $p['kolom_kanan'];
                }
                ?>
                <div class="text-sm">
                  <span class="font-medium"><?= e($kiri ?? "?") ?></span>
                  → 
                  <span class="<?= $kanan ? 'text-slate-800' : 'text-red-500' ?>"><?= e($kanan ?? "Tidak dijawab") ?></span>
                </div>
              <?php endforeach; ?>
            </div>
          <?php else: ?>
            <div class="text-sm text-slate-400">Tidak ada jawaban</div>
          <?php endif; ?>
        <?php else: ?>
          <div class="text-sm text-slate-800">
            <?= $j['jawaban'] ? e($j['jawaban']) : '<span class="text-slate-400">Tidak dijawab</span>' ?>
          </div>
        <?php endif; ?>
      </div>

      <!-- Kunci Jawaban (jika ada) -->
      <?php if ($j['kunci'] && $j['skor'] < $j['poin']): ?>
        <div class="rounded-lg border border-green-200 bg-green-50 p-3">
          <div class="mb-1 text-xs font-medium text-green-700">Kunci Jawaban:</div>
          <div class="text-sm text-green-800">
            <?php if ($j['tipe'] === 'isian'): ?>
              <?php 
              $alternatif = explode('||', $j['kunci']);
              echo e(implode(' / ', $alternatif));
              ?>
            <?php else: ?>
              <?= e($j['kunci']) ?>
            <?php endif; ?>
          </div>
        </div>
      <?php endif; ?>

      <!-- Catatan Koreksi -->
      <?php if ($j['catatan']): ?>
        <div class="mt-3 rounded-lg border border-amber-200 bg-amber-50 p-3">
          <div class="mb-1 text-xs font-medium text-amber-700">Catatan Koreksi:</div>
          <div class="text-sm text-amber-800"><?= nl2br(e($j['catatan'])) ?></div>
        </div>
      <?php endif; ?>
    </div>
  <?php endforeach; ?>
</div>

<?php require __DIR__ . '/../views/layout_siswa_bottom.php'; ?>
