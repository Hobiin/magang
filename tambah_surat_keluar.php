<?php
// Pastikan sesi admin aktif
if (empty($_SESSION['admin'])) {
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
}

// =================================================================
// 1. LOGIKA PEMROSESAN FORM (HANYA BERJALAN SAAT METHOD POST)
// =================================================================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {

    // (Logika PHP Anda di sini tetap sama, tidak ada perubahan)
    $no_agenda    = trim($_POST['no_agenda']);
    $tujuan       = trim($_POST['tujuan']);
    $no_surat     = trim($_POST['no_surat']);
    $isi          = trim($_POST['isi']);
    $kode         = trim($_POST['kode']);
    $tgl_surat    = trim($_POST['tgl_surat']);
    $keterangan   = trim($_POST['keterangan']);
    $id_user      = $_SESSION['id_user'];

    $_SESSION['old_input'] = $_POST;
    
    $errors = [];
    if (empty($no_agenda)) $errors[] = "Nomor Agenda wajib diisi!";
    if (empty($tujuan)) $errors[] = "Tujuan Surat wajib diisi!";
    if (empty($no_surat)) $errors[] = "Nomor Surat wajib diisi!";
    if (empty($isi)) $errors[] = "Perihal (Isi Ringkas) wajib diisi!";
    if (empty($kode)) $errors[] = "Kode Klasifikasi wajib dipilih!";
    if (empty($tgl_surat)) $errors[] = "Tanggal Surat wajib diisi!";
    // Dihapus sementara, karena keterangan tidak ada di form baru
    // if (empty($keterangan)) $errors[] = "Keterangan wajib diisi!";

    if (empty($errors)) {
        if (!preg_match("/^[0-9]*$/", $no_agenda)) $errors[] = "Nomor Agenda harus berupa angka!";
        if (!preg_match("/^[a-zA-Z0-9.,() \/ -]*$/", $no_surat)) $errors[] = "Nomor Surat mengandung karakter tidak valid!";
    }

    if (empty($errors)) {
        $stmt_check = mysqli_prepare($config, "SELECT no_surat FROM tbl_surat_keluar WHERE no_surat = ?");
        mysqli_stmt_bind_param($stmt_check, "s", $no_surat);
        mysqli_stmt_execute($stmt_check);
        mysqli_stmt_store_result($stmt_check);
        if (mysqli_stmt_num_rows($stmt_check) > 0) {
            $errors[] = 'Nomor Surat sudah terpakai, gunakan yang lain!';
        }
        mysqli_stmt_close($stmt_check);
    }
    
    $file_name = '';
    if (isset($_FILES['file']) && $_FILES['file']['error'] == UPLOAD_ERR_OK) {
        $target_dir = "upload/surat_keluar/";
        if (!is_dir($target_dir)) {
            mkdir($target_dir, 0755, true);
        }

        $ekstensi = ['jpg', 'png', 'jpeg', 'doc', 'docx', 'pdf'];
        $file = $_FILES['file']['name'];
        $x = explode('.', $file);
        $eks = strtolower(end($x));
        $ukuran = $_FILES['file']['size'];
        
        if (in_array($eks, $ekstensi)) {
            if ($ukuran < 2500000) { // Maks 2.5 MB
                $rand = rand(1, 10000);
                $file_name = $rand . "-" . basename($file);
                if (!move_uploaded_file($_FILES['file']['tmp_name'], $target_dir . $file_name)) {
                    $errors[] = "Gagal mengunggah file.";
                    $file_name = '';
                }
            } else {
                $errors[] = "Ukuran file terlalu besar! Maksimal 2 MB.";
            }
        } else {
            $errors[] = "Format file tidak diizinkan! Hanya JPG, PNG, DOC, DOCX, PDF.";
        }
    }

    if (!empty($errors)) {
        $_SESSION['form_errors'] = $errors;
        header("Location: ?page=tsk&act=add");
        die();
    }

    $sql = "INSERT INTO tbl_surat_keluar (no_agenda, tujuan, no_surat, isi, kode, tgl_surat, tgl_catat, file, keterangan, id_user) 
            VALUES (?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?)";
    
    $stmt = mysqli_prepare($config, $sql);
    // Keterangan diisi string kosong jika tidak ada fieldnya
    $keterangan_val = $keterangan ?? ''; 
    mysqli_stmt_bind_param($stmt, "isssssssi", $no_agenda, $tujuan, $no_surat, $isi, $kode, $tgl_surat, $file_name, $keterangan_val, $id_user);

    if (mysqli_stmt_execute($stmt)) {
        unset($_SESSION['old_input']);
        $_SESSION['succAdd'] = 'SUKSES! Data berhasil ditambahkan';
        header("Location: ./admin.php?page=tsk");
    } else {
        $_SESSION['form_errors'] = ['ERROR! Terjadi masalah dengan query database.'];
        header("Location: ?page=tsk&act=add");
    }
    die();

} else {
    // =================================================================
    // 2. LOGIKA PERSIAPAN TAMPILAN (METHOD GET)
    // =================================================================
    $query = mysqli_query($config, "SELECT MAX(no_agenda) as max_agenda FROM tbl_surat_keluar");
    $row = mysqli_fetch_assoc($query);
    $next_agenda = ($row['max_agenda'] ?? 0) + 1;

    $form_errors = $_SESSION['form_errors'] ?? [];
    $old_input = $_SESSION['old_input'] ?? [];
    unset($_SESSION['form_errors'], $_SESSION['old_input']);
?>

<style>
    .page-header {
        display: flex; justify-content: space-between; align-items: center;
        border-bottom: 1px solid #e0e0e0; padding-bottom: 1rem; margin-bottom: 1.5rem;
    }
    .page-header .page-title h4 { font-weight: 500; margin: 0; padding-top: 15px; }
    .page-header .btn{
        margin-top: 18px;
    }
    .form-card { padding: 24px; }
    .error-container { 
        background-color: #ffebee; color: #c62828;
        padding: 15px; margin-bottom: 20px; border-radius: 5px; border-left: 5px solid #c62828;
    }
    .error-container ul { margin: 0; padding-left: 20px; }
    .form-actions { margin-top: 1.5rem; }
    input[type="date"] {
        border: 1px solid #9e9e9e; border-radius: 4px; padding: 10px; height: 3rem;
        background-color: transparent; font-family: inherit; font-size: 1rem;
        width: 100%; box-sizing: border-box;
    }
    .input-field input:focus + label,
    .input-field textarea:focus + label { color: #2196F3 !important; }
    .input-field input:focus,
    .input-field textarea:focus { border-bottom: 1px solid #2196F3 !important; box-shadow: 0 1px 0 0 #2196F3 !important; caret-color: #2196F3 !important; }
    .input-field .select-wrapper input.select-dropdown:focus { border-bottom: 1px solid #2196F3 !important; }
    .input-field .prefix.active { color: #2196F3 !important; }
    .dropdown-content li > span { padding-top: 16px; padding-bottom: 16px; }
    .input-field input.valid,
    .input-field textarea.valid { border-bottom: 1px solid #2196F3 !important; box-shadow: 0 1px 0 0 #2196F3 !important; }
    .input-field input.valid + label,
    .input-field textarea.valid + label { color: #2196F3 !important; }
    .input-field .select-wrapper input.select-dropdown.valid { border-bottom: 1px solid #2196F3 !important; }
</style>

<div class="row">
    <div class="col s12">
        <div class="page-header">
            <div class="page-title">
                <h4>Tambah Data Surat Keluar</h4>
            </div>
            <a href="?page=tsk" class="btn blue waves-effect waves-light"><i class="material-icons left">arrow_back</i> Kembali</a>
        </div>
    </div>
</div>

<?php if (!empty($form_errors)): ?>
<div class="row">
    <div class="col s12">
        <div class="error-container">
            <strong>Terjadi Kesalahan:</strong>
            <ul>
                <?php foreach ($form_errors as $error): ?>
                    <li><?= htmlspecialchars($error); ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</div>
<?php endif; ?>

<div class="row" id="tombol-cetak-container" style="display: none;">
    <div class="col s12">
        <a id="link-cetak-disposisi" href="#" target="_blank" class="btn-large waves-effect waves-light green" style="width:100%;">
            <i class="material-icons left">print</i>
            Cetak Lembar Disposisi Nota Dinas
        </a>
    </div>
</div>

<div class="row">
    <div class="col s12">
        <div class="card form-card">
            <form class="col s12" method="POST" action="?page=tsk&act=add" enctype="multipart/form-data">
                <div class="row">
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">looks_one</i>
                        <input id="no_agenda" type="number" name="no_agenda" value="<?= htmlspecialchars($old_input['no_agenda'] ?? $next_agenda) ?>" readonly>
                        <label for="no_agenda" class="active">Nomor Agenda</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">class</i>
                        <select id="kode" name="kode" required>
                            <option value="" disabled <?= !isset($old_input['kode']) ? 'selected' : '' ?>>Pilih Kode Klasifikasi</option>
                            <?php
                                $kodes = ["Sprin", "Undangan", "SE/SKEP", "Biasa", "Rahasia", "SPPD", "Berita Acara", "Nota Dinas"];
                                foreach ($kodes as $k) {
                                    $selected = (isset($old_input['kode']) && $old_input['kode'] == $k) ? 'selected' : '';
                                    echo "<option value=\"$k\" $selected>$k</option>";
                                }
                            ?>
                        </select>
                        <label for="kode">Kode Klasifikasi</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">format_list_numbered</i>
                        <input id="no_surat" type="text" class="validate" name="no_surat" value="<?= htmlspecialchars($old_input['no_surat'] ?? '') ?>" required>
                        <label for="no_surat">Nomor Surat</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">date_range</i>
                        <input id="tgl_surat" type="date" name="tgl_surat" value="<?= htmlspecialchars($old_input['tgl_surat'] ?? '') ?>" required>
                        <label for="tgl_surat" class="active">Tanggal Surat</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">place</i>
                        <input id="tujuan" type="text" class="validate" name="tujuan" value="<?= htmlspecialchars($old_input['tujuan'] ?? '') ?>" required>
                        <label for="tujuan">Tujuan Surat</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">description</i>
                        <textarea id="isi" class="materialize-textarea validate" name="isi" required><?= htmlspecialchars($old_input['isi'] ?? '') ?></textarea>
                        <label for="isi">Isi Ringkas (Perihal)</label>
                    </div>
                    <div class="input-field col s12" style="display:none;"> <i class="material-icons prefix">featured_play_list</i>
                        <input id="keterangan" type="text" class="validate" name="keterangan" value="-" >
                        <label for="keterangan">Keterangan</label>
                    </div>
                    <div class="input-field col s12">
                        <div class="file-field input-field">
                            <div class="btn blue">
                                <span><i class="material-icons left">attach_file</i></span>
                                <input type="file" id="file" name="file">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Upload file (opsional)">
                            </div>
                        </div>
                        <small class="grey-text">*Format: JPG, PNG, DOC, DOCX, PDF | Ukuran Maks: 2 MB</small>
                    </div>
                </div>

                <div class="row form-actions">
                    <div class="col s12">
                        <button type="submit" name="submit" class="btn-large blue waves-effect waves-light">
                            <i class="material-icons left">save</i> SIMPAN
                        </button>
                        <a href="?page=tsk" class="btn-large deep-orange waves-effect waves-light">
                            <i class="material-icons left">cancel</i> BATAL
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Inisialisasi komponen select dari Materialize
    var selectElems = document.querySelectorAll('select');
    M.FormSelect.init(selectElems);

    // === LOGIKA UNTUK NOTA DINAS ===
    const selectKode = document.getElementById('kode');
    const tombolCetakContainer = document.getElementById('tombol-cetak-container');
    const linkCetak = document.getElementById('link-cetak-disposisi');

    // Referensi ke input form
    const inputNoAgenda = document.getElementById('no_agenda');
    const inputNoSurat = document.getElementById('no_surat');
    const inputTglSurat = document.getElementById('tgl_surat');
    const inputIsi = document.getElementById('isi');

    function toggleTombolCetak() {
        if (selectKode.value === 'Nota Dinas') {
            tombolCetakContainer.style.display = 'block';
            updateLinkCetak();
        } else {
            tombolCetakContainer.style.display = 'none';
        }
    }

    function updateLinkCetak() {
        if (selectKode.value !== 'Nota Dinas') return;

        const noAgenda = encodeURIComponent(inputNoAgenda.value);
        const noSurat = encodeURIComponent(inputNoSurat.value);
        const tglSurat = encodeURIComponent(inputTglSurat.value);
        const perihal = encodeURIComponent(inputIsi.value);
        
        linkCetak.href = `cetak_disposisi.php?no_agenda=${noAgenda}&no_surat=${noSurat}&tgl_surat=${tglSurat}&perihal=${perihal}`;
    }

    // Panggil fungsi saat dropdown klasifikasi berubah
    selectKode.addEventListener('change', toggleTombolCetak);

    // Panggil fungsi update link saat inputan lain berubah
    [inputNoAgenda, inputNoSurat, inputTglSurat, inputIsi].forEach(input => {
        input.addEventListener('input', updateLinkCetak);
    });

    // Panggil fungsi sekali saat halaman dimuat, untuk kasus 'old_input'
    toggleTombolCetak();
});
</script>

<?php
}
?>