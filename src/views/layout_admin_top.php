<!DOCTYPE html>
<html lang="id" class="h-full">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?= e($title ?? 'Asesmen Non-PG') ?> · Asesmen Non-PG</title>
<link rel="stylesheet" href="/assets/css/app.css">
<link rel="stylesheet" href="/assets/css/theme.css">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90'>📝</text></svg>">
</head>
<body class="h-full bg-slate-100">
<div class="admin-shell">
  <button class="mobile-toggle" onclick="toggleSidebar()" aria-label="Buka menu">
    <svg fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"/></svg>
  </button>
  <div class="overlay" id="sidebarOverlay" onclick="toggleSidebar()"></div>
  <?php require __DIR__ . '/admin_sidebar.php'; ?>
  <div class="admin-main">
    <div class="admin-content">
    <?= umumkan_alert('sukses') ?>
    <?= umumkan_alert('error') ?>
