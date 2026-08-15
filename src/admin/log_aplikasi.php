<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();

$filter_user = $_GET['user_type'] ?? '';
$filter_aksi = $_GET['aksi'] ?? '';
$limit = 100;

$query = "SELECT * FROM log_aplikasi WHERE 1=1";
$params = [];
$types = '';

if (!empty($filter_user)) {
    $query .= " AND user_type = ?";
    $params[] = $filter_user;
    $types .= 's';
}

if (!empty($filter_aksi)) {
    $query .= " AND aksi LIKE ?";
    $params[] = "%$filter_aksi%";
    $types .= 's';
}

$query .= " ORDER BY created_at DESC LIMIT ?";
$params[] = $limit;
$types .= 'i';

$stmt = $conn->prepare($query);
$stmt->bind_param($types, ...$params);
$stmt->execute();
$log_list = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

$title = 'Log Aplikasi';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">📋 Log Aplikasi</h1>

<!-- Filter -->
<div class="mb-6 rounded-2xl bg-white p-6 shadow">
  <form method="get" class="flex flex-wrap gap-4">
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Tipe User</label>
      <select name="user_type" class="rounded-lg border border-slate-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none">
        <option value="">Semua</option>
        <option value="admin" <?= $filter_user === 'admin' ? 'selected' : '' ?>>Admin</option>
        <option value="siswa" <?= $filter_user === 'siswa' ? 'selected' : '' ?>>Siswa</option>
      </select>
    </div>
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Aksi</label>
      <input type="text" name="aksi" value="<?= e($filter_aksi) ?>" placeholder="Cari aksi..."
             class="rounded-lg border border-slate-300 px-3 py-2 text-sm focus:border-blue-500 focus:outline-none">
    </div>
    <div class="flex items-end">
      <button type="submit" class="rounded-lg bg-blue-600 px-4 py-2 text-sm font-semibold text-white hover:bg-blue-700">Filter</button>
    </div>
  </form>
</div>

<!-- Daftar Log -->
<div class="overflow-hidden rounded-2xl bg-white shadow">
  <table class="w-full text-left text-sm">
    <thead class="bg-slate-50 text-slate-500">
      <tr>
        <th class="px-4 py-3 font-medium">Waktu</th>
        <th class="px-4 py-3 font-medium">User</th>
        <th class="px-4 py-3 font-medium">Aksi</th>
        <th class="px-4 py-3 font-medium">Detail</th>
        <th class="px-4 py-3 font-medium">IP Address</th>
      </tr>
    </thead>
    <tbody class="divide-y divide-slate-100">
      <?php if (empty($log_list)): ?>
        <tr><td colspan="5" class="px-4 py-6 text-center text-slate-400">Belum ada log.</td></tr>
      <?php endif; ?>
      <?php foreach ($log_list as $l): ?>
        <tr class="hover:bg-slate-50">
          <td class="px-4 py-3 text-slate-500 whitespace-nowrap">
            <?= (new DateTime($l['created_at']))->format('d M Y H:i:s') ?>
          </td>
          <td class="px-4 py-3">
            <span class="inline-flex rounded-full px-2 py-0.5 text-xs font-medium <?= $l['user_type'] === 'admin' ? 'bg-indigo-100 text-indigo-800' : 'bg-blue-100 text-blue-800' ?>">
              <?= e(ucfirst($l['user_type'])) ?>
            </span>
            <span class="ml-1 text-slate-600">#<?= (int)$l['user_id'] ?></span>
          </td>
          <td class="px-4 py-3 font-medium text-slate-800"><?= e($l['aksi']) ?></td>
          <td class="px-4 py-3 text-slate-600 max-w-xs truncate">
            <?= e($l['detail'] ?? '-') ?>
          </td>
          <td class="px-4 py-3 text-slate-500 font-mono text-xs">
            <?= e($l['ip_address'] ?? '-') ?>
          </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
