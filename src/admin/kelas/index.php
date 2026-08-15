<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$conn = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $aksi = $_POST['aksi'] ?? '';
    if ($aksi === 'tambah') {
        $nama = trim($_POST['nama_kelas'] ?? '');
        if ($nama !== '') {
            $stmt = $conn->prepare("INSERT INTO kelas (nama_kelas) VALUES (?)");
            $stmt->bind_param('s', $nama);
            $stmt->execute();
            flash_set('sukses', 'Kelas ditambahkan.');
        }
    }
    if ($aksi === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        $nama = trim($_POST['nama_kelas'] ?? '');
        if ($id > 0 && $nama !== '') {
            $stmt = $conn->prepare("UPDATE kelas SET nama_kelas = ? WHERE id = ?");
            $stmt->bind_param('si', $nama, $id);
            $stmt->execute();
            flash_set('sukses', 'Kelas diperbarui.');
        }
    }
    if ($aksi === 'hapus') {
        $id = (int)($_POST['id'] ?? 0);
        $conn->prepare("DELETE FROM kelas WHERE id = ?")->execute([$id]);
        flash_set('sukses', 'Kelas dihapus.');
    }
    redirect('index.php');
}

$kelas = $conn->query("SELECT k.*, (SELECT COUNT(*) FROM siswa s WHERE s.kelas_id = k.id AND s.is_active = 1) AS jml_siswa FROM kelas k ORDER BY k.nama_kelas")->fetch_all(MYSQLI_ASSOC);

$title = 'Kelas';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Kelas</h1>
</div>

<form method="post" class="mt-5 flex max-w-md items-center gap-2">
  <input type="hidden" name="aksi" value="tambah">
  <input type="text" name="nama_kelas" required placeholder="Nama kelas baru, mis. XII-RPL-1"
         class="flex-1 rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
  <button class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700">+ Tambah</button>
</form>

<div class="mt-5 overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">Nama Kelas</th>
        <th class="px-4 py-3 font-medium">Jumlah Siswa</th>
        <th class="px-4 py-3 font-medium text-right">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (!$kelas): ?>
        <tr><td colspan="3" class="px-4 py-8 text-center text-slate-400">Belum ada kelas.</td></tr>
      <?php endif; ?>
      <?php foreach ($kelas as $k): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3 font-medium text-slate-800"><?= e($k['nama_kelas']) ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$k['jml_siswa'] ?></td>
          <td class="px-4 py-3 text-right whitespace-nowrap space-x-2">
            <button class="text-indigo-600 hover:underline" onclick="document.getElementById('edit-<?= (int)$k['id'] ?>').showModal()">Edit</button>
            <form method="post" class="inline">
              <input type="hidden" name="aksi" value="hapus">
              <input type="hidden" name="id" value="<?= (int)$k['id'] ?>">
              <button class="text-red-600 hover:underline" onclick="return confirm('Hapus kelas ini?')">Hapus</button>
            </form>
          </td>
        </tr>
        <dialog id="edit-<?= (int)$k['id'] ?>" class="rounded-2xl p-6 shadow-xl backdrop:bg-black/30">
          <h3 class="mb-3 text-lg font-semibold text-slate-800">Edit Kelas</h3>
          <form method="post" class="space-y-3">
            <input type="hidden" name="aksi" value="edit">
            <input type="hidden" name="id" value="<?= (int)$k['id'] ?>">
            <input type="text" name="nama_kelas" required value="<?= e($k['nama_kelas']) ?>"
                   class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
            <div class="flex justify-end gap-2">
              <button type="button" class="rounded-lg border border-slate-300 px-3 py-1.5 text-sm" onclick="document.getElementById('edit-<?= (int)$k['id'] ?>').close()">Batal</button>
              <button class="rounded-lg bg-indigo-600 px-4 py-1.5 text-sm text-white hover:bg-indigo-700">Simpan</button>
            </div>
          </form>
        </dialog>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>