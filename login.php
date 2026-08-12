<?php
require_once __DIR__ . '/core/init.php';

$role = $_GET['role'] ?? 'siswa';
if (!in_array($role, ['siswa', 'admin'])) {
    $role = 'siswa';
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = (string)($_POST['password'] ?? '');
    $role = $_POST['role'] ?? 'siswa';

    if ($role === 'admin') {
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
        }
        $error = 'Username atau kata sandi salah.';
    } else {
        $stmt = db()->prepare("SELECT * FROM siswa WHERE nis = ? AND is_active = 1");
        $stmt->bind_param('s', $username);
        $stmt->execute();
        $siswa = $stmt->get_result()->fetch_assoc();
        if ($siswa && password_verify($password, $siswa['password'])) {
            session_regenerate_id(true);
            $_SESSION['role'] = 'siswa';
            $_SESSION['siswa_id'] = $siswa['id'];
            $_SESSION['siswa_nama'] = $siswa['nama_lengkap'];
            $_SESSION['siswa_nis'] = $siswa['nis'];
            redirect('/siswa/index.php');
        }
        $error = 'NIS atau kata sandi salah, atau akun tidak aktif.';
    }
}
?>
<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Masuk · Asesmen Non-PG</title>
<link rel="stylesheet" href="/assets/css/app.css">
</head>
<body class="h-full bg-slate-100">
<div class="flex min-h-full items-center justify-center px-4 py-12">
  <div class="w-full max-w-md">
    <div class="mb-6 text-center">
      <div class="text-4xl">📝</div>
      <h1 class="mt-2 text-2xl font-bold text-slate-800">Asesmen Non-PG</h1>
      <p class="text-sm text-slate-500">Asesmen essay, menjodohkan & isian singkat</p>
    </div>

    <div class="rounded-2xl bg-white p-6 shadow-lg">
      <div class="mb-5 grid grid-cols-2 gap-2 rounded-xl bg-slate-100 p-1 text-center text-sm font-medium">
        <a href="/login.php?role=siswa" class="rounded-lg px-3 py-2 <?= $role === 'siswa' ? 'bg-white text-slate-800 shadow' : 'text-slate-500 hover:text-slate-700' ?>">Siswa</a>
        <a href="/login.php?role=admin" class="rounded-lg px-3 py-2 <?= $role === 'admin' ? 'bg-white text-slate-800 shadow' : 'text-slate-500 hover:text-slate-700' ?>">Admin</a>
      </div>

      <form method="post" class="space-y-4">
        <input type="hidden" name="role" value="<?= e($role) ?>">
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700"><?= $role === 'admin' ? 'Username' : 'NIS' ?></label>
          <input type="text" name="username" required
                 class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
        </div>
        <div>
          <label class="mb-1 block text-sm font-medium text-slate-700">Kata Sandi</label>
          <input type="password" name="password" required
                 class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
        </div>
        <?php if ($error): ?>
          <div class="rounded-lg border border-red-200 bg-red-50 px-4 py-2 text-sm text-red-700"><?= e($error) ?></div>
        <?php endif; ?>
        <button type="submit" class="w-full rounded-lg bg-indigo-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-indigo-700">Masuk</button>
      </form>

      <?php if ($role === 'siswa'): ?>
        <p class="mt-4 text-center text-xs text-slate-400">Akun siswa: NIS sebagai username dan kata sandi awal.</p>
      <?php else: ?>
        <p class="mt-4 text-center text-xs text-slate-400">Admin default: <code>admin</code> / <code>admin123</code></p>
      <?php endif; ?>
    </div>
  </div>
</div>
</body>
</html>