<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$conn = db();
$siswa_id = (int)$_SESSION['siswa_id'];
$error = null;
$success = null;

// Ambil data siswa
$stmt = $conn->prepare("SELECT * FROM siswa WHERE id = ?");
$stmt->bind_param('i', $siswa_id);
$stmt->execute();
$siswa = $stmt->get_result()->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $password_lama = (string)($_POST['password_lama'] ?? '');
    $password_baru = (string)($_POST['password_baru'] ?? '');
    $password_konfirmasi = (string)($_POST['password_konfirmasi'] ?? '');

    // Validasi
    if (empty($password_lama) || empty($password_baru) || empty($password_konfirmasi)) {
        $error = 'Semua kolom harus diisi.';
    } elseif (!password_verify($password_lama, $siswa['password'])) {
        $error = 'Kata sandi lama salah.';
    } elseif (strlen($password_baru) < 6) {
        $error = 'Kata sandi baru minimal 6 karakter.';
    } elseif ($password_baru !== $password_konfirmasi) {
        $error = 'Konfirmasi kata sandi baru tidak cocok.';
    } else {
        $hash_baru = password_hash($password_baru, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("UPDATE siswa SET password = ? WHERE id = ?");
        $stmt->bind_param('si', $hash_baru, $siswa_id);
        if ($stmt->execute()) {
            $success = 'Kata sandi berhasil diubah.';
        } else {
            $error = 'Gagal mengubah kata sandi. Silakan coba lagi.';
        }
    }
}

$title = 'Ganti Kata Sandi';
require __DIR__ . '/../views/layout_siswa_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">Ganti Kata Sandi</h1>

<div class="mx-auto max-w-md">
  <div class="rounded-2xl bg-white p-6 shadow">
    <?php if ($error): ?>
      <div class="mb-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
        <div class="flex items-center gap-2">
          <svg class="h-4 w-4 text-red-500" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
          </svg>
          <?= e($error) ?>
        </div>
      </div>
    <?php endif; ?>

    <?php if ($success): ?>
      <div class="mb-4 rounded-lg border border-green-200 bg-green-50 px-4 py-3 text-sm text-green-700">
        <div class="flex items-center gap-2">
          <svg class="h-4 w-4 text-green-500" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
          </svg>
          <?= e($success) ?>
        </div>
      </div>
    <?php endif; ?>

    <form method="post" class="space-y-4">
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Kata Sandi Saat Ini</label>
        <input type="password" name="password_lama" required
               class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20"
               placeholder="Masukkan kata sandi saat ini">
      </div>

      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Kata Sandi Baru</label>
        <input type="password" name="password_baru" required minlength="6"
               class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20"
               placeholder="Minimal 6 karakter">
      </div>

      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Konfirmasi Kata Sandi Baru</label>
        <input type="password" name="password_konfirmasi" required minlength="6"
               class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-blue-500 focus:outline-none focus:ring-2 focus:ring-blue-500/20"
               placeholder="Ulangi kata sandi baru">
      </div>

      <div class="flex gap-3">
        <button type="submit" class="flex-1 rounded-lg bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-700 transition-colors">
          Simpan Perubahan
        </button>
        <a href="/siswa/index.php" class="flex-1 rounded-lg border border-slate-300 bg-white px-4 py-2.5 text-center text-sm font-medium text-slate-700 hover:bg-slate-50 transition-colors">
          Batal
        </a>
      </div>
    </form>
  </div>
</div>

<?php require __DIR__ . '/../views/layout_siswa_bottom.php'; ?>
