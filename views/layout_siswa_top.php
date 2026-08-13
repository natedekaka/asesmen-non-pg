<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= e($title ?? 'Beranda') ?> · Asesmen Non-PG</title>
<link rel="stylesheet" href="/assets/css/app.css">
</head>
<body class="h-full bg-gray-100">
<div class="min-h-full">
  <nav class="bg-slate-800 text-white">
    <div class="mx-auto max-w-6xl px-4 py-3 flex items-center justify-between">
      <div class="flex items-center gap-6">
        <a href="/siswa/index.php" class="text-lg font-semibold">📝 Asesmen Non-PG</a>
        <span class="text-sm text-slate-300">Area Siswa</span>
      </div>
      <div class="flex items-center gap-3 text-sm">
        <a href="/siswa/pengumuman.php" class="rounded-md px-3 py-1.5 hover:bg-slate-700">📢 Pengumuman</a>
        <a href="/siswa/profil.php" class="rounded-md px-3 py-1.5 hover:bg-slate-700">👤 Profil</a>
        <span class="text-slate-300"><?= e($_SESSION['siswa_nama'] ?? '') ?> (<?= e($_SESSION['siswa_nis'] ?? '') ?>)</span>
        <a href="/logout_siswa.php" class="rounded-md bg-slate-700 px-3 py-1.5 hover:bg-slate-600">Keluar</a>
      </div>
    </div>
  </nav>
  <div class="mx-auto max-w-6xl px-4 py-6">
    <?= umumkan_alert('sukses') ?>
    <?= umumkan_alert('error') ?>