-- ============================================================
-- Migrasi: Impor data siswa & kelas dari exam6lock
-- Sumber: DB ujian_online (exam6lock), 1493 siswa / 33 kelas
-- Idempoten: INSERT IGNORE (UNIQUE pada nama_kelas & nis)
-- ============================================================

SET NAMES utf8mb4;

-- 1) Kelas -------------------------------------------------
INSERT IGNORE INTO kelas (nama_kelas) VALUES
('XI-1'),
('XII-9'),
('XII-8'),
('XII-4'),
('XII-5'),
('XII-3'),
('XII-1'),
('XII-6'),
('XII-11'),
('XII-7'),
('XII-10'),
('XII-2'),
('XI-11'),
('XI-4'),
('XI-9'),
('XI-7'),
('XI-10'),
('XI-8'),
('XI-2'),
('XI-6'),
('XI-5'),
('XI-3'),
('XI-12'),
('X-1'),
('X-2'),
('X-3'),
('X-4'),
('X-5'),
('X-6'),
('X-7'),
('X-8'),
('X-9'),
('X-10'),
('X-11');

-- 2) Siswa (kelas_id dipetakan dari nama_kelas) --------------
INSERT IGNORE INTO siswa (nis, nama_lengkap, password, kelas_id, is_active)
SELECT s.nis, s.nama_lengkap, s.password, k.id, s.is_active
FROM (
  SELECT '12345' AS nis, 'Daniarsyah' AS nama_lengkap, '$2y$10$eyXvc7hDkMosdUcrOFRT4OoymtXUmRPl5XFGZqJTekfPKuurEKOlO' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510001' AS nis, 'AKBAR RAMADAN' AS nama_lengkap, '$2y$10$lSbMedSN67PMDdXckB1Yy.fFVeTGUPlIL0qY2EmfNxSMyMihFy72G' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510002' AS nis, 'ALYA MUKHBITHA RAMADHANI' AS nama_lengkap, '$2y$10$H5bHAHDu2suKUJWJFikKxO1tKpHTD3k8QR6eb3UxcYmj7u2HBMPbK' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510003' AS nis, 'AULIA NUR ANNISSA' AS nama_lengkap, '$2y$10$m8OQ1DAX.wWmgArI2N5n1OukWEH0uXK3splWmb45vxl6oHI3ATgBe' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510004' AS nis, 'AYU RIZKI LESTARI' AS nama_lengkap, '$2y$10$pK9csq1v6UeuoR731ScFU.k5CMTMVJzhBNv38LRYpJIJi8qgE2CFG' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510005' AS nis, 'AZZAHWA ASSYAFIQOH' AS nama_lengkap, '$2y$10$eRbuJeWPJH3vnboto25uwexmJr84gFYXADPBvTkMGEbztD3A7MlYS' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510006' AS nis, 'BONG MARVELL' AS nama_lengkap, '$2y$10$cSxUlEUaDW/yTUUjinGJ0.3966w/iT3Oqb.pA8I8vr3A3DhCW5fLS' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510007' AS nis, 'CAHYA KUMAIRA PUTRI HIDAYAH' AS nama_lengkap, '$2y$10$EBv4wb55itR1i9krhgAkIe2PsPJZKWq308vKI4NfHWx39HwLCZV6u' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510008' AS nis, 'CITRA APRILIANI PRATAMA' AS nama_lengkap, '$2y$10$/ERWe59FCSyp7PrbjbAV3.o7eZouRTskO7n5YDCDwfPUHW/oXubQ.' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510009' AS nis, 'DEWI ANGGRAENI SINAGA' AS nama_lengkap, '$2y$10$7AwtKNqlscxu7lHqAWH59uGk85tb7zXPKSPCQglVeXhC08L19DTk.' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510010' AS nis, 'DIAN TRI ASTUTI' AS nama_lengkap, '$2y$10$EceBo9cQTxlvEvdgGdRgVOKiOy6yPd4rfmQ09A0j/2Zul6Gdj/BUC' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510011' AS nis, 'DIPA NGESTU GUSTI' AS nama_lengkap, '$2y$10$u7o1TmcDEt9L1s9DjkJmJ.sUX8WOlm9dceUJyokPVqSyLtbQTUChi' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510012' AS nis, 'ERLANG AGUNG SETIAWAN' AS nama_lengkap, '$2y$10$JV82eMOEsjL7oRBBhEw5Z.3YBQUytPh1oAHODYJymzI.aUBupGUpu' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510013' AS nis, 'FAEYZA INTAN GHAISANI' AS nama_lengkap, '$2y$10$ZptWoFiapOUCH48evj6oBOe1Tt/Uhji.PsDYWwVyzRZ9B3/JceMry' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510014' AS nis, 'FAHRI ALFIAN' AS nama_lengkap, '$2y$10$Z/0.SaZ52x4te4Gd1n2L3OkXyOHbLKeanSOO7tfwHUGYmdaZEnPzy' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510015' AS nis, 'FAKHRI AKMAL MUZAKKI' AS nama_lengkap, '$2y$10$lmqVHYvnlWINhx5OusMu7uFx6hTV6Ox8pXLGAGWvHiudY4e3ZIVCK' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510017' AS nis, 'FIRDA NUR FADILAH' AS nama_lengkap, '$2y$10$AD2U08kKtHvYIYDdUw0l6e.eGv5D6GJmYWFFgbq5Hm9rL24HM8qZy' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510018' AS nis, 'GIRLY AURELVIA' AS nama_lengkap, '$2y$10$vzYBP.i4.UK6CUJWaBSZAeYU20iIGv2KMlyjj8m8Ap5uOekbtMMHq' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510019' AS nis, 'HAMDAN AHMAD BUDIMAN' AS nama_lengkap, '$2y$10$Xf44RBwXtgXabqSiE4.fnuLCpg7MiHRnyWjSoHxYRROQJIA6v5tYi' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510020' AS nis, 'KAFKA ABDEE HAFIEDZ' AS nama_lengkap, '$2y$10$h3col9/USloNHhsX0Ne8sult/RsDvEN.ZrZgDoqiqft7x9FRr.FtG' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510021' AS nis, 'KEYZZA AMEERA SUKENDAR' AS nama_lengkap, '$2y$10$SoUL1SpCWbMsjd/ZF7wT7eMRWA67KYNO81LLLj5vqUKq3rCJXJKaq' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510022' AS nis, 'KIRANA PUSPITA MAHARANI' AS nama_lengkap, '$2y$10$0MW1s8f0ujkH7/C.FmSB8eFCNWvrKcRkzpQ6.fliHEaRflbkuSnrW' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510023' AS nis, 'MAESYA SABANI' AS nama_lengkap, '$2y$10$lF77fLdKv6qzo5mHkPCFn.UzFKpUffvFdJwVXKJbFay863l/PfNju' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510024' AS nis, 'MALFA RAISYA KHANSA' AS nama_lengkap, '$2y$10$Vtd5aIzvdRpHqLX25G8DAepDoyXjWI0v9ENj00x3QQGvr3zOP6kKm' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510025' AS nis, 'MILA ANGGRAENI' AS nama_lengkap, '$2y$10$8Io0/zhnMKRzBl4c7bCJu.sw1Zp8WRJJHj1tP9AZybWI1ZBUVwMDa' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510026' AS nis, 'MOCHAMAD ABDUL LATAEF' AS nama_lengkap, '$2y$10$Sma81fQDk1z0Qtt7AizIduG.pnJ0NmjtKrV1R2oKrog1DNp2a0YVC' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510027' AS nis, 'MUHAMAD DAFFA BUSYROLKARIM' AS nama_lengkap, '$2y$10$1yeudC6Pmn4siQ5xRova..9579uHzCn/Kb/2GzXarynfyBDR2Yjmi' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510028' AS nis, 'MUHAMMAD AZKA RAISSA PUTRA' AS nama_lengkap, '$2y$10$P1S.9PrOEb4ASl1P/ImNOO02wavVMbHJpU/g.4nP4VQHM1XOm39cS' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510029' AS nis, 'MUHAMMAD RASYAD ASYAFIQ' AS nama_lengkap, '$2y$10$ZB0bOGOzH/g0ySwCU3pkKu72TTysWojhjo/67X5m/Nfziu0j4zJv.' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510030' AS nis, 'MUHAMMAD RIZKI' AS nama_lengkap, '$2y$10$PIoINckdgy2bQIZjOrgDke.xiBSF2lndp.zcg3VBfd99UHSvn7rKu' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510031' AS nis, 'NADIA MAHARANI' AS nama_lengkap, '$2y$10$DXu66h6NjcrBnk9kSCWtfeD1BANZNDGQMJafsn2RzK6ATOLCK4fGa' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510032' AS nis, 'NENG NAZWA DARYATUL HUSNA' AS nama_lengkap, '$2y$10$lvvNr5FTKIR4JaLu6dOReuoZ8Z/vRvHlHYWAimau01thD0keCKYAe' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510033' AS nis, 'PUTRI VANESHA FILLIA' AS nama_lengkap, '$2y$10$Sm6va0FvbO5Z3gWXvYPrr.thER.NoigwhXtYPuWMzhxZi73GupCRS' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510034' AS nis, 'RADEN ADINDA SITI ZAHRA' AS nama_lengkap, '$2y$10$cMz50Uwm8PhmmlzxrSBxGuNKq.wMdaoTulGJtTchc7wYpCp4jrBKa' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510035' AS nis, 'RAFFANARA ALIF FAHRURRAZI' AS nama_lengkap, '$2y$10$hn8nsTS3x3MlMwLNif6II.QG6M34Lax4Q9//FNPskAGrM7.4mvzOS' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510036' AS nis, 'RIFKI SOPIAN' AS nama_lengkap, '$2y$10$r60w9I./YKkak0g6Q41YPuYkBvcaPa76oLTLj4BVdWqRESnbqNgkC' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510037' AS nis, 'SAFA AFIFAH' AS nama_lengkap, '$2y$10$Uj77o7iqWpNhnJYZJErHeetwiR4n.hFzuGenq/iUKU.AxtyGFp/7u' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510038' AS nis, 'SANNY APRILIANI' AS nama_lengkap, '$2y$10$WORwpyQuVTOn/rXuI0pGSeAmADYaCBwXFNqTVMUfaLGrNUyEaFAaC' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510039' AS nis, 'SENDI MAULANA IBRAHIM' AS nama_lengkap, '$2y$10$oaANkZVt0pqbrScqkhc1y.LJAT.tq457Kx7Mjjj0Ny1TatGMsS29O' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510040' AS nis, 'VINNA SILVIANA MAULIDA' AS nama_lengkap, '$2y$10$btMoYA.zOyvp3uNazURaJu1LCDqb8LG8/U2iXuEclIpXupeZb9dDi' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510041' AS nis, 'AMELIA RAHMA ARISTAWATI' AS nama_lengkap, '$2y$10$9sD0yNenedEE6eUsq6MJBuFQnW9EMezPFhZltJZeqmleRwmycvpi.' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510042' AS nis, 'ARYA ROMANSYAH HENDRAWAN' AS nama_lengkap, '$2y$10$iktC5QQDyt9Ko58uTU9ukOwP4WdSJ1ngr2SmDuw42FbPIcb3E6EF.' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510043' AS nis, 'AZKA BAHARRIZKI PUTRA HERMANTO' AS nama_lengkap, '$2y$10$wZ2J9qGD6xVoBJwnV5vTGuHm.2M/ZRmN5ih2nJGvmqP9/tgOj6L2e' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510044' AS nis, 'CAHAYA GITA MERLITHA' AS nama_lengkap, '$2y$10$/TbqAZqJ.8py4o71NYvnA.ymOsAiGYgKdPClI3/N3sU4dzmM82KzC' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510045' AS nis, 'CANDRA MAHARDHIKA SANTOSO' AS nama_lengkap, '$2y$10$cLuA5xBi36f.uh5xU2sT/OrGawAZR2m2Fh.wCZuvEWwc8/1OrMcdO' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510046' AS nis, 'FAREL ANDHIKA PUTRA' AS nama_lengkap, '$2y$10$9xzsPJIYQeiZA5aT9itfxuo7OJSo8eEqV148A3l5h2tWJ3vpwKPve' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510048' AS nis, 'FINA NURWITA ROSADY' AS nama_lengkap, '$2y$10$k3dfMp9ypLlp2BuyRJSybe/CsXjJVEE3/7kwQkIvdU45aHKqRbIJa' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510049' AS nis, 'GAIS PUTRI ANISA' AS nama_lengkap, '$2y$10$y//lYQg7MrTkVdvHfZuc2uH8NsDnLgwC7.dP0m2yBAtIFMKMU.UTq' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510050' AS nis, 'GELLARDY RAVA GUSMINAR' AS nama_lengkap, '$2y$10$p5yRNVt7oYA6CO7/DEhE2esxIBfjPI9SiQJa2MrqxuIfzhTHmJdwy' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510051' AS nis, 'GRACE YUNI ARTHA SIMAMORA' AS nama_lengkap, '$2y$10$3qNjP2aN0GytsuIebpqvWeCrabDhRmJ6X0Dt3nm0l//LnYW2xEp7.' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510052' AS nis, 'HASBI HIBATULLOH' AS nama_lengkap, '$2y$10$GrhlgtILR1bIC4Kavbq6mOTr1okF3K5lEtVfrt8XrliDCpVDjwsqK' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510053' AS nis, 'HERSYA ADHWA FITRIAS' AS nama_lengkap, '$2y$10$DIHSe1n3Nz6l424LzyS6HuA/4wuw2cSHDYpC4K3y6a4P8kK4XPOEK' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510054' AS nis, 'KEANU REYHAN FARID AKBAR' AS nama_lengkap, '$2y$10$klV6riDIEvWZsFFDkUudYuEzQjUvwftY0qKL5HJjvN.UtY0hAG5/m' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510055' AS nis, 'LAKEISHA AZIZAH' AS nama_lengkap, '$2y$10$RZJ.SxZCch.pZcROP2eAnOp5I3.sOPdks//4hYp1vVv1cnzIAnXeG' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510056' AS nis, 'MUHAMMAD AHNAF ALFAREZI' AS nama_lengkap, '$2y$10$5cw7juhfws5mnFGURx8Y7.5EvLWXXB4UtCXA9q7kq.RiZNV29k1Nu' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510057' AS nis, 'MUHAMMAD LUDTFI SULAEMAN' AS nama_lengkap, '$2y$10$O/82oHOQ5JhBltnCXcSvN.yzcc0VctcRrZbT379F//CLmv1qjEAbC' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510058' AS nis, 'MUHAMMAD RAZAN IHSAN' AS nama_lengkap, '$2y$10$9kFMOE9xluurhf/PGyCsBul/FoxYGktxSKUX6pZxYaO/IXzyt5Epa' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510059' AS nis, 'NASYWA PERMATA NURZAIN' AS nama_lengkap, '$2y$10$yUyy/6d.Vxg4kZoIxNy/H.NnjelUvo8q.O6ZHMixOQ2J0thRz.h12' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510060' AS nis, 'NAZLA NAIMAH SIBGHATULLAH' AS nama_lengkap, '$2y$10$sqcI3FOMfY6x1khmIxfcRukufLsECxdq7aW4BRfWxSW7R96/L/pHC' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510061' AS nis, 'NAZMA RAISHA PUTRI' AS nama_lengkap, '$2y$10$Idh9FykI0h44xIAthmk.5uayaV1umhBy4zWmcEeMaTJz1tb9zEns6' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510062' AS nis, 'NAZWA DWI ANGGRAENI' AS nama_lengkap, '$2y$10$6UKUnvjo1QHrEAOwAGKOeuywUv4PWEtQUNeBuI17XN/bhuuYIROCi' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510063' AS nis, 'NISRINA ANDRIANI MARDIAH' AS nama_lengkap, '$2y$10$SuRuZ/tNC.rFHMs18ZT69.LWOCHkJLP2JMOJgZ4yLiRsEpOBhiRde' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510064' AS nis, 'NIZAR DZULFIKAR SATRIANI' AS nama_lengkap, '$2y$10$CGF3hki8gNbXvZYKEsaKBOcUj76zwR2h7A8FWGS4Sl2szIxU//N7u' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510065' AS nis, 'PARIHAH NUR AZQIA' AS nama_lengkap, '$2y$10$LP/YsZGo8gaKXBYvIuVi7u8pt9HA7B50GhZlpwCcs7SV2WVMZ9q3C' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510066' AS nis, 'PUTRI TSAMROTUL FUADAH' AS nama_lengkap, '$2y$10$5hiPETLbUmfrY7NL8E1FS.yqU1P4Cd/AtcdpRCCPfrDwXE0L8BZSq' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510067' AS nis, 'RADEN AYUNDA SITI FATIMAH' AS nama_lengkap, '$2y$10$d1HOpzoKhjgaglTVCnCxuOqap.MEslqoV61X7HtFUcafxytFuwO82' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510068' AS nis, 'RAINA MEDINA KHADIJAH' AS nama_lengkap, '$2y$10$hjN5q4yvjGuSZc07H3LiuuP0ai6rKEI8I80t7Yjj5u76U1sn7/Apq' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510069' AS nis, 'RAINY PRECIOUS AHMAD' AS nama_lengkap, '$2y$10$9HhlBuJ4l6oI2AwGDZy5f.hekFO8Q2hM5ViUTjZP5e60ufvA7qmFW' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510070' AS nis, 'REHAN HUSNI SALIM' AS nama_lengkap, '$2y$10$TNSG0guErkXbK4.Ycb.lleAKKB7oViPUazhy95b9dX5SELR4lxtlW' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510071' AS nis, 'RESTU WULAN OKTAVIANI' AS nama_lengkap, '$2y$10$XB8lgEAkegFaI/VdZrTCwuk74tPNilT.mDk4vOfR4F065NBjb0wC.' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510072' AS nis, 'REVA LINA SEPTIANI' AS nama_lengkap, '$2y$10$CCIHpN6XEB7nVGgvb73d7OylcJ7BphR9MuRHHiExKAL8v2lTrlYpG' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510073' AS nis, 'REVALLINO NOVANSYAH HAQ' AS nama_lengkap, '$2y$10$/pfcnjr4Cjoqnshn14D.9.ZhtheL/gKUXpmr8YQTrX3/iFH/vhPXq' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510074' AS nis, 'RIFALIKA NUR FITRI' AS nama_lengkap, '$2y$10$D5BFCjE1ml/zd4yX4NC7qep38Ehtn/17vqHMYtGnbKe9u9u5D1tGm' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510075' AS nis, 'SAFFANAH PUTRI KAMILAH' AS nama_lengkap, '$2y$10$.U1Jq82ttJC..lRqlnAKjeLLGOlfCZfKdS9j1eht1f7UzIeXjYLyO' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510076' AS nis, 'SANDI PRATAMA' AS nama_lengkap, '$2y$10$RgPzYYBEMwSSPVAFy2GC7.ZfPD4vMcS.3I4dbAl.CIXFpTW97UdiO' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510077' AS nis, 'SHAFA SALSABILLA' AS nama_lengkap, '$2y$10$N28LdQUjb1WXsa/as.OaGegzwWbJUGksExaFTj/M2cL1W.hLWeZrS' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510078' AS nis, 'SISKA UMAEROH' AS nama_lengkap, '$2y$10$GRDEN6qD1vtRtwCmaGVWlOa/D2uLKBRAAt2Wjw.NNyj6YvX.4hxpy' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510079' AS nis, 'SITI GINA KANIA' AS nama_lengkap, '$2y$10$.25OQ0RDRDGU7aAQmbxDc.BJxIE3l53lf4Khyna8BJKtv7n5pfIKu' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510080' AS nis, 'TAMA PANDUWINATA MAULUDAN' AS nama_lengkap, '$2y$10$1aDMaGwsxA/EIdHR3KFJcODqsC5fyouYTN3RNZeAuLCxCFSyPz9CW' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510081' AS nis, 'ACHMAD FAKHRI AKMAL' AS nama_lengkap, '$2y$10$KpOo3C9OTaZAq.1mI51fP.rWEcMntCCFjif3zPtra4Mwy7z3uw/9y' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510082' AS nis, 'ADEELA HALWA KHAIRANI' AS nama_lengkap, '$2y$10$hr4Fca/nWWpcFOoGPeLyTeY2y7zFAdV7R7/OIqvWsYVfm7LVEE3ai' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510083' AS nis, 'ADLI MALIK PRATAMA' AS nama_lengkap, '$2y$10$TBvfAe.HihlsD/GegmwXAe0T3Rz0BUMSIz6GLq8anR2VQNza5uqeC' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510084' AS nis, 'ADSIL RESI BINTARI' AS nama_lengkap, '$2y$10$zHr64Zr7WJ9jExtosJd0hO1O2dECM.qW79avA3ytQ2Bo8SadmBOIK' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510085' AS nis, 'ALMIRA NURSILO MAHARANI' AS nama_lengkap, '$2y$10$Ie8LeLUdQqQyZaUb1zJWtO0WzxnMhUrSBrYeyblJORvb5WXaVNu/K' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510086' AS nis, 'AURA DWI ANZHANI' AS nama_lengkap, '$2y$10$4vep1juO3aTtkEwevE1rSuFww1DuWHTv/63tpAoxG3Umlltv4uPYy' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510087' AS nis, 'CALLISTA AURYN ANNAURA' AS nama_lengkap, '$2y$10$YVbZrwbzI3Doc9v8UVqMPOT/mP8ZIIlXhfJDJz/5pg33djpSpEWyu' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510088' AS nis, 'CHESTA MAHARDIKA' AS nama_lengkap, '$2y$10$Q.5OZtS9dLWEEnPAP/mtKe94qiY.Pspd7vQ7GpE/TwNIwTUF5pqO2' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510089' AS nis, 'CICI LIS DIANA' AS nama_lengkap, '$2y$10$5WXlF.4W0rMn6A0W2t47FeKa.lFrrF8lkQsFKfi9Y7ZuKP0firAgC' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510090' AS nis, 'DEVA CERINA' AS nama_lengkap, '$2y$10$wxBOq94aRPkNYvj/kW4hr.XKaJAMXFlPndjMoo3e/qBsnu8QCQGI.' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510091' AS nis, 'DIA SASTIGAMASAE' AS nama_lengkap, '$2y$10$XKG9sjnLoDXi5hqQ2EwRCesyyfa18kBwGVyCKAATBIaTvr/O25JxS' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510092' AS nis, 'DIMAS SEPTIADI' AS nama_lengkap, '$2y$10$86muOK4c0UbDanL3CxxboeR4Ijp5ELCtMkUG2DPSH3/cz7YXgx002' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510093' AS nis, 'FATHIN ABIYYU SUKMA' AS nama_lengkap, '$2y$10$HG18CexZ8gE09cD1CZ0Nx.s94YXvRlU1t/3X9RJDMziWw4bKD2cmK' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510094' AS nis, 'FAYRA ASSYIFA ANINDYA' AS nama_lengkap, '$2y$10$kIHyEYIx7B4vs0RFTtUjM.Ts99z0648mLLP5bJkhv9p.lFTx365EC' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510095' AS nis, 'FIRYAL YAPI AHMAD' AS nama_lengkap, '$2y$10$VOyBRVlBu4FHcyBIGTe1T.hBW5Bgmc9Vci8OsupCuDfrpRH7m0Ina' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510096' AS nis, 'FITRIA RIZQI AMALIA SUCI' AS nama_lengkap, '$2y$10$TKnER88202XLy4Yx39s0uODgTTEWO/zTyuuRdupKE6IBZJDjoroIS' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510097' AS nis, 'HANUM HUMAIRA FAJRIYAH SALSABILA' AS nama_lengkap, '$2y$10$UPRahDnqShxjCZ19Y1ZQSeEgR8PfBkZ8HxLL/NGI5EEilL2UEOtUS' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510098' AS nis, 'ICHA SOPIA' AS nama_lengkap, '$2y$10$2W1xPgcRZovzrGPiWpk/ROes7/FHzV1gTXXFGCytf5cMVwlvc26Q2' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510099' AS nis, 'JACKY PATIH ZULFAHERA' AS nama_lengkap, '$2y$10$juS6BFsEGUcww6C87wwmYuLwAdZIC0eKGL96hFxxkJ7QEO76OfvQS' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510100' AS nis, 'JESSY SIMBOLON' AS nama_lengkap, '$2y$10$X3Lt3QzAcSu4lCOgkD8oXOEc1RGiTfJ9J0ghKNx9YRGHZXXwb1ME2' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510101' AS nis, 'KENNETH GIBSON WIJAYA' AS nama_lengkap, '$2y$10$e.F3SlrRt2V.GA49ZK.use7W5ti8DB4WC5zkJ7n3eo40jecskVtCO' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510102' AS nis, 'LAUDYA CANTIKA SARI' AS nama_lengkap, '$2y$10$YpJAH93VHmWudNvDlzQlw.OACTfhsGdrq8HB4l/v/zr67/GgTu1uG' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510103' AS nis, 'LINGGA MAHARDIKA' AS nama_lengkap, '$2y$10$M1IVewQyiyk/6v5y4r1xqeW1zX4pdi35w/1YxXcARjv/eRIUuzqLa' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510104' AS nis, 'MUHAMMAD FARHAN FADHILLAH' AS nama_lengkap, '$2y$10$1FuRywcVSm/GnrS5jWHWdu79XTD9gNE1aUpxhcD/UxC75eQwiufNW' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510105' AS nis, 'MUHAMMAD RAMDHAN JAELANI' AS nama_lengkap, '$2y$10$Fi43wJeuXPRkEH7nweAZKO7TjFp/wRFDtTVkzYeLWR8Sqcbj3Q3ZS' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510106' AS nis, 'MUHAMMAD RIZKI AL FARUQI' AS nama_lengkap, '$2y$10$dbuyvit5scMLRKxeStEXX.vcoAqhzabPfvTgWCTSVcUoPe6Ir9cyi' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510107' AS nis, 'NAZWA HASNA PUTERI' AS nama_lengkap, '$2y$10$BrKdJHHV5tmQ4HvzK5wTrO4fExqVH0YXF2k8NY/vxE.x8gaxM2Lpu' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510108' AS nis, 'OKTAVIANI FITRIA' AS nama_lengkap, '$2y$10$bBVdaUQZM35MmmGOLgq9au7yHMLHMmtOJMhDaCrFjkgu4..2KfPKm' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510109' AS nis, 'RAFI IKHSAN ALRASYID' AS nama_lengkap, '$2y$10$z8pGicRKoqF35cgh5rL5weiuGNbWFG39IbNzgkRDguRTWxT3PP43O' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510110' AS nis, 'RAISSA NAZDAH ABDIYANI' AS nama_lengkap, '$2y$10$4NQMJe9engKTSK5m09XbB.JbsHcUtDt81wttOAtEEivHjrD.T6ujS' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510111' AS nis, 'RANTY PUTRI MAHARANI' AS nama_lengkap, '$2y$10$.4BNE.ceJicQhe0zj1tquuR3ZiIMZgchLbpcdV4W3oMwVDJj3ScyC' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510112' AS nis, 'REVA LINA PUTRI' AS nama_lengkap, '$2y$10$V8Z02IYr6FvCoIynXK9/geTjrBSHdXG0TIxYaN2/DU09HgeGC/j5a' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510113' AS nis, 'REYSYA RINDU ANANDA' AS nama_lengkap, '$2y$10$b2q9.CM.FZ8SLvDaCG3xie0vt5keSwBZjV5VK/BpEGuXT89nIfKp.' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510114' AS nis, 'SENDI PEBRIAN' AS nama_lengkap, '$2y$10$tsZEJ6iqi55jUPveNi9TDO37PIhWE9kZQ9fI9fUC3kUpzkkEJWH3e' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510115' AS nis, 'SETIAJI SIDIK PRANAMA' AS nama_lengkap, '$2y$10$iM/U2ZTSSOKfKh/j6tm4CeKEqbHffPVlI60MW2IKEhxjyfAOt9pcG' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510116' AS nis, 'SHELIA APRIANI' AS nama_lengkap, '$2y$10$b.ZJtQ7p4EZU1Yx3jOQDGOFqWyhoV9ml.ABLybHQwPWf7qYn5iJqe' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510117' AS nis, 'SITI FITRIYANI' AS nama_lengkap, '$2y$10$qXFtiwT2qMjQ1E3VawZDZOet2RJy9fG06zD5b8luGIPOmSMf4vfgm' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510118' AS nis, 'TALITHA FAUZIYYAH MUMTAZAH' AS nama_lengkap, '$2y$10$C4pophObKntfpxgEQhQ0au7cO.BBYXDbKNCGmfTCawDEYZESjZPHS' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510119' AS nis, 'YUNI NURAENI SILVIA' AS nama_lengkap, '$2y$10$8YEbFnZz5nmX9C2fW1BB6uxlTr2rUJ6lnb.uDmXQU7Oyj.F74NgfG' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510120' AS nis, 'ZAHRA FITRIA HARTANTI' AS nama_lengkap, '$2y$10$2MG501hYSY3Mbeqj0SOzg.irkqCEyg2OXDkFK0BwgvgKW5ERNcJIe' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510121' AS nis, 'AFRIAN PRASETYA' AS nama_lengkap, '$2y$10$zRn9qaEFoQ6rJ6JwBP6C2Ogl2mCLe65gMkReF8s0rbbKQVwb4E1qC' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510122' AS nis, 'AQILA ZAHRA' AS nama_lengkap, '$2y$10$QJ26RnE4jTgbb3Iticrv5Oz2FuMOuaY3ZcbncCx5xVdoIYqPrNrwu' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510123' AS nis, 'ARLYN NAFIZA PUTRI RAHMAN' AS nama_lengkap, '$2y$10$Xkm0ZPy9ILXJv6eUUeAN6eW9WN3z4Gz0dje7PkwioPWGtOpvSrunW' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510124' AS nis, 'AS-SYAFA LUTFIANA RUMJANAH' AS nama_lengkap, '$2y$10$Dy0kRw4FGYx3qF2R2AgowOlXAGmIHU9p.0c1O19eP2Z1l7noJUJxq' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510125' AS nis, 'CATUR SRI HANDIANINGRUM' AS nama_lengkap, '$2y$10$OgHSFy1JYfFGRpyMjST/GuJZwhA4Vwo1dW/blNeTB.kyCTT3jyp3K' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510126' AS nis, 'DAFFA SAEPUL RAMDAN' AS nama_lengkap, '$2y$10$zRAqyGd37cOJ3f5NwVYDCudS343b7i9zfSX2fuHbrMS0rrH7Sf54G' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510127' AS nis, 'DETY AFIA' AS nama_lengkap, '$2y$10$b36qNRmB7PWbh.ZqFkr1yukxXHWYHpNrc8N0GVar79VkAlFDaFz3a' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510128' AS nis, 'FACHRI ZANWAR NUROCHIM' AS nama_lengkap, '$2y$10$AOfFhkvrug970W4tLTRG1eJxWr0j6GHJn3lZKegGxnepIoW1viCL.' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510129' AS nis, 'FAHRI PEBRIANSYAH' AS nama_lengkap, '$2y$10$J1AuKpwOWHVOql2hxo9lv.5fUoYUC9zwI3MLCYFNdZN6l8bMeZs2a' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510130' AS nis, 'FITRIA APRILLIANI' AS nama_lengkap, '$2y$10$G4ALzBsW1PKNwCzD0kq33OFCY2tXrBshcLBTIAPxSXPV7ySQWayqS' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510131' AS nis, 'GERRY DIVANO' AS nama_lengkap, '$2y$10$rua6Vlsf2DgdQ8vXWY107eMa52UeUg5szaDbUbsXzyXy9BBDLA8Ge' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510132' AS nis, 'INTAN AULIA HIDAYAH' AS nama_lengkap, '$2y$10$Txh4m7jHeQCLtc8FplJY..rP3uvEstWIgk52LxRyxEfN7dmIANm9C' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510133' AS nis, 'INTAN NUR AJIJAH' AS nama_lengkap, '$2y$10$3D8S.XI5ziQ2dsjyfRp9rOpqSFq.5kWDt3aGwKIAkKSItmyV/3ia.' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510134' AS nis, 'JIHAN NAQIYA' AS nama_lengkap, '$2y$10$RuvwOwriKojkj6WBZWGKieTUSp7WHf7yKuY7/3.9EcNlC0PDpg/W2' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510135' AS nis, 'KEMAL KAMALUDIN' AS nama_lengkap, '$2y$10$BwkAPtmQa9Tyv3/c5XtWS.399WRaHPdRvG8fyFkhveWXQZnmxhsm6' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510136' AS nis, 'KEVIN KHOERUL ANAM' AS nama_lengkap, '$2y$10$uJxkIVZXuclvm4DT1NzKZecJaoMgf1BDuGLzujk7tLqcpC9px/eQ.' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510137' AS nis, 'LEANA CARISSA PUTRI' AS nama_lengkap, '$2y$10$xjpWeS0h6ch0KmL0jpKVbevVoavWG.owZUc7TBopOn9jqy6boPArS' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510138' AS nis, 'LESTARI DWI ALTHAFUNISA' AS nama_lengkap, '$2y$10$cbU7f2J/uyTg7G9UMisOzO.v.phagezVYBNS1oP7ccvhsSV4oxBvC' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510139' AS nis, 'LUTHFI DESTRA HERLIA PUTRA' AS nama_lengkap, '$2y$10$1HvMLTvWOyQbP.08gztYC.HQzTFG0lnrJN96cRaCT/avCJY1zGZX2' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510140' AS nis, 'MAISYE LIANI RAMADHAN' AS nama_lengkap, '$2y$10$NEwIeCVi.jpbsHWiQywA3.stHyFW3RWfkrytHUbLbCef/WkyRxeaa' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510141' AS nis, 'MITKA OPHELIA' AS nama_lengkap, '$2y$10$HaKsbknscmJwKlwxjx/urOZj8ayhu.8jG0nxj4Ky5HPTWjeyQPw8i' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510142' AS nis, 'MUHAMAD AGUS RIDWAN' AS nama_lengkap, '$2y$10$yA2wkWz1YChxG0qE6sZx9.HBAKwfvjjeqGdaT78hX6SFALx.zS3Ie' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510143' AS nis, 'MUHAMMAD FARDHAN RADITIA PELITA' AS nama_lengkap, '$2y$10$p6oKZICxRgvf2goSukzrI.zzGPKUjzMFvGZrNFfv7r0EFMyBc5KJu' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510144' AS nis, 'NENG MEGA SILFIA' AS nama_lengkap, '$2y$10$Lrt1sT4DROzOPeM1rMhPx.Yyp3Ir5eY/RElXf3WnRmxxYfzmxvdzi' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510145' AS nis, 'NOVA DWI KURNIAWAN' AS nama_lengkap, '$2y$10$B.SH4hcKfIxX7a6K5ydEz.cyv1b0oyjZ9y76q9nw4plJxFWAXxeMu' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510146' AS nis, 'PUTRI KHANAYA SALSYABILA' AS nama_lengkap, '$2y$10$XmV672ma7ZjtFkDDx1WB6O8xLj.QPDc9fQA.QF4Yml90P8Se1QMS2' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510147' AS nis, 'RADEN SATYA AHMAD KHALIFA' AS nama_lengkap, '$2y$10$LkyxOM2Po0UCmcMtxtYdGeddNP6bwX1mqVOiJY9zA7e2tXkPQfD4G' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510148' AS nis, 'RAHMA AURELIA' AS nama_lengkap, '$2y$10$gS8Pf7N/u/u0gEULTYy.m.6TO6AqwZgHexr0Sjm.NLQahcyy9CBW6' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510149' AS nis, 'RAYANA AMAURI PAWANA' AS nama_lengkap, '$2y$10$JEXONbunc7Zud7AqPCkyrOcavaoS1aBJKHVLx1LlCl76uPajPRp2.' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510150' AS nis, 'SABILAH' AS nama_lengkap, '$2y$10$o1LKV/vZwGAFANQc/pKYy.y33ulVHNo05qJPGcbyLs5CL0nHQVqF6' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510151' AS nis, 'SALMA ZAHRATUNNISA' AS nama_lengkap, '$2y$10$rbq23m4IfDZQnKmLI0SIB.NCLrDoTOZZ92v6.cLUt8HbX0jtOJ0J2' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510152' AS nis, 'SHINTA DEWI ANGGRAENI' AS nama_lengkap, '$2y$10$4gn2L0lbJIENOsf4JIPhTelDpu76AUjfgyZybNAPpuMfJKfd6znNy' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510153' AS nis, 'SILMI AGHNIYA AZ-ZAHRA' AS nama_lengkap, '$2y$10$VfyMigSfJU/qkwMOBqM0/uTaEEukw5E3Oxg0AeClmyPGni1ldH5om' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510154' AS nis, 'SITI MULYANI' AS nama_lengkap, '$2y$10$n9l7HQqgrE3aG55J0N63N.IEwdbA0kjBG4yrHTvJlhL.Gd7Phb3by' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510155' AS nis, 'SUTAN MAULANA IBRAHIM' AS nama_lengkap, '$2y$10$m9WhpsghmyLbX3LWAV6Xs.YjGlSl0RkW/dKmD3az7CWk/8JbJHDFe' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510156' AS nis, 'TAUFIK URROHMAN' AS nama_lengkap, '$2y$10$d46UZs0KOvW4D4ES81.nSupl8XSqf/Vn1Rn3CFiwtiLBXscbgLp6u' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510157' AS nis, 'VANIA PUTRI' AS nama_lengkap, '$2y$10$KqG661Emg4.WNBmdLgwuxeflNV8q4AnCrSuXfDwNk2VYKO7H2ckMO' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510158' AS nis, 'ZAHRA NAMIRA PUTRI' AS nama_lengkap, '$2y$10$BlyfiQKJIj98k2SGlMj1fuDcTNc.BFk0OWp6psFb/v.tcebVm7q6q' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510159' AS nis, 'ZAHRAN NURFAJAR' AS nama_lengkap, '$2y$10$LiC/9cBL9rB5dHzx466qxuQgs92A3jYQLqCzCv4vsbO9LbLiIAhji' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510160' AS nis, 'ZASKIA APRILIANI HERDIANA' AS nama_lengkap, '$2y$10$7Vts8CWCItOeII5pFZ7AlO6qLarhFd9puJbgRu6AzXlEvRjmg/yZa' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510161' AS nis, 'AGNA ARUNI AMALIA' AS nama_lengkap, '$2y$10$eDiKQUr30VFzV/0VOL9RvOzM60ON1UvrgQNpQMdQzgU7ki92ZfXQS' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510162' AS nis, 'ALEA NUR BINTANG ANZARI' AS nama_lengkap, '$2y$10$kjVE4ahspA49XyO4m/CLseEta4l4UxbdLaa777mI7ij4Qu.I9sNma' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510163' AS nis, 'ALFACHRY DAVI RADITYA' AS nama_lengkap, '$2y$10$tIcN7ajzus8MoYOy46F5JuG27rlFQVKpn9RByoVQ2hiMxF.0txKnq' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510164' AS nis, 'ANGGITA ASTYANI' AS nama_lengkap, '$2y$10$jatif.8TdV2.q7lqrxAHm.ndGYVi1dq00OO6DS0dXq6bb20HD5n2C' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510165' AS nis, 'ANJANI NUR SUKMAWATI' AS nama_lengkap, '$2y$10$vVgF.Je/BlcktCxTrkLVbesQnXcWaGEri3x3OeztIJo.xA0Hlvc/K' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510166' AS nis, 'AULIA AZKA MUKAYYIS' AS nama_lengkap, '$2y$10$3UslqbaoxkplE5Qz07E8wOWIyUtBw8/.YkoreEDBdgoHz85schJ5a' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510167' AS nis, 'CHIKA SAKURA' AS nama_lengkap, '$2y$10$4W40SMuzDHtoV4n5x0kacOf606zJAj5ziLXb4eHei4XroWzHVl90i' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510168' AS nis, 'DANIAL MOCH MISBAH' AS nama_lengkap, '$2y$10$Qlz3otL1F.yEzriU14pQk.6T2IBUjJUloE2tRKQl2wU60iBSo/EYG' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510169' AS nis, 'DAVID ADITAMA BACHRUN' AS nama_lengkap, '$2y$10$CGRBIlECG2ocdtPoKsMd2ecokOJFy7RRqMWyCkVgkqzTiIngIGQCe' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510170' AS nis, 'DIAN SAFITRI' AS nama_lengkap, '$2y$10$Euc.fmdcNIAC/t6sYs5e5.cxlXVT7ZvRr0mAz8DDRAoj/iNJXU/Za' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510171' AS nis, 'FABIAN MUHAMAD RAMDAN' AS nama_lengkap, '$2y$10$pJZDoDtWeoZB/AfhdwATuOSNwb3pRFB27TYo/fUUwJBpCqkEkX/Z.' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510172' AS nis, 'FAJAR MAULID' AS nama_lengkap, '$2y$10$.TC9tWcGVGaThY2ZVOQf0.wDkqnOZQcrfJBjnhmTkjDOp3wFENFum' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510173' AS nis, 'GALIH MAULANA YUSUF' AS nama_lengkap, '$2y$10$VidgpB90/f7Nx6FUdWfx6eJwEYUZQ8FTC35heWRwlFBWuUk7SaHPy' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510174' AS nis, 'GILANG GINTARI SUJANA' AS nama_lengkap, '$2y$10$x8OaS9vReTei1KPk7l5yeuAiJbH4FMuWmk3eJpUHDy34VvZ59TUTK' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510175' AS nis, 'INDRI GUSMIANA' AS nama_lengkap, '$2y$10$S.XrX9kQNMIfQhyR.9bbZ..aX..kAKi4whJlz7nJ/TJMZJ4gW5j7O' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510176' AS nis, 'ISMAH AULA' AS nama_lengkap, '$2y$10$jBm3e39ISpUD4I/MiVSboOWC50coC6Mgm7CfkDtVvCxN7Xq5TQv2u' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510177' AS nis, 'KALINDRA KIRANA ASWANI' AS nama_lengkap, '$2y$10$6QouOfhxuYelMY6EFm234eMVJ6MUlXuSuUutkqGIF.52hKVp9wmLW' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510178' AS nis, 'KEISYA AULIA' AS nama_lengkap, '$2y$10$juzA5bo9ZOKdphO5Ez6cA.HJKNIDUC.pCa4LZvrPgUqvskzFBhZHK' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510179' AS nis, 'LILIYANA ANNISA PERTIWI' AS nama_lengkap, '$2y$10$fQ5dskdSUs.t0Y44ss4rTu4zM/gHCzK/RcXVtDLv.RJ1qY5va7yei' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510180' AS nis, 'LISNA MAULIDA NURUL FATIMAH' AS nama_lengkap, '$2y$10$.Ju61ETqD0NfEGx2QlGmau3esidrjQy8Ddua0hREwxmJuii5sKTYS' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510181' AS nis, 'MAYLA CAHYA AFILIAN PRATIWI' AS nama_lengkap, '$2y$10$pTUa71mUP75qIY2rCNQxu.xENllTvoPB/w1qNUYyJLCiKCdrkA/lG' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510182' AS nis, 'MEGA LESTARI' AS nama_lengkap, '$2y$10$F0NHnFemL.OUUkU31HcwaeleuuKP4Jr/00EbmTfDoNQ5XZqPJ8xny' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510183' AS nis, 'MUHAMAD ALIFFIAN RAMADHANI' AS nama_lengkap, '$2y$10$TS8aVXwqgEL8Oo37MyQng.O7HdUadmeZgpggxGRDRATs6ZvXGo7cC' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510184' AS nis, 'MUHAMAD NAZRIL GUNTARA' AS nama_lengkap, '$2y$10$Ivn2KPUe8S3iUrRhg5v7N.Kan.OquPZO5MVcOOxZg213kQlxcji.e' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510185' AS nis, 'MUHAMMAD FAUZAN AZMI HANIF' AS nama_lengkap, '$2y$10$6k5Yx2pLY58wz9/p0.r5zeBLxJKh1lekzWrv.T7HNk6ENDykIQT0S' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510186' AS nis, 'MUHAMMAD RUSLY' AS nama_lengkap, '$2y$10$MFT7oEfZ1LFeXz8LH.0ri.CUFANDOEzWGrfKJqmrE.hfay8M1AO.y' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510187' AS nis, 'NESSA NOVANDYA PUTRI' AS nama_lengkap, '$2y$10$KGRVlnRJlsHNiYdcQ9Ht4.6DGVNy7rgBbDTziP/th6FnmuKYVauCK' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510188' AS nis, 'NEYZA DWI MULYANI' AS nama_lengkap, '$2y$10$DsjKTSH8VB0OCKs9GGa7OuhGx9HTtrnC9fEY1jCVfwO/NXczzJ1yi' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510189' AS nis, 'NURUL AYUSTIN KHOLIDAH' AS nama_lengkap, '$2y$10$Uj1b7VHjymbiKO.AIyUAy.db3jTY6oISyMSd5xntfUO./cFkZcK/m' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510190' AS nis, 'RAIHAN HABIBURROHMAN' AS nama_lengkap, '$2y$10$/ub8WbehnUVb824vuGrUhex01ZQH/icjSjf3YfTKI1eDjplL4yKsi' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510191' AS nis, 'RENANDO BRAVOCIANO' AS nama_lengkap, '$2y$10$JfVltvctq4BHgdS2gg6aaeeySl58aIQVGdL/8AODzwqwXrlwncr.e' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510192' AS nis, 'RIDHO YACHI SUDIRMAN SUDANA' AS nama_lengkap, '$2y$10$fdTgaa3dM1qD51RyvzwT/OwK0vfgdnpTk7zLNxr5F9Fa30ePPo3Vq' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510193' AS nis, 'SILVI RAHMADANI' AS nama_lengkap, '$2y$10$J/NiISV0laeBPlIcmsEereza/Oe9LIYqfE4TWOPdR/5.wu4HUzyMC' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510194' AS nis, 'SINTIA NURCAHYA' AS nama_lengkap, '$2y$10$nbGt36ZSBgbtOlH1U2BtROSNqkv2VkVckPYnk3xZwi.vi9TN5N0kW' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510195' AS nis, 'SITI ALLERIA AKASHA' AS nama_lengkap, '$2y$10$5CQwI7l5ba7rk.qrt0WivOXSrl4PLJ0CqbAdzcRCgpZYWQspeH3W2' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510196' AS nis, 'TANTI AZIZAH PUTRI JAMALUDIN' AS nama_lengkap, '$2y$10$cPvX4AQ1NiIm5fmQfybUBODvP8gGrFjpQw7QdpYo0MlBiBWE9fyfK' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510197' AS nis, 'ZAHRA YUNIARTI' AS nama_lengkap, '$2y$10$oJNdBcKNInYSu8tfMlXQFuE8epsIwWUpagp4OFGwupOjdZtUbiQxi' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510198' AS nis, 'ZAHRAN ARKHAN RAMADHAN' AS nama_lengkap, '$2y$10$qHJlegvd6V0SEdY7egUH2O5P4ISi/W3pERsaglnFTnzuYa.JXWnIS' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510199' AS nis, 'ZAKHRAN ARDIANO' AS nama_lengkap, '$2y$10$oKrTYtUunQCQdFD49kf46.0T0lISOWjU9c9/W7GQGxobfjyCAcjby' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510200' AS nis, 'ZIHAN CLARISA SENJAYA' AS nama_lengkap, '$2y$10$CWwIMJfsFgN2VloGyUG3O.sXeYXQvOD7THQ12VpJkkt6TfPQ6VHjK' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510201' AS nis, 'ADRIANSYAH SAPUTRA' AS nama_lengkap, '$2y$10$bCsccFKnsGSMTkszgdOyt.60TkEINaF4S/nOoIxS3/pxs8Rm6s1Wq' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510202' AS nis, 'AFGAN MUHAMAD ILMAN' AS nama_lengkap, '$2y$10$2UzvN6DUPEyDl1V2FKicg.t2Wf5fd36nKzqS1.ri42/bF18jA9ogK' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510203' AS nis, 'ALETA MEISYA HARIMAN' AS nama_lengkap, '$2y$10$Myw/5KoaeBON6THj5oYwp.KP2cVILhIzfK.u4CJEYYwa3.L9cNz9K' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510204' AS nis, 'ALISHA MURSAL' AS nama_lengkap, '$2y$10$z1Mq2gCVXGhwtvNGgQ1wQ.d3b9IbJB1iGRSc4/cuFRe3fi.GrE34u' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510205' AS nis, 'ALVIN FIRDAUS PRASETYO' AS nama_lengkap, '$2y$10$eqOuNcieE3jWiMC63gEkZuhFDHrtmmmc54seSJCt.0oN3D.McU57O' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510206' AS nis, 'AMALIA TRIYANI' AS nama_lengkap, '$2y$10$Uq5/hq4qzuQSaNGNYN3H3.w/4NUb1vJj/5lvrf69/rbzhCNe4bSja' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510207' AS nis, 'ARIHNI RAIHATAL JANNAH' AS nama_lengkap, '$2y$10$.oJniFqPhF24AGulx59Gg.d3pJjH7lQPwLI/tpOlpqlHyENbnYfgy' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510208' AS nis, 'DEANDRA PUTRA TRIYANA' AS nama_lengkap, '$2y$10$UgBJ7wyN9y.O8AETl13/QubNGbfLCjDUymYFqxVwawiIJlbQ7DvJ6' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510209' AS nis, 'DEVIA ANATASYA' AS nama_lengkap, '$2y$10$WHCqgvk2U3j0L36qdJr4sOOyAqDCiPkZGSTYDfSwI8egtIlLZWWVa' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510210' AS nis, 'DEWI ANDRIYANI' AS nama_lengkap, '$2y$10$/JR2l9vShR9lsVCCneLjeOcxrRLaVs/zfVVe195RBZAuTSpaTi.cu' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510211' AS nis, 'DWI AL FITRIYANI PUTRI KUSNADI' AS nama_lengkap, '$2y$10$0U8KkrJpiBpOS1Ulm8KwReLWEMksTeu/hAy1am/YEaVS7aIVL8DKG' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510212' AS nis, 'FAJRI HADIYAN ANGGARA' AS nama_lengkap, '$2y$10$2q4hq5/AumfLLA2gIUQ1H.tciHl5rixKhUFParM9mUzuUgldCSkCG' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510214' AS nis, 'FIRZA AHMAD ZAIDAN' AS nama_lengkap, '$2y$10$.u3MTVNgWYv0n2bfpbtie.2WWANYtULGDMqDPfnKoP12evXaa2RuW' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510215' AS nis, 'GENDIS PUTRI KIRANI' AS nama_lengkap, '$2y$10$nE2TQB6cuISg0Q5OwmEOSuAgKTNgsysBaZesDInilQr.r8k3SLedq' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510216' AS nis, 'GHAITSA NAJWA KAMILA' AS nama_lengkap, '$2y$10$/FCQ30l.Dhipskt3lZTpM.5cuomdIK1Q5/mPzRpw9.fuotFO6xySm' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510217' AS nis, 'HAFIZ ALFADIEL ABYANTARA' AS nama_lengkap, '$2y$10$1KRNqhXQD13JfTC0ZTdVqO4Jvf9WN73zWOys96dUCRw8qACsK6Uny' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510218' AS nis, 'INDAH KIRANA UTAMI' AS nama_lengkap, '$2y$10$eL/kS8Tt15DGh/9.UVgwK.PwEWY.0y2N1cUb4MNfQmsLk2hcsNX5G' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510219' AS nis, 'KAISYA RAHMAH ANGGUN PRIBADI' AS nama_lengkap, '$2y$10$npyfTQu5r8PZcXwn2RPMMeBJgaXt8zK495xzV0qG8hL8kS6iMB4Ii' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510220' AS nis, 'KALISYA NUR SYAHBANI' AS nama_lengkap, '$2y$10$fqOWkr6M5cTtYyPLt.bzXO.vMbg/etXnsz1rVCMaRtJXJmM/E0JHe' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510221' AS nis, 'LUTFIAH OKTAFIANI' AS nama_lengkap, '$2y$10$cKFFV1zY2AB5pQMclwWTSuiwN67wwGhHf/zhL4KQ0SGpf2PvnOTbi' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510222' AS nis, 'MEISYA RISMA AULYA' AS nama_lengkap, '$2y$10$n579oGFfZ4CZvkcwbXgk6Oyv0LnCndm.X6.EdqxhCNfVMvQHyxaO.' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510223' AS nis, 'MUHAMAD FAJRI' AS nama_lengkap, '$2y$10$8o5K5od9ZHXZPo87OdI/1uzc4g7kD7zX7dcNv/uk8YZWhJkKVUg0y' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510224' AS nis, 'MUHAMAD AL FAUZIAN' AS nama_lengkap, '$2y$10$aRHzcO01N2cMVesnv9or8O5c9FnidQOUJ2ritUOQ5dyifYEhHPfS.' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510225' AS nis, 'MUHAMMAD BINTANG NAZRIL' AS nama_lengkap, '$2y$10$VEAGRkvmBhHNqMkgiNVtwuo1QN/qxFjbilPKs7NW0tdhZ6HWD3XHO' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510226' AS nis, 'MUHAMMAD ZIYAD ARHATTA' AS nama_lengkap, '$2y$10$w2Qv4Z6X4SM8zsWcqLyI3Oo.WHinxWstxDi0mO9Nk9npqhRXMkXJ.' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510227' AS nis, 'NABIILA NUR TAMIIMAH' AS nama_lengkap, '$2y$10$Kn1FprBtxsHYRI.0AQDft.19bDOmgAWlCFuHa0gt7li3n4VEzj8hC' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510228' AS nis, 'NABILA GUNAWAN' AS nama_lengkap, '$2y$10$QXnaTcCla2rzYWZ1JFHrVuwLMYE1EAmvLNU98j3oGU6QQ7aieKK4a' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510229' AS nis, 'NASYA TALIA GABETIA PANGGABEAN' AS nama_lengkap, '$2y$10$yx6qkRVZgra3KxmdwXOmOun8yWrecD/Ot1WBx0.aQVjsPLzNMNWBq' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510230' AS nis, 'PUTRI KIRANI SALWIYAH KHALID' AS nama_lengkap, '$2y$10$e8FGH./CJDdAb/IZlnHD1.eMWndK8xQ72CRQSdLNvqZ0vCpM9Wsby' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510231' AS nis, 'RAFI RESTIAN' AS nama_lengkap, '$2y$10$zSPJhiLQqrgrAHqPichtz.GDU5IkHQmuSZLQ.mNpoDlPt//pc14NS' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510232' AS nis, 'RAISYA AMALIA' AS nama_lengkap, '$2y$10$IDHVysTfWn7cguZt86LVFuUm38ZjaHlF2JsLm254HOxJ/9V2P4Dby' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510233' AS nis, 'RIDHO RIZKI GUNAWAN' AS nama_lengkap, '$2y$10$.9MNgwFw8AlYLO003W/jrO7TdWbkKvjgg0fg9F1jmOT0GsETlAHDi' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510234' AS nis, 'RIFAN AMIN FAUZAN' AS nama_lengkap, '$2y$10$3uW2FPTaktsxj/w9eJ5SSOODlHn74JLCzIJYmY6vQukl2dPlfOLBW' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510235' AS nis, 'SAVINNA CHALLITA' AS nama_lengkap, '$2y$10$2Zv.Ykp6gWGzqLb8Fiob8e7gLl/yQJcPJodPI1um6rLwXgPQ2bxn.' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510236' AS nis, 'SYAFA AL QUEENA ROFI' AS nama_lengkap, '$2y$10$XCdl7aHoGi59HHRqFtsgg.NUMn82EzcqSufYMomzZG1SeTFwQ14Ea' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510237' AS nis, 'TASYA ASTI AURELIA' AS nama_lengkap, '$2y$10$1G9aC1Zo6H35pqtIc2JR1.9hqlopl253zEFqa4JcWyu4Hj0ndD52.' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510238' AS nis, 'ZAHRA AULIA KIRANIA' AS nama_lengkap, '$2y$10$STgJ/U9tcU/X6KxSo3n/0uY1ZL776iiMteJVp4aXh0UKFXHEhOHsq' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510239' AS nis, 'ABDHI RESTU PRATAMA' AS nama_lengkap, '$2y$10$2Rd0f2UveTYWKy4hr5YV6eYrG/CsyAmLj.Z0/gYsxdEbr38odj5TS' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510240' AS nis, 'ADRIANA MOZZA RAYSA ARUMMI' AS nama_lengkap, '$2y$10$a7engUBcYWvl..nOunYdUeumEEKVYnmeY4DRuxaTp5Z7.FcLCWG56' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510241' AS nis, 'AHMAD SOPIAN' AS nama_lengkap, '$2y$10$EdHUg4vkOVScuk/P2uKxL.TkdiugWagGYLrKit77ym4kQctrM6hFi' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510242' AS nis, 'ALVIN NURAHMAN' AS nama_lengkap, '$2y$10$g5EA56GeKqAk4d2bhdSQPOTRNT1d1K4L2vliMbmM6nayCDYe8asJi' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510243' AS nis, 'AMANDA SAHFITRI' AS nama_lengkap, '$2y$10$tlBmNWOO7wd13dPV2m.WpuiF.MtCxc3Tb6TmAoTt01ARE.zkxhb.S' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510244' AS nis, 'AMELIA PUTRI PRATIWI' AS nama_lengkap, '$2y$10$QTR6uHwJcGisedS1Vkr3o.Zvgp0pmahPvbU0ZYOQi.6SYk6gmGW2a' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510245' AS nis, 'ANDIKA RAMADHAN DWI PUTRA' AS nama_lengkap, '$2y$10$t8lCoWwLCi/OFBf4VS7v1OaCHWAmQmALk0Lqa8q3mZavoNQ.GHiAO' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510246' AS nis, 'ANDRE' AS nama_lengkap, '$2y$10$J/z0j2ZTejZGvlYjndxy.euXW1t18x1GAYvwmvlxu9S2/cSJiZJ5G' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510247' AS nis, 'ANISA SALSABILA WIJAYA' AS nama_lengkap, '$2y$10$iliCLE1.a96UqQMovs4dV.tWmmokV0FDcBu.i/yAuXICq5ZBVAJ4G' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510248' AS nis, 'DEFASYA ANGGARA PUTRA ADITYA' AS nama_lengkap, '$2y$10$hWzBxtXSQmVgN5asEnCWjuNkf9BBDqFhZWr3yKbTP0CXeCUEHTCMu' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510249' AS nis, 'DIANA ANGRAENI' AS nama_lengkap, '$2y$10$orJMPlGHsrbUzVyY2GOhjeaRIuFOfYVY06GdWzq6a8IHhWvtg3Rz.' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510250' AS nis, 'FATIR FERDINAND' AS nama_lengkap, '$2y$10$L/L0Wom.defiJMzMF4XuF.R95fpj6Eihi8XBccjd3krfDQAO22GtO' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510251' AS nis, 'FEBY THERESIA DWIYANTI' AS nama_lengkap, '$2y$10$Rye9LaUmV5NxAwxHPLm/0OKpOBOkZsw7FO/U/1RxE2Fsy9mkF2Qr.' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510252' AS nis, 'FILDZA KHAIRINA RIDWAN' AS nama_lengkap, '$2y$10$65gvkcUg0X0YneJ01k9zFOhq7OjHCfzFKxAZsHjqXWnhdANsQfT0W' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510253' AS nis, 'HAFIZD IKHWANUL KAMIL' AS nama_lengkap, '$2y$10$4JNazbHJ7loKD5Wjs59Fke08JG8X6egDQdv9w9wVLhYQ4dvnWQ79.' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510254' AS nis, 'HILDA SITI MAULIDA' AS nama_lengkap, '$2y$10$/cJ3P2oA2o0T1EeXlVfp9.o9OEPSylRA7wgHBCH6F1hz4Uzaq1KhO' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510255' AS nis, 'KANAYA ANDHITA MAYCHELLA' AS nama_lengkap, '$2y$10$eTTj5CyPx//Kzdi6MJKcE.IXQ.TR/elMaeOs5pkwq1jbpU5cNKWKy' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510256' AS nis, 'KEIKO AQILA ANANDIRA' AS nama_lengkap, '$2y$10$xZjkCUDcMKixN.pAzbjh5etrEe1SYBv4wJ6XaCsD2swnSvvWZYCa2' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510257' AS nis, 'KEISYA PUTRI ZALIANTI' AS nama_lengkap, '$2y$10$fUjWMZ5ltSodT7HzgqjsYO.jVMV2SlZWYQ0FPvA1hcmhfYqYiqc9K' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510258' AS nis, 'KENFITRIA SALSABILA PEGARANI' AS nama_lengkap, '$2y$10$gZ1G0JQGowgNbteJO1QNxOeDW0pHWqdKJjHaD3rr4ovCAQDGHzS86' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510259' AS nis, 'MUHAMMAD RIZKI MALIK ABDILAH' AS nama_lengkap, '$2y$10$HI7.JSBbVzjS3A9xhiQm6exyM12jy8b09/KYazHIirR6TALf4GAaG' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510260' AS nis, 'MUHAMAD HENDI SAPUTRA' AS nama_lengkap, '$2y$10$p.d6B/I1HfAEhNXGtqL6sOKDtpzg1Uh7tv5HSTRKXpsNDwLbSwGDK' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510261' AS nis, 'MUHAMAD ZLATAN IBRAHIM' AS nama_lengkap, '$2y$10$78GG/Iuw9u0PHVX89y4i0uUHaBloq0NHGXYcmLqBNhs52LrHRmh8i' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510262' AS nis, 'MUHAMMAD ARSYAD ALYASA' AS nama_lengkap, '$2y$10$6AmyeNDvO3Myuu2IMIGs5uEHK.xq0a/LzhJQLvOXHu46i9dj2EUVq' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510263' AS nis, 'MUHAMMAD RIZKY FAUZY' AS nama_lengkap, '$2y$10$KEYfwvov42/YoPceRC1UPeP4g5OLCwElHHpQIx7m79lfwtevmsc4m' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510264' AS nis, 'NADYA NUR ATTIFA RISALMA' AS nama_lengkap, '$2y$10$tGwEIMX237BvmGhNKHZNzuoi85QoM8t0pucHwUCqKhGzTfa/2.5mS' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510265' AS nis, 'NATASYA ZELIKA RAMADHANTY' AS nama_lengkap, '$2y$10$3uJPPVXwL6P2Y.Cz0tfN8uPZ06YVO8xQIO/DJVTyzp06yqIgv6hZW' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510266' AS nis, 'NEYLA FITRI OKTAVIANI' AS nama_lengkap, '$2y$10$l21ukljBTkRZZm7LotUJLe64o88U4GeLwa3NTVcUEokTXdiNSgbJi' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510267' AS nis, 'OSYA RAFFIE RAZAQIE' AS nama_lengkap, '$2y$10$FNt4nl7bLQqEIv.VZZEKw.YR5QtcTx5PFcp8IHyixwGjRHRQgEuU.' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510268' AS nis, 'RAISYA ANGELIA' AS nama_lengkap, '$2y$10$nmedFVJUT8nhDoELK4t4pOEjttwkGWq02Qhp0o3ZcMBN.9w/fegUS' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510269' AS nis, 'RAISYA MUTIARA ALZAHRA' AS nama_lengkap, '$2y$10$K3tPq/1naaVPwK1QQuRq4e4jrL8gZtVfZp5KYO7Y8lfnu9jWAcAUy' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510270' AS nis, 'RANI NUR AENI' AS nama_lengkap, '$2y$10$tm.yA0iIjqu2x4A67ENt.O6FZX4k30s.7P2gkf8Q4nVV55Q8/BpIm' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510271' AS nis, 'REYNA NABIHA SHULA' AS nama_lengkap, '$2y$10$SjSTRSkyPCPyp0MQRSx3A.irI0ZobLuBqkfCcWUnZJj6YK8IwyRsy' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510272' AS nis, 'RINDRA RIZKIA RAFLIANA' AS nama_lengkap, '$2y$10$Mw.yI2jpMQikIKdYai0pcutKcU2mBPsIcHqhQoYyuhXUzmBF5GXLi' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510273' AS nis, 'SIFA ANGGRAENI' AS nama_lengkap, '$2y$10$PrI3.yNaQ9sXLZz1YbuAWOvjSM1XfAGfLHnbduV.BEE591rzoakq.' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510274' AS nis, 'SYAFIRA PUTRI HERDIYANTI' AS nama_lengkap, '$2y$10$0.MX84aSz9up0hnbdR2xweeQ0yXlhWNMjMptQNqB7lHfj36QbhLLi' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510275' AS nis, 'THALITA PUTRI ANINDYA' AS nama_lengkap, '$2y$10$1R10uE1zGgdhsZZ9PCxo4.p6xUtK5/r05WFV84ArXmfl400J0IIim' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510276' AS nis, 'ZIDANE DZIAULHAQ FAHDILLA' AS nama_lengkap, '$2y$10$AucbUCx9UFBvaf7wIZPI7OCBUsaBxm9N6NOmfbc9eN2OGV5rRKeqm' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510277' AS nis, 'ADINDA LUSIANA ARISAPUTRA' AS nama_lengkap, '$2y$10$roKrSrvJVzKsZDAbBMG7Ce513Lq8IcvaIXB7kX5Yh9STVEc985NYW' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510278' AS nis, 'ANIS FITRY' AS nama_lengkap, '$2y$10$d3ylnun2IG70IgGhrmxYgOtLewowyMB3zIVVgSNbnr/j3ejPWRpmK' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510279' AS nis, 'ANISA KARIM' AS nama_lengkap, '$2y$10$t1maV6hr33j6Zp11yFhTCeIk5..YB2zsoe/VG6w/hf/Iy1FpC9zZW' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510280' AS nis, 'ANITA HERLIANA' AS nama_lengkap, '$2y$10$6DmKF64G3hOC5jWgIlChY.u4OFxPYLcUYStxZFap.jvYCRuQA5NeW' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510281' AS nis, 'ANNISA ILMAN HANIFA' AS nama_lengkap, '$2y$10$YTqeAhKxI.cvBhzjLrHGQeGCFV6LjZroomGrK1Nwk/POaRprVgoaG' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510282' AS nis, 'ANUGRAH WIYASA' AS nama_lengkap, '$2y$10$pKgZ.m0HPeR8XTeP61RbwuTyHK5FL3gFE7/bv4DKAb/sjoQ21Cck2' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510283' AS nis, 'ARDIANSYAH GUNAWAN' AS nama_lengkap, '$2y$10$UCa52cLSY5fJrxg5PfhBQeJuKhw2EccLTk.fdEJubYYZA/V6jwpDy' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510284' AS nis, 'AUREL NATASYA PUTRI' AS nama_lengkap, '$2y$10$SILnj1Lc47S4iACxU9yz1.hDoYAc1ZKILQmmUO6Z8Bh7gQWaJroj.' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510285' AS nis, 'BAGAS ADITIA NUGRAHA' AS nama_lengkap, '$2y$10$0chNT2hz0hxtkaIYO6ozBepd3J4DB9shYcRc4JFEc/y/HqlNHsU.a' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510286' AS nis, 'CHIKA FARADINA RUHIAT' AS nama_lengkap, '$2y$10$BTB2oty5VEBjLng4xBo3.usb9O40wPyejnsv9I4NlgSz5R1ieHY8.' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510287' AS nis, 'DAFFA HAFIZ FIRDAUS' AS nama_lengkap, '$2y$10$AWpIn1P6KaBG0wB.NEu3DeGsqhyUW8p6cWq/hdhc4x8rQXyY6nM9C' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510288' AS nis, 'DERIEL RAFIQAYSA' AS nama_lengkap, '$2y$10$vc8p3iO9aS/rufqXsug/FuqOhtESmkrtT8gIhrYrMpaCaAJ0CrcDm' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510289' AS nis, 'DIANA ARISTA' AS nama_lengkap, '$2y$10$6lLAmuYe7Io/p4Apzc73vuWIX1ucyVakkNlPXh13Z5x/MPEpAd4fO' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510290' AS nis, 'FAHRI RAMDANI' AS nama_lengkap, '$2y$10$67QNL68QgR3tvnPo8HdqqezzWHOmWUbho4XHwLWfLxA7uTP1vuBnm' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510291' AS nis, 'FERNANDY ARDIANA SYAHRAYAN' AS nama_lengkap, '$2y$10$80c2oTcEgfwPUsg8LrAGvuJ1XcaVymm6qtB7u8A8AYDJ5bl13TYRa' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510292' AS nis, 'GHIANDRA MAULANA' AS nama_lengkap, '$2y$10$NaMKuum4mInJJ/yY0Yb9PePUriwC/wr2Gmyb32mUN/EYK2ha66EfS' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510293' AS nis, 'GUIDO JOSAFAT' AS nama_lengkap, '$2y$10$/U2hpTYokOzg8kQ7b8UMAOf9ShjG3PtaQ6H9HDdYt9CN1hc/7o4qm' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510294' AS nis, 'HAIKAL CHANDRA WINATA' AS nama_lengkap, '$2y$10$XVmAdJY8s8LugZ1xUGeA1OOrD1Wznh7HdzXQ0lf353Z1NcPCx8cAe' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510295' AS nis, 'JIHAN FATHIYAH ISMARA' AS nama_lengkap, '$2y$10$fEpuQMwcCHr7a5xI6S1F5Ob1ihHaFbxHhZDCTb9HIK.zF1.Ty5XD2' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510296' AS nis, 'KEISHA YUNA ARIESTA' AS nama_lengkap, '$2y$10$WRVq3PQy2vhORmgZuPMeeuRyw4iRoWQOESJ6z9gdF2h5EgO2uQ9QK' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510297' AS nis, 'KEYSA SHAFIRA OCTAVIANIE' AS nama_lengkap, '$2y$10$g1z8B0VGL7F6LIDNlEOOI.l7AIQ2acg/pThi59kiqeOmPiteOLNAC' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510298' AS nis, 'LUBNA LUTFIFFAH' AS nama_lengkap, '$2y$10$wuDy/UTnWIMu3JPsQ22Y7OS2rFRLugOMI3MYMEuRqzje1WC3zajY.' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510299' AS nis, 'MEILANDRIE ARTIKA SUWANDY' AS nama_lengkap, '$2y$10$qgq.ertrRWRLxFMwZChlxOtxz4Ez80BVhezYZBnusWAyRSWp8I/Di' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510300' AS nis, 'MUHAMAD REIZA MAHENDRANA' AS nama_lengkap, '$2y$10$XKapGeFmGCl49EaQZXXTbe3EHeLWTVVVgw/tuO40DbJA36wlVj69m' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510301' AS nis, 'MUHAMMAD DEVAN RAMADHAN' AS nama_lengkap, '$2y$10$QCMewOLqEWe9sQ3NkdIyQetfcrWD5NMCba70fXg9zsHEcz4YUAs2m' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510302' AS nis, 'MUHAMMAD SAIFUL ABDULLAH' AS nama_lengkap, '$2y$10$MbTJoxYvMBTsQCxpv9rqlOIEXhx3EkKA3xsW1PfYqRTIQsJL/c4nm' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510303' AS nis, 'NABILLA KHOIRUNNISA' AS nama_lengkap, '$2y$10$IdJgeUQ/8oIRbjDkSRjlb.SYXtA4VekiTgefbcRpne5sPfb6Dqp/G' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510304' AS nis, 'NENG SIVA NURPADILA' AS nama_lengkap, '$2y$10$U0r2CxJ5YVB/tUXPfy/6sOQVZRPu8E62sXkJInEAP.mhUQ88ojGVS' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510305' AS nis, 'PASHA FAHMI ROBIANSYAH' AS nama_lengkap, '$2y$10$R8fy/6KkL1ifnTFj4yuGTeJzQRb7Lg0U212ZKdxRpjJZnbNAfe9Zm' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510306' AS nis, 'REGITA ANDIA PUTRI' AS nama_lengkap, '$2y$10$I7Vj28NdlJV8l7Jx0bUYn.061pE.LFsYBQ1I1qrC2BbK5Huk3EZUm' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510307' AS nis, 'RESTI NURAINI' AS nama_lengkap, '$2y$10$/gjX4azmjPlEmVebth8ZZe7prxOSr69PKECiUvaYPJ3HDuz.39O3.' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510309' AS nis, 'RIZKY RAMADHANI' AS nama_lengkap, '$2y$10$SkpCFZn.qfMvwcEfPyj.TuI9kn54yTA4LBTKwCN5j6WVoI.jblwTK' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510310' AS nis, 'SANY NURRAHMAWATI' AS nama_lengkap, '$2y$10$n5YJpP3BwPeuBca8yZOEqefvJoDLrpneSwTfQLajA346qfNaYEiqu' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510311' AS nis, 'SITI AISAH SAIDAH' AS nama_lengkap, '$2y$10$o30l3IfqvgD3CmOTAS5JF.1763tnqqUJltJjxtoSMJ0IEeaPT3SfC' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510312' AS nis, 'SYAHIRA SADZYA' AS nama_lengkap, '$2y$10$VppJw1y.ftC.lqPJwkFjbeWc4.kuXPdZhe.pA1cLthEbJ3OL7dZ6.' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510313' AS nis, 'SYIFA AZ ZAHRA' AS nama_lengkap, '$2y$10$LkWhEl8rrzZsWb2/en8U2OQLrYZFbfpNvhphE.NkD5cYPkEuZoOB2' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510314' AS nis, 'ZEFANYA KENESIA SINAGA' AS nama_lengkap, '$2y$10$z3jh/MDKSIY5yZklskE2lerOISs6VMhv.bdE7ZEgUmVQtQJlrvaAK' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510315' AS nis, 'ADELIA AGUSTIN' AS nama_lengkap, '$2y$10$GoKY7Djego0Yc.Xz1lspUOo68/QCBs9QWVw84q4/CsFECq4d0bVnW' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510316' AS nis, 'ANNISA PUTRI' AS nama_lengkap, '$2y$10$9CGpLQcPEwJhbEU3zhjHauWnFzxm/9kFVFwgOd7T8cTxCUIKLAifi' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510318' AS nis, 'ARUMMI LAMHA RAMADANIA' AS nama_lengkap, '$2y$10$WAGCk7ZHzZmpzEB0rfZuBuGNm2pF4bwF9mSXzXzEtsUpIGtg72zza' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510319' AS nis, 'AULIA RAMADHANI' AS nama_lengkap, '$2y$10$lEnskDGgOhpzEJBr12qHzO4U89LnfIXFXFaEEc8NZFLgUlaQnEycS' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510320' AS nis, 'BAYU APRIANSYAH' AS nama_lengkap, '$2y$10$Ru.6QHUi3oNTYo4PVUntB.NdR1dgHfc2cU/pB9BpzlqqS.bFl498K' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510321' AS nis, 'BILAL RAJAB SYUHADA' AS nama_lengkap, '$2y$10$J1f6zOh8Gc9VCIFghU7yPevICtWbFqrVY3hKsgSVNVf.beAszesPa' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510322' AS nis, 'DEMIAN REIVANDIKA RAMADHAN' AS nama_lengkap, '$2y$10$81AEhefwjBFg2aqoRDdaVunbUAQyWCH14Fv4NoBPbQa5NhBj/m5XO' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510323' AS nis, 'DENI CANDRA SATRIYA' AS nama_lengkap, '$2y$10$KOXEheR1WnKK5.AMt3Nzp.QcW.QCt2YS0kYKn3fGk0c7e6FHJhYVu' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510324' AS nis, 'DIANA JELITA KUSUMASTIWI' AS nama_lengkap, '$2y$10$hJ1tEDDPebr1Sjabgku15eC7g1Y8.ZRAZU51zWiQvc0B/hnU.BM7.' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510325' AS nis, 'DIANA SRI WAHYUNI' AS nama_lengkap, '$2y$10$eQWch8p9BRUcJFcdITzY/OnrRPnHnv.cbfscPNMuu7F0NdPEHtVBq' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510326' AS nis, 'DIMAS DIKA SAPUTRA' AS nama_lengkap, '$2y$10$C9Q9aqnbVbjMb9HHXqmaruLB8MYwwYqI4dwtWxy1ItlhlcsICaVPa' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510327' AS nis, 'FADIA AZAHRA' AS nama_lengkap, '$2y$10$4iu9nD.ujgk7eZc6A2j6SevRk.8uFa8fOQk88/Y.ngz5XKfoQfu6i' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510328' AS nis, 'FAUZIAH RAHMAHAYATI' AS nama_lengkap, '$2y$10$uXrrgMbZRse7/lX1VWCICOK6MEeBzlKT7OmeRE4JiCz54csg4hyzO' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510329' AS nis, 'GARNETTA ARTANTY' AS nama_lengkap, '$2y$10$QeYBmZ9H7YXLRyEa95i7iuoU6iS7h.InU.FSdxhkn68Y8kWEXwi3.' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510330' AS nis, 'ILHAM RAMADHAN' AS nama_lengkap, '$2y$10$I36hMQgYieWC.ai26Fwq..z4eQMwlBKuO.SNWCVUq9xeUPQF01x26' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510331' AS nis, 'IQBAL FAJRI FERDIANSYAH' AS nama_lengkap, '$2y$10$GWm8hEcEfQvr4GoR4s9wb.Fh81CmIYhSut1i4R4bK5rcISIoiU8Zi' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510332' AS nis, 'JANUAR MOHAMMAD DRAJAT' AS nama_lengkap, '$2y$10$kjjnblpOw4ruaub.Solri.KWhqRFhAB2oX3B7g2keMjDls9mdvPFO' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510333' AS nis, 'KAYLA HUMAIRA MAULIDA AZZAHRA' AS nama_lengkap, '$2y$10$vf9FKkPmtepG/3YDC.W71uaoJDucELR.N88.nPf/DrzYoy73c/ibK' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510334' AS nis, 'KESYA KIANYA QUROTAAYUNI' AS nama_lengkap, '$2y$10$ehQhISJOi7wu9wM1JZlMyen2Lxt2ETnGdjh8GcqJ3UZcjkhpVJHla' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510335' AS nis, 'LAILA RINJANI' AS nama_lengkap, '$2y$10$rox37dsP3uw9chmY22CFfuQKHoFSlWGaRLv9HrcLWIA2q7UckH9hG' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510336' AS nis, 'MUHAMMAD FAHRI ZARNAUZI' AS nama_lengkap, '$2y$10$bYQuDU8py.eLLFCDXo2I3OXskbhhradwUfQtOhOTwJVy33tX1NJ62' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510337' AS nis, 'MUHAMMAD FAIRUZ KUSMAYADI' AS nama_lengkap, '$2y$10$OXXnHufa2aGNuxAzkKJ/rOoHUL32Oyc.UNWeTCgIBisOYy7IZxT6C' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510338' AS nis, 'MUSHAB HAFIDZUL KARIEM' AS nama_lengkap, '$2y$10$kT2M0ERNU4KYhtQ4p263SeyDUWGJElzCH55T.R08LtIXCCSXtxwvS' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510339' AS nis, 'MUTIARA AGSTYA SETIAWAN' AS nama_lengkap, '$2y$10$Sg/fCuDbTd.sdRID/9ugd.ihumJG1FCNHxVRub3xkODTq5e3r59kq' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510340' AS nis, 'NAYARI ISNA LATIFAH' AS nama_lengkap, '$2y$10$NfvBzf6d0sAYKxoaeu5uUevSLdkBA2qY/UcpRC1IJFsEXywT1kATm' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510341' AS nis, 'PAUZIAH' AS nama_lengkap, '$2y$10$RZPmEOo5w/XR7T72Hc0PfOOJePL3eaecBaVq/wUIoZR8uVuhO7R0O' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510342' AS nis, 'PERMANA AGUNG SANTOSO' AS nama_lengkap, '$2y$10$eEQ7/rmrfIgyAYqBNnRmtuh6bzvz3695xA6fCXKmd6SxSS0cSoa9e' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510343' AS nis, 'REHAN PRIATNA' AS nama_lengkap, '$2y$10$RYYXDiukL26t0zTE6Xk.AuOPQy1OtifjsgO3chkUDPeV3g0yQg.Ea' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510344' AS nis, 'REYNATA RAHMA NOERRACHIM' AS nama_lengkap, '$2y$10$amq1XSQ5Z/xnLcGfF.w1CuQ/ZZaOne2nOsXEuKINYUMWcQAhIVS1O' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510345' AS nis, 'ROBI MUHAMAD ZAKARIA' AS nama_lengkap, '$2y$10$ZFpcosOLMi/aHn1kItWg3uunUjWvwsoKec0nyDe0bROGkA2Yd2Sme' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510346' AS nis, 'SAYYIDAH PUTRI SALAMAH' AS nama_lengkap, '$2y$10$SqWIQPDKXcDT24GI8q7MCuKclOtYth7nnwwTML1ecV/AAgjmisD6S' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510347' AS nis, 'SHAKA DICHI PUTRA' AS nama_lengkap, '$2y$10$tKhhuWr7Sq3SjK9sEmFKLejGI4fwgq.15S4uGYLg8EN5Y34JqlAb2' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510348' AS nis, 'SITI ANISA SAHADAH' AS nama_lengkap, '$2y$10$xrAoHGytnHRhkDlLiMRRSeLO6ac3izcqE1NXpF9Kq9ypwp6EKu0QK' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510349' AS nis, 'SYAHRANI FITRI AULIA' AS nama_lengkap, '$2y$10$1/ZCf4EsafzuWjD9F7whyOoKZAb88n0GuYg4Sgv4wORjYTsK9.OOG' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510350' AS nis, 'SYIFA KIRANA AMRI' AS nama_lengkap, '$2y$10$Uvey/Kaa9oUeRntereoLyOFvV0mJWaAvkKVLKWDKlu3B27mUDeO6u' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510351' AS nis, 'ZOEBIE WIDANSYAH ABDILLAH' AS nama_lengkap, '$2y$10$soVp4lwtRl3ztjpasMTXbuw2tbqJEIHXQ628v6I08wAsrSudrsokq' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510352' AS nis, 'ZULFA TASYIRA ALGHIFARI SABANIAH' AS nama_lengkap, '$2y$10$SNmck36qbkYRsU1.mgzrz.DObG/KSiy.Zq2ryFh5dllS2PolUs4QO' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510353' AS nis, 'ALFAIRA BERLIYANI' AS nama_lengkap, '$2y$10$zoQJtZHTUsa2u5y0VMi7.uqXoDhWAUL/UrTchxqm78nlGL5gPJj1u' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510354' AS nis, 'ALFIKA KIRANA' AS nama_lengkap, '$2y$10$XjbtdnCd/2guxU2cQMtHPue9HVjYfXoyGK2YxxIEbYMr4./RoAVAG' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510355' AS nis, 'ALODIA FIDELA ATMAJAYA HARMONO' AS nama_lengkap, '$2y$10$uyHhZPsP0BW82ZfpbMy7k.I/hlWYcwPT6cQ39lLArBAHaiQvZcfFO' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510356' AS nis, 'ALYZA KIRANIA AZKA SHAFIRA' AS nama_lengkap, '$2y$10$K5gYx7tJ4BuvG9uSp5uPDOJBTbYVc.PofKx6zRoXTVXNWeWtpAxka' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510357' AS nis, 'AUFA JAUZA AZKIYAH' AS nama_lengkap, '$2y$10$UvByWhXyspUstDdl5tI8veomsLQ3a57DNQjhaYZ.4K.JcE22QXHoG' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510358' AS nis, 'BINTANG MUHAMAD AR RAVI' AS nama_lengkap, '$2y$10$YLy0uODowuv3WLtH2Nzi4OZm1qt0N6flBlLozfgigtsUewnJ5wPSG' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510359' AS nis, 'BUNGA ROSI MUTIARA SANI' AS nama_lengkap, '$2y$10$wS2cHeR6UsWCjVEHbegovulwStOYUNgdO9RIlM6QCuXl.T4zY2FQ2' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510360' AS nis, 'DENIS PERDANA SETIAWAN' AS nama_lengkap, '$2y$10$qE1zBOpAUC6Rot28t6qJr.owaXZ6h8fWexBXUGUxUvU2Rfz3Zv0w6' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510361' AS nis, 'DIMAS ZAHRAN ASSIDQI' AS nama_lengkap, '$2y$10$JdqE9PhmCFySKuPEjcjqp./QHlNXfq9x9GCnhnjzj12JhQU2ujt4.' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510362' AS nis, 'DIZA AUFAA SOFYAN' AS nama_lengkap, '$2y$10$mRIAgpuqnMTzkJwF60LCHectu95GfwuZzbtVgozVuzy3pJuhYmVle' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510363' AS nis, 'DURROTUL INNAROH' AS nama_lengkap, '$2y$10$tcZoasvrNPeUfJdf5Cxugu.3LKATIkq3bRuUG7Iwcqc5ov/Hx6oIC' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510364' AS nis, 'FIRA NOVIANTI' AS nama_lengkap, '$2y$10$FsO56O6k7qFJCvV5eM493OCR1xAGYfHAoqSgMmu79Fmwt.U6Rg7U6' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510365' AS nis, 'ISMA RAHMAWATI KUSUMAH' AS nama_lengkap, '$2y$10$l8d7LgCV9ZWFK4uxfUFxOOrx3Nh5mZnooH1RHtGxIa0ruW1SK05iy' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510366' AS nis, 'IVAN ATHALLAH MUSYAFFA NURDIN' AS nama_lengkap, '$2y$10$bQKVUU2rS7KHjsVFRPJjIuLk6CKk3.lfHQtI6tzQMWeMmn2K38aym' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510367' AS nis, 'KANIA RAMADHANI' AS nama_lengkap, '$2y$10$.WmKQgPfgAbwYwv5mKfu3uYPotiNAkMvZs3PSdalk68.FGkf7jv3a' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510368' AS nis, 'KAYLA ROSYAITA IMANSYAH' AS nama_lengkap, '$2y$10$1xrCK4xl2QgFHpncUMLeq.pFYK4pLzCCe/d1yF.JUzFcd8JoWUQyq' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510369' AS nis, 'KEYSA REGITA NURFITRI ADRIANA' AS nama_lengkap, '$2y$10$4lS2w66m0bOm47XWb7n0pOPHKgWZSHSnlpP0IiPmItJLVSXryhYAG' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510370' AS nis, 'KRISTALICA PUTRI' AS nama_lengkap, '$2y$10$K.4YqKLLTK5uBSySduogceZI8YQjROVK8i7rtyqll5Vlyik/dBC1u' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510371' AS nis, 'MOCHAMAD RIFQY NUGRAHA' AS nama_lengkap, '$2y$10$x/6HynNVEH4iJ6lYxa.hcOaDN.1Rybvs4uMhvg0NKn3RRX/rfRW2W' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510372' AS nis, 'MUHAMAD REGAN FAUZAN' AS nama_lengkap, '$2y$10$vr9lYCMUC2LcvtUKmurIiOGsQn68UOaPlcKXJMnFbCGMJDNeomtD.' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510373' AS nis, 'MUHAMMAD ARYA KEMAL' AS nama_lengkap, '$2y$10$ECHKXpRxmrhpP9G7GLrDkO6d1uoK0/lHR0Y5CdTwQalevwdPQ6Ps.' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510374' AS nis, 'MUHAMMAD FAJRI SUBHI' AS nama_lengkap, '$2y$10$6kA1yQS03GY1.X5EZgstmOQBhkJkvpVbkIosINCnEj2HNbX6F2LrW' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510375' AS nis, 'MUHAMMAD GHAUSSAN ARIFIN' AS nama_lengkap, '$2y$10$IOARHsQcWhNs6VRpmosab.3Asml7Oq70ZfsOaXsoAAM2vMT79QHz6' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510376' AS nis, 'NABILLA KAYLA KINASIH' AS nama_lengkap, '$2y$10$/ibKanSaX9o5TFQe.ZDj.ewtyVobuSLBVm7LZ2yUqkJ7RtMNwylza' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510377' AS nis, 'NAZWA RHEIZA YUSHA SAPUTRA' AS nama_lengkap, '$2y$10$2HCq94FDXc4esYSABg0Gb.RGI/0DmxxDPrLVY1hf604DZZmq1fsX6' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510378' AS nis, 'NESYA HAURA TASMIRA' AS nama_lengkap, '$2y$10$e09EFqOncgL.iVDRPJNg.O.mIQRDkLV0YFpGWU9f0tVgA9lh4hU8K' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510379' AS nis, 'NILAM NAULIYA HERLIANI' AS nama_lengkap, '$2y$10$L0IVDr/6HMAqVsLy6kQgUOQfbzxIG4DFlM/MZazjQeTroOStlqnLO' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510380' AS nis, 'PRISA RAHMA' AS nama_lengkap, '$2y$10$/ulbOXHBnnmAoY7kDBR8tOgA37A0VJmN1zdG6Mb395o5eDdROOp7a' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510381' AS nis, 'RADEN MOCHAMAD REYHAN FIRDAUS' AS nama_lengkap, '$2y$10$BxAtJJwgCGb2eJSP0dd7Cu44imODZ2BPs/R8Cz341L1jbfR2V7ES6' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510382' AS nis, 'RAFFI SAMIR NASRI' AS nama_lengkap, '$2y$10$hdeym2aMzLcnQidtKyfMnenQDkcdniHTJEcIqO9xQhcs.uLba/biW' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510383' AS nis, 'RAMADHANI SUARDI' AS nama_lengkap, '$2y$10$jubcss/HS87IRYw7cd1bm.xVkds2qxZ9w2Pwv8g0rOoazC9MJMhJK' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510384' AS nis, 'RIDZKY FAUZANZY' AS nama_lengkap, '$2y$10$CZpvgZ2mtTtgrb/FNi40qu4/oUblxZQLj.bU9BkXnGLsVechLdNpS' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510385' AS nis, 'SAMMY ADHITYA RAHMAN' AS nama_lengkap, '$2y$10$S6qjzgfCOLct/SQ7R2yIy.ZKQqqDQzC0MI62x.r56f3ygg7AlLGzO' AS password, 'XII-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510386' AS nis, 'SEPTI DWI RAHMADANI' AS nama_lengkap, '$2y$10$57kIdsmwPaIl/wdjDR7QdO8LBe5YrLjTdqMtF3BginxlS59D1bDj6' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510387' AS nis, 'TALISYA CALISTA' AS nama_lengkap, '$2y$10$vdYzlprkp0L/4MQv1xXRQ..kckJlmqq.giumhCEQt3Het6YMYpn1.' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510388' AS nis, 'WINA SEPTIANI ROMDONI' AS nama_lengkap, '$2y$10$3dPoDApdukkJv0iwM/VN9.Jo/vc.TokC9QmoSaPADPcyOwGTZio2u' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510389' AS nis, 'WIWIN' AS nama_lengkap, '$2y$10$7E29WJpduJvPE07mw.2rY.XRO4u7fKY4PIKjjHIo0Cl9QFq2kEJ3K' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510390' AS nis, 'ZENITHA VITALOKA' AS nama_lengkap, '$2y$10$NCZm0jPFwy.P5ESTAQsx.OtiXha/GUrvqD4nvHSOPlN59xlOB94Eq' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510391' AS nis, 'ARIO HIDAYAT' AS nama_lengkap, '$2y$10$qCcy5e.QPDTjPw5Eg1Huq.HMIK1LaPdQrTdj27fXqOHrOIGncJJLi' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510392' AS nis, 'AURA APRILIA' AS nama_lengkap, '$2y$10$9rtyXX9oi.1tVeLcsJJvC.DMDhiBTad6pijwax3wqla4mYLokgt8u' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510393' AS nis, 'BOBBY ADONOVAN' AS nama_lengkap, '$2y$10$CA//WUwz.g8Pjnli1Cw7.ed2mkh.26gSnLcPkbWP1UhjB5SeECd7i' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510394' AS nis, 'CINTA DWI APRILIANA' AS nama_lengkap, '$2y$10$.UKrx8jNcBBpstoftOLMyuva82MszjV.4mXHs.BFao4k3yBZFIwn.' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510395' AS nis, 'DIANDRA PRAMUGIA RAHARJO' AS nama_lengkap, '$2y$10$VM5ypyws2bC1RRLmFVrJTuvy6rZ7QpmviOfFBUucdV0ia9njF2sPC' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510396' AS nis, 'EFFLLY RACHMAWATI NOERANI' AS nama_lengkap, '$2y$10$YYywZHYHvr8cVwArzC3IOe/tTkEOx3YDbsUzBAKZ.V60waO3kRpPe' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510397' AS nis, 'ERLIE ZAHRANI' AS nama_lengkap, '$2y$10$.BO7HPtYGSsjJAYCsvSIXOEbtR8zTSmWC4OGt9s5lD56g/IUzUqQW' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510398' AS nis, 'FADHYL RIZQY PRATAMA' AS nama_lengkap, '$2y$10$h3EwetgyeVRgSqMGmtxEuu1W4unmhUZLgNDeQCi4tlkDNh8E.285y' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510399' AS nis, 'FAHRI AKBAR' AS nama_lengkap, '$2y$10$IMGxt0elJu1JNvP5QBDR3ODzrtx8gyg8Z6MvN7kdacQmAn4jZ818W' AS password, 'XII-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510400' AS nis, 'FEBRIYANA PUTRI PRATAMA' AS nama_lengkap, '$2y$10$HvVoh5mNKf09Uy8IgdDoie6Vq6seyqPl7sISmHPh/cDASW7hwJA9.' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510401' AS nis, 'HANIF AQILLA BAGAPRAWIRA' AS nama_lengkap, '$2y$10$KZu2I2CH6G3jS3m8BIHk2.Ybu1SfTVFyZmU5XtYNcz2KNq3VurwK6' AS password, 'XII-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510402' AS nis, 'JUAN YESAYA' AS nama_lengkap, '$2y$10$5qxljKRDP5k6iUF3i.JAXuziSv../l/4rbjbiMoZBPYiIHSDXCoLm' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510403' AS nis, 'KEYSHA NALA ALRAF BELLA' AS nama_lengkap, '$2y$10$lNcINfCtODaCzY5BsObSveZIPe5Dus0uW1tNzjGqDSL2b8/6trtIC' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510404' AS nis, 'KEYZILA NAFFISAHANIF' AS nama_lengkap, '$2y$10$Oj6MU5U0CPVIC6k6O0QdfuHev8GSKElwxKXfj4ncaG89sahOK8x8y' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510405' AS nis, 'MOCHAMAD RAFFI AL HUDAFI' AS nama_lengkap, '$2y$10$kLYikkLxGt40hbGzXOrgH.hZweHUGxhEPl037uWM71ZwR6ysq5xXG' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510406' AS nis, 'MUHAMMAD RAFA DANI PUTRA' AS nama_lengkap, '$2y$10$qSflA7h8G6BaiKjFlNuXIus7XDv7WICOSH0RqELdQYpkk51Us3h8G' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510407' AS nis, 'MUHAMMAD RAFFI FAWWAZ' AS nama_lengkap, '$2y$10$NxOwyb7Pmini.9.aOOXPkOo9NWaE98IstXlKju9jGDKzbV8kBIRXK' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510408' AS nis, 'MUHAMMAD SYAUQI ABDUL A''LA' AS nama_lengkap, '$2y$10$Y2S2H/3AZreiyB8oslyiROtko54Bdlra3LSRLyf83BD3f5ONkZ2Ae' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510409' AS nis, 'NADHIIFAH KIRANA SUMANTRI' AS nama_lengkap, '$2y$10$Zkt4LfC5PtCjmCVS3acC9eVp5ChhST7P50RDyOYiMq6sKkCspRe7W' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510410' AS nis, 'NADILLA DWI JULIANTI' AS nama_lengkap, '$2y$10$Wu1/cfE.PzQIwJIb1qi72O.pOGia.vLSjNby71RTo1RKJZTXy.ELi' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510411' AS nis, 'NAURA SHAIRA OKTAVIANTI PRATAMI' AS nama_lengkap, '$2y$10$W3MEsk7ZEHVlkgvC6LwuFOCTXgVSOFRCMyWq/VFMVAdROlF5HNfAC' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510412' AS nis, 'PUTRI AYU' AS nama_lengkap, '$2y$10$YQzIhJunWeu1wPnkencmJuQJM8KHYIQzgmJXNe2sm.yEy/LvotCfm' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510413' AS nis, 'RADEN MUHAMMAD RAFI SHOLIHUDDIN' AS nama_lengkap, '$2y$10$iJmH.MfAcsQSkJafsXRleeZsi2c5/kLDQI4OQrzsARG051Xv/AICm' AS password, 'XII-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510415' AS nis, 'RIFAL ABDUL ZABBAR' AS nama_lengkap, '$2y$10$/7IgsaRGbU.b/wFqH9ImlemNfUIzwrMtNuAwpiNI6jhKOCQji4JXK' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510417' AS nis, 'SABILA TRI CAHYANI' AS nama_lengkap, '$2y$10$HDUTDKEgDhd0P3TW91StF.juV.oTbrr4xREPWeOlVaVevdC8y0jS2' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510418' AS nis, 'SARO GANDA TUA MARPAUNG' AS nama_lengkap, '$2y$10$Oq5N81I6k1OCZSBTOTgnfeRtROLePRAs/y1ED/Xk3YAE1NZedu8s6' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510419' AS nis, 'SATYA AFDHILA BAIHAQI' AS nama_lengkap, '$2y$10$p.eMssbM82MIU1rZKF2GAuOujae11eYSpmBQlC8dF/6iLE9aNGPiq' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510420' AS nis, 'SITI NURUL HAMDA' AS nama_lengkap, '$2y$10$RYi1tXa2m/aT0e47sbc6e.izZqch48qA9NbcaODRQLT0Q0Rn/vEKO' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510421' AS nis, 'SYAIMA DALILA AZKIA' AS nama_lengkap, '$2y$10$gfsfbN.TGEqFfPoQtgnWOeKSwHH0iAM4jSb/StkNWiMJQnOirEb5O' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510422' AS nis, 'TAZKIA YUMNAA NUUR AANISAH' AS nama_lengkap, '$2y$10$WMH8x.cEDhyFmA9F8E5/B.yNYfeQZf7gvE4.Lfn.Xuy/n94okXkce' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510423' AS nis, 'TIARA RAHMAWATI' AS nama_lengkap, '$2y$10$8JXd2hRVxS72G2ltPdGHy.0hEoQx3xMHjkE0R3ekc/ZH8TkNRhKYy' AS password, 'XII-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510424' AS nis, 'WINDY ALYA MUTIARA RAHMAH' AS nama_lengkap, '$2y$10$aVD.0GUdTmrIhqmZHVwgfuJpVUpB5xCBZrVDpzUtv9KOwwD8JLv3i' AS password, 'XII-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510426' AS nis, 'YUDHISTIRA ARISWAYA BAYUNI' AS nama_lengkap, '$2y$10$fJahJF6gGlMoURTzsP26sOk/qPK1kw9sLt4vj93DmobXs547yagm6' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510427' AS nis, 'YUSUP HAMDANI' AS nama_lengkap, '$2y$10$PrhDllEbmPPU882u3DsZ8uLJWCoKbNQsW7.hPSVmeP9CdqW5Oqwlq' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '242510428' AS nis, 'ZIKRI KHAIRUL FADILAH' AS nama_lengkap, '$2y$10$xGX6Bp6f/.jdQl6gxJElEOxvOyE09hNePsXB9ZLgmGeRAzs8JAuqe' AS password, 'XII-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610001' AS nis, 'ADELIA ANANDA PUTRI' AS nama_lengkap, '$2y$10$yVhDFtaBaXvdO/nLfnbf9e6c4BbNDw/BhqTkz5bS9NVwlKPKE/hpS' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610003' AS nis, 'AKHDAM MAULANA RIZKY' AS nama_lengkap, '$2y$10$DCu1/pgSnk8N6fabD3e4felTWhTfiDokWECmlHjzroDBU3oDl3fBy' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610004' AS nis, 'ALFIKRI SURYA AYUBI' AS nama_lengkap, '$2y$10$SlgkmOVUvWzBZvkO07RzWOIPu7M.52ar1esJAEO8sbCWgYWi7PlzS' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610005' AS nis, 'ALIF RAFKA WIJAYA' AS nama_lengkap, '$2y$10$ZZPvLkQwXwftenlpteB0D.MR5jZeCCM6nVwJLU7OzL3wsmOcu9W3y' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610006' AS nis, 'ALVINS SONJAYA ALBAR' AS nama_lengkap, '$2y$10$uz915GCMrmxbgSgOOOKlnOv7t/Ju7zcjOUXcuUlys2EZK0br5BjtG' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610007' AS nis, 'AMALIYA SITI MABRURROH' AS nama_lengkap, '$2y$10$PusovB5i90Xgp/Rpx1MrpOztAdMGEcIWjMfBTcBPt.BmsMxkxJan.' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610008' AS nis, 'ANNISA HIDAYANTI' AS nama_lengkap, '$2y$10$iBfWiVxrgE29XMVKru7z..81xpNchwRGhWqd.muYetI2MYl1yIHAm' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610009' AS nis, 'AURELL SHABILA JAYNAPUTRI' AS nama_lengkap, '$2y$10$Up1DpoFtWjVuTqF2q9uQQu2DsJpHY2QOSnZ8Xyr.CfZqLtMiX2/HC' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610010' AS nis, 'AZKA MAYLA KHANSA' AS nama_lengkap, '$2y$10$5haO.ibz3PI09Mo3W2Gcn.FHbMdTd9fEZEQWVP.lVdAAOjPdndJQC' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610011' AS nis, 'AZWAR AUFA HARDIANSYAH' AS nama_lengkap, '$2y$10$ZN6geH3S7Qn/3wHCPxZx.OnEBB4hNrYX2bExVv95E0DCLhipnVeBe' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610012' AS nis, 'AZZIRA SYIFA SUPANGAT' AS nama_lengkap, '$2y$10$ayDEyifshukIScJQZrOh7u71FoiT8hx5lbiEJzZIluIHwZkhcWqu2' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610013' AS nis, 'CHEISYA YOLLANDA PUTRI AZKIA' AS nama_lengkap, '$2y$10$ECiWFyYnLXiQUz4ITFqyWO0c2fiyB.DfsJFXppPEnkGB/uJ3sk81e' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610014' AS nis, 'DAVINA ADHYA KHAIRUNNISA' AS nama_lengkap, '$2y$10$r/hZXdE37E1p5xXzMeO88eAJTiGbn9SKO0n3RB7CgZQmiVujET0tm' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610015' AS nis, 'DEPSA EKA NUGRAHA' AS nama_lengkap, '$2y$10$5sQN.IsBP9f8KPHb.DMyR.k6JuVe2S.pPi9iaspniJ9iOYKtzDcyy' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610016' AS nis, 'FELLISA PUTRIANI' AS nama_lengkap, '$2y$10$hlbAyhdbsW6HdqGMrG2wYOlfhTMLFn0iVRJ4FU7s.qTY6zKRRj4fy' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610017' AS nis, 'FIRAS ILMI CAHYADIN' AS nama_lengkap, '$2y$10$q1EihlMm950xwvCI3M.z/OpkoKnDG7g9JKtxWiAmKekD20WSG8rmy' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610018' AS nis, 'GAZZA AKBAR' AS nama_lengkap, '$2y$10$Tcu9/VyH/bnuiKmb0C5Ebuq8HLI3sNu6/RffUky0NqgTpixUd7ZQu' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610019' AS nis, 'GIO GUCFA AL HAQKI' AS nama_lengkap, '$2y$10$KaeuTYq.Jbfwb8QTcLTn7..vyp3GNslvLfdBOESB/oJbCfFktuLN2' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610020' AS nis, 'HASAN MAULANA' AS nama_lengkap, '$2y$10$iXXBWVykX8FR3LFCUeGL6ualhWTXa4hNDVH/KSZvXl/lDOQ/LUZ9C' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610021' AS nis, 'ICHA KAHERUNNISA' AS nama_lengkap, '$2y$10$UTFnnMZaOv8eo8A.GiHy4.KZQsne9vgqqvHNoHf8bl8lrrJDJYPvm' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610022' AS nis, 'KANZA BERLIANA' AS nama_lengkap, '$2y$10$sI8JpJa5AbbktENW8LuysuordBeCE6Is2ky3nAFesLAPatZf2SEpi' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610023' AS nis, 'KEYLA OKTAVIANI ERYAN PUTRI' AS nama_lengkap, '$2y$10$vE56Po0p5bkG.QoXQPHYHeapJGIykDQmTWD0JN6f0Z4y.jgnWXJcu' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610024' AS nis, 'KHOIRUNNISA' AS nama_lengkap, '$2y$10$5.q6TtQMaIaQxQHIcxj3/./5V3hH2UXFHn1RPWclyqkUppKL8k0qS' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610025' AS nis, 'KIFA AGUSTINA AZ-ZAHRA' AS nama_lengkap, '$2y$10$NHQ9H7h/3UIS7/bHCA.FAuhYWnNEjPy1HZvw5ihLla1jfBXAg5Gde' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610026' AS nis, 'LUTHFI FAUZAN PRAYATA' AS nama_lengkap, '$2y$10$jahS38aEz0lgg3sJ2Qdix.kZVi0oKgqBwIUNaqVz1w1XNb5yz2hl6' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610027' AS nis, 'MASAGUS MUHAMAD HANIF ATHALLAH' AS nama_lengkap, '$2y$10$FDo/3ANL4YFNWjD3JYLfre/SewpGYq/16iB2QlHhB.7P4lEklW09.' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610028' AS nis, 'MUHAMMAD DESTA DAVITRAH PUTRA NUGRAHA' AS nama_lengkap, '$2y$10$pQpnv4qdG/O3ZhLBqJsQuupUKDzvoHHx.ClapvTZuqt.h7ERleoTy' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610029' AS nis, 'MUHAMMAD FAHRI ABDUL HADI' AS nama_lengkap, '$2y$10$sAS3nQ1p5dWb4Zkgo1SHtOWO/S6GMV2M.1L37UoP89GuZbzcd0n1W' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610030' AS nis, 'MUHAMMAD RAKA IMANSYAH' AS nama_lengkap, '$2y$10$ZsbJ0gXgYD2/HARnOed/d.M736kUa8LJp8/yZjnJiJ6QPuSbmlimW' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610031' AS nis, 'MUHAMMAD RAZVAN PUTRA DENA' AS nama_lengkap, '$2y$10$zoYkn.ge9iQbs6nWO/g1..2DGPesdGWrJPMylxPqseRkezvi95DRW' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610032' AS nis, 'NABIL MUKARROM' AS nama_lengkap, '$2y$10$2LS7kWlgt0PFgKwRhCu6V.y.Z1yAtsL/ffyw5JHvOQ59VJxVUNDdS' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610033' AS nis, 'NADITA PRATIWI' AS nama_lengkap, '$2y$10$y19zS6oYaWJ2TGRjW4bMRObnr8l0WlT/6KOjonqnOYmWEsoZ429L.' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610034' AS nis, 'NADZIFA ZIVANA LETISYA' AS nama_lengkap, '$2y$10$x30Op.YYcaBAlWnhml9gIulvAXlG7dU6yLucU54kJCsdD0Ah6TITq' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610035' AS nis, 'NAYLA ZULFA SAPHIRA' AS nama_lengkap, '$2y$10$rYLsAiegHRqtDhpyi5DMYe4PY8ZBiDXTBLR7aA9j3/bdWd8keclaS' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610036' AS nis, 'PUTRI KHOIRUN NISA' AS nama_lengkap, '$2y$10$5hw9D9If1xiQx1L7sUDgLOCAtF0ud5yXEbG99DOLTgXwk/UTUxDQK' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610037' AS nis, 'RADITYA FACHREZA' AS nama_lengkap, '$2y$10$DojzxZwmKA9hYAtrPgp7FOMTyD7eART5QnDBR6twc3BALkONCPIim' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610038' AS nis, 'RAFI AHMAD BASIL IBNI MAULUDI' AS nama_lengkap, '$2y$10$TT11SGaU75XURgywMTUDdeg104Y/meHweVRv5vyeFasoAU6rLw0zG' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610039' AS nis, 'RAISSA OKTAHAVIAN STEPANI' AS nama_lengkap, '$2y$10$H2vpsG3X2L7oGIjexRDakegK4UYbtdeA6cG5GeAN/ijLchsYfro6K' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610040' AS nis, 'RAYNA KHANSA''A YASNISA' AS nama_lengkap, '$2y$10$6fI7/87GffbMYxz1uYmITuJ4WGAqlBM8ifNo.xPyh//5.E/57CJYm' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610041' AS nis, 'REGINA MELIANI PUTRI' AS nama_lengkap, '$2y$10$QM/KL5HtJlak2rEfAiCtLuScYgXbw62zFKeaBgwrG0e3bDQVW4t0i' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610042' AS nis, 'RESTINA SITI MARIYAM' AS nama_lengkap, '$2y$10$6HshOlGgcPq4JIMisWU/uO3P7gM4g8wPI9K8/p6jJrTD0FYtdMUK2' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610043' AS nis, 'RIKA AMELIA JAELANI' AS nama_lengkap, '$2y$10$T02IKh34zoNMldZzWxXWOOSK8xHZq.J8IUWknbJbi6rtxwmNr6qYC' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610044' AS nis, 'SENDY ANDYKA PURNAMA' AS nama_lengkap, '$2y$10$gf29EaWJytxaVFMTCh9jT.Amsp/6H7fWf9LooPIOgErtZAG932ggC' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610045' AS nis, 'SHOPIA KHAIRUNISA' AS nama_lengkap, '$2y$10$D3Eg/3JPrWdhezyJE3OOt.kdZ1C48GJsO2OKZp4SJ7wnGoS9.xWfK' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610046' AS nis, 'SILFA SULIASTI NURUL HIJJAH' AS nama_lengkap, '$2y$10$F82GES75SN8Q/x9o8ZhOFOG2ltdvgTKVfRwPAzo1T8c4N27VWbxme' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610047' AS nis, 'SYAFA FITRIANI' AS nama_lengkap, '$2y$10$fNoiwZOTqqyiGjOTXNcDrObi70pdT7fIKIjlfdLCqAaTTs02GMVXC' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610048' AS nis, 'ULFI FAUZIAH AZKIAH' AS nama_lengkap, '$2y$10$sS2/d1GxiIA8hLl3gM/2Te3tdR20KsOytSrEa/TSAk8BKNxuqx/si' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610049' AS nis, 'AGHNIYA NURUL AENI' AS nama_lengkap, '$2y$10$HqTZL.McSJWWYmF/MPEGYea1QdInmWYJ09o23RVU4BpNMPXQD62VC' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610050' AS nis, 'ALIF KHOLIFAH KHOIRUN NISA' AS nama_lengkap, '$2y$10$ao9GbIrE8QFQ5V10/LQ/FOPk72xJzV1CSMnvVcQK3IrE.ovKDRFc6' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610051' AS nis, 'ANUGRAH ROLAS MARTUA MANALU' AS nama_lengkap, '$2y$10$ifZcGslLbnw7kIp3cKCEiekvO6o76eWABi7MJijR12H4XKENTAzii' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610052' AS nis, 'ARGA DEVRIKA HUSAENI' AS nama_lengkap, '$2y$10$DLjEhbNxJAhQSyrL9J0okO60uhjEVhIE7/3FeZrmy1cvmO1Gih/r6' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610053' AS nis, 'ASHILA MARSA AULIA' AS nama_lengkap, '$2y$10$KXX4gNIvMvYO81IGdujkLeYe5IoYFHtB.iczXFH9R1i3lB/AbMFIK' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610054' AS nis, 'AYESSHA PUTRI RINALDI' AS nama_lengkap, '$2y$10$6DQoiLRiUGIhUvZZMkONEu9SZcRLP/xwMu0j1ZE0ODScQy8N9A5Uu' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610055' AS nis, 'BELLA ANASTASYA HENDRYANI' AS nama_lengkap, '$2y$10$GLn2hwksB6gHk4FRuUzLeOo5rbuWCgepM9uKNqymzRiDzq1LvtmyS' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610056' AS nis, 'BERLI' AS nama_lengkap, '$2y$10$IxCGSt1tMAxgxrTl02bM6.h/hnZgR0s55PiEGJBXvuV7DjkQb0Qj6' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610057' AS nis, 'CUT KEYLA KITAMI' AS nama_lengkap, '$2y$10$nZ2AFCLTbeR5X.nUBU3/.e3rDjiP/LCORNPN/1fJosYG2wFZp3K26' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610058' AS nis, 'DAVINA ARDIA ANASTASYA PUTRI' AS nama_lengkap, '$2y$10$rKdIJfBE737NGsKq20qTZuaED2813vja/gd7kbEVa/NrbupfmJ2Ii' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610059' AS nis, 'DEA SEPTIANI' AS nama_lengkap, '$2y$10$m1ILodK5xFaXkgNE8t0dCOr8S3bNllrsZwZAsGR9V7kWpMO5tE2LK' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610060' AS nis, 'DEVIN RIZKY SETIYO PRANOTO' AS nama_lengkap, '$2y$10$/pJinuAu6PXEkohRHLt21.bO5Bi.e1UyizKS5TTQyOQGbWsBtBVFW' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610061' AS nis, 'FADIL FADILAH' AS nama_lengkap, '$2y$10$AxTgQvQCL9M87WtionihXeFXguw11LLoqynRmuQ/TaKcxipVMXiMu' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610062' AS nis, 'FRISCA CECILIA' AS nama_lengkap, '$2y$10$LAPQlQFkSTIpcS4LceSvx.oDQhRfQsz0ROmla2WrSLy741DFPDfO.' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610063' AS nis, 'GABRIELA FUNNY TAMBUNAN' AS nama_lengkap, '$2y$10$BbeYqq5DgYk1DevElS7bqOeVuLnWXvyBZ8vC6VFpDNz4NIBl.cXA2' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610064' AS nis, 'GIO RAY ANDHIKA ANWAR' AS nama_lengkap, '$2y$10$mKyTZ0xwhRA25NZq0kzHq.mzG1X5..dkA9kWf5iep/pUbmq9Bm1BS' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610065' AS nis, 'HABIB RISKI AL BHANI' AS nama_lengkap, '$2y$10$T5TheGQTmzuU6LwGd.ZdjenHPo4S0HZdWvap3RwizxH9BQVsbKg46' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610066' AS nis, 'IKHSAN NUR SALEH' AS nama_lengkap, '$2y$10$aN7uzOlkEhpeoy7X8QD8J.iIRMlVOwt3WbtpAOa6dSKBMMRihT2NO' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610067' AS nis, 'IKRAM GIBRAN DZIAULHAQ' AS nama_lengkap, '$2y$10$Ti92gl0Z.jGHe7YY9fEXuuN.0MdEXE2qqliGq1hB1s.OQoC0Fw3na' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610068' AS nis, 'IREN SYAFITRI' AS nama_lengkap, '$2y$10$crAdjOFJ1NdDkSaSF9EiPurZ2nRb.GEKDjcJrm6BnKSQUhT1u3mXS' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610069' AS nis, 'LAILA FITRIA' AS nama_lengkap, '$2y$10$bVfCAQ44JXLqHuUuWrz0We5C8Ctp8YLopOTjziKXTCWxp3y.kB7IG' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610070' AS nis, 'MEIKAL PUTRA BANI PERDANA' AS nama_lengkap, '$2y$10$lBERf0KfG4q7R5qXE4smM.T3EE8ckXtd53bEIBE.GCIantIfS1L92' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610071' AS nis, 'MOHAMAD ARIF NURROHMAN' AS nama_lengkap, '$2y$10$GpVjPcZ9MqqOSVMw/d8HGOOLiFwd1za1nlHAcVmnhhny5RH49fjCO' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610072' AS nis, 'MUHAMMAD DHAFIN AR RAZI' AS nama_lengkap, '$2y$10$zDg0TP8XdQJjfY/dCQdsdeOVJbBJXBh5mmiPhxi0jQWgr1E4EqPGm' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610073' AS nis, 'MUHAMMAD RAIHAN' AS nama_lengkap, '$2y$10$/ZEkB30mQFoqtJNcTv5U0er.iIgA4CeuUfHBP9FOcYhdsrX4rsYD2' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610074' AS nis, 'MUHAMMAD REZA ABDILLAH' AS nama_lengkap, '$2y$10$/8/TwMuSguAmh05F8WE9Y.4/IJe4K1gnL6WLktyUOH0MtO9R18Qme' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610075' AS nis, 'NABILA MUFIDA WIBOWO' AS nama_lengkap, '$2y$10$a4cImBqGbaaW3bn5zrbC1uQfJhI5hAwi.IoFZDBl8XDykqbWHDyQa' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610076' AS nis, 'NABILLA PUTRI RAHAYU' AS nama_lengkap, '$2y$10$GtuhXAzC/ilMejEwpZuEd.evDMpQixElPCVL7BvjMIBTjIuEeWgP2' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610077' AS nis, 'NADIVA NURUL ASYIFA' AS nama_lengkap, '$2y$10$hpN/gqw3z1hWMmY8HV2pR.cH/7.UvdvxJYTkCCLIK/APAJUBZYKim' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610078' AS nis, 'NAFA HANIFAH FEBRIANI' AS nama_lengkap, '$2y$10$DN2m3Tsxk1PJUZM1bOgWJufwJiN1KHJIY1pHYBcqbZ/c4eiZrRWNK' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610079' AS nis, 'NANDA SHAFA KIRANA' AS nama_lengkap, '$2y$10$LhUkGKstsLNSJN8Bhoi6XOHaB5PCXKQxnqFKxD.1haGUs7SmisTvG' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610081' AS nis, 'NUR FADILLAH' AS nama_lengkap, '$2y$10$GBoVNYOGVrEr3SOVHmN6suK7oPpV3rZhnMwPpUDjSOnoIL1RabG3u' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610082' AS nis, 'NURRAKHMANITA AZZAHRA' AS nama_lengkap, '$2y$10$eB3q05qAWqt/NcWrgSvkQefXNNGy.v7NS9WorSpLIvCWo8tceGNpu' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610083' AS nis, 'QEANO OKTAVIA SWARANANDA' AS nama_lengkap, '$2y$10$db6S6cx2BxrdnAuri3YTNerMQVdwewbKH5xke0biQFShFZ8rdIZHi' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610084' AS nis, 'QIARA PUTRI AZURA' AS nama_lengkap, '$2y$10$CSQGIEQZ0K1MIJtgg3EbP.Fu3rnN5CVEfzjR0I5hc2ecMJ39Lpu8i' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610085' AS nis, 'RAFLI ABDUL MAULANA' AS nama_lengkap, '$2y$10$Q71.wigb5OdlahBojklSZels1ix.z8Uo12lEhSxtJamvmj5dUQ/uC' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610086' AS nis, 'RANGGA DWI KURNIYANTO' AS nama_lengkap, '$2y$10$jgq.uU8uj2ew1ZWV8cfHz.OplzxmWnsu/UefBgCzo14JdmWOgNU7u' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610087' AS nis, 'REIYA AZREL KUNKEYRA' AS nama_lengkap, '$2y$10$YX7Ui79NphvVP0j/gKqGMuJ.y2uTaQNWEjhPBlR7xl/io64s46xHm' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610088' AS nis, 'REVINA FEBRIANTI' AS nama_lengkap, '$2y$10$DkuISE/Rd1z7W6Sd/no8AO5CBxln7xwva4ctWY9QeXw6FKt72qy32' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610089' AS nis, 'REYSA NUR''AENI' AS nama_lengkap, '$2y$10$OjyBDX.N0nZklz2Sr5mMwe7wV6lyIKGtqSHeeMdqW9wFv7Mt.I3vS' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610090' AS nis, 'RICKY FIRMAN HERDIANSYAH' AS nama_lengkap, '$2y$10$RmPZZQpTD2e5XKQQdzaUiuYVzRD2j90uGh8I9YWSo9WOs1oZxnUr2' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610091' AS nis, 'RINDU ZIDNI ZAKIA' AS nama_lengkap, '$2y$10$2o8E2eWexbSTjxG1NRqJv.hScNehjRC9uyTGo/0ZNEIwwccQcPNgO' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610092' AS nis, 'SAEFUDYN MUHAMMAD AF GHANY' AS nama_lengkap, '$2y$10$imfB3u4W6MEmYHrP6pPoCOa6nUdVDRLB7Wf2Wr373lKFZ3rc8zLUK' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610093' AS nis, 'SHANDY AWALUDIN' AS nama_lengkap, '$2y$10$HEt8wBiNrxduCRlBlGn...rroEJscwkV8yqk1djJTLQw9PZDvYUN6' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610094' AS nis, 'SINTIA NURAINI' AS nama_lengkap, '$2y$10$Ey7WyjhoqxgvQyWYbqM4zO9FI1HTlchG3UVhWgJEAPTWk/hUeLbfG' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610095' AS nis, 'SITI MAEMUNAH RAHMADANI' AS nama_lengkap, '$2y$10$4TBLa/w80iFEn95LRW9g9uk8Kr3NNm21xnQlwgyPlbZGh3dHCzakq' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610096' AS nis, 'SYAHRINY OKTAVIANI RAHAYU' AS nama_lengkap, '$2y$10$dZupjb9GqaWTWxPNaA4PoeKBTIYeuETn83CGnP40Kk7gVGlLv5Vzq' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610097' AS nis, 'ADAM RIDHO NUR AKBAR' AS nama_lengkap, '$2y$10$aBkzpkvzzuWuP5UxElg9B.RHblbjTbNcJL9v1nnAoW8n4ZP1Liv1m' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610098' AS nis, 'ALIIFAH NURSASMITA' AS nama_lengkap, '$2y$10$8SjVUOxt4bf0Zmx4XbD0zOCYH1N/IxwI.j8RUprmAbvXwbR7SRt9.' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610099' AS nis, 'ALISHA NATHA MARSELA' AS nama_lengkap, '$2y$10$6GLiKK9smS/gf3ND5k7Mg.LwjD2H/r2uZ12UG6hcaLTAWIJENhy.m' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610100' AS nis, 'ARKAN KHAIRY RAHMAN' AS nama_lengkap, '$2y$10$dBWzPdRsZC4jh8QwCJaKQ.h2rrJlUo0ezwKIDvYs.x1uymqTwpmh.' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610101' AS nis, 'AYU ARIYANTI' AS nama_lengkap, '$2y$10$4QM/8tJdrLz3Qka9y3U1i.MSRcwTEPn7TsK3qyxhz9ffUMKCH/Kna' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610102' AS nis, 'CAHAYA SRI MAHADEWI' AS nama_lengkap, '$2y$10$B3Yh.EerK0hU3xzY0FHBjuY9Wc7zXoB8jtAKpgb/DJtjzUIAKMCJq' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610103' AS nis, 'CALVIN NAIBAHO' AS nama_lengkap, '$2y$10$QF7epoLn/yvmePCZEGTGv.GBR0ketsNV0sqWw/pJDeapUM8n.X0ee' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610104' AS nis, 'CANDRA SANI ANANDA' AS nama_lengkap, '$2y$10$ulWHdx71PO/pJOSy3hOFL.74JqkFXtgbcWATeYNyJbVyJdhNuJEHa' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610105' AS nis, 'DAANISH SHAZIYA DESTRIAR RAHMAT' AS nama_lengkap, '$2y$10$MpN32QBLUPqGrUBPeGlab.gOrw7p3kHBhZLSIj5jj.l8cMafOLZuK' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610106' AS nis, 'DARA ELVARIA ZULIA' AS nama_lengkap, '$2y$10$eyidz1YreLgPdgy/NgfiFufSdafant0on6/AD4/jGWM5aaEVoFM7y' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610108' AS nis, 'DEVIA ANATASYA' AS nama_lengkap, '$2y$10$HNZuP0DdSIJqyvjftkGdY.2xsM3BQI4keqzlKWpyzlD9MosBncm6i' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610109' AS nis, 'DHAFIN RAZAQA PUTRA' AS nama_lengkap, '$2y$10$gFEgVvrsyfsD6BRMingMLueyGScc8LvCLhspPH3uZ0BLAFQKSZkyy' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610110' AS nis, 'FIDELA DIDRIKA NARESWARI' AS nama_lengkap, '$2y$10$BosbmonjYpLUvKRln2ndQ./S2iM9aQeHHT./OsR1msEHFW8ZrlbpC' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610111' AS nis, 'GHIANDA CETTA DESTRIANTI' AS nama_lengkap, '$2y$10$3yb66bT7siKMEZCo4QrQHudOFrEyAi358a15H8zrf5vDuM3HkEZYe' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610112' AS nis, 'GRACE RACHEL' AS nama_lengkap, '$2y$10$eQmUBTQbNE6w3PlRRKCRUeHCRwBqPhuqdb/dJxqS9cn9BEeI8mxRS' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610113' AS nis, 'HARTA AL KINDI' AS nama_lengkap, '$2y$10$mNzNhD0fAySZ6nkDnLyB/.MpIsVmAQSjs/xz1bF8oRwziKcfUSoKy' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610114' AS nis, 'HELGA DESNATALIA ZEGA' AS nama_lengkap, '$2y$10$3vUjOJ0h4wv8uBWyfSDq.eka1qHvkF7XvpH4QDcbKYM/6qXIXKgB6' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610115' AS nis, 'ISAIAH KENNETH ONGGELENG' AS nama_lengkap, '$2y$10$cZzSCgQzVykS2DlF0KoVzOAYKShwvul.GStqX9dHizvNX3tmONanm' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610116' AS nis, 'KAMELIA ARBA INARUS' AS nama_lengkap, '$2y$10$kaytx2qGWiB.7Bcpcnr3NuZif60V4HKmfwm.N3CTRh3xaUhouX/mi' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610117' AS nis, 'KEYLA PUTRI APRILIA' AS nama_lengkap, '$2y$10$IUWpN4CuRKrZ7y8vH07YLe1AI6r1c3sBPyEYoLEwHaFr1C0X8K7Ai' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610118' AS nis, 'LAYLA NUR ANNISAH' AS nama_lengkap, '$2y$10$AykJMscu3TLnTVCCHPgjm.s3yQLPQhV0KaHT4d05RHKPT2xPo1nHe' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610119' AS nis, 'MOCHAMAD IRWAN BEARLIANA' AS nama_lengkap, '$2y$10$OFoiAm3cuyICuJPjYwqI2uPvnGE4OjprMyGt0kdiMqjiI1LobxqMu' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610120' AS nis, 'MUHAMAD BAGAS JULIAN FAHREZI' AS nama_lengkap, '$2y$10$KH9q0y3juZKSp7d0k1ft7uw98.IkgoiZaiHdBdNboTUs2InylwtG.' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610121' AS nis, 'MUHAMMAD LEVIDHYA KERTYA PRATAMA' AS nama_lengkap, '$2y$10$evOiS8lw7S1mf6ags6X/9emd/GyJbFffiLwgWazgEZIveeAyInFxa' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610122' AS nis, 'MUHAMMAD NUR GHANI' AS nama_lengkap, '$2y$10$j5z1h39unZt/p6fZ8y1cLOBhvjGrlT/pOSpFUZEh42bf8/1HGdsNS' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610123' AS nis, 'MUHAMMAD REZKY SAID PUTRA RAMADHAN' AS nama_lengkap, '$2y$10$TTzbcnTy3Ep0VOK/KegjweJdrK.hlBO0BP96WNPXSMMX1S2hK35AG' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610124' AS nis, 'MUTIARA RAHMADEWI' AS nama_lengkap, '$2y$10$sFdw.9MzAkTgJeXssSvqfecWqsIs1kqDHF5LCndNBuQ8mfHZ8Za1i' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610125' AS nis, 'NAFISAH NAILAL HUSNA' AS nama_lengkap, '$2y$10$7xt64JvdnR/3nJP/hdSBc.U2m5LsczrFeuuZQvcN.qznJqH3/3tWe' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610126' AS nis, 'NAILA IKRIMATUN NISA' AS nama_lengkap, '$2y$10$xKnhruZeZy7Yoi7Vyew3au2s6xgxv9dn93DDHaPGQe5FUG3WpFYYy' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610127' AS nis, 'NATASYA AMELIA PUTRI' AS nama_lengkap, '$2y$10$jua55Blop6nYc4ToA8l.Au4pwhcNGzfrz.cD4YgqOm26VgUctq3BS' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610128' AS nis, 'NAZWA NUR AMELIA' AS nama_lengkap, '$2y$10$q7tdZWSNoIzz7OXHCXSV6O0SmClEByS.qIVIVwC3f76qZrH92ys62' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610129' AS nis, 'PUTRA PERMANA SIDIK' AS nama_lengkap, '$2y$10$VrgmxO8OMuhQL6fnhzVeIO80zTQrEkZNn.ZGSmdPDA7tEhI1Ssmou' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610130' AS nis, 'QONITA NAILA HAZNA' AS nama_lengkap, '$2y$10$MW5W/EkstSAa1Yqkv.fHLOXUM3LYYqZc8YzxsKVBmtsWFmeQ4j212' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610131' AS nis, 'RAAFI DWI PRADIPTA' AS nama_lengkap, '$2y$10$3pABniIXbMZsiv.ukZVcruW0bosaJ7iY7cEbYnwBi2hb43QNB41su' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610132' AS nis, 'RASYA PRIATNA PUTRA' AS nama_lengkap, '$2y$10$G5BBcKJF5EBSBHSa3EwKMO6i/mZnm4YJONSb7hIL4PJnPB9mAs9ZS' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610133' AS nis, 'REYHAN FAJAR JUNIAN' AS nama_lengkap, '$2y$10$ZyFRDqC3kea64cTvjtA.buBeRf2wuLWmgKevpFH78eSoIxaaWZtfy' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610134' AS nis, 'REZQI NURASSYIFA RAMADHANI' AS nama_lengkap, '$2y$10$I9wNe49GyxelCQRSq/.g..9MQEzk5NVWMNNX19rH3qhT8CM6Yozva' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610135' AS nis, 'RIFKI RADITYA' AS nama_lengkap, '$2y$10$KFG1tfUPg/PB/VtYub6EROLVR5oQtoMyfU6pYvnqNSGmAvtmXZk3a' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610136' AS nis, 'RISKI JULIANSYAH' AS nama_lengkap, '$2y$10$FGSytiygSXq/GDpaLmXM0OTw9SBMFUVBxjwr21L2U9J2te8yxulqy' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610137' AS nis, 'RISMA ANZANI FITRIANI' AS nama_lengkap, '$2y$10$VissEeDXVpNFrZXNCXrsn.p5i1/U/OzwcUkWRALdltAoRE90sS8hC' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610138' AS nis, 'RIYANI RAHMADANI' AS nama_lengkap, '$2y$10$EoqNRApjnZetpgU71X5pAekSuQK4yAeNtRV4mEK2mdDrjueAfBYmS' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610139' AS nis, 'SABRINA NOVANTI' AS nama_lengkap, '$2y$10$YtuO8v386OX79tvHmKUsOeBnFmzLBAwOSf./BPmVy4Aj3x506FXk2' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610140' AS nis, 'SISIL NOVITA HEMANINGSIH' AS nama_lengkap, '$2y$10$m4TS8N06hsUjmfRdKRbuY.ochexvXrWmGKzXFrvi3a4SUe3oE260W' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610141' AS nis, 'SITI MARWAH SOLIHAH' AS nama_lengkap, '$2y$10$vsuUEG8l/XCUz0LtZzdPie8qNlWsviq2iGZ5B/Xgq21daQpk.hDl.' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610142' AS nis, 'SYAHRIEL AL MULKHIANSYAH' AS nama_lengkap, '$2y$10$u5yTT6wNGp82xt84oV3M9.PjnUsrcZPCZFzj0.CgKKk8BTaXAGBU.' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610143' AS nis, 'SYERA AURELIA AZAHRA AZKIYA KURNIAWAN' AS nama_lengkap, '$2y$10$AbfWWYxo8IuGEBZJi4cOqe9xj3AHXayJWGAkUQDuMiNTNDqd8Ehfe' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610144' AS nis, 'WULAN AULIA' AS nama_lengkap, '$2y$10$h7gn/qVpeLgwMYcVrrUEEOSOursb9Bly8uJaIkAnPEZg.rA0Kp1Uy' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610145' AS nis, 'AGNIS REZKYA PUTRI' AS nama_lengkap, '$2y$10$pq50ycsshp2qCnRJ9.y1tOrHjgBStANg1ac71DTUT.VoE5uax.s2u' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610146' AS nis, 'AHMAD FADIL' AS nama_lengkap, '$2y$10$hzYr/D3eBmgcunvu2muFyOMd68vJWH8i5TwODztelgaHzQL1JSInG' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610147' AS nis, 'ALISHA NAVIZA WIDTIA ARDHANI' AS nama_lengkap, '$2y$10$Se50wML./YkIkLvpf7dWTOEvVsNFSvS6f6My0LJcqoaauHgw8wvMq' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610148' AS nis, 'ALIYA RIZKI' AS nama_lengkap, '$2y$10$/TIVcfEhFX1NbZnIgKVa...kukgAh7Vs2YWSnC823GD4k5C.ExN9u' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610149' AS nis, 'ARSYIL DWI RAMADHAN' AS nama_lengkap, '$2y$10$I8bjiAx0aNLrM1vSOCHlleBaai2XapyY.h0Y14hC.YwTPoJ4B498m' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610150' AS nis, 'AYU FARIDA LESTARI' AS nama_lengkap, '$2y$10$0NDK6aNlmmJh0Zgy7uDGAuDbhw.4vyvjzsFQo62584dL9jtGAgKqq' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610151' AS nis, 'CALLYSTA NADEEN PALACITA' AS nama_lengkap, '$2y$10$woxf6DRKQRonc50t2mTNXefoCEAMPzRTeR4sQuW8RUQB0qEbnxzgi' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610152' AS nis, 'CHRISTIAN HOT TUA MANIK' AS nama_lengkap, '$2y$10$TAx34K4KvyhKvWfC8/k2KufSiIS/f6k0WVLNv1ktAaN4xPRWcICRO' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610153' AS nis, 'DAFFA NAZAR PRATAMA' AS nama_lengkap, '$2y$10$jQ.4NzJjxkfqtS/13jo0O.mytWgAVcJDwdad.tjsbFe1s7KP3QET6' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610154' AS nis, 'DANISH ARKAN MULYAWAN' AS nama_lengkap, '$2y$10$v83wFlbcoeX.CeInkavKcOYd52Kd6Rz5Y1nI5uRIB.s4c6xx017la' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610155' AS nis, 'DESTINA DWI AZHARANI' AS nama_lengkap, '$2y$10$DWofLo2bPVaBv34Uj.hAt./cc5hfhjCoMNaVTuWl5llGo3o79rC9C' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610156' AS nis, 'DEVIA NUR HANDAYANI' AS nama_lengkap, '$2y$10$TqHwUhrOJL51oJ1ulJBCR.97kBbsuoqs/5QRm0yg5il/2eVxd1Dxi' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610157' AS nis, 'DHIKA PRADITA' AS nama_lengkap, '$2y$10$Jl9DXflcccJclf5O.wnwFuy79RkTQLZsjbspmvnF8UG2Vg9d9e.eG' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610158' AS nis, 'HILMAN ARDIANSYAH UTAMA' AS nama_lengkap, '$2y$10$9n2W4zxro6.GedWUuWeLUuMts1/93M5B4SGyuy6adLE.snhEUxX7a' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610159' AS nis, 'ILMAIRA AULIA' AS nama_lengkap, '$2y$10$7tCjyJDbHCIy.2SAi4NrbeusRGovBrP.cOmiELUol/TsELy6px5xy' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610160' AS nis, 'ILMIRA NURIL HAFSHAH' AS nama_lengkap, '$2y$10$vXVGPn/KOGLzVxYG59xcfu/92.GQ31Dy5X2.W/PybAICe4t/XI4jm' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610161' AS nis, 'IMAM HERDIANA' AS nama_lengkap, '$2y$10$IpMAUfiemcir8sye00DcSOyhHJ54jl2tUgnKiMZmipgycIUPzWCa6' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610162' AS nis, 'IRGI ADITYA PRATAMA RAMADHAN' AS nama_lengkap, '$2y$10$Iuszy6m.J09esKxOhah/AeiSFEi/nm97SnQNgi37NfItxQifnHYYS' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610163' AS nis, 'IZKARIEMA AQEELA HASNA' AS nama_lengkap, '$2y$10$kIJsTRw5oOZKxmu/tI2oCOCheKyBhOSFwivtJGbLg52pJ5.RZk0qS' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610164' AS nis, 'JERIKO HENDANA' AS nama_lengkap, '$2y$10$OLVj57J3SRMtJtolb2IdV.7oCtIKqxCY1SxUrG/DV/i.BmfSB5cC.' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610165' AS nis, 'KAREN' AS nama_lengkap, '$2y$10$rHliXdYq4LoKz3/.koG9V.Xe3YB3tZxRuYxA06AFVVvLnH7KvNSEy' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610166' AS nis, 'KEYSHA PUTRI OCTHAVIANI' AS nama_lengkap, '$2y$10$TfnHVTRYQqLMmHH8pS9oCeQ6fPeDkxCwN0Ryg/iwz619vWOmIxpe6' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610167' AS nis, 'LIANY NURSYIFA' AS nama_lengkap, '$2y$10$UUT1jksg99rvMtyWf2xuAeOiUWWm2/ov5JI2h6e8RTd7I8KOICRYm' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610168' AS nis, 'MOCHAMAD JABAR ALFARIZI' AS nama_lengkap, '$2y$10$yW2poaGQXqPxMEFlF50U/.PFuNgRrqXItgJoktscNuvwscTuuIf9y' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610169' AS nis, 'MOUZA PAULIN METTANURI' AS nama_lengkap, '$2y$10$CwwgLxMG1gLkQG9ccAzL.O9BcjjauUKi/vSUfmtn03qVafAdOLTJm' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610170' AS nis, 'MUHAMAD DAFFA AL HABSYI' AS nama_lengkap, '$2y$10$mqNsnjDmgaI6zTvbiKIqaOlPgPCY7f6wmWzP3UQ9hMBnVJ6mgjnC2' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610171' AS nis, 'MUHAMMAD NUR IQBAL' AS nama_lengkap, '$2y$10$CytisnNCvnws5X/bPYzMVutM0BTf6vXm5.qXjnfdnlzwbtGDZuNtm' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610172' AS nis, 'MUHAMMAD SOFYAN' AS nama_lengkap, '$2y$10$S6wffQg2UJgHNq95fDEpAubBE2qVArAuNBBSY6G6aJ2PEbFf67rva' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610173' AS nis, 'NAIIFAH NUR UMAIMAH' AS nama_lengkap, '$2y$10$/bA8jJM7d0cYaaXok/2z.OGdm1aJoNr2rEmA.SPV.6WSxEbzx6xsS' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610174' AS nis, 'NAJWA FITRI SOLEHAH' AS nama_lengkap, '$2y$10$Nki/7RPS/vPgb6KFimlp9.gJ3Udh2BAeIwPzDiBRH88GVCL1HoRs.' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610175' AS nis, 'NARA PONGBALA LAKKA' AS nama_lengkap, '$2y$10$HqPKDm1Vu23UhM9JJ4hCC.2z8oPHG/R90el3ECKyLjmYvMYsJQSKq' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610176' AS nis, 'NAYRA SHAFANIA NADHIFA' AS nama_lengkap, '$2y$10$dCim1EGkBG2AvPcDejjzUeD3QLCz2PbFPsSZSNA61vYAnTDwis1ym' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610177' AS nis, 'NAZWA PUTRI DIANKA' AS nama_lengkap, '$2y$10$G/sF/y2DDfJLICmxAR9x4eWdvcxxSfoO3DdefsHbL0/NDqr3c8yQy' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610178' AS nis, 'NEVAN HIRZAN ARADEA' AS nama_lengkap, '$2y$10$YWvJ.W7Qn7D95j5iNRzI/OhNXiwOfMleZ2tR0Gcej0TlnVWCEHuZO' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610179' AS nis, 'NUR AISYAH' AS nama_lengkap, '$2y$10$URFZ8tBXYkdHmsT1JOho7.W9FASK/0wi7k2PWmCZOG.UJz0f4e8ZO' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610180' AS nis, 'QUINNE ARADEA SANTOSO' AS nama_lengkap, '$2y$10$FG6.VLHhyrxRdQ1BplKY4OQwsSY12aQ.WCWigpAWHTbE5b6CFw.fa' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610181' AS nis, 'RADITHYA JAVAS DWIKUSUMA' AS nama_lengkap, '$2y$10$EXs3XyaXz7.SLtKX4/sjVuBafBJwkmYt5WroE7U8hcQduiSr7/4jO' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610182' AS nis, 'RESHA RISKI NUR FADLI' AS nama_lengkap, '$2y$10$YRGjeLxafRnc5Ty.lGWPwu0nWnxQVKZg219hbImjI5ZcW0l.g1UU.' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610183' AS nis, 'RESTU JENHASBI ALZAENI' AS nama_lengkap, '$2y$10$CV0Dr49lhIi9VQwAVEaYx.hacUQ913h9E7XWLwUZYb/0ITlxX.tuW' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610184' AS nis, 'REYHAN RIZQI ANUGRAH' AS nama_lengkap, '$2y$10$cBiOyUyhVq5zZYDfQh6LrOAsImflJH38w0eRRLp9zOSfDINaVgKZy' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610185' AS nis, 'RIFAA RIHADATUL AISYA' AS nama_lengkap, '$2y$10$QIXxtKhdJpf9J2PUq/60/uQ.hNRIL9E4z7OVAzpW.5zop2wFVU6om' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610186' AS nis, 'RISNI NURDIYANTI' AS nama_lengkap, '$2y$10$GE3jDot9.HS4OE0MlB/cDOxuKfsMVitQBJRw3m1rLP1xFvyaChHnK' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610187' AS nis, 'RIZKA ALIYYA ZAHRA' AS nama_lengkap, '$2y$10$nGUvwsq3QGUJMBA3GU.p.OW7Aoha/YU/gmpEoymV4lHZn9Gmi.D4m' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610188' AS nis, 'SALSA ARIYANTI DEWI' AS nama_lengkap, '$2y$10$fZS8.ObdvEkHVteu0mS9SOwNfVIWrdoikDq7s6WotyGs/MM9bKQ0m' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610189' AS nis, 'SITI FATIMAH AZHAR' AS nama_lengkap, '$2y$10$KgfEKruFqw7LeLC3OGrNC.fqgbbxrAfVvOKs03kIuqncb.hm6TRaa' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610190' AS nis, 'SYAFIRA ELVIANA ULVI' AS nama_lengkap, '$2y$10$uAiP6WqriMQMnphNKqciD.hNn2EvYgk/EoEzSeJsjXgwMqvgpiQ6y' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610191' AS nis, 'TEGAR RAMADHAN' AS nama_lengkap, '$2y$10$KvpD79yQdph6Ev3s17Isyua1WpouMRjnb8Pk3aHeMUK4hItjazA3i' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610192' AS nis, 'TIARA DWI NURKHASANAH' AS nama_lengkap, '$2y$10$0mSLDnS8V.gQNeEUWHvfZuNjbO0k25xG4BPCsvb15/xXlWQfCrJAi' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610193' AS nis, 'ALFAREZ MEGANTARA' AS nama_lengkap, '$2y$10$qZ0oYHNE8CNdprhYI/Og7eL5SH8ddHg4Gnew3dnzztuiU1CgWjH.e' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610194' AS nis, 'ALIYA SALSABILA RAMADHANI' AS nama_lengkap, '$2y$10$WQZbkemhqsaZxJgqu1Vd/eF/ESFMDsBcvDXRftMeBe/l9/VxwexrS' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610195' AS nis, 'AMEERA FAATIN ARIFAH PRAMESWARI' AS nama_lengkap, '$2y$10$1egqwrW/v3j4MD7q/LkbjOEv8XeA.0VOjd1AgcSVb559YRRxnbLI.' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610196' AS nis, 'AMELLIA DESTI ARDIANA' AS nama_lengkap, '$2y$10$eZk8nbeKJMH.rBgDguaZHu6PDdaTQP.Xtb0u8ig4W2IlQlrNohll6' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610197' AS nis, 'ASLAM KHAIRUL ANAM' AS nama_lengkap, '$2y$10$QUOxoYgNAwec29hvRzDev.cYNraz1h2ydYfbxTFOTKg844KjGQhTq' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610198' AS nis, 'AZZAHRA NUR AZIZZAH' AS nama_lengkap, '$2y$10$hw5jSURb.aPv0oOEf25saOJx71doXjfvurles8XRBgocyNq1YMXxK' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610199' AS nis, 'CHIKA MEISYA PUTRI' AS nama_lengkap, '$2y$10$73OYfhxsMZSE0eVzONjXyeCHKS1RP4.7SSCc9A1hlztoMKaeu6nCC' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610200' AS nis, 'DAFIN REFAN ALPIANSYAH' AS nama_lengkap, '$2y$10$QoIzIJLS17/Rxd9vf/2cBusdfYeYmpYIJod.iCMiTTlTJwjp2iFmm' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610201' AS nis, 'DESTRIDA RAZAN HANIFAH' AS nama_lengkap, '$2y$10$WVRN2PNjwhj4Rv/pCOIm..Swn92DZ3Z8t3/Ms6K7dS/zv4.IpeZpO' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610202' AS nis, 'DIAN INTAN FITRI ASTUTI' AS nama_lengkap, '$2y$10$C5/NHW6Q7p1mXQDKrHomhOaRpjndE2iFjbub50IUpYb2d2tZGmaNW' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610203' AS nis, 'DINDA AJENG PRATIWI' AS nama_lengkap, '$2y$10$wIVl6znDIWOMOeRIuiRKlOM/xgt8N1HP6vasYLyclrGiDiQdAXrNS' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610204' AS nis, 'DIVA JULIAN SOELAEMAN' AS nama_lengkap, '$2y$10$B5H9JQI39whc5zZRPWFXdOGDGEGshEO2ibw8GALiHB9zT8WTzjdx2' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610205' AS nis, 'DWI APSHEL AL NURANSHAH' AS nama_lengkap, '$2y$10$iQyKK4iHOuew.tO1ddFtPeaWCBAlNFeonJrkDAzUx8ejWhsTWw9TC' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610206' AS nis, 'FARREL HASAN MUZAKKI' AS nama_lengkap, '$2y$10$UxW3rr7ORM1.MoSfp6FDL.WIV8HSXh2OX2eoy6fpheglTLZXIsGxe' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610207' AS nis, 'IBNU SALMAN ARRAYYHANIFA' AS nama_lengkap, '$2y$10$c3Q8FhSq0mU4o3A6sFWSPe291y.Wy8qNs3Fz0I2lGnIQm4GNUqUPe' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610208' AS nis, 'INAS ADHADIYAH HANIFAH' AS nama_lengkap, '$2y$10$7jEqOwHF.k8eqJ.qsAWBqeRzVSWNdEewS9908XkYNDIfOlmj35BYy' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610209' AS nis, 'INDRI DWI VERNANDA' AS nama_lengkap, '$2y$10$K2wEA8d/0PO4mXGKo3xrueH0/JNwoHEDICvtT/5TnD8MFdVeEmbGS' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610210' AS nis, 'ISAL MAULANA' AS nama_lengkap, '$2y$10$nDJ51i4vNXycilEhCjJMkeceelL7IQtjq1U.kqpvpk2A.fW9CgUQq' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610211' AS nis, 'KAISAR HAFIIZHAN ALMAN HAKIM SOPIAN' AS nama_lengkap, '$2y$10$00jFFHL5Mx6gTyeCohRnzuZpZXbhR./ul2lKc90Y5xrvQWMY94lZq' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610212' AS nis, 'KEYLA ABIGEIL BILQIIS SOFIANA' AS nama_lengkap, '$2y$10$kiZ7AuOpxjmIgSdnyi7JquT3FsO7aKC.4PNRI.pwWC7MWimrT8P92' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610213' AS nis, 'KIRANA AYU KURNIA' AS nama_lengkap, '$2y$10$DxUYwETWL7Eya2ijPVLWa.Xrq0ku0VjhQ4U1Luwi5mcBckG44IK1C' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610214' AS nis, 'LOVELY PRISCILLA AUDREY' AS nama_lengkap, '$2y$10$JC9YK5nDCbY6YbVSL6HJUO6lFkPZREOOsaiudS/rcpDk8UUAX1zA6' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610215' AS nis, 'MARSYA SEVYANA' AS nama_lengkap, '$2y$10$T.ZqVxcr6FrzB4c8ojZUQemy.qZ19b0ZARTHi3S83c.2BPeFprMdm' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610216' AS nis, 'MUHAMAD ALWI' AS nama_lengkap, '$2y$10$F6B2BHmDibAO8DOKOcKZPO1TABAFx7BsFKZ6CHJFa6shTsxCsEhzu' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610217' AS nis, 'MUHAMAD ILHAM' AS nama_lengkap, '$2y$10$YLKVYswJWUpLl9a8hjUMiOCTzwxVsxLksn31a5Uz55AxLv/CgGa3S' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610218' AS nis, 'MUHAMMAD NURUL QOLBI' AS nama_lengkap, '$2y$10$IjOCCHvArQJAaQ2/S4m5Mej31LGeiSaiFih7tr0auwDvOfOpGkco6' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610219' AS nis, 'MUHAMMAD SULTHAN ANWAR' AS nama_lengkap, '$2y$10$lP1oXbv5tGYuHVrKRlaVp.i6yDFeoP.qe1rlu2r/B36djIKJkDjAi' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610220' AS nis, 'NABILA SEPTIANI' AS nama_lengkap, '$2y$10$kGdTdliEhACqh9dnsl0S9.qxblG2gvoIpq.KBp9fC05vU0gBd4XrW' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610221' AS nis, 'NAILAH NUR SALSABILA ROCHSIDI' AS nama_lengkap, '$2y$10$yTsM2Ink4N4/D4P5EExI9ONIJ1clefXw9l4gZoRyiwirSm2I5gsES' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610222' AS nis, 'NAURA ADELIA FRANATA' AS nama_lengkap, '$2y$10$YJ9chRPUWaOyBJ10rKUATONSn17kRQZxENIJB3RvYXmuYHzZy5p6y' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610223' AS nis, 'NAYSILA YULIANTIKA HARYADI' AS nama_lengkap, '$2y$10$Ay1GXW2OC.U5FckoDET4yO9na9y.tC6IJSyYnBVzHiKWm23pvszxe' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610224' AS nis, 'NENG RAYSYA AFRILIYANI' AS nama_lengkap, '$2y$10$kGq/oNoxFjQ/2s80YODdXOXmwW8w4swDqdvT6sy5W41jBuM8DpzPm' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610225' AS nis, 'NICKY CHELSEA ASYERA KAUSE' AS nama_lengkap, '$2y$10$VbHLWUkHNENm70KEjbaYseNbJwuqV8UmNEzAt/s5N2DvAjjZC5glu' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610227' AS nis, 'QUINSHA KAYLA AZZAHRA RAUDHATUL JANNAH' AS nama_lengkap, '$2y$10$wEpfacUShWeEpMJiw8H4AuXjIj78JNkNUoUfH6OgBCyH3CH7iqQLW' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610228' AS nis, 'RADITYA AL KIANDRA' AS nama_lengkap, '$2y$10$iGx8ZCjguX/EtViP178r8ODYwiyUlEnRDjhjRvsOJV6xY0yQ4wfzm' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610229' AS nis, 'RAFFA ZAHID EL-FATA' AS nama_lengkap, '$2y$10$qrRD9ORQ5wAYyuJ54wGt7OOp/7z.PtSWBZI6jjmxfpAb2.1GLjtzW' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610230' AS nis, 'REKSA ATHAR RIZQY' AS nama_lengkap, '$2y$10$HEAkh4EQUpHHnth1FUvl/u8F7o2Qn66QD8ECXA0Sy2F0pkCpN5MrG' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610231' AS nis, 'REYNAYA MEGANTARA PUTRA' AS nama_lengkap, '$2y$10$d3GvOPCRHRfsgspPoXe49OSr5mEciKaKtWM1d8qhThcmwau.gFCva' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610232' AS nis, 'REZKY FEBRIAN SANTOSO' AS nama_lengkap, '$2y$10$VpOfmbgSPHaDuvFbC1lkee6FCR2I500RAa8Ba6RP9HhUdcY/mty22' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610233' AS nis, 'SAFA AYUDIA PUTRI SETIYAWAN' AS nama_lengkap, '$2y$10$Y9mzwE.xyY8vIbExOCm/T.LCPtFGkNf759OQVxldmrv7DeV4.dVRG' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610235' AS nis, 'SALSA BILLA SOFFA' AS nama_lengkap, '$2y$10$CZ2NtkL1o8/sj3gDIdT2U.oQiT3l39KwYW2pP8Wk0eNEO84TybvcK' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610236' AS nis, 'SELPI FITRIANI' AS nama_lengkap, '$2y$10$StI/GwCEIhiU6XOvyHqFM.JeYfGl/YD416GMPROTMqdkxMq.CXtQy' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610238' AS nis, 'SYAIMAA ZUHRA HUMAIRA' AS nama_lengkap, '$2y$10$OYzQqtiqs7qysrs3YUH7.eY9TpoXg6pm1yR3LH2E46JNjp8/scoTW' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610239' AS nis, 'ULKIYA AHSANI' AS nama_lengkap, '$2y$10$aVGFAiUBn3bqq/rwyLQTaOLMdqEDma2aq3eMXCAkRRzLgUKXUCts.' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610240' AS nis, 'YOGA ILHAM PUTRA ARDIANSYAH' AS nama_lengkap, '$2y$10$/iisNUomaWyXFx1J8VUsRuElAmY.m0S6/DfJuZ41IpNqrYga.jYAm' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610241' AS nis, 'ABYAZ SALIH HAQ' AS nama_lengkap, '$2y$10$xKYtd6hf4EudDaq.TmtOEOlrY49DGmJMVe4OZj1sPm3dIM8Blhpzu' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610242' AS nis, 'AJI ANANDA HERMAWAN' AS nama_lengkap, '$2y$10$ck0sXT9XTJERsg18gVexW.FsxP2HGZSvLhuiWPzUB/e1r.///GVKS' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610243' AS nis, 'ALI PRATAMA' AS nama_lengkap, '$2y$10$G8/ptWRgTLW6N0BkwJD/Juwy8/bxIBaJbOsSEffueZPmtHuleP5xK' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610244' AS nis, 'ALISYA NURUL QOLBI' AS nama_lengkap, '$2y$10$nzCdr2BVDkJZSSYKy4kSyu1FgQ2joBU3zXrn2ly0WzBiFLD4EGC1.' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610245' AS nis, 'ALYA AZIZAH SYAHHENDRI' AS nama_lengkap, '$2y$10$pzE642N1P.71nUU0RA1Wwu28yNeioQGTmueKvqJ9z7abNEHaZ2BqO' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610246' AS nis, 'ANISA WANTI NURAINI' AS nama_lengkap, '$2y$10$KlC3hXez0QMtksumQjaoyeF3M.tDv6yEWWDj4WbqBAQW8V7tAdmla' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610247' AS nis, 'BAGAS PUTRA ADWITYO' AS nama_lengkap, '$2y$10$sn7lCr69rj1kxXWkjPnEMOBDQVqNPHz9Cx/j6MdAumnPqYHM.DYe2' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610248' AS nis, 'CALLISTA LUVENA ZANTIANO' AS nama_lengkap, '$2y$10$TMNh5MuplLm6rMdIdXa9POnl3j48.Dlj0nov0WAzRBfGASmFO4y5S' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610249' AS nis, 'DALIILA AZKIA' AS nama_lengkap, '$2y$10$Qqfam87aeWrWUQGaA3/nEOnL.DoDlbI3sgj/yd7Tiag7hE0yFkRS2' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610250' AS nis, 'DANIEL RIZKY RAMDANI' AS nama_lengkap, '$2y$10$k2DbSsjgv2OuOclv17OXyOU9XAwx2rFowOgiFCCm7ycmy115BAjk6' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610251' AS nis, 'DHEA NISA AZIZAH' AS nama_lengkap, '$2y$10$ZqvDF5uI48sjrdZ12WdPb.8pKfIq7DWZQnLYnKukhbfGXvBd6xE5O' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610252' AS nis, 'DINDA PUTRI NAZHWA' AS nama_lengkap, '$2y$10$BckRi4a.5WYhAxndO12Xnu87cEb9DDszEWd3diUY3GXpreBO748Zm' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610253' AS nis, 'DUGI SATRIA SEBASTIAN' AS nama_lengkap, '$2y$10$H3CAZLYnL2aA9E6FEVQu1u7Bb5BmlaBMRRS2nErMDg7rorCROwIBe' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610254' AS nis, 'DZAKY MOCHAMAD RAFA' AS nama_lengkap, '$2y$10$Cky6zxLBARcUJQkyOS0DdOFCmIkvGKLNOum.onM6BDnkKAibFBkKu' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610255' AS nis, 'ELISA RAHMAWATI' AS nama_lengkap, '$2y$10$SEWsbMRyQ9v4TD/dszFsYO1fSzZ3LuUHqLo2Gtu3G3WkJEGYhPQHC' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610256' AS nis, 'GALIH MUHAMAD ADDIEN' AS nama_lengkap, '$2y$10$6GfEDkLmTI7.nC5TwcRk0uprKPruRGj1cDOLoXJ8SfNhwoEcJmrfe' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610257' AS nis, 'IBRAHIM ABDILLAH GHAELANI JAMALUDIN' AS nama_lengkap, '$2y$10$/r5q/ttnHpKjSIYYLZkUV.ZiWcBSOkA7zAp6J1Z0Dx5x6j0byg59S' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610258' AS nis, 'INTAN CAHYA KAMILA' AS nama_lengkap, '$2y$10$SgAVKXQRGVLo3xfMBycsZescAPxaQfC5tu3UZxRHUPMJ/Xhb5kGpm' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610259' AS nis, 'JIHAN LUTFIAH ZAHRA' AS nama_lengkap, '$2y$10$KtURCe1ohfywYbZs1n9CPerq6tXdNR8xRLpzM2GBYwz.1pF07sD7q' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610260' AS nis, 'KEVIN CHRISTIAN' AS nama_lengkap, '$2y$10$ZB7tyezdmybvNa5I.G9l1..HcNt9zwgejoUy.TwwGHTh8BuZdsRdq' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610261' AS nis, 'KHIRANIA SITI FATIMAH' AS nama_lengkap, '$2y$10$PDPx0yOaBp.ZiFEqlDVYbucWTlJ7s5k0t.bikdTUxzwuXJVz6cHHa' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610262' AS nis, 'M PAISAL' AS nama_lengkap, '$2y$10$0U0l/08D8H65WJIPM2EZueaFsAe4tusYBifC6igmMw6N4P.xsvqOq' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610263' AS nis, 'MAMLUATUL AZIZAH' AS nama_lengkap, '$2y$10$.Qm9HMe8w7DP.xGcM5aCPevmaMGn1VslaoQLDPvnP8n8sWHIvjkWy' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610264' AS nis, 'MELANI NURHAFIZA' AS nama_lengkap, '$2y$10$4qYXZ.iP6rRmMrNh6MZGTuICaPdDb2xbcQn89VN8FN2KSVE/5cSpK' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610265' AS nis, 'MUHAMAD ARIF AL AZMI' AS nama_lengkap, '$2y$10$OXTNtKFcZr8B/SbE3ZR1g.2rBTBOwXB/NNUDI4aYTwpveYBZ.4Uri' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610266' AS nis, 'MUHAMMAD ALIF FIRDAUS' AS nama_lengkap, '$2y$10$EXPepdJ1XPku3n9as8zGDeT3RO4mKUGi.Zb6p44b2sOTs0zy3kXQG' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610267' AS nis, 'MUHAMMAD RAFI FAIRUZ' AS nama_lengkap, '$2y$10$A9bS6MJuhOpKSiVNb2Mb1OTP8ANjUBTy9nvFTHug8IvErZGDBOvt6' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610269' AS nis, 'NABILA PUTRI FAHRIANI' AS nama_lengkap, '$2y$10$VdIJDBNdscKT.S31RiEJe.xEPK.TEqKgDF21lP4jznw05xMHFoeDq' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610270' AS nis, 'NAJWA HAURAA ANDAIRY' AS nama_lengkap, '$2y$10$oC5nREm7jss9zWjYR9Ph6OM38a6s8s46vM31nAeZqjfUqchov.lq2' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610271' AS nis, 'NASYA PUTRI AL ZAHRA' AS nama_lengkap, '$2y$10$YwuQCfvB9b.brEackdYL7e54CHdq0wsaD444qNvqoO.4U9qfTN2aS' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610272' AS nis, 'NESHA FIDELYA PUTRI' AS nama_lengkap, '$2y$10$3RuImnYFEVvwNDCqRbCZBODS0JOXgA/YuZAIHHC4/DdL1wA2W9aFC' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610273' AS nis, 'NISSA NURHANIFAH' AS nama_lengkap, '$2y$10$LEPRSo3wSGBNwgmfB3K4deGoNle9bzkH4UmcIr..PTwxgMwoTyHIS' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610274' AS nis, 'NUR ANISA' AS nama_lengkap, '$2y$10$w6mBHK0vocWpLZ4ok9INAO2/FMtatE0n3Z9jIAmNDaDS7U8.OIiuK' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610275' AS nis, 'PUTRI JAHWA JAHIATUL MA''WA' AS nama_lengkap, '$2y$10$Fk1b8B0wSVEyzcfR.d8dNe3Gnd4W0D9ZirkdUSbRBsgihOuxScy8m' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610276' AS nis, 'RADITYA RACHMAYADI' AS nama_lengkap, '$2y$10$OpJfzo1O/ywKS.ZtMdr20OBTn0loLfk2cK0HAPoxOTyaubyWzdsDu' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610277' AS nis, 'RAINA QUINSHA DIMYATI' AS nama_lengkap, '$2y$10$1AZgdfgtFP2PAf8/oaeDP.41hNQRRei.BDA8M.E9Lu/CE1P.cPSHm' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610278' AS nis, 'RHIZKY AULIA NOPIANDI' AS nama_lengkap, '$2y$10$wJ62rKzp/vCfowsfxsqsJukY9tu3x/Rk5PeeK0mf3bUrcy1xHiVXS' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610279' AS nis, 'RIFA NATASHA PADILAH' AS nama_lengkap, '$2y$10$3.s7r91yhlx5okCZvrAj3OQoAXDav.8Psefouooiws6Dv5qn1YPfu' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610280' AS nis, 'SAHLA KHALINA INDRIS' AS nama_lengkap, '$2y$10$rOYHxa/q/yS24lYJuVVI/.v17YOgujIyHsc0/4wWcqcWcED3ebAee' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610281' AS nis, 'SALSABILA RAISSA PUTRI RAFIFAH' AS nama_lengkap, '$2y$10$gWzmJy7P/uXc4z3/PJBNE.po5beV49Jixa.nro6FfDBLvsTb8jxLi' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610282' AS nis, 'SARAH' AS nama_lengkap, '$2y$10$r9WRvd95nyq.zJZ8oGy7m.1EB2LDly4s0bDf7o5GkV85g6uHicTJK' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610283' AS nis, 'SITI NABILA' AS nama_lengkap, '$2y$10$d7B2PshNvf/VNK9gjh.0Tu.513S8zR9swX7eTkg6gDXI4f3ZywOrG' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610284' AS nis, 'STEPHEN ADITYA PRATAMA SINAGA' AS nama_lengkap, '$2y$10$u0XLrJDfKlkYlbIKy.nPJum5LvdmwEi6qb3jMePO2TC0mKCgGk6YO' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610285' AS nis, 'SUSI SULISTIANI' AS nama_lengkap, '$2y$10$kSKfllx3AfWIjA5Ym4JU7./oh3wyQvjNNZU0alJwZ5chh/Xo/0a36' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610286' AS nis, 'VANESSA ELVARETTA ECHA ZAHRA' AS nama_lengkap, '$2y$10$ozQgV0XTBiz6cZajSok.gOzHvlBUU/nkCCMtKr55rrppihUZr6.ZG' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610287' AS nis, 'ZAKI LUTHFI HAMDANI' AS nama_lengkap, '$2y$10$XecgRdc6yCW1yN4wksY3reOQ0j4W6J3lFi3yFyMgoD5KI5opl9I5.' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610288' AS nis, 'ZIHAN PRICILLA' AS nama_lengkap, '$2y$10$MfKbf1EcwlKKarY8wg0CnOxRqqSS4tyrUFgPxmVWbAJDkVO51jN.2' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610289' AS nis, 'ADITYA HERDIANSAH PRATAMA' AS nama_lengkap, '$2y$10$FESJEtHonGhc3ZtsmG2mNuqPeMbDOghUuLSqRuwzBzVkZFv/5.82C' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610290' AS nis, 'AMBAR PUSPITA AYUNINGTIAS' AS nama_lengkap, '$2y$10$lzvhbhjXZq8lBv/IV/1KK.tctDIICBaseKjJbrU/QoU9QIrawQufu' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610291' AS nis, 'ANGEL MARSANDA MANURUNG' AS nama_lengkap, '$2y$10$aJoDxNGzI3vlSK0rZ980SOlqAL1C/xfC66.n4KZ7wPXXHyddMpxSy' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610292' AS nis, 'ANGGA FAJAR MAULANA DAUD' AS nama_lengkap, '$2y$10$AXva2f8LU/7fRDZjna4bs.6TRnCNMFuIn.hbGKd9VLhjDoE5e8qz2' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610293' AS nis, 'ANISSA RADHYANI APRILLIA' AS nama_lengkap, '$2y$10$PEGPy4.6PfKms/9W6OWSRufGdziBy3DPoyP95FW3DdxLSndI0yEpO' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610294' AS nis, 'ARYA PRATAMA' AS nama_lengkap, '$2y$10$r/OdxWz7F2iO00swZcOdOuF..FZM8plaoDQS6y2/vmSQ79WW17nta' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610295' AS nis, 'ASSYFA PUTRI NURSALAMAH' AS nama_lengkap, '$2y$10$rFKd2VD20a4HiQHYKhW.regInc6n96FjePbR1k73y4RMT4ln6jYN6' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610296' AS nis, 'BAMBANG MOHAMMAD WILDAN' AS nama_lengkap, '$2y$10$WuizN6RoHEWf.TktEdNG.ONIPsCtj9XP8zRptbVsnAV7k1UUHJa7K' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610297' AS nis, 'CHANDRIKA AZ ZAHRA RIZQULLOH' AS nama_lengkap, '$2y$10$KR/TuZXopw5F61W8BFEZdeZWAVpaoVpLTT6jZtixvUd3pg8XlPB9.' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610298' AS nis, 'DE SILVA NURHALIZZA' AS nama_lengkap, '$2y$10$YTVIEtV0MIRak9xErWcg4unDDswhcNoHcaK/vyVoVkNnA0s3N2i/e' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610299' AS nis, 'DEDEN SYAHPUTRA' AS nama_lengkap, '$2y$10$d.4IYupQsDnzK0T98QWoWOODHVDM4tKHGn/9VaWkTLjAx0b5JpGzi' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610300' AS nis, 'DINI AULIA FITRIANI' AS nama_lengkap, '$2y$10$krQN1GuiJIdw4CZKYjeuW.ih.75ts5dUIEBtViYYOK/Qq6QErr2ya' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610301' AS nis, 'DWI PUTRA YUDAYANA' AS nama_lengkap, '$2y$10$ZXwMs/YHGJYFk9ADCZYgeuhmnw3MCsx4EeANBQrVLP7MlRdcVUN32' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610302' AS nis, 'EVAN FEBRIANSYAH' AS nama_lengkap, '$2y$10$p3DIclXIpN62LeQP2FzQl.FQZE01R3Dgfb8scPfIrruMMDY/g1nQO' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610303' AS nis, 'FARRAS AMELIA HAFIZHAH' AS nama_lengkap, '$2y$10$Lswi5ni8iG4wNv9nyowFu.N7huuylOPaSbugYsBWdznkBQlrfv/X.' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610304' AS nis, 'HABBIL AL GIFHARY SYAHBANA' AS nama_lengkap, '$2y$10$QJrCWBydQgeCbWb1mEU39ugTVyf4eJu9JKidQGW/NNqoFUrSm8l7e' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610305' AS nis, 'INDRA NUR CAHYANTO' AS nama_lengkap, '$2y$10$4UH7dj6jmbFXKXHk4Lb5ZOT82Iy1WeRkkMJE2qn2p5UiSLgRy.DpG' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610306' AS nis, 'INTAN RIYANI' AS nama_lengkap, '$2y$10$DJsRrFPKYDzsFrqlPu1I0.cFxBMe/OJZdmfSWcQ2oMoXFR9LVlWSe' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610307' AS nis, 'KAI AULIA PUTRI SUPARDAN' AS nama_lengkap, '$2y$10$qmtLrIHQEIgl6HAs5kqov.YjpcrG.QjXeW0xaRVsku2mWX2hLN6K2' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610308' AS nis, 'LUSI SITI SOLEHAH' AS nama_lengkap, '$2y$10$NmP1acYEXftxxXmK.2jjeuEDp.JPUMXtGQ5EAgLp.OVnMq.umO.aS' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610309' AS nis, 'MUHAMAD REVAN SAPUTRA' AS nama_lengkap, '$2y$10$PYG2T2A/vQmWR2pWU/myXul57QSsyFXyvGUeVPoQB8dBOyQQOfSnu' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610310' AS nis, 'MELATI PUSPITA KIRANI' AS nama_lengkap, '$2y$10$5MiGA5WM02L5O3KYiso.eOFl7TBUnizvIQloxDUzG8Bk7M/7HjoMC' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610311' AS nis, 'MOCHAMMAD AKBAR KURNIAWAN' AS nama_lengkap, '$2y$10$kUTIwHSNVQN.LRdGOt63cuIvR2Nt7Fur/NtjY3m7tlmENHyF.LUMO' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610312' AS nis, 'MUHAMAD EMAAR' AS nama_lengkap, '$2y$10$WjV00YGnJIBPr65fnVVqWuKgRUklOGsMlfJHfvv1uRRXcxO60qz5K' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610313' AS nis, 'MUHAMMAD DAKKA JATMIKA' AS nama_lengkap, '$2y$10$m4qWS2zI1hpRSj8KI2Vm/evCqttXlSmrPlcgZvO6hPQ79jUlBnCEW' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610314' AS nis, 'MUHAMMAD RAKHA SATRIA WIDYATAMA' AS nama_lengkap, '$2y$10$d135AXJnrG3CyzGolBj9a.89UmZyA6qrBhATFSTjRxv2EB3pB2S2q' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610315' AS nis, 'NABIL SATRIA PURNAMA' AS nama_lengkap, '$2y$10$BrsFAHV29HQVnh7NtRc7AOJnaAwZeWsYOXhyl3m.E7HBmIUFQUqmG' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610316' AS nis, 'NAILA NUR WAHIDAH' AS nama_lengkap, '$2y$10$XEu3IK8QWn3FpgxB7tbLaO52L2aXO4WR52VrqR/OWVhqt894vi7L.' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610317' AS nis, 'NAOMI AISYAH PUTRI' AS nama_lengkap, '$2y$10$6l8.bsjEu4DWXNpbTyixGuzkxSt/YE06MeXtPr4y6kQyVLUkxSaem' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610318' AS nis, 'NULA RISZENA ZISKIND' AS nama_lengkap, '$2y$10$OuyGD3aeQio7TkPLMw567upOm6RsPegLBnDGnD16nAiwE6qB/.G3K' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610319' AS nis, 'NUR ASSYIFA SABILA SIAGIAN' AS nama_lengkap, '$2y$10$lrXvMr3ldW3.xF5yl6W2xuIZx8VwbSwVZiXxitQdiXf4Vnb9onbXa' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610320' AS nis, 'NURANI SITI ZAHRA' AS nama_lengkap, '$2y$10$rxT5FrFJ7p6Pi8Og9f9UF.I4D2.TFZXjan1wM39aWakCLY8Fgoqjm' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610321' AS nis, 'RAFA JEN NUR AHKSAN' AS nama_lengkap, '$2y$10$Vet4lDypwJPfoQowHPAHT.CfelROPNUxEMMhWEZ0fRelNOaB1GkXW' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610322' AS nis, 'RAHMA RIDHOTUNNISA RINALDI' AS nama_lengkap, '$2y$10$EY5xiRoqUmLCaN3CeNyCGeImVqBSKmuhm7yVQDjdoI90wndGBCtFS' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610323' AS nis, 'RAINA SABILA' AS nama_lengkap, '$2y$10$WpKQxlB1PxU5FNNX2qhJkO8Rss3jHMv51kPrx9D6W0MpFj0euEgHG' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610324' AS nis, 'RIFKI VALEY FERDIAN PUTRA' AS nama_lengkap, '$2y$10$8n01IeBR4i/uMN4TV58KmeTVww51RjX4MZhSNi2j6GQzswxcr9biS' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610325' AS nis, 'RISKI PADILAH' AS nama_lengkap, '$2y$10$TWTsIj5YF/DdaDMqaOaDae9MVXSbrynbPqRfe4Luc8RWdCsp1KQwC' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610326' AS nis, 'SALMA JUNIAR SUFYAN PUTRI' AS nama_lengkap, '$2y$10$6JP.fYdrRpnQezThc8CwXedOSRE//eFsTTBuGykiylN3Xze5wtCrG' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610327' AS nis, 'SALSABILA RUSNADI' AS nama_lengkap, '$2y$10$sraejztZQvmZIlfwgtPcP.qqIBDJQVy5Z7hsQ1Jw8prFRwQEvD/ba' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610328' AS nis, 'SALVIA ASTI KIRANA' AS nama_lengkap, '$2y$10$jfAHciAWANRg453Ycvi.WupWcLfKUnaxgYVTMLVS0AY9cbfQBdena' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610329' AS nis, 'NAZWA AULIA SALSABILA' AS nama_lengkap, '$2y$10$NjhJGkO7Zz6G/QmL9.1ua.efbGFP1rObY7S5zJ/fNZGXcBuKkmPKO' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610330' AS nis, 'SANITIA CLARAHATI' AS nama_lengkap, '$2y$10$cAGqH4njDl4IOdi0PwKQ6.USHbz4MzFrACfC28ZoUc4cQpcmApRhi' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610331' AS nis, 'SASKIA NABILA SUHERMAN' AS nama_lengkap, '$2y$10$K02LAaA/S0itMhfo2LzAEuQ6HquTwxFvqH7rZL2F04QqqMnpxySGG' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610332' AS nis, 'SITI SALIYATUL JAMILAH' AS nama_lengkap, '$2y$10$VeG/2SGToLno42Cz6iR0m./qiieT.eU13yErp9K1ln6lGul6t1z4K' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610333' AS nis, 'SYAHRUL PUTRA MAULANA' AS nama_lengkap, '$2y$10$eMTRYchDGCC/7Ixfr23rd.tzHSepsSJyHlmF5rLnD.Gd7gkTOCpn6' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610334' AS nis, 'WANGI ROSALINA' AS nama_lengkap, '$2y$10$6Vw39mvSkAZ7M9f0Zx.63uQfyNEXRK8bV1Xvy3xF1BBFjx4lKtJNK' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610335' AS nis, 'WIRA DENTA RUKMANTARA' AS nama_lengkap, '$2y$10$eiEff7JOupWhk70H1I7WS.TwE9kmMk..iXsnFhwqbMwzFJaEpIs5C' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610336' AS nis, 'YULIAWATI' AS nama_lengkap, '$2y$10$cLrzbLjmoMyvxc8vJXHg/O7FuQeUf4nsJrtoxcvbxNeftfNYF.Xdq' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610337' AS nis, 'AHMAD ADLU ROZZAQ' AS nama_lengkap, '$2y$10$oWNrR2DJXI3zD59zJw9KuuP9vDu4zrlf8Sw9RzVv2TqS7LuWdPptC' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610338' AS nis, 'ANNISA AULIA HAFIDZAH' AS nama_lengkap, '$2y$10$5QL4kWi2V9mwrfG9hVmNTuaXw6dH76p.XElyDO8GZFfJUfAfoKNTe' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610339' AS nis, 'ARDIANSYAH PUTRA' AS nama_lengkap, '$2y$10$L2a59hVQE6QsjB3.TPol/uy6gGlSRq6IdzjJwEKvSkNsrNPTZDPkW' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610340' AS nis, 'ATHQOL AZKIYA AL AINA''UL MARDIYAH' AS nama_lengkap, '$2y$10$LF4526jXnoNoNrvrM1JBEOJdM84lW.p.tO23gsAADw4Vd4r4h1R/2' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610341' AS nis, 'AZRIL MAULANA ISMAIL' AS nama_lengkap, '$2y$10$MbsP3zEWjtqn5R25wkYnK.ZOiYGOe91jfEpe0ZIirJrnd9WpRFhYm' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610342' AS nis, 'BAIQ AISYAH PUTRI MADINA' AS nama_lengkap, '$2y$10$mvUJxdiBB2/NslqcTs1MWO0EwXMK5MVaXYS6z5G8rKrH0uan9saEu' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610343' AS nis, 'BAYHAQI APRILIAN ZUFAR' AS nama_lengkap, '$2y$10$kUelHuuC.Gg2T29xXdeWg.s6npY8NXVjR2GLJPYeqEpqPa8DMwXLu' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610344' AS nis, 'CHAVIVI ROMANSI DEVITA' AS nama_lengkap, '$2y$10$LnvHNXTosZA8JRpWqhup3OoNulfEXNhxwd3kKa6.Sck2zFs4R7k5a' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610345' AS nis, 'DENIA ARIFRIANTY' AS nama_lengkap, '$2y$10$qkLvzkUuwRiEuVDwYn79O.XgB9tqBN3FkFXNIEz8A8f.yANfqAeti' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610346' AS nis, 'DESRA DWI CAYLA' AS nama_lengkap, '$2y$10$2FD7DJrbw//BrJZP6f4qC.14YnoK94xDz/zHPtrMMlEOolNj3p1aa' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610347' AS nis, 'DINI IRA RAHMAWATI' AS nama_lengkap, '$2y$10$HOLhEqfdY.paNyefL9uvAeMWjZwCGXN3F5j.F1zUaF/CoIkY4UdxC' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610348' AS nis, 'DWI PUTRI RIZKIYANI' AS nama_lengkap, '$2y$10$2.WR8fzJ1RAyzZu5l1CaJeW4ss0LaV6PgqqszvhkVL3YlS9kBlz26' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610349' AS nis, 'FABIAN RAMADHAN MAULIANA' AS nama_lengkap, '$2y$10$NizuW1WwilSIS8gH1o21oOkHG9zUyueSsOCVstFaCtHsdYjJNA0MC' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610350' AS nis, 'FAHRI FAUZI RAHMAN' AS nama_lengkap, '$2y$10$2.1ITtJdCnaQqFOGW1KYEOJ2TeZGeWQf4pl8M57IH/w72Vxm3cFvS' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610351' AS nis, 'FAIQ AZARIA ZULFAN' AS nama_lengkap, '$2y$10$khzUdVbhAliH6rlQeXiBi.5XFs4LnLX/yTb//I/Fh93AIDHrsQkKa' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610352' AS nis, 'FATMAWATI' AS nama_lengkap, '$2y$10$wOm9LEnfbUCoQGjSX.Pux.mNRUgUdVS4Bg2xIzzEfHCa9MIdLodG2' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610353' AS nis, 'HANA PRATIWI' AS nama_lengkap, '$2y$10$RvzI6kIVVqdOZWE9R2d2cuK0P0JwHaS8Tjso2Yq5xMqU3nAv79VIa' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610354' AS nis, 'IMAN SETIADI' AS nama_lengkap, '$2y$10$WR2ImRTGKJOkqs8OBQUOK./hNsqd6b52swltHoyU1THOmFP.lUIQi' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610355' AS nis, 'JIHAN OKTAVIANI' AS nama_lengkap, '$2y$10$GEQUHseXeq6FWf9Hq46Jz.6ZkgLR2jEoOY.8G6nZ2Q49IjpNMsmH2' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610356' AS nis, 'KAFKA SUTHANIKA PURWANEGARA' AS nama_lengkap, '$2y$10$xQMO7kIbaVx6si/yhkuKZulz2W8m9Yev/Dxhw2/387yAvlgD1CSsS' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610357' AS nis, 'KAILA RAISHA PUTRI' AS nama_lengkap, '$2y$10$NmF7PLE8UmjfEpV1c/3AKezDscRMdkk.cfV66TbsbtQb5XUdE2LBC' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610358' AS nis, 'M. IMAM ALKAISAN' AS nama_lengkap, '$2y$10$ClQE.ctb8yNw88V3V3t0p.SzT9Qzn7RhZ3cVjgmGRwxPeaXOVszzG' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610359' AS nis, 'MEGA PUTRI AGUSTINA' AS nama_lengkap, '$2y$10$rZPKpnAFNMZvLIQqDNgy8OaKhNPPMFw8sCi1UMGNejK8yT.4GaVhC' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610360' AS nis, 'MUHAMAD FATHIR VANDIAZ' AS nama_lengkap, '$2y$10$XmTU9xbvx83isb4T9kBz6.aJTRJ33hKItpDb3vqm9vqa5/B5sMy2a' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610361' AS nis, 'MUHAMAD HILMY HILMAWAN' AS nama_lengkap, '$2y$10$KMP1pn04kPcZAbGtNs8aVudOkdf0db11FCOaN39DtR.E8/2xERluq' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610362' AS nis, 'MUHAMMAD FAHRIZAL KUSMAYADI' AS nama_lengkap, '$2y$10$TASk6az9RWE3PujflKLZ5eSPRBDRZR4oGvM4zst5yoiE36DpRG/Vq' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610363' AS nis, 'MUHAMMAD RAUFA ALTHAF ANHAR' AS nama_lengkap, '$2y$10$Ntts0v2QmqoOu22Hcjk8t.mlhe7UhxDGl4luZNVcLv5WiixtXlEoa' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610365' AS nis, 'NABILA AGUSTINA SETIAWAN' AS nama_lengkap, '$2y$10$xnDhyOTnbH/4ssPS0hrR0.pFtpxIp2iM60GIfKaIIooY19wwBhs5O' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610366' AS nis, 'NAOFAL RATIAN' AS nama_lengkap, '$2y$10$U9F21OB54kJ8zlELeq4kDetV9ZIpelwW./Cn.ITJIdrQNq88EEZyG' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610367' AS nis, 'NAOMI ANJANI' AS nama_lengkap, '$2y$10$rNj4StyAgC2NRzK1IeyupOjvrrjRKdUdxgqVIHSUC.BDNT//POZ7O' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610368' AS nis, 'NURLAILA NISPI SA''BAN' AS nama_lengkap, '$2y$10$crThM5N3e/7JwGY2STpfr.Oq5y8oN1g8VcPNlRm2shQ92rgcsm7NK' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610369' AS nis, 'NURUL AZKIYA' AS nama_lengkap, '$2y$10$N3bgIe5MnYbiZbW093fE2uztXFwTJD7GdLoNK/TqRv9FP9kr.WHSW' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610370' AS nis, 'RAFFA ATHAYA SYAILENDRA' AS nama_lengkap, '$2y$10$tPWfApt93NoXYO2Xy8mDMOsZ8R1oFBr8QFRYJ3D11AFVe2eYp8ZWy' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610371' AS nis, 'RAINA WULAN JANI' AS nama_lengkap, '$2y$10$sqLq/F4nPQcCvb06kI9pfe9U6EocScZ2/YCd3v7IpIvDiadRMepCa' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610372' AS nis, 'RAISYA NUR SIFA' AS nama_lengkap, '$2y$10$q7QgGrCgwmhl4AmofqPQQO5L52/23dnk8SzPH/DtC4z9d7NI/oK8i' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610373' AS nis, 'RIFKI ZAIDAN AL PUTRA' AS nama_lengkap, '$2y$10$wQO2xeMHVMoQHjnhmmHQ4uvLukv.2YgrftSYoRq3Kh/uH208es6r6' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610374' AS nis, 'RIZKY RAMADHAN' AS nama_lengkap, '$2y$10$piux4ah2k6lBkio/5pHD1OyJB6CurE7r4I5AmIdbz4U.u58HVVJH.' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610375' AS nis, 'SHAFA AURELLIA' AS nama_lengkap, '$2y$10$WguHjGbRvaxhJJXUpCLxNOT7LvbS4gkF4qCoRxWkdkg5O78karBDK' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610376' AS nis, 'SALSABILA NUR AIENI SETIAWAN' AS nama_lengkap, '$2y$10$4ghYwUWm0rMW0mTQqJHJ8.AHCDiZSR1Ee6ZjgtOcTedmlKnGW23lC' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610377' AS nis, 'SALWA ADINDA NUR RIZKIA' AS nama_lengkap, '$2y$10$L4.CcNFbmXz2piP/jCOPA.amiMAFmZKmim2lKEN5VcCa4jPzvbYU2' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610378' AS nis, 'SASKIA AULIA FITRIANI' AS nama_lengkap, '$2y$10$ak3PB2XU9igFeqLtvaPU6OLcMmZYQVPu.K.dMOy7VNA17yib6XcCe' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610380' AS nis, 'SYAKILA PUTRI ASY-SYAMS' AS nama_lengkap, '$2y$10$UGyuMFrrjAoBOrtZx2jzteIrE/7ealrqct1vu8VJnTaqt35wRPK2K' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610381' AS nis, 'TUBAGUS MUHAMMAD RAFA' AS nama_lengkap, '$2y$10$SsE2WzDM75MpeEzT5BGI5uizxPveL1OqUk.SPULpuolkG70SrLxJy' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610382' AS nis, 'WINDA AGUSTIN' AS nama_lengkap, '$2y$10$MOVIbrr8vnhoJ94..SmXU.QnQ3Lxfb8AxwRbLQNxwU6H2ZQdWWX7u' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610383' AS nis, 'ZAHROTUS SITA RAHMANI' AS nama_lengkap, '$2y$10$QA2ug1FWwXfxc05MJI.eNeljjUXu.RmNyLgGYgD/C3wi/GpLMmJzm' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610384' AS nis, 'ZHIDAN TENGKUH FIRMANSYAH' AS nama_lengkap, '$2y$10$kujXvtSDAKXlxMEooYmvGuVASsKVZoTeGuG6M/kmUByWx7IxEwxkK' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610385' AS nis, 'AKSEL AKMAL FAIZA' AS nama_lengkap, '$2y$10$R0a91LqXH28iQ0B1NfavHeILuUVEjSahTG6vWyG34Rg.SPhfD75zi' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610386' AS nis, 'ALDI DWI NUGROHO' AS nama_lengkap, '$2y$10$AtfuYy6ULjfqQRsGIR1bkeoydCI5qwRpKyMlhkCtN9O7pHQSNCB/C' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610387' AS nis, 'ANNISA DENIYATI' AS nama_lengkap, '$2y$10$uNiNNr4wkKPE9CzEZfp8rej5/pdgzG1P/XxxMqH.k8i3mV7Fs1TVa' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610388' AS nis, 'ARIS SETIAWAN' AS nama_lengkap, '$2y$10$rXqgEiOOlPO.6LDfYcMmSOV40N7IageLdzI.oB.a68s.8TzpmrbMS' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610389' AS nis, 'ARNIS AURELIA NURRAFIKA' AS nama_lengkap, '$2y$10$P2ComjMXhpx/yZ7CJypDgONnP2DBVB5j2ISAJrR0BJgNw885BrMBe' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610391' AS nis, 'BILLY PANGESTIAN' AS nama_lengkap, '$2y$10$Xd.hpDfdKuECunuRQV7j4.kGLV/qt4qrC1PVHFyz1vsNnig0lTHVi' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610392' AS nis, 'CHELSEA DWI AYUNINGTYAS' AS nama_lengkap, '$2y$10$g.dQAQe.ezxKxPg/MDWxq.ESU/aG2m1orDgSk38Uzzv7R2JCiSdRq' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610393' AS nis, 'DITHA AULIA LATHIFAH' AS nama_lengkap, '$2y$10$iIpZzhMIUCTIJHD/RKRg7.m9wO8YDZpqHjrenjRJSD8AOf41FMXLu' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610394' AS nis, 'DIVA AULIA FITROTHUS SA''ADAH' AS nama_lengkap, '$2y$10$7ZzQF3nnLwVxIqmjyHVrjehq8hme0WFq2kZ9seQAnZrK2X0ZzRjXW' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610395' AS nis, 'FADLI FIRMANSYAH' AS nama_lengkap, '$2y$10$F1N68wzcNPuYg44.slilI..bJNIehQ8OHimqIAWL48zNPt9evFKTa' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610396' AS nis, 'FAISAL ISKANDAR' AS nama_lengkap, '$2y$10$f9MZD39mkCMW4wNb36eGS.FZ4UsihvJjR7hKk/ULxvwnT/nbk6F0a' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610397' AS nis, 'FAKHRII ARKAAN NASHRULLAH' AS nama_lengkap, '$2y$10$aIRGuIzjS3hkhVt5EuFmN.XtcqSkRbuB5kbZyoFtaTjRhkTLwiJIm' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610398' AS nis, 'FITRI NURHASANAH' AS nama_lengkap, '$2y$10$3MhR42F5KUTXtgIwtlHj8uHNOWphWiFTTy8.UXoGm7KOpW6RIjJh.' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610399' AS nis, 'HASNA NADIA FITRIA' AS nama_lengkap, '$2y$10$2WAjzkCSk/0Q5UgCI2uOPeD3CGpF421XhcIhezymFMf1Y.HqKUrOO' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610400' AS nis, 'JANUAR PRADITA NUGRAHA' AS nama_lengkap, '$2y$10$Hs2/lOfVPIQ3Bce7zZTbmO3YgLQuNsrvTwx6pFqw2rPJ/PC4P4hza' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610401' AS nis, 'JESSICA AFIFAH SIM' AS nama_lengkap, '$2y$10$BbH6ocZNFUOvQKHL664uGOyr69QRIU6v4fEoBEa1WuOSTSoaI23wi' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610402' AS nis, 'JIHAN ROSYIDAH ARIJ' AS nama_lengkap, '$2y$10$jQBS.qoulIZFk1sYYUBcJuHf8NQgbCbgRBvqZPyAkhe6mWEZ93D5C' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610403' AS nis, 'KAILA ICA KHAIRUNISA' AS nama_lengkap, '$2y$10$CCX.PheVXsaAVqr8nwKwnu.pG1ZIFiAz3e8g1Df8ylOBpgbuv96oC' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610404' AS nis, 'KAYLA SALWA SANIAH' AS nama_lengkap, '$2y$10$kmL7r54Y.oYUuIQzyCwaBu1FTppmIdAYnuGZgOqV/84nBt.0Tz/B2' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610405' AS nis, 'KEYZHA RAFFA ALBHANI' AS nama_lengkap, '$2y$10$jtyAJL62fMGw8S22REs.Rei7LchcTdIMlGL12mgV9TQ2XfkRGgZLO' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610406' AS nis, 'MEISYA INDRIYANI FITRI' AS nama_lengkap, '$2y$10$G3zKr9vpEocI1TxHzocvz.cfpKQs2FWVEn1AUCjPSTE4RTGp3qCke' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610407' AS nis, 'MELVY ARRIFAH PUTERI NADIN' AS nama_lengkap, '$2y$10$CyfGW9K6k8nD9rHtDrsYiuUDV/MlM87UUS5erBk4euyxYSjJ/gkyO' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610408' AS nis, 'MOCHAMMAD DESTA ANUGERAH' AS nama_lengkap, '$2y$10$CzMMxPJdfu3r0wfUvdD5heiiFqV9YhNipymuxd8XW/Hk2Cz4XgSfy' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610409' AS nis, 'MUHAMAD ILHAM RAMADHAN' AS nama_lengkap, '$2y$10$QHAKMqak/fgl9lRkV1Z/QeZy5ZOu6UPeUwlox8tOjT/B9lvjAZ6SG' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610410' AS nis, 'MUHAMAD IRHAM BAIHAQI' AS nama_lengkap, '$2y$10$7/mPC0AsK0t0tcSe5LMhrucrVfkRzKNc5amQCnV6ljwNjFZ9n3hPa' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610411' AS nis, 'MUHAMMAD RAVI RAFAEL' AS nama_lengkap, '$2y$10$3b67jeYlXdxZKy2Kb1KXJu/Hc3oflPJM9VsqQb.lI.3HgGKQxr6GC' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610412' AS nis, 'NABILA AURELLA PUTRI' AS nama_lengkap, '$2y$10$MhhAarC9ru.WCwo9y0Fo9.ReDMGoB98uz.7Z8bRDXY53fGGPIiceG' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610413' AS nis, 'NASYA QUROTUL AIN' AS nama_lengkap, '$2y$10$h5iKF4XSWlqCkXEQdEc4/.bZ319aJD4Qm5G.S56QwrLQhIN//fM8W' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610414' AS nis, 'NATAN OKTAVIANUS SINAMBELA' AS nama_lengkap, '$2y$10$DU34o03c7MK6mngIK3uxFeg6Tre2pS93DQJFkflf5cZn0Rzbl00bS' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610415' AS nis, 'NOVAL AZMI ARIZKY' AS nama_lengkap, '$2y$10$4VOD0Ar6UKPbewgQiGDfyeyJmzh.P2kd/aIwOW4xbHErqHo19aVQK' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610416' AS nis, 'NUR RAMADHANI' AS nama_lengkap, '$2y$10$p8s6/P5XcKR/jKD7Op4WiOIrEWqsoBYlKDm46a76PWeP0lOyVIUDC' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610417' AS nis, 'PUTRI AMELIA' AS nama_lengkap, '$2y$10$nDKg9mhwEeOHeaTHMqnj2ukfBCJLnMrq9Ft12Ni627wxezoLoobkS' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610418' AS nis, 'RAFFA RIZKY ALFATHIANTO' AS nama_lengkap, '$2y$10$xV.UIwor3I149AvNdQ5d3uWNybb9cBo2ihvzaAt2BVuy647onfmuK' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610419' AS nis, 'RAMIRA SITI AISYAH' AS nama_lengkap, '$2y$10$/NJs/HgB4gTMIZg7CnmaceU9d9lxDP3Yw9qKQjjZOlVlTjv.xNcXq' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610420' AS nis, 'RIZKI PRADITIA RAMADAN' AS nama_lengkap, '$2y$10$n/fZecN6xkzQ4Zoow8l7RuvHVsGEdpWaOSdjzr/725mnnYxFgrcri' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610421' AS nis, 'SALSABILA ADHA NURSYIFA' AS nama_lengkap, '$2y$10$VI6/8kEWgZ6W7L4h.5Bow.C4mFYgm5UdKcexW0CYn7da46Xy2ZNuW' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610422' AS nis, 'SALWA APRILIANI' AS nama_lengkap, '$2y$10$jenGHI.xClIq9uijKs8Xy.XzEz0CrwY8CRKxafovmudHRKyZtSvKa' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610423' AS nis, 'SEINA SYAFYA FITRI' AS nama_lengkap, '$2y$10$TcxzMJb7FgBnxf5G5j6keeTU.xq.8B7qg0LoNaqYyiRtFgn/jAyYm' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610424' AS nis, 'SETRI KENDRAN WIMAYA' AS nama_lengkap, '$2y$10$gtU9Xdu.htXcQB0tlmm7k.CkNahG/qElj8yc9vEQyWH6mg9/xWnZa' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610425' AS nis, 'SILVI PUTRI KAMILAH' AS nama_lengkap, '$2y$10$hpYV3mYpdljRWy4de9gNIeOLAUkel/S5Zw87MZte0g0v2biO5G7a2' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610426' AS nis, 'SIRHAN GHAZI ABYAZ SANJAYA' AS nama_lengkap, '$2y$10$eA.bwOF7vVE6/F3/cvTpB.XC53v9HYWEHL0GX4c9VjyUTcyzILDL.' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610427' AS nis, 'VALHAN ILHAM NUGRAHA' AS nama_lengkap, '$2y$10$2JwG6ZEDbrqZzZgV4YlrX.EL1lZ3FLjdQ26nDBl4cbVW.mM0WzOca' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610428' AS nis, 'VANYA AUREL AZZAHRA' AS nama_lengkap, '$2y$10$Q16/vkhZ4rHPNt3n3wLKmevH1OvMrt1UjVjvDA/OjXmG/R1TuEZgq' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610429' AS nis, 'VERN AULIYA GASSANI' AS nama_lengkap, '$2y$10$hrpoU.7NHXLyryDyfohy3.Dwa2NJDDFNAmpaoDXQNymBe4l4K2aC.' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610430' AS nis, 'YURA LINTANG HAURA SAKHI' AS nama_lengkap, '$2y$10$68jiivNyzRytaI7G3UD8.OmUwgAqBZNMQe24rThAFPFiXUMrAOlCm' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610431' AS nis, 'ZASKIA OKTAVIA PUTRI' AS nama_lengkap, '$2y$10$jOcVbjEkI7PAFoQ3ajbBGupbDH2CYlhCeEvn6VGLjdmjSGYF6A04.' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610432' AS nis, 'ZIDANE FATURAHMAN' AS nama_lengkap, '$2y$10$2LGnuIE6G7LUjyOt3jYiD.Tub.kAIP8FvhkJN8.p8k5pxmgtLRIPa' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610433' AS nis, 'ABDURRAHMAN HAFIDZ ANBIASYAH' AS nama_lengkap, '$2y$10$SsH3156qSkpU35Kh8A86jeyh9hgRoStBu1BOz06j5tILW42RDYy76' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610434' AS nis, 'ADYA SYAQUEENLA CHAIRUNISSA' AS nama_lengkap, '$2y$10$PQEOUz49zjQ3SlAV7OqmxOA2bL8KCNQyVrvdcEE1kXdg8wIjCBike' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610435' AS nis, 'ALBAR MUTAALI' AS nama_lengkap, '$2y$10$ric5rs7DWaIDzng.8r5Mg.nhGEyNaxisQBA1dsNMQoXM70DVHLLyC' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610436' AS nis, 'ARLI AYU RAFEYFA' AS nama_lengkap, '$2y$10$ka1DguvGbBE/882Ghd9rPO5mi4i/IuoRAi.TwhNgPIb3k.bhksIJa' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610437' AS nis, 'ARYA MADA' AS nama_lengkap, '$2y$10$6A7fQ7xgeoGdyDPYIVh0meYwkvbqU98H8QewiHvc7pCec4Te2lPe.' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610438' AS nis, 'ASFA FITRI AYU RIZKIANI' AS nama_lengkap, '$2y$10$MVhdx7V2Whp79hBdaAtv8uJ1ATyK2UhwRTIADF1hqmJOAhLcFL2nq' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610439' AS nis, 'AZKIA NUR AWALIYAH' AS nama_lengkap, '$2y$10$cdFbajwspbGuUi4sK0gH3Oj3XXtyQFGGFEOZxuv2Uda.wZCO1OKbK' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610440' AS nis, 'BISMA PRIAMBODO' AS nama_lengkap, '$2y$10$ijYJp73tqPxSGyYmQYhi8OOx.BWp19lCPn/AwAkvRJ5AcxyJw7PIm' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610441' AS nis, 'CHERYL RIZKA ADISTYWI' AS nama_lengkap, '$2y$10$lXLf1cX0I7cVk1491Ho1Iexwv9hL3LzrZkNDV57quWrShtr0zTOby' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610442' AS nis, 'DWI PUTRI GUNADI' AS nama_lengkap, '$2y$10$uFfckmvJQ9upY4ONFyA1eevrUOkOhhXmT2ZINLRxZ9WGs.tiJoyq.' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610443' AS nis, 'DYLLA AZZAHRA' AS nama_lengkap, '$2y$10$byX9Hin4Vl7enG.DetPkm.UBZTEaKocM9B.DoHm9A8UN5283N9U/i' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610444' AS nis, 'FAHRI RAMADHAN' AS nama_lengkap, '$2y$10$e2R/BKxy0YIzQlIzVeoVUOeos8PpqCcc7Rzn14N4wnsG8htZpBS0K' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610445' AS nis, 'FAJAR ARVIN RIYADI' AS nama_lengkap, '$2y$10$6nHFgeKIHbrr8ghVUOWeseQVk7tZ0yaCOwd89TVda7vk/0QZqqve6' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610446' AS nis, 'FALDI RADITYATAMA' AS nama_lengkap, '$2y$10$rKe0qc3jwLlp8IdJ.sGUvOCZlSWsX2rhF50HqbOqTSGDedLWYxi.e' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610447' AS nis, 'HAIKAL PUTRA PAMUNGKAS' AS nama_lengkap, '$2y$10$sWJuv2TNIvwLUzPqUpNtW.NZm6M.UPJpS7IECbnoVG0o3xU/l6l.m' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610448' AS nis, 'HELMINA' AS nama_lengkap, '$2y$10$VLg/tvx7oIQK8p4uNP8/WublL..4aiAvejwRLUJxX8C0mnK70AncW' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610449' AS nis, 'JIHAN SUTARLAN' AS nama_lengkap, '$2y$10$G0eByZAi3py3A4uAgnwusucG1C9veYIRKsKD4/uDQhbuF5YB1trOy' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610450' AS nis, 'KAYRA ELVRIKA ALQONITA' AS nama_lengkap, '$2y$10$5x0XU/Vg/HWXCIzHfGDJzOQgUfYC1ff3foJFyhd9XhiV8eGOMYfxu' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610451' AS nis, 'KEISHA PUTRI ANDRIANI' AS nama_lengkap, '$2y$10$9Lek6w.vF8UqEHB4yQs9OOmHZBBmrgnNhTb2sfvht8jkf.RQv9Ioy' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610452' AS nis, 'KHADAFIE REZKY RAMADHAN' AS nama_lengkap, '$2y$10$kciaI5IhYGFLICJFd8wT/.6.9lFyBqAOO3RqrlzFey5iMCJ0GFFsu' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610453' AS nis, 'MELISA' AS nama_lengkap, '$2y$10$No/SfPHYEDwXVtTOIqap.OpwABzFI3wCYO0mtxewJTHiczXC9/XjO' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610454' AS nis, 'MUHAMAD PANJI ANUGRAH PRATAMA' AS nama_lengkap, '$2y$10$6l95BHRg3WbOx28q9rc7duUNo7udKFPBQXkB54/CgB9/bwr2.zbb2' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610455' AS nis, 'MUHAMAD RAFKA FIRDAUS' AS nama_lengkap, '$2y$10$Zm1cAYy1IQxJZc1G2B/3Ruvu23hVfHVgyhU75UqmscwHggbXMQLlm' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610456' AS nis, 'MUHAMAD RAMDHAN SAEFULLOH' AS nama_lengkap, '$2y$10$P0O0GLFMdRj0RZAvcpmON.bmjJi/ThVegnOnozxx2/QBM1Sh6DcOG' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610457' AS nis, 'MUHAMMAD LUTFI SOLEHUDDIN' AS nama_lengkap, '$2y$10$FKM66A5PdeoafjxG7uZzUeNhq7xnrlZZ6Jslq1.kxIhOuzMRou4B6' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610458' AS nis, 'MUHAMMAD REYHAN HAIDAR RAHADIAN' AS nama_lengkap, '$2y$10$vA4AusjP9v.bgsfU4Gj.XunDWHCJrcjMhtA.i5ojetWa.DcJv9mq.' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610459' AS nis, 'NABILA LUTHFIANA FATHIN' AS nama_lengkap, '$2y$10$zYLT6SKXDO4bec/fpxywC.RlI5AF2biisjYDyjVpnRQlP4ZsKQ8OG' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610460' AS nis, 'NADIAH ADALAWIAH' AS nama_lengkap, '$2y$10$Xn1gnmCdgUB6RHH/hdD9F.N0YZD2iyHAEu91vka8xusH9cfIDkhp6' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610461' AS nis, 'NASYFA AULIA ADINDA' AS nama_lengkap, '$2y$10$h4QrQ/0iQ7OYaxUH8pHuru/pqB90vj3iVjRlUvKor6dTcgba6GSNC' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610462' AS nis, 'NI PUTU GALUNG SUCIHATI DEWANTI' AS nama_lengkap, '$2y$10$.4HWPP3cZQpgkH6XSwCI5eU7ssd1SabkyVDs.2kTTfSnkd3GInegS' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610463' AS nis, 'NYIMAS MEIRIZA GHINAA SYAAKIRAH' AS nama_lengkap, '$2y$10$nDEO6vWmUD6Q7cM1N09Xp.JKC/1GhIT5UQcRn.qCsngNAdmgYGuDq' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610464' AS nis, 'OKKY SEPTIAN' AS nama_lengkap, '$2y$10$dewTEeKE/zBrem/4/7uU2OEZlPFjvAX9g4nRudXynZ/Uz1WYchX1G' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610465' AS nis, 'PUTRI SANJAYA' AS nama_lengkap, '$2y$10$F84m.SVR9gTrssnJh6pMDufqBlh14uPVZ1pZ6Rgbg0G6njKYP/rSy' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610466' AS nis, 'QUEENSHA ADILA PITALOKA' AS nama_lengkap, '$2y$10$fwA2yVdXTU7ufwiQDJrEv.OeVhycORh2BvpvGkwyrBARGlfq6b6RK' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610467' AS nis, 'RAFKA ADITYA RAHMAN' AS nama_lengkap, '$2y$10$Y0LPkuWXlESmoBEpZ/uJcemlw1TsFxf5tUUn9zRoUR2G0KNhxEhn2' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610468' AS nis, 'RASHEESA SALIMA YASMINE' AS nama_lengkap, '$2y$10$qvCmfJ/cdKlT8vOaBcZBiu83rZVUpr45pTcRwlQ8J6H2cwYpb8wAq' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610469' AS nis, 'RAYA NOVIYANTI' AS nama_lengkap, '$2y$10$NFS/QnXL18.VW61PMW4I3Oz5Pzd7/MIASUT5kwcRO2vpOTwbATBUW' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610470' AS nis, 'REZKY FEBRIANSYAH' AS nama_lengkap, '$2y$10$xqNdaXWgpNRtCn5j1x4nXetlKK.rIPKCAnlsawUGHQr6Jg9OVhqxe' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610471' AS nis, 'ROMI ABDUL LATIP' AS nama_lengkap, '$2y$10$zXjyKI/AO0epBLM9bdBw8uRIUjOpg2GU22k0XBDpUurdiWjZIhv9m' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610472' AS nis, 'SALSA' AS nama_lengkap, '$2y$10$sGlqH7ht2t3XVGvvqgODZeiiXxBXc.kcpJ6pv797ym4mXaDpQDNcq' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610473' AS nis, 'SHERLY MAHARANI' AS nama_lengkap, '$2y$10$f1icIx7oNpV0qFNtj57s0eBN/P6kGkjkpF59Hc1wPlY2.PVnvxJYW' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610474' AS nis, 'SINDY KANIA PUTRI' AS nama_lengkap, '$2y$10$MsikFcGjIsnbMpX4OQ5obu.lyA97puOpgSbVg2yKA3IHF7vr7SJUO' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610475' AS nis, 'SITI NUR HALIMAH' AS nama_lengkap, '$2y$10$EEql7Ju3Y3Me0xTShU4Z2OEywW5v9or6sG1c.pxGYSDF4V2HVu3/y' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610476' AS nis, 'SYIFA DWI SYAFITRI' AS nama_lengkap, '$2y$10$kUCXX1YHd99mHsxVMJsJ2eQ/lXQn4qsrXQZxRcz4TtHJ.8kHXy5l.' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610477' AS nis, 'VINO DWIKI HERMAWAN' AS nama_lengkap, '$2y$10$eHugpmBF7Jea/kvzmSEnl.B4PINVuHUpm.YdAqu1l7UCGvT5zE2iS' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610478' AS nis, 'ZAHRA AL QODRI NURHERMAWAN' AS nama_lengkap, '$2y$10$U2tOsGXVBT/S9tore5lT/.1jrc.c9/Z.MWvHAKY4CDP7s2m.LQLX2' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610479' AS nis, 'ZAKI ACHMAD HANAPI' AS nama_lengkap, '$2y$10$tShXCr4eU/a/y4z/RGNwzuxbeUrZ4clNPzNLqhkK9mobIkys24UAC' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610480' AS nis, 'ZHIRA MAHANDHA ROSADI' AS nama_lengkap, '$2y$10$v2SHU2ec7BacHir53UHxe.c798PE/VCQyCcQwoalKIEhYTcp84P8S' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610481' AS nis, 'AGNIYA GHEA ANGGINI' AS nama_lengkap, '$2y$10$YZtVKA3vXgXNRLWEBGbAyODJ7Vfg.Z3jl9jsG4w3myAE4FPhQyohS' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610482' AS nis, 'AGRA PUTRA PRATAMA' AS nama_lengkap, '$2y$10$fQnmMWcvmMketLv6NGDzQuqsyaqAgqyp77wT5UPhsDERqvpA/3HkS' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610483' AS nis, 'ALDIARRISYAD FATHAN ZAKI' AS nama_lengkap, '$2y$10$LW1lm.swR.qYziujkEedVuehzovOTl1bHmO7hm9ZgM/U/b2Y72Gem' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610484' AS nis, 'ARVENILLA HANIFAH FEBRIYANTI' AS nama_lengkap, '$2y$10$woN9wQImzhiYhyvfOTZO8uWYkr0mId5VjhwCdGl/9uHYCUTXyf0xy' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610485' AS nis, 'ARYA RAMADHAN' AS nama_lengkap, '$2y$10$0Ne3OOD1BfPCNBCtr6RntOVj64GUL2z9m60j7LEM8Bl46IyygOCIK' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610486' AS nis, 'AULIA SYIFA NURUL ''AINI' AS nama_lengkap, '$2y$10$JVI8jSoLtUQUS0cH8GCycO3nPtOU3ZzKFBKuXZzmtGGj/xaGPh/4u' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610487' AS nis, 'AZKIYA DINARA ZAHRATUSSYIFA' AS nama_lengkap, '$2y$10$nbrrSXJhQiCpm4J98sl9F.RN/NSv6BA8dpco/X40f8ePkeJwBQ33m' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610488' AS nis, 'CHIKA PUTERI YULIAWAN' AS nama_lengkap, '$2y$10$G4mqCUaudiYQb.d.EE0XSuBryWAzAFC/aru48bghUpZAeLlPQSjlm' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610489' AS nis, 'DANIEL CHRISTIAN HARUN' AS nama_lengkap, '$2y$10$oL/h1djcC9965rb1ZG7i2.BPgkJBKjBlU4iz2MIchaOuaiO2NuW7C' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610490' AS nis, 'ELSI ANDRIYANI' AS nama_lengkap, '$2y$10$.V16F6yeYRcL7iwiVHcQ7uBTzRIfgh1zPuJh8IpCgyeGGmlTE32gK' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610491' AS nis, 'FAKHIRA NADHIFA SALSABILA' AS nama_lengkap, '$2y$10$YoEzxb3iXgZ64YLshVA3G.z2TBIW9uC0NRp47Xb3cNMNa6ygBkkry' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610492' AS nis, 'FATIH ZHOFRON' AS nama_lengkap, '$2y$10$SMiNxRhAM3gryOG0DEXqlO7tdSrVceeMdRB.Ge7hcz3dHYaOf/BvO' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610493' AS nis, 'FATQI ROUDATUL AFNAN' AS nama_lengkap, '$2y$10$BaRXV8e.t9WShOOTJm1f0.l.keFZK3rJxEzGW3gFHGV6D/bxfchom' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610494' AS nis, 'GILANG RAMADAN' AS nama_lengkap, '$2y$10$j//p.1soibROGDI2cgJqP.ZxujUiyq1q2JTWE1SxBO7ERZuaSrlve' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610495' AS nis, 'HESTI MELINA MUSAROH' AS nama_lengkap, '$2y$10$nctRdaq58RAu9FufbeTiLu/x1D9ZtC1TeTsq.ghDb0WOinmWUBxQS' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610496' AS nis, 'KAILA JUSTINE FAWWAZ' AS nama_lengkap, '$2y$10$mbeWukp07Ao.BqLCldJP4.TwwpzbrWc09/6Fy6O4XktrigCSDCm16' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610497' AS nis, 'KEISHA NUR BAYANTI' AS nama_lengkap, '$2y$10$hBfz8pHv9l9sMybaoU8ZT.hTiaxycXeajlbXsajknKVyoScQAOylO' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610498' AS nis, 'LUCKY ANANDA SAPUTRA' AS nama_lengkap, '$2y$10$6DoEeydfs54pmZ2dGPCvkuee33l4EPZJ756Sr/iI3fNe9ZI.phm4S' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610499' AS nis, 'M SALMAN' AS nama_lengkap, '$2y$10$9.FnV.acuskDHL1Uyi6zZOLLJvdlaQerI5lc2/swrVpy8mwNwFmki' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610500' AS nis, 'MOCHAMMAD SATRIA RAHMAT JANUAR' AS nama_lengkap, '$2y$10$rqlu1DWKmOP/Ln9lQrRcROGZQTeqOH68W5kFY7QTVgQICoQepvdSW' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610501' AS nis, 'MUHAMAD RAFKA NURAFLAH' AS nama_lengkap, '$2y$10$GCoED.2eHfcUN36Zd0Wia.JA4wvvdKE5E3riuBJSUU3ztoHxLG5VK' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610502' AS nis, 'MUHAMAD SURYA SYAPUTRA' AS nama_lengkap, '$2y$10$4aro6wAc1uyNXAts2XLTBuOZJug26ab2CFMOLq0TUqdBr8lxK8yYG' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610503' AS nis, 'MUHAMMAD AHNAF NURRAHMAN' AS nama_lengkap, '$2y$10$7OFA6VVpPL55mzA.OZQDauQNyGZlyKcg8NA03lhIXYiwTXZASQamW' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610504' AS nis, 'MUHAMMAD MULTAZAM SHOFAR' AS nama_lengkap, '$2y$10$pLEkZ1E8kd5xcLfh3wIxfe10X6NM/ovzXzzS3ncpObkjcJPQzuGfK' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610505' AS nis, 'MUHAMMAD RIZKY PRASTYA' AS nama_lengkap, '$2y$10$sWcMRtb0qZVroZoz4ujp2uXe.0.rSBKvlRNaQV.QOdg9FG1LOIW5O' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610506' AS nis, 'MUTIARA LESTARI' AS nama_lengkap, '$2y$10$MenXF61tVU2ytNGULaAKIu9zclE8QiHEGrcLHDRSlH585724.DRQe' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610507' AS nis, 'NABILA MEYJULLIANI' AS nama_lengkap, '$2y$10$5syzAZmSRKeqPTV6VAoqoOEsMGiGvQUeje5zPuvNj8XbZWFyii3Cu' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610508' AS nis, 'NANDA LESTARI' AS nama_lengkap, '$2y$10$wX2w2C469.IUKg7j8esy2edacmblfDmFc9OozdqbzPMlgOBlnL0NS' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610509' AS nis, 'NAYLA KHADITZ HERMAWANTY' AS nama_lengkap, '$2y$10$PtoLQx8xnc9dNCLFEuBTceUxtbYvHeplcaOQLWZq5A38FRuiQaohu' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610510' AS nis, 'OKTARINA RAHMA GUTOMO' AS nama_lengkap, '$2y$10$ePymjBnLcgXphoTLVr4nC.A5LTPIP.gAmznnSy5CKTEoEzsjy3mvS' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610511' AS nis, 'PUTRI CAHYATI' AS nama_lengkap, '$2y$10$hvos8YiQswmCxna.SDs8cedTNs7L87UlFnmc/eEHcY8piv82oR0W.' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610512' AS nis, 'QUINSHA ALMIRA SOFIAN' AS nama_lengkap, '$2y$10$IFUpqSqJwmERee1VxazpwOuk8jmzXgJH1Q5bxcjAm34ISGxri/vcK' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610513' AS nis, 'RADIKA' AS nama_lengkap, '$2y$10$voK1wq/AAMewF22NSaqS9O9jarLkSuBznarQemWbTJk6XJvh19z4e' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610514' AS nis, 'RAFKA MUHAMMAD ZHAFIR' AS nama_lengkap, '$2y$10$2PY.Ezkj7.I3ixFNwTiX.e9q..BkKi1kVOTwu5iHepSKX5aGpkW/i' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610515' AS nis, 'RAHAYU ANGGRAENI' AS nama_lengkap, '$2y$10$a0Ukchgi6QY0GKDEqLBt5eSm0FYDODrWZyoeRtBCZu6EN2eAYqGOq' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610516' AS nis, 'RAMADHANTI SUGANDI' AS nama_lengkap, '$2y$10$9IhMcbFwU8xIV00VxiUxGuXjpYFlt4FVIsG1ttjA9k5PTf11EjBa2' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610517' AS nis, 'RAYSHA AZZAHRA' AS nama_lengkap, '$2y$10$xMkpG5hB53RRQMMZ8x5QFORRZiRRyB99nRO6cGtl0kK6x3UOe0J5C' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610518' AS nis, 'REVALINA DWI JULIANI' AS nama_lengkap, '$2y$10$tQ1WdAGudC7xWyghf7a7KeOZqNK08eNl6t.HhWXUhodOzdaCsWTEa' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610519' AS nis, 'RUBANI NURAHMAN' AS nama_lengkap, '$2y$10$eC5YhiY7WByCyHMy7pCouudCKFF54p1gDGwy0mIPnfw/IhqvznYha' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610520' AS nis, 'SELLA HADIJAH' AS nama_lengkap, '$2y$10$/fNgOXNop907ALjEZWeetOsikNSRMlp1gncpppukk0LjvTSGsgQs2' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610521' AS nis, 'SHIFA NURAENI' AS nama_lengkap, '$2y$10$qSZIWT5DWNIjFhh3M3Ff9Oes36zDgD8zNQyxhRUgvpaNHWBonK9dC' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610522' AS nis, 'SINTA AGUSTINA' AS nama_lengkap, '$2y$10$qgNe6u8djuANJl0Xycdueu8cesi2BH7ufloizyQVCqCpNalymF4hS' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610523' AS nis, 'SITI NUR AIDA' AS nama_lengkap, '$2y$10$X4NhX0UIG6O1yW8zeV9ZeuBcch/kHnLP/Jd8DJRokGfQwMj59Gfcy' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610524' AS nis, 'SYERINA ASIFA NAZRILA' AS nama_lengkap, '$2y$10$R18WfYT8ULkB.tUxkyOx7OFwtFuStmh.4Qf9HaXW6HyZ1XuaJrqru' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610525' AS nis, 'TYA RAHAYU' AS nama_lengkap, '$2y$10$K9Y9ZNgcZEQNkDG3piHChOtCnBTdjgzEZk5Kz7HyNU4OIeHvTSZQa' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610526' AS nis, 'ZACKY AGUSTIN' AS nama_lengkap, '$2y$10$i4xNAaEi0.SS7MlQepFVh.7AuRooY2t2FSI9YPokEtlo/MZhf0pQ.' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610527' AS nis, 'ZIHAN ZULFAA TAUFITRI' AS nama_lengkap, '$2y$10$i9kwLRmmBKVJ9im7YWt3s.n8fP9wdbkwEm5MSigZRYbDpDfyhWgKC' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610528' AS nis, 'ZIYAND RAHMAT HIDAYAT' AS nama_lengkap, '$2y$10$8ySXCcs3tpfgRrxeTBeTl.0Y7xFMcr6FkNufOWCmkt2T370xHul5i' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610529' AS nis, 'AILSA MIRAJ DALILAH PUTRINA KURNIA' AS nama_lengkap, '$2y$10$R3ZfaAkW4Qb.YlrkhegzfeIbsm8Ikk23QuqeVEpHfA5fVPmW/BaXe' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610530' AS nis, 'AISRAYKA TIFFANY NAZIRA' AS nama_lengkap, '$2y$10$dBh2DvovTUAUE0mIC/QP2.b5WOWGoXMY7gkSqlY4eGF3hgeKVEzWa' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610531' AS nis, 'ALEXANDRIA RAFAEL SINAGA' AS nama_lengkap, '$2y$10$6qghzFiMs/K9RAhQDtvJHuW9Bqin4chNsqlth5DzuKykgLuTId9z.' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610532' AS nis, 'ALFAN ALMUNAWIR' AS nama_lengkap, '$2y$10$da2JiDCtnFr2X4dl5.SPse7fJVne.A3oQ9OgeXisjx8xUvNa3u0xW' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610533' AS nis, 'AMY PUTRI ROSANA' AS nama_lengkap, '$2y$10$Z/TwlaYN7hEm.gt/XqpncOr2uFRXroMCMEvNkpyV9d11RTGBCFUXm' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610534' AS nis, 'ASHILA MEY SALSABILA' AS nama_lengkap, '$2y$10$/bfkr5JrS/I7BsOwM.rnpOBFfHAjbTi.5YqYJIDMYW/PXzgX1BmdW' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610535' AS nis, 'AURA ARUM RAMADHANI' AS nama_lengkap, '$2y$10$myjnmzy3u/Ixz9a./8YIQeNNyLcWFN3blEvT6thp8L9qeySknpkUy' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610536' AS nis, 'AZAM ADZIKRI' AS nama_lengkap, '$2y$10$1OqHQQIEzokiJjZPJAW2aO7HlQVn1Jyyc5kcsKJw7C8BkB81cTaui' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610537' AS nis, 'CAROLINE' AS nama_lengkap, '$2y$10$L9I.rVYToTxqcxwLL/D16uU2lISglv3jdjF0f9QzGjLGdHI63MCFi' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610538' AS nis, 'CHITRA DEWI PARAMITA' AS nama_lengkap, '$2y$10$oBWcylhBdSqCnQtyJ1X86uXzAbxtpwaM6w/0QTSX53zuWm5ej3/2W' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610539' AS nis, 'DARRELL ALYYA RAMADHANI' AS nama_lengkap, '$2y$10$mL70o8TtAYWAMd1/VDmNVOExCOLVZXGCQNX79ETH1B4NyMMrqblUC' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610540' AS nis, 'FAHRA FAUZIYAH' AS nama_lengkap, '$2y$10$UVh1SBk0pLN6BCJNq6ISveMBbODPOjjTLQw1ZZ5iLCYPDllWb1nom' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610541' AS nis, 'FATHIA SALMA AR-RODHU' AS nama_lengkap, '$2y$10$PPG9Tz1wD3w1j5nGurXDsesrN.lsLkiKAQqNDqdo04aLG997hdRDm' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610542' AS nis, 'FIKRYAN AJI SATRIA' AS nama_lengkap, '$2y$10$qOlFzgEjCTeMisTPvlAp/ecxnDQkuYW8dd.kEYAK/P16kcLhwgo/6' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610543' AS nis, 'FIRMAN AIDIL FEBRIYANA' AS nama_lengkap, '$2y$10$io9br.00OoAmQaQGnSoaU.incReSBCrJSotbxwkktIPXydzEvGP9u' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610544' AS nis, 'GILANG RAMADAN' AS nama_lengkap, '$2y$10$.MCIODgUwe0cFcyVuQPd.OuKr2ekmLdNisZVl7WOuPaNmSQtmUar2' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610545' AS nis, 'ICHA DESWITA' AS nama_lengkap, '$2y$10$jRCPixWp3wOTUij2ZBTZneMq4Va2Msq9Zkydus4bksOSjmRr4UPKm' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610546' AS nis, 'KAMELIA ANGGRAENI' AS nama_lengkap, '$2y$10$cNyK.bde6dS6byCZkXml8OpsV0hH1GBNdBX5/d0wGFz9R2jZ7nuQ2' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610548' AS nis, 'KHAYLA KAYYASAH' AS nama_lengkap, '$2y$10$yGay7C1C0OtYEI/7a8Brp.Cy7Q76nuoFHhfOC4ZAT/fSoiaVG8eXC' AS password, 'XI-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610549' AS nis, 'LUCKY TRIPUTRA' AS nama_lengkap, '$2y$10$CPj1ypVhwGSTB4ZEt6IcT.umztqXLu0JDruL8jZlOlluWoU6WG9Xi' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610550' AS nis, 'M. DWI SATRIYO SUDRAJAT' AS nama_lengkap, '$2y$10$bOrTp9jhM6r7QG2QcJ2O8eqgk0ddUYLhLhEjHU642OVsrP8Sq85vK' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610551' AS nis, 'MIKHA SISILIA MARBUN' AS nama_lengkap, '$2y$10$ZlOqMAgDEdBsT2rls5hMzeiHOg0MS08rHhiQxMMBV6KrNTzU52Qqi' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610552' AS nis, 'MUHAMAD FAHRI RIZWAN' AS nama_lengkap, '$2y$10$mlIbauVvLhnrFl6ytLv42.rjawXXxxOWLTdsSp1HORysBcGzPTr5y' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610553' AS nis, 'MUHAMMAD ARDIANSYAH' AS nama_lengkap, '$2y$10$zO9zzKAIz8UTreHSvbNWue1dhVgbgLhLbktUcwRe3pHJOAQVAUWRe' AS password, 'XI-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610554' AS nis, 'MUHAMMAD ARYA PUTRA LAKSONO' AS nama_lengkap, '$2y$10$Y1RsCb97SZHLngZX6wJ/cOTJ2uD4T2Wjp11J1936xFH0sNpv770Qq' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610555' AS nis, 'MUHAMMAD DENIS' AS nama_lengkap, '$2y$10$DYjPeA/hCcTKwYWJa/Ua7uxvL4ux89WSgXRtAlqXAA.CyFj1BHmm6' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610556' AS nis, 'MUHAMMAD RASYID HIDAYATULLOH' AS nama_lengkap, '$2y$10$byMwVNMwEszfT/OC5n.pleBcbcDYYLAFu3vFCZsZh26bjIeOuIDcC' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610557' AS nis, 'MUHAMMAD ZAQI AKBAR' AS nama_lengkap, '$2y$10$tXDqRFHwnCHtcmJjyZWKNuZYoCjuwZOxFMLu1qPvHFrNHrqeGR7ca' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610558' AS nis, 'NABILA RAHMAWATI' AS nama_lengkap, '$2y$10$KP5kF2Gmmy89WqSBE1FJt.r.kAw8orO.hHcx/vXA/nHr/pcIn42ye' AS password, 'XI-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610559' AS nis, 'NADYA KAMILA WIJAYANTI' AS nama_lengkap, '$2y$10$oTnGhu8MT1CpWxtE1bYebOoChObTVzM6ipf79O0c7Xesh2ovn2rUy' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610560' AS nis, 'NAYLA MUTHI SUBARKAH' AS nama_lengkap, '$2y$10$4pkujDUVDHVFWQ88V4K5F..J.xqq5ZMmOeDmAOZMwtYAl5FQuCeXO' AS password, 'XI-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610561' AS nis, 'PAZIA NERISSA ARVIANA' AS nama_lengkap, '$2y$10$5l.xinFNU0IvNEcDhv3uLeWr43GyJcopGD1GjVsmjlLp.jK8FBZjO' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610562' AS nis, 'PUTRI NAFEESA FAUZIYA' AS nama_lengkap, '$2y$10$OrRAvcnQvX0RukRDe32EquOmZ4D/RHk3FTmMbwBtF5NWDv1sARNJu' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610563' AS nis, 'QUEENSCHA KYNAN ZEIDA NURIKE' AS nama_lengkap, '$2y$10$qkM5hVNeGuN8ToniSC5nbeKZob464x/OgePA.ukD5v1ULDR/RrJ2C' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610564' AS nis, 'RADIT PRATAMA IRAWAN' AS nama_lengkap, '$2y$10$E0f8O0njxh7N54KM1MhRZ.NDJAdUbGazaiC.xZUVk76D2DVIX1XlO' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610565' AS nis, 'RAIHAN HAFIZ NUR ROCHMAN' AS nama_lengkap, '$2y$10$Bpe6/uQZXcDRpBgLgesudOe3OPiW2xlZpNGZfYAOQ5GxMbmNI5kKG' AS password, 'XI-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610566' AS nis, 'RAYKA KHANSA''A YASNISA' AS nama_lengkap, '$2y$10$g6GhlTsMh0qWYzfazpS6tutCOUlSV2ars1k5h1GdqhFucdSrYASJ2' AS password, 'XI-12' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610567' AS nis, 'REVALIA PUTRI PERMATA' AS nama_lengkap, '$2y$10$1w7aGj.NXs2WSblpqkApg.lNqzM7.2OXy4T2hrynJKn6EIFpYfZEy' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610568' AS nis, 'RIANTI AL JAELANI' AS nama_lengkap, '$2y$10$OZBh2kiR0AMrMHKGrpjvReYnpm3mEC209FznsOJ2SPvjabyQr6rza' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610569' AS nis, 'SAMMY ANANDA OKTAVIAN' AS nama_lengkap, '$2y$10$etvGi/nu.K6wHkc2LXpK/Oyrn5OIiotRJ/HV0lNiOoQTcAYyHHwda' AS password, 'XI-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610570' AS nis, 'SHAQINA ARIANI ORYZA YULFAN' AS nama_lengkap, '$2y$10$jvrFUJHjK9v6sQ5udzwxhO8Ftdrg8Q8YLN0rCnlwt0/72LXGpnFjK' AS password, 'XI-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610571' AS nis, 'SIFA NUR APIPAH' AS nama_lengkap, '$2y$10$2nowGwtmdnG4KSNSzpAyveQVPf.bjrqFxoebJF.WIQjXWfkLe1/Jy' AS password, 'XI-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610572' AS nis, 'SITI AYRA NUR RAMADHANY' AS nama_lengkap, '$2y$10$PQK5edHSyHBrETJmyZRz0eAaeafIxz1OV1tS/kvT1eo0MPOLSiL1i' AS password, 'XI-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '252610573' AS nis, 'ZASKIA DWI LESTARI' AS nama_lengkap, '$2y$10$jcoC/rzHI00QgDZY81mBfucAfquVdhVbllVIm9Fc.RmiW7HxO556m' AS password, 'XI-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611429' AS nis, 'RIKA FITRIANY' AS nama_lengkap, '$2y$10$vF1S6XGa0TyGOXZFr62gNOz3vFowrD1/GE6OLwNVO4hi6TBqvBLVW' AS password, 'XII-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611430' AS nis, 'VIONA MUTIARA KURNIADI' AS nama_lengkap, '$2y$10$mQHFGaSNWs0PBQWXxyT.JOpmD6mlSgv/gqDJ9BkfMogEdJue5gyWu' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611431' AS nis, 'GALANG RAHARJA ADIDJAJA' AS nama_lengkap, '$2y$10$URX8yj1bZqKU32vWheZ6beZjQ3mJop/zxDQY2eZVyjssMeIr.CKgW' AS password, 'XII-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611432' AS nis, 'ARGHI KEZHA PUTRA' AS nama_lengkap, '$2y$10$PKu/LNjUE7f3i4fvJnf1D.sd6PS2.3JDNBKo4suMmjyXGbLy1LYUC' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611433' AS nis, 'DIMAS PUTRA ANDRIAWAN' AS nama_lengkap, '$2y$10$JgAU4yNejZmOUyRTuOG.B.9awRjdnrHGQNULxSyjCXZm6uZR3JdpW' AS password, 'XII-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611434' AS nis, 'DIVA KAYLACAHYA ANTASARIADI' AS nama_lengkap, '$2y$10$cRrKvuoDgd.mYeZzSTKHyOXzCTk/6Y1smmhRui4e4IFvrNcmb80KS' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611435' AS nis, 'GHEYSAR GHALY ZHAFRAN GARMANNA' AS nama_lengkap, '$2y$10$gXHQ//m3CWmiQIaqnO6poOrHk4hB3sWnNN6Co6Ni6x3hwp0uPRU3K' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611436' AS nis, 'MUHAMMAD RAIHAN RAMADHANI' AS nama_lengkap, '$2y$10$WctzVZbP39BvPSBzlHtEKegcQmXRzGpRHH6./LPnXhWQiJtB5bzve' AS password, 'XII-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '252611575' AS nis, 'IVAN DECKA' AS nama_lengkap, '$2y$10$sk42SZ4diV.5ISNdoxlhpeFfy7o24QzuOJIBnAjHJbUsDGkF1uPMu' AS password, 'XI-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710001' AS nis, 'ABI RAMADANI PUTRA' AS nama_lengkap, '$2y$10$PgH64oeNH8OxlW7Qzy4PDuqdNDKa0.T0i7lmdA92BtMHSofRCPMpi' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710002' AS nis, 'ADAM MALIKH' AS nama_lengkap, '$2y$10$TUvkihWKmqs97ecQ8zSfGecFSo3hC5wVFkF7vSfacW6Q6zMf5d2Cy' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710003' AS nis, 'ADZRAA KHAIRUNNISA NAZIHAH' AS nama_lengkap, '$2y$10$vhFJ5Fp4IibpXdRPcB9o1.9BE7TCIET.popv8VLU957URDYONxoB.' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710004' AS nis, 'ALVIN PUTRA RADITYA' AS nama_lengkap, '$2y$10$Ys766.VR4vGCUSCU0RCttewikKpVoO153S9B/HPfQnZGX5DM4jNEa' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710005' AS nis, 'AMELIA SALSABILA' AS nama_lengkap, '$2y$10$WRujtW/OvKTyqImtlpXh4OtB9vx6jVGJvD32gmnfN0DuwEaxA7kPO' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710006' AS nis, 'ANNISA ALIFYANI' AS nama_lengkap, '$2y$10$JTTkB04pO3Kjqc9ALCdcYOvAih7m3kCZ248pX9dB5wGI/Hc5Q/U7O' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710007' AS nis, 'ARANA KAFFA ALDIANO B' AS nama_lengkap, '$2y$10$IQaJJ8jFzmYoPKqeUWgYUe8/90i.wDe39Cagz6Vo/eqWBUJCUnaRq' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710008' AS nis, 'ARYA LUTFIANA' AS nama_lengkap, '$2y$10$Gs6VCOk./c991JYB54PMN.VGe3XY3h/RLnYPtyurzzpqs..EMnyX6' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710009' AS nis, 'BAIQ ATHALIYA SARAH' AS nama_lengkap, '$2y$10$jLIrIIM7TMDWfdSqehrCzeo..EGnDtdCWoAb.LuATliEQO4fxN3um' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710010' AS nis, 'CARISSA MAHARANI WIBOWO' AS nama_lengkap, '$2y$10$OHDUq9Usdcb3YhbGzOPANOUYtn8jnGRu5J2y8kBXVcUHIRKqhdW5i' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710011' AS nis, 'DINA NURULHABIBAH' AS nama_lengkap, '$2y$10$OvIQmfPGOesQHB3jJe6z3eJb1IQ0zwOc.///pXTBJAQ/3GBBa88PG' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710012' AS nis, 'EREN ALFAIZEN' AS nama_lengkap, '$2y$10$1X0v8Yrn6jWXO3snOjCEEuPLmcexuqYeXichYw8N5Jj5uA8MRsOZq' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710013' AS nis, 'FARREL ALFARABI' AS nama_lengkap, '$2y$10$AZJi3aM.3fikTl7a.OsYceystiF6gdmYtayVdiHWiAT0aHqgDlN.q' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710014' AS nis, 'FRASTA DEWI KURNIA' AS nama_lengkap, '$2y$10$pgj0opWyjxOYlXUpH69SxO5O5ABN8YHI6yqMy/Hb.buWhq22yFs5a' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710015' AS nis, 'GAFAR MUNIF MUHAMMAD' AS nama_lengkap, '$2y$10$f5xooxjaIvcOucKqHl.NLOEVScaHt0g1slqr790YApqRDrYX4MP.q' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710016' AS nis, 'GEISHA NUR ANNISA' AS nama_lengkap, '$2y$10$D977dNC9n9OxfjdYJkhhCOJBupBRtKXWjW4KIuPfHqMboOJ6GcDgK' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710017' AS nis, 'HANANG WAHYU GATHOT SETIAWAN' AS nama_lengkap, '$2y$10$DFqyiMC5i846CQbt8tIUJ.48hr.kG1H5.Q8tjYizQo1NNNlSxOsg6' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710018' AS nis, 'JULIA NURWAHYUNI' AS nama_lengkap, '$2y$10$FyZjgn/K9mNfk2uzsS2/wuYbg6kKGcaQonPZfjNXkyNkjnXJxH4oy' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710019' AS nis, 'KEYLLA DWI ANGGRAENI' AS nama_lengkap, '$2y$10$5ygXyaRdNH3B4Z64KI.tZOg8tOrDqCIGYUfk0ODHUJmFUiUVbb2dK' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710020' AS nis, 'KHADAFA SIGIT AL GHIFARY' AS nama_lengkap, '$2y$10$24Xjplbjxpc059RHKC293.x0ypucKrXZCSetoYkk8HQCbCg3pJnIu' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710021' AS nis, 'KHENSYA AULIA RAHMAN' AS nama_lengkap, '$2y$10$8Lr3tGkkjtTstbQZIaW9Uefsiopjjuow2N42.J.pENAGR2TN9w7J6' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710022' AS nis, 'MARIA MAGDALENA SIAGIAN' AS nama_lengkap, '$2y$10$wwR5q0yyiOK3p5LK0ShxH.0eAYQpvy.mxklYk5LrtSUOfHWKk6G2u' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710023' AS nis, 'MOCHAMMAD FAISAL NUGRAHA' AS nama_lengkap, '$2y$10$Bx0DpiGkF5zpzjqdUpb2/.qxBckfruvRPneS4QoCPBuLsladq3W3m' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710024' AS nis, 'MUHAMAD IRDAN JANUAR' AS nama_lengkap, '$2y$10$s1LNucP8Ck3Xre2067PzledD8xt0fk3Sdov2w.6tiQdrH2ja3NKGW' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710025' AS nis, 'MUHAMAD RIDWAN MULYANA' AS nama_lengkap, '$2y$10$7cA0CQ8siAuEEcgM1yNQt.CwpcpDIpszx8oVkiUnlNjFQYbh4TDja' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710026' AS nis, 'MUHAMMAD FADHIL BADRANI' AS nama_lengkap, '$2y$10$tEyziQaIHYzgoFSBahomneU2R/3r/BCk3hHttcAnoAQzKHAChiLUu' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710027' AS nis, 'MUHAMMAD FADHLAN AZHAAR FERDIANA' AS nama_lengkap, '$2y$10$MjohL9BSQ8ofR6/H/YWaGeAYuj1RJf.vI9/FHkhhBmcJTHb3t1fu.' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710028' AS nis, 'MUHAMMAD RAFA RIZQILLAHI PRATAMA' AS nama_lengkap, '$2y$10$hGog.7O8RnD4/1O7lv0Iyetx.r.gdtP7duMXrhIyoNUTubvJkt4rK' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710029' AS nis, 'NABIL FEBRIAN SAPUTRA' AS nama_lengkap, '$2y$10$SQhoTmyLTVVPbDNOIxRU6uczwNlaCUK9Y4viwjFAWEy5jiVW78CFO' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710030' AS nis, 'NADHIRA AZYAN RIZKYA' AS nama_lengkap, '$2y$10$.dxitZ43pgvZeqbDQr2YRuK2OIrfUG7LFWkttRVjkAqZHVlOq/SHS' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710031' AS nis, 'NAYLA KARIMATUS SALWA' AS nama_lengkap, '$2y$10$EPC/d0GxL20mEeY.KPr2eO2mBuUxSzUiaL5.DEXIF7mXPeut/mE/a' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710032' AS nis, 'NENG PUTRI DAMAYANTI' AS nama_lengkap, '$2y$10$9ATYZ6ZG7tNY88vFW74Lt.qv6BmK8QAB0PM/fKUNvJSV9YYJFLw.q' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710033' AS nis, 'NURUL TIARA RAMADANI' AS nama_lengkap, '$2y$10$NYVpjY2twsVAcnaVVaTiDeAJe/nkS93hjQ5UsrSOkx1xnBC6adZC.' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710034' AS nis, 'PRANATA GENTA MAHESWARA' AS nama_lengkap, '$2y$10$l039Tg5ZMZKjiDxeFZsozuqLz.j68.nFh6zqfkZhytalfezv.TtZS' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710035' AS nis, 'PRIYA OKTAVIA AZHAR' AS nama_lengkap, '$2y$10$tUDtlrAY5FN6KI8vU9u00eahjzyFpA/jgdwN68WPAt/yk0OiGYvh2' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710036' AS nis, 'RIDWAN RAMADHAN' AS nama_lengkap, '$2y$10$XV3vi2J6Cje09geajhKXdeVbnslz9HGWGLy.HibLX/7jU0oeHa4cy' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710037' AS nis, 'RIFA ALPIAH ZAHRA' AS nama_lengkap, '$2y$10$E6MZoUYzWWaJfAUPJIlfkeaD6YnfdLmRCmfmeLqeSv35Bpxm8xtTG' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710038' AS nis, 'RIO RIVALDI' AS nama_lengkap, '$2y$10$k8PdWueuSa/r4sdVskRaMuZa/V5vHXMUgyt/BzvxtKo4If5ZEpsLO' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710039' AS nis, 'RISNA RAHMADHANI' AS nama_lengkap, '$2y$10$24dKyhNdfeB6ObjBahQ/Zex/rtNAs2iHdZFiuCDORrzQ5RkacpzWC' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710040' AS nis, 'SHAFANA RIZKYA MEYRA' AS nama_lengkap, '$2y$10$DNbjcOJUQ/Uk7dyYvIG/7O51h4FUaFN56UuaYsTe9yBXFhVctVERG' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710041' AS nis, 'SITI AYU KANIA' AS nama_lengkap, '$2y$10$vu4jtEKVoFGJCv4aLCXDq.Rpdxj8U32MGT2FqtUtgz7mm1ytg0VG6' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710042' AS nis, 'SYAFIRA MEGANANDA OKTAVIANI' AS nama_lengkap, '$2y$10$5dzUJb0ahgTeqdtZDhIuOOXbMmT1vzqR8ZZOWhh6HADUTj4x4jHDK' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710043' AS nis, 'SYIFA NUR AQILA' AS nama_lengkap, '$2y$10$cyYZouWoE9Q8l8rMJ7eFJu/9Lg4qaz6Vy7IRXWvqqHxpjUn.38sgm' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710044' AS nis, 'ZAHIRA HAZNA REISYA' AS nama_lengkap, '$2y$10$k4xUi2ghfGjKgrsQ/p2a7.VRlH15LDLlwAqdx9JNIIE8AYPldSOQS' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710045' AS nis, 'ZIVARA PUTRI LIONI' AS nama_lengkap, '$2y$10$LiIcC42CiRi2aOP6kNM4Teqlx6cLoRe1Dvv/c8lioOrU7iuHHr7iG' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710046' AS nis, 'ZLATAN ANDARU WENA' AS nama_lengkap, '$2y$10$LBstsKB/n3F/Z.RwIihKNugz6we.mEvxCd7RzZ.Ah0VvOCOeRH9dO' AS password, 'X-1' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710047' AS nis, 'ADILA RAIYA PUTRI' AS nama_lengkap, '$2y$10$XSpyVGSBFyKVjgz48iecFesbK0mxv7gwE5WNAvuUpr7kFNRaY5cpu' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710048' AS nis, 'ADLI ZULFADLI FALAH' AS nama_lengkap, '$2y$10$l1ko6Zh1nAI64YFLgxEU1ObsUyUjCgdMhzJhclMCP9pDATl0zoFsq' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710049' AS nis, 'AGAM PRATAMA' AS nama_lengkap, '$2y$10$bV0twedywo1kKo.k9uBuGeUiy6NAm.m99tN34.SFv.U.j.XJ30PVa' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710050' AS nis, 'AISHA LUTHFIA AZZAHRA' AS nama_lengkap, '$2y$10$lAN1TXY9gHVHovlU2JVUMeRI4ZsC9PaO20hMFXI430d.A3w7Qq/MG' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710051' AS nis, 'ALVINNO DWI PUTRA' AS nama_lengkap, '$2y$10$4l3YMU8vAWADBxESfpKLa.6i0cbW1sydztNs5EwSGRsrWAErfhCDO' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710052' AS nis, 'ANDARA DWI SEPTIANA' AS nama_lengkap, '$2y$10$9nnKRejSbYC66/W7DvetTep/sG4GKUqhznmxFSi/ws4WQq9VX2dUO' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710053' AS nis, 'APRILIANTI AINUN LATIFAH' AS nama_lengkap, '$2y$10$uB.cpa1F1KKlRH6zU4M51uPgaA5vE8/z.Mdio2.QdFLO4cAiTq2de' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710054' AS nis, 'ARFAN PUTRA NUGROHO' AS nama_lengkap, '$2y$10$hWaIavtnUJT8dXAwC/uAz.GyEsFTJ1zq0.po5ByD5rmhNEZVldUOC' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710055' AS nis, 'ARYA WIJAYA DWI PUTRA' AS nama_lengkap, '$2y$10$8QW9baWj3XTW6hfM0tm3H.39oiyqrIGoNv1hM3IVEmezVAdVy2HEe' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710056' AS nis, 'BILAL ALIKA NUR FAQIH IRAWAN' AS nama_lengkap, '$2y$10$30V9EwDza/D0Nqli76wDkud3/IQLjoUZvi3/TJ5B7YD.nsgmVwcc6' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710057' AS nis, 'CAYLA MAHARANI' AS nama_lengkap, '$2y$10$t0m.HUvO5RIxY.zCi6TmVeTmWfrIbbrk/yLubkh/kP.zWqEubKjV.' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710058' AS nis, 'CINTA NOVIANTI NUR ARIFIN' AS nama_lengkap, '$2y$10$IGyaoK0.fkrbzlq1GOl3xebCb6M178AiJR7BqhINM9pkfCZPmsJjS' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710059' AS nis, 'DINDA NOVI ARYANTI' AS nama_lengkap, '$2y$10$UKPCiLmDg/XbA8xHRbyxPevCUkkQG.M4tBVDBE2taErMP/0sHg0H.' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710060' AS nis, 'FA`AL HASAM ISMAM' AS nama_lengkap, '$2y$10$yYiwIaX5XeWVxQlFmNXs/.tkgLqMMqOxE1fS5WwO1vKXb.P8Xb8.y' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710061' AS nis, 'FENNY ASMARANI' AS nama_lengkap, '$2y$10$2G014OTupC8g9RNGZ2WvC.BokqZ1EkPTnlWE3Msob/NHpWIQVRIOa' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710062' AS nis, 'GABRIELLA STEVANI SITEPU' AS nama_lengkap, '$2y$10$71b845MI99VavkirZkN8Rem8.m6YBbNiWfHdvEOjAcnQzJP4/J/4u' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710063' AS nis, 'GIA INSANIA NUR FADHILAH' AS nama_lengkap, '$2y$10$iWjT7Kz3CSvMpIxK6PeXXuzmuM5VNcOwfQJAeeXCeVQTLcphQKYy2' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710064' AS nis, 'HILAL CIKAL AL`MALIK' AS nama_lengkap, '$2y$10$9get7.dAyyP0bSiZihVi1ONzvIqi1.ELzXEEgkV6ZhsAsJ2GoxViG' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710065' AS nis, 'JHOVAN SUPIS' AS nama_lengkap, '$2y$10$fCW95RaigEs8sYkUQUfev./GXMrRCv/W.ICPu9SkmBK2XKqE.Vk6q' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710066' AS nis, 'KANAYA AURA ANITANIA' AS nama_lengkap, '$2y$10$v/WZTOsuaBQHGzhpBaRWQOcqoLQrhcE4tPkmYlZCO6EHDSG/FMJg6' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710067' AS nis, 'KEYZHA NOOR ATTALYA PUTRI' AS nama_lengkap, '$2y$10$10uySXTbIjclr33/H77CpuEEx0r4cS8OBmoGlc3wQI35XNMyk5VSG' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710068' AS nis, 'LIANI NURJANAH' AS nama_lengkap, '$2y$10$pAikmwpl5PamBOnAAci6...0LYtLQvlptvao71IJEuJrOq510P5/m' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710069' AS nis, 'M ALVIAN NUGRAHA' AS nama_lengkap, '$2y$10$yc37wdKRKaZE1Ck4ElaNseQkuFlUIPfDakIdyJunIx.Fu7BkDJTTC' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710070' AS nis, 'MAHARDIKA LAZUARDI' AS nama_lengkap, '$2y$10$6Nztzzd8OOBoRvmX4vv5JO1AC3cFh4uNC1/.FJVvTEY9oq87c/wja' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710071' AS nis, 'MILASARI' AS nama_lengkap, '$2y$10$BUTZP0fDyClR9fLAMejpTuNeWspAFZMkxepSolpQkoReEK9v0H5va' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710072' AS nis, 'MOCHAMMAD OKTAVIAN FIRMANSYAH' AS nama_lengkap, '$2y$10$h56ybdr2KYt8.O.oB0FTQuIvQ9YUdyjFfKWKKDjQWQalUZJ0u1jnC' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710073' AS nis, 'MUHAMAD RIZKI ARYANSYAH' AS nama_lengkap, '$2y$10$vt2CbyIyB3WN2AZ8TGm1XO.0XCzu7YpcB2.NPndiKlWIPWJS4IIBa' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710074' AS nis, 'MUHAMMAD FARID ZILDIAN' AS nama_lengkap, '$2y$10$OFS2AwdiqvYMIMaQ6yXPX.T4MUs1xNZYYSlW9ksHsV2vWpBz479HC' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710075' AS nis, 'MUHAMMAD FIKRI AL GOZALI' AS nama_lengkap, '$2y$10$YEaGkp.8DYBQfrs/4i.sLeRuc8mmkEUUPSZyTvC1R3Q8/l7eGGdJO' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710076' AS nis, 'MUHAMMAD MIKAIL RACHMAWAN' AS nama_lengkap, '$2y$10$PsAO2YIOEfvBYmrdBhEXr.hW9A2YgzfLcqhxgtk4lbFwDJwF6o91u' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710077' AS nis, 'MUHAMMAD ZAKY FAJAR ABDILLAH' AS nama_lengkap, '$2y$10$exTaG7aujpE3YoPQbQRAr.s3p.4dy/wOwl/R9jJGLklvWKYEabx5.' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710078' AS nis, 'NAFIS JANITRA' AS nama_lengkap, '$2y$10$P/nohe3XqV/M8x8VLmpfzuVFOfbb43lPVaNFC8lW4wqEEJRLIPcKi' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710079' AS nis, 'NAHILAH KHAIRINA' AS nama_lengkap, '$2y$10$8v8ZMOvDrNGm9H7gojgOSetTpE/tpjPWP2zdTggM9gjsNSw/e0POa' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710080' AS nis, 'NENG SITI APIPAH NUR AINI' AS nama_lengkap, '$2y$10$mLawLEGCOX2PuD59Mi0UnOK7hb9ei8C9OLm9qNa.KeTSZYxQj8T2G' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710081' AS nis, 'NIL ALANASTA' AS nama_lengkap, '$2y$10$F9TSW.THpHetM1TQ3rZkWOxjKL3bPg9np5erSDBBCU9Ct30m97idm' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710082' AS nis, 'OCTAVIANA ANGRAENI' AS nama_lengkap, '$2y$10$CCa9Aypb2czxaIiEuzN1EO2Sda8vpcvUnWbfv/Cs86P7AmoPcYzmq' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710083' AS nis, 'RADITHYA ZHIAN ALFARIZKY' AS nama_lengkap, '$2y$10$/zslyCobJr5kyKRB5pjmvOTl8jajlY70VpIrOdtzguD3tsFHMyFUS' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710084' AS nis, 'RISA NOVALIA PUTRI' AS nama_lengkap, '$2y$10$Min2lGKTPQRunOa3H20ZneCj1dEF11pCqoBQWQJGC1r8dGBS1lnh2' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710085' AS nis, 'RIYAN JULIANA' AS nama_lengkap, '$2y$10$WBn835Joz0ETjf3zkSc5JOIxNgqaEgYqhYiYsYw6u3hofDso/e.i2' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710086' AS nis, 'RIZA RAMDANI' AS nama_lengkap, '$2y$10$IthF2VUc1pCmwM6jRS7BH.h4wPGHIOUDzEBc5G4zijiVAUk8HE2Da' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710087' AS nis, 'SABRINA KAILA MALCA' AS nama_lengkap, '$2y$10$au/3rBNEbciwzDVtMCwJ8Ox9wOXFPIVRv9pIRzT545xFdaNDRHzw2' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710088' AS nis, 'SHELVI ANGGRAENI' AS nama_lengkap, '$2y$10$Tv8PJf43TvbJg.nNU136IOGqh1TYvlX71ehpYxqkLRdv4F1RMzYPm' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710089' AS nis, 'SITI SRI MULYANI FADILAH' AS nama_lengkap, '$2y$10$D.ytCW0rZcyQFQKrnX09pudAYhz3OLh2.0MCWjoQOAAM4iVDw0G9G' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710090' AS nis, 'TIRSA NURFITRIANI' AS nama_lengkap, '$2y$10$rSRfNBulprmBjEZv0/tlP.KpyRpg8SDMMZTNdwZsAG/YjRpTdOXrW' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710091' AS nis, 'ZAHRA NAILA LAVINA' AS nama_lengkap, '$2y$10$iLVDZwiolZY6F4b27M3raOly2XNV.BGj10wB/KeOA.8ZfEQL0qJny' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710092' AS nis, 'ZASKIA GIE QUEENSHA' AS nama_lengkap, '$2y$10$qeTPCP8jRs1yWi13Ipt2RuiPqa0Mxqop0.aq/Ov7COfGUyQ2QpkHW' AS password, 'X-2' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710093' AS nis, 'ADRIAN PUTRA JUNIARSAH' AS nama_lengkap, '$2y$10$i1fWbH0Uh0gOm0s35XqY7u87YYb.Pc9HkBiJQ3Hsc6uGcPruF2uAi' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710094' AS nis, 'AGNINI NAILA ROHMAH' AS nama_lengkap, '$2y$10$dwlkVXzrAGS0tTrRuv1f7.tvmC8TWtbFl8XP/D3HgFjEAoCKjsglm' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710095' AS nis, 'AHMAD MAULANA' AS nama_lengkap, '$2y$10$H8x6HTDs8bRt74WW6bxfYOt6DbT345LxmO.iXgDUrxeqn7KmMhBLO' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710096' AS nis, 'ALIFA RAMADHANI SANTIKA' AS nama_lengkap, '$2y$10$hDZwow9OwrwNLKuSgL03bOf3GtlwEzftjpQ8bR.rPj5j8gUt9hEVG' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710097' AS nis, 'ANISA FITRIYANI' AS nama_lengkap, '$2y$10$4KIuvspBV3NmY6gRsoNKSO7jnNVpD1Ob6swboONBw0JCIt2yEXTnS' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710098' AS nis, 'ATHA WIDYANATHA SUTISNA' AS nama_lengkap, '$2y$10$8iHGCvL6vrNI8tZdUUeALuFaJal7zW7nDRP9zJzG0/TZiKbbY3ZKa' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710099' AS nis, 'AUDREY MUHAMMAD ELDIN' AS nama_lengkap, '$2y$10$T/4/nWjA1KXG4Zl9X6Jf2OL37h2ELH7hFKLDo/y8b8oCwKNsjDeW2' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710100' AS nis, 'AZQIA PUTRI SEPTIADI' AS nama_lengkap, '$2y$10$OYBi7vmoB4q1ASkNWETVfez5LhC.0ZqnHc2QQx4BiTVEXMloA9A7K' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710101' AS nis, 'CHANTIKA FELLICIA UMAMAH HANDOYO' AS nama_lengkap, '$2y$10$.NMd7Po0yEWT0K2Ye5actOSjBv2a16KRzn0u/cskWoFhw2ITK8vzi' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710102' AS nis, 'CLARYESTA ANDROMEDA' AS nama_lengkap, '$2y$10$GDrfQ6P4gh2gRc09DsD0aO2lsbj9jqScxIjuAYYEgIk7.aQ5VxGCy' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710103' AS nis, 'DINI ANGGRAENI' AS nama_lengkap, '$2y$10$mok7kut6LsC5UZ1LKggVEeD7GQBnEftb2WT8T9Rxiy/.O6wSU6LFi' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710104' AS nis, 'EFRAN RADEN KRISTIAN' AS nama_lengkap, '$2y$10$A9sA06o5U9z0nVh6d9kyDOig16nZbssYxcLvzwkSWAxMfdX9poVHe' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710105' AS nis, 'FABIAN RHEA BAHARIZKY' AS nama_lengkap, '$2y$10$TViX/raVYK.V1knKRwPRHOYCpzjZrC7EiSbGMI7f1HJMmx5xl2ADu' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710106' AS nis, 'FADIL ILHAM' AS nama_lengkap, '$2y$10$rN7zjCrFPb3sftLIF9cBTOiX4xjo6B/x5gb3GB7vaTPoYQGPhGs02' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710107' AS nis, 'FIKRI ZAHRAN AL WAAQI' AS nama_lengkap, '$2y$10$SQAXhqHmr2C7EJ3/kyA/d.kW9IDEzrU0GrOuIt2zWNqVGWI5RxLeq' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710108' AS nis, 'GYSTA KAYLA WIBAWA' AS nama_lengkap, '$2y$10$dG3PRJZNATVigmMYEBouxOBZnGsnqWtPuipGdTLRDvwlJXwDu1Scq' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710109' AS nis, 'HAYFA MAKTIKA NARARYA' AS nama_lengkap, '$2y$10$743nm4if1a.AATbNDWfM8OhMimGj44aAv4g55nrQn6FHwk85T4vj2' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710110' AS nis, 'HILMAN SYAMSUL ARIFIN' AS nama_lengkap, '$2y$10$HquBP3Siei540A6Sf.IPKevyCxTLrjSrJMbwIFYzPuZxsWsmJhwou' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710111' AS nis, 'INDY AYUMI RASHIN' AS nama_lengkap, '$2y$10$hPgDe7y5VZTNQogWrpTXtOonrYMyxkYMJsIFV687EkUs7F/eRlSQy' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710112' AS nis, 'IRGI MUHAMMAD FADHIL' AS nama_lengkap, '$2y$10$XVemSQJtS3PIgkkFkeLyDO1KqRNZCxJOEFBmjK5cLsIfyk8y3p/em' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710113' AS nis, 'KARIS MAULANA' AS nama_lengkap, '$2y$10$h555YKgA.Monr2rz7NelEuCPuVZZswd4PEsMyq86wMIo3eDMb1kPy' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710114' AS nis, 'KAYFA NUR ALIFA' AS nama_lengkap, '$2y$10$9fzYtkJbhwIW4rcf4YJDhehX/bneaPfK3mrDpqySGKPCR.137u3ra' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710115' AS nis, 'KHARISMA VITHADEYRA ANINDYA' AS nama_lengkap, '$2y$10$8Uwc4IEIzriX779iACnaweRGrTDN.Wl2byMY15tW1Hm1WqEXxCDSy' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710116' AS nis, 'LILY INDRIANI MOCHAMMAD' AS nama_lengkap, '$2y$10$HTqzOhFlyiQLsxv8u6Mo4e41ux5z/jrPAJreO9ZB/W9AWTF/aoJiK' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710117' AS nis, 'MEIDY KURNIAWAN HIDAYAT' AS nama_lengkap, '$2y$10$UerhOMFWBaFaOXuO2Az/qe0LIpAoA4NF8oiHH7boeo0/VFrCaapSa' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710118' AS nis, 'MOHAMAD REYHAN ADITYA PRATAMA' AS nama_lengkap, '$2y$10$sLPbl13jcvcbeppo/w4XqeOWxVdj9RVmkbH2q/LJKdFBRr2PerHQ.' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710119' AS nis, 'MUHAMAD RIZQI' AS nama_lengkap, '$2y$10$wMQjg.4WuhchjnwYXB4RCOu8TwoOZtekeXHYz6So6TGdHQrpyUC4u' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710120' AS nis, 'MUHAMMAD GHAISAN KIRAL FADHLURRAHMAN' AS nama_lengkap, '$2y$10$WJiTOdMeQrub4AXuSMBw7.ziKSEJydj.jGLIhaepwskYzs.8DzJiK' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710121' AS nis, 'MUHAMMAD HAMZAH ASYKAR' AS nama_lengkap, '$2y$10$If0ibncF6RmFRxZ337LT5Oo5aaX9kxH7Ka7L1XpXhS2GyyV6IQhbC' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710122' AS nis, 'NAILA APRIYANTI' AS nama_lengkap, '$2y$10$IFyBFmaauyMtDyNfTc8/w.JKl4juCPmp2tMa63e14IjMIvYpN50ja' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710123' AS nis, 'NAYSILA OKTAVIA RIZKIANA' AS nama_lengkap, '$2y$10$IVBiukojCCg5TQDOgmWdNOOOM.1VO2EXGTxfx64.WAPv/JS1FXVYK' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710124' AS nis, 'NIA NURHASANAH' AS nama_lengkap, '$2y$10$nyH3xpmY4ZOv2QWI/1qHt.jItEKmPvWMaGMmnJ2iA177SdPyvst32' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710125' AS nis, 'NOVAL ALI WARDHANA' AS nama_lengkap, '$2y$10$Fx5BW7eKEaMC6z7poBAOq.JqAddA5lOow73B1JWb422m1HCvhV9I2' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710126' AS nis, 'PUSPA AYU' AS nama_lengkap, '$2y$10$H7TIcBblmvdmgGIr1wZNeu80I.BRkG3630hSINlVlQd2vHF1HPo.y' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710127' AS nis, 'PUTRI AZIZA NURSHYIFA HERMAWAN' AS nama_lengkap, '$2y$10$HadGtbXz32N5ObtvTjr6JuTsWcclOtpwWCW7n5sshu9DDUbYGHghC' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710128' AS nis, 'RIZKY ALGIANSYAH KURNIAWAN' AS nama_lengkap, '$2y$10$V3fhfsjtJiho2n/386Km7eplGlisXZxwMF4WpaVIlxtp1dAcQW9uy' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710129' AS nis, 'RYCKEN SYABILA WINATA' AS nama_lengkap, '$2y$10$TT8mxmYFwpyIKIiiQxRQbuXH5ssDqtNgqox2lDJ1PzpfabFZMYqEa' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710130' AS nis, 'SEBASTIAN JUNAGRAHDILAU SIBAGARIANG' AS nama_lengkap, '$2y$10$DxxXBax0C8iata0jLL94EOHnfpmT91J6U3ukukNHrIoKVWy9zem6K' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710131' AS nis, 'SELPIA FAJRI YULIAN' AS nama_lengkap, '$2y$10$/EN4OyEFIogqrch4td5FIeYo3iHEcsiKv5QwKJoys5uiI75Ocg9FW' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710132' AS nis, 'SHENDY ARFIANSYAH PUTRA' AS nama_lengkap, '$2y$10$vid18mfdEGzTAylMMVE89Ok/8pV8Po83SnCoYkyicGxiYpr4vZpwC' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710133' AS nis, 'SHONA AIN SALSABILLA' AS nama_lengkap, '$2y$10$bXBSSf8eee2SCUI30gkRWub5UMrpJeDRuuFsiqDk09WmVC3BLVUWG' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710134' AS nis, 'SILMA LATIFAH' AS nama_lengkap, '$2y$10$WGxNry0Dw/cKWdCSuugs7eZXxKZZAK.p1M/Qm8yt.xzGoZDRXrl6S' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710135' AS nis, 'SYAKIILAH NOUVA DWI ARYANI' AS nama_lengkap, '$2y$10$904jvzziSAq1KT73fYBn.ukxJeYBwn9M8nvUALyOlhEKS5RhcJVcC' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710136' AS nis, 'YULI RAHMAWATI' AS nama_lengkap, '$2y$10$nxyekOlk3WopfvUavfJeIep.IWGuCs6mxJPDN.J1lZkZ8HHFnLgJ.' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710137' AS nis, 'ZAHRAH DANIA RAMADHANI' AS nama_lengkap, '$2y$10$UkW2OFZOYOVu7wvkRtpi0.RkQgqcTdyD1U3ggd4ORus9PCryALore' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710138' AS nis, 'ZALFA FAIZA KAROLIN' AS nama_lengkap, '$2y$10$9kq6dJeBuPFzoANmGDh.JuCjabvCZLOo0IyUt2Z.zNZoK18WpYYBa' AS password, 'X-3' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710139' AS nis, 'AGUS ARDIANSYAH' AS nama_lengkap, '$2y$10$gCC70G8e/24gXvLJX8o5Fu4iSQuv54rGrlLwY93EQM/2H5sjhMPZK' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710140' AS nis, 'AHMAD KUSMANA GANDA WINATA' AS nama_lengkap, '$2y$10$PgIOu2rDj.LfjluDvNli5OEAJVUJ.9KQgYM7F5hURLqkEK//ot56O' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710141' AS nis, 'AILSA AZALIA AFLAH WIJANARKO' AS nama_lengkap, '$2y$10$L09N6sIyc..HOYv4ztOjUu.4LzeaV9IxlKinJMP0HzgSCT4gQIwX6' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710142' AS nis, 'ALMIERA AZALIA AFLAH' AS nama_lengkap, '$2y$10$TGXwVxDk61ShMDuXUI66zOK3t7Q6B2ujqAV/DjdiCpgRzAzuZL6Ry' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710143' AS nis, 'ANISA SALSABILA' AS nama_lengkap, '$2y$10$E.mq2EgQya9qA1LCFlXTTO6Q76D1juGXoioZTQ7/6Md.Fv7CqkPv6' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710144' AS nis, 'ATHANIA KHONSYA NA`IMAH' AS nama_lengkap, '$2y$10$C2RdDh5OGaaiwA7FwPmGQ.vMw00ny2FJd5XD081AlHCeMHXkHdAUK' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710145' AS nis, 'AZI AGUSTIAN RAMADHAN' AS nama_lengkap, '$2y$10$lxqYu16u8kRowlxpI1Os4u86jaWIXM2C2kuvNuBVCX1zrDsJzYUlK' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710146' AS nis, 'AZRIL PUTRA BAGASKARA' AS nama_lengkap, '$2y$10$Nx6HqWhY//vuD8bdJXYEmuh1y6kCUq82DpTV9yOw2Ay0aYN0wywU.' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710147' AS nis, 'CHARENIA NAFTALI APRILIA TAMBUNAN' AS nama_lengkap, '$2y$10$ASXl0.Jl76h3VjiQRY.CZORhMZ87rwy3PrdRTxr0mt05EfBWG23gi' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710148' AS nis, 'DANNISYA RIZKYANA' AS nama_lengkap, '$2y$10$GvFWjtyrSXnQ44MGu8JLoea7nKZ.cwZac3/IkAWRyRhtH9mjpns0i' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710149' AS nis, 'DELWYN JAUWHARI' AS nama_lengkap, '$2y$10$H8O5CnEgQVtAJiIR1W725Oa/9MQ4MDm3aO7zn/2VB8YOZCbqQgqZm' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710150' AS nis, 'DINI FITRAH HAERANI' AS nama_lengkap, '$2y$10$D.E7X.gF424dcMaGPRQyCuPt38XYbwAej3F86PV/fBfDkG7ty5D0C' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710151' AS nis, 'EPAFRAS NABISUK PANGARIBUAN' AS nama_lengkap, '$2y$10$pBwFneT9qLBGuS1tItv6t.6JT5GdwPU1kgDsDY3GhjiWKbmGDS4Ym' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710152' AS nis, 'HALIM RABBANI' AS nama_lengkap, '$2y$10$Nt6FqaJIWbbPzWhdOL597.GRxrG0TAxo.6OT5eqrVi1xCZml9mVV.' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710153' AS nis, 'HAURA NABILA EILIYAH' AS nama_lengkap, '$2y$10$T9sMPPQjjIinTQl8Opa3Zu53vZm.exvgn6BBfN3L7NE1t60DB4hNq' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710154' AS nis, 'INDI MUTIARA' AS nama_lengkap, '$2y$10$upSukAQE4cDnPpzXY/nVt.Enx81Bj83Mtp56hVig5YtjYhH4hZaGa' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710155' AS nis, 'IRWAN MAULANA YUSUF' AS nama_lengkap, '$2y$10$gR/pGVeOpOBsZjc7v6W1gOxuzJoFK10LiWICvICXSvHB9TMIshFMa' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710156' AS nis, 'KENZY HILWA RAMANDA' AS nama_lengkap, '$2y$10$CsR1gJuRMNw1HNthAPfqteB.8s1UcsflyQJ7VOMV/NpKaSUTXZ5Ji' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710157' AS nis, 'KHEYSA VIRGINNYA' AS nama_lengkap, '$2y$10$.QMMLKKvMAwTSXZeYilHOubLUmSGk.Lvtvj7QAWpjXZVBnUMjDnj2' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710158' AS nis, 'LANANG DIVA PUTRA ALTHAAF' AS nama_lengkap, '$2y$10$tb9X9siLxKO5nTzD4./78ebjAnoZe11IkOXLhkEPLYfNex5DGQL1.' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710159' AS nis, 'MANDALIKA ANIQAH DAYINI SHAFINA' AS nama_lengkap, '$2y$10$cz462yogxmcAah2kDQWp0.NMagES3P2K52iebVxZaulB1Tm/YD4tm' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710160' AS nis, 'MOHAMMAD AZAM FIRMANSYAH' AS nama_lengkap, '$2y$10$WGDYaMqMW1q6YXCXF5k5h.UcrEVWeTl7jGM0xZgjQIhonHVzaI/SW' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710161' AS nis, 'MUHAMAD ARDAN JANUAR' AS nama_lengkap, '$2y$10$G0wt/PsUQg5jvjjqKCz2zOF.HCvzXMzV9OdX4p2mzpKJYDGeGxA5G' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710162' AS nis, 'MUHAMAD RAMLI JAOHARUDIN' AS nama_lengkap, '$2y$10$VTmtNjiZv8hghWtCgskfIuR/wX5.HSa7J7GenLQAPLzYvHM2OxyXy' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710163' AS nis, 'MUHAMAD SAEPUL MIZAN' AS nama_lengkap, '$2y$10$EIoz6octo5WU0RF38DR3bui/bdE3ZqHbc9lhZJpUbw9i8dOwQjT4u' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710164' AS nis, 'MUHAMMAD KHAIFAL AL FALFI' AS nama_lengkap, '$2y$10$B1YtUhS3ih94Ki29t96Jf.7Qco4UMVix3OFNNgTnOd8SnuBNXATc.' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710165' AS nis, 'MULYADI' AS nama_lengkap, '$2y$10$R1uzHjFK7Nrzf9By0ZYLfuvDUGjBPmOkA7eq9frESEyt9GGDr/OlG' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710166' AS nis, 'NASYWA RAMADANNIA' AS nama_lengkap, '$2y$10$sZleZCRvdvk1.AWZN2pwVeqE9SFp0HBGc.8Akd0rXigmCVAZ.IjXK' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710167' AS nis, 'NIDZAR RADITHYA MAULANA' AS nama_lengkap, '$2y$10$O5IqUvPY3xayu0DZULhBM.d133XiEl11XB3giP2E4GPsTGs/rhije' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710168' AS nis, 'OLIVIA ADITNA DEWI' AS nama_lengkap, '$2y$10$s2qWeznyhVzqZIy8qFWNc.tP2uTJ77VRjZGXJZ.HY2Yp4afJxX/zC' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710169' AS nis, 'PAI`J' AS nama_lengkap, '$2y$10$G5Y8ePCM/w3ocpNr9HJR0eG8yf1eQOAYquiYeSRD13O.yWQFUAnS.' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710170' AS nis, 'PATIMAH AZ ZAHRA NUR SYA`ADAH' AS nama_lengkap, '$2y$10$yhZleLgF8U7DxplsoMls9uwJqLlTHwnISfu2dnPcOcJj7l7zQh6zS' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710171' AS nis, 'PUTRI MONICA AZZAHRA' AS nama_lengkap, '$2y$10$tH.Be71mX38Jr1zk2eSgC.KfolrQikHfsOqi3DwNY9aY3rUihLB62' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710172' AS nis, 'RADITYA RESTU FAUZI' AS nama_lengkap, '$2y$10$LRQcfFZms6mq7VvGZAfPy.wHxncIlf/nokeq7RFU231u3U4.gy/L2' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710173' AS nis, 'RATU CALISTA MAYSYARAH YUDIANTI' AS nama_lengkap, '$2y$10$GmZdZf6YLnsBx178erJ9kualETvgfhcXGpmsY.DJ/yZFDeDeapAd.' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710174' AS nis, 'ROLAND NOEL SINABUTAR' AS nama_lengkap, '$2y$10$eSAwnC1B9XUrq6.nuyg4LuLIIQsOaj.YbYCWMecM0x8D5MG1OP/TO' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710175' AS nis, 'SABIYA NUR MALIHA KUSUMA' AS nama_lengkap, '$2y$10$nT/mylJcaBheHHqQ4dOoYuCYi83BREmuj8J380KXq3N9pwCWk9g1e' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710176' AS nis, 'SEPTIANI AL FITRI' AS nama_lengkap, '$2y$10$.dGys/CskvlXVyxI0IcG.ew5mYXFJ7p60PpcrEkqtJTkE4q/jutO6' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710177' AS nis, 'SIDIK PERMANA' AS nama_lengkap, '$2y$10$XM7mA8FSx1wZzYd1mVwaC.8p1PVCNtyFLIuZYPoMeNHmfAUv1D0aW' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710178' AS nis, 'SITI NURAENI' AS nama_lengkap, '$2y$10$4YgNqDBkOJILR539f7AApO4/58lnnjYe.lexn2UoHr.OHaC28RMAW' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710179' AS nis, 'SYAKIRA NUR AQIILA' AS nama_lengkap, '$2y$10$zaB0DvWMq9HD5YBzq4vwfee1ktFzH6.0zKVIhgIoLb4UL2.5gGAGu' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710180' AS nis, 'ZAHRA NURAINI' AS nama_lengkap, '$2y$10$NJ/SFTRVsPRC/tKDuhkXRe4imwFz0tAqveNWPNIeo899hteTmCNX6' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710181' AS nis, 'ZALFA MAULIDA' AS nama_lengkap, '$2y$10$pKRBctDCXMFMeN65c4lfyeVsupd4jMaMQ5rTr.z8WhyVHGB1QJqfa' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710182' AS nis, 'ZEFANYA KEZIA ALBERGA' AS nama_lengkap, '$2y$10$h772xjoshTgaAufifO25neAmZ/RCAmZHTNE/OaAmOi8zuBZSm3xJW' AS password, 'X-4' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710183' AS nis, 'AGNA MAULANA' AS nama_lengkap, '$2y$10$b4JXvjbVQ23QfpbOnTWFyuSyDl7fwNQTpfoEASEsaP.yoSoCcPuE6' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710184' AS nis, 'AHMAD RIPAI' AS nama_lengkap, '$2y$10$ERyetgF6bjC6Aq/NJSY3nOZqh8nzUjMjgQbd2gpPpzFtfR8dFWBJe' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710185' AS nis, 'AISYAH NURMALA SARI' AS nama_lengkap, '$2y$10$atMIDay7o0QljRmWMddmgub5VUdOBTTW5pq0CdimfxglJo2sF5Fb.' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710186' AS nis, 'AL-BIRUNI ILHAM RABBANI' AS nama_lengkap, '$2y$10$vMxGpQARZTxuh2KXvpofZOl5T97T.IzJGBmupphRTuWyxiNU796i6' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710187' AS nis, 'AMABEL RIFQA HUSAINA' AS nama_lengkap, '$2y$10$S1zOtQ4G.eB/5P7G36SoEOGNTTKtsDitZ1QS66hqC5Eli/L.QKwnW' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710188' AS nis, 'APRILLIA PUTRI WARDANI' AS nama_lengkap, '$2y$10$wzTrlhpURV1ngdcNi0S51.0ttkc3wuaBKrnAwfNm/u1f7sD7csB2a' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710189' AS nis, 'AQILLA NAIRA AZZAHRA' AS nama_lengkap, '$2y$10$5.d9CvdqduacLnzhhaKn6usm3eFhil5S4UqqYfM5VKfyFndPur5Si' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710190' AS nis, 'AULIA FATIMAH AZZAHRO' AS nama_lengkap, '$2y$10$h7zpkr5ufhH91Wp0uRrNNe8EALLctKUuATbSH88E5JTl3It4qfzCe' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710191' AS nis, 'CAHYA RIZKY NUGRAHA' AS nama_lengkap, '$2y$10$3Clqplnr/sIG/.2wkJ1BZu4QbtCqnF2Pzy.RqEg6dY0qGHm48O.kS' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710192' AS nis, 'CHANDRA SAPUTRA' AS nama_lengkap, '$2y$10$56YwdVQjVNxuTEde7/wsBO85uxMuHCyZK4EzdOa0akIXD2HpMuoma' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710193' AS nis, 'CLARISSA PUTRI SHAFIRA' AS nama_lengkap, '$2y$10$PyCLkaNOlSeQghIPDb7L9.OYD9OI/oeiwczBF.yoSUCQQax2WVS3K' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710194' AS nis, 'DAMAR HILMY WALDIANSYAH' AS nama_lengkap, '$2y$10$8dB7ujsmU5ogLsaHko.0i.EXR4eWt5.JiWhpNC4bfdQ72Xl6YR5kO' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710195' AS nis, 'DESTIAN SARIANTI DABUKKE' AS nama_lengkap, '$2y$10$mT5mFrJV7SKYcTWyZFudtuGIXlidrsMs0iCaLDQR2kCxk13Z/frsS' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710196' AS nis, 'DIVA WULANDARI' AS nama_lengkap, '$2y$10$ZSfCpHEnDkwIbO8xXKiGvephzfYhnpk2yE0Xhf7X9wtrxaTxyagj.' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710197' AS nis, 'FADILLAH DWI RAMADHAN' AS nama_lengkap, '$2y$10$rBqi07eeJl0MCjWDiaQr6OZaxNDC0fWC/LJ2MlsyA7POlrQvTOkJa' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710198' AS nis, 'GILBERT FRANSEDA MARBUN' AS nama_lengkap, '$2y$10$DUT6aetpDACBnUEzTzgADuOPcV9g8Y9cG0qrXoee0uY8QcxV/r5ey' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710199' AS nis, 'IBNA SALSABILA LIRABIHA' AS nama_lengkap, '$2y$10$1zQnHmV4WHAcr.v3NYl2mOyMwp08PMq4qQU7s9DSqYBNCreLsiw5K' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710200' AS nis, 'INTAN RATU SOFIA SA`DUN' AS nama_lengkap, '$2y$10$ayQbZiNN18jL00qJE7VlhuNToa.nuOeJC/2dn9DOFPNYbB/IQX7We' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710201' AS nis, 'KAYLA NUR NAZWA' AS nama_lengkap, '$2y$10$j.BPS8yDELIu709ml9IDuOn5aImRb36OnmYYlTlK/sClOdUARewRO' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710202' AS nis, 'KHANZA PUTRI CEPTIA HERNAWAN' AS nama_lengkap, '$2y$10$p5h/kJmjBdb3cQ1gvaaDxOgJXXmXwWpwsZ.XFaVvbbNPf.cFuGlKq' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710203' AS nis, 'LADIVA SYMPHONY SURYAYUDHA' AS nama_lengkap, '$2y$10$CygT8kBaVzT/Gf24fQkxcu6bFDAa6UwLs3DrRQQLfzJdl/TYxaES.' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710204' AS nis, 'MARDHIKA LIGHATARA' AS nama_lengkap, '$2y$10$rsgQUfozkkgI8kD/5yhLxOvbhJmkQNsfn2DciLXjKrKU4ehsBe9ve' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710205' AS nis, 'MARIAM LINTANG REGINA MUSTIKA RAHAYU' AS nama_lengkap, '$2y$10$THpnalM.nL6Sx9Oy0RLlcu2wi1DcuDoB3ASQEdn9u5BLvfqJXy9R2' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710206' AS nis, 'MOCHAMMAD AZKA AL FITHRA' AS nama_lengkap, '$2y$10$vKAxQj5//dlKg1MTOVo8B.UQPDtjO6TLoGzfDRhrfeTjM1m0TE7.e' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710207' AS nis, 'MUCHAMAD RIVAN FAUZI' AS nama_lengkap, '$2y$10$kV097ymjDqkOq6AZiCA3SeMEA34BH/ZHTex7kbqpgO05qeZJKzBzS' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710208' AS nis, 'MUHAMAD RIDHOLOHU' AS nama_lengkap, '$2y$10$WcTQdIWJZZ9CbveZDl4Oq.tx25vd6zDFHbHmycN2I3MU6oKjlbIkC' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710209' AS nis, 'MUHAMAD SALMAN SULAEMAN' AS nama_lengkap, '$2y$10$Jnqgna5lBPtzEamQTMBq0ulm3b496LVAaSz31yZQ99ZRu4rztWTnu' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710210' AS nis, 'MUHAMMAD MAULANA ISHAK SEPTI' AS nama_lengkap, '$2y$10$.eKLAdndlKGTI4dg6Djpk.s2l19hM6Kjn3FmPkwkuULRAbVln4smi' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710211' AS nis, 'NAYLA FIRYAL SALSABILA' AS nama_lengkap, '$2y$10$VR4lCkc/mRBEYpmPazLNCOask6nRONX7880G0cGZeq/IMmfVc/6FW' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710212' AS nis, 'QANITA HISAN HUMAIRA' AS nama_lengkap, '$2y$10$gdrsVoe8aafYs/o/nFboQ.oY9gQqRFtLwnFBFU.qWT7xjcJivBNHa' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710213' AS nis, 'RADI BAMBANG SETIAWAN' AS nama_lengkap, '$2y$10$UnbsRvKdMFGqQfopBPXaGeummAwuHtxt3BDT96AP2rSlnU6bxf1lG' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710214' AS nis, 'RADITYA ZAHRAN HABIBURRAHMAN' AS nama_lengkap, '$2y$10$aLbqF3M2bteAWZCc9AFoceLXRJF8fQUg62q1KqJrCWsEUNaMvjDD6' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710215' AS nis, 'RAFFA MUHAMAD PERMANA' AS nama_lengkap, '$2y$10$XmAg12wr3PScaL9.8Fgbw.BaIntVb8xLsuJb2MnnMGA3GkyM/FIuG' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710216' AS nis, 'RAISHA KIM CALYA' AS nama_lengkap, '$2y$10$eq4kw0U3E.pCBy1kxpKFF.6JfpJy/WxO9s816kTX4kv2oLDmcTSgK' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710217' AS nis, 'RANI MULYANI' AS nama_lengkap, '$2y$10$7014kFhYNVGqrKg.vD65DO8sag2zSRN66d1sbOy0Uz3E1fJw2D7dy' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710218' AS nis, 'REFA ADELIA PUTRI' AS nama_lengkap, '$2y$10$NV9MwwFl7G6i1XwSPVhAEeXPBBzxbfsfEhG.pNSzme6Kq1BHQ.qwW' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710219' AS nis, 'SABIAN GHAISANDY RIZKI' AS nama_lengkap, '$2y$10$ApdbXga95Yco1p4JlJmrOu2OyfB49xDdji4ok8sUBaZwI1GKNnbsO' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710220' AS nis, 'SALAMAH SRIWIJAYA' AS nama_lengkap, '$2y$10$eGeHVmI6fdC3oa9xRyarsuL1MbivHAg1IhhadMY0snyiHEJIYkyD6' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710221' AS nis, 'SASKIA NURUL TAZKIAH' AS nama_lengkap, '$2y$10$qZbBcdVJOHNqWEGt9K41S.ocY7MAOC.VRZF8cYGICDPnPznrBG.xK' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710222' AS nis, 'SHAMAILA NOREEN FAZRIN' AS nama_lengkap, '$2y$10$IVqcH3XZ8BHVzZmRCbwtXuHHd88ObY6yZODCAOgOnqH0Du412QjDS' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710223' AS nis, 'SITI MUDRIKAH' AS nama_lengkap, '$2y$10$YpS4aM30r6qet2fSP3iZTOJ4Uak44M6BC9XVLawWGFDtuCkEDwpSq' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710224' AS nis, 'SOPIANDI' AS nama_lengkap, '$2y$10$O3RWP0gsec8fgyv90AidXuzKxERJNRE8u8cpoQunWJM/4CItEI/H2' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710225' AS nis, 'TANTI NURUL AINI' AS nama_lengkap, '$2y$10$L.yDOyunjf4X.Ib5nvPM8OygVt/XQM7DmWiqQNmfs3qPSwFvIxpXu' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710226' AS nis, 'ZAHRA DINAR NUGRAHA' AS nama_lengkap, '$2y$10$NXywE6HvaxH1UvkfgnMTeOCMQgef8YtjHusQYMQtMqy60hJ8fLUY.' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710227' AS nis, 'ZIKRA RIDANI SYABANIAH' AS nama_lengkap, '$2y$10$rWtAlYDuw.VILlMGGG51KufBgReENDfgahWDVuE8oE1E7CGtSNJRO' AS password, 'X-5' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710228' AS nis, 'AHMAD HADI FIRDAUS' AS nama_lengkap, '$2y$10$g5tXfVKv/o.bjbULuVcNGuQpPX0QFAlh.VMx1ToU2FP4KTrn5WFn6' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710229' AS nis, 'AKMAL DINARDYAKSA' AS nama_lengkap, '$2y$10$vPpZzaFzdPlDHSlkgYN5feYNQBvE9AHkqaPXB53qmPsdyZx6Or8P2' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710230' AS nis, 'ALFIAN NURFAZRI' AS nama_lengkap, '$2y$10$fDlFU8MPPoFmZjSoJ2b5c.QmfRoskBTWJW0Fcet0GRb82RM1R.V0a' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710231' AS nis, 'AMALIA PUTERI AJIZAH' AS nama_lengkap, '$2y$10$PqHtgwAWy6W2PGkLWsCFxOysLyMb.L4NahLYfI/zqJ7KPJZV41es6' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710232' AS nis, 'AMANDA RIZKA MAULANA' AS nama_lengkap, '$2y$10$Q0gUdy4m4HPoWQu0W8v.Mu4dORM2jWqu5Q2MQPr39PbbLD5p.8f6.' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710233' AS nis, 'ANGGA DIMAS ANDRIYANTO' AS nama_lengkap, '$2y$10$KSF8wNQFUgZzQKJXIUjbFObXBxUtI1Lcu.TpX1bZ/NiXvGroTpM6K' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710234' AS nis, 'ATHAYA NASYWA PUTRI AKHILA' AS nama_lengkap, '$2y$10$6KNX0gFXMzI73WxRsjbWOOEjnRaniv9CQLrpOLuh6moDkO4/TLeIq' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710235' AS nis, 'AURA KANIA ANJANI' AS nama_lengkap, '$2y$10$eeKL/pWfo7pg19NncNQZI.emx.gZ2fCY5MLq.4UHGJ3gmcytQ2Ogu' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710236' AS nis, 'DADAN' AS nama_lengkap, '$2y$10$M2ZY6ftPSwteC6VuT9MejeQ5cN2nufKVyJVL4b/VvxbNz1lSRR2ZG' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710237' AS nis, 'DARA KHUMAIRA' AS nama_lengkap, '$2y$10$fn1TjvS6xSENNiPf/Nj76O/94evBe4SwdoGF2fQVZ/JOKH3S03moq' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710238' AS nis, 'DARUS JANWAR JAELANI FIKAR' AS nama_lengkap, '$2y$10$nY/D9oFwZ6.y3kj2R1S2EuzC8FHxXZKvAMAfql2JK1m7CfrDmkkc6' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710239' AS nis, 'DINDA AYU LESTARI' AS nama_lengkap, '$2y$10$eI7dzM2TMbeXk7yYvy8Mr.GV4U1iycXGiKcP0kQ5trWaptryz.a/G' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710240' AS nis, 'ELVINA ARDELIA FIKA RAHMA' AS nama_lengkap, '$2y$10$mAsHFFp9AgoFNMK1c9fu.uZFVPsN4cLySvLQq88PCjosNca/agq.q' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710241' AS nis, 'EVA NURDIANA' AS nama_lengkap, '$2y$10$mPpupkhMJAPWkG1y03MLee6acupwfedE9shlkUz5DrQdd2J7sTNia' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710242' AS nis, 'FADLI AHMAD FADHILAH' AS nama_lengkap, '$2y$10$ZqPpSYQuO594J6ofbFx31uFwnpEWAghrSjuCw6EAZC9qUh8nZvfqi' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710243' AS nis, 'FAIRUZ ALYA QANITAH' AS nama_lengkap, '$2y$10$pt0sYlywPn5e26CO4wXr2OA4f1nTL9pcsS02KRIDnTETOOodOtvay' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710244' AS nis, 'ILMI NURFATONAH' AS nama_lengkap, '$2y$10$8XGgoQtPmZUMyaR20DxMMOKMhzCRA5Hi7gCqGyGBlZeehSjZ4BphK' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710245' AS nis, 'KANAHAYA SAFFA AZZAHRA' AS nama_lengkap, '$2y$10$JHFe62Y7lQdSDsD4eL3yOOtJjNouXhbdT/lkk1e1UyKU.oDrx8vSy' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710246' AS nis, 'KEIHAN RAZZAQ' AS nama_lengkap, '$2y$10$GzOmj2gpOncGJ7RBQQ8OLueFsod0nN3Rh0OocQDiyYVz7f0CxChHO' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710247' AS nis, 'KONITA SEPTIANI' AS nama_lengkap, '$2y$10$TQEkJlUuFlwfybfymY/3j.z5wdv7Kr9kE7ogB8kQOsXf5bfpiy93a' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710248' AS nis, 'LIVIA MEILANI PUTRI' AS nama_lengkap, '$2y$10$HxB6QO3knSacV0xyjmT6G./BL0fFjVkJJzNAhfk6aR6Y4/ToQxyAu' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710249' AS nis, 'MARSYA PRADITA HIDAYAT' AS nama_lengkap, '$2y$10$EQaR6VWvTpFrzQ1OZKdT2ORMJhDW0mN.cTK12q8/TD9RpaHBF0NO2' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710250' AS nis, 'MEIFRI TRISTANTO' AS nama_lengkap, '$2y$10$FE.XeVa.8cD80o5oTwBi4.e3wzTAaKzOoKe5Zp14mZtWTjXXQVoVa' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710251' AS nis, 'MUGHNI SALAMAN KHAIR' AS nama_lengkap, '$2y$10$nQI0OmWjzoKqFdTeyf1HyeuW58Ll0.kMT7k5V1b5O1FY9XqXRTc5e' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710252' AS nis, 'MUHAMAD SURYA ADITIA' AS nama_lengkap, '$2y$10$BmW.q7.liE6Nr.Dimt1lQu//d8HjyndAHaCG4kUC6DY8Ua4pan1Ru' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710253' AS nis, 'MUHAMAD YOGA PRANATA' AS nama_lengkap, '$2y$10$qKZB7iUtreaRoiCnIzRCh.a91WgFea815Oh5bj85sMvPkpuKKfK6u' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710254' AS nis, 'MUHAMMAD ALWIYAN SYAH' AS nama_lengkap, '$2y$10$OPhSVu6fJqSK9msQR.hDmuzZCYj2yKLTM2A82xRDi2z4Pq7lp0ym6' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710255' AS nis, 'MUHAMMAD PUTRA HENDRAWAN' AS nama_lengkap, '$2y$10$B5OQfrd.ji7DFZbqrEcWi.KGwDpMCqv9nzrVbkfW6bdhbl/YuxlEa' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710256' AS nis, 'MUHAMMAD RIFQI ALFITRAH' AS nama_lengkap, '$2y$10$bWjeoBalj2uEsnhPP.N2EuHTDh6umF65oEilYbL4BcFK47fjNG0Em' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710257' AS nis, 'NAYLA KARERINA PUTRI' AS nama_lengkap, '$2y$10$rLeF8ECw0NcutdLUlETMiusleEwW1bBy82glwc.ChRgWakA3wE6qq' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710258' AS nis, 'NAZIRA NUR SABILA' AS nama_lengkap, '$2y$10$t/wigWW58DlMN/lpTc9LAuioHt.nNLmkNZF4K68r1h/kgZVGEQBdq' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710259' AS nis, 'RADISTI ARLIANTY' AS nama_lengkap, '$2y$10$QQnVGLUPOzXxH1/a9XuhWer7KdKllRVcGLAlEYg9ZZfv4b3P/gxMG' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710260' AS nis, 'RADIT' AS nama_lengkap, '$2y$10$IyQkzK3G75avyWFBCm./B.qTtD7d10m0LTNoYWlOFgrysNlDEmfGK' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710261' AS nis, 'RAFFA RAMDANI MAULANA' AS nama_lengkap, '$2y$10$mbAmxjsjfU7pNGtllnh9HeYjH7JnSH2umAK/MJ/KVgcDHvFUYmDmS' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710262' AS nis, 'RAISYA PUTRI KURNIAWAN' AS nama_lengkap, '$2y$10$8CF6HPYvyv7UrW8TJHs0SOlJeLOHD5MjSYOyXKGjClpM1YjCNGPW6' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710263' AS nis, 'RAKA PUTRA DANTIA RAMADHANI' AS nama_lengkap, '$2y$10$YKOVXnePV6GJH4eLp4/EAuRu7k0wLmvW3GsoyMxqNdIBlOLMsEAPm' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710264' AS nis, 'REGINNA OCTAVIA PUTRI' AS nama_lengkap, '$2y$10$QuZq28deFddF5iqLDDUwHOGohfrlTpkJb5xd0737LSZRGj3Ji6AWi' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710265' AS nis, 'SAPA FERA SABILA' AS nama_lengkap, '$2y$10$YHT0v5c7kXHaXP.CDgmmoerVPBagoo6CbA5KlbXOAiTOGKBUV.f5e' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710266' AS nis, 'SATRIA LAKSAMANA' AS nama_lengkap, '$2y$10$fs7JhwziGnVLRkYDDDI.vOwzOrmTey7i9hhPXH4cuwd1imOGOypKm' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710267' AS nis, 'SILPI AYU SALMA' AS nama_lengkap, '$2y$10$bpeNusF8162Srw996vc35eY9fMMLQJRG5aOHdaxJyeFkV.cWFt/.O' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710268' AS nis, 'SILVIA PUDIASARI' AS nama_lengkap, '$2y$10$tM4Oz6IxC70utJksMyx/SOEFE8MrxbFHu3WnzG5Dl.bZfqeka4Jge' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710269' AS nis, 'SITI SHOLHA SHOLIHAH' AS nama_lengkap, '$2y$10$gw7eKDaLukc7JZ50yQZkr.jO1qvBC7tmoytou86MZ0.vFP6XA809i' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710270' AS nis, 'SULAIMAN AL AYUBI' AS nama_lengkap, '$2y$10$M0HpUpzlIkZ.FqCowMZHB.y2erCLYrtsFkzfdBKN2KFTCCTe6bjM.' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710271' AS nis, 'TABINA ZAINA NUR ROHMAN' AS nama_lengkap, '$2y$10$esPSdcuIUjIaBT0K383Afu2d39Gs9CG9nK1LSv976obl/ghb7vJHm' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710272' AS nis, 'TARA NUR AISYAH' AS nama_lengkap, '$2y$10$blZTRyCwg8Wr1H.11L3PVuv3INWSzVgci8/mtHw7VVv1Rg.vax11a' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710273' AS nis, 'ZAHRA INDAH DARA MENTARI' AS nama_lengkap, '$2y$10$Ki9y/8f4Bl2ron5dEtRt2eIxHFeVWxAbZif.ORX7R.fslF/m/QIAy' AS password, 'X-6' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710274' AS nis, 'ADARA AMELIA' AS nama_lengkap, '$2y$10$J3MbLv8ve.xzx/tLkvA7JuCnqhdzrVUWWQHFxUJzfbkee31WVf1ji' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710275' AS nis, 'AKMAL HAMDI NUGRAHA' AS nama_lengkap, '$2y$10$LE2/vojQXIuV6VYqXlZQMufaA5.QZyKC7n4DjyIRJl5WihtzrLxGG' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710276' AS nis, 'ALFIRA TASYA AULIA' AS nama_lengkap, '$2y$10$085DRwI0aOmkZzwKMYgG3OdTYUKoLGDsoF5bJ4qdCIkmqZM4ol1ui' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710277' AS nis, 'AMIRA RIZKA NOVIZA' AS nama_lengkap, '$2y$10$dvfC2RmCyoirJExOI.Bs3.KwKFkBK8yK4mNrW1dCYExCled2DGxKi' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710278' AS nis, 'ANDI PRAMUDIKA' AS nama_lengkap, '$2y$10$sWVBUo1O0tpVGb.e67ZdRumuXJA4SVYZSl6E8PctOhl8eyOVLk95C' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710279' AS nis, 'ANDIKA WAHYUDI' AS nama_lengkap, '$2y$10$Fnj1Kmy3tigRCYUNEXPPO.A71BqqtX0Q6kCIaRsYWRz4YCrCnD3YK' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710280' AS nis, 'ASTRI LESTARI' AS nama_lengkap, '$2y$10$2aEZVA0RNkPiZTddYFALJeu/3AP9yNfXEPTAAL0KEGoSKYk1CDx3O' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710281' AS nis, 'ATQIYA RIZKIA ARTANTI' AS nama_lengkap, '$2y$10$pkJCyj3qOpyCarJjnzcTV.miCr7FCOzstTSbtFT9mtYPqu.aZndXa' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710282' AS nis, 'BELVA LUTHFIA NUR AZALIAH' AS nama_lengkap, '$2y$10$HETmDWUxhMO2m5bJ8thMueUy7le5UBKhUkwRv9yXty9EKOLbc9BYa' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710283' AS nis, 'DAVIAN GIVANO SHAQIEL AL FAZHIR' AS nama_lengkap, '$2y$10$yThDiDIpZlwJ1Hcw/13cS.6WSsOtNJaB5K5OCNTfoP9zbGi24a0kW' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710284' AS nis, 'DEVA HERMANSYAH' AS nama_lengkap, '$2y$10$/vKr9muQhBVp2mqS2SccxuaRp7WXkDaTBRrqdanujY7VxniRfHgzm' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710285' AS nis, 'DINDA NUR AMELIA' AS nama_lengkap, '$2y$10$CFusI3iApl02tcEmbxCAbO1m73hWwCwk0ebhgW/qfZjHn4ZhUqIfm' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710286' AS nis, 'ELSA MEILANI' AS nama_lengkap, '$2y$10$ib.XTjBbwfBypOsAbT/8ze9G1y.xphlEwrW0d74OK8ZVue9aCL06K' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710287' AS nis, 'FANESA AULIA RAYI RAMADHANI' AS nama_lengkap, '$2y$10$br/53fURV0/RpWzYWitjJO4af3.joeBqjuCgxp.0ZfayPmL5k1/Oy' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710288' AS nis, 'FAREL FATUROCHIM RIYADI' AS nama_lengkap, '$2y$10$rNg9Q014CWVdEynFmX0Oze.6nRbZYX/sxIhPQG9VQQIub45oUuaEO' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710289' AS nis, 'GIO LAWERGIO SINAGA' AS nama_lengkap, '$2y$10$RpTfFUIwXmlyCbr0bXhT7uTGxAkfAS/zeF4XK.PFO44wXT.1GkWNe' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710290' AS nis, 'HANA MUBARAQ' AS nama_lengkap, '$2y$10$g2Yn5kfw5nCpvp3UfNVWNeiK3ZnEJIzuViX4g7E/wc9t55dRYJkmm' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710291' AS nis, 'JAHIRA DWIYANTI' AS nama_lengkap, '$2y$10$OAxtkealpYTamjfCq.4GhOvWU3szx0G9rTBHc.oq/ramwfS7rD4Du' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710292' AS nis, 'KARTIKA MULIA SARI' AS nama_lengkap, '$2y$10$rky40B7Kt6sOsHWX4SPNjO4B/pKML7SUTkRyBQMTtFUAz2Nf8wgPm' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710293' AS nis, 'LATEEF ARSYAWAL HIMAWAN' AS nama_lengkap, '$2y$10$oanaPLic.6j9oVki6Pn0Z.O3UwHBK2KVBwRgDS/ICZ2gJJC2KDtYa' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710294' AS nis, 'MAYZARRA ADIVA' AS nama_lengkap, '$2y$10$l7.hSjP4KoPj9dG9KxaTauMVNpWGMD32yhW2rdt4k..z2G6P.YL2O' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710295' AS nis, 'MELISA ANGGRAENI' AS nama_lengkap, '$2y$10$6sxOxzrIjNmcGviitfAPG.5mOotNFhgBDF58cNkow.gqZ0v.t8vbu' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710296' AS nis, 'MIKAIL FARRAS FAZA' AS nama_lengkap, '$2y$10$n58SrzN.JvfWR9llbHhUSut2yAjUrNaNFEsru.fMERrJudk/Et0qC' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710297' AS nis, 'MUHAMAD DELVIN ALVIANSYAH' AS nama_lengkap, '$2y$10$sGfFojZvbiUK9uTmIDQTN.RKZ.4Q1c8oBOiVwXUhcR3HD7W.Osv6y' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710298' AS nis, 'MUHAMAD YUSUP' AS nama_lengkap, '$2y$10$Oxou./R4bdJUf34Bla9kouR94B2xxtPM86mXcn88ImIfVuwNq25iy' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710299' AS nis, 'MUHAMAD ZAKKI NOER ALAMSYAH' AS nama_lengkap, '$2y$10$fXmeh9QojsL.ak89.1/eyuK8zH2Lq0aHIqtaQofbmw5mSZwe5wnCy' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710300' AS nis, 'MUHAMMAD ISYA ABDEE ARYADI' AS nama_lengkap, '$2y$10$39nsg/Obl9rCnxf4aX5qyuxbVgnMTNmPgnYeQTMt7HxuExH5ytZ12' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710301' AS nis, 'MUHAMMAD REIHAN SANJAYA' AS nama_lengkap, '$2y$10$1J15TJP25Lz6ceAAzOlXF.0r3Dd.re0O0wTBziElGj32i8qfDXdZW' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710302' AS nis, 'MUHAMMAD SALMAN ATAYA FADHILAH' AS nama_lengkap, '$2y$10$tRf5htlZ7FD5DoY80F/gk.WKsQJmLFRoSps7apzi3TNPLDEmoe0zC' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710303' AS nis, 'NAYLA SRI NURHASANAH' AS nama_lengkap, '$2y$10$yO1Hk.cQ.YMV/PauJuxtyukkETIwG/dQGD/dDhHGvtp7ad8.WmlXu' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710304' AS nis, 'RACHEL PRINCESS SITINJAK' AS nama_lengkap, '$2y$10$zBu67El4ak/.3JraQhiPyOMat/RQUPdadVS9GGxNnwnj4tEs7SEB6' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710305' AS nis, 'RAFA ALIF FATHURAHMAN' AS nama_lengkap, '$2y$10$a7GyUP4LlLesxf3uNuY5r.Jgi8jN8CYBnAuUqo2jNZCJ5awNZTV2a' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710306' AS nis, 'RAHMAT RAMADANI' AS nama_lengkap, '$2y$10$X78yTU6Pg5aHPO09erVc2eDTISSXEZIOFCCkok/kgORbNFMV0MS2u' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710307' AS nis, 'RAISYA RISKI YULIANTI' AS nama_lengkap, '$2y$10$0t7uQYplNQO0hnLQKExL7.dJ0UL1N7qGzDKf7ruQAqENjQRIzdJA.' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710308' AS nis, 'RASYID MUGNI IRAWAN' AS nama_lengkap, '$2y$10$UNWuLdoRooX.5nqLylnueOXYItTha86zd5YIIylH2gqe6m8gjNKoa' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710309' AS nis, 'RAYHANUL HASANAH' AS nama_lengkap, '$2y$10$7qjD.gsiPdLZjL/aYWZNVenWXbM1.pcdCuiusQzX.zxfy9uFPD8h6' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710310' AS nis, 'RIANI DWI SYAHWALANI' AS nama_lengkap, '$2y$10$/g67rqzEWgBSe7q8NDoQxO9/nT/ka45xVkxdj33.Bdgcrtgp2DEk2' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710311' AS nis, 'SAGITA AYU ANDINI' AS nama_lengkap, '$2y$10$sjhTu1upBud5P9Fe34o4ieuPmrSlD1IPjn.En75usfuPw9tHjMLIm' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710312' AS nis, 'SELLY OKTAVIA RAHMAWATI' AS nama_lengkap, '$2y$10$J6I8Ph.U6Ll/NH1Yljol1e8z.HHG1QptjFme.VBI1GZ5DjL5GOa7S' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710313' AS nis, 'SILVYA AZKA RAMDHANI' AS nama_lengkap, '$2y$10$yD3vBCo/hV0tKn1TJiAJ/.MXja58SLO0KtGNEawW8wtJUx3ZemWWa' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710314' AS nis, 'SITI ZAHRO AWALIA APANDI' AS nama_lengkap, '$2y$10$gbN/onoNmnoR2ypUAEz/6OLlPIlLHSZyOCgs.eUnyi0l5ZQmIFUra' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710315' AS nis, 'SYAHRUL ARRIZKYANSYAH' AS nama_lengkap, '$2y$10$cCVKN/0ZmLKPc341036Y6.c3fNi4S6EICgz/qZrMo3X97OSIqorrW' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710316' AS nis, 'TASYA AZMI TABINA' AS nama_lengkap, '$2y$10$MVw8p5aSEDcTOB5LreCWMeE8CyRJ7HzSCGDFMOQ4GsnFzd7mGRPdW' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710317' AS nis, 'TRISTAN SUPENDI' AS nama_lengkap, '$2y$10$FG4gVO/b9ex5B4l5xjQ.S.5vE9XPRfDfbkZiWqUbRTCcSMVbsiWOC' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710318' AS nis, 'USWATUN KHAZANAH' AS nama_lengkap, '$2y$10$YcY4f/heA3eTMXy9LM150ef8oHzyrtuNwD1ndt8JvZ2Su5doZUc4q' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710319' AS nis, 'YUSRIYYAH SITI NUR FADHILAH' AS nama_lengkap, '$2y$10$o/1RxavLlNjbPPxVXb3MUOPxJ6GPitKBM//psH4PlXAHolEbfk0ii' AS password, 'X-7' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710320' AS nis, 'ADITYO GALIH PUTRA ROMADHON' AS nama_lengkap, '$2y$10$9daGf0848bSS/qfMi.q9G.g1ZcsqH5POePhox5PJ4u9ag35TcQeY2' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710321' AS nis, 'AGUSTINA RAHMAYANTI' AS nama_lengkap, '$2y$10$T4DBpSnOfWCZhqb1va/QBe5r15ho3qmvmL70r9TSVUq0s81lYjxn2' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710322' AS nis, 'AKMAL ZAID RAMADHAN' AS nama_lengkap, '$2y$10$MNt8olZossXvRVh6SZKZHO7KuFreINvFLP16waN3/8Sq9WlC739Bu' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710323' AS nis, 'ALMIRA RICHIE LUTFIA GASANIA' AS nama_lengkap, '$2y$10$BQTpmWrxOUNU8r95uu.O8OIzv8AgEZNJzu4rhdFwsQQMvLQbyV7oW' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710324' AS nis, 'ANDIKA HERDIANSYAH' AS nama_lengkap, '$2y$10$rMBdWRA9E1tKNO2IFQNvj.9zdCLyFcUSGaarxs6Za7vBOS0pFQSFC' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710325' AS nis, 'ANNISA HANDAYANI YUNIARSIH' AS nama_lengkap, '$2y$10$f8LzLU37QwTaJV0IIHq32OtSoxLhpv/f9w6HXOFi2yocWGXDyoFqC' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710326' AS nis, 'AURELIA KIRANA FITRI' AS nama_lengkap, '$2y$10$7/D29HF0GO1/Gg6yPvUsQOxZeDTi9yEayIqyPv5r.KF8OLa2ksdUu' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710327' AS nis, 'CANTIKA ZAHRA ASYARO' AS nama_lengkap, '$2y$10$6QYMQ.Ua3oNGekLGBLPSBedGCPtaMtaDwUKrae/bQ5ppMnrNj7fAW' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710328' AS nis, 'DEBBY CAHYA FITRI' AS nama_lengkap, '$2y$10$47JUmG7/j6bXZ3J1jrhmnOuYLroExCvHKcp8uKhgh8eS4QgkLGW7e' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710329' AS nis, 'DERI REPANDA PUTRA' AS nama_lengkap, '$2y$10$lP2tnsvBcYy6/LC2yxbJJu899L4vhSNJalVvx2qUJ4l/EbVi0GOPS' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710330' AS nis, 'DWINTANIA ZIELAN NOERASYWAQ' AS nama_lengkap, '$2y$10$tKD2nRp28nWyLrFR/.Lr3eG/nRl5rDffT6/lDlWmKCBVYskEM4hnu' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710331' AS nis, 'FARHAN IBNU SAEPUDIN' AS nama_lengkap, '$2y$10$M2zMGm4UH2U8ibxaQ4tIZOBLb5TY4qO.DT1oGXRi5F9uhYBvMutwO' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710332' AS nis, 'FHARRAND HAZEL ATHYANTA' AS nama_lengkap, '$2y$10$JRU0I2YW9X64WtuhkcDlP.wfzDOCNS0XxvnI3jX9/5rTCdijx1rWS' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710333' AS nis, 'FITRIA RAMADHANI' AS nama_lengkap, '$2y$10$YMCsyQqmNeQD07UgAjJpsukw4YjUSmK9Lv6R5McgZbkm9s9p/zmq.' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710334' AS nis, 'JASMINE SEICA NOORISHE' AS nama_lengkap, '$2y$10$HXXTfXhtwER9ZEZO7ugX0.0AITVut5a/gqRrEa7AWovMJOumT19xS' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710335' AS nis, 'JENNIFER PUTRI DUNGGIO' AS nama_lengkap, '$2y$10$ZIVMVXwFMWJklSLR5rws9urAE7hV7buMH9CxgGh6E2e4GtBhipV4W' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710336' AS nis, 'KAYYISA GANIA AFRIN' AS nama_lengkap, '$2y$10$sVa/fDnbHexmlnsyLuHBzuoj2t/loohEMiXnA8BTE4bGNoaTSbBIG' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710337' AS nis, 'MARTINNIUS HASUNDUNGAN' AS nama_lengkap, '$2y$10$/LvbAID6CKx11h6N5exkQeTd2sN.sZ1IdCUbySLEQSnmfPakndddK' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710338' AS nis, 'MEYSA PUTRI ANISA' AS nama_lengkap, '$2y$10$8AfOA9GUKGfpHPd.ffk4XOqWw7BlGkwzxFPr9KKFyy4jYrb1588D.' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710339' AS nis, 'MOCH GEMA PUTRA' AS nama_lengkap, '$2y$10$9uyFvY7anK/EN1XjBGVBeOgp/i1U6xjHYFkmbeXhFMfvKGMXK1Bsa' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710340' AS nis, 'MUHAMAD FATHUR ROCHMAN' AS nama_lengkap, '$2y$10$FACY7/0IL2dc17FLoefZ0e1b30duowgR8HQ8SonLFaoMFFRPbnWpW' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710341' AS nis, 'MUHAMMAD AGI PUTERA HARTONO' AS nama_lengkap, '$2y$10$.jAbnIapDmdBuROVdfh9autLqrtozhWa0.vVGuGNvEMQ2exUYLkm6' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710342' AS nis, 'MUHAMMAD AZAMY KHALIFA' AS nama_lengkap, '$2y$10$XjBgwpqQyag8YlT7iEDGzOEUO6FV3FIu.UB.mP1z.qqOoGOfN84cy' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710343' AS nis, 'MUHAMMAD YUSRIANANTA' AS nama_lengkap, '$2y$10$W/Rc0PSNGGmZC0fNT08tF.A0Uru9oRqpXc43v2drIUNfj0xmziLvG' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710344' AS nis, 'MUHAMMAD ZAID AKBAR' AS nama_lengkap, '$2y$10$A92pexzF7gCMruy5ckzifeeNj4DuWyG1qjR9rrKlqxv60q4BBN.3S' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710345' AS nis, 'NABILA KAMIL' AS nama_lengkap, '$2y$10$QdAmQlfsALJRiQ433EkN6eutpZ5S5B6RHICuVieZYNQoX5E6hKqHG' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710346' AS nis, 'NAJMAH JALILATUL `ULYA' AS nama_lengkap, '$2y$10$Fr9jvkhp.n47UqFGYi4IQOfNktuTm7P5MdFjPskBNb05aHjd69jCi' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710347' AS nis, 'NENG RAHMA' AS nama_lengkap, '$2y$10$b7YZncp3oNsKO59s7rRuF.fizcosaGftcSNTONGa6EfyAJkic8p4O' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710348' AS nis, 'RAHADIANSYAH NUGRAHA' AS nama_lengkap, '$2y$10$McSlqGj2iJCP3eJaVmMQcONDohG3p8UUw0g/DNH3TSnPyUmq1y7Ie' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710349' AS nis, 'RAISYA ADITYA HERMAWAN' AS nama_lengkap, '$2y$10$Ceywk8FLz47M1WNkPmDqQubIppQ5uZgMdnrTYS./VKo//xosTJbaK' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710350' AS nis, 'RAIZA FAKHIRA HABIBATUL AZIZA' AS nama_lengkap, '$2y$10$IrAxyxOsaYYpkGfp831iZOQ7EyMbxQ5byiTMZ6til.PBiB9./Kr1G' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710351' AS nis, 'REGINA PUTRI SYEIRRA' AS nama_lengkap, '$2y$10$X/cRDygLwCH0FRRK5/yxmeksR.tE4pEJq20HXxmr5eRYrEfMj4o9u' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710352' AS nis, 'REGUEL JULIANDRI SIREGAR' AS nama_lengkap, '$2y$10$h2NsuYXFAnNk/WQaMUuecOogTNzQcS5EVawXu8h.aTVD2ZdVg.LWi' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710353' AS nis, 'REVANIA NUR MALIKA' AS nama_lengkap, '$2y$10$mPnwEz/1VzNxyqfarAd4Duvpb8Eht3sYaSzHFEbhicBjJyTWF4AFG' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710354' AS nis, 'RISTY SEPTIANI' AS nama_lengkap, '$2y$10$Al0C3We59V1.5xql30OCgeDICWfGmIvItAaCFLFVoEzzl7umZzwqG' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710355' AS nis, 'SADDAM RANGGA PRATAMA' AS nama_lengkap, '$2y$10$VPwFfzcrA2qnEMFs0SmHHOTp9.nBolgAeJ5NXvNCrVh8OWeSORFl6' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710356' AS nis, 'SASKIA ARTIYANI' AS nama_lengkap, '$2y$10$trSYybL1fHGK60urn5YXdOptoUOKPgRghLCfozo7311clBJgY4/6C' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710357' AS nis, 'SATRIA AJI PRATAMA' AS nama_lengkap, '$2y$10$WCobItQ5GRaYZFZ7e/BXH.pzwPP8Nh61UQ.cBZ7OkXV/MI1CWAnba' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710358' AS nis, 'SEPTY AMELIA PUTRI' AS nama_lengkap, '$2y$10$icTNl1euHr7dxBx3vyJpjOS5jGoxOIopsXfgod9PHtJDWbYA1Eq7S' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710359' AS nis, 'SINTIA MELATI HUTABARAT' AS nama_lengkap, '$2y$10$X4OJr.73aalZQuUr/IXRkOf3U2K635V8EuIk09NNT6d0ui96Buuh2' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710360' AS nis, 'SITI SISKA NUR ARROJIAH' AS nama_lengkap, '$2y$10$5o2TcgIZV5CIgB4Qr8dfROM0fDzcecalXt3qQVLfB2LJgawi2eOuK' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710361' AS nis, 'SRI NURHAYATI' AS nama_lengkap, '$2y$10$btMTvkslDgA9jveFbazfEOcMUF8Q8B6DM6zeM/99aTuktkA1NaEuS' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710362' AS nis, 'TIFFANI ASTRI APRILIA' AS nama_lengkap, '$2y$10$tVpYrw2riUX.GZkHy.3aSeF1YQF8ffq9yw3sU429bU84f/JV8ZsdK' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710363' AS nis, 'WISNU SUSENO' AS nama_lengkap, '$2y$10$KOL4qeC2HyfOPc1imts1meMaMAyOyDFPfo97dCi0x9i9M7N/nvMbe' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710364' AS nis, 'ZIVARA FAISAL ALDERY' AS nama_lengkap, '$2y$10$1oh8qivjbbBZQEC3kbz1Fe5V55fVHlm33zL5IAQDZ4iyBN0OosLra' AS password, 'X-8' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710365' AS nis, 'AKBAR HUSAIN AL KHALID CAHYA' AS nama_lengkap, '$2y$10$Xd.FEF.fqrKU6AUmPrflBes9g6Y2NW35VmRZdoPRuz5XDq5Q8.ciy' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710366' AS nis, 'AL BIANSYAH FITRAN' AS nama_lengkap, '$2y$10$B/W/tQTL2ehAW40JgPn2tOoZKGDcB4RWiUNYRFEdgsDDcE4y457/.' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710367' AS nis, 'AL JALUDIN AKBAR' AS nama_lengkap, '$2y$10$VbKCcj8rc3V3BAFTTeaIJe1SeZcqMoB0eT2W/3WCaaS1O/3fPhaIm' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710368' AS nis, 'ALHANZ NOER KARINA' AS nama_lengkap, '$2y$10$MvB3CUooppKv1bd6N0ohaOkYukbN6M6jyDueRH10IHBcD8KMYou4C' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710369' AS nis, 'ALVINAA RABBANIE' AS nama_lengkap, '$2y$10$z69KsIsyh6dUZq50uYUDZepJz46lt2YR53SrwOc6wcavO4NYKLDwG' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710370' AS nis, 'ARI SETIAWAN' AS nama_lengkap, '$2y$10$sZXGqDnH9FLtkVu7FmfjS.awLzB3OjxP1fpBJDcnAeyEoF8ilEQca' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710371' AS nis, 'ARIN SITI LUTFIAH' AS nama_lengkap, '$2y$10$YFg2o6egtSvVoUl/PVwAp.BnD6aHe2izpwxz4UlZ9C4QFEi4SbKOG' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710372' AS nis, 'AURELLIA DWI PUTRI SURYANTO' AS nama_lengkap, '$2y$10$zlPfbm/YnQlh75906IUs3eyyxcKXt6mc1tCSAb1DswmDQ/xaIoEx2' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710373' AS nis, 'AYRA RIZKIA AHMAD' AS nama_lengkap, '$2y$10$6ooa3SaePjm.gIxWi8A3pOrKgdriYUUrUJtj9goFLRcIHmquFplyC' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710374' AS nis, 'AZZAM ELNAIZAR SAMANA RIJALMI' AS nama_lengkap, '$2y$10$G5kqpFbKaLPixEwYEkgX.O12Sqfg93Z9lHq0yY9HpA4fc.t8JPl8y' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710375' AS nis, 'CLAUDIANA SAHARA' AS nama_lengkap, '$2y$10$LX8jtD5zCl4enK3d1qykT.bUT665MarM.3WdUhOzQWiIk56J7qOiq' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710376' AS nis, 'DESI NOVIANTI' AS nama_lengkap, '$2y$10$/8q2Fyqj/RVfQdWNgj4vm.g1I2AFTi1l95eP35M6.STuhkPnqdAkO' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710377' AS nis, 'DEVIS RAHMAN NANDANA' AS nama_lengkap, '$2y$10$iCrXfPnJ5sU/r83dIx.7kuKP.yZovGaGNlsvOarcxV/Cq2kIjjeU2' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710378' AS nis, 'DZAKIYYAH NAILA ZAHIRA' AS nama_lengkap, '$2y$10$CrXhvgL2XO916q2AtF59R.6QzIqGRwc/T6XK8DEQQa8ewI2jtBAl6' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710379' AS nis, 'FATHAN RAINURA HASYA' AS nama_lengkap, '$2y$10$hrlw1sdWo.tjRVvF9PLAaeM/wmjMAqPeo0XpNXLVQMU.J4QwH3Z7q' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710380' AS nis, 'GARRY RAIHAN FAHREZI' AS nama_lengkap, '$2y$10$ht1gIE4jTp059m81Jn7IieWSZmHJJSdeeq1BlELjEuqqBpfZM1mAa' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710381' AS nis, 'GIYZA ISNANIA ZHAIRA SUPRIATNA' AS nama_lengkap, '$2y$10$cczoh22SeVK.b650wf39/.5gzVaK/tUqTEEdTkk3aWEv8WkHDtnhy' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710382' AS nis, 'INTAN NURHAYATI' AS nama_lengkap, '$2y$10$bA8Com42fVdEncgW3tTZeevCwe/n9kU9FSmLysHlUEn0HVJvugqBq' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710383' AS nis, 'JIHAN SALSABILA RAMADANI' AS nama_lengkap, '$2y$10$3aSRgU5I65.MVPyKbDWr1OLNVguP7IEQsFFH6/HB1RWEE3GRKt1O2' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710384' AS nis, 'KEIRA AL SHINA PUTRI' AS nama_lengkap, '$2y$10$fpQRX2kzgqGUUcAxFnDzquK1XgT85I.52BuvBkgjuML8RNlq9GorG' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710385' AS nis, 'KEISYA INDAH KIRANI PRATAMA' AS nama_lengkap, '$2y$10$lKPX/QdqgcfDVWr5hAVoAOYD1bxVEHnV8YXEJzLU6FMdKZdbv3tou' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710386' AS nis, 'MOCHAMAD FAUZAN MAHESA ZENAR' AS nama_lengkap, '$2y$10$pFCSJ6tae0mmKbZ1.yRUnuRCDE1AuZj383XJyiOpPZlZ6E1oiJ/ym' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710387' AS nis, 'MUHAMAD FAUZI AL-MUZACKY' AS nama_lengkap, '$2y$10$qdFc91nO750lANqlHq5XU.SLpiYdVQzc2AYuNvYleiW3fY.kewApi' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710388' AS nis, 'MUHAMAD IKHSAN RENALDO' AS nama_lengkap, '$2y$10$d8Pu/zvEdsiP7jCRe0snwuHKWROqCs55YLQtYzjXc0JIDCr860kTC' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710389' AS nis, 'MUHAMMAD ARSYAD' AS nama_lengkap, '$2y$10$xMcDEQPJLtkvBb54MH4qreBJyZQ5bDftZMl447FYfHNYwzC3e/mmS' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710390' AS nis, 'MUHAMMAD BILALDI ALFARIZKI' AS nama_lengkap, '$2y$10$fMdqCH9nCGIFhGLfleBQnux7fhHJWUqrzlJrkE9Yu5dxYZSRTBRaS' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710391' AS nis, 'MUHAMMAD ZAENAL ARIF' AS nama_lengkap, '$2y$10$z9zSacX/gkaLwI1SOsttyufScuQJ26/p.Pft2x5TqzrGc1n.VXtNG' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710392' AS nis, 'MUTIA ALBANI SETIAWAN' AS nama_lengkap, '$2y$10$Vl1hIchfx3l6dy/VsUP9leGq0abeC.UsPtP9BjZc8DmOZi8aVnL0a' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710393' AS nis, 'NABILA MULYA PUTRI' AS nama_lengkap, '$2y$10$GqCFMxsTbYzUH54LK2hPCuAMW1O8rdauohUbaI4JaTjRQRFZB7AgC' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710394' AS nis, 'NADHIF FATURROHMAN MUWAFIQ' AS nama_lengkap, '$2y$10$eY62dehGqNsG7fqOAvZ63.AewVs1Q3BV5XrFZ5CZNvzi.K3ZRemgW' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710395' AS nis, 'NAYLA AL-GINA PUTRI' AS nama_lengkap, '$2y$10$jkvHzUmOJZNndxLUWxc1teNrpDP0f6yji68.k1Y09tn4saTGxmvGu' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710396' AS nis, 'NITA KAMILAH' AS nama_lengkap, '$2y$10$95KLGJPatdOxRooqWZd0w.8yrCCR6GpYCMg4clvJMYW02V5LZDkFm' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710397' AS nis, 'PUTRI AULIAWAN' AS nama_lengkap, '$2y$10$FdtyoT531CwKajkv8EeK/uLum2J9/GsuiHrU17EXjrLe.D3r8c43y' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710398' AS nis, 'RAHMA ALIFIYA PUTRI' AS nama_lengkap, '$2y$10$Xa7LSgxSZw96jEPhWHkQtec60er46mP/rlScD4/BrwojPBO5.vuju' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710399' AS nis, 'RAKA SAFEB DIRGANTARA' AS nama_lengkap, '$2y$10$y.AmA8x4zRNLvLsQGVtFau2OQCgtIcmMEQNlR5OHssLAlNecMz7vG' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710400' AS nis, 'RATU KHAYLA YUDHA' AS nama_lengkap, '$2y$10$560f319YuwAIz4kjaaOJ9umRZ9Nfnb5SObrDBtaG5yjhvk8ZsC2fm' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710401' AS nis, 'RAYSHA NAYRA PUTRI' AS nama_lengkap, '$2y$10$hXh.ctvh83AbCfZmUp50QOO6taWG014mRC8vtj2TUG7CIK1KI21h6' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710402' AS nis, 'REFALDO ILHAM' AS nama_lengkap, '$2y$10$bjHC.APUHlpFay8SiO5baOMyPwkU5tdoL65WUlteBP4aPHLU4NXdS' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710403' AS nis, 'RIFFA SYAHWAL' AS nama_lengkap, '$2y$10$7mjKnIobveZ.kkpaVMwrreg5Jssx8cWUGoK7hSb.YGoG0JfO4X0ma' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710404' AS nis, 'SAHA RINI' AS nama_lengkap, '$2y$10$Bkf.7hEhi3A2vVK.eTuGn.SAo02GmGnIkTVQrj4Xb0CvCKvhXlmhq' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710405' AS nis, 'SIFA NUR AINI' AS nama_lengkap, '$2y$10$ryzKcRq4y2ZkTTx1xCpiu.V5D2dOtOEA6jfCSNCxaA/aWAViGOCne' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710406' AS nis, 'SRI PUTRI HOIRUN NISA' AS nama_lengkap, '$2y$10$HCP/rFl1d1GO/m1LONHINuazdbSrkk2BhsNlgYxj9qPZf.N4fPLJ2' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710407' AS nis, 'SUCI RAMDANI' AS nama_lengkap, '$2y$10$DbjERxG6qSCP3Tndijv./.ojXHnc7M9RrcisorcRc/FSkQZLEootO' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710408' AS nis, 'VANESA PUTRI NURAENI' AS nama_lengkap, '$2y$10$gra6sZ/X0nzBucqWxhT0nu2/emT4IBxpb0pMgWbnTc4M1dUDVHpiO' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710409' AS nis, 'VEPEP ERVAN MAULANA' AS nama_lengkap, '$2y$10$wfuhFvKXttHh8SMe9Sc1GOVXU8DzW9hBnfTEsyC4LeGHuVtFfng0i' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710410' AS nis, 'YOSEAS DHANDRA MANAHAN SIMBOLON' AS nama_lengkap, '$2y$10$GM6ZmSDRVqaVH0e4UZrcvuVb4P0XkOADsuKTAvKpD5dXE/MTZUV3W' AS password, 'X-9' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710411' AS nis, 'ALFARINI AFRINSI' AS nama_lengkap, '$2y$10$XkrSKduU3bSx4RDkaaFm5OVLLEOt2B.dUCjbGyYCnv0oX5Y1215vq' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710412' AS nis, 'ALI DANENDRA WIDYADHANNA' AS nama_lengkap, '$2y$10$GShhQZzfMIslmY7yHLcId.5YWxEJucZAgM7pAAkpbnmwWpEDGUgZ.' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710413' AS nis, 'ALIA PUTRI RAMDANI' AS nama_lengkap, '$2y$10$vI0im9p/FhLMuuW4sm/qnezkxBjNmJnbCCtnRujs7e96qn5QSPefG' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710414' AS nis, 'ARKA RASSYA ILHAMSYAH' AS nama_lengkap, '$2y$10$Dp6aNOd7SpuB6TEEAbG/RO.lGapE.YV5Y.0xPYfTN5StBS/Qdel6K' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710415' AS nis, 'AULIA AYU LESTARI' AS nama_lengkap, '$2y$10$K9as8p3.CCgxCTUBnd4Wx.NlJqHghfGrVJFQURP2FU39vt/fLYmcu' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710416' AS nis, 'AZRIEL AL HABSY' AS nama_lengkap, '$2y$10$I2y41AlpiyPHWw2iQX9..O9mZ1ii11qZXt3B9RVfafJ8OCaZKdTwq' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710417' AS nis, 'DANELA MOESLEM' AS nama_lengkap, '$2y$10$p7aGzagSQs4qmK.UXDyH2O7rc3oAJNFLWc4Vr7K3eYUWeiGWmldI6' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710418' AS nis, 'DAVINA MULYAWARDANI' AS nama_lengkap, '$2y$10$nqheuuGbn8UFU0K/T2BbYeUBqHswnRrYFVODkXzQGweog/6Gq0Ln.' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710419' AS nis, 'DIKA ARDIAN SAPUTRA' AS nama_lengkap, '$2y$10$c2H5EqD4fr3921vQakRM.eGQf7Oh8XLwsLexfmayjkm/rXaRycbA2' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710420' AS nis, 'EISYA LUNITA' AS nama_lengkap, '$2y$10$HbtPpJrSJVjB.7Hu.ParSuVZ/7j2DFGraTG37Ujr1AGK9duM/AJR6' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710421' AS nis, 'FILIA FAKHIRAH KRESNA' AS nama_lengkap, '$2y$10$I/.B7EblH1OXYAjdGabX6OTGTn3bwk.HEToRx4rFHFVo5RXKc12PS' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710422' AS nis, 'FITRA SANDIANSYAH' AS nama_lengkap, '$2y$10$/sJaijh8yN2hOjrOv0Xwh.JT0xcjUdOWENV2t1VUAudf7wHNU3haG' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710423' AS nis, 'HANIF MUBAROK' AS nama_lengkap, '$2y$10$Lmo15oV0Vmfd7jixDrC9f.jWJQC4hlNaw6YIog5ZRbi06Fm6OcZvq' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710424' AS nis, 'HANZALAH AL GHIFARI AMR MUJAHID' AS nama_lengkap, '$2y$10$xwLtHzYKAVZK/afalBKTxeOX22EtzS75OWkVoD/VOnGx8oawOl92u' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710425' AS nis, 'INDI RODIAWATI' AS nama_lengkap, '$2y$10$Cgr6GBkIkJxwe3vMoL37tO0NOpU/YKAA30Uq/kbt9WHRva8qR0xTG' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710426' AS nis, 'KEISHA ANJELINA PUTRI' AS nama_lengkap, '$2y$10$UWjj.Pvp0VoBEQ/aJ0MA0ewf3K2EyaZmJSpPanSfSElMP6HPPqvKS' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710427' AS nis, 'KEYILA SEPTIMA PUTRI' AS nama_lengkap, '$2y$10$.4Ff0mlF0SlubRoUb42djOx4tOdNL3vu2fLbhAHGDLz0lC8rx3XcS' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710428' AS nis, 'KHAYRA NAUREEN NESYA ANGGARA' AS nama_lengkap, '$2y$10$64XnqZAJo.K122ZvD86CO.yVn8cpPuU82hsxG4Lx8JVWbPs8XVtGG' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710429' AS nis, 'MARSHA BILQIS PUTRI GUNAWAN' AS nama_lengkap, '$2y$10$5qzjFygxxJAk7MnvAjLvi.FdIa/TAGxO1h9dk2ZT.9Tscn.a7UkvK' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710430' AS nis, 'MOCHAMAD IQBAL' AS nama_lengkap, '$2y$10$NQj74goLIhxVWo/LL2/jWOzqvdQzRyYxxyUYPmmxd29X9KAxfYnK.' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710431' AS nis, 'MUHAMAD HAZEL ADIKA DHANA' AS nama_lengkap, '$2y$10$2ezdCSUGmmyC94jvsrXUCuexsYDaKvVSA/o/PICxyr5KGYPjwl67O' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710432' AS nis, 'MUHAMAD ILYAS EKA FAUZI' AS nama_lengkap, '$2y$10$zhhQSaTjGFpZNQX2ca/gQuZ4zx0srFn7i9KJKiGf5yHxTYenXN0Fy' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710433' AS nis, 'MUHAMMAD DZIKRI TAUFANI' AS nama_lengkap, '$2y$10$8f/Ng7351D3ZAMSPUfDST.KzzzksJ2EfXLCnP4c.0GK/57Srambvm' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710434' AS nis, 'MUHAMMAD FAISAL HIDAYAT' AS nama_lengkap, '$2y$10$g68MGkSKJwSjS5XpGktG/uQ7CRquuq.sFLZJtFzYG/aSeHe7iZJzy' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710435' AS nis, 'MUHAMMAD FERDIANSYAH PRATAMA' AS nama_lengkap, '$2y$10$80O8jQJB/UVxEkebSYuAPufoYZj7rdHGPg0ymZdZyW3QcKAawUmj.' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710436' AS nis, 'NABILA NUR ANGGRAENI' AS nama_lengkap, '$2y$10$z0zmEkqu3u9omtUUR8dawedBQTFeeghDeCmuJgenzlIFosWa.miOm' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710437' AS nis, 'NADIA DWI NOVITA SARI' AS nama_lengkap, '$2y$10$jZ.bh7MvFk5yiOY3nKObtOdiOVcuOpe2nKa.9EfAlwXmENZaIQ302' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710438' AS nis, 'NAILA NURAINI' AS nama_lengkap, '$2y$10$8qb.rX1w9V66V2r9NPrlI.Kk20ZisyEhvU4pwpJSIIkYm3LW.VjDS' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710439' AS nis, 'NAJIB ALDAN PERMANA' AS nama_lengkap, '$2y$10$.yuJ3EOJ0hzi9hnuxYNkduPKa6FYl1QCIi1rUd8LiwjvJuYkJ3JLy' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710440' AS nis, 'NENG QILLA SITI MASBUBAH' AS nama_lengkap, '$2y$10$LwYIhx933hmzLoKzUPpz3ONC/H.3D.Fiq59geb0/QKRpAnkX6TocK' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710441' AS nis, 'NOVA REFANI' AS nama_lengkap, '$2y$10$L5e.qQM0T0edZHNWqOwrc.l0jx3FN3Gd5G20XYuiYO97qxWtT5tc.' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710442' AS nis, 'REGINA RIZKY AQILAHUSNA' AS nama_lengkap, '$2y$10$KSX/S9SXuWTPchCRg584HujJ8d/fKbo5SV0L41ZjVfaK.FZc5j/hK' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710443' AS nis, 'RENDI ARDIANSYAH' AS nama_lengkap, '$2y$10$5S3zZlX9v1D3bN3Hw1GKPO5yOozGHVx9rUg88gAePbEIU0csV5LS2' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710444' AS nis, 'RENGGANIS ADINDA PUTRI' AS nama_lengkap, '$2y$10$wk7cj6E3gauBjUHvnKffmeh.NE7qnnqLWeBUFCDCxj4kYc5MuY9wG' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710445' AS nis, 'REVANO RIZKY PRATAMA' AS nama_lengkap, '$2y$10$nhSMBaf7ynvX/tfj/5xInOtT0ZEsBXw6fiCxKQYoM6HTXdtIlwsmK' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710446' AS nis, 'RISKA NOVIYANTI' AS nama_lengkap, '$2y$10$EWR3jhbB95Dqw.oGSpKXre6HHsBm7EoXWTGkbPKbvVlJvzb2V4FlS' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710447' AS nis, 'RIZKY FEBRIAN TAMSIRIN' AS nama_lengkap, '$2y$10$AzMF2qs88cykBJKCp0AbfevDH8SwBm8Nc9kd4peveLDwPIVp4qhNi' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710448' AS nis, 'SALMA RAMADHANI PUTRI' AS nama_lengkap, '$2y$10$DGKcCPATcWIEpOUugGWiweESb6PIJ/DqAdlSbJGRdgWUNQzXEvCni' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710449' AS nis, 'SELVINA WIEDYA LATIFFA' AS nama_lengkap, '$2y$10$1yLapVnZxUjr3z9nC5Wjie7ks4fRycoehPlokKyaUKvWL.3g.hrxC' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710450' AS nis, 'SITI ALYA CAHYA KURNIA' AS nama_lengkap, '$2y$10$2dI07TyKoC4uEzcgv4kKQOZNAJQxKKVYNLTQLv2kvptXQ3doRClpe' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710451' AS nis, 'SULTHAN DERI RADITYA' AS nama_lengkap, '$2y$10$cDERLIc3VdTvubJbShQD0OZKQsymTVZEW1q12TmwIdKcWEaHO8ldG' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710452' AS nis, 'SUSAN CINTA APRILIA' AS nama_lengkap, '$2y$10$m.nndSseUAJftxyUf.wmuuDnOOm8SnDbRidNY1CbwcV/PQ73RvmHe' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710453' AS nis, 'TASA FATIMAH AZZAHRA' AS nama_lengkap, '$2y$10$W5DZUhNZ/XgIfTe5UqpG4e477oS7B9sU0xFFypF.1Frdza1ftE.My' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710454' AS nis, 'VANI ROSELA' AS nama_lengkap, '$2y$10$KDUUgYA2ItisAvd.quwvuuZUSjuty6/iSbM2o6wjzKxGkbqyJwVaC' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710455' AS nis, 'ZIHAYDIN BADAR AKBAR SALAM' AS nama_lengkap, '$2y$10$Fs3VsKkcyXHDxjDEASy/UeTy7oUQLwz8caR2F/jrzxGquB9ng1.oK' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710456' AS nis, 'ZILDAN BELVA PRAYATA' AS nama_lengkap, '$2y$10$L/JjIjApVm3Wi1a/F3ImIOVRUxgkaJCbS4GzlA2LHIVqitryAfjCK' AS password, 'X-10' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710457' AS nis, 'ABDULLAH ZAHIR' AS nama_lengkap, '$2y$10$GUIaWek/z8MGDQL86sfbAeUCo1HuTiKxJQ9fLojV/gkVoJlph7LCi' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710458' AS nis, 'ADITYA BAIHAQI AL LAIL' AS nama_lengkap, '$2y$10$zxffsUw12PzoLkPuVe3rR.tprVpDKpkeB9DD7L6xdih97iN3a4Nr2' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710459' AS nis, 'ALINA SUKMA' AS nama_lengkap, '$2y$10$.uvTLQf3waqU03s3qCkuveXYvqhYZDmww/YTSPMoWhIcx/t9r3j6G' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710460' AS nis, 'ALVIN ILHAM RAMDHANI' AS nama_lengkap, '$2y$10$vF6JQC39cOUSwTSkd1av2.COFdSLi0oWX.ZdIYxiRRG1Qc5cp9czu' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710461' AS nis, 'AMANDA TIFANY PUTRI' AS nama_lengkap, '$2y$10$aPYHlKnj5FvsSs9hpB.pQ.YcZXLI05JaoNdMIVXeu9.nfr1GLAb.q' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710462' AS nis, 'ARY FIRMANSAH' AS nama_lengkap, '$2y$10$hFBpt2vOAKITRutz/qU6ielw7pGfzjh2SQ3hV17cBAWfQFko.6oC2' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710463' AS nis, 'AYRA FAZIA SHAFANA' AS nama_lengkap, '$2y$10$pX8V.sAhX0LlUSW7mdqIEuN6NsnDVGClfvH9HjItZ7osdrY8A0axW' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710464' AS nis, 'BIANKA RAMADHANI' AS nama_lengkap, '$2y$10$SjWUFKCCKX/0N8CZm4KN6.cN/ByZl0B3.GeXfhplORZ6iyvGM.DiW' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710465' AS nis, 'DAFFA NAUFAL RAMADHAN' AS nama_lengkap, '$2y$10$wzgCspbkZyE8XaxFIOZy0Oz2vnCtOelaCXvSlq.Bz569oh8yWBwTe' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710466' AS nis, 'DEDE AWAL NATAN RAMADANI' AS nama_lengkap, '$2y$10$zNITJBYlD/SC2MW2cXZZ7OUnFniRwDLmGX9B/E.luGx5VtKt0QzP.' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710467' AS nis, 'DESI ROS AZHARI' AS nama_lengkap, '$2y$10$KYjtoHrP8LGC5fpQ5RfvAOUDdTKSjIx8yQWXJp0kWczlIdyVyjV3G' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710468' AS nis, 'DIKI ARDIAN SAPUTRA' AS nama_lengkap, '$2y$10$YYDK50Bn/pA8yFB3rMcf2..6WRo0ZZbxj98FY374EH0uWExSpWzJ6' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710469' AS nis, 'FIRLY WIANY PUTRI' AS nama_lengkap, '$2y$10$rQzg.Yct7TUz4s472Wbkf.Ez.DiVzLt3FA9dVaUuiUSIAerUYM0p.' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710470' AS nis, 'FIRZA AZMI IRAWAN' AS nama_lengkap, '$2y$10$3ppT.2KcjmS13dgIt0DYdeMqYMIixX0HIOr3uCLuGHOylz/JmC33K' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710471' AS nis, 'HAFIEZH AS SALAM' AS nama_lengkap, '$2y$10$.p2nG6Y4y2OBarYs/K9mMO.Bf.uAMfCcUNiTpkltykRH7RRR9K882' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710472' AS nis, 'ISMI QURROTA AINI' AS nama_lengkap, '$2y$10$BtmxepcTApUi.guXLlfNVemUPXYtwsXB16mYwdP3hBOZkI9A64ZZq' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710473' AS nis, 'KAYSAFA NABAWI HERMAWAN' AS nama_lengkap, '$2y$10$y.qfwE4Qgr33V2O97SPHGOoLt21Q.9yDgavnhDNPJvEB6RenH6XR.' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710474' AS nis, 'KEYLA KIRANA PUTRI' AS nama_lengkap, '$2y$10$.93ZwgxDR5JTtgaXiOIcquXcyai.X0pUjH148PZhe1sQAfXzq7gtq' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710475' AS nis, 'KHARINISA NUNGKY ASTUTI' AS nama_lengkap, '$2y$10$rn4/a37aMNvKYTRWx9dcjOBi6GB8fSRzizh0886jy32uQ4MBGQNN.' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710476' AS nis, 'MOCHAMMAD DHESTYAN FICKRY' AS nama_lengkap, '$2y$10$ZSQLApNLTGJwFvnswLQZ9OcyKEAgVO64EDJyL0k0gqEzlZKqKuTDK' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710477' AS nis, 'MOH. ASEP RAMDAN' AS nama_lengkap, '$2y$10$GayVdAvOAlL0pY72UvwHv.xxh5bLDPvLSj2WjH4YpOdxwuL5jRWPi' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710478' AS nis, 'MUHAMAD RAFA RAHAYU' AS nama_lengkap, '$2y$10$MuytxaCfQ0x0368Lh2TEIOCUz.JZ5/xpl494vxDkSC.HFgpkPgfG2' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710479' AS nis, 'MUHAMMAD ATHAR HASANUL WAFA' AS nama_lengkap, '$2y$10$m8/5uaNCGJdRqa8jFV4dpOkBzFpi/UvVscwLxTCaYq9agLkwpZVGS' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710480' AS nis, 'MUHAMMAD FACHRY PRADANA' AS nama_lengkap, '$2y$10$UiHUxFvuRFzyDZOCnJX/KeA6.qsVAi.gPloTSa4wFulIlz5HSG93W' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710481' AS nis, 'MUHAMMAD ZAKY DWIRA NUGRAHA' AS nama_lengkap, '$2y$10$GBIBy.4DYrxw03oQLnUps.1BlnOCj8m8hkVujbS0lG65PPY4apAiK' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710482' AS nis, 'NABILA NUR OKTAVIANI' AS nama_lengkap, '$2y$10$qa1pyR97Y9yAIl0URZiqD.dH.8GjQVihOlasgNG5X7OoHf3QBKdiO' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710483' AS nis, 'NADHILA RIFDAH FAKHIRA' AS nama_lengkap, '$2y$10$O3zJSzeIvg.M3dDR9xsGvehCP.0jQO.EkOMHbhH/AhEFrHWMi598u' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710484' AS nis, 'NAILSHA ALZENA ALMAGHVIRAH' AS nama_lengkap, '$2y$10$X0vJovBWW3PcgTyk6k9QTu1zfKBsaFQ/XZamNyYT2rJw2EQ5FE78S' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710485' AS nis, 'NUR HAZIZAH' AS nama_lengkap, '$2y$10$Agpun6XfzNOxUV6Qw7xXE.Qqp2HCAiv388WqbW7tUCZxfjatE3wpq' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710486' AS nis, 'PRAMUDYA FAJAR SANTOSO' AS nama_lengkap, '$2y$10$GlFKdKAs2eQONMIpXSuZE.0QuEMgOqYRsGg47qWcRclRo/WLLLov.' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710487' AS nis, 'RENO ABIDIN' AS nama_lengkap, '$2y$10$3q7fCwsNIyBJdPP4ctLCA.xOwe4nS.Lf2sHr8767S4YHcLVApWOnu' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710488' AS nis, 'REVAN ANDRIYANSYAH' AS nama_lengkap, '$2y$10$xyCFy2pQai/5d2ToYgl6P.5rGLYSYF3RKPdhxcwrulwHU790P5ccu' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710489' AS nis, 'RIANTI ZAHRA' AS nama_lengkap, '$2y$10$ltyPp/bYdR1dzjoxganXUukQAK9O4KNlbFvCeUeOba1SPneoLSS96' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710490' AS nis, 'RINDIANI MAYLANSIS' AS nama_lengkap, '$2y$10$w4PpqhfJQ5phOtJj5ViT.OV.Zpm6iLmByUDsB1ih85reyBdgDDFhC' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710491' AS nis, 'ROBBY MUHAMAD DEVANO' AS nama_lengkap, '$2y$10$OGIEJl2AGlXyt4yYNwcR9.uaBeyrak6A.7vYqGydGjzJlVcbmJxD.' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710492' AS nis, 'SALSABILA NUR`AENI' AS nama_lengkap, '$2y$10$UI654XcaYaS14HGw6jhiJer/5NYnb.x9/Pa2a2fM06t4XT/Uwc/mm' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710493' AS nis, 'SHALFA REGISTA AZAHRA' AS nama_lengkap, '$2y$10$hDjlPHkbB.OqIv99NredTuzm3cW3GKKfFQiNb8d3ZIaFIe25NgZta' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710494' AS nis, 'SISKA PRIYANI SURYADINATA' AS nama_lengkap, '$2y$10$npSrO73772dJjs27HAtGdufQ6c7.k6qS0/ydgZ7m5QJduA31wL192' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710495' AS nis, 'SITI NURUL SYIFA' AS nama_lengkap, '$2y$10$tEH/E9eFT.XyzyMIYbAffOu.uuTQ5FjSf6UOWDaFyPCf07AZEkS/2' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710496' AS nis, 'SYAFA KHOERUNNISA' AS nama_lengkap, '$2y$10$.BzB5VP4gKtVuEOyqBSey.hzk6Whah6znzycqMSp4FVei4jii3ewy' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710497' AS nis, 'VIANI LATIFAH' AS nama_lengkap, '$2y$10$GwM8EWWM8jFDnJDRlUTwo.ThV0pwaZTd8I2rwO3vGRpA3rJyfM0am' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710498' AS nis, 'YASHINTA KIRANA' AS nama_lengkap, '$2y$10$CNzOhIIfSuPucJgWbjf./O6.LryVIZSBIt5/qEzTa7/hNdMyCrc1m' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710499' AS nis, 'YULISTYA AMELDA' AS nama_lengkap, '$2y$10$26WkoBTHvqCj0.cwGX93vOWvN.zp6e8nPDJSxstzIDPmjQ2899ofK' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT '262710500' AS nis, 'ZUBAIR HAFIIZH SOEDANTO' AS nama_lengkap, '$2y$10$Y4oAKGzgX5fpxXBWLlfH/.NN0dtL4X0MUUoRsiOTS1Ka4dnbcOomq' AS password, 'X-11' AS kelas, 1 AS is_active
  UNION ALL SELECT 'TEST9999' AS nis, 'Siswa Uji Coba' AS nama_lengkap, '$2y$10$Tr3isNIAj5aTEhI4f7ask.GxNwDQ/ZSM7VXqwoC616p2YlBPIWLXK' AS password, 'XII-1' AS kelas, 1 AS is_active
) s
JOIN kelas k ON k.nama_kelas = s.kelas;
