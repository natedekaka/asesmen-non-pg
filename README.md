# Asesmen Non-PG

Aplikasi asesmen/ujian online **non pilihan ganda** — menjawab dengan **essay**, **menjodohkan**, dan **isian singkat**.
Alur mengikuti aplikasi `exam6lock/` (ujian online) di workspace ini, hanya saja tanpa soal pilihan ganda dan
dengan sistem **koreksi hybrid** (otomatis + manual).

## Fitur

- **Login siswa** memakai NIS sebagai username dan kata sandi awal (sama dengan NIS). Kata sandi dapat diubah admin.
- **Panel admin**: CRUD bank soal (essay / menjodohkan / isian singkat), CRUD ujian, atur soal & kelas peserta, CRUD siswa & kelas.
- **Lembar ujian siswa**: timer mundur sesuai durasi, auto-save setiap 20 detik + saat menutup halaman, navigasi nomor soal, submit manual/otomatis saat waktu habis.
- **Koreksi hybrid**:
  - **Isian singkat** → dikoreksi otomatis (case-insensitive, jawaban alternatif dipisah `||`).
  - **Menjodohkan** → dikoreksi otomatis (skor proporsional per pasangan benar).
  - **Essay** → dikoreksi manual oleh admin dengan skor 0..poin + catatan.
- **Rekap nilai** per ujian dengan cetak (print to PDF dari browser).

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

Login:

- **Siswa**: NIS `23001` / kata sandi `23001` (contoh), atau sesuaikan NIS Anda.
- **Admin**: username `admin` / kata sandi `admin123`.

## Struktur

```
config/          # database.php (env DB_HOST/DB_USER/DB_PASS/DB_NAME)
core/            # Database.php, functions.php, init.php
db/schema.sql    # skema + data awal (mount ke /docker-entrypoint-initdb.d)
admin/           # panel admin: index, soal, ujian, siswa, kelas, koreksi
siswa/           # area siswa: dashboard, mulai_ujian, ujian, hasil
api/             # autosave.php (JSON), submit.php (JSON + auto-grading)
views/           # partial layout admin & siswa + Tailwind v4 (assets/css/app.css)
assets/          # css (main.css → app.css via Tailwind CLI), js/ujian.js
```

## Pengembangan CSS (Tailwind v4)

```bash
npm install
npm run build      # sekali jalan
npm run dev        # mode watch
```

Jangan mengedit `assets/css/app.css` — edit `assets/css/main.css` lalu build.

## Catatan

- Jumlah soal dan kelas peserta diatur per ujian dari panel admin.
- Skor otomatis (isian & menjodohkan) langsung dihitung saat siswa menekan kumpulkan.
- Siswa melihat hasil penuh (per-soal) setelah pengajar mengoreksi, kecuali opsi "tampilkan hasil" dimatikan pada ujian.