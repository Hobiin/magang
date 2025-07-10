<?php
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=rekap_surat_keluar.xls");

include "include/config.php";

$config = mysqli_connect($host, $username, $password, $database);
$query = mysqli_query($config, "SELECT * FROM tbl_surat_keluar WHERE tgl_catat BETWEEN '$_GET[dari]' AND '$_GET[sampai]'");

?>

<table border="1" cellspacing="0" cellpadding="5">
	<thead>
		
		<tr>
			<th>No Agenda</th>
			<th>Tanggal Surat</th>
			<th>Nomor Surat</th>
			<th>Kode Klasifikasi</th>
			<th>Perihal</th>
			<th>Tujuan Surat</th>
			<th>Keterangan</th>
		</tr>
	</thead>
	<tbody>
		

              <?php while ($row = mysqli_fetch_array($query)) {
			echo '<tr>
                                        <td>'.$row['no_agenda'].'</td>
                                        <td>'.$row['tgl_surat'].'</td>
										<td>'.$row['no_surat'].'</td>
										<td>'.$row['kode'].'</td>
										<td>'.$row['isi'].'</td>
                                        <td>'.$row['tujuan'].'</td>
										<td>'.$row['keterangan'].'</td>
										</tr>';
		} ?>
	</tbody>

</table>