<?php
session_start();

// Cek session
if(empty($_SESSION['admin'])){
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
}

// Memanggil file koneksi database
require('include/config.php');

// Ambil data instansi untuk KOP SURAT
$query_instansi = mysqli_query($config, "SELECT institusi, nama, alamat, logo FROM tbl_instansi");
list($institusi, $nama_instansi, $alamat_instansi, $logo) = mysqli_fetch_array($query_instansi);

// Ambil data surat keluar berdasarkan ID dari URL
if(isset($_GET['id_surat'])){
    $id_surat = mysqli_real_escape_string($config, $_GET['id_surat']);
    $query_surat = mysqli_query($config, "SELECT * FROM tbl_surat_keluar WHERE id_surat='$id_surat'");
    
    if(mysqli_num_rows($query_surat) > 0) {
        $data_surat = mysqli_fetch_array($query_surat);

        // Siapkan variabel untuk ditampilkan
        $no_agenda = htmlspecialchars($data_surat['no_agenda']);
        $tgl_surat = htmlspecialchars($data_surat['tgl_surat']);
        $no_surat  = htmlspecialchars($data_surat['no_surat']);
        $perihal   = htmlspecialchars($data_surat['isi']);
        // Untuk kolom 'Dari', kita bisa hardcode sesuai contoh atau ambil dari data lain jika ada
        $dari      = "Bidang Rehabilitasi"; // Sesuaikan jika perlu

    } else {
        echo "Data surat keluar tidak ditemukan.";
        die();
    }
} else {
    echo "ID Surat tidak valid.";
    die();
}

?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Cetak Lembar Disposisi Nota Dinas</title>
    <style type="text/css">
        body { 
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11pt; 
            background-color: #f0f0f0;
        }
        
        .lembar-wrapper { 
            width: 21cm;
            padding: 1cm; 
            margin: 1cm auto;
            background: white;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            box-sizing: border-box;
        }
        .kop-surat { 
            display: flex; 
            align-items: center; 
            gap: 15px;
            border-bottom: 2px solid black;
            padding-bottom: 10px; 
            margin-bottom: 10px; 
        }
        .logo { width: 90px; height: auto; }
        .kop-text { text-align: center; flex-grow: 1; line-height: 1.2; }
        .kop-text .instansi-utama { font-size: 14pt; font-weight: bold; }
        .kop-text .instansi-prov { font-size: 12pt; font-weight: bold; }
        .kop-text .alamat { font-size: 9pt; }

        .tabel-konten {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid black;
        }
        .tabel-konten th, .tabel-konten td {
            border: 1px solid black;
            padding: 6px 10px;
            vertical-align: top;
        }
        .tabel-konten .judul-utama {
            text-align: center;
            font-weight: bold;
            font-size: 12pt;
            padding: 8px;
        }
        
        .label-inline {
            display: inline-block;
            width: 140px; /* Atur lebar agar titik dua sejajar */
            font-weight: normal;
        }
        .info-cell {
            border-left: none;
            border-right: none;
        }
        
        .tabel-konten .header-disposisi {
            text-align: center;
            font-weight: bold;
        }
        .tabel-konten .kolom-disposisi {
            width: 75%;
        }
        .tabel-konten .kolom-paraf {
            width: 25%;
        }
        
        .tabel-konten .area-tulis {
            height: 160px;
        }

        @page { size: A4; margin: 0; }
        @media print {
            body { background: none; }
            .lembar-wrapper { margin: 0; padding: 1.5cm; box-shadow: none; }
            .no-print { display: none; } /* Menggunakan class .no-print */
        }
    </style>
</head>
<body>
    <div class="lembar-wrapper">
        <div class="kop-surat">
            <img class="logo" src="./upload/<?= htmlspecialchars($logo) ?>"/>
            <div class="kop-text">
                <div class="instansi-utama"><?= htmlspecialchars($institusi) ?></div>
                <div class="instansi-prov"><?= htmlspecialchars($nama_instansi) ?></div>
                <div class="alamat"><?= htmlspecialchars($alamat_instansi) ?><br>Telp : (0370)6177418 Fax : (0370)6177413 <br> Email : bnnpntb@gmail.com</div>
            </div>
        </div>

        <table class="tabel-konten">
            <tr>
                <td colspan="2" class="judul-utama">LEMBAR DISPOSISI NOTA DINAS</td>
            </tr>
            <tr>
                <td colspan="2" class="info-cell">
                    <span class="label-inline">Nomor Agenda</span>: <?= $no_agenda ?>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="info-cell">
                    <span class="label-inline">Tanggal</span>: <?= empty($tgl_surat) ? '' : date('d-m-Y', strtotime($tgl_surat)) ?>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="info-cell">
                    <span class="label-inline">Nomor Surat</span>: <?= $no_surat ?>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="info-cell">
                    <span class="label-inline">Dari</span>: <?= $dari ?>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="info-cell">
                    <span class="label-inline">Perihal</span>: <?= $perihal ?>
                </td>
            </tr>
            <tr>
                <td class="header-disposisi kolom-disposisi">Disposisi</td>
                <td class="header-disposisi kolom-paraf">Paraf</td>
            </tr>
            <tr>
                <td class="area-tulis"></td>
                <td class="area-tulis"></td>
            </tr>
        </table>
    </div>

    <div class="no-print" style="text-align: center; padding: 10px;">
        <button onclick="window.print()" style="padding: 10px 20px; font-size: 16px;">
            🖨️ Cetak Lembar Disposisi
        </button>
    </div>

</body>
</html>