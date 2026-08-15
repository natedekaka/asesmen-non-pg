<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();
$ujian_id = (int)($_GET['ujian'] ?? 0);

$ujian_list = $conn->query("SELECT * FROM ujian ORDER BY id DESC")->fetch_all(MYSQLI_ASSOC);

if ($ujian_id > 0) {
    $ujian = $conn->prepare("SELECT * FROM ujian WHERE id = ?");
    $ujian->bind_param('i', $ujian_id);
    $ujian->execute();
    $ujian_data = $ujian->get_result()->fetch_assoc();
    
    if (!$ujian_data) {
        flash_set('error', 'Ujian tidak ditemukan.');
        redirect('/admin/rekap_nilai.php');
    }
    
    $rekap = $conn->prepare("
        SELECT s.*, 
            uj.nis, uj.nama_lengkap, uj.kelas_id,
            k.nama_kelas,
            (SELECT COUNT(*) FROM ujian_soal WHERE id_ujian = ?) AS total_soal,
            (SELECT COALESCE(SUM(b.poin), 0) FROM ujian_soal us JOIN bank_soal b ON b.id = us.id_soal WHERE us.id_ujian = ?) AS total_poin
        FROM sesi_ujian s
        JOIN siswa uj ON uj.id = s.id_siswa
        LEFT JOIN kelas k ON k.id = uj.kelas_id
        WHERE s.id_ujian = ? AND s.status IN ('submitted', 'dinilai')
        ORDER BY k.nama_kelas, uj.nama_lengkap
    ");
    $rekap->bind_param('iii', $ujian_id, $ujian_id, $ujian_id);
    $rekap->execute();
    $rekap_list = $rekap->get_result()->fetch_all(MYSQLI_ASSOC);
} else {
    $ujian_data = null;
    $rekap_list = [];
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $_POST['aksi'] === 'export' && $ujian_id > 0) {
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="rekap_nilai_' . $ujian_id . '_' . date('Y-m-d') . '.csv"');
    $output = fopen('php://output', 'w');
    fputcsv($output, ['NIS', 'Nama Lengkap', 'Kelas', 'Total Skor', 'Skor Auto', 'Skor Manual', 'Status']);
    foreach ($rekap_list as $r) {
        fputcsv($output, [
            $r['nis'], 
            $r['nama_lengkap'], 
            $r['nama_kelas'] ?? '-',
            $r['total_skor'],
            $r['total_poin_auto'],
            $r['total_poin_manual'],
            $r['status']
        ]);
    }
    fclose($output);
    exit;
}

$title = 'Rekap Nilai';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">📊 Rekap Nilai</h1>

<!-- Pilih Ujian -->
<div class="mb-6 rounded-2xl bg-white p-6 shadow">
  <h2 class="mb-4 text-lg font-semibold text-slate-800">Pilih Ujian</h2>
  <div class="flex flex-wrap gap-2">
    <?php foreach ($ujian_list as $u): ?>
      <a href="/admin/rekap_nilai.php?ujian=<?= $u['id'] ?>" 
         class="rounded-lg border <?= $ujian_id === $u['id'] ? 'border-blue-500 bg-blue-50 text-blue-700' : 'border-slate-300 bg-white text-slate-700 hover:bg-slate-50' ?> px-4 py-2 text-sm font-medium">
        <?= e($u['judul']) ?>
      </a>
    <?php endforeach; ?>
  </div>
</div>

<?php if ($ujian_data): ?>
  <!-- Info Ujian -->
  <div class="mb-6 rounded-2xl bg-white p-6 shadow">
    <div class="flex items-start justify-between">
      <div>
        <h2 class="text-xl font-bold text-slate-800"><?= e($ujian_data['judul']) ?></h2>
        <p class="text-sm text-slate-500"><?= e($ujian_data['mata_pelajaran'] ?? 'Umum') ?></p>
      </div>
      <div class="flex gap-2">
        <form method="post" class="inline">
          <input type="hidden" name="aksi" value="export">
          <button type="submit" class="rounded-lg bg-green-600 px-4 py-2 text-sm font-semibold text-white hover:bg-green-700">
            📥 Export CSV
          </button>
        </form>
      </div>
    </div>
    
    <?php
    $total_peserta = count($rekap_list);
    $sudah_dinilai = count(array_filter($rekap_list, fn($r) => $r['status'] === 'dinilai'));
    $rata_rata = 0;
    if ($sudah_dinilai > 0) {
        $total_skor = array_sum(array_column(array_filter($rekap_list, fn($r) => $r['status'] === 'dinilai'), 'total_skor'));
        $rata_rata = $total_skor / $sudah_dinilai;
    }
    ?>
    
    <div class="mt-4 grid grid-cols-3 gap-4">
      <div class="rounded-lg bg-slate-50 p-4 text-center">
        <div class="text-2xl font-bold text-slate-800"><?= $total_peserta ?></div>
        <div class="text-xs text-slate-500">Total Peserta</div>
      </div>
      <div class="rounded-lg bg-green-50 p-4 text-center">
        <div class="text-2xl font-bold text-green-600"><?= $sudah_dinilai ?></div>
        <div class="text-xs text-green-600">Sudah Dinilai</div>
      </div>
      <div class="rounded-lg bg-blue-50 p-4 text-center">
        <div class="text-2xl font-bold text-blue-600"><?= $rata_rata > 0 ? number_format($rata_rata, 1) : '-' ?></div>
        <div class="text-xs text-blue-600">Rata-rata Nilai</div>
      </div>
    </div>
  </div>

  <!-- Tabel Rekap -->
  <div class="overflow-hidden rounded-2xl bg-white shadow">
    <table class="w-full text-left text-sm">
      <thead class="bg-slate-50 text-slate-500">
        <tr>
          <th class="px-4 py-3 font-medium">NIS</th>
          <th class="px-4 py-3 font-medium">Nama Lengkap</th>
          <th class="px-4 py-3 font-medium">Kelas</th>
          <th class="px-4 py-3 font-medium">Total Skor</th>
          <th class="px-4 py-3 font-medium">Skor Auto</th>
          <th class="px-4 py-3 font-medium">Skor Manual</th>
          <th class="px-4 py-3 font-medium">Status</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-slate-100">
        <?php if (empty($rekap_list)): ?>
          <tr><td colspan="7" class="px-4 py-6 text-center text-slate-400">Belum ada peserta yang mengumpulkan.</td></tr>
        <?php endif; ?>
        <?php foreach ($rekap_list as $r): ?>
          <tr class="hover:bg-slate-50">
            <td class="px-4 py-3 font-medium text-slate-800"><?= e($r['nis']) ?></td>
            <td class="px-4 py-3 text-slate-800"><?= e($r['nama_lengkap']) ?></td>
            <td class="px-4 py-3 text-slate-600"><?= e($r['nama_kelas'] ?? '-') ?></td>
            <td class="px-4 py-3">
              <?php if ($r['status'] === 'dinilai'): ?>
                <span class="font-bold <?= $r['total_skor'] >= $r['total_poin'] * 0.7 ? 'text-green-600' : ($r['total_skor'] >= $r['total_poin'] * 0.5 ? 'text-amber-600' : 'text-red-600') ?>">
                  <?= (int)$r['total_skor'] ?> / <?= (int)$r['total_poin'] ?>
                </span>
              <?php else: ?>
                <span class="text-slate-400">-</span>
              <?php endif; ?>
            </td>
            <td class="px-4 py-3 text-slate-600"><?= (int)$r['total_poin_auto'] ?></td>
            <td class="px-4 py-3 text-slate-600"><?= (int)$r['total_poin_manual'] ?></td>
            <td class="px-4 py-3">
              <?php if ($r['status'] === 'dinilai'): ?>
                <span class="inline-flex rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">Dinilai</span>
              <?php else: ?>
                <span class="inline-flex rounded-full bg-amber-100 px-2 py-0.5 text-xs font-medium text-amber-800">Menunggu</span>
              <?php endif; ?>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
<?php endif; ?>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
