<?php
require_once __DIR__ . '/../core/init.php';
require_admin();

$conn = db();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['csv_file'])) {
    if ($_FILES['csv_file']['error'] === UPLOAD_ERR_OK) {
        $file = fopen($_FILES['csv_file']['tmp_name'], 'r');
        $header = fgetcsv($file);
        $imported = 0;
        $errors = 0;
        $error_messages = [];
        
        while (($row = fgetcsv($file)) !== false) {
            if (count($row) >= 3) {
                $tipe = strtolower(trim($row[0]));
                $pertanyaan = trim($row[1]);
                $kunci = trim($row[2]);
                $poin = isset($row[3]) ? (int)$row[3] : 10;
                
                if (!in_array($tipe, ['essay', 'isian', 'menjodohkan'])) {
                    $errors++;
                    $error_messages[] = "Baris " . ($imported + $errors + 1) . ": Tipe tidak valid '$tipe'";
                    continue;
                }
                
                if (empty($pertanyaan)) {
                    $errors++;
                    $error_messages[] = "Baris " . ($imported + $errors + 1) . ": Pertanyaan kosong";
                    continue;
                }
                
                $stmt = $conn->prepare("INSERT INTO bank_soal (tipe, pertanyaan, kunci, poin) VALUES (?, ?, ?, ?)");
                $stmt->bind_param('sssi', $tipe, $pertanyaan, $kunci, $poin);
                if ($stmt->execute()) {
                    $imported++;
                } else {
                    $errors++;
                    $error_messages[] = "Baris " . ($imported + $errors + 1) . ": Gagal menyimpan";
                }
            }
        }
        fclose($file);
        
        flash_set('sukses', "Import selesai: $imported soal berhasil, $errors gagal.");
        if (!empty($error_messages)) {
            flash_set('error', implode('<br>', array_slice($error_messages, 0, 5)));
        }
    } else {
        flash_set('error', 'Gagal mengupload file CSV.');
    }
    redirect('/admin/import_soal.php');
}

$title = 'Import Soal';
require __DIR__ . '/../views/layout_admin_top.php';
?>

<h1 class="mb-6 text-2xl font-bold text-slate-800">Import Soal dari CSV</h1>

<div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
  <!-- Form Import -->
  <div class="rounded-2xl bg-white p-6 shadow">
    <h2 class="mb-4 text-lg font-semibold text-slate-800">Upload File CSV</h2>
    
    <form method="post" enctype="multipart/form-data" class="space-y-4">
      <div>
        <label class="mb-1 block text-sm font-medium text-slate-700">Pilih File CSV</label>
        <input type="file" name="csv_file" accept=".csv" required
               class="w-full text-sm text-slate-500 file:mr-4 file:rounded-lg file:border-0 file:bg-blue-50 file:px-4 file:py-2 file:text-sm file:font-semibold file:text-blue-700 hover:file:bg-blue-100">
      </div>
      
      <button type="submit" class="w-full rounded-lg bg-blue-600 px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-700">
        📥 Import Soal
      </button>
    </form>
  </div>

  <!-- Panduan Format -->
  <div class="rounded-2xl bg-white p-6 shadow">
    <h2 class="mb-4 text-lg font-semibold text-slate-800">Panduan Format CSV</h2>
    
    <div class="space-y-4">
      <div>
        <h3 class="mb-2 text-sm font-medium text-slate-700">Format Kolom:</h3>
        <code class="block rounded-lg bg-slate-100 p-3 text-sm text-slate-800">
          tipe, pertanyaan, kunci_jawaban, poin
        </code>
      </div>
      
      <div>
        <h3 class="mb-2 text-sm font-medium text-slate-700">Tipe yang Didukung:</h3>
        <ul class="list-disc list-inside text-sm text-slate-600 space-y-1">
          <li><code class="rounded bg-slate-100 px-1">essay</code> - Soal essay bebas</li>
          <li><code class="rounded bg-slate-100 px-1">isian</code> - Isian singkat (kunci dipisah dengan <code>||</code>)</li>
          <li><code class="rounded bg-slate-100 px-1">menjodohkan</code> - Soal menjodohkan</li>
        </ul>
      </div>
      
      <div>
        <h3 class="mb-2 text-sm font-medium text-slate-700">Contoh Isi CSV:</h3>
        <pre class="overflow-x-auto rounded-lg bg-slate-100 p-3 text-xs text-slate-800">isian,"Kepanjangan dari SQL adalah ...","Structured Query Language||structured query language",10
essay,"Jelaskan perbedaan HTTP dan HTTPS!","HTTPS menggunakan enkripsi SSL/TLS",20
menjodohkan,"Pasangkan istilah jaringan!","",20</pre>
      </div>
      
      <div class="rounded-lg bg-amber-50 p-4">
        <h3 class="mb-2 text-sm font-medium text-amber-800">Catatan Penting:</h3>
        <ul class="list-disc list-inside text-sm text-amber-700 space-y-1">
          <li>Untuk soal isian, kunci alternatif dipisah dengan <code>||</code></li>
          <li>Soal menjodohkan: kunci dikosongkan, pasangan diatur manual setelah import</li>
          <li>Gunakan tanda kutir ganda ("") untuk teks yang mengandung koma</li>
          <li>Poin default adalah 10 jika tidak dispesifikasikan</li>
        </ul>
      </div>
    </div>
  </div>
</div>

<?php require __DIR__ . '/../views/layout_admin_bottom.php'; ?>
