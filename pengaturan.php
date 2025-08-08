<?php
//cek session
if (empty($_SESSION['admin'])) {
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
} else {

    if ($_SESSION['admin'] != 1 && $_SESSION['admin'] != 2) {
        echo '<script language="javascript">
                window.alert("ERROR! Anda tidak memiliki hak akses untuk membuka halaman ini");
                window.location.href="./logout.php";
              </script>';
    } else {

        if (isset($_REQUEST['sub'])) {
            $sub = $_REQUEST['sub'];
            switch ($sub) {
                case 'back':
                    include "backup.php";
                    break;
                case 'rest':
                    include "restore.php";
                    break;
                case 'usr':
                    include "user.php";
                    break;
            }
        } else {

            if (isset($_REQUEST['submit'])) {

                // Validasi form kosong
                if (
                    $_REQUEST['institusi'] == "" || $_REQUEST['nama'] == "" || $_REQUEST['status'] == "" || $_REQUEST['alamat'] == "" || $_REQUEST['kepsek'] == "" || $_REQUEST['nip'] == ""
                    || $_REQUEST['website'] == "" || $_REQUEST['email'] == ""
                ) {
                    $_SESSION['errEmpty'] = 'ERROR! Semua form wajib diisi';
                    header("Location: ./admin.php?page=sett");
                    die();
                } else {

                    $id_instansi = "1";
                    $institusi = $_REQUEST['institusi'];
                    $nama = $_REQUEST['nama'];
                    $status = $_REQUEST['status'];
                    $alamat = $_REQUEST['alamat'];
                    $kepsek = $_REQUEST['kepsek'];
                    $nip = $_REQUEST['nip'];
                    $website = $_REQUEST['website'];
                    $email = $_REQUEST['email'];
                    $id_user = $_SESSION['id_user'];

                    if (!preg_match("/^[a-zA-Z0-9. -]*$/", $nama)) {
                        $_SESSION['namains'] = 'Form Nama Instansi hanya boleh mengandung huruf, angka, spasi, titik(.) dan strip(-)';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }
                    if (!preg_match("/^[a-zA-Z0-9. -]*$/", $institusi)) {
                        $_SESSION['institusi'] = 'Form Nama Yayasan hanya boleh mengandung huruf, angka, spasi, titik(.) dan strip(-)';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }
                    if (!preg_match("/^[a-zA-Z0-9.,:\/<> \"-]*$/", $status)) {
                        $_SESSION['status'] = 'Form Status mengandung karakter yang tidak diizinkan.';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }
                    if (!preg_match("/^[a-zA-Z0-9.,()\/ -]*$/", $alamat)) {
                        $_SESSION['alamat'] = 'Form Alamat hanya boleh mengandung huruf, angka, spasi, titik(.), koma(,), strip(-), garis miring(/), dan kurung()';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }
                    if (!preg_match("/^[a-zA-Z., ]*$/", $kepsek)) {
                        $_SESSION['kepsek'] = 'Form Nama Kepala hanya boleh mengandung huruf, spasi, titik(.) dan koma(,)';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }
                    if (!preg_match("/^[0-9 -]*$/", $nip)) {
                        $_SESSION['nipkepsek'] = 'Form NIP Ketua hanya boleh mengandung angka, spasi, dan strip(-)';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }
                    if (!filter_var($website, FILTER_VALIDATE_URL)) {
                        $_SESSION['website'] = 'Format URL Website tidak valid';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }
                    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                        $_SESSION['email'] = 'Format Email tidak valid';
                        header("Location: ./admin.php?page=sett");
                        die();
                    }

                    $ekstensi = array('png', 'jpg', 'jpeg');
                    $logo = $_FILES['logo']['name'];
                    $x = explode('.', $logo);
                    $eks = strtolower(end($x));
                    $ukuran = $_FILES['logo']['size'];
                    $target_dir = "upload/";

                    if (!is_dir($target_dir)) {
                        mkdir($target_dir, 0755, true);
                    }

                    if (!empty($logo)) {
                        if (in_array($eks, $ekstensi) === true) {
                            if ($ukuran < 2000000) { //max 2MB
                                $query = mysqli_query($config, "SELECT logo FROM tbl_instansi WHERE id_instansi='$id_instansi'");
                                list($old_logo) = mysqli_fetch_array($query);

                                if (!empty($old_logo) && file_exists($target_dir . $old_logo)) {
                                    unlink($target_dir . $old_logo);
                                }
                                
                                move_uploaded_file($_FILES['logo']['tmp_name'], $target_dir . $logo);

                                $query = mysqli_query($config, "UPDATE tbl_instansi SET institusi='$institusi', nama='$nama', status='$status', alamat='$alamat', kepsek='$kepsek', nip='$nip', website='$website', email='$email', logo='$logo', id_user='$id_user' WHERE id_instansi='$id_instansi'");

                                if ($query) {
                                    $_SESSION['succEdit'] = 'SUKSES! Data instansi berhasil diupdate.';
                                    header("Location: ./admin.php?page=sett");
                                    die();
                                } else {
                                    $_SESSION['errQ'] = 'ERROR! Gagal mengupdate data.';
                                    header("Location: ./admin.php?page=sett");
                                    die();
                                }
                            } else {
                                $_SESSION['errSize'] = 'Ukuran file terlalu besar! Maksimal 2 MB.';
                                header("Location: ./admin.php?page=sett");
                                die();
                            }
                        } else {
                            $_SESSION['errFormat'] = 'Format file tidak diizinkan! Hanya .JPG, .JPEG, atau .PNG';
                            header("Location: ./admin.php?page=sett");
                            die();
                        }
                    } else {
                        // Jika logo tidak diisi
                        $query = mysqli_query($config, "UPDATE tbl_instansi SET institusi='$institusi', nama='$nama', status='$status', alamat='$alamat', kepsek='$kepsek', nip='$nip', website='$website', email='$email', id_user='$id_user' WHERE id_instansi='$id_instansi'");

                        if ($query) {
                            $_SESSION['succEdit'] = 'SUKSES! Data instansi berhasil diupdate.';
                            header("Location: ./admin.php?page=sett");
                            die();
                        } else {
                            $_SESSION['errQ'] = 'ERROR! Gagal mengupdate data.';
                            header("Location: ./admin.php?page=sett");
                            die();
                        }
                    }
                }
            } else {
                $query = mysqli_query($config, "SELECT * FROM tbl_instansi WHERE id_instansi='1'");
                if (mysqli_num_rows($query) > 0) {
                    $row = mysqli_fetch_array($query);
?>
                    <style>
                        .page-container { padding: 20px 0; animation: fadeIn 0.5s ease-in-out; }
                        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
                        .form-card { border-radius: 10px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); margin-top: 15px; }
                        .card-header { padding: 24px; background-color: #f5f5f5; border-bottom: 1px solid #e0e0e0; border-radius: 10px 10px 0 0; }
                        .card-header .card-title { margin: 0; font-size: 1.8rem; font-weight: 500; color: #333; }
                        .form-section-title { font-size: 1.2rem; color: #616161; margin-top: 2rem; margin-bottom: 1.5rem; border-bottom: 2px solid #1A87C7; padding-bottom: 8px; }
                        .input-field label { color: #1A87C7; }
                        .input-field .prefix.active { color: #1A87C7; }
                        .logo-preview-container { display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100%; text-align: center; background-color: #fafafa; border: 2px dashed #e0e0e0; border-radius: 8px; padding: 20px; }
                        .logo-preview { max-width: 150px; max-height: 150px; border-radius: 50%; border: 3px solid #e0e0e0; object-fit: cover; margin-top: 15px; }
                        .logo-preview-label { font-size: 1rem; color: #757575; font-weight: 500; }
                        .button-container { display: flex; justify-content: flex-end; gap: 1rem; margin-top: 2rem; }
                        .callout-error { font-size: 0.8rem; color: #f44336; margin-top: -15px; margin-bottom: 10px; }
                        .notif .material-icons { vertical-align: middle; margin-right: 10px; }
                        .input-field input:focus,
                        .input-field textarea:focus { border-bottom: 1px solid #1A87C7 !important; box-shadow: 0 1px 0 0 #1A87C7 !important; }
                        .input-field input:focus + label,
                        .input-field textarea:focus + label { color: #1A87C7 !important; }
                        .input-field input.valid,
                        .input-field textarea.valid { border-bottom: 1px solid #1A87C7 !important; box-shadow: 0 1px 0 0 #1A87C7 !important; }
                    </style>

                    <div class="row page-container">
                        <div class="col s12">
                            <nav class="secondary-nav">
                                <div class="nav-wrapper blue-grey darken-1">
                                    <ul class="left">
                                        <li class="waves-effect waves-light"><a href="?page=sett" class="judul"><i class="material-icons">work</i> Manajemen Instansi</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <div class="col s12">
                            <?php
                                if (isset($_SESSION['errEmpty'])) {
                                    echo '<div id="alert-message" class="card red lighten-5"><div class="card-content notif"><span class="card-title red-text"><i class="material-icons">clear</i>' . $_SESSION['errEmpty'] . '</span></div></div>';
                                    unset($_SESSION['errEmpty']);
                                }
                                if (isset($_SESSION['succEdit'])) {
                                    echo '<div id="alert-message" class="card green lighten-5"><div class="card-content notif"><span class="card-title green-text"><i class="material-icons">done</i>' . $_SESSION['succEdit'] . '</span></div></div>';
                                    unset($_SESSION['succEdit']);
                                }
                                if (isset($_SESSION['errQ'])) {
                                    echo '<div id="alert-message" class="card red lighten-5"><div class="card-content notif"><span class="card-title red-text"><i class="material-icons">clear</i>' . $_SESSION['errQ'] . '</span></div></div>';
                                    unset($_SESSION['errQ']);
                                }
                            ?>
                        </div>

                        <div class="col s12">
                            <div class="card form-card">
                                <div class="card-content">
                                    <form class="col s12" method="post" action="?page=sett" enctype="multipart/form-data">
                                        <input type="hidden" value="<?php echo $row['id_instansi']; ?>" name="id_instansi">

                                        <h3 class="form-section-title">Informasi Utama</h3>
                                        <div class="row">
                                            <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">school</i>
                                                <input id="nama" type="text" class="validate" name="nama" value="<?php echo htmlspecialchars($row['nama']); ?>" required>
                                                <label for="nama">Nama Instansi</label>
                                                <?php if (isset($_SESSION['namains'])) { echo '<div class="callout-error">' . $_SESSION['namains'] . '</div>'; unset($_SESSION['namains']); } ?>
                                            </div>
                                            <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">work</i>
                                                <input id="institusi" type="text" class="validate" name="institusi" value="<?php echo htmlspecialchars($row['institusi']); ?>" required>
                                                <label for="institusi">Nama Lembaga/Yayasan</label>
                                                 <?php if (isset($_SESSION['institusi'])) { echo '<div class="callout-error">' . $_SESSION['institusi'] . '</div>'; unset($_SESSION['institusi']); } ?>
                                            </div>
                                            <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">assistant_photo</i>
                                                <input id="status" type="text" class="validate" name="status" value='<?php echo htmlspecialchars($row['status']); ?>' required>
                                                <label for="status">Status</label>
                                                 <?php if (isset($_SESSION['status'])) { echo '<div class="callout-error">' . $_SESSION['status'] . '</div>'; unset($_SESSION['status']); } ?>
                                            </div>
                                             <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">place</i>
                                                <input id="alamat" type="text" class="validate" name="alamat" value="<?php echo htmlspecialchars($row['alamat']); ?>" required>
                                                <label for="alamat">Alamat</label>
                                                <?php if (isset($_SESSION['alamat'])) { echo '<div class="callout-error">' . $_SESSION['alamat'] . '</div>'; unset($_SESSION['alamat']); } ?>
                                            </div>
                                        </div>

                                        <h3 class="form-section-title">Informasi Pimpinan & Kontak</h3>
                                        <div class="row">
                                            <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">account_box</i>
                                                <input id="kepsek" type="text" class="validate" name="kepsek" value="<?php echo htmlspecialchars($row['kepsek']); ?>" required>
                                                <label for="kepsek">Nama Kepala</label>
                                                <?php if (isset($_SESSION['kepsek'])) { echo '<div class="callout-error">' . $_SESSION['kepsek'] . '</div>'; unset($_SESSION['kepsek']); } ?>
                                            </div>
                                            <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">looks_one</i>
                                                <input id="nip" type="text" class="validate" name="nip" value="<?php echo htmlspecialchars($row['nip']); ?>" required>
                                                <label for="nip">NIP Ketua</label>
                                                <?php if (isset($_SESSION['nipkepsek'])) { echo '<div class="callout-error">' . $_SESSION['nipkepsek'] . '</div>'; unset($_SESSION['nipkepsek']); } ?>
                                            </div>
                                            <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">language</i>
                                                <input id="website" type="url" class="validate" name="website" value="<?php echo htmlspecialchars($row['website']); ?>" required>
                                                <label for="website">Website</label>
                                                <?php if (isset($_SESSION['website'])) { echo '<div class="callout-error">' . $_SESSION['website'] . '</div>'; unset($_SESSION['website']); } ?>
                                            </div>
                                            <div class="input-field col s12 m6">
                                                <i class="material-icons prefix">mail</i>
                                                <input id="email" type="email" class="validate" name="email" value="<?php echo htmlspecialchars($row['email']); ?>" required>
                                                <label for="email">Email Instansi</label>
                                                <?php if (isset($_SESSION['email'])) { echo '<div class="callout-error">' . $_SESSION['email'] . '</div>'; unset($_SESSION['email']); } ?>
                                            </div>
                                        </div>
                                        
                                        <h3 class="form-section-title">Logo Instansi</h3>
                                        <div class="row" style="align-items: flex-end;">
                                             <div class="col s12 m7">
                                                 <div class="file-field input-field">
                                                      <div class="btn blue">
                                                          <span><i class="material-icons left">image</i></span>
                                                          <input type="file" id="logo" name="logo" accept=".jpg,.jpeg,.png">
                                                      </div>
                                                      <div class="file-path-wrapper">
                                                          <input class="file-path validate" type="text" placeholder="Upload logo baru (opsional)">
                                                      </div>
                                                  </div>
                                                 <small class="grey-text">* Format: JPG, PNG. Ukuran Max: 2 MB. Kosongkan jika tidak ingin mengubah logo.</small>
                                                 <?php 
                                                   if (isset($_SESSION['errSize'])) { echo '<div class="callout-error">' . $_SESSION['errSize'] . '</div>'; unset($_SESSION['errSize']); } 
                                                   if (isset($_SESSION['errFormat'])) { echo '<div class="callout-error">' . $_SESSION['errFormat'] . '</div>'; unset($_SESSION['errFormat']); }
                                                 ?>
                                             </div>
                                            <div class="col s12 m5">
                                                 <div class="logo-preview-container">
                                                     <span class="logo-preview-label">Logo Saat Ini:</span>
                                                     <img class="logo-preview" src="upload/<?php echo htmlspecialchars($row['logo']); ?>?t=<?php echo time(); // Cache buster ?>"/>
                                                 </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col s12 button-container">
                                                <a href="./admin.php" class="btn-large waves-effect waves-light deep-orange white-text">BATAL <i class="material-icons left">clear</i></a>
                                                <button type="submit" name="submit" class="btn-large waves-effect waves-light blue">SIMPAN <i class="material-icons left">done</i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                }
            }
        }
    }
}
?>