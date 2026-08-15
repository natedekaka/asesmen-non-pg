<?php
require_once __DIR__ . '/core/init.php';

// Jika sudah login, redirect ke dashboard
if (isset($_SESSION['admin_id'])) {
    redirect('/admin/index.php');
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    require_csrf();
    $username = trim($_POST['username'] ?? '');
    $password = (string)($_POST['password'] ?? '');

    if (empty($username) || empty($password)) {
        $error = 'Username dan kata sandi harus diisi.';
    } else {
        $stmt = db()->prepare("SELECT * FROM admin_users WHERE username = ?");
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $admin = $stmt->get_result()->fetch_assoc();

        if ($admin && password_verify($password, $admin['password'])) {
            session_regenerate_id(true);
            $_SESSION['role'] = 'admin';
            $_SESSION['admin_id'] = $admin['id'];
            $_SESSION['admin_nama'] = $admin['nama_lengkap'];
            redirect('/admin/index.php');
        } else {
            $error = 'Username atau kata sandi salah.';
        }
    }
}
?>
<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Masuk Admin · Asesmen Non-PG</title>
<link rel="stylesheet" href="/assets/css/app.css">
<link rel="stylesheet" href="/assets/css/theme.css">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📝</text></svg>">
</head>
<body class="login-page">
  <div class="login-card">
    <div class="text-center">
      <div class="login-logo">📝</div>
      <h1 class="login-title">Asesmen Non-PG</h1>
      <p class="login-subtitle">Masuk sebagai Administrator</p>
    </div>

    <div class="text-center mt-4">
      <span class="login-badge">👨‍💼 Masuk Admin</span>
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
          <label class="form-label">Username</label>
          <input type="text" name="username" required autofocus
                 value="<?= e($_POST['username'] ?? '') ?>"
                 class="form-input"
                 placeholder="Masukkan username">
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
      Ganti kata sandi setelah masuk untuk keamanan.
</div>

    <div class="mt-4 text-center login-switch">
      <a href="/login_siswa.php">← Masuk sebagai Siswa</a>
    </div>
  </div>
</body>
</html>
