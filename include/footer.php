<?php
// Cek session admin.
if (!empty($_SESSION['admin'])) {
?>
<noscript>
    <meta http-equiv="refresh" content="0;URL='./enable-javascript.html'" />
</noscript>

<style>
    /* Memberi sedikit ruang dan garis atas yang lembut pada footer */
    footer.page-footer {
        padding-top: 0;
        margin-top: 40px;
        border-top: 1px solid #e0e0e0;
    }
    
    /* MODIFIKASI: Menyiapkan wadah untuk animasi berjalan */
    .footer-copyright #footer {
        overflow: hidden; /* Sembunyikan teks saat berada di luar area footer */
        position: relative;
        height: 100%;
    }
    
    /* MODIFIKASI: Menerapkan animasi pada teks */
    .scrolling-text {
        /* Memastikan teks tetap dalam satu baris */
        white-space: nowrap; 
        /* Menerapkan animasi */
        display: inline-block; /* Diperlukan agar transform bekerja */
        animation: scroll-right-to-left 25s linear infinite;
    }

    /* MODIFIKASI: Definisi keyframe untuk animasi berjalan */
    @keyframes scroll-right-to-left {
        0% {
            transform: translateX(100vw); /* Mulai dari sisi kanan layar */
        }
        100% {
            transform: translateX(-100%); /* Selesai di sisi kiri elemen itu sendiri */
        }
    }

    /* Sedikit styling untuk teks copyright */
    .copyright-text {
        font-size: 0.9rem;
        letter-spacing: 0.5px;
    }
    .blue-grey.darken-1 {
        background-color: #1A87C7 !important
    }
</style>

<footer class="page-footer">
    <div class="footer-copyright blue-grey darken-1">
        <div class="container" id="footer">
            <?php
            // Query lebih efisien: hanya pilih kolom 'foot' dan batasi 1 baris.
            $query = mysqli_query($config, "SELECT foot FROM tbl_instansi LIMIT 1");

            if ($data = mysqli_fetch_assoc($query)) {
                // MODIFIKASI: Menambahkan class 'scrolling-text' pada elemen span
                echo '<span class="white-text copyright-text scrolling-text">Badan Narkotika Nasional Provinsi NTB &copy; ' . date("Y") . ' ' . htmlspecialchars($data['foot']) . '</span>';
            } else {
                // Fallback jika data tidak ditemukan.
                echo '<span class="white-text copyright-text scrolling-text">Badan Narkotika Nasional Provinsi NTB &copy; ' . date("Y") . '</span>';
            }
            ?>
        </div>
    </div>
</footer>
<script type="text/javascript" src="asset/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="asset/js/materialize.min.js"></script>
<script type="text/javascript" src="asset/js/bootstrap.min.js"></script>
<script type="text/javascript" src="asset/js/jquery.autocomplete.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    // Inisialisasi Dropdown Materialize
    $(".dropdown-button").dropdown({
        hover: false // Tampil saat di-klik, bukan hover
    });

    // Inisialisasi Sidenav untuk tampilan mobile
    $('.button-collapse').sideNav({
        menuWidth: 240,
        edge: 'left',
        closeOnClick: true
    });

    // Inisialisasi Datepicker untuk semua input dengan ID yang relevan
    $('#tgl_surat, #batas_waktu, #dari_tanggal, #sampai_tanggal').pickadate({
        selectMonths: true,
        selectYears: 15, // Rentang tahun lebih luas
        format: "yyyy-mm-dd",
        formatSubmit: "yyyy-mm-dd"
    });

    // Inisialisasi Textarea (auto-resize)
    if ($('#isi_ringkas').length) {
        $('#isi_ringkas').val('');
        $('#isi_ringkas').trigger('autoresize');
    }

    // Inisialisasi Select Dropdown dan Tooltip Materialize
    $('select').material_select();
    $('.tooltipped').tooltip({
        delay: 50
    });

    // Inisialisasi Autocomplete untuk field #kode
    if ($("#kode").length) {
        $("#kode").autocomplete({
            serviceUrl: "kode.php", // Endpoint untuk data autocomplete
            dataType: "JSON",
            onSelect: function(suggestion) {
                $("#kode").val(suggestion.kode);
            }
        });
    }

    // Sembunyikan notifikasi setelah 5 detik
    $("#alert-message").delay(5000).fadeOut('slow');

    // Inisialisasi Modal/Dialog
    $('.modal-trigger').leanModal();
});
</script>
<?php
} else {
    // Jika tidak ada session 'admin', redirect ke halaman login
    header("Location: ../");
    die();
}
?>