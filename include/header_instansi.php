<?php
// Cek session
if (!empty($_SESSION['admin'])) {

    // Lebih efisien: Ambil data instansi sekali saja dan simpan dalam variabel
    $query = mysqli_query($config, "SELECT * FROM tbl_instansi LIMIT 1");
    $instansi = mysqli_fetch_assoc($query);

?>
<style>
    .header-instansi-card {
        display: flex;
        align-items: center; /* Membuat logo dan teks sejajar di tengah secara vertikal */
        gap: 20px; /* Jarak antara logo dan teks */
        padding: 20px !important; /* Override padding default card-panel */
        border-radius: 12px;
        background-color: #ffffff;
        box-shadow: 1,9px 20px rgba(0,0,0,0.08);
        border: 1px solid #e0e0e0;
    }
    .logo-container {
        flex-shrink: 0; /* Mencegah logo menyusut */
    }
    .logo-img {
        width: 75px;
        height: 75px;
        object-fit: cover; /* Memastikan gambar tidak gepeng */
        border-radius: 50%; /* Membuat logo menjadi lingkaran */
        border: 3px solidrgb(224, 224, 224);
    }
    .instansi-text .instansi-title {
        margin: 0;
        font-size: 1.8rem;
        font-weight: 500;
        color: #212121; /* Dark grey */
        line-height: 1.2;
    }
    .instansi-text .instansi-subtitle {
        margin: 5px 0 0 0;
        font-size: 1rem;
        color: #757575; /* Medium grey */
    }
</style>

<div class="col s12" id="header-instansi">
    <div class="card-panel header-instansi-card">
        <div class="logo-container">
            <?php
                // Gunakan logo dari database, atau logo default jika kosong
                $logo_src = !empty($instansi['logo']) ? './upload/' . htmlspecialchars($instansi['logo']) : './asset/img/logo.png';
            ?>
            <img class="logo-img" src="<?= $logo_src ?>" alt="Logo Instansi"/>
        </div>
        <div class="instansi-text">
            <?php
                // Gunakan data dari database, atau teks default jika kosong
                $nama_instansi = !empty($instansi['nama']) ? $instansi['nama'] : 'BNN PROVINSI NUSA TENGGARA BARAT';
                $alamat_instansi = !empty($instansi['alamat']) ? $instansi['alamat'] : 'Jl. Dr. Soedjono Lingkar Selatan, Mataram';
            ?>
            <h5 class="instansi-title"><?= htmlspecialchars($nama_instansi) ?></h5>
            <p class="instansi-subtitle"><?= htmlspecialchars($alamat_instansi) ?></p>
        </div>
    </div>
</div>

<?php
} else {
    header("Location: ./");
    die();
}
?>