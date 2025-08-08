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
    $no_agenda      = trim($_POST['no_agenda']);
    $no_surat       = trim($_POST['no_surat']);
    $asal_surat     = trim($_POST['asal_surat']);
    $isi            = trim($_POST['isi']);
    $kode           = trim($_POST['kode']);
    $indeks         = trim($_POST['indeks']);
    $tgl_surat      = trim($_POST['tgl_surat']);
    $keterangan     = trim($_POST['keterangan']);
    $disposisi      = trim($_POST['disposisi']);
    $id_user        = $_SESSION['id_user'];

    $_SESSION['old_input'] = $_POST;
    
    $errors = [];
    if (empty($no_agenda)) $errors[] = "Nomor Agenda wajib diisi!";
    if (empty($no_surat)) $errors[] = "Nomor Surat wajib diisi!";
    if (empty($asal_surat)) $errors[] = "Asal Surat wajib diisi!";
    if (empty($isi)) $errors[] = "Perihal (Isi Ringkas) wajib diisi!";
    if (empty($kode)) $errors[] = "Kode Klasifikasi wajib dipilih!";
    if (empty($indeks)) $errors[] = "Lampiran wajib diisi!";
    if (empty($tgl_surat)) $errors[] = "Tanggal Surat wajib diisi!";
    if (empty($keterangan)) $errors[] = "Penerima wajib diisi!";
    if (empty($disposisi)) $errors[] = "Disposisi wajib diisi!";

    if (empty($errors)) {
        if (!preg_match("/^[0-9]*$/", $no_agenda)) $errors[] = "Nomor Agenda harus berupa angka!";
    }

    $file_name = '';
    if (isset($_FILES['file']) && $_FILES['file']['error'] == UPLOAD_ERR_OK) {
        $target_dir = "upload/surat_masuk/";
        if (!is_dir($target_dir)) {
            mkdir($target_dir, 0755, true);
        }

        $ekstensi = ['jpg', 'png', 'jpeg', 'doc', 'docx', 'pdf'];
        $file = $_FILES['file']['name'];
        $x = explode('.', $file);
        $eks = strtolower(end($x));
        $ukuran = $_FILES['file']['size'];
        
        if (in_array($eks, $ekstensi)) {
            if ($ukuran < 2500000) {
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
        header("Location: ?page=tsm&act=add");
        die();
    }

    $sql = "INSERT INTO tbl_surat_masuk (no_agenda, no_surat, asal_surat, isi, kode, indeks, tgl_surat, tgl_diterima, file, keterangan, disposisi, id_user)
            VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?, ?, ?, ?)";
    
    $stmt = mysqli_prepare($config, $sql);
    mysqli_stmt_bind_param($stmt, "isssssssssi", $no_agenda, $no_surat, $asal_surat, $isi, $kode, $indeks, $tgl_surat, $file_name, $keterangan, $disposisi, $id_user);

    if (mysqli_stmt_execute($stmt)) {
        unset($_SESSION['old_input']);
        $_SESSION['succAdd'] = 'SUKSES! Data berhasil ditambahkan';
        header("Location: ./admin.php?page=tsm");
    } else {
        $_SESSION['form_errors'] = ['ERROR! Terjadi masalah dengan query database.'];
        header("Location: ?page=tsm&act=add");
    }
    die();

} else {

    $sql = mysqli_query($config, "SELECT MAX(no_agenda) as max_agenda FROM tbl_surat_masuk");
    $data = mysqli_fetch_assoc($sql);
    $next_agenda = ($data['max_agenda'] ?? 0) + 1;

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
    .page-header .btn {
        margin-top: 18px;
    }
    .form-card { padding: 24px; }
    .error-container { 
        background-color: #ffebee; color: #c62828;
        padding: 15px; margin-bottom: 20px; border-radius: 5px; border-left: 5px solid #c62828;
    }
    .error-container ul { margin: 0; padding-left: 20px; }
    .form-actions { margin-top: 1.5rem; }

    /* CSS untuk warna biru saat form aktif (focus) */
    .input-field input:focus + label,
    .input-field textarea:focus + label { color: #2196F3 !important; }
    .input-field input:focus,
    .input-field textarea:focus { border-bottom: 1px solid #2196F3 !important; box-shadow: 0 1px 0 0 #2196F3 !important; caret-color: #2196F3 !important; }
    .input-field .select-wrapper input.select-dropdown:focus { border-bottom: 1px solid #2196F3 !important; }
    .input-field .prefix.active { color: #2196F3 !important; }
    .dropdown-content li > span { padding-top: 16px; padding-bottom: 16px; }

    /* === CSS TAMBAHAN UNTUK DATEPICKER === */
    .picker__date-display {
        background-color: #2196F3 !important;
    }
    .picker__day--selected,
    .picker__day--selected:hover,
    .picker__day--selected:focus {
        background-color: #2196F3 !important;
    }
    .picker__close, .picker__today {
        color: #2196F3 !important;
        font-weight: bold;
    }
    /* BARU: Mengubah warna validasi dari hijau ke biru */
    input.validate:valid,
    textarea.materialize-textarea.validate:valid {
        border-bottom: 1px solid #2196F3 !important;
        box-shadow: 0 1px 0 0 #2196F3 !important;
    }
</style>

<div class="row">
    <div class="col s12">
        <div class="page-header">
            <div class="page-title">
                <h4>Tambah Data Surat Masuk</h4>
            </div>
            <a href="?page=tsm" class="btn blue waves-effect waves-light"><i class="material-icons left">arrow_back</i> Kembali</a>
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

<div class="row">
    <div class="col s12">
        <div class="card form-card">
            <form class="col s12" method="POST" action="?page=tsm&act=add" enctype="multipart/form-data">
                <div class="row">
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">looks_one</i>
                        <input id="no_agenda" type="number" class="validate" name="no_agenda" value="<?= htmlspecialchars($old_input['no_agenda'] ?? $next_agenda) ?>" required>
                        <label for="no_agenda">Nomor Agenda</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">bookmark</i>
                        <select id="kode" name="kode" required>
                            <option value="" disabled <?= !isset($old_input['kode']) ? 'selected' : '' ?>>Pilih Kode Klasifikasi</option>
                            <option value="Permohonan Narasumber" <?= ($old_input['kode'] ?? '') == 'Permohonan Narasumber' ? 'selected' : '' ?>>Permohonan Narasumber</option>
                            <option value="Undangan" <?= ($old_input['kode'] ?? '') == 'Undangan' ? 'selected' : '' ?>>Undangan</option>
                            <option value="SE/SKEP" <?= ($old_input['kode'] ?? '') == 'SE/SKEP' ? 'selected' : '' ?>>SE/SKEP</option>
                            <option value="Biasa" <?= ($old_input['kode'] ?? '') == 'Biasa' ? 'selected' : '' ?>>Biasa</option>
                            <option value="Rahasia" <?= ($old_input['kode'] ?? '') == 'Rahasia' ? 'selected' : '' ?>>Rahasia</option>
                        </select>
                        <label for="kode"></label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">looks_two</i>
                        <input id="no_surat" type="text" class="validate" name="no_surat" value="<?= htmlspecialchars($old_input['no_surat'] ?? '') ?>" required>
                        <label for="no_surat">Nomor Surat</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">date_range</i>
                        <input id="tgl_surat" type="text" class="datepicker" name="tgl_surat" value="<?= htmlspecialchars($old_input['tgl_surat'] ?? '') ?>" required>
                        <label for="tgl_surat">Tanggal Surat</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">place</i>
                        <input id="asal_surat" type="text" class="validate" name="asal_surat" value="<?= htmlspecialchars($old_input['asal_surat'] ?? '') ?>" required>
                        <label for="asal_surat">Asal Surat</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">storage</i>
                        <input id="indeks" type="text" class="validate" name="indeks" value="<?= htmlspecialchars($old_input['indeks'] ?? '') ?>" required>
                        <label for="indeks">Lampiran</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">description</i>
                        <textarea id="isi" class="materialize-textarea validate" name="isi" required><?= htmlspecialchars($old_input['isi'] ?? '') ?></textarea>
                        <label for="isi">Perihal</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">person_pin</i>
                        <input id="keterangan" type="text" class="validate" name="keterangan" value="<?= htmlspecialchars($old_input['keterangan'] ?? '') ?>" required>
                        <label for="keterangan">Penerima</label>
                    </div>
                     <div class="input-field col s12 m6">
                        <i class="material-icons prefix">low_priority</i>
                        <input id="disposisi" type="text" class="validate" name="disposisi" value="<?= htmlspecialchars($old_input['disposisi'] ?? '') ?>" required>
                        <label for="disposisi">Disposisi</label>
                    </div>
                    <div class="input-field col s12">
                        <div class="file-field input-field">
                            <div class="btn blue">
                                <span><i class="material-icons left">attach_file</i></span>
                                <input type="file" id="file" name="file">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Upload file/scan (opsional)">
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
                        <a href="?page=tsm" class="btn-large deep-orange waves-effect waves-light white-text">
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
    // Inisialisasi untuk dropdown/select
    M.FormSelect.init(document.querySelectorAll('select'));

    // Inisialisasi untuk datepicker
    M.Datepicker.init(document.querySelectorAll('.datepicker'), {
        format: 'yyyy-mm-dd', // Format tanggal yang sesuai untuk database
        autoClose: true,
        firstDay: 1 // Mulai hari dari Senin
    });
});
</script>

<?php
    }
?>