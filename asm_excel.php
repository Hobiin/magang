<?php
// Pastikan sesi admin aktif dan ada koneksi database
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// Pastikan file koneksi di-include. Sesuaikan path jika perlu.
include 'include/config.php'; 

// 1. KEAMANAN DAN VALIDASI
// ==========================
if (empty($_SESSION['admin'])) {
    die("Akses ditolak. Silakan login terlebih dahulu.");
}

// Ambil tanggal dari URL dengan aman
$dari_tanggal = $_GET['dari'] ?? '';
$sampai_tanggal = $_GET['sampai'] ?? '';

if (empty($dari_tanggal) || empty($sampai_tanggal)) {
    die("Periode tanggal tidak valid. Silakan kembali dan pilih periode yang benar.");
}

// 2. MENGATUR HTTP HEADER UNTUK DOWNLOAD
// ======================================
// Ini memberitahu browser untuk men-download file, bukan menampilkannya.
$filename = "Laporan_Surat_Masuk_" . $dari_tanggal . "_sd_" . $sampai_tanggal . ".xls";
header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=\"$filename\"");


// 3. FUNGSI BANTU UNTUK TANGGAL
// ==============================
if (!function_exists('indoDate')) {
    function indoDate($date) {
        if (empty($date)) return '';
        $parts = explode('-', $date);
        if (count($parts) !== 3) return $date; 

        $months = [1 => 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        return htmlspecialchars($parts[2] . ' ' . $months[(int)$parts[1]] . ' ' . $parts[0]);
    }
}

// 4. MENGAMBIL DATA DARI DATABASE
// =================================
// Ambil data instansi untuk kop surat
$instansi = mysqli_fetch_assoc(mysqli_query($config, "SELECT institusi, nama, alamat FROM tbl_instansi"));

// Ambil data laporan surat masuk (Query SAMA SEPERTI di halaman laporan)
$report_data = [];
$sql = "SELECT no_agenda, tgl_surat, asal_surat, no_surat, isi, disposisi, keterangan 
        FROM tbl_surat_masuk 
        WHERE tgl_diterima BETWEEN ? AND ? 
        ORDER BY tgl_diterima DESC, id_surat DESC";

$stmt = mysqli_prepare($config, $sql);
mysqli_stmt_bind_param($stmt, "ss", $dari_tanggal, $sampai_tanggal);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

while ($row = mysqli_fetch_assoc($result)) {
    $report_data[] = $row;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Laporan Surat Masuk</title>
    <style>
        body { font-family: sans-serif; }
        .header { text-align: center; font-weight: bold; }
        .periode { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #333; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>

    <div class="header">
        <h3><?= htmlspecialchars($instansi['institusi'] ?? '') ?></h3>
        <h4><?= htmlspecialchars($instansi['nama'] ?? '') ?></h4>
        <p><?= htmlspecialchars($instansi['alamat'] ?? '') ?></p>
        <hr>
        <h3>LAPORAN REKAPITULASI SURAT MASUK</h3>
    </div>

    <div class="periode">
        <p>Periode: <strong><?= indoDate($dari_tanggal) ?></strong> s/d <strong><?= indoDate($sampai_tanggal) ?></strong></p>
    </div>

    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>Tgl. Surat</th>
                <th>Asal Surat</th>
                <th>Nomor Surat</th>
                <th>Perihal</th>
                <th>Disposisi</th>
                <th>Penerima</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($report_data)): ?>
                <?php $no = 1; foreach ($report_data as $row): ?>
                    <tr>
                        <td><?= $no++; ?></td>
                        <td><?= indoDate($row['tgl_surat']) ?></td>
                        <td><?= htmlspecialchars($row['asal_surat']) ?></td>
                        <td>'<?= htmlspecialchars($row['no_surat']) ?></td> 
                        <td><?= htmlspecialchars($row['isi']) ?></td>
                        <td><?= htmlspecialchars($row['disposisi']) ?></td>
                        <td><?= htmlspecialchars($row['keterangan']) ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="7" style="text-align: center;">Tidak ada data untuk periode ini.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>

</body>
</html>

<?php
// 6. MENUTUP KONEKSI DAN KELUAR
// =============================
mysqli_close($config);
exit();
?>