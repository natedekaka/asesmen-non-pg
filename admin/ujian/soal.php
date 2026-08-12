<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$id = (int)($_GET['id'] ?? 0);
$conn = db();
$stmt = $conn->prepare("SELECT * FROM ujian WHERE id = ?");
$stmt->bind_param('i', $id);
$stmt->execute();
$ujian = $stmt->get_result()->fetch_assoc();
if (!$ujian) {
    flash_set('error', 'Ujian tidak ditemukan.');
    redirect('index.php');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $aksi = $_POST['aksi'] ?? '';
    if ($aksi === 'tambah') {
        $id_soal = (int)($_POST['id_soal'] ?? 0);
        if ($id_soal > 0) {
            $stmt = $conn->prepare("INSERT IGNORE INTO ujian_soal (id_ujian, id_soal, urutan) VALUES (?, ?, 0)");
            $stmt->bind_param('ii', $id, $id_soal);
            $stmt->execute();
            $conn->query("UPDATE ujian_soal SET urutan = id WHERE id_ujian = " . (int)$id);
            flash_set('sukses', 'Soal ditambahkan.');
        }
    }
    if ($aksi === 'hapus') {
        $id_us = (int)($_POST['id_us'] ?? 0);
        $stmt = $conn->prepare("DELETE FROM ujian_soal WHERE id = ? AND id_ujian = ?");
        $stmt->bind_param('ii', $id_us, $id);
        $stmt->execute();
        flash_set('sukses', 'Soal dihapus dari ujian.');
    }
    redirect('soal.php?id=' . $id);
}

$daftar_us = $conn->prepare("SELECT us.id AS id_us, us.urutan, b.* FROM ujian_soal us JOIN bank_soal b ON b.id = us.id_soal WHERE us.id_ujian = ? ORDER BY us.urutan, us.id");
$daftar_us->bind_param('i', $id);
$daftar_us->execute();
$uji_soal = $daftar_us->get_result()->fetch_all(MYSQLI_ASSOC);

$terpakai = [];
foreach ($uji_soal as $us) {
    $terpakai[] = $us['id'];
}
$belum = [];
if (count($terpakai) > 0) {
    $in = implode(',', array_map('intval', $terpakai));
    $belum = $conn->query("SELECT * FROM bank_soal WHERE id NOT IN ($in) ORDER BY tipe, id DESC")->fetch_all(MYSQLI_ASSOC);
} else {
    $belum = $conn->query("SELECT * FROM bank_soal ORDER BY tipe, id DESC")->fetch_all(MYSQLI_ASSOC);
}

$title = 'Kelola Soal Ujian';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Soal Ujian: <?= e($ujian['judul']) ?></h1>
  <a href="index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Kembali</a>
</div>

<div class="mt-6 grid grid-cols-1 gap-6 lg:grid-cols-2">
  <div class="rounded-2xl bg-white p-5 shadow">
    <h2 class="mb-3 text-sm font-semibold text-slate-700">Soal di dalam ujian</h2>
    <?php if (!$uji_soal): ?>
      <p class="text-sm text-slate-400">Belum ada soal. Pilih dari bank soal di sebelah kanan.</p>
    <?php endif; ?>
    <ol class="space-y-2">
      <?php foreach ($uji_soal as $u): ?>
        <li class="flex items-start justify-between gap-3 rounded-lg border border-slate-200 px-3 py-2 text-sm">
          <div class="flex items-start gap-2">
            <span class="mt-0.5 text-slate-400"><?= (int)$u['urutan'] ?>.</span>
            <div>
              <div class="text-slate-800"><?= e(mb_strimwidth(strip_tags($u['pertanyaan']), 0, 120, '...')) ?></div>
              <div class="mt-0.5"><?= tipe_soal_badge($u['tipe']) ?> <span class="text-slate-400">· <?= (int)$u['poin'] ?> poin</span></div>
            </div>
          </div>
          <form method="post">
            <input type="hidden" name="aksi" value="hapus">
            <input type="hidden" name="id_us" value="<?= (int)$u['id_us'] ?>">
            <button class="text-red-500 hover:text-red-700">✕</button>
          </form>
        </li>
      <?php endforeach; ?>
    </ol>
    <div class="mt-4 border-t border-slate-100 pt-3 text-sm text-slate-500">
      Total soal: <b><?= count($uji_soal) ?></b>
    </div>
  </div>

  <div class="rounded-2xl bg-white p-5 shadow">
    <h2 class="mb-3 text-sm font-semibold text-slate-700">Bank soal tersedia</h2>
    <?php if (!$belum): ?>
      <p class="text-sm text-slate-400">Semua soal sudah masuk ke ujian ini.</p>
    <?php endif; ?>
    <div class="max-h-96 space-y-2 overflow-y-auto pr-1">
      <?php foreach ($belum as $b): ?>
        <form method="post" class="flex items-start justify-between gap-3 rounded-lg border border-slate-200 px-3 py-2 text-sm">
          <input type="hidden" name="aksi" value="tambah">
          <input type="hidden" name="id_soal" value="<?= (int)$b['id'] ?>">
          <div class="flex items-start gap-2">
            <span class="mt-0.5 text-slate-400">#<?= (int)$b['id'] ?></span>
            <div>
              <div class="text-slate-800"><?= e(mb_strimwidth(strip_tags($b['pertanyaan']), 0, 120, '...')) ?></div>
              <div class="mt-0.5"><?= tipe_soal_badge($b['tipe']) ?> <span class="text-slate-400">· <?= (int)$b['poin'] ?> poin</span></div>
            </div>
          </div>
          <button class="rounded-lg bg-indigo-600 px-2.5 py-1 text-xs font-medium text-white hover:bg-indigo-700">+</button>
        </form>
      <?php endforeach; ?>
    </div>
  </div>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>