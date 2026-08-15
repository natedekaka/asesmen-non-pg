<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= e($title ?? 'Beranda') ?> · Asesmen Non-PG</title>
<link rel="stylesheet" href="/assets/css/app.css">
<link rel="stylesheet" href="/assets/css/theme.css">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📝</text></svg>">
</head>
<body class="h-full bg-slate-100">
<div class="min-h-full">
  <nav class="navbar-student">
    <div class="nav-inner">
      <a href="/siswa/index.php" class="nav-brand">
        <span class="nav-brand-logo">📝</span>
        Asesmen Non-PG
      </a>
      <div class="nav-links">
        <a href="/siswa/pengumuman.php">
          <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M10.34 15.84c-.688-.06-1.386-.09-2.09-.09H7.5a4.5 4.5 0 110-9h.75c.704 0 1.402-.03 2.09-.09m0 9.18c.253.962.584 1.892.985 2.783.247.55.06 1.21-.463 1.511l-.657.38c-.551.318-1.26.117-1.527-.461a20.845 20.845 0 01-1.44-4.282m3.102.069a18.03 18.03 0 01-.59-4.59c0-1.586.205-3.124.59-4.59m0 9.18a23.848 23.848 0 018.835 2.535M10.34 6.66a23.847 23.847 0 008.835-2.535m0 0A23.74 23.74 0 0018.795 3m.38 1.125a23.91 23.91 0 011.014 5.395m-1.014 8.855c-.118.38-.245.754-.38 1.125m.38-1.125a23.91 23.91 0 001.014-5.395m0-3.46c.495.413.811 1.035.811 1.73 0 .695-.316 1.317-.811 1.73m0-3.46a24.347 24.347 0 010 3.46"/></svg>
          Pengumuman
        </a>
        <a href="/siswa/profil.php">
          <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
          Profil
        </a>
      </div>
      <div class="flex items-center gap-3">
        <span class="nav-user">
          <span class="nav-user-avatar"><?= e(strtoupper(mb_substr($_SESSION['siswa_nama'] ?? 'S', 0, 1))) ?></span>
          <span class="nav-user-info">
            <div class="nav-user-name"><?= e($_SESSION['siswa_nama'] ?? '') ?></div>
            <div class="nav-user-nis"><?= e($_SESSION['siswa_nis'] ?? '') ?></div>
          </span>
        </span>
        <a href="/logout_siswa.php" class="nav-logout">
          <svg fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9"/></svg>
          Keluar
        </a>
      </div>
    </div>
  </nav>
  <div class="mx-auto max-w-6xl px-4 py-6">
    <?= umumkan_alert('sukses') ?>
    <?= umumkan_alert('error') ?>
