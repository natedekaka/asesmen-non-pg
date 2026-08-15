<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$id_sesi = (int)($_GET['sesi'] ?? 0);
$siswa_id = (int)$_SESSION['siswa_id'];
$conn = db();

$stmt = $conn->prepare("
    SELECT s.id, s.status, s.mulai_pada, s.berakhir_pada, s.id_ujian,
           u.judul, u.mata_pelajaran, u.acak_soal, u.durasi_menit
    FROM sesi_ujian s JOIN ujian u ON u.id = s.id_ujian
    WHERE s.id = ? AND s.id_siswa = ?
");
$stmt->bind_param('ii', $id_sesi, $siswa_id);
$stmt->execute();
$sesi = $stmt->get_result()->fetch_assoc();

if (!$sesi) {
    flash_set('error', 'Sesi ujian tidak ditemukan.');
    redirect('index.php');
}
if ($sesi['status'] === 'submitted' || $sesi['status'] === 'dinilai') {
    redirect('hasil.php?ujian=' . $sesi['id_ujian']);
}

// Soal ujian
$stmt = $conn->prepare("
    SELECT us.id AS id_us, us.urutan, b.id AS id_soal, b.tipe, b.pertanyaan, b.kunci, b.poin, b.petunjuk
    FROM ujian_soal us JOIN bank_soal b ON b.id = us.id_soal
    WHERE us.id_ujian = ? ORDER BY us.urutan, us.id
");
$stmt->bind_param('i', $sesi['id_ujian']);
$stmt->execute();
$soal_list = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

if ($sesi && (int)$sesi['acak_soal'] === 1) {
    shuffle($soal_list);
}

// Jawaban tersimpan + pasangan menjodohkan
$jawaban = [];
$stmt = $conn->prepare("SELECT id_ujian_soal, jawaban FROM jawaban WHERE id_sesi = ?");
$stmt->bind_param('i', $id_sesi);
$stmt->execute();
foreach ($stmt->get_result()->fetch_all(MYSQLI_ASSOC) as $j) {
    $jawaban[(int)$j['id_ujian_soal']] = $j['jawaban'];
}

$pasangan_map = [];
$stmt = $conn->prepare("SELECT id, id_soal, kolom_kiri, kolom_kanan FROM pasangan_menjodohkan WHERE id_soal IN (SELECT id_soal FROM ujian_soal WHERE id_ujian = ?) ORDER BY id_soal, urutan");
$stmt->bind_param('i', $sesi['id_ujian']);
$stmt->execute();
foreach ($stmt->get_result()->fetch_all(MYSQLI_ASSOC) as $p) {
    $pasangan_map[(int)$p['id_soal']][] = $p;
}

// Waktu tersisa dalam detik (server-side, lebih akurat)
$sisa_detik = max(0, strtotime($sesi['berakhir_pada']) - time());
?>
<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kerjakan: <?= e($sesi['judul']) ?></title>
<link rel="stylesheet" href="/assets/css/app.css">
<script>
window.ASESMEN_CONFIG = {
  sesiId: <?= (int)$id_sesi ?>,
  ujianId: <?= (int)$sesi['id_ujian'] ?>,
  sisaDetik: <?= (int)$sisa_detik ?>,
  siswaId: <?= (int)$siswa_id ?>,
  csrfToken: <?= json_encode(csrf_token()) ?>
};
</script>
</head>
<body class="bg-gray-100">
<div class="sticky top-0 z-10 border-b border-slate-200 bg-white/95 backdrop-blur">
  <div class="mx-auto flex max-w-6xl items-center justify-between px-4 py-3">
    <div>
      <div class="flex items-baseline gap-2">
        <a href="/siswa/index.php" class="text-lg font-semibold text-slate-800">📝 <?= e($sesi['judul']) ?></a>
        <span class="text-xs text-slate-500"><?= e($sesi['mata_pelajaran'] ?? '') ?></span>
      </div>
      <div class="text-xs text-slate-500" id="status-simpan">Jawaban tersimpan otomatis.</div>
    </div>
    <div class="flex items-center gap-4">
      <div id="badan-timer" class="rounded-xl bg-slate-800 px-4 py-2 text-center">
        <div class="text-[10px] uppercase tracking-wide text-slate-400">Sisa Waktu</div>
        <div id="timer" class="font-mono text-xl font-bold text-white">--:--</div>
      </div>
      <button id="btn-submit" class="rounded-lg bg-green-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-green-700">Kumpulkan</button>
    </div>
  </div>
</div>

<div class="mx-auto max-w-6xl px-4 py-6">
  <div class="grid grid-cols-1 gap-6 lg:grid-cols-[1fr_260px]">
    <div class="space-y-6">
      <?php $no = 1; foreach ($soal_list as $s):
        $id_us = (int)$s['id_us'];
        $jaw = $jawaban[$id_us] ?? '';
        $jaw_obj = ($s['tipe'] === 'menjodohkan' && $jaw !== '') ? json_decode($jaw, true) : [];
      ?>
      <div class="rounded-2xl bg-white p-6 shadow" data-soal="<?= $id_us ?>" data-tipe="<?= $s['tipe'] ?>">
        <div class="mb-3 flex items-center justify-between gap-3">
          <span class="inline-flex rounded-full bg-indigo-50 px-3 py-1 text-xs font-medium text-indigo-700">Soal <?= $no ?> · <?= e(ucfirst($s['tipe'])) ?></span>
          <span class="text-xs font-medium text-slate-400"><?= (int)$s['poin'] ?> poin</span>
        </div>
        <div class="text-slate-800 whitespace-pre-wrap"><?= e($s['pertanyaan']) ?></div>

        <?php if ($s['tipe'] === 'essay'): ?>
          <textarea name="jawaban[<?= $id_us ?>]" rows="6" data-field-jawaban
                    class="mt-4 w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none"
                    placeholder="Tulis jawaban Anda di sini..."><?= e($jaw) ?></textarea>
        <?php elseif ($s['tipe'] === 'isian'): ?>
          <input type="text" name="jawaban[<?= $id_us ?>]" value="<?= e($jaw) ?>" data-field-jawaban
                 class="mt-4 w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none"
                 placeholder="Isi jawaban singkat">
        <?php elseif ($s['tipe'] === 'menjodohkan' && isset($pasangan_map[$s['id_soal']])): ?>
          <?php
            $pasangan = $pasangan_map[$s['id_soal']];
            $opsi_kanan = $pasangan;
            $acak = $pasangan;
            shuffle($acak);
          ?>
          <div class="mt-4 overflow-hidden rounded-xl border border-slate-200">
            <table class="w-full text-left text-sm">
              <thead class="bg-slate-50 text-slate-500">
                <tr>
                  <th class="px-4 py-2 font-medium">No</th>
                  <th class="px-4 py-2 font-medium">Kolom Kiri</th>
                  <th class="px-4 py-2 font-medium">Pasangan (kolom kanan)</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($pasangan as $i => $p):
                  $id_kiri = (int)$p['id'];
                  $terpilih = isset($jaw_obj[$id_kiri]) ? $jaw_obj[$id_kiri] : '';
                ?>
                <tr class="border-t border-slate-100">
                  <td class="px-4 py-2 text-slate-400"><?= $i + 1 ?></td>
                  <td class="px-4 py-2 font-medium text-slate-800"><?= e($p['kolom_kiri']) ?></td>
                  <td class="px-4 py-2">
                    <select data-field-jodoh="<?= $id_kiri ?>" data-soal-owner="<?= $id_us ?>"
                            class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
                      <option value="">— Pilih pasangan —</option>
                      <?php foreach ($acak as $o): ?>
                        <option value="<?= (int)$o['id'] ?>" <?= (string)$terpilih === (string)$o['id'] ? 'selected' : '' ?>><?= e($o['kolom_kanan']) ?></option>
                      <?php endforeach; ?>
                    </select>
                  </td>
                </tr>
                <?php endforeach; ?>
              </tbody>
            </table>
          </div>
        <?php endif; ?>

        <?php if ($s['tipe'] === 'essay' && trim((string)$s['petunjuk'])): ?>
          <p class="mt-3 text-xs text-slate-400">💡 <?= e($s['petunjuk']) ?></p>
        <?php endif; ?>
      </div>
      <?php $no++; endforeach; ?>
    </div>

    <div class="lg:sticky lg:top-24 lg:self-start">
      <div class="rounded-2xl bg-white p-4 shadow">
        <h3 class="mb-3 text-sm font-semibold text-slate-700">Navigasi Soal</h3>
        <div class="grid grid-cols-5 gap-1.5 text-center text-xs" id="nav-nomor"></div>
        <div class="mt-4 border-t border-slate-100 pt-3 text-xs text-slate-400">
          <div class="flex items-center gap-2"><span class="inline-block h-3 w-3 rounded border border-slate-300 bg-white"></span> Belum diisi</div>
          <div class="mt-1 flex items-center gap-2"><span class="inline-block h-3 w-3 rounded border border-green-500 bg-green-100"></span> Sudah diisi</div>
        </div>
        <button id="btn-submit-bawah" class="mt-4 w-full rounded-lg bg-green-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-green-700">Kumpulkan Jawaban</button>
      </div>
    </div>
  </div>
</div>

<dialog id="modal-konfirmasi" class="rounded-2xl p-6 shadow-xl backdrop:bg-black/40 w-full max-w-sm">
  <h3 class="text-lg font-semibold text-slate-800">Kumpulkan ujian?</h3>
  <p id="modal-pesan" class="mt-2 text-sm text-slate-600">Yakin ingin mengumpulkan jawaban? Anda tidak dapat mengubah jawaban setelah dikumpulkan.</p>
  <div class="mt-4 flex justify-end gap-2">
    <button id="btn-batal" class="rounded-lg border border-slate-300 px-4 py-2 text-sm">Batal</button>
    <button id="btn-ya" class="rounded-lg bg-green-600 px-4 py-2 text-sm font-semibold text-white hover:bg-green-700">Ya, Kumpulkan</button>
  </div>
</dialog>

<script src="/assets/js/ujian.js"></script>
</body>
</html>