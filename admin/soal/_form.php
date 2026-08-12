<?php
$tipe = $soal['tipe'] ?? ($_GET['tipe'] ?? 'essay');
if (!in_array($tipe, ['essay', 'isian', 'menjodohkan'])) {
    $tipe = 'essay';
}
?>

<div class="mt-6 grid grid-cols-2 gap-2 rounded-xl bg-slate-100 p-1 text-center text-sm font-medium sm:max-w-md">
  <?php foreach (['essay'=>'Essay','isian'=>'Isian Singkat','menjodohkan'=>'Menjodohkan'] as $k=>$label): ?>
    <button type="button" data-tipe="<?= $k ?>" class="tipe-btn rounded-lg px-3 py-2 <?= $tipe === $k ? 'bg-white text-slate-800 shadow' : 'text-slate-500 hover:text-slate-700' ?>"><?= $label ?></button>
  <?php endforeach; ?>
</div>
<input type="hidden" name="tipe" id="field-tipe" value="<?= e($tipe) ?>">

<div class="mt-5 space-y-4">
  <div>
    <label class="mb-1 block text-sm font-medium text-slate-700">Pertanyaan</label>
    <textarea name="pertanyaan" rows="4" required
              class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none"><?= e($soal['pertanyaan'] ?? '') ?></textarea>
  </div>

  <div id="blok-essay" data-tipe="essay" class="<?= $tipe === 'essay' ? '' : 'hidden' ?> space-y-3">
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Kunci Jawaban / Referensi</label>
      <textarea name="kunci" rows="3" placeholder="Jawaban referensi untuk panduan koreksi manual..."
                class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none"><?= e($soal['kunci'] ?? '') ?></textarea>
    </div>
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Petunjuk Penskoran</label>
      <textarea name="petunjuk" rows="2" placeholder="Contoh: sebutkan minimal 2 poin kunci agar mendapat skor penuh"
                class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none"><?= e($soal['petunjuk'] ?? '') ?></textarea>
    </div>
  </div>

  <div id="blok-isian" data-tipe="isian" class="<?= $tipe === 'isian' ? '' : 'hidden' ?>">
    <label class="mb-1 block text-sm font-medium text-slate-700">Kunci Jawaban</label>
    <input type="text" name="kunci_isian" value="<?= e($soal['kunci'] ?? '') ?>" placeholder="Jawaban benar (pisahkan alternatif dengan ||)"
           class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
    <p class="mt-1 text-xs text-slate-400">Koreksi otomatis peka-huruf-kecil (case-insensitive). Beberapa jawaban boleh dipisah tanda <code>||</code>.</p>
  </div>

  <div id="blok-menjodohkan" data-tipe="menjodohkan" class="<?= $tipe === 'menjodohkan' ? '' : 'hidden' ?>">
    <label class="mb-1 block text-sm font-medium text-slate-700">Pasangan (kolom kiri ↔ kolom kanan)</label>
    <div id="daftar-pasangan" class="space-y-2">
      <?php $pasangan = $soal['pasangan'] ?? []; if (!$pasangan) $pasangan = [['','']]; ?>
      <?php foreach ($pasangan as $p): ?>
        <div class="flex items-center gap-2">
          <input type="text" name="kiri[]" value="<?= e($p['kolom_kiri'] ?? $p[0]) ?>" placeholder="Istilah / kolom kiri"
                 class="flex-1 rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
          <span class="text-slate-400">↔</span>
          <input type="text" name="kanan[]" value="<?= e($p['kolom_kanan'] ?? $p[1]) ?>" placeholder="Definisi / kolom kanan"
                 class="flex-1 rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
          <button type="button" class="hapus-pasangan rounded-md px-2 py-1 text-slate-400 hover:bg-red-50 hover:text-red-600" title="Hapus pasangan">✕</button>
        </div>
      <?php endforeach; ?>
    </div>
    <button type="button" id="tambah-pasangan" class="mt-2 rounded-lg border border-slate-300 px-3 py-1.5 text-sm text-slate-600 hover:bg-slate-50">+ Tambah pasangan</button>
    <p class="mt-1 text-xs text-slate-400">Setiap pasangan benar mendapat poin proporsional.</p>
  </div>

  <div class="sm:max-w-xs">
    <label class="mb-1 block text-sm font-medium text-slate-700">Poin Maksimal</label>
    <input type="number" name="poin" min="1" value="<?= (int)($soal['poin'] ?? 10) ?>"
           class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
  const tipeInput = document.getElementById('field-tipe');

  document.querySelectorAll('.tipe-btn').forEach(function (btn) {
    btn.addEventListener('click', function () {
      const t = btn.dataset.tipe;
      tipeInput.value = t;
      document.querySelectorAll('.tipe-btn').forEach(function (b) {
        b.classList.toggle('bg-white', b === btn);
        b.classList.toggle('shadow', b === btn);
        b.classList.toggle('text-slate-800', b === btn);
        b.classList.toggle('text-slate-500', b !== btn);
      });
      document.querySelectorAll('[data-tipe]').forEach(function (blok) {
        blok.classList.toggle('hidden', blok.dataset.tipe !== t);
      });
    });
  });

  const daftar = document.getElementById('daftar-pasangan');

  function baris(kiri, kanan) {
    const div = document.createElement('div');
    div.className = 'flex items-center gap-2';
    div.innerHTML =
      '<input type="text" name="kiri[]" placeholder="Istilah / kolom kiri" value="' + (kiri || '').replace(/'/g, '&#39;') + '" class="flex-1 rounded-lg border border-slate-300 px-3 py-2">' +
      '<span class="text-slate-400">↔</span>' +
      '<input type="text" name="kanan[]" placeholder="Definisi / kolom kanan" value="' + (kanan || '').replace(/'/g, '&#39;') + '" class="flex-1 rounded-lg border border-slate-300 px-3 py-2">' +
      '<button type="button" class="hapus-pasangan rounded-md px-2 py-1 text-slate-400 hover:bg-red-50 hover:text-red-600" title="Hapus pasangan">✕</button>';
    return div;
  }

  document.getElementById('tambah-pasangan').addEventListener('click', function () {
    daftar.appendChild(baris('', ''));
  });

  daftar.addEventListener('click', function (ev) {
    if (ev.target.classList.contains('hapus-pasangan')) {
      ev.target.closest('.flex').remove();
    }
  });
});
</script>