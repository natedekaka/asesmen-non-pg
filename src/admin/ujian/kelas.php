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
        $id_kelas = (int)($_POST['id_kelas'] ?? 0);
        if ($id_kelas > 0) {
            $stmt = $conn->prepare("INSERT IGNORE INTO ujian_kelas (id_ujian, id_kelas) VALUES (?, ?)");
            $stmt->bind_param('ii', $id, $id_kelas);
            $stmt->execute();
            flash_set('sukses', 'Kelas ditambahkan sebagai peserta.');
        }
    }
    if ($aksi === 'hapus') {
        $id_kelas = (int)($_POST['id_kelas'] ?? 0);
        $stmt = $conn->prepare("DELETE FROM ujian_kelas WHERE id_ujian = ? AND id_kelas = ?");
        $stmt->bind_param('ii', $id, $id_kelas);
        $stmt->execute();
        flash_set('sukses', 'Kelas dihapus dari peserta ujian.');
    }
    redirect('kelas.php?id=' . $id);
}

$stmt = $conn->prepare("SELECT k.* FROM ujian_kelas uk JOIN kelas k ON k.id = uk.id_kelas WHERE uk.id_ujian = ? ORDER BY k.nama_kelas");
$stmt->bind_param('i', $id);
$stmt->execute();
$kelas_terpilih = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

$semua_kelas = $conn->query("SELECT * FROM kelas ORDER BY nama_kelas")->fetch_all(MYSQLI_ASSOC);

$title = 'Kelas Peserta';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Kelas Peserta: <?= e($ujian['judul']) ?></h1>
  <a href="index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Kembali</a>
</div>

<div class="mt-6 grid grid-cols-1 gap-6 lg:grid-cols-2">
  <div class="rounded-2xl bg-white p-5 shadow">
    <h2 class="mb-3 text-sm font-semibold text-slate-700">Kelas peserta saat ini</h2>
    <?php if (!$kelas_terpilih): ?>
      <p class="text-sm text-slate-400">Belum ada kelas terdaftar.</p>
    <?php endif; ?>
    <div class="space-y-2">
      <?php foreach ($kelas_terpilih as $k): ?>
        <div class="flex items-center justify-between rounded-lg border border-slate-200 px-3 py-2 text-sm">
          <span class="text-slate-800"><?= e($k['nama_kelas']) ?></span>
          <form method="post">
            <input type="hidden" name="aksi" value="hapus">
            <input type="hidden" name="id_kelas" value="<?= (int)$k['id'] ?>">
            <button class="text-red-500 hover:text-red-700">✕ Hapus</button>
          </form>
        </div>
      <?php endforeach; ?>
    </div>
  </div>

  <div class="rounded-2xl bg-white p-5 shadow">
    <h2 class="mb-3 text-sm font-semibold text-slate-700">Tambah kelas peserta</h2>
    <div class="space-y-2">
      <?php foreach ($semua_kelas as $k):
        $sudah = in_array($k['id'], array_column($kelas_terpilih, 'id'));
        if ($sudah) continue; ?>
        <form method="post" class="flex items-center justify-between rounded-lg border border-slate-200 px-3 py-2 text-sm">
          <input type="hidden" name="aksi" value="tambah">
          <input type="hidden" name="id_kelas" value="<?= (int)$k['id'] ?>">
          <span class="text-slate-800"><?= e($k['nama_kelas']) ?></span>
          <button class="rounded-lg bg-indigo-600 px-2.5 py-1 text-xs font-medium text-white hover:bg-indigo-700">+ Tambah</button>
        </form>
      <?php endforeach; ?>
      <?php if (count($semua_kelas) === count($kelas_terpilih)): ?>
        <p class="text-sm text-slate-400">Semua kelas sudah terdaftar.</p>
      <?php endif; ?>
    </div>
  </div>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>