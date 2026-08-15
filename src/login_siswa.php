<?php
require_once __DIR__ . '/core/init.php';

// Jika sudah login, redirect ke dashboard
if (isset($_SESSION['siswa_id'])) {
    redirect('/siswa/index.php');
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_csrf();
    $nis = trim($_POST['nis'] ?? '');
    $password = (string)($_POST['password'] ?? '');

    if (empty($nis) || empty($password)) {
        $error = 'NIS dan kata sandi harus diisi.';
    } else {
        $stmt = db()->prepare("SELECT * FROM siswa WHERE nis = ? AND is_active = 1");
        $stmt->bind_param('s', $nis);
        $stmt->execute();
        $siswa = $stmt->get_result()->fetch_assoc();

        if ($siswa && password_verify($password, $siswa['password'])) {
            session_regenerate_id(true);
            $_SESSION['role'] = 'siswa';
            $_SESSION['siswa_id'] = $siswa['id'];
            $_SESSION['siswa_nama'] = $siswa['nama_lengkap'];
            $_SESSION['siswa_nis'] = $siswa['nis'];
            redirect('/siswa/index.php');
        } else {
            $error = 'NIS atau kata sandi salah, atau akun tidak aktif.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Masuk Siswa · Asesmen Non-PG</title>
<link rel="stylesheet" href="/assets/css/app.css">
<link rel="stylesheet" href="/assets/css/theme.css">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📝</text></svg>">
</head>
<body class="login-page">
  <div class="login-card">
    <div class="text-center">
      <div class="login-logo">📝</div>
      <h1 class="login-title">Asesmen Non-PG</h1>
      <p class="login-subtitle">Masuk sebagai Siswa</p>
    </div>

    <div class="text-center mt-4">
      <span class="login-badge">🎓 Masuk Siswa</span>
    </div>

    <form method="post" class="login-form">
      <?= csrf_field() ?>
      <?php if ($error): ?>
        <div class="login-alert">
          <svg fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/></svg>
          <div><?= e($error) ?></div>
        </div>
      <?php endif; ?>
      <div class="space-y-4">
        <div>
          <label class="form-label">NIS (Nomor Induk Siswa)</label>
          <input type="text" name="nis" required autofocus
                 value="<?= e($_POST['nis'] ?? '') ?>"
                 class="form-input"
                 placeholder="Masukkan NIS Anda">
        </div>
        <div>
          <label class="form-label">Kata Sandi</label>
          <input type="password" name="password" required class="form-input"
                 placeholder="Masukkan kata sandi">
        </div>
        <button type="submit" class="login-btn">Masuk</button>
      </div>
    </form>

    <div class="mt-5 login-note">
      Gunakan NIS sebagai username dan kata sandi awal.
      <br>Jika lupa kata sandi, hubungi administrator.
    </div>

    <div class="mt-4 text-center login-switch">
      <a href="/login_admin.php">Masuk sebagai Admin →</a>
    </div>
  </div>
</body>
</html>
