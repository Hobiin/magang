<?php
    //cek session
    if(empty($_SESSION['admin'])){
        $_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
        header("Location: ./");
        die();
    } else {

        echo '
        <style type="text/css">
            table {
                background: #fff;
                padding: 5px;
            }
            tr, td {
                border: table-cell;
                border: 1px  solid #444;
            }
            tr,td {
                vertical-align: top!important;
            }
            #right {
                border-right: none !important;
            }
            #left {
                border-left: none !important;
            }
            .isi {
                height: 300px!important;
            }
            .disp {
                text-align: center;
                padding: 1.5rem 0;
                margin-bottom: .5rem;
            }
            .logodisp {
                float: left;
                position: relative;
                width: 125px;
                height: 130px;
                margin: 0 0 0 1rem;
            }
            #lead {
                width: auto;
                position: relative;
                margin: 25px 0 0 75%;
            }
            .lead {
                font-weight: bold;
                text-decoration: underline;
                margin-bottom: -10px;
            }
            .tgh {
                text-align: center;
            }
            #nama {
                font-size: 2.1rem;
                margin-bottom: -1rem;
				font-weight: bold;
            }
            #alamat {
                font-size: 16px;
            }
            .up {
                text-transform: uppercase;
                margin: 0;
                line-height: 2.2rem;
                font-size: 1.5rem;
            }
            .status {
                margin: 0;
                font-size: 1.3rem;
                margin-bottom: .5rem;
            }
            #lbr {
                font-size: 20px;
                font-weight: bold;
            }
            .separator {
                border-bottom: 2px solid #616161;
                margin: -1.3rem 0 1.5rem;
            }
            @media print{
                body {
                    font-size: 12px;
                    color: #212121;
                }
                nav {
                    display: none;
                }
                table {
                    width: 100%;
                    font-size: 12px;
                    color: #212121;
                }
                tr, td {
                    border: table-cell;
                    border: 1px  solid #444;
                    padding: 8px!important;

                }
                tr,td {
                    vertical-align: top!important;
                }
                #lbr {
                    font-size: 20px;
                }
                .isi {
                    height: 200px!important;
                }
                .tgh {
                    text-align: center;
                }
                .disp {
                    text-align: center;
                    margin: -.5rem 0;
                }
                .logodisp {
                    float: left;
                    position: relative;
                    width: 105px;
                    height: 105px;
                    margin: .5rem 0 0 .5rem;
                }
                #lead {
                    width: auto;
                    position: relative;
                    margin: 15px 0 0 75%;
                }
                .lead {
                    font-weight: bold;
                    text-decoration: underline;
                    margin-bottom: -10px;
                }
                #nama {
                    font-size: 20px!important;
                    font-weight: bold;
                    text-transform: uppercase;
                    margin: -10px 0 -20px 0;
                }
                .up {
                    font-size: 19px!important;
                    font-weight: bold;
                }
                .status {
                    font-size: 17px!important;
                    font-weight: normal;
                    margin-bottom: -.1rem;
                }
                #alamat {
                    margin-top: -15px;
                    font-size: 13px;
					text-align: center;
                }
                #lbr {
                    font-size: 17px;
                    font-weight: bold;
                }
                .separator {
                    border-bottom: 2px solid #616161;
                    margin: -1rem 0 1rem;
                }

            }
        </style>

        <body onload="window.print()">

        <!-- Container START -->
            <div id="colres">
                <div class="disp">';
                    $query2 = mysqli_query($config, "SELECT institusi, nama, alamat, logo FROM tbl_instansi");
                    list($institusi, $nama, $alamat, $logo) = mysqli_fetch_array($query2);
                        echo '<img class="logodisp" src="./upload/'.$logo.'"/>';
                        echo '<h2 class="up">'.$institusi.'</h2>';
                        echo '<h2 class="up" id="nama">'.$nama.'</h2><br/>';
                        echo '<span id="alamat">Jln. Dr. Soedjono Lingkar Selatan Mataram Nusa Tenggara Barat</span><br>';
						echo '<span id="alamat">Telp :(0370)6177418 Fax : (0370)6177413</span><br>';
						echo '<span id="email">Email : bnnpntb@gmail.com</span>';
                    echo '
                </div>
                <div class="separator"></div>';

                $id_surat = mysqli_real_escape_string($config, $_REQUEST['id_surat']);
                $query = mysqli_query($config, "SELECT * FROM tbl_surat_masuk WHERE id_surat='$id_surat'");

                if(mysqli_num_rows($query) > 0){
                $no = 0;
                while($row = mysqli_fetch_array($query)){

                echo '
                    <table class="bordered" id="tbl">
                        <tbody>
                            <tr>
                                <td class="tgh" id="lbr" colspan="10">LEMBAR DISPOSISI</td>
                            </tr>
                            <tr>
                                <td id="right" width="20%"><strong>Nomor Agenda</strong></td>
                                <td id="left" style="border-right: none;">: '.$row['no_agenda'].'</td>
                                <td id="right" width="25%"><strong>Tingkat Keamanan</strong></td>
								<td id="left" style="border-right: none;" colspan="6">:  SR / R / B</td>
                            </tr>
                            <tr>
								<td id="right" width="22%"><strong>Tanggal Penerimaan</strong></td>
								<td id="left" style="border-right: none;">: '.$row['tgl_surat'].'</td>
                                <td id="right" width="25%"><strong>Tgl Penyelesaian</strong></td>
								<td id="left" style="border-right: none;" colspan="6">:</td>
                            </tr>
                            <tr>
                                <td id="right" width="30%"><strong>Tanggal dan Nomor surat</strong></td>
                                <td id="left" colspan="8">: '.$row['no_surat'].'</td>
                            </tr>
                            <tr>
                                <td id="right"><strong>Dari</strong></td>
                                <td id="left" colspan="8">: '.$row['asal_surat'].'</td>
                            </tr>
                            <tr>
                                <td id="right"><strong>Ringkasan Isi</strong></td>
								<td id="left" colspan="8">: '.$row['isi'].'</td>
							</tr>
							<tr>
                                <td id="right"><strong>Lampiran</strong></td>
								<td id="left" colspan="8">: '.$row['indeks'].'</td>
                            </tr>
                            <tr>
                                <td id="right"><strong><center>Disposisi</center></strong></td>
                                <td id="left" colspan="1"></td>
								<td id="right"><strong><center>Diteruskan kepada</center></strong></td>
                                <td id="left" colspan="3"></td>
								<td><strong><center>Paraf</center></strong></td>
                            </tr>
                            <tr>';
                            $query3 = mysqli_query($config, "SELECT * FROM tbl_disposisi JOIN tbl_surat_masuk ON tbl_disposisi.id_surat = tbl_surat_masuk.id_surat WHERE tbl_disposisi.id_surat='$id_surat'");

                            if(mysqli_num_rows($query3) > 0){
                                $no = 0;
                                $row = mysqli_fetch_array($query3);{
                                echo '
                            <tr class="isi">
                                <td colspan="2">
                                    <strong>Isi Disposisi :</strong><br/>'.$row['isi_disposisi'].'
                                </td>
                            </tr>';
                                }
                            } else {
                                echo '
                                <tr class="isi">
                                    <td colspan="2"><strong></strong></td>
                                    <td colspan="4">

                                    <li><b>Kabag Umum</b></li>
                                    <ol type="a">
                                        <li>Kasubag Admin</li>
                                        <li>Kasubag Perencanaan</li>
                                        <li>Kasubag Sarpas</li>
                                        <li>Bendahara</li>
										<li>Humas</li>
                                    </ol>

                                    <li><b>Kabid P2M</b></li>
                                    <ol type="a">
                                        <li>Kasi Pencegahan</li>
                                        <li>Kasi Dayamas</li>
                                    </ol>

                                    <li><b>Kabid Rehabilitas</b></li>
                                     <ol type="a">
                                        <li>Kasi PLR</li>
                                        <li>Kasi Pasca Rehab</li>
                                    </ol>

                                    <li><b>Kabid Pemberantasan</b></li>
                                     <ol type="a">
                                        <li>Kasi Intelijen</li>
                                        <li>Kasi Penyidikan</li>
                                        <li>Kasi Wastati</li>
                                    </ol>
                                    <strong></strong></td>

                                    <td colspan="2"><strong></strong></td>
                                </tr>';
                            }
                        } echo '
                </tbody>
            </table>
    <!-- Container END -->

    </body>';
    }
}
?>
