# Asesmen Non-PG

Aplikasi asesmen/ujian online **non pilihan ganda** — menjawab dengan **essay**, **menjodohkan**, dan **isian singkat**.
Alur mengikuti aplikasi `exam6lock/` (ujian online) di workspace ini, hanya saja tanpa soal pilihan ganda dan
dengan sistem **koreksi hybrid** (otomatis + manual).

## Fitur

### Login Terpisah
- **Login Siswa**: `/login_siswa.php` — NIS sebagai username, kata sandi awal = NIS
- **Login Admin**: `/login_admin.php` — username `admin`, password `admin123`

### Panel Admin
- **Dashboard**: Statistik ringkasan ujian, siswa, dan bank soal
- **Bank Soal**: CRUD soal (essay / menjodohkan / isian singkat)
- **Ujian**: CRUD ujian, atur soal & kelas peserta
- **Kelola Siswa**: CRUD siswa, import/export CSV, reset password
- **Kelola Kelas**: CRUD kelas dengan jumlah siswa
- **Koreksi & Nilai**: Koreksi hybrid (otomatis untuk isian & menjodohkan, manual untuk essay)
- **Rekap Nilai**: Rekap nilai per ujian dengan export CSV
- **Monitor Ujian**: Monitoring real-time ujian yang sedang berlangsung
- **Analytics**: Dashboard statistik ujian dan performa siswa
- **Import Soal**: Import soal dari file CSV
- **Pengumuman**: Kelola pengumuman untuk siswa
- **Ganti Kata Sandi**: Ubah kata sandi admin
- **Log Aplikasi**: Audit trail aktivitas aplikasi
- **Backup & Restore**: Backup dan restore database

### Area Siswa
- **Dashboard**: Daftar ujian aktif dan riwayat
- **Mulai Ujian**: Lembar ujian dengan timer mundur, auto-save, navigasi soal
- **Hasil Ujian**: Lihat skor dan detail jawaban
- **Detail Jawaban**: Analisis jawaban per soal dengan kunci jawaban
- **Profil**: Lihat dan update profil
- **Ganti Kata Sandi**: Ubah kata sandi siswa
- **Pengumuman**: Lihat pengumuman dari admin

### Koreksi Hybrid
- **Isian Singkat** → Dikoreksi otomatis (case-insensitive, jawaban alternatif dipisah `||`)
- **Menjodohkan** → Dikoreksi otomatis (skor proporsional per pasangan benar)
- **Essay** → Dikoreksi manual oleh admin dengan skor 0..poin + catatan

## Teknologi

PHP 8.2 (Apache), MariaDB 10.11, Tailwind CSS v4, Docker Compose.

## Cara Menjalankan

```bash
docker compose up -d
```

| Service       | Port  | Akses                    |
|---------------|-------|--------------------------|
| Web app       | 9320  | http://localhost:9320    |
| phpMyAdmin    | 9321  | http://localhost:9321    |
| Database      | 3320  | host `localhost`, user `root`, password `rootpass` |

### Login

**Siswa:**
- NIS: `23001` / Password: `23001`
- NIS: `23002` / Password: `23002`
- NIS: `23003` / Password: `23003`

**Admin:**
- Username: `admin` / Password: `admin123`

## Struktur

```
config/          # database.php (env DB_HOST/DB_USER/DB_PASS/DB_NAME)
core/            # Database.php, functions.php, init.php
db/
  schema.sql     # skema + data awal
  migrations/    # file migrasi SQL
admin/           # panel admin
  index.php      # dashboard admin
  soal/          # CRUD bank soal
  ujian/         # CRUD ujian
  siswa/         # lihat daftar siswa
  kelas/         # lihat daftar kelas
  koreksi/       # koreksi jawaban
  kelola_siswa.php    # CRUD siswa + import/export
  kelola_kelas.php    # CRUD kelas
  import_soal.php     # import soal dari CSV
  monitor_ujian.php   # monitoring ujian
  analytics.php       # statistik ujian
  rekap_nilai.php     # rekap nilai per ujian
  pengumuman.php      # kelola pengumuman
  ganti_password.php  # ganti password admin
  log_aplikasi.php    # audit trail
  backup_restore.php  # backup & restore DB
siswa/           # area siswa
  index.php      # dashboard siswa
  mulai_ujian.php    # mulai ujian
  ujian.php          # lembap ujian
  hasil.php          # lihat hasil
  detail_jawaban.php # detail jawaban
  profil.php         # profil siswa
  ganti_password.php # ganti password
  pengumuman.php     # lihat pengumuman
api/             # autosave.php, submit.php
views/           # partial layout admin & siswa + Tailwind v4
assets/          # css (main.css → app.css via Tailwind CLI), js/ujian.js
```

## Pengembangan CSS (Tailwind v4)

```bash
npm install
npm run build      # sekali jalan
npm run dev        # mode watch
```

Jangan mengedit `assets/css/app.css` — edit `assets/css/main.css` lalu build.

## Migrasi Database

Jalankan migrasi baru jika ada perubahan skema:

```bash
mysql -u root -prootpass asesmen_non_pg < db/migrations/001_add_pengumuman.sql
```

## Catatan

- Jumlah soal dan kelas peserta diatur per ujian dari panel admin.
- Skor otomatis (isian & menjodohkan) langsung dihitung saat siswa menekan kumpulkan.
- Siswa melihat hasil penuh (per-soal) setelah pengajar mengoreksi, kecuali opsi "tampilkan hasil" dimatikan pada ujian.
- Login terpisah untuk siswa dan admin sesuai permintaan.
