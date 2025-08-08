<?php
// cek session
if(empty($_SESSION['admin'])){
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
} else {


    echo '
            <style type="text/css">

            .picker__today.btn-flat {
                color: #1976d2 !important; 
                font-weight: bold;
            }

            .picker__close.btn-flat {
                color: #ff0000ff !important; 
                font-weight: bold;

            }.picker__day--today {
                color: grey !important;
            }

            body {
                font-family: "Segoe UI", Roboto, sans-serif;
                background-color: #f4f6f9;
            }

            .hidd {
                display: none;
            }

            .card-panel-custom {
                background: white;
                padding: 2rem;
                border-radius: 12px;
                box-shadow: 0 3px 12px rgba(0,0,0,0.1);
                margin-top: 1rem;
            }

            .btn-large {
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }

            .datepicker-date-display {
                background-color: #1976d2 !important;
                color: white !important;
            }

            .datepicker-table td.is-selected {
                background-color: #1976d2 !important;
                color: white !important;
            }

            /* Warna header (bagian hijau atas: "30 Juli 2025") */
            .picker__date-display {
                background-color: #1976d2 !important;
                color: white !important;
            }

            /* Tanggal yang dipilih (bulat biru di kalender) */
            .picker__day--selected,
            .picker__day--selected:hover,
            .picker__day--selected:focus {
                background-color: #1976d2 !important;
                color: white !important;
            }

            /* Bulan dan tahun (dropdown atas) */
            .picker__month,
            .picker__year {
                color: white !important;
            }

            /* Tombol navigasi (panah kiri/kanan) */
            .picker__nav--prev,
            .picker__nav--next {
                color: white !important;
            }

            @media print {
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
                    display: none;
                }
                .hidd {
                    display: block;
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
                .card-panel, .card-panel-custom {
                    display: none !important;
                }
                                        .separator {
                        border-bottom: 2px solid #616161;
                        margin: 1rem 0;


            }
        </style>';
        

    echo '
    
    <div class="row" style="margin-bottom:1.5rem;">
        <div class="col s12 card-panel-custom">
            <div class="card-panel blue darken-2 z-depth-2 white-text" style="border-radius:10px; padding:1.2rem 1.5rem;">
                <div class="valign-wrapper ">
                    <i class="material-icons left white-text" style="margin-right:12px;">report</i>
                    <span style="font-size:1.4rem; font-weight:500;">Laporan Surat Keluar</span>
                </div>
            </div>
        </div>
    </div>

    <div class="row jarak-form black-text">
        <form class="col s12 card-panel-custom" method="post" action="">
            <h5 style="margin-bottom:2rem; font-weight:600; color:#333;">
                <i class="material-icons left blue-text">assignment</i> Filter Laporan Surat Keluar
            </h5>
            <div class="row">
                <div class="input-field col s12 m6">
                    <i class="material-icons prefix blue-text">date_range</i>
                    <input id="dari_tanggal" type="text" name="dari_tanggal" class="datepicker" required>
                    <label for="dari_tanggal" class="grey-text text-darken-2">Dari Tanggal</label>
                </div>
                <div class="input-field col s12 m6">
                    <i class="material-icons prefix blue-text">date_range</i>
                    <input id="sampai_tanggal" type="text" name="sampai_tanggal" class="datepicker" required>
                    <label for="sampai_tanggal" class="grey-text text-darken-2">Sampai Tanggal</label>
                </div>
            </div>
            <div class="row" style="margin-top:1rem;">
                <div class="col s12">
                    <button type="submit" name="submit" class="btn-large blue darken-2 waves-effect waves-light z-depth-2 right">
                        <i class="material-icons left">visibility</i> Tampilkan
                    </button>
                </div>
            </div>
        </form>
    </div>';

    if(isset($_REQUEST['submit'])){
        $dari = $_REQUEST['dari_tanggal'];
        $sampai = $_REQUEST['sampai_tanggal'];
        if(empty($dari) || empty($sampai)){
            header("Location: ./admin.php?page=ask");
            die();
        }

        $query = mysqli_query($config,
            "SELECT * FROM tbl_surat_keluar WHERE tgl_catat BETWEEN '$dari' AND '$sampai'");
        $inst = mysqli_query($config, "SELECT institusi, nama, alamat, logo FROM tbl_instansi");
        list($institusi, $nama, $alamat, $logo) = mysqli_fetch_array($inst);

        echo '
        <div class="row agenda">
            <div class="disp hidd">
                <img class="logodisp" src="./upload/'.$logo.'"/>
                <h5 class="up">'.$institusi.'</h5>
                <h5 class="up" id="nama">'.$nama.'</h5><br/>
                <span id="alamat">'.$alamat.'</span><br/>
                <span id="alamat">Telp./Fax. (0730)...</span><br/>
                <span id="alamat">Email : bnnpntb@gmail.com</span>
            </div>
            <div class="separator"></div>
            <h5 class="hid"><b><font color="black">LAPORAN SURAT KELUAR</font></b></h5>
            <div class="col s12">
                <p class="warna agenda">
                    Rekapitulasi Surat Keluar dari tanggal 
                    <strong>'.indoDate($dari).'</strong> sampai 
                    <strong>'.indoDate($sampai).'</strong>
                </p>
            </div>
        </div>

        <div id="colres" class="warna cetak">
            <table class="bordered highlight responsive-table white" width="100%" id="tbl">
                <thead class="blue lighten-4">
                    <tr>
                        <th>No</th>
                        <th>No Agenda</th>
                        <th>Tanggal Surat</th>
                        <th>Nomor Surat</th>
                        <th>Kode Klasifikasi</th>
                        <th>Perihal</th>
                        <th>Tujuan Surat</th>
                        <th>Keterangan</th>
                    </tr>
                </thead>
                <tbody>';

        if(mysqli_num_rows($query) > 0){
            $no = 1;
            while($row = mysqli_fetch_array($query)){
                echo '
                    <tr>
                        <td>'.$no++.'</td>
                        <td>'.$row['no_agenda'].'</td>
                        <td>'.indoDate($row['tgl_surat']).'</td>
                        <td>'.$row['no_surat'].'</td>
                        <td>'.$row['kode'].'</td>
                        <td>'.$row['isi'].'</td>
                        <td>'.$row['tujuan'].'</td>
                        <td>'.$row['keterangan'].'</td>
                    </tr>';
            }
        } else {
            echo '<tr><td colspan="8"><center><p class="add">Tidak ada laporan surat keluar</p></center></td></tr>';
        }

        echo '
                </tbody>
            </table>
        </div>

        <div class="col s12" style="margin-top:20px;">
         <button type="submit" onClick="window.print()" class="btn-large deep-orange waves-effect waves-light right">CETAK <i class="material-icons">print</i></button>
      
            <a href="download_excelsk.php?dari='.$dari.'&sampai='.$sampai.'" 
               class="btn-large blue darken-1 waves-effect waves-light right" style="margin-right:10px;">
               Download Excel <i class="material-icons right">cloud_download</i>
            </a>
        <div class="jarak2"></div>';
    }
    
}
?>