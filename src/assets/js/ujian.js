(function () {
  'use strict';

  var cfg = window.ASESMEN_CONFIG || {};
  var sesiId = cfg.sesiId;
  var ujianId = cfg.ujianId || 0;
  var sisaDetik = cfg.sisaDetik;
  var baseUrl = '/';

  function headersJson() {
    return {
      'Content-Type': 'application/json',
      'X-CSRF-Token': cfg.csrfToken || ''
    };
  }

  var timerEl = document.getElementById('timer');
  var statusEl = document.getElementById('status-simpan');
  var btnSubmit = document.getElementById('btn-submit');
  var btnSubmitBawah = document.getElementById('btn-submit-bawah');
  var modal = document.getElementById('modal-konfirmasi');
  var modalPesan = document.getElementById('modal-pesan');
  var btnYa = document.getElementById('btn-ya');
  var btnBatal = document.getElementById('btn-batal');
  var navNomor = document.getElementById('nav-nomor');

  var kartuSoal = Array.prototype.slice.call(document.querySelectorAll('[data-soal]'));
  var fields = [];
  var menjodohkan = {};

  kartuSoal.forEach(function (kartu) {
    var idUs = kartu.getAttribute('data-soal');
    var tipe = kartu.getAttribute('data-tipe');
    if (tipe === 'menjodohkan') {
      var selects = kartu.querySelectorAll('[data-field-jodoh]');
      menjodohkan[idUs] = [];
      selects.forEach(function (sel) {
        menjodohkan[idUs].push(sel);
        sel.addEventListener('change', function () { tandaiTerisi(idUs); tundaSimpan(); });
      });
    } else {
      var f = kartu.querySelector('[data-field-jawaban]');
      if (f) {
        fields.push({ idUs: idUs, el: f });
        f.addEventListener('input', function () { tandaiTerisi(idUs); tundaSimpan(); });
      }
    }
  });

  function nilaiSaatIni() {
    var data = {};
    fields.forEach(function (f) {
      data[f.idUs] = f.el.value;
    });
    Object.keys(menjodohkan).forEach(function (idUs) {
      var map = {};
      menjodohkan[idUs].forEach(function (sel) {
        if (sel.value !== '') {
          map[sel.getAttribute('data-field-jodoh')] = sel.value;
        }
      });
      data[idUs] = map;
    });
    return data;
  }

  function tandaiTerisi(idUs) {
    if (navNomor) {
      var b = navNomor.querySelector('[data-nav="' + idUs + '"]');
      if (b) {
        var val = nilaiSaatIni()[idUs];
        var terisi = false;
        if (Array.isArray(val)) terisi = Object.keys(val).length > 0;
        else if (typeof val === 'string') terisi = val.trim() !== '';
        b.classList.toggle('bg-green-100', terisi);
        b.classList.toggle('border-green-500', terisi);
        b.classList.toggle('text-green-800', terisi);
      }
    }
  }

  function formatDetik(total) {
    total = Math.max(0, Math.floor(total));
    var jam = Math.floor(total / 3600);
    var mnt = Math.floor((total % 3600) / 60);
    var dtk = total % 60;
    if (jam > 0) {
      return String(jam).padStart(2, '0') + ':' + String(mnt).padStart(2, '0') + ':' + String(dtk).padStart(2, '0');
    }
    return String(mnt).padStart(2, '0') + ':' + String(dtk).padStart(2, '0');
  }

  function tampilTimer() {
    if (timerEl) timerEl.textContent = formatDetik(sisaDetik);
  }

  function setStatusTeks(teks, warna) {
    if (statusEl) {
      statusEl.textContent = teks;
      statusEl.className = 'text-xs ' + (warna || 'text-slate-500');
    }
  }

  var simpanPromise = null;
  function kirimSimpan() {
    var data = nilaiSaatIni();
    setStatusTeks('Menyimpan...', 'text-amber-600');
    return fetch(baseUrl + 'api/autosave.php', {
      method: 'POST',
      headers: headersJson(),
      body: JSON.stringify({ sesi_id: sesiId, jawaban: data })
    }).then(function (r) { return r.json(); }).then(function (res) {
      if (res && res.ok) {
        setStatusTeks('Tersimpan otomatis ' + new Date().toLocaleTimeString('id-ID', { hour: '2-digit', minute: '2-digit', second: '2-digit' }), 'text-green-600');
      } else {
        setStatusTeks('Gagal menyimpan: ' + (res.error || 'coba lagi'), 'text-red-600');
        if (res && res.habis) kirimSubmit(true);
      }
    }).catch(function () {
      setStatusTeks('Gagal menyimpan (offline?) — akan coba lagi.', 'text-red-600');
    });
  }

  var tidSimpan = null;
  function tundaSimpan() {
    clearTimeout(tidSimpan);
    tidSimpan = setTimeout(function () { kirimSimpan(); }, 2500);
  }

  function kirimSubmit(o) {
    var data = nilaiSaatIni();
    o = o || {};
    setStatusTeks('Mengumpulkan...', 'text-amber-600');
    if (btnSubmit) btnSubmit.disabled = true;
    if (btnSubmitBawah) btnSubmitBawah.disabled = true;
    fetch(baseUrl + 'api/submit.php', {
      method: 'POST',
      headers: headersJson(),
      body: JSON.stringify({ sesi_id: sesiId, jawaban: data })
    }).then(function (r) { return r.json(); }).then(function (res) {
      if (res && res.ok) {
        setStatusTeks('Berhasil dikumpulkan!', 'text-green-600');
        clearInterval(tidTimer);
        window.location.href = baseUrl + 'siswa/hasil.php?ujian=' + (o.ujianId || ujianId);
      } else {
        setStatusTeks('Gagal mengumpulkan: ' + (res.error || 'coba lagi'), 'text-red-600');
        window.alert('Gagal mengumpulkan: ' + (res.error || 'Silakan coba lagi.'));
        if (btnSubmit) btnSubmit.disabled = false;
        if (btnSubmitBawah) btnSubmitBawah.disabled = false;
      }
    }).catch(function () {
      setStatusTeks('Gagal mengumpulkan (jaringan). Coba lagi.', 'text-red-600');
      if (btnSubmit) btnSubmit.disabled = false;
      if (btnSubmitBawah) btnSubmitBawah.disabled = false;
    });
  }

  function bukaKonfirmasi(o) {
    o = o || {};
    if (o.habis) {
      modalPesan.textContent = 'Waktu Anda habis. Jawaban akan dikumpulkan otomatis.';
    } else {
      modalPesan.textContent = 'Yakin ingin mengumpulkan jawaban? Anda tidak dapat mengubah jawaban setelah dikumpulkan.';
    }
    modal.showModal();
    btnYa.onclick = function () {
      modal.close();
      // simpan dulu lalu submit
      kirimSubmit(o);
    };
    btnBatal.onclick = function () { modal.close(); };
  }

  btnSubmit.addEventListener('click', function () { bukaKonfirmasi({}); });
  btnSubmitBawah.addEventListener('click', function () { bukaKonfirmasi({}); });

  // Navigasi nomor soal
  if (navNomor) {
    kartuSoal.forEach(function (kartu, i) {
      var idUs = kartu.getAttribute('data-soal');
      var b = document.createElement('button');
      b.type = 'button';
      b.textContent = i + 1;
      b.setAttribute('data-nav', idUs);
      b.className = 'h-8 w-8 rounded border border-slate-300 text-slate-600 hover:bg-slate-100';
      b.addEventListener('click', function () {
        kartu.scrollIntoView({ behavior: 'smooth', block: 'start' });
      });
      navNomor.appendChild(b);
      tandaiTerisi(idUs);
    });
  }

  // Timer
  var tidTimer = setInterval(function () {
    sisaDetik--;
    tampilTimer();
    if (sisaDetik <= 0) {
      clearInterval(tidTimer);
      kirimSubmit({ habis: true });
    }
  }, 1000);

  // Autosave berkala (tiap 20 detik) + sebelum menutup halaman
  setInterval(function () { if (document.visibilityState === 'visible') kirimSimpan(); }, 20000);
  window.addEventListener('beforeunload', function (ev) {
    navigator.sendBeacon(baseUrl + 'api/autosave.php', new Blob([JSON.stringify({ sesi_id: sesiId, jawaban: nilaiSaatIni(), csrf_token: cfg.csrfToken })], { type: 'application/json' }));
  });

  // Mulai timer + simpan pertama
  tampilTimer();
  kirimSimpan();
})();