<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$error = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $tipe = $_POST['tipe'] ?? 'essay';
    $pertanyaan = trim($_POST['pertanyaan'] ?? '');
    $poin = (int)($_POST['poin'] ?? 10);

    if (!in_array($tipe, ['essay', 'isian', 'menjodohkan']) || $pertanyaan === '' || $poin < 1) {
        $error = 'Data tidak lengkap atau tidak valid.';
    } else {
        $conn = db();
        $kunci = null;
        $petunjuk = null;
        if ($tipe === 'essay') {
            $kunci = trim($_POST['kunci'] ?? '');
            $petunjuk = trim($_POST['petunjuk'] ?? '');
        }
        if ($tipe === 'isian') {
            $kunci = trim($_POST['kunci_isian'] ?? '');
        }

        $stmt = $conn->prepare("INSERT INTO bank_soal (tipe, pertanyaan, kunci, petunjuk, poin) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param('ssssi', $tipe, $pertanyaan, $kunci, $petunjuk, $poin);
        $stmt->execute();
        $id_soal = $conn->insert_id;

        if ($tipe === 'menjodohkan') {
            $kiri = $_POST['kiri'] ?? [];
            $kanan = $_POST['kanan'] ?? [];
            $stmt2 = $conn->prepare("INSERT INTO pasangan_menjodohkan (id_soal, kolom_kiri, kolom_kanan, urutan) VALUES (?, ?, ?, ?)");
            $urutan = 1;
            foreach ($kiri as $i => $k) {
                $ki = trim($k);
                $ka = trim($kanan[$i] ?? '');
                if ($ki === '' || $ka === '') continue;
                $stmt2->bind_param('issi', $id_soal, $ki, $ka, $urutan);
                $stmt2->execute();
                $urutan++;
            }
        }

        flash_set('sukses', 'Soal berhasil ditambahkan.');
        redirect('index.php');
    }
}

$soal = [];
$title = 'Tambah Soal';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Tambah Soal</h1>
  <a href="index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Kembali</a>
</div>

<?php if ($error): ?>
  <div class="mt-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700"><?= e($error) ?></div>
<?php endif; ?>

<form method="post" class="mt-4 rounded-2xl bg-white p-6 shadow">
  <?php require '_form.php'; ?>
  <div class="mt-6 border-t border-slate-100 pt-4">
    <button type="submit" class="rounded-lg bg-indigo-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-indigo-700">Simpan Soal</button>
  </div>
</form>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>