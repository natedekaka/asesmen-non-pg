-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Waktu pembuatan: 13 Agu 2026 pada 22.13
-- Versi server: 10.11.18-MariaDB-ubu2204
-- Versi PHP: 8.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `asesmen_non_pg`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `nama_lengkap`, `created_at`) VALUES
(1, 'admin', '$2y$10$pD8Cj8eu/cA7pJ5Xw8/jWexGigVdsT8mDOHvc5DPegZM.qzUnRJ4W', 'Administrator', '2026-08-12 09:32:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_soal`
--

CREATE TABLE `bank_soal` (
  `id` int(11) NOT NULL,
  `tipe` enum('essay','isian','menjodohkan') NOT NULL,
  `pertanyaan` text NOT NULL,
  `kunci` text DEFAULT NULL,
  `petunjuk` text DEFAULT NULL,
  `poin` int(11) NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bank_soal`
--

INSERT INTO `bank_soal` (`id`, `tipe`, `pertanyaan`, `kunci`, `petunjuk`, `poin`, `created_at`, `updated_at`) VALUES
(1, 'essay', 'Jelaskan perbedaan antara HTTP dan HTTPS secara singkat!', 'HTTPS menggunakan enkripsi SSL/TLS sedangkan HTTP tidak. HTTPS mengamankan data selama transmisi, HTTP mengirim data plaintext.', 'Skor penuh jika menyebutkan enkripsi dan keamanan data.', 20, '2026-08-12 09:32:45', '2026-08-12 09:32:45'),
(2, 'isian', 'Kepanjangan dari SQL adalah ...', 'Structured Query Language||structured query language', NULL, 10, '2026-08-12 09:32:45', '2026-08-12 09:32:45'),
(3, 'isian', 'Bahasa pemrograman yang umum digunakan untuk membuat halaman web dinamis di sisi server adalah ...', 'PHP||php||Python||python', NULL, 10, '2026-08-12 09:32:45', '2026-08-12 09:32:45'),
(4, 'menjodohkan', 'Pasangkan istilah jaringan komputer berikut dengan pengertian yang benar!', NULL, 'Setiap pasangan bernilai 5 poin.', 20, '2026-08-12 09:32:45', '2026-08-12 09:32:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jawaban`
--

CREATE TABLE `jawaban` (
  `id` int(11) NOT NULL,
  `id_sesi` int(11) NOT NULL,
  `id_ujian_soal` int(11) NOT NULL,
  `jawaban` text DEFAULT NULL,
  `skor` int(11) DEFAULT NULL,
  `status_koreksi` enum('belum','otomatis','manual') NOT NULL DEFAULT 'belum',
  `catatan` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jawaban`
--

INSERT INTO `jawaban` (`id`, `id_sesi`, `id_ujian_soal`, `jawaban`, `skor`, `status_koreksi`, `catatan`, `updated_at`) VALUES
(6, 3, 1, 'dari segi keamanan. https lebih secure daripada http', NULL, 'belum', NULL, '2026-08-12 09:55:41'),
(7, 3, 2, 'sistem query language', 0, 'otomatis', NULL, '2026-08-12 09:56:52'),
(8, 3, 3, 'php', 10, 'otomatis', NULL, '2026-08-12 09:56:52'),
(9, 3, 4, '{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\"}', 20, 'otomatis', NULL, '2026-08-12 09:56:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `created_at`) VALUES
(1, 'XII-RPL-1', '2026-08-12 09:32:45'),
(2, 'XII-RPL-2', '2026-08-12 09:32:45'),
(3, 'X-1', '2026-08-12 09:59:44'),
(4, 'XII-9', '2026-08-12 09:59:44'),
(5, 'XII-8', '2026-08-12 09:59:44'),
(6, 'XII-4', '2026-08-12 09:59:44'),
(7, 'XII-5', '2026-08-12 09:59:44'),
(8, 'XII-3', '2026-08-12 09:59:44'),
(9, 'XII-1', '2026-08-12 09:59:44'),
(10, 'XII-6', '2026-08-12 09:59:44'),
(11, 'XII-11', '2026-08-12 09:59:44'),
(12, 'XII-7', '2026-08-12 09:59:44'),
(13, 'XII-10', '2026-08-12 09:59:44'),
(14, 'XII-2', '2026-08-12 09:59:44'),
(15, 'XI-11', '2026-08-12 09:59:44'),
(16, 'XI-4', '2026-08-12 09:59:44'),
(17, 'XI-9', '2026-08-12 09:59:44'),
(18, 'XI-7', '2026-08-12 09:59:44'),
(19, 'XI-10', '2026-08-12 09:59:44'),
(20, 'XI-1', '2026-08-12 09:59:44'),
(21, 'XI-8', '2026-08-12 09:59:44'),
(22, 'XI-2', '2026-08-12 09:59:44'),
(23, 'XI-6', '2026-08-12 09:59:44'),
(24, 'XI-5', '2026-08-12 09:59:44'),
(25, 'XI-3', '2026-08-12 09:59:44'),
(26, 'XI-12', '2026-08-12 09:59:44'),
(27, 'X-2', '2026-08-12 09:59:44'),
(28, 'X-3', '2026-08-12 09:59:44'),
(29, 'X-4', '2026-08-12 09:59:44'),
(30, 'X-5', '2026-08-12 09:59:44'),
(31, 'X-6', '2026-08-12 09:59:44'),
(32, 'X-7', '2026-08-12 09:59:44'),
(33, 'X-8', '2026-08-12 09:59:44'),
(34, 'X-9', '2026-08-12 09:59:44'),
(35, 'X-10', '2026-08-12 09:59:44'),
(36, 'X-11', '2026-08-12 09:59:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aplikasi`
--

CREATE TABLE `log_aplikasi` (
  `id` int(11) NOT NULL,
  `user_type` enum('admin','siswa') NOT NULL,
  `user_id` int(11) NOT NULL,
  `aksi` varchar(100) NOT NULL,
  `detail` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasangan_menjodohkan`
--

CREATE TABLE `pasangan_menjodohkan` (
  `id` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `kolom_kiri` varchar(255) NOT NULL,
  `kolom_kanan` varchar(255) NOT NULL,
  `urutan` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pasangan_menjodohkan`
--

INSERT INTO `pasangan_menjodohkan` (`id`, `id_soal`, `kolom_kiri`, `kolom_kanan`, `urutan`) VALUES
(1, 4, 'HTTP', 'Protocol transfer data tanpa enkripsi', 1),
(2, 4, 'HTTPS', 'Protocol transfer data dengan enkripsi', 2),
(3, 4, 'FTP', 'Protocol transfer file antar komputer', 3),
(4, 4, 'SMTP', 'Protocol pengiriman email', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `isi` text NOT NULL,
  `tipe` enum('umum','ujian','penting') NOT NULL DEFAULT 'umum',
  `id_ujian` int(11) DEFAULT NULL,
  `id_kelas` int(11) DEFAULT NULL,
  `ditampilkan` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `judul`, `isi`, `tipe`, `id_ujian`, `id_kelas`, `ditampilkan`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Selamat Datang di Asesmen Non-PG', 'Selamat datang di aplikasi asesmen online non pilihan ganda. Silakan kerjakan ujian dengan jujur dan teliti.', 'umum', NULL, NULL, 1, 1, '2026-08-13 06:54:03', '2026-08-13 06:54:03'),
(2, 'Peringatan Ujian', 'Dilarang membuka tab lain selama ujian berlangsung. Pelanggaran akan dicatat otomatis.', 'penting', NULL, NULL, 1, 1, '2026-08-13 06:54:03', '2026-08-13 06:54:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sesi_ujian`
--

CREATE TABLE `sesi_ujian` (
  `id` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `mulai_pada` datetime DEFAULT NULL,
  `berakhir_pada` datetime DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `status` enum('berlangsung','submitted','dinilai','dikoreksi') NOT NULL DEFAULT 'berlangsung',
  `total_skor` int(11) NOT NULL DEFAULT 0,
  `total_poin_auto` int(11) NOT NULL DEFAULT 0,
  `total_poin_manual` int(11) NOT NULL DEFAULT 0,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sesi_ujian`
--

INSERT INTO `sesi_ujian` (`id`, `id_ujian`, `id_siswa`, `mulai_pada`, `berakhir_pada`, `submitted_at`, `status`, `total_skor`, `total_poin_auto`, `total_poin_manual`, `ip_address`, `created_at`) VALUES
(3, 1, 3, '2026-08-12 16:55:05', '2026-08-12 10:25:05', '2026-08-12 16:56:52', 'submitted', 30, 30, 0, '172', '2026-08-12 09:55:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `kelas_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama_lengkap`, `password`, `kelas_id`, `is_active`, `created_at`) VALUES
(1, '23001', 'Ahmad Fauzi', '$2y$10$9biaI9Xmjl5vXm//om7LcuiCrkw4D8wDZwUHRxWN.vd3EfG9Awh2q', 1, 1, '2026-08-12 09:32:45'),
(2, '23002', 'Budi Santoso', '$2y$10$eyfBdfSOp9QVOZNJOvRzUeBkIqN.CNsto640cAqTP7WAFMQhzsa6e', 1, 1, '2026-08-12 09:32:45'),
(3, '23003', 'Citra Lestari', '$2y$10$GB.BPZkByrkPxkB7V2F5HeTBuQdeioMuCiYiKdt4QOmWRrFOT8CXa', 2, 1, '2026-08-12 09:32:45'),
(4, '12345', 'Daniarsyah', '$2y$10$eyXvc7hDkMosdUcrOFRT4OoymtXUmRPl5XFGZqJTekfPKuurEKOlO', 3, 1, '2026-08-12 09:59:44'),
(5, '242510001', 'AKBAR RAMADAN', '$2y$10$lSbMedSN67PMDdXckB1Yy.fFVeTGUPlIL0qY2EmfNxSMyMihFy72G', 4, 1, '2026-08-12 09:59:44'),
(6, '242510002', 'ALYA MUKHBITHA RAMADHANI', '$2y$10$H5bHAHDu2suKUJWJFikKxO1tKpHTD3k8QR6eb3UxcYmj7u2HBMPbK', 5, 1, '2026-08-12 09:59:44'),
(7, '242510003', 'AULIA NUR ANNISSA', '$2y$10$m8OQ1DAX.wWmgArI2N5n1OukWEH0uXK3splWmb45vxl6oHI3ATgBe', 4, 1, '2026-08-12 09:59:44'),
(8, '242510004', 'AYU RIZKI LESTARI', '$2y$10$pK9csq1v6UeuoR731ScFU.k5CMTMVJzhBNv38LRYpJIJi8qgE2CFG', 6, 1, '2026-08-12 09:59:44'),
(9, '242510005', 'AZZAHWA ASSYAFIQOH', '$2y$10$eRbuJeWPJH3vnboto25uwexmJr84gFYXADPBvTkMGEbztD3A7MlYS', 7, 1, '2026-08-12 09:59:44'),
(10, '242510006', 'BONG MARVELL', '$2y$10$cSxUlEUaDW/yTUUjinGJ0.3966w/iT3Oqb.pA8I8vr3A3DhCW5fLS', 6, 1, '2026-08-12 09:59:44'),
(11, '242510007', 'CAHYA KUMAIRA PUTRI HIDAYAH', '$2y$10$EBv4wb55itR1i9krhgAkIe2PsPJZKWq308vKI4NfHWx39HwLCZV6u', 8, 1, '2026-08-12 09:59:44'),
(12, '242510008', 'CITRA APRILIANI PRATAMA', '$2y$10$/ERWe59FCSyp7PrbjbAV3.o7eZouRTskO7n5YDCDwfPUHW/oXubQ.', 7, 1, '2026-08-12 09:59:44'),
(13, '242510009', 'DEWI ANGGRAENI SINAGA', '$2y$10$7AwtKNqlscxu7lHqAWH59uGk85tb7zXPKSPCQglVeXhC08L19DTk.', 9, 1, '2026-08-12 09:59:44'),
(14, '242510010', 'DIAN TRI ASTUTI', '$2y$10$EceBo9cQTxlvEvdgGdRgVOKiOy6yPd4rfmQ09A0j/2Zul6Gdj/BUC', 7, 1, '2026-08-12 09:59:44'),
(15, '242510011', 'DIPA NGESTU GUSTI', '$2y$10$u7o1TmcDEt9L1s9DjkJmJ.sUX8WOlm9dceUJyokPVqSyLtbQTUChi', 10, 1, '2026-08-12 09:59:44'),
(16, '242510012', 'ERLANG AGUNG SETIAWAN', '$2y$10$JV82eMOEsjL7oRBBhEw5Z.3YBQUytPh1oAHODYJymzI.aUBupGUpu', 5, 1, '2026-08-12 09:59:44'),
(17, '242510013', 'FAEYZA INTAN GHAISANI', '$2y$10$ZptWoFiapOUCH48evj6oBOe1Tt/Uhji.PsDYWwVyzRZ9B3/JceMry', 6, 1, '2026-08-12 09:59:44'),
(18, '242510014', 'FAHRI ALFIAN', '$2y$10$Z/0.SaZ52x4te4Gd1n2L3OkXyOHbLKeanSOO7tfwHUGYmdaZEnPzy', 11, 1, '2026-08-12 09:59:44'),
(19, '242510015', 'FAKHRI AKMAL MUZAKKI', '$2y$10$lmqVHYvnlWINhx5OusMu7uFx6hTV6Ox8pXLGAGWvHiudY4e3ZIVCK', 10, 1, '2026-08-12 09:59:44'),
(20, '242510017', 'FIRDA NUR FADILAH', '$2y$10$AD2U08kKtHvYIYDdUw0l6e.eGv5D6GJmYWFFgbq5Hm9rL24HM8qZy', 7, 1, '2026-08-12 09:59:44'),
(21, '242510018', 'GIRLY AURELVIA', '$2y$10$vzYBP.i4.UK6CUJWaBSZAeYU20iIGv2KMlyjj8m8Ap5uOekbtMMHq', 12, 1, '2026-08-12 09:59:44'),
(22, '242510019', 'HAMDAN AHMAD BUDIMAN', '$2y$10$Xf44RBwXtgXabqSiE4.fnuLCpg7MiHRnyWjSoHxYRROQJIA6v5tYi', 13, 1, '2026-08-12 09:59:44'),
(23, '242510020', 'KAFKA ABDEE HAFIEDZ', '$2y$10$h3col9/USloNHhsX0Ne8sult/RsDvEN.ZrZgDoqiqft7x9FRr.FtG', 8, 1, '2026-08-12 09:59:44'),
(24, '242510021', 'KEYZZA AMEERA SUKENDAR', '$2y$10$SoUL1SpCWbMsjd/ZF7wT7eMRWA67KYNO81LLLj5vqUKq3rCJXJKaq', 13, 1, '2026-08-12 09:59:44'),
(25, '242510022', 'KIRANA PUSPITA MAHARANI', '$2y$10$0MW1s8f0ujkH7/C.FmSB8eFCNWvrKcRkzpQ6.fliHEaRflbkuSnrW', 9, 1, '2026-08-12 09:59:44'),
(26, '242510023', 'MAESYA SABANI', '$2y$10$lF77fLdKv6qzo5mHkPCFn.UzFKpUffvFdJwVXKJbFay863l/PfNju', 9, 1, '2026-08-12 09:59:44'),
(27, '242510024', 'MALFA RAISYA KHANSA', '$2y$10$Vtd5aIzvdRpHqLX25G8DAepDoyXjWI0v9ENj00x3QQGvr3zOP6kKm', 8, 1, '2026-08-12 09:59:44'),
(28, '242510025', 'MILA ANGGRAENI', '$2y$10$8Io0/zhnMKRzBl4c7bCJu.sw1Zp8WRJJHj1tP9AZybWI1ZBUVwMDa', 13, 1, '2026-08-12 09:59:44'),
(29, '242510026', 'MOCHAMAD ABDUL LATAEF', '$2y$10$Sma81fQDk1z0Qtt7AizIduG.pnJ0NmjtKrV1R2oKrog1DNp2a0YVC', 10, 1, '2026-08-12 09:59:44'),
(30, '242510027', 'MUHAMAD DAFFA BUSYROLKARIM', '$2y$10$1yeudC6Pmn4siQ5xRova..9579uHzCn/Kb/2GzXarynfyBDR2Yjmi', 12, 1, '2026-08-12 09:59:44'),
(31, '242510028', 'MUHAMMAD AZKA RAISSA PUTRA', '$2y$10$P1S.9PrOEb4ASl1P/ImNOO02wavVMbHJpU/g.4nP4VQHM1XOm39cS', 10, 1, '2026-08-12 09:59:44'),
(32, '242510029', 'MUHAMMAD RASYAD ASYAFIQ', '$2y$10$ZB0bOGOzH/g0ySwCU3pkKu72TTysWojhjo/67X5m/Nfziu0j4zJv.', 5, 1, '2026-08-12 09:59:44'),
(33, '242510030', 'MUHAMMAD RIZKI', '$2y$10$PIoINckdgy2bQIZjOrgDke.xiBSF2lndp.zcg3VBfd99UHSvn7rKu', 11, 1, '2026-08-12 09:59:44'),
(34, '242510031', 'NADIA MAHARANI', '$2y$10$DXu66h6NjcrBnk9kSCWtfeD1BANZNDGQMJafsn2RzK6ATOLCK4fGa', 14, 1, '2026-08-12 09:59:44'),
(35, '242510032', 'NENG NAZWA DARYATUL HUSNA', '$2y$10$lvvNr5FTKIR4JaLu6dOReuoZ8Z/vRvHlHYWAimau01thD0keCKYAe', 10, 1, '2026-08-12 09:59:44'),
(36, '242510033', 'PUTRI VANESHA FILLIA', '$2y$10$Sm6va0FvbO5Z3gWXvYPrr.thER.NoigwhXtYPuWMzhxZi73GupCRS', 12, 1, '2026-08-12 09:59:44'),
(37, '242510034', 'RADEN ADINDA SITI ZAHRA', '$2y$10$cMz50Uwm8PhmmlzxrSBxGuNKq.wMdaoTulGJtTchc7wYpCp4jrBKa', 4, 1, '2026-08-12 09:59:44'),
(38, '242510035', 'RAFFANARA ALIF FAHRURRAZI', '$2y$10$hn8nsTS3x3MlMwLNif6II.QG6M34Lax4Q9//FNPskAGrM7.4mvzOS', 12, 1, '2026-08-12 09:59:44'),
(39, '242510036', 'RIFKI SOPIAN', '$2y$10$r60w9I./YKkak0g6Q41YPuYkBvcaPa76oLTLj4BVdWqRESnbqNgkC', 5, 1, '2026-08-12 09:59:44'),
(40, '242510037', 'SAFA AFIFAH', '$2y$10$Uj77o7iqWpNhnJYZJErHeetwiR4n.hFzuGenq/iUKU.AxtyGFp/7u', 10, 1, '2026-08-12 09:59:44'),
(41, '242510038', 'SANNY APRILIANI', '$2y$10$WORwpyQuVTOn/rXuI0pGSeAmADYaCBwXFNqTVMUfaLGrNUyEaFAaC', 4, 1, '2026-08-12 09:59:44'),
(42, '242510039', 'SENDI MAULANA IBRAHIM', '$2y$10$oaANkZVt0pqbrScqkhc1y.LJAT.tq457Kx7Mjjj0Ny1TatGMsS29O', 11, 1, '2026-08-12 09:59:44'),
(43, '242510040', 'VINNA SILVIANA MAULIDA', '$2y$10$btMoYA.zOyvp3uNazURaJu1LCDqb8LG8/U2iXuEclIpXupeZb9dDi', 10, 1, '2026-08-12 09:59:44'),
(44, '242510041', 'AMELIA RAHMA ARISTAWATI', '$2y$10$9sD0yNenedEE6eUsq6MJBuFQnW9EMezPFhZltJZeqmleRwmycvpi.', 14, 1, '2026-08-12 09:59:44'),
(45, '242510042', 'ARYA ROMANSYAH HENDRAWAN', '$2y$10$iktC5QQDyt9Ko58uTU9ukOwP4WdSJ1ngr2SmDuw42FbPIcb3E6EF.', 6, 1, '2026-08-12 09:59:44'),
(46, '242510043', 'AZKA BAHARRIZKI PUTRA HERMANTO', '$2y$10$wZ2J9qGD6xVoBJwnV5vTGuHm.2M/ZRmN5ih2nJGvmqP9/tgOj6L2e', 14, 1, '2026-08-12 09:59:44'),
(47, '242510044', 'CAHAYA GITA MERLITHA', '$2y$10$/TbqAZqJ.8py4o71NYvnA.ymOsAiGYgKdPClI3/N3sU4dzmM82KzC', 4, 1, '2026-08-12 09:59:44'),
(48, '242510045', 'CANDRA MAHARDHIKA SANTOSO', '$2y$10$cLuA5xBi36f.uh5xU2sT/OrGawAZR2m2Fh.wCZuvEWwc8/1OrMcdO', 13, 1, '2026-08-12 09:59:44'),
(49, '242510046', 'FAREL ANDHIKA PUTRA', '$2y$10$9xzsPJIYQeiZA5aT9itfxuo7OJSo8eEqV148A3l5h2tWJ3vpwKPve', 14, 1, '2026-08-12 09:59:44'),
(50, '242510048', 'FINA NURWITA ROSADY', '$2y$10$k3dfMp9ypLlp2BuyRJSybe/CsXjJVEE3/7kwQkIvdU45aHKqRbIJa', 12, 1, '2026-08-12 09:59:44'),
(51, '242510049', 'GAIS PUTRI ANISA', '$2y$10$y//lYQg7MrTkVdvHfZuc2uH8NsDnLgwC7.dP0m2yBAtIFMKMU.UTq', 7, 1, '2026-08-12 09:59:44'),
(52, '242510050', 'GELLARDY RAVA GUSMINAR', '$2y$10$p5yRNVt7oYA6CO7/DEhE2esxIBfjPI9SiQJa2MrqxuIfzhTHmJdwy', 9, 1, '2026-08-12 09:59:44'),
(53, '242510051', 'GRACE YUNI ARTHA SIMAMORA', '$2y$10$3qNjP2aN0GytsuIebpqvWeCrabDhRmJ6X0Dt3nm0l//LnYW2xEp7.', 12, 1, '2026-08-12 09:59:44'),
(54, '242510052', 'HASBI HIBATULLOH', '$2y$10$GrhlgtILR1bIC4Kavbq6mOTr1okF3K5lEtVfrt8XrliDCpVDjwsqK', 4, 1, '2026-08-12 09:59:44'),
(55, '242510053', 'HERSYA ADHWA FITRIAS', '$2y$10$DIHSe1n3Nz6l424LzyS6HuA/4wuw2cSHDYpC4K3y6a4P8kK4XPOEK', 6, 1, '2026-08-12 09:59:44'),
(56, '242510054', 'KEANU REYHAN FARID AKBAR', '$2y$10$klV6riDIEvWZsFFDkUudYuEzQjUvwftY0qKL5HJjvN.UtY0hAG5/m', 13, 1, '2026-08-12 09:59:44'),
(57, '242510055', 'LAKEISHA AZIZAH', '$2y$10$RZJ.SxZCch.pZcROP2eAnOp5I3.sOPdks//4hYp1vVv1cnzIAnXeG', 9, 1, '2026-08-12 09:59:44'),
(58, '242510056', 'MUHAMMAD AHNAF ALFAREZI', '$2y$10$5cw7juhfws5mnFGURx8Y7.5EvLWXXB4UtCXA9q7kq.RiZNV29k1Nu', 14, 1, '2026-08-12 09:59:44'),
(59, '242510057', 'MUHAMMAD LUDTFI SULAEMAN', '$2y$10$O/82oHOQ5JhBltnCXcSvN.yzcc0VctcRrZbT379F//CLmv1qjEAbC', 12, 1, '2026-08-12 09:59:44'),
(60, '242510058', 'MUHAMMAD RAZAN IHSAN', '$2y$10$9kFMOE9xluurhf/PGyCsBul/FoxYGktxSKUX6pZxYaO/IXzyt5Epa', 10, 1, '2026-08-12 09:59:44'),
(61, '242510059', 'NASYWA PERMATA NURZAIN', '$2y$10$yUyy/6d.Vxg4kZoIxNy/H.NnjelUvo8q.O6ZHMixOQ2J0thRz.h12', 4, 1, '2026-08-12 09:59:44'),
(62, '242510060', 'NAZLA NAIMAH SIBGHATULLAH', '$2y$10$sqcI3FOMfY6x1khmIxfcRukufLsECxdq7aW4BRfWxSW7R96/L/pHC', 14, 1, '2026-08-12 09:59:44'),
(63, '242510061', 'NAZMA RAISHA PUTRI', '$2y$10$Idh9FykI0h44xIAthmk.5uayaV1umhBy4zWmcEeMaTJz1tb9zEns6', 9, 1, '2026-08-12 09:59:44'),
(64, '242510062', 'NAZWA DWI ANGGRAENI', '$2y$10$6UKUnvjo1QHrEAOwAGKOeuywUv4PWEtQUNeBuI17XN/bhuuYIROCi', 9, 1, '2026-08-12 09:59:44'),
(65, '242510063', 'NISRINA ANDRIANI MARDIAH', '$2y$10$SuRuZ/tNC.rFHMs18ZT69.LWOCHkJLP2JMOJgZ4yLiRsEpOBhiRde', 8, 1, '2026-08-12 09:59:44'),
(66, '242510064', 'NIZAR DZULFIKAR SATRIANI', '$2y$10$CGF3hki8gNbXvZYKEsaKBOcUj76zwR2h7A8FWGS4Sl2szIxU//N7u', 12, 1, '2026-08-12 09:59:44'),
(67, '242510065', 'PARIHAH NUR AZQIA', '$2y$10$LP/YsZGo8gaKXBYvIuVi7u8pt9HA7B50GhZlpwCcs7SV2WVMZ9q3C', 5, 1, '2026-08-12 09:59:44'),
(68, '242510066', 'PUTRI TSAMROTUL FUADAH', '$2y$10$5hiPETLbUmfrY7NL8E1FS.yqU1P4Cd/AtcdpRCCPfrDwXE0L8BZSq', 8, 1, '2026-08-12 09:59:44'),
(69, '242510067', 'RADEN AYUNDA SITI FATIMAH', '$2y$10$d1HOpzoKhjgaglTVCnCxuOqap.MEslqoV61X7HtFUcafxytFuwO82', 7, 1, '2026-08-12 09:59:44'),
(70, '242510068', 'RAINA MEDINA KHADIJAH', '$2y$10$hjN5q4yvjGuSZc07H3LiuuP0ai6rKEI8I80t7Yjj5u76U1sn7/Apq', 13, 1, '2026-08-12 09:59:44'),
(71, '242510069', 'RAINY PRECIOUS AHMAD', '$2y$10$9HhlBuJ4l6oI2AwGDZy5f.hekFO8Q2hM5ViUTjZP5e60ufvA7qmFW', 4, 1, '2026-08-12 09:59:44'),
(72, '242510070', 'REHAN HUSNI SALIM', '$2y$10$TNSG0guErkXbK4.Ycb.lleAKKB7oViPUazhy95b9dX5SELR4lxtlW', 9, 1, '2026-08-12 09:59:44'),
(73, '242510071', 'RESTU WULAN OKTAVIANI', '$2y$10$XB8lgEAkegFaI/VdZrTCwuk74tPNilT.mDk4vOfR4F065NBjb0wC.', 6, 1, '2026-08-12 09:59:44'),
(74, '242510072', 'REVA LINA SEPTIANI', '$2y$10$CCIHpN6XEB7nVGgvb73d7OylcJ7BphR9MuRHHiExKAL8v2lTrlYpG', 12, 1, '2026-08-12 09:59:44'),
(75, '242510073', 'REVALLINO NOVANSYAH HAQ', '$2y$10$/pfcnjr4Cjoqnshn14D.9.ZhtheL/gKUXpmr8YQTrX3/iFH/vhPXq', 5, 1, '2026-08-12 09:59:44'),
(76, '242510074', 'RIFALIKA NUR FITRI', '$2y$10$D5BFCjE1ml/zd4yX4NC7qep38Ehtn/17vqHMYtGnbKe9u9u5D1tGm', 4, 1, '2026-08-12 09:59:44'),
(77, '242510075', 'SAFFANAH PUTRI KAMILAH', '$2y$10$.U1Jq82ttJC..lRqlnAKjeLLGOlfCZfKdS9j1eht1f7UzIeXjYLyO', 14, 1, '2026-08-12 09:59:44'),
(78, '242510076', 'SANDI PRATAMA', '$2y$10$RgPzYYBEMwSSPVAFy2GC7.ZfPD4vMcS.3I4dbAl.CIXFpTW97UdiO', 4, 1, '2026-08-12 09:59:44'),
(79, '242510077', 'SHAFA SALSABILLA', '$2y$10$N28LdQUjb1WXsa/as.OaGegzwWbJUGksExaFTj/M2cL1W.hLWeZrS', 5, 1, '2026-08-12 09:59:44'),
(80, '242510078', 'SISKA UMAEROH', '$2y$10$GRDEN6qD1vtRtwCmaGVWlOa/D2uLKBRAAt2Wjw.NNyj6YvX.4hxpy', 8, 1, '2026-08-12 09:59:44'),
(81, '242510079', 'SITI GINA KANIA', '$2y$10$.25OQ0RDRDGU7aAQmbxDc.BJxIE3l53lf4Khyna8BJKtv7n5pfIKu', 6, 1, '2026-08-12 09:59:44'),
(82, '242510080', 'TAMA PANDUWINATA MAULUDAN', '$2y$10$1aDMaGwsxA/EIdHR3KFJcODqsC5fyouYTN3RNZeAuLCxCFSyPz9CW', 6, 1, '2026-08-12 09:59:44'),
(83, '242510081', 'ACHMAD FAKHRI AKMAL', '$2y$10$KpOo3C9OTaZAq.1mI51fP.rWEcMntCCFjif3zPtra4Mwy7z3uw/9y', 12, 1, '2026-08-12 09:59:44'),
(84, '242510082', 'ADEELA HALWA KHAIRANI', '$2y$10$hr4Fca/nWWpcFOoGPeLyTeY2y7zFAdV7R7/OIqvWsYVfm7LVEE3ai', 8, 1, '2026-08-12 09:59:44'),
(85, '242510083', 'ADLI MALIK PRATAMA', '$2y$10$TBvfAe.HihlsD/GegmwXAe0T3Rz0BUMSIz6GLq8anR2VQNza5uqeC', 13, 1, '2026-08-12 09:59:44'),
(86, '242510084', 'ADSIL RESI BINTARI', '$2y$10$zHr64Zr7WJ9jExtosJd0hO1O2dECM.qW79avA3ytQ2Bo8SadmBOIK', 10, 1, '2026-08-12 09:59:44'),
(87, '242510085', 'ALMIRA NURSILO MAHARANI', '$2y$10$Ie8LeLUdQqQyZaUb1zJWtO0WzxnMhUrSBrYeyblJORvb5WXaVNu/K', 4, 1, '2026-08-12 09:59:44'),
(88, '242510086', 'AURA DWI ANZHANI', '$2y$10$4vep1juO3aTtkEwevE1rSuFww1DuWHTv/63tpAoxG3Umlltv4uPYy', 14, 1, '2026-08-12 09:59:44'),
(89, '242510087', 'CALLISTA AURYN ANNAURA', '$2y$10$YVbZrwbzI3Doc9v8UVqMPOT/mP8ZIIlXhfJDJz/5pg33djpSpEWyu', 9, 1, '2026-08-12 09:59:44'),
(90, '242510088', 'CHESTA MAHARDIKA', '$2y$10$Q.5OZtS9dLWEEnPAP/mtKe94qiY.Pspd7vQ7GpE/TwNIwTUF5pqO2', 9, 1, '2026-08-12 09:59:44'),
(91, '242510089', 'CICI LIS DIANA', '$2y$10$5WXlF.4W0rMn6A0W2t47FeKa.lFrrF8lkQsFKfi9Y7ZuKP0firAgC', 12, 1, '2026-08-12 09:59:44'),
(92, '242510090', 'DEVA CERINA', '$2y$10$wxBOq94aRPkNYvj/kW4hr.XKaJAMXFlPndjMoo3e/qBsnu8QCQGI.', 11, 1, '2026-08-12 09:59:44'),
(93, '242510091', 'DIA SASTIGAMASAE', '$2y$10$XKG9sjnLoDXi5hqQ2EwRCesyyfa18kBwGVyCKAATBIaTvr/O25JxS', 11, 1, '2026-08-12 09:59:44'),
(94, '242510092', 'DIMAS SEPTIADI', '$2y$10$86muOK4c0UbDanL3CxxboeR4Ijp5ELCtMkUG2DPSH3/cz7YXgx002', 11, 1, '2026-08-12 09:59:44'),
(95, '242510093', 'FATHIN ABIYYU SUKMA', '$2y$10$HG18CexZ8gE09cD1CZ0Nx.s94YXvRlU1t/3X9RJDMziWw4bKD2cmK', 14, 1, '2026-08-12 09:59:44'),
(96, '242510094', 'FAYRA ASSYIFA ANINDYA', '$2y$10$kIHyEYIx7B4vs0RFTtUjM.Ts99z0648mLLP5bJkhv9p.lFTx365EC', 13, 1, '2026-08-12 09:59:44'),
(97, '242510095', 'FIRYAL YAPI AHMAD', '$2y$10$VOyBRVlBu4FHcyBIGTe1T.hBW5Bgmc9Vci8OsupCuDfrpRH7m0Ina', 6, 1, '2026-08-12 09:59:44'),
(98, '242510096', 'FITRIA RIZQI AMALIA SUCI', '$2y$10$TKnER88202XLy4Yx39s0uODgTTEWO/zTyuuRdupKE6IBZJDjoroIS', 14, 1, '2026-08-12 09:59:44'),
(99, '242510097', 'HANUM HUMAIRA FAJRIYAH SALSABILA', '$2y$10$UPRahDnqShxjCZ19Y1ZQSeEgR8PfBkZ8HxLL/NGI5EEilL2UEOtUS', 10, 1, '2026-08-12 09:59:44'),
(100, '242510098', 'ICHA SOPIA', '$2y$10$2W1xPgcRZovzrGPiWpk/ROes7/FHzV1gTXXFGCytf5cMVwlvc26Q2', 4, 1, '2026-08-12 09:59:44'),
(101, '242510099', 'JACKY PATIH ZULFAHERA', '$2y$10$juS6BFsEGUcww6C87wwmYuLwAdZIC0eKGL96hFxxkJ7QEO76OfvQS', 11, 1, '2026-08-12 09:59:44'),
(102, '242510100', 'JESSY SIMBOLON', '$2y$10$X3Lt3QzAcSu4lCOgkD8oXOEc1RGiTfJ9J0ghKNx9YRGHZXXwb1ME2', 13, 1, '2026-08-12 09:59:44'),
(103, '242510101', 'KENNETH GIBSON WIJAYA', '$2y$10$e.F3SlrRt2V.GA49ZK.use7W5ti8DB4WC5zkJ7n3eo40jecskVtCO', 6, 1, '2026-08-12 09:59:44'),
(104, '242510102', 'LAUDYA CANTIKA SARI', '$2y$10$YpJAH93VHmWudNvDlzQlw.OACTfhsGdrq8HB4l/v/zr67/GgTu1uG', 14, 1, '2026-08-12 09:59:44'),
(105, '242510103', 'LINGGA MAHARDIKA', '$2y$10$M1IVewQyiyk/6v5y4r1xqeW1zX4pdi35w/1YxXcARjv/eRIUuzqLa', 7, 1, '2026-08-12 09:59:44'),
(106, '242510104', 'MUHAMMAD FARHAN FADHILLAH', '$2y$10$1FuRywcVSm/GnrS5jWHWdu79XTD9gNE1aUpxhcD/UxC75eQwiufNW', 5, 1, '2026-08-12 09:59:44'),
(107, '242510105', 'MUHAMMAD RAMDHAN JAELANI', '$2y$10$Fi43wJeuXPRkEH7nweAZKO7TjFp/wRFDtTVkzYeLWR8Sqcbj3Q3ZS', 10, 1, '2026-08-12 09:59:44'),
(108, '242510106', 'MUHAMMAD RIZKI AL FARUQI', '$2y$10$dbuyvit5scMLRKxeStEXX.vcoAqhzabPfvTgWCTSVcUoPe6Ir9cyi', 5, 1, '2026-08-12 09:59:44'),
(109, '242510107', 'NAZWA HASNA PUTERI', '$2y$10$BrKdJHHV5tmQ4HvzK5wTrO4fExqVH0YXF2k8NY/vxE.x8gaxM2Lpu', 8, 1, '2026-08-12 09:59:44'),
(110, '242510108', 'OKTAVIANI FITRIA', '$2y$10$bBVdaUQZM35MmmGOLgq9au7yHMLHMmtOJMhDaCrFjkgu4..2KfPKm', 8, 1, '2026-08-12 09:59:44'),
(111, '242510109', 'RAFI IKHSAN ALRASYID', '$2y$10$z8pGicRKoqF35cgh5rL5weiuGNbWFG39IbNzgkRDguRTWxT3PP43O', 14, 1, '2026-08-12 09:59:44'),
(112, '242510110', 'RAISSA NAZDAH ABDIYANI', '$2y$10$4NQMJe9engKTSK5m09XbB.JbsHcUtDt81wttOAtEEivHjrD.T6ujS', 9, 1, '2026-08-12 09:59:44'),
(113, '242510111', 'RANTY PUTRI MAHARANI', '$2y$10$.4BNE.ceJicQhe0zj1tquuR3ZiIMZgchLbpcdV4W3oMwVDJj3ScyC', 13, 1, '2026-08-12 09:59:44'),
(114, '242510112', 'REVA LINA PUTRI', '$2y$10$V8Z02IYr6FvCoIynXK9/geTjrBSHdXG0TIxYaN2/DU09HgeGC/j5a', 5, 1, '2026-08-12 09:59:44'),
(115, '242510113', 'REYSYA RINDU ANANDA', '$2y$10$b2q9.CM.FZ8SLvDaCG3xie0vt5keSwBZjV5VK/BpEGuXT89nIfKp.', 8, 1, '2026-08-12 09:59:44'),
(116, '242510114', 'SENDI PEBRIAN', '$2y$10$tsZEJ6iqi55jUPveNi9TDO37PIhWE9kZQ9fI9fUC3kUpzkkEJWH3e', 5, 1, '2026-08-12 09:59:44'),
(117, '242510115', 'SETIAJI SIDIK PRANAMA', '$2y$10$iM/U2ZTSSOKfKh/j6tm4CeKEqbHffPVlI60MW2IKEhxjyfAOt9pcG', 13, 1, '2026-08-12 09:59:44'),
(118, '242510116', 'SHELIA APRIANI', '$2y$10$b.ZJtQ7p4EZU1Yx3jOQDGOFqWyhoV9ml.ABLybHQwPWf7qYn5iJqe', 6, 1, '2026-08-12 09:59:44'),
(119, '242510117', 'SITI FITRIYANI', '$2y$10$qXFtiwT2qMjQ1E3VawZDZOet2RJy9fG06zD5b8luGIPOmSMf4vfgm', 12, 1, '2026-08-12 09:59:44'),
(120, '242510118', 'TALITHA FAUZIYYAH MUMTAZAH', '$2y$10$C4pophObKntfpxgEQhQ0au7cO.BBYXDbKNCGmfTCawDEYZESjZPHS', 4, 1, '2026-08-12 09:59:44'),
(121, '242510119', 'YUNI NURAENI SILVIA', '$2y$10$8YEbFnZz5nmX9C2fW1BB6uxlTr2rUJ6lnb.uDmXQU7Oyj.F74NgfG', 12, 1, '2026-08-12 09:59:44'),
(122, '242510120', 'ZAHRA FITRIA HARTANTI', '$2y$10$2MG501hYSY3Mbeqj0SOzg.irkqCEyg2OXDkFK0BwgvgKW5ERNcJIe', 10, 1, '2026-08-12 09:59:44'),
(123, '242510121', 'AFRIAN PRASETYA', '$2y$10$zRn9qaEFoQ6rJ6JwBP6C2Ogl2mCLe65gMkReF8s0rbbKQVwb4E1qC', 5, 1, '2026-08-12 09:59:44'),
(124, '242510122', 'AQILA ZAHRA', '$2y$10$QJ26RnE4jTgbb3Iticrv5Oz2FuMOuaY3ZcbncCx5xVdoIYqPrNrwu', 5, 1, '2026-08-12 09:59:44'),
(125, '242510123', 'ARLYN NAFIZA PUTRI RAHMAN', '$2y$10$Xkm0ZPy9ILXJv6eUUeAN6eW9WN3z4Gz0dje7PkwioPWGtOpvSrunW', 8, 1, '2026-08-12 09:59:44'),
(126, '242510124', 'AS-SYAFA LUTFIANA RUMJANAH', '$2y$10$Dy0kRw4FGYx3qF2R2AgowOlXAGmIHU9p.0c1O19eP2Z1l7noJUJxq', 10, 1, '2026-08-12 09:59:44'),
(127, '242510125', 'CATUR SRI HANDIANINGRUM', '$2y$10$OgHSFy1JYfFGRpyMjST/GuJZwhA4Vwo1dW/blNeTB.kyCTT3jyp3K', 10, 1, '2026-08-12 09:59:44'),
(128, '242510126', 'DAFFA SAEPUL RAMDAN', '$2y$10$zRAqyGd37cOJ3f5NwVYDCudS343b7i9zfSX2fuHbrMS0rrH7Sf54G', 6, 1, '2026-08-12 09:59:44'),
(129, '242510127', 'DETY AFIA', '$2y$10$b36qNRmB7PWbh.ZqFkr1yukxXHWYHpNrc8N0GVar79VkAlFDaFz3a', 12, 1, '2026-08-12 09:59:44'),
(130, '242510128', 'FACHRI ZANWAR NUROCHIM', '$2y$10$AOfFhkvrug970W4tLTRG1eJxWr0j6GHJn3lZKegGxnepIoW1viCL.', 11, 1, '2026-08-12 09:59:44'),
(131, '242510129', 'FAHRI PEBRIANSYAH', '$2y$10$J1AuKpwOWHVOql2hxo9lv.5fUoYUC9zwI3MLCYFNdZN6l8bMeZs2a', 13, 1, '2026-08-12 09:59:44'),
(132, '242510130', 'FITRIA APRILLIANI', '$2y$10$G4ALzBsW1PKNwCzD0kq33OFCY2tXrBshcLBTIAPxSXPV7ySQWayqS', 4, 1, '2026-08-12 09:59:44'),
(133, '242510131', 'GERRY DIVANO', '$2y$10$rua6Vlsf2DgdQ8vXWY107eMa52UeUg5szaDbUbsXzyXy9BBDLA8Ge', 5, 1, '2026-08-12 09:59:44'),
(134, '242510132', 'INTAN AULIA HIDAYAH', '$2y$10$Txh4m7jHeQCLtc8FplJY..rP3uvEstWIgk52LxRyxEfN7dmIANm9C', 8, 1, '2026-08-12 09:59:44'),
(135, '242510133', 'INTAN NUR AJIJAH', '$2y$10$3D8S.XI5ziQ2dsjyfRp9rOpqSFq.5kWDt3aGwKIAkKSItmyV/3ia.', 12, 1, '2026-08-12 09:59:44'),
(136, '242510134', 'JIHAN NAQIYA', '$2y$10$RuvwOwriKojkj6WBZWGKieTUSp7WHf7yKuY7/3.9EcNlC0PDpg/W2', 8, 1, '2026-08-12 09:59:44'),
(137, '242510135', 'KEMAL KAMALUDIN', '$2y$10$BwkAPtmQa9Tyv3/c5XtWS.399WRaHPdRvG8fyFkhveWXQZnmxhsm6', 6, 1, '2026-08-12 09:59:44'),
(138, '242510136', 'KEVIN KHOERUL ANAM', '$2y$10$uJxkIVZXuclvm4DT1NzKZecJaoMgf1BDuGLzujk7tLqcpC9px/eQ.', 10, 1, '2026-08-12 09:59:44'),
(139, '242510137', 'LEANA CARISSA PUTRI', '$2y$10$xjpWeS0h6ch0KmL0jpKVbevVoavWG.owZUc7TBopOn9jqy6boPArS', 6, 1, '2026-08-12 09:59:44'),
(140, '242510138', 'LESTARI DWI ALTHAFUNISA', '$2y$10$cbU7f2J/uyTg7G9UMisOzO.v.phagezVYBNS1oP7ccvhsSV4oxBvC', 14, 1, '2026-08-12 09:59:44'),
(141, '242510139', 'LUTHFI DESTRA HERLIA PUTRA', '$2y$10$1HvMLTvWOyQbP.08gztYC.HQzTFG0lnrJN96cRaCT/avCJY1zGZX2', 11, 1, '2026-08-12 09:59:44'),
(142, '242510140', 'MAISYE LIANI RAMADHAN', '$2y$10$NEwIeCVi.jpbsHWiQywA3.stHyFW3RWfkrytHUbLbCef/WkyRxeaa', 10, 1, '2026-08-12 09:59:44'),
(143, '242510141', 'MITKA OPHELIA', '$2y$10$HaKsbknscmJwKlwxjx/urOZj8ayhu.8jG0nxj4Ky5HPTWjeyQPw8i', 11, 1, '2026-08-12 09:59:44'),
(144, '242510142', 'MUHAMAD AGUS RIDWAN', '$2y$10$yA2wkWz1YChxG0qE6sZx9.HBAKwfvjjeqGdaT78hX6SFALx.zS3Ie', 12, 1, '2026-08-12 09:59:44'),
(145, '242510143', 'MUHAMMAD FARDHAN RADITIA PELITA', '$2y$10$p6oKZICxRgvf2goSukzrI.zzGPKUjzMFvGZrNFfv7r0EFMyBc5KJu', 11, 1, '2026-08-12 09:59:44'),
(146, '242510144', 'NENG MEGA SILFIA', '$2y$10$Lrt1sT4DROzOPeM1rMhPx.Yyp3Ir5eY/RElXf3WnRmxxYfzmxvdzi', 13, 1, '2026-08-12 09:59:44'),
(147, '242510145', 'NOVA DWI KURNIAWAN', '$2y$10$B.SH4hcKfIxX7a6K5ydEz.cyv1b0oyjZ9y76q9nw4plJxFWAXxeMu', 5, 1, '2026-08-12 09:59:44'),
(148, '242510146', 'PUTRI KHANAYA SALSYABILA', '$2y$10$XmV672ma7ZjtFkDDx1WB6O8xLj.QPDc9fQA.QF4Yml90P8Se1QMS2', 7, 1, '2026-08-12 09:59:44'),
(149, '242510147', 'RADEN SATYA AHMAD KHALIFA', '$2y$10$LkyxOM2Po0UCmcMtxtYdGeddNP6bwX1mqVOiJY9zA7e2tXkPQfD4G', 10, 1, '2026-08-12 09:59:44'),
(150, '242510148', 'RAHMA AURELIA', '$2y$10$gS8Pf7N/u/u0gEULTYy.m.6TO6AqwZgHexr0Sjm.NLQahcyy9CBW6', 5, 1, '2026-08-12 09:59:44'),
(151, '242510149', 'RAYANA AMAURI PAWANA', '$2y$10$JEXONbunc7Zud7AqPCkyrOcavaoS1aBJKHVLx1LlCl76uPajPRp2.', 13, 1, '2026-08-12 09:59:44'),
(152, '242510150', 'SABILAH', '$2y$10$o1LKV/vZwGAFANQc/pKYy.y33ulVHNo05qJPGcbyLs5CL0nHQVqF6', 11, 1, '2026-08-12 09:59:44'),
(153, '242510151', 'SALMA ZAHRATUNNISA', '$2y$10$rbq23m4IfDZQnKmLI0SIB.NCLrDoTOZZ92v6.cLUt8HbX0jtOJ0J2', 7, 1, '2026-08-12 09:59:44'),
(154, '242510152', 'SHINTA DEWI ANGGRAENI', '$2y$10$4gn2L0lbJIENOsf4JIPhTelDpu76AUjfgyZybNAPpuMfJKfd6znNy', 11, 1, '2026-08-12 09:59:44'),
(155, '242510153', 'SILMI AGHNIYA AZ-ZAHRA', '$2y$10$VfyMigSfJU/qkwMOBqM0/uTaEEukw5E3Oxg0AeClmyPGni1ldH5om', 14, 1, '2026-08-12 09:59:44'),
(156, '242510154', 'SITI MULYANI', '$2y$10$n9l7HQqgrE3aG55J0N63N.IEwdbA0kjBG4yrHTvJlhL.Gd7Phb3by', 4, 1, '2026-08-12 09:59:44'),
(157, '242510155', 'SUTAN MAULANA IBRAHIM', '$2y$10$m9WhpsghmyLbX3LWAV6Xs.YjGlSl0RkW/dKmD3az7CWk/8JbJHDFe', 4, 1, '2026-08-12 09:59:44'),
(158, '242510156', 'TAUFIK URROHMAN', '$2y$10$d46UZs0KOvW4D4ES81.nSupl8XSqf/Vn1Rn3CFiwtiLBXscbgLp6u', 12, 1, '2026-08-12 09:59:44'),
(159, '242510157', 'VANIA PUTRI', '$2y$10$KqG661Emg4.WNBmdLgwuxeflNV8q4AnCrSuXfDwNk2VYKO7H2ckMO', 10, 1, '2026-08-12 09:59:44'),
(160, '242510158', 'ZAHRA NAMIRA PUTRI', '$2y$10$BlyfiQKJIj98k2SGlMj1fuDcTNc.BFk0OWp6psFb/v.tcebVm7q6q', 10, 1, '2026-08-12 09:59:44'),
(161, '242510159', 'ZAHRAN NURFAJAR', '$2y$10$LiC/9cBL9rB5dHzx466qxuQgs92A3jYQLqCzCv4vsbO9LbLiIAhji', 12, 1, '2026-08-12 09:59:44'),
(162, '242510160', 'ZASKIA APRILIANI HERDIANA', '$2y$10$7Vts8CWCItOeII5pFZ7AlO6qLarhFd9puJbgRu6AzXlEvRjmg/yZa', 6, 1, '2026-08-12 09:59:44'),
(163, '242510161', 'AGNA ARUNI AMALIA', '$2y$10$eDiKQUr30VFzV/0VOL9RvOzM60ON1UvrgQNpQMdQzgU7ki92ZfXQS', 8, 1, '2026-08-12 09:59:44'),
(164, '242510162', 'ALEA NUR BINTANG ANZARI', '$2y$10$kjVE4ahspA49XyO4m/CLseEta4l4UxbdLaa777mI7ij4Qu.I9sNma', 9, 1, '2026-08-12 09:59:44'),
(165, '242510163', 'ALFACHRY DAVI RADITYA', '$2y$10$tIcN7ajzus8MoYOy46F5JuG27rlFQVKpn9RByoVQ2hiMxF.0txKnq', 11, 1, '2026-08-12 09:59:44'),
(166, '242510164', 'ANGGITA ASTYANI', '$2y$10$jatif.8TdV2.q7lqrxAHm.ndGYVi1dq00OO6DS0dXq6bb20HD5n2C', 14, 1, '2026-08-12 09:59:44'),
(167, '242510165', 'ANJANI NUR SUKMAWATI', '$2y$10$vVgF.Je/BlcktCxTrkLVbesQnXcWaGEri3x3OeztIJo.xA0Hlvc/K', 5, 1, '2026-08-12 09:59:44'),
(168, '242510166', 'AULIA AZKA MUKAYYIS', '$2y$10$3UslqbaoxkplE5Qz07E8wOWIyUtBw8/.YkoreEDBdgoHz85schJ5a', 14, 1, '2026-08-12 09:59:44'),
(169, '242510167', 'CHIKA SAKURA', '$2y$10$4W40SMuzDHtoV4n5x0kacOf606zJAj5ziLXb4eHei4XroWzHVl90i', 8, 1, '2026-08-12 09:59:44'),
(170, '242510168', 'DANIAL MOCH MISBAH', '$2y$10$Qlz3otL1F.yEzriU14pQk.6T2IBUjJUloE2tRKQl2wU60iBSo/EYG', 9, 1, '2026-08-12 09:59:44'),
(171, '242510169', 'DAVID ADITAMA BACHRUN', '$2y$10$CGRBIlECG2ocdtPoKsMd2ecokOJFy7RRqMWyCkVgkqzTiIngIGQCe', 9, 1, '2026-08-12 09:59:44'),
(172, '242510170', 'DIAN SAFITRI', '$2y$10$Euc.fmdcNIAC/t6sYs5e5.cxlXVT7ZvRr0mAz8DDRAoj/iNJXU/Za', 6, 1, '2026-08-12 09:59:44'),
(173, '242510171', 'FABIAN MUHAMAD RAMDAN', '$2y$10$pJZDoDtWeoZB/AfhdwATuOSNwb3pRFB27TYo/fUUwJBpCqkEkX/Z.', 13, 1, '2026-08-12 09:59:44'),
(174, '242510172', 'FAJAR MAULID', '$2y$10$.TC9tWcGVGaThY2ZVOQf0.wDkqnOZQcrfJBjnhmTkjDOp3wFENFum', 12, 1, '2026-08-12 09:59:44'),
(175, '242510173', 'GALIH MAULANA YUSUF', '$2y$10$VidgpB90/f7Nx6FUdWfx6eJwEYUZQ8FTC35heWRwlFBWuUk7SaHPy', 13, 1, '2026-08-12 09:59:44'),
(176, '242510174', 'GILANG GINTARI SUJANA', '$2y$10$x8OaS9vReTei1KPk7l5yeuAiJbH4FMuWmk3eJpUHDy34VvZ59TUTK', 5, 1, '2026-08-12 09:59:44'),
(177, '242510175', 'INDRI GUSMIANA', '$2y$10$S.XrX9kQNMIfQhyR.9bbZ..aX..kAKi4whJlz7nJ/TJMZJ4gW5j7O', 9, 1, '2026-08-12 09:59:44'),
(178, '242510176', 'ISMAH AULA', '$2y$10$jBm3e39ISpUD4I/MiVSboOWC50coC6Mgm7CfkDtVvCxN7Xq5TQv2u', 12, 1, '2026-08-12 09:59:44'),
(179, '242510177', 'KALINDRA KIRANA ASWANI', '$2y$10$6QouOfhxuYelMY6EFm234eMVJ6MUlXuSuUutkqGIF.52hKVp9wmLW', 12, 1, '2026-08-12 09:59:44'),
(180, '242510178', 'KEISYA AULIA', '$2y$10$juzA5bo9ZOKdphO5Ez6cA.HJKNIDUC.pCa4LZvrPgUqvskzFBhZHK', 5, 1, '2026-08-12 09:59:44'),
(181, '242510179', 'LILIYANA ANNISA PERTIWI', '$2y$10$fQ5dskdSUs.t0Y44ss4rTu4zM/gHCzK/RcXVtDLv.RJ1qY5va7yei', 5, 1, '2026-08-12 09:59:44'),
(182, '242510180', 'LISNA MAULIDA NURUL FATIMAH', '$2y$10$.Ju61ETqD0NfEGx2QlGmau3esidrjQy8Ddua0hREwxmJuii5sKTYS', 13, 1, '2026-08-12 09:59:44'),
(183, '242510181', 'MAYLA CAHYA AFILIAN PRATIWI', '$2y$10$pTUa71mUP75qIY2rCNQxu.xENllTvoPB/w1qNUYyJLCiKCdrkA/lG', 11, 1, '2026-08-12 09:59:44'),
(184, '242510182', 'MEGA LESTARI', '$2y$10$F0NHnFemL.OUUkU31HcwaeleuuKP4Jr/00EbmTfDoNQ5XZqPJ8xny', 8, 1, '2026-08-12 09:59:44'),
(185, '242510183', 'MUHAMAD ALIFFIAN RAMADHANI', '$2y$10$TS8aVXwqgEL8Oo37MyQng.O7HdUadmeZgpggxGRDRATs6ZvXGo7cC', 8, 1, '2026-08-12 09:59:44'),
(186, '242510184', 'MUHAMAD NAZRIL GUNTARA', '$2y$10$Ivn2KPUe8S3iUrRhg5v7N.Kan.OquPZO5MVcOOxZg213kQlxcji.e', 4, 1, '2026-08-12 09:59:44'),
(187, '242510185', 'MUHAMMAD FAUZAN AZMI HANIF', '$2y$10$6k5Yx2pLY58wz9/p0.r5zeBLxJKh1lekzWrv.T7HNk6ENDykIQT0S', 14, 1, '2026-08-12 09:59:44'),
(188, '242510186', 'MUHAMMAD RUSLY', '$2y$10$MFT7oEfZ1LFeXz8LH.0ri.CUFANDOEzWGrfKJqmrE.hfay8M1AO.y', 12, 1, '2026-08-12 09:59:44'),
(189, '242510187', 'NESSA NOVANDYA PUTRI', '$2y$10$KGRVlnRJlsHNiYdcQ9Ht4.6DGVNy7rgBbDTziP/th6FnmuKYVauCK', 4, 1, '2026-08-12 09:59:44'),
(190, '242510188', 'NEYZA DWI MULYANI', '$2y$10$DsjKTSH8VB0OCKs9GGa7OuhGx9HTtrnC9fEY1jCVfwO/NXczzJ1yi', 6, 1, '2026-08-12 09:59:44'),
(191, '242510189', 'NURUL AYUSTIN KHOLIDAH', '$2y$10$Uj1b7VHjymbiKO.AIyUAy.db3jTY6oISyMSd5xntfUO./cFkZcK/m', 11, 1, '2026-08-12 09:59:44'),
(192, '242510190', 'RAIHAN HABIBURROHMAN', '$2y$10$/ub8WbehnUVb824vuGrUhex01ZQH/icjSjf3YfTKI1eDjplL4yKsi', 4, 1, '2026-08-12 09:59:44'),
(193, '242510191', 'RENANDO BRAVOCIANO', '$2y$10$JfVltvctq4BHgdS2gg6aaeeySl58aIQVGdL/8AODzwqwXrlwncr.e', 9, 1, '2026-08-12 09:59:44'),
(194, '242510192', 'RIDHO YACHI SUDIRMAN SUDANA', '$2y$10$fdTgaa3dM1qD51RyvzwT/OwK0vfgdnpTk7zLNxr5F9Fa30ePPo3Vq', 12, 1, '2026-08-12 09:59:44'),
(195, '242510193', 'SILVI RAHMADANI', '$2y$10$J/NiISV0laeBPlIcmsEereza/Oe9LIYqfE4TWOPdR/5.wu4HUzyMC', 13, 1, '2026-08-12 09:59:44'),
(196, '242510194', 'SINTIA NURCAHYA', '$2y$10$nbGt36ZSBgbtOlH1U2BtROSNqkv2VkVckPYnk3xZwi.vi9TN5N0kW', 5, 1, '2026-08-12 09:59:44'),
(197, '242510195', 'SITI ALLERIA AKASHA', '$2y$10$5CQwI7l5ba7rk.qrt0WivOXSrl4PLJ0CqbAdzcRCgpZYWQspeH3W2', 11, 1, '2026-08-12 09:59:44'),
(198, '242510196', 'TANTI AZIZAH PUTRI JAMALUDIN', '$2y$10$cPvX4AQ1NiIm5fmQfybUBODvP8gGrFjpQw7QdpYo0MlBiBWE9fyfK', 14, 1, '2026-08-12 09:59:44'),
(199, '242510197', 'ZAHRA YUNIARTI', '$2y$10$oJNdBcKNInYSu8tfMlXQFuE8epsIwWUpagp4OFGwupOjdZtUbiQxi', 10, 1, '2026-08-12 09:59:44'),
(200, '242510198', 'ZAHRAN ARKHAN RAMADHAN', '$2y$10$qHJlegvd6V0SEdY7egUH2O5P4ISi/W3pERsaglnFTnzuYa.JXWnIS', 5, 1, '2026-08-12 09:59:44'),
(201, '242510199', 'ZAKHRAN ARDIANO', '$2y$10$oKrTYtUunQCQdFD49kf46.0T0lISOWjU9c9/W7GQGxobfjyCAcjby', 12, 1, '2026-08-12 09:59:44'),
(202, '242510200', 'ZIHAN CLARISA SENJAYA', '$2y$10$CWwIMJfsFgN2VloGyUG3O.sXeYXQvOD7THQ12VpJkkt6TfPQ6VHjK', 6, 1, '2026-08-12 09:59:44'),
(203, '242510201', 'ADRIANSYAH SAPUTRA', '$2y$10$bCsccFKnsGSMTkszgdOyt.60TkEINaF4S/nOoIxS3/pxs8Rm6s1Wq', 5, 1, '2026-08-12 09:59:44'),
(204, '242510202', 'AFGAN MUHAMAD ILMAN', '$2y$10$2UzvN6DUPEyDl1V2FKicg.t2Wf5fd36nKzqS1.ri42/bF18jA9ogK', 13, 1, '2026-08-12 09:59:44'),
(205, '242510203', 'ALETA MEISYA HARIMAN', '$2y$10$Myw/5KoaeBON6THj5oYwp.KP2cVILhIzfK.u4CJEYYwa3.L9cNz9K', 12, 1, '2026-08-12 09:59:44'),
(206, '242510204', 'ALISHA MURSAL', '$2y$10$z1Mq2gCVXGhwtvNGgQ1wQ.d3b9IbJB1iGRSc4/cuFRe3fi.GrE34u', 7, 1, '2026-08-12 09:59:44'),
(207, '242510205', 'ALVIN FIRDAUS PRASETYO', '$2y$10$eqOuNcieE3jWiMC63gEkZuhFDHrtmmmc54seSJCt.0oN3D.McU57O', 4, 1, '2026-08-12 09:59:44'),
(208, '242510206', 'AMALIA TRIYANI', '$2y$10$Uq5/hq4qzuQSaNGNYN3H3.w/4NUb1vJj/5lvrf69/rbzhCNe4bSja', 8, 1, '2026-08-12 09:59:44'),
(209, '242510207', 'ARIHNI RAIHATAL JANNAH', '$2y$10$.oJniFqPhF24AGulx59Gg.d3pJjH7lQPwLI/tpOlpqlHyENbnYfgy', 10, 1, '2026-08-12 09:59:44'),
(210, '242510208', 'DEANDRA PUTRA TRIYANA', '$2y$10$UgBJ7wyN9y.O8AETl13/QubNGbfLCjDUymYFqxVwawiIJlbQ7DvJ6', 12, 1, '2026-08-12 09:59:44'),
(211, '242510209', 'DEVIA ANATASYA', '$2y$10$WHCqgvk2U3j0L36qdJr4sOOyAqDCiPkZGSTYDfSwI8egtIlLZWWVa', 10, 1, '2026-08-12 09:59:44'),
(212, '242510210', 'DEWI ANDRIYANI', '$2y$10$/JR2l9vShR9lsVCCneLjeOcxrRLaVs/zfVVe195RBZAuTSpaTi.cu', 8, 1, '2026-08-12 09:59:44'),
(213, '242510211', 'DWI AL FITRIYANI PUTRI KUSNADI', '$2y$10$0U8KkrJpiBpOS1Ulm8KwReLWEMksTeu/hAy1am/YEaVS7aIVL8DKG', 9, 1, '2026-08-12 09:59:44'),
(214, '242510212', 'FAJRI HADIYAN ANGGARA', '$2y$10$2q4hq5/AumfLLA2gIUQ1H.tciHl5rixKhUFParM9mUzuUgldCSkCG', 9, 1, '2026-08-12 09:59:44'),
(215, '242510214', 'FIRZA AHMAD ZAIDAN', '$2y$10$.u3MTVNgWYv0n2bfpbtie.2WWANYtULGDMqDPfnKoP12evXaa2RuW', 6, 1, '2026-08-12 09:59:44'),
(216, '242510215', 'GENDIS PUTRI KIRANI', '$2y$10$nE2TQB6cuISg0Q5OwmEOSuAgKTNgsysBaZesDInilQr.r8k3SLedq', 6, 1, '2026-08-12 09:59:44'),
(217, '242510216', 'GHAITSA NAJWA KAMILA', '$2y$10$/FCQ30l.Dhipskt3lZTpM.5cuomdIK1Q5/mPzRpw9.fuotFO6xySm', 9, 1, '2026-08-12 09:59:44'),
(218, '242510217', 'HAFIZ ALFADIEL ABYANTARA', '$2y$10$1KRNqhXQD13JfTC0ZTdVqO4Jvf9WN73zWOys96dUCRw8qACsK6Uny', 4, 1, '2026-08-12 09:59:44'),
(219, '242510218', 'INDAH KIRANA UTAMI', '$2y$10$eL/kS8Tt15DGh/9.UVgwK.PwEWY.0y2N1cUb4MNfQmsLk2hcsNX5G', 4, 1, '2026-08-12 09:59:44'),
(220, '242510219', 'KAISYA RAHMAH ANGGUN PRIBADI', '$2y$10$npyfTQu5r8PZcXwn2RPMMeBJgaXt8zK495xzV0qG8hL8kS6iMB4Ii', 9, 1, '2026-08-12 09:59:44'),
(221, '242510220', 'KALISYA NUR SYAHBANI', '$2y$10$fqOWkr6M5cTtYyPLt.bzXO.vMbg/etXnsz1rVCMaRtJXJmM/E0JHe', 7, 1, '2026-08-12 09:59:44'),
(222, '242510221', 'LUTFIAH OKTAFIANI', '$2y$10$cKFFV1zY2AB5pQMclwWTSuiwN67wwGhHf/zhL4KQ0SGpf2PvnOTbi', 8, 1, '2026-08-12 09:59:44'),
(223, '242510222', 'MEISYA RISMA AULYA', '$2y$10$n579oGFfZ4CZvkcwbXgk6Oyv0LnCndm.X6.EdqxhCNfVMvQHyxaO.', 10, 1, '2026-08-12 09:59:44'),
(224, '242510223', 'MUHAMAD FAJRI', '$2y$10$8o5K5od9ZHXZPo87OdI/1uzc4g7kD7zX7dcNv/uk8YZWhJkKVUg0y', 13, 1, '2026-08-12 09:59:44'),
(225, '242510224', 'MUHAMAD AL FAUZIAN', '$2y$10$aRHzcO01N2cMVesnv9or8O5c9FnidQOUJ2ritUOQ5dyifYEhHPfS.', 11, 1, '2026-08-12 09:59:44'),
(226, '242510225', 'MUHAMMAD BINTANG NAZRIL', '$2y$10$VEAGRkvmBhHNqMkgiNVtwuo1QN/qxFjbilPKs7NW0tdhZ6HWD3XHO', 5, 1, '2026-08-12 09:59:44'),
(227, '242510226', 'MUHAMMAD ZIYAD ARHATTA', '$2y$10$w2Qv4Z6X4SM8zsWcqLyI3Oo.WHinxWstxDi0mO9Nk9npqhRXMkXJ.', 8, 1, '2026-08-12 09:59:44'),
(228, '242510227', 'NABIILA NUR TAMIIMAH', '$2y$10$Kn1FprBtxsHYRI.0AQDft.19bDOmgAWlCFuHa0gt7li3n4VEzj8hC', 14, 1, '2026-08-12 09:59:44'),
(229, '242510228', 'NABILA GUNAWAN', '$2y$10$QXnaTcCla2rzYWZ1JFHrVuwLMYE1EAmvLNU98j3oGU6QQ7aieKK4a', 14, 1, '2026-08-12 09:59:44'),
(230, '242510229', 'NASYA TALIA GABETIA PANGGABEAN', '$2y$10$yx6qkRVZgra3KxmdwXOmOun8yWrecD/Ot1WBx0.aQVjsPLzNMNWBq', 7, 1, '2026-08-12 09:59:44'),
(231, '242510230', 'PUTRI KIRANI SALWIYAH KHALID', '$2y$10$e8FGH./CJDdAb/IZlnHD1.eMWndK8xQ72CRQSdLNvqZ0vCpM9Wsby', 9, 1, '2026-08-12 09:59:44'),
(232, '242510231', 'RAFI RESTIAN', '$2y$10$zSPJhiLQqrgrAHqPichtz.GDU5IkHQmuSZLQ.mNpoDlPt//pc14NS', 11, 1, '2026-08-12 09:59:44'),
(233, '242510232', 'RAISYA AMALIA', '$2y$10$IDHVysTfWn7cguZt86LVFuUm38ZjaHlF2JsLm254HOxJ/9V2P4Dby', 9, 1, '2026-08-12 09:59:44'),
(234, '242510233', 'RIDHO RIZKI GUNAWAN', '$2y$10$.9MNgwFw8AlYLO003W/jrO7TdWbkKvjgg0fg9F1jmOT0GsETlAHDi', 4, 1, '2026-08-12 09:59:44'),
(235, '242510234', 'RIFAN AMIN FAUZAN', '$2y$10$3uW2FPTaktsxj/w9eJ5SSOODlHn74JLCzIJYmY6vQukl2dPlfOLBW', 6, 1, '2026-08-12 09:59:44'),
(236, '242510235', 'SAVINNA CHALLITA', '$2y$10$2Zv.Ykp6gWGzqLb8Fiob8e7gLl/yQJcPJodPI1um6rLwXgPQ2bxn.', 7, 1, '2026-08-12 09:59:44'),
(237, '242510236', 'SYAFA AL QUEENA ROFI', '$2y$10$XCdl7aHoGi59HHRqFtsgg.NUMn82EzcqSufYMomzZG1SeTFwQ14Ea', 10, 1, '2026-08-12 09:59:44'),
(238, '242510237', 'TASYA ASTI AURELIA', '$2y$10$1G9aC1Zo6H35pqtIc2JR1.9hqlopl253zEFqa4JcWyu4Hj0ndD52.', 14, 1, '2026-08-12 09:59:44'),
(239, '242510238', 'ZAHRA AULIA KIRANIA', '$2y$10$STgJ/U9tcU/X6KxSo3n/0uY1ZL776iiMteJVp4aXh0UKFXHEhOHsq', 9, 1, '2026-08-12 09:59:44'),
(240, '242510239', 'ABDHI RESTU PRATAMA', '$2y$10$2Rd0f2UveTYWKy4hr5YV6eYrG/CsyAmLj.Z0/gYsxdEbr38odj5TS', 8, 1, '2026-08-12 09:59:44'),
(241, '242510240', 'ADRIANA MOZZA RAYSA ARUMMI', '$2y$10$a7engUBcYWvl..nOunYdUeumEEKVYnmeY4DRuxaTp5Z7.FcLCWG56', 7, 1, '2026-08-12 09:59:44'),
(242, '242510241', 'AHMAD SOPIAN', '$2y$10$EdHUg4vkOVScuk/P2uKxL.TkdiugWagGYLrKit77ym4kQctrM6hFi', 12, 1, '2026-08-12 09:59:44'),
(243, '242510242', 'ALVIN NURAHMAN', '$2y$10$g5EA56GeKqAk4d2bhdSQPOTRNT1d1K4L2vliMbmM6nayCDYe8asJi', 8, 1, '2026-08-12 09:59:44'),
(244, '242510243', 'AMANDA SAHFITRI', '$2y$10$tlBmNWOO7wd13dPV2m.WpuiF.MtCxc3Tb6TmAoTt01ARE.zkxhb.S', 7, 1, '2026-08-12 09:59:44'),
(245, '242510244', 'AMELIA PUTRI PRATIWI', '$2y$10$QTR6uHwJcGisedS1Vkr3o.Zvgp0pmahPvbU0ZYOQi.6SYk6gmGW2a', 8, 1, '2026-08-12 09:59:44'),
(246, '242510245', 'ANDIKA RAMADHAN DWI PUTRA', '$2y$10$t8lCoWwLCi/OFBf4VS7v1OaCHWAmQmALk0Lqa8q3mZavoNQ.GHiAO', 13, 1, '2026-08-12 09:59:44'),
(247, '242510246', 'ANDRE', '$2y$10$J/z0j2ZTejZGvlYjndxy.euXW1t18x1GAYvwmvlxu9S2/cSJiZJ5G', 9, 1, '2026-08-12 09:59:44'),
(248, '242510247', 'ANISA SALSABILA WIJAYA', '$2y$10$iliCLE1.a96UqQMovs4dV.tWmmokV0FDcBu.i/yAuXICq5ZBVAJ4G', 10, 1, '2026-08-12 09:59:44'),
(249, '242510248', 'DEFASYA ANGGARA PUTRA ADITYA', '$2y$10$hWzBxtXSQmVgN5asEnCWjuNkf9BBDqFhZWr3yKbTP0CXeCUEHTCMu', 10, 1, '2026-08-12 09:59:44'),
(250, '242510249', 'DIANA ANGRAENI', '$2y$10$orJMPlGHsrbUzVyY2GOhjeaRIuFOfYVY06GdWzq6a8IHhWvtg3Rz.', 13, 1, '2026-08-12 09:59:44'),
(251, '242510250', 'FATIR FERDINAND', '$2y$10$L/L0Wom.defiJMzMF4XuF.R95fpj6Eihi8XBccjd3krfDQAO22GtO', 5, 1, '2026-08-12 09:59:44'),
(252, '242510251', 'FEBY THERESIA DWIYANTI', '$2y$10$Rye9LaUmV5NxAwxHPLm/0OKpOBOkZsw7FO/U/1RxE2Fsy9mkF2Qr.', 13, 1, '2026-08-12 09:59:44'),
(253, '242510252', 'FILDZA KHAIRINA RIDWAN', '$2y$10$65gvkcUg0X0YneJ01k9zFOhq7OjHCfzFKxAZsHjqXWnhdANsQfT0W', 8, 1, '2026-08-12 09:59:44'),
(254, '242510253', 'HAFIZD IKHWANUL KAMIL', '$2y$10$4JNazbHJ7loKD5Wjs59Fke08JG8X6egDQdv9w9wVLhYQ4dvnWQ79.', 11, 1, '2026-08-12 09:59:44'),
(255, '242510254', 'HILDA SITI MAULIDA', '$2y$10$/cJ3P2oA2o0T1EeXlVfp9.o9OEPSylRA7wgHBCH6F1hz4Uzaq1KhO', 5, 1, '2026-08-12 09:59:44'),
(256, '242510255', 'KANAYA ANDHITA MAYCHELLA', '$2y$10$eTTj5CyPx//Kzdi6MJKcE.IXQ.TR/elMaeOs5pkwq1jbpU5cNKWKy', 13, 1, '2026-08-12 09:59:44'),
(257, '242510256', 'KEIKO AQILA ANANDIRA', '$2y$10$xZjkCUDcMKixN.pAzbjh5etrEe1SYBv4wJ6XaCsD2swnSvvWZYCa2', 14, 1, '2026-08-12 09:59:44'),
(258, '242510257', 'KEISYA PUTRI ZALIANTI', '$2y$10$fUjWMZ5ltSodT7HzgqjsYO.jVMV2SlZWYQ0FPvA1hcmhfYqYiqc9K', 4, 1, '2026-08-12 09:59:44'),
(259, '242510258', 'KENFITRIA SALSABILA PEGARANI', '$2y$10$gZ1G0JQGowgNbteJO1QNxOeDW0pHWqdKJjHaD3rr4ovCAQDGHzS86', 8, 1, '2026-08-12 09:59:44'),
(260, '242510259', 'MUHAMMAD RIZKI MALIK ABDILAH', '$2y$10$HI7.JSBbVzjS3A9xhiQm6exyM12jy8b09/KYazHIirR6TALf4GAaG', 8, 1, '2026-08-12 09:59:44'),
(261, '242510260', 'MUHAMAD HENDI SAPUTRA', '$2y$10$p.d6B/I1HfAEhNXGtqL6sOKDtpzg1Uh7tv5HSTRKXpsNDwLbSwGDK', 5, 1, '2026-08-12 09:59:44'),
(262, '242510261', 'MUHAMAD ZLATAN IBRAHIM', '$2y$10$78GG/Iuw9u0PHVX89y4i0uUHaBloq0NHGXYcmLqBNhs52LrHRmh8i', 6, 1, '2026-08-12 09:59:44'),
(263, '242510262', 'MUHAMMAD ARSYAD ALYASA', '$2y$10$6AmyeNDvO3Myuu2IMIGs5uEHK.xq0a/LzhJQLvOXHu46i9dj2EUVq', 8, 1, '2026-08-12 09:59:44'),
(264, '242510263', 'MUHAMMAD RIZKY FAUZY', '$2y$10$KEYfwvov42/YoPceRC1UPeP4g5OLCwElHHpQIx7m79lfwtevmsc4m', 5, 1, '2026-08-12 09:59:44'),
(265, '242510264', 'NADYA NUR ATTIFA RISALMA', '$2y$10$tGwEIMX237BvmGhNKHZNzuoi85QoM8t0pucHwUCqKhGzTfa/2.5mS', 14, 1, '2026-08-12 09:59:44'),
(266, '242510265', 'NATASYA ZELIKA RAMADHANTY', '$2y$10$3uJPPVXwL6P2Y.Cz0tfN8uPZ06YVO8xQIO/DJVTyzp06yqIgv6hZW', 6, 1, '2026-08-12 09:59:44'),
(267, '242510266', 'NEYLA FITRI OKTAVIANI', '$2y$10$l21ukljBTkRZZm7LotUJLe64o88U4GeLwa3NTVcUEokTXdiNSgbJi', 12, 1, '2026-08-12 09:59:44'),
(268, '242510267', 'OSYA RAFFIE RAZAQIE', '$2y$10$FNt4nl7bLQqEIv.VZZEKw.YR5QtcTx5PFcp8IHyixwGjRHRQgEuU.', 6, 1, '2026-08-12 09:59:44'),
(269, '242510268', 'RAISYA ANGELIA', '$2y$10$nmedFVJUT8nhDoELK4t4pOEjttwkGWq02Qhp0o3ZcMBN.9w/fegUS', 14, 1, '2026-08-12 09:59:44'),
(270, '242510269', 'RAISYA MUTIARA ALZAHRA', '$2y$10$K3tPq/1naaVPwK1QQuRq4e4jrL8gZtVfZp5KYO7Y8lfnu9jWAcAUy', 10, 1, '2026-08-12 09:59:44'),
(271, '242510270', 'RANI NUR AENI', '$2y$10$tm.yA0iIjqu2x4A67ENt.O6FZX4k30s.7P2gkf8Q4nVV55Q8/BpIm', 4, 1, '2026-08-12 09:59:44'),
(272, '242510271', 'REYNA NABIHA SHULA', '$2y$10$SjSTRSkyPCPyp0MQRSx3A.irI0ZobLuBqkfCcWUnZJj6YK8IwyRsy', 6, 1, '2026-08-12 09:59:44'),
(273, '242510272', 'RINDRA RIZKIA RAFLIANA', '$2y$10$Mw.yI2jpMQikIKdYai0pcutKcU2mBPsIcHqhQoYyuhXUzmBF5GXLi', 12, 1, '2026-08-12 09:59:44'),
(274, '242510273', 'SIFA ANGGRAENI', '$2y$10$PrI3.yNaQ9sXLZz1YbuAWOvjSM1XfAGfLHnbduV.BEE591rzoakq.', 9, 1, '2026-08-12 09:59:44'),
(275, '242510274', 'SYAFIRA PUTRI HERDIYANTI', '$2y$10$0.MX84aSz9up0hnbdR2xweeQ0yXlhWNMjMptQNqB7lHfj36QbhLLi', 7, 1, '2026-08-12 09:59:44'),
(276, '242510275', 'THALITA PUTRI ANINDYA', '$2y$10$1R10uE1zGgdhsZZ9PCxo4.p6xUtK5/r05WFV84ArXmfl400J0IIim', 6, 1, '2026-08-12 09:59:44'),
(277, '242510276', 'ZIDANE DZIAULHAQ FAHDILLA', '$2y$10$AucbUCx9UFBvaf7wIZPI7OCBUsaBxm9N6NOmfbc9eN2OGV5rRKeqm', 8, 1, '2026-08-12 09:59:44'),
(278, '242510277', 'ADINDA LUSIANA ARISAPUTRA', '$2y$10$roKrSrvJVzKsZDAbBMG7Ce513Lq8IcvaIXB7kX5Yh9STVEc985NYW', 6, 1, '2026-08-12 09:59:44'),
(279, '242510278', 'ANIS FITRY', '$2y$10$d3ylnun2IG70IgGhrmxYgOtLewowyMB3zIVVgSNbnr/j3ejPWRpmK', 8, 1, '2026-08-12 09:59:44'),
(280, '242510279', 'ANISA KARIM', '$2y$10$t1maV6hr33j6Zp11yFhTCeIk5..YB2zsoe/VG6w/hf/Iy1FpC9zZW', 6, 1, '2026-08-12 09:59:44'),
(281, '242510280', 'ANITA HERLIANA', '$2y$10$6DmKF64G3hOC5jWgIlChY.u4OFxPYLcUYStxZFap.jvYCRuQA5NeW', 11, 1, '2026-08-12 09:59:44'),
(282, '242510281', 'ANNISA ILMAN HANIFA', '$2y$10$YTqeAhKxI.cvBhzjLrHGQeGCFV6LjZroomGrK1Nwk/POaRprVgoaG', 9, 1, '2026-08-12 09:59:44'),
(283, '242510282', 'ANUGRAH WIYASA', '$2y$10$pKgZ.m0HPeR8XTeP61RbwuTyHK5FL3gFE7/bv4DKAb/sjoQ21Cck2', 8, 1, '2026-08-12 09:59:44'),
(284, '242510283', 'ARDIANSYAH GUNAWAN', '$2y$10$UCa52cLSY5fJrxg5PfhBQeJuKhw2EccLTk.fdEJubYYZA/V6jwpDy', 4, 1, '2026-08-12 09:59:44'),
(285, '242510284', 'AUREL NATASYA PUTRI', '$2y$10$SILnj1Lc47S4iACxU9yz1.hDoYAc1ZKILQmmUO6Z8Bh7gQWaJroj.', 6, 1, '2026-08-12 09:59:44'),
(286, '242510285', 'BAGAS ADITIA NUGRAHA', '$2y$10$0chNT2hz0hxtkaIYO6ozBepd3J4DB9shYcRc4JFEc/y/HqlNHsU.a', 4, 1, '2026-08-12 09:59:44'),
(287, '242510286', 'CHIKA FARADINA RUHIAT', '$2y$10$BTB2oty5VEBjLng4xBo3.usb9O40wPyejnsv9I4NlgSz5R1ieHY8.', 12, 1, '2026-08-12 09:59:44'),
(288, '242510287', 'DAFFA HAFIZ FIRDAUS', '$2y$10$AWpIn1P6KaBG0wB.NEu3DeGsqhyUW8p6cWq/hdhc4x8rQXyY6nM9C', 11, 1, '2026-08-12 09:59:44'),
(289, '242510288', 'DERIEL RAFIQAYSA', '$2y$10$vc8p3iO9aS/rufqXsug/FuqOhtESmkrtT8gIhrYrMpaCaAJ0CrcDm', 14, 1, '2026-08-12 09:59:44'),
(290, '242510289', 'DIANA ARISTA', '$2y$10$6lLAmuYe7Io/p4Apzc73vuWIX1ucyVakkNlPXh13Z5x/MPEpAd4fO', 8, 1, '2026-08-12 09:59:44'),
(291, '242510290', 'FAHRI RAMDANI', '$2y$10$67QNL68QgR3tvnPo8HdqqezzWHOmWUbho4XHwLWfLxA7uTP1vuBnm', 13, 1, '2026-08-12 09:59:44'),
(292, '242510291', 'FERNANDY ARDIANA SYAHRAYAN', '$2y$10$80c2oTcEgfwPUsg8LrAGvuJ1XcaVymm6qtB7u8A8AYDJ5bl13TYRa', 9, 1, '2026-08-12 09:59:44'),
(293, '242510292', 'GHIANDRA MAULANA', '$2y$10$NaMKuum4mInJJ/yY0Yb9PePUriwC/wr2Gmyb32mUN/EYK2ha66EfS', 8, 1, '2026-08-12 09:59:44'),
(294, '242510293', 'GUIDO JOSAFAT', '$2y$10$/U2hpTYokOzg8kQ7b8UMAOf9ShjG3PtaQ6H9HDdYt9CN1hc/7o4qm', 14, 1, '2026-08-12 09:59:44'),
(295, '242510294', 'HAIKAL CHANDRA WINATA', '$2y$10$XVmAdJY8s8LugZ1xUGeA1OOrD1Wznh7HdzXQ0lf353Z1NcPCx8cAe', 5, 1, '2026-08-12 09:59:44'),
(296, '242510295', 'JIHAN FATHIYAH ISMARA', '$2y$10$fEpuQMwcCHr7a5xI6S1F5Ob1ihHaFbxHhZDCTb9HIK.zF1.Ty5XD2', 7, 1, '2026-08-12 09:59:44'),
(297, '242510296', 'KEISHA YUNA ARIESTA', '$2y$10$WRVq3PQy2vhORmgZuPMeeuRyw4iRoWQOESJ6z9gdF2h5EgO2uQ9QK', 13, 1, '2026-08-12 09:59:44'),
(298, '242510297', 'KEYSA SHAFIRA OCTAVIANIE', '$2y$10$g1z8B0VGL7F6LIDNlEOOI.l7AIQ2acg/pThi59kiqeOmPiteOLNAC', 12, 1, '2026-08-12 09:59:44'),
(299, '242510298', 'LUBNA LUTFIFFAH', '$2y$10$wuDy/UTnWIMu3JPsQ22Y7OS2rFRLugOMI3MYMEuRqzje1WC3zajY.', 8, 1, '2026-08-12 09:59:44'),
(300, '242510299', 'MEILANDRIE ARTIKA SUWANDY', '$2y$10$qgq.ertrRWRLxFMwZChlxOtxz4Ez80BVhezYZBnusWAyRSWp8I/Di', 13, 1, '2026-08-12 09:59:44'),
(301, '242510300', 'MUHAMAD REIZA MAHENDRANA', '$2y$10$XKapGeFmGCl49EaQZXXTbe3EHeLWTVVVgw/tuO40DbJA36wlVj69m', 12, 1, '2026-08-12 09:59:44'),
(302, '242510301', 'MUHAMMAD DEVAN RAMADHAN', '$2y$10$QCMewOLqEWe9sQ3NkdIyQetfcrWD5NMCba70fXg9zsHEcz4YUAs2m', 4, 1, '2026-08-12 09:59:44'),
(303, '242510302', 'MUHAMMAD SAIFUL ABDULLAH', '$2y$10$MbTJoxYvMBTsQCxpv9rqlOIEXhx3EkKA3xsW1PfYqRTIQsJL/c4nm', 4, 1, '2026-08-12 09:59:44'),
(304, '242510303', 'NABILLA KHOIRUNNISA', '$2y$10$IdJgeUQ/8oIRbjDkSRjlb.SYXtA4VekiTgefbcRpne5sPfb6Dqp/G', 8, 1, '2026-08-12 09:59:44'),
(305, '242510304', 'NENG SIVA NURPADILA', '$2y$10$U0r2CxJ5YVB/tUXPfy/6sOQVZRPu8E62sXkJInEAP.mhUQ88ojGVS', 5, 1, '2026-08-12 09:59:44'),
(306, '242510305', 'PASHA FAHMI ROBIANSYAH', '$2y$10$R8fy/6KkL1ifnTFj4yuGTeJzQRb7Lg0U212ZKdxRpjJZnbNAfe9Zm', 12, 1, '2026-08-12 09:59:44'),
(307, '242510306', 'REGITA ANDIA PUTRI', '$2y$10$I7Vj28NdlJV8l7Jx0bUYn.061pE.LFsYBQ1I1qrC2BbK5Huk3EZUm', 12, 1, '2026-08-12 09:59:44'),
(308, '242510307', 'RESTI NURAINI', '$2y$10$/gjX4azmjPlEmVebth8ZZe7prxOSr69PKECiUvaYPJ3HDuz.39O3.', 6, 1, '2026-08-12 09:59:44'),
(309, '242510309', 'RIZKY RAMADHANI', '$2y$10$SkpCFZn.qfMvwcEfPyj.TuI9kn54yTA4LBTKwCN5j6WVoI.jblwTK', 13, 1, '2026-08-12 09:59:44'),
(310, '242510310', 'SANY NURRAHMAWATI', '$2y$10$n5YJpP3BwPeuBca8yZOEqefvJoDLrpneSwTfQLajA346qfNaYEiqu', 6, 1, '2026-08-12 09:59:44'),
(311, '242510311', 'SITI AISAH SAIDAH', '$2y$10$o30l3IfqvgD3CmOTAS5JF.1763tnqqUJltJjxtoSMJ0IEeaPT3SfC', 7, 1, '2026-08-12 09:59:44'),
(312, '242510312', 'SYAHIRA SADZYA', '$2y$10$VppJw1y.ftC.lqPJwkFjbeWc4.kuXPdZhe.pA1cLthEbJ3OL7dZ6.', 11, 1, '2026-08-12 09:59:44'),
(313, '242510313', 'SYIFA AZ ZAHRA', '$2y$10$LkWhEl8rrzZsWb2/en8U2OQLrYZFbfpNvhphE.NkD5cYPkEuZoOB2', 12, 1, '2026-08-12 09:59:44'),
(314, '242510314', 'ZEFANYA KENESIA SINAGA', '$2y$10$z3jh/MDKSIY5yZklskE2lerOISs6VMhv.bdE7ZEgUmVQtQJlrvaAK', 6, 1, '2026-08-12 09:59:44'),
(315, '242510315', 'ADELIA AGUSTIN', '$2y$10$GoKY7Djego0Yc.Xz1lspUOo68/QCBs9QWVw84q4/CsFECq4d0bVnW', 7, 1, '2026-08-12 09:59:44'),
(316, '242510316', 'ANNISA PUTRI', '$2y$10$9CGpLQcPEwJhbEU3zhjHauWnFzxm/9kFVFwgOd7T8cTxCUIKLAifi', 7, 1, '2026-08-12 09:59:44'),
(317, '242510318', 'ARUMMI LAMHA RAMADANIA', '$2y$10$WAGCk7ZHzZmpzEB0rfZuBuGNm2pF4bwF9mSXzXzEtsUpIGtg72zza', 13, 1, '2026-08-12 09:59:44'),
(318, '242510319', 'AULIA RAMADHANI', '$2y$10$lEnskDGgOhpzEJBr12qHzO4U89LnfIXFXFaEEc8NZFLgUlaQnEycS', 7, 1, '2026-08-12 09:59:44'),
(319, '242510320', 'BAYU APRIANSYAH', '$2y$10$Ru.6QHUi3oNTYo4PVUntB.NdR1dgHfc2cU/pB9BpzlqqS.bFl498K', 4, 1, '2026-08-12 09:59:44'),
(320, '242510321', 'BILAL RAJAB SYUHADA', '$2y$10$J1f6zOh8Gc9VCIFghU7yPevICtWbFqrVY3hKsgSVNVf.beAszesPa', 10, 1, '2026-08-12 09:59:44'),
(321, '242510322', 'DEMIAN REIVANDIKA RAMADHAN', '$2y$10$81AEhefwjBFg2aqoRDdaVunbUAQyWCH14Fv4NoBPbQa5NhBj/m5XO', 7, 1, '2026-08-12 09:59:44'),
(322, '242510323', 'DENI CANDRA SATRIYA', '$2y$10$KOXEheR1WnKK5.AMt3Nzp.QcW.QCt2YS0kYKn3fGk0c7e6FHJhYVu', 11, 1, '2026-08-12 09:59:44'),
(323, '242510324', 'DIANA JELITA KUSUMASTIWI', '$2y$10$hJ1tEDDPebr1Sjabgku15eC7g1Y8.ZRAZU51zWiQvc0B/hnU.BM7.', 10, 1, '2026-08-12 09:59:44'),
(324, '242510325', 'DIANA SRI WAHYUNI', '$2y$10$eQWch8p9BRUcJFcdITzY/OnrRPnHnv.cbfscPNMuu7F0NdPEHtVBq', 11, 1, '2026-08-12 09:59:44'),
(325, '242510326', 'DIMAS DIKA SAPUTRA', '$2y$10$C9Q9aqnbVbjMb9HHXqmaruLB8MYwwYqI4dwtWxy1ItlhlcsICaVPa', 5, 1, '2026-08-12 09:59:44'),
(326, '242510327', 'FADIA AZAHRA', '$2y$10$4iu9nD.ujgk7eZc6A2j6SevRk.8uFa8fOQk88/Y.ngz5XKfoQfu6i', 5, 1, '2026-08-12 09:59:44'),
(327, '242510328', 'FAUZIAH RAHMAHAYATI', '$2y$10$uXrrgMbZRse7/lX1VWCICOK6MEeBzlKT7OmeRE4JiCz54csg4hyzO', 6, 1, '2026-08-12 09:59:44'),
(328, '242510329', 'GARNETTA ARTANTY', '$2y$10$QeYBmZ9H7YXLRyEa95i7iuoU6iS7h.InU.FSdxhkn68Y8kWEXwi3.', 8, 1, '2026-08-12 09:59:44'),
(329, '242510330', 'ILHAM RAMADHAN', '$2y$10$I36hMQgYieWC.ai26Fwq..z4eQMwlBKuO.SNWCVUq9xeUPQF01x26', 12, 1, '2026-08-12 09:59:44'),
(330, '242510331', 'IQBAL FAJRI FERDIANSYAH', '$2y$10$GWm8hEcEfQvr4GoR4s9wb.Fh81CmIYhSut1i4R4bK5rcISIoiU8Zi', 12, 1, '2026-08-12 09:59:44'),
(331, '242510332', 'JANUAR MOHAMMAD DRAJAT', '$2y$10$kjjnblpOw4ruaub.Solri.KWhqRFhAB2oX3B7g2keMjDls9mdvPFO', 6, 1, '2026-08-12 09:59:44'),
(332, '242510333', 'KAYLA HUMAIRA MAULIDA AZZAHRA', '$2y$10$vf9FKkPmtepG/3YDC.W71uaoJDucELR.N88.nPf/DrzYoy73c/ibK', 14, 1, '2026-08-12 09:59:44'),
(333, '242510334', 'KESYA KIANYA QUROTAAYUNI', '$2y$10$ehQhISJOi7wu9wM1JZlMyen2Lxt2ETnGdjh8GcqJ3UZcjkhpVJHla', 14, 1, '2026-08-12 09:59:44'),
(334, '242510335', 'LAILA RINJANI', '$2y$10$rox37dsP3uw9chmY22CFfuQKHoFSlWGaRLv9HrcLWIA2q7UckH9hG', 13, 1, '2026-08-12 09:59:44'),
(335, '242510336', 'MUHAMMAD FAHRI ZARNAUZI', '$2y$10$bYQuDU8py.eLLFCDXo2I3OXskbhhradwUfQtOhOTwJVy33tX1NJ62', 11, 1, '2026-08-12 09:59:44'),
(336, '242510337', 'MUHAMMAD FAIRUZ KUSMAYADI', '$2y$10$OXXnHufa2aGNuxAzkKJ/rOoHUL32Oyc.UNWeTCgIBisOYy7IZxT6C', 11, 1, '2026-08-12 09:59:44'),
(337, '242510338', 'MUSHAB HAFIDZUL KARIEM', '$2y$10$kT2M0ERNU4KYhtQ4p263SeyDUWGJElzCH55T.R08LtIXCCSXtxwvS', 5, 1, '2026-08-12 09:59:44'),
(338, '242510339', 'MUTIARA AGSTYA SETIAWAN', '$2y$10$Sg/fCuDbTd.sdRID/9ugd.ihumJG1FCNHxVRub3xkODTq5e3r59kq', 12, 1, '2026-08-12 09:59:44'),
(339, '242510340', 'NAYARI ISNA LATIFAH', '$2y$10$NfvBzf6d0sAYKxoaeu5uUevSLdkBA2qY/UcpRC1IJFsEXywT1kATm', 14, 1, '2026-08-12 09:59:44'),
(340, '242510341', 'PAUZIAH', '$2y$10$RZPmEOo5w/XR7T72Hc0PfOOJePL3eaecBaVq/wUIoZR8uVuhO7R0O', 7, 1, '2026-08-12 09:59:44'),
(341, '242510342', 'PERMANA AGUNG SANTOSO', '$2y$10$eEQ7/rmrfIgyAYqBNnRmtuh6bzvz3695xA6fCXKmd6SxSS0cSoa9e', 5, 1, '2026-08-12 09:59:44'),
(342, '242510343', 'REHAN PRIATNA', '$2y$10$RYYXDiukL26t0zTE6Xk.AuOPQy1OtifjsgO3chkUDPeV3g0yQg.Ea', 12, 1, '2026-08-12 09:59:44'),
(343, '242510344', 'REYNATA RAHMA NOERRACHIM', '$2y$10$amq1XSQ5Z/xnLcGfF.w1CuQ/ZZaOne2nOsXEuKINYUMWcQAhIVS1O', 7, 1, '2026-08-12 09:59:44'),
(344, '242510345', 'ROBI MUHAMAD ZAKARIA', '$2y$10$ZFpcosOLMi/aHn1kItWg3uunUjWvwsoKec0nyDe0bROGkA2Yd2Sme', 10, 1, '2026-08-12 09:59:44'),
(345, '242510346', 'SAYYIDAH PUTRI SALAMAH', '$2y$10$SqWIQPDKXcDT24GI8q7MCuKclOtYth7nnwwTML1ecV/AAgjmisD6S', 7, 1, '2026-08-12 09:59:44'),
(346, '242510347', 'SHAKA DICHI PUTRA', '$2y$10$tKhhuWr7Sq3SjK9sEmFKLejGI4fwgq.15S4uGYLg8EN5Y34JqlAb2', 7, 1, '2026-08-12 09:59:44'),
(347, '242510348', 'SITI ANISA SAHADAH', '$2y$10$xrAoHGytnHRhkDlLiMRRSeLO6ac3izcqE1NXpF9Kq9ypwp6EKu0QK', 13, 1, '2026-08-12 09:59:44'),
(348, '242510349', 'SYAHRANI FITRI AULIA', '$2y$10$1/ZCf4EsafzuWjD9F7whyOoKZAb88n0GuYg4Sgv4wORjYTsK9.OOG', 11, 1, '2026-08-12 09:59:44'),
(349, '242510350', 'SYIFA KIRANA AMRI', '$2y$10$Uvey/Kaa9oUeRntereoLyOFvV0mJWaAvkKVLKWDKlu3B27mUDeO6u', 7, 1, '2026-08-12 09:59:44'),
(350, '242510351', 'ZOEBIE WIDANSYAH ABDILLAH', '$2y$10$soVp4lwtRl3ztjpasMTXbuw2tbqJEIHXQ628v6I08wAsrSudrsokq', 7, 1, '2026-08-12 09:59:44'),
(351, '242510352', 'ZULFA TASYIRA ALGHIFARI SABANIAH', '$2y$10$SNmck36qbkYRsU1.mgzrz.DObG/KSiy.Zq2ryFh5dllS2PolUs4QO', 11, 1, '2026-08-12 09:59:44'),
(352, '242510353', 'ALFAIRA BERLIYANI', '$2y$10$zoQJtZHTUsa2u5y0VMi7.uqXoDhWAUL/UrTchxqm78nlGL5gPJj1u', 14, 1, '2026-08-12 09:59:44'),
(353, '242510354', 'ALFIKA KIRANA', '$2y$10$XjbtdnCd/2guxU2cQMtHPue9HVjYfXoyGK2YxxIEbYMr4./RoAVAG', 13, 1, '2026-08-12 09:59:44'),
(354, '242510355', 'ALODIA FIDELA ATMAJAYA HARMONO', '$2y$10$uyHhZPsP0BW82ZfpbMy7k.I/hlWYcwPT6cQ39lLArBAHaiQvZcfFO', 9, 1, '2026-08-12 09:59:44'),
(355, '242510356', 'ALYZA KIRANIA AZKA SHAFIRA', '$2y$10$K5gYx7tJ4BuvG9uSp5uPDOJBTbYVc.PofKx6zRoXTVXNWeWtpAxka', 7, 1, '2026-08-12 09:59:44'),
(356, '242510357', 'AUFA JAUZA AZKIYAH', '$2y$10$UvByWhXyspUstDdl5tI8veomsLQ3a57DNQjhaYZ.4K.JcE22QXHoG', 10, 1, '2026-08-12 09:59:44'),
(357, '242510358', 'BINTANG MUHAMAD AR RAVI', '$2y$10$YLy0uODowuv3WLtH2Nzi4OZm1qt0N6flBlLozfgigtsUewnJ5wPSG', 13, 1, '2026-08-12 09:59:44'),
(358, '242510359', 'BUNGA ROSI MUTIARA SANI', '$2y$10$wS2cHeR6UsWCjVEHbegovulwStOYUNgdO9RIlM6QCuXl.T4zY2FQ2', 5, 1, '2026-08-12 09:59:44'),
(359, '242510360', 'DENIS PERDANA SETIAWAN', '$2y$10$qE1zBOpAUC6Rot28t6qJr.owaXZ6h8fWexBXUGUxUvU2Rfz3Zv0w6', 4, 1, '2026-08-12 09:59:44'),
(360, '242510361', 'DIMAS ZAHRAN ASSIDQI', '$2y$10$JdqE9PhmCFySKuPEjcjqp./QHlNXfq9x9GCnhnjzj12JhQU2ujt4.', 5, 1, '2026-08-12 09:59:44'),
(361, '242510362', 'DIZA AUFAA SOFYAN', '$2y$10$mRIAgpuqnMTzkJwF60LCHectu95GfwuZzbtVgozVuzy3pJuhYmVle', 11, 1, '2026-08-12 09:59:44'),
(362, '242510363', 'DURROTUL INNAROH', '$2y$10$tcZoasvrNPeUfJdf5Cxugu.3LKATIkq3bRuUG7Iwcqc5ov/Hx6oIC', 6, 1, '2026-08-12 09:59:44'),
(363, '242510364', 'FIRA NOVIANTI', '$2y$10$FsO56O6k7qFJCvV5eM493OCR1xAGYfHAoqSgMmu79Fmwt.U6Rg7U6', 7, 1, '2026-08-12 09:59:44'),
(364, '242510365', 'ISMA RAHMAWATI KUSUMAH', '$2y$10$l8d7LgCV9ZWFK4uxfUFxOOrx3Nh5mZnooH1RHtGxIa0ruW1SK05iy', 11, 1, '2026-08-12 09:59:44'),
(365, '242510366', 'IVAN ATHALLAH MUSYAFFA NURDIN', '$2y$10$bQKVUU2rS7KHjsVFRPJjIuLk6CKk3.lfHQtI6tzQMWeMmn2K38aym', 13, 1, '2026-08-12 09:59:44'),
(366, '242510367', 'KANIA RAMADHANI', '$2y$10$.WmKQgPfgAbwYwv5mKfu3uYPotiNAkMvZs3PSdalk68.FGkf7jv3a', 5, 1, '2026-08-12 09:59:44'),
(367, '242510368', 'KAYLA ROSYAITA IMANSYAH', '$2y$10$1xrCK4xl2QgFHpncUMLeq.pFYK4pLzCCe/d1yF.JUzFcd8JoWUQyq', 13, 1, '2026-08-12 09:59:44'),
(368, '242510369', 'KEYSA REGITA NURFITRI ADRIANA', '$2y$10$4lS2w66m0bOm47XWb7n0pOPHKgWZSHSnlpP0IiPmItJLVSXryhYAG', 14, 1, '2026-08-12 09:59:44'),
(369, '242510370', 'KRISTALICA PUTRI', '$2y$10$K.4YqKLLTK5uBSySduogceZI8YQjROVK8i7rtyqll5Vlyik/dBC1u', 7, 1, '2026-08-12 09:59:44'),
(370, '242510371', 'MOCHAMAD RIFQY NUGRAHA', '$2y$10$x/6HynNVEH4iJ6lYxa.hcOaDN.1Rybvs4uMhvg0NKn3RRX/rfRW2W', 4, 1, '2026-08-12 09:59:44'),
(371, '242510372', 'MUHAMAD REGAN FAUZAN', '$2y$10$vr9lYCMUC2LcvtUKmurIiOGsQn68UOaPlcKXJMnFbCGMJDNeomtD.', 11, 1, '2026-08-12 09:59:44');
INSERT INTO `siswa` (`id`, `nis`, `nama_lengkap`, `password`, `kelas_id`, `is_active`, `created_at`) VALUES
(372, '242510373', 'MUHAMMAD ARYA KEMAL', '$2y$10$ECHKXpRxmrhpP9G7GLrDkO6d1uoK0/lHR0Y5CdTwQalevwdPQ6Ps.', 6, 1, '2026-08-12 09:59:44'),
(373, '242510374', 'MUHAMMAD FAJRI SUBHI', '$2y$10$6kA1yQS03GY1.X5EZgstmOQBhkJkvpVbkIosINCnEj2HNbX6F2LrW', 5, 1, '2026-08-12 09:59:44'),
(374, '242510375', 'MUHAMMAD GHAUSSAN ARIFIN', '$2y$10$IOARHsQcWhNs6VRpmosab.3Asml7Oq70ZfsOaXsoAAM2vMT79QHz6', 5, 1, '2026-08-12 09:59:44'),
(375, '242510376', 'NABILLA KAYLA KINASIH', '$2y$10$/ibKanSaX9o5TFQe.ZDj.ewtyVobuSLBVm7LZ2yUqkJ7RtMNwylza', 7, 1, '2026-08-12 09:59:44'),
(376, '242510377', 'NAZWA RHEIZA YUSHA SAPUTRA', '$2y$10$2HCq94FDXc4esYSABg0Gb.RGI/0DmxxDPrLVY1hf604DZZmq1fsX6', 12, 1, '2026-08-12 09:59:44'),
(377, '242510378', 'NESYA HAURA TASMIRA', '$2y$10$e09EFqOncgL.iVDRPJNg.O.mIQRDkLV0YFpGWU9f0tVgA9lh4hU8K', 9, 1, '2026-08-12 09:59:44'),
(378, '242510379', 'NILAM NAULIYA HERLIANI', '$2y$10$L0IVDr/6HMAqVsLy6kQgUOQfbzxIG4DFlM/MZazjQeTroOStlqnLO', 4, 1, '2026-08-12 09:59:44'),
(379, '242510380', 'PRISA RAHMA', '$2y$10$/ulbOXHBnnmAoY7kDBR8tOgA37A0VJmN1zdG6Mb395o5eDdROOp7a', 8, 1, '2026-08-12 09:59:44'),
(380, '242510381', 'RADEN MOCHAMAD REYHAN FIRDAUS', '$2y$10$BxAtJJwgCGb2eJSP0dd7Cu44imODZ2BPs/R8Cz341L1jbfR2V7ES6', 8, 1, '2026-08-12 09:59:44'),
(381, '242510382', 'RAFFI SAMIR NASRI', '$2y$10$hdeym2aMzLcnQidtKyfMnenQDkcdniHTJEcIqO9xQhcs.uLba/biW', 12, 1, '2026-08-12 09:59:44'),
(382, '242510383', 'RAMADHANI SUARDI', '$2y$10$jubcss/HS87IRYw7cd1bm.xVkds2qxZ9w2Pwv8g0rOoazC9MJMhJK', 5, 1, '2026-08-12 09:59:44'),
(383, '242510384', 'RIDZKY FAUZANZY', '$2y$10$CZpvgZ2mtTtgrb/FNi40qu4/oUblxZQLj.bU9BkXnGLsVechLdNpS', 11, 1, '2026-08-12 09:59:44'),
(384, '242510385', 'SAMMY ADHITYA RAHMAN', '$2y$10$S6qjzgfCOLct/SQ7R2yIy.ZKQqqDQzC0MI62x.r56f3ygg7AlLGzO', 8, 1, '2026-08-12 09:59:44'),
(385, '242510386', 'SEPTI DWI RAHMADANI', '$2y$10$57kIdsmwPaIl/wdjDR7QdO8LBe5YrLjTdqMtF3BginxlS59D1bDj6', 12, 1, '2026-08-12 09:59:44'),
(386, '242510387', 'TALISYA CALISTA', '$2y$10$vdYzlprkp0L/4MQv1xXRQ..kckJlmqq.giumhCEQt3Het6YMYpn1.', 7, 1, '2026-08-12 09:59:44'),
(387, '242510388', 'WINA SEPTIANI ROMDONI', '$2y$10$3dPoDApdukkJv0iwM/VN9.Jo/vc.TokC9QmoSaPADPcyOwGTZio2u', 11, 1, '2026-08-12 09:59:44'),
(388, '242510389', 'WIWIN', '$2y$10$7E29WJpduJvPE07mw.2rY.XRO4u7fKY4PIKjjHIo0Cl9QFq2kEJ3K', 4, 1, '2026-08-12 09:59:44'),
(389, '242510390', 'ZENITHA VITALOKA', '$2y$10$NCZm0jPFwy.P5ESTAQsx.OtiXha/GUrvqD4nvHSOPlN59xlOB94Eq', 7, 1, '2026-08-12 09:59:44'),
(390, '242510391', 'ARIO HIDAYAT', '$2y$10$qCcy5e.QPDTjPw5Eg1Huq.HMIK1LaPdQrTdj27fXqOHrOIGncJJLi', 13, 1, '2026-08-12 09:59:44'),
(391, '242510392', 'AURA APRILIA', '$2y$10$9rtyXX9oi.1tVeLcsJJvC.DMDhiBTad6pijwax3wqla4mYLokgt8u', 12, 1, '2026-08-12 09:59:44'),
(392, '242510393', 'BOBBY ADONOVAN', '$2y$10$CA//WUwz.g8Pjnli1Cw7.ed2mkh.26gSnLcPkbWP1UhjB5SeECd7i', 9, 1, '2026-08-12 09:59:44'),
(393, '242510394', 'CINTA DWI APRILIANA', '$2y$10$.UKrx8jNcBBpstoftOLMyuva82MszjV.4mXHs.BFao4k3yBZFIwn.', 14, 1, '2026-08-12 09:59:44'),
(394, '242510395', 'DIANDRA PRAMUGIA RAHARJO', '$2y$10$VM5ypyws2bC1RRLmFVrJTuvy6rZ7QpmviOfFBUucdV0ia9njF2sPC', 5, 1, '2026-08-12 09:59:44'),
(395, '242510396', 'EFFLLY RACHMAWATI NOERANI', '$2y$10$YYywZHYHvr8cVwArzC3IOe/tTkEOx3YDbsUzBAKZ.V60waO3kRpPe', 14, 1, '2026-08-12 09:59:44'),
(396, '242510397', 'ERLIE ZAHRANI', '$2y$10$.BO7HPtYGSsjJAYCsvSIXOEbtR8zTSmWC4OGt9s5lD56g/IUzUqQW', 12, 1, '2026-08-12 09:59:44'),
(397, '242510398', 'FADHYL RIZQY PRATAMA', '$2y$10$h3EwetgyeVRgSqMGmtxEuu1W4unmhUZLgNDeQCi4tlkDNh8E.285y', 9, 1, '2026-08-12 09:59:44'),
(398, '242510399', 'FAHRI AKBAR', '$2y$10$IMGxt0elJu1JNvP5QBDR3ODzrtx8gyg8Z6MvN7kdacQmAn4jZ818W', 12, 1, '2026-08-12 09:59:44'),
(399, '242510400', 'FEBRIYANA PUTRI PRATAMA', '$2y$10$HvVoh5mNKf09Uy8IgdDoie6Vq6seyqPl7sISmHPh/cDASW7hwJA9.', 10, 1, '2026-08-12 09:59:44'),
(400, '242510401', 'HANIF AQILLA BAGAPRAWIRA', '$2y$10$KZu2I2CH6G3jS3m8BIHk2.Ybu1SfTVFyZmU5XtYNcz2KNq3VurwK6', 6, 1, '2026-08-12 09:59:44'),
(401, '242510402', 'JUAN YESAYA', '$2y$10$5qxljKRDP5k6iUF3i.JAXuziSv../l/4rbjbiMoZBPYiIHSDXCoLm', 4, 1, '2026-08-12 09:59:44'),
(402, '242510403', 'KEYSHA NALA ALRAF BELLA', '$2y$10$lNcINfCtODaCzY5BsObSveZIPe5Dus0uW1tNzjGqDSL2b8/6trtIC', 10, 1, '2026-08-12 09:59:44'),
(403, '242510404', 'KEYZILA NAFFISAHANIF', '$2y$10$Oj6MU5U0CPVIC6k6O0QdfuHev8GSKElwxKXfj4ncaG89sahOK8x8y', 14, 1, '2026-08-12 09:59:44'),
(404, '242510405', 'MOCHAMAD RAFFI AL HUDAFI', '$2y$10$kLYikkLxGt40hbGzXOrgH.hZweHUGxhEPl037uWM71ZwR6ysq5xXG', 4, 1, '2026-08-12 09:59:44'),
(405, '242510406', 'MUHAMMAD RAFA DANI PUTRA', '$2y$10$qSflA7h8G6BaiKjFlNuXIus7XDv7WICOSH0RqELdQYpkk51Us3h8G', 10, 1, '2026-08-12 09:59:44'),
(406, '242510407', 'MUHAMMAD RAFFI FAWWAZ', '$2y$10$NxOwyb7Pmini.9.aOOXPkOo9NWaE98IstXlKju9jGDKzbV8kBIRXK', 4, 1, '2026-08-12 09:59:44'),
(407, '242510408', 'MUHAMMAD SYAUQI ABDUL A\'LA', '$2y$10$Y2S2H/3AZreiyB8oslyiROtko54Bdlra3LSRLyf83BD3f5ONkZ2Ae', 11, 1, '2026-08-12 09:59:44'),
(408, '242510409', 'NADHIIFAH KIRANA SUMANTRI', '$2y$10$Zkt4LfC5PtCjmCVS3acC9eVp5ChhST7P50RDyOYiMq6sKkCspRe7W', 9, 1, '2026-08-12 09:59:44'),
(409, '242510410', 'NADILLA DWI JULIANTI', '$2y$10$Wu1/cfE.PzQIwJIb1qi72O.pOGia.vLSjNby71RTo1RKJZTXy.ELi', 5, 1, '2026-08-12 09:59:44'),
(410, '242510411', 'NAURA SHAIRA OKTAVIANTI PRATAMI', '$2y$10$W3MEsk7ZEHVlkgvC6LwuFOCTXgVSOFRCMyWq/VFMVAdROlF5HNfAC', 9, 1, '2026-08-12 09:59:44'),
(411, '242510412', 'PUTRI AYU', '$2y$10$YQzIhJunWeu1wPnkencmJuQJM8KHYIQzgmJXNe2sm.yEy/LvotCfm', 13, 1, '2026-08-12 09:59:44'),
(412, '242510413', 'RADEN MUHAMMAD RAFI SHOLIHUDDIN', '$2y$10$iJmH.MfAcsQSkJafsXRleeZsi2c5/kLDQI4OQrzsARG051Xv/AICm', 14, 1, '2026-08-12 09:59:44'),
(413, '242510415', 'RIFAL ABDUL ZABBAR', '$2y$10$/7IgsaRGbU.b/wFqH9ImlemNfUIzwrMtNuAwpiNI6jhKOCQji4JXK', 4, 1, '2026-08-12 09:59:44'),
(414, '242510417', 'SABILA TRI CAHYANI', '$2y$10$HDUTDKEgDhd0P3TW91StF.juV.oTbrr4xREPWeOlVaVevdC8y0jS2', 13, 1, '2026-08-12 09:59:44'),
(415, '242510418', 'SARO GANDA TUA MARPAUNG', '$2y$10$Oq5N81I6k1OCZSBTOTgnfeRtROLePRAs/y1ED/Xk3YAE1NZedu8s6', 13, 1, '2026-08-12 09:59:44'),
(416, '242510419', 'SATYA AFDHILA BAIHAQI', '$2y$10$p.eMssbM82MIU1rZKF2GAuOujae11eYSpmBQlC8dF/6iLE9aNGPiq', 5, 1, '2026-08-12 09:59:44'),
(417, '242510420', 'SITI NURUL HAMDA', '$2y$10$RYi1tXa2m/aT0e47sbc6e.izZqch48qA9NbcaODRQLT0Q0Rn/vEKO', 4, 1, '2026-08-12 09:59:44'),
(418, '242510421', 'SYAIMA DALILA AZKIA', '$2y$10$gfsfbN.TGEqFfPoQtgnWOeKSwHH0iAM4jSb/StkNWiMJQnOirEb5O', 11, 1, '2026-08-12 09:59:44'),
(419, '242510422', 'TAZKIA YUMNAA NUUR AANISAH', '$2y$10$WMH8x.cEDhyFmA9F8E5/B.yNYfeQZf7gvE4.Lfn.Xuy/n94okXkce', 10, 1, '2026-08-12 09:59:44'),
(420, '242510423', 'TIARA RAHMAWATI', '$2y$10$8JXd2hRVxS72G2ltPdGHy.0hEoQx3xMHjkE0R3ekc/ZH8TkNRhKYy', 5, 1, '2026-08-12 09:59:44'),
(421, '242510424', 'WINDY ALYA MUTIARA RAHMAH', '$2y$10$aVD.0GUdTmrIhqmZHVwgfuJpVUpB5xCBZrVDpzUtv9KOwwD8JLv3i', 9, 1, '2026-08-12 09:59:44'),
(422, '242510426', 'YUDHISTIRA ARISWAYA BAYUNI', '$2y$10$fJahJF6gGlMoURTzsP26sOk/qPK1kw9sLt4vj93DmobXs547yagm6', 4, 1, '2026-08-12 09:59:44'),
(423, '242510427', 'YUSUP HAMDANI', '$2y$10$PrhDllEbmPPU882u3DsZ8uLJWCoKbNQsW7.hPSVmeP9CdqW5Oqwlq', 11, 1, '2026-08-12 09:59:44'),
(424, '242510428', 'ZIKRI KHAIRUL FADILAH', '$2y$10$xGX6Bp6f/.jdQl6gxJElEOxvOyE09hNePsXB9ZLgmGeRAzs8JAuqe', 10, 1, '2026-08-12 09:59:44'),
(425, '252610001', 'ADELIA ANANDA PUTRI', '$2y$10$yVhDFtaBaXvdO/nLfnbf9e6c4BbNDw/BhqTkz5bS9NVwlKPKE/hpS', 15, 1, '2026-08-12 09:59:44'),
(426, '252610003', 'AKHDAM MAULANA RIZKY', '$2y$10$DCu1/pgSnk8N6fabD3e4felTWhTfiDokWECmlHjzroDBU3oDl3fBy', 16, 1, '2026-08-12 09:59:44'),
(427, '252610004', 'ALFIKRI SURYA AYUBI', '$2y$10$SlgkmOVUvWzBZvkO07RzWOIPu7M.52ar1esJAEO8sbCWgYWi7PlzS', 17, 1, '2026-08-12 09:59:44'),
(428, '252610005', 'ALIF RAFKA WIJAYA', '$2y$10$ZZPvLkQwXwftenlpteB0D.MR5jZeCCM6nVwJLU7OzL3wsmOcu9W3y', 18, 1, '2026-08-12 09:59:44'),
(429, '252610006', 'ALVINS SONJAYA ALBAR', '$2y$10$uz915GCMrmxbgSgOOOKlnOv7t/Ju7zcjOUXcuUlys2EZK0br5BjtG', 19, 1, '2026-08-12 09:59:44'),
(430, '252610007', 'AMALIYA SITI MABRURROH', '$2y$10$PusovB5i90Xgp/Rpx1MrpOztAdMGEcIWjMfBTcBPt.BmsMxkxJan.', 17, 1, '2026-08-12 09:59:44'),
(431, '252610008', 'ANNISA HIDAYANTI', '$2y$10$iBfWiVxrgE29XMVKru7z..81xpNchwRGhWqd.muYetI2MYl1yIHAm', 20, 1, '2026-08-12 09:59:44'),
(432, '252610009', 'AURELL SHABILA JAYNAPUTRI', '$2y$10$Up1DpoFtWjVuTqF2q9uQQu2DsJpHY2QOSnZ8Xyr.CfZqLtMiX2/HC', 17, 1, '2026-08-12 09:59:44'),
(433, '252610010', 'AZKA MAYLA KHANSA', '$2y$10$5haO.ibz3PI09Mo3W2Gcn.FHbMdTd9fEZEQWVP.lVdAAOjPdndJQC', 18, 1, '2026-08-12 09:59:44'),
(434, '252610011', 'AZWAR AUFA HARDIANSYAH', '$2y$10$ZN6geH3S7Qn/3wHCPxZx.OnEBB4hNrYX2bExVv95E0DCLhipnVeBe', 21, 1, '2026-08-12 09:59:44'),
(435, '252610012', 'AZZIRA SYIFA SUPANGAT', '$2y$10$ayDEyifshukIScJQZrOh7u71FoiT8hx5lbiEJzZIluIHwZkhcWqu2', 22, 1, '2026-08-12 09:59:44'),
(436, '252610013', 'CHEISYA YOLLANDA PUTRI AZKIA', '$2y$10$ECiWFyYnLXiQUz4ITFqyWO0c2fiyB.DfsJFXppPEnkGB/uJ3sk81e', 23, 1, '2026-08-12 09:59:44'),
(437, '252610014', 'DAVINA ADHYA KHAIRUNNISA', '$2y$10$r/hZXdE37E1p5xXzMeO88eAJTiGbn9SKO0n3RB7CgZQmiVujET0tm', 20, 1, '2026-08-12 09:59:44'),
(438, '252610015', 'DEPSA EKA NUGRAHA', '$2y$10$5sQN.IsBP9f8KPHb.DMyR.k6JuVe2S.pPi9iaspniJ9iOYKtzDcyy', 16, 1, '2026-08-12 09:59:44'),
(439, '252610016', 'FELLISA PUTRIANI', '$2y$10$hlbAyhdbsW6HdqGMrG2wYOlfhTMLFn0iVRJ4FU7s.qTY6zKRRj4fy', 24, 1, '2026-08-12 09:59:44'),
(440, '252610017', 'FIRAS ILMI CAHYADIN', '$2y$10$q1EihlMm950xwvCI3M.z/OpkoKnDG7g9JKtxWiAmKekD20WSG8rmy', 24, 1, '2026-08-12 09:59:44'),
(441, '252610018', 'GAZZA AKBAR', '$2y$10$Tcu9/VyH/bnuiKmb0C5Ebuq8HLI3sNu6/RffUky0NqgTpixUd7ZQu', 15, 1, '2026-08-12 09:59:44'),
(442, '252610019', 'GIO GUCFA AL HAQKI', '$2y$10$KaeuTYq.Jbfwb8QTcLTn7..vyp3GNslvLfdBOESB/oJbCfFktuLN2', 21, 1, '2026-08-12 09:59:44'),
(443, '252610020', 'HASAN MAULANA', '$2y$10$iXXBWVykX8FR3LFCUeGL6ualhWTXa4hNDVH/KSZvXl/lDOQ/LUZ9C', 23, 1, '2026-08-12 09:59:44'),
(444, '252610021', 'ICHA KAHERUNNISA', '$2y$10$UTFnnMZaOv8eo8A.GiHy4.KZQsne9vgqqvHNoHf8bl8lrrJDJYPvm', 19, 1, '2026-08-12 09:59:44'),
(445, '252610022', 'KANZA BERLIANA', '$2y$10$sI8JpJa5AbbktENW8LuysuordBeCE6Is2ky3nAFesLAPatZf2SEpi', 25, 1, '2026-08-12 09:59:44'),
(446, '252610023', 'KEYLA OKTAVIANI ERYAN PUTRI', '$2y$10$vE56Po0p5bkG.QoXQPHYHeapJGIykDQmTWD0JN6f0Z4y.jgnWXJcu', 19, 1, '2026-08-12 09:59:44'),
(447, '252610024', 'KHOIRUNNISA', '$2y$10$5.q6TtQMaIaQxQHIcxj3/./5V3hH2UXFHn1RPWclyqkUppKL8k0qS', 19, 1, '2026-08-12 09:59:44'),
(448, '252610025', 'KIFA AGUSTINA AZ-ZAHRA', '$2y$10$NHQ9H7h/3UIS7/bHCA.FAuhYWnNEjPy1HZvw5ihLla1jfBXAg5Gde', 25, 1, '2026-08-12 09:59:44'),
(449, '252610026', 'LUTHFI FAUZAN PRAYATA', '$2y$10$jahS38aEz0lgg3sJ2Qdix.kZVi0oKgqBwIUNaqVz1w1XNb5yz2hl6', 18, 1, '2026-08-12 09:59:44'),
(450, '252610027', 'MASAGUS MUHAMAD HANIF ATHALLAH', '$2y$10$8iBXK5MFTt/33HTdpH5tuOluK2aU8Uti3NnfEBDH./JBtwj5ZasHC', 20, 1, '2026-08-12 09:59:44'),
(451, '252610028', 'MUHAMMAD DESTA DAVITRAH PUTRA NUGRAHA', '$2y$10$pQpnv4qdG/O3ZhLBqJsQuupUKDzvoHHx.ClapvTZuqt.h7ERleoTy', 17, 1, '2026-08-12 09:59:44'),
(452, '252610029', 'MUHAMMAD FAHRI ABDUL HADI', '$2y$10$sAS3nQ1p5dWb4Zkgo1SHtOWO/S6GMV2M.1L37UoP89GuZbzcd0n1W', 26, 1, '2026-08-12 09:59:44'),
(453, '252610030', 'MUHAMMAD RAKA IMANSYAH', '$2y$10$ZsbJ0gXgYD2/HARnOed/d.M736kUa8LJp8/yZjnJiJ6QPuSbmlimW', 24, 1, '2026-08-12 09:59:44'),
(454, '252610031', 'MUHAMMAD RAZVAN PUTRA DENA', '$2y$10$zoYkn.ge9iQbs6nWO/g1..2DGPesdGWrJPMylxPqseRkezvi95DRW', 15, 1, '2026-08-12 09:59:44'),
(455, '252610032', 'NABIL MUKARROM', '$2y$10$2LS7kWlgt0PFgKwRhCu6V.y.Z1yAtsL/ffyw5JHvOQ59VJxVUNDdS', 16, 1, '2026-08-12 09:59:44'),
(456, '252610033', 'NADITA PRATIWI', '$2y$10$y19zS6oYaWJ2TGRjW4bMRObnr8l0WlT/6KOjonqnOYmWEsoZ429L.', 18, 1, '2026-08-12 09:59:44'),
(457, '252610034', 'NADZIFA ZIVANA LETISYA', '$2y$10$x30Op.YYcaBAlWnhml9gIulvAXlG7dU6yLucU54kJCsdD0Ah6TITq', 22, 1, '2026-08-12 09:59:44'),
(458, '252610035', 'NAYLA ZULFA SAPHIRA', '$2y$10$rYLsAiegHRqtDhpyi5DMYe4PY8ZBiDXTBLR7aA9j3/bdWd8keclaS', 25, 1, '2026-08-12 09:59:44'),
(459, '252610036', 'PUTRI KHOIRUN NISA', '$2y$10$5hw9D9If1xiQx1L7sUDgLOCAtF0ud5yXEbG99DOLTgXwk/UTUxDQK', 20, 1, '2026-08-12 09:59:44'),
(460, '252610037', 'RADITYA FACHREZA', '$2y$10$DojzxZwmKA9hYAtrPgp7FOMTyD7eART5QnDBR6twc3BALkONCPIim', 26, 1, '2026-08-12 09:59:44'),
(461, '252610038', 'RAFI AHMAD BASIL IBNI MAULUDI', '$2y$10$TT11SGaU75XURgywMTUDdeg104Y/meHweVRv5vyeFasoAU6rLw0zG', 22, 1, '2026-08-12 09:59:44'),
(462, '252610039', 'RAISSA OKTAHAVIAN STEPANI', '$2y$10$H2vpsG3X2L7oGIjexRDakegK4UYbtdeA6cG5GeAN/ijLchsYfro6K', 18, 1, '2026-08-12 09:59:44'),
(463, '252610040', 'RAYNA KHANSA\'A YASNISA', '$2y$10$6fI7/87GffbMYxz1uYmITuJ4WGAqlBM8ifNo.xPyh//5.E/57CJYm', 21, 1, '2026-08-12 09:59:44'),
(464, '252610041', 'REGINA MELIANI PUTRI', '$2y$10$QM/KL5HtJlak2rEfAiCtLuScYgXbw62zFKeaBgwrG0e3bDQVW4t0i', 25, 1, '2026-08-12 09:59:44'),
(465, '252610042', 'RESTINA SITI MARIYAM', '$2y$10$6HshOlGgcPq4JIMisWU/uO3P7gM4g8wPI9K8/p6jJrTD0FYtdMUK2', 15, 1, '2026-08-12 09:59:44'),
(466, '252610043', 'RIKA AMELIA JAELANI', '$2y$10$T02IKh34zoNMldZzWxXWOOSK8xHZq.J8IUWknbJbi6rtxwmNr6qYC', 16, 1, '2026-08-12 09:59:44'),
(467, '252610044', 'SENDY ANDYKA PURNAMA', '$2y$10$gf29EaWJytxaVFMTCh9jT.Amsp/6H7fWf9LooPIOgErtZAG932ggC', 21, 1, '2026-08-12 09:59:44'),
(468, '252610045', 'SHOPIA KHAIRUNISA', '$2y$10$D3Eg/3JPrWdhezyJE3OOt.kdZ1C48GJsO2OKZp4SJ7wnGoS9.xWfK', 23, 1, '2026-08-12 09:59:44'),
(469, '252610046', 'SILFA SULIASTI NURUL HIJJAH', '$2y$10$F82GES75SN8Q/x9o8ZhOFOG2ltdvgTKVfRwPAzo1T8c4N27VWbxme', 23, 1, '2026-08-12 09:59:44'),
(470, '252610047', 'SYAFA FITRIANI', '$2y$10$fNoiwZOTqqyiGjOTXNcDrObi70pdT7fIKIjlfdLCqAaTTs02GMVXC', 22, 1, '2026-08-12 09:59:44'),
(471, '252610048', 'ULFI FAUZIAH AZKIAH', '$2y$10$sS2/d1GxiIA8hLl3gM/2Te3tdR20KsOytSrEa/TSAk8BKNxuqx/si', 15, 1, '2026-08-12 09:59:44'),
(472, '252610049', 'AGHNIYA NURUL AENI', '$2y$10$HqTZL.McSJWWYmF/MPEGYea1QdInmWYJ09o23RVU4BpNMPXQD62VC', 25, 1, '2026-08-12 09:59:44'),
(473, '252610050', 'ALIF KHOLIFAH KHOIRUN NISA', '$2y$10$ao9GbIrE8QFQ5V10/LQ/FOPk72xJzV1CSMnvVcQK3IrE.ovKDRFc6', 16, 1, '2026-08-12 09:59:44'),
(474, '252610051', 'ANUGRAH ROLAS MARTUA MANALU', '$2y$10$ifZcGslLbnw7kIp3cKCEiekvO6o76eWABi7MJijR12H4XKENTAzii', 18, 1, '2026-08-12 09:59:44'),
(475, '252610052', 'ARGA DEVRIKA HUSAENI', '$2y$10$DLjEhbNxJAhQSyrL9J0okO60uhjEVhIE7/3FeZrmy1cvmO1Gih/r6', 22, 1, '2026-08-12 09:59:44'),
(476, '252610053', 'ASHILA MARSA AULIA', '$2y$10$KXX4gNIvMvYO81IGdujkLeYe5IoYFHtB.iczXFH9R1i3lB/AbMFIK', 21, 1, '2026-08-12 09:59:44'),
(477, '252610054', 'AYESSHA PUTRI RINALDI', '$2y$10$6DQoiLRiUGIhUvZZMkONEu9SZcRLP/xwMu0j1ZE0ODScQy8N9A5Uu', 20, 1, '2026-08-12 09:59:44'),
(478, '252610055', 'BELLA ANASTASYA HENDRYANI', '$2y$10$GLn2hwksB6gHk4FRuUzLeOo5rbuWCgepM9uKNqymzRiDzq1LvtmyS', 18, 1, '2026-08-12 09:59:44'),
(479, '252610056', 'BERLI', '$2y$10$IxCGSt1tMAxgxrTl02bM6.h/hnZgR0s55PiEGJBXvuV7DjkQb0Qj6', 21, 1, '2026-08-12 09:59:44'),
(480, '252610057', 'CUT KEYLA KITAMI', '$2y$10$nZ2AFCLTbeR5X.nUBU3/.e3rDjiP/LCORNPN/1fJosYG2wFZp3K26', 25, 1, '2026-08-12 09:59:44'),
(481, '252610058', 'DAVINA ARDIA ANASTASYA PUTRI', '$2y$10$rKdIJfBE737NGsKq20qTZuaED2813vja/gd7kbEVa/NrbupfmJ2Ii', 18, 1, '2026-08-12 09:59:44'),
(482, '252610059', 'DEA SEPTIANI', '$2y$10$m1ILodK5xFaXkgNE8t0dCOr8S3bNllrsZwZAsGR9V7kWpMO5tE2LK', 22, 1, '2026-08-12 09:59:44'),
(483, '252610060', 'DEVIN RIZKY SETIYO PRANOTO', '$2y$10$/pJinuAu6PXEkohRHLt21.bO5Bi.e1UyizKS5TTQyOQGbWsBtBVFW', 26, 1, '2026-08-12 09:59:44'),
(484, '252610061', 'FADIL FADILAH', '$2y$10$AxTgQvQCL9M87WtionihXeFXguw11LLoqynRmuQ/TaKcxipVMXiMu', 17, 1, '2026-08-12 09:59:44'),
(485, '252610062', 'FRISCA CECILIA', '$2y$10$LAPQlQFkSTIpcS4LceSvx.oDQhRfQsz0ROmla2WrSLy741DFPDfO.', 19, 1, '2026-08-12 09:59:44'),
(486, '252610063', 'GABRIELA FUNNY TAMBUNAN', '$2y$10$BbeYqq5DgYk1DevElS7bqOeVuLnWXvyBZ8vC6VFpDNz4NIBl.cXA2', 20, 1, '2026-08-12 09:59:44'),
(487, '252610064', 'GIO RAY ANDHIKA ANWAR', '$2y$10$mKyTZ0xwhRA25NZq0kzHq.mzG1X5..dkA9kWf5iep/pUbmq9Bm1BS', 17, 1, '2026-08-12 09:59:44'),
(488, '252610065', 'HABIB RISKI AL BHANI', '$2y$10$T5TheGQTmzuU6LwGd.ZdjenHPo4S0HZdWvap3RwizxH9BQVsbKg46', 23, 1, '2026-08-12 09:59:44'),
(489, '252610066', 'IKHSAN NUR SALEH', '$2y$10$aN7uzOlkEhpeoy7X8QD8J.iIRMlVOwt3WbtpAOa6dSKBMMRihT2NO', 26, 1, '2026-08-12 09:59:44'),
(490, '252610067', 'IKRAM GIBRAN DZIAULHAQ', '$2y$10$Ti92gl0Z.jGHe7YY9fEXuuN.0MdEXE2qqliGq1hB1s.OQoC0Fw3na', 23, 1, '2026-08-12 09:59:44'),
(491, '252610068', 'IREN SYAFITRI', '$2y$10$crAdjOFJ1NdDkSaSF9EiPurZ2nRb.GEKDjcJrm6BnKSQUhT1u3mXS', 18, 1, '2026-08-12 09:59:44'),
(492, '252610069', 'LAILA FITRIA', '$2y$10$bVfCAQ44JXLqHuUuWrz0We5C8Ctp8YLopOTjziKXTCWxp3y.kB7IG', 22, 1, '2026-08-12 09:59:44'),
(493, '252610070', 'MEIKAL PUTRA BANI PERDANA', '$2y$10$lBERf0KfG4q7R5qXE4smM.T3EE8ckXtd53bEIBE.GCIantIfS1L92', 25, 1, '2026-08-12 09:59:44'),
(494, '252610071', 'MOHAMAD ARIF NURROHMAN', '$2y$10$GpVjPcZ9MqqOSVMw/d8HGOOLiFwd1za1nlHAcVmnhhny5RH49fjCO', 15, 1, '2026-08-12 09:59:44'),
(495, '252610072', 'MUHAMMAD DHAFIN AR RAZI', '$2y$10$zDg0TP8XdQJjfY/dCQdsdeOVJbBJXBh5mmiPhxi0jQWgr1E4EqPGm', 18, 1, '2026-08-12 09:59:44'),
(496, '252610073', 'MUHAMMAD RAIHAN', '$2y$10$/ZEkB30mQFoqtJNcTv5U0er.iIgA4CeuUfHBP9FOcYhdsrX4rsYD2', 26, 1, '2026-08-12 09:59:44'),
(497, '252610074', 'MUHAMMAD REZA ABDILLAH', '$2y$10$/8/TwMuSguAmh05F8WE9Y.4/IJe4K1gnL6WLktyUOH0MtO9R18Qme', 23, 1, '2026-08-12 09:59:44'),
(498, '252610075', 'NABILA MUFIDA WIBOWO', '$2y$10$a4cImBqGbaaW3bn5zrbC1uQfJhI5hAwi.IoFZDBl8XDykqbWHDyQa', 20, 1, '2026-08-12 09:59:44'),
(499, '252610076', 'NABILLA PUTRI RAHAYU', '$2y$10$GtuhXAzC/ilMejEwpZuEd.evDMpQixElPCVL7BvjMIBTjIuEeWgP2', 15, 1, '2026-08-12 09:59:44'),
(500, '252610077', 'NADIVA NURUL ASYIFA', '$2y$10$hpN/gqw3z1hWMmY8HV2pR.cH/7.UvdvxJYTkCCLIK/APAJUBZYKim', 16, 1, '2026-08-12 09:59:44'),
(501, '252610078', 'NAFA HANIFAH FEBRIANI', '$2y$10$DN2m3Tsxk1PJUZM1bOgWJufwJiN1KHJIY1pHYBcqbZ/c4eiZrRWNK', 17, 1, '2026-08-12 09:59:44'),
(502, '252610079', 'NANDA SHAFA KIRANA', '$2y$10$LhUkGKstsLNSJN8Bhoi6XOHaB5PCXKQxnqFKxD.1haGUs7SmisTvG', 24, 1, '2026-08-12 09:59:44'),
(503, '252610081', 'NUR FADILLAH', '$2y$10$GBoVNYOGVrEr3SOVHmN6suK7oPpV3rZhnMwPpUDjSOnoIL1RabG3u', 26, 1, '2026-08-12 09:59:44'),
(504, '252610082', 'NURRAKHMANITA AZZAHRA', '$2y$10$eB3q05qAWqt/NcWrgSvkQefXNNGy.v7NS9WorSpLIvCWo8tceGNpu', 15, 1, '2026-08-12 09:59:44'),
(505, '252610083', 'QEANO OKTAVIA SWARANANDA', '$2y$10$db6S6cx2BxrdnAuri3YTNerMQVdwewbKH5xke0biQFShFZ8rdIZHi', 17, 1, '2026-08-12 09:59:44'),
(506, '252610084', 'QIARA PUTRI AZURA', '$2y$10$CSQGIEQZ0K1MIJtgg3EbP.Fu3rnN5CVEfzjR0I5hc2ecMJ39Lpu8i', 19, 1, '2026-08-12 09:59:44'),
(507, '252610085', 'RAFLI ABDUL MAULANA', '$2y$10$Q71.wigb5OdlahBojklSZels1ix.z8Uo12lEhSxtJamvmj5dUQ/uC', 24, 1, '2026-08-12 09:59:44'),
(508, '252610086', 'RANGGA DWI KURNIYANTO', '$2y$10$jgq.uU8uj2ew1ZWV8cfHz.OplzxmWnsu/UefBgCzo14JdmWOgNU7u', 25, 1, '2026-08-12 09:59:44'),
(509, '252610087', 'REIYA AZREL KUNKEYRA', '$2y$10$YX7Ui79NphvVP0j/gKqGMuJ.y2uTaQNWEjhPBlR7xl/io64s46xHm', 21, 1, '2026-08-12 09:59:44'),
(510, '252610088', 'REVINA FEBRIANTI', '$2y$10$DkuISE/Rd1z7W6Sd/no8AO5CBxln7xwva4ctWY9QeXw6FKt72qy32', 21, 1, '2026-08-12 09:59:44'),
(511, '252610089', 'REYSA NUR\'AENI', '$2y$10$OjyBDX.N0nZklz2Sr5mMwe7wV6lyIKGtqSHeeMdqW9wFv7Mt.I3vS', 24, 1, '2026-08-12 09:59:44'),
(512, '252610090', 'RICKY FIRMAN HERDIANSYAH', '$2y$10$RmPZZQpTD2e5XKQQdzaUiuYVzRD2j90uGh8I9YWSo9WOs1oZxnUr2', 26, 1, '2026-08-12 09:59:44'),
(513, '252610091', 'RINDU ZIDNI ZAKIA', '$2y$10$2o8E2eWexbSTjxG1NRqJv.hScNehjRC9uyTGo/0ZNEIwwccQcPNgO', 22, 1, '2026-08-12 09:59:44'),
(514, '252610092', 'SAEFUDYN MUHAMMAD AF GHANY', '$2y$10$imfB3u4W6MEmYHrP6pPoCOa6nUdVDRLB7Wf2Wr373lKFZ3rc8zLUK', 19, 1, '2026-08-12 09:59:44'),
(515, '252610093', 'SHANDY AWALUDIN', '$2y$10$HEt8wBiNrxduCRlBlGn...rroEJscwkV8yqk1djJTLQw9PZDvYUN6', 15, 1, '2026-08-12 09:59:44'),
(516, '252610094', 'SINTIA NURAINI', '$2y$10$Ey7WyjhoqxgvQyWYbqM4zO9FI1HTlchG3UVhWgJEAPTWk/hUeLbfG', 20, 1, '2026-08-12 09:59:44'),
(517, '252610095', 'SITI MAEMUNAH RAHMADANI', '$2y$10$4TBLa/w80iFEn95LRW9g9uk8Kr3NNm21xnQlwgyPlbZGh3dHCzakq', 16, 1, '2026-08-12 09:59:44'),
(518, '252610096', 'SYAHRINY OKTAVIANI RAHAYU', '$2y$10$dZupjb9GqaWTWxPNaA4PoeKBTIYeuETn83CGnP40Kk7gVGlLv5Vzq', 19, 1, '2026-08-12 09:59:44'),
(519, '252610097', 'ADAM RIDHO NUR AKBAR', '$2y$10$aBkzpkvzzuWuP5UxElg9B.RHblbjTbNcJL9v1nnAoW8n4ZP1Liv1m', 15, 1, '2026-08-12 09:59:44'),
(520, '252610098', 'ALIIFAH NURSASMITA', '$2y$10$8SjVUOxt4bf0Zmx4XbD0zOCYH1N/IxwI.j8RUprmAbvXwbR7SRt9.', 17, 1, '2026-08-12 09:59:44'),
(521, '252610099', 'ALISHA NATHA MARSELA', '$2y$10$6GLiKK9smS/gf3ND5k7Mg.LwjD2H/r2uZ12UG6hcaLTAWIJENhy.m', 19, 1, '2026-08-12 09:59:44'),
(522, '252610100', 'ARKAN KHAIRY RAHMAN', '$2y$10$dBWzPdRsZC4jh8QwCJaKQ.h2rrJlUo0ezwKIDvYs.x1uymqTwpmh.', 16, 1, '2026-08-12 09:59:44'),
(523, '252610101', 'AYU ARIYANTI', '$2y$10$4QM/8tJdrLz3Qka9y3U1i.MSRcwTEPn7TsK3qyxhz9ffUMKCH/Kna', 25, 1, '2026-08-12 09:59:44'),
(524, '252610102', 'CAHAYA SRI MAHADEWI', '$2y$10$B3Yh.EerK0hU3xzY0FHBjuY9Wc7zXoB8jtAKpgb/DJtjzUIAKMCJq', 20, 1, '2026-08-12 09:59:44'),
(525, '252610103', 'CALVIN NAIBAHO', '$2y$10$QF7epoLn/yvmePCZEGTGv.GBR0ketsNV0sqWw/pJDeapUM8n.X0ee', 25, 1, '2026-08-12 09:59:44'),
(526, '252610104', 'CANDRA SANI ANANDA', '$2y$10$ulWHdx71PO/pJOSy3hOFL.74JqkFXtgbcWATeYNyJbVyJdhNuJEHa', 15, 1, '2026-08-12 09:59:44'),
(527, '252610105', 'DAANISH SHAZIYA DESTRIAR RAHMAT', '$2y$10$MpN32QBLUPqGrUBPeGlab.gOrw7p3kHBhZLSIj5jj.l8cMafOLZuK', 17, 1, '2026-08-12 09:59:44'),
(528, '252610106', 'DARA ELVARIA ZULIA', '$2y$10$eyidz1YreLgPdgy/NgfiFufSdafant0on6/AD4/jGWM5aaEVoFM7y', 24, 1, '2026-08-12 09:59:44'),
(529, '252610108', 'DEVIA ANATASYA', '$2y$10$HNZuP0DdSIJqyvjftkGdY.2xsM3BQI4keqzlKWpyzlD9MosBncm6i', 19, 1, '2026-08-12 09:59:44'),
(530, '252610109', 'DHAFIN RAZAQA PUTRA', '$2y$10$gFEgVvrsyfsD6BRMingMLueyGScc8LvCLhspPH3uZ0BLAFQKSZkyy', 22, 1, '2026-08-12 09:59:44'),
(531, '252610110', 'FIDELA DIDRIKA NARESWARI', '$2y$10$BosbmonjYpLUvKRln2ndQ./S2iM9aQeHHT./OsR1msEHFW8ZrlbpC', 20, 1, '2026-08-12 09:59:44'),
(532, '252610111', 'GHIANDA CETTA DESTRIANTI', '$2y$10$3yb66bT7siKMEZCo4QrQHudOFrEyAi358a15H8zrf5vDuM3HkEZYe', 25, 1, '2026-08-12 09:59:44'),
(533, '252610112', 'GRACE RACHEL', '$2y$10$eQmUBTQbNE6w3PlRRKCRUeHCRwBqPhuqdb/dJxqS9cn9BEeI8mxRS', 19, 1, '2026-08-12 09:59:44'),
(534, '252610113', 'HARTA AL KINDI', '$2y$10$mNzNhD0fAySZ6nkDnLyB/.MpIsVmAQSjs/xz1bF8oRwziKcfUSoKy', 19, 1, '2026-08-12 09:59:44'),
(535, '252610114', 'HELGA DESNATALIA ZEGA', '$2y$10$3vUjOJ0h4wv8uBWyfSDq.eka1qHvkF7XvpH4QDcbKYM/6qXIXKgB6', 21, 1, '2026-08-12 09:59:44'),
(536, '252610115', 'ISAIAH KENNETH ONGGELENG', '$2y$10$cZzSCgQzVykS2DlF0KoVzOAYKShwvul.GStqX9dHizvNX3tmONanm', 16, 1, '2026-08-12 09:59:44'),
(537, '252610116', 'KAMELIA ARBA INARUS', '$2y$10$kaytx2qGWiB.7Bcpcnr3NuZif60V4HKmfwm.N3CTRh3xaUhouX/mi', 23, 1, '2026-08-12 09:59:44'),
(538, '252610117', 'KEYLA PUTRI APRILIA', '$2y$10$IUWpN4CuRKrZ7y8vH07YLe1AI6r1c3sBPyEYoLEwHaFr1C0X8K7Ai', 22, 1, '2026-08-12 09:59:44'),
(539, '252610118', 'LAYLA NUR ANNISAH', '$2y$10$AykJMscu3TLnTVCCHPgjm.s3yQLPQhV0KaHT4d05RHKPT2xPo1nHe', 16, 1, '2026-08-12 09:59:44'),
(540, '252610119', 'MOCHAMAD IRWAN BEARLIANA', '$2y$10$OFoiAm3cuyICuJPjYwqI2uPvnGE4OjprMyGt0kdiMqjiI1LobxqMu', 21, 1, '2026-08-12 09:59:44'),
(541, '252610120', 'MUHAMAD BAGAS JULIAN FAHREZI', '$2y$10$KH9q0y3juZKSp7d0k1ft7uw98.IkgoiZaiHdBdNboTUs2InylwtG.', 17, 1, '2026-08-12 09:59:44'),
(542, '252610121', 'MUHAMMAD LEVIDHYA KERTYA PRATAMA', '$2y$10$evOiS8lw7S1mf6ags6X/9emd/GyJbFffiLwgWazgEZIveeAyInFxa', 26, 1, '2026-08-12 09:59:44'),
(543, '252610122', 'MUHAMMAD NUR GHANI', '$2y$10$j5z1h39unZt/p6fZ8y1cLOBhvjGrlT/pOSpFUZEh42bf8/1HGdsNS', 24, 1, '2026-08-12 09:59:44'),
(544, '252610123', 'MUHAMMAD REZKY SAID PUTRA RAMADHAN', '$2y$10$TTzbcnTy3Ep0VOK/KegjweJdrK.hlBO0BP96WNPXSMMX1S2hK35AG', 20, 1, '2026-08-12 09:59:44'),
(545, '252610124', 'MUTIARA RAHMADEWI', '$2y$10$sFdw.9MzAkTgJeXssSvqfecWqsIs1kqDHF5LCndNBuQ8mfHZ8Za1i', 22, 1, '2026-08-12 09:59:44'),
(546, '252610125', 'NAFISAH NAILAL HUSNA', '$2y$10$7xt64JvdnR/3nJP/hdSBc.U2m5LsczrFeuuZQvcN.qznJqH3/3tWe', 23, 1, '2026-08-12 09:59:44'),
(547, '252610126', 'NAILA IKRIMATUN NISA', '$2y$10$xKnhruZeZy7Yoi7Vyew3au2s6xgxv9dn93DDHaPGQe5FUG3WpFYYy', 24, 1, '2026-08-12 09:59:44'),
(548, '252610127', 'NATASYA AMELIA PUTRI', '$2y$10$jua55Blop6nYc4ToA8l.Au4pwhcNGzfrz.cD4YgqOm26VgUctq3BS', 23, 1, '2026-08-12 09:59:44'),
(549, '252610128', 'NAZWA NUR AMELIA', '$2y$10$q7tdZWSNoIzz7OXHCXSV6O0SmClEByS.qIVIVwC3f76qZrH92ys62', 26, 1, '2026-08-12 09:59:44'),
(550, '252610129', 'PUTRA PERMANA SIDIK', '$2y$10$VrgmxO8OMuhQL6fnhzVeIO80zTQrEkZNn.ZGSmdPDA7tEhI1Ssmou', 23, 1, '2026-08-12 09:59:44'),
(551, '252610130', 'QONITA NAILA HAZNA', '$2y$10$MW5W/EkstSAa1Yqkv.fHLOXUM3LYYqZc8YzxsKVBmtsWFmeQ4j212', 20, 1, '2026-08-12 09:59:44'),
(552, '252610131', 'RAAFI DWI PRADIPTA', '$2y$10$3pABniIXbMZsiv.ukZVcruW0bosaJ7iY7cEbYnwBi2hb43QNB41su', 18, 1, '2026-08-12 09:59:44'),
(553, '252610132', 'RASYA PRIATNA PUTRA', '$2y$10$G5BBcKJF5EBSBHSa3EwKMO6i/mZnm4YJONSb7hIL4PJnPB9mAs9ZS', 26, 1, '2026-08-12 09:59:44'),
(554, '252610133', 'REYHAN FAJAR JUNIAN', '$2y$10$ZyFRDqC3kea64cTvjtA.buBeRf2wuLWmgKevpFH78eSoIxaaWZtfy', 25, 1, '2026-08-12 09:59:44'),
(555, '252610134', 'REZQI NURASSYIFA RAMADHANI', '$2y$10$I9wNe49GyxelCQRSq/.g..9MQEzk5NVWMNNX19rH3qhT8CM6Yozva', 22, 1, '2026-08-12 09:59:44'),
(556, '252610135', 'RIFKI RADITYA', '$2y$10$KFG1tfUPg/PB/VtYub6EROLVR5oQtoMyfU6pYvnqNSGmAvtmXZk3a', 24, 1, '2026-08-12 09:59:44'),
(557, '252610136', 'RISKI JULIANSYAH', '$2y$10$FGSytiygSXq/GDpaLmXM0OTw9SBMFUVBxjwr21L2U9J2te8yxulqy', 18, 1, '2026-08-12 09:59:44'),
(558, '252610137', 'RISMA ANZANI FITRIANI', '$2y$10$VissEeDXVpNFrZXNCXrsn.p5i1/U/OzwcUkWRALdltAoRE90sS8hC', 23, 1, '2026-08-12 09:59:44'),
(559, '252610138', 'RIYANI RAHMADANI', '$2y$10$EoqNRApjnZetpgU71X5pAekSuQK4yAeNtRV4mEK2mdDrjueAfBYmS', 26, 1, '2026-08-12 09:59:44'),
(560, '252610139', 'SABRINA NOVANTI', '$2y$10$YtuO8v386OX79tvHmKUsOeBnFmzLBAwOSf./BPmVy4Aj3x506FXk2', 18, 1, '2026-08-12 09:59:44'),
(561, '252610140', 'SISIL NOVITA HEMANINGSIH', '$2y$10$m4TS8N06hsUjmfRdKRbuY.ochexvXrWmGKzXFrvi3a4SUe3oE260W', 15, 1, '2026-08-12 09:59:44'),
(562, '252610141', 'SITI MARWAH SOLIHAH', '$2y$10$vsuUEG8l/XCUz0LtZzdPie8qNlWsviq2iGZ5B/Xgq21daQpk.hDl.', 17, 1, '2026-08-12 09:59:44'),
(563, '252610142', 'SYAHRIEL AL MULKHIANSYAH', '$2y$10$u5yTT6wNGp82xt84oV3M9.PjnUsrcZPCZFzj0.CgKKk8BTaXAGBU.', 21, 1, '2026-08-12 09:59:44'),
(564, '252610143', 'SYERA AURELIA AZAHRA AZKIYA KURNIAWAN', '$2y$10$AbfWWYxo8IuGEBZJi4cOqe9xj3AHXayJWGAkUQDuMiNTNDqd8Ehfe', 16, 1, '2026-08-12 09:59:44'),
(565, '252610144', 'WULAN AULIA', '$2y$10$h7gn/qVpeLgwMYcVrrUEEOSOursb9Bly8uJaIkAnPEZg.rA0Kp1Uy', 15, 1, '2026-08-12 09:59:44'),
(566, '252610145', 'AGNIS REZKYA PUTRI', '$2y$10$pq50ycsshp2qCnRJ9.y1tOrHjgBStANg1ac71DTUT.VoE5uax.s2u', 25, 1, '2026-08-12 09:59:44'),
(567, '252610146', 'AHMAD FADIL', '$2y$10$hzYr/D3eBmgcunvu2muFyOMd68vJWH8i5TwODztelgaHzQL1JSInG', 19, 1, '2026-08-12 09:59:44'),
(568, '252610147', 'ALISHA NAVIZA WIDTIA ARDHANI', '$2y$10$Se50wML./YkIkLvpf7dWTOEvVsNFSvS6f6My0LJcqoaauHgw8wvMq', 20, 1, '2026-08-12 09:59:44'),
(569, '252610148', 'ALIYA RIZKI', '$2y$10$/TIVcfEhFX1NbZnIgKVa...kukgAh7Vs2YWSnC823GD4k5C.ExN9u', 26, 1, '2026-08-12 09:59:44'),
(570, '252610149', 'ARSYIL DWI RAMADHAN', '$2y$10$I8bjiAx0aNLrM1vSOCHlleBaai2XapyY.h0Y14hC.YwTPoJ4B498m', 20, 1, '2026-08-12 09:59:44'),
(571, '252610150', 'AYU FARIDA LESTARI', '$2y$10$0NDK6aNlmmJh0Zgy7uDGAuDbhw.4vyvjzsFQo62584dL9jtGAgKqq', 16, 1, '2026-08-12 09:59:44'),
(572, '252610151', 'CALLYSTA NADEEN PALACITA', '$2y$10$woxf6DRKQRonc50t2mTNXefoCEAMPzRTeR4sQuW8RUQB0qEbnxzgi', 16, 1, '2026-08-12 09:59:44'),
(573, '252610152', 'CHRISTIAN HOT TUA MANIK', '$2y$10$TAx34K4KvyhKvWfC8/k2KufSiIS/f6k0WVLNv1ktAaN4xPRWcICRO', 22, 1, '2026-08-12 09:59:44'),
(574, '252610153', 'DAFFA NAZAR PRATAMA', '$2y$10$jQ.4NzJjxkfqtS/13jo0O.mytWgAVcJDwdad.tjsbFe1s7KP3QET6', 22, 1, '2026-08-12 09:59:44'),
(575, '252610154', 'DANISH ARKAN MULYAWAN', '$2y$10$v83wFlbcoeX.CeInkavKcOYd52Kd6Rz5Y1nI5uRIB.s4c6xx017la', 23, 1, '2026-08-12 09:59:44'),
(576, '252610155', 'DESTINA DWI AZHARANI', '$2y$10$DWofLo2bPVaBv34Uj.hAt./cc5hfhjCoMNaVTuWl5llGo3o79rC9C', 19, 1, '2026-08-12 09:59:44'),
(577, '252610156', 'DEVIA NUR HANDAYANI', '$2y$10$TqHwUhrOJL51oJ1ulJBCR.97kBbsuoqs/5QRm0yg5il/2eVxd1Dxi', 26, 1, '2026-08-12 09:59:44'),
(578, '252610157', 'DHIKA PRADITA', '$2y$10$Jl9DXflcccJclf5O.wnwFuy79RkTQLZsjbspmvnF8UG2Vg9d9e.eG', 16, 1, '2026-08-12 09:59:44'),
(579, '252610158', 'HILMAN ARDIANSYAH UTAMA', '$2y$10$9n2W4zxro6.GedWUuWeLUuMts1/93M5B4SGyuy6adLE.snhEUxX7a', 24, 1, '2026-08-12 09:59:44'),
(580, '252610159', 'ILMAIRA AULIA', '$2y$10$7tCjyJDbHCIy.2SAi4NrbeusRGovBrP.cOmiELUol/TsELy6px5xy', 21, 1, '2026-08-12 09:59:44'),
(581, '252610160', 'ILMIRA NURIL HAFSHAH', '$2y$10$vXVGPn/KOGLzVxYG59xcfu/92.GQ31Dy5X2.W/PybAICe4t/XI4jm', 23, 1, '2026-08-12 09:59:44'),
(582, '252610161', 'IMAM HERDIANA', '$2y$10$IpMAUfiemcir8sye00DcSOyhHJ54jl2tUgnKiMZmipgycIUPzWCa6', 24, 1, '2026-08-12 09:59:44'),
(583, '252610162', 'IRGI ADITYA PRATAMA RAMADHAN', '$2y$10$Iuszy6m.J09esKxOhah/AeiSFEi/nm97SnQNgi37NfItxQifnHYYS', 19, 1, '2026-08-12 09:59:44'),
(584, '252610163', 'IZKARIEMA AQEELA HASNA', '$2y$10$kIJsTRw5oOZKxmu/tI2oCOCheKyBhOSFwivtJGbLg52pJ5.RZk0qS', 15, 1, '2026-08-12 09:59:44'),
(585, '252610164', 'JERIKO HENDANA', '$2y$10$OLVj57J3SRMtJtolb2IdV.7oCtIKqxCY1SxUrG/DV/i.BmfSB5cC.', 21, 1, '2026-08-12 09:59:44'),
(586, '252610165', 'KAREN', '$2y$10$rHliXdYq4LoKz3/.koG9V.Xe3YB3tZxRuYxA06AFVVvLnH7KvNSEy', 22, 1, '2026-08-12 09:59:44'),
(587, '252610166', 'KEYSHA PUTRI OCTHAVIANI', '$2y$10$TfnHVTRYQqLMmHH8pS9oCeQ6fPeDkxCwN0Ryg/iwz619vWOmIxpe6', 17, 1, '2026-08-12 09:59:44'),
(588, '252610167', 'LIANY NURSYIFA', '$2y$10$UUT1jksg99rvMtyWf2xuAeOiUWWm2/ov5JI2h6e8RTd7I8KOICRYm', 16, 1, '2026-08-12 09:59:44'),
(589, '252610168', 'MOCHAMAD JABAR ALFARIZI', '$2y$10$yW2poaGQXqPxMEFlF50U/.PFuNgRrqXItgJoktscNuvwscTuuIf9y', 18, 1, '2026-08-12 09:59:44'),
(590, '252610169', 'MOUZA PAULIN METTANURI', '$2y$10$CwwgLxMG1gLkQG9ccAzL.O9BcjjauUKi/vSUfmtn03qVafAdOLTJm', 24, 1, '2026-08-12 09:59:44'),
(591, '252610170', 'MUHAMAD DAFFA AL HABSYI', '$2y$10$mqNsnjDmgaI6zTvbiKIqaOlPgPCY7f6wmWzP3UQ9hMBnVJ6mgjnC2', 15, 1, '2026-08-12 09:59:44'),
(592, '252610171', 'MUHAMMAD NUR IQBAL', '$2y$10$CytisnNCvnws5X/bPYzMVutM0BTf6vXm5.qXjnfdnlzwbtGDZuNtm', 22, 1, '2026-08-12 09:59:44'),
(593, '252610172', 'MUHAMMAD SOFYAN', '$2y$10$S6wffQg2UJgHNq95fDEpAubBE2qVArAuNBBSY6G6aJ2PEbFf67rva', 20, 1, '2026-08-12 09:59:44'),
(594, '252610173', 'NAIIFAH NUR UMAIMAH', '$2y$10$/bA8jJM7d0cYaaXok/2z.OGdm1aJoNr2rEmA.SPV.6WSxEbzx6xsS', 16, 1, '2026-08-12 09:59:44'),
(595, '252610174', 'NAJWA FITRI SOLEHAH', '$2y$10$Nki/7RPS/vPgb6KFimlp9.gJ3Udh2BAeIwPzDiBRH88GVCL1HoRs.', 21, 1, '2026-08-12 09:59:44'),
(596, '252610175', 'NARA PONGBALA LAKKA', '$2y$10$HqPKDm1Vu23UhM9JJ4hCC.2z8oPHG/R90el3ECKyLjmYvMYsJQSKq', 25, 1, '2026-08-12 09:59:44'),
(597, '252610176', 'NAYRA SHAFANIA NADHIFA', '$2y$10$dCim1EGkBG2AvPcDejjzUeD3QLCz2PbFPsSZSNA61vYAnTDwis1ym', 21, 1, '2026-08-12 09:59:44'),
(598, '252610177', 'NAZWA PUTRI DIANKA', '$2y$10$G/sF/y2DDfJLICmxAR9x4eWdvcxxSfoO3DdefsHbL0/NDqr3c8yQy', 15, 1, '2026-08-12 09:59:44'),
(599, '252610178', 'NEVAN HIRZAN ARADEA', '$2y$10$YWvJ.W7Qn7D95j5iNRzI/OhNXiwOfMleZ2tR0Gcej0TlnVWCEHuZO', 17, 1, '2026-08-12 09:59:44'),
(600, '252610179', 'NUR AISYAH', '$2y$10$URFZ8tBXYkdHmsT1JOho7.W9FASK/0wi7k2PWmCZOG.UJz0f4e8ZO', 21, 1, '2026-08-12 09:59:44'),
(601, '252610180', 'QUINNE ARADEA SANTOSO', '$2y$10$FG6.VLHhyrxRdQ1BplKY4OQwsSY12aQ.WCWigpAWHTbE5b6CFw.fa', 17, 1, '2026-08-12 09:59:44'),
(602, '252610181', 'RADITHYA JAVAS DWIKUSUMA', '$2y$10$EXs3XyaXz7.SLtKX4/sjVuBafBJwkmYt5WroE7U8hcQduiSr7/4jO', 24, 1, '2026-08-12 09:59:44'),
(603, '252610182', 'RESHA RISKI NUR FADLI', '$2y$10$YRGjeLxafRnc5Ty.lGWPwu0nWnxQVKZg219hbImjI5ZcW0l.g1UU.', 25, 1, '2026-08-12 09:59:44'),
(604, '252610183', 'RESTU JENHASBI ALZAENI', '$2y$10$CV0Dr49lhIi9VQwAVEaYx.hacUQ913h9E7XWLwUZYb/0ITlxX.tuW', 19, 1, '2026-08-12 09:59:44'),
(605, '252610184', 'REYHAN RIZQI ANUGRAH', '$2y$10$cBiOyUyhVq5zZYDfQh6LrOAsImflJH38w0eRRLp9zOSfDINaVgKZy', 24, 1, '2026-08-12 09:59:44'),
(606, '252610185', 'RIFAA RIHADATUL AISYA', '$2y$10$QIXxtKhdJpf9J2PUq/60/uQ.hNRIL9E4z7OVAzpW.5zop2wFVU6om', 18, 1, '2026-08-12 09:59:44'),
(607, '252610186', 'RISNI NURDIYANTI', '$2y$10$GE3jDot9.HS4OE0MlB/cDOxuKfsMVitQBJRw3m1rLP1xFvyaChHnK', 21, 1, '2026-08-12 09:59:44'),
(608, '252610187', 'RIZKA ALIYYA ZAHRA', '$2y$10$nGUvwsq3QGUJMBA3GU.p.OW7Aoha/YU/gmpEoymV4lHZn9Gmi.D4m', 26, 1, '2026-08-12 09:59:44'),
(609, '252610188', 'SALSA ARIYANTI DEWI', '$2y$10$fZS8.ObdvEkHVteu0mS9SOwNfVIWrdoikDq7s6WotyGs/MM9bKQ0m', 18, 1, '2026-08-12 09:59:44'),
(610, '252610189', 'SITI FATIMAH AZHAR', '$2y$10$KgfEKruFqw7LeLC3OGrNC.fqgbbxrAfVvOKs03kIuqncb.hm6TRaa', 17, 1, '2026-08-12 09:59:44'),
(611, '252610190', 'SYAFIRA ELVIANA ULVI', '$2y$10$uAiP6WqriMQMnphNKqciD.hNn2EvYgk/EoEzSeJsjXgwMqvgpiQ6y', 23, 1, '2026-08-12 09:59:44'),
(612, '252610191', 'TEGAR RAMADHAN', '$2y$10$KvpD79yQdph6Ev3s17Isyua1WpouMRjnb8Pk3aHeMUK4hItjazA3i', 24, 1, '2026-08-12 09:59:44'),
(613, '252610192', 'TIARA DWI NURKHASANAH', '$2y$10$0mSLDnS8V.gQNeEUWHvfZuNjbO0k25xG4BPCsvb15/xXlWQfCrJAi', 25, 1, '2026-08-12 09:59:44'),
(614, '252610193', 'ALFAREZ MEGANTARA', '$2y$10$qZ0oYHNE8CNdprhYI/Og7eL5SH8ddHg4Gnew3dnzztuiU1CgWjH.e', 18, 1, '2026-08-12 09:59:44'),
(615, '252610194', 'ALIYA SALSABILA RAMADHANI', '$2y$10$WQZbkemhqsaZxJgqu1Vd/eF/ESFMDsBcvDXRftMeBe/l9/VxwexrS', 26, 1, '2026-08-12 09:59:44'),
(616, '252610195', 'AMEERA FAATIN ARIFAH PRAMESWARI', '$2y$10$1egqwrW/v3j4MD7q/LkbjOEv8XeA.0VOjd1AgcSVb559YRRxnbLI.', 20, 1, '2026-08-12 09:59:44'),
(617, '252610196', 'AMELLIA DESTI ARDIANA', '$2y$10$eZk8nbeKJMH.rBgDguaZHu6PDdaTQP.Xtb0u8ig4W2IlQlrNohll6', 26, 1, '2026-08-12 09:59:44'),
(618, '252610197', 'ASLAM KHAIRUL ANAM', '$2y$10$QUOxoYgNAwec29hvRzDev.cYNraz1h2ydYfbxTFOTKg844KjGQhTq', 26, 1, '2026-08-12 09:59:44'),
(619, '252610198', 'AZZAHRA NUR AZIZZAH', '$2y$10$hw5jSURb.aPv0oOEf25saOJx71doXjfvurles8XRBgocyNq1YMXxK', 24, 1, '2026-08-12 09:59:44'),
(620, '252610199', 'CHIKA MEISYA PUTRI', '$2y$10$73OYfhxsMZSE0eVzONjXyeCHKS1RP4.7SSCc9A1hlztoMKaeu6nCC', 16, 1, '2026-08-12 09:59:44'),
(621, '252610200', 'DAFIN REFAN ALPIANSYAH', '$2y$10$QoIzIJLS17/Rxd9vf/2cBusdfYeYmpYIJod.iCMiTTlTJwjp2iFmm', 15, 1, '2026-08-12 09:59:44'),
(622, '252610201', 'DESTRIDA RAZAN HANIFAH', '$2y$10$WVRN2PNjwhj4Rv/pCOIm..Swn92DZ3Z8t3/Ms6K7dS/zv4.IpeZpO', 22, 1, '2026-08-12 09:59:44'),
(623, '252610202', 'DIAN INTAN FITRI ASTUTI', '$2y$10$C5/NHW6Q7p1mXQDKrHomhOaRpjndE2iFjbub50IUpYb2d2tZGmaNW', 24, 1, '2026-08-12 09:59:44'),
(624, '252610203', 'DINDA AJENG PRATIWI', '$2y$10$wIVl6znDIWOMOeRIuiRKlOM/xgt8N1HP6vasYLyclrGiDiQdAXrNS', 24, 1, '2026-08-12 09:59:44'),
(625, '252610204', 'DIVA JULIAN SOELAEMAN', '$2y$10$B5H9JQI39whc5zZRPWFXdOGDGEGshEO2ibw8GALiHB9zT8WTzjdx2', 19, 1, '2026-08-12 09:59:44'),
(626, '252610205', 'DWI APSHEL AL NURANSHAH', '$2y$10$iQyKK4iHOuew.tO1ddFtPeaWCBAlNFeonJrkDAzUx8ejWhsTWw9TC', 18, 1, '2026-08-12 09:59:44'),
(627, '252610206', 'FARREL HASAN MUZAKKI', '$2y$10$UxW3rr7ORM1.MoSfp6FDL.WIV8HSXh2OX2eoy6fpheglTLZXIsGxe', 15, 1, '2026-08-12 09:59:44'),
(628, '252610207', 'IBNU SALMAN ARRAYYHANIFA', '$2y$10$c3Q8FhSq0mU4o3A6sFWSPe291y.Wy8qNs3Fz0I2lGnIQm4GNUqUPe', 23, 1, '2026-08-12 09:59:44'),
(629, '252610208', 'INAS ADHADIYAH HANIFAH', '$2y$10$7jEqOwHF.k8eqJ.qsAWBqeRzVSWNdEewS9908XkYNDIfOlmj35BYy', 20, 1, '2026-08-12 09:59:44'),
(630, '252610209', 'INDRI DWI VERNANDA', '$2y$10$K2wEA8d/0PO4mXGKo3xrueH0/JNwoHEDICvtT/5TnD8MFdVeEmbGS', 19, 1, '2026-08-12 09:59:44'),
(631, '252610210', 'ISAL MAULANA', '$2y$10$nDJ51i4vNXycilEhCjJMkeceelL7IQtjq1U.kqpvpk2A.fW9CgUQq', 22, 1, '2026-08-12 09:59:44'),
(632, '252610211', 'KAISAR HAFIIZHAN ALMAN HAKIM SOPIAN', '$2y$10$00jFFHL5Mx6gTyeCohRnzuZpZXbhR./ul2lKc90Y5xrvQWMY94lZq', 25, 1, '2026-08-12 09:59:44'),
(633, '252610212', 'KEYLA ABIGEIL BILQIIS SOFIANA', '$2y$10$kiZ7AuOpxjmIgSdnyi7JquT3FsO7aKC.4PNRI.pwWC7MWimrT8P92', 15, 1, '2026-08-12 09:59:44'),
(634, '252610213', 'KIRANA AYU KURNIA', '$2y$10$DxUYwETWL7Eya2ijPVLWa.Xrq0ku0VjhQ4U1Luwi5mcBckG44IK1C', 26, 1, '2026-08-12 09:59:44'),
(635, '252610214', 'LOVELY PRISCILLA AUDREY', '$2y$10$JC9YK5nDCbY6YbVSL6HJUO6lFkPZREOOsaiudS/rcpDk8UUAX1zA6', 16, 1, '2026-08-12 09:59:44'),
(636, '252610215', 'MARSYA SEVYANA', '$2y$10$T.ZqVxcr6FrzB4c8ojZUQemy.qZ19b0ZARTHi3S83c.2BPeFprMdm', 23, 1, '2026-08-12 09:59:44'),
(637, '252610216', 'MUHAMAD ALWI', '$2y$10$F6B2BHmDibAO8DOKOcKZPO1TABAFx7BsFKZ6CHJFa6shTsxCsEhzu', 21, 1, '2026-08-12 09:59:44'),
(638, '252610217', 'MUHAMAD ILHAM', '$2y$10$YLKVYswJWUpLl9a8hjUMiOCTzwxVsxLksn31a5Uz55AxLv/CgGa3S', 17, 1, '2026-08-12 09:59:44'),
(639, '252610218', 'MUHAMMAD NURUL QOLBI', '$2y$10$IjOCCHvArQJAaQ2/S4m5Mej31LGeiSaiFih7tr0auwDvOfOpGkco6', 26, 1, '2026-08-12 09:59:44'),
(640, '252610219', 'MUHAMMAD SULTHAN ANWAR', '$2y$10$lP1oXbv5tGYuHVrKRlaVp.i6yDFeoP.qe1rlu2r/B36djIKJkDjAi', 21, 1, '2026-08-12 09:59:44'),
(641, '252610220', 'NABILA SEPTIANI', '$2y$10$kGdTdliEhACqh9dnsl0S9.qxblG2gvoIpq.KBp9fC05vU0gBd4XrW', 18, 1, '2026-08-12 09:59:44'),
(642, '252610221', 'NAILAH NUR SALSABILA ROCHSIDI', '$2y$10$yTsM2Ink4N4/D4P5EExI9ONIJ1clefXw9l4gZoRyiwirSm2I5gsES', 16, 1, '2026-08-12 09:59:44'),
(643, '252610222', 'NAURA ADELIA FRANATA', '$2y$10$YJ9chRPUWaOyBJ10rKUATONSn17kRQZxENIJB3RvYXmuYHzZy5p6y', 19, 1, '2026-08-12 09:59:44'),
(644, '252610223', 'NAYSILA YULIANTIKA HARYADI', '$2y$10$Ay1GXW2OC.U5FckoDET4yO9na9y.tC6IJSyYnBVzHiKWm23pvszxe', 25, 1, '2026-08-12 09:59:44'),
(645, '252610224', 'NENG RAYSYA AFRILIYANI', '$2y$10$kGq/oNoxFjQ/2s80YODdXOXmwW8w4swDqdvT6sy5W41jBuM8DpzPm', 22, 1, '2026-08-12 09:59:44'),
(646, '252610225', 'NICKY CHELSEA ASYERA KAUSE', '$2y$10$VbHLWUkHNENm70KEjbaYseNbJwuqV8UmNEzAt/s5N2DvAjjZC5glu', 17, 1, '2026-08-12 09:59:44'),
(647, '252610227', 'QUINSHA KAYLA AZZAHRA RAUDHATUL JANNAH', '$2y$10$wEpfacUShWeEpMJiw8H4AuXjIj78JNkNUoUfH6OgBCyH3CH7iqQLW', 15, 1, '2026-08-12 09:59:44'),
(648, '252610228', 'RADITYA AL KIANDRA', '$2y$10$iGx8ZCjguX/EtViP178r8ODYwiyUlEnRDjhjRvsOJV6xY0yQ4wfzm', 23, 1, '2026-08-12 09:59:44'),
(649, '252610230', 'REKSA ATHAR RIZQY', '$2y$10$HEAkh4EQUpHHnth1FUvl/u8F7o2Qn66QD8ECXA0Sy2F0pkCpN5MrG', 15, 1, '2026-08-12 09:59:44'),
(650, '252610231', 'REYNAYA MEGANTARA PUTRA', '$2y$10$d3GvOPCRHRfsgspPoXe49OSr5mEciKaKtWM1d8qhThcmwau.gFCva', 25, 1, '2026-08-12 09:59:44'),
(651, '252610232', 'REZKY FEBRIAN SANTOSO', '$2y$10$VpOfmbgSPHaDuvFbC1lkee6FCR2I500RAa8Ba6RP9HhUdcY/mty22', 23, 1, '2026-08-12 09:59:44'),
(652, '252610233', 'SAFA AYUDIA PUTRI SETIYAWAN', '$2y$10$Y9mzwE.xyY8vIbExOCm/T.LCPtFGkNf759OQVxldmrv7DeV4.dVRG', 23, 1, '2026-08-12 09:59:44'),
(653, '252610235', 'SALSA BILLA SOFFA', '$2y$10$CZ2NtkL1o8/sj3gDIdT2U.oQiT3l39KwYW2pP8Wk0eNEO84TybvcK', 25, 1, '2026-08-12 09:59:44'),
(654, '252610236', 'SELPI FITRIANI', '$2y$10$StI/GwCEIhiU6XOvyHqFM.JeYfGl/YD416GMPROTMqdkxMq.CXtQy', 20, 1, '2026-08-12 09:59:44'),
(655, '252610238', 'SYAIMAA ZUHRA HUMAIRA', '$2y$10$OYzQqtiqs7qysrs3YUH7.eY9TpoXg6pm1yR3LH2E46JNjp8/scoTW', 20, 1, '2026-08-12 09:59:44'),
(656, '252610239', 'ULKIYA AHSANI', '$2y$10$aVGFAiUBn3bqq/rwyLQTaOLMdqEDma2aq3eMXCAkRRzLgUKXUCts.', 22, 1, '2026-08-12 09:59:44'),
(657, '252610240', 'YOGA ILHAM PUTRA ARDIANSYAH', '$2y$10$/iisNUomaWyXFx1J8VUsRuElAmY.m0S6/DfJuZ41IpNqrYga.jYAm', 24, 1, '2026-08-12 09:59:44'),
(658, '252610241', 'ABYAZ SALIH HAQ', '$2y$10$xKYtd6hf4EudDaq.TmtOEOlrY49DGmJMVe4OZj1sPm3dIM8Blhpzu', 18, 1, '2026-08-12 09:59:44'),
(659, '252610242', 'AJI ANANDA HERMAWAN', '$2y$10$ck0sXT9XTJERsg18gVexW.FsxP2HGZSvLhuiWPzUB/e1r.///GVKS', 24, 1, '2026-08-12 09:59:44'),
(660, '252610243', 'ALI PRATAMA', '$2y$10$G8/ptWRgTLW6N0BkwJD/Juwy8/bxIBaJbOsSEffueZPmtHuleP5xK', 15, 1, '2026-08-12 09:59:44'),
(661, '252610244', 'ALISYA NURUL QOLBI', '$2y$10$nzCdr2BVDkJZSSYKy4kSyu1FgQ2joBU3zXrn2ly0WzBiFLD4EGC1.', 15, 1, '2026-08-12 09:59:44'),
(662, '252610245', 'ALYA AZIZAH SYAHHENDRI', '$2y$10$pzE642N1P.71nUU0RA1Wwu28yNeioQGTmueKvqJ9z7abNEHaZ2BqO', 20, 1, '2026-08-12 09:59:44'),
(663, '252610246', 'ANISA WANTI NURAINI', '$2y$10$KlC3hXez0QMtksumQjaoyeF3M.tDv6yEWWDj4WbqBAQW8V7tAdmla', 25, 1, '2026-08-12 09:59:44'),
(664, '252610247', 'BAGAS PUTRA ADWITYO', '$2y$10$sn7lCr69rj1kxXWkjPnEMOBDQVqNPHz9Cx/j6MdAumnPqYHM.DYe2', 17, 1, '2026-08-12 09:59:44'),
(665, '252610248', 'CALLISTA LUVENA ZANTIANO', '$2y$10$TMNh5MuplLm6rMdIdXa9POnl3j48.Dlj0nov0WAzRBfGASmFO4y5S', 24, 1, '2026-08-12 09:59:44'),
(666, '252610249', 'DALIILA AZKIA', '$2y$10$Qqfam87aeWrWUQGaA3/nEOnL.DoDlbI3sgj/yd7Tiag7hE0yFkRS2', 21, 1, '2026-08-12 09:59:44'),
(667, '252610250', 'DANIEL RIZKY RAMDANI', '$2y$10$k2DbSsjgv2OuOclv17OXyOU9XAwx2rFowOgiFCCm7ycmy115BAjk6', 19, 1, '2026-08-12 09:59:44'),
(668, '252610251', 'DHEA NISA AZIZAH', '$2y$10$ZqvDF5uI48sjrdZ12WdPb.8pKfIq7DWZQnLYnKukhbfGXvBd6xE5O', 21, 1, '2026-08-12 09:59:44'),
(669, '252610252', 'DINDA PUTRI NAZHWA', '$2y$10$BckRi4a.5WYhAxndO12Xnu87cEb9DDszEWd3diUY3GXpreBO748Zm', 16, 1, '2026-08-12 09:59:44'),
(670, '252610253', 'DUGI SATRIA SEBASTIAN', '$2y$10$H3CAZLYnL2aA9E6FEVQu1u7Bb5BmlaBMRRS2nErMDg7rorCROwIBe', 26, 1, '2026-08-12 09:59:44'),
(671, '252610254', 'DZAKY MOCHAMAD RAFA', '$2y$10$Cky6zxLBARcUJQkyOS0DdOFCmIkvGKLNOum.onM6BDnkKAibFBkKu', 26, 1, '2026-08-12 09:59:44'),
(672, '252610255', 'ELISA RAHMAWATI', '$2y$10$SEWsbMRyQ9v4TD/dszFsYO1fSzZ3LuUHqLo2Gtu3G3WkJEGYhPQHC', 19, 1, '2026-08-12 09:59:44'),
(673, '252610256', 'GALIH MUHAMAD ADDIEN', '$2y$10$6GfEDkLmTI7.nC5TwcRk0uprKPruRGj1cDOLoXJ8SfNhwoEcJmrfe', 19, 1, '2026-08-12 09:59:44'),
(674, '252610257', 'IBRAHIM ABDILLAH GHAELANI JAMALUDIN', '$2y$10$/r5q/ttnHpKjSIYYLZkUV.ZiWcBSOkA7zAp6J1Z0Dx5x6j0byg59S', 18, 1, '2026-08-12 09:59:44'),
(675, '252610258', 'INTAN CAHYA KAMILA', '$2y$10$SgAVKXQRGVLo3xfMBycsZescAPxaQfC5tu3UZxRHUPMJ/Xhb5kGpm', 24, 1, '2026-08-12 09:59:44'),
(676, '252610259', 'JIHAN LUTFIAH ZAHRA', '$2y$10$KtURCe1ohfywYbZs1n9CPerq6tXdNR8xRLpzM2GBYwz.1pF07sD7q', 20, 1, '2026-08-12 09:59:44'),
(677, '252610260', 'KEVIN CHRISTIAN', '$2y$10$ZB7tyezdmybvNa5I.G9l1..HcNt9zwgejoUy.TwwGHTh8BuZdsRdq', 22, 1, '2026-08-12 09:59:44'),
(678, '252610261', 'KHIRANIA SITI FATIMAH', '$2y$10$PDPx0yOaBp.ZiFEqlDVYbucWTlJ7s5k0t.bikdTUxzwuXJVz6cHHa', 25, 1, '2026-08-12 09:59:44'),
(679, '252610262', 'M PAISAL', '$2y$10$0U0l/08D8H65WJIPM2EZueaFsAe4tusYBifC6igmMw6N4P.xsvqOq', 19, 1, '2026-08-12 09:59:44'),
(680, '252610263', 'MAMLUATUL AZIZAH', '$2y$10$.Qm9HMe8w7DP.xGcM5aCPevmaMGn1VslaoQLDPvnP8n8sWHIvjkWy', 23, 1, '2026-08-12 09:59:44'),
(681, '252610264', 'MELANI NURHAFIZA', '$2y$10$4qYXZ.iP6rRmMrNh6MZGTuICaPdDb2xbcQn89VN8FN2KSVE/5cSpK', 16, 1, '2026-08-12 09:59:44'),
(682, '252610265', 'MUHAMAD ARIF AL AZMI', '$2y$10$OXTNtKFcZr8B/SbE3ZR1g.2rBTBOwXB/NNUDI4aYTwpveYBZ.4Uri', 25, 1, '2026-08-12 09:59:44'),
(683, '252610266', 'MUHAMMAD ALIF FIRDAUS', '$2y$10$EXPepdJ1XPku3n9as8zGDeT3RO4mKUGi.Zb6p44b2sOTs0zy3kXQG', 15, 1, '2026-08-12 09:59:44'),
(684, '252610267', 'MUHAMMAD RAFI FAIRUZ', '$2y$10$A9bS6MJuhOpKSiVNb2Mb1OTP8ANjUBTy9nvFTHug8IvErZGDBOvt6', 15, 1, '2026-08-12 09:59:44'),
(685, '252610269', 'NABILA PUTRI FAHRIANI', '$2y$10$VdIJDBNdscKT.S31RiEJe.xEPK.TEqKgDF21lP4jznw05xMHFoeDq', 17, 1, '2026-08-12 09:59:44'),
(686, '252610270', 'NAJWA HAURAA ANDAIRY', '$2y$10$oC5nREm7jss9zWjYR9Ph6OM38a6s8s46vM31nAeZqjfUqchov.lq2', 20, 1, '2026-08-12 09:59:44'),
(687, '252610271', 'NASYA PUTRI AL ZAHRA', '$2y$10$YwuQCfvB9b.brEackdYL7e54CHdq0wsaD444qNvqoO.4U9qfTN2aS', 26, 1, '2026-08-12 09:59:44'),
(688, '252610272', 'NESHA FIDELYA PUTRI', '$2y$10$3RuImnYFEVvwNDCqRbCZBODS0JOXgA/YuZAIHHC4/DdL1wA2W9aFC', 17, 1, '2026-08-12 09:59:44'),
(689, '252610273', 'NISSA NURHANIFAH', '$2y$10$LEPRSo3wSGBNwgmfB3K4deGoNle9bzkH4UmcIr..PTwxgMwoTyHIS', 16, 1, '2026-08-12 09:59:44'),
(690, '252610274', 'NUR ANISA', '$2y$10$w6mBHK0vocWpLZ4ok9INAO2/FMtatE0n3Z9jIAmNDaDS7U8.OIiuK', 26, 1, '2026-08-12 09:59:44'),
(691, '252610275', 'PUTRI JAHWA JAHIATUL MA\'WA', '$2y$10$Fk1b8B0wSVEyzcfR.d8dNe3Gnd4W0D9ZirkdUSbRBsgihOuxScy8m', 22, 1, '2026-08-12 09:59:44'),
(692, '252610276', 'RADITYA RACHMAYADI', '$2y$10$OpJfzo1O/ywKS.ZtMdr20OBTn0loLfk2cK0HAPoxOTyaubyWzdsDu', 18, 1, '2026-08-12 09:59:44'),
(693, '252610277', 'RAINA QUINSHA DIMYATI', '$2y$10$1AZgdfgtFP2PAf8/oaeDP.41hNQRRei.BDA8M.E9Lu/CE1P.cPSHm', 21, 1, '2026-08-12 09:59:44'),
(694, '252610278', 'RHIZKY AULIA NOPIANDI', '$2y$10$wJ62rKzp/vCfowsfxsqsJukY9tu3x/Rk5PeeK0mf3bUrcy1xHiVXS', 22, 1, '2026-08-12 09:59:44'),
(695, '252610279', 'RIFA NATASHA PADILAH', '$2y$10$3.s7r91yhlx5okCZvrAj3OQoAXDav.8Psefouooiws6Dv5qn1YPfu', 26, 1, '2026-08-12 09:59:44'),
(696, '252610280', 'SAHLA KHALINA INDRIS', '$2y$10$rOYHxa/q/yS24lYJuVVI/.v17YOgujIyHsc0/4wWcqcWcED3ebAee', 17, 1, '2026-08-12 09:59:44'),
(697, '252610281', 'SALSABILA RAISSA PUTRI RAFIFAH', '$2y$10$gWzmJy7P/uXc4z3/PJBNE.po5beV49Jixa.nro6FfDBLvsTb8jxLi', 17, 1, '2026-08-12 09:59:44'),
(698, '252610282', 'SARAH', '$2y$10$r9WRvd95nyq.zJZ8oGy7m.1EB2LDly4s0bDf7o5GkV85g6uHicTJK', 22, 1, '2026-08-12 09:59:44'),
(699, '252610283', 'SITI NABILA', '$2y$10$d7B2PshNvf/VNK9gjh.0Tu.513S8zR9swX7eTkg6gDXI4f3ZywOrG', 17, 1, '2026-08-12 09:59:44'),
(700, '252610284', 'STEPHEN ADITYA PRATAMA SINAGA', '$2y$10$u0XLrJDfKlkYlbIKy.nPJum5LvdmwEi6qb3jMePO2TC0mKCgGk6YO', 23, 1, '2026-08-12 09:59:44'),
(701, '252610285', 'SUSI SULISTIANI', '$2y$10$kSKfllx3AfWIjA5Ym4JU7./oh3wyQvjNNZU0alJwZ5chh/Xo/0a36', 21, 1, '2026-08-12 09:59:44'),
(702, '252610286', 'VANESSA ELVARETTA ECHA ZAHRA', '$2y$10$ozQgV0XTBiz6cZajSok.gOzHvlBUU/nkCCMtKr55rrppihUZr6.ZG', 24, 1, '2026-08-12 09:59:44'),
(703, '252610287', 'ZAKI LUTHFI HAMDANI', '$2y$10$XecgRdc6yCW1yN4wksY3reOQ0j4W6J3lFi3yFyMgoD5KI5opl9I5.', 19, 1, '2026-08-12 09:59:44'),
(704, '252610288', 'ZIHAN PRICILLA', '$2y$10$MfKbf1EcwlKKarY8wg0CnOxRqqSS4tyrUFgPxmVWbAJDkVO51jN.2', 23, 1, '2026-08-12 09:59:44'),
(705, '252610289', 'ADITYA HERDIANSAH PRATAMA', '$2y$10$FESJEtHonGhc3ZtsmG2mNuqPeMbDOghUuLSqRuwzBzVkZFv/5.82C', 16, 1, '2026-08-12 09:59:44'),
(706, '252610290', 'AMBAR PUSPITA AYUNINGTIAS', '$2y$10$lzvhbhjXZq8lBv/IV/1KK.tctDIICBaseKjJbrU/QoU9QIrawQufu', 25, 1, '2026-08-12 09:59:44'),
(707, '252610291', 'ANGEL MARSANDA MANURUNG', '$2y$10$aJoDxNGzI3vlSK0rZ980SOlqAL1C/xfC66.n4KZ7wPXXHyddMpxSy', 20, 1, '2026-08-12 09:59:44'),
(708, '252610292', 'ANGGA FAJAR MAULANA DAUD', '$2y$10$AXva2f8LU/7fRDZjna4bs.6TRnCNMFuIn.hbGKd9VLhjDoE5e8qz2', 23, 1, '2026-08-12 09:59:44'),
(709, '252610293', 'ANISSA RADHYANI APRILLIA', '$2y$10$PEGPy4.6PfKms/9W6OWSRufGdziBy3DPoyP95FW3DdxLSndI0yEpO', 21, 1, '2026-08-12 09:59:44'),
(710, '252610294', 'ARYA PRATAMA', '$2y$10$r/OdxWz7F2iO00swZcOdOuF..FZM8plaoDQS6y2/vmSQ79WW17nta', 18, 1, '2026-08-12 09:59:44'),
(711, '252610295', 'ASSYFA PUTRI NURSALAMAH', '$2y$10$rFKd2VD20a4HiQHYKhW.regInc6n96FjePbR1k73y4RMT4ln6jYN6', 17, 1, '2026-08-12 09:59:44'),
(712, '252610296', 'BAMBANG MOHAMMAD WILDAN', '$2y$10$WuizN6RoHEWf.TktEdNG.ONIPsCtj9XP8zRptbVsnAV7k1UUHJa7K', 22, 1, '2026-08-12 09:59:44'),
(713, '252610297', 'CHANDRIKA AZ ZAHRA RIZQULLOH', '$2y$10$KR/TuZXopw5F61W8BFEZdeZWAVpaoVpLTT6jZtixvUd3pg8XlPB9.', 26, 1, '2026-08-12 09:59:44'),
(714, '252610298', 'DE SILVA NURHALIZZA', '$2y$10$YTVIEtV0MIRak9xErWcg4unDDswhcNoHcaK/vyVoVkNnA0s3N2i/e', 22, 1, '2026-08-12 09:59:44'),
(715, '252610299', 'DEDEN SYAHPUTRA', '$2y$10$d.4IYupQsDnzK0T98QWoWOODHVDM4tKHGn/9VaWkTLjAx0b5JpGzi', 21, 1, '2026-08-12 09:59:44'),
(716, '252610300', 'DINI AULIA FITRIANI', '$2y$10$krQN1GuiJIdw4CZKYjeuW.ih.75ts5dUIEBtViYYOK/Qq6QErr2ya', 17, 1, '2026-08-12 09:59:44'),
(717, '252610301', 'DWI PUTRA YUDAYANA', '$2y$10$ZXwMs/YHGJYFk9ADCZYgeuhmnw3MCsx4EeANBQrVLP7MlRdcVUN32', 15, 1, '2026-08-12 09:59:44'),
(718, '252610302', 'EVAN FEBRIANSYAH', '$2y$10$p3DIclXIpN62LeQP2FzQl.FQZE01R3Dgfb8scPfIrruMMDY/g1nQO', 18, 1, '2026-08-12 09:59:44'),
(719, '252610303', 'FARRAS AMELIA HAFIZHAH', '$2y$10$Lswi5ni8iG4wNv9nyowFu.N7huuylOPaSbugYsBWdznkBQlrfv/X.', 16, 1, '2026-08-12 09:59:44'),
(720, '252610304', 'HABBIL AL GIFHARY SYAHBANA', '$2y$10$QJrCWBydQgeCbWb1mEU39ugTVyf4eJu9JKidQGW/NNqoFUrSm8l7e', 19, 1, '2026-08-12 09:59:44'),
(721, '252610305', 'INDRA NUR CAHYANTO', '$2y$10$4UH7dj6jmbFXKXHk4Lb5ZOT82Iy1WeRkkMJE2qn2p5UiSLgRy.DpG', 18, 1, '2026-08-12 09:59:44'),
(722, '252610306', 'INTAN RIYANI', '$2y$10$DJsRrFPKYDzsFrqlPu1I0.cFxBMe/OJZdmfSWcQ2oMoXFR9LVlWSe', 23, 1, '2026-08-12 09:59:44'),
(723, '252610307', 'KAI AULIA PUTRI SUPARDAN', '$2y$10$qmtLrIHQEIgl6HAs5kqov.YjpcrG.QjXeW0xaRVsku2mWX2hLN6K2', 16, 1, '2026-08-12 09:59:44'),
(724, '252610308', 'LUSI SITI SOLEHAH', '$2y$10$NmP1acYEXftxxXmK.2jjeuEDp.JPUMXtGQ5EAgLp.OVnMq.umO.aS', 17, 1, '2026-08-12 09:59:44'),
(725, '252610309', 'MUHAMAD REVAN SAPUTRA', '$2y$10$PYG2T2A/vQmWR2pWU/myXul57QSsyFXyvGUeVPoQB8dBOyQQOfSnu', 25, 1, '2026-08-12 09:59:44'),
(726, '252610310', 'MELATI PUSPITA KIRANI', '$2y$10$5MiGA5WM02L5O3KYiso.eOFl7TBUnizvIQloxDUzG8Bk7M/7HjoMC', 24, 1, '2026-08-12 09:59:44'),
(727, '252610311', 'MOCHAMMAD AKBAR KURNIAWAN', '$2y$10$kUTIwHSNVQN.LRdGOt63cuIvR2Nt7Fur/NtjY3m7tlmENHyF.LUMO', 26, 1, '2026-08-12 09:59:44'),
(728, '252610312', 'MUHAMAD EMAAR', '$2y$10$WjV00YGnJIBPr65fnVVqWuKgRUklOGsMlfJHfvv1uRRXcxO60qz5K', 24, 1, '2026-08-12 09:59:44'),
(729, '252610313', 'MUHAMMAD DAKKA JATMIKA', '$2y$10$m4qWS2zI1hpRSj8KI2Vm/evCqttXlSmrPlcgZvO6hPQ79jUlBnCEW', 21, 1, '2026-08-12 09:59:44'),
(730, '252610314', 'MUHAMMAD RAKHA SATRIA WIDYATAMA', '$2y$10$d135AXJnrG3CyzGolBj9a.89UmZyA6qrBhATFSTjRxv2EB3pB2S2q', 23, 1, '2026-08-12 09:59:44'),
(731, '252610315', 'NABIL SATRIA PURNAMA', '$2y$10$BrsFAHV29HQVnh7NtRc7AOJnaAwZeWsYOXhyl3m.E7HBmIUFQUqmG', 17, 1, '2026-08-12 09:59:44'),
(732, '252610316', 'NAILA NUR WAHIDAH', '$2y$10$XEu3IK8QWn3FpgxB7tbLaO52L2aXO4WR52VrqR/OWVhqt894vi7L.', 20, 1, '2026-08-12 09:59:44'),
(733, '252610317', 'NAOMI AISYAH PUTRI', '$2y$10$6l8.bsjEu4DWXNpbTyixGuzkxSt/YE06MeXtPr4y6kQyVLUkxSaem', 20, 1, '2026-08-12 09:59:44'),
(734, '252610318', 'NULA RISZENA ZISKIND', '$2y$10$OuyGD3aeQio7TkPLMw567upOm6RsPegLBnDGnD16nAiwE6qB/.G3K', 23, 1, '2026-08-12 09:59:44'),
(735, '252610319', 'NUR ASSYIFA SABILA SIAGIAN', '$2y$10$lrXvMr3ldW3.xF5yl6W2xuIZx8VwbSwVZiXxitQdiXf4Vnb9onbXa', 15, 1, '2026-08-12 09:59:44'),
(736, '252610320', 'NURANI SITI ZAHRA', '$2y$10$rxT5FrFJ7p6Pi8Og9f9UF.I4D2.TFZXjan1wM39aWakCLY8Fgoqjm', 15, 1, '2026-08-12 09:59:44'),
(737, '252610321', 'RAFA JEN NUR AHKSAN', '$2y$10$Vet4lDypwJPfoQowHPAHT.CfelROPNUxEMMhWEZ0fRelNOaB1GkXW', 26, 1, '2026-08-12 09:59:44'),
(738, '252610322', 'RAHMA RIDHOTUNNISA RINALDI', '$2y$10$EY5xiRoqUmLCaN3CeNyCGeImVqBSKmuhm7yVQDjdoI90wndGBCtFS', 19, 1, '2026-08-12 09:59:44');
INSERT INTO `siswa` (`id`, `nis`, `nama_lengkap`, `password`, `kelas_id`, `is_active`, `created_at`) VALUES
(739, '252610323', 'RAINA SABILA', '$2y$10$WpKQxlB1PxU5FNNX2qhJkO8Rss3jHMv51kPrx9D6W0MpFj0euEgHG', 19, 1, '2026-08-12 09:59:44'),
(740, '252610324', 'RIFKI VALEY FERDIAN PUTRA', '$2y$10$8n01IeBR4i/uMN4TV58KmeTVww51RjX4MZhSNi2j6GQzswxcr9biS', 18, 1, '2026-08-12 09:59:44'),
(741, '252610325', 'RISKI PADILAH', '$2y$10$TWTsIj5YF/DdaDMqaOaDae9MVXSbrynbPqRfe4Luc8RWdCsp1KQwC', 25, 1, '2026-08-12 09:59:44'),
(742, '252610326', 'SALMA JUNIAR SUFYAN PUTRI', '$2y$10$6JP.fYdrRpnQezThc8CwXedOSRE//eFsTTBuGykiylN3Xze5wtCrG', 16, 1, '2026-08-12 09:59:44'),
(743, '252610327', 'SALSABILA RUSNADI', '$2y$10$sraejztZQvmZIlfwgtPcP.qqIBDJQVy5Z7hsQ1Jw8prFRwQEvD/ba', 25, 1, '2026-08-12 09:59:44'),
(744, '252610328', 'SALVIA ASTI KIRANA', '$2y$10$jfAHciAWANRg453Ycvi.WupWcLfKUnaxgYVTMLVS0AY9cbfQBdena', 22, 1, '2026-08-12 09:59:44'),
(745, '252610329', 'NAZWA AULIA SALSABILA', '$2y$10$NjhJGkO7Zz6G/QmL9.1ua.efbGFP1rObY7S5zJ/fNZGXcBuKkmPKO', 21, 1, '2026-08-12 09:59:44'),
(746, '252610330', 'SANITIA CLARAHATI', '$2y$10$cAGqH4njDl4IOdi0PwKQ6.USHbz4MzFrACfC28ZoUc4cQpcmApRhi', 20, 1, '2026-08-12 09:59:44'),
(747, '252610331', 'SASKIA NABILA SUHERMAN', '$2y$10$K02LAaA/S0itMhfo2LzAEuQ6HquTwxFvqH7rZL2F04QqqMnpxySGG', 26, 1, '2026-08-12 09:59:44'),
(748, '252610332', 'SITI SALIYATUL JAMILAH', '$2y$10$VeG/2SGToLno42Cz6iR0m./qiieT.eU13yErp9K1ln6lGul6t1z4K', 19, 1, '2026-08-12 09:59:44'),
(749, '252610333', 'SYAHRUL PUTRA MAULANA', '$2y$10$eMTRYchDGCC/7Ixfr23rd.tzHSepsSJyHlmF5rLnD.Gd7gkTOCpn6', 15, 1, '2026-08-12 09:59:44'),
(750, '252610334', 'WANGI ROSALINA', '$2y$10$6Vw39mvSkAZ7M9f0Zx.63uQfyNEXRK8bV1Xvy3xF1BBFjx4lKtJNK', 26, 1, '2026-08-12 09:59:44'),
(751, '252610335', 'WIRA DENTA RUKMANTARA', '$2y$10$eiEff7JOupWhk70H1I7WS.TwE9kmMk..iXsnFhwqbMwzFJaEpIs5C', 24, 1, '2026-08-12 09:59:44'),
(752, '252610336', 'YULIAWATI', '$2y$10$cLrzbLjmoMyvxc8vJXHg/O7FuQeUf4nsJrtoxcvbxNeftfNYF.Xdq', 22, 1, '2026-08-12 09:59:44'),
(753, '252610337', 'AHMAD ADLU ROZZAQ', '$2y$10$oWNrR2DJXI3zD59zJw9KuuP9vDu4zrlf8Sw9RzVv2TqS7LuWdPptC', 23, 1, '2026-08-12 09:59:44'),
(754, '252610338', 'ANNISA AULIA HAFIDZAH', '$2y$10$5QL4kWi2V9mwrfG9hVmNTuaXw6dH76p.XElyDO8GZFfJUfAfoKNTe', 22, 1, '2026-08-12 09:59:44'),
(755, '252610339', 'ARDIANSYAH PUTRA', '$2y$10$L2a59hVQE6QsjB3.TPol/uy6gGlSRq6IdzjJwEKvSkNsrNPTZDPkW', 18, 1, '2026-08-12 09:59:44'),
(756, '252610340', 'ATHQOL AZKIYA AL AINA\'UL MARDIYAH', '$2y$10$LF4526jXnoNoNrvrM1JBEOJdM84lW.p.tO23gsAADw4Vd4r4h1R/2', 20, 1, '2026-08-12 09:59:44'),
(757, '252610341', 'AZRIL MAULANA ISMAIL', '$2y$10$MbsP3zEWjtqn5R25wkYnK.ZOiYGOe91jfEpe0ZIirJrnd9WpRFhYm', 23, 1, '2026-08-12 09:59:44'),
(758, '252610342', 'BAIQ AISYAH PUTRI MADINA', '$2y$10$mvUJxdiBB2/NslqcTs1MWO0EwXMK5MVaXYS6z5G8rKrH0uan9saEu', 17, 1, '2026-08-12 09:59:44'),
(759, '252610343', 'BAYHAQI APRILIAN ZUFAR', '$2y$10$kUelHuuC.Gg2T29xXdeWg.s6npY8NXVjR2GLJPYeqEpqPa8DMwXLu', 17, 1, '2026-08-12 09:59:44'),
(760, '252610344', 'CHAVIVI ROMANSI DEVITA', '$2y$10$LnvHNXTosZA8JRpWqhup3OoNulfEXNhxwd3kKa6.Sck2zFs4R7k5a', 19, 1, '2026-08-12 09:59:44'),
(761, '252610345', 'DENIA ARIFRIANTY', '$2y$10$qkLvzkUuwRiEuVDwYn79O.XgB9tqBN3FkFXNIEz8A8f.yANfqAeti', 24, 1, '2026-08-12 09:59:44'),
(762, '252610346', 'DESRA DWI CAYLA', '$2y$10$2FD7DJrbw//BrJZP6f4qC.14YnoK94xDz/zHPtrMMlEOolNj3p1aa', 16, 1, '2026-08-12 09:59:44'),
(763, '252610347', 'DINI IRA RAHMAWATI', '$2y$10$HOLhEqfdY.paNyefL9uvAeMWjZwCGXN3F5j.F1zUaF/CoIkY4UdxC', 22, 1, '2026-08-12 09:59:44'),
(764, '252610348', 'DWI PUTRI RIZKIYANI', '$2y$10$2.WR8fzJ1RAyzZu5l1CaJeW4ss0LaV6PgqqszvhkVL3YlS9kBlz26', 26, 1, '2026-08-12 09:59:44'),
(765, '252610349', 'FABIAN RAMADHAN MAULIANA', '$2y$10$NizuW1WwilSIS8gH1o21oOkHG9zUyueSsOCVstFaCtHsdYjJNA0MC', 18, 1, '2026-08-12 09:59:44'),
(766, '252610350', 'FAHRI FAUZI RAHMAN', '$2y$10$2.1ITtJdCnaQqFOGW1KYEOJ2TeZGeWQf4pl8M57IH/w72Vxm3cFvS', 26, 1, '2026-08-12 09:59:44'),
(767, '252610351', 'FAIQ AZARIA ZULFAN', '$2y$10$khzUdVbhAliH6rlQeXiBi.5XFs4LnLX/yTb//I/Fh93AIDHrsQkKa', 15, 1, '2026-08-12 09:59:44'),
(768, '252610352', 'FATMAWATI', '$2y$10$wOm9LEnfbUCoQGjSX.Pux.mNRUgUdVS4Bg2xIzzEfHCa9MIdLodG2', 15, 1, '2026-08-12 09:59:44'),
(769, '252610353', 'HANA PRATIWI', '$2y$10$RvzI6kIVVqdOZWE9R2d2cuK0P0JwHaS8Tjso2Yq5xMqU3nAv79VIa', 21, 1, '2026-08-12 09:59:44'),
(770, '252610354', 'IMAN SETIADI', '$2y$10$WR2ImRTGKJOkqs8OBQUOK./hNsqd6b52swltHoyU1THOmFP.lUIQi', 22, 1, '2026-08-12 09:59:44'),
(771, '252610355', 'JIHAN OKTAVIANI', '$2y$10$GEQUHseXeq6FWf9Hq46Jz.6ZkgLR2jEoOY.8G6nZ2Q49IjpNMsmH2', 17, 1, '2026-08-12 09:59:44'),
(772, '252610356', 'KAFKA SUTHANIKA PURWANEGARA', '$2y$10$xQMO7kIbaVx6si/yhkuKZulz2W8m9Yev/Dxhw2/387yAvlgD1CSsS', 19, 1, '2026-08-12 09:59:44'),
(773, '252610357', 'KAILA RAISHA PUTRI', '$2y$10$NmF7PLE8UmjfEpV1c/3AKezDscRMdkk.cfV66TbsbtQb5XUdE2LBC', 16, 1, '2026-08-12 09:59:44'),
(774, '252610358', 'M. IMAM ALKAISAN', '$2y$10$ClQE.ctb8yNw88V3V3t0p.SzT9Qzn7RhZ3cVjgmGRwxPeaXOVszzG', 20, 1, '2026-08-12 09:59:44'),
(775, '252610359', 'MEGA PUTRI AGUSTINA', '$2y$10$rZPKpnAFNMZvLIQqDNgy8OaKhNPPMFw8sCi1UMGNejK8yT.4GaVhC', 16, 1, '2026-08-12 09:59:44'),
(776, '252610360', 'MUHAMAD FATHIR VANDIAZ', '$2y$10$XmTU9xbvx83isb4T9kBz6.aJTRJ33hKItpDb3vqm9vqa5/B5sMy2a', 24, 1, '2026-08-12 09:59:44'),
(777, '252610361', 'MUHAMAD HILMY HILMAWAN', '$2y$10$KMP1pn04kPcZAbGtNs8aVudOkdf0db11FCOaN39DtR.E8/2xERluq', 23, 1, '2026-08-12 09:59:44'),
(778, '252610362', 'MUHAMMAD FAHRIZAL KUSMAYADI', '$2y$10$TASk6az9RWE3PujflKLZ5eSPRBDRZR4oGvM4zst5yoiE36DpRG/Vq', 18, 1, '2026-08-12 09:59:44'),
(779, '252610363', 'MUHAMMAD RAUFA ALTHAF ANHAR', '$2y$10$Ntts0v2QmqoOu22Hcjk8t.mlhe7UhxDGl4luZNVcLv5WiixtXlEoa', 18, 1, '2026-08-12 09:59:44'),
(780, '252610365', 'NABILA AGUSTINA SETIAWAN', '$2y$10$xnDhyOTnbH/4ssPS0hrR0.pFtpxIp2iM60GIfKaIIooY19wwBhs5O', 18, 1, '2026-08-12 09:59:44'),
(781, '252610366', 'NAOFAL RATIAN', '$2y$10$U9F21OB54kJ8zlELeq4kDetV9ZIpelwW./Cn.ITJIdrQNq88EEZyG', 26, 1, '2026-08-12 09:59:44'),
(782, '252610367', 'NAOMI ANJANI', '$2y$10$rNj4StyAgC2NRzK1IeyupOjvrrjRKdUdxgqVIHSUC.BDNT//POZ7O', 16, 1, '2026-08-12 09:59:44'),
(783, '252610368', 'NURLAILA NISPI SA\'BAN', '$2y$10$crThM5N3e/7JwGY2STpfr.Oq5y8oN1g8VcPNlRm2shQ92rgcsm7NK', 15, 1, '2026-08-12 09:59:44'),
(784, '252610369', 'NURUL AZKIYA', '$2y$10$N3bgIe5MnYbiZbW093fE2uztXFwTJD7GdLoNK/TqRv9FP9kr.WHSW', 24, 1, '2026-08-12 09:59:44'),
(785, '252610370', 'RAFFA ATHAYA SYAILENDRA', '$2y$10$tPWfApt93NoXYO2Xy8mDMOsZ8R1oFBr8QFRYJ3D11AFVe2eYp8ZWy', 23, 1, '2026-08-12 09:59:44'),
(786, '252610371', 'RAINA WULAN JANI', '$2y$10$sqLq/F4nPQcCvb06kI9pfe9U6EocScZ2/YCd3v7IpIvDiadRMepCa', 22, 1, '2026-08-12 09:59:44'),
(787, '252610372', 'RAISYA NUR SIFA', '$2y$10$q7QgGrCgwmhl4AmofqPQQO5L52/23dnk8SzPH/DtC4z9d7NI/oK8i', 25, 1, '2026-08-12 09:59:44'),
(788, '252610373', 'RIFKI ZAIDAN AL PUTRA', '$2y$10$wQO2xeMHVMoQHjnhmmHQ4uvLukv.2YgrftSYoRq3Kh/uH208es6r6', 21, 1, '2026-08-12 09:59:44'),
(789, '252610374', 'RIZKY RAMADHAN', '$2y$10$piux4ah2k6lBkio/5pHD1OyJB6CurE7r4I5AmIdbz4U.u58HVVJH.', 17, 1, '2026-08-12 09:59:44'),
(790, '252610375', 'SHAFA AURELLIA', '$2y$10$WguHjGbRvaxhJJXUpCLxNOT7LvbS4gkF4qCoRxWkdkg5O78karBDK', 17, 1, '2026-08-12 09:59:44'),
(791, '252610376', 'SALSABILA NUR AIENI SETIAWAN', '$2y$10$4ghYwUWm0rMW0mTQqJHJ8.AHCDiZSR1Ee6ZjgtOcTedmlKnGW23lC', 19, 1, '2026-08-12 09:59:44'),
(792, '252610377', 'SALWA ADINDA NUR RIZKIA', '$2y$10$L4.CcNFbmXz2piP/jCOPA.amiMAFmZKmim2lKEN5VcCa4jPzvbYU2', 25, 1, '2026-08-12 09:59:44'),
(793, '252610378', 'SASKIA AULIA FITRIANI', '$2y$10$ak3PB2XU9igFeqLtvaPU6OLcMmZYQVPu.K.dMOy7VNA17yib6XcCe', 21, 1, '2026-08-12 09:59:44'),
(794, '252610380', 'SYAKILA PUTRI ASY-SYAMS', '$2y$10$UGyuMFrrjAoBOrtZx2jzteIrE/7ealrqct1vu8VJnTaqt35wRPK2K', 21, 1, '2026-08-12 09:59:44'),
(795, '252610381', 'TUBAGUS MUHAMMAD RAFA', '$2y$10$SsE2WzDM75MpeEzT5BGI5uizxPveL1OqUk.SPULpuolkG70SrLxJy', 24, 1, '2026-08-12 09:59:44'),
(796, '252610382', 'WINDA AGUSTIN', '$2y$10$MOVIbrr8vnhoJ94..SmXU.QnQ3Lxfb8AxwRbLQNxwU6H2ZQdWWX7u', 23, 1, '2026-08-12 09:59:44'),
(797, '252610383', 'ZAHROTUS SITA RAHMANI', '$2y$10$QA2ug1FWwXfxc05MJI.eNeljjUXu.RmNyLgGYgD/C3wi/GpLMmJzm', 25, 1, '2026-08-12 09:59:44'),
(798, '252610384', 'ZHIDAN TENGKUH FIRMANSYAH', '$2y$10$kujXvtSDAKXlxMEooYmvGuVASsKVZoTeGuG6M/kmUByWx7IxEwxkK', 19, 1, '2026-08-12 09:59:44'),
(799, '252610385', 'AKSEL AKMAL FAIZA', '$2y$10$R0a91LqXH28iQ0B1NfavHeILuUVEjSahTG6vWyG34Rg.SPhfD75zi', 15, 1, '2026-08-12 09:59:44'),
(800, '252610386', 'ALDI DWI NUGROHO', '$2y$10$AtfuYy6ULjfqQRsGIR1bkeoydCI5qwRpKyMlhkCtN9O7pHQSNCB/C', 26, 1, '2026-08-12 09:59:44'),
(801, '252610387', 'ANNISA DENIYATI', '$2y$10$uNiNNr4wkKPE9CzEZfp8rej5/pdgzG1P/XxxMqH.k8i3mV7Fs1TVa', 25, 1, '2026-08-12 09:59:44'),
(802, '252610388', 'ARIS SETIAWAN', '$2y$10$rXqgEiOOlPO.6LDfYcMmSOV40N7IageLdzI.oB.a68s.8TzpmrbMS', 21, 1, '2026-08-12 09:59:44'),
(803, '252610389', 'ARNIS AURELIA NURRAFIKA', '$2y$10$P2ComjMXhpx/yZ7CJypDgONnP2DBVB5j2ISAJrR0BJgNw885BrMBe', 17, 1, '2026-08-12 09:59:44'),
(804, '252610391', 'BILLY PANGESTIAN', '$2y$10$Xd.hpDfdKuECunuRQV7j4.kGLV/qt4qrC1PVHFyz1vsNnig0lTHVi', 18, 1, '2026-08-12 09:59:44'),
(805, '252610392', 'CHELSEA DWI AYUNINGTYAS', '$2y$10$g.dQAQe.ezxKxPg/MDWxq.ESU/aG2m1orDgSk38Uzzv7R2JCiSdRq', 18, 1, '2026-08-12 09:59:44'),
(806, '252610393', 'DITHA AULIA LATHIFAH', '$2y$10$iIpZzhMIUCTIJHD/RKRg7.m9wO8YDZpqHjrenjRJSD8AOf41FMXLu', 24, 1, '2026-08-12 09:59:44'),
(807, '252610394', 'DIVA AULIA FITROTHUS SA\'ADAH', '$2y$10$7ZzQF3nnLwVxIqmjyHVrjehq8hme0WFq2kZ9seQAnZrK2X0ZzRjXW', 21, 1, '2026-08-12 09:59:44'),
(808, '252610395', 'FADLI FIRMANSYAH', '$2y$10$F1N68wzcNPuYg44.slilI..bJNIehQ8OHimqIAWL48zNPt9evFKTa', 21, 1, '2026-08-12 09:59:44'),
(809, '252610396', 'FAISAL ISKANDAR', '$2y$10$f9MZD39mkCMW4wNb36eGS.FZ4UsihvJjR7hKk/ULxvwnT/nbk6F0a', 19, 1, '2026-08-12 09:59:44'),
(810, '252610397', 'FAKHRII ARKAAN NASHRULLAH', '$2y$10$aIRGuIzjS3hkhVt5EuFmN.XtcqSkRbuB5kbZyoFtaTjRhkTLwiJIm', 23, 1, '2026-08-12 09:59:44'),
(811, '252610398', 'FITRI NURHASANAH', '$2y$10$3MhR42F5KUTXtgIwtlHj8uHNOWphWiFTTy8.UXoGm7KOpW6RIjJh.', 16, 1, '2026-08-12 09:59:44'),
(812, '252610399', 'HASNA NADIA FITRIA', '$2y$10$2WAjzkCSk/0Q5UgCI2uOPeD3CGpF421XhcIhezymFMf1Y.HqKUrOO', 19, 1, '2026-08-12 09:59:44'),
(813, '252610400', 'JANUAR PRADITA NUGRAHA', '$2y$10$Hs2/lOfVPIQ3Bce7zZTbmO3YgLQuNsrvTwx6pFqw2rPJ/PC4P4hza', 19, 1, '2026-08-12 09:59:44'),
(814, '252610401', 'JESSICA AFIFAH SIM', '$2y$10$BbH6ocZNFUOvQKHL664uGOyr69QRIU6v4fEoBEa1WuOSTSoaI23wi', 20, 1, '2026-08-12 09:59:44'),
(815, '252610402', 'JIHAN ROSYIDAH ARIJ', '$2y$10$jQBS.qoulIZFk1sYYUBcJuHf8NQgbCbgRBvqZPyAkhe6mWEZ93D5C', 22, 1, '2026-08-12 09:59:44'),
(816, '252610403', 'KAILA ICA KHAIRUNISA', '$2y$10$CCX.PheVXsaAVqr8nwKwnu.pG1ZIFiAz3e8g1Df8ylOBpgbuv96oC', 23, 1, '2026-08-12 09:59:44'),
(817, '252610404', 'KAYLA SALWA SANIAH', '$2y$10$kmL7r54Y.oYUuIQzyCwaBu1FTppmIdAYnuGZgOqV/84nBt.0Tz/B2', 20, 1, '2026-08-12 09:59:44'),
(818, '252610405', 'KEYZHA RAFFA ALBHANI', '$2y$10$jtyAJL62fMGw8S22REs.Rei7LchcTdIMlGL12mgV9TQ2XfkRGgZLO', 24, 1, '2026-08-12 09:59:44'),
(819, '252610406', 'MEISYA INDRIYANI FITRI', '$2y$10$G3zKr9vpEocI1TxHzocvz.cfpKQs2FWVEn1AUCjPSTE4RTGp3qCke', 15, 1, '2026-08-12 09:59:44'),
(820, '252610407', 'MELVY ARRIFAH PUTERI NADIN', '$2y$10$CyfGW9K6k8nD9rHtDrsYiuUDV/MlM87UUS5erBk4euyxYSjJ/gkyO', 16, 1, '2026-08-12 09:59:44'),
(821, '252610408', 'MOCHAMMAD DESTA ANUGERAH', '$2y$10$CzMMxPJdfu3r0wfUvdD5heiiFqV9YhNipymuxd8XW/Hk2Cz4XgSfy', 22, 1, '2026-08-12 09:59:44'),
(822, '252610409', 'MUHAMAD ILHAM RAMADHAN', '$2y$10$QHAKMqak/fgl9lRkV1Z/QeZy5ZOu6UPeUwlox8tOjT/B9lvjAZ6SG', 20, 1, '2026-08-12 09:59:44'),
(823, '252610410', 'MUHAMAD IRHAM BAIHAQI', '$2y$10$7/mPC0AsK0t0tcSe5LMhrucrVfkRzKNc5amQCnV6ljwNjFZ9n3hPa', 17, 1, '2026-08-12 09:59:44'),
(824, '252610411', 'MUHAMMAD RAVI RAFAEL', '$2y$10$3b67jeYlXdxZKy2Kb1KXJu/Hc3oflPJM9VsqQb.lI.3HgGKQxr6GC', 19, 1, '2026-08-12 09:59:44'),
(825, '252610412', 'NABILA AURELLA PUTRI', '$2y$10$MhhAarC9ru.WCwo9y0Fo9.ReDMGoB98uz.7Z8bRDXY53fGGPIiceG', 16, 1, '2026-08-12 09:59:44'),
(826, '252610413', 'NASYA QUROTUL AIN', '$2y$10$h5iKF4XSWlqCkXEQdEc4/.bZ319aJD4Qm5G.S56QwrLQhIN//fM8W', 22, 1, '2026-08-12 09:59:44'),
(827, '252610414', 'NATAN OKTAVIANUS SINAMBELA', '$2y$10$DU34o03c7MK6mngIK3uxFeg6Tre2pS93DQJFkflf5cZn0Rzbl00bS', 15, 1, '2026-08-12 09:59:44'),
(828, '252610415', 'NOVAL AZMI ARIZKY', '$2y$10$4VOD0Ar6UKPbewgQiGDfyeyJmzh.P2kd/aIwOW4xbHErqHo19aVQK', 23, 1, '2026-08-12 09:59:44'),
(829, '252610416', 'NUR RAMADHANI', '$2y$10$p8s6/P5XcKR/jKD7Op4WiOIrEWqsoBYlKDm46a76PWeP0lOyVIUDC', 15, 1, '2026-08-12 09:59:44'),
(830, '252610417', 'PUTRI AMELIA', '$2y$10$nDKg9mhwEeOHeaTHMqnj2ukfBCJLnMrq9Ft12Ni627wxezoLoobkS', 26, 1, '2026-08-12 09:59:44'),
(831, '252610418', 'RAFFA RIZKY ALFATHIANTO', '$2y$10$xV.UIwor3I149AvNdQ5d3uWNybb9cBo2ihvzaAt2BVuy647onfmuK', 16, 1, '2026-08-12 09:59:44'),
(832, '252610419', 'RAMIRA SITI AISYAH', '$2y$10$/NJs/HgB4gTMIZg7CnmaceU9d9lxDP3Yw9qKQjjZOlVlTjv.xNcXq', 25, 1, '2026-08-12 09:59:44'),
(833, '252610420', 'RIZKI PRADITIA RAMADAN', '$2y$10$n/fZecN6xkzQ4Zoow8l7RuvHVsGEdpWaOSdjzr/725mnnYxFgrcri', 24, 1, '2026-08-12 09:59:44'),
(834, '252610421', 'SALSABILA ADHA NURSYIFA', '$2y$10$VI6/8kEWgZ6W7L4h.5Bow.C4mFYgm5UdKcexW0CYn7da46Xy2ZNuW', 20, 1, '2026-08-12 09:59:44'),
(835, '252610422', 'SALWA APRILIANI', '$2y$10$jenGHI.xClIq9uijKs8Xy.XzEz0CrwY8CRKxafovmudHRKyZtSvKa', 20, 1, '2026-08-12 09:59:44'),
(836, '252610423', 'SEINA SYAFYA FITRI', '$2y$10$TcxzMJb7FgBnxf5G5j6keeTU.xq.8B7qg0LoNaqYyiRtFgn/jAyYm', 17, 1, '2026-08-12 09:59:44'),
(837, '252610424', 'SETRI KENDRAN WIMAYA', '$2y$10$gtU9Xdu.htXcQB0tlmm7k.CkNahG/qElj8yc9vEQyWH6mg9/xWnZa', 25, 1, '2026-08-12 09:59:44'),
(838, '252610425', 'SILVI PUTRI KAMILAH', '$2y$10$hpYV3mYpdljRWy4de9gNIeOLAUkel/S5Zw87MZte0g0v2biO5G7a2', 23, 1, '2026-08-12 09:59:44'),
(839, '252610426', 'SIRHAN GHAZI ABYAZ SANJAYA', '$2y$10$eA.bwOF7vVE6/F3/cvTpB.XC53v9HYWEHL0GX4c9VjyUTcyzILDL.', 24, 1, '2026-08-12 09:59:44'),
(840, '252610427', 'VALHAN ILHAM NUGRAHA', '$2y$10$2JwG6ZEDbrqZzZgV4YlrX.EL1lZ3FLjdQ26nDBl4cbVW.mM0WzOca', 18, 1, '2026-08-12 09:59:44'),
(841, '252610428', 'VANYA AUREL AZZAHRA', '$2y$10$Q16/vkhZ4rHPNt3n3wLKmevH1OvMrt1UjVjvDA/OjXmG/R1TuEZgq', 21, 1, '2026-08-12 09:59:44'),
(842, '252610429', 'VERN AULIYA GASSANI', '$2y$10$hrpoU.7NHXLyryDyfohy3.Dwa2NJDDFNAmpaoDXQNymBe4l4K2aC.', 24, 1, '2026-08-12 09:59:44'),
(843, '252610430', 'YURA LINTANG HAURA SAKHI', '$2y$10$68jiivNyzRytaI7G3UD8.OmUwgAqBZNMQe24rThAFPFiXUMrAOlCm', 22, 1, '2026-08-12 09:59:44'),
(844, '252610431', 'ZASKIA OKTAVIA PUTRI', '$2y$10$jOcVbjEkI7PAFoQ3ajbBGupbDH2CYlhCeEvn6VGLjdmjSGYF6A04.', 25, 1, '2026-08-12 09:59:44'),
(845, '252610432', 'ZIDANE FATURAHMAN', '$2y$10$2LGnuIE6G7LUjyOt3jYiD.Tub.kAIP8FvhkJN8.p8k5pxmgtLRIPa', 26, 1, '2026-08-12 09:59:44'),
(846, '252610433', 'ABDURRAHMAN HAFIDZ ANBIASYAH', '$2y$10$SsH3156qSkpU35Kh8A86jeyh9hgRoStBu1BOz06j5tILW42RDYy76', 25, 1, '2026-08-12 09:59:44'),
(847, '252610434', 'ADYA SYAQUEENLA CHAIRUNISSA', '$2y$10$PQEOUz49zjQ3SlAV7OqmxOA2bL8KCNQyVrvdcEE1kXdg8wIjCBike', 25, 1, '2026-08-12 09:59:44'),
(848, '252610435', 'ALBAR MUTAALI', '$2y$10$ric5rs7DWaIDzng.8r5Mg.nhGEyNaxisQBA1dsNMQoXM70DVHLLyC', 23, 1, '2026-08-12 09:59:44'),
(849, '252610436', 'ARLI AYU RAFEYFA', '$2y$10$ka1DguvGbBE/882Ghd9rPO5mi4i/IuoRAi.TwhNgPIb3k.bhksIJa', 16, 1, '2026-08-12 09:59:44'),
(850, '252610437', 'ARYA MADA', '$2y$10$6A7fQ7xgeoGdyDPYIVh0meYwkvbqU98H8QewiHvc7pCec4Te2lPe.', 24, 1, '2026-08-12 09:59:44'),
(851, '252610438', 'ASFA FITRI AYU RIZKIANI', '$2y$10$MVhdx7V2Whp79hBdaAtv8uJ1ATyK2UhwRTIADF1hqmJOAhLcFL2nq', 15, 1, '2026-08-12 09:59:44'),
(852, '252610439', 'AZKIA NUR AWALIYAH', '$2y$10$cdFbajwspbGuUi4sK0gH3Oj3XXtyQFGGFEOZxuv2Uda.wZCO1OKbK', 15, 1, '2026-08-12 09:59:44'),
(853, '252610440', 'BISMA PRIAMBODO', '$2y$10$ijYJp73tqPxSGyYmQYhi8OOx.BWp19lCPn/AwAkvRJ5AcxyJw7PIm', 24, 1, '2026-08-12 09:59:44'),
(854, '252610441', 'CHERYL RIZKA ADISTYWI', '$2y$10$lXLf1cX0I7cVk1491Ho1Iexwv9hL3LzrZkNDV57quWrShtr0zTOby', 21, 1, '2026-08-12 09:59:44'),
(855, '252610442', 'DWI PUTRI GUNADI', '$2y$10$uFfckmvJQ9upY4ONFyA1eevrUOkOhhXmT2ZINLRxZ9WGs.tiJoyq.', 26, 1, '2026-08-12 09:59:44'),
(856, '252610443', 'DYLLA AZZAHRA', '$2y$10$byX9Hin4Vl7enG.DetPkm.UBZTEaKocM9B.DoHm9A8UN5283N9U/i', 22, 1, '2026-08-12 09:59:44'),
(857, '252610444', 'FAHRI RAMADHAN', '$2y$10$e2R/BKxy0YIzQlIzVeoVUOeos8PpqCcc7Rzn14N4wnsG8htZpBS0K', 21, 1, '2026-08-12 09:59:44'),
(858, '252610445', 'FAJAR ARVIN RIYADI', '$2y$10$6nHFgeKIHbrr8ghVUOWeseQVk7tZ0yaCOwd89TVda7vk/0QZqqve6', 15, 1, '2026-08-12 09:59:44'),
(859, '252610446', 'FALDI RADITYATAMA', '$2y$10$rKe0qc3jwLlp8IdJ.sGUvOCZlSWsX2rhF50HqbOqTSGDedLWYxi.e', 17, 1, '2026-08-12 09:59:44'),
(860, '252610447', 'HAIKAL PUTRA PAMUNGKAS', '$2y$10$sWJuv2TNIvwLUzPqUpNtW.NZm6M.UPJpS7IECbnoVG0o3xU/l6l.m', 22, 1, '2026-08-12 09:59:44'),
(861, '252610448', 'HELMINA', '$2y$10$VLg/tvx7oIQK8p4uNP8/WublL..4aiAvejwRLUJxX8C0mnK70AncW', 23, 1, '2026-08-12 09:59:44'),
(862, '252610449', 'JIHAN SUTARLAN', '$2y$10$G0eByZAi3py3A4uAgnwusucG1C9veYIRKsKD4/uDQhbuF5YB1trOy', 17, 1, '2026-08-12 09:59:44'),
(863, '252610450', 'KAYRA ELVRIKA ALQONITA', '$2y$10$5x0XU/Vg/HWXCIzHfGDJzOQgUfYC1ff3foJFyhd9XhiV8eGOMYfxu', 16, 1, '2026-08-12 09:59:44'),
(864, '252610451', 'KEISHA PUTRI ANDRIANI', '$2y$10$9Lek6w.vF8UqEHB4yQs9OOmHZBBmrgnNhTb2sfvht8jkf.RQv9Ioy', 18, 1, '2026-08-12 09:59:44'),
(865, '252610452', 'KHADAFIE REZKY RAMADHAN', '$2y$10$kciaI5IhYGFLICJFd8wT/.6.9lFyBqAOO3RqrlzFey5iMCJ0GFFsu', 19, 1, '2026-08-12 09:59:44'),
(866, '252610453', 'MELISA', '$2y$10$No/SfPHYEDwXVtTOIqap.OpwABzFI3wCYO0mtxewJTHiczXC9/XjO', 20, 1, '2026-08-12 09:59:44'),
(867, '252610454', 'MUHAMAD PANJI ANUGRAH PRATAMA', '$2y$10$6l95BHRg3WbOx28q9rc7duUNo7udKFPBQXkB54/CgB9/bwr2.zbb2', 22, 1, '2026-08-12 09:59:44'),
(868, '252610455', 'MUHAMAD RAFKA FIRDAUS', '$2y$10$Zm1cAYy1IQxJZc1G2B/3Ruvu23hVfHVgyhU75UqmscwHggbXMQLlm', 26, 1, '2026-08-12 09:59:44'),
(869, '252610456', 'MUHAMAD RAMDHAN SAEFULLOH', '$2y$10$P0O0GLFMdRj0RZAvcpmON.bmjJi/ThVegnOnozxx2/QBM1Sh6DcOG', 21, 1, '2026-08-12 09:59:44'),
(870, '252610457', 'MUHAMMAD LUTFI SOLEHUDDIN', '$2y$10$FKM66A5PdeoafjxG7uZzUeNhq7xnrlZZ6Jslq1.kxIhOuzMRou4B6', 24, 1, '2026-08-12 09:59:44'),
(871, '252610458', 'MUHAMMAD REYHAN HAIDAR RAHADIAN', '$2y$10$vA4AusjP9v.bgsfU4Gj.XunDWHCJrcjMhtA.i5ojetWa.DcJv9mq.', 18, 1, '2026-08-12 09:59:44'),
(872, '252610459', 'NABILA LUTHFIANA FATHIN', '$2y$10$zYLT6SKXDO4bec/fpxywC.RlI5AF2biisjYDyjVpnRQlP4ZsKQ8OG', 23, 1, '2026-08-12 09:59:44'),
(873, '252610460', 'NADIAH ADALAWIAH', '$2y$10$Xn1gnmCdgUB6RHH/hdD9F.N0YZD2iyHAEu91vka8xusH9cfIDkhp6', 18, 1, '2026-08-12 09:59:44'),
(874, '252610461', 'NASYFA AULIA ADINDA', '$2y$10$h4QrQ/0iQ7OYaxUH8pHuru/pqB90vj3iVjRlUvKor6dTcgba6GSNC', 20, 1, '2026-08-12 09:59:44'),
(875, '252610462', 'NI PUTU GALUNG SUCIHATI DEWANTI', '$2y$10$.4HWPP3cZQpgkH6XSwCI5eU7ssd1SabkyVDs.2kTTfSnkd3GInegS', 16, 1, '2026-08-12 09:59:44'),
(876, '252610463', 'NYIMAS MEIRIZA GHINAA SYAAKIRAH', '$2y$10$nDEO6vWmUD6Q7cM1N09Xp.JKC/1GhIT5UQcRn.qCsngNAdmgYGuDq', 16, 1, '2026-08-12 09:59:44'),
(877, '252610464', 'OKKY SEPTIAN', '$2y$10$dewTEeKE/zBrem/4/7uU2OEZlPFjvAX9g4nRudXynZ/Uz1WYchX1G', 19, 1, '2026-08-12 09:59:44'),
(878, '252610465', 'PUTRI SANJAYA', '$2y$10$F84m.SVR9gTrssnJh6pMDufqBlh14uPVZ1pZ6Rgbg0G6njKYP/rSy', 23, 1, '2026-08-12 09:59:44'),
(879, '252610466', 'QUEENSHA ADILA PITALOKA', '$2y$10$fwA2yVdXTU7ufwiQDJrEv.OeVhycORh2BvpvGkwyrBARGlfq6b6RK', 17, 1, '2026-08-12 09:59:44'),
(880, '252610467', 'RAFKA ADITYA RAHMAN', '$2y$10$Y0LPkuWXlESmoBEpZ/uJcemlw1TsFxf5tUUn9zRoUR2G0KNhxEhn2', 19, 1, '2026-08-12 09:59:44'),
(881, '252610468', 'RASHEESA SALIMA YASMINE', '$2y$10$qvCmfJ/cdKlT8vOaBcZBiu83rZVUpr45pTcRwlQ8J6H2cwYpb8wAq', 25, 1, '2026-08-12 09:59:44'),
(882, '252610469', 'RAYA NOVIYANTI', '$2y$10$NFS/QnXL18.VW61PMW4I3Oz5Pzd7/MIASUT5kwcRO2vpOTwbATBUW', 26, 1, '2026-08-12 09:59:44'),
(883, '252610470', 'REZKY FEBRIANSYAH', '$2y$10$xqNdaXWgpNRtCn5j1x4nXetlKK.rIPKCAnlsawUGHQr6Jg9OVhqxe', 25, 1, '2026-08-12 09:59:44'),
(884, '252610471', 'ROMI ABDUL LATIP', '$2y$10$zXjyKI/AO0epBLM9bdBw8uRIUjOpg2GU22k0XBDpUurdiWjZIhv9m', 15, 1, '2026-08-12 09:59:44'),
(885, '252610472', 'SALSA', '$2y$10$sGlqH7ht2t3XVGvvqgODZeiiXxBXc.kcpJ6pv797ym4mXaDpQDNcq', 21, 1, '2026-08-12 09:59:44'),
(886, '252610473', 'SHERLY MAHARANI', '$2y$10$f1icIx7oNpV0qFNtj57s0eBN/P6kGkjkpF59Hc1wPlY2.PVnvxJYW', 22, 1, '2026-08-12 09:59:44'),
(887, '252610474', 'SINDY KANIA PUTRI', '$2y$10$MsikFcGjIsnbMpX4OQ5obu.lyA97puOpgSbVg2yKA3IHF7vr7SJUO', 26, 1, '2026-08-12 09:59:44'),
(888, '252610475', 'SITI NUR HALIMAH', '$2y$10$EEql7Ju3Y3Me0xTShU4Z2OEywW5v9or6sG1c.pxGYSDF4V2HVu3/y', 17, 1, '2026-08-12 09:59:44'),
(889, '252610476', 'SYIFA DWI SYAFITRI', '$2y$10$kUCXX1YHd99mHsxVMJsJ2eQ/lXQn4qsrXQZxRcz4TtHJ.8kHXy5l.', 17, 1, '2026-08-12 09:59:44'),
(890, '252610477', 'VINO DWIKI HERMAWAN', '$2y$10$eHugpmBF7Jea/kvzmSEnl.B4PINVuHUpm.YdAqu1l7UCGvT5zE2iS', 19, 1, '2026-08-12 09:59:44'),
(891, '252610478', 'ZAHRA AL QODRI NURHERMAWAN', '$2y$10$U2tOsGXVBT/S9tore5lT/.1jrc.c9/Z.MWvHAKY4CDP7s2m.LQLX2', 20, 1, '2026-08-12 09:59:44'),
(892, '252610479', 'ZAKI ACHMAD HANAPI', '$2y$10$tShXCr4eU/a/y4z/RGNwzuxbeUrZ4clNPzNLqhkK9mobIkys24UAC', 26, 1, '2026-08-12 09:59:44'),
(893, '252610480', 'ZHIRA MAHANDHA ROSADI', '$2y$10$v2SHU2ec7BacHir53UHxe.c798PE/VCQyCcQwoalKIEhYTcp84P8S', 18, 1, '2026-08-12 09:59:44'),
(894, '252610481', 'AGNIYA GHEA ANGGINI', '$2y$10$YZtVKA3vXgXNRLWEBGbAyODJ7Vfg.Z3jl9jsG4w3myAE4FPhQyohS', 16, 1, '2026-08-12 09:59:44'),
(895, '252610482', 'AGRA PUTRA PRATAMA', '$2y$10$fQnmMWcvmMketLv6NGDzQuqsyaqAgqyp77wT5UPhsDERqvpA/3HkS', 23, 1, '2026-08-12 09:59:44'),
(896, '252610483', 'ALDIARRISYAD FATHAN ZAKI', '$2y$10$LW1lm.swR.qYziujkEedVuehzovOTl1bHmO7hm9ZgM/U/b2Y72Gem', 18, 1, '2026-08-12 09:59:44'),
(897, '252610484', 'ARVENILLA HANIFAH FEBRIYANTI', '$2y$10$woN9wQImzhiYhyvfOTZO8uWYkr0mId5VjhwCdGl/9uHYCUTXyf0xy', 25, 1, '2026-08-12 09:59:44'),
(898, '252610485', 'ARYA RAMADHAN', '$2y$10$0Ne3OOD1BfPCNBCtr6RntOVj64GUL2z9m60j7LEM8Bl46IyygOCIK', 24, 1, '2026-08-12 09:59:44'),
(899, '252610486', 'AULIA SYIFA NURUL \'AINI', '$2y$10$JVI8jSoLtUQUS0cH8GCycO3nPtOU3ZzKFBKuXZzmtGGj/xaGPh/4u', 22, 1, '2026-08-12 09:59:44'),
(900, '252610487', 'AZKIYA DINARA ZAHRATUSSYIFA', '$2y$10$nbrrSXJhQiCpm4J98sl9F.RN/NSv6BA8dpco/X40f8ePkeJwBQ33m', 26, 1, '2026-08-12 09:59:44'),
(901, '252610488', 'CHIKA PUTERI YULIAWAN', '$2y$10$G4mqCUaudiYQb.d.EE0XSuBryWAzAFC/aru48bghUpZAeLlPQSjlm', 21, 1, '2026-08-12 09:59:44'),
(902, '252610489', 'DANIEL CHRISTIAN HARUN', '$2y$10$oL/h1djcC9965rb1ZG7i2.BPgkJBKjBlU4iz2MIchaOuaiO2NuW7C', 21, 1, '2026-08-12 09:59:44'),
(903, '252610490', 'ELSI ANDRIYANI', '$2y$10$.V16F6yeYRcL7iwiVHcQ7uBTzRIfgh1zPuJh8IpCgyeGGmlTE32gK', 19, 1, '2026-08-12 09:59:44'),
(904, '252610491', 'FAKHIRA NADHIFA SALSABILA', '$2y$10$YoEzxb3iXgZ64YLshVA3G.z2TBIW9uC0NRp47Xb3cNMNa6ygBkkry', 22, 1, '2026-08-12 09:59:44'),
(905, '252610492', 'FATIH ZHOFRON', '$2y$10$SMiNxRhAM3gryOG0DEXqlO7tdSrVceeMdRB.Ge7hcz3dHYaOf/BvO', 26, 1, '2026-08-12 09:59:44'),
(906, '252610493', 'FATQI ROUDATUL AFNAN', '$2y$10$BaRXV8e.t9WShOOTJm1f0.l.keFZK3rJxEzGW3gFHGV6D/bxfchom', 16, 1, '2026-08-12 09:59:44'),
(907, '252610494', 'GILANG RAMADAN', '$2y$10$j//p.1soibROGDI2cgJqP.ZxujUiyq1q2JTWE1SxBO7ERZuaSrlve', 17, 1, '2026-08-12 09:59:44'),
(908, '252610495', 'HESTI MELINA MUSAROH', '$2y$10$nctRdaq58RAu9FufbeTiLu/x1D9ZtC1TeTsq.ghDb0WOinmWUBxQS', 23, 1, '2026-08-12 09:59:44'),
(909, '252610496', 'KAILA JUSTINE FAWWAZ', '$2y$10$mbeWukp07Ao.BqLCldJP4.TwwpzbrWc09/6Fy6O4XktrigCSDCm16', 18, 1, '2026-08-12 09:59:44'),
(910, '252610497', 'KEISHA NUR BAYANTI', '$2y$10$hBfz8pHv9l9sMybaoU8ZT.hTiaxycXeajlbXsajknKVyoScQAOylO', 21, 1, '2026-08-12 09:59:44'),
(911, '252610498', 'LUCKY ANANDA SAPUTRA', '$2y$10$6DoEeydfs54pmZ2dGPCvkuee33l4EPZJ756Sr/iI3fNe9ZI.phm4S', 26, 1, '2026-08-12 09:59:44'),
(912, '252610499', 'M SALMAN', '$2y$10$9.FnV.acuskDHL1Uyi6zZOLLJvdlaQerI5lc2/swrVpy8mwNwFmki', 17, 1, '2026-08-12 09:59:44'),
(913, '252610500', 'MOCHAMMAD SATRIA RAHMAT JANUAR', '$2y$10$rqlu1DWKmOP/Ln9lQrRcROGZQTeqOH68W5kFY7QTVgQICoQepvdSW', 18, 1, '2026-08-12 09:59:44'),
(914, '252610501', 'MUHAMAD RAFKA NURAFLAH', '$2y$10$F9ngv5dHIc.iWF7d7q9D4u7ZCPL44ToOwCAphfa9hxAVvi4WRm3uG', 20, 1, '2026-08-12 09:59:44'),
(915, '252610502', 'MUHAMAD SURYA SYAPUTRA', '$2y$10$4aro6wAc1uyNXAts2XLTBuOZJug26ab2CFMOLq0TUqdBr8lxK8yYG', 26, 1, '2026-08-12 09:59:44'),
(916, '252610503', 'MUHAMMAD AHNAF NURRAHMAN', '$2y$10$7OFA6VVpPL55mzA.OZQDauQNyGZlyKcg8NA03lhIXYiwTXZASQamW', 25, 1, '2026-08-12 09:59:44'),
(917, '252610504', 'MUHAMMAD MULTAZAM SHOFAR', '$2y$10$pLEkZ1E8kd5xcLfh3wIxfe10X6NM/ovzXzzS3ncpObkjcJPQzuGfK', 19, 1, '2026-08-12 09:59:44'),
(918, '252610505', 'MUHAMMAD RIZKY PRASTYA', '$2y$10$sWcMRtb0qZVroZoz4ujp2uXe.0.rSBKvlRNaQV.QOdg9FG1LOIW5O', 21, 1, '2026-08-12 09:59:44'),
(919, '252610506', 'MUTIARA LESTARI', '$2y$10$MenXF61tVU2ytNGULaAKIu9zclE8QiHEGrcLHDRSlH585724.DRQe', 22, 1, '2026-08-12 09:59:44'),
(920, '252610507', 'NABILA MEYJULLIANI', '$2y$10$5syzAZmSRKeqPTV6VAoqoOEsMGiGvQUeje5zPuvNj8XbZWFyii3Cu', 16, 1, '2026-08-12 09:59:44'),
(921, '252610508', 'NANDA LESTARI', '$2y$10$wX2w2C469.IUKg7j8esy2edacmblfDmFc9OozdqbzPMlgOBlnL0NS', 23, 1, '2026-08-12 09:59:44'),
(922, '252610509', 'NAYLA KHADITZ HERMAWANTY', '$2y$10$PtoLQx8xnc9dNCLFEuBTceUxtbYvHeplcaOQLWZq5A38FRuiQaohu', 19, 1, '2026-08-12 09:59:44'),
(923, '252610510', 'OKTARINA RAHMA GUTOMO', '$2y$10$ePymjBnLcgXphoTLVr4nC.A5LTPIP.gAmznnSy5CKTEoEzsjy3mvS', 20, 1, '2026-08-12 09:59:44'),
(924, '252610511', 'PUTRI CAHYATI', '$2y$10$hvos8YiQswmCxna.SDs8cedTNs7L87UlFnmc/eEHcY8piv82oR0W.', 20, 1, '2026-08-12 09:59:44'),
(925, '252610512', 'QUINSHA ALMIRA SOFIAN', '$2y$10$IFUpqSqJwmERee1VxazpwOuk8jmzXgJH1Q5bxcjAm34ISGxri/vcK', 22, 1, '2026-08-12 09:59:44'),
(926, '252610513', 'RADIKA', '$2y$10$voK1wq/AAMewF22NSaqS9O9jarLkSuBznarQemWbTJk6XJvh19z4e', 15, 1, '2026-08-12 09:59:44'),
(927, '252610514', 'RAFKA MUHAMMAD ZHAFIR', '$2y$10$2PY.Ezkj7.I3ixFNwTiX.e9q..BkKi1kVOTwu5iHepSKX5aGpkW/i', 20, 1, '2026-08-12 09:59:44'),
(928, '252610515', 'RAHAYU ANGGRAENI', '$2y$10$a0Ukchgi6QY0GKDEqLBt5eSm0FYDODrWZyoeRtBCZu6EN2eAYqGOq', 17, 1, '2026-08-12 09:59:44'),
(929, '252610516', 'RAMADHANTI SUGANDI', '$2y$10$9IhMcbFwU8xIV00VxiUxGuXjpYFlt4FVIsG1ttjA9k5PTf11EjBa2', 21, 1, '2026-08-12 09:59:44'),
(930, '252610517', 'RAYSHA AZZAHRA', '$2y$10$xMkpG5hB53RRQMMZ8x5QFORRZiRRyB99nRO6cGtl0kK6x3UOe0J5C', 24, 1, '2026-08-12 09:59:44'),
(931, '252610518', 'REVALINA DWI JULIANI', '$2y$10$tQ1WdAGudC7xWyghf7a7KeOZqNK08eNl6t.HhWXUhodOzdaCsWTEa', 25, 1, '2026-08-12 09:59:44'),
(932, '252610519', 'RUBANI NURAHMAN', '$2y$10$eC5YhiY7WByCyHMy7pCouudCKFF54p1gDGwy0mIPnfw/IhqvznYha', 18, 1, '2026-08-12 09:59:44'),
(933, '252610520', 'SELLA HADIJAH', '$2y$10$/fNgOXNop907ALjEZWeetOsikNSRMlp1gncpppukk0LjvTSGsgQs2', 15, 1, '2026-08-12 09:59:44'),
(934, '252610521', 'SHIFA NURAENI', '$2y$10$qSZIWT5DWNIjFhh3M3Ff9Oes36zDgD8zNQyxhRUgvpaNHWBonK9dC', 24, 1, '2026-08-12 09:59:44'),
(935, '252610522', 'SINTA AGUSTINA', '$2y$10$qgNe6u8djuANJl0Xycdueu8cesi2BH7ufloizyQVCqCpNalymF4hS', 16, 1, '2026-08-12 09:59:44'),
(936, '252610523', 'SITI NUR AIDA', '$2y$10$X4NhX0UIG6O1yW8zeV9ZeuBcch/kHnLP/Jd8DJRokGfQwMj59Gfcy', 15, 1, '2026-08-12 09:59:44'),
(937, '252610524', 'SYERINA ASIFA NAZRILA', '$2y$10$R18WfYT8ULkB.tUxkyOx7OFwtFuStmh.4Qf9HaXW6HyZ1XuaJrqru', 24, 1, '2026-08-12 09:59:44'),
(938, '252610525', 'TYA RAHAYU', '$2y$10$K9Y9ZNgcZEQNkDG3piHChOtCnBTdjgzEZk5Kz7HyNU4OIeHvTSZQa', 17, 1, '2026-08-12 09:59:44'),
(939, '252610526', 'ZACKY AGUSTIN', '$2y$10$i4xNAaEi0.SS7MlQepFVh.7AuRooY2t2FSI9YPokEtlo/MZhf0pQ.', 21, 1, '2026-08-12 09:59:44'),
(940, '252610527', 'ZIHAN ZULFAA TAUFITRI', '$2y$10$i9kwLRmmBKVJ9im7YWt3s.n8fP9wdbkwEm5MSigZRYbDpDfyhWgKC', 19, 1, '2026-08-12 09:59:44'),
(941, '252610528', 'ZIYAND RAHMAT HIDAYAT', '$2y$10$8ySXCcs3tpfgRrxeTBeTl.0Y7xFMcr6FkNufOWCmkt2T370xHul5i', 15, 1, '2026-08-12 09:59:44'),
(942, '252610529', 'AILSA MIRAJ DALILAH PUTRINA KURNIA', '$2y$10$R3ZfaAkW4Qb.YlrkhegzfeIbsm8Ikk23QuqeVEpHfA5fVPmW/BaXe', 17, 1, '2026-08-12 09:59:44'),
(943, '252610530', 'AISRAYKA TIFFANY NAZIRA', '$2y$10$dBh2DvovTUAUE0mIC/QP2.b5WOWGoXMY7gkSqlY4eGF3hgeKVEzWa', 15, 1, '2026-08-12 09:59:44'),
(944, '252610531', 'ALEXANDRIA RAFAEL SINAGA', '$2y$10$6qghzFiMs/K9RAhQDtvJHuW9Bqin4chNsqlth5DzuKykgLuTId9z.', 18, 1, '2026-08-12 09:59:44'),
(945, '252610532', 'ALFAN ALMUNAWIR', '$2y$10$da2JiDCtnFr2X4dl5.SPse7fJVne.A3oQ9OgeXisjx8xUvNa3u0xW', 21, 1, '2026-08-12 09:59:44'),
(946, '252610533', 'AMY PUTRI ROSANA', '$2y$10$Z/TwlaYN7hEm.gt/XqpncOr2uFRXroMCMEvNkpyV9d11RTGBCFUXm', 19, 1, '2026-08-12 09:59:44'),
(947, '252610534', 'ASHILA MEY SALSABILA', '$2y$10$/bfkr5JrS/I7BsOwM.rnpOBFfHAjbTi.5YqYJIDMYW/PXzgX1BmdW', 25, 1, '2026-08-12 09:59:44'),
(948, '252610535', 'AURA ARUM RAMADHANI', '$2y$10$myjnmzy3u/Ixz9a./8YIQeNNyLcWFN3blEvT6thp8L9qeySknpkUy', 22, 1, '2026-08-12 09:59:44'),
(949, '252610536', 'AZAM ADZIKRI', '$2y$10$1OqHQQIEzokiJjZPJAW2aO7HlQVn1Jyyc5kcsKJw7C8BkB81cTaui', 26, 1, '2026-08-12 09:59:44'),
(950, '252610537', 'CAROLINE', '$2y$10$L9I.rVYToTxqcxwLL/D16uU2lISglv3jdjF0f9QzGjLGdHI63MCFi', 23, 1, '2026-08-12 09:59:44'),
(951, '252610538', 'CHITRA DEWI PARAMITA', '$2y$10$oBWcylhBdSqCnQtyJ1X86uXzAbxtpwaM6w/0QTSX53zuWm5ej3/2W', 20, 1, '2026-08-12 09:59:44'),
(952, '252610539', 'DARRELL ALYYA RAMADHANI', '$2y$10$mL70o8TtAYWAMd1/VDmNVOExCOLVZXGCQNX79ETH1B4NyMMrqblUC', 19, 1, '2026-08-12 09:59:44'),
(953, '252610540', 'FAHRA FAUZIYAH', '$2y$10$UVh1SBk0pLN6BCJNq6ISveMBbODPOjjTLQw1ZZ5iLCYPDllWb1nom', 16, 1, '2026-08-12 09:59:44'),
(954, '252610541', 'FATHIA SALMA AR-RODHU', '$2y$10$PPG9Tz1wD3w1j5nGurXDsesrN.lsLkiKAQqNDqdo04aLG997hdRDm', 26, 1, '2026-08-12 09:59:44'),
(955, '252610542', 'FIKRYAN AJI SATRIA', '$2y$10$qOlFzgEjCTeMisTPvlAp/ecxnDQkuYW8dd.kEYAK/P16kcLhwgo/6', 22, 1, '2026-08-12 09:59:44'),
(956, '252610543', 'FIRMAN AIDIL FEBRIYANA', '$2y$10$io9br.00OoAmQaQGnSoaU.incReSBCrJSotbxwkktIPXydzEvGP9u', 22, 1, '2026-08-12 09:59:44'),
(957, '252610544', 'GILANG RAMADAN', '$2y$10$.MCIODgUwe0cFcyVuQPd.OuKr2ekmLdNisZVl7WOuPaNmSQtmUar2', 26, 1, '2026-08-12 09:59:44'),
(958, '252610545', 'ICHA DESWITA', '$2y$10$jRCPixWp3wOTUij2ZBTZneMq4Va2Msq9Zkydus4bksOSjmRr4UPKm', 23, 1, '2026-08-12 09:59:44'),
(959, '252610546', 'KAMELIA ANGGRAENI', '$2y$10$cNyK.bde6dS6byCZkXml8OpsV0hH1GBNdBX5/d0wGFz9R2jZ7nuQ2', 21, 1, '2026-08-12 09:59:44'),
(960, '252610548', 'KHAYLA KAYYASAH', '$2y$10$yGay7C1C0OtYEI/7a8Brp.Cy7Q76nuoFHhfOC4ZAT/fSoiaVG8eXC', 22, 1, '2026-08-12 09:59:44'),
(961, '252610549', 'LUCKY TRIPUTRA', '$2y$10$CPj1ypVhwGSTB4ZEt6IcT.umztqXLu0JDruL8jZlOlluWoU6WG9Xi', 15, 1, '2026-08-12 09:59:44'),
(962, '252610550', 'M. DWI SATRIYO SUDRAJAT', '$2y$10$bOrTp9jhM6r7QG2QcJ2O8eqgk0ddUYLhLhEjHU642OVsrP8Sq85vK', 23, 1, '2026-08-12 09:59:44'),
(963, '252610551', 'MIKHA SISILIA MARBUN', '$2y$10$ZlOqMAgDEdBsT2rls5hMzeiHOg0MS08rHhiQxMMBV6KrNTzU52Qqi', 24, 1, '2026-08-12 09:59:44'),
(964, '252610552', 'MUHAMAD FAHRI RIZWAN', '$2y$10$mlIbauVvLhnrFl6ytLv42.rjawXXxxOWLTdsSp1HORysBcGzPTr5y', 16, 1, '2026-08-12 09:59:44'),
(965, '252610553', 'MUHAMMAD ARDIANSYAH', '$2y$10$zO9zzKAIz8UTreHSvbNWue1dhVgbgLhLbktUcwRe3pHJOAQVAUWRe', 21, 1, '2026-08-12 09:59:44'),
(966, '252610554', 'MUHAMMAD ARYA PUTRA LAKSONO', '$2y$10$Y1RsCb97SZHLngZX6wJ/cOTJ2uD4T2Wjp11J1936xFH0sNpv770Qq', 16, 1, '2026-08-12 09:59:44'),
(967, '252610555', 'MUHAMMAD DENIS', '$2y$10$DYjPeA/hCcTKwYWJa/Ua7uxvL4ux89WSgXRtAlqXAA.CyFj1BHmm6', 15, 1, '2026-08-12 09:59:44'),
(968, '252610556', 'MUHAMMAD RASYID HIDAYATULLOH', '$2y$10$byMwVNMwEszfT/OC5n.pleBcbcDYYLAFu3vFCZsZh26bjIeOuIDcC', 17, 1, '2026-08-12 09:59:44'),
(969, '252610557', 'MUHAMMAD ZAQI AKBAR', '$2y$10$tXDqRFHwnCHtcmJjyZWKNuZYoCjuwZOxFMLu1qPvHFrNHrqeGR7ca', 18, 1, '2026-08-12 09:59:44'),
(970, '252610558', 'NABILA RAHMAWATI', '$2y$10$KP5kF2Gmmy89WqSBE1FJt.r.kAw8orO.hHcx/vXA/nHr/pcIn42ye', 23, 1, '2026-08-12 09:59:44'),
(971, '252610559', 'NADYA KAMILA WIJAYANTI', '$2y$10$oTnGhu8MT1CpWxtE1bYebOoChObTVzM6ipf79O0c7Xesh2ovn2rUy', 25, 1, '2026-08-12 09:59:44'),
(972, '252610560', 'NAYLA MUTHI SUBARKAH', '$2y$10$4pkujDUVDHVFWQ88V4K5F..J.xqq5ZMmOeDmAOZMwtYAl5FQuCeXO', 16, 1, '2026-08-12 09:59:44'),
(973, '252610561', 'PAZIA NERISSA ARVIANA', '$2y$10$5l.xinFNU0IvNEcDhv3uLeWr43GyJcopGD1GjVsmjlLp.jK8FBZjO', 20, 1, '2026-08-12 09:59:44'),
(974, '252610562', 'PUTRI NAFEESA FAUZIYA', '$2y$10$OrRAvcnQvX0RukRDe32EquOmZ4D/RHk3FTmMbwBtF5NWDv1sARNJu', 25, 1, '2026-08-12 09:59:44'),
(975, '252610563', 'QUEENSCHA KYNAN ZEIDA NURIKE', '$2y$10$qkM5hVNeGuN8ToniSC5nbeKZob464x/OgePA.ukD5v1ULDR/RrJ2C', 18, 1, '2026-08-12 09:59:44'),
(976, '252610564', 'RADIT PRATAMA IRAWAN', '$2y$10$E0f8O0njxh7N54KM1MhRZ.NDJAdUbGazaiC.xZUVk76D2DVIX1XlO', 19, 1, '2026-08-12 09:59:44'),
(977, '252610565', 'RAIHAN HAFIZ NUR ROCHMAN', '$2y$10$Bpe6/uQZXcDRpBgLgesudOe3OPiW2xlZpNGZfYAOQ5GxMbmNI5kKG', 17, 1, '2026-08-12 09:59:44'),
(978, '252610566', 'RAYKA KHANSA\'A YASNISA', '$2y$10$g6GhlTsMh0qWYzfazpS6tutCOUlSV2ars1k5h1GdqhFucdSrYASJ2', 26, 1, '2026-08-12 09:59:44'),
(979, '252610567', 'REVALIA PUTRI PERMATA', '$2y$10$1w7aGj.NXs2WSblpqkApg.lNqzM7.2OXy4T2hrynJKn6EIFpYfZEy', 20, 1, '2026-08-12 09:59:44'),
(980, '252610568', 'RIANTI AL JAELANI', '$2y$10$OZBh2kiR0AMrMHKGrpjvReYnpm3mEC209FznsOJ2SPvjabyQr6rza', 24, 1, '2026-08-12 09:59:44'),
(981, '252610569', 'SAMMY ANANDA OKTAVIAN', '$2y$10$etvGi/nu.K6wHkc2LXpK/Oyrn5OIiotRJ/HV0lNiOoQTcAYyHHwda', 24, 1, '2026-08-12 09:59:44'),
(982, '252610570', 'SHAQINA ARIANI ORYZA YULFAN', '$2y$10$jvrFUJHjK9v6sQ5udzwxhO8Ftdrg8Q8YLN0rCnlwt0/72LXGpnFjK', 25, 1, '2026-08-12 09:59:44'),
(983, '252610571', 'SIFA NUR APIPAH', '$2y$10$2nowGwtmdnG4KSNSzpAyveQVPf.bjrqFxoebJF.WIQjXWfkLe1/Jy', 15, 1, '2026-08-12 09:59:44'),
(984, '252610572', 'SITI AYRA NUR RAMADHANY', '$2y$10$PQK5edHSyHBrETJmyZRz0eAaeafIxz1OV1tS/kvT1eo0MPOLSiL1i', 20, 1, '2026-08-12 09:59:44'),
(985, '252610573', 'ZASKIA DWI LESTARI', '$2y$10$jcoC/rzHI00QgDZY81mBfucAfquVdhVbllVIm9Fc.RmiW7HxO556m', 18, 1, '2026-08-12 09:59:44'),
(986, '252611429', 'RIKA FITRIANY', '$2y$10$vF1S6XGa0TyGOXZFr62gNOz3vFowrD1/GE6OLwNVO4hi6TBqvBLVW', 7, 1, '2026-08-12 09:59:44'),
(987, '252611430', 'VIONA MUTIARA KURNIADI', '$2y$10$mQHFGaSNWs0PBQWXxyT.JOpmD6mlSgv/gqDJ9BkfMogEdJue5gyWu', 4, 1, '2026-08-12 09:59:44'),
(988, '252611431', 'GALANG RAHARJA ADIDJAJA', '$2y$10$URX8yj1bZqKU32vWheZ6beZjQ3mJop/zxDQY2eZVyjssMeIr.CKgW', 4, 1, '2026-08-12 09:59:44'),
(989, '252611432', 'ARGHI KEZHA PUTRA', '$2y$10$PKu/LNjUE7f3i4fvJnf1D.sd6PS2.3JDNBKo4suMmjyXGbLy1LYUC', 13, 1, '2026-08-12 09:59:44'),
(990, '252611433', 'DIMAS PUTRA ANDRIAWAN', '$2y$10$JgAU4yNejZmOUyRTuOG.B.9awRjdnrHGQNULxSyjCXZm6uZR3JdpW', 13, 1, '2026-08-12 09:59:44'),
(991, '252611434', 'DIVA KAYLACAHYA ANTASARIADI', '$2y$10$cRrKvuoDgd.mYeZzSTKHyOXzCTk/6Y1smmhRui4e4IFvrNcmb80KS', 11, 1, '2026-08-12 09:59:44'),
(992, '252611435', 'GHEYSAR GHALY ZHAFRAN GARMANNA', '$2y$10$gXHQ//m3CWmiQIaqnO6poOrHk4hB3sWnNN6Co6Ni6x3hwp0uPRU3K', 11, 1, '2026-08-12 09:59:44'),
(993, '252611436', 'MUHAMMAD RAIHAN RAMADHANI', '$2y$10$WctzVZbP39BvPSBzlHtEKegcQmXRzGpRHH6./LPnXhWQiJtB5bzve', 11, 1, '2026-08-12 09:59:44'),
(994, '252611575', 'IVAN DECKA', '$2y$10$sk42SZ4diV.5ISNdoxlhpeFfy7o24QzuOJIBnAjHJbUsDGkF1uPMu', 19, 1, '2026-08-12 09:59:44'),
(995, '262710001', 'ABI RAMADANI PUTRA', '$2y$10$PgH64oeNH8OxlW7Qzy4PDuqdNDKa0.T0i7lmdA92BtMHSofRCPMpi', 3, 1, '2026-08-12 09:59:44'),
(996, '262710002', 'ADAM MALIKH', '$2y$10$TUvkihWKmqs97ecQ8zSfGecFSo3hC5wVFkF7vSfacW6Q6zMf5d2Cy', 3, 1, '2026-08-12 09:59:44'),
(997, '262710003', 'ADZRAA KHAIRUNNISA NAZIHAH', '$2y$10$vhFJ5Fp4IibpXdRPcB9o1.9BE7TCIET.popv8VLU957URDYONxoB.', 3, 1, '2026-08-12 09:59:44'),
(998, '262710004', 'ALVIN PUTRA RADITYA', '$2y$10$Ys766.VR4vGCUSCU0RCttewikKpVoO153S9B/HPfQnZGX5DM4jNEa', 3, 1, '2026-08-12 09:59:44'),
(999, '262710005', 'AMELIA SALSABILA', '$2y$10$WRujtW/OvKTyqImtlpXh4OtB9vx6jVGJvD32gmnfN0DuwEaxA7kPO', 3, 1, '2026-08-12 09:59:44'),
(1000, '262710006', 'ANNISA ALIFYANI', '$2y$10$JTTkB04pO3Kjqc9ALCdcYOvAih7m3kCZ248pX9dB5wGI/Hc5Q/U7O', 3, 1, '2026-08-12 09:59:44'),
(1001, '262710007', 'ARANA KAFFA ALDIANO B', '$2y$10$IQaJJ8jFzmYoPKqeUWgYUe8/90i.wDe39Cagz6Vo/eqWBUJCUnaRq', 3, 1, '2026-08-12 09:59:44'),
(1002, '262710008', 'ARYA LUTFIANA', '$2y$10$Gs6VCOk./c991JYB54PMN.VGe3XY3h/RLnYPtyurzzpqs..EMnyX6', 3, 1, '2026-08-12 09:59:44'),
(1003, '262710009', 'BAIQ ATHALIYA SARAH', '$2y$10$jLIrIIM7TMDWfdSqehrCzeo..EGnDtdCWoAb.LuATliEQO4fxN3um', 3, 1, '2026-08-12 09:59:44'),
(1004, '262710010', 'CARISSA MAHARANI WIBOWO', '$2y$10$OHDUq9Usdcb3YhbGzOPANOUYtn8jnGRu5J2y8kBXVcUHIRKqhdW5i', 3, 1, '2026-08-12 09:59:44'),
(1005, '262710011', 'DINA NURULHABIBAH', '$2y$10$OvIQmfPGOesQHB3jJe6z3eJb1IQ0zwOc.///pXTBJAQ/3GBBa88PG', 3, 1, '2026-08-12 09:59:44'),
(1006, '262710012', 'EREN ALFAIZEN', '$2y$10$1X0v8Yrn6jWXO3snOjCEEuPLmcexuqYeXichYw8N5Jj5uA8MRsOZq', 3, 1, '2026-08-12 09:59:44'),
(1007, '262710013', 'FARREL ALFARABI', '$2y$10$AZJi3aM.3fikTl7a.OsYceystiF6gdmYtayVdiHWiAT0aHqgDlN.q', 3, 1, '2026-08-12 09:59:44'),
(1008, '262710014', 'FRASTA DEWI KURNIA', '$2y$10$pgj0opWyjxOYlXUpH69SxO5O5ABN8YHI6yqMy/Hb.buWhq22yFs5a', 3, 1, '2026-08-12 09:59:44'),
(1009, '262710015', 'GAFAR MUNIF MUHAMMAD', '$2y$10$f5xooxjaIvcOucKqHl.NLOEVScaHt0g1slqr790YApqRDrYX4MP.q', 3, 1, '2026-08-12 09:59:44'),
(1010, '262710016', 'GEISHA NUR ANNISA', '$2y$10$D977dNC9n9OxfjdYJkhhCOJBupBRtKXWjW4KIuPfHqMboOJ6GcDgK', 3, 1, '2026-08-12 09:59:44'),
(1011, '262710017', 'HANANG WAHYU GATHOT SETIAWAN', '$2y$10$DFqyiMC5i846CQbt8tIUJ.48hr.kG1H5.Q8tjYizQo1NNNlSxOsg6', 3, 1, '2026-08-12 09:59:44'),
(1012, '262710018', 'JULIA NURWAHYUNI', '$2y$10$FyZjgn/K9mNfk2uzsS2/wuYbg6kKGcaQonPZfjNXkyNkjnXJxH4oy', 3, 1, '2026-08-12 09:59:44'),
(1013, '262710019', 'KEYLLA DWI ANGGRAENI', '$2y$10$5ygXyaRdNH3B4Z64KI.tZOg8tOrDqCIGYUfk0ODHUJmFUiUVbb2dK', 3, 1, '2026-08-12 09:59:44'),
(1014, '262710020', 'KHADAFA SIGIT AL GHIFARY', '$2y$10$24Xjplbjxpc059RHKC293.x0ypucKrXZCSetoYkk8HQCbCg3pJnIu', 3, 1, '2026-08-12 09:59:44'),
(1015, '262710021', 'KHENSYA AULIA RAHMAN', '$2y$10$8Lr3tGkkjtTstbQZIaW9Uefsiopjjuow2N42.J.pENAGR2TN9w7J6', 3, 1, '2026-08-12 09:59:44'),
(1016, '262710022', 'MARIA MAGDALENA SIAGIAN', '$2y$10$wwR5q0yyiOK3p5LK0ShxH.0eAYQpvy.mxklYk5LrtSUOfHWKk6G2u', 3, 1, '2026-08-12 09:59:44'),
(1017, '262710023', 'MOCHAMMAD FAISAL NUGRAHA', '$2y$10$Bx0DpiGkF5zpzjqdUpb2/.qxBckfruvRPneS4QoCPBuLsladq3W3m', 3, 1, '2026-08-12 09:59:44'),
(1018, '262710024', 'MUHAMAD IRDAN JANUAR', '$2y$10$s1LNucP8Ck3Xre2067PzledD8xt0fk3Sdov2w.6tiQdrH2ja3NKGW', 3, 1, '2026-08-12 09:59:44'),
(1019, '262710025', 'MUHAMAD RIDWAN MULYANA', '$2y$10$7cA0CQ8siAuEEcgM1yNQt.CwpcpDIpszx8oVkiUnlNjFQYbh4TDja', 3, 1, '2026-08-12 09:59:44'),
(1020, '262710026', 'MUHAMMAD FADHIL BADRANI', '$2y$10$tEyziQaIHYzgoFSBahomneU2R/3r/BCk3hHttcAnoAQzKHAChiLUu', 3, 1, '2026-08-12 09:59:44'),
(1021, '262710027', 'MUHAMMAD FADHLAN AZHAAR FERDIANA', '$2y$10$MjohL9BSQ8ofR6/H/YWaGeAYuj1RJf.vI9/FHkhhBmcJTHb3t1fu.', 3, 1, '2026-08-12 09:59:44'),
(1022, '262710028', 'MUHAMMAD RAFA RIZQILLAHI PRATAMA', '$2y$10$hGog.7O8RnD4/1O7lv0Iyetx.r.gdtP7duMXrhIyoNUTubvJkt4rK', 3, 1, '2026-08-12 09:59:44'),
(1023, '262710029', 'NABIL FEBRIAN SAPUTRA', '$2y$10$SQhoTmyLTVVPbDNOIxRU6uczwNlaCUK9Y4viwjFAWEy5jiVW78CFO', 3, 1, '2026-08-12 09:59:44'),
(1024, '262710030', 'NADHIRA AZYAN RIZKYA', '$2y$10$.dxitZ43pgvZeqbDQr2YRuK2OIrfUG7LFWkttRVjkAqZHVlOq/SHS', 3, 1, '2026-08-12 09:59:44'),
(1025, '262710031', 'NAYLA KARIMATUS SALWA', '$2y$10$EPC/d0GxL20mEeY.KPr2eO2mBuUxSzUiaL5.DEXIF7mXPeut/mE/a', 3, 1, '2026-08-12 09:59:44'),
(1026, '262710032', 'NENG PUTRI DAMAYANTI', '$2y$10$9ATYZ6ZG7tNY88vFW74Lt.qv6BmK8QAB0PM/fKUNvJSV9YYJFLw.q', 3, 1, '2026-08-12 09:59:44'),
(1027, '262710033', 'NURUL TIARA RAMADANI', '$2y$10$NYVpjY2twsVAcnaVVaTiDeAJe/nkS93hjQ5UsrSOkx1xnBC6adZC.', 3, 1, '2026-08-12 09:59:44'),
(1028, '262710034', 'PRANATA GENTA MAHESWARA', '$2y$10$l039Tg5ZMZKjiDxeFZsozuqLz.j68.nFh6zqfkZhytalfezv.TtZS', 3, 1, '2026-08-12 09:59:44'),
(1029, '262710035', 'PRIYA OKTAVIA AZHAR', '$2y$10$tUDtlrAY5FN6KI8vU9u00eahjzyFpA/jgdwN68WPAt/yk0OiGYvh2', 3, 1, '2026-08-12 09:59:44'),
(1030, '262710036', 'RIDWAN RAMADHAN', '$2y$10$XV3vi2J6Cje09geajhKXdeVbnslz9HGWGLy.HibLX/7jU0oeHa4cy', 3, 1, '2026-08-12 09:59:44'),
(1031, '262710037', 'RIFA ALPIAH ZAHRA', '$2y$10$E6MZoUYzWWaJfAUPJIlfkeaD6YnfdLmRCmfmeLqeSv35Bpxm8xtTG', 3, 1, '2026-08-12 09:59:44'),
(1032, '262710038', 'RIO RIVALDI', '$2y$10$k8PdWueuSa/r4sdVskRaMuZa/V5vHXMUgyt/BzvxtKo4If5ZEpsLO', 3, 1, '2026-08-12 09:59:44'),
(1033, '262710039', 'RISNA RAHMADHANI', '$2y$10$24dKyhNdfeB6ObjBahQ/Zex/rtNAs2iHdZFiuCDORrzQ5RkacpzWC', 3, 1, '2026-08-12 09:59:44'),
(1034, '262710040', 'SHAFANA RIZKYA MEYRA', '$2y$10$DNbjcOJUQ/Uk7dyYvIG/7O51h4FUaFN56UuaYsTe9yBXFhVctVERG', 3, 1, '2026-08-12 09:59:44'),
(1035, '262710041', 'SITI AYU KANIA', '$2y$10$vu4jtEKVoFGJCv4aLCXDq.Rpdxj8U32MGT2FqtUtgz7mm1ytg0VG6', 3, 1, '2026-08-12 09:59:44'),
(1036, '262710042', 'SYAFIRA MEGANANDA OKTAVIANI', '$2y$10$5dzUJb0ahgTeqdtZDhIuOOXbMmT1vzqR8ZZOWhh6HADUTj4x4jHDK', 3, 1, '2026-08-12 09:59:44'),
(1037, '262710043', 'SYIFA NUR AQILA', '$2y$10$cyYZouWoE9Q8l8rMJ7eFJu/9Lg4qaz6Vy7IRXWvqqHxpjUn.38sgm', 3, 1, '2026-08-12 09:59:44'),
(1038, '262710044', 'ZAHIRA HAZNA REISYA', '$2y$10$k4xUi2ghfGjKgrsQ/p2a7.VRlH15LDLlwAqdx9JNIIE8AYPldSOQS', 3, 1, '2026-08-12 09:59:44'),
(1039, '262710045', 'ZIVARA PUTRI LIONI', '$2y$10$LiIcC42CiRi2aOP6kNM4Teqlx6cLoRe1Dvv/c8lioOrU7iuHHr7iG', 3, 1, '2026-08-12 09:59:44'),
(1040, '262710046', 'ZLATAN ANDARU WENA', '$2y$10$LBstsKB/n3F/Z.RwIihKNugz6we.mEvxCd7RzZ.Ah0VvOCOeRH9dO', 3, 1, '2026-08-12 09:59:44'),
(1041, '262710047', 'ADILA RAIYA PUTRI', '$2y$10$XSpyVGSBFyKVjgz48iecFesbK0mxv7gwE5WNAvuUpr7kFNRaY5cpu', 27, 1, '2026-08-12 09:59:44'),
(1042, '262710048', 'ADLI ZULFADLI FALAH', '$2y$10$l1ko6Zh1nAI64YFLgxEU1ObsUyUjCgdMhzJhclMCP9pDATl0zoFsq', 27, 1, '2026-08-12 09:59:44'),
(1043, '262710049', 'AGAM PRATAMA', '$2y$10$bV0twedywo1kKo.k9uBuGeUiy6NAm.m99tN34.SFv.U.j.XJ30PVa', 27, 1, '2026-08-12 09:59:44'),
(1044, '262710050', 'AISHA LUTHFIA AZZAHRA', '$2y$10$lAN1TXY9gHVHovlU2JVUMeRI4ZsC9PaO20hMFXI430d.A3w7Qq/MG', 27, 1, '2026-08-12 09:59:44'),
(1045, '262710051', 'ALVINNO DWI PUTRA', '$2y$10$4l3YMU8vAWADBxESfpKLa.6i0cbW1sydztNs5EwSGRsrWAErfhCDO', 27, 1, '2026-08-12 09:59:44'),
(1046, '262710052', 'ANDARA DWI SEPTIANA', '$2y$10$9nnKRejSbYC66/W7DvetTep/sG4GKUqhznmxFSi/ws4WQq9VX2dUO', 27, 1, '2026-08-12 09:59:44'),
(1047, '262710053', 'APRILIANTI AINUN LATIFAH', '$2y$10$uB.cpa1F1KKlRH6zU4M51uPgaA5vE8/z.Mdio2.QdFLO4cAiTq2de', 27, 1, '2026-08-12 09:59:44'),
(1048, '262710054', 'ARFAN PUTRA NUGROHO', '$2y$10$hWaIavtnUJT8dXAwC/uAz.GyEsFTJ1zq0.po5ByD5rmhNEZVldUOC', 27, 1, '2026-08-12 09:59:44'),
(1049, '262710055', 'ARYA WIJAYA DWI PUTRA', '$2y$10$8QW9baWj3XTW6hfM0tm3H.39oiyqrIGoNv1hM3IVEmezVAdVy2HEe', 27, 1, '2026-08-12 09:59:44'),
(1050, '262710056', 'BILAL ALIKA NUR FAQIH IRAWAN', '$2y$10$30V9EwDza/D0Nqli76wDkud3/IQLjoUZvi3/TJ5B7YD.nsgmVwcc6', 27, 1, '2026-08-12 09:59:44'),
(1051, '262710057', 'CAYLA MAHARANI', '$2y$10$t0m.HUvO5RIxY.zCi6TmVeTmWfrIbbrk/yLubkh/kP.zWqEubKjV.', 27, 1, '2026-08-12 09:59:44'),
(1052, '262710058', 'CINTA NOVIANTI NUR ARIFIN', '$2y$10$IGyaoK0.fkrbzlq1GOl3xebCb6M178AiJR7BqhINM9pkfCZPmsJjS', 27, 1, '2026-08-12 09:59:44'),
(1053, '262710059', 'DINDA NOVI ARYANTI', '$2y$10$UKPCiLmDg/XbA8xHRbyxPevCUkkQG.M4tBVDBE2taErMP/0sHg0H.', 27, 1, '2026-08-12 09:59:44'),
(1054, '262710060', 'FA`AL HASAM ISMAM', '$2y$10$yYiwIaX5XeWVxQlFmNXs/.tkgLqMMqOxE1fS5WwO1vKXb.P8Xb8.y', 27, 1, '2026-08-12 09:59:44'),
(1055, '262710061', 'FENNY ASMARANI', '$2y$10$2G014OTupC8g9RNGZ2WvC.BokqZ1EkPTnlWE3Msob/NHpWIQVRIOa', 27, 1, '2026-08-12 09:59:44'),
(1056, '262710062', 'GABRIELLA STEVANI SITEPU', '$2y$10$71b845MI99VavkirZkN8Rem8.m6YBbNiWfHdvEOjAcnQzJP4/J/4u', 27, 1, '2026-08-12 09:59:44'),
(1057, '262710063', 'GIA INSANIA NUR FADHILAH', '$2y$10$iWjT7Kz3CSvMpIxK6PeXXuzmuM5VNcOwfQJAeeXCeVQTLcphQKYy2', 27, 1, '2026-08-12 09:59:44'),
(1058, '262710064', 'HILAL CIKAL AL`MALIK', '$2y$10$9get7.dAyyP0bSiZihVi1ONzvIqi1.ELzXEEgkV6ZhsAsJ2GoxViG', 27, 1, '2026-08-12 09:59:44'),
(1059, '262710065', 'JHOVAN SUPIS', '$2y$10$fCW95RaigEs8sYkUQUfev./GXMrRCv/W.ICPu9SkmBK2XKqE.Vk6q', 27, 1, '2026-08-12 09:59:44'),
(1060, '262710066', 'KANAYA AURA ANITANIA', '$2y$10$v/WZTOsuaBQHGzhpBaRWQOcqoLQrhcE4tPkmYlZCO6EHDSG/FMJg6', 27, 1, '2026-08-12 09:59:44'),
(1061, '262710067', 'KEYZHA NOOR ATTALYA PUTRI', '$2y$10$10uySXTbIjclr33/H77CpuEEx0r4cS8OBmoGlc3wQI35XNMyk5VSG', 27, 1, '2026-08-12 09:59:44'),
(1062, '262710068', 'LIANI NURJANAH', '$2y$10$pAikmwpl5PamBOnAAci6...0LYtLQvlptvao71IJEuJrOq510P5/m', 27, 1, '2026-08-12 09:59:44'),
(1063, '262710069', 'M ALVIAN NUGRAHA', '$2y$10$yc37wdKRKaZE1Ck4ElaNseQkuFlUIPfDakIdyJunIx.Fu7BkDJTTC', 27, 1, '2026-08-12 09:59:44'),
(1064, '262710070', 'MAHARDIKA LAZUARDI', '$2y$10$6Nztzzd8OOBoRvmX4vv5JO1AC3cFh4uNC1/.FJVvTEY9oq87c/wja', 27, 1, '2026-08-12 09:59:44'),
(1065, '262710071', 'MILASARI', '$2y$10$BUTZP0fDyClR9fLAMejpTuNeWspAFZMkxepSolpQkoReEK9v0H5va', 27, 1, '2026-08-12 09:59:44'),
(1066, '262710072', 'MOCHAMMAD OKTAVIAN FIRMANSYAH', '$2y$10$h56ybdr2KYt8.O.oB0FTQuIvQ9YUdyjFfKWKKDjQWQalUZJ0u1jnC', 27, 1, '2026-08-12 09:59:44'),
(1067, '262710073', 'MUHAMAD RIZKI ARYANSYAH', '$2y$10$vt2CbyIyB3WN2AZ8TGm1XO.0XCzu7YpcB2.NPndiKlWIPWJS4IIBa', 27, 1, '2026-08-12 09:59:44'),
(1068, '262710074', 'MUHAMMAD FARID ZILDIAN', '$2y$10$OFS2AwdiqvYMIMaQ6yXPX.T4MUs1xNZYYSlW9ksHsV2vWpBz479HC', 27, 1, '2026-08-12 09:59:44'),
(1069, '262710075', 'MUHAMMAD FIKRI AL GOZALI', '$2y$10$YEaGkp.8DYBQfrs/4i.sLeRuc8mmkEUUPSZyTvC1R3Q8/l7eGGdJO', 27, 1, '2026-08-12 09:59:44'),
(1070, '262710076', 'MUHAMMAD MIKAIL RACHMAWAN', '$2y$10$PsAO2YIOEfvBYmrdBhEXr.hW9A2YgzfLcqhxgtk4lbFwDJwF6o91u', 27, 1, '2026-08-12 09:59:44'),
(1071, '262710077', 'MUHAMMAD ZAKY FAJAR ABDILLAH', '$2y$10$exTaG7aujpE3YoPQbQRAr.s3p.4dy/wOwl/R9jJGLklvWKYEabx5.', 27, 1, '2026-08-12 09:59:44'),
(1072, '262710078', 'NAFIS JANITRA', '$2y$10$P/nohe3XqV/M8x8VLmpfzuVFOfbb43lPVaNFC8lW4wqEEJRLIPcKi', 27, 1, '2026-08-12 09:59:44'),
(1073, '262710079', 'NAHILAH KHAIRINA', '$2y$10$8v8ZMOvDrNGm9H7gojgOSetTpE/tpjPWP2zdTggM9gjsNSw/e0POa', 27, 1, '2026-08-12 09:59:44'),
(1074, '262710080', 'NENG SITI APIPAH NUR AINI', '$2y$10$mLawLEGCOX2PuD59Mi0UnOK7hb9ei8C9OLm9qNa.KeTSZYxQj8T2G', 27, 1, '2026-08-12 09:59:44'),
(1075, '262710081', 'NIL ALANASTA', '$2y$10$F9TSW.THpHetM1TQ3rZkWOxjKL3bPg9np5erSDBBCU9Ct30m97idm', 27, 1, '2026-08-12 09:59:44'),
(1076, '262710082', 'OCTAVIANA ANGRAENI', '$2y$10$CCa9Aypb2czxaIiEuzN1EO2Sda8vpcvUnWbfv/Cs86P7AmoPcYzmq', 27, 1, '2026-08-12 09:59:44'),
(1077, '262710083', 'RADITHYA ZHIAN ALFARIZKY', '$2y$10$/zslyCobJr5kyKRB5pjmvOTl8jajlY70VpIrOdtzguD3tsFHMyFUS', 27, 1, '2026-08-12 09:59:44'),
(1078, '262710084', 'RISA NOVALIA PUTRI', '$2y$10$Min2lGKTPQRunOa3H20ZneCj1dEF11pCqoBQWQJGC1r8dGBS1lnh2', 27, 1, '2026-08-12 09:59:44'),
(1079, '262710085', 'RIYAN JULIANA', '$2y$10$WBn835Joz0ETjf3zkSc5JOIxNgqaEgYqhYiYsYw6u3hofDso/e.i2', 27, 1, '2026-08-12 09:59:44'),
(1080, '262710086', 'RIZA RAMDANI', '$2y$10$IthF2VUc1pCmwM6jRS7BH.h4wPGHIOUDzEBc5G4zijiVAUk8HE2Da', 27, 1, '2026-08-12 09:59:44'),
(1081, '262710087', 'SABRINA KAILA MALCA', '$2y$10$au/3rBNEbciwzDVtMCwJ8Ox9wOXFPIVRv9pIRzT545xFdaNDRHzw2', 27, 1, '2026-08-12 09:59:44'),
(1082, '262710088', 'SHELVI ANGGRAENI', '$2y$10$Tv8PJf43TvbJg.nNU136IOGqh1TYvlX71ehpYxqkLRdv4F1RMzYPm', 27, 1, '2026-08-12 09:59:44'),
(1083, '262710089', 'SITI SRI MULYANI FADILAH', '$2y$10$D.ytCW0rZcyQFQKrnX09pudAYhz3OLh2.0MCWjoQOAAM4iVDw0G9G', 27, 1, '2026-08-12 09:59:44'),
(1084, '262710090', 'TIRSA NURFITRIANI', '$2y$10$rSRfNBulprmBjEZv0/tlP.KpyRpg8SDMMZTNdwZsAG/YjRpTdOXrW', 27, 1, '2026-08-12 09:59:44'),
(1085, '262710091', 'ZAHRA NAILA LAVINA', '$2y$10$iLVDZwiolZY6F4b27M3raOly2XNV.BGj10wB/KeOA.8ZfEQL0qJny', 27, 1, '2026-08-12 09:59:44'),
(1086, '262710092', 'ZASKIA GIE QUEENSHA', '$2y$10$qeTPCP8jRs1yWi13Ipt2RuiPqa0Mxqop0.aq/Ov7COfGUyQ2QpkHW', 27, 1, '2026-08-12 09:59:44'),
(1087, '262710093', 'ADRIAN PUTRA JUNIARSAH', '$2y$10$i1fWbH0Uh0gOm0s35XqY7u87YYb.Pc9HkBiJQ3Hsc6uGcPruF2uAi', 28, 1, '2026-08-12 09:59:44'),
(1088, '262710094', 'AGNINI NAILA ROHMAH', '$2y$10$dwlkVXzrAGS0tTrRuv1f7.tvmC8TWtbFl8XP/D3HgFjEAoCKjsglm', 28, 1, '2026-08-12 09:59:44'),
(1089, '262710095', 'AHMAD MAULANA', '$2y$10$H8x6HTDs8bRt74WW6bxfYOt6DbT345LxmO.iXgDUrxeqn7KmMhBLO', 28, 1, '2026-08-12 09:59:44'),
(1090, '262710096', 'ALIFA RAMADHANI SANTIKA', '$2y$10$hDZwow9OwrwNLKuSgL03bOf3GtlwEzftjpQ8bR.rPj5j8gUt9hEVG', 28, 1, '2026-08-12 09:59:44'),
(1091, '262710097', 'ANISA FITRIYANI', '$2y$10$4KIuvspBV3NmY6gRsoNKSO7jnNVpD1Ob6swboONBw0JCIt2yEXTnS', 28, 1, '2026-08-12 09:59:44'),
(1092, '262710098', 'ATHA WIDYANATHA SUTISNA', '$2y$10$8iHGCvL6vrNI8tZdUUeALuFaJal7zW7nDRP9zJzG0/TZiKbbY3ZKa', 28, 1, '2026-08-12 09:59:44'),
(1093, '262710099', 'AUDREY MUHAMMAD ELDIN', '$2y$10$T/4/nWjA1KXG4Zl9X6Jf2OL37h2ELH7hFKLDo/y8b8oCwKNsjDeW2', 28, 1, '2026-08-12 09:59:44'),
(1094, '262710100', 'AZQIA PUTRI SEPTIADI', '$2y$10$OYBi7vmoB4q1ASkNWETVfez5LhC.0ZqnHc2QQx4BiTVEXMloA9A7K', 28, 1, '2026-08-12 09:59:44'),
(1095, '262710101', 'CHANTIKA FELLICIA UMAMAH HANDOYO', '$2y$10$.NMd7Po0yEWT0K2Ye5actOSjBv2a16KRzn0u/cskWoFhw2ITK8vzi', 28, 1, '2026-08-12 09:59:44'),
(1096, '262710102', 'CLARYESTA ANDROMEDA', '$2y$10$GDrfQ6P4gh2gRc09DsD0aO2lsbj9jqScxIjuAYYEgIk7.aQ5VxGCy', 28, 1, '2026-08-12 09:59:44'),
(1097, '262710103', 'DINI ANGGRAENI', '$2y$10$mok7kut6LsC5UZ1LKggVEeD7GQBnEftb2WT8T9Rxiy/.O6wSU6LFi', 28, 1, '2026-08-12 09:59:44'),
(1098, '262710104', 'EFRAN RADEN KRISTIAN', '$2y$10$A9sA06o5U9z0nVh6d9kyDOig16nZbssYxcLvzwkSWAxMfdX9poVHe', 28, 1, '2026-08-12 09:59:44'),
(1099, '262710105', 'FABIAN RHEA BAHARIZKY', '$2y$10$TViX/raVYK.V1knKRwPRHOYCpzjZrC7EiSbGMI7f1HJMmx5xl2ADu', 28, 1, '2026-08-12 09:59:44'),
(1100, '262710106', 'FADIL ILHAM', '$2y$10$rN7zjCrFPb3sftLIF9cBTOiX4xjo6B/x5gb3GB7vaTPoYQGPhGs02', 28, 1, '2026-08-12 09:59:44'),
(1101, '262710107', 'FIKRI ZAHRAN AL WAAQI', '$2y$10$SQAXhqHmr2C7EJ3/kyA/d.kW9IDEzrU0GrOuIt2zWNqVGWI5RxLeq', 28, 1, '2026-08-12 09:59:44'),
(1102, '262710108', 'GYSTA KAYLA WIBAWA', '$2y$10$dG3PRJZNATVigmMYEBouxOBZnGsnqWtPuipGdTLRDvwlJXwDu1Scq', 28, 1, '2026-08-12 09:59:44'),
(1103, '262710109', 'HAYFA MAKTIKA NARARYA', '$2y$10$743nm4if1a.AATbNDWfM8OhMimGj44aAv4g55nrQn6FHwk85T4vj2', 28, 1, '2026-08-12 09:59:44'),
(1104, '262710110', 'HILMAN SYAMSUL ARIFIN', '$2y$10$HquBP3Siei540A6Sf.IPKevyCxTLrjSrJMbwIFYzPuZxsWsmJhwou', 28, 1, '2026-08-12 09:59:44'),
(1105, '262710111', 'INDY AYUMI RASHIN', '$2y$10$hPgDe7y5VZTNQogWrpTXtOonrYMyxkYMJsIFV687EkUs7F/eRlSQy', 28, 1, '2026-08-12 09:59:44'),
(1106, '262710112', 'IRGI MUHAMMAD FADHIL', '$2y$10$XVemSQJtS3PIgkkFkeLyDO1KqRNZCxJOEFBmjK5cLsIfyk8y3p/em', 28, 1, '2026-08-12 09:59:44');
INSERT INTO `siswa` (`id`, `nis`, `nama_lengkap`, `password`, `kelas_id`, `is_active`, `created_at`) VALUES
(1107, '262710113', 'KARIS MAULANA', '$2y$10$h555YKgA.Monr2rz7NelEuCPuVZZswd4PEsMyq86wMIo3eDMb1kPy', 28, 1, '2026-08-12 09:59:44'),
(1108, '262710114', 'KAYFA NUR ALIFA', '$2y$10$9fzYtkJbhwIW4rcf4YJDhehX/bneaPfK3mrDpqySGKPCR.137u3ra', 28, 1, '2026-08-12 09:59:44'),
(1109, '262710115', 'KHARISMA VITHADEYRA ANINDYA', '$2y$10$8Uwc4IEIzriX779iACnaweRGrTDN.Wl2byMY15tW1Hm1WqEXxCDSy', 28, 1, '2026-08-12 09:59:44'),
(1110, '262710116', 'LILY INDRIANI MOCHAMMAD', '$2y$10$HTqzOhFlyiQLsxv8u6Mo4e41ux5z/jrPAJreO9ZB/W9AWTF/aoJiK', 28, 1, '2026-08-12 09:59:44'),
(1111, '262710117', 'MEIDY KURNIAWAN HIDAYAT', '$2y$10$UerhOMFWBaFaOXuO2Az/qe0LIpAoA4NF8oiHH7boeo0/VFrCaapSa', 28, 1, '2026-08-12 09:59:44'),
(1112, '262710118', 'MOHAMAD REYHAN ADITYA PRATAMA', '$2y$10$sLPbl13jcvcbeppo/w4XqeOWxVdj9RVmkbH2q/LJKdFBRr2PerHQ.', 28, 1, '2026-08-12 09:59:44'),
(1113, '262710119', 'MUHAMAD RIZQI', '$2y$10$wMQjg.4WuhchjnwYXB4RCOu8TwoOZtekeXHYz6So6TGdHQrpyUC4u', 28, 1, '2026-08-12 09:59:44'),
(1114, '262710120', 'MUHAMMAD GHAISAN KIRAL FADHLURRAHMAN', '$2y$10$WJiTOdMeQrub4AXuSMBw7.ziKSEJydj.jGLIhaepwskYzs.8DzJiK', 28, 1, '2026-08-12 09:59:44'),
(1115, '262710121', 'MUHAMMAD HAMZAH ASYKAR', '$2y$10$If0ibncF6RmFRxZ337LT5Oo5aaX9kxH7Ka7L1XpXhS2GyyV6IQhbC', 28, 1, '2026-08-12 09:59:44'),
(1116, '262710122', 'NAILA APRIYANTI', '$2y$10$IFyBFmaauyMtDyNfTc8/w.JKl4juCPmp2tMa63e14IjMIvYpN50ja', 28, 1, '2026-08-12 09:59:44'),
(1117, '262710123', 'NAYSILA OKTAVIA RIZKIANA', '$2y$10$IVBiukojCCg5TQDOgmWdNOOOM.1VO2EXGTxfx64.WAPv/JS1FXVYK', 28, 1, '2026-08-12 09:59:44'),
(1118, '262710124', 'NIA NURHASANAH', '$2y$10$nyH3xpmY4ZOv2QWI/1qHt.jItEKmPvWMaGMmnJ2iA177SdPyvst32', 28, 1, '2026-08-12 09:59:44'),
(1119, '262710125', 'NOVAL ALI WARDHANA', '$2y$10$Fx5BW7eKEaMC6z7poBAOq.JqAddA5lOow73B1JWb422m1HCvhV9I2', 28, 1, '2026-08-12 09:59:44'),
(1120, '262710126', 'PUSPA AYU', '$2y$10$H7TIcBblmvdmgGIr1wZNeu80I.BRkG3630hSINlVlQd2vHF1HPo.y', 28, 1, '2026-08-12 09:59:44'),
(1121, '262710127', 'PUTRI AZIZA NURSHYIFA HERMAWAN', '$2y$10$HadGtbXz32N5ObtvTjr6JuTsWcclOtpwWCW7n5sshu9DDUbYGHghC', 28, 1, '2026-08-12 09:59:44'),
(1122, '262710128', 'RIZKY ALGIANSYAH KURNIAWAN', '$2y$10$V3fhfsjtJiho2n/386Km7eplGlisXZxwMF4WpaVIlxtp1dAcQW9uy', 28, 1, '2026-08-12 09:59:44'),
(1123, '262710129', 'RYCKEN SYABILA WINATA', '$2y$10$TT8mxmYFwpyIKIiiQxRQbuXH5ssDqtNgqox2lDJ1PzpfabFZMYqEa', 28, 1, '2026-08-12 09:59:44'),
(1124, '262710130', 'SEBASTIAN JUNAGRAHDILAU SIBAGARIANG', '$2y$10$DxxXBax0C8iata0jLL94EOHnfpmT91J6U3ukukNHrIoKVWy9zem6K', 28, 1, '2026-08-12 09:59:44'),
(1125, '262710131', 'SELPIA FAJRI YULIAN', '$2y$10$/EN4OyEFIogqrch4td5FIeYo3iHEcsiKv5QwKJoys5uiI75Ocg9FW', 28, 1, '2026-08-12 09:59:44'),
(1126, '262710132', 'SHENDY ARFIANSYAH PUTRA', '$2y$10$vid18mfdEGzTAylMMVE89Ok/8pV8Po83SnCoYkyicGxiYpr4vZpwC', 28, 1, '2026-08-12 09:59:44'),
(1127, '262710133', 'SHONA AIN SALSABILLA', '$2y$10$bXBSSf8eee2SCUI30gkRWub5UMrpJeDRuuFsiqDk09WmVC3BLVUWG', 28, 1, '2026-08-12 09:59:44'),
(1128, '262710134', 'SILMA LATIFAH', '$2y$10$WGxNry0Dw/cKWdCSuugs7eZXxKZZAK.p1M/Qm8yt.xzGoZDRXrl6S', 28, 1, '2026-08-12 09:59:44'),
(1129, '262710135', 'SYAKIILAH NOUVA DWI ARYANI', '$2y$10$904jvzziSAq1KT73fYBn.ukxJeYBwn9M8nvUALyOlhEKS5RhcJVcC', 28, 1, '2026-08-12 09:59:44'),
(1130, '262710136', 'YULI RAHMAWATI', '$2y$10$nxyekOlk3WopfvUavfJeIep.IWGuCs6mxJPDN.J1lZkZ8HHFnLgJ.', 28, 1, '2026-08-12 09:59:44'),
(1131, '262710137', 'ZAHRAH DANIA RAMADHANI', '$2y$10$UkW2OFZOYOVu7wvkRtpi0.RkQgqcTdyD1U3ggd4ORus9PCryALore', 28, 1, '2026-08-12 09:59:44'),
(1132, '262710138', 'ZALFA FAIZA KAROLIN', '$2y$10$9kq6dJeBuPFzoANmGDh.JuCjabvCZLOo0IyUt2Z.zNZoK18WpYYBa', 28, 1, '2026-08-12 09:59:44'),
(1133, '262710139', 'AGUS ARDIANSYAH', '$2y$10$gCC70G8e/24gXvLJX8o5Fu4iSQuv54rGrlLwY93EQM/2H5sjhMPZK', 29, 1, '2026-08-12 09:59:44'),
(1134, '262710140', 'AHMAD KUSMANA GANDA WINATA', '$2y$10$PgIOu2rDj.LfjluDvNli5OEAJVUJ.9KQgYM7F5hURLqkEK//ot56O', 29, 1, '2026-08-12 09:59:44'),
(1135, '262710141', 'AILSA AZALIA AFLAH WIJANARKO', '$2y$10$L09N6sIyc..HOYv4ztOjUu.4LzeaV9IxlKinJMP0HzgSCT4gQIwX6', 29, 1, '2026-08-12 09:59:44'),
(1136, '262710142', 'ALMIERA AZALIA AFLAH', '$2y$10$TGXwVxDk61ShMDuXUI66zOK3t7Q6B2ujqAV/DjdiCpgRzAzuZL6Ry', 29, 1, '2026-08-12 09:59:44'),
(1137, '262710143', 'ANISA SALSABILA', '$2y$10$E.mq2EgQya9qA1LCFlXTTO6Q76D1juGXoioZTQ7/6Md.Fv7CqkPv6', 29, 1, '2026-08-12 09:59:44'),
(1138, '262710144', 'ATHANIA KHONSYA NA`IMAH', '$2y$10$C2RdDh5OGaaiwA7FwPmGQ.vMw00ny2FJd5XD081AlHCeMHXkHdAUK', 29, 1, '2026-08-12 09:59:44'),
(1139, '262710145', 'AZI AGUSTIAN RAMADHAN', '$2y$10$lxqYu16u8kRowlxpI1Os4u86jaWIXM2C2kuvNuBVCX1zrDsJzYUlK', 29, 1, '2026-08-12 09:59:44'),
(1140, '262710146', 'AZRIL PUTRA BAGASKARA', '$2y$10$Nx6HqWhY//vuD8bdJXYEmuh1y6kCUq82DpTV9yOw2Ay0aYN0wywU.', 29, 1, '2026-08-12 09:59:44'),
(1141, '262710147', 'CHARENIA NAFTALI APRILIA TAMBUNAN', '$2y$10$ASXl0.Jl76h3VjiQRY.CZORhMZ87rwy3PrdRTxr0mt05EfBWG23gi', 29, 1, '2026-08-12 09:59:44'),
(1142, '262710148', 'DANNISYA RIZKYANA', '$2y$10$GvFWjtyrSXnQ44MGu8JLoea7nKZ.cwZac3/IkAWRyRhtH9mjpns0i', 29, 1, '2026-08-12 09:59:44'),
(1143, '262710149', 'DELWYN JAUWHARI', '$2y$10$H8O5CnEgQVtAJiIR1W725Oa/9MQ4MDm3aO7zn/2VB8YOZCbqQgqZm', 29, 1, '2026-08-12 09:59:44'),
(1144, '262710150', 'DINI FITRAH HAERANI', '$2y$10$D.E7X.gF424dcMaGPRQyCuPt38XYbwAej3F86PV/fBfDkG7ty5D0C', 29, 1, '2026-08-12 09:59:44'),
(1145, '262710151', 'EPAFRAS NABISUK PANGARIBUAN', '$2y$10$pBwFneT9qLBGuS1tItv6t.6JT5GdwPU1kgDsDY3GhjiWKbmGDS4Ym', 29, 1, '2026-08-12 09:59:44'),
(1146, '262710152', 'HALIM RABBANI', '$2y$10$Nt6FqaJIWbbPzWhdOL597.GRxrG0TAxo.6OT5eqrVi1xCZml9mVV.', 29, 1, '2026-08-12 09:59:44'),
(1147, '262710153', 'HAURA NABILA EILIYAH', '$2y$10$T9sMPPQjjIinTQl8Opa3Zu53vZm.exvgn6BBfN3L7NE1t60DB4hNq', 29, 1, '2026-08-12 09:59:44'),
(1148, '262710154', 'INDI MUTIARA', '$2y$10$upSukAQE4cDnPpzXY/nVt.Enx81Bj83Mtp56hVig5YtjYhH4hZaGa', 29, 1, '2026-08-12 09:59:44'),
(1149, '262710155', 'IRWAN MAULANA YUSUF', '$2y$10$gR/pGVeOpOBsZjc7v6W1gOxuzJoFK10LiWICvICXSvHB9TMIshFMa', 29, 1, '2026-08-12 09:59:44'),
(1150, '262710156', 'KENZY HILWA RAMANDA', '$2y$10$CsR1gJuRMNw1HNthAPfqteB.8s1UcsflyQJ7VOMV/NpKaSUTXZ5Ji', 29, 1, '2026-08-12 09:59:44'),
(1151, '262710157', 'KHEYSA VIRGINNYA', '$2y$10$.QMMLKKvMAwTSXZeYilHOubLUmSGk.Lvtvj7QAWpjXZVBnUMjDnj2', 29, 1, '2026-08-12 09:59:44'),
(1152, '262710158', 'LANANG DIVA PUTRA ALTHAAF', '$2y$10$tb9X9siLxKO5nTzD4./78ebjAnoZe11IkOXLhkEPLYfNex5DGQL1.', 29, 1, '2026-08-12 09:59:44'),
(1153, '262710159', 'MANDALIKA ANIQAH DAYINI SHAFINA', '$2y$10$cz462yogxmcAah2kDQWp0.NMagES3P2K52iebVxZaulB1Tm/YD4tm', 29, 1, '2026-08-12 09:59:44'),
(1154, '262710160', 'MOHAMMAD AZAM FIRMANSYAH', '$2y$10$WGDYaMqMW1q6YXCXF5k5h.UcrEVWeTl7jGM0xZgjQIhonHVzaI/SW', 29, 1, '2026-08-12 09:59:44'),
(1155, '262710161', 'MUHAMAD ARDAN JANUAR', '$2y$10$G0wt/PsUQg5jvjjqKCz2zOF.HCvzXMzV9OdX4p2mzpKJYDGeGxA5G', 29, 1, '2026-08-12 09:59:44'),
(1156, '262710162', 'MUHAMAD RAMLI JAOHARUDIN', '$2y$10$VTmtNjiZv8hghWtCgskfIuR/wX5.HSa7J7GenLQAPLzYvHM2OxyXy', 29, 1, '2026-08-12 09:59:44'),
(1157, '262710163', 'MUHAMAD SAEPUL MIZAN', '$2y$10$EIoz6octo5WU0RF38DR3bui/bdE3ZqHbc9lhZJpUbw9i8dOwQjT4u', 29, 1, '2026-08-12 09:59:44'),
(1158, '262710164', 'MUHAMMAD KHAIFAL AL FALFI', '$2y$10$B1YtUhS3ih94Ki29t96Jf.7Qco4UMVix3OFNNgTnOd8SnuBNXATc.', 29, 1, '2026-08-12 09:59:44'),
(1159, '262710165', 'MULYADI', '$2y$10$R1uzHjFK7Nrzf9By0ZYLfuvDUGjBPmOkA7eq9frESEyt9GGDr/OlG', 29, 1, '2026-08-12 09:59:44'),
(1160, '262710166', 'NASYWA RAMADANNIA', '$2y$10$sZleZCRvdvk1.AWZN2pwVeqE9SFp0HBGc.8Akd0rXigmCVAZ.IjXK', 29, 1, '2026-08-12 09:59:44'),
(1161, '262710167', 'NIDZAR RADITHYA MAULANA', '$2y$10$O5IqUvPY3xayu0DZULhBM.d133XiEl11XB3giP2E4GPsTGs/rhije', 29, 1, '2026-08-12 09:59:44'),
(1162, '262710168', 'OLIVIA ADITNA DEWI', '$2y$10$s2qWeznyhVzqZIy8qFWNc.tP2uTJ77VRjZGXJZ.HY2Yp4afJxX/zC', 29, 1, '2026-08-12 09:59:44'),
(1163, '262710169', 'PAI`J', '$2y$10$G5Y8ePCM/w3ocpNr9HJR0eG8yf1eQOAYquiYeSRD13O.yWQFUAnS.', 29, 1, '2026-08-12 09:59:44'),
(1164, '262710170', 'PATIMAH AZ ZAHRA NUR SYA`ADAH', '$2y$10$yhZleLgF8U7DxplsoMls9uwJqLlTHwnISfu2dnPcOcJj7l7zQh6zS', 29, 1, '2026-08-12 09:59:44'),
(1165, '262710171', 'PUTRI MONICA AZZAHRA', '$2y$10$tH.Be71mX38Jr1zk2eSgC.KfolrQikHfsOqi3DwNY9aY3rUihLB62', 29, 1, '2026-08-12 09:59:44'),
(1166, '262710172', 'RADITYA RESTU FAUZI', '$2y$10$LRQcfFZms6mq7VvGZAfPy.wHxncIlf/nokeq7RFU231u3U4.gy/L2', 29, 1, '2026-08-12 09:59:44'),
(1167, '262710173', 'RATU CALISTA MAYSYARAH YUDIANTI', '$2y$10$GmZdZf6YLnsBx178erJ9kualETvgfhcXGpmsY.DJ/yZFDeDeapAd.', 29, 1, '2026-08-12 09:59:44'),
(1168, '262710174', 'ROLAND NOEL SINABUTAR', '$2y$10$eSAwnC1B9XUrq6.nuyg4LuLIIQsOaj.YbYCWMecM0x8D5MG1OP/TO', 29, 1, '2026-08-12 09:59:44'),
(1169, '262710175', 'SABIYA NUR MALIHA KUSUMA', '$2y$10$nT/mylJcaBheHHqQ4dOoYuCYi83BREmuj8J380KXq3N9pwCWk9g1e', 29, 1, '2026-08-12 09:59:44'),
(1170, '262710176', 'SEPTIANI AL FITRI', '$2y$10$.dGys/CskvlXVyxI0IcG.ew5mYXFJ7p60PpcrEkqtJTkE4q/jutO6', 29, 1, '2026-08-12 09:59:44'),
(1171, '262710177', 'SIDIK PERMANA', '$2y$10$XM7mA8FSx1wZzYd1mVwaC.8p1PVCNtyFLIuZYPoMeNHmfAUv1D0aW', 29, 1, '2026-08-12 09:59:44'),
(1172, '262710178', 'SITI NURAENI', '$2y$10$4YgNqDBkOJILR539f7AApO4/58lnnjYe.lexn2UoHr.OHaC28RMAW', 29, 1, '2026-08-12 09:59:44'),
(1173, '262710179', 'SYAKIRA NUR AQIILA', '$2y$10$zaB0DvWMq9HD5YBzq4vwfee1ktFzH6.0zKVIhgIoLb4UL2.5gGAGu', 29, 1, '2026-08-12 09:59:44'),
(1174, '262710180', 'ZAHRA NURAINI', '$2y$10$NJ/SFTRVsPRC/tKDuhkXRe4imwFz0tAqveNWPNIeo899hteTmCNX6', 29, 1, '2026-08-12 09:59:44'),
(1175, '262710181', 'ZALFA MAULIDA', '$2y$10$pKRBctDCXMFMeN65c4lfyeVsupd4jMaMQ5rTr.z8WhyVHGB1QJqfa', 29, 1, '2026-08-12 09:59:44'),
(1176, '262710182', 'ZEFANYA KEZIA ALBERGA', '$2y$10$h772xjoshTgaAufifO25neAmZ/RCAmZHTNE/OaAmOi8zuBZSm3xJW', 29, 1, '2026-08-12 09:59:44'),
(1177, '262710183', 'AGNA MAULANA', '$2y$10$b4JXvjbVQ23QfpbOnTWFyuSyDl7fwNQTpfoEASEsaP.yoSoCcPuE6', 30, 1, '2026-08-12 09:59:44'),
(1178, '262710184', 'AHMAD RIPAI', '$2y$10$ERyetgF6bjC6Aq/NJSY3nOZqh8nzUjMjgQbd2gpPpzFtfR8dFWBJe', 30, 1, '2026-08-12 09:59:44'),
(1179, '262710185', 'AISYAH NURMALA SARI', '$2y$10$atMIDay7o0QljRmWMddmgub5VUdOBTTW5pq0CdimfxglJo2sF5Fb.', 30, 1, '2026-08-12 09:59:44'),
(1180, '262710186', 'AL-BIRUNI ILHAM RABBANI', '$2y$10$vMxGpQARZTxuh2KXvpofZOl5T97T.IzJGBmupphRTuWyxiNU796i6', 30, 1, '2026-08-12 09:59:44'),
(1181, '262710187', 'AMABEL RIFQA HUSAINA', '$2y$10$S1zOtQ4G.eB/5P7G36SoEOGNTTKtsDitZ1QS66hqC5Eli/L.QKwnW', 30, 1, '2026-08-12 09:59:44'),
(1182, '262710188', 'APRILLIA PUTRI WARDANI', '$2y$10$wzTrlhpURV1ngdcNi0S51.0ttkc3wuaBKrnAwfNm/u1f7sD7csB2a', 30, 1, '2026-08-12 09:59:44'),
(1183, '262710189', 'AQILLA NAIRA AZZAHRA', '$2y$10$5.d9CvdqduacLnzhhaKn6usm3eFhil5S4UqqYfM5VKfyFndPur5Si', 30, 1, '2026-08-12 09:59:44'),
(1184, '262710190', 'AULIA FATIMAH AZZAHRO', '$2y$10$h7zpkr5ufhH91Wp0uRrNNe8EALLctKUuATbSH88E5JTl3It4qfzCe', 30, 1, '2026-08-12 09:59:44'),
(1185, '262710191', 'CAHYA RIZKY NUGRAHA', '$2y$10$3Clqplnr/sIG/.2wkJ1BZu4QbtCqnF2Pzy.RqEg6dY0qGHm48O.kS', 30, 1, '2026-08-12 09:59:44'),
(1186, '262710192', 'CHANDRA SAPUTRA', '$2y$10$56YwdVQjVNxuTEde7/wsBO85uxMuHCyZK4EzdOa0akIXD2HpMuoma', 30, 1, '2026-08-12 09:59:44'),
(1187, '262710193', 'CLARISSA PUTRI SHAFIRA', '$2y$10$PyCLkaNOlSeQghIPDb7L9.OYD9OI/oeiwczBF.yoSUCQQax2WVS3K', 30, 1, '2026-08-12 09:59:44'),
(1188, '262710194', 'DAMAR HILMY WALDIANSYAH', '$2y$10$8dB7ujsmU5ogLsaHko.0i.EXR4eWt5.JiWhpNC4bfdQ72Xl6YR5kO', 30, 1, '2026-08-12 09:59:44'),
(1189, '262710195', 'DESTIAN SARIANTI DABUKKE', '$2y$10$mT5mFrJV7SKYcTWyZFudtuGIXlidrsMs0iCaLDQR2kCxk13Z/frsS', 30, 1, '2026-08-12 09:59:44'),
(1190, '262710196', 'DIVA WULANDARI', '$2y$10$ZSfCpHEnDkwIbO8xXKiGvephzfYhnpk2yE0Xhf7X9wtrxaTxyagj.', 30, 1, '2026-08-12 09:59:44'),
(1191, '262710197', 'FADILLAH DWI RAMADHAN', '$2y$10$rBqi07eeJl0MCjWDiaQr6OZaxNDC0fWC/LJ2MlsyA7POlrQvTOkJa', 30, 1, '2026-08-12 09:59:44'),
(1192, '262710198', 'GILBERT FRANSEDA MARBUN', '$2y$10$DUT6aetpDACBnUEzTzgADuOPcV9g8Y9cG0qrXoee0uY8QcxV/r5ey', 30, 1, '2026-08-12 09:59:44'),
(1193, '262710199', 'IBNA SALSABILA LIRABIHA', '$2y$10$1zQnHmV4WHAcr.v3NYl2mOyMwp08PMq4qQU7s9DSqYBNCreLsiw5K', 30, 1, '2026-08-12 09:59:44'),
(1194, '262710200', 'INTAN RATU SOFIA SA`DUN', '$2y$10$ayQbZiNN18jL00qJE7VlhuNToa.nuOeJC/2dn9DOFPNYbB/IQX7We', 30, 1, '2026-08-12 09:59:44'),
(1195, '262710201', 'KAYLA NUR NAZWA', '$2y$10$j.BPS8yDELIu709ml9IDuOn5aImRb36OnmYYlTlK/sClOdUARewRO', 30, 1, '2026-08-12 09:59:44'),
(1196, '262710202', 'KHANZA PUTRI CEPTIA HERNAWAN', '$2y$10$p5h/kJmjBdb3cQ1gvaaDxOgJXXmXwWpwsZ.XFaVvbbNPf.cFuGlKq', 30, 1, '2026-08-12 09:59:44'),
(1197, '262710203', 'LADIVA SYMPHONY SURYAYUDHA', '$2y$10$CygT8kBaVzT/Gf24fQkxcu6bFDAa6UwLs3DrRQQLfzJdl/TYxaES.', 30, 1, '2026-08-12 09:59:44'),
(1198, '262710204', 'MARDHIKA LIGHATARA', '$2y$10$rsgQUfozkkgI8kD/5yhLxOvbhJmkQNsfn2DciLXjKrKU4ehsBe9ve', 30, 1, '2026-08-12 09:59:44'),
(1199, '262710205', 'MARIAM LINTANG REGINA MUSTIKA RAHAYU', '$2y$10$THpnalM.nL6Sx9Oy0RLlcu2wi1DcuDoB3ASQEdn9u5BLvfqJXy9R2', 30, 1, '2026-08-12 09:59:44'),
(1200, '262710206', 'MOCHAMMAD AZKA AL FITHRA', '$2y$10$vKAxQj5//dlKg1MTOVo8B.UQPDtjO6TLoGzfDRhrfeTjM1m0TE7.e', 30, 1, '2026-08-12 09:59:44'),
(1201, '262710207', 'MUCHAMAD RIVAN FAUZI', '$2y$10$kV097ymjDqkOq6AZiCA3SeMEA34BH/ZHTex7kbqpgO05qeZJKzBzS', 30, 1, '2026-08-12 09:59:44'),
(1202, '262710208', 'MUHAMAD RIDHOLOHU', '$2y$10$WcTQdIWJZZ9CbveZDl4Oq.tx25vd6zDFHbHmycN2I3MU6oKjlbIkC', 30, 1, '2026-08-12 09:59:44'),
(1203, '262710209', 'MUHAMAD SALMAN SULAEMAN', '$2y$10$Jnqgna5lBPtzEamQTMBq0ulm3b496LVAaSz31yZQ99ZRu4rztWTnu', 30, 1, '2026-08-12 09:59:44'),
(1204, '262710210', 'MUHAMMAD MAULANA ISHAK SEPTI', '$2y$10$.eKLAdndlKGTI4dg6Djpk.s2l19hM6Kjn3FmPkwkuULRAbVln4smi', 30, 1, '2026-08-12 09:59:44'),
(1205, '262710211', 'NAYLA FIRYAL SALSABILA', '$2y$10$VR4lCkc/mRBEYpmPazLNCOask6nRONX7880G0cGZeq/IMmfVc/6FW', 30, 1, '2026-08-12 09:59:44'),
(1206, '262710212', 'QANITA HISAN HUMAIRA', '$2y$10$gdrsVoe8aafYs/o/nFboQ.oY9gQqRFtLwnFBFU.qWT7xjcJivBNHa', 30, 1, '2026-08-12 09:59:44'),
(1207, '262710213', 'RADI BAMBANG SETIAWAN', '$2y$10$UnbsRvKdMFGqQfopBPXaGeummAwuHtxt3BDT96AP2rSlnU6bxf1lG', 30, 1, '2026-08-12 09:59:44'),
(1208, '262710214', 'RADITYA ZAHRAN HABIBURRAHMAN', '$2y$10$aLbqF3M2bteAWZCc9AFoceLXRJF8fQUg62q1KqJrCWsEUNaMvjDD6', 30, 1, '2026-08-12 09:59:44'),
(1209, '262710215', 'RAFFA MUHAMAD PERMANA', '$2y$10$XmAg12wr3PScaL9.8Fgbw.BaIntVb8xLsuJb2MnnMGA3GkyM/FIuG', 30, 1, '2026-08-12 09:59:44'),
(1210, '262710216', 'RAISHA KIM CALYA', '$2y$10$eq4kw0U3E.pCBy1kxpKFF.6JfpJy/WxO9s816kTX4kv2oLDmcTSgK', 30, 1, '2026-08-12 09:59:44'),
(1211, '262710217', 'RANI MULYANI', '$2y$10$7014kFhYNVGqrKg.vD65DO8sag2zSRN66d1sbOy0Uz3E1fJw2D7dy', 30, 1, '2026-08-12 09:59:44'),
(1212, '262710218', 'REFA ADELIA PUTRI', '$2y$10$NV9MwwFl7G6i1XwSPVhAEeXPBBzxbfsfEhG.pNSzme6Kq1BHQ.qwW', 30, 1, '2026-08-12 09:59:44'),
(1213, '262710219', 'SABIAN GHAISANDY RIZKI', '$2y$10$ApdbXga95Yco1p4JlJmrOu2OyfB49xDdji4ok8sUBaZwI1GKNnbsO', 30, 1, '2026-08-12 09:59:44'),
(1214, '262710220', 'SALAMAH SRIWIJAYA', '$2y$10$eGeHVmI6fdC3oa9xRyarsuL1MbivHAg1IhhadMY0snyiHEJIYkyD6', 30, 1, '2026-08-12 09:59:44'),
(1215, '262710221', 'SASKIA NURUL TAZKIAH', '$2y$10$qZbBcdVJOHNqWEGt9K41S.ocY7MAOC.VRZF8cYGICDPnPznrBG.xK', 30, 1, '2026-08-12 09:59:44'),
(1216, '262710222', 'SHAMAILA NOREEN FAZRIN', '$2y$10$IVqcH3XZ8BHVzZmRCbwtXuHHd88ObY6yZODCAOgOnqH0Du412QjDS', 30, 1, '2026-08-12 09:59:44'),
(1217, '262710223', 'SITI MUDRIKAH', '$2y$10$YpS4aM30r6qet2fSP3iZTOJ4Uak44M6BC9XVLawWGFDtuCkEDwpSq', 30, 1, '2026-08-12 09:59:44'),
(1218, '262710224', 'SOPIANDI', '$2y$10$O3RWP0gsec8fgyv90AidXuzKxERJNRE8u8cpoQunWJM/4CItEI/H2', 30, 1, '2026-08-12 09:59:44'),
(1219, '262710225', 'TANTI NURUL AINI', '$2y$10$L.yDOyunjf4X.Ib5nvPM8OygVt/XQM7DmWiqQNmfs3qPSwFvIxpXu', 30, 1, '2026-08-12 09:59:44'),
(1220, '262710226', 'ZAHRA DINAR NUGRAHA', '$2y$10$NXywE6HvaxH1UvkfgnMTeOCMQgef8YtjHusQYMQtMqy60hJ8fLUY.', 30, 1, '2026-08-12 09:59:44'),
(1221, '262710227', 'ZIKRA RIDANI SYABANIAH', '$2y$10$rWtAlYDuw.VILlMGGG51KufBgReENDfgahWDVuE8oE1E7CGtSNJRO', 30, 1, '2026-08-12 09:59:44'),
(1222, '262710228', 'AHMAD HADI FIRDAUS', '$2y$10$g5tXfVKv/o.bjbULuVcNGuQpPX0QFAlh.VMx1ToU2FP4KTrn5WFn6', 31, 1, '2026-08-12 09:59:44'),
(1223, '262710229', 'AKMAL DINARDYAKSA', '$2y$10$vPpZzaFzdPlDHSlkgYN5feYNQBvE9AHkqaPXB53qmPsdyZx6Or8P2', 31, 1, '2026-08-12 09:59:44'),
(1224, '262710230', 'ALFIAN NURFAZRI', '$2y$10$fDlFU8MPPoFmZjSoJ2b5c.QmfRoskBTWJW0Fcet0GRb82RM1R.V0a', 31, 1, '2026-08-12 09:59:44'),
(1225, '262710231', 'AMALIA PUTERI AJIZAH', '$2y$10$PqHtgwAWy6W2PGkLWsCFxOysLyMb.L4NahLYfI/zqJ7KPJZV41es6', 31, 1, '2026-08-12 09:59:44'),
(1226, '262710232', 'AMANDA RIZKA MAULANA', '$2y$10$Q0gUdy4m4HPoWQu0W8v.Mu4dORM2jWqu5Q2MQPr39PbbLD5p.8f6.', 31, 1, '2026-08-12 09:59:44'),
(1227, '262710233', 'ANGGA DIMAS ANDRIYANTO', '$2y$10$KSF8wNQFUgZzQKJXIUjbFObXBxUtI1Lcu.TpX1bZ/NiXvGroTpM6K', 31, 1, '2026-08-12 09:59:44'),
(1228, '262710234', 'ATHAYA NASYWA PUTRI AKHILA', '$2y$10$6KNX0gFXMzI73WxRsjbWOOEjnRaniv9CQLrpOLuh6moDkO4/TLeIq', 31, 1, '2026-08-12 09:59:44'),
(1229, '262710235', 'AURA KANIA ANJANI', '$2y$10$eeKL/pWfo7pg19NncNQZI.emx.gZ2fCY5MLq.4UHGJ3gmcytQ2Ogu', 31, 1, '2026-08-12 09:59:44'),
(1230, '262710236', 'DADAN', '$2y$10$M2ZY6ftPSwteC6VuT9MejeQ5cN2nufKVyJVL4b/VvxbNz1lSRR2ZG', 31, 1, '2026-08-12 09:59:44'),
(1231, '262710237', 'DARA KHUMAIRA', '$2y$10$fn1TjvS6xSENNiPf/Nj76O/94evBe4SwdoGF2fQVZ/JOKH3S03moq', 31, 1, '2026-08-12 09:59:44'),
(1232, '262710238', 'DARUS JANWAR JAELANI FIKAR', '$2y$10$nY/D9oFwZ6.y3kj2R1S2EuzC8FHxXZKvAMAfql2JK1m7CfrDmkkc6', 31, 1, '2026-08-12 09:59:44'),
(1233, '262710239', 'DINDA AYU LESTARI', '$2y$10$eI7dzM2TMbeXk7yYvy8Mr.GV4U1iycXGiKcP0kQ5trWaptryz.a/G', 31, 1, '2026-08-12 09:59:44'),
(1234, '262710240', 'ELVINA ARDELIA FIKA RAHMA', '$2y$10$mAsHFFp9AgoFNMK1c9fu.uZFVPsN4cLySvLQq88PCjosNca/agq.q', 31, 1, '2026-08-12 09:59:44'),
(1235, '262710241', 'EVA NURDIANA', '$2y$10$mPpupkhMJAPWkG1y03MLee6acupwfedE9shlkUz5DrQdd2J7sTNia', 31, 1, '2026-08-12 09:59:44'),
(1236, '262710242', 'FADLI AHMAD FADHILAH', '$2y$10$ZqPpSYQuO594J6ofbFx31uFwnpEWAghrSjuCw6EAZC9qUh8nZvfqi', 31, 1, '2026-08-12 09:59:44'),
(1237, '262710243', 'FAIRUZ ALYA QANITAH', '$2y$10$pt0sYlywPn5e26CO4wXr2OA4f1nTL9pcsS02KRIDnTETOOodOtvay', 31, 1, '2026-08-12 09:59:44'),
(1238, '262710244', 'ILMI NURFATONAH', '$2y$10$8XGgoQtPmZUMyaR20DxMMOKMhzCRA5Hi7gCqGyGBlZeehSjZ4BphK', 31, 1, '2026-08-12 09:59:44'),
(1239, '262710245', 'KANAHAYA SAFFA AZZAHRA', '$2y$10$JHFe62Y7lQdSDsD4eL3yOOtJjNouXhbdT/lkk1e1UyKU.oDrx8vSy', 31, 1, '2026-08-12 09:59:44'),
(1240, '262710246', 'KEIHAN RAZZAQ', '$2y$10$GzOmj2gpOncGJ7RBQQ8OLueFsod0nN3Rh0OocQDiyYVz7f0CxChHO', 31, 1, '2026-08-12 09:59:44'),
(1241, '262710247', 'KONITA SEPTIANI', '$2y$10$TQEkJlUuFlwfybfymY/3j.z5wdv7Kr9kE7ogB8kQOsXf5bfpiy93a', 31, 1, '2026-08-12 09:59:44'),
(1242, '262710248', 'LIVIA MEILANI PUTRI', '$2y$10$HxB6QO3knSacV0xyjmT6G./BL0fFjVkJJzNAhfk6aR6Y4/ToQxyAu', 31, 1, '2026-08-12 09:59:44'),
(1243, '262710249', 'MARSYA PRADITA HIDAYAT', '$2y$10$EQaR6VWvTpFrzQ1OZKdT2ORMJhDW0mN.cTK12q8/TD9RpaHBF0NO2', 31, 1, '2026-08-12 09:59:44'),
(1244, '262710250', 'MEIFRI TRISTANTO', '$2y$10$FE.XeVa.8cD80o5oTwBi4.e3wzTAaKzOoKe5Zp14mZtWTjXXQVoVa', 31, 1, '2026-08-12 09:59:44'),
(1245, '262710251', 'MUGHNI SALAMAN KHAIR', '$2y$10$nQI0OmWjzoKqFdTeyf1HyeuW58Ll0.kMT7k5V1b5O1FY9XqXRTc5e', 31, 1, '2026-08-12 09:59:44'),
(1246, '262710252', 'MUHAMAD SURYA ADITIA', '$2y$10$BmW.q7.liE6Nr.Dimt1lQu//d8HjyndAHaCG4kUC6DY8Ua4pan1Ru', 31, 1, '2026-08-12 09:59:44'),
(1247, '262710253', 'MUHAMAD YOGA PRANATA', '$2y$10$qKZB7iUtreaRoiCnIzRCh.a91WgFea815Oh5bj85sMvPkpuKKfK6u', 31, 1, '2026-08-12 09:59:44'),
(1248, '262710254', 'MUHAMMAD ALWIYAN SYAH', '$2y$10$OPhSVu6fJqSK9msQR.hDmuzZCYj2yKLTM2A82xRDi2z4Pq7lp0ym6', 31, 1, '2026-08-12 09:59:44'),
(1249, '262710255', 'MUHAMMAD PUTRA HENDRAWAN', '$2y$10$B5OQfrd.ji7DFZbqrEcWi.KGwDpMCqv9nzrVbkfW6bdhbl/YuxlEa', 31, 1, '2026-08-12 09:59:44'),
(1250, '262710256', 'MUHAMMAD RIFQI ALFITRAH', '$2y$10$bWjeoBalj2uEsnhPP.N2EuHTDh6umF65oEilYbL4BcFK47fjNG0Em', 31, 1, '2026-08-12 09:59:44'),
(1251, '262710257', 'NAYLA KARERINA PUTRI', '$2y$10$rLeF8ECw0NcutdLUlETMiusleEwW1bBy82glwc.ChRgWakA3wE6qq', 31, 1, '2026-08-12 09:59:44'),
(1252, '262710258', 'NAZIRA NUR SABILA', '$2y$10$t/wigWW58DlMN/lpTc9LAuioHt.nNLmkNZF4K68r1h/kgZVGEQBdq', 31, 1, '2026-08-12 09:59:44'),
(1253, '262710259', 'RADISTI ARLIANTY', '$2y$10$QQnVGLUPOzXxH1/a9XuhWer7KdKllRVcGLAlEYg9ZZfv4b3P/gxMG', 31, 1, '2026-08-12 09:59:44'),
(1254, '262710260', 'RADIT', '$2y$10$IyQkzK3G75avyWFBCm./B.qTtD7d10m0LTNoYWlOFgrysNlDEmfGK', 31, 1, '2026-08-12 09:59:44'),
(1255, '262710261', 'RAFFA RAMDANI MAULANA', '$2y$10$mbAmxjsjfU7pNGtllnh9HeYjH7JnSH2umAK/MJ/KVgcDHvFUYmDmS', 31, 1, '2026-08-12 09:59:44'),
(1256, '262710262', 'RAISYA PUTRI KURNIAWAN', '$2y$10$8CF6HPYvyv7UrW8TJHs0SOlJeLOHD5MjSYOyXKGjClpM1YjCNGPW6', 31, 1, '2026-08-12 09:59:44'),
(1257, '262710263', 'RAKA PUTRA DANTIA RAMADHANI', '$2y$10$YKOVXnePV6GJH4eLp4/EAuRu7k0wLmvW3GsoyMxqNdIBlOLMsEAPm', 31, 1, '2026-08-12 09:59:44'),
(1258, '262710264', 'REGINNA OCTAVIA PUTRI', '$2y$10$QuZq28deFddF5iqLDDUwHOGohfrlTpkJb5xd0737LSZRGj3Ji6AWi', 31, 1, '2026-08-12 09:59:44'),
(1259, '262710265', 'SAPA FERA SABILA', '$2y$10$YHT0v5c7kXHaXP.CDgmmoerVPBagoo6CbA5KlbXOAiTOGKBUV.f5e', 31, 1, '2026-08-12 09:59:44'),
(1260, '262710266', 'SATRIA LAKSAMANA', '$2y$10$fs7JhwziGnVLRkYDDDI.vOwzOrmTey7i9hhPXH4cuwd1imOGOypKm', 31, 1, '2026-08-12 09:59:44'),
(1261, '262710267', 'SILPI AYU SALMA', '$2y$10$bpeNusF8162Srw996vc35eY9fMMLQJRG5aOHdaxJyeFkV.cWFt/.O', 31, 1, '2026-08-12 09:59:44'),
(1262, '262710268', 'SILVIA PUDIASARI', '$2y$10$tM4Oz6IxC70utJksMyx/SOEFE8MrxbFHu3WnzG5Dl.bZfqeka4Jge', 31, 1, '2026-08-12 09:59:44'),
(1263, '262710269', 'SITI SHOLHA SHOLIHAH', '$2y$10$gw7eKDaLukc7JZ50yQZkr.jO1qvBC7tmoytou86MZ0.vFP6XA809i', 31, 1, '2026-08-12 09:59:44'),
(1264, '262710270', 'SULAIMAN AL AYUBI', '$2y$10$M0HpUpzlIkZ.FqCowMZHB.y2erCLYrtsFkzfdBKN2KFTCCTe6bjM.', 31, 1, '2026-08-12 09:59:44'),
(1265, '262710271', 'TABINA ZAINA NUR ROHMAN', '$2y$10$esPSdcuIUjIaBT0K383Afu2d39Gs9CG9nK1LSv976obl/ghb7vJHm', 31, 1, '2026-08-12 09:59:44'),
(1266, '262710272', 'TARA NUR AISYAH', '$2y$10$blZTRyCwg8Wr1H.11L3PVuv3INWSzVgci8/mtHw7VVv1Rg.vax11a', 31, 1, '2026-08-12 09:59:44'),
(1267, '262710273', 'ZAHRA INDAH DARA MENTARI', '$2y$10$Ki9y/8f4Bl2ron5dEtRt2eIxHFeVWxAbZif.ORX7R.fslF/m/QIAy', 31, 1, '2026-08-12 09:59:44'),
(1268, '262710274', 'ADARA AMELIA', '$2y$10$J3MbLv8ve.xzx/tLkvA7JuCnqhdzrVUWWQHFxUJzfbkee31WVf1ji', 32, 1, '2026-08-12 09:59:44'),
(1269, '262710275', 'AKMAL HAMDI NUGRAHA', '$2y$10$LE2/vojQXIuV6VYqXlZQMufaA5.QZyKC7n4DjyIRJl5WihtzrLxGG', 32, 1, '2026-08-12 09:59:44'),
(1270, '262710276', 'ALFIRA TASYA AULIA', '$2y$10$085DRwI0aOmkZzwKMYgG3OdTYUKoLGDsoF5bJ4qdCIkmqZM4ol1ui', 32, 1, '2026-08-12 09:59:44'),
(1271, '262710277', 'AMIRA RIZKA NOVIZA', '$2y$10$dvfC2RmCyoirJExOI.Bs3.KwKFkBK8yK4mNrW1dCYExCled2DGxKi', 32, 1, '2026-08-12 09:59:44'),
(1272, '262710278', 'ANDI PRAMUDIKA', '$2y$10$sWVBUo1O0tpVGb.e67ZdRumuXJA4SVYZSl6E8PctOhl8eyOVLk95C', 32, 1, '2026-08-12 09:59:44'),
(1273, '262710279', 'ANDIKA WAHYUDI', '$2y$10$Fnj1Kmy3tigRCYUNEXPPO.A71BqqtX0Q6kCIaRsYWRz4YCrCnD3YK', 32, 1, '2026-08-12 09:59:44'),
(1274, '262710280', 'ASTRI LESTARI', '$2y$10$2aEZVA0RNkPiZTddYFALJeu/3AP9yNfXEPTAAL0KEGoSKYk1CDx3O', 32, 1, '2026-08-12 09:59:44'),
(1275, '262710281', 'ATQIYA RIZKIA ARTANTI', '$2y$10$pkJCyj3qOpyCarJjnzcTV.miCr7FCOzstTSbtFT9mtYPqu.aZndXa', 32, 1, '2026-08-12 09:59:44'),
(1276, '262710282', 'BELVA LUTHFIA NUR AZALIAH', '$2y$10$HETmDWUxhMO2m5bJ8thMueUy7le5UBKhUkwRv9yXty9EKOLbc9BYa', 32, 1, '2026-08-12 09:59:44'),
(1277, '262710283', 'DAVIAN GIVANO SHAQIEL AL FAZHIR', '$2y$10$yThDiDIpZlwJ1Hcw/13cS.6WSsOtNJaB5K5OCNTfoP9zbGi24a0kW', 32, 1, '2026-08-12 09:59:44'),
(1278, '262710284', 'DEVA HERMANSYAH', '$2y$10$/vKr9muQhBVp2mqS2SccxuaRp7WXkDaTBRrqdanujY7VxniRfHgzm', 32, 1, '2026-08-12 09:59:44'),
(1279, '262710285', 'DINDA NUR AMELIA', '$2y$10$CFusI3iApl02tcEmbxCAbO1m73hWwCwk0ebhgW/qfZjHn4ZhUqIfm', 32, 1, '2026-08-12 09:59:44'),
(1280, '262710286', 'ELSA MEILANI', '$2y$10$ib.XTjBbwfBypOsAbT/8ze9G1y.xphlEwrW0d74OK8ZVue9aCL06K', 32, 1, '2026-08-12 09:59:44'),
(1281, '262710287', 'FANESA AULIA RAYI RAMADHANI', '$2y$10$br/53fURV0/RpWzYWitjJO4af3.joeBqjuCgxp.0ZfayPmL5k1/Oy', 32, 1, '2026-08-12 09:59:44'),
(1282, '262710288', 'FAREL FATUROCHIM RIYADI', '$2y$10$rNg9Q014CWVdEynFmX0Oze.6nRbZYX/sxIhPQG9VQQIub45oUuaEO', 32, 1, '2026-08-12 09:59:44'),
(1283, '262710289', 'GIO LAWERGIO SINAGA', '$2y$10$RpTfFUIwXmlyCbr0bXhT7uTGxAkfAS/zeF4XK.PFO44wXT.1GkWNe', 32, 1, '2026-08-12 09:59:44'),
(1284, '262710290', 'HANA MUBARAQ', '$2y$10$g2Yn5kfw5nCpvp3UfNVWNeiK3ZnEJIzuViX4g7E/wc9t55dRYJkmm', 32, 1, '2026-08-12 09:59:44'),
(1285, '262710291', 'JAHIRA DWIYANTI', '$2y$10$OAxtkealpYTamjfCq.4GhOvWU3szx0G9rTBHc.oq/ramwfS7rD4Du', 32, 1, '2026-08-12 09:59:44'),
(1286, '262710292', 'KARTIKA MULIA SARI', '$2y$10$rky40B7Kt6sOsHWX4SPNjO4B/pKML7SUTkRyBQMTtFUAz2Nf8wgPm', 32, 1, '2026-08-12 09:59:44'),
(1287, '262710293', 'LATEEF ARSYAWAL HIMAWAN', '$2y$10$oanaPLic.6j9oVki6Pn0Z.O3UwHBK2KVBwRgDS/ICZ2gJJC2KDtYa', 32, 1, '2026-08-12 09:59:44'),
(1288, '262710294', 'MAYZARRA ADIVA', '$2y$10$l7.hSjP4KoPj9dG9KxaTauMVNpWGMD32yhW2rdt4k..z2G6P.YL2O', 32, 1, '2026-08-12 09:59:44'),
(1289, '262710295', 'MELISA ANGGRAENI', '$2y$10$6sxOxzrIjNmcGviitfAPG.5mOotNFhgBDF58cNkow.gqZ0v.t8vbu', 32, 1, '2026-08-12 09:59:44'),
(1290, '262710296', 'MIKAIL FARRAS FAZA', '$2y$10$n58SrzN.JvfWR9llbHhUSut2yAjUrNaNFEsru.fMERrJudk/Et0qC', 32, 1, '2026-08-12 09:59:44'),
(1291, '262710297', 'MUHAMAD DELVIN ALVIANSYAH', '$2y$10$sGfFojZvbiUK9uTmIDQTN.RKZ.4Q1c8oBOiVwXUhcR3HD7W.Osv6y', 32, 1, '2026-08-12 09:59:44'),
(1292, '262710298', 'MUHAMAD YUSUP', '$2y$10$Oxou./R4bdJUf34Bla9kouR94B2xxtPM86mXcn88ImIfVuwNq25iy', 32, 1, '2026-08-12 09:59:44'),
(1293, '262710299', 'MUHAMAD ZAKKI NOER ALAMSYAH', '$2y$10$fXmeh9QojsL.ak89.1/eyuK8zH2Lq0aHIqtaQofbmw5mSZwe5wnCy', 32, 1, '2026-08-12 09:59:44'),
(1294, '262710300', 'MUHAMMAD ISYA ABDEE ARYADI', '$2y$10$39nsg/Obl9rCnxf4aX5qyuxbVgnMTNmPgnYeQTMt7HxuExH5ytZ12', 32, 1, '2026-08-12 09:59:44'),
(1295, '262710301', 'MUHAMMAD REIHAN SANJAYA', '$2y$10$1J15TJP25Lz6ceAAzOlXF.0r3Dd.re0O0wTBziElGj32i8qfDXdZW', 32, 1, '2026-08-12 09:59:44'),
(1296, '262710302', 'MUHAMMAD SALMAN ATAYA FADHILAH', '$2y$10$tRf5htlZ7FD5DoY80F/gk.WKsQJmLFRoSps7apzi3TNPLDEmoe0zC', 32, 1, '2026-08-12 09:59:44'),
(1297, '262710303', 'NAYLA SRI NURHASANAH', '$2y$10$yO1Hk.cQ.YMV/PauJuxtyukkETIwG/dQGD/dDhHGvtp7ad8.WmlXu', 32, 1, '2026-08-12 09:59:44'),
(1298, '262710304', 'RACHEL PRINCESS SITINJAK', '$2y$10$zBu67El4ak/.3JraQhiPyOMat/RQUPdadVS9GGxNnwnj4tEs7SEB6', 32, 1, '2026-08-12 09:59:44'),
(1299, '262710305', 'RAFA ALIF FATHURAHMAN', '$2y$10$a7GyUP4LlLesxf3uNuY5r.Jgi8jN8CYBnAuUqo2jNZCJ5awNZTV2a', 32, 1, '2026-08-12 09:59:44'),
(1300, '262710306', 'RAHMAT RAMADANI', '$2y$10$X78yTU6Pg5aHPO09erVc2eDTISSXEZIOFCCkok/kgORbNFMV0MS2u', 32, 1, '2026-08-12 09:59:44'),
(1301, '262710307', 'RAISYA RISKI YULIANTI', '$2y$10$0t7uQYplNQO0hnLQKExL7.dJ0UL1N7qGzDKf7ruQAqENjQRIzdJA.', 32, 1, '2026-08-12 09:59:44'),
(1302, '262710308', 'RASYID MUGNI IRAWAN', '$2y$10$UNWuLdoRooX.5nqLylnueOXYItTha86zd5YIIylH2gqe6m8gjNKoa', 32, 1, '2026-08-12 09:59:44'),
(1303, '262710309', 'RAYHANUL HASANAH', '$2y$10$7qjD.gsiPdLZjL/aYWZNVenWXbM1.pcdCuiusQzX.zxfy9uFPD8h6', 32, 1, '2026-08-12 09:59:44'),
(1304, '262710310', 'RIANI DWI SYAHWALANI', '$2y$10$/g67rqzEWgBSe7q8NDoQxO9/nT/ka45xVkxdj33.Bdgcrtgp2DEk2', 32, 1, '2026-08-12 09:59:44'),
(1305, '262710311', 'SAGITA AYU ANDINI', '$2y$10$sjhTu1upBud5P9Fe34o4ieuPmrSlD1IPjn.En75usfuPw9tHjMLIm', 32, 1, '2026-08-12 09:59:44'),
(1306, '262710312', 'SELLY OKTAVIA RAHMAWATI', '$2y$10$J6I8Ph.U6Ll/NH1Yljol1e8z.HHG1QptjFme.VBI1GZ5DjL5GOa7S', 32, 1, '2026-08-12 09:59:44'),
(1307, '262710313', 'SILVYA AZKA RAMDHANI', '$2y$10$yD3vBCo/hV0tKn1TJiAJ/.MXja58SLO0KtGNEawW8wtJUx3ZemWWa', 32, 1, '2026-08-12 09:59:44'),
(1308, '262710314', 'SITI ZAHRO AWALIA APANDI', '$2y$10$gbN/onoNmnoR2ypUAEz/6OLlPIlLHSZyOCgs.eUnyi0l5ZQmIFUra', 32, 1, '2026-08-12 09:59:44'),
(1309, '262710315', 'SYAHRUL ARRIZKYANSYAH', '$2y$10$cCVKN/0ZmLKPc341036Y6.c3fNi4S6EICgz/qZrMo3X97OSIqorrW', 32, 1, '2026-08-12 09:59:44'),
(1310, '262710316', 'TASYA AZMI TABINA', '$2y$10$MVw8p5aSEDcTOB5LreCWMeE8CyRJ7HzSCGDFMOQ4GsnFzd7mGRPdW', 32, 1, '2026-08-12 09:59:44'),
(1311, '262710317', 'TRISTAN SUPENDI', '$2y$10$FG4gVO/b9ex5B4l5xjQ.S.5vE9XPRfDfbkZiWqUbRTCcSMVbsiWOC', 32, 1, '2026-08-12 09:59:44'),
(1312, '262710318', 'USWATUN KHAZANAH', '$2y$10$YcY4f/heA3eTMXy9LM150ef8oHzyrtuNwD1ndt8JvZ2Su5doZUc4q', 32, 1, '2026-08-12 09:59:44'),
(1313, '262710319', 'YUSRIYYAH SITI NUR FADHILAH', '$2y$10$o/1RxavLlNjbPPxVXb3MUOPxJ6GPitKBM//psH4PlXAHolEbfk0ii', 32, 1, '2026-08-12 09:59:44'),
(1314, '262710320', 'ADITYO GALIH PUTRA ROMADHON', '$2y$10$9daGf0848bSS/qfMi.q9G.g1ZcsqH5POePhox5PJ4u9ag35TcQeY2', 33, 1, '2026-08-12 09:59:44'),
(1315, '262710321', 'AGUSTINA RAHMAYANTI', '$2y$10$T4DBpSnOfWCZhqb1va/QBe5r15ho3qmvmL70r9TSVUq0s81lYjxn2', 33, 1, '2026-08-12 09:59:44'),
(1316, '262710322', 'AKMAL ZAID RAMADHAN', '$2y$10$MNt8olZossXvRVh6SZKZHO7KuFreINvFLP16waN3/8Sq9WlC739Bu', 33, 1, '2026-08-12 09:59:44'),
(1317, '262710323', 'ALMIRA RICHIE LUTFIA GASANIA', '$2y$10$BQTpmWrxOUNU8r95uu.O8OIzv8AgEZNJzu4rhdFwsQQMvLQbyV7oW', 33, 1, '2026-08-12 09:59:44'),
(1318, '262710324', 'ANDIKA HERDIANSYAH', '$2y$10$rMBdWRA9E1tKNO2IFQNvj.9zdCLyFcUSGaarxs6Za7vBOS0pFQSFC', 33, 1, '2026-08-12 09:59:44'),
(1319, '262710325', 'ANNISA HANDAYANI YUNIARSIH', '$2y$10$f8LzLU37QwTaJV0IIHq32OtSoxLhpv/f9w6HXOFi2yocWGXDyoFqC', 33, 1, '2026-08-12 09:59:44'),
(1320, '262710326', 'AURELIA KIRANA FITRI', '$2y$10$7/D29HF0GO1/Gg6yPvUsQOxZeDTi9yEayIqyPv5r.KF8OLa2ksdUu', 33, 1, '2026-08-12 09:59:44'),
(1321, '262710327', 'CANTIKA ZAHRA ASYARO', '$2y$10$6QYMQ.Ua3oNGekLGBLPSBedGCPtaMtaDwUKrae/bQ5ppMnrNj7fAW', 33, 1, '2026-08-12 09:59:44'),
(1322, '262710328', 'DEBBY CAHYA FITRI', '$2y$10$47JUmG7/j6bXZ3J1jrhmnOuYLroExCvHKcp8uKhgh8eS4QgkLGW7e', 33, 1, '2026-08-12 09:59:44'),
(1323, '262710329', 'DERI REPANDA PUTRA', '$2y$10$lP2tnsvBcYy6/LC2yxbJJu899L4vhSNJalVvx2qUJ4l/EbVi0GOPS', 33, 1, '2026-08-12 09:59:44'),
(1324, '262710330', 'DWINTANIA ZIELAN NOERASYWAQ', '$2y$10$tKD2nRp28nWyLrFR/.Lr3eG/nRl5rDffT6/lDlWmKCBVYskEM4hnu', 33, 1, '2026-08-12 09:59:44'),
(1325, '262710331', 'FARHAN IBNU SAEPUDIN', '$2y$10$M2zMGm4UH2U8ibxaQ4tIZOBLb5TY4qO.DT1oGXRi5F9uhYBvMutwO', 33, 1, '2026-08-12 09:59:44'),
(1326, '262710332', 'FHARRAND HAZEL ATHYANTA', '$2y$10$JRU0I2YW9X64WtuhkcDlP.wfzDOCNS0XxvnI3jX9/5rTCdijx1rWS', 33, 1, '2026-08-12 09:59:44'),
(1327, '262710333', 'FITRIA RAMADHANI', '$2y$10$YMCsyQqmNeQD07UgAjJpsukw4YjUSmK9Lv6R5McgZbkm9s9p/zmq.', 33, 1, '2026-08-12 09:59:44'),
(1328, '262710334', 'JASMINE SEICA NOORISHE', '$2y$10$HXXTfXhtwER9ZEZO7ugX0.0AITVut5a/gqRrEa7AWovMJOumT19xS', 33, 1, '2026-08-12 09:59:44'),
(1329, '262710335', 'JENNIFER PUTRI DUNGGIO', '$2y$10$ZIVMVXwFMWJklSLR5rws9urAE7hV7buMH9CxgGh6E2e4GtBhipV4W', 33, 1, '2026-08-12 09:59:44'),
(1330, '262710336', 'KAYYISA GANIA AFRIN', '$2y$10$sVa/fDnbHexmlnsyLuHBzuoj2t/loohEMiXnA8BTE4bGNoaTSbBIG', 33, 1, '2026-08-12 09:59:44'),
(1331, '262710337', 'MARTINNIUS HASUNDUNGAN', '$2y$10$/LvbAID6CKx11h6N5exkQeTd2sN.sZ1IdCUbySLEQSnmfPakndddK', 33, 1, '2026-08-12 09:59:44'),
(1332, '262710338', 'MEYSA PUTRI ANISA', '$2y$10$8AfOA9GUKGfpHPd.ffk4XOqWw7BlGkwzxFPr9KKFyy4jYrb1588D.', 33, 1, '2026-08-12 09:59:44'),
(1333, '262710339', 'MOCH GEMA PUTRA', '$2y$10$9uyFvY7anK/EN1XjBGVBeOgp/i1U6xjHYFkmbeXhFMfvKGMXK1Bsa', 33, 1, '2026-08-12 09:59:44'),
(1334, '262710340', 'MUHAMAD FATHUR ROCHMAN', '$2y$10$FACY7/0IL2dc17FLoefZ0e1b30duowgR8HQ8SonLFaoMFFRPbnWpW', 33, 1, '2026-08-12 09:59:44'),
(1335, '262710341', 'MUHAMMAD AGI PUTERA HARTONO', '$2y$10$.jAbnIapDmdBuROVdfh9autLqrtozhWa0.vVGuGNvEMQ2exUYLkm6', 33, 1, '2026-08-12 09:59:44'),
(1336, '262710342', 'MUHAMMAD AZAMY KHALIFA', '$2y$10$XjBgwpqQyag8YlT7iEDGzOEUO6FV3FIu.UB.mP1z.qqOoGOfN84cy', 33, 1, '2026-08-12 09:59:44'),
(1337, '262710343', 'MUHAMMAD YUSRIANANTA', '$2y$10$W/Rc0PSNGGmZC0fNT08tF.A0Uru9oRqpXc43v2drIUNfj0xmziLvG', 33, 1, '2026-08-12 09:59:44'),
(1338, '262710344', 'MUHAMMAD ZAID AKBAR', '$2y$10$A92pexzF7gCMruy5ckzifeeNj4DuWyG1qjR9rrKlqxv60q4BBN.3S', 33, 1, '2026-08-12 09:59:44'),
(1339, '262710345', 'NABILA KAMIL', '$2y$10$QdAmQlfsALJRiQ433EkN6eutpZ5S5B6RHICuVieZYNQoX5E6hKqHG', 33, 1, '2026-08-12 09:59:44'),
(1340, '262710346', 'NAJMAH JALILATUL `ULYA', '$2y$10$Fr9jvkhp.n47UqFGYi4IQOfNktuTm7P5MdFjPskBNb05aHjd69jCi', 33, 1, '2026-08-12 09:59:44'),
(1341, '262710347', 'NENG RAHMA', '$2y$10$b7YZncp3oNsKO59s7rRuF.fizcosaGftcSNTONGa6EfyAJkic8p4O', 33, 1, '2026-08-12 09:59:44'),
(1342, '262710348', 'RAHADIANSYAH NUGRAHA', '$2y$10$McSlqGj2iJCP3eJaVmMQcONDohG3p8UUw0g/DNH3TSnPyUmq1y7Ie', 33, 1, '2026-08-12 09:59:44'),
(1343, '262710349', 'RAISYA ADITYA HERMAWAN', '$2y$10$Ceywk8FLz47M1WNkPmDqQubIppQ5uZgMdnrTYS./VKo//xosTJbaK', 33, 1, '2026-08-12 09:59:44'),
(1344, '262710350', 'RAIZA FAKHIRA HABIBATUL AZIZA', '$2y$10$IrAxyxOsaYYpkGfp831iZOQ7EyMbxQ5byiTMZ6til.PBiB9./Kr1G', 33, 1, '2026-08-12 09:59:44'),
(1345, '262710351', 'REGINA PUTRI SYEIRRA', '$2y$10$X/cRDygLwCH0FRRK5/yxmeksR.tE4pEJq20HXxmr5eRYrEfMj4o9u', 33, 1, '2026-08-12 09:59:44'),
(1346, '262710352', 'REGUEL JULIANDRI SIREGAR', '$2y$10$h2NsuYXFAnNk/WQaMUuecOogTNzQcS5EVawXu8h.aTVD2ZdVg.LWi', 33, 1, '2026-08-12 09:59:44'),
(1347, '262710353', 'REVANIA NUR MALIKA', '$2y$10$mPnwEz/1VzNxyqfarAd4Duvpb8Eht3sYaSzHFEbhicBjJyTWF4AFG', 33, 1, '2026-08-12 09:59:44'),
(1348, '262710354', 'RISTY SEPTIANI', '$2y$10$Al0C3We59V1.5xql30OCgeDICWfGmIvItAaCFLFVoEzzl7umZzwqG', 33, 1, '2026-08-12 09:59:44'),
(1349, '262710355', 'SADDAM RANGGA PRATAMA', '$2y$10$VPwFfzcrA2qnEMFs0SmHHOTp9.nBolgAeJ5NXvNCrVh8OWeSORFl6', 33, 1, '2026-08-12 09:59:44'),
(1350, '262710356', 'SASKIA ARTIYANI', '$2y$10$trSYybL1fHGK60urn5YXdOptoUOKPgRghLCfozo7311clBJgY4/6C', 33, 1, '2026-08-12 09:59:44'),
(1351, '262710357', 'SATRIA AJI PRATAMA', '$2y$10$WCobItQ5GRaYZFZ7e/BXH.pzwPP8Nh61UQ.cBZ7OkXV/MI1CWAnba', 33, 1, '2026-08-12 09:59:44'),
(1352, '262710358', 'SEPTY AMELIA PUTRI', '$2y$10$icTNl1euHr7dxBx3vyJpjOS5jGoxOIopsXfgod9PHtJDWbYA1Eq7S', 33, 1, '2026-08-12 09:59:44'),
(1353, '262710359', 'SINTIA MELATI HUTABARAT', '$2y$10$X4OJr.73aalZQuUr/IXRkOf3U2K635V8EuIk09NNT6d0ui96Buuh2', 33, 1, '2026-08-12 09:59:44'),
(1354, '262710360', 'SITI SISKA NUR ARROJIAH', '$2y$10$5o2TcgIZV5CIgB4Qr8dfROM0fDzcecalXt3qQVLfB2LJgawi2eOuK', 33, 1, '2026-08-12 09:59:44'),
(1355, '262710361', 'SRI NURHAYATI', '$2y$10$btMTvkslDgA9jveFbazfEOcMUF8Q8B6DM6zeM/99aTuktkA1NaEuS', 33, 1, '2026-08-12 09:59:44'),
(1356, '262710362', 'TIFFANI ASTRI APRILIA', '$2y$10$tVpYrw2riUX.GZkHy.3aSeF1YQF8ffq9yw3sU429bU84f/JV8ZsdK', 33, 1, '2026-08-12 09:59:44'),
(1357, '262710363', 'WISNU SUSENO', '$2y$10$KOL4qeC2HyfOPc1imts1meMaMAyOyDFPfo97dCi0x9i9M7N/nvMbe', 33, 1, '2026-08-12 09:59:44'),
(1358, '262710364', 'ZIVARA FAISAL ALDERY', '$2y$10$1oh8qivjbbBZQEC3kbz1Fe5V55fVHlm33zL5IAQDZ4iyBN0OosLra', 33, 1, '2026-08-12 09:59:44'),
(1359, '262710365', 'AKBAR HUSAIN AL KHALID CAHYA', '$2y$10$Xd.FEF.fqrKU6AUmPrflBes9g6Y2NW35VmRZdoPRuz5XDq5Q8.ciy', 34, 1, '2026-08-12 09:59:44'),
(1360, '262710366', 'AL BIANSYAH FITRAN', '$2y$10$B/W/tQTL2ehAW40JgPn2tOoZKGDcB4RWiUNYRFEdgsDDcE4y457/.', 34, 1, '2026-08-12 09:59:44'),
(1361, '262710367', 'AL JALUDIN AKBAR', '$2y$10$VbKCcj8rc3V3BAFTTeaIJe1SeZcqMoB0eT2W/3WCaaS1O/3fPhaIm', 34, 1, '2026-08-12 09:59:44'),
(1362, '262710368', 'ALHANZ NOER KARINA', '$2y$10$MvB3CUooppKv1bd6N0ohaOkYukbN6M6jyDueRH10IHBcD8KMYou4C', 34, 1, '2026-08-12 09:59:44'),
(1363, '262710369', 'ALVINAA RABBANIE', '$2y$10$z69KsIsyh6dUZq50uYUDZepJz46lt2YR53SrwOc6wcavO4NYKLDwG', 34, 1, '2026-08-12 09:59:44'),
(1364, '262710370', 'ARI SETIAWAN', '$2y$10$sZXGqDnH9FLtkVu7FmfjS.awLzB3OjxP1fpBJDcnAeyEoF8ilEQca', 34, 1, '2026-08-12 09:59:44'),
(1365, '262710371', 'ARIN SITI LUTFIAH', '$2y$10$YFg2o6egtSvVoUl/PVwAp.BnD6aHe2izpwxz4UlZ9C4QFEi4SbKOG', 34, 1, '2026-08-12 09:59:44'),
(1366, '262710372', 'AURELLIA DWI PUTRI SURYANTO', '$2y$10$zlPfbm/YnQlh75906IUs3eyyxcKXt6mc1tCSAb1DswmDQ/xaIoEx2', 34, 1, '2026-08-12 09:59:44'),
(1367, '262710373', 'AYRA RIZKIA AHMAD', '$2y$10$6ooa3SaePjm.gIxWi8A3pOrKgdriYUUrUJtj9goFLRcIHmquFplyC', 34, 1, '2026-08-12 09:59:44'),
(1368, '262710374', 'AZZAM ELNAIZAR SAMANA RIJALMI', '$2y$10$G5kqpFbKaLPixEwYEkgX.O12Sqfg93Z9lHq0yY9HpA4fc.t8JPl8y', 34, 1, '2026-08-12 09:59:44'),
(1369, '262710375', 'CLAUDIANA SAHARA', '$2y$10$LX8jtD5zCl4enK3d1qykT.bUT665MarM.3WdUhOzQWiIk56J7qOiq', 34, 1, '2026-08-12 09:59:44'),
(1370, '262710376', 'DESI NOVIANTI', '$2y$10$/8q2Fyqj/RVfQdWNgj4vm.g1I2AFTi1l95eP35M6.STuhkPnqdAkO', 34, 1, '2026-08-12 09:59:44'),
(1371, '262710377', 'DEVIS RAHMAN NANDANA', '$2y$10$iCrXfPnJ5sU/r83dIx.7kuKP.yZovGaGNlsvOarcxV/Cq2kIjjeU2', 34, 1, '2026-08-12 09:59:44'),
(1372, '262710378', 'DZAKIYYAH NAILA ZAHIRA', '$2y$10$CrXhvgL2XO916q2AtF59R.6QzIqGRwc/T6XK8DEQQa8ewI2jtBAl6', 34, 1, '2026-08-12 09:59:44'),
(1373, '262710379', 'FATHAN RAINURA HASYA', '$2y$10$hrlw1sdWo.tjRVvF9PLAaeM/wmjMAqPeo0XpNXLVQMU.J4QwH3Z7q', 34, 1, '2026-08-12 09:59:44'),
(1374, '262710380', 'GARRY RAIHAN FAHREZI', '$2y$10$ht1gIE4jTp059m81Jn7IieWSZmHJJSdeeq1BlELjEuqqBpfZM1mAa', 34, 1, '2026-08-12 09:59:44'),
(1375, '262710381', 'GIYZA ISNANIA ZHAIRA SUPRIATNA', '$2y$10$cczoh22SeVK.b650wf39/.5gzVaK/tUqTEEdTkk3aWEv8WkHDtnhy', 34, 1, '2026-08-12 09:59:44'),
(1376, '262710382', 'INTAN NURHAYATI', '$2y$10$bA8Com42fVdEncgW3tTZeevCwe/n9kU9FSmLysHlUEn0HVJvugqBq', 34, 1, '2026-08-12 09:59:44'),
(1377, '262710383', 'JIHAN SALSABILA RAMADANI', '$2y$10$3aSRgU5I65.MVPyKbDWr1OLNVguP7IEQsFFH6/HB1RWEE3GRKt1O2', 34, 1, '2026-08-12 09:59:44'),
(1378, '262710384', 'KEIRA AL SHINA PUTRI', '$2y$10$fpQRX2kzgqGUUcAxFnDzquK1XgT85I.52BuvBkgjuML8RNlq9GorG', 34, 1, '2026-08-12 09:59:44'),
(1379, '262710385', 'KEISYA INDAH KIRANI PRATAMA', '$2y$10$lKPX/QdqgcfDVWr5hAVoAOYD1bxVEHnV8YXEJzLU6FMdKZdbv3tou', 34, 1, '2026-08-12 09:59:44'),
(1380, '262710386', 'MOCHAMAD FAUZAN MAHESA ZENAR', '$2y$10$pFCSJ6tae0mmKbZ1.yRUnuRCDE1AuZj383XJyiOpPZlZ6E1oiJ/ym', 34, 1, '2026-08-12 09:59:44'),
(1381, '262710387', 'MUHAMAD FAUZI AL-MUZACKY', '$2y$10$qdFc91nO750lANqlHq5XU.SLpiYdVQzc2AYuNvYleiW3fY.kewApi', 34, 1, '2026-08-12 09:59:44'),
(1382, '262710388', 'MUHAMAD IKHSAN RENALDO', '$2y$10$d8Pu/zvEdsiP7jCRe0snwuHKWROqCs55YLQtYzjXc0JIDCr860kTC', 34, 1, '2026-08-12 09:59:44'),
(1383, '262710389', 'MUHAMMAD ARSYAD', '$2y$10$xMcDEQPJLtkvBb54MH4qreBJyZQ5bDftZMl447FYfHNYwzC3e/mmS', 34, 1, '2026-08-12 09:59:44'),
(1384, '262710390', 'MUHAMMAD BILALDI ALFARIZKI', '$2y$10$fMdqCH9nCGIFhGLfleBQnux7fhHJWUqrzlJrkE9Yu5dxYZSRTBRaS', 34, 1, '2026-08-12 09:59:44'),
(1385, '262710391', 'MUHAMMAD ZAENAL ARIF', '$2y$10$z9zSacX/gkaLwI1SOsttyufScuQJ26/p.Pft2x5TqzrGc1n.VXtNG', 34, 1, '2026-08-12 09:59:44'),
(1386, '262710392', 'MUTIA ALBANI SETIAWAN', '$2y$10$Vl1hIchfx3l6dy/VsUP9leGq0abeC.UsPtP9BjZc8DmOZi8aVnL0a', 34, 1, '2026-08-12 09:59:44'),
(1387, '262710393', 'NABILA MULYA PUTRI', '$2y$10$GqCFMxsTbYzUH54LK2hPCuAMW1O8rdauohUbaI4JaTjRQRFZB7AgC', 34, 1, '2026-08-12 09:59:44'),
(1388, '262710394', 'NADHIF FATURROHMAN MUWAFIQ', '$2y$10$eY62dehGqNsG7fqOAvZ63.AewVs1Q3BV5XrFZ5CZNvzi.K3ZRemgW', 34, 1, '2026-08-12 09:59:44'),
(1389, '262710395', 'NAYLA AL-GINA PUTRI', '$2y$10$jkvHzUmOJZNndxLUWxc1teNrpDP0f6yji68.k1Y09tn4saTGxmvGu', 34, 1, '2026-08-12 09:59:44'),
(1390, '262710396', 'NITA KAMILAH', '$2y$10$95KLGJPatdOxRooqWZd0w.8yrCCR6GpYCMg4clvJMYW02V5LZDkFm', 34, 1, '2026-08-12 09:59:44'),
(1391, '262710397', 'PUTRI AULIAWAN', '$2y$10$FdtyoT531CwKajkv8EeK/uLum2J9/GsuiHrU17EXjrLe.D3r8c43y', 34, 1, '2026-08-12 09:59:44'),
(1392, '262710398', 'RAHMA ALIFIYA PUTRI', '$2y$10$Xa7LSgxSZw96jEPhWHkQtec60er46mP/rlScD4/BrwojPBO5.vuju', 34, 1, '2026-08-12 09:59:44'),
(1393, '262710399', 'RAKA SAFEB DIRGANTARA', '$2y$10$y.AmA8x4zRNLvLsQGVtFau2OQCgtIcmMEQNlR5OHssLAlNecMz7vG', 34, 1, '2026-08-12 09:59:44'),
(1394, '262710400', 'RATU KHAYLA YUDHA', '$2y$10$560f319YuwAIz4kjaaOJ9umRZ9Nfnb5SObrDBtaG5yjhvk8ZsC2fm', 34, 1, '2026-08-12 09:59:44'),
(1395, '262710401', 'RAYSHA NAYRA PUTRI', '$2y$10$hXh.ctvh83AbCfZmUp50QOO6taWG014mRC8vtj2TUG7CIK1KI21h6', 34, 1, '2026-08-12 09:59:44'),
(1396, '262710402', 'REFALDO ILHAM', '$2y$10$bjHC.APUHlpFay8SiO5baOMyPwkU5tdoL65WUlteBP4aPHLU4NXdS', 34, 1, '2026-08-12 09:59:44'),
(1397, '262710403', 'RIFFA SYAHWAL', '$2y$10$7mjKnIobveZ.kkpaVMwrreg5Jssx8cWUGoK7hSb.YGoG0JfO4X0ma', 34, 1, '2026-08-12 09:59:44'),
(1398, '262710404', 'SAHA RINI', '$2y$10$Bkf.7hEhi3A2vVK.eTuGn.SAo02GmGnIkTVQrj4Xb0CvCKvhXlmhq', 34, 1, '2026-08-12 09:59:44'),
(1399, '262710405', 'SIFA NUR AINI', '$2y$10$ryzKcRq4y2ZkTTx1xCpiu.V5D2dOtOEA6jfCSNCxaA/aWAViGOCne', 34, 1, '2026-08-12 09:59:44'),
(1400, '262710406', 'SRI PUTRI HOIRUN NISA', '$2y$10$HCP/rFl1d1GO/m1LONHINuazdbSrkk2BhsNlgYxj9qPZf.N4fPLJ2', 34, 1, '2026-08-12 09:59:44'),
(1401, '262710407', 'SUCI RAMDANI', '$2y$10$DbjERxG6qSCP3Tndijv./.ojXHnc7M9RrcisorcRc/FSkQZLEootO', 34, 1, '2026-08-12 09:59:44'),
(1402, '262710408', 'VANESA PUTRI NURAENI', '$2y$10$gra6sZ/X0nzBucqWxhT0nu2/emT4IBxpb0pMgWbnTc4M1dUDVHpiO', 34, 1, '2026-08-12 09:59:44'),
(1403, '262710409', 'VEPEP ERVAN MAULANA', '$2y$10$wfuhFvKXttHh8SMe9Sc1GOVXU8DzW9hBnfTEsyC4LeGHuVtFfng0i', 34, 1, '2026-08-12 09:59:44'),
(1404, '262710410', 'YOSEAS DHANDRA MANAHAN SIMBOLON', '$2y$10$GM6ZmSDRVqaVH0e4UZrcvuVb4P0XkOADsuKTAvKpD5dXE/MTZUV3W', 34, 1, '2026-08-12 09:59:44'),
(1405, '262710411', 'ALFARINI AFRINSI', '$2y$10$XkrSKduU3bSx4RDkaaFm5OVLLEOt2B.dUCjbGyYCnv0oX5Y1215vq', 35, 1, '2026-08-12 09:59:44'),
(1406, '262710412', 'ALI DANENDRA WIDYADHANNA', '$2y$10$GShhQZzfMIslmY7yHLcId.5YWxEJucZAgM7pAAkpbnmwWpEDGUgZ.', 35, 1, '2026-08-12 09:59:44'),
(1407, '262710413', 'ALIA PUTRI RAMDANI', '$2y$10$vI0im9p/FhLMuuW4sm/qnezkxBjNmJnbCCtnRujs7e96qn5QSPefG', 35, 1, '2026-08-12 09:59:44'),
(1408, '262710414', 'ARKA RASSYA ILHAMSYAH', '$2y$10$Dp6aNOd7SpuB6TEEAbG/RO.lGapE.YV5Y.0xPYfTN5StBS/Qdel6K', 35, 1, '2026-08-12 09:59:44'),
(1409, '262710415', 'AULIA AYU LESTARI', '$2y$10$K9as8p3.CCgxCTUBnd4Wx.NlJqHghfGrVJFQURP2FU39vt/fLYmcu', 35, 1, '2026-08-12 09:59:44'),
(1410, '262710416', 'AZRIEL AL HABSY', '$2y$10$I2y41AlpiyPHWw2iQX9..O9mZ1ii11qZXt3B9RVfafJ8OCaZKdTwq', 35, 1, '2026-08-12 09:59:44'),
(1411, '262710417', 'DANELA MOESLEM', '$2y$10$p7aGzagSQs4qmK.UXDyH2O7rc3oAJNFLWc4Vr7K3eYUWeiGWmldI6', 35, 1, '2026-08-12 09:59:44'),
(1412, '262710418', 'DAVINA MULYAWARDANI', '$2y$10$nqheuuGbn8UFU0K/T2BbYeUBqHswnRrYFVODkXzQGweog/6Gq0Ln.', 35, 1, '2026-08-12 09:59:44'),
(1413, '262710419', 'DIKA ARDIAN SAPUTRA', '$2y$10$c2H5EqD4fr3921vQakRM.eGQf7Oh8XLwsLexfmayjkm/rXaRycbA2', 35, 1, '2026-08-12 09:59:44'),
(1414, '262710420', 'EISYA LUNITA', '$2y$10$HbtPpJrSJVjB.7Hu.ParSuVZ/7j2DFGraTG37Ujr1AGK9duM/AJR6', 35, 1, '2026-08-12 09:59:44'),
(1415, '262710421', 'FILIA FAKHIRAH KRESNA', '$2y$10$I/.B7EblH1OXYAjdGabX6OTGTn3bwk.HEToRx4rFHFVo5RXKc12PS', 35, 1, '2026-08-12 09:59:44'),
(1416, '262710422', 'FITRA SANDIANSYAH', '$2y$10$/sJaijh8yN2hOjrOv0Xwh.JT0xcjUdOWENV2t1VUAudf7wHNU3haG', 35, 1, '2026-08-12 09:59:44'),
(1417, '262710423', 'HANIF MUBAROK', '$2y$10$Lmo15oV0Vmfd7jixDrC9f.jWJQC4hlNaw6YIog5ZRbi06Fm6OcZvq', 35, 1, '2026-08-12 09:59:44'),
(1418, '262710424', 'HANZALAH AL GHIFARI AMR MUJAHID', '$2y$10$xwLtHzYKAVZK/afalBKTxeOX22EtzS75OWkVoD/VOnGx8oawOl92u', 35, 1, '2026-08-12 09:59:44'),
(1419, '262710425', 'INDI RODIAWATI', '$2y$10$Cgr6GBkIkJxwe3vMoL37tO0NOpU/YKAA30Uq/kbt9WHRva8qR0xTG', 35, 1, '2026-08-12 09:59:44'),
(1420, '262710426', 'KEISHA ANJELINA PUTRI', '$2y$10$UWjj.Pvp0VoBEQ/aJ0MA0ewf3K2EyaZmJSpPanSfSElMP6HPPqvKS', 35, 1, '2026-08-12 09:59:44'),
(1421, '262710427', 'KEYILA SEPTIMA PUTRI', '$2y$10$.4Ff0mlF0SlubRoUb42djOx4tOdNL3vu2fLbhAHGDLz0lC8rx3XcS', 35, 1, '2026-08-12 09:59:44'),
(1422, '262710428', 'KHAYRA NAUREEN NESYA ANGGARA', '$2y$10$64XnqZAJo.K122ZvD86CO.yVn8cpPuU82hsxG4Lx8JVWbPs8XVtGG', 35, 1, '2026-08-12 09:59:44'),
(1423, '262710429', 'MARSHA BILQIS PUTRI GUNAWAN', '$2y$10$5qzjFygxxJAk7MnvAjLvi.FdIa/TAGxO1h9dk2ZT.9Tscn.a7UkvK', 35, 1, '2026-08-12 09:59:44'),
(1424, '262710430', 'MOCHAMAD IQBAL', '$2y$10$NQj74goLIhxVWo/LL2/jWOzqvdQzRyYxxyUYPmmxd29X9KAxfYnK.', 35, 1, '2026-08-12 09:59:44'),
(1425, '262710431', 'MUHAMAD HAZEL ADIKA DHANA', '$2y$10$2ezdCSUGmmyC94jvsrXUCuexsYDaKvVSA/o/PICxyr5KGYPjwl67O', 35, 1, '2026-08-12 09:59:44'),
(1426, '262710432', 'MUHAMAD ILYAS EKA FAUZI', '$2y$10$zhhQSaTjGFpZNQX2ca/gQuZ4zx0srFn7i9KJKiGf5yHxTYenXN0Fy', 35, 1, '2026-08-12 09:59:44'),
(1427, '262710433', 'MUHAMMAD DZIKRI TAUFANI', '$2y$10$8f/Ng7351D3ZAMSPUfDST.KzzzksJ2EfXLCnP4c.0GK/57Srambvm', 35, 1, '2026-08-12 09:59:44'),
(1428, '262710434', 'MUHAMMAD FAISAL HIDAYAT', '$2y$10$g68MGkSKJwSjS5XpGktG/uQ7CRquuq.sFLZJtFzYG/aSeHe7iZJzy', 35, 1, '2026-08-12 09:59:44'),
(1429, '262710435', 'MUHAMMAD FERDIANSYAH PRATAMA', '$2y$10$80O8jQJB/UVxEkebSYuAPufoYZj7rdHGPg0ymZdZyW3QcKAawUmj.', 35, 1, '2026-08-12 09:59:44'),
(1430, '262710436', 'NABILA NUR ANGGRAENI', '$2y$10$z0zmEkqu3u9omtUUR8dawedBQTFeeghDeCmuJgenzlIFosWa.miOm', 35, 1, '2026-08-12 09:59:44'),
(1431, '262710437', 'NADIA DWI NOVITA SARI', '$2y$10$jZ.bh7MvFk5yiOY3nKObtOdiOVcuOpe2nKa.9EfAlwXmENZaIQ302', 35, 1, '2026-08-12 09:59:44'),
(1432, '262710438', 'NAILA NURAINI', '$2y$10$8qb.rX1w9V66V2r9NPrlI.Kk20ZisyEhvU4pwpJSIIkYm3LW.VjDS', 35, 1, '2026-08-12 09:59:44'),
(1433, '262710439', 'NAJIB ALDAN PERMANA', '$2y$10$.yuJ3EOJ0hzi9hnuxYNkduPKa6FYl1QCIi1rUd8LiwjvJuYkJ3JLy', 35, 1, '2026-08-12 09:59:44'),
(1434, '262710440', 'NENG QILLA SITI MASBUBAH', '$2y$10$LwYIhx933hmzLoKzUPpz3ONC/H.3D.Fiq59geb0/QKRpAnkX6TocK', 35, 1, '2026-08-12 09:59:44'),
(1435, '262710441', 'NOVA REFANI', '$2y$10$L5e.qQM0T0edZHNWqOwrc.l0jx3FN3Gd5G20XYuiYO97qxWtT5tc.', 35, 1, '2026-08-12 09:59:44'),
(1436, '262710442', 'REGINA RIZKY AQILAHUSNA', '$2y$10$KSX/S9SXuWTPchCRg584HujJ8d/fKbo5SV0L41ZjVfaK.FZc5j/hK', 35, 1, '2026-08-12 09:59:44'),
(1437, '262710443', 'RENDI ARDIANSYAH', '$2y$10$5S3zZlX9v1D3bN3Hw1GKPO5yOozGHVx9rUg88gAePbEIU0csV5LS2', 35, 1, '2026-08-12 09:59:44'),
(1438, '262710444', 'RENGGANIS ADINDA PUTRI', '$2y$10$wk7cj6E3gauBjUHvnKffmeh.NE7qnnqLWeBUFCDCxj4kYc5MuY9wG', 35, 1, '2026-08-12 09:59:44'),
(1439, '262710445', 'REVANO RIZKY PRATAMA', '$2y$10$nhSMBaf7ynvX/tfj/5xInOtT0ZEsBXw6fiCxKQYoM6HTXdtIlwsmK', 35, 1, '2026-08-12 09:59:44'),
(1440, '262710446', 'RISKA NOVIYANTI', '$2y$10$EWR3jhbB95Dqw.oGSpKXre6HHsBm7EoXWTGkbPKbvVlJvzb2V4FlS', 35, 1, '2026-08-12 09:59:44'),
(1441, '262710447', 'RIZKY FEBRIAN TAMSIRIN', '$2y$10$AzMF2qs88cykBJKCp0AbfevDH8SwBm8Nc9kd4peveLDwPIVp4qhNi', 35, 1, '2026-08-12 09:59:44'),
(1442, '262710448', 'SALMA RAMADHANI PUTRI', '$2y$10$DGKcCPATcWIEpOUugGWiweESb6PIJ/DqAdlSbJGRdgWUNQzXEvCni', 35, 1, '2026-08-12 09:59:44'),
(1443, '262710449', 'SELVINA WIEDYA LATIFFA', '$2y$10$1yLapVnZxUjr3z9nC5Wjie7ks4fRycoehPlokKyaUKvWL.3g.hrxC', 35, 1, '2026-08-12 09:59:44'),
(1444, '262710450', 'SITI ALYA CAHYA KURNIA', '$2y$10$2dI07TyKoC4uEzcgv4kKQOZNAJQxKKVYNLTQLv2kvptXQ3doRClpe', 35, 1, '2026-08-12 09:59:44'),
(1445, '262710451', 'SULTHAN DERI RADITYA', '$2y$10$cDERLIc3VdTvubJbShQD0OZKQsymTVZEW1q12TmwIdKcWEaHO8ldG', 35, 1, '2026-08-12 09:59:44'),
(1446, '262710452', 'SUSAN CINTA APRILIA', '$2y$10$m.nndSseUAJftxyUf.wmuuDnOOm8SnDbRidNY1CbwcV/PQ73RvmHe', 35, 1, '2026-08-12 09:59:44'),
(1447, '262710453', 'TASA FATIMAH AZZAHRA', '$2y$10$W5DZUhNZ/XgIfTe5UqpG4e477oS7B9sU0xFFypF.1Frdza1ftE.My', 35, 1, '2026-08-12 09:59:44'),
(1448, '262710454', 'VANI ROSELA', '$2y$10$KDUUgYA2ItisAvd.quwvuuZUSjuty6/iSbM2o6wjzKxGkbqyJwVaC', 35, 1, '2026-08-12 09:59:44'),
(1449, '262710455', 'ZIHAYDIN BADAR AKBAR SALAM', '$2y$10$Fs3VsKkcyXHDxjDEASy/UeTy7oUQLwz8caR2F/jrzxGquB9ng1.oK', 35, 1, '2026-08-12 09:59:44'),
(1450, '262710456', 'ZILDAN BELVA PRAYATA', '$2y$10$L/JjIjApVm3Wi1a/F3ImIOVRUxgkaJCbS4GzlA2LHIVqitryAfjCK', 35, 1, '2026-08-12 09:59:44'),
(1451, '262710457', 'ABDULLAH ZAHIR', '$2y$10$GUIaWek/z8MGDQL86sfbAeUCo1HuTiKxJQ9fLojV/gkVoJlph7LCi', 36, 1, '2026-08-12 09:59:44'),
(1452, '262710458', 'ADITYA BAIHAQI AL LAIL', '$2y$10$zxffsUw12PzoLkPuVe3rR.tprVpDKpkeB9DD7L6xdih97iN3a4Nr2', 36, 1, '2026-08-12 09:59:44'),
(1453, '262710459', 'ALINA SUKMA', '$2y$10$.uvTLQf3waqU03s3qCkuveXYvqhYZDmww/YTSPMoWhIcx/t9r3j6G', 36, 1, '2026-08-12 09:59:44'),
(1454, '262710460', 'ALVIN ILHAM RAMDHANI', '$2y$10$vF6JQC39cOUSwTSkd1av2.COFdSLi0oWX.ZdIYxiRRG1Qc5cp9czu', 36, 1, '2026-08-12 09:59:44'),
(1455, '262710461', 'AMANDA TIFANY PUTRI', '$2y$10$aPYHlKnj5FvsSs9hpB.pQ.YcZXLI05JaoNdMIVXeu9.nfr1GLAb.q', 36, 1, '2026-08-12 09:59:44'),
(1456, '262710462', 'ARY FIRMANSAH', '$2y$10$hFBpt2vOAKITRutz/qU6ielw7pGfzjh2SQ3hV17cBAWfQFko.6oC2', 36, 1, '2026-08-12 09:59:44'),
(1457, '262710463', 'AYRA FAZIA SHAFANA', '$2y$10$pX8V.sAhX0LlUSW7mdqIEuN6NsnDVGClfvH9HjItZ7osdrY8A0axW', 36, 1, '2026-08-12 09:59:44'),
(1458, '262710464', 'BIANKA RAMADHANI', '$2y$10$SjWUFKCCKX/0N8CZm4KN6.cN/ByZl0B3.GeXfhplORZ6iyvGM.DiW', 36, 1, '2026-08-12 09:59:44'),
(1459, '262710465', 'DAFFA NAUFAL RAMADHAN', '$2y$10$wzgCspbkZyE8XaxFIOZy0Oz2vnCtOelaCXvSlq.Bz569oh8yWBwTe', 36, 1, '2026-08-12 09:59:44'),
(1460, '262710466', 'DEDE AWAL NATAN RAMADANI', '$2y$10$zNITJBYlD/SC2MW2cXZZ7OUnFniRwDLmGX9B/E.luGx5VtKt0QzP.', 36, 1, '2026-08-12 09:59:44'),
(1461, '262710467', 'DESI ROS AZHARI', '$2y$10$KYjtoHrP8LGC5fpQ5RfvAOUDdTKSjIx8yQWXJp0kWczlIdyVyjV3G', 36, 1, '2026-08-12 09:59:44'),
(1462, '262710468', 'DIKI ARDIAN SAPUTRA', '$2y$10$YYDK50Bn/pA8yFB3rMcf2..6WRo0ZZbxj98FY374EH0uWExSpWzJ6', 36, 1, '2026-08-12 09:59:44'),
(1463, '262710469', 'FIRLY WIANY PUTRI', '$2y$10$rQzg.Yct7TUz4s472Wbkf.Ez.DiVzLt3FA9dVaUuiUSIAerUYM0p.', 36, 1, '2026-08-12 09:59:44'),
(1464, '262710470', 'FIRZA AZMI IRAWAN', '$2y$10$3ppT.2KcjmS13dgIt0DYdeMqYMIixX0HIOr3uCLuGHOylz/JmC33K', 36, 1, '2026-08-12 09:59:44'),
(1465, '262710471', 'HAFIEZH AS SALAM', '$2y$10$.p2nG6Y4y2OBarYs/K9mMO.Bf.uAMfCcUNiTpkltykRH7RRR9K882', 36, 1, '2026-08-12 09:59:44'),
(1466, '262710472', 'ISMI QURROTA AINI', '$2y$10$BtmxepcTApUi.guXLlfNVemUPXYtwsXB16mYwdP3hBOZkI9A64ZZq', 36, 1, '2026-08-12 09:59:44'),
(1467, '262710473', 'KAYSAFA NABAWI HERMAWAN', '$2y$10$y.qfwE4Qgr33V2O97SPHGOoLt21Q.9yDgavnhDNPJvEB6RenH6XR.', 36, 1, '2026-08-12 09:59:44'),
(1468, '262710474', 'KEYLA KIRANA PUTRI', '$2y$10$.93ZwgxDR5JTtgaXiOIcquXcyai.X0pUjH148PZhe1sQAfXzq7gtq', 36, 1, '2026-08-12 09:59:44'),
(1469, '262710475', 'KHARINISA NUNGKY ASTUTI', '$2y$10$rn4/a37aMNvKYTRWx9dcjOBi6GB8fSRzizh0886jy32uQ4MBGQNN.', 36, 1, '2026-08-12 09:59:44'),
(1470, '262710476', 'MOCHAMMAD DHESTYAN FICKRY', '$2y$10$ZSQLApNLTGJwFvnswLQZ9OcyKEAgVO64EDJyL0k0gqEzlZKqKuTDK', 36, 1, '2026-08-12 09:59:44'),
(1471, '262710477', 'MOH. ASEP RAMDAN', '$2y$10$GayVdAvOAlL0pY72UvwHv.xxh5bLDPvLSj2WjH4YpOdxwuL5jRWPi', 36, 1, '2026-08-12 09:59:44');
INSERT INTO `siswa` (`id`, `nis`, `nama_lengkap`, `password`, `kelas_id`, `is_active`, `created_at`) VALUES
(1472, '262710478', 'MUHAMAD RAFA RAHAYU', '$2y$10$MuytxaCfQ0x0368Lh2TEIOCUz.JZ5/xpl494vxDkSC.HFgpkPgfG2', 36, 1, '2026-08-12 09:59:44'),
(1473, '262710479', 'MUHAMMAD ATHAR HASANUL WAFA', '$2y$10$m8/5uaNCGJdRqa8jFV4dpOkBzFpi/UvVscwLxTCaYq9agLkwpZVGS', 36, 1, '2026-08-12 09:59:44'),
(1474, '262710480', 'MUHAMMAD FACHRY PRADANA', '$2y$10$UiHUxFvuRFzyDZOCnJX/KeA6.qsVAi.gPloTSa4wFulIlz5HSG93W', 36, 1, '2026-08-12 09:59:44'),
(1475, '262710481', 'MUHAMMAD ZAKY DWIRA NUGRAHA', '$2y$10$GBIBy.4DYrxw03oQLnUps.1BlnOCj8m8hkVujbS0lG65PPY4apAiK', 36, 1, '2026-08-12 09:59:44'),
(1476, '262710482', 'NABILA NUR OKTAVIANI', '$2y$10$qa1pyR97Y9yAIl0URZiqD.dH.8GjQVihOlasgNG5X7OoHf3QBKdiO', 36, 1, '2026-08-12 09:59:44'),
(1477, '262710483', 'NADHILA RIFDAH FAKHIRA', '$2y$10$O3zJSzeIvg.M3dDR9xsGvehCP.0jQO.EkOMHbhH/AhEFrHWMi598u', 36, 1, '2026-08-12 09:59:44'),
(1478, '262710484', 'NAILSHA ALZENA ALMAGHVIRAH', '$2y$10$X0vJovBWW3PcgTyk6k9QTu1zfKBsaFQ/XZamNyYT2rJw2EQ5FE78S', 36, 1, '2026-08-12 09:59:44'),
(1479, '262710485', 'NUR HAZIZAH', '$2y$10$Agpun6XfzNOxUV6Qw7xXE.Qqp2HCAiv388WqbW7tUCZxfjatE3wpq', 36, 1, '2026-08-12 09:59:44'),
(1480, '262710486', 'PRAMUDYA FAJAR SANTOSO', '$2y$10$GlFKdKAs2eQONMIpXSuZE.0QuEMgOqYRsGg47qWcRclRo/WLLLov.', 36, 1, '2026-08-12 09:59:44'),
(1481, '262710487', 'RENO ABIDIN', '$2y$10$3q7fCwsNIyBJdPP4ctLCA.xOwe4nS.Lf2sHr8767S4YHcLVApWOnu', 36, 1, '2026-08-12 09:59:44'),
(1482, '262710488', 'REVAN ANDRIYANSYAH', '$2y$10$xyCFy2pQai/5d2ToYgl6P.5rGLYSYF3RKPdhxcwrulwHU790P5ccu', 36, 1, '2026-08-12 09:59:44'),
(1483, '262710489', 'RIANTI ZAHRA', '$2y$10$ltyPp/bYdR1dzjoxganXUukQAK9O4KNlbFvCeUeOba1SPneoLSS96', 36, 1, '2026-08-12 09:59:44'),
(1484, '262710490', 'RINDIANI MAYLANSIS', '$2y$10$w4PpqhfJQ5phOtJj5ViT.OV.Zpm6iLmByUDsB1ih85reyBdgDDFhC', 36, 1, '2026-08-12 09:59:44'),
(1485, '262710491', 'ROBBY MUHAMAD DEVANO', '$2y$10$OGIEJl2AGlXyt4yYNwcR9.uaBeyrak6A.7vYqGydGjzJlVcbmJxD.', 36, 1, '2026-08-12 09:59:44'),
(1486, '262710492', 'SALSABILA NUR`AENI', '$2y$10$UI654XcaYaS14HGw6jhiJer/5NYnb.x9/Pa2a2fM06t4XT/Uwc/mm', 36, 1, '2026-08-12 09:59:44'),
(1487, '262710493', 'SHALFA REGISTA AZAHRA', '$2y$10$hDjlPHkbB.OqIv99NredTuzm3cW3GKKfFQiNb8d3ZIaFIe25NgZta', 36, 1, '2026-08-12 09:59:44'),
(1488, '262710494', 'SISKA PRIYANI SURYADINATA', '$2y$10$npSrO73772dJjs27HAtGdufQ6c7.k6qS0/ydgZ7m5QJduA31wL192', 36, 1, '2026-08-12 09:59:44'),
(1489, '262710495', 'SITI NURUL SYIFA', '$2y$10$tEH/E9eFT.XyzyMIYbAffOu.uuTQ5FjSf6UOWDaFyPCf07AZEkS/2', 36, 1, '2026-08-12 09:59:44'),
(1490, '262710496', 'SYAFA KHOERUNNISA', '$2y$10$.BzB5VP4gKtVuEOyqBSey.hzk6Whah6znzycqMSp4FVei4jii3ewy', 36, 1, '2026-08-12 09:59:44'),
(1491, '262710497', 'VIANI LATIFAH', '$2y$10$GwM8EWWM8jFDnJDRlUTwo.ThV0pwaZTd8I2rwO3vGRpA3rJyfM0am', 36, 1, '2026-08-12 09:59:44'),
(1492, '262710498', 'YASHINTA KIRANA', '$2y$10$CNzOhIIfSuPucJgWbjf./O6.LryVIZSBIt5/qEzTa7/hNdMyCrc1m', 36, 1, '2026-08-12 09:59:44'),
(1493, '262710499', 'YULISTYA AMELDA', '$2y$10$26WkoBTHvqCj0.cwGX93vOWvN.zp6e8nPDJSxstzIDPmjQ2899ofK', 36, 1, '2026-08-12 09:59:44'),
(1494, '262710500', 'ZUBAIR HAFIIZH SOEDANTO', '$2y$10$Y4oAKGzgX5fpxXBWLlfH/.NN0dtL4X0MUUoRsiOTS1Ka4dnbcOomq', 36, 1, '2026-08-12 09:59:44'),
(1495, 'TEST9999', 'Siswa Uji Coba', '$2y$10$Tr3isNIAj5aTEhI4f7ask.GxNwDQ/ZSM7VXqwoC616p2YlBPIWLXK', 9, 1, '2026-08-12 09:59:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE `ujian` (
  `id` int(11) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `mata_pelajaran` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `tanggal_mulai` datetime DEFAULT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  `durasi_menit` int(11) NOT NULL DEFAULT 60,
  `status` enum('draft','aktif','selesai') NOT NULL DEFAULT 'draft',
  `acak_soal` tinyint(1) NOT NULL DEFAULT 0,
  `tampilkan_hasil` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ujian`
--

INSERT INTO `ujian` (`id`, `judul`, `mata_pelajaran`, `deskripsi`, `tanggal_mulai`, `tanggal_selesai`, `durasi_menit`, `status`, `acak_soal`, `tampilkan_hasil`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Asesmen Jaringan Dasar', 'Jaringan Komputer', 'Ujian non-PG jaringan komputer untuk kelas XII RPL.', '2026-08-12 07:00:00', '2026-08-19 23:59:59', 30, 'aktif', 0, 1, 1, '2026-08-12 09:32:45', '2026-08-12 09:32:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian_kelas`
--

CREATE TABLE `ujian_kelas` (
  `id` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ujian_kelas`
--

INSERT INTO `ujian_kelas` (`id`, `id_ujian`, `id_kelas`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian_soal`
--

CREATE TABLE `ujian_soal` (
  `id` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `urutan` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `ujian_soal`
--

INSERT INTO `ujian_soal` (`id`, `id_ujian`, `id_soal`, `urutan`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4);

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `bank_soal`
--
ALTER TABLE `bank_soal`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_jawaban` (`id_sesi`,`id_ujian_soal`),
  ADD KEY `fk_jawaban_us` (`id_ujian_soal`),
  ADD KEY `idx_jawaban_sesi` (`id_sesi`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_kelas` (`nama_kelas`);

--
-- Indeks untuk tabel `log_aplikasi`
--
ALTER TABLE `log_aplikasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_user` (`user_type`,`user_id`),
  ADD KEY `idx_log_aksi` (`aksi`),
  ADD KEY `idx_log_created` (`created_at`);

--
-- Indeks untuk tabel `pasangan_menjodohkan`
--
ALTER TABLE `pasangan_menjodohkan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pasangan_soal` (`id_soal`);

--
-- Indeks untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pengumuman_ujian` (`id_ujian`),
  ADD KEY `fk_pengumuman_kelas` (`id_kelas`),
  ADD KEY `fk_pengumuman_admin` (`created_by`),
  ADD KEY `idx_pengumuman_tipe` (`tipe`),
  ADD KEY `idx_pengumuman_ditampilkan` (`ditampilkan`);

--
-- Indeks untuk tabel `sesi_ujian`
--
ALTER TABLE `sesi_ujian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_sesi` (`id_ujian`,`id_siswa`),
  ADD KEY `idx_sesi_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `idx_siswa_kelas` (`kelas_id`);

--
-- Indeks untuk tabel `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ujian_admin` (`created_by`),
  ADD KEY `idx_ujian_status` (`status`);

--
-- Indeks untuk tabel `ujian_kelas`
--
ALTER TABLE `ujian_kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_ukelas` (`id_ujian`,`id_kelas`),
  ADD KEY `fk_ukelas_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `ujian_soal`
--
ALTER TABLE `ujian_soal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_us` (`id_ujian`,`id_soal`),
  ADD KEY `fk_us_soal` (`id_soal`),
  ADD KEY `idx_us_ujian` (`id_ujian`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `bank_soal`
--
ALTER TABLE `bank_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `log_aplikasi`
--
ALTER TABLE `log_aplikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pasangan_menjodohkan`
--
ALTER TABLE `pasangan_menjodohkan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sesi_ujian`
--
ALTER TABLE `sesi_ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1496;

--
-- AUTO_INCREMENT untuk tabel `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `ujian_kelas`
--
ALTER TABLE `ujian_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `ujian_soal`
--
ALTER TABLE `ujian_soal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jawaban`
--
ALTER TABLE `jawaban`
  ADD CONSTRAINT `fk_jawaban_sesi` FOREIGN KEY (`id_sesi`) REFERENCES `sesi_ujian` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jawaban_us` FOREIGN KEY (`id_ujian_soal`) REFERENCES `ujian_soal` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pasangan_menjodohkan`
--
ALTER TABLE `pasangan_menjodohkan`
  ADD CONSTRAINT `fk_pasangan_soal` FOREIGN KEY (`id_soal`) REFERENCES `bank_soal` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `fk_pengumuman_admin` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pengumuman_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pengumuman_ujian` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `sesi_ujian`
--
ALTER TABLE `sesi_ujian`
  ADD CONSTRAINT `fk_sesi_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sesi_ujian` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `fk_siswa_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `ujian`
--
ALTER TABLE `ujian`
  ADD CONSTRAINT `fk_ujian_admin` FOREIGN KEY (`created_by`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `ujian_kelas`
--
ALTER TABLE `ujian_kelas`
  ADD CONSTRAINT `fk_ukelas_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ukelas_ujian` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `ujian_soal`
--
ALTER TABLE `ujian_soal`
  ADD CONSTRAINT `fk_us_soal` FOREIGN KEY (`id_soal`) REFERENCES `bank_soal` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_us_ujian` FOREIGN KEY (`id_ujian`) REFERENCES `ujian` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
