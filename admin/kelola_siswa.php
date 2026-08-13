<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();
$aksi = $_GET['aksi'] ?? 'list';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $post_aksi = $_POST['aksi'] ?? '';
    
    if ($post_aksi === 'tambah') {
        $nis = trim($_POST['nis'] ?? '');
        $nama = trim($_POST['nama_lengkap'] ?? '');
        $kelas_id = (int)($_POST['kelas_id'] ?? 0);
        $password = password_encode($nis);
        
        if (empty($nis) || empty($nama)) {
            flash_set('error', 'NIS dan nama lengkap harus diisi.');
        } else {
            $stmt = $conn->prepare("INSERT INTO siswa (nis, nama_lengkap, password, kelas_id) VALUES (?, ?, ?, ?)");
            $stmt->bind_param('sssi', $nis, $nama, $password, $kelas_id);
            if ($stmt->execute()) {
                flash_set('sukses', 'Siswa berhasil ditambahkan.');
                redirect('/admin/kelola_siswa.php');
            } else {
                flash_set('error', 'Gagal menambahkan siswa. NIS mungkin sudah ada.');
            }
        }
    } elseif ($post_aksi === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        $nis = trim($_POST['nis'] ?? '');
        $nama = trim($_POST['nama_lengkap'] ?? '');
        $kelas_id = (int)($_POST['kelas_id'] ?? 0);
        $is_active = (int)($_POST['is_active'] ?? 1);
        
        if (empty($nis) || empty($nama)) {
            flash_set('error', 'NIS dan nama lengkap harus diisi.');
        } else {
            $stmt = $conn->prepare("UPDATE siswa SET nis = ?, nama_lengkap = ?, kelas_id = ?, is_active = ? WHERE id = ?");
            $stmt->bind_param('ssiii', $nis, $nama, $kelas_id, $is_active, $id);
            if ($stmt->execute()) {
                flash_set('sukses', 'Data siswa berhasil diperbarui.');
                redirect('/admin/kelola_siswa.php');
            } else {
                flash_set('error', 'Gagal memperbarui data siswa.');
            }
        }
    } elseif ($post_aksi === 'reset_password') {
        $id = (int)($_POST['id'] ?? 0);
        $nis = $_POST['nis'] ?? '';
        $password_baru = password_hash($nis, PASSWORD_DEFAULT);
        
        $stmt = $conn->prepare("UPDATE siswa SET password = ? WHERE id = ?");
        $stmt->bind_param('si', $password_baru, $id);
        if ($stmt->execute()) {
            flash_set('sukses', 'Password siswa berhasil direset ke NIS.');
        } else {
            flash_set('error', 'Gagal mereset password.');
        }
        redirect('/admin/kelola_siswa.php');
    } elseif ($post_aksi === 'import') {
        if (isset($_FILES['csv_file']) && $_FILES['csv_file']['error'] === UPLOAD_ERR_OK) {
            $file = fopen($_FILES['csv_file']['tmp_name'], 'r');
            $header = fgetcsv($file);
            $imported = 0;
            $errors = 0;
            
            while (($row = fgetcsv($file)) !== false) {
                if (count($row) >= 3) {
                    $nis = trim($row[0]);
                    $nama = trim($row[1]);
                    $kelas_nama = trim($row[2]);
                    
                    // Cari atau buat kelas
                    $stmt = $conn->prepare("SELECT id FROM kelas WHERE nama_kelas = ?");
                    $stmt->bind_param('s', $kelas_nama);
                    $stmt->execute();
                    $kelas = $stmt->get_result()->fetch_assoc();
                    
                    if (!$kelas) {
                        $stmt = $conn->prepare("INSERT INTO kelas (nama_kelas) VALUES (?)");
                        $stmt->bind_param('s', $kelas_nama);
                        $stmt->execute();
                        $kelas_id = $conn->insert_id;
                    } else {
                        $kelas_id = $kelas['id'];
                    }
                    
        $password = password_hash($nis, PASSWORD_DEFAULT);
                    $stmt = $conn->prepare("INSERT INTO siswa (nis, nama_lengkap, password, kelas_id) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE nama_lengkap = VALUES(nama_lengkap), kelas_id = VALUES(kelas_id)");
                    $stmt->bind_param('sssi', $nis, $nama, $password, $kelas_id);
                    if ($stmt->execute()) {
                        $imported++;
                    } else {
                        $errors++;
                    }
                }
            }
            fclose($file);
            
            flash_set('sukses', "Import selesai: $imported siswa berhasil, $errors gagal.");
        } else {
            flash_set('error', 'Gagal mengupload file CSV.');
        }
        redirect('/admin/kelola_siswa.php');
    }
}

if ($aksi === 'tambah' || $aksi === 'edit') {
    $siswa = null;
    if ($aksi === 'edit') {
        $id = (int)($_GET['id'] ?? 0);
        $stmt = $conn->prepare("SELECT * FROM siswa WHERE id = ?");
        $stmt->bind_param('i', $id);
        $stmt->execute();
        $siswa = $stmt->get_result()->fetch_assoc();
        if (!$siswa) {
            flash_set('error', 'Siswa tidak ditemukan.');
            redirect('/admin/kelola_siswa.php');
        }
    }
    
    $kelas_list = $conn->query("SELECT * FROM kelas ORDER BY nama_kelas")->fetch_all(MYSQLI_ASSOC);
}

$siswa_list = $conn->query("
    SELECT s.*, k.nama_kelas 
    FROM siswa s 
    LEFT JOIN kelas k ON k.id = s.kelas_id 
    ORDER BY s.nama_lengkap
")->fetch_all(MYSQLI_ASSOC);

$title = 'Kelola Siswa';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">Kelola Siswa</h1>

<?php if ($aksi === 'list'): ?>
  <div class="mb-4 flex flex-wrap gap-2">
    <a href="/admin/kelola_siswa.php?aksi=tambah" class="rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white hover:bg-blue-700">
      + Tambah Siswa
    </a>
    <button onclick="document.getElementById('modal_import').classList.remove('hidden')" class="rounded-lg bg-green-600 px-4 py-2 text-sm font-semibold text-white hover:bg-green-700">
      📥 Import CSV
    </button>
    <a href="/admin/kelola_siswa.php?aksi=export" class="rounded-lg bg-slate-600 px-4 py-2 text-sm font-semibold text-white hover:bg-slate-700">
      📤 Export CSV
    </a>
  </div>

  <div class="overflow-hidden rounded-2xl bg-white shadow">
    <table class="w-full text-left text-sm">
      <thead class="bg-slate-50 text-slate-500">
        <tr>
          <th class="px-4 py-3 font-medium">NIS</th>
          <th class="px-4 py-3 font-medium">Nama Lengkap</th>
          <th class="px-4 py-3 font-medium">Kelas</th>
          <th class="px-4 py-3 font-medium">Status</th>
          <th class="px-4 py-3 font-medium">Aksi</th>
        </tr>
      </thead>
      <tbody class="divide-y divide-slate-100">
        <?php if (empty($siswa_list)): ?>
          <tr><td colspan="5" class="px-4 py-6 text-center text-slate-400">Belum ada siswa.</td></tr>
        <?php endif; ?>
        <?php foreach ($siswa_list as $s): ?>
          <tr class="hover:bg-slate-50">
            <td class="px-4 py-3 font-medium text-slate-800"><?= e($s['nis']) ?></td>
            <td class="px-4 py-3 text-slate-800"><?= e($s['nama_lengkap']) ?></td>
            <td class="px-4 py-3 text-slate-600"><?= e($s['nama_kelas'] ?? '-') ?></td>
            <td class="px-4 py-3">
              <?php if ($s['is_active']): ?>
                <span class="inline-flex rounded-full bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800">Aktif</span>
              <?php else: ?>
                <span class="inline-flex rounded-full bg-red-100 px-2 py-0.5 text-xs font-medium text-red-800">Nonaktif</span>
              <?php endif; ?>
            </td>
            <td class="px-4 py-3">
              <div class="flex gap-2">
                <a href="/admin/kelola_siswa.php?aksi=edit&id=<?= $s['id'] ?>" class="rounded bg-amber-100 px-2 py-1 text-xs font-medium text-amber-800 hover:bg-amber-200">Edit</a>
                <form method="post" class="inline" onsubmit="return confirm('Reset password siswa ini ke NIS?')">
                  <input type="hidden" name="aksi" value="reset_password">
                  <input type="hidden" name="id" value="<?= $s['id'] ?>">
                  <input type="hidden" name="nis" value="<?= e($s['nis']) ?>">
                  <button type="submit" class="rounded bg-slate-100 px-2 py-1 text-xs font-medium text-slate-700 hover:bg-slate-200">Reset Pass</button>
                </form>
              </div>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>

  <!-- Modal Import -->
  <div id="modal_import" class="hidden fixed inset-0 z-50 flex items-center justify-center bg-black/50">
    <div class="w-full max-w-md rounded-2xl bg-white p-6 shadow-xl">
      <h3 class="mb-4 text-lg font-semibold text-slate-800">Import Siswa dari CSV</h3>
      <p class="mb-4 text-sm text-slate-500">Format CSV: <code>nis,nama_lengkap,kelas</code></p>
      <form method="post" enctype="multipart/form-data">
        <input type="hidden" name="aksi" value="import">
        <input type="file" name="csv_file" accept=".csv" required class="mb-4 w-full text-sm">
        <div class="flex gap-2">
          <button type="submit" class="rounded-lg bg-green-600 px-4 py-2 text-sm font-semibold text-white hover:bg-green-700">Import</button>
          <button type="button" onclick="document.getElementById('modal_import').classList.add('hidden')" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm font-medium text-slate-700 hover:bg-slate-50">Batal</button>
        </div>
      </form>
    </div>
  </div>

<?php elseif ($aksi === 'tambah' || $aksi === 'edit'): ?>
  <div class="mx-auto max-w-md">
    <div class="rounded-2xl bg-white p-6 shadow">
      <h2 class="mb-4 text-lg font-semibold text-slate-800"><?= $aksi === 'tambah' ? 'Tambah Siswa' : 'Edit Siswa' ?></h2>
      
      <form method="post" class="space-y-4">
        <input type="hidden" name="aksi" value="<?= $aksi === 'tambah' ? 'tambah' : 'edit' ?>">
        <?php if ($aksi === 'edit'): ?>
          <input type="hidden" name="id" value="<?= $siswa['id'] ?>">
        <?php endif; ?>
        
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">NIS</label>
          <input type="text" name="nis" required value="<?= e($siswa['nis'] ?? '') ?>"
                 class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
        </div>
        
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">Nama Lengkap</label>
          <input type="text" name="nama_lengkap" required value="<?= e($siswa['nama_lengkap'] ?? '') ?>"
                 class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
        </div>
        
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">Kelas</label>
          <select name="kelas_id" class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
            <option value="0">-- Pilih Kelas --</option>
            <?php foreach ($kelas_list as $k): ?>
              <option value="<?= $k['id'] ?>" <?= ($siswa['kelas_id'] ?? 0) == $k['id'] ? 'selected' : '' ?>><?= e($k['nama_kelas']) ?></option>
            <?php endforeach; ?>
          </select>
        </div>
        
        <?php if ($aksi === 'edit'): ?>
          <div>
            <label class="mb-1 block text-sm font-medium text-slate-700">Status</label>
            <select name="is_active" class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20">
              <option value="1" <?= ($siswa['is_active'] ?? 1) ? 'selected' : '' ?>>Aktif</option>
              <option value="0" <?= !($siswa['is_active'] ?? 1) ? 'selected' : '' ?>>Nonaktif</option>
            </select>
          </div>
        <?php endif; ?>
        
        <div class="flex gap-3">
          <button type="submit" class="flex-1 rounded-lg bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-700">Simpan</button>
          <a href="/admin/kelola_siswa.php" class="flex-1 rounded-lg border border-slate-300 bg-white px-4 py-2.5 text-center text-sm font-medium text-slate-700 hover:bg-slate-50">Batal</a>
        </div>
      </form>
    </div>
  </div>

<?php elseif ($aksi === 'export'): ?>
  <?php
  header('Content-Type: text/csv');
  header('Content-Disposition: attachment; filename="siswa_export_' . date('Y-m-d') . '.csv"');
  $output = fopen('php://output', 'w');
  fputcsv($output, ['NIS', 'Nama Lengkap', 'Kelas', 'Status']);
  foreach ($siswa_list as $s) {
      fputcsv($output, [$s['nis'], $s['nama_lengkap'], $s['nama_kelas'] ?? '', $s['is_active'] ? 'Aktif' : 'Nonaktif']);
  }
  fclose($output);
  exit;
  ?>

<?php endif; ?>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
