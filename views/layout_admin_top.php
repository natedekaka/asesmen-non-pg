<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= e($title ?? 'Asesmen Non-PG') ?> · Asesmen Non-PG</title>
<link rel="stylesheet" href="/assets/css/app.css">
</head>
<body class="h-full bg-gray-100">
<div class="min-h-full">
  <nav class="bg-slate-800 text-white">
    <div class="mx-auto max-w-6xl px-4 py-3 flex items-center justify-between">
      <div class="flex items-center gap-6">
        <a href="/" class="text-lg font-semibold">📝 Asesmen Non-PG</a>
        <span class="text-sm text-slate-300">Panel Admin</span>
      </div>
      <div class="flex items-center gap-3 text-sm">
        <span class="text-slate-300"><?= e($_SESSION['admin_nama'] ?? '') ?></span>
        <a href="/logout.php" class="rounded-md bg-slate-700 px-3 py-1.5 hover:bg-slate-600">Keluar</a>
      </div>
    </div>
  </nav>
  <div class="mx-auto max-w-6xl px-4 py-6">
    <div class="mb-6 flex flex-wrap gap-2 text-sm">
      <a href="/admin/index.php" class="rounded-lg border border-slate-300 bg-white px-3 py-2 hover:bg-slate-50">Dashboard</a>
      <a href="/admin/soal/index.php" class="rounded-lg border border-slate-300 bg-white px-3 py-2 hover:bg-slate-50">Bank Soal</a>
      <a href="/admin/ujian/index.php" class="rounded-lg border border-slate-300 bg-white px-3 py-2 hover:bg-slate-50">Ujian</a>
      <a href="/admin/siswa/index.php" class="rounded-lg border border-slate-300 bg-white px-3 py-2 hover:bg-slate-50">Siswa</a>
      <a href="/admin/kelas/index.php" class="rounded-lg border border-slate-300 bg-white px-3 py-2 hover:bg-slate-50">Kelas</a>
      <a href="/admin/koreksi/index.php" class="rounded-lg border border-slate-300 bg-white px-3 py-2 hover:bg-slate-50">Koreksi & Nilai</a>
    </div>
    <?= umumkan_alert('sukses') ?>
    <?= umumkan_alert('error') ?>