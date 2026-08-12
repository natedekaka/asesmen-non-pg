<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$id_ujian = (int)($_GET['ujian'] ?? 0);
$siswa_id = (int)$_SESSION['siswa_id'];
$conn = db();

$stmt = $conn->prepare("
    SELECT s.*, u.judul, u.mata_pelajaran, u.tampilkan_hasil,
           (SELECT COUNT(*) FROM ujian_soal WHERE id_ujian = u.id) AS jml_soal
    FROM sesi_ujian s JOIN ujian u ON u.id = s.id_ujian
    WHERE s.id_ujian = ? AND s.id_siswa = ? AND s.status IN ('submitted','dinilai')
    ORDER BY s.id DESC LIMIT 1
");
$stmt->bind_param('ii', $id_ujian, $siswa_id);
$stmt->execute();
$sesi = $stmt->get_result()->fetch_assoc();

if (!$sesi) {
    flash_set('error', 'Anda belum mengumpulkan ujian ini.');
    redirect('index.php');
}

$rincian = [];
if ($sesi['status'] === 'dinilai' && $sesi['tampilkan_hasil']) {
    $stmt = $conn->prepare("
        SELECT us.urutan, us.id_soal, b.tipe, b.pertanyaan, b.poin, j.jawaban, j.skor, j.status_koreksi, j.catatan
        FROM ujian_soal us
        JOIN bank_soal b ON b.id = us.id_soal
        LEFT JOIN jawaban j ON j.id_ujian_soal = us.id AND j.id_sesi = ?
        WHERE us.id_ujian = ? ORDER BY us.urutan, us.id
    ");
    $stmt->bind_param('ii', $sesi['id'], $id_ujian);
    $stmt->execute();
    $rincian = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
}

$title = 'Hasil Asesmen';
require __DIR__ . '/../views/layout_siswa_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800"><?= e($sesi['judul']) ?></h1>
  <a href="index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Kembali</a>
</div>

<div class="mt-6 rounded-2xl bg-white p-6 shadow">
  <div class="flex flex-col items-start gap-6 sm:flex-row sm:items-center sm:justify-between">
    <div>
      <div class="text-sm text-slate-500">Total Skor</div>
      <div class="mt-1 flex items-baseline gap-2">
        <span class="text-4xl font-bold text-slate-800"><?= (int)$sesi['total_skor'] ?></span>
        <span class="text-lg text-slate-400">poin</span>
      </div>
      <div class="mt-2 grid grid-cols-2 gap-4 text-xs text-slate-500">
        <div>Otomatis: <b class="text-slate-700"><?= (int)$sesi['total_poin_auto'] ?></b></div>
        <div>Manual: <b class="text-slate-700"><?= (int)$sesi['total_poin_manual'] ?></b></div>
      </div>
    </div>
    <div class="text-right text-sm">
      <?php if ($sesi['status'] === 'dinilai'): ?>
        <div class="mb-1 inline-flex rounded-full bg-green-100 px-3 py-1 text-xs font-medium text-green-800">Sudah Dinilai</div><br>
        <?php if ($sesi['tampilkan_hasil']): ?>
          <span class="text-xs text-slate-500">Hasil diperlihatkan kepada Anda.</span>
        <?php else: ?>
          <span class="text-xs text-slate-500">Hasil disembunyikan oleh pengajar.</span>
        <?php endif; ?>
      <?php else: ?>
        <div class="mb-1 inline-flex rounded-full bg-amber-100 px-3 py-1 text-xs font-medium text-amber-800">Menunggu Koreksi</div><br>
        <span class="text-xs text-slate-500">Skor tampil setelah pengajar mengoreksi.</span>
      <?php endif; ?>
      <br>
      <span class="text-xs text-slate-500">Dikumpulkan: <?= $sesi['submitted_at'] ? (new DateTime($sesi['submitted_at']))->format('d M Y H:i:s') : '-' ?></span>
    </div>
  </div>
</div>

<?php if ($rincian): ?>
<div class="mt-6">
  <h2 class="mb-3 text-lg font-semibold text-slate-800">Perincian Jawaban</h2>
  <div class="space-y-4">
    <?php foreach ($rincian as $i => $r): ?>
      <div class="rounded-2xl bg-white p-5 shadow">
        <div class="mb-2 flex items-center justify-between gap-3">
          <span class="inline-flex rounded-full bg-slate-100 px-3 py-1 text-xs font-medium text-slate-600">Soal <?= $i + 1 ?> · <?= e($r['tipe']) ?></span>
          <span class="text-sm font-bold <?= (int)$r['skor'] >= (int)$r['poin'] ? 'text-green-600' : (($r['skor'] === null) ? 'text-slate-400' : 'text-amber-600') ?>">
            <?= $r['skor'] !== null ? ((int)$r['skor'] . ' / ' . (int)$r['poin']) : 'Belum dinilai' ?>
          </span>
        </div>
        <div class="text-slate-800 whitespace-pre-wrap"><?= e($r['pertanyaan']) ?></div>
        <?php if ($r['tipe'] === 'menjodohkan' && $r['jawaban']): ?>
          <?php
            $jodoh = json_decode((string)$r['jawaban'], true);
            $stmt_p = $conn->prepare("SELECT id, kolom_kiri, kolom_kanan FROM pasangan_menjodohkan WHERE id_soal = ? ORDER BY urutan");
            $stmt_p->bind_param('i', $r['id_soal']);
            $stmt_p->execute();
            $pairs_p = $stmt_p->get_result()->fetch_all(MYSQLI_ASSOC);
          ?>
          <div class="mt-3 overflow-hidden rounded-xl border border-slate-200">
            <table class="w-full text-left text-sm">
              <tbody>
                <?php foreach ($pairs_p as $pp):
                  $terpilih = (is_array($jodoh) && isset($jodoh[$pp['id']])) ? $jodoh[$pp['id']] : '';
                  $teks = '';
                  foreach ($pairs_p as $pp2) {
                      if ($terpilih !== '' && (string)$pp2['id'] === (string)$terpilih) {
                          $teks = $pp2['kolom_kanan'];
                          break;
                      }
                  }
                ?>
                <tr class="border-t border-slate-100 first:border-t-0">
                  <td class="px-3 py-2 font-medium text-slate-700"><?= e($pp['kolom_kiri']) ?></td>
                  <td class="px-3 py-2 text-slate-500">→ <?= e($teks !== '' ? $teks : '(tidak diisi)') ?></td>
                </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        <?php else: ?>
        <div class="mt-3 rounded-lg bg-slate-50 px-3 py-2 text-sm text-slate-600 whitespace-pre-wrap">
          <span class="font-medium text-slate-500">Jawaban Anda:</span> <?= e($r['jawaban'] !== null && $r['jawaban'] !== '' ? $r['jawaban'] : '(kosong)') ?>
        </div>
        <?php endif; ?>
        <?php if (!empty($r['catatan'])): ?>
          <div class="mt-2 rounded-lg bg-blue-50 px-3 py-2 text-sm text-blue-700">Catatan pengajar: <?= e($r['catatan']) ?></div>
        <?php endif; ?>
      </div>
    <?php endforeach; ?>
  </div>
</div>
<?php endif; ?>

<div class="mt-6">
  <a href="index.php" class="inline-block rounded-lg bg-indigo-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-indigo-700">Kembali ke Beranda</a>
</div>

<?php require __DIR__ . '/../views/layout_siswa_bottom.php'; ?>