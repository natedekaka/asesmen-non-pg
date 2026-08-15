<?php
require_once __DIR__ . '/../core/init.php';
require_siswa();

$conn = db();

// Ambil pengumuman yang ditampilkan
$stmt = $conn->prepare("
    SELECT p.*, u.judul AS judul_ujian, k.nama_kelas
    FROM pengumuman p
    LEFT JOIN ujian u ON u.id = p.id_ujian
    LEFT JOIN kelas k ON k.id = p.id_kelas
    WHERE p.ditampilkan = 1 
    AND (p.id_kelas IS NULL OR p.id_kelas = (
        SELECT kelas_id FROM siswa WHERE id = ?
    ))
    ORDER BY p.created_at DESC
");
$stmt->bind_param('i', $_SESSION['siswa_id']);
$stmt->execute();
$pengumuman_list = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

$title = 'Pengumuman';
require __DIR__ . '/../views/layout_siswa_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">📢 Pengumuman</h1>

<?php if (empty($pengumuman_list)): ?>
  <div class="rounded-2xl border border-dashed border-slate-300 bg-white p-8 text-center text-slate-400">
    Belum ada pengumuman saat ini.
  </div>
<?php else: ?>
  <div class="space-y-4">
    <?php foreach ($pengumuman_list as $p): ?>
      <div class="rounded-2xl bg-white p-6 shadow">
        <div class="flex items-start gap-4">
          <!-- Ikon Tipe -->
          <div class="flex-shrink-0">
            <?php if ($p['tipe'] === 'penting'): ?>
              <div class="flex h-10 w-10 items-center justify-center rounded-full bg-red-100 text-red-600">
                ⚠️
              </div>
            <?php elseif ($p['tipe'] === 'ujian'): ?>
              <div class="flex h-10 w-10 items-center justify-center rounded-full bg-blue-100 text-blue-600">
                📝
              </div>
            <?php else: ?>
              <div class="flex h-10 w-10 items-center justify-center rounded-full bg-slate-100 text-slate-600">
                📢
              </div>
            <?php endif; ?>
          </div>

          <!-- Konten -->
          <div class="flex-1">
            <div class="flex items-center gap-2">
              <h2 class="text-lg font-semibold text-slate-800"><?= e($p['judul']) ?></h2>
              <?php if ($p['tipe'] === 'penting'): ?>
                <span class="inline-flex rounded-full bg-red-100 px-2 py-0.5 text-xs font-medium text-red-800">Penting</span>
              <?php elseif ($p['tipe'] === 'ujian'): ?>
                <span class="inline-flex rounded-full bg-blue-100 px-2 py-0.5 text-xs font-medium text-blue-800">Ujian</span>
              <?php endif; ?>
            </div>

            <p class="mt-2 text-sm text-slate-600"><?= nl2br(e($p['isi'])) ?></p>

            <div class="mt-3 flex flex-wrap items-center gap-3 text-xs text-slate-400">
              <span>📅 <?= (new DateTime($p['created_at']))->format('d M Y H:i') ?></span>
              <?php if ($p['judul_ujian']): ?>
                <span>📝 Ujian: <?= e($p['judul_ujian']) ?></span>
              <?php endif; ?>
              <?php if ($p['nama_kelas']): ?>
                <span>🏫 Kelas: <?= e($p['nama_kelas']) ?></span>
              <?php endif; ?>
            </div>
          </div>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
<?php endif; ?>

<?php require __DIR__ . '/../views/layout_siswa_bottom.php'; ?>
