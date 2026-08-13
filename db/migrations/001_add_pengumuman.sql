-- ============================================================
-- Migrasi: Tambah tabel pengumuman untuk asesmen-non-pg
-- Jalankan: mysql -u root -prootpass asesmen_non_pg < db/migrations/001_add_pengumuman.sql
-- ============================================================

SET NAMES utf8mb4;

-- Tabel pengumuman
CREATE TABLE IF NOT EXISTS pengumuman (
  id INT AUTO_INCREMENT PRIMARY KEY,
  judul VARCHAR(150) NOT NULL,
  isi TEXT NOT NULL,
  tipe ENUM('umum','ujian','penting') NOT NULL DEFAULT 'umum',
  id_ujian INT NULL,
  id_kelas INT NULL,
  ditampilkan TINYINT(1) NOT NULL DEFAULT 1,
  created_by INT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_pengumuman_ujian FOREIGN KEY (id_ujian) REFERENCES ujian(id) ON DELETE SET NULL,
  CONSTRAINT fk_pengumuman_kelas FOREIGN KEY (id_kelas) REFERENCES kelas(id) ON DELETE SET NULL,
  CONSTRAINT fk_pengumuman_admin FOREIGN KEY (created_by) REFERENCES admin_users(id) ON DELETE SET NULL,
  KEY idx_pengumuman_tipe (tipe),
  KEY idx_pengumuman_ditampilkan (ditampilkan)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabel log aplikasi (audit trail)
CREATE TABLE IF NOT EXISTS log_aplikasi (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_type ENUM('admin','siswa') NOT NULL,
  user_id INT NOT NULL,
  aksi VARCHAR(100) NOT NULL,
  detail TEXT NULL,
  ip_address VARCHAR(45) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  KEY idx_log_user (user_type, user_id),
  KEY idx_log_aksi (aksi),
  KEY idx_log_created (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data awal pengumuman
INSERT INTO pengumuman (judul, isi, tipe, created_by) VALUES
('Selamat Datang di Asesmen Non-PG', 'Selamat datang di aplikasi asesmen online non pilihan ganda. Silakan kerjakan ujian dengan jujur dan teliti.', 'umum', 1),
('Peringatan Ujian', 'Dilarang membuka tab lain selama ujian berlangsung. Pelanggaran akan dicatat otomatis.', 'penting', 1)
ON DUPLICATE KEY UPDATE judul = judul;
