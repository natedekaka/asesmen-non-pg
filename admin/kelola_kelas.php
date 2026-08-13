<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $aksi = $_POST['aksi'] ?? '';
    
    if ($aksi === 'tambah') {
        $nama = trim($_POST['nama_kelas'] ?? '');
        if (empty($nama)) {
            flash_set('error', 'Nama kelas harus diisi.');
        } else {
            $stmt = $conn->prepare("INSERT INTO kelas (nama_kelas) VALUES (?)");
            $stmt->bind_param('s', $nama);
            if ($stmt->execute()) {
                flash_set('sukses', 'Kelas berhasil ditambahkan.');
            } else {
                flash_set('error', 'Gagal menambahkan kelas. Nama kelas mungkin sudah ada.');
            }
        }
    } elseif ($aksi === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        $nama = trim($_POST['nama_kelas'] ?? '');
        if (empty($nama)) {
            flash_set('error', 'Nama kelas harus diisi.');
        } else {
            $stmt = $conn->prepare("UPDATE kelas SET nama_kelas = ? WHERE id = ?");
            $stmt->bind_param('si', $nama, $id);
            if ($stmt->execute()) {
                flash_set('sukses', 'Kelas berhasil diperbarui.');
            } else {
                flash_set('error', 'Gagal memperbarui kelas.');
            }
        }
    } elseif ($aksi === 'hapus') {
        $id = (int)($_POST['id'] ?? 0);
        $stmt = $conn->prepare("DELETE FROM kelas WHERE id = ?");
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {
            flash_set('sukses', 'Kelas berhasil dihapus.');
        } else {
            flash_set('error', 'Gagal menghapus kelas. Masih ada siswa di kelas ini.');
        }
    }
    redirect('/admin/kelola_kelas.php');
}

$kelas_list = $conn->query("
    SELECT k.*, COUNT(s.id) AS jml_siswa 
    FROM kelas k 
    LEFT JOIN siswa s ON s.kelas_id = k.id 
    GROUP BY k.id 
    ORDER BY k.nama_kelas
")->fetch_all(MYSQLI_ASSOC);

$title = 'Kelola Kelas';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">Kelola Kelas</h1>

<!-- Form Tambah Kelas -->
<div class="mb-6 rounded-2xl bg-white p-6 shadow">
  <h2 class="mb-4 text-lg font-semibold text-slate-800">Tambah Kelas Baru</h2>
  <form method="post" class="flex gap-3">
    <input type="hidden" name="aksi" value="tambah">
    <input type="text" name="nama_kelas" required placeholder="Contoh: XII-RPL-3"
           class="flex-1 rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
    <button type="submit" class="rounded-lg bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-700">
      + Tambah
    </button>
  </form>
</div>

<!-- Daftar Kelas -->
<div class="overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">Nama Kelas</th>
        <th class="px-4 py-3 font-medium">Jumlah Siswa</th>
        <th class="px-4 py-3 font-medium">Dibuat</th>
        <th class="px-4 py-3 font-medium">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (empty($kelas_list)): ?>
        <tr><td colspan="4" class="px-4 py-6 text-center text-slate-400">Belum ada kelas.</td></tr>
      <?php endif; ?>
      <?php foreach ($kelas_list as $k): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3 font-medium text-slate-800"><?= e($k['nama_kelas']) ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$k['jml_siswa'] ?> siswa</td>
          <td class="px-4 py-3 text-slate-500"><?= (new DateTime($k['created_at']))->format('d M Y') ?></td>
          <td class="px-4 py-3">
            <div class="flex gap-2">
              <button onclick="editKelas(<?= $k['id'] ?>, '<?= e($k['nama_kelas']) ?>')" class="rounded bg-amber-100 px-2 py-1 text-xs font-medium text-amber-800 hover:bg-amber-200">Edit</button>
              <form method="post" class="inline" onsubmit="return confirm('Hapus kelas ini?')">
                <input type="hidden" name="aksi" value="hapus">
                <input type="hidden" name="id" value="<?= $k['id'] ?>">
                <button type="submit" class="rounded bg-red-100 px-2 py-1 text-xs font-medium text-red-800 hover:bg-red-200">Hapus</button>
              </form>
            </div>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<!-- Modal Edit -->
<div id="modal_edit" class="hidden fixed inset-0 z-50 flex items-center justify-center bg-black/50">
  <div class="w-full max-w-md rounded-2xl bg-white p-6 shadow-xl">
    <h3 class="mb-4 text-lg font-semibold text-slate-800">Edit Kelas</h3>
    <form method="post">
      <input type="hidden" name="aksi" value="edit">
      <input type="hidden" name="id" id="edit_id">
      <input type="text" name="nama_kelas" id="edit_nama" required
             class="mb-4 w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
      <div class="flex gap-2">
        <button type="submit" class="rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white hover:bg-blue-700">Simpan</button>
        <button type="button" onclick="document.getElementById('modal_edit').classList.add('hidden')" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">Batal</button>
      </div>
    </form>
  </div>
</div>

<script>
function editKelas(id, nama) {
    document.getElementById('edit_id').value = id;
    document.getElementById('edit_nama').value = nama;
    document.getElementById('modal_edit').classList.remove('hidden');
}
</script>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
