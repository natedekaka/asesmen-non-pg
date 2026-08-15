<?php
$ujian = $ujian ?? [];
?>

<div class="mt-6 rounded-2xl bg-white p-6 shadow">
  <h2 class="mb-4 text-lg font-semibold text-slate-800">Detail Ujian</h2>
  <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Judul Ujian</label>
      <input type="text" name="judul" required value="<?= e($ujian['judul'] ?? '') ?>"
             class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
    </div>
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Mata Pelajaran</label>
      <input type="text" name="mata_pelajaran" value="<?= e($ujian['mata_pelajaran'] ?? '') ?>"
             class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
    </div>
    <div class="sm:col-span-2">
      <label class="mb-1 block text-sm font-medium text-slate-700">Deskripsi</label>
      <textarea name="deskripsi" rows="2" class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none"><?= e($ujian['deskripsi'] ?? '') ?></textarea>
    </div>
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Mulai</label>
      <input type="datetime-local" name="tanggal_mulai" value="<?= e($ujian['tanggal_mulai'] ?? '') ?>"
             class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
    </div>
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Selesai</label>
      <input type="datetime-local" name="tanggal_selesai" value="<?= e($ujian['tanggal_selesai'] ?? '') ?>"
             class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
    </div>
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Durasi (menit)</label>
      <input type="number" name="durasi_menit" min="1" required value="<?= (int)($ujian['durasi_menit'] ?? 60) ?>"
             class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
    </div>
    <div>
      <label class="mb-1 block text-sm font-medium text-slate-700">Status</label>
      <select name="status" class="w-full rounded-lg border border-slate-300 px-3 py-2 focus:border-indigo-500 focus:outline-none">
        <?php foreach (['draft', 'aktif', 'selesai'] as $s): ?>
          <option value="<?= $s ?>" <?= ($ujian['status'] ?? 'draft') === $s ? 'selected' : '' ?>><?= ucfirst($s) ?></option>
        <?php endforeach; ?>
      </select>
    </div>
    <div class="flex items-center gap-6 sm:col-span-2">
      <label class="flex items-center gap-2 text-sm text-slate-700">
        <input type="checkbox" name="acak_soal" value="1" <?= !empty($ujian['acak_soal']) ? 'checked' : '' ?> class="rounded border-slate-300">
        Acak urutan soal
      </label>
      <label class="flex items-center gap-2 text-sm text-slate-700">
        <input type="checkbox" name="tampilkan_hasil" value="1" <?= !isset($ujian['tampilkan_hasil']) || !empty($ujian['tampilkan_hasil']) ? 'checked' : '' ?> class="rounded border-slate-300">
        Tampilkan hasil ke siswa setelah dikoreksi
      </label>
    </div>
  </div>
</div>