<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$id_sesi = (int)($_GET['sesi'] ?? 0);
$conn = db();

$stmt = $conn->prepare("
    SELECT s.*, u.id AS id_ujian, u.judul, u.tampilkan_hasil, sis.nis, sis.nama_lengkap, k.nama_kelas
    FROM sesi_ujian s
    JOIN ujian u ON u.id = s.id_ujian
    JOIN siswa sis ON sis.id = s.id_siswa
    LEFT JOIN kelas k ON k.id = sis.kelas_id
    WHERE s.id = ?
");
$stmt->bind_param('i', $id_sesi);
$stmt->execute();
$sesi = $stmt->get_result()->fetch_assoc();
if (!$sesi) {
    flash_set('error', 'Sesi tidak ditemukan.');
    redirect('nilai.php');
}
if (!in_array($sesi['status'], ['submitted', 'dinilai'])) {
    flash_set('error', 'Sesi belum dikumpulkan siswa.');
    redirect('nilai.php?ujian=' . (int)$sesi['id_ujian']);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $skor_post = $_POST['skor'] ?? [];
    $catatan_post = $_POST['catatan'] ?? [];
    $poin = $_POST['poin'] ?? [];

    $total = 0;
    $ada_essay = false;
    $upd = $conn->prepare("UPDATE jawaban SET skor = ?, status_koreksi = 'manual', catatan = ? WHERE id_sesi = ? AND id_ujian_soal = ?");
    $upd_auto = $conn->prepare("UPDATE jawaban SET catatan = ? WHERE id_sesi = ? AND id_ujian_soal = ?");

    // Soal utk sesi ini
    $stmt_soal = $conn->prepare("
        SELECT us.id AS id_us, us.id_soal, b.tipe FROM ujian_soal us JOIN bank_soal b ON b.id = us.id_soal
        WHERE us.id_ujian = ? ORDER BY us.urutan, us.id
    ");
    $stmt_soal->bind_param('i', $sesi['id_ujian']);
    $stmt_soal->execute();
    foreach ($stmt_soal->get_result()->fetch_all(MYSQLI_ASSOC) as $sq) {
        $id_us = (int)$sq['id_us'];
        $jwb_skor = isset($skor_post[$id_us]) ? (int)$skor_post[$id_us] : null;
        $catatan = trim($catatan_post[$id_us] ?? '');
        $poin_max = (int)($poin[$id_us] ?? 0);

        if ($sq['tipe'] === 'essay') {
            $ada_essay = true;
            if ($jwb_skor !== null) {
                $jwb_skor = max(0, min($jwb_skor, $poin_max));
                $upd->bind_param('isii', $jwb_skor, $catatan, $id_sesi, $id_us);
                $upd->execute();
                $total += $jwb_skor;
            } else {
                // tidak dinilai → ambil skor yang sudah ada (kalau ada)
                $q = $conn->prepare("SELECT skor FROM jawaban WHERE id_sesi = ? AND id_ujian_soal = ?");
                $q->bind_param('ii', $id_sesi, $id_us);
                $q->execute();
                $sk = $q->get_result()->fetch_assoc();
                $total += (int)($sk['skor'] ?? 0);
            }
        } else {
            // isian/menjodohkan: skor otomatis sudah ada; hanya boleh update catatan
            if ($catatan !== '') {
                $upd_auto->bind_param('sii', $catatan, $id_sesi, $id_us);
                $upd_auto->execute();
            }
            $q = $conn->prepare("SELECT skor FROM jawaban WHERE id_sesi = ? AND id_ujian_soal = ?");
            $q->bind_param('ii', $id_sesi, $id_us);
            $q->execute();
            $sk = $q->get_result()->fetch_assoc();
            $total += (int)($sk['skor'] ?? 0);
        }
    }

    // total_poin_auto = skor dari jawaban berstatus otomatis
    $q_auto = $conn->prepare("SELECT COALESCE(SUM(skor),0) AS a FROM jawaban WHERE id_sesi = ? AND status_koreksi = 'otomatis'");
    $q_auto->bind_param('i', $id_sesi);
    $q_auto->execute();
    $auto_sum = (int)$q_auto->get_result()->fetch_assoc()['a'];

    $stmt_upd = $conn->prepare("UPDATE sesi_ujian SET status = 'dinilai', total_skor = ?, total_poin_auto = ?, total_poin_manual = ? WHERE id = ?");
    $manual = $total - $auto_sum;
    $stmt_upd->bind_param('iiii', $total, $auto_sum, $manual, $id_sesi);
    $stmt_upd->execute();

    flash_set('sukses', 'Nilai berhasil disimpan.');
    redirect('koreksi_sesi.php?sesi=' . $id_sesi);
}

// Soal + jawaban
$stmt = $conn->prepare("
    SELECT us.id AS id_us, us.id_soal, us.urutan, b.tipe, b.pertanyaan, b.kunci, b.poin, b.petunjuk,
           j.jawaban, j.skor, j.status_koreksi, j.catatan
    FROM ujian_soal us
    JOIN bank_soal b ON b.id = us.id_soal
    LEFT JOIN jawaban j ON j.id_ujian_soal = us.id AND j.id_sesi = ?
    WHERE us.id_ujian = ? ORDER BY us.urutan, us.id
");
$stmt->bind_param('ii', $id_sesi, $sesi['id_ujian']);
$stmt->execute();
$soal_list = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

$title = 'Koreksi Sesi';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Koreksi: <?= e($sesi['nama_lengkap']) ?></h1>
  <a href="nilai.php?ujian=<?= (int)$sesi['id_ujian'] ?>" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Daftar Siswa</a>
</div>

<div class="mt-2 mb-5 flex flex-wrap gap-4 text-sm text-slate-600">
  <span>NIS: <b><?= e($sesi['nis']) ?></b></span>
  <span>Kelas: <b><?= e($sesi['nama_kelas'] ?? '-') ?></b></span>
  <span>Ujian: <b><?= e($sesi['judul']) ?></b></span>
  <span>Skor saat ini: <b class="text-slate-800"><?= (int)$sesi['total_skor'] ?></b></span>
</div>

<?php if ($sesi['status'] === 'dinilai'): ?>
  <div class="mb-5 rounded-lg border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-800">Sesi sudah dinilai. Ubah nilai lalu simpan bila perlu.</div>
<?php endif; ?>

<form method="post">
  <div class="space-y-4">
    <?php foreach ($soal_list as $i => $r): ?>
      <div class="rounded-2xl bg-white p-5 shadow">
        <div class="mb-2 flex items-center justify-between gap-3">
          <div class="flex items-center gap-2">
            <span class="inline-flex rounded-full bg-slate-100 px-3 py-1 text-xs font-medium text-slate-600">Soal <?= $i + 1 ?> · <?= e($r['tipe']) ?></span>
            <?php if ($r['tipe'] === 'essay' && ($r['status_koreksi'] ?? '') === 'manual'): ?>
              <span class="inline-flex rounded-full bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-800">✓ dinilai manual</span>
            <?php elseif ($r['tipe'] !== 'essay' && ($r['status_koreksi'] ?? '') === 'otomatis'): ?>
              <span class="inline-flex rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">✓ koreksi otomatis</span>
            <?php endif; ?>
          </div>
          <span class="text-sm font-medium text-slate-400"><?= (int)$r['poin'] ?> poin</span>
        </div>

        <div class="text-slate-800 whitespace-pre-wrap"><?= e($r['pertanyaan']) ?></div>

        <?php if ($r['tipe'] === 'menjodohkan'): ?>
          <?php
            $stmt_pair = $conn->prepare("SELECT id, kolom_kiri, kolom_kanan FROM pasangan_menjodohkan WHERE id_soal = ? ORDER BY urutan");
            $stmt_pair->bind_param('i', $r['id_soal']);
            $stmt_pair->execute();
            $pairs = $stmt_pair->get_result()->fetch_all(MYSQLI_ASSOC);
            $jawaban_json = json_decode((string)$r['jawaban'], true);
          ?>
          <div class="mt-3 grid grid-cols-1 gap-2 sm:grid-cols-2">
            <?php foreach ($pairs as $pp):
              $kiri_id = (int)$pp['id'];
              $terpilih = is_array($jawaban_json) && isset($jawaban_json[$kiri_id]) ? $jawaban_json[$kiri_id] : null;
              $teks_terpilih = '';
              if ($terpilih !== null && $terpilih !== '') {
                  if (is_numeric($terpilih)) {
                      foreach ($pairs as $pp2) {
                          if ((int)$pp2['id'] === (int)$terpilih) {
                              $teks_terpilih = $pp2['kolom_kanan'];
                              break;
                          }
                      }
                  } else {
                      $teks_terpilih = $terpilih;
                  }
              }
              $benar = ($teks_terpilih !== '' && mb_strtolower(trim($teks_terpilih)) === mb_strtolower(trim($pp['kolom_kanan'])));
            ?>
              <div class="rounded-lg px-3 py-2 text-sm <?= $teks_terpilih === '' ? 'bg-slate-50' : ($benar ? 'bg-green-50' : 'bg-red-50') ?>">
                <div class="font-medium text-slate-700"><?= e($pp['kolom_kiri']) ?></div>
                <div class="mt-0.5 text-slate-600">
                  <span class="<?= $benar ? 'text-green-700' : ($teks_terpilih === '' ? 'text-slate-400' : 'text-red-700') ?>">
                    <?= $teks_terpilih === '' ? '(tidak diisi)' : e($teks_terpilih) ?>
                  </span>
                  <span class="text-xs text-slate-400">· benar: <?= e($pp['kolom_kanan']) ?></span>
                </div>
              </div>
            <?php endforeach; ?>
          </div>
        <?php else: ?>
          <div class="mt-3 rounded-lg bg-slate-50 px-3 py-2 text-sm text-slate-600 whitespace-pre-wrap">
            <span class="font-medium text-slate-500">Jawaban siswa:</span> <?= e($r['jawaban'] !== null && $r['jawaban'] !== '' ? $r['jawaban'] : '(kosong)') ?>
          </div>
        <?php endif; ?>

        <?php if ($r['tipe'] === 'essay'): ?>
          <div class="mt-3 rounded-lg bg-blue-50 px-3 py-2 text-sm text-slate-600">
            <span class="font-medium text-blue-700">Kunci / referensi:</span> <?= e($r['kunci'] ?? '-') ?>
            <?php if (!empty($r['petunjuk'])): ?><div class="mt-1 text-xs text-blue-500">💡 <?= e($r['petunjuk']) ?></div><?php endif; ?>
          </div>
          <div class="mt-3 grid grid-cols-1 gap-3 sm:grid-cols-2">
            <div>
              <label class="mb-1 block text-sm font-medium text-slate-700">Skor (0–<?= (int)$r['poin'] ?>)</label>
              <input type="number" name="skor[<?= (int)$r['id_us'] ?>]" min="0" max="<?= (int)$r['poin'] ?>"
                     value="<?= $r['skor'] !== null ? (int)$r['skor'] : '' ?>"
                     class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
              <input type="hidden" name="poin[<?= (int)$r['id_us'] ?>]" value="<?= (int)$r['poin'] ?>">
            </div>
            <div>
              <label class="mb-1 block text-sm font-medium text-slate-700">Catatan</label>
              <input type="text" name="catatan[<?= (int)$r['id_us'] ?>]" value="<?= e($r['catatan'] ?? '') ?>"
                     class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
            </div>
          </div>
        <?php else: ?>
          <div class="mt-3 flex flex-wrap items-center gap-3">
            <span class="text-sm font-medium text-slate-600">Skor otomatis: <b class="text-green-700"><?= $r['skor'] !== null ? (int)$r['skor'] : 'belum' ?> / <?= (int)$r['poin'] ?></b></span>
            <div class="flex-1 sm:max-w-xs">
              <input type="text" name="catatan[<?= (int)$r['id_us'] ?>]" value="<?= e($r['catatan'] ?? '') ?>" placeholder="Catatan (opsional)"
                     class="w-full rounded-lg border border-slate-300 px-3 py-1.5 text-sm focus:border-indigo-500 focus:outline-none">
            </div>
          </div>
        <?php endif; ?>
      </div>
    <?php endforeach; ?>
  </div>

  <div class="mt-5 flex items-center gap-3">
    <button type="submit" class="rounded-lg bg-indigo-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-indigo-700">Simpan Nilai</button>
    <a href="nilai.php?ujian=<?= (int)$sesi['id_ujian'] ?>" class="rounded-lg border border-slate-300 bg-white px-5 py-2.5 text-sm text-slate-600 hover:bg-slate-50">Batal</a>
  </div>
</form>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>