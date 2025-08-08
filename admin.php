<?php
    ob_start();
    //cek session
    session_start();

    if(empty($_SESSION['admin'])){
        $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
        header("Location: ./");
        die();
    } else {
?>

<!doctype html>
<html lang="en">

<?php include('include/head.php'); ?>
<style>
    /* Mengatur sudut tumpul untuk semua kartu */
    .card {
        border-radius: 15px;
    }

    /* Kartu Selamat Datang dengan Video Background */
    .welcome-card {
        position: relative;
        overflow: hidden;
        color: #fff;
    }
    .welcome-card .background-video {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        min-width: 100%;
        min-height: 100%;
        width: auto;
        height: auto;
        z-index: 0;
    }
    .welcome-card .card-content {
        position: relative;
        z-index: 1;
        background: rgba(0, 0, 0, 0.4); /* Lapisan gelap agar teks lebih mudah dibaca */
        padding: 24px;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
    }
    #datetime-container {
        font-size: 1rem;
        margin-bottom: 1rem;
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        gap: 5px 15px;
    }
    #datetime-container i {
        vertical-align: middle;
    }

    /* Desain Baru untuk Kartu Statistik */
    .stat-card {
        position: relative;
        display: flex;
        align-items: center;
        padding: 20px;
        border-radius: 15px;
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        color: white;
    }
    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }
    .stat-card .stat-icon {
        font-size: 4rem;
        opacity: 0.2;
        position: absolute;
        right: -10px;
        bottom: -10px;
        transform: rotate(-15deg);
    }
    .stat-card-content h5 {
        font-weight: 300;
        margin: 0 0 5px 0;
        font-size: 1.2rem;
    }
    .stat-card-content h3 {
        margin: 0;
        font-weight: 600;
    }

    /* == PERUBAHAN PADA FOOTER KARTU STATISTIK == */
    .stat-card-footer {
        background-color: transparent; /* Dibuat transparan */
        border-top: 1px solid rgba(255, 255, 255, 0.3); /* Garis pemisah tipis */
        text-align: center;
        padding: 8px 0;
        margin: 20px -20px -20px -20px;
    }
    .stat-card-footer a {
        color: white;
        text-decoration: none;
        font-weight: 500;
    }
</style>

<body class="bg">

<header>
<?php include('include/menu.php'); ?>
</header>
<main>

    <div class="container">

    <?php
        if(isset($_REQUEST['page'])){
            $page = $_REQUEST['page'];
            // Switch case Anda untuk routing halaman
            switch ($page) {
                case 'tsm': include "transaksi_surat_masuk.php"; break;
                case 'ctk': include "cetak_disposisi.php"; break;
                case 'tsk': include "transaksi_surat_keluar.php"; break;
                case 'asm': include "agenda_surat_masuk.php"; break;
                case 'ask': include "agenda_surat_keluar.php"; break;
                case 'asm_excel': include "asm_excel.php"; break;
                case 'ask_excel': include "ask_excel.php"; break;
                case 'ref': include "referensi.php"; break;
                case 'sett': include "pengaturan.php"; break;
                case 'pro': include "profil.php"; break;
                case 'gsm': include "galeri_sm.php"; break;
                case 'gsk': include "galeri_sk.php"; break;
            }
        } else {
    ?>
        <div class="row">

            <?php include('include/header_instansi.php'); ?>
            <div class="col s12">
                <div class="card welcome-card">
                    <video playsinline autoplay muted loop class="background-video">
                        <source src="./asset/video/test.mp4" type="video/mp4">
                        Browser Anda tidak mendukung tag video.
                    </video>

                    <div class="card-content">
                        <div id="datetime-container">
                            <span><i class="material-icons">today</i> <span id="date-display"></span></span>
                            <span><i class="material-icons">access_time</i> <span id="time-display"></span></span>
                        </div>
                        
                        <h4>Selamat Datang, <?= htmlspecialchars($_SESSION['nama']); ?>!</h4>
                        
                        <p class="description" style="margin-top: 1rem;">
                            Anda login sebagai
                            <?php
                            $role_text = '';
                            switch ($_SESSION['admin']) {
                                case 1: $role_text = "<strong>Super Admin</strong>. Anda memiliki akses penuh terhadap sistem."; break;
                                case 2: $role_text = "<strong>User Biasa</strong>. Berikut adalah statistik data yang tersimpan."; break;
                                default: $role_text = "<strong>Petugas Disposisi</strong>. Berikut adalah statistik data yang tersimpan."; break;
                            }
                            echo $role_text;
                            ?>
                        </p>
                    </div>
                </div>
            </div>
            
            <?php
                // Query lebih efisien menggunakan COUNT(*)
                $count1_query = mysqli_query($config, "SELECT COUNT(*) FROM tbl_surat_masuk");
                $count1 = mysqli_fetch_row($count1_query)[0];

                $count2_query = mysqli_query($config, "SELECT COUNT(*) FROM tbl_surat_keluar");
                $count2 = mysqli_fetch_row($count2_query)[0];

                $count5_query = mysqli_query($config, "SELECT COUNT(*) FROM tbl_user");
                $count5 = mysqli_fetch_row($count5_query)[0];
            ?>

            <div class="col s12 m4">
                <a href="?page=tsm">
                    <div class="card-panel stat-card cyan darken-1">
                        <i class="material-icons stat-icon">mail</i>
                        <div class="stat-card-content">
                            <h5>Jumlah Surat Masuk</h5>
                            <h3><?= $count1 ?></h3>
                        </div>
                        <div class="stat-card-footer">
                           <span>Lihat Detail <i class="tiny material-icons">arrow_forward</i></span>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col s12 m4">
                <a href="?page=tsk">
                    <div class="card-panel stat-card deep-orange accent-3">
                        <i class="material-icons stat-icon">drafts</i>
                        <div class="stat-card-content">
                            <h5>Jumlah Surat Keluar</h5>
                            <h3><?= $count2 ?></h3>
                        </div>
                        <div class="stat-card-footer">
                           <span>Lihat Detail <i class="tiny material-icons">arrow_forward</i></span>
                        </div>
                    </div>
                </a>
            </div>

            <?php if($_SESSION['id_user'] == 1 || $_SESSION['admin'] == 2): ?>
            <div class="col s12 m4">
                <a href="?page=sett&sub=usr">
                    <div class="card-panel stat-card blue accent-4">
                        <i class="material-icons stat-icon">people</i>
                        <div class="stat-card-content">
                            <h5>Jumlah Pengguna</h5>
                            <h3><?= $count5 ?></h3>
                        </div>
                        <div class="stat-card-footer">
                           <span>Lihat Detail <i class="tiny material-icons">arrow_forward</i></span>
                        </div>
                    </div>
                </a>
            </div>
            <?php endif; ?>

        </div>
        <?php
        }
    ?>
    </div>
</main>

<script>
document.addEventListener('DOMContentLoaded', function() {
    function updateClock() {
        const now = new Date();
        const days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
        const months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        const dateString = `${days[now.getDay()]}, ${now.getDate()} ${months[now.getMonth()]} ${now.getFullYear()}`;
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const seconds = String(now.getSeconds()).padStart(2, '0');
        const timeString = `${hours}:${minutes}:${seconds}`;
        
        if(document.getElementById('date-display')){
            document.getElementById('date-display').textContent = dateString;
        }
        if(document.getElementById('time-display')){
            document.getElementById('time-display').textContent = timeString;
        }
    }
    setInterval(updateClock, 1000);
    updateClock();
});
</script>

<?php include('include/footer.php'); ?>

</body>
</html>

<?php
    }
?>