-- ============================================================
-- Aplikasi Asesmen Non-PG (essay, menjodohkan, isian singkat)
-- Skema inisialisasi untuk MariaDB 10.11
-- Charset: utf8mb4 | Engine: InnoDB
-- ============================================================

SET NAMES utf8mb4;
SET time_zone = '+07:00';

-- 1. Admin ----------------------------------------------------
CREATE TABLE IF NOT EXISTS admin_users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  nama_lengkap VARCHAR(100) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Kelas ----------------------------------------------------
CREATE TABLE IF NOT EXISTS kelas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama_kelas VARCHAR(50) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Siswa (login: NIS + password = NIS) ----------------------
CREATE TABLE IF NOT EXISTS siswa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nis VARCHAR(50) NOT NULL UNIQUE,
  nama_lengkap VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  kelas_id INT NULL,
  is_active TINYINT(1) DEFAULT 1,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_siswa_kelas FOREIGN KEY (kelas_id) REFERENCES kelas(id) ON DELETE SET NULL,
  KEY idx_siswa_kelas (kelas_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Bank Soal -------------------------------------------------
CREATE TABLE IF NOT EXISTS bank_soal (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tipe ENUM('essay','isian','menjodohkan') NOT NULL,
  pertanyaan TEXT NOT NULL,
  kunci TEXT NULL,                 -- essay: jawaban referensi; isian: kunci jawaban (pisahkan alternatif dengan ||)
  petunjuk TEXT NULL,              -- opsional, untuk pedoman penilaian essay
  poin INT NOT NULL DEFAULT 10,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Pasangan menjodohkan (berelasi ke bank_soal) --------------
CREATE TABLE IF NOT EXISTS pasangan_menjodohkan (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_soal INT NOT NULL,
  kolom_kiri VARCHAR(255) NOT NULL,
  kolom_kanan VARCHAR(255) NOT NULL,
  urutan INT NOT NULL DEFAULT 0,
  CONSTRAINT fk_pasangan_soal FOREIGN KEY (id_soal) REFERENCES bank_soal(id) ON DELETE CASCADE,
  KEY idx_pasangan_soal (id_soal)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Ujian / Asesmen -------------------------------------------
CREATE TABLE IF NOT EXISTS ujian (
  id INT AUTO_INCREMENT PRIMARY KEY,
  judul VARCHAR(150) NOT NULL,
  mata_pelajaran VARCHAR(100) NULL,
  deskripsi TEXT NULL,
  tanggal_mulai DATETIME NULL,
  tanggal_selesai DATETIME NULL,
  durasi_menit INT NOT NULL DEFAULT 60,
  status ENUM('draft','aktif','selesai') NOT NULL DEFAULT 'draft',
  acak_soal TINYINT(1) NOT NULL DEFAULT 0,
  tampilkan_hasil TINYINT(1) NOT NULL DEFAULT 1,
  created_by INT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_ujian_admin FOREIGN KEY (created_by) REFERENCES admin_users(id) ON DELETE SET NULL,
  KEY idx_ujian_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Soal dalam ujian ------------------------------------------
CREATE TABLE IF NOT EXISTS ujian_soal (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_ujian INT NOT NULL,
  id_soal INT NOT NULL,
  urutan INT NOT NULL DEFAULT 0,
  CONSTRAINT fk_us_ujian FOREIGN KEY (id_ujian) REFERENCES ujian(id) ON DELETE CASCADE,
  CONSTRAINT fk_us_soal FOREIGN KEY (id_soal) REFERENCES bank_soal(id) ON DELETE CASCADE,
  UNIQUE KEY uk_us (id_ujian, id_soal),
  KEY idx_us_ujian (id_ujian)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. Kelas peserta ujian ---------------------------------------
CREATE TABLE IF NOT EXISTS ujian_kelas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_ujian INT NOT NULL,
  id_kelas INT NOT NULL,
  CONSTRAINT fk_ukelas_ujian FOREIGN KEY (id_ujian) REFERENCES ujian(id) ON DELETE CASCADE,
  CONSTRAINT fk_ukelas_kelas FOREIGN KEY (id_kelas) REFERENCES kelas(id) ON DELETE CASCADE,
  UNIQUE KEY uk_ukelas (id_ujian, id_kelas)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9. Sesi ujian siswa ------------------------------------------
CREATE TABLE IF NOT EXISTS sesi_ujian (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_ujian INT NOT NULL,
  id_siswa INT NOT NULL,
  mulai_pada DATETIME NULL,
  berakhir_pada DATETIME NULL,     -- batas waktu pengerjaan (mulai + durasi)
  submitted_at DATETIME NULL,
  status ENUM('berlangsung','submitted','dinilai','dikoreksi') NOT NULL DEFAULT 'berlangsung',
  total_skor INT NOT NULL DEFAULT 0,
  total_poin_auto INT NOT NULL DEFAULT 0,
  total_poin_manual INT NOT NULL DEFAULT 0,
  ip_address VARCHAR(45) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_sesi_ujian FOREIGN KEY (id_ujian) REFERENCES ujian(id) ON DELETE CASCADE,
  CONSTRAINT fk_sesi_siswa FOREIGN KEY (id_siswa) REFERENCES siswa(id) ON DELETE CASCADE,
  UNIQUE KEY uk_sesi (id_ujian, id_siswa),
  KEY idx_sesi_siswa (id_siswa)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10. Jawaban siswa --------------------------------------------
CREATE TABLE IF NOT EXISTS jawaban (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_sesi INT NOT NULL,
  id_ujian_soal INT NOT NULL,
  jawaban TEXT NULL,               -- isian/essay: teks; menjodohkan: JSON {kiri_id: kanan_id}
  skor INT NULL,                   -- NULL = belum dikoreksi
  status_koreksi ENUM('belum','otomatis','manual') NOT NULL DEFAULT 'belum',
  catatan TEXT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_jawaban_sesi FOREIGN KEY (id_sesi) REFERENCES sesi_ujian(id) ON DELETE CASCADE,
  CONSTRAINT fk_jawaban_us FOREIGN KEY (id_ujian_soal) REFERENCES ujian_soal(id) ON DELETE CASCADE,
  UNIQUE KEY uk_jawaban (id_sesi, id_ujian_soal),
  KEY idx_jawaban_sesi (id_sesi)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================
-- DATA AWAL
-- ============================================================

-- Admin default: admin / admin123 (agar langsung bisa login; ganti kata sandi setelah masuk)
INSERT INTO admin_users (username, password, nama_lengkap) VALUES
('admin', '$2y$10$pD8Cj8eu/cA7pJ5Xw8/jWexGigVdsT8mDOHvc5DPegZM.qzUnRJ4W', 'Administrator')
ON DUPLICATE KEY UPDATE username = username;

-- Kelas contoh
INSERT INTO kelas (nama_kelas) VALUES ('XII-RPL-1'), ('XII-RPL-2')
ON DUPLICATE KEY UPDATE nama_kelas = nama_kelas;

-- Siswa contoh (password = NIS)
INSERT INTO siswa (nis, nama_lengkap, password, kelas_id, is_active) VALUES
('23001', 'Ahmad Fauzi',   '$2y$10$9biaI9Xmjl5vXm//om7LcuiCrkw4D8wDZwUHRxWN.vd3EfG9Awh2q', 1, 1),
('23002', 'Budi Santoso',  '$2y$10$eyfBdfSOp9QVOZNJOvRzUeBkIqN.CNsto640cAqTP7WAFMQhzsa6e', 1, 1),
('23003', 'Citra Lestari', '$2y$10$GB.BPZkByrkPxkB7V2F5HeTBuQdeioMuCiYiKdt4QOmWRrFOT8CXa', 2, 1)
ON DUPLICATE KEY UPDATE nis = nis;

-- Bank soal contoh -------------------------------------------------
INSERT INTO bank_soal (tipe, pertanyaan, kunci, petunjuk, poin) VALUES
('essay', 'Jelaskan perbedaan antara HTTP dan HTTPS secara singkat!',
 'HTTPS menggunakan enkripsi SSL/TLS sedangkan HTTP tidak. HTTPS mengamankan data selama transmisi, HTTP mengirim data plaintext.',
 'Skor penuh jika menyebutkan enkripsi dan keamanan data.', 20),
('isian', 'Kepanjangan dari SQL adalah ...',
 'Structured Query Language||structured query language', NULL, 10),
('isian', 'Bahasa pemrograman yang umum digunakan untuk membuat halaman web dinamis di sisi server adalah ...',
 'PHP||php||Python||python', NULL, 10),
('menjodohkan', 'Pasangkan istilah jaringan komputer berikut dengan pengertian yang benar!',
 NULL, 'Setiap pasangan bernilai 5 poin.', 20)
ON DUPLICATE KEY UPDATE pertanyaan = pertanyaan;

INSERT INTO pasangan_menjodohkan (id_soal, kolom_kiri, kolom_kanan, urutan) VALUES
(4, 'HTTP', 'Protocol transfer data tanpa enkripsi', 1),
(4, 'HTTPS', 'Protocol transfer data dengan enkripsi', 2),
(4, 'FTP', 'Protocol transfer file antar komputer', 3),
(4, 'SMTP', 'Protocol pengiriman email', 4);

-- Ujian contoh ------------------------------------------------------
INSERT INTO ujian (judul, mata_pelajaran, deskripsi, tanggal_mulai, tanggal_selesai, durasi_menit, status, tampilkan_hasil, created_by) VALUES
('Asesmen Jaringan Dasar', 'Jaringan Komputer', 'Ujian non-PG jaringan komputer untuk kelas XII RPL.',
 DATE_FORMAT(NOW(), '%Y-%m-%d 07:00:00'), DATE_FORMAT(NOW() + INTERVAL 7 DAY, '%Y-%m-%d 23:59:59'),
 30, 'aktif', 1, 1)
ON DUPLICATE KEY UPDATE judul = judul;

INSERT INTO ujian_soal (id_ujian, id_soal, urutan) VALUES
(1, 1, 1), (1, 2, 2), (1, 3, 3), (1, 4, 4)
ON DUPLICATE KEY UPDATE id_ujian = id_ujian;

INSERT INTO ujian_kelas (id_ujian, id_kelas) VALUES (1, 1), (1, 2)
ON DUPLICATE KEY UPDATE id_ujian = id_ujian;