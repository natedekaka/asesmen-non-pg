<?php
require_once __DIR__ . '/core/init.php';

// Jika sudah login, redirect ke dashboard
if (isset($_SESSION['admin_id'])) {
    redirect('/admin/index.php');
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
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
</head>
<body class="h-full bg-slate-100">
<div class="flex min-h-full items-center justify-center px-4 py-12">
  <div class="w-full max-w-md">
    <div class="mb-6 text-center">
      <div class="text-4xl">📝</div>
      <h1 class="mt-2 text-2xl font-bold text-slate-800">Asesmen Non-PG</h1>
      <p class="text-sm text-slate-500">Masuk sebagai Administrator</p>
    </div>

    <div class="rounded-2xl bg-white p-6 shadow-lg">
      <div class="mb-5 text-center">
        <span class="inline-block rounded-full bg-indigo-100 px-4 py-2 text-sm font-semibold text-indigo-800">
          👨‍💼 Masuk Admin
        </span>
      </div>

      <form method="post" class="space-y-4">
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">Username</label>
          <input type="text" name="username" required autofocus
                 value="<?= e($_POST['username'] ?? '') ?>"
                 class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                 placeholder="Masukkan username">
        </div>
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">Kata Sandi</label>
          <input type="password" name="password" required
                 class="w-full rounded-lg border border-slate-300 px-3 py-2.5 focus:border-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500/20"
                 placeholder="Masukkan kata sandi">
        </div>
        <?php if ($error): ?>
          <div class="rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700">
            <div class="flex items-center gap-2">
              <svg class="h-4 w-4 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
              </svg>
              <?= e($error) ?>
            </div>
          </div>
        <?php endif; ?>
        <button type="submit" class="w-full rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition-colors">
          Masuk
        </button>
      </form>

      <div class="mt-6 rounded-lg bg-slate-50 p-4">
        <p class="text-center text-xs text-slate-500">
          Default: <code class="rounded bg-slate-200 px-1 py-0.5">admin</code> / <code class="rounded bg-slate-200 px-1 py-0.5">admin123</code>
          <br>Ganti kata sandi setelah masuk untuk keamanan.
        </p>
      </div>

      <div class="mt-4 text-center">
        <a href="/login_siswa.php" class="text-sm text-slate-500 hover:text-slate-700">
          ← Masuk sebagai Siswa
        </a>
      </div>
    </div>
  </div>
</div>
</body>
</html>
