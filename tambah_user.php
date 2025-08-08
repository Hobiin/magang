<?php
    // Cek session
    if (empty($_SESSION['admin'])) {
        $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
        header("Location: ./");
        die();
    } else {
        if (isset($_REQUEST['submit'])) {
            // Validasi form kosong
            if ($_REQUEST['username'] == "" || $_REQUEST['password'] == "" || $_REQUEST['nama'] == "" || $_REQUEST['nip'] == "" || $_REQUEST['admin'] == "") {
                $_SESSION['errEmpty'] = 'ERROR! Semua kolom wajib diisi!';
                header("Location: ./admin.php?page=sett&sub=usr&act=add");
                die();
            } else {
                $username = $_REQUEST['username'];
                $password = $_REQUEST['password'];
                $nama = $_REQUEST['nama'];
                $nip = $_REQUEST['nip'];
                $admin = $_REQUEST['admin'];

                // Validasi input data (LOGIKA PHP TIDAK DIUBAH)
                if (!preg_match("/^[a-zA-Z0-9_]*$/", $username)) {
                    $_SESSION['uname'] = 'Username hanya boleh mengandung huruf, angka dan underscore (_).';
                    echo '<script language="javascript">window.history.back();</script>';
                } else {
                    if (!preg_match("/^[a-zA-Z., ]*$/", $nama)) {
                        $_SESSION['namauser'] = 'Nama hanya boleh mengandung huruf, spasi, titik(.) dan koma(,).';
                        echo '<script language="javascript">window.history.back();</script>';
                    } else {
                        if (!preg_match("/^[0-9. -]*$/", $nip)) {
                            $_SESSION['nipuser'] = 'NIP hanya boleh mengandung angka, spasi dan minus(-).';
                            echo '<script language="javascript">window.history.back();</script>';
                        } else {
                            if (!preg_match("/^[2-3]*$/", $admin)) {
                                $_SESSION['tipeuser'] = 'Tipe User hanya boleh diisi dengan angka 2 atau 3.';
                                echo '<script language="javascript">window.history.back();</script>';
                            } else {
                                $cek = mysqli_query($config, "SELECT * FROM tbl_user WHERE username='$username'");
                                $result = mysqli_num_rows($cek);

                                if ($result > 0) {
                                    $_SESSION['errUsername'] = 'Username sudah terpakai, gunakan yang lain!';
                                    echo '<script language="javascript">window.history.back();</script>';
                                } else {
                                    if (strlen($username) < 5) {
                                        $_SESSION['errUser5'] = 'Username minimal 5 karakter!';
                                        echo '<script language="javascript">window.history.back();</script>';
                                    } else {
                                        if (strlen($password) < 5) {
                                            $_SESSION['errPassword'] = 'Password minimal 5 karakter!';
                                            echo '<script language="javascript">window.history.back();</script>';
                                        } else {
                                            // Namun, sesuai permintaan, logika tidak diubah. Tetap menggunakan MD5.
                                            $query = mysqli_query($config, "INSERT INTO tbl_user(username,password,nama,nip,admin) VALUES('$username',MD5('$password'),'$nama','$nip','$admin')");

                                            if ($query != false) {
                                                $_SESSION['succAdd'] = 'SUKSES! User baru berhasil ditambahkan.';
                                                header("Location: ./admin.php?page=sett&sub=usr");
                                                die();
                                            } else {
                                                $_SESSION['errQ'] = 'ERROR! Terjadi masalah dengan query database.';
                                                echo '<script language="javascript">window.history.back();</script>';
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
?>
    <div class="row">
        <div class="col s12">
            <nav class="secondary-nav">
                <div class="nav-wrapper blue-grey darken-1">
                    <ul class="left">
                        <li class="waves-effect waves-light"><a href="?page=sett&sub=usr&act=add" class="judul"><i class="material-icons">person_add</i> Tambah User</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        </div>
    <?php
        // Notifikasi diletakkan di atas form untuk tampilan yang lebih bersih
        if (isset($_SESSION['errQ'])) {
            echo '<div class="alert-message alert-danger"><i class="material-icons">error</i>' . $_SESSION['errQ'] . '</div>';
            unset($_SESSION['errQ']);
        }
        if (isset($_SESSION['errEmpty'])) {
            echo '<div class="alert-message alert-danger"><i class="material-icons">error_outline</i>' . $_SESSION['errEmpty'] . '</div>';
            unset($_SESSION['errEmpty']);
        }
    ?>

    <div class="row jarak-form">
        <div class="col s12">
            <div class="card form-card">
                <div class="card-content">
                    <form class="col s12" method="post" action="?page=sett&sub=usr&act=add">
                        <div class="row">
                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix md-prefix">account_circle</i>
                                <input id="username" type="text" class="validate" name="username" required>
                                <label for="username">Username</label>
                                <?php
                                if (isset($_SESSION['uname'])) {
                                    echo '<span class="helper-text red-text">' . $_SESSION['uname'] . '</span>';
                                    unset($_SESSION['uname']);
                                }
                                if (isset($_SESSION['errUsername'])) {
                                    echo '<span class="helper-text red-text">' . $_SESSION['errUsername'] . '</span>';
                                    unset($_SESSION['errUsername']);
                                }
                                if (isset($_SESSION['errUser5'])) {
                                    echo '<span class="helper-text red-text">' . $_SESSION['errUser5'] . '</span>';
                                    unset($_SESSION['errUser5']);
                                }
                                ?>
                            </div>

                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix md-prefix">text_fields</i>
                                <input id="nama" type="text" class="validate" name="nama" required>
                                <label for="nama">Nama Lengkap</label>
                                <?php
                                if (isset($_SESSION['namauser'])) {
                                    echo '<span class="helper-text red-text">' . $_SESSION['namauser'] . '</span>';
                                    unset($_SESSION['namauser']);
                                }
                                ?>
                            </div>

                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix md-prefix">lock</i>
                                <input id="password" type="password" class="validate" name="password" required>
                                <label for="password">Password</label>
                                <?php
                                if (isset($_SESSION['errPassword'])) {
                                    echo '<span class="helper-text red-text">' . $_SESSION['errPassword'] . '</span>';
                                    unset($_SESSION['errPassword']);
                                }
                                ?>
                            </div>

                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix md-prefix">looks_one</i>
                                <input id="nip" type="text" class="validate" name="nip" required>
                                <label for="nip">NIP</label>
                                <?php
                                if (isset($_SESSION['nipuser'])) {
                                    echo '<span class="helper-text red-text">' . $_SESSION['nipuser'] . '</span>';
                                    unset($_SESSION['nipuser']);
                                }
                                ?>
                            </div>

                            <div class="input-field col s12 m6">
                                <i class="material-icons prefix">supervisor_account</i>
                                <select name="admin" id="admin" required>
                                    <option value="" disabled selected>Pilih Tipe User</option>
                                    <option value="3">User Biasa</option>
                                    <option value="2">Administrator</option>
                                </select>
                                <label for="admin"></label>
                                <?php
                                if (isset($_SESSION['tipeuser'])) {
                                    echo '<span class="helper-text red-text">' . $_SESSION['tipeuser'] . '</span>';
                                    unset($_SESSION['tipeuser']);
                                }
                                ?>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col s12 action-buttons">
                                <button type="submit" name="submit" class="btn-large blue waves-effect waves-light">SIMPAN <i class="material-icons right">done</i></button>
                                <a href="?page=sett&sub=usr" class="btn-large deep-orange waves-effect waves-light white-text">BATAL <i class="material-icons right">clear</i></a>
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
?>