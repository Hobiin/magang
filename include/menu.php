<?php
// Cek session
if (!empty($_SESSION['admin'])) {

    // Ambil data instansi sekali saja di awal untuk efisiensi
    $query_instansi = mysqli_query($config, "SELECT nama, logo, alamat FROM tbl_instansi");
    $instansi = mysqli_fetch_assoc($query_instansi);

    // Ambil halaman aktif untuk memberi highlight pada menu
    $page = isset($_GET['page']) ? $_GET['page'] : '';
?>

<style>
    :root {
        --primary-color:rgb(248, 248, 248); /* Blue */
        --primary-color-dark: #1A87C7; /* Darker Blue */
    }
    /* Top Navigation Bar */
    .main-nav {
        background: linear-gradient(135deg,rgb(0, 91, 170), rgb(79, 195, 247))!important;
        color: #424242;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    .main-nav .nav-wrapper {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .main-nav a {
        color: black !important;
    }
    .main-nav .brand-logo,
    .main-nav .button-collapse {
        color: white !important;
    }
    .main-nav .top-nav-link > li > a {
        font-size: 1rem;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 8px;
        padding: 0 15px;
    }
    .main-nav .top-nav-link > li.active {
        background-color: rgba(255, 255, 255, 0.15);
    }
    .main-nav .top-nav-link > li.active > a {
        color: white !important;
    }
    .main-nav .profile-trigger i {
        font-size: 1.5rem;
    }

    .dropdown-content {
        background-color: #1A87C7 !important;
    }
    .dropdown-content li > a {
        color: white !important;
    }
    .dropdown-content li:hover, .dropdown-content li.active {
        background-color: #177db8 !important;
    }
    .dropdown-content li.divider {
        background-color: rgba(255, 255, 255, 0.2) !important;
    }
    
    /* Side Navigation (Mobile) */
    .side-nav .logo-side {
        padding: 20px;
        text-align: center;
    }
    .side-nav .logo-side img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 50%;
        margin-bottom: 10px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
    .side-nav .logo-side h5 {
        margin: 0 0 5px 0;
        font-size: 1.2rem;
        font-weight: 600;
    }
    .side-nav .logo-side p {
        margin: 0;
        font-size: 0.9rem;
        color: rgba(241, 243, 248, 0.8);
    }
    .side-nav li.active {
        background-color: var(--primary-color-dark);
    }
    .side-nav .collapsible-body li.active {
        background-color: #1A87C7;
    }
    .side-nav .collapsible-body a {
        padding-left: 62px !important;
    }

    /* == CSS UNTUK TRANSISI HALAMAN == */
    main {
        /* Menerapkan animasi ke kontainer konten utama */
        animation: fadeInUp 0.5s ease-out forwards;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px); /* Mulai dari posisi sedikit di bawah */
        }
        to {
            opacity: 1;
            transform: translateY(0); /* Selesai di posisi normal */
        }
    }
    /* == AKHIR DARI CSS TRANSISI == */

</style>

<nav class="main-nav no-print">
    <div class="nav-wrapper">
        <a href="./" class="brand-logo hide-on-large-only" style="margin-left: 15px;">
            <i class="material-icons">archive</i> Arsip
        </a>

        <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>

        <ul class="left hide-on-med-and-down top-nav-link">
            <li class="<?= ($page == '') ? 'active' : '' ?>"><a href="admin.php"><i class="material-icons">dashboard</i>Beranda</a></li>
            
            <?php if ($_SESSION['admin'] == 1 || $_SESSION['admin'] == 3): ?>
            <li class="<?= ($page == 'tsm' || $page == 'tsk') ? 'active' : '' ?>">
                <a class="dropdown-button" href="#!" data-activates="transaksi">
                    <i class="material-icons">swap_horiz</i>Transaksi Surat<i class="material-icons right">arrow_drop_down</i>
                </a>
            </li>
            <?php endif; ?>

            <li class="<?= ($page == 'asm' || $page == 'ask') ? 'active' : '' ?>">
                <a class="dropdown-button" href="#!" data-activates="report">
                    <i class="material-icons">assessment</i>Laporan<i class="material-icons right">arrow_drop_down</i>
                </a>
            </li>

            <?php if ($_SESSION['admin'] == 1): ?>
            <li class="<?= ($page == 'sett') ? 'active' : '' ?>">
                <a class="dropdown-button" href="#!" data-activates="pengaturan">
                    <i class="material-icons">settings</i>Pengaturan<i class="material-icons right">arrow_drop_down</i>
                </a>
            </li>
            <?php endif; ?>
        </ul>

        <ul class="right hide-on-med-and-down top-nav-link">
            <li>
                <a class="dropdown-button profile-trigger" href="#!" data-activates="logout">
                    <i class="material-icons left">account_circle</i>
                    <?= htmlspecialchars($_SESSION['nama']); ?>
                    <i class="material-icons right">arrow_drop_down</i>
                </a>
            </li>
        </ul>

        <ul id='transaksi' class='dropdown-content'>
            <li><a href="?page=tsm">Surat Masuk</a></li>
            <li><a href="?page=tsk">Surat Keluar</a></li>
        </ul>
        <ul id='report' class='dropdown-content'>
            <li><a href="?page=asm">Laporan Surat Masuk</a></li>
            <li><a href="?page=ask">Laporan Surat Keluar</a></li>
        </ul>
        <ul id='pengaturan' class='dropdown-content'>
            <li><a href="?page=sett">Instansi</a></li>
            <li><a href="?page=sett&sub=usr">Manajemen Pengguna</a></li>
            <li class="divider"></li>
            <li><a href="?page=sett&sub=back">Backup Database</a></li>
            <li><a href="?page=sett&sub=rest">Restore Database</a></li>
        </ul>
        <ul id='logout' class='dropdown-content'>
            <li><a href="?page=pro">Profil Saya</a></li>
            <li class="divider"></li>
            <li><a href="logout.php"><i class="material-icons">exit_to_app</i>Logout</a></li>
        </ul>
    </div>
</nav>

<ul id="slide-out" class="side-nav no-print">
    <li>
        <div class="logo-side center blue darken-3 white-text">
            <img src="./upload/<?= htmlspecialchars($instansi['logo'] ?? 'logo.png'); ?>" alt="Logo Instansi"/>
            <h5><?= htmlspecialchars($instansi['nama'] ?? 'BNN Provinsi NTB'); ?></h5>
            <p><?= htmlspecialchars($instansi['alamat'] ?? 'Jl. Lingkar Selatan, Mataram'); ?></p>
        </div>
    </li>
    <li class="blue darken-4 white-text no-padding">
        <ul class="collapsible collapsible-accordion">
            <li>
                <a class="collapsible-header waves-effect white-text"><i class="material-icons">account_circle</i><?= htmlspecialchars($_SESSION['nama']); ?></a>
                <div class="collapsible-body">
                    <ul>
                        <li class="<?= ($page == 'pro') ? 'active' : '' ?>"><a href="?page=pro">Profil</a></li>
                        <li><a href="logout.php">Logout</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </li>
    <li class="divider"></li>
    <li class="<?= ($page == '') ? 'active' : '' ?>"><a href="./"><i class="material-icons">dashboard</i>Beranda</a></li>

    <?php if ($_SESSION['admin'] == 1 || $_SESSION['admin'] == 3): ?>
    <li class="no-padding">
        <ul class="collapsible collapsible-accordion">
            <li>
                <a class="collapsible-header waves-effect"><i class="material-icons">swap_horiz</i>Transaksi Surat</a>
                <div class="collapsible-body">
                    <ul>
                        <li class="<?= ($page == 'tsm') ? 'active' : '' ?>"><a href="?page=tsm">Surat Masuk</a></li>
                        <li class="<?= ($page == 'tsk') ? 'active' : '' ?>"><a href="?page=tsk">Surat Keluar</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </li>
    <?php endif; ?>

    <li class="no-padding">
        <ul class="collapsible collapsible-accordion">
            <li>
                <a class="collapsible-header waves-effect"><i class="material-icons">assessment</i>Laporan</a>
                <div class="collapsible-body">
                    <ul>
                        <li class="<?= ($page == 'asm') ? 'active' : '' ?>"><a href="?page=asm">Laporan Surat Masuk</a></li>
                        <li class="<?= ($page == 'ask') ? 'active' : '' ?>"><a href="?page=ask">Laporan Surat Keluar</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </li>

    <?php if ($_SESSION['admin'] == 1): ?>
    <li class="no-padding">
        <ul class="collapsible collapsible-accordion">
            <li>
                <a class="collapsible-header waves-effect"><i class="material-icons">settings</i>Pengaturan</a>
                <div class="collapsible-body">
                    <ul>
                        <li class="<?= ($page == 'sett' && !isset($_GET['sub'])) ? 'active' : '' ?>"><a href="?page=sett">Instansi</a></li>
                        <li class="<?= ($page == 'sett' && isset($_GET['sub']) && $_GET['sub'] == 'usr') ? 'active' : '' ?>"><a href="?page=sett&sub=usr">Manajemen Pengguna</a></li>
                        <li class="<?= ($page == 'sett' && isset($_GET['sub']) && $_GET['sub'] == 'back') ? 'active' : '' ?>"><a href="?page=sett&sub=back">Backup DB</a></li>
                        <li class="<?= ($page == 'sett' && isset($_GET['sub']) && $_GET['sub'] == 'rest') ? 'active' : '' ?>"><a href="?page=sett&sub=rest">Restore DB</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </li>
    <?php endif; ?>
</ul>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Init Sidenav
    var sidenav = document.querySelectorAll('.side-nav');
    M.Sidenav.init(sidenav);

    // Init Dropdown
    var dropdown = document.querySelectorAll('.dropdown-button');
    M.Dropdown.init(dropdown, {
        constrainWidth: false, // Dropdown can be wider than the button
        hover: true,
        belowOrigin: true
    });
    
    // Init Collapsible
    var collapsible = document.querySelectorAll('.collapsible');
    M.Collapsible.init(collapsible);
});
</script>

<?php
} else {
    header("Location: ../");
    die();
}
?>