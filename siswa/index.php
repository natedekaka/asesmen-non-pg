<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$conn = db();
$siswa_id = (int)$_SESSION['siswa_id'];

// Ambil kelas siswa
$kelas = $conn->prepare("SELECT kelas_id FROM siswa WHERE id = ?");
$kelas->bind_param('i', $siswa_id);
$kelas->execute();
$kelas_id = (int)$kelas->get_result()->fetch_assoc()['kelas_id'];

// Ujian aktif utk kelas siswa
$ujian = [];
if ($kelas_id > 0) {
    $stmt = $conn->prepare("
        SELECT u.*,
            (SELECT s.status FROM sesi_ujian s WHERE s.id_ujian = u.id AND s.id_siswa = ?) AS status_sesi,
            (SELECT s.id FROM sesi_ujian s WHERE s.id_ujian = u.id AND s.id_siswa = ?) AS id_sesi,
            (SELECT s.submitted_at FROM sesi_ujian s WHERE s.id_ujian = u.id AND s.id_siswa = ?) AS submitted_at,
            (SELECT COUNT(*) FROM ujian_soal us WHERE us.id_ujian = u.id) AS jml_soal,
            (SELECT COALESCE(SUM(b.poin),0) FROM ujian_soal us JOIN bank_soal b ON b.id = us.id_soal WHERE us.id_ujian = u.id) AS total_poin
        FROM ujian u
        JOIN ujian_kelas uk ON uk.id_ujian = u.id
        WHERE uk.id_kelas = ? AND u.status = 'aktif'
        ORDER BY u.id DESC
    ");
    $stmt->bind_param('iiii', $siswa_id, $siswa_id, $siswa_id, $kelas_id);
    $stmt->execute();
    $ujian = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
}

$riwayat = $conn->prepare("
    SELECT u.judul, u.mata_pelajaran, s.status, s.total_skor, s.submitted_at, u.tampilkan_hasil
    FROM sesi_ujian s JOIN ujian u ON u.id = s.id_ujian
    WHERE s.id_siswa = ? AND s.status IN ('submitted','dinilai')
    ORDER BY s.submitted_at DESC LIMIT 20
");
$riwayat->bind_param('i', $siswa_id);
$riwayat->execute();
$riwayat_list = $riwayat->get_result()->fetch_all(MYSQLI_ASSOC);

$title = 'Beranda';
require __DIR__ . '/../views/layout_siswa_top.php';
?>

<h1 class="mb-1 text-2xl font-bold text-slate-800">Halo, <?= e($_SESSION['siswa_nama']) ?> 👋</h1>
<p class="mb-6 text-sm text-slate-500">Berikut ujian yang tersedia untuk kelas Anda.</p>

<div class="grid grid-cols-1 gap-4 lg:grid-cols-2">
  <?php if (!$ujian): ?>
    <div class="rounded-2xl border border-dashed border-slate-300 bg-white p-8 text-center text-slate-400 lg:col-span-2">
      Saat ini belum ada ujian aktif untuk kelas Anda.
    </div>
  <?php endif; ?>

  <?php foreach ($ujian as $u):
    $dalam_jendela = true;
    if ($u['tanggal_mulai'] && strtotime($u['tanggal_mulai']) > time()) $dalam_jendela = false;
    if ($u['tanggal_selesai'] && strtotime($u['tanggal_selesai']) < time()) $dalam_jendela = false;
  ?>
    <div class="rounded-2xl bg-white p-5 shadow">
      <div class="flex items-start justify-between gap-3">
        <div>
          <h2 class="text-lg font-semibold text-slate-800"><?= e($u['judul']) ?></h2>
          <p class="text-sm text-slate-500"><?= e($u['mata_pelajaran'] ?? 'Umum') ?></p>
        </div>
        <?php if ($u['status_sesi'] === 'dinilai'): ?>
          <span class="rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">Selesai & Dinilai</span>
        <?php elseif ($u['status_sesi'] === 'submitted'): ?>
          <span class="rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">Menunggu Koreksi</span>
        <?php elseif ($u['status_sesi'] === 'berlangsung'): ?>
          <span class="rounded-full bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-800">Sedang Berlangsung</span>
        <?php else: ?>
          <span class="rounded-full bg-slate-100 px-2 py-0.5 text-xs font-medium text-slate-600">Baru</span>
        <?php endif; ?>
      </div>

      <p class="mt-2 text-sm text-slate-600"><?= e($u['deskripsi'] ?? '-') ?></p>

      <div class="mt-3 grid grid-cols-3 gap-2 text-center text-xs">
        <div class="rounded-lg bg-slate-50 px-2 py-2">
          <div class="font-semibold text-slate-800"><?= (int)$u['jml_soal'] ?></div>
          <div class="text-slate-400">Soal</div>
        </div>
        <div class="rounded-lg bg-slate-50 px-2 py-2">
          <div class="font-semibold text-slate-800"><?= (int)$u['durasi_menit'] ?> mnt</div>
          <div class="text-slate-400">Durasi</div>
        </div>
        <div class="rounded-lg bg-slate-50 px-2 py-2">
          <div class="font-semibold text-slate-800"><?= (int)$u['total_poin'] ?></div>
          <div class="text-slate-400">Poin</div>
        </div>
      </div>

      <div class="mt-4">
        <?php if ($u['status_sesi'] === 'berlangsung' && $u['id_sesi']): ?>
          <a href="ujian.php?sesi=<?= (int)$u['id_sesi'] ?>" class="inline-block w-full rounded-lg bg-amber-500 px-4 py-2.5 text-center text-sm font-semibold text-white hover:bg-amber-600">Lanjutkan Ujian</a>
        <?php elseif ($u['status_sesi'] === 'submitted'): ?>
          <div class="rounded-lg bg-slate-50 px-4 py-2.5 text-center text-sm text-slate-600">Jawaban telah dikumpulkan — menunggu koreksi</div>
        <?php elseif ($u['status_sesi'] === 'dinilai'): ?>
          <a href="hasil.php?ujian=<?= (int)$u['id'] ?>" class="inline-block w-full rounded-lg bg-green-600 px-4 py-2.5 text-center text-sm font-semibold text-white hover:bg-green-700">Lihat Hasil</a>
        <?php elseif ($dalam_jendela): ?>
          <a href="mulai_ujian.php?ujian=<?= (int)$u['id'] ?>" class="inline-block w-full rounded-lg bg-indigo-600 px-4 py-2.5 text-center text-sm font-semibold text-white hover:bg-indigo-700">Mulai Ujian</a>
        <?php else: ?>
          <div class="rounded-lg bg-slate-100 px-4 py-2.5 text-center text-sm text-slate-500">Belum waktunya / sudah lewat</div>
        <?php endif; ?>
      </div>
    </div>
  <?php endforeach; ?>
</div>

<?php if ($riwayat_list): ?>
<div class="mt-10">
  <h2 class="mb-3 text-lg font-semibold text-slate-800">Riwayat Asesmen</h2>
  <div class="overflow-hidden rounded-2xl bg-white shadow">
    <table class="w-full text-left text-sm">
      <thead class="bg-slate-50 text-slate-500">
        <tr>
          <th class="px-4 py-3 font-medium">Ujian</th>
          <th class="px-4 py-3 font-medium">Mapel</th>
          <th class="px-4 py-3 font-medium">Status</th>
          <th class="px-4 py-3 font-medium">Skor</th>
          <th class="px-4 py-3 font-medium">Dikumpulkan</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-slate-100">
        <?php foreach ($riwayat_list as $r): ?>
          <tr class="hover:bg-slate-50">
            <td class="px-4 py-3 font-medium text-slate-800"><?= e($r['judul']) ?></td>
            <td class="px-4 py-3 text-slate-600"><?= e($r['mata_pelajaran'] ?? '-') ?></td>
            <td class="px-4 py-3">
              <?php if ($r['status'] === 'dinilai'): ?>
                <span class="inline-flex rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">Dinilai</span>
              <?php else: ?>
                <span class="inline-flex rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">Menunggu koreksi</span>
              <?php endif; ?>
            </td>
            <td class="px-4 py-3 text-slate-700"><?= $r['status'] === 'dinilai' ? (int)$r['total_skor'] : '-' ?></td>
            <td class="px-4 py-3 text-slate-600"><?= $r['submitted_at'] ? (new DateTime($r['submitted_at']))->format('d M Y H:i') : '-' ?></td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</div>
<?php endif; ?>

<?php require __DIR__ . '/../views/layout_siswa_bottom.php'; ?>