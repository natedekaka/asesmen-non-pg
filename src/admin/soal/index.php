<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$tipe = $_GET['tipe'] ?? '';
$tipe_filter = in_array($tipe, ['essay', 'isian', 'menjodohkan']) ? $tipe : '';
$jml_pakai = [];

$sql = "SELECT b.*, (SELECT COUNT(*) FROM ujian_soal us WHERE us.id_soal = b.id) AS dipakai
        FROM bank_soal b ";
if ($tipe_filter) {
    $sql .= "WHERE b.tipe = '" . db()->real_escape_string($tipe_filter) . "' ";
}
$sql .= "ORDER BY b.tipe, b.id DESC";
$soal = db()->query($sql)->fetch_all(MYSQLI_ASSOC);

$title = 'Bank Soal';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Bank Soal</h1>
  <a href="tambah.php" class="rounded-lg bg-indigo-600 px-4 py-2 text-sm font-semibold text-white hover:bg-indigo-700">+ Tambah Soal</a>
</div>

<div class="mt-4 flex flex-wrap gap-2 text-sm">
  <a href="index.php" class="rounded-full px-4 py-1.5 <?= $tipe_filter === '' ? 'bg-slate-800 text-white' : 'bg-white text-slate-600 border border-slate-300' ?>">Semua</a>
  <?php foreach (['essay', 'isian', 'menjodohkan'] as $t): ?>
    <a href="index.php?tipe=<?= $t ?>" class="rounded-full px-4 py-1.5 <?= $tipe_filter === $t ? 'bg-slate-800 text-white' : 'bg-white text-slate-600 border border-slate-300' ?>">
      <?= e(tipe_soal_label($t)) ?>
    </a>
  <?php endforeach; ?>
</div>

<div class="mt-5 overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">Tipe</th>
        <th class="px-4 py-3 font-medium">Pertanyaan</th>
        <th class="px-4 py-3 font-medium">Poin</th>
        <th class="px-4 py-3 font-medium">Dipakai</th>
        <th class="px-4 py-3 font-medium text-right">Aksi</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (!$soal): ?>
        <tr><td colspan="5" class="px-4 py-8 text-center text-slate-400">Belum ada soal. Tambahkan soal baru.</td></tr>
      <?php endif; ?>
      <?php foreach ($soal as $s): ?>
        <tr class="align-top hover:bg-slate-50">
          <td class="px-4 py-3 whitespace-nowrap"><?= tipe_soal_badge($s['tipe']) ?></td>
          <td class="px-4 py-3 text-slate-800"><?= e(mb_strimwidth(strip_tags($s['pertanyaan']), 0, 100, '...')) ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$s['poin'] ?></td>
          <td class="px-4 py-3 text-slate-600"><?= (int)$s['dipakai'] ?> ujian</td>
          <td class="px-4 py-3 text-right whitespace-nowrap space-x-2">
            <a href="edit.php?id=<?= $s['id'] ?>" class="text-indigo-600 hover:underline">Edit</a>
            <a href="hapus.php?id=<?= $s['id'] ?>" class="text-red-600 hover:underline" onclick="return confirm('Hapus soal ini? Dihapus dari bank soal (tidak menghapus jawaban ujian lama).')">Hapus</a>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>