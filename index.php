<?php
ob_start();
session_start();

require_once 'include/config.php';
require_once 'include/functions.php';
$config = conn($host, $username, $password, $database);

if (isset($_POST['submit'])) {
    $username = mysqli_real_escape_string($config, $_POST['username']);
    $password = mysqli_real_escape_string($config, $_POST['password']);

    $query = mysqli_query($config, "SELECT * FROM tbl_user WHERE username='$username' AND password=MD5('$password')");

    if (mysqli_num_rows($query) > 0) {
        $data = mysqli_fetch_assoc($query);
        $_SESSION['id_user'] = $data['id_user'];
        $_SESSION['username'] = $data['username'];
        $_SESSION['nama'] = $data['nama'];
        $_SESSION['admin'] = $data['admin'];
        $_SESSION['nip'] = $data['nip'];
        header("Location: admin.php");
        exit;
    } else {
        $error = "Username atau Password salah!";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Login Arsip Surat BNN</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body, html {
            height: 100%;
            background: #f9fafb;
        }

        .container {
            display: flex;
            flex-direction: row;
            min-height: 100vh;
        }

        .left {
            flex: 1;
            background: url('asset/img/background.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
            color: #fff;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.6);
        }

        .left::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.4);
            z-index: 0;
        }

        .intro-box {
            position: relative;
            z-index: 1;
            animation: fadeInUp 1s ease-out;
            max-width: 520px;
        }

        .brand-heading {
            font-size: 2.4rem;
            font-weight: 600;
            color: #fff;
            margin-bottom: 16px;
            line-height: 1.3;
        }

        .highlight {
            color: #3f82e6ff;
            font-weight: 700;
        }

        .description {
            font-size: 1.05rem;
            font-weight: 300;
            color: #e2e8f0;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .project-tagline {
            font-size: 0.85rem;
            color: #94a3b8;
            font-style: italic;
        }
        .project-tagline-h5 {
            font-size: 0.7rem;
            color: #94a3b8;
            /* font-style: italic; */
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .right {
            flex: 0.4;
            background: linear-gradient(135deg, rgb(0, 91, 170), rgb(79, 195, 247));
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px;
        }

        .form-box {
            width: 100%;
            max-width: 360px;
            background: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .form-box h2.title-underline {
            text-align: center;
            font-size: 1.75rem;
            font-weight: 600;
            color: #0f172a;
            position: relative;
            margin-bottom: 10px;
        }

        .form-box h2.title-underline::after {
            content: '';
            display: block;
            margin: 6px auto 0;
            width: 50px;
            height: 3px;
            background-color: rgb(23,58,74);
            border-radius: 2px;
        }

        .subtitle {
            text-align: center;
            font-size: 0.9rem;
            color: rgb(48, 45, 45);
            margin-bottom: 30px;
        }

        .form-box img {
            display: block;
            margin: 0 auto 20px;
            width: 120px;
            height: 120px;
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        .input-group label {
            font-weight: 500;
            margin-bottom: 6px;
            display: block;
            color: #111827;
        }

        .input-group input {
            width: 100%;
            height: 48px;
            padding: 12px 40px 12px 12px;
            border: 1px solid #d1d5db;
            background: #f3f4f6;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .input-group input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.4);
            outline: none;
        }

        .input-group .material-icons {
            position: absolute;
            right: 10px;
            top: 50%;
            color: #9ca3af;
            cursor: pointer;
        }

        .btn {
            width: 100%;
            height: 48px;
            background: #3b82f6;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #2563eb;
        }

        .error {
            color: red;
            font-size: 0.9rem;
            margin-bottom: 10px;
            text-align: center;
        }

        #loader {
            display: none;
            text-align: center;
            margin-top: 10px;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .left {
                text-align: center;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="left">
        <div class="intro-box">
            <h1 class="brand-heading">Selamat Datang di<br> <span class="highlight">SIAPBNNP</span></h1>
            <p class="description">
                Sistem Informasi Arsip Persuratan <br>Badan Narkotika Nasional Provinsi NTB
            </p>
            <p class="project-tagline">A project by <strong>Universitas Bumigora 2025</strong></p>
            <h5 class="project-tagline-h5">System Analysis : Fajrul Husni S.E</h5 >
        </div>
    </div>

    <div class="right">
        <div class="form-box">
            <h2 class="title-underline">Masuk ke Sistem SIAPBNNP</h2>
            <p class="subtitle">Sistem Informasi Arsip Persuratan<br> Badan Narkotika Nasional Provinsi</p>
            <img src="upload/logo.png" alt="Logo">
            <?php if(isset($error)) echo '<div class="error">'.$error.'</div>'; ?>
            <form method="POST" action="" onsubmit="showLoader()">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" required>
                    <span class="material-icons">person</span>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>
                    <span class="material-icons" onclick="togglePassword()">visibility</span>
                </div>
                <button type="submit" name="submit" class="btn">Login</button>
                <div id="loader">Loading...</div>
            </form>
        </div>
    </div>
</div>

<script>
    function togglePassword() {
        const pw = document.getElementById("password");
        pw.type = pw.type === "password" ? "text" : "password";
    }

    function showLoader() {
        document.getElementById("loader").style.display = "block";
    }
</script>
</body>
</html>