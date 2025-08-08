<?php
// 1. PENGECEKAN SESSION
// =====================
if (empty($_SESSION['admin'])) {
    $_SESSION['err'] = '<center>Anda harus login terlebih dahulu!</center>';
    header("Location: ./");
    die();
}

// 2. ROUTING UNTUK SUB-HALAMAN
// =============================
if (isset($_REQUEST['act'])) {
    $act = $_REQUEST['act'];
    switch ($act) {
        case 'add':
            include "tambah_user.php";
            break;
        case 'edit':
            include "edit_tipe_user.php";
            break;
        case 'del':
            include "hapus_user.php";
            break;
    }
} else {
    // 3. LOGIKA UTAMA & PERSIAPAN DATA
    // ================================

    // Pengaturan Paginasi
    $limit = 5;
    $pg = isset($_GET['pg']) && is_numeric($_GET['pg']) ? (int)$_GET['pg'] : 1;
    $curr = ($pg - 1) * $limit;

    // Query untuk menghitung total data (lebih efisien)
    $count_query = mysqli_query($config, "SELECT COUNT(*) FROM tbl_user");
    $cdata = mysqli_fetch_row($count_query)[0];
    $cpg = ceil($cdata / $limit);

    // Keamanan: Query utama dengan Prepared Statements
    $users = [];
    $stmt = mysqli_prepare($config, "SELECT * FROM tbl_user LIMIT ?, ?");
    mysqli_stmt_bind_param($stmt, "ii", $curr, $limit);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    while ($row = mysqli_fetch_assoc($result)) {
        $users[] = $row;
    }
    
    // Fungsi untuk menampilkan notifikasi
    function display_flash_message() {
        foreach (['succAdd', 'succEdit', 'succDel'] as $key) {
            if (isset($_SESSION[$key])) {
                echo '<div class="card-panel green lighten-4 green-text text-darken-4">
                        <i class="material-icons left">check_circle</i>' . $_SESSION[$key] . '
                      </div>';
                unset($_SESSION[$key]);
                break; // Hanya tampilkan satu notifikasi per load
            }
        }
    }
?>

<style>
    :root {
        --primary-color: #1e88e5; /* Blue */
        --admin-color: #43a047; /* Green */
        --super-admin-color: #f44336; /* Red */
        --user-color: #78909c; /* Blue Grey */
    }
    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 20px 0;
    }
    .page-header h4 {
        margin: 0;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .data-card {
        border-radius: 10px;
        overflow: hidden; /* Agar card-action sesuai radius */
    }
    .table-container {
        padding: 0 1.5rem 1.5rem 1.5rem;
        overflow-x: auto;
    }
    .table-custom {
        width: 100%;
        border-collapse: collapse;
    }
    .table-custom th, .table-custom td {
        padding: 12px 15px;
        text-align: left;
        vertical-align: middle;
        border-bottom: 1px solid #e0e0e0;
    }
    .table-custom thead th {
        background-color: #f5f5f5;
        font-weight: 600;
    }
    .table-custom tbody tr:hover {
        background-color: #f9f9f9;
    }
    .user-level-chip {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 5px 12px;
        border-radius: 16px;
        font-size: 0.9rem;
        font-weight: 500;
        color: white;
    }
    .chip-super-admin { background-color: var(--super-admin-color); }
    .chip-admin { background-color: var(--admin-color); }
    .chip-user { background-color: var(--user-color); }
    .action-buttons a.disabled {
        background-color: #BDBDBD !important;
        cursor: not-allowed;
    }
    .pagination-container {
        padding: 1.5rem;
        background-color: #f5f5f5;
        border-top: 1px solid #e0e0e0;
    }
    .pagination-container .pagination {
        margin: 0;
        display: flex;
        justify-content: center;
    }
</style>

<div class="page-header">
    <h4><i class="material-icons">people</i> Manajemen Pengguna</h4>
    <a href="?page=sett&sub=usr&act=add" class="btn waves-effect waves-light blue">
        <i class="material-icons left">add</i> Tambah Pengguna
    </a>
</div>

<?php display_flash_message(); ?>

<div class="card data-card">
    <div class="table-container">
        <table class="table-custom highlight">
            <thead>
                <tr>
                    <th width="5%">No</th>
                    <th width="25%">Username</th>
                    <th width="30%">Nama Lengkap</th>
                    <th width="20%">Level</th>
                    <th width="20%" class="center-align">Tindakan</th>
                </tr>
            </thead>
            <tbody>
                <?php if (!empty($users)):
                    $no = $curr + 1;
                    foreach ($users as $row):
                        // Logika untuk menentukan level pengguna
                        $level_text = 'User';
                        $level_icon = 'person';
                        $level_class = 'chip-user';
                        if ($row['admin'] == 1) {
                            $level_text = 'Super Admin';
                            $level_icon = 'verified_user';
                            $level_class = 'chip-super-admin';
                        } elseif ($row['admin'] == 3) {
                            $level_text = 'Administrator';
                            $level_icon = '';
                            $level_class = 'chip-admin';
                        }
                ?>
                        <tr>
                            <td><?= $no++; ?>.</td>
                            <td><?= htmlspecialchars($row['username']); ?></td>
                            <td><?= htmlspecialchars($row['nama']); ?></td>
                            <td>
                                <div class="user-level-chip <?= $level_class; ?>">
                                    <i class="material-icons tiny"><?= $level_icon; ?></i>
                                    <span><?= $level_text; ?></span>
                                </div>
                            </td>
                            <td class="center-align action-buttons">
                                <?php
                                if ($row['id_user'] == 1 || $_SESSION['id_user'] == $row['id_user']): ?>
                                    <a class="btn-floating btn-small waves-effect waves-light grey tooltipped disabled" data-position="top" data-tooltip="Tidak ada tindakan">
                                        <i class="material-icons">do_not_disturb</i>
                                    </a>
                                <?php else: ?>
                                    <a class="btn-floating btn-small waves-effect waves-light blue tooltipped" data-position="top" data-tooltip="Edit Pengguna" href="?page=sett&sub=usr&act=edit&id_user=<?= $row['id_user']; ?>">
                                        <i class="material-icons">edit</i>
                                    </a>
                                    <a class="btn-floating btn-small waves-effect waves-light red tooltipped" data-position="top" data-tooltip="Hapus Pengguna" href="?page=sett&sub=usr&act=del&id_user=<?= $row['id_user']; ?>">
                                        <i class="material-icons">delete</i>
                                    </a>
                                <?php endif; ?>
                            </td>
                        </tr>
                <?php endforeach;
                else: ?>
                    <tr>
                        <td colspan="5" class="center-align" style="padding: 2rem;">Tidak ada data pengguna untuk ditampilkan.</td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>

    <?php if ($cdata > $limit): ?>
        <div class="pagination-container">
            <ul class="pagination">
                <?php
                    if ($pg > 1) {
                        $prev = $pg - 1;
                        echo '<li><a href="?page=sett&sub=usr&pg=1"><i class="material-icons">first_page</i></a></li>
                              <li><a href="?page=sett&sub=usr&pg='.$prev.'"><i class="material-icons">chevron_left</i></a></li>';
                    } else {
                        echo '<li class="disabled"><a><i class="material-icons">first_page</i></a></li>
                              <li class="disabled"><a><i class="material-icons">chevron_left</i></a></li>';
                    }

                    for ($i = 1; $i <= $cpg; $i++) {
                        if (($i >= $pg - 2 && $i <= $pg + 2) || $i == 1 || $i == $cpg) {
                            if ($i == $pg) echo '<li class="active blue"><a>'.$i.'</a></li>';
                            else echo '<li><a href="?page=sett&sub=usr&pg='.$i.'">'.$i.'</a></li>';
                        }
                    }

                    if ($pg < $cpg) {
                        $next = $pg + 1;
                        echo '<li><a href="?page=sett&sub=usr&pg='.$next.'"><i class="material-icons">chevron_right</i></a></li>
                              <li><a href="?page=sett&sub=usr&pg='.$cpg.'"><i class="material-icons">last_page</i></a></li>';
                    } else {
                        echo '<li class="disabled"><a><i class="material-icons">chevron_right</i></a></li>
                              <li class="disabled"><a><i class="material-icons">last_page</i></a></li>';
                    }
                ?>
            </ul>
        </div>
    <?php endif; ?>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.tooltipped');
    M.Tooltip.init(elems);
});
</script>

<?php
} // End of main else
?>