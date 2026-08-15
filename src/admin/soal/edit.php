<?php
require_once __DIR__ . '/../../core/init.php';
require_admin();

$id = (int)($_GET['id'] ?? 0);
$conn = db();
$stmt = $conn->prepare("SELECT * FROM bank_soal WHERE id = ?");
$stmt->bind_param('i', $id);
$stmt->execute();
$soal = $stmt->get_result()->fetch_assoc();
if (!$soal) {
    flash_set('error', 'Soal tidak ditemukan.');
    redirect('index.php');
}

$soal['pasangan'] = [];
if ($soal['tipe'] === 'menjodohkan') {
    $stmt2 = $conn->prepare("SELECT kolom_kiri, kolom_kanan FROM pasangan_menjodohkan WHERE id_soal = ? ORDER BY urutan");
    $stmt2->bind_param('i', $id);
    $stmt2->execute();
    $soal['pasangan'] = $stmt2->get_result()->fetch_all(MYSQLI_ASSOC);
}

$error = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $tipe = $_POST['tipe'] ?? $soal['tipe'];
    $pertanyaan = trim($_POST['pertanyaan'] ?? '');
    $poin = (int)($_POST['poin'] ?? 0);

    if (!in_array($tipe, ['essay', 'isian', 'menjodohkan']) || $pertanyaan === '' || $poin < 1) {
        $error = 'Data tidak lengkap atau tidak valid.';
    } else {
        $kunci = null;
        $petunjuk = null;
        if ($tipe === 'essay') {
            $kunci = trim($_POST['kunci'] ?? '');
            $petunjuk = trim($_POST['petunjuk'] ?? '');
        }
        if ($tipe === 'isian') {
            $kunci = trim($_POST['kunci_isian'] ?? '');
        }

        $stmt = $conn->prepare("UPDATE bank_soal SET tipe = ?, pertanyaan = ?, kunci = ?, petunjuk = ?, poin = ? WHERE id = ?");
        $stmt->bind_param('ssssii', $tipe, $pertanyaan, $kunci, $petunjuk, $poin, $id);
        $stmt->execute();

        if ($tipe === 'menjodohkan') {
            $conn->prepare("DELETE FROM pasangan_menjodohkan WHERE id_soal = ?")->execute([$id]);
            $kiri = $_POST['kiri'] ?? [];
            $kanan = $_POST['kanan'] ?? [];
            $stmt2 = $conn->prepare("INSERT INTO pasangan_menjodohkan (id_soal, kolom_kiri, kolom_kanan, urutan) VALUES (?, ?, ?, ?)");
            $urutan = 1;
            foreach ($kiri as $i => $k) {
                $ki = trim($k);
                $ka = trim($kanan[$i] ?? '');
                if ($ki === '' || $ka === '') continue;
                $stmt2->bind_param('issi', $id, $ki, $ka, $urutan);
                $stmt2->execute();
                $urutan++;
            }
        }

        flash_set('sukses', 'Soal berhasil diperbarui.');
        redirect('index.php');
    }
}

$title = 'Edit Soal';
require __DIR__ . '/../../views/layout_admin_top.php';
?>

<div class="flex items-center justify-between">
  <h1 class="text-2xl font-bold text-slate-800">Edit Soal</h1>
  <a href="index.php" class="rounded-lg border border-slate-300 bg-white px-4 py-2 text-sm text-slate-600 hover:bg-slate-50">← Kembali</a>
</div>

<?php if ($error): ?>
  <div class="mt-4 rounded-lg border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700"><?= e($error) ?></div>
<?php endif; ?>

<form method="post" class="mt-4 rounded-2xl bg-white p-6 shadow">
  <?php require '_form.php'; ?>
  <div class="mt-6 border-t border-slate-100 pt-4">
    <button type="submit" class="rounded-lg bg-indigo-600 px-5 py-2.5 text-sm font-semibold text-white hover:bg-indigo-700">Simpan Perubahan</button>
  </div>
</form>

<?php require __DIR__ . '/../../views/layout_admin_bottom.php'; ?>