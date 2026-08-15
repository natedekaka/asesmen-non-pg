<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$conn = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $aksi = $_POST['aksi'] ?? '';
    if ($aksi === 'tambah') {
        $nis = trim($_POST['nis'] ?? '');
        $nama = trim($_POST['nama_lengkap'] ?? '');
        $kelas_id = (int)($_POST['kelas_id'] ?? 0);
        $pass = trim($_POST['password'] ?? '');
        if ($nis === '' || $nama === '') {
            flash_set('error', 'NIS dan nama wajib diisi.');
        } else {
            $password = $pass !== '' ? $pass : $nis;
            $hash = password_hash($password, PASSWORD_BCRYPT);
            $stmt = $conn->prepare("INSERT INTO siswa (nis, nama_lengkap, password, kelas_id) VALUES (?, ?, ?, ?)");
            $stmt->bind_param('sssi', $nis, $nama, $hash, $kelas_id);
            $stmt->execute();
            flash_set('sukses', "Siswa $nis ($nama) ditambahkan.");
        }
    }
    if ($aksi === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        $nis = trim($_POST['nis'] ?? '');
        $nama = trim($_POST['nama_lengkap'] ?? '');
        $kelas_id = (int)($_POST['kelas_id'] ?? 0);
        $pass = trim($_POST['password'] ?? '');
        if ($nis === '' || $nama === '') {
            flash_set('error', 'NIS dan nama wajib diisi.');
        } else {
            if ($pass !== '') {
                $hash = password_hash($pass, PASSWORD_BCRYPT);
                $stmt = $conn->prepare("UPDATE siswa SET nis=?, nama_lengkap=?, kelas_id=?, password=? WHERE id=?");
                $stmt->bind_param('ssisi', $nis, $nama, $kelas_id, $hash, $id);
            } else {
                $stmt = $conn->prepare("UPDATE siswa SET nis=?, nama_lengkap=?, kelas_id=? WHERE id=?");
                $stmt->bind_param('ssii', $nis, $nama, $kelas_id, $id);
            }
            $stmt->execute();
            flash_set('sukses', 'Data siswa diperbarui.');
        }
    }
    if ($aksi === 'hapus') {
        $id = (int)($_POST['id'] ?? 0);
        $conn->prepare("DELETE FROM siswa WHERE id = ?")->execute([$id]);
        flash_set('sukses', 'Siswa dihapus.');
    }
    redirect('index.php');
}

$kelas = $conn->query("SELECT * FROM kelas ORDER BY nama_kelas")->fetch_all(MYSQLI_ASSOC);
$cari = trim($_GET['q'] ?? '');
if ($cari !== '') {
    $stmt = $conn->prepare("SELECT s.*, k.nama_kelas FROM siswa s LEFT JOIN kelas k ON k.id = s.kelas_id WHERE s.nis LIKE ? OR s.nama_lengkap LIKE ? ORDER BY s.nis LIMIT 200");
    $like = "%$cari%";
    $stmt->bind_param('ss', $like, $like);
    $stmt->execute();
    $siswa = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
} else {
    $siswa = $conn->query("SELECT s.*, k.nama_kelas FROM siswa s LEFT JOIN kelas k ON k.id = s.kelas_id ORDER BY s.nis DESC LIMIT 200")->fetch_all(MYSQLI_ASSOC);
}

$title = 'Siswa';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Siswa</h1>
  <button onclick="document.getElementById('modal-tambah').showModal()" class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700">+ Tambah Siswa</button>
</div>

<form method="get" class="mt-4 flex max-w-md items-center gap-2">
  <input type="text" name="q" value="<?= e($cari) ?>" placeholder="Cari NIS / nama..."
         class="flex-1 rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
  <button class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">Cari</button>
</form>

<div class="mt-5 overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">NIS</th>
        <th class="px-4 py-3 font-medium">Nama</th>
        <th class="px-4 py-3 font-medium">Kelas</th>
        <th class="px-4 py-3 font-medium">Status</th>
        <th class="px-4 py-3 font-medium text-right">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (!$siswa): ?>
        <tr><td colspan="5" class="px-4 py-8 text-center text-slate-400">Tidak ada siswa.</td></tr>
      <?php endif; ?>
      <?php foreach ($siswa as $s): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3 font-mono text-slate-800"><?= e($s['nis']) ?></td>
          <td class="px-4 py-3 text-slate-800"><?= e($s['nama_lengkap']) ?></td>
          <td class="px-4 py-3 text-slate-600"><?= e($s['nama_kelas'] ?? '-') ?></td>
          <td class="px-4 py-3">
            <span class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium <?= $s['is_active'] ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-700' ?>">
              <?= $s['is_active'] ? 'Aktif' : 'Nonaktif' ?>
            </span>
          </td>
          <td class="px-4 py-3 text-right whitespace-nowrap space-x-2">
            <button class="text-indigo-600 hover:underline" onclick="document.getElementById('modal-<?= (int)$s['id'] ?>').showModal()">Edit</button>
            <form method="post" class="inline">
              <input type="hidden" name="aksi" value="hapus">
              <input type="hidden" name="id" value="<?= (int)$s['id'] ?>">
              <button class="text-red-600 hover:underline" onclick="return confirm('Hapus siswa ini beserta seluruh riwayat ujiannya?')">Hapus</button>
            </form>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<dialog id="modal-tambah" class="rounded-2xl p-6 shadow-xl backdrop:bg-black/30 w-full max-w-md">
  <h3 class="mb-3 text-lg font-semibold text-slate-800">Tambah Siswa</h3>
  <form method="post" class="space-y-3">
    <input type="hidden" name="aksi" value="tambah">
    <input type="text" name="nis" required placeholder="NIS" class="w-full rounded-lg border border-slate-300 px-3 py-2">
    <input type="text" name="nama_lengkap" required placeholder="Nama lengkap" class="w-full rounded-lg border border-slate-300 px-3 py-2">
    <select name="kelas_id" class="w-full rounded-lg border border-slate-300 px-3 py-2">
      <option value="0">— Tanpa kelas —</option>
      <?php foreach ($kelas as $k): ?>
        <option value="<?= (int)$k['id'] ?>"><?= e($k['nama_kelas']) ?></option>
      <?php endforeach; ?>
    </select>
    <input type="text" name="password" placeholder="Kata sandi awal (kosong = NIS)" class="w-full rounded-lg border border-slate-300 px-3 py-2">
    <div class="flex justify-end gap-2">
      <button type="button" class="rounded-lg border border-slate-300 px-3 py-1.5 text-sm" onclick="document.getElementById('modal-tambah').close()">Batal</button>
      <button class="rounded-lg bg-indigo-600 px-4 py-1.5 text-sm text-white hover:bg-indigo-700">Simpan</button>
    </div>
  </form>
</dialog>

<?php foreach ($siswa as $s): ?>
<dialog id="modal-<?= (int)$s['id'] ?>" class="rounded-2xl p-6 shadow-xl backdrop:bg-black/30 w-full max-w-md">
  <h3 class="mb-3 text-lg font-semibold text-slate-800">Edit Siswa</h3>
  <form method="post" class="space-y-3">
    <input type="hidden" name="aksi" value="edit">
    <input type="hidden" name="id" value="<?= (int)$s['id'] ?>">
    <input type="text" name="nis" required value="<?= e($s['nis']) ?>" class="w-full rounded-lg border border-slate-300 px-3 py-2">
    <input type="text" name="nama_lengkap" required value="<?= e($s['nama_lengkap']) ?>" class="w-full rounded-lg border border-slate-300 px-3 py-2">
    <select name="kelas_id" class="w-full rounded-lg border border-slate-300 px-3 py-2">
      <option value="0">— Tanpa kelas —</option>
      <?php foreach ($kelas as $k): ?>
        <option value="<?= (int)$k['id'] ?>" <?= (int)$s['kelas_id'] === (int)$k['id'] ? 'selected' : '' ?>><?= e($k['nama_kelas']) ?></option>
      <?php endforeach; ?>
    </select>
    <input type="text" name="password" placeholder="Kata sandi baru (kosong = tidak diubah)" class="w-full rounded-lg border border-slate-300 px-3 py-2">
    <div class="flex justify-end gap-2">
      <button type="button" class="rounded-lg border border-slate-300 px-3 py-1.5 text-sm" onclick="document.getElementById('modal-<?= (int)$s['id'] ?>').close()">Batal</button>
      <button class="rounded-lg bg-indigo-600 px-4 py-1.5 text-sm text-white hover:bg-indigo-700">Simpan</button>
    </div>
  </form>
</dialog>
<?php endforeach; ?>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>