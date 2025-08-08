<?php
// =================================================================
// PROFIL PENGGUNA (EDIT PROFIL & GANTI PASSWORD)
// =================================================================

// 1. PENGECEKAN SESSION
if (empty($_SESSION['admin'])) {
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
}

// 2. FUNGSI BANTUAN (HELPERS)
function set_flash_message($key, $value) {
    $_SESSION['flash'][$key] = $value;
}

function get_flash_message($key) {
    if (isset($_SESSION['flash'][$key])) {
        $value = $_SESSION['flash'][$key];
        unset($_SESSION['flash'][$key]);
        return $value;
    }
    return null;
}

function old_input($key, $default = '') {
    return $_SESSION['flash']['old_input'][$key] ?? $default;
}

// 3. LOGIKA PEMROSESAN FORM (VERSI MD5 - TIDAK AMAN)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['submit'])) {
    
    $_SESSION['flash']['old_input'] = $_POST;

    $id_user       = $_SESSION['id_user'];
    $username      = trim($_POST['username']);
    $nama          = trim($_POST['nama']);
    $nip           = trim($_POST['nip']);
    $password_lama = $_POST['password_lama'];
    $password_baru = $_POST['password_baru'];

    if (!isset($config) || !$config) {
        die("Koneksi database tidak ditemukan. Pastikan variabel \$config sudah di-include dengan benar.");
    }

    $errors = [];
    if (empty($username)) { $errors[] = "Username wajib diisi!"; }
    if (empty($nama)) { $errors[] = "Nama Lengkap wajib diisi!"; }
    if (empty($nip)) { $errors[] = "NIP wajib diisi!"; }
    if (!preg_match("/^[a-zA-Z0-9_]{5,}$/", $username)) {
        $errors[] = "Username minimal 5 karakter (huruf, angka, underscore).";
    }
    if (!preg_match("/^[a-zA-Z., ]*$/", $nama)) {
        $errors[] = "Nama hanya boleh mengandung huruf, spasi, titik, dan koma.";
    }

    $update_password = false;
    if (!empty($password_baru)) {
        $update_password = true;
        if (empty($password_lama)) {
            $errors[] = "Untuk ganti password, Password Lama wajib diisi.";
        }
        if (strlen($password_baru) < 5) {
            $errors[] = "Password baru minimal 5 karakter.";
        }
    }

    if (!empty($errors)) {
        set_flash_message('errors', $errors);
        header("Location: ./admin.php?page=pro&sub=pass");
        die();
    }

    // PENGECEKAN PASSWORD LAMA
    if ($update_password) {
        $stmt_check = mysqli_prepare($config, "SELECT password FROM tbl_user WHERE id_user=?");
        mysqli_stmt_bind_param($stmt_check, "i", $id_user);
        mysqli_stmt_execute($stmt_check);
        $result = mysqli_stmt_get_result($stmt_check);
        $user = mysqli_fetch_assoc($result);

        // Diubah: Memeriksa password lama dengan md5()
        if (!$user || md5($password_lama) !== $user['password']) {
            set_flash_message('errors', ["Password lama yang Anda masukkan salah."]);
            header("Location: ./admin.php?page=pro&sub=pass");
            die();
        }
    }

    // PROSES UPDATE DATABASE
    if ($update_password) {
        // Diubah: Menyimpan password baru juga dengan md5()
        $md5_password_baru = md5($password_baru);
        $stmt_update = mysqli_prepare($config, "UPDATE tbl_user SET username=?, nama=?, nip=?, password=? WHERE id_user=?");
        mysqli_stmt_bind_param($stmt_update, "ssssi", $username, $nama, $nip, $md5_password_baru, $id_user);
    } else {
        $stmt_update = mysqli_prepare($config, "UPDATE tbl_user SET username=?, nama=?, nip=? WHERE id_user=?");
        mysqli_stmt_bind_param($stmt_update, "sssi", $username, $nama, $nip, $id_user);
    }
    
    // Eksekusi dan periksa hasilnya
    if (mysqli_stmt_execute($stmt_update)) {
        if (mysqli_stmt_affected_rows($stmt_update) > 0) {
            // Perbarui data di session setelah berhasil
            $_SESSION['nama']     = $nama;
            $_SESSION['username'] = $username;
            $_SESSION['nip']      = $nip;
            
            set_flash_message('success', 'SUKSES! Profil Anda telah berhasil diperbarui.');
            header("Location: ./admin.php?page=pro");
            die();
        } else {
            set_flash_message('errors', ["Tidak ada data yang diubah."]);
        }
    } else {
        $error_detail = mysqli_stmt_error($stmt_update);
        set_flash_message('errors', ["GAGAL! Terjadi kesalahan teknis.", "Detail Error: " . $error_detail]);
    }
    
    header("Location: ./admin.php?page=pro&sub=pass");
    die();
}

// 4. PERSIAPAN DATA UNTUK TAMPILAN (VIEW)
$success_message = get_flash_message('success');
$error_messages  = get_flash_message('errors');
?>

<style>
    :root {
        --primary-color: #26a69a; /* Teal */
        --secondary-color: #42a5f5; /* Blue */
        --error-color: #ef5350; /* Red */
        --success-color: #66bb6a; /* Green */
        --card-bg: #ffffff;
        --text-dark: #424242;
        --text-light: #757575;
        --border-light: #eee;
        --bg-light: #fafafa;
    }
    .profile-container { padding: 2rem 0; }
    .profile-card, .edit-profile-card {
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        border: 1px solid var(--border-light);
        overflow: hidden;
    }
    .profile-header, .edit-header {
        text-align: center;
        padding: 2.5rem 2rem;
        border-bottom: 1px solid var(--border-light);
    }
    .profile-header i.large {
        font-size: 6rem;
        color: var(--secondary-color);
    }
    .profile-header h4 { margin: 1rem 0 0.5rem 0; font-weight: 500; color: var(--text-dark); }
    .profile-header p { margin: 0; color: var(--text-light); }
    .profile-body { padding: 2.5rem; }
    .info-item { display: flex; align-items: center; margin-bottom: 1.8rem; font-size: 1.1rem; }
    .info-item i {
        margin-right: 1.5rem;
        color: var(--secondary-color);
    }
    .info-item .info-label { color: var(--text-light); width: 120px; }
    .info-item .info-value { font-weight: 500; color: var(--text-dark); }
    .profile-action, .edit-form .button-group { padding: 2rem; background-color: var(--bg-light); }
    .edit-header .card-title { font-size: 1.8rem; font-weight: 500; display: flex; align-items: center; justify-content: center; gap: 0.5rem; }
    .edit-form .input-field label { font-size: 1rem; }
    .button-group { display: flex; gap: 1rem; justify-content: center; border-top: 1px solid var(--border-light); }
    .edit-form .input-field .prefix {
        color: var(--secondary-color);
    }
    .input-field .prefix.active {
        color: var(--secondary-color) !important;
    }
    .flash-message { margin: 1.5rem; padding: 1rem; border-radius: 8px; display: flex; align-items: flex-start; }
    .flash-message i { margin-right: 10px; }
    .flash-message ul { margin: 0; padding-left: 20px; }
    .flash-success { background-color: #e8f5e9; color: #2e7d32; }
    .flash-error { background-color: #ffebee; color: #c62828; }

    /* CSS TAMBAHAN UNTUK WARNA BIRU PADA FORM */
    .edit-form .input-field input[type=text]:focus + label,
    .edit-form .input-field input[type=password]:focus + label {
        color: var(--secondary-color) !important; /* Warna biru untuk label saat aktif */
    }

    .edit-form .input-field input[type=text]:focus,
    .edit-form .input-field input[type=password]:focus {
        border-bottom: 1px solid var(--secondary-color) !important;
        box-shadow: 0 1px 0 0 var(--secondary-color) !important;
    }
</style>

<div class="profile-container">
<?php
if (isset($_GET['sub']) && $_GET['sub'] == 'pass') {
?>
    <div class="row">
        <div class="col s12 m10 l8 offset-m1 offset-l2">
            <div class="card edit-profile-card">
                <div class="card-content" style="padding:0;">
                    <div class="edit-header">
                        <span class="card-title blue-text">
                            <i class="material-icons">edit</i> Edit Profil & Password
                        </span>
                    </div>

                    <?php if (!empty($error_messages)): ?>
                        <div class="flash-message flash-error">
                            <i class="material-icons">error_outline</i>
                            <div>
                                <strong>Terjadi Kesalahan:</strong>
                                <ul>
                                    <?php foreach ($error_messages as $error): ?>
                                        <li><?= htmlspecialchars($error); ?></li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
                    <?php endif; ?>

                    <form method="POST" action="?page=pro&sub=pass" class="edit-form" style="padding: 2rem;">
                        <div class="row">
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="username" name="username" type="text" value="<?= htmlspecialchars(old_input('username', $_SESSION['username'])); ?>" required>
                                <label for="username">Username</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">person</i>
                                <input id="nama" name="nama" type="text" value="<?= htmlspecialchars(old_input('nama', $_SESSION['nama'])); ?>" required>
                                <label for="nama">Nama Lengkap</label>
                            </div>
                            <div class="input-field col s12">
                                <i class="material-icons prefix">fingerprint</i>
                                <input id="nip" name="nip" type="text" value="<?= htmlspecialchars(old_input('nip', $_SESSION['nip'])); ?>" required>
                                <label for="nip">NIP</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">lock_outline</i>
                                <input id="password_lama" name="password_lama" type="password">
                                <label for="password_lama">Password Lama</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">lock</i>
                                <input id="password_baru" name="password_baru" type="password">
                                <label for="password_baru">Password Baru</label>
                            </div>
                        </div>
                        <div class="button-group">
                            <button type="submit" name="submit" class="btn-large waves-effect waves-light teal"><i class="material-icons left">save</i>Simpan Perubahan</button>
                            <a href="?page=pro" class="btn-large waves-effect waves-light red lighten-1 white-text"><i class="material-icons left">cancel</i>Batal</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php
} else {
?>
    <div class="row">
        <div class="col s12 m10 l8 offset-m1 offset-l2">
            <div class="card profile-card">
                <div class="profile-header">
                    <i class="material-icons large">account_circle</i>
                    <h4><?= htmlspecialchars($_SESSION['nama']); ?></h4>
                    <p class="grey-text">NIP: <?= htmlspecialchars($_SESSION['nip']); ?></p>
                </div>

                <?php if ($success_message): ?>
                    <div class="flash-message flash-success">
                        <i class="material-icons">check_circle</i>
                        <span><?= htmlspecialchars($success_message); ?></span>
                    </div>
                <?php endif; ?>
                
                <div class="profile-body">
                    <div class="info-item">
                        <i class="material-icons">person_pin</i>
                        <span class="info-label">Username</span>
                        <span class="info-value"><?= htmlspecialchars($_SESSION['username']); ?></span>
                    </div>
                    <div class="info-item">
                        <i class="material-icons">lock</i>
                        <span class="info-label">Password</span>
                        <span class="info-value grey-text">********** (Terenkripsi)</span>
                    </div>
                </div>

                <div class="profile-action center-align">
                    <a href="?page=pro&sub=pass" class="btn-large waves-effect waves-light blue white-text">
                        <i class="material-icons left">edit</i>Edit Profil & Password
                    </a>
                </div>
            </div>
        </div>
    </div>
<?php
}
?>
</div>