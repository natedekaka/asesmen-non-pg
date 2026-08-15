# Asesmen Non-PG

Aplikasi asesmen/ujian online **non pilihan ganda** — siswa menjawab dengan **essay**, **menjodohkan**, dan **isian singkat**, dilengkapi sistem **koreksi hybrid** (otomatis untuk isian & menjodohkan, manual untuk essay). Alur mengikuti aplikasi `exam6lock/` di workspace ini, dengan login terpisah untuk siswa dan admin.

## Fitur

### Login Terpisah
- **Login Siswa** (`/login_siswa.php`): NIS sebagai username, kata sandi awal = NIS
- **Login Admin** (`/login_admin.php`): username `admin`, password `admin123`
- Kedua login dilindungi **CSRF token**

### Panel Admin
- **Dashboard**: statistik ringkasan (bank soal, siswa aktif, total ujian, sesi yang perlu dikoreksi) + ujian terbaru
- **Bank Soal** (`admin/soal/`): CRUD soal essay / isian singkat / menjodohkan, lengkap dengan petunjuk, poin, dan kunci jawaban
- **Import Soal** (`admin/import_soal.php`): import massal soal dari file CSV (format: `tipe,pertanyaan,kunci,poin`; kunci isian alternatif dipisah `||`; soal menjodohkan pasangannya diatur manual setelah import)
- **Ujian** (`admin/ujian/`): CRUD ujian, pengaturan waktu/jadwal, opsi acak soal, tampilkan hasil, status (draft/aktif/selesai), pemilihan soal & kelas peserta
- **Kelola Siswa** (`admin/kelola_siswa.php`): CRUD siswa, import/export CSV, reset password
- **Kelola Kelas** (`admin/kelola_kelas.php`): CRUD kelas dengan jumlah siswa
- **Koreksi & Nilai** (`admin/koreksi/`): koreksi sesi per ujian — skor otomatis (isian & menjodohkan) dan koreksi manual essay (skor 0..poin + catatan)
- **Rekap Nilai** (`admin/rekap_nilai.php`): rekap nilai per ujian dengan rata-rata & export CSV
- **Monitor Ujian** (`admin/monitor_ujian.php`): pantau ujian aktif real-time (sedang berlangsung / sudah submit / sudah dinilai)
- **Analytics** (`admin/analytics.php`): ringkasan statistik ujian, peserta, dan rata-rata skor
- **Pengumuman** (`admin/pengumuman.php`): kelola pengumuman untuk siswa
- **Ganti Kata Sandi** (`admin/ganti_password.php`): ubah kata sandi admin
- **Log Aplikasi** (`admin/log_aplikasi.php`): audit trail aktivitas aplikasi
- **Backup & Restore** (`admin/backup_restore.php`): backup (unduh `.sql`) dan restore database

### Area Siswa
- **Dashboard** (`siswa/index.php`): daftar ujian aktif untuk kelasnya + riwayat ujian
- **Mulai Ujian** (`siswa/mulai_ujian.php`): halaman konfirmasi sebelum memulai ujian
- **Lembar Ujian** (`siswa/ujian.php`): navigasi soal, **timer mundur**, **autosave otomatis**, konfirmasi pengumpulan
- **Hasil Ujian** (`siswa/hasil.php`): lihat skor/nilai (tergantung opsi "tampilkan hasil")
- **Detail Jawaban** (`siswa/detail_jawaban.php`): analisis jawaban per soal dengan kunci, skor, dan catatan koreksi
- **Profil** (`siswa/profil.php`): lihat data (nama, NIS, kelas)
- **Ganti Kata Sandi** (`siswa/ganti_password.php`): ubah kata sandi (lama, baru, konfirmasi)
- **Pengumuman** (`siswa/pengumuman.php`): lihat pengumuman dari admin

### Koreksi Hybrid
- **Isian Singkat** → dikoreksi otomatis (case-insensitive, jawaban alternatif dipisah `||`)
- **Menjodohkan** → dikoreksi otomatis (skor proporsional per pasangan benar)
- **Essay** → dikoreksi manual oleh admin dengan skor 0..poin + catatan

### Keamanan
- CSRF token pada semua form & API (`api/submit.php`, `api/autosave.php`)
- Password di-hash dengan `password_hash` (bcrypt)
- Prepared statements untuk semua query database
- Session regenerate saat login

## Teknologi

- PHP 8.2 (Apache) — Docker image `php:8.2-apache`
- MariaDB 10.11
- Tailwind CSS v4 (dibuild via Tailwind CLI)
- Docker Compose

Tampilan mengikuti gaya `exam6lock/`: **sidebar admin** dengan menu berkelompok (Ringkasan, Ujian, Nilai & Analisis, Data Master, Pengaturan), **stat cards** berikon & berwarna dengan efek hover, **halaman login glassmorphism** bergradien, dan **navbar siswa** putih modern. CSS tambahan ada di `assets/css/theme.css`.

## Data Siswa

Data siswa = data `exam6lock` (1.493 siswa, 34 kelas `X-1` … `XII-11`). Password siswa = password aslinya di exam6lock (default = NIS). Impor dilakukan via migrasi `db/migrations/002_import_siswa_exam6lock.sql` (idempoten, `INSERT IGNORE`).

Contoh login siswa:
- NIS: `23001` / Password: `23001` (seed asesmen)
- NIS: `242510001` / Password: `242510001` (dari exam6lock)

## Cara Menjalankan

```bash
cd src
docker compose up -d
```

| Service    | Port  | Akses                 |
|------------|-------|-----------------------|
| Web app    | 9320  | http://localhost:9320 |
| phpMyAdmin | 9321  | http://localhost:9321 |
| Database   | 3320  | host `localhost`, user `root`, password `rootpass` |

- Login admin: `admin` / `admin123`
- Database diinisialisasi dari `db/schema.sql` saat pertama kali dibuat (volume `asesmen-dbdata`)

## Struktur

```
src/
├── config/
│   └── database.php     # koneksi DB dari env (DB_HOST/DB_USER/DB_PASS/DB_NAME)
├── core/
│   ├── Database.php     # wrapper koneksi mysqli
│   ├── functions.php    # helper: e(), redirect(), CSRF, flash, require_admin/siswa
│   └── init.php         # bootstrap (memuat core/functions.php)
├── db/
│   ├── schema.sql       # skema + data awal
│   ├── migrations/      # file migrasi SQL (001_add_pengumuman, 002_import_siswa)
│   ├── import_siswa_exam6lock.sql   # data siswa exam6lock (referensi)
│   └── asesmen_non_pgbackup.sql     # backup database
├── admin/               # panel admin
│   ├── index.php        # dashboard
│   ├── soal/            # CRUD bank soal (index/tambah/edit/hapus, _form)
│   ├── ujian/           # CRUD ujian (index/tambah/edit/hapus, kelas, soal, _form)
│   ├── koreksi/         # koreksi sesi, nilai, rekap, rekap cetak
│   ├── siswa/           # daftar siswa
│   ├── kelas/           # daftar kelas
│   ├── kelola_siswa.php # CRUD siswa + import/export CSV
│   ├── kelola_kelas.php # CRUD kelas
│   ├── import_soal.php  # import soal dari CSV
│   ├── monitor_ujian.php
│   ├── analytics.php
│   ├── rekap_nilai.php
│   ├── pengumuman.php
│   ├── ganti_password.php
│   ├── log_aplikasi.php
│   └── backup_restore.php
├── siswa/               # area siswa
│   ├── index.php        # dashboard (ujian aktif + riwayat)
│   ├── mulai_ujian.php
│   ├── ujian.php        # lembar ujian (timer + autosave)
│   ├── hasil.php
│   ├── detail_jawaban.php
│   ├── profil.php
│   ├── ganti_password.php
│   └── pengumuman.php
├── api/
│   ├── autosave.php     # simpan otomatis jawaban (CSRF via header/body)
│   └── submit.php       # kumpulkan ujian + hitung skor otomatis
├── views/
│   ├── layout_admin_top.php / layout_admin_bottom.php
│   ├── layout_siswa_top.php / layout_siswa_bottom.php
│   └── admin_sidebar.php   # menu sidebar + active state
├── assets/
│   ├── css/
│   │   ├── main.css     # sumber Tailwind (jangan edit app.css, edit ini lalu build)
│   │   ├── app.css      # hasil build Tailwind
│   │   └── theme.css    # gaya khusus (sidebar, stat cards, login, navbar siswa)
│   └── js/ujian.js      # timer + autosave di lembar ujian
├── .env.example         # contoh konfigurasi env
├── docker-compose.yml
├── Dockerfile
└── package.json         # Tailwind CLI (dev/build)
```

## Skema Database

| Tabel               | Keterangan                                  |
|---------------------|---------------------------------------------|
| `admin_users`       | akun admin                                  |
| `kelas`             | daftar kelas (`nama_kelas` unik)            |
| `siswa`             | data siswa (NIS unik, password bcrypt, FK ke kelas) |
| `bank_soal`         | bank soal (essay / isian / menjodohkan)     |
| `pasangan_menjodohkan` | pasangan soal menjodohkan                |
| `ujian`             | ujian (judul, mapel, jadwal, durasi, acak soal, tampilkan hasil, status) |
| `ujian_soal`        | soal yang dipilih dalam ujian (dengan urutan) |
| `ujian_kelas`       | kelas peserta ujian                          |
| `sesi_ujian`        | sesi pengerjaan per siswa (berlangsung/submitted/dinilai) |
| `jawaban`           | jawaban siswa + skor + status koreksi        |
| `pengumuman`        | pengumuman untuk siswa                       |
| `log_aplikasi`      | log aktivitas aplikasi                       |

## Migrasi Database

Jalankan migrasi baru secara berurutan jika ada perubahan skema:

```bash
docker compose exec -T db mariadb -u root -prootpass asesmen_non_pg < db/migrations/002_import_siswa_exam6lock.sql
```

Aturan: buat file migrasi baru (jangan mengubah yang lama), dan sinkronkan juga `db/schema.sql`.

## Pengembangan CSS (Tailwind v4)

```bash
npm install
npm run build      # sekali jalan
npm run dev        # mode watch
```

Jangan mengedit `assets/css/app.css` — edit `assets/css/main.css` lalu build.
`assets/css/theme.css` berisi gaya khusus (sidebar, stat cards, login, navbar siswa) dan dimuat setelah `app.css`, jadi tidak perlu rebuild untuk perubahan tampilan.

## API

- `POST /api/autosave.php` — simpan otomatis jawaban saat ujian berlangsung (header `X-CSRF-Token` atau body `csrf_token`). Menyimpan dengan `INSERT ... ON DUPLICATE KEY UPDATE`.
- `POST /api/submit.php` — mengumpulkan ujian: menyimpan semua jawaban, menghitung skor otomatis (isian & menjodohkan), menandai essay `belum`, dan memperbarui status sesi menjadi `submitted`.

## Catatan

- Jumlah soal dan kelas peserta diatur per ujian dari panel admin.
- Skor otomatis (isian & menjodohkan) langsung dihitung saat siswa menekan kumpulkan.
- Siswa melihat hasil penuh (per-soal) setelah pengajar mengoreksi, kecuali opsi "tampilkan hasil" dimatikan pada ujian.
- Gunakan NIS sebagai username dan kata sandi awal; ganti setelah login untuk keamanan.
