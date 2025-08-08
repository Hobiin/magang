<?php
//cek session
if(empty($_SESSION['admin'])){
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
} else {

    if($_REQUEST['id_user'] == 1){
        echo '<script language="javascript">
                window.alert("ERROR! Super Admin tidak boleh diedit");
                window.location.href="./admin.php?page=sett&sub=usr";
              </script>';
    } else {

        if($_REQUEST['id_user'] == $_SESSION['id_user']){
            echo '<script language="javascript">
                    window.alert("ERROR! Anda tidak diperbolehkan mengedit tipe akun Anda sendiri. Hubungi super admin untuk mengeditnya");
                    window.location.href="./admin.php?page=sett&sub=usr";
                  </script>';
        } else {

            if(isset($_REQUEST['submit'])){

                $id_user = $_REQUEST['id_user'];
                $admin = $_REQUEST['admin'];

                if($id_user == $_SESSION['id_user']){
                    echo '<script language="javascript">
                            window.alert("ERROR! Anda tidak boleh mengedit akun Anda sendiri. Hubungi super admin untuk mengeditnya");
                            window.location.href="./admin.php?page=sett&sub=usr";
                          </script>';
                } else {

                    if(!preg_match("/^[2-3]*$/", $admin)){
                        $_SESSION['tipeuser'] = 'Form Tipe User hanya boleh mengandung karakter angka 2 atau 3';
                        echo '<script language="javascript">window.history.back();</script>';
                    } else {

                        $query = mysqli_query($config, "UPDATE tbl_user SET admin='$admin' WHERE id_user='$id_user'");

                        if($query == true){
                            $_SESSION['succEdit'] = 'SUKSES! Tipe user berhasil diupdate';
                            header("Location: ./admin.php?page=sett&sub=usr");
                            die();
                        } else {
                            $_SESSION['errQ'] = 'ERROR! Ada masalah dengan query';
                            echo '<script language="javascript">
                                    window.location.href="./admin.php?page=sett&sub=usr&act=edit&id_user='.$id_user.'";
                                  </script>';
                        }
                    }
                }
            } else {

                $id_user = mysqli_real_escape_string($config, $_REQUEST['id_user']);
                $query = mysqli_query($config, "SELECT * FROM tbl_user WHERE id_user='$id_user'");
                if(mysqli_num_rows($query) > 0){
                    $no = 1;
                    while($row = mysqli_fetch_array($query)){ ?>

<!-- Row Start -->
<div class="row">
    <div class="col s12">
        <nav class="secondary-nav">
            <div class="nav-wrapper custom-blue-grey">
                <ul class="left">
                    <li class="waves-effect waves-light tooltipped" 
                        data-position="right" 
                        data-tooltip="Menu ini hanya untuk mengedit tipe user. Username dan password bisa diganti lewat menu profil">
                        <a href="#" class="judul">
                            <i class="material-icons">mode_edit</i> Edit Tipe User
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<!-- Row End -->

<?php
    if(isset($_SESSION['errQ'])){
        echo '<div id="alert-message" class="row">
                <div class="col m12">
                    <div class="card red lighten-5">
                        <div class="card-content notif">
                            <span class="card-title red-text"><i class="material-icons md-36">clear</i> '.$_SESSION['errQ'].'</span>
                        </div>
                    </div>
                </div>
              </div>';
        unset($_SESSION['errQ']);
    }
?>

<!-- Form Row Start -->
<div class="row">
    <div class="col s12 m12">
        <div class="card-panel white z-depth-2" style="border-radius: 10px; padding: 20px;">

            <form method="post" action="?page=sett&sub=usr&act=edit">
                <input type="hidden" value="<?php echo $row['id_user']; ?>" name="id_user">

                <div class="row">
                    <div class="col s6">
                        <label for="username">Username</label>
                        <div class="card-panel" style="padding: 10px; border: 1px solid #ccc; border-radius: 8px;">
                            <i class="material-icons left">account_circle</i>
                            <span><?php echo $row['username']; ?></span>
                        </div>
                    </div>

                    <div class="col s6">
                        <label for="nama">Nama</label>
                        <div class="card-panel" style="padding: 10px; border: 1px solid #ccc; border-radius: 8px;">
                            <i class="material-icons left">text_fields</i>
                            <span><?php echo $row['nama']; ?></span>
                        </div>
                    </div>

                    <div class="col s12">
                        <label for="admin">Pilih tipe user</label>
                        <div class="input-field" style="margin-top: 10px;">
                            <select class="browser-default" name="admin" id="admin" required style="border: 1px solid #ccc; border-radius: 8px; padding: 8px;">
                                <option value="<?php echo $row['admin']; ?>">
                                    <?php echo ($row['admin'] == 2) ? 'User Biasa' : 'Administrator'; ?>
                                </option>
                                <option value="3">Administrator</option>
                                <option value="2">User Biasa</option>
                            </select>
                        </div>
                        <?php
                            if(isset($_SESSION['tipeuser'])){
                                echo '<div class="red lighten-4 red-text" style="padding:10px; border-radius:8px; margin-top:10px;">'.$_SESSION['tipeuser'].'</div>';
                                unset($_SESSION['tipeuser']);
                            }
                        ?>
                    </div>
                </div>

            <div class="row" style="margin-top: 20px;">
    <div class="row" style="margin-top: 20px;">
    <div class="col s12">
        <div style="display: flex; justify-content: center; gap: 10px;">
            <button type="submit" name="submit" class="btn-large blue waves-effect waves-light" style="border-radius: 7px;">
                SIMPAN <i class="material-icons">done</i>
            </button>
            <a href="?page=sett&sub=usr" class="btn-large red waves-effect waves-light" style="border-radius: 7px;">
                BATAL <i class="material-icons">clear</i>
            </a>
        </div>
    </div>
</div>

            </form>

        </div>
    </div>
</div>
<!-- Form Row End -->

<?php
                    }
                }
            }
        }
    }
}
?>

<style>
    .custom-blue-grey {
        background: linear-gradient(135deg,rgb(0, 91, 170), rgb(79, 195, 247));
        border-radius: 7px;
        padding-left: 15px;
        padding-right: 15px;
        border: none !important;         /* Hapus border */
        outline: none !important;        /* Hapus outline */
        box-shadow: none !important;     /* Hapus bayangan */
    }

    nav.secondary-nav {
        background: transparent !important;  /* Hilangkan warna default nav */
        box-shadow: none !important;         /* Hilangkan shadow */
    }

    .custom-blue-grey .judul {
        font-weight: bold;
        color: #fff;
    }

    .custom-blue-grey .material-icons {
        color: #fff;
    }

    .btn-rounded {
    border-radius: 7px !important;
    }
    .judul{
        font-style: center;
    }


</style>