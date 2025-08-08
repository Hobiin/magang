<?php
// 1. PENGECEKAN SESSION DAN HAK AKSES
// ===================================
if (empty($_SESSION['admin'])) {
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
}

$id_surat = mysqli_real_escape_string($config, $_REQUEST['id_surat']);

// 2. LOGIKA PEMROSESAN FORM (SAAT TOMBOL SUBMIT DITEKAN)
// ====================================================
if (isset($_POST['submit'])) {
    $no_agenda = trim($_POST['no_agenda']);
    $no_surat = trim($_POST['no_surat']);
    $asal_surat = trim($_POST['asal_surat']);
    $isi = trim($_POST['isi']);
    $kode = trim($_POST['kode']);
    $indeks = trim($_POST['indeks']);
    $tgl_surat = trim($_POST['tgl_surat']);
    $keterangan = trim($_POST['keterangan']);
    $disposisi = trim($_POST['disposisi']);
    $id_user = $_SESSION['id_user'];
    
    $errors = [];

    if (empty($no_agenda) || empty($no_surat) || empty($asal_surat) || empty($isi) || empty($kode) || empty($indeks) || empty($tgl_surat) || empty($keterangan) || empty($disposisi)) {
        $errors[] = "Semua form bertanda (*) wajib diisi!";
    }

    if (!empty($errors)) {
        $_SESSION['form_errors'] = $errors;
        header("Location: ./admin.php?page=tsm&act=edit&id_surat=$id_surat");
        die();
    } else {
        $file_name = '';
        $upload_dir = "upload/surat_masuk/";

        if (!empty($_FILES['file']['name'])) {
            $file = $_FILES['file'];
            $allowed_ext = ['jpg', 'png', 'jpeg', 'doc', 'docx', 'pdf'];
            $file_ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
            
            if (!in_array($file_ext, $allowed_ext)) {
                $errors[] = "Format file yang diperbolehkan hanya *.JPG, *.PNG, *.DOC, *.DOCX atau *.PDF!";
            }
            if ($file['size'] > 2500000) { // Ukuran maks 2.5 MB
                $errors[] = "Ukuran file yang diupload terlalu besar (Maks 2.5MB)!";
            }

            if (empty($errors)) {
                $stmt_old_file = mysqli_prepare($config, "SELECT file FROM tbl_surat_masuk WHERE id_surat=?");
                mysqli_stmt_bind_param($stmt_old_file, "i", $id_surat);
                mysqli_stmt_execute($stmt_old_file);
                $result_old_file = mysqli_stmt_get_result($stmt_old_file);
                if ($row_old_file = mysqli_fetch_assoc($result_old_file)) {
                    if (!empty($row_old_file['file']) && file_exists($upload_dir . $row_old_file['file'])) {
                        unlink($upload_dir . $row_old_file['file']);
                    }
                }
                
                $file_name = uniqid() . '-' . basename($file['name']);
                if (!move_uploaded_file($file['tmp_name'], $upload_dir . $file_name)) {
                    $errors[] = "Gagal mengupload file.";
                }
            }
        }

        if (!empty($errors)) {
            $_SESSION['form_errors'] = $errors;
            header("Location: ./admin.php?page=tsm&act=edit&id_surat=$id_surat");
            die();
        }

        if (!empty($file_name)) {
            $sql = "UPDATE tbl_surat_masuk SET no_agenda=?, no_surat=?, asal_surat=?, isi=?, kode=?, indeks=?, tgl_surat=?, file=?, keterangan=?, disposisi=?, id_user=? WHERE id_surat=?";
            $stmt = mysqli_prepare($config, $sql);
            mysqli_stmt_bind_param($stmt, "ssssssssssii", $no_agenda, $no_surat, $asal_surat, $isi, $kode, $indeks, $tgl_surat, $file_name, $keterangan, $disposisi, $id_user, $id_surat);
        } else {
            $sql = "UPDATE tbl_surat_masuk SET no_agenda=?, no_surat=?, asal_surat=?, isi=?, kode=?, indeks=?, tgl_surat=?, keterangan=?, disposisi=?, id_user=? WHERE id_surat=?";
            $stmt = mysqli_prepare($config, $sql);
            mysqli_stmt_bind_param($stmt, "sssssssssii", $no_agenda, $no_surat, $asal_surat, $isi, $kode, $indeks, $tgl_surat, $keterangan, $disposisi, $id_user, $id_surat);
        }

        if (mysqli_stmt_execute($stmt)) {
            $_SESSION['succEdit'] = 'SUKSES! Data berhasil diperbarui.';
            header("Location: ./admin.php?page=tsm");
            die();
        } else {
            $_SESSION['form_errors'] = ["ERROR! Gagal memperbarui data."];
            header("Location: ./admin.php?page=tsm&act=edit&id_surat=$id_surat");
            die();
        }
    }
}

// 3. AMBIL DATA SURAT UNTUK DITAMPILKAN DI FORM
// =============================================
$stmt = mysqli_prepare($config, "SELECT * FROM tbl_surat_masuk WHERE id_surat=?");
mysqli_stmt_bind_param($stmt, "i", $id_surat);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$data = mysqli_fetch_assoc($result);

if (!$data || ($_SESSION['id_user'] != $data['id_user'] && $_SESSION['admin'] != 1)) {
    echo '<script>window.alert("ERROR! Anda tidak memiliki hak akses untuk mengedit data ini");
          window.location.href="./admin.php?page=tsm";</script>';
    die();
}

$form_errors = $_SESSION['form_errors'] ?? [];
unset($_SESSION['form_errors']);
?>

<style>
    .page-header {
        display: flex; justify-content: space-between; align-items: center;
        border-bottom: 1px solid #e0e0e0; 
        padding: 1rem 0; 
        margin-bottom: 1.5rem;
    }
    .page-header .page-title h4 { 
        font-weight: 500; 
        margin: 0; 
    }
    .form-card { padding: 24px; }
    .error-container { 
        background-color: #ffebee; color: #c62828;
        padding: 15px; margin-bottom: 20px; border-radius: 5px; border-left: 5px solid #c62828;
    }
    .error-container ul { margin: 0; padding-left: 20px; }
    .form-actions { margin-top: 1.5rem; }

    /* PERUBAHAN: CSS untuk input[type="date"] yang lama dihapus */

    /* CSS untuk warna biru saat form aktif (focus) */
    .input-field input:focus + label,
    .input-field textarea:focus + label {
        color: #2196F3 !important;
    }
    .input-field input:focus,
    .input-field textarea:focus {
        border-bottom: 1px solid #2196F3 !important;
        box-shadow: 0 1px 0 0 #2196F3 !important;
        caret-color: #2196F3 !important;
    }
    .input-field .select-wrapper input.select-dropdown:focus {
        border-bottom: 1px solid #2196F3 !important;
    }
    .input-field .prefix.active {
        color: #2196F3 !important;
    }

    .dropdown-content li > span {
        padding-top: 16px;
        padding-bottom: 16px;
    }

    /* CSS untuk warna biru untuk field yang sudah diisi (valid) */
    .input-field input.valid,
    .input-field textarea.valid {
        border-bottom: 1px solid #2196F3 !important;
        box-shadow: 0 1px 0 0 #2196F3 !important;
    }
    .input-field input.valid + label,
    .input-field textarea.valid + label {
        color: #2196F3 !important;
    }
    .input-field .select-wrapper input.select-dropdown.valid {
        border-bottom: 1px solid #2196F3 !important;
    }
    
    /* PERUBAHAN: CSS TAMBAHAN UNTUK TEMA BIRU DATEPICKER */
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
</style>

<div class="row">
    <div class="col s12">
        <div class="page-header">
            <div class="page-title">
                <h4>Edit Data Surat Masuk</h4>
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
            <form class="col s12" method="POST" action="" enctype="multipart/form-data">
                <div class="row">
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">looks_one</i>
                        <input id="no_agenda" type="number" name="no_agenda" value="<?= htmlspecialchars($data['no_agenda']) ?>" required>
                        <label for="no_agenda">Nomor Agenda *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">bookmark</i>
                        <select name="kode" required>
                            <option value="" disabled>Pilih Kode Klasifikasi</option>
                            <?php 
                            $kode_options = ["Permohonan Narasumber", "Undangan", "SE/SKEP", "Biasa", "Rahasia"];
                            foreach($kode_options as $opt) {
                                $selected = ($data['kode'] == $opt) ? 'selected' : '';
                                echo "<option value='{$opt}' {$selected}>{$opt}</option>";
                            }
                            ?>
                        </select>
                        <label>Kode Klasifikasi *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">looks_two</i>
                        <input id="no_surat" type="text" name="no_surat" value="<?= htmlspecialchars($data['no_surat']) ?>" required>
                        <label for="no_surat">Nomor Surat *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">date_range</i>
                        <input id="tgl_surat" type="text" class="datepicker" name="tgl_surat" value="<?= htmlspecialchars($data['tgl_surat']) ?>" required>
                        <label for="tgl_surat">Tanggal Surat *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">place</i>
                        <input id="asal_surat" type="text" name="asal_surat" value="<?= htmlspecialchars($data['asal_surat']) ?>" required>
                        <label for="asal_surat">Asal Surat *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">storage</i>
                        <input id="indeks" type="text" name="indeks" value="<?= htmlspecialchars($data['indeks']) ?>" required>
                        <label for="indeks">Lampiran *</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix">description</i>
                        <textarea id="isi" class="materialize-textarea" name="isi" required><?= htmlspecialchars($data['isi']) ?></textarea>
                        <label for="isi">Perihal *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix">person_pin</i>
                        <input id="keterangan" type="text" name="keterangan" value="<?= htmlspecialchars($data['keterangan']) ?>" required>
                        <label for="keterangan">Penerima *</label>
                    </div>
                     <div class="input-field col s12 m6">
                        <i class="material-icons prefix">low_priority</i>
                        <input id="disposisi" type="text" name="disposisi" value="<?= htmlspecialchars($data['disposisi']) ?>" required>
                        <label for="disposisi">Disposisi *</label>
                    </div>
                    <div class="input-field col s12">
                        <div class="file-field input-field">
                            <div class="btn blue">
                                <span><i class="material-icons left">attach_file</i></span>
                                <input type="file" name="file">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Upload file baru (jika ingin ganti)..." value="<?= htmlspecialchars($data['file']) ?>">
                            </div>
                        </div>
                        <small class="grey-text">*Kosongkan jika tidak ingin mengubah file.</small>
                    </div>
                </div>

                <div class="row form-actions">
                    <div class="col s12">
                        <button type="submit" name="submit" class="btn-large blue waves-effect waves-light">
                            <i class="material-icons left">save</i> SIMPAN PERUBAHAN
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