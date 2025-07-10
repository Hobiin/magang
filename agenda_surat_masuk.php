
<?php
    //cek session
    if(empty($_SESSION['admin'])){
        $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
        header("Location: ./");
        die();
    } else {

        echo '
            <style type="text/css">
                .hidd {
                    display: none
                }
                @media print{
                    body {
                        font-size: 12px!important;
                        color: #212121;
                    }
                    .disp {
                        text-align: center;
                        margin: -.5rem 0;
                        width: 100%;
                    }
                    nav {
                        display: none
                    }
                    .hidd {
                        display: block
                    }
                   .logodisp {
                      float: left;
                      position: relative;
                      width: 105px;
                      height: 105px;
                      margin: .5rem 0 0 .5rem;
                    }
                    .up {
                      font-size: 18px!important;
                      font-weight: bold;
                    }
                    #nama {
                      font-size: 18px!important;
                      font-weight: bold;
                      text-transform: uppercase;
                      margin: -10px 0 -20px 0;
                    }
                    .status {
                        font-size: 17px!important;
                        font-weight: normal;
                        margin-top: -1.5rem;
                        color: #212121;
                    }
                    #alamat {
                        margin-top: -15px;
                        font-size: 13px;
                        color: #212121;
                    }
                    .separator {
                        border-bottom: 2px solid #616161;
                        margin: 1rem 0;
                    }
                }
            </style>';

        if(isset($_REQUEST['submit'])){

            $dari_tanggal = $_REQUEST['dari_tanggal'];
            $sampai_tanggal = $_REQUEST['sampai_tanggal'];

            if($_REQUEST['dari_tanggal'] == "" || $_REQUEST['sampai_tanggal'] == ""){
                header("Location: ./admin.php?page=asm");
                die();
            } else {

                $query = mysqli_query($config, "SELECT * FROM tbl_surat_masuk WHERE tgl_diterima BETWEEN '$dari_tanggal' AND '$sampai_tanggal'");

                $query2 = mysqli_query($config, "SELECT nama FROM tbl_instansi");
                list($nama) = mysqli_fetch_array($query2);

                echo '
                    <!-- SHOW DAFTAR REPORT -->
                    <!-- Row Start -->
                    <div class="row">
                        <!-- Secondary Nav START -->
                        <div class="col s12">
                            <div class="z-depth-1">
                                <nav class="secondary-nav">
                                    <div class="nav-wrapper blue-grey darken-1">
                                        <div class="col 12">
                                            <ul class="left">
                                                <li class="waves-effect waves-light"><a href="?page=asm" class="judul"><i class="material-icons">print</i> Rekapitulasi Surat 
                                                Masuk<a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                        </div>
                        <!-- Secondary Nav END -->
                    </div>
                    <!-- Row END -->

                    <!-- Row form Start -->
                    <div class="row jarak-form black-text">
                        <form class="col s12" method="post" action="">
                            <div class="input-field col s3">
                                <i class="material-icons prefix md-prefix">date_range</i>
                                <input id="dari_tanggal" type="text" name="dari_tanggal" id="dari_tanggal" required>
                                <label for="dari_tanggal">Dari Tanggal</label>
                            </div>
                            <div class="input-field col s3">
                                <i class="material-icons prefix md-prefix">date_range</i>
                                <input id="sampai_tanggal" type="text" name="sampai_tanggal" id="sampai_tanggal" required>
                                <label for="sampai_tanggal">Sampai Tanggal</label>
                            </div>
                            <div class="col s6">
                                <button type="submit" name="submit" class="btn-large blue waves-effect waves-light"> TAMPILKAN <i class="material-icons">visibility</i></button>
                            </div>
                        </form>
                    </div>
                    <!-- Row form END -->

                    <div class="row agenda">
                    <div class="disp hidd">';
                        $query2 = mysqli_query($config, "SELECT institusi, nama, alamat, logo FROM tbl_instansi");
                        list($institusi, $nama, $alamat, $logo) = mysqli_fetch_array($query2);
                            echo '<img class="logodisp" src="./upload/'.$logo.'"/>';
                            echo '<h5 class="up">'.$institusi.'</h5>';
                            echo '<h5 class="up" id="nama">'.$nama.'</h5><br/>';
                            echo '<span id="alamat">Jln. Dr. Soedjono Lingkar Selatan Mataram Nusa Tenggara Barat</span><br>';
                            echo '<span id="alamat">Telp./Fax. (0730) 6177413 / 6177418 / 7503686 / 7503688</span><br>';
                            echo '<span id="alamat">Email : bnnpntb@gmail.com</span>

                    </div>
                    <div class="separator"></div>
                    <h5 class="hid"><b><font color="black">LAPORAN SURAT MASUK</font></b></h5>
                        <div class="col s20">
                            <p class="warna agenda">Rekapitulasi Surat Masuk dari tanggal <strong>'.indoDate($dari_tanggal).'</strong> sampai dengan tanggal <strong>'.indoDate($sampai_tanggal).'</strong></p>
                        </div>
                    </div>
                    <div id="colres" class="warna cetak">
                        <table class="bordered" id="tbl" width="100%">
                            <thead class="blue lighten-4">
                                <tr>
                                    <th width="3%">No Agenda</th>
									<th width="8%">Tanggal<br/> Surat</th>
                                    <th width="18%">Kode Klasifikasi</th>
									<th width="18%">Asal Surat</th>
									<th width="15%">Nomor Surat</th>
                                    <th width="10%">Perihal</th>
                                    <th width="10%">Disposisi</th>
									<th width="10%">Penerima</th>
                                </tr>
                            </thead>

                            <tbody>';

                            if(mysqli_num_rows($query) > 0){
                                $no = 0;
                                while($row = mysqli_fetch_array($query)){
                                 echo '
                                 <tr>
                                        <td>'.$row['no_agenda'].'</td>
										<td>'.indoDate($row['tgl_surat']).'</td>
                                        <td>'.$row['kode'].'</td>
										<td>'.$row['asal_surat'].'</td>
										<td>'.$row['no_surat'].'</td>
                                        <td>'.$row['isi'].'</td>
                                        <td>'.$row['disposisi'].'</td>
										<td>'.$row['keterangan'].'</td>
										</tr>';
                                }
                            } else {
                                echo '<tr><td colspan="10"><center><p class="add">Tidak ada laporan surat masuk</p></center></td></tr>';
                            } echo '
                        </tbody></table>
                    </div>;
                    <div class="col s12">
                            <button type="submit" onClick="window.print()" class="btn-large deep-orange waves-effect waves-light right">CETAK <i class="material-icons">print</i></button>
                            <a href="download_excel.php?dari='.$dari_tanggal.'&&sampai='.$sampai_tanggal.'" class="btn-large deep-green waves-effect waves-light right">Download Excel <i class="material-icons">cloud_download</i></a>
                        </div>
                        <div class="jarak2"></div>';
            }
        } else {

            echo '
                <!-- Row Start -->
                <div class="row">
                    <!-- Secondary Nav START -->
                    <div class="col s12">
                        <div class="z-depth-1">
                            <nav class="secondary-nav">
                                <div class="nav-wrapper blue-grey darken-1">
                                    <div class="col 12">
                                        <ul class="left">
                                            <li class="waves-effect waves-light"><a href="?page=asm" class="judul"><i class="material-icons">report</i> Laporan Surat Masuk<a></li>
                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <!-- Secondary Nav END -->
                </div>
                <!-- Row END -->

                <!-- Row form Start -->
                <div class="row jarak-form black-text">
                    <form class="col s12" method="post" action="">
                        <div class="input-field col s3">
                            <i class="material-icons prefix md-prefix">date_range</i>
                            <input id="dari_tanggal" type="text" name="dari_tanggal" id="dari_tanggal" required>
                            <label for="dari_tanggal">Dari Tanggal</label>
                        </div>
                        <div class="input-field col s3">
                            <i class="material-icons prefix md-prefix">date_range</i>
                            <input id="sampai_tanggal" type="text" name="sampai_tanggal" id="sampai_tanggal" required>
                            <label for="sampai_tanggal">Sampai Tanggal</label>
                        </div>
                        <div class="col s6">
                            <button type="submit" name="submit" class="btn-large blue waves-effect waves-light"> TAMPILKAN <i class="material-icons">visibility</i></button>
                        </div>
                    </form>
                </div>
                <!-- Row form END -->';
        }
    }
?>
