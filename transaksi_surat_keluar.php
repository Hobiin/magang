<?php
    //cek session
    if(empty($_SESSION['admin'])){
        $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
        header("Location: ./");
        die();
    } else {

        if($_SESSION['admin'] != 1 AND $_SESSION['admin'] != 3){
            echo '<script language="javascript">
                    window.alert("ERROR! Anda tidak memiliki hak akses untuk membuka halaman ini");
                    window.location.href="./logout.php";
                  </script>';
        } else {

        if(isset($_REQUEST['act'])){
            $act = $_REQUEST['act'];
            switch ($act) {
                case 'add':
                    include "tambah_surat_keluar.php";
                    break;
                case 'edit':
                    include "edit_surat_keluar.php";
                    break;
                case 'del':
                    include "hapus_surat_keluar.php";
                    break;
            }
        } else {

            // ===============================================
            // BAGIAN LOGIKA PAGINATION DIHAPUS DARI SINI
            /*
            $query = mysqli_query($config, "SELECT surat_keluar FROM tbl_sett");
            list($surat_keluar) = mysqli_fetch_array($query);

            //pagging
            $limit = $surat_keluar;
            $pg = @$_GET['pg'];
                if(empty($pg)){
                    $curr = 0;
                    $pg = 1;
                } else {
                    $curr = ($pg - 1) * $limit;
                }
            */
            // ===============================================
            ?>

            <div class="row">
                <div class="col s12">
                    <div class="z-depth-1">
                        <nav class="secondary-nav">
                            <div class="nav-wrapper blue-grey darken-1">
                                <div class="col m7">
                                    <ul class="left">
                                        <li class="waves-effect waves-light hide-on-small-only"><a href="?page=tsk" class="judul"><i class="material-icons">drafts</i> Surat Keluar</a></li>
                                        <li class="waves-effect waves-light">
                                            <a href="?page=tsk&act=add"><i class="material-icons md-24">add_circle</i> Tambah Data</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col m5 hide-on-med-and-down">
                                    <form method="post" action="?page=tsk">
                                        <div class="input-field round-in-box">
                                            <input id="search" type="search" name="cari" placeholder="Ketik dan tekan enter mencari data..." required>
                                            <label for="search"><i class="material-icons md-dark">search</i></label>
                                            <input type="submit" name="submit" class="hidden">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
                </div>
            <?php
                if(isset($_SESSION['succAdd'])){
                    $succAdd = $_SESSION['succAdd'];
                    echo '<div id="alert-message" class="row">
                            <div class="col m12">
                                <div class="card green lighten-5">
                                    <div class="card-content notif">
                                        <span class="card-title green-text"><i class="material-icons md-36">done</i> '.$succAdd.'</span>
                                    </div>
                                </div>
                            </div>
                        </div>';
                    unset($_SESSION['succAdd']);
                }
                if(isset($_SESSION['succEdit'])){
                    $succEdit = $_SESSION['succEdit'];
                    echo '<div id="alert-message" class="row">
                            <div class="col m12">
                                <div class="card green lighten-5">
                                    <div class="card-content notif">
                                        <span class="card-title green-text"><i class="material-icons md-36">done</i> '.$succEdit.'</span>
                                    </div>
                                </div>
                            </div>
                        </div>';
                    unset($_SESSION['succEdit']);
                }
                if(isset($_SESSION['succDel'])){
                    $succDel = $_SESSION['succDel'];
                    echo '<div id="alert-message" class="row">
                            <div class="col m12">
                                <div class="card green lighten-5">
                                    <div class="card-content notif">
                                        <span class="card-title green-text"><i class="material-icons md-36">done</i> '.$succDel.'</span>
                                    </div>
                                </div>
                            </div>
                        </div>';
                    unset($_SESSION['succDel']);
                }
            ?>

            <div class="row jarak-form">

            <?php
                if(isset($_REQUEST['submit'])){
                $cari = mysqli_real_escape_string($config, $_REQUEST['cari']);
                    echo '
                    <div class="col s12" style="margin-top: -18px;">
                        <div class="card blue lighten-5">
                            <div class="card-content">
                            <p class="description">Hasil pencarian untuk kata kunci <strong>"'.stripslashes($cari).'"</strong><span class="right"><a href="?page=tsk"><i class="material-icons md-36" style="color: #333;">clear</i></a></span></p>
                            </div>
                        </div>
                    </div>

                    <div class="col m12" id="colres">
                        <table class="bordered" id="tbl">
                            <thead class="blue lighten-4" id="head">
                                <tr>
                                    <th width="10%">No. Agenda<br/>Kode</th>
                                    <th width="30%">Perihal<br/> File</th>
                                    <th width="20%">Tujuan</th>
                                    <th width="18%">No. Surat<br/>Tgl Surat</th>
                                    <th width="22%">Tindakan <span class="right"><i class="material-icons" style="color: #333;">settings</i></span></th>
                                </tr>
                            </thead>
                            <tbody>';

                                //script untuk mencari data
                                // ===============================================
                                // DIUBAH: Menghapus "LIMIT $curr, $limit"
                                $query = mysqli_query($config, "SELECT * FROM tbl_surat_keluar WHERE no_agenda LIKE '%$cari%' OR kode LIKE '%$cari%' OR no_surat LIKE '%$cari%' OR tujuan LIKE '%$cari%' OR isi LIKE '%$cari%' ORDER by id_surat DESC");
                                // ===============================================
                                if(mysqli_num_rows($query) > 0){
                                    $no = 1;
                                    while($row = mysqli_fetch_array($query)){
                                      echo '
                                      <tr>
                                        <td>'.$row['no_agenda'].'<br/><hr/>'.$row['kode'].'</td>
                                        <td>'.substr($row['isi'],0,200).'<br/><br/><strong>File :</strong>';

                                        if(!empty($row['file'])){
                                            echo ' <strong><a href="?page=gsk&act=fsk&id_surat='.$row['id_surat'].'">'.$row['file'].'</a></strong>';
                                        } else {
                                            echo ' <em>Tidak ada file yang diupload</em>';
                                        } echo '</td>
                                        <td>'.$row['tujuan'].'</td><td>'.$row['no_surat'].'<br/><hr/>'.indoDate($row['tgl_surat']).'</td>
                                        <td>';

                                        if($_SESSION['id_user'] != $row['id_user'] AND $_SESSION['admin'] != 1){
                                            echo '<button class="btn small blue-grey waves-effect waves-light"><i class="material-icons">error</i> No Action</button>';
                                        } else {
                                            // JIKA KODE ADALAH NOTA DINAS, TAMPILKAN TOMBOL PRINT DISPOSISI
                                            if($row['kode'] == 'Nota Dinas'){
                                                echo '<a class="btn small green waves-effect waves-light" href="cetak_disposisi_keluar.php?id_surat='.$row['id_surat'].'" target="_blank" title="Cetak Lembar Disposisi">
                                                        <i class="material-icons">print</i></a> ';
                                            }

                                          echo '<a class="btn small blue waves-effect waves-light" href="?page=tsk&act=edit&id_surat='.$row['id_surat'].'" title="Edit Data">
                                                    <i class="material-icons">edit</i></a>
                                                <a class="btn small deep-orange waves-effect waves-light" href="?page=tsk&act=del&id_surat='.$row['id_surat'].'" title="Hapus Data">
                                                    <i class="material-icons">delete</i></a>';
                                        } echo '
                                        </td>
                                      </tr>';
                                    }
                                } else {
                                    echo '<tr><td colspan="5"><center><p class="add">Tidak ada data yang ditemukan</p></center></td></tr>';
                                }
                                 echo '</tbody></table><br/><br/>
                            </div>
                        </div>
                        ';

                } else {

                    echo '
                    <div class="col m12" id="colres">
                    <table class="bordered" id="tbl">
                        <thead class="blue lighten-4" id="head">
                            <tr>
                                <th width="10%">No. Agenda<br/>Kode</th>
                                <th width="30%">Perihal<br/> File</th>
                                <th width="20%">Tujuan</th>
                                <th width="18%">No. Surat<br/>Tgl Surat</th>
                                <th width="22%">Tindakan <span class="right"><i class="material-icons" style="color: #333;">settings</i></span></th>
                            </tr>
                        </thead>

                        <tbody>';

                        //script untuk menampilkan data
                        // ===============================================
                        // DIUBAH: Menghapus "LIMIT $curr, $limit"
                        $query = mysqli_query($config, "SELECT * FROM tbl_surat_keluar ORDER by id_surat DESC");
                        // ===============================================
                        if(mysqli_num_rows($query) > 0){
                            $no = 0;
                            while($row = mysqli_fetch_array($query)){
                            $no++;
                              echo '
                              <tr>
                                <td>'.$row['no_agenda'].'<br/><hr/>'.$row['kode'].'</td>
                                <td>'.substr($row['isi'],0,200).'<br/><br/><strong>File :</strong>';

                                if(!empty($row['file'])){
                                    echo ' <strong><a href="upload/surat_keluar/'.$row['file'].'">'.$row['file'].'</a></strong>';
                                } else {
                                    echo ' <em>Tidak ada file yang diupload</em>';
                                } echo '</td>
                                <td>'.$row['tujuan'].'</td><td>'.$row['no_surat'].'<br/><hr/>'.indoDate($row['tgl_surat']).'</td>
                                <td>';

                                if($_SESSION['id_user'] != $row['id_user'] AND $_SESSION['admin'] != 1){
                                    echo '<button class="btn small blue-grey waves-effect waves-light"><i class="material-icons">error</i> No Action</button>';
                                } else {
                                    // JIKA KODE ADALAH NOTA DINAS, TAMPILKAN TOMBOL PRINT DISPOSISI
                                    if($row['kode'] == 'Nota Dinas'){
                                        echo '<a class="btn small green waves-effect waves-light" href="cetak_disposisi_keluar.php?id_surat='.$row['id_surat'].'" target="_blank" title="Cetak Lembar Disposisi">
                                                <i class="material-icons">print</i></a> ';
                                    }
                                  echo '<a class="btn small blue waves-effect waves-light" href="?page=tsk&act=edit&id_surat='.$row['id_surat'].'" title="Edit Data">
                                            <i class="material-icons">edit</i></a>
                                        <a class="btn small deep-orange waves-effect waves-light" href="?page=tsk&act=del&id_surat='.$row['id_surat'].'" title="Hapus Data">
                                            <i class="material-icons">delete</i></a>';
                                } echo '
                                </td>
                              </tr>';
                            }
                        } else {
                            echo '<tr><td colspan="5"><center><p class="add">Tidak ada data untuk ditampilkan. <u><a href="?page=tsk&act=add">Tambah data baru</a></u> </p></center></td></tr>';
                        }
                      echo '</tbody></table>
                    </div>
                </div>
                ';

                    // ===============================================
                    // KESELURUHAN BLOK PAGINATION DIHAPUS DARI SINI
                    // ===============================================
                }
            }
        }
    }
?>