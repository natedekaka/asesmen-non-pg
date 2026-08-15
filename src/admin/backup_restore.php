<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $aksi = $_POST['aksi'] ?? '';
    
    if ($aksi === 'backup') {
        $tables = $conn->query("SHOW TABLES")->fetch_all(MYSQLI_NUM);
        $sql_dump = "-- Backup Database Asesmen Non-PG\n";
        $sql_dump .= "-- Tanggal: " . date('Y-m-d H:i:s') . "\n\n";
        $sql_dump .= "SET NAMES utf8mb4;\n";
        $sql_dump .= "SET time_zone = '+07:00';\n\n";
        
        foreach ($tables as $table) {
            $table_name = $table[0];
            
            $create = $conn->query("SHOW CREATE TABLE `$table_name`")->fetch_assoc();
            $sql_dump .= "DROP TABLE IF EXISTS `$table_name`;\n";
            $sql_dump .= $create['Create Table'] . ";\n\n";
            
            $rows = $conn->query("SELECT * FROM `$table_name`")->fetch_all(MYSQLI_ASSOC);
            if (!empty($rows)) {
                $columns = array_keys($rows[0]);
                $sql_dump .= "INSERT INTO `$table_name` (`" . implode('`, `', $columns) . "`) VALUES\n";
                
                $value_rows = [];
                foreach ($rows as $row) {
                    $values = array_map(function($v) use ($conn) {
                        if ($v === null) return 'NULL';
                        return "'" . $conn->real_escape_string($v) . "'";
                    }, array_values($row));
                    $value_rows[] = '(' . implode(', ', $values) . ')';
                }
                $sql_dump .= implode(",\n", $value_rows) . ";\n\n";
            }
        }
        
        header('Content-Type: text/sql');
        header('Content-Disposition: attachment; filename="backup_asesmen_non_pg_' . date('Y-m-d_His') . '.sql"');
        echo $sql_dump;
        exit;
    } elseif ($aksi === 'restore') {
        if (isset($_FILES['sql_file']) && $_FILES['sql_file']['error'] === UPLOAD_ERR_OK) {
            $sql_content = file_get_contents($_FILES['sql_file']['tmp_name']);
            
            $conn->query("SET FOREIGN_KEY_CHECKS = 0");
            
            $statements = explode(';', $sql_content);
            $executed = 0;
            $errors = 0;
            
            foreach ($statements as $stmt) {
                $stmt = trim($stmt);
                if (!empty($stmt) && $stmt !== '--') {
                    if ($conn->query($stmt)) {
                        $executed++;
                    } else {
                        $errors++;
                    }
                }
            }
            
            $conn->query("SET FOREIGN_KEY_CHECKS = 1");
            
            flash_set('sukses', "Restore selesai: $executed perintah berhasil, $errors gagal.");
        } else {
            flash_set('error', 'Gagal mengupload file SQL.');
        }
        redirect('/admin/backup_restore.php');
    }
}

$title = 'Backup & Restore';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">💾 Backup & Restore</h1>

<div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
  <!-- Backup -->
  <div class="rounded-2xl bg-white p-6 shadow">
    <div class="mb-4 flex items-center gap-3">
      <div class="flex h-12 w-12 items-center justify-center rounded-full bg-green-100 text-green-600">
        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
        </svg>
      </div>
      <div>
        <h2 class="text-lg font-semibold text-slate-800">Backup Database</h2>
        <p class="text-sm text-slate-500">Download seluruh database dalam format SQL</p>
      </div>
    </div>
    
    <div class="mb-4 rounded-lg bg-slate-50 p-4">
      <p class="text-sm text-slate-600">
        Backup akan mencakup semua tabel: admin_users, kelas, siswa, bank_soal, ujian, sesi_ujian, jawaban, pengumuman, dan log_aplikasi.
      </p>
    </div>
    
    <form method="post">
      <input type="hidden" name="aksi" value="backup">
      <button type="submit" class="w-full rounded-lg bg-green-600 px-4 py-3 text-sm font-semibold text-white hover:bg-green-700 transition-colors">
        📥 Download Backup SQL
      </button>
    </form>
  </div>

  <!-- Restore -->
  <div class="rounded-2xl bg-white p-6 shadow">
    <div class="mb-4 flex items-center gap-3">
      <div class="flex h-12 w-12 items-center justify-center rounded-full bg-amber-100 text-amber-600">
        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12"/>
        </svg>
      </div>
      <div>
        <h2 class="text-lg font-semibold text-slate-800">Restore Database</h2>
        <p class="text-sm text-slate-500">Upload file SQL untuk restore database</p>
      </div>
    </div>
    
    <div class="mb-4 rounded-lg bg-amber-50 p-4 border border-amber-200">
      <div class="flex items-start gap-2">
        <svg class="h-5 w-5 text-amber-500 mt-0.5" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
        </svg>
        <div>
          <p class="text-sm font-medium text-amber-800">Peringatan!</p>
          <p class="text-sm text-amber-700">Restore akan menimpa data yang ada. Pastikan Anda sudah backup terlebih dahulu.</p>
        </div>
      </div>
    </div>
    
    <form method="post" enctype="multipart/form-data">
      <input type="hidden" name="aksi" value="restore">
      <div class="mb-4">
        <input type="file" name="sql_file" accept=".sql" required
               class="w-full text-sm text-slate-500 file:mr-4 file:rounded-lg file:border-0 file:bg-amber-50 file:px-4 file:py-2 file:text-sm file:font-semibold file:text-amber-700 hover:file:bg-amber-100">
      </div>
      <button type="submit" class="w-full rounded-lg bg-amber-600 px-4 py-3 text-sm font-semibold text-white hover:bg-amber-700 transition-colors"
              onclick="return confirm('Yakin ingin restore database? Semua data akan ditimpa!')">
        📤 Upload & Restore
      </button>
    </form>
  </div>
</div>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
