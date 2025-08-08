<?php
    //cek session
    if(empty($_SESSION['admin'])){
        $_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
        header("Location: ./");
        die();
    } else {

        // Ambil semua data yang diperlukan di awal
        $id_surat = mysqli_real_escape_string($config, $_REQUEST['id_surat']);
        $query_instansi = mysqli_query($config, "SELECT institusi, nama, alamat, logo FROM tbl_instansi");
        list($institusi, $nama, $alamat, $logo) = mysqli_fetch_array($query_instansi);
        $query_surat = mysqli_query($config, "SELECT * FROM tbl_surat_masuk WHERE id_surat='$id_surat'");

        if(mysqli_num_rows($query_surat) > 0) {
            $row = mysqli_fetch_array($query_surat);
            $query_disp = mysqli_query($config, "SELECT * FROM tbl_disposisi WHERE id_surat='$id_surat'");
            $row_disp = mysqli_num_rows($query_disp) > 0 ? mysqli_fetch_array($query_disp) : null;

        // Mulai output HTML
        echo '
        <!DOCTYPE html>
        <html>
        <head>
            <title>Cetak Lembar Disposisi</title>
            <style type="text/css">
            /* CSS Dasar */
            body { font-family: Arial, sans-serif; }
            table { background: #fff; border-collapse: collapse; width: 100%;}
            tr, td { border: 1px solid #444; padding: 5px; vertical-align: top;}
            td label { color: black !important; cursor: pointer;}
            [type="checkbox"]:not(:checked)+label:before { border: 2px solid black !important; }
            [type="checkbox"]:checked+label:before { border-right: 2px solid black !important; border-bottom: 2px solid black !important; }
            .tgh { text-align: center; }

            .dispo-row {
                display: flex;
                align-items: flex-start;
            }
            .dispo-label {
                width: 140px;
                flex-shrink: 0;
            }
            .dispo-data {
                flex-grow: 1;
            }

            /* Hapus garis vertikal */
            .no-vertical-border {
                border-left: none !important;
                border-right: none !important;
            }

            /* PENGATURAN WRAPPER UTAMA MENGGUNAKAN MARGIN */
            .lembar-wrapper {
                margin: 1.8cm 0cm 0.9cm 0cm; /* Format: Atas, Kanan, Bawah, Kiri */
                box-sizing: border-box;
                overflow: hidden;
            }
            
            /* PENGATURAN KOP SURAT */
            .disp {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .logodisp {
                width: 90px;
                height: auto;
                flex-shrink: 0;
            }
            .kop-text {
                flex-grow: 1;
                text-align: center;
            }
            .up { 
                text-transform: uppercase; 
                margin: 0; 
                font-weight: bold;
                line-height: 1.1;
            }

            #nama { 
                font-size: 16.3px; 
                line-height: 1; 
                margin: 0; 
            }
            .institusi { 
                font-size: 17.5px; 
                line-height: 1; 
                margin: 0;
            }
            #alamat { 
                font-size: 12.2px; 
                line-height: 1.2; 
                margin: 0;
                display: block;
            }
            
            .separator { border-bottom: 2px solid #616161; margin: 0.4rem 0; }

            #lbr {
                font-size: 16px;
                font-weight: bold;
                padding: 5px 0 !important;
            }
            .bordered td {
                font-size: 14px;
            }
            .isi td label {
                font-size: 15px !important;
            }

            .isi { height: 200px !important; } 

            /* --- PENGATURAN KHUSUS UNTUK PRINT --- */
            @page {
                size: A4;
                margin: 0;
            }
            @media print {
                body {
                    margin: 0;
                    font-size: 11.5pt; 
                }
                .lembar-wrapper { height: auto; }
                nav, .no-print { display: none; }
                tr, td { padding: 2px 3px !important; } 
            }

            </style>
        </head>
        <body>';

        // Fungsi untuk menampilkan satu lembar disposisi
        function render_disposition_sheet($row, $row_disp, $institusi, $nama, $logo) {
            echo '<div class="lembar-wrapper">';
            
            // KOP SURAT (Tidak ada perubahan)
            echo '
            <div class="disp">
                <img class="logodisp" src="./upload/'.$logo.'"/>
                <div class="kop-text">
                    <h2 class="up institusi">'.htmlspecialchars($institusi).'</h2>
                    <h2 class="up" id="nama">'.htmlspecialchars($nama).'</h2>
                    <span id="alamat">Jln. Dr. Soedjono Lingkar Selatan Mataram NTB<br> Telp:(0370)6177418 Fax:(0370)6177413 <br> Email:bnnpntb@gmail.com</span>
                </div>
            </div>
            <div class="separator"></div>';
            
            // TABEL ISI
            echo '
            <table class="bordered">
                <tbody>
                    <tr><td class="tgh" id="lbr" colspan="3">LEMBAR DISPOSISI</td></tr>
                    
                    <tr>
                        <td>
                            <div class="dispo-row">
                                <div class="dispo-label"><strong>Nomor Agenda</strong></div>
                                <div class="dispo-data">: '.htmlspecialchars($row['no_agenda']).'</div>
                            </div>
                        </td>
                        <td colspan="2">
                            <div class="dispo-row">
                                <div class="dispo-label"><strong>Tingkat Keamanan</strong></div>
                                <div class="dispo-data">: SR / R / B</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="dispo-row">
                                <div class="dispo-label"><strong>Tgl. Terima</strong></div>
                                <div class="dispo-data">: '.date('d-m-Y', strtotime($row['tgl_diterima'])).'</div>
                            </div>
                        </td>
                        <td colspan="2">
                            <div class="dispo-row">
                                <div class="dispo-label"><strong>Klasifikasi Surat</strong></div>
                                <div class="dispo-data">: </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="dispo-row">
                                <div class="dispo-label"><strong>Nomor Surat</strong></div>
                                <div class="dispo-data">: '.htmlspecialchars($row['no_surat']).'</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="dispo-row">
                                <div class="dispo-label"><strong>Dari</strong></div>
                                <div class="dispo-data">: '.htmlspecialchars($row['asal_surat']).'</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="dispo-row">
                                <div class="dispo-label"><strong>Perihal</strong></div>
                                <div class="dispo-data">: '.htmlspecialchars($row['isi']).'</div>
                            </div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td class="tgh" style="width: 45%;"><strong>Isi Disposisi</strong></td>
                        <td class="tgh" style="width: 40%;"><strong>Diteruskan kepada</strong></td>
                        <td class="tgh" style="width: 15%;"><strong>Paraf</strong></td>
                    </tr>';
        
            if($row_disp){
                echo '<tr class="isi">
                        <td>'.htmlspecialchars($row_disp['isi_disposisi']).'</td>
                        <td>'.htmlspecialchars($row_disp['tujuan']).'</td>
                        <td></td>
                    </tr>';
            } else {
                // PERBAIKAN DI BLOK INI: Memecah colspan="2" menjadi dua <td> terpisah
                echo '<tr class="isi">
                        <td></td>
                        <td style="line-height: 1.6; padding: 8px !important;">
                            <input type="checkbox" id="kabag_umum" name="tujuan[]" value="Kabag Umum"><label for="kabag_umum">Kabag Umum</label><br>
                            <input type="checkbox" id="berantas" name="tujuan[]" value="Kabid Pemberantasan"><label for="berantas">Kabid Pemberantasan</label><br>
                            <input type="checkbox" id="p2m" name="tujuan[]" value="Katim P2M"><label for="p2m">Katim P2M</label><br>
                            <input type="checkbox" id="rehab" name="tujuan[]" value="Katim Rehabilitasi"><label for="rehab">Katim Rehabilitasi</label><br>
                            <input type="checkbox" id="ppk" name="tujuan[]" value="PPK"><label for="ppk">PPK</label><br>
                            <input type="checkbox" id="bendahara" name="tujuan[]" value="Bendahara"><label for="bendahara">Bendahara Pengeluaran</label><br>
                            <input type="checkbox" id="jf" name="tujuan[]" value="JF"><label for="jf">JF ______________</label><br>
                        </td>
                        <td></td>
                    </tr>';
            }
            echo '</tbody></table>';
            echo '</div>';
        }

        // Panggil fungsi render hanya satu kali
        render_disposition_sheet($row, $row_disp, $institusi, $nama, $logo);

        // Tombol Cetak
        echo '
        <div class="no-print" style="text-align: center; padding: 10px;">
            <button onclick="window.print()" style="padding: 10px 20px; font-size: 16px;">
                🖨️ Cetak Lembar Disposisi
            </button>
        </div>
        </body>
        </html>';

        } else {
            echo 'Data surat dengan ID yang diminta tidak ditemukan.';
        }
    }
?>
