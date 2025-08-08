<?php
$host     = "localhost";    // Nama host
$username = "root";         // Username database
$password = "";             // Password database
$database = "ams_native";   // Nama database

// ====================================================================
// BUAT KONEKSI dan simpan hasilnya ke dalam variabel $config
// ====================================================================
$config = mysqli_connect($host, $username, $password, $database);

// Cek apakah koneksi berhasil dibuat
if (!$config) {
    die("Koneksi ke database gagal: " . mysqli_connect_error());
}
?>