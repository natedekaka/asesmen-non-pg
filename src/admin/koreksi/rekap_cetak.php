<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$id_ujian = (int)($_GET['ujian'] ?? 0);
$conn = db();

$stmt = $conn->prepare("SELECT * FROM ujian WHERE id = ?");
$stmt->bind_param('i', $id_ujian);
$stmt->execute();
$ujian = $stmt->get_result()->fetch_assoc();
if (!$ujian) {
    flash_set('error', 'Ujian tidak ditemukan.');
    redirect('index.php');
}

$stmt = $conn->prepare("
    SELECT sis.nis, sis.nama_lengkap, k.nama_kelas,
           s.status AS status_sesi, s.total_skor, s.submitted_at
    FROM siswa sis
    LEFT JOIN kelas k ON k.id = sis.kelas_id
    LEFT JOIN sesi_ujian s ON s.id_siswa = sis.id AND s.id_ujian = ?
    LEFT JOIN ujian_kelas uk ON uk.id_ujian = ? AND uk.id_kelas = k.id
    WHERE uk.id_kelas IS NOT NULL
    ORDER BY k.nama_kelas, sis.nis
");
$stmt->bind_param('ii', $id_ujian, $id_ujian);
$stmt->execute();
$daftar = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Rekap Nilai — <?= e($ujian['judul']) ?></title>
<style>
* { box-sizing: border-box; }
body { font-family: 'Segoe UI', Tahoma, Arial, sans-serif; color: #111; margin: 32px; }
h1 { font-size: 20px; margin: 0 0 4px; }
.sub { color: #555; font-size: 13px; margin-bottom: 20px; }
table { width: 100%; border-collapse: collapse; font-size: 13px; }
th, td { border: 1px solid #999; padding: 6px 10px; text-align: left; }
th { background: #eee; }
.num { text-align: right; }
.cetak { margin-top: 20px; display: inline-block; background: #2563eb; color: #fff; text-decoration: none; padding: 8px 18px; border-radius: 6px; font-size: 14px; }
@media print { .cetak { display: none; } }
</style>
</head>
<body>
  <h1>Rekap Nilai: <?= e($ujian['judul']) ?></h1>
  <div class="sub">Dicetak <?= date('d M Y H:i') ?> — <?= e($ujian['mata_pelajaran'] ?? 'Umum') ?></div>
  <table>
    <thead>
      <tr>
        <th>No</th><th>NIS</th><th>Nama</th><th>Kelas</th><th>Status</th><th class="num">Total Skor</th>
      </tr>
    </thead>
    <tbody>
      <?php foreach ($daftar as $i => $d): ?>
        <tr>
          <td><?= $i + 1 ?></td>
          <td><?= e($d['nis']) ?></td>
          <td><?= e($d['nama_lengkap']) ?></td>
          <td><?= e($d['nama_kelas'] ?? '-') ?></td>
          <td><?= $d['status_sesi'] ? ucfirst($d['status_sesi']) : 'Belum' ?></td>
          <td class="num"><?= $d['status_sesi'] ? (int)$d['total_skor'] : '-' ?></td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
  <a href="rekap.php?ujian=<?= (int)$id_ujian ?>" class="cetak">← Kembali</a>
  <script>window.print();</script>
</body>
</html>