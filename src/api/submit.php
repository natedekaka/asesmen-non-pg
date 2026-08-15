<?php
require_once __DIR__ . '/../core/init.php';

if (!isset($_SESSION['siswa_id'])) {
    json_response(['ok' => false, 'error' => 'Sesi siswa tidak ada.'], 401);
}
if (!verify_csrf($_SERVER['HTTP_X_CSRF_TOKEN'] ?? '')) {
    json_response(['ok' => false, 'error' => 'Token CSRF tidak valid.'], 403);
}

$json = json_decode(file_get_contents('php://input'), true);
if (!is_array($json)) {
    json_response(['ok' => false, 'error' => 'JSON tidak valid.'], 400);
}

$id_sesi = (int)($json['sesi_id'] ?? 0);
$siswa_id = (int)$_SESSION['siswa_id'];
$conn = db();

$stmt = $conn->prepare("SELECT s.id, s.status, s.berakhir_pada, s.id_ujian, u.durasi_menit FROM sesi_ujian s JOIN ujian u ON u.id = s.id_ujian WHERE s.id = ? AND s.id_siswa = ?");
$stmt->bind_param('ii', $id_sesi, $siswa_id);
$stmt->execute();
$sesi = $stmt->get_result()->fetch_assoc();

if (!$sesi) {
    json_response(['ok' => false, 'error' => 'Sesi ujian tidak ditemukan.'], 404);
}
if ($sesi['status'] !== 'berlangsung') {
    json_response(['ok' => false, 'error' => 'Ujian sudah dikumpulkan.'], 409);
}

$id_ujian = (int)$sesi['id_ujian'];

// Simpan jawaban terakhir dari payload (bila ada) sebelum dinilai
$final = $json['jawaban'] ?? [];
if (is_array($final) && count($final) > 0) {
    $stmt_us = $conn->prepare("SELECT id, id_soal FROM ujian_soal WHERE id_ujian = ? AND id = ?");
    $stmt_jaw = $conn->prepare("INSERT INTO jawaban (id_sesi, id_ujian_soal, jawaban) VALUES (?, ?, ?) ON DUPLICATE KEY UPDATE jawaban = VALUES(jawaban)");
    foreach ($final as $id_us => $val) {
        $id_us = (int)$id_us;
        if ($id_us < 1) continue;
        $stmt_us->bind_param('ii', $id_ujian, $id_us);
        $stmt_us->execute();
        $us = $stmt_us->get_result()->fetch_assoc();
        if (!$us) continue;
        $teks = is_array($val) ? json_encode($val, JSON_UNESCAPED_UNICODE) : (string)$val;
        $stmt_jaw->bind_param('iis', $id_sesi, $id_us, $teks);
        $stmt_jaw->execute();
    }
}

// Ambil semua soal ujian + jawaban tersimpan
$semua = $conn->prepare("
    SELECT us.id AS id_us, us.id_soal, b.tipe, b.poin, b.kunci,
           (SELECT j.jawaban FROM jawaban j WHERE j.id_sesi = ? AND j.id_ujian_soal = us.id) AS jawaban_teks,
           (SELECT j.status_koreksi FROM jawaban j WHERE j.id_sesi = ? AND j.id_ujian_soal = us.id) AS status_koreksi
    FROM ujian_soal us
    JOIN bank_soal b ON b.id = us.id_soal
    WHERE us.id_ujian = ?
    ORDER BY us.urutan, us.id
");
$semua->bind_param('iii', $id_sesi, $id_sesi, $id_ujian);
$semua->execute();
$soal_list = $semua->get_result()->fetch_all(MYSQLI_ASSOC);

$total_auto = 0;
$ada_essay = false;

// Siapkan jawaban: masukkan skor auto untuk isian & menjodohkan, essay dibiarkan 'belum'
$upd = $conn->prepare("UPDATE jawaban SET skor = ?, status_koreksi = 'otomatis' WHERE id_sesi = ? AND id_ujian_soal = ?");
$upd_essay = $conn->prepare("INSERT INTO jawaban (id_sesi, id_ujian_soal, jawaban, status_koreksi) VALUES (?, ?, ?, 'belum') ON DUPLICATE KEY UPDATE jawaban = VALUES(jawaban)");

foreach ($soal_list as $s) {
    $id_us = (int)$s['id_us'];
    $tipe = $s['tipe'];
    $poin = (int)$s['poin'];
    $skor = null;

    if ($tipe === 'isian') {
        $jawaban = trim((string)$s['jawaban_teks']);
        $kunci_raw = (string)$s['kunci'];
        $kunci_list = array_map('trim', explode('||', $kunci_raw));
        $jawaban_ci = mb_strtolower($jawaban);
        $cocok = false;
        foreach ($kunci_list as $k) {
            if ($k !== '' && $jawaban_ci === mb_strtolower($k)) {
                $cocok = true;
                break;
            }
        }
        $skor = $cocok && $jawaban !== '' ? $poin : 0;
        if ($jawaban === '') $skor = 0;
    }

    if ($tipe === 'menjodohkan') {
        // Jawaban siswa: JSON {id_pasangan_kiri: id_pilihan_kanan}
        $t = (string)$s['jawaban_teks'];
        $map = $t !== '' ? json_decode($t, true) : null;

        $stmt_pair = $conn->prepare("SELECT id, kolom_kiri, kolom_kanan FROM pasangan_menjodohkan WHERE id_soal = ? ORDER BY urutan");
        $stmt_pair->bind_param('i', $s['id_soal']);
        $stmt_pair->execute();
        $pasangan = $stmt_pair->get_result()->fetch_all(MYSQLI_ASSOC);

        // Kumpulkan semua pilihan kanan (id => teks) untuk antarmuka siswa
        $total_pasangan = count($pasangan);
        $benar = 0;
        if (is_array($map) && $total_pasangan > 0) {
            $semua_kanan = [];
            foreach ($pasangan as $p) {
                $semua_kanan[(int)$p['id']] = mb_strtolower(trim((string)$p['kolom_kanan']));
            }
            foreach ($pasangan as $p) {
                $id_kiri = (int)$p['id'];
                $terpilih_raw = $map[$id_kiri] ?? null;
                if ($terpilih_raw === null || $terpilih_raw === '') continue;
                $terpilih_raw = (string)$terpilih_raw;
                if (is_numeric($terpilih_raw) && isset($semua_kanan[(int)$terpilih_raw])) {
                    $teks_terpilih = $semua_kanan[(int)$terpilih_raw];
                } else {
                    $teks_terpilih = mb_strtolower(trim($terpilih_raw));
                }
                if ($teks_terpilih === mb_strtolower(trim((string)$p['kolom_kanan']))) {
                    $benar++;
                }
            }
        }
        $skor = $total_pasangan > 0 ? (int)round($poin * $benar / $total_pasangan) : 0;
    }

    if ($tipe === 'essay') {
        $ada_essay = true;
        $teks = (string)$s['jawaban_teks'];
        $upd_essay->bind_param('iis', $id_sesi, $id_us, $teks);
        $upd_essay->execute();
        continue;
    }

    if ($skor !== null) {
        $upd->bind_param('iii', $skor, $id_sesi, $id_us);
        $upd->execute();
        $total_auto += $skor;
    }
}

$ip = $_SERVER['REMOTE_ADDR'] ?? null;
$status = $ada_essay ? 'submitted' : 'dinilai';

$stmt_upd = $conn->prepare("UPDATE sesi_ujian SET status = ?, submitted_at = NOW(), total_skor = ?, total_poin_auto = ?, total_poin_manual = 0, ip_address = ? WHERE id = ?");
$stmt_upd->bind_param('siiis', $status, $total_auto, $total_auto, $ip, $id_sesi);
$stmt_upd->execute();

json_response([
    'ok' => true,
    'status' => $status,
    'total_skor' => $total_auto,
    'ada_essay' => $ada_essay,
]);