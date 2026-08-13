<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $aksi = $_POST['aksi'] ?? '';
    
    if ($aksi === 'tambah') {
        $judul = trim($_POST['judul'] ?? '');
        $isi = trim($_POST['isi'] ?? '');
        $tipe = $_POST['tipe'] ?? 'umum';
        $id_ujian = (int)($_POST['id_ujian'] ?? 0) ?: null;
        $id_kelas = (int)($_POST['id_kelas'] ?? 0) ?: null;
        
        if (empty($judul) || empty($isi)) {
            flash_set('error', 'Judul dan isi pengumuman harus diisi.');
        } else {
            $stmt = $conn->prepare("INSERT INTO pengumuman (judul, isi, tipe, id_ujian, id_kelas, created_by) VALUES (?, ?, ?, ?, ?, ?)");
            $stmt->bind_param('sssii', $judul, $isi, $tipe, $id_ujian, $id_kelas, $_SESSION['admin_id']);
            if ($stmt->execute()) {
                flash_set('sukses', 'Pengumuman berhasil ditambahkan.');
            } else {
                flash_set('error', 'Gagal menambahkan pengumuman.');
            }
        }
    } elseif ($aksi === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        $judul = trim($_POST['judul'] ?? '');
        $isi = trim($_POST['isi'] ?? '');
        $tipe = $_POST['tipe'] ?? 'umum';
        $id_ujian = (int)($_POST['id_ujian'] ?? 0) ?: null;
        $id_kelas = (int)($_POST['id_kelas'] ?? 0) ?: null;
        $ditampilkan = (int)($_POST['ditampilkan'] ?? 1);
        
        if (empty($judul) || empty($isi)) {
            flash_set('error', 'Judul dan isi pengumuman harus diisi.');
        } else {
            $stmt = $conn->prepare("UPDATE pengumuman SET judul = ?, isi = ?, tipe = ?, id_ujian = ?, id_kelas = ?, ditampilkan = ? WHERE id = ?");
            $stmt->bind_param('sssiiii', $judul, $isi, $tipe, $id_ujian, $id_kelas, $ditampilkan, $id);
            if ($stmt->execute()) {
                flash_set('sukses', 'Pengumuman berhasil diperbarui.');
            } else {
                flash_set('error', 'Gagal memperbarui pengumuman.');
            }
        }
    } elseif ($aksi === 'hapus') {
        $id = (int)($_POST['id'] ?? 0);
        $stmt = $conn->prepare("DELETE FROM pengumuman WHERE id = ?");
        $stmt->bind_param('i', $id);
        if ($stmt->execute()) {
            flash_set('sukses', 'Pengumuman berhasil dihapus.');
        } else {
            flash_set('error', 'Gagal menghapus pengumuman.');
        }
    }
    redirect('/admin/pengumuman.php');
}

$pengumuman_list = $conn->query("
    SELECT p.*, u.judul AS judul_ujian, k.nama_kelas, a.nama_lengkap AS admin_nama
    FROM pengumuman p
    LEFT JOIN ujian u ON u.id = p.id_ujian
    LEFT JOIN kelas k ON k.id = p.id_kelas
    LEFT JOIN admin_users a ON a.id = p.created_by
    ORDER BY p.created_at DESC
")->fetch_all(MYSQLI_ASSOC);

$ujian_list = $conn->query("SELECT id, judul FROM ujian ORDER BY judul")->fetch_all(MYSQLI_ASSOC);
$kelas_list = $conn->query("SELECT id, nama_kelas FROM kelas ORDER BY nama_kelas")->fetch_all(MYSQLI_ASSOC);

$title = 'Kelola Pengumuman';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">Kelola Pengumuman</h1>

<!-- Form Tambah Pengumuman -->
<div class="mb-6 rounded-2xl bg-white p-6 shadow">
  <h2 class="mb-4 text-lg font-semibold text-slate-800">Tambah Pengumuman Baru</h2>
  <form method="post" class="space-y-4">
    <input type="hidden" name="aksi" value="tambah">
    
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Judul</label>
        <input type="text" name="judul" required placeholder="Judul pengumuman"
               class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
      </div>
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Tipe</label>
        <select name="tipe" class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
          <option value="umum">Umum</option>
          <option value="ujian">Ujian</option>
          <option value="penting">Penting</option>
        </select>
      </div>
    </div>
    
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Isi Pengumuman</label>
      <textarea name="isi" rows="4" required placeholder="Tulis isi pengumuman..."
                class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20"></textarea>
    </div>
    
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Ujian Terkait (Opsional)</label>
        <select name="id_ujian" class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
          <option value="0">-- Tidak Terkait Ujian --</option>
          <?php foreach ($ujian_list as $u): ?>
            <option value="<?= $u['id'] ?>"><?= e($u['judul']) ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Kelas Tertentu (Opsional)</label>
        <select name="id_kelas" class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
          <option value="0">-- Semua Kelas --</option>
          <?php foreach ($kelas_list as $k): ?>
            <option value="<?= $k['id'] ?>"><?= e($k['nama_kelas']) ?></option>
          <?php endforeach; ?>
        </select>
      </div>
    </div>
    
    <button type="submit" class="rounded-lg bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-700">
      + Tambah Pengumuman
    </button>
  </form>
</div>

<!-- Daftar Pengumuman -->
<div class="overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">Judul</th>
        <th class="px-4 py-3 font-medium">Tipe</th>
        <th class="px-4 py-3 font-medium">Ujian</th>
        <th class="px-4 py-3 font-medium">Kelas</th>
        <th class="px-4 py-3 font-medium">Status</th>
        <th class="px-4 py-3 font-medium">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (empty($pengumuman_list)): ?>
        <tr><td colspan="6" class="px-4 py-6 text-center text-slate-400">Belum ada pengumuman.</td></tr>
      <?php endif; ?>
      <?php foreach ($pengumuman_list as $p): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3">
            <div class="font-medium text-slate-800"><?= e($p['judul']) ?></div>
            <div class="text-xs text-slate-500 line-clamp-1"><?= e($p['isi']) ?></div>
          </td>
          <td class="px-4 py-3">
            <span class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium <?= $p['tipe'] === 'penting' ? 'bg-red-100 text-red-800' : ($p['tipe'] === 'ujian' ? 'bg-blue-100 text-blue-800' : 'bg-slate-100 text-slate-800') ?>">
              <?= e(ucfirst($p['tipe'])) ?>
            </span>
          </td>
          <td class="px-4 py-3 text-slate-600"><?= e($p['judul_ujian'] ?? '-') ?></td>
          <td class="px-4 py-3 text-slate-600"><?= e($p['nama_kelas'] ?? 'Semua') ?></td>
          <td class="px-4 py-3">
            <?php if ($p['ditampilkan']): ?>
              <span class="inline-flex rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">Ditampilkan</span>
            <?php else: ?>
              <span class="inline-flex rounded-full bg-slate-100 px-2 py-0.5 text-xs font-medium text-slate-600">Disembunyikan</span>
            <?php endif; ?>
          </td>
          <td class="px-4 py-3">
            <div class="flex gap-2">
              <button onclick="editPengumuman(<?= $p['id'] ?>, '<?= e($p['judul']) ?>', '<?= e($p['isi']) ?>', '<?= $p['tipe'] ?>', <?= $p['id_ujian'] ?? 0 ?>, <?= $p['id_kelas'] ?? 0 ?>, <?= $p['ditampilkan'] ?>)" class="rounded bg-amber-100 px-2 py-1 text-xs font-medium text-amber-800 hover:bg-amber-200">Edit</button>
              <form method="post" class="inline" onsubmit="return confirm('Hapus pengumuman ini?')">
                <input type="hidden" name="aksi" value="hapus">
                <input type="hidden" name="id" value="<?= $p['id'] ?>">
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
  <div class="w-full max-w-lg rounded-2xl bg-white p-6 shadow-xl max-h-[90vh] overflow-y-auto">
    <h3 class="mb-4 text-lg font-semibold text-slate-800">Edit Pengumuman</h3>
    <form method="post" class="space-y-4">
      <input type="hidden" name="aksi" value="edit">
      <input type="hidden" name="id" id="edit_id">
      
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Judul</label>
        <input type="text" name="judul" id="edit_judul" required
               class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
      </div>
      
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Isi</label>
        <textarea name="isi" id="edit_isi" rows="4" required
                  class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20"></textarea>
      </div>
      
      <div class="grid grid-cols-2 gap-4">
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">Tipe</label>
          <select name="tipe" id="edit_tipe" class="w-full rounded-lg border border-slate-300 px-3 py-2.5">
            <option value="umum">Umum</option>
            <option value="ujian">Ujian</option>
            <option value="penting">Penting</option>
          </select>
        </div>
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">Status</label>
          <select name="ditampilkan" id="edit_ditampilkan" class="w-full rounded-lg border border-slate-300 px-3 py-2.5">
            <option value="1">Ditampilkan</option>
            <option value="0">Disembunyikan</option>
          </select>
        </div>
      </div>
      
      <div class="flex gap-2">
        <button type="submit" class="rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white hover:bg-blue-700">Simpan</button>
        <button type="button" onclick="document.getElementById('modal_edit').classList.add('hidden')" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">Batal</button>
      </div>
    </form>
  </div>
</div>

<script>
function editPengumuman(id, judul, isi, tipe, ujian, kelas, ditampilkan) {
    document.getElementById('edit_id').value = id;
    document.getElementById('edit_judul').value = judul;
    document.getElementById('edit_isi').value = isi;
    document.getElementById('edit_tipe').value = tipe;
    document.getElementById('edit_ditampilkan').value = ditampilkan;
    document.getElementById('modal_edit').classList.remove('hidden');
}
</script>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
