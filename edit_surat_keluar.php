<?php
// Pastikan sesi admin aktif
if (empty($_SESSION['admin'])) {
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
}

$id_surat = mysqli_real_escape_string($config, $_REQUEST['id_surat']);

// =================================================================
// 1. LOGIKA PEMROSESAN FORM (SAAT TOMBOL SUBMIT DITEKAN)
// =================================================================
if (isset($_POST['submit'])) {
    // Keamanan: Gunakan $_POST dan bersihkan input
    $no_agenda = trim($_POST['no_agenda']);
    $no_surat = trim($_POST['no_surat']);
    $tujuan = trim($_POST['tujuan']);
    $isi = trim($_POST['isi']);
    $kode = trim($_POST['kode']);
    $tgl_surat = trim($_POST['tgl_surat']);
    $keterangan = trim($_POST['keterangan']);
    $id_user = $_SESSION['id_user'];
    
    $errors = [];

    // Validasi Form
    if (empty($no_agenda) || empty($no_surat) || empty($tujuan) || empty($isi) || empty($kode) || empty($tgl_surat)) {
        $errors[] = "Semua form bertanda (*) wajib diisi!";
    }
    // Tambahkan validasi lain jika perlu...

    if (!empty($errors)) {
        $_SESSION['form_errors'] = $errors;
        header("Location: ./admin.php?page=tsk&act=edit&id_surat=$id_surat");
        die();
    } else {
        $file_name = '';
        $upload_dir = "upload/surat_keluar/";
        
        // Logika File Upload
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
                // Hapus file lama jika ada
                $stmt_old_file = mysqli_prepare($config, "SELECT file FROM tbl_surat_keluar WHERE id_surat=?");
                mysqli_stmt_bind_param($stmt_old_file, "i", $id_surat);
                mysqli_stmt_execute($stmt_old_file);
                $result_old_file = mysqli_stmt_get_result($stmt_old_file);
                if ($row_old_file = mysqli_fetch_assoc($result_old_file)) {
                    if (!empty($row_old_file['file']) && file_exists($upload_dir . $row_old_file['file'])) {
                        unlink($upload_dir . $row_old_file['file']);
                    }
                }
                
                // Buat nama file baru yang unik
                $file_name = uniqid() . '-' . basename($file['name']);
                if (!move_uploaded_file($file['tmp_name'], $upload_dir . $file_name)) {
                    $errors[] = "Gagal mengupload file.";
                }
            }
        }

        if (!empty($errors)) {
            $_SESSION['form_errors'] = $errors;
            header("Location: ./admin.php?page=tsk&act=edit&id_surat=$id_surat");
            die();
        }

        // Keamanan: Update data dengan Prepared Statements
        if (!empty($file_name)) {
            // Jika ada file baru diupload
            $sql = "UPDATE tbl_surat_keluar SET no_agenda=?, tujuan=?, no_surat=?, isi=?, kode=?, tgl_surat=?, file=?, keterangan=?, id_user=? WHERE id_surat=?";
            $stmt = mysqli_prepare($config, $sql);
            mysqli_stmt_bind_param($stmt, "ssssssssii", $no_agenda, $tujuan, $no_surat, $isi, $kode, $tgl_surat, $file_name, $keterangan, $id_user, $id_surat);
        } else {
            // Jika tidak ada file baru
            $sql = "UPDATE tbl_surat_keluar SET no_agenda=?, tujuan=?, no_surat=?, isi=?, kode=?, tgl_surat=?, keterangan=?, id_user=? WHERE id_surat=?";
            $stmt = mysqli_prepare($config, $sql);
            mysqli_stmt_bind_param($stmt, "sssssssii", $no_agenda, $tujuan, $no_surat, $isi, $kode, $tgl_surat, $keterangan, $id_user, $id_surat);
        }

        if (mysqli_stmt_execute($stmt)) {
            $_SESSION['succEdit'] = 'SUKSES! Data berhasil diperbarui.';
            header("Location: ./admin.php?page=tsk");
            die();
        } else {
            $_SESSION['form_errors'] = ["ERROR! Gagal memperbarui data."];
            header("Location: ./admin.php?page=tsk&act=edit&id_surat=$id_surat");
            die();
        }
    }
}

// 3. AMBIL DATA SURAT UNTUK DITAMPILKAN DI FORM
// =============================================
$stmt = mysqli_prepare($config, "SELECT * FROM tbl_surat_keluar WHERE id_surat=?");
mysqli_stmt_bind_param($stmt, "i", $id_surat);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$data = mysqli_fetch_assoc($result);

if (!$data || ($_SESSION['id_user'] != $data['id_user'] && $_SESSION['admin'] != 1)) {
    echo '<script>window.alert("ERROR! Anda tidak memiliki hak akses untuk mengedit data ini");
            window.location.href="./admin.php?page=tsk";</script>';
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
</style>

<div class="row">
    <div class="col s12">
        <div class="page-header">
            <div class="page-title">
                <h4>Edit Data Surat Keluar</h4>
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
        <a id="link-cetak-disposisi" href="cetak_disposisi.php?id_surat=<?= $id_surat ?>" target="_blank" class="btn-large waves-effect waves-light green" style="width:100%;">
            <i class="material-icons left">print</i>
            Cetak Lembar Disposisi Nota Dinas
        </a>
    </div>
</div>


<div class="row">
    <div class="col s12">
        <div class="card form-card">
            <form class="col s12" method="POST" action="" enctype="multipart/form-data">
                <div class="row">
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix active">looks_one</i>
                        <input id="no_agenda" type="number" name="no_agenda" value="<?= htmlspecialchars($data['no_agenda']) ?>" required>
                        <label for="no_agenda">Nomor Agenda *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix active">bookmark</i>
                        <select id="kode" name="kode" required>
                            <option value="" disabled>Pilih Kode Klasifikasi</option>
                            <?php 
                            $kode_options = ["Sprin", "Undangan", "SE/SKEP", "Biasa", "Rahasia", "SPPD", "Berita Acara", "Nota Dinas"];
                            foreach($kode_options as $opt) {
                                $selected = ($data['kode'] == $opt) ? 'selected' : '';
                                echo "<option value='{$opt}' {$selected}>{$opt}</option>";
                            }
                            ?>
                        </select>
                        <label>Kode Klasifikasi *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix active">looks_two</i>
                        <input id="no_surat" type="text" name="no_surat" value="<?= htmlspecialchars($data['no_surat']) ?>" required>
                        <label for="no_surat">Nomor Surat *</label>
                    </div>
                    <div class="input-field col s12 m6">
                        <i class="material-icons prefix active">date_range</i>
                        <input id="tgl_surat" type="text" class="datepicker" name="tgl_surat" value="<?= htmlspecialchars($data['tgl_surat']) ?>" required>
                        <label for="tgl_surat">Tanggal Surat *</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix active">place</i>
                        <input id="tujuan" type="text" name="tujuan" value="<?= htmlspecialchars($data['tujuan']) ?>" required>
                        <label for="tujuan">Tujuan Surat *</label>
                    </div>
                    <div class="input-field col s12">
                        <i class="material-icons prefix active">description</i>
                        <textarea id="isi" class="materialize-textarea" name="isi" required><?= htmlspecialchars($data['isi']) ?></textarea>
                        <label for="isi">Perihal *</label>
                    </div>
                    <div class="input-field col s12" style="display:none;"> <i class="material-icons prefix active">featured_play_list</i>
                        <input id="keterangan" type="text" name="keterangan" value="<?= htmlspecialchars($data['keterangan']) ?>" >
                        <label for="keterangan">Keterangan *</label>
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
                        <a href="?page=tsk" class="btn-large deep-orange waves-effect waves-light white-text">
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

    // === LOGIKA UNTUK NOTA DINAS ===
    const selectKode = document.getElementById('kode');
    const tombolCetakContainer = document.getElementById('tombol-cetak-container');
    
    function toggleTombolCetak() {
        if (selectKode.value === 'Nota Dinas') {
            tombolCetakContainer.style.display = 'block';
        } else {
            tombolCetakContainer.style.display = 'none';
        }
    }
    
    // Panggil fungsi saat dropdown klasifikasi berubah
    selectKode.addEventListener('change', toggleTombolCetak);
    
    // Panggil fungsi sekali saat halaman dimuat untuk memeriksa kondisi awal
    toggleTombolCetak();
});
</script>