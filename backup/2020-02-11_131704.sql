DROP TABLE tbl_disposisi;

CREATE TABLE `tbl_disposisi` (
  `id_disposisi` int(10) NOT NULL AUTO_INCREMENT,
  `tujuan` varchar(250) NOT NULL,
  `isi_disposisi` mediumtext NOT NULL,
  `sifat` varchar(100) NOT NULL,
  `batas_waktu` date NOT NULL,
  `catatan` varchar(250) NOT NULL,
  `id_surat` int(10) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_disposisi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE tbl_instansi;

CREATE TABLE `tbl_instansi` (
  `id_instansi` tinyint(1) NOT NULL,
  `institusi` varchar(150) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `kepsek` varchar(50) NOT NULL,
  `kasubag` varchar(45) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  `foot` varchar(50) NOT NULL,
  PRIMARY KEY (`id_instansi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tbl_instansi VALUES("1","BADAN NARKOTIKA NASIONAL REPUBLIK INDONESIA","PROVINSI NUSA TENGGARA BARAT","Instansi","Jl. Dr. Soedjono, Lingkar Selatan, Mataram NTB","Gde Sugianyar Dwi Putra","Fajrul Husni","-","https://bnn.go.id","bnnpntb@mail.com","logo.png","1","By Indra Gunawan - Selvia Giarfina");



DROP TABLE tbl_klasifikasi;

CREATE TABLE `tbl_klasifikasi` (
  `id_klasifikasi` int(5) NOT NULL AUTO_INCREMENT,
  `kode` varchar(30) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `uraian` mediumtext NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_klasifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




DROP TABLE tbl_sett;

CREATE TABLE `tbl_sett` (
  `id_sett` tinyint(1) NOT NULL,
  `surat_masuk` tinyint(2) NOT NULL,
  `surat_keluar` tinyint(2) NOT NULL,
  `referensi` tinyint(2) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_sett`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tbl_sett VALUES("1","10","10","10","5");



DROP TABLE tbl_surat_keluar;

CREATE TABLE `tbl_surat_keluar` (
  `id_surat` int(10) NOT NULL AUTO_INCREMENT,
  `no_agenda` int(10) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `isi` mediumtext NOT NULL,
  `kode` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_catat` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=765 DEFAULT CHARSET=latin1;

INSERT INTO tbl_surat_keluar VALUES("2","283","Rudi Hasibuan ","Sprin/283/IX/Ka/Rh.01.01/2019/BNNP-NTB","Melaksanakan tugas Home Visit","Sprin","2019-09-09","2019-09-12","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("3","284","Muslim  Sultryawan","Sprin/284/IX/RH.01.01/2019/BNNP-NTB","Melaksanakan tugas home visit","Sprin","2019-09-09","2019-09-12","","-","1");
INSERT INTO tbl_surat_keluar VALUES("4","285","buk reni","-","sprin narasumber","Sprin","2019-09-12","2019-09-13","","bookingan","1");
INSERT INTO tbl_surat_keluar VALUES("5","286","Anggraini Ninik M, SH.MH","Sprin/IX/Ka/Cm.00.00/2019/BNNP-NTB","Menjadi Narasumber kegiatan sosialisasi P4GN","Sprin","2019-09-12","2019-09-13","","Buk yuli","1");
INSERT INTO tbl_surat_keluar VALUES("6","287","Asep Badarudin, S.Pd","Sprin/287/IX/Ka/CM.00.00/2019/BNNP-NTB","melaksanakan tugas sebagai narasumber di universitas bumi gora","Sprin","2019-09-12","2019-09-13","","Buk yuli","1");
INSERT INTO tbl_surat_keluar VALUES("7","37","KA BNNK/KOTA","B-UND/37/IX/Ka/Bu.00.00/2019/BNNP-NTB","Undangan  penyusunan RKA/KL Pagu Anggaran Wilayah","Undangan","2019-09-13","2019-09-13","","santi (perencanaan)","1");
INSERT INTO tbl_surat_keluar VALUES("9","275","KAPOLDA NTB","B/275/IX/Ka/Rh.00.01/2019/BNNP-NTB","Hasil Verifikasi berkas permohonan TAT an.I Nengah Cipta","Biasa","2019-09-12","2019-09-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("10","276","KAPOLDA NTB","B/276/IX/Ka/Rh.00.01/2019/BNNP-NTB","Hasil Verifikasi berkas permohonan TAT an.I Nengah Cipta","Biasa","2019-09-12","2019-09-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("11","274","Kepala BNN Kab/Kota","B/274/IX/Ka/Rh.00.00/2019/BNNP-NTB","Uji kompetensi konselor adiksi ","Biasa","2019-09-12","2019-09-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("12","38","Harmoko,Spd","B/UND-38/IX/Ka/Rh.01.00/2019/BNNP-NTB","Undangan sebagai fasilitator","Undangan","2019-09-06","2019-09-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("13","288","dr.Yolly Dahlia.,SpKJ , Sri Rohayati, Apt.MPH.ATOT","Sprin/288/V","BIMTEK dan peningkatan mutu layanan lembaga rehabilitasi di Kab LOTIM tanggal 16-17 September 2019","Sprin","2019-09-12","2019-09-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("14","289","Sri Rohayati, Apt., MPH-ATOD, LM Desrial Fahroza , S.Psi.Msi","Sprin/289/IX/Ka/Rh.00.01/2019/BNNP-NTB","BIMTEK Peningkatan mutu Layanan Rehabilitasi di LOTENG","Sprin","2019-09-12","2019-09-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("15","290","Daftar terlampir","Sprin/290/IX/Ka/Cm.00.00/2019/BNN-NTB","Melaksanakan tugas sebagai panitia kegiatan desiminasi informasi di Hotel Lombok Plaza Mataram","Sprin","2019-09-12","2019-09-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("16","291","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/291/IX/Ka/Cm.00.00/2019/BNNP-NTB","tugas sebagai narasumber kegiatan desiminasi informasi
","Sprin","2019-09-12","2019-09-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("17","276","REKTOR UIN MATARAM","B/276/IX/Ka/cm.00.00/2019/BNNP-NTB","Permohonan narasumber
","Biasa","2019-09-12","2019-09-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("18","39","Daftar terlampir","B/Und/IX/Ka/cm.00.00/2019/BNNP-NTB","Undangan desiminasi informasi melalui talkshow","Undangan","2019-09-12","2019-09-16","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("19","39","Penyidik /jaksa penuntut umum /Hakim","R/39/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Wahyu Mahardika
","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("20","40","Penyidik/jaksa penuntut umum","R/40/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an haerulk amri
","Rahasia","2019-08-27","2019-09-16","","rehab","1");
INSERT INTO tbl_surat_keluar VALUES("21","41","penyidik /jaksa penuntut umum","R/41/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi TAT. an Akbar Rangkuti
","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("22","42","penyidik /jaksa penuntut umum","R/42/VIII/Ka/Rh.00.00/2019/BNNP NTB","Rekomendasi TAT an i made swasta parnawa
","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("23","43","penyidik /jaksa penuntut umum","R/43/Ka/VIII/Rh.00.00/2019/BNNP NTB","Permohonan TAT an Rianti","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("24","44","penyidik /jaksa penuntut umum","R/44/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Permohonan TAT an Muhmmad Rafi","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("25","45","penyidik /jaksa penuntut umum","R/45/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi TAT an Esti Yulandasari
","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("26","46","penyidik /jaksa penuntut umum","R/46/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Prmohonan TAT an sukardi
","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("27","47","penyidik /jaksa penuntut umum","R/47/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Permohonan TAT an Putu Trisna Nadi
","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("28","48","penyidik /jaksa penuntut umum","R/48/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Permohoan TAT an Hazan toupik","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("29","49","penyidik /jaksa penuntut umum","R/49/VIII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Silvi","Rahasia","2019-08-27","2019-09-16","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("30","278","haryadi","------","booking","Biasa","2019-09-13","2019-09-16","","booking","1");
INSERT INTO tbl_surat_keluar VALUES("31","292","booking","--------------------------","booking","Sprin","2019-09-13","2019-09-16","","sprin sumbawa","1");
INSERT INTO tbl_surat_keluar VALUES("32","279","HARYADI","-----","BOOKING ","Biasa","2019-09-13","2019-09-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("33","280","BRI KCP MATARAM","B/280/IX/Ka/Bu.02.02/2019/BNNP.NTB","Sosialisasi KKP
","Biasa","2019-09-13","2019-09-18","","BENDAHARA","1");
INSERT INTO tbl_surat_keluar VALUES("34","40","PPK /Bendahara pengeluaran BNN Kab Kota","B/UND/40/IX/Ka/Bu.02.02/2019/BNNP-NTB","Undangan sosialisasi","Undangan","2019-09-18","2019-09-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("35","293","Drs.Gede Sugianyar Dwi Putra, SH.Msi dll","Sprin/293/IX/Ka/Bu.02.01/2019/BNNP-NTB","kegiatan P4GN dengan pemerintah kab","Sprin","2019-09-13","2019-09-19","","Belum di  ttd (file di pak fajrul)","1");
INSERT INTO tbl_surat_keluar VALUES("36","294","Drs.H.Nurachmat","Sprin/294/IX/Ka/Bu.02.01/2019/BNNP NTB","PLH Ka BNNP NTB dari Tanggal 16 SD 20 Septembe 2019","Sprin","2019-09-13","2019-09-19","","Arsip","1");
INSERT INTO tbl_surat_keluar VALUES("37","295","Rizka Rachmat K.AMK, Muslim Sultriawan","Sprin/295/IX/Ka/Bu.02.05/2019/BNNP NTB","Melakukan peliputan KA BNNP NTB di kampus IPDN","Sprin","2019-09-13","2019-09-19","","Muslim","1");
INSERT INTO tbl_surat_keluar VALUES("38","281","BNN RI","B/IX/Ka/BU.02.01/2019/BNNP NTB","Permohonan cuti pak norachmat","Biasa","2019-09-19","2019-09-19","","Arsip","1");
INSERT INTO tbl_surat_keluar VALUES("39","41","PPK","B/41/IX/Ka/Bu.02.02/2019/BNNP NTB","Undangan sosialisasi","Undangan","2019-09-13","2019-09-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("45","282","Kanwil DJPB","B/282/Ka/IX/BU.00.00/2019/BNNP-NTB","Usulan revisi anggaran","Biasa","2019-09-20","2019-09-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("46","296","Asep Badarudin, S.Pd","Sprin/296/IX/Ka/CM.00.00/2019","Menjadi narasumber sosialisasi ","Sprin","2019-09-20","2019-09-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("47","297","Drs.Gede Sugianyar Dwi Putra, SH.Msi , Ratna Noerbani, A.Md","Sprin/297/IX/Ka/BU.00.00/2019/BNNP-NTB","Menghadiri acara undangan verifikasi dan perbaikan RKA/KL dalam rangka penyusunan pagu alokasi anggaran BNN Tahun  2020 di hotel Jakarta mangga dua square tanggal 23 s.d 27 september 2019","Sprin","2019-09-20","2019-09-20","","FILE DI MBA RATNA","1");
INSERT INTO tbl_surat_keluar VALUES("48","50","BAPAS Mataram","R/50/IX/Ka/CM.00.01/2019/BNNP-NTB","Laporan hasil tes urine","Rahasia","2019-09-20","2019-09-20","","buk kom","1");
INSERT INTO tbl_surat_keluar VALUES("49","283","Panitia GPAN Taman Ayu","B/283/IX/Ka/Cm.00.02/2019/BNNP-NTB","Permohonan Bantuan Dana ","Biasa","2019-09-20","2019-09-20","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("50","284","Ketua Kelompok usaha cloting bersama","B/284/IX/Ka/CM.00.01/2019/BNNP-NTB","Permohonan audiensi dan silahturahmin","Biasa","2019-09-20","2019-09-20","","buk kom","1");
INSERT INTO tbl_surat_keluar VALUES("51","79","Ratna noerbani, A.Md","SPPD/79/Ka/IX/Bu.00.00/2019/BNNP NTB","Menghadiri undangan verifikais dan perbaikan RKA/KL dalam rangka penyusunan pagu alokasi anggaran BNN Tahun 2020","SPPD","2019-09-20","2019-09-20","","BU RATNA ","1");
INSERT INTO tbl_surat_keluar VALUES("52","80","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPD/80/Ka/IX/BU.00.00/2019/BNNP- NTB","Menghadiri undangan verifikasi dan perbaikan RKA/KL dlm rangka penyusunan pagu anggaran BNN","SPPD","2019-09-20","2019-09-20","","BU RATNA ","1");
INSERT INTO tbl_surat_keluar VALUES("53","22","BNN RI","BA-22/IX/IX/REN/BNNP-NTB","Berita acara penyusunan anggaran","Berita Acara","2019-09-20","2019-09-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("54","298","YOEL AGUS WICAKSONO","Spirn/298/IX/Ka/BU.00.00/2019/BNNP NTB","Menghadiri undangan FGD","Sprin","2019-09-26","2019-09-27","","Yoel agus ","1");
INSERT INTO tbl_surat_keluar VALUES("55","299","Muhammad Subkhan , A.Md","Sprin/299/IX/Ka/BU.01.00/2019/bnnp-ntb","Menghadiri kegiatan penyusunan rencana kebutuhan BMN","Sprin","2019-09-26","2019-09-27","","SUBHKAN","1");
INSERT INTO tbl_surat_keluar VALUES("56","300","DAFTAR TERLAMPIR","Spin/300/IX/Ka/Rh.01.01/2019/BNNP NTB","Mengikuti kegiatan pertemuan pascarehabilitasi rawat lanjut","Sprin","2019-09-26","2019-09-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("57","42","Peserta kegiatan ","B/UND-42/Ka/IX/2019/BNNP-NTB","Undnagan peserta kegiatan pascarehabilitasi","Undangan","2019-09-26","2019-09-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("58","43","para ka bnnk /kota","B/43/IX/Ka/Bu.02.02/2019/bnnp-ntb","Undangan taklimat akhir","Undangan","2019-09-27","2019-09-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("59","285","BNNP BALI","B/285/IX/Ka/Bu.02.01/2019/BNNP NTB","Pelaksanaan banding BNNP NTB ","Biasa","2019-09-27","2019-09-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("60","286","mba sofy","--------","-","Biasa","2019-10-01","2019-10-01","","booking","1");
INSERT INTO tbl_surat_keluar VALUES("62","51","sestama BNN RI","R/51/IX/Ka/Bu.02.01/2019/BNNP - NTB","Usulan pemberhentian dan pengangkatan Dalam jabatan di lingkungan BNNP NTB","Rahasia","2019-09-30","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("63","52","DIKBUD KAB LOBAR","R/52/IX/Ka/CM.00.01/2019/BNNP-NTB","Laporan hasil tes urine","Rahasia","2019-10-01","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("64","53","DIKBUD LOBAR","R/53/IX/Ka/CM.00.01/2019/BNNP-NTB","Lapora hasil tes urnine","Rahasia","2019-09-30","2019-10-01","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("65","73","PEMPROV NTB","SPK/73/IX/KA/BU.02.04/2019/BNNP-NTB","Perjanjian kerja sama antara BNNP NTB dengan PEMPROV NTB","Berita Acara","2019-09-25","2019-10-01","","SANTI","1");
INSERT INTO tbl_surat_keluar VALUES("66","2941","Afipudin adnan","Sgas/294.1/IX/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai moderator pada kegiatan desiminasi informasi","Sprin","2019-09-13","2019-10-01","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("67","2952","Khairil anwar","Sgas/295.1/IX/Ka/CM.00.00/2019/BNNP NTB","Melaksanakan tugas sebagai narasumber","Sprin","2019-09-13","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("68","54","lalu ayuandi","R/54/IX/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi","Rahasia","2019-09-30","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("69","55","I ketut drama jaya","R/55/IX/Ka/Rh.00.00/2019/ BNNP-NTB","R ekomendasi rehabilitasi","Rahasia","2019-09-30","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("70","56","penyidik /jaksa penuntut umum","R/56/IX/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi","Rahasia","2019-09-30","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("71","57","penyidik /jaksa penuntut umum","R/57/IX/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Zakaria","Rahasia","2019-10-01","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("72","58","penyidik /jaksa penuntut umum","R/58/IX/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Riyan Jasak ","Rahasia","2019-10-01","2019-10-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("73","23","Tasripin, AKS MH","B/23/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA pendistrubusian barang mobil avanza","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("74","24","Syaripudin S , ST","BA/24/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang montor honda","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("75","25","Fajrul husni SI.","BA/25/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima montor honda vario dan laptop hp 240 G5","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("76","26","Muhammad subkhan","BA/26/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang laptop asus A455L","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("77","27","M afifudin","BA/27/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang sepeda montor honda mega pro DR 2835 J","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("78","28","Yoel agus wicaksono S. Psi","BA/28/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BAserah terima pengguna barang laptop hp 240 G5 dan print hp deskjety GT 5810","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("79","29","Ratna noerbani amd","BA/229/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop hp 240GS dan carge","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("80","30","  Soviarini agustina, SE.","BA/30/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang laptop asus","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("81","31","Muhammad haryadi, Md.","BA/31/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang hardis external","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("82","32","FX Charlie gustaf N","BA/32/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop sony vaino, carge, camera canon eos D60, camera conon eos 600D, camera vidio sony, lampu blitz kamera","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("83","33","yoel agus wicaksono, S Psi","BA/33/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang hardis external","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("84","34","Muhammad haryadi, A.Md.","BA/34/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang laptop merkm asus","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("85","35","FX Charlie gustaf N","BA/35/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop sony vaio, carge","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("86","36","DENNY PRIADI, S.Sos","BA/36/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang mobil sizuki dan mobil daihatsu","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("87","37","Saparwadi","BA/37/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang sepeda motor honda pro dr 2836 J","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("88","38","Drs.H. Nu rachmat., Apt.","BA/38/VIII/Ka/Bu.01.00/2019/BNNP-NTB"," BA pendistribusian barang mobil inova","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("89","39","Drs.H. Nu rachmat, Apt.","BA/39/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop asus warna hitam dan laptop lanuvo","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("90","40","Irpan, S. Sos","BA/40/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang perlengkapan barang.helm, STNK, jaket buku service ,dan buku panduan","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("91","41","L. tresna jaya S,Sos","BA/41/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang camera canon eos 70D","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("92","42","Anggraini Ninik M, SH.MH","BA/42/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop hp","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("93","43","Asep Badarudin, S.Pd","BA/43/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop toshiba","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("94","44","Rendi prmana, S, Kom","BA/44/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang laptop sony warna hitam, tas laptop dan carge","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("95","45","Anendi","BA/45/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang, loptop sony vaio warna putih, tas loptop, carge","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("96","46","dr.Yolly Dahlia.,SpKJ ","BA/46/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barangmotor honda mega pro 2012 DR 2837 dan mobil daihastu xenia","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("97","47","Rizka rahman kurniawan, Amd.Kep","BA/47/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop sony vaio warna putih ,tas laptop, carge","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("98","48","yeol agus wicaksono, S.Psi","BA/48/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang laptop sony warna putih ,tas laptop dan carge","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("99","49","Hurrni nugroho, SH. MH","BA/49/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusiaan barang, drug abuse test dan pot urine","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("100","50","Kamariah, S.Adm","BA/50/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang drug abuse test dan pot urine","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("101","51","H. Zaenal Muttaqin","BA/51/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA pendistribusian barang  speda motor honda karisma","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("102","52","Saripudin S.ST","BA/52/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang motor honda supra x","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("103","53","Syaripudin S.ST","BA/53/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima penggunaan barang mobil tayota kijang inova dan mobil suzuki apv","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("104","301","Anggraini Ninik M, SH.MH","Sprin /301/IX/Ka/CM.00.02/2019/BNNP-NTB","Menjadi Narasumber pada kegiatan sosialisasi P4GN , di Hotel Montana 
Tanggal  Senin 30 sep 20198","Sprin","2019-09-30","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("105","54","dr.Yolly Dahlia.,SpKJ ","BA/54/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA Jenis kendaraan Ambulnce","Berita Acara","2019-08-07","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("106","55","Syaripudin, SST","BA/55/X/Pnj/RH.00/2019/BNNP-NTB","BA SERAH TERIMA BARANG","Berita Acara","2019-10-02","2019-10-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("107","302","Daftar terlampir","Sprin /X/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai narasumber kegiatan sosialisasi MOU sekolah anti narkoba
hari senin 7 oktober 2019","Sprin","2019-10-03","2019-10-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("108","56","Syaripudin S.ST","BA/56/X/KA/BU.01.00/2019/BNNP-NTB","BA serah terima pengembalian barang Laptop Asus Warna Putih","Berita Acara","2019-10-03","2019-10-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("109","303","Ifan S,Sos","Sprin/303/X/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai narasumber kegiatn penyuluhan P4GN 
Hari jum at 4 Oktober 2019
di SMA N  1 Pemenang","Sprin","2019-10-03","2019-10-03","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("110","304","Daftar terlampir","Sprin/ 304/X/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai panitia kegiatan insert konten","Sprin","2019-10-03","2019-10-03","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("111","57","I Nengah Winarsa","B/57/IX/Ka/BU.02.01/2019/BNNP-NTB","Surat ijin cuti tahunan ","Berita Acara","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("112","286","Kasat Narkoba Res Mataram","B/286/X/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan Assesmen Penyalah guna narkoba","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("113","287","AKBP Hj.Mariam ","B/287/Ka/X/Ka/Rh.00.01/2019/BNNP-NTB","Pelaksanaan Assesment Penyalahguna Narkoba","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("114","288","Kasi TPUL Kejati NTB","B/288/Ka/Rh.00.01/2019/BNNP-NTB","Pelaksaan Assesment Penyalahguna Narkoba","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("115","289","Kasat Narkoba Polres Mataram","B/289/X/Ka/Rh.00.01/2019/BNNP-NTB","Hasil Verifikasi Berkas Permohonan TAT an Joko Supriadi","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("116","290","Kasat Narkoba Polres Lombok Utara","B/290/X/Ka/RH.00.00/2019/BNNP-NTB","Pelaksanaan Assesment Penyalah guna narkoba","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("117","291","Dir Narkoba POLDA NTB","B/291/X/Ka/Rh.00.01/2019/bnnp-ntb","Pelaksanaan Assesment ","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("118","305","Daftar terlampir","Sprin/305/Ka/X/Rh.00.00/2019/BNNP NTB","Melakukan assesemn medis TAT kepada 10 orang tersangka tanggal 7 Oktober 2019","Sprin","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("119","292","Daftar terlampir","B/UND292/X/Ka/Bu.02.01/2019/BNNP-NTB","Undangan kegiantan bantuan hukum non litigasi","Biasa","2019-10-01","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("120","293"," Kepala BNN Kota Mataram, Kepala BNN Kab.Sumbawa Barat, Kepala BNN Kab Sumbawa, dan Kepala BNN Kab. Bima","B/293/X/Ka/Rh.00.00/BNNP-NTB","permohonan data layanan rehabilitasi","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("121","294","Daftar terlampir","B/294/X/Ka/Rh.00.00/2019/BNNP-NTB","Permohoan data layanan rehabilitasi","Biasa","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("122","306","Adi setyo prabowo, S.S.PSi","Sprin/306/X/Ka/CM.00.02/2019/BNNP-NTB","Menjadi narasumber kegiatan P4GN 
Hari Sabtu 05 Oktober 2019
tempat SMPN 2 Mataram","Sprin","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("123","307","Sri Rohayati, Apt., MPH-ATOD","Sprin/307/X/Ka/RH.00.00/2019/BNNP-NTB","Menjadi peserta Rapat kerja evaluasi bidang rehabilitasi 
hari Rabu s d jumat 9 sd 11 oktober 2019
hotel bumi surabaya","Sprin","2019-10-04","2019-10-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("124","308","KAMARIAH S Adm L TRESNA JAYA ADI SETYO P","Sprin/308/X/Ka/Cm.01.01/2019/BNNP-NTB","Sebagai petugas kegiatan audiensi dengan stakeholder 
Hari Senin Selasa 7 sd 8 Oktober 2019
tempat Kab LOTIM","Sprin","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("125","295","Wartawan jurnalis ","B/295/X/BU.02.05/2019/BNNP-NTB","Undangan press release TV III Tahun 2019","Biasa","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("126","296","Kabag Kabid ","B/296/X/Ka/BU.02.05/2019/BNNP-NTB","Permintaan data press realese TW XIII","Biasa","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("127","297","POLDA NTB","B/297/X/Ka/BU.02.05/2019/BNNP-NTB","Laporan hasil pelaksanaan tugas personel POLDA NTB","Biasa","2019-10-07","2019-10-07","","HUMAS","1");
INSERT INTO tbl_surat_keluar VALUES("128","309","Doni Afriandi, A.Md","Sprin/309/X/Ka/PB.00/2019/BNNP-NTB","Melaksanakan tugas penyadapan (Tapping ) dari tanggal 8  sd 21 Oktober 2019 di Dirjen BNN RI JAKTIM","Sprin","2019-10-07","2019-10-07","","PAK DONI","1");
INSERT INTO tbl_surat_keluar VALUES("129","311","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/311/X/Ka/BU.02.01/2019/BNNP-NTB","Melaksanakan koordinasi dengan BNN PROV BALI berkaitan dengan sistem jaringan narkotika / pemberantasan dari 4 sd 5 Oktober 2019","Sprin","2019-10-04","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("130","81","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPD/ 81/ X/Ka/BU.02.01/2019/BNNP-NTB","Koordinasi ke BNNP BALI tanggal 4 sd 5 Oktober 2019","SPPD","2019-10-04","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("131","312","Daftar terlampir","Sprin/312/Ka/X/BU.02.01/2019/BNNP-NTB","Melaksanakan tugas kunjungan kerja ke BNNP BALI tanggal 9 sd 11 Oktober 2019","Sprin","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("132","82","TASRIPIN AKS.MH","SPPD/82/X/Ka/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("133","83","DENNY APRIADI.S.Sos","SPPD/83/X/KA/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("134","84","Drs.Nur Rahmat , Apt","SPPD/84/X/KA/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("135","85","dr.Yolly Dahlia.,SpKJ ","SPPD/85/X/KA/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("136","86","Fajrul husni SI.","SPPD/86/KA/X/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("137","87","LILY WAHYUNI, A.Md Farm","SPPD/87/KA/X/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("138","88","LALU TRESNA JAYA, S.Sos","SPPD/88/KA/X/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("139","89","FX.CHARLIE GUSTAF NURAK","SPPD/89/KA/X/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("140","90","MUSLIM SULTRYAWAN S.Psi","SPPD/90/KA/X/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("141","91","M.ABDUL GOFUR","SPPD/91/KA/X/BU.02.01/2019/BNNP-NTB","Studi banding ke BNNP BALI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("142","92","DONI AFRIADIN , A.Md","SPPD/92/KA/X/BU.02.01/2019/BNNP-NTB","Melaksanakan TAPPINH di BNN RI","SPPD","2019-10-07","2019-10-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("143","312","Daftar terlampir","SPRIN/312/X/Ka/RH.01.01/2019/BNNP-NTB","Kegiatan pertemuan pascarehabilitasi","Sprin","2019-10-07","2019-10-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("144","44","Peserta kegiatan pasca rehabilitasi","B/UND-44/X/Ka/RH.01.01/2019/BNNP-NTB","Undangan peserta kegiatan pascarehabilitasi","Undangan","2019-10-07","2019-10-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("145","310","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPRIN/310/X/Ka/BU.02.01/2019/BNNP-NTB","Pelatihan induction training di pusat pengembangan daya manusia (PPSDM) tanggal 7 sd 10 Oktober 2019","Sprin","2019-10-07","2019-10-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("146","314","Asep badarudin S.Pd","Sprin/311/X/Ka/CM.00/2019/BNNP-NTB","Menjadi narasumber 
hari tanggal Jumat 11 Oktober 2019
SMA 1 Tanjung","Sprin","2019-10-08","2019-10-08","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("147","298","PANITIA KEJURNAS DRAG BIKE PROV NTB","B/298/X/Ka/CM.00.02/2019/BNNPNTB","Dukungan Kegiatan sosialisasi","Biasa","2019-10-08","2019-10-08","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("148","59","Direktur Intelijen BNN RI","R/59/Ka/Pb.01/2019/BNNP-NTB","Permohonan Data Register, isi CDR dan SMS ","Rahasia","2019-10-09","2019-10-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("149","315","DAFTAR TERLAMPIR ","Sprin/315/X/Ka/Cm.00.02/2019/BNNP-NTB","Menghadiri Undangan Gerakan Peduli Anti Narkoba 
Rab 9 Oktober 2019
Bogor Taman Ayu Gerung","Sprin","2019-10-09","2019-10-10","","-","1");
INSERT INTO tbl_surat_keluar VALUES("150","92","KABID REHABILITASI","B/92/IX/Ka/Rh.00.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-09-13","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("151","93","KABAG UMUM","B/ND/93/IX/BU.01.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-09-13","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("152","94","kabag umum","B/ND/94/IX/BU.01.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-09-13","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("153","95","KABID P2M","B/ND/95/IX/KB/CM.01.00/2019/BNNP-NTB","PENCAIRAN DANA","Nota Dinas","2019-09-13","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("154","96","KABID BERANTAS","B/ND/96/X/Kb/PB.01/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-01","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("155","97","KABID REHABILITASI","B/ND/97/IX/KB/RH.01.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-02","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("156","98","KABID P2M","B/ND/98/X/Ka/CM.00.02/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-02","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("157","99","KABID REHABILITASI","B/ND/99/X/KB/RH.000.00/2019/BNN-NTB","Pencairan dana","Nota Dinas","2019-10-03","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("158","100","KABAG UMUM","B/ND/100/X/BU.02.05/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-07","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("159","101","Kabid berantas ","B/ND/101/X/KB/PB.00.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-07","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("160","102","KABAG UMUM","B/ND/102/X/Kb/BU.00.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-09","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("161","7","Syaripudin S.ST","BA/7/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang 
mobil toyota kijang inova DR 53
SUZUKI APV DR 1023 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("162","3","Irfan S.Sos","BA/3/VIII/Ka/bu.01.00/2019/BNNP-NTB","BA serah terima barang
Vario nopol DR 3451 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("163","4","Fajrul Husni SE","BA/4/VIII/Ka/Bu.01.00/2019/BNNP-NTB","BA serah terima barang
Laptop HP 240 G5
HONDA VARIO DR 3451J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("164","5","H.ZAENAL MUTTAQIN","BA/5/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
HONDA KARISMA DR 5311","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("165","6","Syaripudin S.ST","BA/6/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
honda supra x 2002","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("166","2","M.Affifudin ","BA/2/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Motor HONDA MEGA PRO DR 2835 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("167","8","dr yolly dahlia SP.KJ","BA/8/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
HONDA MEGA PRO DR 2837
DAIHATSU SENIA DR 1350 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("168","9","DENNY PRIADI, S.Sos","BA/9/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
suzuki apv luxury DR 1089 J
Daihatsu senia DR 1349 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("169","10","Drs.Nur Rahmat , Apt","BA/10/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
INOVA DR 1452 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("170","11","Tasripin Aks MH","BA/11/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Mobil avanza Velos DR 1457 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("171","12","Fajrul husni SE","BA/12/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Laptop HP 240 G5
Honda vario 2019 DR 3451 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("172","13","Syaripudin S.ST","BA/13/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Motor honda supra X Tahun 2002 DR 6126","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("173","14","Irfan, S.Sos","BA/14/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
motor HONDA VARIO NOPOL DR 3451 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("174","15","Saparwadi","BA/15/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
HONDA MEGA PRO DR 2836 J","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("175","16","dr.Yolly Dahlia.,SpKJ ","BA/16/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Ambulance ","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("176","17","L.Tresna jaya S.Sos","BA/17/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
camera cannon eos 70 D","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("177","18","Muhammad haryadi, A.Md.","BA/18/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Hardis external","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("178","19","Yoel agus w S.Psi","BA/19/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Hardis external","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("179","20","FX Charlie gustaf N","BA/20/VIII/Ka/BU.01.00/2019/BNNP-NTB","BA serah terima barang
Laptop sony vaio
carge
camera cannon eos D60
Camera canon EOS 600D
Camera Video SONY 
Lampu Blitz Camera","Berita Acara","2019-08-07","2019-10-14","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("180","316","RUDI HASIBUAN","Sprin/316/X/Ka/RH.01.01/2019/BNNP-NTB","Melakukan pendampingan home visit ","Sprin","2019-10-11","2019-10-14","","Rudi","1");
INSERT INTO tbl_surat_keluar VALUES("181","317","Muslim sultriawan S.Psi","Sprin/317/X/Ka/Rh.01.01/2019/BNNP-NTB","Melakukan home visit pada kegitan pendampingan dan rawat lanjut pascarehabilitasi","Sprin","2019-10-11","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("182","318","BOOKING BUK KOM","----","-","Sprin","2019-10-11","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("183","319","BUK KOM (BOOKING)","--","-","Sprin","2019-10-11","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("184","320","BUK KOM (BOOKING)","---","-","Sprin","2019-10-11","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("185","321","Adi Setyo Prabowo S.S Psi","sprin/321/x/ka/cm.01.00/2019/BNNP-NTB","Menjadi narasumber kegiatan rapat koordinasi pendeteksian dini narkoba 
selasa, 15 oktober 2019","Sprin","2019-10-14","2019-10-14","","Jaya","1");
INSERT INTO tbl_surat_keluar VALUES("186","322","L.Tresna jaya S.Sos Asep Badaruddin Spd","sprin/322/X/Ka /cm.01.00/2019/BNNP-NTB","Tugas sebagai peserta kegiatan rapat koordinasi pendeksian Dini Narkoba 
selasa 15 Oktober 2019","Sprin","2019-10-14","2019-10-14","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("187","323","BUK KOM (BOOKING)","sprin/323","-","Sprin","2019-10-14","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("188","324","BUK KOM (BOOKING)","sprin/324","-","Sprin","2019-10-14","2019-10-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("189","60","pak baiqhaqi","R/60","-","Rahasia","2019-10-11","2019-10-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("190","61","BOOKING PAK BAIQHAQI","R/61","-","Rahasia","2019-10-11","2019-10-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("191","93","Adi Setyo P","SPPD/93/X/KA/BU.02.01/2019/BNNP-NTB","Audiensi dengan stakeholder dalam rangka harmonisasi program pemberdayaan alternatif ","SPPD","2019-10-07","2019-10-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("192","94","L Tresna jaya S.Sos","SPPD/94/X/KA/BU.02.01/2019/BNNP-NTB","Audiensi dengan stakeholder dalam rangka harmonisasi program pemberdayaan alternatif ","SPPD","2019-10-07","2019-10-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("193","299","KA BNN KOTA/KAB ","B/299/X/Ka/CM.01.00/2019/BNNP-NTB","RAKERNIS BNNP  dan BNNK ","Biasa","2019-10-15","2019-10-15","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("194","325","Sri Rohayati, Apt., MPH-ATOD ","Sprin/325/X/Ka/RH.00.00/2019/BNNP-NTB","Sebagai peserta aktif di kegiatan  Rapat koordinasi di LOBAR 
tanggal 16 Oktober 2019","Sprin","2019-10-15","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("195","326","Budi Endarto, S.Kep  L.Muh Desrial Fahroza ","Sprin/326/X/Ka/CM.00.00/2019/BNNP-NTB","Melaksanakan kegiatan SIL di wilayah Lombok Tengah 
selasa, 15 Otober 2019","Sprin","2019-10-15","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("196","327","Sri Rohayati, Apt.MPH-ATOD","Sprin/327/X/Ka/RH.00.00/2019/BNNP-NTB","BIMTEK Bagi Lembaga  Instansi Pemerintah di RSJ MUTIARA SUKMA 
Tanggal 21 Oktober 2019","Sprin","2019-10-15","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("197","328","Anang Thoha Mislahhudin, SH","Sprin/328/X/Ka/Cm.00.02/2019/BNNP-NTB","Menjadi narasumber kegiatan sosialisasi pembinaan kesadaran bela negara di Aula PBG LOBAR 
Tanggal 15 Oktober 2019","Sprin","2019-10-15","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("198","300","Daftar terlampir","B/300/X/Ka/Rh.00.00/2019/BNNP-NTB","Dorongan agar sekolah mendukung proses pemulihan Rehabilitasi adiksi","Biasa","2019-10-15","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("199","58","Budi Endarto,S Kep","B/58/x/Ka/Bu.00.01/2019/BNNP-NTB","Serah terima barang Printer Epson Stylus L3110","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("200","59","Budi Endarto,S.Kep","B/59/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Koputer Asus ","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("201","60","Kamariah, S.Adm","B/60/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang komputer Asus","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("202","61","FX Charlie gustaf N","B/61/X/Ba/Bu.01.00/2019/BNNP-NTB","Camera Sony Alpa
Memory card
Lampu flas sony
Tripot camera
Lensa sigma
Micro D (Rode)","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("203","62","Syaripudin S.ST","B/62/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Jet pump bosch Easy ATQ","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("204","63","Syaripudin S.ST","B/63/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang AC 2 PK Panasonic","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("205","64","Tasripin Aks MH","B/64/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Laptop Asus","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("206","65","Tasripin Aks MH","B/65/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang P rinter Epson Stylus","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("207","66","FX Charlie gustaf N","B/66/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Rode Microhone Vdieomic","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("208","67","FX Charlie gustaf N","B/67/X/Ka/Bu/.01.00/2019/BNNP-NTB","Serah terima barang Blits sony ","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("209","68","FX Charlie gustaf N","B/68/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang camera DX 16 Profesional Vidio Tripod","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("210","69","FX Charlie gustaf N","B/69/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Lansa sigma ","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("211","70","FX Charlie gustaf N","B/70/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Camera sony Alpha","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("212","71","FX Charlie gustaf N","B/71/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Lapto9 Dell Inspiron","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("213","72","FX Charlie gustaf N","B/72/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang AC 1/2 PK MIBEA","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("214","73","FX Charlie gustaf N","B/73/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Kamera Sony Alpha , Mirrorless Digital kamera Lensa Sigma, profesiopnal vidio tripod , blits sony . external flash Rode  Microphone vidiomic micro mic DSLR/mirrorlis","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("215","74","Lily Wahyuni,A.Md, Farm","B/74/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Laptop Asus","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("216","75","Lily Wahyuni,A.Md, Farm","B/75/X/Ka/Ba.01.00/2019/BNNP-NTB","Serah terima surat AC 1/2 PK MIDEA","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("217","76","Sri Rohayati, Apt., MPH-ATOD ","B/76/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Printer Epson Stylus","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("218","77","Pilzatun Zahrini","B/77/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang penghancur kertas kozure paper shredder","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("219","78","Ahmady S,ST","B/78/X/Ka/Bu.01.00/2019/BNNP-NTB","Serah terima barang Alat tes narkoba/test kit dan pot urine","Berita Acara","2019-10-03","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("220","329","Syaripudin S.ST","Sprin/329/X/Ka/Ka/BU.01.00/2019/BNNP-NTB","melaksanakan monev perencanaan dan aset ke BNNK Bima tanggal 
Tanggal 17 sd 18 Oktober 2019","Sprin","2019-10-15","2019-10-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("221","330","Daftar terlampir","Sprin/330/X/Ka/Pb.00/2019/BNNP-NTB","Melaksanakan penyelidikan di Wilayah Kec surabaya tanggal 14 Oktober sd 19 Oktober 2019","Sprin","2019-10-15","2019-10-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("222","301","Anggraini Ninik M, SH.MH","B/301/X/Ka/BU.02.01/2019/BNNP-NTB","Surat ijin cuti tahunan ","Biasa","2019-10-15","2019-10-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("223","62","Direktur Intelijen BNN RI","R/62/X/Ka/PB.01/2019/BNNP-NTB","Permohonan Data register Isi CDR dan SMS","Rahasia","2019-10-17","2019-10-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("224","95","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/95/X/KA/BU.02.01/2019/BNNP-NTB","Mengikuti pelatihan induction training di PPSDM Lido Bogor","SPPD","2019-10-07","2019-10-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("225","304","GUBERNUR NTB","B/304/X/Ka/BU.02.01/2019/BNNP-NTB","Penghadapan PNS pemprov NTB di pekerjakan pada BNNP NTB","Biasa","2019-10-17","2019-10-18","2187-PENGHADAPAN PNS PEMPROV.jpg","-","1");
INSERT INTO tbl_surat_keluar VALUES("226","305","KA PUSLIDATIN","B/305/X/Ka/BU.01.00/2019/BNNP-NTB","Permohonan ADK alat video telecomference","Biasa","2019-10-17","2019-10-18","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("227","306","Para Kabag/Kabid di lingkungan BNNP NTB","B/306/X/Ka/BU.01.00/2019/BNNP-NTB","Pendistribusian BBM operasional","Biasa","2019-10-17","2019-10-18","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("228","307","DJKN ","B/307/X/Ka/BU.01.00/2019/BNNP-NTB","Permohonan Penetapan Status Penggunaan BMN pada BNNP NTB","Biasa","2019-10-17","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("229","308","KAPOLDA","S/308/X/Ka/BU.01.00/2019/BNNP-NTB","Permohonan Perpanjangan pemegang ijin senjata api organik BNN","Biasa","2019-10-17","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("230","309","Kabag Umum BNNP-NTB","B/309/X/Ka/BU.01.00/2019/BNNP-NTB","Tindak lanjut hasil audit ittama BNN TA 2019","Biasa","2019-10-17","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("231","310","Kepala sub Bag Sarpras BNNP NTB","B/310/X/Ka/BU.01.00/2019/BNNP-NTB","Tindak lanjut hasil audit ittama BNN TA 2018","Biasa","2019-10-17","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("232","311","Kepala Desa Gili Indah","B/311/Ka/RH.00.00/2019/BNNP-NTB","Pemberitahuan melaksanakan BIMTEK lembaga rehabilitasi instansi pemerintah","Biasa","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("233","45","Daftar terlampir","B-UND/44/X/Ka/RH.00.00/2019/BNNP-NTB","Monev lembaga rehabilitasi komponen masyarakat (LRKM)","Undangan","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("234","331","BUK KOM (BOOKING)","Sprin/331","-","Sprin","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("235","332","Daftar terlampir","Sprin/332/X/Ka/BU.00.00/2019/BNNP-NTB","Melakukan monitoring dan evaluasi pelaporan keuangan dan pelaporan BMN","Sprin","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("236","96","Muhammad subkhan","SPPD/96/X/KA/BU.02.01/2019/BNNP-NTB","Melakukan monitoring dan evaluasi pelaporan keuangan dan pelaporan BMN ","SPPD","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("237","97","Ratna noerbani Amd","SPPD/97/X/KA/BU.02.01/2019/BNNP-NTB","Melakukan monitoring dan evaluasi pelaporan keuangan dan pelaporan BMN ","SPPD","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("238","98","Soviarini agustina","SPPD/98/X/KA/BU.02.01/2019/BNNP-NTB","Melakukan monitoring dan evaluasi pelaporan keuangan dan pelaporan BMN ","SPPD","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("239","99","Muhammad haryadi, Md.","SPPD/99/X/KA/BU.02.01/2019/BNNP-NTB","Melakukan monitoring dan evaluasi pelaporan keuangan dan pelaporan BMN ","SPPD","2019-10-18","2019-10-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("240","312","Komandan Batalion Korem 162/WB","B/312/X/KA/bu.01.00/2019/BNNP-NTB","Permohonan ijin penggunaan lapangan tembak","Biasa","2019-10-21","2019-10-21","","santi","1");
INSERT INTO tbl_surat_keluar VALUES("241","313","SESTAMA BNN","B/313/X/Ka/BU.02.01/2019/BNN-NTB","Penunjukan pelaksana Tugas (PLT) Kepala Bidang Reahabilitasi BNNP NTB","Biasa","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("242","333","Irfan, S.Sos","Sprin/X/Ka/BU.02.01/2019/BNNP-NTB","Melaksanakan PLH kepala Bidang P2M ","Sprin","2019-10-14","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("243","46","Kepala desa masbagil","B/46/X/Ka/CM.01.01/2019/BNNP-NTB","Undangan BIMTEK Lifeskil bagi masyarakat kawasan rawan narkoba","Undangan","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("244","314","Kep Loka Kerja Kab lotim","B/314/X/Ka/CM.01.01/2019/BNNP-NTB","Instruktur bimtek lifeskil bagi masyarakat kawasan rawan narkoba ","Biasa","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("245","334","APIPUDIN LUTFI, SKM","Sprin/334/X/Ka/CM.01.01/2019/BNNP-NTB","Sebagai panitia loka pada pelatihan lifeskil di Kebun Lauk LOTIM
Tanngal 23 sd 25 Oktober 2019","Sprin","2019-10-21","2019-10-21","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("246","335","Daftar terlampir","Sprin/335/X/Ka/CM.01.01/2019/BNNP-NTB","Sebagai panitia kegiatan pelatihan lifeskil di Kebon lauk desa masbagik
tanggal 23 sd 25 Oktober 2019","Sprin","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("247","336","DONI AFRIADIN , A.Md","Sprin/336/X/Ka/PB.00.00/2019/BNNP-NTB","Melaksanakan tugas penyadap (Tapping_) dari tanggal 22 Oktober 2019 sd 4 November 2019","Sprin","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("248","63","penyidik /jaksa penuntut umum","R/63/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Yudi Gusman","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("249","64","penyidik /jaksa penuntut umum","R/64/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Muhammad Aziz","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("250","65","penyidik /jaksa penuntut umum","R/65/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Muksin Ardani","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("251","66","penyidik /jaksa penuntut umum","R/66/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an I komang Raka","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("252","67","penyidik /jaksa penuntut umum","R/67/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Afandi Zikri","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("253","68","penyidik /jaksa penuntut umum","R/68/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Danu Sibaway","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("254","69","penyidik /jaksa penuntut umum","R/69/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Ela septia","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("255","70","penyidik /jaksa penuntut umum","R/70/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Indah Nur Islam","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("256","71","penyidik /jaksa penuntut umum","R/71/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an Siska Ira Dewi","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("257","47","BU KOM"," UND","LIFESKIL 23 25","Undangan","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("258","72","penyidik /jaksa penuntut umum","R/72/X/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi Rehabilitasi an M.Syarifudin","Rahasia","2019-10-21","2019-10-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("259","337","Drs.Gede Sugianyar Dwi Putra, SH.Msi. M.abdul Gafur","Sprin/337/X/Ka/BU.02.01/2019/BNNP-NTB","Mengikuti rakor rencana aksi daerah dan tim terpadu di jakarta 
tanggal 23 sd 25 Oktober 2019","Sprin","2019-10-22","2019-10-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("260","338","Drs.Gede Sugianyar Dwi Putra, SH.Msi. M Abdul gofur","Sprin/338/X/Ka/BU.02.01/2019/BNNP-NTB","sebagai mentor seminar proyek perubahan di pusdikmin bandung selama 2 hari 
dari tanggal 28 sd 29 Oktober 2019","Sprin","2019-10-22","2019-10-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("261","100","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/100/X/KA/BU.02.01/2019/BNNP-NTB","Menghadiri undangan rapat koordinasi daerah tim, terpadu P4GN di hotel Aryaduta ","SPPD","2019-10-22","2019-10-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("262","101","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/101/X/KA/BU.02.01/2019/BNNP-NTB","Mentor seminar proyek perubahan di pusdikmin Bandung ","SPPD","2019-10-22","2019-10-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("263","315","BNN RI","B/315/X/Ka/BU.01.00/2019/BNNP-NNTB","Tindak lanjut hasil audit ittama BNN TA 2018","Biasa","2019-10-23","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("264","339","Sri Rohayati, Apt., MPH-ATOD, I nengah Winarse","Sprin/339/X/Ka/Rh.00.00/2019/BNNP-NTB","BIMTEK Bagi lembaga instansi pemerintah di KLU","Sprin","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("265","340","Daftar terlampir","Sprin/340/X/Ka/RH.00.00/2019/BNNP-NTB","Melakukan Assesmen Medis dan Hukum TAT kepada 12 orang,  tersangka","Sprin","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("266","315","Deputi Rehabilitasi","B/315/X/Ka/RH.00.00/2019/BNNP-NTB","Data rehabilitasi komponen masyarakat","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("267","316","POLDA NTB","B/316/X/Ka/RH.00.01/2019/BNNP-NTB","Hasil verifikasi berkas permohonan assesment terpadu an sapoan jayadi","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("268","317","POLDA NTB","B/317/X/Ka/RH.00.01/2019/BNNP-NTB","Hasil verifikasi berkas permohonan assesment terpadu an Putu Darmayasa","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("269","318","POLRES MATARAM","B/318/X/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment narkoba","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("270","319","Dokter umum RSJ MUTIRA SUKMA","B/319/X/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment narkoba","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("271","320","Kabag Bin Opsnal Dir Narkoba POLDA NTB","B/320/X/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment narkoba","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("272","321","Kasi narkotika Kejati NTB","B/321/X/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment narkoba","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("273","322","POLDA NTB","B/322/X/KA/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment narkoba","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("274","323","KEPALA BIN DAERAH NTB","B/323/X/Ka/CM.00.00/2019/BNNP-NTB","Konten sms center","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("275","324","SESTAMA","B/324/X/Ka/BU.02.01/2019/BNNP-NTB","Usulan untuk mendapatkan kartu pegawai (KARPEG)","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("276","325","SESTAMA BNN","B/325/X/KA/BU.02.01/2019/BNNP-NTB","Usulan untuk mendapatkan kartu suami/ kartu istirahat","Biasa","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("277","102","zaenal mutaqin","SPPD/102/X/KA/BU.02.01/2019/BNNP-NTB","Melaksanakan monev ke BNNK BIMA","SPPD","2019-10-17","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("278","103","Syaripudin S.ST","SPPD/103/X/KA/BU.02.01/2019/BNNP-NTB","Melaksanakan monev ke BNNK BIMA","SPPD","2019-10-17","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("279","326","Lily Wahyuni,A.Md, Farm","BA/326/X/Ka/BU.01.00/2019/BNNP-NTB","BA SERAH TERIMA BARANG Mobil daihatsu Xenia DR 1350 j","Biasa","2019-10-21","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("280","341","dr heny anggraeny lenap ","Sprin/341/X/Ka/RH.00/2019/BNNP-NTB","Undangan dari dinas sosial tentang rapat koordinasi 
kamis 24 oktober 2019","Sprin","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("281","342","TASRIPIN","Sprin/342/X/Ka/BU.02.01/2019/BNNP-NTB","Tugas sebagai PLH kepala BNNP NTB selama 5 hari dari tanggal 23 sd 29 oktober 2019","Sprin","2019-10-22","2019-10-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("282","327","KETUA AKSI NTB","B/327/X/KA/RH.00.00/2019/BNNP-NTB","Pemberitahuan penilaian mutu layanan lembaga rehabilitasi komponen masyarakat ","Biasa","2019-10-24","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("283","328","BNNK MATARAM","B/328/X/KA/RH.00.00/2019/BNNP-NTB","Pemberithauan penilaian mutu layanan rehabilitasi komponen masyarakat","Biasa","2019-10-24","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("284","343","Sri Rohayati, Apt., MPH-ATOD ","Sprin/343/X/Ka/RH.00.00/2019/BNNP-NTB","Mengikuti kegiatan rapat koordinasi regional di puri indah mataram tanggal 30 sd 31 oktober 2019","Sprin","2019-10-23","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("285","79","DENNY PRIADI, S.Sos","BA/79/X/Ka/BU.01.00/2019/BNNP-NTB","BAST ","Berita Acara","2019-10-24","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("286","344","Ayu wardani , M.Psi. Psikolog","Sprin/344/X/Ka/RH.00.00/2019/BNNP-NTB","Mengikuti kegiatan supervisi layanan rehabilitasi di fasilitasi milik BNN ","Sprin","2019-10-24","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("287","345","Budi endarto, l muh desrial fahroza","Sprin/345/X/Ka/RH.00.00/2019/BNNP-NTB","Melakukan kegiatan SIL di KLU","Sprin","2019-10-24","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("288","104","Sri Rohayati, Apt., MPH-ATOD ","SPPD/104/X/KA/BU.02.01/2019/BNNP-NTB","BIMTEK Lembaga rehabilitasi komponen masyarakat","SPPD","2019-10-23","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("289","105","I Nengah winarse ","SPPD/105/X/KA/BU.02.01/2019/BNNP-NTB","BIMTEK lembaga rehabilitasi komponen masyarakat","SPPD","2019-10-23","2019-10-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("290","346","Irfan, S.Sos","Sprin/346/X/Ka/Cm.00.00/2019/BNN-NTB","Tugas sebagai narasumber pada kegiatan penyuluhan bahaya peyalahgunaan narkoba
hari jumat 25 oktober 2019
di gedung serbaguna ","Sprin","2019-10-24","2019-10-24","","irfan ","1");
INSERT INTO tbl_surat_keluar VALUES("291","347","dr Henny Anggraeni Lenap","Sprin/347/X/Ka/RH.00.00/2019/BNNP-NTB","Menghadiri KPA prov NTB 
senin 28 oktober 2019","Sprin","2019-10-25","2019-10-25","","-","1");
INSERT INTO tbl_surat_keluar VALUES("292","348","haryadi","-------------------","booking","Sprin","2019-10-25","2019-10-25","","-","1");
INSERT INTO tbl_surat_keluar VALUES("293","329","KANWIL DJPB PROVINSI","B/329/X/KU/BU.02.01/2019/BNNP-NTB","Surat Laporan keuangan triwulan III tingkat wilayah TA 2019 BNN Provinsi ","Biasa","2019-10-25","2019-10-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("294","349","Daftar terlampir","Sprin/349/X/Ka/CM.01.00/2019/BNNP-NTB","Tugas sebagai panitia kegiatan tes urine","Sprin","2019-10-25","2019-10-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("295","330","dr Henny Anggraeni Lenap","SR/330/X/Ka/BU.02.01/2019/BNNP-NTB","Surat rekomendasi ","Biasa","2019-10-28","2019-10-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("296","331","dr Savitri yuanita","SR/331/X/Ka/BU.02.01/2019/BNNP-NTB","Surat rekomendasi","Biasa","2019-10-28","2019-10-28","","Arsip","1");
INSERT INTO tbl_surat_keluar VALUES("297","350","Drs.Nur Rahmat , Apt","Sprin/350/X/Ka/CM.00.02/2019/BNNP-NTB","Menjadi narasumber 
hari tanggal selasa 29 oktober 2019","Sprin","2019-10-28","2019-10-29","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("298","351","Drs.Nur Rahmat , Apt","Sprin/351/X/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narasumber kegiatan insert konten
Rabu 30 Oktober 2019","Sprin","2019-10-28","2019-10-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("299","352","Daftar terlampir","Sprin/352/X/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai panitia kegiatan insert konten 
Rabu 30 Oktober 2019","Sprin","2019-10-28","2019-10-29","","P2M","1");
INSERT INTO tbl_surat_keluar VALUES("300","353","Irfan S.sos ","Sprin/353/X/Ka/2019/CM.00.00/2019/BNNP-NTB","Melaksanakan tugas sebagai peserta diskusi FGD Kelompok terpadu
Rabu 30 Oktober 2019","Sprin","2019-10-29","2019-10-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("301","332","SESTAMA","B/332/X/Ka/BU.02.01/2019/BNNP-NTB","Rekomendasi jabatan fungsional kesehatan","Biasa","2019-10-30","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("302","354","Daftar terlampir","Sprin/354/X/Ka/CM.00.00/2019/BNNP-NTB","Sebagai petugas kegiatan tes urine yang akan  di laksanakan 
jumat 1 november 2019 di IPDN","Sprin","2019-10-29","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("303","333","Daftar terlampir","B/333/X/Ka/RH.00.00/2019","Pembuatan laporan layanan LRIP dan LRKM","Biasa","2019-10-29","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("304","334","SESTAMA BNN","B/334/X/Ka/BU.02.01/2019/BNNP-NTB","Permohonan evaluasi pemberitahuan dari dan dalam jabatan ","Biasa","2019-10-29","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("305","106","Fabio testi armawan tidore","SPPD/106/X/Ka/PB.00/2019/BNNP-NTB","Tugas penyadapan tapping ke jakarta timur","SPPD","2019-10-30","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("306","73","Kepala Kanwil Kemenkumham","R/73/X/Ka/CM.00.00/2019/BNNP-NTB","Laporan hasil tes urine","Rahasia","2019-10-30","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("307","74","Kepala Lapas Kelas IIB Lombok Tengah ","R/75/X/CM.00.000/2019/BNNP-NTB","Laporan tes urine","Rahasia","2019-10-30","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("308","75","Direktur IPDN Kampus NTB","R/75/X/Ka/CM.00.01/2019/BNNP-NTB","Laporan hasil tes urine","Rahasia","2019-10-30","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("309","76","Lapas perempuan Kls III Mataram","R/76/X/Ka/CM.01.00/2019/BNNP-NTB","Laporan Hasil Tes urine","Rahasia","2019-10-30","2019-10-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("310","335","KPPN MATARAM","B/335/X/BU.02.01/2019/BNNP-NTB","Permohonan konsfirmasi setoran penerimaan negara","Biasa","2019-10-30","2019-10-31","","sofy","1");
INSERT INTO tbl_surat_keluar VALUES("311","47","dr.Yolly Dahlia.,SpKJ ","B/UND-47/X/Rh.01.00/2019/BNNP-NTB","Undangan sebagai fasilitator ","Undangan","2019-10-30","2019-10-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("312","48","Harmoko, M.Pd., Kons","B/UND-48/XI/RH.01.00/2019/BNNP.NTB","Undangan sebagai fasilitator","Undangan","2019-10-31","2019-10-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("313","49","Peserta kegiatan pascarehabilitasi","B/UND-49/X/Ka/RH.01.01/2019/BNNP-NTB","Undangan peserta kegiatan pascarehabilitasi","Undangan","2019-10-31","2019-10-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("314","355","Daftar terlampir","Sprin/355/X/Ka/RH.01.01/2019/BNNP-NTB","Mengikuti kegiatan pertemuan pascarehabilitasi 
jumat 1 november 2019","Sprin","2019-10-31","2019-10-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("315","356","buk yuli","----------","sprin narasumber ","Sprin","2019-10-31","2019-10-31","","BOOKING","1");
INSERT INTO tbl_surat_keluar VALUES("316","336","Daftar terlampir","B/336/X/Ka/BU.02.02/2019/BNNP-NTB","Wajib LHKPN Yang belum melaporkan ke komisi pemberantasan korupsi","Biasa","2019-10-31","2019-11-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("317","357","Anggraini Ninik M, SH.MH  Anang Thoha Mislahudin, SH","Sprin/357/X/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai narasumber di aula kantor desa telagawaru
tanggal 31 Oktober 2019","Sprin","2019-10-31","2019-11-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("318","358","FX Charlie gustaf N","Sprin/358/X/Ka/BU.02.05/2019/BNNP-NTB","Melaksanakan tugas sebagai peserta aktif dalam BIMTEK penulisan kreatif ","Sprin","2019-10-31","2019-11-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("319","359","Daftar terlampir","Sprin/359/XI/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai pelaksana kegiatan pojok informasi pada carfreeday
tanggal 3 10 17 24 November 2019","Sprin","2019-11-01","2019-11-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("320","360","Daftar terlampir","Sprin/360/X/Ka/CM.00.00/2019/BNNP-NTB","Petugas sosialisasi mobil keliling di wilayah kota mataram","Sprin","2019-11-01","2019-11-01","","-","1");
INSERT INTO tbl_surat_keluar VALUES("321","361","Harmoko , M.Pd., Kons","Sprin/361/XI/Ka/RH.01.00/2019/BNNP-NTB","Menjadi fasilitator pertemuan layanan pascarehabilitasi di kantor BNNP NTB","Sprin","2019-11-01","2019-11-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("322","362","dr.Yolly Dahlia.,SpKJ ","Sprin/362/XI/Ka/RH.01.00/2019/BNNP-NTB","Menjadi fasilitator pertemuan layanan pascarehabilitasi reguler di kantor BNNP NTB","Sprin","2019-11-01","2019-11-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("323","363","Lily Wahyuni,A.Md, Farm","Sprin/363/XI/Ka/RH.01.00/2019/BNNP-NTB","Menjadi fasilitator kegiatan layanan pascarehabilitasi reguler di Kantor BNNP NTB","Sprin","2019-11-01","2019-11-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("324","337","Yoel Agus W","B/337/XI/KA/BU.02.01/2019/BNNP-NTB","SURAT CUTI ","Biasa","2019-11-04","2019-11-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("325","364","Daftar terlampir","Sprin/364/XI/KA/BU.02.03/2019/BNNP-NTB","menjadi panitia kegiatan sosialisasi pembinaan pengawasan TA 2019","Sprin","2019-11-04","2019-11-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("326","365","Sri Rohayati, Apt., MPH-ATOD ","Sprin/365/XI/Ka/RH.00.00/2019/BNNP-NTB","Pertemuan pembahsan tindak lanjut dorongan agar sekolah mendukung proses pemulihan rehabilitasi
tanggal 5 November 2019","Sprin","2019-11-05","2019-11-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("327","338","Kepala BPMPD PROV NTB","B/338/XI/Ka/Rh.00.00/2019/BNNP-NTB","Dorongan untuk penganggaran dan pelaksanaan kegiatan P4GN di desa gili indah","Biasa","2019-11-05","2019-11-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("328","339","DINKES ","B/339/XI/Ka/RH.00.00/2019/BNNP-NTB","Sosialisasi promosi kesehatan dan pencegahan terkait napza","Biasa","2019-11-05","2019-11-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("329","50","Daftar terlampir ","B/UND-50/XI/Ka/BU.02.01/2019/BNNP-NTB","Pembinaan pengawasan TA 2019","Undangan","2019-11-05","2019-11-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("330","366","Budi Endarto.S.Kep","Sprin/366/XI/Ka/RH.00.00/2019/BNNP-NTB","Melaksanakan SIL ","Sprin","2019-11-05","2019-11-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("331","340","KAPOLDA NTB","B/340/XI/Ka/RH.00.01/2019/BNNP-NTB","Hasil verifikasi permohonan assesment terpadu","Biasa","2019-11-06","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("332","51","Peserta kegiatan pascarehabilitasi","B/UND/50/XI/Ka/RH.01.01/2019/BNNP-NTB","Undangan peserta kegiatan pascarehabilitasi","Undangan","2019-11-05","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("333","368","Daftar terlampir","Sgas/368/XI/Ka/RH.01.01/2019/BNNP-NTB","Kegiatan pertemuan layanan pascarehabilitasi 
jumat 8 november 2019","Sprin","2019-11-05","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("334","369","Rudi hasibuan ","SPrin/369/XI/Ka/Rh.01.01/2019/BNNP-NTB","Melakukan pendampingan pada kegiatan home visit","Sprin","2019-11-05","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("335","370","Muslim sultriawan","Sprin/370/XI/Ka/RH.01.01/2019/BNNP-NTB","Melaksanakan tugas kunjungan ke rumah klien ","Sprin","2019-11-05","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("336","367","DONI AFRIADIN , A.Md","Sprin/367/XI/Ka/PB.00/2019/BNNP-NTB","Melaksanakan tugas tapping tanggal 5 sd 18 November 2019","Sprin","2019-11-05","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("337","103","Kabag Umum ","B/ND/103/X/Ka/BU.01.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-09","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("338","104","KABID BERANTAS","B/ND/104/X/Ka/PB.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-15","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("339","105","KABID BERANTAS ","B/ND/105/X/PB.00/2019","Pencairan dana","Nota Dinas","2019-10-16","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("340","106","KABAG UMUM","B/ND/106/X/KA/BU.01.00/2019/BNNP-NTB","Pencairan dana ","Nota Dinas","2019-10-17","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("341","107","KABAG UMUM ","B/107/X/Ka/BU.02/01/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-21","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("342","108","KABID BERANTAS","B/ND/108/X/Ka/PB.00/2019/BNNP-NTB","Pencairan dana","Nota Dinas","2019-10-21","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("343","110","Kabid p2m","B/ND/110/X/KB/CM.00.02/2019/BNNP-NTB","Pencairan dana ","Nota Dinas","2019-10-30","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("344","111","KABAG UMUM","B/ND/111/X/BU.01.00/2019/BNNP-NTB","Pencairan dana ","Nota Dinas","2019-10-31","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("345","77","DIR IPDN KAMPUS NTB","R/77/XI/Ka/CM.01.00/2019/BNNP-NTB","Laporan hasil tes urine","Rahasia","2019-11-06","2019-11-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("346","368","Daftar terlampir","Sprin/368/XI/Ka/BU.02.05/2019/BNNP-NTB","Sebagai tugas peliputan  kegiatan petugas peliputan kegiatan kepala BNNP NTB","Sprin","2019-11-07","2019-11-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("347","369","Anang Thoha Mislahhudin, SH Adi Styo Prabowo, S.Psi ","Sprin/369/XI/CM.00.02/2019/BNNP-NTB","Menjadi narasumber pada kegiatan sosialisasi P4GN  
di Aula kantor desa kuripan kec kuripan ","Sprin","2019-11-07","2019-11-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("348","370","Anggraini Ninik M, SH.MH","Sprin/370/XI/Ka/CM.00.02/2019/BNNP-NTB","Menjadi narasumber pada kegiatan sosialisasi P4GN di Aula kantor desa penimbung kec gunung sari","Sprin","2019-11-07","2019-11-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("349","371","Daftar terlampir","Sprin/371/XI/Ka/CM.00.00/2019/BNNP-NTB","Melaksanakan tugas pelaksanaan giat deteksi dini lingkungan masyarakat","Sprin","2019-11-07","2019-11-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("350","341","Daftar terlampir","B/341/XI/Ka/CM.00.01/2019/BNNP-NTB","MONEV Program TA 2019 melalui video conference","Biasa","2019-11-07","2019-11-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("351","342","Adi setyo p","B/342/XI/KA/BU.02.01/2019/BNNP-NTB","Permohonan cuti","Biasa","2019-11-08","2019-11-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("352","372","Daftar terlampir","Sprin/372/XI/Ka/BU.02.01/2019/BNNP-NTB","Peringatan upacara peringatan hari pahlawan ","Sprin","2019-11-08","2019-11-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("353","373","Irfan, S.Sos","Sprin/373/XI/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narasumber tanggal 8 November 2019
di hotel saron","Sprin","2019-11-08","2019-11-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("354","374","Anggraini Ninik M, SH.MH","Sprin/374/XI/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narasumber di lapangan upacara SMP 1 KEDIRI","Sprin","2019-11-08","2019-11-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("355","375","Asep Badarudin, S.Pd","Sprin/375/XI/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narasumber di Camping ground desa sesaot
hari sabtu tanggal 9 November ","Sprin","2019-11-08","2019-11-08","","-","1");
INSERT INTO tbl_surat_keluar VALUES("356","376","Sri Rohayati, Apt., MPH-ATOD, LM Desrial Fahroza , S.Psi.Msi","Sprin/376/XI/Ka/Rh.00.00/2019/BNNP-NTB","melaksanakan kegiatan SIL ","Sprin","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("357","377","Lalu muh desrial fahroza, S.Psi.M.Si","Sprin/377/XI/Ka/RH.00.00/2019/BNNP-NTB","Melaksanakan skrining dan intervensi lapangan 
tanggal Rabu sd Kamis 
13 sd 14 november 2019","Sprin","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("358","378","Lalu muh desrial Fahroza.S.Psi.M.Si","Sprin/378/XI/Ka/RH.00.00/2019/BNNP-NTB","Melaksanakan tugas kegiatan SIL 
Jumat sd sabtu 
15 sd 16 november 2019","Sprin","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("359","379","Sri Rohayati, Apt., MPH-ATOD, I nengah winarse","Sprin/379/XI/Ka/RH.00.00/2019/BNNP-NTB","BIMTEK peningkatan mutu layanan lembaga rehabilitasi di lombok timur 
tanggal 15 sd 16 November 2019","Sprin","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("360","380","Sri Rohayati, Apt., MPH-ATOD, I nengah winarse","Sprin/380/XI/Ka/RH.00.00/2019/BNNP-NTB","BIMTEK dan peningkatan mutu layanan lembaga rehabilitasi komponen masyarakat
di lombok timur 
tanggal 13 sd 14 november 2019","Sprin","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("361","343","DINAS SOSIAL KAB LOTIM","B/343/XI/Ka/RH.00.00/2019/BNNP-NTB","Permohonan pendampingan BIMTEK di LRKM (LKS melayani rehabilitasi Napza ) PILOT dan Edelweis","Biasa","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("362","344","Budi Endarto, A.Md.Kep","B/344/XI/Ka/BU.02.01/2019/BNNP-NTB","Surat cuti tahunan   ","Biasa","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("363","107","I nengah Winarse","SPPD/107/XI/KA/BU.02.02/2019/BNNP-NTB","BIMTEK peningjatan mutu layanan LRKM","SPPD","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("364","108","Sri Rohayati, Apt., MPH-ATOD ","SPPD/108/X/KA/BU.02.02/2019/BNNP-NTB","BIMTEK peningjatan mutu layanan LRKM","SPPD","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("365","109","I nengah Winarse","SPPD/109/XI/KA/BU.02.01/2019/BNNP-NTB","BIMTEK peningjatan mutu layanan LRKM","SPPD","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("366","110","Sri Rohayati, Apt., MPH-ATOD ","SPPD/110/X/KA/BU.02.01/2019/BNNP-NTB","BIMTEK peningjatan mutu layanan LRKM","SPPD","2019-11-08","2019-11-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("367","345","I nengah Winarse","B/345/XI/Ka/BU.02.01/2019/BNNP-NTB","Surat pernyataan tidak pernah di jatuhi hukuman disiplin","Biasa","2019-11-11","2019-11-12","","-","1");
INSERT INTO tbl_surat_keluar VALUES("368","346","GUBERNUR NTB","B/346/XI/Ka/BU.02.01/2019/BNNP-NTB","Usul pensiun","Biasa","2019-11-11","2019-11-12","","-","1");
INSERT INTO tbl_surat_keluar VALUES("369","381","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/381/XI/Ka/Bu.02.01/2019/BNNP-NTB","menghadiri sosialisasi operasional laboratorium narkotika BNN deli serdang di medan
tanggal 14 sd 17 november 2019","Sprin","2019-11-12","2019-11-12","","-","1");
INSERT INTO tbl_surat_keluar VALUES("370","111","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/111/X/KA/BU.02.01/2019/BNNP-NTB","Menghadiri undangan sosialisasi operasional laboratorium BNN deli serdang ","SPPD","2019-11-12","2019-11-12","","-","1");
INSERT INTO tbl_surat_keluar VALUES("371","382","Drs.Nur Rahmat , Apt","Sprin/382/XI/Ka/Cm.00.02/2019/BNN-NTB","melaksanakan tugas sebagai peserta
rakor penyusunan rekarnasi timdu p4gn","Sprin","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("372","383","Irfan, S.Sos","Sprin/383/IX/Ka/CM.00.00/2019/BNNP-NTB","sebagai narasumber pada kegiatan penyuluhan ttg kesadaran masyarakat terkait bahaya narkoba 
di SDN 2 desa Lekor 
Rabu 13 November 2019","Sprin","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("373","384","Asep Badarudin, S.Pd","Sprin/384/XI/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narasumber di Aula kantor desa surakarja
hari rabu 13 november 2019","Sprin","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("374","347","Kepala Biro Umum BNN RI","B/347/XI/Ka/BU.01.00/2019/BNNP-NTB","Pengiriman data ukuran pakaian dinas pegawai BNN provinsi NTB","Biasa","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("375","348","SESTAMA BNN RI","B/348/XI/Ka/BU.02.01/2019/BNNP-NTB","Usulan untuk mendapatkan kartu suami /kartu istri","Biasa","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("376","78","penyidik /jaksa penuntut umum","R/77/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an I Gede Putra","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("377","79","penyidik /jaksa penuntut umum","R/78/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Eka Jaya","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("378","80","penyidik /jaksa penuntut umum","R/80/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Munawar haris","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("379","81","penyidik /jaksa penuntut umum","R/81/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Ketut sudarsa","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("380","82","penyidik /jaksa penuntut umum","R/82/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Jitawan","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("381","83","penyidik /jaksa penuntut umum","R/83/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an I Komang juli mertha ","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("382","84","penyidik /jaksa penuntut umum","R/84/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Subhan","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("383","85","penyidik /jaksa penuntut umum","R/85/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an M.Muzakir Kahfi","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("384","86","penyidik /jaksa penuntut umum","R/86/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Titik Srimariati","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("385","87","penyidik /jaksa penuntut umum","R/87/xI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Muazzam","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("386","88","penyidik /jaksa penuntut umum","R/88/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an I Made widiarta","Rahasia","2019-11-12","2019-11-13","","-","1");
INSERT INTO tbl_surat_keluar VALUES("387","349","DIR NARKOBA POLDA NTB","B/349/XI/Ka/Rh.00.01/2019/BNNP-NTB","Pelaksanaan assesment terpadu","Biasa","2019-11-12","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("388","350","KAPOLDA NTB","B/350/XI/Ka/RH.00.00/2019/BNNP-NTB","Pelaksanaan assesment terpadu","Biasa","2019-11-13","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("389","351","POLRES MATARAM","B/351/XI/Ka/Rh.00.00/2019/BNNP-NTB","Pelaksanaan assesmen penyalahguna narkoba","Biasa","2019-11-13","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("390","352","POLRES LOTENG","B/352/XI/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment terpadu","Biasa","2019-11-13","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("391","385","Daftar terlampir","Sprin/385/XI/Ka/RH.00.00/2019/BNNP-NTB","Melakukan assesmen medis","Sprin","2019-11-13","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("392","386","Anang Thoha Mislahhudin, SH","Sprin/386/XI/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narsumber kegiatan sosialisasi P4GN
DI Kantor desa marong 
13 november 2019","Sprin","2019-11-13","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("393","387","Anggraini Ninik M, SH.MH","Sprin/387/XI/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narasumber kegiatan sosialisasi P4GN 
di desa mantang
rabu 13 november 2019","Sprin","2019-11-13","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("394","388","Anggraini Ninik M, SH.MH","Sprin/388/XI/Ka/CM.00.00/2019/BNNP-NTB","Menjadi narasumber kegiatan sosialisasi P4GN 
di cabang dinas DIKBUD LOTENG
Kamis 14 November 2019","Sprin","2019-11-13","2019-11-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("395","80","Kamariah, S.Adm","B/80/XI/Ka/BU.01.00/2019/BNNP-NTB","BA PENDISTRIBUSIAN BARANG ","Berita Acara","2019-11-08","2019-11-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("396","389","Daftar terlampir","Sprin/389/XI/Ka/CM.00.00/2019/BNNP-NTB","SEBAGAI PETUGAS TES URINE 
BRI CAB PRAYA 
SABTU 16 NOV 2019","Sprin","2019-11-15","2019-11-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("397","390","Daftar terlampir","Sprin/390/XI/Ka/CM.00.00/2019/BNNP-NTB","sebagai panitia kegiatan insert konten ","Sprin","2019-11-15","2019-11-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("398","391","Drs.Nur Rahmat , Apt","Sprin/391/X/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai narasumber kegiatan insert konten 
taman budaya prov ntb
Sabtu 16 November 2019","Sprin","2019-11-15","2019-11-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("399","392","Muslim Sultrian, S.Psi ","Sprin/392/XI/Ka/RH.01.01/2019/BNNP-NTB","Melaksanakan tugas kunjungan Home visit di rumah klien","Sprin","2019-11-15","2019-11-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("400","393","Rudy Hasibuan","Sprin/393/XI/Ka/RH.00.00/2019/BNNP-NTB","Melakukan home visit","Sprin","2019-11-15","2019-11-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("401","353","Sutan Wahyu","SC/353/XI/Ka/BU.02.01/2019/BNNP-NTB","Surat Cuti","Biasa","2019-11-18","2019-11-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("402","354","Ratna Noerbani, A.Md","SC/354/XI/Ka/BU.02.01/2019/BNNP-NTB","Surat permohonan cuti","Biasa","2019-11-15","2019-11-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("403","355","WALIKOTA MATARAM","B/355/XI/Ka/CM.00.00/2019/BNNP-NTB","Permohonan ijin tempat","Biasa","2019-11-18","2019-11-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("404","89","PT.PRIMA KARYA SARANA SEJAHTERA","R/89/XI/Ka/CM.00.01/2019/BNNP-NTB","Laporan Hasil Tes urine","Rahasia","2019-11-18","2019-11-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("405","394","dr.Yolly Dahlia.,SpKJ ","Sgas/394/XI/Ka/Rh.00.00/2019/BNNP-NTB","menjadi fasilitator kegiatan screening kejiawaan yang di laksanakan di klinik pratama BNN Provinsi NTB","Sprin","2019-11-18","2019-11-19","","-","1");
INSERT INTO tbl_surat_keluar VALUES("406","395","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/395/XI/Ka/BU.02.01/2019","Menghadiri dan mengikuti rapat arahan kepala BNN RI dan undangan RDP
di Jakarta 3 Hari tanggal 20 sd 22 November 2019","Sprin","2019-11-19","2019-11-19","","-","1");
INSERT INTO tbl_surat_keluar VALUES("407","112","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/112/XI/Ka/BU.02.02/2019/BNNP-NTB","Menghadiri rapat arahan kepala BNN RI ","SPPD","2019-11-19","2019-11-19","","-","1");
INSERT INTO tbl_surat_keluar VALUES("408","356","dr.Yolly Dahlia.,SpKJ ","Sket /356/XI/Ka/BU.02.01/2019/BNNP-NTB","Suart keterangan absen ","Biasa","2019-11-19","2019-11-19","","-","1");
INSERT INTO tbl_surat_keluar VALUES("409","396","Fajrul husni SE","Sprin/396/XI/Ka/BU.02.01/2019/BNNP-NTB","Menghadiri acara rakor kelengkapan data simadu dan pengisian IP ASN  selama 1 Hari kerja","Sprin","2019-11-20","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("410","357","zaenal mutaqin","B/357/XI/Ka/BU.02.01/2019/BNNP-NTB","Surat Rekomendasi atasan","Biasa","2019-11-19","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("411","358","Sutan Wahyudi","B/358/XI/Ka/BU.02.01/2019/BNNP-NTB","Surat Izin cuti","Biasa","2019-11-19","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("412","359","Ratna Noerbani, A.Md","B/359/XI/Ka/BU.02.01/2019/BNNP-NTB","Surat Cuti tahunan ","Biasa","2019-11-19","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("413","360","Inspektur utama BNN","B/360/XI/Ka/BU.02.01/2019/BNNP-NTB","Permohonan pengajuan akun aplikasi","Biasa","2019-11-19","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("414","397","Tasripin Aks MH","Sprin/397/XI/Ka/BU.02.1/2019/BNNP-NTB","Tugas sebagai PLH","Sprin","2019-11-19","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("415","398","Daftar terlampir","Sprin/398/XI/Ka/CM.01.00/2019/BNNP-NTB","Sebagai narasumber di KAB LOTIM
Hari Rabu 20 November 2019","Sprin","2019-11-20","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("416","399","Daftar terlampir","Sprin/399/XI/Ka/CM.01.00/2019/BNNP-NTB","Petugas kegiatan tes urine
hari senin 25 November 2019
di Kantor desa masbagik","Sprin","2019-11-21","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("417","400","BUK YULI","sprin/400","booking","Sprin","2019-11-19","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("418","401","Daftar terlampir","Sprin/401","Melaksanakan tugas pelaksanaan giat deteksi dini
praya LOTENG","Sprin","2019-11-21","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("419","361","BANK NTB","B/361/XI/Ka/BU.00.00/2019/BNNP-NTB","Surat pernyataan penggunaan rekening lainya untuk menampung dana hibah ","Biasa","2019-11-19","2019-11-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("420","402","Budi endarto, S.Kep ","Sprin/402/XI/Ka/RH.00/2019/BNNP-NTB","Melaksanakan SIL di LOBAR","Sprin","2019-11-20","2019-11-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("421","403","Lily Wahyuni,A.Md, Farm","Sprin/403/XI/Ka/RH.00.00/2019/BNNP-NTB","Undangan kegiatan rapat integritas program pascarehabilitasi","Sprin","2019-11-21","2019-11-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("422","52","STAKEHOLDER TERKAIT","B/52/XI/KA/BU.00.00/2019/BNNP-NTB","Undangan ex post monitoring dan evaluasi P4GN","Undangan","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("423","404","Irfan s.sos","Sprin/404/XI/Ka/CM.00.00/2019/BNNP-NTB","menjadi narasumber di SMA MUHAMMADYAH MATARAM
Jumat 22 November 2019","Sprin","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("424","405","BUDY ENDARTO","Sprin/404/XI/Ka/RH.00.00/2019/BNNP-NTB","Melaksanakan SIL di wilayah mataram","Sprin","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("425","362","Kapolres LOBAR","B/362/XI/Ka/RH.00.01/2019/BNP-NTB","Hasil verifikasi berkas permohonan assesment terpadu an Ching Kiem Alies KIM","Biasa","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("426","363","KAPOLRES LOBAR","B/363/XI/Ka/RH.00.01/2019/BNNP-NTB","Hasil verifikasi berkas permohonan assesment terpadu an Arief setiadi","Biasa","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("427","406","Daftar terlampir","Sprin/406/XI/Ka/CM.00.00/2019/BNNP-NTB","Tugas pemeriksaan tes urine di desa masbagik 
selasa 26 november 2019","Sprin","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("428","407","Daftar terlampir","Sprin/407/XI/Ka/CM.//BNNP-NTB","Tugas sebagai narasumber di aula kantor desa masbagik
selasa 26 november 20149","Sprin","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("429","408","Daftar terlampir","Sprin/408/XI/Ka/CM.00.00/2019/BNNP-NTB","Sebagai panitia pada kegiatan BIMTEK di desa masbagik 
Hari selasa  November ","Sprin","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("430","53","Stakeholder ","B/53/XI/Ka/CM.00.00/2019/BNNP-NTB","Melaksanakan BIMTEK  dalam rangka sinegritas program pemberdayaan masyarakat","Undangan","2019-11-22","2019-11-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("431","409","Daftar terlampir","Sprin/409/XI/Ka/PB.01/2019","melaksanakan operasi / razia game online di kota mataram
tanggal 22 november 2019","Sprin","2019-11-22","2019-11-25","","-","1");
INSERT INTO tbl_surat_keluar VALUES("432","55","BNNKAB/KOTA","B/55/XI/Ka/CM.01.00/2019/BNNP-NTB","Undangan diskusi manajemen kinerja organisasi di satker kerja vertikal 
Selasa 26 November 2019","Undangan","2019-11-22","2019-11-25","","-","1");
INSERT INTO tbl_surat_keluar VALUES("433","414","APIPUDIN LUTFI, SKM ","Sprin/414/XI/Ka/CM.01.00/2019/BNNP-NTB","Sebagai panitia lokal pada kegiatan BIMTEK dalam  sinegritas program pemberdayaan alternatif
Rabu 27 November 2019","Sprin","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("434","411","Muslim sultriawan , S.Psi","Sprin/411/XI/Ka/RH.01.01/2019/BNNP-NTB","Tugas sebagai home visit pada kegiatan pendmpingan dan rawat lanjut pascarehabilitasi","Sprin","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("435","412","Daftar terlampir","Sprin/412/XI/Ka/RH.01.01/2019/BNNP-NTB","mengikuti kegiatan pertemuan layanan pascarehabilitasi 
jumat 29 november 2019","Sprin","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("436","410","Rudi hasibuan ","Sprin/410/XI/Ka/RH.01.01/2019/BNNP-NTB","melakukan  home visit ","Sprin","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("437","413","Daftar terlampir","Sprin/413/XI/Ka/RH.01.01/2019/BNNP-NTB ","Mengikuti kegiatan pertemuan layanan pascarehabilitasi 
sabtu 30 november 2019","Sprin","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("438","415","Sri Rohayati, Apt., MPH-ATOD, LM Desrial Fahroza , S.Psi.Msi","Sprin/415/XI/Ka/RH.00.00/2019/BNNP-NTB","melaksanakan SIL di wilayah LOBAR senin 25 November 2019","Sprin","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("439","56","Peserta Kegiatan Pascarehabiltasi ","B/UND-56/XI/Ka/RH.01.01/2019/BNNP-NTB","Undangan peserta kegiatan pascarehabilitasi ","Undangan","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("440","54","peserta kegiatan pascarehabilitasi ","B/UND-54/XI/Ka/RH.01.01/2019/BNNP-NTB","Undangan Peserta kegiatan pascarehabiltasi ","Undangan","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("441","364","DINSOS PROV NTB","B/364/XI/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi lembaga rehabilitasi komponen masyarakat (LRKM) menjadi institusi penerima wajib lapor (IPWL) narkoba","Biasa","2019-11-25","2019-11-26","","-","1");
INSERT INTO tbl_surat_keluar VALUES("442","416","Fajrul Husni, SE","Sprin/416/XI/Ka/BU.02.01/2019/BNNP-NTB","Melakukan penyelesaian tindak lanjut notisi hasil audit inspektorat","Sprin","2019-11-26","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("443","113","Fajrul husni SE","SPPD/113/XI/KA/BU.02.01/2019/BNNP-NTB","Melakukan penyelesaian tindak lanjut notisi hasil audit ","SPPD","2019-11-26","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("444","417","Drs.H.Nur Rachmat, Apt ","Sprin/417/XI/Ka/CM.00.00/2019/BNNP-NTB","Melaksanakan tugas mendampingi kepala BNNP NTB
Senin 25 November 2019","Sprin","2019-11-26","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("445","418","Sri Rohayati, Apt., MPH-ATOD, I nengah winarse","Sprin/418/XI/Ka/RH.00/2019/BNNP-NTB","melaksanakan BIMTEK dan peningkatan mutu layanan lembaga rehabilitasi 
tanggal 29 November 2019","Sprin","2019-11-26","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("446","419","Sri Rohayati, Apt., MPH-ATOD, I nengah winarse","Sprin/419/XI/Ka/RH.00/2019/BNNP-NTB","Melaksanakan BIMTEK dan peningkatan mutu layanan lembaga rehabilitasi 
tanggal 28 November  2019","Sprin","2019-11-26","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("447","365","Inspektur wilayah I BNN RI","B/365/XI/KU/BU.02/2019/BNNP-NTB","Surat pengantar tindak lanjut notisi hasil audit tim irwas","Biasa","2019-11-27","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("448","81","Sirajudin Mahmud ","BAST/81/XI/Ka/BU.01.00/2019/BNNP-NTB","Berita acara serah terima ","Berita Acara","2019-11-26","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("449","420","Yoel Agus Wicakso,S.Psi Ratna Noerbani, A.Md","Sprin/420/XI/Ka/CM.00.00/2019/BNNP-NTB","Melakukan revisi pejabat KPA dan PPSPM ke DJPB","Sprin","2019-11-27","2019-11-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("452","366","PAK IRFAN","B/366/XI/Ka/CM.00.02/2019/BNNP-NTB","Desiminasi informasi melalui talkshow ","Biasa","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("453","367","PAK IRFAN","B/367","BOOKING","Biasa","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("454","421","Daftar terlampir","Sprin/421/Ka/CM.00.00/2019/BNNP-NTB","Melaksanakan tugas sebagai panitia kegiatan desiminasi informasi melalaui talkshow
di Hotel Lombok Plaza 
Senin 2 Desember 2019","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("455","422","PAK IRFAN","Sprin/422/XI/Ka/CM.00.00/2019/BNNP-NTB","Sebagai moderator pada kegiatan desiminasi informasi di Hotel Lombok Plaza 
senin 2 desember 2019","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("456","423","H.Agus Talino","Sprin/423/XI/Ka/CM.00.00/2019/BNNP-NTB","Sebagai narasumber pada kegiatan desiminasi informasi 
senin 2 desember 2019 di Hotel Lombok Plaza","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("457","424","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/424/XI/Ka/CM.00.00/2019/BNNP-NTB","Sebagai narasumber pada kegiatan desiminasi informasi  melalui talkshow 
senin 2 Desember 2019
Hotel Lombok Plaza","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("458","425","DENNY PRIADI, S.Sos","Sprin/425/XI/Ka/CM.00/2019/BNNP-NTB","Menjadi narasumber pada kegiatan workshop
Hari Rabu sd Kamis 27 sd 28 November 2019","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("459","426","Asep Badarudin, S.Pd","Sprin/426/XI/Ka/CM.00/2019/BNNP-NTB","Menjadi narasumber pada kegiatan workshop 
di Kantor BIL Hari Rabu 27 November 2019","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("460","427","Budi endarto, S.Kep , Lalu Muh fahroza, S.Psi","Sprin/427/XI/Ka/RH.00.00/2019/BNNP-NTB","Melakukan SIL ","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("461","428","Drs.Nur Rahmat , Apt","Sprin/428/XI/Ka/CM.00/2019/BNNP-NTB","Menjadi narasumber pada kegiatan workshop pengenalan bentuk dan penyalahgunaan narkoba 
BIL kamis 28 November 2019","Sprin","2019-11-27","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("462","90","penyidik /jaksa penuntut umum","R/90/XI/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Repanda Sanseno","Rahasia","2019-11-25","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("463","91","penyidik /jaksa penuntut umum","R/91/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Munawir Sazali","Rahasia","2019-11-25","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("464","92","penyidik /jaksa penuntut umum","R/92/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an M.sutiawan","Rahasia","2019-11-25","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("465","93","penyidik /jaksa penuntut umum","R/93/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Gerry Pradana  ","Rahasia","2019-11-25","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("466","94","penyidik /jaksa penuntut umum","R/94/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Mahendra Setiadi","Rahasia","2019-11-25","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("467","95","penyidik /jaksa penuntut umum","R/95/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Yudi Purwanto","Rahasia","2019-11-25","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("468","96","penyidik /jaksa penuntut umum","R/96/XI/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Bebe Ari Saputra ","Rahasia","2019-11-25","2019-11-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("469","429","Ahmadi, A.Md","Sprin/429/XI/Ka/BU.02.01/2019/BNNP-NTB","Melaksanakan tugas sebagai pelaksana tugas (PLT) KA BNNK SUMBAWA","Sprin","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("470","368","BNN RI ","B/368/XI/Ka/BU.02.01/2019/BNNP-NTB","Permohonan penunjukan KPA anggaran BNN Kab Sumbawa","Biasa","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("471","369","KAPOLRES LOBAR","B/369/XI/Ka/RH.00.00/2019/BNNP-NTB","Pelaksanaan assesment ","Biasa","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("472","370","KAPOLRES MATARAM","B/370/XI/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment ","Biasa","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("473","371","Kasi narkotika Kejati NTB","B/371/XI/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment ","Biasa","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("474","372","Kabag Bin Opsnal Dir Narkoba POLDA NTB","B/372/XI/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment ","Biasa","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("475","430","Daftar terlampir","Sprin/430/XI/Ka/RH.00.00/2019/BNNP-NTB","Melakukan TAT kepada 6 orang tersangka","Sprin","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("476","373","DINKES ","B/373/XI/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi LRIP menjadi IPWL narkoba","Biasa","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("477","431","Anggraini Ninik M, SH.MH","Sprin/431/XI/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai narasumber
Hotel Puri Indah Mataram
Selasa 26 November 2019","Sprin","2019-11-28","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("478","432","Daftar terlampir","Sprin/432/XI/Ka/Rh.01.00/2019/BNNP-NTB","Tugas sebagai panitia kegiatan tes urine  di kesbangpol
jumat 29 november 2019","Sprin","2019-11-29","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("479","433","Tasripin Aks MH","Sprin/433/XI/Ka/BU.02.01/2019/BNNP-NTB","Mengikuti pelatihan keprotokolan 
tanggal 1 sd 7 desember 2019","Sprin","2019-11-29","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("480","114","Tasripin Aks MH","SPPD/114/XI/KA/BU.02.01/2019/BNNP-NTB","Mengikuti diklat keprotokolan ","SPPD","2019-11-26","2019-11-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("481","374","PT.TELKOM PRAYA","B/374/XII/Ka/CM.00.01/2019/BNNP-NTB","Tindak lanjut hasil deteksi dini melalui tes urine ","Biasa","2019-11-29","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("482","97","BAKESBANGPOLDAGRI ","R/97/XI/Ka/CM.01/2019/BNNP-NTB","Laporan Hasil tes urine ","Rahasia","2019-11-29","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("483","434","Lily Wahyuni,A.Md, Farm","Sprin/434/XII/Ka/RH.01.00/2019/BNNP-NTB","Menjadi fasilitator kegiatan layanan pascarehabilitasi ","Sprin","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("484","435","Rudy Hasibuan","Sprin/435/XII/Ka/RH.01.01/2019/BNNP-NTB","Melakukan home visit","Sprin","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("485","436","Muslim Sultriawan, S.Psi","Sprin/436/XII/Ka/RH.01.01/2019/BNNP-NTB","Melakukan home visit ","Sprin","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("486","57","dr.Yolly Dahlia.,SpKJ ","B/UND-57/X/Rh.01.00/2019/BNNP-NTB","Undangan sebagai fasilitator","Undangan","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("487","58","Harmoko , M.Pd., Kons ","B/UND-58/X/Rh.01.00/2019/BNNP-NTB","Undangan sebagai fasilitator","Undangan","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("488","437","dr.Yolly Dahlia.,SpKJ ","Sprin/437/XII/Ka/RH.01.00/2019/BNNP-NTB","Sprin menjadi fasilitator","Sprin","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("489","438","Harmoko , M.Pd., Kons ","Sprin/438/XII/Ka/RH.01.00/2019/BNN-NTB","Sprin menjadi fasilitator","Sprin","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("490","375","Yoel Agus W","SC/375/XII/Ka/BU.02.01/2019/BNNP-NTB","Permohonan cuti","Biasa","2019-12-03","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("491","82","AKBP Ivanto Aritonang, ST","B/82/XI/Ka/BU.01.00/2019/BNNP-NTB","Berita acara pendistribusian barang Alat test kit","Berita Acara","2019-11-13","2019-12-03","","SARPRAS","1");
INSERT INTO tbl_surat_keluar VALUES("492","439","Adi setiyo P","Sprin/439/XII/Ka/CM.00.00/2019/BNNP-NTB","Menhadiri raker monev tanggal 02 sd 4 Desember 2019
di hotel aston","Sprin","2019-12-02","2019-12-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("493","440","Syaripudin S.ST","Sprin/440/XII/Ka/BU.02.01/2019/BNNP-NTB","Mengikuti diklat TOT dari tanggal 8 sd 20 Desember 2019","Sprin","2019-12-03","2019-12-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("494","115","Syaripudin S.ST","SPD/115/Ka/BU.02.01/2019/BNNP-NTB","mengikuti diklat training of fasilitator TOT","SPPD","2019-11-26","2019-12-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("495","376","KPPN","B/376/XII/Ka/BU.02.02/2019","Surat pernyataan pengajuan TUP","Biasa","2019-12-03","2019-12-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("496","377","KPPN","B/377/XII/Ka/BU.02.02/2019/BNNP-NTB","Permohonan tambahan uang persediaan TUP","Biasa","2019-12-04","2019-12-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("497","441","Kamariah, S.Adm l.tresna jaya, s.sos","Sprin/441/XII/Ka/CM.01.01/2019/BNNP-NTB","tugas sebagai petugas monitoring dan evaluasi program pemberdayaan alternatif 
selasa sd rabu 3 sd 4 desember 2019
desa masbagik","Sprin","2019-12-03","2019-12-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("498","442","DAFTAR TERLAMPIR ","Sprin/442/XII/Ka/CM.01.00/2019/BNNP-NTB","TUGAS SEBAGAI PANITIA KEGIATAN TES URINE 
KAMIS 5 DESEMBER 2019","Sprin","2019-12-04","2019-12-04","","-","1");
INSERT INTO tbl_surat_keluar VALUES("499","378","Daftar terlampir","B/378/XII/Ka/RH.00/2019/BNNP-NTB","Permohonan laporan layanan rehabilitasi 1 januari sd 20 desember 2019","Biasa","2019-12-04","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("500","443","Kamariah, S.Adm l.tresna jaya, s.sos","Sprin/443/XII/Ka/CM.01.01/2019/BNNP-NTB","sebagai petugas monitoring evaluasi program pemberdayaan alternatif
Selasa sd rabu 3 sd 4 Desember 2019","Sprin","2019-12-04","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("501","444","APIPUDIN LUTFI, SKM ","Sprin/444/XII/Ka/CM.010.01/2019/BNNP-NTB","Sebagai fasilitator kegiatan MONEV program pemberdayaan alternatif
Rabu 4 Desember 2019","Sprin","2019-12-04","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("502","445","Daftar terlampir","Sprin/445/XII/Ka/RH.01.01/2019/BNNP-NTB","Megikuti kegiatan pertemuan layanan pascarehabilitasi 
jumat 6 November 2019","Sprin","2019-12-04","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("503","59","Peserta kegiatan pascarehabilitasi","B/UND-59/XII/Ka/RH.01.01/2019/BNNP-NTB","Undangan peserta pascarehabilitasi","Undangan","2019-12-04","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("504","446","Drs.Nur Rahmat , Apt","Sprin/446/XII/Ka/CM.00.02/2019/BNNP-NTB","Sebagai narasumber di aula koperasi NTB
Sabtu 7 Desember 2019","Sprin","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("505","447","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/447/XII/Ka/CM.00.00/2019/BNNP-NTB","Tugas Sebagai narasumber kegiatan insert konten 
sabtu 7 desember 2019
di lapangan lanud rembiga","Sprin","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("506","448","Daftar terlampir","Sprin/448/XII/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai panitia kegiatan insert konten 
sabtu 7 desember 2019
di lapangan lanud rembiga ","Sprin","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("507","449","Daftar terlampir","Sprin/449/XII/KA/RH.00.01/2019/BNNP-NTB","Melaksanakan TAT","Sprin","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("508","450","Daftar terlampir","Sprin/450/XII/Ka/RH.00.01/2019/BNNP-NTB","Melakukan TAT","Sprin","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("509","379","KAPOLDA NTB","B/379/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment terpadu","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("510","380","Kabag Bin Opsnal Dir Narkoba POLDA NTB","B/380/XII/Ka/RH00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalahguna narkoba","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("511","381","Kasi narkotika Kejati NTB","B/381/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalahguna narkoba","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("512","382","Kapolres mataram","B/382/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalahguna narkoba","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("513","383","Kapolda NTB","B/383/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalahguna narkoba","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("514","384","Kapolres Mataram","B/384/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalahguna narkoba","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("515","385","KAPOLRES MATARAM","B/385/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalahguna narkoba","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("516","386","KAPOLRES MATARAM","B/386/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalahguna narkoba","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("517","387","KAPOLRES KLU ","B/387/XII/Ka/RH.00.00/2019/BNNP-NTB","Tindak lanjut klien melarikan diri","Biasa","2019-12-05","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("518","116","L.Tresna jaya S.Sos","SPPD/116/XII/KA/CM.01.01/2019/BNNP-NTB","BIMTEK dalam rangka sinergi program pemberdayaan alternatif denga stakeholder","SPPD","2019-11-27","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("519","117","Adi setiyo P","SPPD/117/XII/KA/CM.02.01/2019/BNNP-NTB","BIMTEK dalam rangka sinergi program pemberdayaan alternatif denga stakeholder","SPPD","2019-11-26","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("520","118","Drs.Nur Rahmat , Apt","SPPD/118/XII/KA/CM.01.01/2019/BNNP-NTB","BIMTEK dalam rangka sinergi program pemberdayaan alternatif denga stakeholder","SPPD","2019-11-26","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("521","119","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/119/XII/KA/CM.01.01/2019/BNNP-NTB","BIMTEK dalam rangka sinergi program pemberdayaan alternatif denga stakeholder","SPPD","2019-11-26","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("522","120","L Tresna jaya S.Sos","SPPD/120/XII/KA/CM.01.01/2019/BNNP-NTB","Monev program pemberdayaan alternatif ","SPPD","2019-12-02","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("523","121","Kamariah, S.Adm","SPPD/121/XII/KA/CM.01.01/2019/BNNP-NTB","MONEV PEMBERDAYAAN ALTERNATIF","SPPD","2019-12-02","2019-12-05","","-","1");
INSERT INTO tbl_surat_keluar VALUES("524","98","Kepala Kemenkumham RI Wilayah NTB","R/98/XII/Ka/Cm.01/2019/BNNP-NTB","hASIL resumen asesmen wajib lapor","Rahasia","2019-12-05","2019-12-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("525","388","Kepala BNN Kab/Kota Jajaran BNNP NTB","B/388/XII/Ka/Cm.01.00/BNNP-NTB","Monitoring dan Evaluasi Pelaksanaan Program Pemberdayaan Masyarakat","Biasa","2019-12-05","2019-12-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("526","451","Daftar terlampir","Sprin/451/XII/Ka/CM.00.00/2019/BNNP-NTB","Melaksanakan Tugas Sehari - hari dan tanggung jawab, sebagaipetugas peliputan kegiatan","Sprin","2019-12-05","2019-12-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("527","389","Daftar terlampir","B/389/XII/Ka/CM.00.02/2019/BNNP-NTB","Desiminasi Informasi Melalui Talkshow ","Biasa","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("528","390","PUJI AROHMAN, M, Psi, Psikolog","B/390/XII/Ka/CM.00.02/2019/BNNP-NTB","Permohonan narasumber ","Biasa","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("529","452","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/452/XII/Ka/BU.02.01/2019/BNNP-NTB","undangan pengarahan polri kepada anggota polri yang bertugas di luar struktur organisasi 
tanggal 10 sd 13 desember 2019","Sprin","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("530","122","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/122/XII/KA/BU.02.01/2019/BNNP-NTB","Menghadiri pengarahan POLRI ","SPPD","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("531","453","Tasripin Aks MH","Sprin/453/XII/Ka/BU.02.01/2019/BNNP-NTB","Melaksanakan tugas sebagai PLH ka BNNP NTB
10 SD 13 Desember 2019","Sprin","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("532","454","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/454/XII/Ka/CM.00.00/2019","Tugas sebagai narasumber pada kegiatan Desiminasi informasi 
Selasa 10 Des 2019
di Taman AYU ","Sprin","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("533","455","Pujiarrohman, M. Psi, Psikolog","Sprin/455/XII/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai narasumber pada kegiatan desiminasi informaasi 
di Taman Ayu tanggal 10 Desember 2019","Sprin","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("534","456","Irfan, S.Sos","Sprin/456/XII/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai moderator pada kegiatan desiminasi infromasi 
di Taman Ayu tanggal 10 Desember 2019","Sprin","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("535","457","Daftar terlampir","Sprin/457/XII/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai panitia  pada kegiatan desiminasi infromasi 
di Taman Ayu tanggal 10 Desember 2019","Sprin","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("536","458","Wirawan S.Kep Ners","Sprin/458/XII/Ka/CM.00.00/2019/BNNP-NTB","Tugas sebagai narasumber  pada kegiatan desiminasi infromasi 
di Taman Ayu tanggal 10 Desember 2019","Sprin","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("537","391","Daftar terlampir","B/391/XII/Ka/CM.00.02/2019/BNNP-NTB","Rapat evaluasi pelaksanaan advokasi pembangunan berwawasan anti narkoba ","Biasa","2019-12-09","2019-12-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("538","460","FX Charlie gustaf N","SPRIN/460","BOOKING","Sprin","2019-12-11","2019-12-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("539","461","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/461/XII/Ka/CM.00.03/2019/BNNP-NTB","Tugas Sebagai Narasumber pada kegiatan Rapat evaluasi pelaksana advokasi pembangunan berwawasan anti narkoba
kamis 12 Desember 2019
ruang rapat kantor BNNP NTB","Sprin","2019-12-11","2019-12-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("540","99","BNNP NTB","R/99/XII/Ka/CM.00.01/2019","Laporan hasil tes urine","Rahasia","2019-12-12","2019-12-12","","-","1");
INSERT INTO tbl_surat_keluar VALUES("541","462","Anggraini Ninik M, SH.MH","Sprin/462/XII/Ka/BU.02.01/2019/BNNP-NTB","Mengikuti undangan uji kompetensi pengangkat kembali dalam jabatan fungsional 
penyuluh tanggal 16 sd 18 Desember ","Sprin","2019-12-16","2019-12-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("542","392","Kepala BPMPD","B/392/XII/Ka/RH.00.00/2019/BNNP-NTB","Permohonan Fasilitasi Pertemuan dengan kades/lurah","Biasa","2019-12-16","2019-12-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("543","393","Daftar terlampir","B/393/XII/Ka/RH.00.00/2019/BNNP-NTB","Pemberitahuan sosialisasi intervensi berbasis masyarakat ( IBM)","Biasa","2019-12-16","2019-12-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("544","394","Cmat Gerung","B/394/XII/Ka/RH.00.00/2019/BNNP-NTB","Permohonan Fasilitasi Pertemuan dengan Kades/Lurah","Biasa","2019-12-16","2019-12-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("545","395","Inspektur utama BNN","B/395/XII/Ka/bU.02.01/BNNP-NTB","Rekapitulasi Data Pengalangan pegawai Di lingkungan BNNP NTB Bulan November 2019","Biasa","2019-12-16","2019-12-17","","--","1");
INSERT INTO tbl_surat_keluar VALUES("546","463","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/463/XII/Ka/BU.02.01/2019/BNNP-NTB","Monitoring kegiatan Tapping Jaringan Narkotika di Direktorat  Intelijen 
selama 3 hari tanggal 19 sd 21 Desember 2019","Sprin","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("547","123","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/123/XII/KA/BU.02.01/2019/BNNP-NTB","Monitoring Pelaksanaan kegiatan Tapping Jaringan Narkotika direktorat Intelijen","SPPD","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("548","100","penyidik /jaksa penuntut umum","R/100/XII/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi ","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("549","101","penyidik /jaksa penuntut umum","R/101/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Erwin Satriawan ","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("550","102","penyidik /jaksa penuntut umum","R/102/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Ching Kiem Alias Kim","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("551","464","Daftar terlampir","Sprin/464/XII/Ka/BU.02.01/2019/BNNP-NTB","Menjadi panitia pelantikan  pejabat struktural ","Sprin","2019-12-18","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("552","59","Daftar terlampir","B/UND-59/XII/Ka/BU.02.01/2019/BNNP-NTB","Undangan pelantikan pejabat struktural di lingkungan BNN Prov NTB
Kamis 19 Desember 2019","Undangan","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("553","465","Daftar terlampir","Sprin/465/XII/Ka/CM.00.00/2019/BNNP-NTB","menjadi narasumber tanggal 18 Desember 2019","Sprin","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("554","103","penyidik /jaksa penuntut umum","R/103/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Muhamad Ali Azni ","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("555","104","penyidik /jaksa penuntut umum","R/104/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Muhamad ishal","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("556","105","penyidik /jaksa penuntut umum","R/105/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Nadong","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("557","106","penyidik /jaksa penuntut umum","R/106/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Sapradih Hidayat","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("558","107","penyidik /jaksa penuntut umum","R/107/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Sapani","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("559","108","penyidik /jaksa penuntut umum","R/108/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Risqi Ana","Rahasia","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("560","396","Daftar terlampir","B/396/XII/Ka/BU.02.05/2019/BNNP-NTB","Permintaan data press realise ","Biasa","2019-12-18","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("561","397","Ratna Noerbani, A.Md","SC/397/XII/Ka/BU.02.01/2019/BNNP-NTB","Surat cuti PNS","Biasa","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("562","398","LALU TRESNA JAYA, S.Sos","SC/398/XII/Ka/BU.02.01/2019/BNNP-NTB","Surat cuti ","Biasa","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("563","399","Kamariah, S.Adm","SC/399/XII/Ka/BU.02.01/2019/BNNP-NTB","Surat cuti","Biasa","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("564","400","Dir RSUD DOMPU","B/400/XII/Ka/RH.00.00/2019/BNNP-NTB","Permakluman terhadap klaim reimbusment layanan ","Biasa","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("565","401","Kasi narkotika Kejati NTB","B/401/XII/Ka/RH.00.00/2019/BNNP-NTB","Pelaksanaan assesment penyalah guna narkoba","Biasa","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("566","402","Kabag Bin Opsnal Dir Narkoba POLDA NTB","B/402/XII/Ka/RH.00.01/2019/BNNP-NTB","Pelaksanaan assesment penyalah guna narkoba","Biasa","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("567","403","KAPOLRES MATARAM","B/403/XII/Ka/RH.00.01/2019/BNNP-NTB","Hasil verifikasi berkas permohonan Assesment terpadu","Biasa","2019-12-18","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("568","404","KAPOLDA NTB","B/404/XII/Ka/RH.00.01/2019/BNNP-NTB","Hasil verifikasi berkas permohonan berkas assesment terpadu","Biasa","2019-12-18","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("569","405","Kepala desa taman ayu ","B/405/XII/Ka/RH.00.02/2019/BNNP-NTB ","Permintaan nama petugas agen pemulihan ","Biasa","2019-12-17","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("570","466","Daftar terlampir","Sprin/466/XII/Ka/RH.00.01/2019/BNN-NTB","Melakukan Asessesment medis dan hukum TAT ","Sprin","2019-12-18","2019-12-18","","-","1");
INSERT INTO tbl_surat_keluar VALUES("571","406","Darius Bastianus ","B/406/XII/Ka/BU.02.01/2019/BNNP-NTB","Surat izin cuti tahunan ","Biasa","2019-12-19","2019-12-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("572","407","Andreas Kiik ","B/407/XII/Ka/BU.02.1/2019/BNNP-NTB","Surat ijin cuti tahunan ","Biasa","2019-12-18","2019-12-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("573","408","FX Charlie gustaf N","B/408/XII/Ka/BU.02.01/2019/BNNP-NTB","Surat izin cuti tahunan ","Biasa","2019-12-18","2019-12-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("574","467","Anang Thoha Mislahhudin, SH","Sprin/467/XII/Ka/CM.00.02/2019/BNNP-NTB","Tugas menjadi narasumber ","Sprin","2019-12-19","2019-12-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("575","409","Fery Prianto , S. Sos","SPP/409/XII/BU.02.01/2019/BNNP-NTB","Surat pernyataan pelantikan","Biasa","2019-12-19","2019-12-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("576","468","Daftar terlampir","Sprin/468/XII/Ka/CM.00/2019/BNNP-NTB","Tugas sebgai peserta kegiatan 
Minggu  22 Desember 2019
Desa Taman Ayu ","Sprin","2019-12-20","2019-12-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("577","473","Daftar terlampir","Sprin/473/XII/Ka/PB.00.00/2019/BNNP-NTB","Berkoordinasi dan bekerja sama dengan pihak lapas mataram II","Sprin","2019-12-30","2019-12-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("578","410","SESTAMA","B/410/XII/Ka/BU.02.01/2019/BNNP-NTB","Laporan pelantikan ","Biasa","2019-12-23","2020-01-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("579","1","Anang Thoha Mislahhudin, SH","Sprin/01/I/Ka/CM.00.02/20020","Menjadi narasumber di Masjid nurul falah
hari Kamis 02 Januari 2020","Sprin","2020-01-02","2020-01-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("580","1","Balai Laboratorium BNN RI","B/1/Ka/BU.02.01/2020/BNNP-NTB","Bahan informasi terkait pembentukan ZONA INTEGRITAS (ZI) menuju WBK dan WBBM","Biasa","2020-01-02","2020-01-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("581","1","SOVIARINI AGUSTINA","KEP/1/I/Ka/BU.02.01/2020/BNNP-NTB","Penunjukan pengangkatan bendahara pengeluaran anggaran pendapatan dan belanja negara ","SE/SKEP","2020-01-02","2020-01-02","","-","1");
INSERT INTO tbl_surat_keluar VALUES("582","2","Daftar terlampir","KEP/02/I/KA/BU.02.01/2020/BNNP-NTB","Penunjukan dan pengangkatan pejabat dan staf pengelola anggaran pendapatan dan belanja negara","SE/SKEP","2020-01-02","2020-01-03","","ADMIN","1");
INSERT INTO tbl_surat_keluar VALUES("583","3","Daftar terlampir","KEP/3/I/KA/BU.02.01/2019/BNNP-NTB","Penunjukan dan pengangkatan pengelola unit akuntansi kuasa pengguna anggaran dan barang (UAKPA/B)","SE/SKEP","2020-01-02","2020-01-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("584","4","Adi setiyo P","KEP/04/I/KA/BU.02.01/2020/BNNP-NTB","Penunjukan pejabat pengadaan barang dan jasa BNNP NTB","SE/SKEP","2020-01-02","2020-01-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("585","5","Daftar terlampir","KEP/05/I/KA/BU.02.01/2020/BNNP-NTB","Pengangkatan tenaga kointrak (TKK) pada BNNP NTB","SE/SKEP","2020-01-02","2020-01-03","","admin","1");
INSERT INTO tbl_surat_keluar VALUES("586","412","Adi setiyo P","SC/3/I/Ka/BU.02.01/2019/BNNP-NTB","Surat Permintaan dan pemberian cuti","Biasa","2019-12-31","2020-01-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("587","414","Rr.Sri Julistyawati HP","SC/4/I/Ka/BU.02.01/2019/BNNP-NTB","Surat permintaan dan pemberian cuti","Biasa","2019-12-31","2020-01-03","","-","1");
INSERT INTO tbl_surat_keluar VALUES("588","109","Penyidik sat res narkoba polres LOTENG","R/109/XII/KA/RH.00.00/2020/BNNP-NTB","Rekomendasi rehabilitasi an doriman","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("589","110","Penyidik sat res narkoba polres LOTENG","R/110/XII/KA/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an SAMSUL HUSNA","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("590","111","penyidik /jaksa penuntut umum","R/111/XII/KA/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Ari wibowo","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("591","112","penyidik /jaksa penuntut umum","R/112/XII/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an M.Hilman Assry","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("592","113","Penyidik sat res narkoba polres LOTENG","R/113/XII/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Edi harianto","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("593","114","Penyidik sat res narkoba polres Mataram","R/114/XII/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Habib Maulana Ahsan ","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("594","115","Penyidik sat res narkoba polres Mataram","R/115/XII/Ka/RH.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Vicha Avicha Susanto","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("595","116","Penyidik sat res narkoba polres Mataram","R/116/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Sarifudin","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("596","117","Penyidik sat res narkoba polres Mataram","R/117/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Nurzaman","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("597","118","penyidik /jaksa penuntut umum","R/118/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an M.Zainudin Abdul Mazid ","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("598","119","Penyidik sat res narkoba polres Mataram","R/119/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Firmansyah ","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("599","120","Penyidik sat res narkoba polres Mataram","R/120/XII/Ka/Rh.00.00/2019/BNNP-NTB","Rekomendasi rehabilitasi an Muh Seriswati","Rahasia","2019-12-31","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("600","3","KPPN","B/3/I/BU.02.02/2020/BNNP-NTB","Permohonan Konfirmasi Setoran Penerimaan Negara","Biasa","2020-01-06","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("601","4","Daftar terlampir","B/4/I/Ka/RH.00.00/2020/BNNP-NTB","Permohonan Penunjukan Anggaota TAT TA 2020","Biasa","2020-01-06","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("603","5","Kepala Desa Midang","B/5/I/Ka/RH.01.02/2020/BNNP-NTB","Permintaan Nama Petugas Agen Pemulihan ","Biasa","2020-01-06","2020-01-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("604","6","Lurah Pagutan Timur ","B/6/I/Ka/RH.01.02/2020/BNNP-NTB","Permintaan Nama Petugas Agen Pemulihan ","Biasa","2020-01-06","2020-01-06","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("605","7","GUBERNUR NTB","B/7/I/Ka/BU.02.01/2020/BNNP-NTB","Permohonan ASN di pekerjakan pada BNNP NTB","Biasa","2020-01-06","2020-01-07","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("606","8","kepala KPPN Mataram","B/8/I/Ka/BU.02.02/2020/BNNP-NTB","Penunjukan Petugas Pengantar SPM /Pengambil SP2D Satuan Kerja","Biasa","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("607","9","Kepala BNN Kab/Kota","B/9/I/Ka/BU.02.01/2020/BNNP-NTB","Penarikan pegawai dipekerjakan pada lingkungan BNN Kabupaten / Kota","Biasa","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("608","10","Fila Sofia, SE","PEMB/10/I/Ka/BU.02.01/2020/BNNP-NTB","Kenaikan Gaji Berkala","Biasa","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("609","11","Ayu Wardani, M.Psi","PEMB/11/I/Ka/BU.02.01/2020/BNNP-NTB","Kenaikan Gaji Berkala","Biasa","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("610","12","Ibnu Prijananda, SE","pemb/12/I/Ka/BU.02.01/2020/BNNP-NTB","Kenaikan Gaji berkala","Biasa","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("611","13","Budi endarto, S.Kep ","PEMB/13/I/Ka/BU.02.01/2020/BNNP-NTB","Kenaikan gaji berkala","Biasa","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("612","14","Asep Badarudin, S.Pd","PEMB/14/I/Ka/BU.02.01/2020/BNNP-NTB","Kenaikan Gaji Berkala","Biasa","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("613","1","BNN RI","R/1/I/Ka/CM.00.01/2020/BNNP-NTB","Laporan Hasil Tes Urine","Rahasia","2020-01-06","2020-01-07","","-","1");
INSERT INTO tbl_surat_keluar VALUES("614","15","Kapuslidatin","B/15/I/Ka/BU.02.01/2020/BNNP-NTB","Nama petugas SIN ","Biasa","2020-01-08","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("615","22","Kamariah, S.Adm","B/22/XI/Ka/BU.01.00/2019/BNNP-NTB","BA Pendistribusian Barang Drug Abuse Test","Berita Acara","2019-11-22","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("616","23","Kamariah, S.Adm","B/23/XI/Ka/BU.01.00/2019/BNNP-NTB","BA pendistribusian barang Drugs abuse test","Berita Acara","2019-11-08","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("617","24","Adi setiyo P","B/24/XII/Ka/BU.01.00/2019/BNNP-NTB","BA pendistribusian barang Drugs abuse test","Berita Acara","2019-12-27","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("618","2","Daftar terlampir","Sprin/2/I/Ka/BU.02.01/2020/BNNP-NTB","Melakukan peliputan tanggal 7 Januari 2020 di kantor pemda LOTENG ","Sprin","2020-01-08","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("619","6","Maudita Anggia Rahayu Suarta Putrsi","KEP/06/I/KA/BU.02.01/2020/BNNP-NTB","Pengangkatan tenaga kerja kontrak (TKK) pada BNNP NTB","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("620","7","Rendhika Permana, S.Kom","SPK/7/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("621","8","Anggraeni, SE","SPK/8/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("622","9","Masiah Ayu Cahyanti","SPK/9/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("623","10","Supardi","SPK/10/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("624","11","Muhammad Abdul Gofur","SPK/11/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("625","12","Rapi Mai Perdi","SPK/12/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("626","13","Abdul Azim","SPK/13/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("627","14","I Made Subagia Pande","SPK/14/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("628","15","Abdurahimin","SPK/15/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("629","16","L AGIF HAMDANI","SPK/16/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("630","17","Ahmad Yani","SPK/17/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("631","18","Angkat","SPK/18/I/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("632","19","Herwan Zohri","SPK/19/I/Ka/BU.02.01/2020/BNNP-NTB","Surat Perjanjian Kerja ","SE/SKEP","2020-01-02","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("633","16","GUBERNUR  NTB","B/16/I/Ka/BU.00.00/2020/BNNP-NTB","Pengajuan Proposal Hibah 2020 BNNP-NTB","Biasa","2020-01-09","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("634","17","Kepala BNN Kab/Kota","B/17/I/Ka/RH.00.00/2020/BNNP-NTB","Perpanjangan Perjanjian Kerja sama","Biasa","2020-01-08","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("635","18","Daftar terlampir","B/18/I/Ka/RH.00.00/2020/BNBP-NTB","Perpanjangan Perjanjian Kerja Sama ","Biasa","2020-01-08","2020-01-09","","-","1");
INSERT INTO tbl_surat_keluar VALUES("636","19","BANK NTB SYARIAH","B/19/I/Ka/BU.02.02/2020/BNNP-NTB","Permohonan penutupan rekening giro ","Biasa","2020-01-14","2020-01-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("637","20","Fabio testi Tidore","Sket/20/I/Ka/BU.02.01/2020/BNNP-NTB","Surat keterangan rekomendasi ","Biasa","2020-01-14","2020-01-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("638","21","POLDA NTB","B/21/I/Ka/Bu.02.05/2020/BNNP-NTB","Laporan hasil pelaksanaan tugas personel Polda NTB penugasan BNN Prov NTB","Biasa","2020-01-14","2020-01-14","","-","1");
INSERT INTO tbl_surat_keluar VALUES("639","1","Para pejabat Es.III dan Es.IV di lingk BNNP NTB","B/UND-I/Ka/BU.00.00/2020/BNNP-NTB","Undangan sinkronais data dlm rangka penyusunan LAKIP tingkat wilayah","Undangan","2020-01-14","2020-01-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("640","22","PT.Indonesia Power PLTU Jeranjang MOU","B/22/I/Ka/CM.00.02/2020/BNNP-NTB","Dukungan dan Kerjasama ","Biasa","2020-01-14","2020-01-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("641","23","-","B/23/I/Ka/CM.00.02/2020/BNNP-NTB","Koordinasi sinegritas Program P4GN ","Biasa","2020-01-14","2020-01-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("642","3","Datar terlampir ","Sprin/3/I/Ka/BU.02.01/2020/BNNP-NTB","Mlekaukan peliputan  kegiatan KA BNNP NTB sertijab KAPOLDA NTB","Sprin","2020-01-14","2020-01-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("643","27","dr Henny Anggraeni Lenap","KEP/27/Ka/RH.00/I/2020/BNNP-NTB","Penetapan penanggung jawab klinik pratama BNNP NTB TA 2020","SE/SKEP","2020-01-02","2020-01-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("644","28","Ns.Ni Made Arlanggawati, S.Kep","KEP/28/I/KA/RH.00.01/2020/BNNP-NTB","Petugas administrasi klinik BNNP NTB","SE/SKEP","2020-01-02","2020-01-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("645","24","DEKAN UNMUH MATARAM","B/24/I/Ka/BU.02.04/2020/BNNP-NTB","Persetujuan tempat magang ","Biasa","2020-01-15","2020-01-15","","-","1");
INSERT INTO tbl_surat_keluar VALUES("646","4","Tasripin Aks MH, Yoel Agus W, S.Psi, Fajrul Husni","Sprin/04/I/Ka/BU.02.01/2020/BNNP-NTB","melakukan koordinasi pengayaan informasi implementasi Zona Integritas di BNNP JATIM  tanggal 20 sd 22 Januari 2020","Sprin","2020-01-15","2020-01-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("647","5","Drs.Gede Sugianyar Dwi Putra, SH.Msi, FX Charlie Gustaf Nurak, Ahmad Muhajir, S.Pd","Sprin/05/I/Ka/BU.02.01/2020/BNNP-NTB","Koordinasi implementasi Zona Integritas di JATIM tanggal 20 sd 21 januari 2020","Sprin","2020-01-15","2020-01-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("648","6","Drs.Nur Rahmat , Apt, FX Charlie Gustaf Nurak, Ahmad Muhajir ","Sprin/6/I/Ka/BU.02.01/2020/BNNP-NTB","Koordinasi pengayaan informasi terkait pelaksanaan rehabilitasi di kalimantan timur tanggal 22 sd 24 januari 2020","Sprin","2020-01-15","2020-01-16","","-","1");
INSERT INTO tbl_surat_keluar VALUES("649","7","Anggraini Ninik M, SH.MH","Sprin/7/I/Ka/CM.00.02/2020/BNNP-NTB","Menjadi narasumber tanggal 14 januari 2020
di MTS MA Darul Abidin Lendang are","Sprin","2020-01-17","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("650","8","Lily Wahyuni,A.Md, Farm, Lalu Adryan Saputra","Sprin/8/I/Ka/BU.01.02/2020/BNNP-NTB","Melaksanakan pemetaan dalam rangka mendukung program pascarehabilitasi tanggal 22 januari 2020","Sprin","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("651","9","Lily Wahyuni,A.Md, Farm Lalu adryan saputra","Sprin/9/Ka/RH.01.02/2019/BNNP-NTB","Melaksanakan pemetaan dalam rangka mendukung program pascarehabilitasi tanggal 21 januari 2020","Sprin","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("652","10","Lily Wahyuni,A.Md, Farm Lalu adryan saputra","Sprin/I/Ka/RH.01.00/2019/BNNP-NTB","Melaksanakan pemetaan dalam rangka mendukung program pascarehabilitasi tanggal 16 januari 2020","Sprin","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("653","11","Lily Wahyuni,A.Md, Farm lalu adryan saputra","Sprin/11/I/Ka/RH.01.02/2020/BNNP-NTB","Melaksanakan pemetaan dalam rangka ","Sprin","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("654","1","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/1/I/KA/BU.02.01/2019/BNNP-NTB","Melakukan koordinasi pelaksanaan rehabilitasi di balai rehabilitasi tanah merah kalimantan timur ","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("655","2","FX Charlie gustaf N","SPPD/2/I/KA/BU.02.01/2020/BNNP-NTB","Melakukan koordinasi pelaksanaan rehabilitasi dibalai rehabilitasi Tanah merah kaltim","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("656","3","AHMAD MUHAJIR","SPPD/3/I/KA/BU.02.01/2020/BNNP-NTB","Melakukan koordinasi pelaksanaan rehabilitasi dibalai rehabilitasi Tanah merah kaltim","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("657","4","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/4/I/KA/BU.02.01/2019/BNNP-NTB","Melakukan koordinasi pengayaan informasi implementasi zona integritas","SPPD","2020-01-15","2020-01-17","","---","1");
INSERT INTO tbl_surat_keluar VALUES("658","5","FX Charlie gustaf N","SPPD//I/KA/BU.02.01/2019/BNNP-NTB","Melakukan koordinasi pengayaan informasi implementasi Zona Integritasi di BNNP JATIM","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("659","6","AHMAD MUHAJIR","SPPD/6/I/KA/BU.02.01/2020/BNNP-NTB","Melakukan koordinasi pengayaan informasi implementasi Zona Integritasi di BNNP JATIM","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("660","7","Tasripin Aks MH","SPPD/7/I/KA/BU.02.01/2019/BNNP-NTB","Melakukan koordinasi pengayaan informasi implementasi Zona Integritasi di BNNP JATIM","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("661","8","Yoel Agus W","SPPD/8/I/KA/BU.02.01/2019/BNNP-NTB","Melakukan koordinasi pengayaan informasi implementasi Zona Integritasi di BNNP JATIM","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("662","9","Fajrul husni SE","SPPD/9/I/KA/BU.02.01/2020/BNNP-NTB","Melakukan koordinasi pengayaan informasi implementasi Zona Integritasi di BNNP JATIM","SPPD","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("663","25","SESTAMA BNN","B/25/I/Ka/BU.02.01/2020/BNNP-NTB","Permohonan persetujuan pengangkatan dalam jabatan pegawai DPK di lingk BNNK sumbawa ","Biasa","2020-01-15","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("664","12","Drs.Nur Rahmat , Apt","Sprin/12/I/Ka/CM.00.02/2020/BNNP-NTB","menjadi narasumber pada kegiatan sosialisasi p4gn 
di desa gelogor ","Sprin","2020-01-17","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("665","13","Daftar terlampir","Sprin/13/I/Ka/Cm.00.02/2020/BNN-NTB","sebagai panitia insert konten di desa gelogor ","Sprin","2020-01-17","2020-01-17","","-","1");
INSERT INTO tbl_surat_keluar VALUES("666","19","Daftar terlampir","Sprin/14/II/Ka/RH.00.00/2020/BNNP-NTB","Mengikuti kegiatan sosialisasi bahaya narkoba pemulihan berbasis  masyarakat (PBM) 
selasa 21 januari 2020","Sprin","2020-01-20","2020-01-20","","-","1");
INSERT INTO tbl_surat_keluar VALUES("667","26","booking  sofi","20","-","Biasa","2020-01-20","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("668","18","Drs.Nur Rahmat , Apt","Sprin/18/I/KA/BU.02.01/2020/BNNP-NTB","melaksanakan tugas sebagai PLH kepala BNNP NTB","Sprin","2020-01-18","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("669","20","Drs.Nur Rahmat , Apt Irfan, S.Sos ","Sprin/20/I/Ka/CM.00.02/2020/BNNP-NTB","menjadi narasumber pada kegiatan sosialisasi P4GN di selasa 21 Januari 2020
aruna senggigi resort ","Sprin","2020-01-20","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("670","21","LALU TRESNA JAYA, S.Sos","Sprin/21/I/Ka/CM.01.01/2020/BNNP-NTB ","Tugas sebagai pemetaan pada kegiatan pemetaan pada kegiatan pemetaan kawasan rawan narkoba 
di BNNK BIMA hari rabu sd kamis ","Sprin","2020-01-20","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("671","22","Daftar terlampir","Sprin/22/I/Ka/CM.01.00/2019/BNNP-NTB","Tugas sebagai petugas kegiatan test urine 
di kantor PT UDAYANA PUTRA ","Sprin","2020-01-20","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("672","23","Daftar terlampir","Sprin/23/I/Ka/CM.01.00/2020/BNNP-NTB","petugas kegiatan tes urine yang dilaksanakan di kantor PT ABADI CITRA BERSAMA Kamis 23 Januari 2020","Sprin","2020-01-20","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("673","10","L Tresna jaya S.Sos","Sprin/10/I/Ka/CM.01.01/2020/BNNP-NTB","Pemetaan kawasan rawan narkoba perkotaan pendesaan di BNNK BIMA ","SPPD","2020-01-20","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("674","28","BLK PROV NTB ","B/28/I/Ka/ RH.01.02/2020/BNNP-NTB","Permohonan bantuan pelatihan teknisi AC bagi mantan penyalahguna ","Biasa","2020-01-21","2020-01-21","","-","1");
INSERT INTO tbl_surat_keluar VALUES("675","24","Irfan, S.Sos","Sprin/24/I/Ka/CM.00.00/2020/BNNP-NTB","Melaksanakan tugas sebagai narasumber di aula kantor desa sukanda 
kamis 23 januari 2020","Sprin","2020-01-21","2020-01-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("676","29","BLK PROV NTB ","B/29/I/Ka/RH.00.06/2020/BNNP-NTB","Surat pengantar proposal ","Biasa","2020-01-21","2020-01-22","","-","1");
INSERT INTO tbl_surat_keluar VALUES("677","25","Sri Rohayati, Apt., MPH-ATOD, LM Desrial Fahroza , S.Psi.Msi","Sprin/25/I/Ka/RH.00.00/2020/BNNP-NTB","Melaksanakan SIL di Kamis sd Rabu 23 sd 29 Januari ","Sprin","2020-01-22","2020-01-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("678","31","Kepala sekolan SMP sederajad","B/31/I/Ka/RH.00.00/2020/BNNP-NTB","Permohonan kegiatan skrining intervensi lapangan ","Biasa","2020-01-22","2020-01-23","","-","1");
INSERT INTO tbl_surat_keluar VALUES("679","32","PUSLIDATIN","B/32/I/Ka/BU.00.02/2020/BNNP-NTB","Inventarisasi aplikasi di lingkungan BNNP NTB","Biasa","2020-01-23","2020-01-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("680","33","UNMUH MATARAM","B/33/I/Ka/BU.02.04/2020/BNNP-NTB","Permohonan magang ","Biasa","2020-01-24","2020-01-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("681","34","Kabag TU Biro Umum Settama BNN RI","Speng/34/I/Ku/BU.02.01/2020/BNNP-NTB","Surat pengantar hasil audit kerasipan internal","Biasa","2020-01-23","2020-01-24","","-","1");
INSERT INTO tbl_surat_keluar VALUES("682","11","Irfan, S.Sos","SPD/11/I/Ka/CM.00.01/2020/BNNP-NTB","Koordinasi dalam rangka pelaksanaan advokasi pembangunan berwawasan anti narkoba ke instansi terkait","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("683","12","Drs.H. Nu rachmat, Apt.","SPD/12/I/Ka/CM.00.01/2020/BNNP-NTB","Koordinasi dalam rangka pelaksanaan advokasi pembangunan berwawasan anti narkoba ke instansi terkait","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("684","26","Drs.H. Nu rachmat, Apt. Irfan, S.Sos ","Sprin/26/I/Ka/CM.00.01/2020/BNNP-NTB","Koordinasi dalam rangka pelaksanaan advokasi pembangunan berwawasan anti narkoba ke instansi terkait","Sprin","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("685","27","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/27/I/Ka/2020/BNNP-NTB","Mengikuti Rapim di Denpasar Bali tanggal 27 sd 30 Jnuari 2020","Sprin","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("686","13","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPPD/13/I/Ka/BU.02.01/2020/BNNP-NTB","Mengikuti Rapim Tahun 2020","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("687","14","Rapi mai ferdi","SPPD/14/I/KA/BU.02.01/2020/BNNP-NTB","Mendampingi bapak ka BNNP NTB Tahun 2020 di bali ","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("688","15","AHMAD MUHAJIR","SPPD/15/I/KA/BU.02.01/2020/BNNP-NTB","Mendampingi bapak ka BNNP NTB Tahun 2020 di bali ","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("689","16","BUDI KURNIAWAN ","SPPD/16/I/KA/BU.02.01/2020/BNNP-NTB","Mendampingi bapak ka BNNP NTB Tahun 2020 di bali ","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("690","28","Rapi mai ferdi, Ahmad Muhajir , Budi Kurniawan ","Sprin/28/I/Ka/BU.02.01/2020/BNNP-NTB","Mendampingi bapak ka BNNP NTB Tahun 2020 di bali ","Sprin","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("691","29","Tasripin Aks MH","Sprin/29/I/BU.02.01/2020/BNNPNTB","Menjadi PLH Ka BNNP-NTB dari tanggal 28 sd 30 Januari 2020","Sprin","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("692","17","DENNY PRIADI, S.Sos","SPPD/17/I/KA/BU.02.01/2020/BNNP-NTB","Melaksanakan penyelidikan ","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("693","18","PILZATUN ZAHRINA"," SPD/18/I/Ka/PB.00/2020/BNNP-NTB","Melaksanakan penyelidikan ","SPPD","2020-01-27","2020-01-27","","-","1");
INSERT INTO tbl_surat_keluar VALUES("694","14","Adi setiyo P","Sprin/14/I/Ka/CM.00.02/2020/BNNP-NTB","menjadi narasumber di mushola nurul yakin 
kamis 16  januari 2020","Sprin","2020-01-17","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("695","15","Drs.Nur Rahmat , Apt Anang thoha mislahudin, SH ","Sprin/15/I/Ka/Cm.00.02/2020/BNNP-NTB","menjadi narasumber di masjid AL-Hidayah kamis 16 Januari 2020","Sprin","2020-01-17","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("696","16","Irfan, S.Sos","Sprin/16/I/Ka/CM.00.02/2020/BNNP-NTB","Menjadi narasumber di aula kantor desa terong tawah ","Sprin","2020-01-17","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("697","35","Ketua Aksi NTB , Lentera, Rumah Rehab ","B/35/I/Ka/RH.00.00/2020/BNNP-NTB ","Perpanjang Perjanjian Kerja Sama ","Biasa","2020-01-20","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("698","30","Daftar terlampir","Sprin/30/I/Ka/RH.00.01/2020/BNNP-NTB","Melakukan TAT tsk an Haris munandar ","Sprin","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("699","31","Daftar terlampir","Sprin/31/I/Ka/RH.00.01/2020/BNNP-NTB ","Melakukan TAT an Rahmat Tegriawan ","Sprin","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("700","32","Daftar terlampir ","Sprin/32/I/Ka/RH.00.01/2020/BNNP-NTB ","Melakukan TAT an Saoki Febrian ","Sprin","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("701","33","Daftar terlampir","Sprin/33/I/Ka/RH.00.01/2020/BNNP-NTB ","Melakukan Assesment Medis TAT am Muhammad Safari","Sprin","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("702","34","Daftar terlampir","Sprin/34/I/Ka/RH.00.01/2020/BNNP-NTB ","Melakukan Assesment medis TAT an Shanan ","Sprin","2020-01-28","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("703","36","Kapolda NTB","B/36/I/Ka/RH.00.01/2020/BNNP-NTB ","Pelakasanaan Assesment Penyalah guna Narkoba","Biasa","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("704","37","KAPOLRES KLU","B/37/I/Ka/RH.00.01/2020/BNNP-NTB ","Pelakasanaan Assesment Penyalah guna Narkoba","Biasa","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("705","38","KAPOLRES KLU","B/38/I/Ka/RH.00.01/2020/BNNP-NTB","Pelakasanaan Assesment Penyalah guna Narkoba","Biasa","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("706","39","KAPOLRES LOBAR","B/39/I/Ka/RH.00.01/2020/BNNP-NTB ","Pelakasanaan Assesment Penyalah guna Narkoba","Biasa","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("707","40","KAPOLRES LOBAR","B/40/I/Ka/RH.00.01/2020/BNNP-NTB ","Pelakasanaan Assesment Penyalah guna Narkoba","Biasa","2020-01-27","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("708","29","Daftar terlampir","KEP/29/I/KA/RH.00/2020/BNNP-NTB","Penetapan team assesment terpadu di lingkungan BNNP NTB ","SE/SKEP","2020-01-02","2020-01-28","","-","1");
INSERT INTO tbl_surat_keluar VALUES("709","35","Sri Rohayati, Apt., MPH-ATOD ","Sprin/35/I/Ka/RH.00.00/2020/BNNP-NTB ","Menjadi narasumber kegiatan sosialisasi bahaya narkoba 
SMK AL-ABSOR PANTI Rabu 29 Januari 2020","Sprin","2020-01-28","2020-01-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("710","36","Sri Rohayati, Apt., MPH-ATOD ","Sprin/36/I/Ka/RH.00/2020/BNN-NTB ","Mengikuti kegiatan workshop layanan rehabilitasi rawat inap
di Lido Bogor 7 sd 12","Sprin","2020-01-28","2020-01-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("711","37","Sri Rohayati, Apt., MPH-ATOD ","Sprin/37/I/Ka/RH.00.00/2020/BNNP-NTB","Mengikuti BIMTEK bagi pelaksana tugas rehabilitasi 
di Lido Bogor tanggal 4 sd 6 Februari di Balai Besar Rehabilitasi ","Sprin","2020-01-28","2020-01-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("712","30","Daftar terlampir","KEP/30/I/Ka/RH.00/2020/BNNP-NTB ","PENETAPAN PETUGAS INTERVENSI BERBASIS MASYARAKAT (IBM)","SE/SKEP","2020-01-09","2020-01-29","","Rehab ","1");
INSERT INTO tbl_surat_keluar VALUES("713","31","Daftar terlampir","KEP/31/I/KA/RH.00/2020/BNNP-NTB ","PEMETAAN OLEH KADER DI WILAYAH PEMULIHAN BERBASIS MASYARAKAT","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("714","32","Daftar terlampir","KEP/32/I/Ka/RH.00.00/2020/BNNP-NTB ","Rujukan oleh kader wilayah pemulihan berbasis masyarakat ","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("715","33","Daftar terlampir","KEP/33/I/KA/RH.00.00/2020/BNNP-NTB ","Pengajuan oleh kader di wilayah pemulihan berbasis masyarakat","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("716","34","Daftar terlampir","KEP/34/I/KA/RH.00/2020/BNNP-NTB ","Pemberian informasi dan edukasi oleh kader di wilayah pemulihan berbasis masyarakat ","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("717","35","Daftar terlampir","KEP/35/I/KA/RH.00/2020/BNNP-NTB ","Penetapan petugas intervensi berbasis masyarakat ","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("718","36","Daftar terlampir","KEP/36/I/KA/RH.00.00/2020/BNNP-NTB ","Pemetaaan oleh kader wilayah pemulihan berbasis masyarakat ","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("719","37","Daftar terlampir","KEP/37/I/KA/RH.00/2020/BNNP-NTB","Pemberian informasi dan edukasi oleh kader di wilayah pemulihan berbasis masyarakat","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("720","38","Daftar terlampir","KEP/38/I/KA/RH.00/2020/BNNP-NTB ","Penjangkauan  oleh kader di wilayah pemulihan berbasis masyarakat
","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("721","39","Daftar terlampir","KEP/39/I/KA/RH.00/2020/BNNP-NTB ","Rujukan oleh kader wilayah pemulihan berbasis masyarakat","SE/SKEP","2020-01-09","2020-01-29","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("722","38","Asep Badarudin, S.Pd","Sprin/38/I/Ka/CM.00/2020/BNNP-NTB ","Melaksanakan tugas sosialisasi pencegahan dan pemberantasan penyalahgunaan narkoba Aula kantor desa batujai ","Sprin","2020-01-29","2020-01-29","","-","1");
INSERT INTO tbl_surat_keluar VALUES("723","41","BPKAD PROV NTB","B/41/I/KU/BU.02.02/2020/BNNP-NTB","Laporan Pertanggung jawab pengguna dana Hibah BNNP NTB TA 2019","Biasa","2020-01-30","2020-01-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("724","39","Daftar terlampir","Sprin/39/I/Ka/CM.0001/2020/BNNP-NTB ","melaksanakan tugas sebagai narasumber dan sosialisasi mobil keliling ","Sprin","2020-01-30","2020-01-30","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("725","40","Daftar terlampir","Sprin/40/I/Ka/CM.01.00/2020/BNNP-NTB ","Menjadi petugas tes urine di kantor Harian Suara NTB 
Kamis 30 Januari 2020","Sprin","2020-01-30","2020-01-30","","-","1");
INSERT INTO tbl_surat_keluar VALUES("726","41","Drs.Gede Sugianyar Dwi Putra, SH.Msi","Sprin/41/I/Ka/BU.02.01/2020/BNNP-NTB ","Menhadiri acara bimtek TPPU Tahun 2020","Sprin","2020-01-30","2020-01-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("727","19","Drs.Gede Sugianyar Dwi Putra, SH.Msi","SPD/19/I/Ka/BU.02.01/2020/BNNP-NTB ","Menghadiri BIMTEK TPPU ","SPPD","2020-01-30","2020-01-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("728","42","Tasripin Aks MH, Ratna Noerbani, A.Md","Sprin/42/I/Ka/BU.02.02/2020/BNNP-NTB","menghadiri undangan sinkronisasi penyusunan LKIP Pusat dan Daerah ","Sprin","2020-01-31","2020-01-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("729","20","Ratna Noerbani, A.Md","SPPD/20/I/KA/BU.02.01/2020/BNNP-NTB","Menghadiri undangan sinkronisasi penyusunan LAKIP Pusat dan Daerah","SPPD","2020-01-31","2020-01-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("730","21","Tasripin Aks MH","SPPD/21/I/KA/BU.02.01/2020/BNNP-NTB","Menghadiri undangan sinkronisasi penyusunan LAKIP Pusat dan daerah Tahun 2020","SPPD","2020-01-31","2020-01-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("731","43","Syaripudin S.ST","Sprin/43/II/Ka/BU.02.01/2020/BNNP-NTB","tugas sebagai PLH kepala bagian umum ","Sprin","2020-01-31","2020-01-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("732","44","Drs.Nur Rahmat , Apt","Sprin/44/I/Ka/BU.02.01/2020/BNNP-NTB","Tugas sebagai PLH Ka BNNP NTB ","Sprin","2020-01-31","2020-01-31","","-","1");
INSERT INTO tbl_surat_keluar VALUES("733","45","Lalu Muh Desrial Fahroza S Psi M Si ","Sprin/45/I/Ka/RH.00.00/2020/BNNP-NTB ","Melaksanakan kegiatan koordinasi dengan RSUD dr R Soedjono Selong terkait perpanjangan PKS ","Sprin","2020-02-03","2020-02-03","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("734","2","Daftar terlampir","B-UND/2/II/Ka/RH./2020/BNNP-NTB ","Undangan rapat koordinasi intervensi berbasis masyarakat IBM layanan pascarehabilitasi","Undangan","2020-02-06","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("735","46","Daftar terlampir","Sprin/46/II/Ka/RH.01.02/2020/BNNP-NTB ","menjadi narasumber pada kegiatan rapat koordinasi intervensi berbasis masyarakat IBM","Sprin","2020-02-04","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("736","47","FX Charlie gustaf N","Sprin/47/II/Ka/BU.02.01/2020/BNNP-NTB ","Sebagai peserta BIMTEK PPID OPD kamis 6 Februari 2020","Sprin","2020-02-05","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("737","48","Daftar terlampir","Sprin/48/II/Ka/BU.02.01/2020/BNNP-NTB ","sebagai tugas peliputan kegiatan P2M BNNP NTB dalam rangka narasumber acara penanggulangan bahaya narkoba ","Sprin","2020-02-05","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("738","49","Irfan, S.Sos","Sprin/49/II/Ka/CM.00.00/2020/BNNP-NTB ","Melaksanakan tugas sebagai peserta pada kegiatan ","Sprin","2020-02-05","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("739","50","Syaripudin S.ST","Sprin/50/II/Ka/BU.01.00/2020/BNNP-NTB ","Melaksanakan rekonsiliasi laporan BMN ke kanwil Prov NTB ","Sprin","2020-02-05","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("740","22","Syaripudin S.ST","SPPD/22/II/KA/BU.02.01/2020/BNNP-NTB","Dalam rangka penyusunan dan penyampaian laporan barang pengguna wilayah semster I TA 2020","SPPD","2020-02-06","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("741","23","Muhammad subkhan, A Md","SPPD/23/II/KA/BU.02.01/2020/BNNP-NTB","Dalam rangka penyusunan dan penyampaian laporan barang pengguna wilayah semster I TA 2020
","SPPD","2020-02-06","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("742","42","Kepala DINKES PROV NTB ","B/42/I/Ka/RH.00.00/2020/BNNP-NTB ","Dorongan Pengaktifkan layanan rehabilitasi di puskesmas ","Biasa","2020-01-30","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("743","43","GUBERNUR  NTB","B/43/I/Ka/RH.00.00/2020/BNNP-NTB ","Dorongan penambahan kapasitas rawat inap napza ","Biasa","2020-01-30","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("744","44","Yoel Agus W, S.Psi ","SC/44/I/Ka/BU.02.01/2020/BNNP-NTB ","Surat permintaan dan pemberian cuti ","Biasa","2020-01-30","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("745","40","Daftar terlampir","KEP/40/Ka/RH.00/I/2020/BNNP-NTB ","Penetapan petugas intervensi berbasis masyarakat IBM kelurahan tiwu galih tahun 2020","SE/SKEP","2020-02-03","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("746","45","Rr.Sri Julistyawati HP","SC/45/I/Ka/BU.02.01/2020/BNNP-NTB ","Permohonan Cuti ","Biasa","2020-01-30","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("747","41","Daftar terlampir","KEP/41/Ka/RH.00/I/2020/BNNP-NTB ","Penetapan petugas intervensi berbasis masyarakat IBM sebagai agen perubahan ","SE/SKEP","2020-02-03","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("748","24","SOVIARINI AGUSTINA","SPPD/24/II/KA/BU.02.01/2019/BNNP-NTB","Mengikuti kegiatan penyusunan laporan keuangan ","SPPD","2020-02-06","2020-02-06","","-","1");
INSERT INTO tbl_surat_keluar VALUES("749","42","Daftar terlampir","KEP/42/I/RH.00/2020/BNNP-NTB","Penetapan petugas intervensi berbasis masyarakat (IBM) kelurahan turida tahun 2020","SE/SKEP","2020-02-03","2020-02-10","","-","1");
INSERT INTO tbl_surat_keluar VALUES("750","25","Tasripin Aks MH, Drs Nur Rachmat Apt ","BA/25/XII/Ka/BU.02.01/2020/BNNP-NTB ","BA Pengambilan sumpah pegawai negri sipil ","Berita Acara","2019-08-19","2020-02-10","","-","1");
INSERT INTO tbl_surat_keluar VALUES("751","51","Daftar terlampir","Sprin/51/II/Ka/RH.01.02/2020/BNNP-NTB ","MENJADI NARASUMBER KEGIATAN PENINGKATAN KEMAMPUAN PETUGAS PASCAREHABILITASI ","Sprin","2020-02-10","2020-02-11","","-","1");
INSERT INTO tbl_surat_keluar VALUES("752","52","Daftar terlampir","Sprin/52/II/Ka/RH.01.02/2020/BNNP-NTB ","menjadi peserta aktif pada kegiatan pembekalan sebagai agen pemulihan layanan pascarehabilitasi ","Sprin","2020-02-10","2020-02-11","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("753","53","Daftar terlampir","Sprin/53/II/Ka/RH.01.00/2020/BNNP-NTB ","Menjadi peserta aktif ekgiatan rakor program intervensi berbasis masyarakat ","Sprin","2020-02-10","2020-02-11","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("754","3","Daftar terlampir","Sprin/3/II/Ka/ RH.01.02/2020/BNNP-NTB ","Undangan peserta pembekalan agen pemulihan ","Undangan","2020-02-10","2020-02-11","","Rehab","1");
INSERT INTO tbl_surat_keluar VALUES("755","46","Bupati LOBAR","B/46/II/Ka/CM.01.00/2020/BNNP-NTB","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR ","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("756","47","Kepala KESBANGPOL LOBAR ","B/47/II/Ka/CM.01.00/2020/BNNPNTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("757","48","KAPOLRES LOBAR ","B/48/II/Ka/CM.01.00/2020/BNNP-NTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("758","49","KODIM 1606 LOBAR","B/49/II/Ka/CM.01.00/2020/BNNP-NTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("759","50","DEKRANASADA LOBAR","B/50/II/Ka/CM.01.00/2020/BNNP-NTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("760","51","CAMAT BATULAYAR","B/51/II/Ka/CM.01.00/2020/BNNP-NTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("761","52","KADES SENGGIGI","B/52/II/Ka/CM.01.00/2020/BNNP-NTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("762","53","DINAS KOPERASI","B/53/II/Ka/CM.01.00/2020/BNNP-NTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("763","54","KADIN LOBAR","B/54/II/Ka/CM.01.00/2020/BNNP-NTB","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");
INSERT INTO tbl_surat_keluar VALUES("764","55","KAPOLSEK SENGGIGI ","B/55/II/Ka/CM.01.02/2020/BNNP-NTB ","Audiensi pemetaan potensi pada kawasan rawan dan rentan narkoba di kab LOBAR
","Biasa","2020-02-10","2020-02-11","","p2m","1");



DROP TABLE tbl_surat_masuk;

CREATE TABLE `tbl_surat_masuk` (
  `id_surat` int(10) NOT NULL AUTO_INCREMENT,
  `no_agenda` int(10) NOT NULL,
  `no_surat` varchar(50) NOT NULL,
  `asal_surat` varchar(250) NOT NULL,
  `isi` mediumtext NOT NULL,
  `kode` varchar(30) NOT NULL,
  `indeks` varchar(30) NOT NULL,
  `tgl_surat` date NOT NULL,
  `tgl_diterima` date NOT NULL,
  `file` varchar(250) NOT NULL,
  `keterangan` varchar(250) NOT NULL,
  `disposisi` varchar(100) NOT NULL,
  `id_user` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=latin1;

INSERT INTO tbl_surat_masuk VALUES("46","288","B/123/VIII/Ka/SU.05/2019/BNNK SB","BNNK SUMBAWA","Mohon perekaman fingerprint untuk TKK pada BNNK Sumbawa","Biasa","-","2019-09-12","2019-09-12","","Yth.Kasubag Admin, Yth Kasubag Perencanaan ","Koordinasikan ke BNNK SUMBAWA","1");
INSERT INTO tbl_surat_masuk VALUES("47","289","B/129/IX/Ka/Su.05/2019/BNNKab","BNNK SUMBAWA","Permohonan akun  LHKASN","Biasa","Daftar nama ASN","2019-09-12","2019-09-12","","Yth.Kasubag admin","untuk kopelir dengan BNNK ","1");
INSERT INTO tbl_surat_masuk VALUES("48","290","841/UN31-UPBJI-29/PM-01-02-2019","UNIVERSITAS TERBUKA","Permohonan ijin untuk sosialisasi promosi universitas terbuka","Biasa","-","2019-09-12","2019-09-12","","Yth.Kasubag admin","Direncanakan kpn personil kita di kumpulkan","1");
INSERT INTO tbl_surat_masuk VALUES("49","291","IX/RBB/08/2019","GPAN TAMAN AYU NTB","Permohonan Bantuan dana","Biasa","proposal","2019-09-12","2019-09-12","","p2m","Yth.kabid p2m koordinasikan","1");
INSERT INTO tbl_surat_masuk VALUES("50","292","B/113/IX/Ka/Rh.06/2019/BNNkab","BNNK SUMBAWA","Dorongan usulan penetapan IPWL","Biasa","1","2019-09-12","2019-09-12","","rehabilitasi","Yth.Kabid rehabilitasi, ","1");
INSERT INTO tbl_surat_masuk VALUES("51","89","004/SATGAS-PRADIKSAR/MENWA-UIN/IX/2019","UIN MATARAM","Permohonan narasumber","Permohonan Narasumber","1","2019-09-12","2019-09-12","","p2m","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("52","90","B.0028/Pen.pEL/LCC.WTL/VIII/2019","LOMBOK Clouting Comunity","Permohonan audiensi dan silahturahmi","Permohonan Narasumber","1","2019-09-12","2019-09-12","","p2m","Yth.P2M , agar diterima audiensinya, malam bapak bisa hadiri","1");
INSERT INTO tbl_surat_masuk VALUES("53","91","01/E/klmpk35/kkn/ummat/IX/2019","Universitas muhammadyah mataram","Permohonan Pemateri","Permohonan Narasumber","1","2019-09-12","2019-09-12","","p2m","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("54","126","W21.UM.01.01-354","KANWIL NTB","Undangan rapat tim pengawasan orang asing tingkat wilayah BNNP NTB","Undangan","1","2019-09-12","2019-09-12","","berantas","Yth.Kabid Berantas, hadiri","1");
INSERT INTO tbl_surat_masuk VALUES("55","92","B/134/IX/Ka/Cm.01/2019/BNNK SB","BNN KABUPATEN SUMBAWA","Permohonan menjadi narasumber","Permohonan Narasumber","1","2019-09-12","2019-09-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("56","293","B/3266/IX/SU/PR.03.00./2019","BNN RI","Percepatan penyusunan RKA-K/L pagu alokasi anggaran BNN TA 2019
","Biasa","1","2019-09-12","2019-09-12","","semuA KABID","Yth.para kabid","1");
INSERT INTO tbl_surat_masuk VALUES("57","93","005/4557-GTK/DISDIKBUD/2019","DISDIKBUD","Permohonan narasumber
","Permohonan Narasumber","2","2019-09-13","2019-09-13","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("58","294","B/534/IX/2019/Res Mataram","POLRES MATARAM","pengajuan assesment penyalahguna narkotika","Biasa","1","2019-09-13","2019-09-13","","rehabilitasi","-yth.rehabilitasi, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("59","295","B/15/IX/2019/DENPOMAL","TNI AL MATARAM DENPOMAL","permohonan bantuan personel
","Biasa","-","2019-09-13","2019-09-13","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("60","127","-","KANWIL KEMENKUMHAM NTB","Undangan pembukaan lomba kadarkum tingkat prov ntb","Undangan","-","2019-09-13","2019-09-13","","PEMBERANTASAN","Yth.Kabid Berantas, hadiri","1");
INSERT INTO tbl_surat_masuk VALUES("61","128","--","GUBERNUR NTB","UNDANGAN OPENING CEREMONY FESTIVAL PESONA MOYO 2019","Undangan","-","2019-09-13","2019-09-13","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("63","129","B/3352/IX/RO/KP.09.11/2019/BNN","BNN RI","Undangan pembinaan jabatan fungsional","Undangan","4","2019-09-16","2019-09-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("64","296","B/3340/IX/DE/RH.00/2019/BNN","BNN RI","Penialaian instrumen standar rehabilitasi di klinik BNNP NTB
","Biasa","-","2019-09-17","2019-09-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("65","296","B/3340/IX/DE/RH.00/2019/BNN","BNN RI","Penialaian instrumen standar rehabilitasi di klinik BNNP NTB
","Biasa","-","2019-09-17","2019-09-17","","REHABILITASI","Yth.Kabid rehabilitasi, infokan ke ka bnnk mataram dan bima","1");
INSERT INTO tbl_surat_masuk VALUES("66","297","800.0/3104/BKD/2019","BKD","Pengukuran indeks profesionalisme ASN","Biasa","1 Gabung","2019-09-17","2019-09-17","","Yth.Kasubag admin","Penuhi dan data pegawai DPK","1");
INSERT INTO tbl_surat_masuk VALUES("67","297","800.0/3104/BKD/2019","BKD","Pengukuran indeks profesionalisme ASN","Biasa","1 Gabung","2019-09-17","2019-09-17","","kabag umum","Yth.Kabag umum untuk di bicarakan ke ka bnnp ntb","1");
INSERT INTO tbl_surat_masuk VALUES("69","94","035.PKC-IV.W-02.02.A-01.09.2019","  PENGGERAKAN MAHASISWA ISLAM INDONESIA","Permohonan menjadi narasumber","Permohonan Narasumber","-","2019-09-17","2019-09-17","","p2m","Yth.Kabid P2M, buk reni sebagai narasumber","1");
INSERT INTO tbl_surat_masuk VALUES("71","130","-","ASPERINDO","Undangan MUSWIL VI DPW ASPERINDO NTB
","Undangan","-","2019-09-18","2019-09-18","","sarpras","Yth.Kasubag Sarpras , Hadir mewakili ka BNNP NTB","1");
INSERT INTO tbl_surat_masuk VALUES("73","298","B/865/IX/Ka/SU.01/2019/BNNK-BIMA","BNN KAB BIMA","Permohonan alat rapid tes terhadap anggota DPRD","Biasa","-","2019-09-18","2019-09-18","","SARPRAS","YTH.Kasubag sarpras, Penuhi dan koordinaksikan biaya pengiriman ke BNNK BIMA","1");
INSERT INTO tbl_surat_masuk VALUES("74","299","B/866/IX/Ka/SU.01/2019/BNNK BIMA","BNNK BIMA","Permohonan Alat rapid tes untuk pengadilan tinngi dompu","Biasa","-","2019-09-18","2019-09-18","","SARPRAS","Yth.Kasubag sarpras, berika alat teskit 45 bapak sudah setuju","1");
INSERT INTO tbl_surat_masuk VALUES("77","300","B/864/IX/Ka/SU.01/2019/BNNK BIMA","BNNK BIMA","Mobil dinas operasional ","Biasa","-","2019-09-18","2019-09-18","","sarpras","yth.kasubag sarpras, nandi di bicarakan ke ka BNNP NTB","1");
INSERT INTO tbl_surat_masuk VALUES("78","301","Sprin/870/IX/KA/CM.00/2019/BNNK-BIMA","BNNK BIMA","Rekomendasi alih status Ardiansyah, SE.MM","Biasa","-","2019-09-18","2019-09-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("79","301","Sprin/870/IX/KA/CM.00/2019/BNNK-BIMA","BNNK BIMA","Rekomendasi alih status Ardiansyah, SE.MM","Biasa","-","2019-09-18","2019-09-18","","Kasubag Admin","Usulkan dan rwekomendasikan ke pusat","1");
INSERT INTO tbl_surat_masuk VALUES("80","131","B/4860/IX/2019/Dit lantas","POLDA","Mohon partisipasi","Undangan","-","2019-09-18","2019-09-18","","kasubag sarpras","Yth.Kasubag sarpras, mhon membuat karangan bunga","1");
INSERT INTO tbl_surat_masuk VALUES("83","95","004/Prm/OR-PIKM/PIKMCUNRAM","UNRAM","Permohonan pemateri","Permohonan Narasumber","2","2019-09-19","2019-09-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("84","95","004/Prm/OR-PIKM/PIKMCUNRAM","UNRAM","Permohonan pemateri","Permohonan Narasumber","2","2019-09-19","2019-09-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("87","132","005/769/DPRD.NTB","DPRD PROV NTB","Rapat paripurna ","Undangan","-","2019-09-19","2019-09-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("88","132","005/769/DPRD.NTB","DPRD PROV NTB","Rapat paripurna ","Undangan","-","2019-09-19","2019-09-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("90","133","009/AMSI.NTB/IX/2019","ASOSIASI MEDIA SIBER INDONESIA","Undangan pelantikan pengurus AMSI NTB","Undangan","1 PROPOSAL","2019-09-19","2019-09-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("91","134","-","POLDA NTB","Undangan HUT Lalu lintas Bhayangkara ke 64 ","Undangan","-","2019-09-20","2019-09-20","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("95","135","W21.EBM.UM.02.06-4013","BAPAS MATARAM","Permohonan Penyuluh untuk pasca Rehabilitasi","Undangan","-","2019-09-20","2019-09-20","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("96","302","B/3415/IX/RO/TU.02/2019/BNN","BNN RI","Ucapan terima kasih","Biasa","-","2019-09-24","2019-09-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("97","136","-","PONPES CENDEKIA NW","Undangan ULTAH KE 6 PONPES CENDEKIA DLM","Undangan","-","2019-09-27","2019-09-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("98","303","B/569/IX/Ka/2019/Sat Resnarkoba","POLRES MATARAM","Pengajuan assesment","Biasa","3 lembar pengajuan assesment ","2019-09-27","2019-09-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("99","304","B/861/IX/RES.4.2/2019","POLRES KLU","Permohonan team assesmen terpadu","Biasa","-","2019-09-27","2019-09-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("100","305","API.2359/TU.03/2019/LOP.OB","ANGKASAPURA","Penyampaian risalah rapat","Biasa","-","2019-09-27","2019-09-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("101","137","090/KI NTB/UM/IX/2019","KOMISI INFORMASI PROVINSI NUSA TENGARA BARAT","Peringatan hari hak  untuk  tahu se dunia","Undangan","1 kaos kegiatan","2019-09-27","2019-09-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("102","92","005/815/IX/BKBPDN/2019","BKBPDN","Permohonan narasumber","Permohonan Narasumber","-","2019-09-27","2019-09-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("103","306","1464/PKA.1.1/PDP.07.1","LAN RI","Pemberitahuan breakthrough II implementasi proyek perubahan","Biasa","-","2019-09-30","2019-09-30","","Kabag Umum","Yth Kabag Umum , Saya hadir ","1");
INSERT INTO tbl_surat_masuk VALUES("104","307","B/139/IX/Ka/SU.03/2019/BNNK-SBW","BNN RI","Permintaan alat tes urine","Biasa","-","2019-09-30","2019-09-30","","Kabag Umum","Yth.Kabag Umum , setuju, Yth Sarpras , berika 100 alat","1");
INSERT INTO tbl_surat_masuk VALUES("105","308","900/1392.a/BPKAD/2019","GUBERNUR NTB","Persetujuan pinjam pakai tanah milik pemerintah Prov NTB","Biasa","-","2019-09-30","2019-09-30","","sarpas","kasubag sapras","1");
INSERT INTO tbl_surat_masuk VALUES("106","309","B/5113/IX/RES.4.2/2019/Dit .resnarkoba","POLDA NTB","Permintaan asswesment","Biasa","1 Gabung","2019-09-30","2019-09-30","","Rehab","-Yth.Kanid rehabilitasi","1");
INSERT INTO tbl_surat_masuk VALUES("107","310","B/865/IX/RES.4.2/2019","RESOR LOMBOK UTARA","Permohonan TAT","Biasa","-","2019-09-30","2019-09-30","","Rehab","Yth.Kabid rehabilitasi, ","1");
INSERT INTO tbl_surat_masuk VALUES("108","311","B/3441/IX/DT/DT.00.02/2019/BNN","BNN RI","Penyesuaian buku indonesia drugs Report 2019","Biasa","2 BUKU","2019-09-30","2019-09-30","","p2m","Yth.P2M Agar di pelajari","1");
INSERT INTO tbl_surat_masuk VALUES("109","137","005/314/SMPN.03/2019","SMP N 3 Gerung","Undangan upacara paripurna","Undangan","-","2019-09-30","2019-09-30","","P2M","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("110","138","-","GUBERNUR NTB","Pembukaan MTQ","Undangan","-","2019-09-30","2019-09-30","","SESPRI","BAPAK HADIR","1");
INSERT INTO tbl_surat_masuk VALUES("111","139","-","GUBERNUR NTB","Penutupan MTQ","Undangan","-","2019-09-30","2019-09-30","","P2M","Yth.Kabid P2M","1");
INSERT INTO tbl_surat_masuk VALUES("112","140","B/UND-1981/IX/DE/HK.04/2019/BNN","BNN RI","Undangan  kegiatan bantuan hukum non litigasi di PROV NTB","Biasa","-","2019-10-01","2019-10-01","","Kasubag admin","yth.kasubag admin","1");
INSERT INTO tbl_surat_masuk VALUES("113","96","005/635/Pol,PP/2019","SAT POL PP","Permohonan narasumber","Permohonan Narasumber","-","2019-10-01","2019-10-01","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("114","141","B.5169/KC-XI/LYI/09/2019","BRI","Undangan launching Aplikasi jinio smart","Undangan","-","2019-09-30","2019-10-01","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("115","312","B/3504/IX/SU/IR.04.04/2019/BNN","BNN RI","Permintaan laporan supervisi 8 (delapan) area perubahan PMPRB","Biasa","-","2019-10-01","2019-10-01","","Kabag umum","YTH.Kabag umum ","1");
INSERT INTO tbl_surat_masuk VALUES("116","313","B/3559/IX/DE/PB/2019/BNN","BNN RI","Pelaporan capaian berkas TPN BNNP NTB dan BNNK ","Biasa","-","2019-10-01","2019-10-01","","Rehabilitasi","Yth.Kabid Rehabilitasi","1");
INSERT INTO tbl_surat_masuk VALUES("117","314","-","Ahmad muhajir","Lamaran pekrjaan","Biasa","-","2019-10-01","2019-10-01","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("118","97","467/836/IX/BKBPDN/2019","BKBPDN","Permohonan narasumber","Permohonan Narasumber","-","2019-10-02","2019-10-02","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("119","98","005/365/POL.PP/2019","SATPOLPP","Permohonan narasumber","Permohonan Narasumber","-","2019-10-02","2019-10-02","","P2M","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("120","314","-","GRAND LEGI MATARAM","Penawaran harga","Biasa","-","2019-10-03","2019-10-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("121","315","351/SP/SGR/IDCR/IX/2019","PANITIA INDONESIA COLOUR RUN","Permohonan kerja sama sponsorsif","Biasa","-","2019-10-03","2019-10-03","","Yth.Kabid P2M","Yth.P2M , TOLONG DI KOORDINASIKAN ","1");
INSERT INTO tbl_surat_masuk VALUES("122","316","B/3573/X/IR/IR.04/2019/BNN","BNN RI","Pemetaan titik rawan gratifikasi","Biasa","-","2019-10-03","2019-10-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("123","142","424.1/41/SD 3 MS/X/2019","SDN 3 MEKARSARI","Permohonan narasumber","Undangan","-","2019-10-03","2019-10-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("124","317","B-Pan.09/DP.P-XXVIII/VIII/2019","MUI PROV NTB","Mohon partisipasi pemasangan spanduk","Biasa","-","2019-10-03","2019-10-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("125","318","b-025/gan-mui/ntb/x/2019","GANNAS ANNAR-MUI PROV NTB","Pengajuan kerjasama","Biasa","-","2019-10-03","2019-10-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("126","319","005/RED/PROL-NTB/IX/2019","PROL NTB","PERMOHONAN WAWANCARA","Biasa","-","2019-10-03","2019-10-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("127","142","B/09/IX/2019","TNI ","Undangan upacara HUT TNI Ke 74
hari Sabtu , 05 Oktober 2019","Undangan","-","2019-10-04","2019-10-04","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("128","320","B/3579/X/DE/RH.03/2019/BNN","BNN RI","Penugasan Peserta Rapat Kerja Dalam Rangka Evaluasi kegiatan Bidang Rehabilitasi","Biasa","-","2019-10-04","2019-10-04","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("129","99","27/PTD-LTH/2019","PANITIA PEMILIHAN TARUNE DEDARE","Mohon menjadi narasumber","Permohonan Narasumber","-","2019-10-04","2019-10-04","","Kabid P2M","Yth.Kabid P2M hadir mewakili bapak","1");
INSERT INTO tbl_surat_masuk VALUES("130","143","b/5346/X/HUK.6.3/2019","POLDA NTB","Undangan  Panggung porajurit
Hari Minggu 6 Oktober 2019","Undangan","-","2019-10-04","2019-10-04","","Pemberantasan ","Yth.Kabid pemberantasan Mohon hadir mewakili bapak","1");
INSERT INTO tbl_surat_masuk VALUES("131","144","-","G PAN","Undangan peresmian kampung anti narkoba dan jalan sehat
Hari Rabu 9 Oktober 2019
waktu 08.00 Wita 
tempat Bongor taman ayu gerung","Undangan","-","2019-10-04","2019-10-04","","P2M","Yth.Kabid P2M mohon hadir mewakili bapak","1");
INSERT INTO tbl_surat_masuk VALUES("132","321","B/368/X/Ka/SU.05/2019/BNNK-MTR","BNNK MATARAM","Surat pengantar jabatan pegawai BNNK MATARAM Tahun 2019 an Joni Haryanto dkk","Biasa","2 Gabung","2019-10-07","2019-10-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("133","322","010/PAN-KEJURNAS-DB/X/2019","ZIGZAG OTOMITIF CLUB","Mohon Dukungan Acara ","Biasa","1 Proposal","2019-10-07","2019-10-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("134","145","-","MUI ","Undangan Rakernas V MUI Tahun 2019","Undangan","-","2019-10-07","2019-10-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("135","100","890/1872/BKPSDM/X/2019","BKPSDM","Permohonan Narasumber","Permohonan Narasumber","-","2019-10-07","2019-10-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("136","323","No.02/SP/SKM/X/2019","PT.SANGIANG KARYA MANDIRI","Penawaran dan informasi produk","Biasa","1 Proposal","2019-10-07","2019-10-08","","SARPARAS PERENCANAAN","Yth Kasubag Sarpras dan perencanaan Sebagai referensi","1");
INSERT INTO tbl_surat_masuk VALUES("137","324","785/K/KPID-NTB/X/2019","KPIDA NTB","Permohonan audiensi","Biasa","-","2019-10-08","2019-10-08","","P2M","Yth Kabid P2M Mohon di fasilitasi","1");
INSERT INTO tbl_surat_masuk VALUES("138","325","B/290/x/2019/RES MATARAM","POLRES MATARAM","Pengajuan ASSESMENT Penyalahguna narkoba","Biasa","-","2019-10-08","2019-10-08","","Rehabilitasi","Yth.Kabid Rehabilitasi Sbg bahan tolakan dan kajian","1");
INSERT INTO tbl_surat_masuk VALUES("139","326","B/5367/X.RES.4.2/2019/Ditresnarkoba","POLDA NTB","Permohonan assesment","Biasa","-","2019-10-08","2019-10-08","","rehabilitasi","yth.rehabilitasi proses sesuai aturan","1");
INSERT INTO tbl_surat_masuk VALUES("140","327","B/148/X/Ka/su.04/2019/BNNKAB SUMBAWA","BNNK SUMBAWA","Pengiriman laporan pelaksanaan tugas","Biasa","1 Gabung","2019-10-08","2019-10-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("141","328","B.181/GHS/FKLKI/X/2019","FK LINTAS KOMUNITAS ISLAM","Permohonan bantuan dana ","Biasa","1 PROPOSAL","2019-10-08","2019-10-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("142","23","SE/68/X/KA/IR.04.04/2019/BNN","BNN RI","Pembentukan unit pengendali grafitasi di lingkungan BNNP","SE/SKEP","-","2019-10-08","2019-10-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("143","24","SE/69/X/KA/KA/KP.04/2019/BNN","BNN RI","Penyesuaian jabatan pelaksanaan dan fungsional di ling BNN ","SE/SKEP","-","2019-10-08","2019-10-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("144","25","KEP/606/VIII/KA/KP.07.00/2019/BNN","BNN RI","Daftar susunan di lingkungan BNN","SE/SKEP","-","2019-10-08","2019-10-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("145","146","421.1/1141/Disdik","DINAS PENDIDIKAN ","Undangan FGD /DKT pendidikan keluarga dan 1000 hari pertama kehidupan","Undangan","-","2019-10-11","2019-10-11","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("146","101","04/DPKP/X/2019","DINAS PERMAHAN DAN KAWASAN PEMUKIMAN","Permohonan narasumber","Permohonan Narasumber","-","2019-10-11","2019-10-14","","P2M","P2M","1");
INSERT INTO tbl_surat_masuk VALUES("147","329","049/Aud/BEMUNRAM/SP/e/III/2019","UNRAM","Permohonan audiensi","Biasa","-","2019-10-11","2019-10-14","","P2M","P2M","1");
INSERT INTO tbl_surat_masuk VALUES("148","330","W21.EMT-UM.01.01-982","LEMBAGA PEMASYARAKATAN TERBUKA KLS II B LOTENG ","Permohonan tes  urine","Biasa","-","2019-10-11","2019-10-14","","P2M","P2M","1");
INSERT INTO tbl_surat_masuk VALUES("149","331","W21.UM.02.07-251","KANWIL NTB","Permohonan tes urine","Biasa","-","2019-10-11","2019-10-14","","P2M","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("150","332","W31.UM.01.01-849","LP PEREMPUAN KELAS III MATARAM","Permohonan tes uriner","Biasa","-","2019-10-11","2019-10-14","","P2M","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("151","333","SE/70/X/SU/PR.04/2019/BNN","BNN RI","Percepatan pengoptimalan penyerapan anggaran Tahun 2019","Biasa","1 GABUNG","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("152","334","B578/X/Ka/CM.00/2019/BNNK-MTR","BNNK MATARAM","Laporan kegiatan press release kegiatan bidang P2M","Biasa","0","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("153","335","034/PSKB-M/e/X/2019","PEMUDA SANGGILI KOTA BIMA","Permohonan audiensi","Biasa","1 Proposal","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("154","336","B/182/BB/HM.00/IX/2019/BNN","BALAI BESAR REHABILITASI","Pemberitahuan layanan rehabilitasi gratis dan tanpa daftar tunggu di Balai besar rehabilitasi BNN","Biasa","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("155","337","B/443/BB/RH.06/X/2019/BNN","BALAI BESAR REHABILITASI","Informasi klien pascarehabilitasi","Biasa","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("156","338","B/436/BB/RH.06/X/2019/BNN","BALAI BESAR REHABILITASI","Informasi klien pascarehabilitasi ","Biasa","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("157","339","440/321/01.23/2019","PUSKESMAS SAPE","Pengajuan klaim rawat jalan","Biasa","1 Gabung","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("158","102","084/Skr/PKK.Kab/X/2019","PKK","Permohonan narasumber","Permohonan Narasumber","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("159","103","424/241.1/BKBP-LB/2019","BAKESBANGPOL","Permohonan narasumber","Permohonan Narasumber","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("160","147","AP.2599/TU.03.05/2019/GM.LOP","ANGKASAPURA","Undangan ","Undangan","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("161","148","UND-115/WPB.23/2019","DJPB","Undangan sosialisasi dan penyuluhan sistem akuntansi instansi ","Undangan","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("162","149","44/KPAK.Lobar/X/2019","BUPATI LOBAR","Undangan rapat koordinasi pencegahan dan penanggulangan HIV AIDS","Undangan","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("163","104","005/871/BKBPDN/2019","BAKESBANGPOL DAGRI","Permohonan narasumber","Permohonan Narasumber","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("164","150","005/870/X/BKBPDN/2019","BAKESBANGPOLDAGRI","Undangan Rapat koordinasi ","Undangan","-","2019-10-14","2019-10-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("165","340","B/580/X/Ka/SU.05/2019/BNNK-MTR","BNNK MATARAM","Surat pengantar usulan perubahan jabatan pegawai BNNK Mataram ","Biasa","1 lembar","2019-10-15","2019-10-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("166","341","R/104/X/YAN.2.7/2019/RO SDM","POLDA NTB","Pengiriman hasil tes psikolog untuk pinjam pakai senpi","Biasa","1 Eksemplar","2019-10-15","2019-10-15","","Kabag Umum","-Yth.Kabag Umum ","1");
INSERT INTO tbl_surat_masuk VALUES("167","151","-","STMIK ASM Mataram","Wisuda XIV dan Wisuda XX  STMIK ASM ","Undangan","-","2019-10-15","2019-10-15","","P2M","Yth.Kabid P2M Tunjuk Staf","1");
INSERT INTO tbl_surat_masuk VALUES("168","342","B/5574/X/RES.4.2/2019","POLDA NTB","Permintaan assesment","Biasa","2 Permohonan Assesment","2019-10-15","2019-10-15","","Rehabilitasi","yth.rehabilitasi proses sesuai aturan","1");
INSERT INTO tbl_surat_masuk VALUES("169","343","B/154/Ka/SU.05/2019/BNNKab","BNNK SUMBAWA","Data penyesuaian jabatan pelaksana dan fungsional BNNK sumbawa Tahun 2019","Biasa","1 G","2019-10-15","2019-10-15","","Kabag Umum","Yth Kabag Umum ","1");
INSERT INTO tbl_surat_masuk VALUES("170","105","0763/011-Eks/X/2019","Khalid Bin AL-WALID","Permohonan narasumber","Permohonan Narasumber","-","2019-10-16","2019-10-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("171","344","116/LBTV/A/X/2019","LOMBOK TV","Permohonan Sponsorship","Biasa","I PROPOSAL","2019-10-18","2019-10-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("172","345","B/3783/X/SU/TU.02/2019/BNN","BNN RI","Ucapan terima kasih","Biasa","-","2019-10-18","2019-10-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("173","346","B/154/X/Ka/SU.05/2019/BNNKab","BNNK SUMBAWA","Data penyesuaian jabatan pelaksana dan fungsional BNNK Sumbawa Tahun 2019","Biasa","-","2019-10-18","2019-10-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("174","152","005/7109/POLPUM","Dirjen POLPUM","Undangan peserta","Undangan","-","2019-10-18","2019-10-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("175","347","B/625/X/2019/RES MATARAM","POLRES MATARAM","PENGAJUAN ASSESMEN","Biasa","-","2019-10-18","2019-10-18","","REHABILITASI","Yth.Kabid Rehabilitasi untuk di proses sesuai aturan","1");
INSERT INTO tbl_surat_masuk VALUES("176","106","079/IKN-CB-MTR/X/2019","INKANAS","Permohonan sosialisasi","Permohonan Narasumber","-","2019-10-18","2019-10-18","","P2M","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("177","107","661/IV.1/Sosial","DINAS SOSIAL","Permohonan Narasumber","Permohonan Narasumber","-","2019-10-21","2019-10-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("178","153","441/245/BPKBP-LB/2019","BAKESBANGPOL","Undangan rapat persiapan","Undangan","-","2019-10-22","2019-10-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("179","108","215/EX/GGL/X/2019","Kepala Desa Gegelang","Permohonan narasumber","Permohonan Narasumber","-","2019-10-22","2019-10-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("180","109","421.5/97/SMK-NDH/X/2019","SMK NURA DARMA HUSADA","Permohonan narasumber","Permohonan Narasumber","-","2019-10-22","2019-10-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("181","154","800/3670/BKD/2019","SEKDA","Pembekalan dan penyerahan SK pensiun ASN","Undangan","-","2019-10-01","2019-10-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("182","155","488/AAS/BRSAMPKP/10/2019","BRSAMPK","Undangan rapat koordinasi regional 2019","Undangan","-","2019-10-23","2019-10-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("183","156","B-UND-2054/X/DE/RH.00/2019/BNN","DEPUTI REHABILITASI","Undangan peserta kegiatan supervisi klnis layanan rehabilitasi  di fasilitasi milik BNN","Undangan","-","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("184","347","B/3808/X/KA/IR.01.03/2019/BNN","BNN RI","penyampaian data penilaian kembali revaluasi BMN di lingkungan BNN","Biasa","-","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("186","349","B/3849/X/KA/IR.00/2019/BNN","BNN RI","Atensi hasil kompilasi audit satker BNNP, BNNK/KOTA dan balai/loka rehabilitasi TA 2018","Biasa","-","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("187","350","B/3850/X/KA/IR.04.04/2019/BNN","BNN RI","Permohonan pesngisian kuesioner layanan inspektorat utama BNN ","Biasa","-","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("188","351","B/3809/X/SU/IR.04.04/2019/BNN","B/3809/X/SU/IR.04.04/2019","Peningkatan kualitas pelayanan publik","Biasa","-","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("189","110","02/Pan-PHBN/KT/X/2019","FPKT KECAMATAN SAMBELIA","Permohonan sebagai narasumber ","Permohonan Narasumber","-","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("190","352","B/905/N.2.10.3/Euh.2/2019","KEJATI NTB","mohon bantuan untuk menghadirkan terpidana","Biasa","-","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("191","157","005/3620.PTP/Dikbud","DIKBUD","Undangan  focus group discussion (FGD) diskusi kelompok terpumpun","Undangan","-","2019-10-24","2019-10-24","","irfan ","Yth.Kabid P2M, untuk di tindak lanjuti","1");
INSERT INTO tbl_surat_masuk VALUES("192","353","-","YPP NURUL HARAMAIN NW PUTRI NARMADA","Permohonan ijin kunjungan","Biasa","-","2019-10-24","2019-10-24","","pak irfan","Yth P2M","1");
INSERT INTO tbl_surat_masuk VALUES("193","158","053/KPA/P/X/2019","KPAP","undangan rapat pokja v","Undangan","1","2019-10-24","2019-10-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("194","354","005/461/SATPOLPP/2019","POLPP LOBAR","Permohonan anggota","Biasa","-","2019-10-25","2019-10-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("195","355","088/SK-PERDOSSI-MTR/X/2019","PERDOSSI MATARAM","Permohonan batuan audio visual","Biasa","1 CD","2019-10-25","2019-10-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("196","356","S-373/WPB.23/KP.02/2019","DJPB","Koreksi transaksi penerimaan negara","Biasa","-","2019-10-25","2019-10-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("197","26","SE/75/X/KA/KP.01/2019/BNN","BNN RI","Peringatan hari sumpah pemuda","SE/SKEP","-","2019-10-25","2019-10-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("198","357","B/465/BB/RH.06/2019/BNN","BALAI REHABILITASI BNN RI","Informasi klien pascarehabilitasi","Biasa","-","2019-10-28","2019-10-28","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("199","358","001/LO-MTR","LOMBOK OPTIK","Pemeriksaan mata gratis","Biasa","-","2019-10-28","2019-10-28","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("200","359","B/3908/X/SU/RT.01/2018/BNN","BNN RI","Pemasangan foto resmi presiden dan wakil presiden RI periode 2019 sd 2024","Biasa","-","2019-10-28","2019-10-28","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("201","159","005/3997/03-BAPPEDA","BAPPEDA","Rapat koordinasi penyelenggara strategi pencapaian target dan indikator SDGs","Undangan","-","2019-10-28","2019-10-28","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("202","111","436/919/X/BKBPDN/2019","BAKESBANGPOLDAGRI","Permohonan narasumber","Permohonan Narasumber","-","2019-10-28","2019-10-28","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("203","160","-","KEMENKUMHAM","Undangan Upacara Hari Dharma Kayadhika","Undangan","-","2019-10-29","2019-10-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("204","360","442.5/1939/YM/RSJMS","BLUD RSJ MUTIARA SUKMA","Laporan perkembangan pelaksana rehabilitasi","Biasa","-","2019-10-29","2019-10-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("205","361","0518/DEKAN/PL-2/IX/2019","FAKUKLTAS PSIKOLOGI UNIVERSITAS KRISTEN SATYA WACANA","Permohonan pembelajaran lapangan 2","Biasa","-","2019-10-29","2019-10-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("206","362","745/II.3.AU/F/X/2019","UNMUH MATARAM","Permohonan tempat magang","Biasa","1 Gabung","2019-10-29","2019-10-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("207","363","441/345/IPDN.29.5","IPDN","Permohonan tes urine","Biasa","-","2019-10-29","2019-10-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("208","364","B/653/X/2019/Res Mataram","POLRES MATARAM","Peremohonan Asesmen Penyalahguna Narkotiika","Biasa","-","2019-10-30","2019-10-30","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("209","112","400/84/KES-TW/2019","KANTOR CAMAT TELAGAWARU","Mohon narasumber","Permohonan Narasumber","-","2019-10-30","2019-10-30","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("210","161","005/3060/KES/X/2019","DINAS KESEHATAN","Undangan Sosialisasi Akreditasi","Undangan","-","2019-10-30","2019-10-30","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("211","365","AP I.2359/TU.03/2019/LOP.OB","ANGKASAPURA","Penyampaian risalah rapat","Biasa","1 Berkas","2019-10-31","2019-10-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("212","366","B/3719/X/DE/PB.01/2019/BNN","BNN RI","Petunjuk harwat perangkat pengumpul informasi","Biasa","1 lembar","2019-10-31","2019-10-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("213","113","424/4737-Kebud","DINAS PENDIDIKAN  DAN KEBUDAYAAN ","Mohon menjadi narasumber","Permohonan Narasumber","1 Gabung","2019-10-31","2019-10-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("214","162","1213/PL.01.9-UND/52/PROV/X/2019","KPU PROV NTB","Undangan rakor evaluasi pengolahan dokumen pencalonan pilkada 2018
menyongsong pemilihan tahun 2020","Undangan","-","2019-10-31","2019-10-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("215","163","-","GUBERNUR NTB","Undangan Anugerah Duta Informasi dan Pengumuman Pemenang Lombok ","Undangan","-","2019-10-31","2019-10-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("216","164","005/98/2/KOMINFOTIK","KOMINFOTIK","Undangan peserta BIMTEK","Undangan","1 rangkap","2019-10-31","2019-10-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("217","367","B/3985/X/KA/PL.02/2019","BNN RI","Sikap BNN terkait peredaran dan penyalahgunaan kratom di indonesia","Biasa","-","2019-11-01","2019-11-01","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("218","368","B/5932/XI/RES.4.2/2019/Dit Resnarkoba","POLDA NTB","Permintaan assesment ","Biasa","-","2019-11-01","2019-11-01","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("219","165","005/644/KESRA","SEKDA","Undangan pertemuan perihal dorongan agar sekolah mendukung proses pemulihan rehabilitasi","Undangan","-","2019-11-04","2019-11-04","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("220","369","B/304/XI/2019/Resnarkoba","POLRES LOTENG","Permintaan Assesment Tersangka anak an Bebe Ari Saputra ","Biasa","-","2019-11-05","2019-11-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("221","370","B/299/XI/2019/Res Loteng","POLRES LOTENG","permintaan assesment tersangka an REPANDI SANSENO","Biasa","-","2019-11-05","2019-11-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("222","114","005/130/SMP.01/2019","SMP N 1 KEDIRI","Permohonan sosialisasi bahaya narkoba","Permohonan Narasumber","-","2019-11-05","2019-11-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("223","371","B/3963/X/DE/PC.00/2019/BNN","BNN RI","Laporan keuangan diseminasi informasi","Biasa","-","2019-11-05","2019-11-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("224","372","824.4/1109/BKD/2019","SEKDA","Penempatan pegawai negeri sipil ","Biasa","-","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("225","115","005/35/Lkr/2019","KANTOR CAMAT JANAPRIA","Permohonan narasumber","Permohonan Narasumber","-","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("226","116","28/Sekda/BKOW.NTB/XI/2019","BKOW","Permohonan narasumber","Permohonan Narasumber","-","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("227","117","-","GUBERNUR NTB","Undangan GEBYAR DBIP","Undangan","-","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("228","118","-","GUBERNUR NTB","Undangan memperingati hari pahlawan ","Undangan","-","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("229","117","4232/623.B/CD-LU/2019","DINAS PENDIDIKAN DAN KEBUDAYAAN LOMBOK UTARA","Permohonan narasumber","Permohonan Narasumber","1 Gabung","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("230","118","800/258.1/DUKCAPIL/2019","DUKCAPIL","Permohonan narasumber","Permohonan Narasumber","1","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("231","373","B/676/XI/2019/Res Narkoba","POLRES MATARAM","Permohonan assesment ","Biasa","-","2019-11-06","2019-11-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("232","374","B/683/XI/2019/Res Mataram","POLRES KOTA MATARAM","Pengajuan assesment","Biasa","-","2019-11-07","2019-11-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("233","375","B/4042/XI/DE/PM.00.01/2019","BNN RI","Monitoring dan evaluasi program TA 2019 melalui video conference","Biasa","1 lembar","2019-11-07","2019-11-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("234","376","745/II.3.AU/F/XI/2019","UNMUH","Mohon persetujuan tempat magang","Biasa","-","2019-11-07","2019-11-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("235","377","-","BNNK MATARAM","LAPORAN SEMINAR IMPLEMENTASI PROYEK PERUBAHAN  TENTANG 
SINEGRITAS STAKEHOLDER DALAM PENCEGAHAN DAN PEREDARAN NARKOBA DI KOTA MATARAM","Biasa","-","2019-11-07","2019-11-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("236","378","009/PJM/X/2019","PUTRA JAYA MANDIRI SUMBAWA BARAT","Permohonan bantuan dana","Biasa","1 proposal ","2019-11-07","2019-11-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("237","119","816/328/CD-Dikbud","DIKBUD LOMBOK TENGAH","Menjadi narasumber","Permohonan Narasumber","-","2019-11-07","2019-11-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("238","379","-","BAPAK TARWO KUSNARNO, SE.Msi","Mohon diri","Biasa","-","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("239","380","005/SASAMBO-PUBGM/III/2019","SASAMBO PUBGM","Surat pengantar proposal sasambo PUBGM ","Biasa","1 Proposal","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("240","119","005/967/XI/BKBPDN","BAKESBANGPOLDAGRI","Undangan peserta","Undangan","-","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("241","120","1564/RECFON-DIR/S-70/XI/2019","SEAMEO RECFON","Undangan pelatihan ","Undangan","-","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("242","121","-","POLDA NTB","undangan HUT KORPS BRIMOP POLRI KE-74","Undangan","-","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("243","120","31/SEKR/BKOW.NTB/XI/2019","B.K.O.W","Mohon menjadi narasumber","Permohonan Narasumber","-","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("244","122","005/792/DPRD/2019","DPRD PROV NTB","Undangan pembukaan rapat paripurna","Undangan","-","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("245","381","B/6038/XI/RES.4.2/2019/Ditresnarkoba","POLDA","Permintaan assesment","Biasa","-","2019-11-08","2019-11-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("246","123","-","SEKDA","Undangan HARI KESEHATAN NASIONAL","Undangan","-","2019-11-11","2019-11-11","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("247","382","B/595/XI/Ka/SU.03/2019/BNNK-MTR","BNNK MATARAM","Permohonan dukungan alat tes narkoba ","Biasa","1","2019-11-12","2019-11-12","","-----","-","1");
INSERT INTO tbl_surat_masuk VALUES("248","383","B/116/XI/RES.4.2/2019/Sat Resnarnarkoba","POLRES LOBAR","permohonan team assesment terpadu","Biasa","1","2019-11-12","2019-11-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("249","121","04/PANPEL.PK.SMELAN/X/2019","SMAN 9 MATARAM","permohonan pemateri","Permohonan Narasumber","-","2019-11-12","2019-11-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("250","384","B/4085/XI/RO/LG.00/2019/BNN","BNN RI","Permintaan data ukuran","Biasa","-","2019-11-12","2019-11-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("251","124","-","DISPORA","Upacara pembukaan pendidikan bela negara","Undangan","-","2019-11-12","2019-11-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("252","122","1239/III.4 AU/F/2019","SMA MUHAMMADYAH MATARAM","Permohonan audiensi","Permohonan Narasumber","-","2019-11-12","2019-11-13","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("253","125","005/537/HP/2019","SEKDA","Rapat pemantapan HUT ke-61 NTB Tahun 2019","Undangan","-","2019-11-14","2019-11-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("254","126","121/LBTV/A/XI/2019","LOMBOK TV","Undangan broadcast quiz","Undangan","-","2019-11-14","2019-11-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("255","385","B/371/MTR/UMM/11/2019","PT.PRIMA KARYA SARANA SEJAHTERA","Permohonan tes urine","Biasa","-","2019-11-14","2019-11-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("256","386","658/UNI8.S6/TU/2019","UNRAM ","Permohonan izin ","Biasa","-","2019-11-15","2019-11-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("257","127","-","KPID","Undangan malam penganugerahan  KPID","Undangan","-","2019-11-15","2019-11-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("258","128","005/4483/04-BAPPEDA","BAPPEDA","Rakor persiapan penyusunan grand design pembangunan kependudukan","Undangan","-","2019-11-15","2019-11-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("259","123","04/PANPEL.PK.SMELAN/X/2019","SMAN 9 MATARAM","Permohonan pemateri","Permohonan Narasumber","-","2019-11-18","2019-11-18","","Yth.Kabid p2m","Koordinasikan ke BNNK mataram jika padat","1");
INSERT INTO tbl_surat_masuk VALUES("260","124","35/Sekr/BKOW.NTB/2019","BKOW","Permohonan narasumber ","Permohonan Narasumber","-","2019-11-18","2019-11-18","","Yth.Kabid p2m","Hadiri ","1");
INSERT INTO tbl_surat_masuk VALUES("261","125","B/1954/XI/2019","KOREM 162/WIRA BHAKTI","Permohonan narasumber kegiatan sosialisasi bahaya narkoba","Permohonan Narasumber","-","2019-11-18","2019-11-18","","Yth.Kabid P2M","Hadiri ","1");
INSERT INTO tbl_surat_masuk VALUES("262","129","41/SNHI/HMI-UM/IX/2019","UNRAM ","Undangan seminar Nasional Hubungan internasional ","Undangan","-","2019-11-18","2019-11-18","","Yth.Kabid P2M","Materi tidak sesuai dengan tupoksi kita","1");
INSERT INTO tbl_surat_masuk VALUES("263","130","800/3903/BKD/2019","BKD","Undangan rakor kelengkapan data simadu dan pengisian IP ASN","Undangan","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("264","131","B-448/C/CP.2/11/2019","KEJAKSAAN AGUNG RI","Undangan rapat silahturahmi jaksa agung RI dengan pegawai kejaksaan RI yang di karyakan di luar kejaksaan RI","Undangan","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("265","132","54/KPAK.LOBAR/XI/2019","KPAK","Rapat evaluasi penanggung HIV-AIDS","Undangan","-","2019-11-18","2019-11-18","","Yth.Kabid P2M","Untuk di hadiri ","1");
INSERT INTO tbl_surat_masuk VALUES("266","387","014/Plank-PL/DEMA/FDIK/UIN-Mtr/11/2019","UIN MATARAM","permohonan bantuan dana","Biasa","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("267","388","-","DIRJEN BEA DAN CUKAI","Mohon diri","Biasa","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("268","389","2645/UN18F1.1/PD/2019","UNRAM FAKULTAS EKONOMI DAN BISNIS ","Izin Kunjungan Wawancara","Biasa","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("269","390","004/PUSKORHIN-DEKORWIL-NTB/2019","PUSKOR HINDUNESIA","Ucapan terima kasih","Biasa","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("270","27","SE/74/X/KA/KU/2019/BNN","BNN RI","Batas waktu dan denda atas penyampaian surat pemberitahuan masa pajak ","SE/SKEP","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("271","28","Kep/467/XI/2019","SK PENSIUN SYIRAJUDIN MAHMUD","SK PENSIUN ","SE/SKEP","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("272","391","B/4129/XI/SU/LG.00/2019/BNN","BNN RI","Permintaan pengumuman dan pengiriman rencana umum pengadaan","Biasa","-","2019-11-18","2019-11-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("273","133","B/UND-2136/XI/DE/RH.06.00/2019/BNN","BNN RI","Undangan kegiatan rapat integriitas program pascarehabilitasi dalam IBM melalui Agen pemulihan ","Undangan","-","2019-11-19","2019-11-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("274","392","B/371/X/DE/PB.01/2019/BNN","BNN RI","Pelaksanaan monev di BNNP NTB ","Biasa","-","2019-11-19","2019-11-19","","Yth.Kabid berantas","Untuk di penuhi","1");
INSERT INTO tbl_surat_masuk VALUES("275","393","B/537/BB/RH.06/XI/2019/BNN","BNN RI","Informasi pasca rehabilitasi","Biasa","-","2019-11-19","2019-11-19","","Yth.Kabid Rehabilitasi","Untuk di penuhi","1");
INSERT INTO tbl_surat_masuk VALUES("276","134","005/814/DPRD/2019","DPRD PROV NTB","Undangan pembukaan rapat paripurna","Undangan","-","2019-11-19","2019-11-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("277","394","B/607/XI/Ka/SU.03/2019/BNNK MATARAM","BNNK MATARAM","Permohonan dukungan personil","Biasa","-","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("278","395","B/712/XI/2019/Res Mataram","POLRES KOTA MATARAM","Pengajuan assesment","Biasa","-","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("279","396","1270/G5.21/PB/2019","KANTOR BAHASA NTB","Pengiriman terbitan buku","Biasa","2 BUKU","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("280","397","61/D-5/Panpel/eks/XV/2019","UNIVERSITAS MUHAMMADIYAH MATARAM","Permohonan silahturahmi","Biasa","-","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("281","398","442.5/2212/YM/RSJMS","BLUD RSJ MUTIARA SUKMA","Laporan perkembangan pelaksana rehabilitasi","Biasa","-","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("282","135","-","PHBI","Undangan maulid","Undangan","-","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("283","136","B/4174/XI/DE/PM.01/2019/BNN","BNN RI","Perintah menghadiri raker monev alternative development tahun 2019 di jakarta","Undangan","1 Gabung","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("284","137","010/SASAMBO-PUBGM/III/2019","SASAMBO PUBGM","Surat permohonan narasumber","Undangan","-","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("285","399","B/4169/XI/RO/PR.04/2019/BNN","BNN RI","Ex Post Monitoring dan Program P4GN","Biasa","-","2019-11-21","2019-11-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("286","138","B-074/Skomenwa-NTB/XI/2019","KOMANDO RESIMEN MAHASISWA RINJANI","Undangan penutupan","Undangan","-","2019-11-22","2019-11-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("287","139","005/657/UM/SMKN4MTR","SMK N 4 MATARAM","Undangan HUT PGRI Ke 74","Undangan","-","2019-11-22","2019-11-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("288","400","B/4107/XI/DE/PM.00.02/2019","BNN RI","Data monitoring dan evaluasi ","Biasa","-","2019-11-22","2019-11-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("289","401","B/1083/XI/RES.4.2/2019","POLRES KLU","Permohonan team assesment terpadu","Biasa","1 GABUNG","2019-11-22","2019-11-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("290","402","W21.EM.KP.03.03-1908","LP KELAS IIA MATARAM","Permohonan wajib alpor pada klinik pratama","Biasa","-","2019-11-22","2019-11-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("291","126","467/994/XI/BKBPDN/2019","KESBANGPOL","Permohonan narasumber","Permohonan Narasumber","-","2019-11-22","2019-11-22","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("292","403","S-187/WPB.23/KP.01/2019","DJPB","Pesiapan piloting SAKTI Web pada satuan kerja kementrian dan lembaga","Biasa","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("293","404","B/732/XI/2019/Res Kota Mataram","POLRES KOTA MATARAM","Pengajuan Assesment penyalaghuna narkotika ","Biasa","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("294","405","B/134/XI/RES.4.2./2019/Sat resnarkoba","POLRES LOBAR","Permohonan assesment terpadu","Biasa","1 Gabung","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("295","406","045.2/433/POLPP/2019","SATPOLPP","Buku laporan pelaksanaan penyukuhan bahaya narkoba","Biasa","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("296","140","314/II.26/TVRI/2019","TVRI","Undangan mitra gathering TVRI NTB 2019","Undangan","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("297","407","B/203/XI/DL/DL.01.03/2019/DIKLAT","BNN RI","Permohonan nama calon peserta pada pelatihan keprotokolan ","Biasa","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("298","127","AP.I.2852/HM.01/2019/LOP.PS.B","ANGKASAPURA","Permohonan narasumber ","Permohonan Narasumber","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("299","408","467/1008/XI/BKBPDN/2019","BAKESBANGPOL","Pemanggilan  peserta","Biasa","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("300","409","823/3828/BKD/2019","BKD","penyelesaian usul kenaikan pangkat","Biasa","-","2019-11-25","2019-11-25","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("301","410","MKT/XI/2019","ASSA","Surat penawaran kerjasama","Biasa","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("302","411","21/970-30/034","MANDIRI SYARIAH","Penawaran kerja sama","Biasa","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("303","412","B/754/XI/2019/RES MATARAM ","POLRES MATARAM","Pengajuan assesment","Biasa","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("304","413","5758/GMDMTR","GMEDIA","Permohonan mengiikuti tender TA 2019","Biasa","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("305","128","467/1008.a/XI/BKBPDN/2019","BAKESBANGPOL","Mohon sebagai narasumber","Permohonan Narasumber","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("306","414","893/4040/BKD/2019","SEKDA","HUT Ke-48/BKD/2019","Biasa","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("307","141","893/4038/BKD/2019","SEKDA","Undangan  HUT ke-48 KORPRI","Undangan","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("308","142","-","UNIVERSITAS 45 MATARAM","Upacara wisuda sarjana XXXII","Undangan","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("309","143","-","KOMINFO","Undangan penganugerahan keterbukaan informasi publik provinsi NTB Tahun 2019","Undangan","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("310","144","UND-54/WPB.23/KP.01/2019","DJPB","End User Training (EUT) SAKTI Web Modul Admin dan Penganggaran ","Undangan","8 Lembar","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("311","29","KEP/576/VIII/DE/RH.03/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap kedelapan TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("312","30","KEP/556/VII/DE/RH.03/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap ketujuh TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("313","31","KEP/442/VII/DE/RH.03/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap keenam TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("314","32","KEP/337/V/DE/RH.03/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap kelima TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("315","33","KEP/281/IV/DE/RH.03/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap keempat TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("316","34","KEP/196/III/RH.03/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap ketiga TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("317","35","KEP/59/I/DE/RH.01/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap pertama TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("318","36","KEP/146/II/DE/RH.01/2019/BNN","BNN RI","Penetapan lembaga rehabilitasi medis dan rehabilitasi sosial yang di selenggarakan oleh masyarakat untukl memperoleh peninggkatan kemampuan tahap kedua TA 2019","SE/SKEP","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("319","415","B/6402/XI/RES.4.2/2019/Dit Res Narkoba","POLDA NTB","Permintaan assesment ","Biasa","-","2019-11-27","2019-11-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("320","145","421.1/1365/Disidk","DINAS PENDIDIKAN ","Undangan review pelaksanaan FGD/DKT","Undangan","-","2019-11-28","2019-11-28","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("321","416","B/475/XI/DR/PB.06/2019/BNN","BNN RI","Permintaan data ","Biasa","-","2019-11-29","2019-11-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("322","417","UN.12/PP.00.9/FDIK/11/2019","UIN MATARAM","Mohon ijin observasi","Biasa","-","2019-11-28","2019-11-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("323","418","B/208/XI/DL/DL.01.03/2019/BNNP-NTB","BNN RI","Permohonan nama calon peserta pada training of fasilitas (TOF) Internalisasi nilai-nilai BNN RI","Biasa","-","2019-11-29","2019-11-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("324","419","B/177/XI/Ka/KP/2019/BNNP-KEPRI","BNNP KEPULAUAN RIAU","Koordinasi Kelembagaan ","Biasa","-","2019-11-29","2019-11-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("325","129","013/Panlak-WS/DEMA/FDIK/UIN-Mtrm/11/2019","UIN MATARAM","Permohonan narasumber","Permohonan Narasumber","-","2019-11-29","2019-11-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("326","146","-","GUBERNUR NTB","Undangan upacara peringatin hari bakti pekerjaan umum ke 74 Tahun 2019","Undangan","-","2019-11-29","2019-11-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("327","420","B/6440/XI/XI/RES.4.2/2019/Ditresnarkoba","POLDA NTB","Permohonan assesemen ","Biasa","1","2019-12-02","2019-12-02","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("328","421","B/772/XI/2019/Sat resnarkoba","POLRES MATARAM","Pengajuan assesmen","Biasa","1","2019-12-02","2019-12-02","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("329","422","B/779/XI/2019/Sat resnarkoba","POLRES MATARAM","Pengajuan assesmen","Biasa","-","2019-12-02","2019-12-02","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("330","37","003.31550/NTB/2019","GUBERNUR NTB","Surat Edaran","SE/SKEP","-","2019-12-02","2019-12-02","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("331","147","-","POLAIRUD","Undangan  Direktur Kepolosian Perairan dan Udara POLDA NTB","Undangan","-","2019-12-02","2019-12-02","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("332","423","444/442/BKBP-LB/2019","BAKESBANGPOL","Tes urine","Biasa","-","2019-12-03","2019-12-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("333","130","B.10279/KC-XI/LYN/12/2019","PT.BRI Tbk","Permohonan sebagai pemateri","Permohonan Narasumber","-","2019-12-03","2019-12-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("334","148","-","BRI","Undangan pesta rakyat simpedes","Undangan","-","2019-12-04","2019-12-04","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("335","149","790/II.3/DINSOS","DINSOS","Raoat persiapan HUT KE 61","Undangan","-","2019-12-05","2019-12-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("336","150","-","DWP PROV NTB","Acara puncak perinatan HUT Dharma wanita persatuan ke 20 
","Undangan","-","2019-12-05","2019-12-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("337","424","2885/UN18.F1.1/PD/2019","UNRAM","Izin memperolah data","Biasa","-","2019-12-05","2019-12-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("338","425","B/4193/XI/RO/KP.03/2019/BNN","BNN RI","Permintaan persetujuan mutasi an Penata Muda TK I Murniyati, S.Sos","Biasa","-","2019-12-05","2019-12-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("339","426","421.6.1/224/SMK.2/2019","SMK N 2 KURIPAN","Penarikan peserta didik PKL","Biasa","-","2019-12-05","2019-12-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("340","427","W21.HN.04.04-2294","KANWIL NTB","Tim Penilaian Desa / Kelurahan Sadar Hukum ","Biasa","-","2019-12-05","2019-12-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("341","428","B/570/XII/2019/Res Loteng","POLRES LOTENG","Permohonan assesment ","Biasa","2 GABUNG","2019-12-05","2019-12-05","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("342","429","B/563/BB/RH.06/XI/2019/BNN","BALAI BESAR REHABILITASI","Informasi klien pasca rehabilitasi","Biasa","-","2019-12-06","2019-12-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("343","151","-","HKSN ","Peringatan HKSN","Undangan","-","2019-12-09","2019-12-09","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("344","152","B/1363/XII/KEP/2019/SSDM","MABES POLRI","Undangan  pengarahan kapolri kepada anggota polri yang bertugas di luar struktur organisasi polri ","Undangan","-","2019-12-09","2019-12-09","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("345","153","795.1/III.3/Sosial","SEKDA","Gerak jalan sehat berhadiah","Undangan","-","2019-12-09","2019-12-09","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("346","430","Sprin./093/VIII/Ka/SU.05/2019/BNNK-SB","BNNK SUMBAWA BARAT","Sprin sebagai pengadministrasian umum pada seksi pencegahan dan pemberdayaan masyarakat","Biasa","-","2019-12-09","2019-12-09","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("347","431","B/589/BB/RH.06/XI/2019/BNN","BALAI REHABILITASI BNN RI","Informasi klien pascarehabilitasi ","Biasa","-","2019-12-09","2019-12-09","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("348","432","B/4451/XII/SU/PR.03.00/2019/BNN","BNN RI","Permintaan usulan rencana kerja TA 2021","Biasa","-","2019-12-10","2019-12-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("349","433","442.5/2409/YM/RSJMS/2019","BLUD RSJ MUTIARA SUKMA","Laporan perkembangan pelaksanaan rehabilitasi","Biasa","-","2019-12-10","2019-12-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("350","38","527/23/BAKESBANGPOL/2019","BUPATI LOBAR","Penetapan desa taman taman ayu ","SE/SKEP","-","2019-12-10","2019-12-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("351","154","-","BI","Undangan pertemuan tahunan BANK INDONESIA Tahun 2019","Undangan","-","2019-12-10","2019-12-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("352","155","005/2087/DP3AP2KB/2019","DP3AP2KB","Undangan rencana aksi daerah","Undangan","-","2019-12-11","2019-12-11","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("353","434","B/803/XII/2019/RES MATARAM","POLRES MATARAM","Pengajuan assesment ","Biasa","-","2019-12-11","2019-12-11","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("354","156","-","TNI AU","Pisah sambut komandan pangkalan TNI AU ","Undangan","-","2019-12-12","2019-12-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("355","157","005/865/DPRD.NTB/2019","DPRD PROV NTB","Menghadiri rapat paripurna ","Undangan","-","2019-12-12","2019-12-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("356","435","426/1168/DISPORA/OR/XII/2019","DISPORA","Dukungan door price HUT NTB Ke 61","Biasa","-","2019-12-12","2019-12-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("357","158","426/1136/Dispora/OR/XII/2019","SEKDA","SENAM MASAL","Undangan","-","2019-12-12","2019-12-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("358","436","B/4303/XI/RO/KP.03.00/2019/BNN","BNN RI","Permintaan persetujuan mutasi an Nursyarifudin, A.md dkk","Biasa","-","2019-12-12","2019-12-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("359","159","39/RL-JS/XII/2019","RADAR LOMBOK","Undangan ","Undangan","-","2019-12-12","2019-12-12","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("360","160","005/583/HP/2019","SEKDA","Undangan Touring NTB Gemilang ","Undangan","-","2019-12-13","2019-12-13","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("361","161","331.1/451/POLPP/2019","SEKDA","Pelaksanaan upacara ","Undangan","-","2019-12-13","2019-12-13","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("362","437","002/LIBAS20/OSIS/SMAN.02/XII/2019","SMA N 2 MATARAM","Permohonan menjadi donatur","Biasa","-","2019-12-13","2019-12-13","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("363","162","-","GUBERNUR NTB","Undangan Upacara HUT NTB Ke 61","Undangan","-","2019-12-16","2019-12-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("364","438","442.5/2519/YM/RSJM","BLUD RSJ MUTIARA SUKMA","Resume Perkembangan pelaksana rehabilitasi","Biasa","-","2019-12-16","2019-12-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("365","439","UM.02/18/4/BPTD-XII/2019","BALAI PENGELOLA TRANSPORTASI DARAT","Bantuan personil","Biasa","-","2019-12-16","2019-12-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("366","440","B/4289/XI/DT/DT.00.02/2019/BNN","BNN RI","Penyampaian buku hasil penelitian BNN","Biasa","-","2019-12-16","2019-12-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("367","163","005/887/DPRD/2019","DPRD PROV NTB","Undangan Menghadiri rapat paripurna ","Undangan","-","2019-12-16","2019-12-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("368","164","B/4508/XII/RO/KP.04.00/2019/BNN","BNN RI","Undangan uji kompetensi pengangkatan kembali dalam jabatan fungsional penyuluh narkoba","Undangan","-","2019-12-16","2019-12-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("369","131","005/2113/DP3AP2KB","DP3AP2KB","Permohonan narasumber ","Permohonan Narasumber","-","2019-12-16","2019-12-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("370","165","-","GUBERNUR NTB","Undangan Tasyakuran HUT NTB Ke-61","Undangan","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("371","441","005/DCL/XII/2019","PT.DIRGANTARA CAHAYA LOMBOK","Permohonan sosialisasi produk perumahan","Biasa","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("372","442","B/6714/XII/RES.4.2/2019/Dit Res Narkoba","POLDA NTB","Permintaan assesment","Biasa","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("373","132","005/104/DNY/XII/2019","KANTOR DESA NYIUR LEMBANG","Permohonan narasumber ","Permohonan Narasumber","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("374","133","120.OKC-IV.W-02.01.03.C-1.12.2019","PMI","Permohonan menjadi narasumber","Permohonan Narasumber","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("375","166","-","KELURAHAN PAGUTAN TIMUR","Undangan AWIG-AWIG LINGKUNGAN","Undangan","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("376","167","-","PANITIA PERINGATAN HARI IBU","Peringatan hari ibu ke 91 Tahun 2019","Undangan","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("377","168","B/6767/XII/OPS.1.1/2019","POLDA NTB","Undangan gelar pasukan ","Undangan","-","2019-12-17","2019-12-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("378","443","B/156/XII/RES.4.2/2019/BNNP-NTB","POLRES LOBAR","Permohonan assesment oleh tim asesmen terpadu","Biasa","-","2019-12-18","2019-12-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("379","444","051/DEKAN/PL-2/IX/2019","UNIVERSITAS KRISTEN SATYA WACANA","Permohonan pembelajaran lapangan 2","Biasa","-","2019-12-18","2019-12-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("380","134","424/401/Dispora","DINAS KEPEMUDAAN DAN OLAHRAGA","Mohon menjadi narasumber","Permohonan Narasumber","-","2019-12-18","2019-12-18","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("381","169","-","KANTOR DESA TAMAN AYU","FESTIVAL BUDAYA SERIBU RENGGINANG ","Undangan","-","2019-12-19","2019-12-19","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("382","445","-","KOMBES POL TAUFIQ HIDAYAT, S.H","Mohon diri","Biasa","-","2019-12-19","2019-12-20","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("383","446","W21.PAS.LPP.PK.05.06.01-1150","LP PEREMPUAN KELAS III MATARAM","Permohonan pelatihan bagi petugas konselor program manager","Biasa","-","2019-12-20","2019-12-20","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("384","135","01.01/JP-LTH/2019","KANTOR DESAK AIK BUKAK ","Permohonan narasumber ","Permohonan Narasumber","-","2019-12-20","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("385","447","B/389/XII/DE/PB/2019/BNN","BNN RI","Pelaporan pencapaian berkas TPN  BNNP dan BNNK","Biasa","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("386","448","R/1247/XII/Ka/CM.00/2019/BNNK-BIMA","BNNK BIMA","Laporan Hasil Tes Urine","Biasa","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("387","170","B/6980/XII/OPS.1.1/2019","POLDA NTB","Undangan  Monitoring malamm pergantian tahun baru","Undangan","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("388","171","-"," KANWIL KEMENAG PROV NTB","Undangan Hari AmaL Bhakti ke - 74","Undangan","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("389","172","-","PERADI ","Undangan  Pengangkatan dan penyumpahan Calon advokad PERADI","Undangan","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("390","136","09/POKJA/I/PKK.DES/XII/2019","PKK","Permohonan narasumber ","Permohonan Narasumber","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("391","449","045/1/45/ORG/2019","SEKDA LOTENG","Permohonan audiensi","Biasa","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("392","39","SE/90/XII/KA/KP.04/2019/BNN","BNN RI","Penundaan penyesuaian jabatan pelaksana dan fungsional di lingkungan BNN ","SE/SKEP","-","2019-12-31","2019-12-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("393","450","B/4622/XII/RO/HM.00/2019/BNN","BNN RI","Pelaksanaan rapat dan kegiatan kementrian / Lembaga yang menghadiri kepala daerah","Biasa","-","2020-01-02","2020-01-02","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("394","1","B/020/DIKLATSAR VID/I/2020","SATUAN  KARYA DIRGANTARA","Permohonan narasumber","Permohonan Narasumber","-","2020-01-03","2020-01-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("395","1","B/4612/XII/DT/DT.00.03/2019/BNN","BNN RI","Permohonan nama petugas entri data SIN P4GN ","Biasa","7","2020-01-03","2020-01-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("396","2","442.5/U/YM/RSJMS/2020","BLUD RSJ MUTIARA SUKMA","Laporan perkembangan pelaksana rehabilitasi
an Atak dan L.Muh Gajali","Biasa","-","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("397","3","001/FISIP/NA/Magang/I/2020","UNMUH MATARAM","Permohonan magang","Biasa","1 Gabung","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("398","4","B/08/I/RES.4.2/2020","POLRES LOMBOK UTARA","Permohonan team assesment terpadu","Biasa","1 Gabung","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("399","5","B/07/I/RES.4.2/2020","POLRES LOMBOK UTARA","Permohonan team assesment terpadu","Biasa","-","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("400","6","B/28/I/Ka/SU.05/2020/BNNK-BIMA","BNNK BIMA","Usulan perubahan jabatan personil BNNK BIMA","Biasa","-","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("401","7","-","SMA 2 MATARAM","Permohonan dana /sponsorsip","Biasa","1 Proposal","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("402","8","-","SMK N 3 MATARAM","Permohonan sponsorship / dana","Biasa","1 Proposal","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("403","9","B-34/Menwa/Ummat/LFPB/I/2020","UNMUH MATARAM","Permohonan Dana","Biasa","1 Proposal","2020-01-07","2020-01-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("404","1","B/112/I/KEP/2020","POLDA NTB","UNDANGAN PENJEMPUTAN KAPOLDA NTB","Undangan","-","2020-01-08","2020-01-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("405","10","B/10/I/Ka/RH.00/2020/BNNK MATARAM","BNNK MATARAM","Permohonan Nama TAT","Biasa","-","2020-01-08","2020-01-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("406","11","002/DPW.NTB/SP/K/I/2020","FORUM INDONESIA ANTI NARKOBA","Permohonan audiensi","Biasa","-","2020-01-08","2020-01-08","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("407","2","-","POLDA NTB","Undangan pisah sambut KAPOLDA NTB","Undangan","1","2020-01-10","2020-01-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("408","1","SE/3/I/KA/IR.04/2020/BNN","BNN RI","Pembangunan zona integritas menuju wilayah bebas dari korupsi dan wilayah birokrasi bersih dan melayani di lingkungan BNN tahun 2020","SE/SKEP","-","2020-01-10","2020-01-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("409","12","093/PKL/D III/UTM/I/2020","UTM","Permohonan PKL ","Biasa","-","2020-01-10","2020-01-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("410","13","B/4085/XI/RO/LG.00/2019/BNN","BNN RI","Permintaan data ukuran pakaian dinas","Biasa","-","2020-01-10","2020-01-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("411","14","Sprin/62/I/KA/SU.00/2020/BNNK-BIMA","BNNK BIMA","Rekomendasi Alih status an Ardiansyah, S.E.M.M","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("412","15","-","PT.FORISA NUSAPERSADA","Surat permohonan demo / event/aktivitas promosi","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("413","16","B/19/I/Ka/SU.05/2020/BNNKab","BNNK SUMBAWA","Rekomendasi mutasi/pindah an Ahmad, A.Md","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("414","17","B/008/I/Ka/Su.05/2020/BNNK-SB","BNNK SUMBAWA BARAT","Mutasi Pegawai ","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("415","18","B/16/I/Ka/SU.04/2020/BNNKab","BNNK SUMBAWA","Pengiriman laporan pelaksanaan tugas kepala BNN Kab Sumbawa Bulan Oktober , November , dan Desember 2019","Biasa","1 Gabung","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("416","19","-","H.YUSUP, SH.MH","Permohonan pinjam pakai kendaraan ","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("417","20","B/I/I/REN 4. 1.3/2020/Ditresnarkoba","POLDA NTB","Pengiriman nama personil sebagai TAT TA 2020","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("418","21","02/Pan-P4GN/KKN/UNRAM/I/2020","UNRAM","Peminjaman perlengkapan ","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("419","22","LB.02.01/1.1/74/2020","POLITEKNIK KESEHATAN KEMENKES MATARAM","Permohonan surat rekomendasi studi pendahuluan penelitian dan pengambilan data ","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("420","23","B/26/I/IR/IR.01.03/2020/BNN RI","BNN RI","Penyampaian Catatan Hasil Reviu (CHR) Penilaian Kembali (Revaluasi)
BMN di Lingkungan BNN","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("421","24","B/ND-34/I/IR/IR.00.00/2020/INS","BNN RI","Evaluasi Pengumuman RUP T.A 2020 melalui Aplikasi Sistem Informasi Rencana Pengadaan pada Satker Pusat , Satker BNNP dan Satker Balai /Loka Rehabilitasi ","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("422","25","B/ND-22/I/IR/IR.00.03/2020/INS","BNN RI","Laporan Hasil Monitoring dan Reviu penilaian kembali BMN di Lingkungan BNN","Biasa","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("423","2","43/KKN-Terong Tawah /UM /I/2020","UNRAM KKN TERONG TAWAH","Permohonan pemateri","Permohonan Narasumber","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("424","3","21/MT AL-H/seminar/V/20","PENGURUS MAJALIS TAKLIM AL-HIDAYAH","Permohonan sebagai narasumber","Permohonan Narasumber","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("425","4","01/Pan-P4GN/KKN/UNRAM/I/2020","KKN TEMATIK UNRAM 2019/2020","Permohonan narasumber ","Permohonan Narasumber","-","2020-01-14","2020-01-14","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("426","26","001/GCC/I/2020","GELOGOR FUNBIKE ","Permohonan Dana","Biasa","1 Proposal","2020-01-15","2020-01-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("427","27","04/Pem/Twg","KANTOR LURAH TIWUGALIH","Surat rekomendasi","Biasa","-","2020-01-15","2020-01-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("428","28","01/MVL/Lombok Barat/2020","PANITIA MAVILA COMPETESION ","Surat pengantar kegiatan ","Biasa","1 Proposal","2020-01-15","2020-01-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("429","29","B/101/I/IR/IR.04.04/2020/BNNP-NTB","BNN RI","Permintaan penyampaian laporan harta kekayaan paratur sipil negara di lingkungan BNN","Biasa","-","2020-01-15","2020-01-15","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("430","5","05/KKN-TMK/UM/e/I/2020","KKN UNRAM KEC PUJUT ","Permohonan narasumber","Permohonan Narasumber","-","2020-01-16","2020-01-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("431","6","012/S.Sos/ARF.DG/VIII/2020","ARUS FOUNDATION ","Permohonan sosialisasi ","Permohonan Narasumber","-","2020-01-16","2020-01-16","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("432","30","020/Sekr/BKOW.NTB/I/2020","BKOW","Ucapan Terima kasih ","Biasa","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("433","31","SP-05/DLPGLBK-ACB/I/2020","PT.ABADI CITRA BERSAMA ","Permohonan pemeriksaan bebas narkoba","Biasa","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("434","32","-","BNNK SUMBAWA","Surat permohonan mutasi  pindah ","Biasa","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("435","33","B/21/I/TM/HM.04/2020/TM","BALAI REHABILITASI BNN TANAH MERAH SAMARINDA","Persetujuan kunjungan kerja","Biasa","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("436","34","B/123/I/RO/OT.00/2020/BNN","BNN RI","MONEV Pelaksanaan reformasi birokrasi ","Biasa","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("437","7","0006/074/JRJOMU/2020","PLTU JERANJANG","Undangan narasumber ","Permohonan Narasumber","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("438","8","067/II.3.AU/F/I/2020","Universitas muhammadyah mataram","Permohonan persetujuan magang ","Biasa","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("439","9","B/317/I/RES.4.2/2020/Ditresnarkoba","POLDA NTB","Permintaan assesment","Biasa","-","2020-01-17","2020-01-17","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("440","10","B/019/Ka/SU.05/2020/BNNK-SB ","BNNK SUMBAWA BARAT","Usulan petugas pengelola website","Biasa","-","2020-01-20","2020-01-20","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("441","8","1.003/HR/ASR/I/2020","ARUNA SENGGIGI","Permohonan narasumber ","Permohonan Narasumber","-","2020-01-20","2020-01-20","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("442","11","006/UP/MTR/I/2020","PT.UDAYANA PUTRA ","Permohonan tes narkoba","Biasa","-","2020-01-21","2020-01-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("443","12","B/19/I/RES.4.2/2020/Resnarkoba","POLRES LOBAR","permohonan  assesmen oleh tim assesmen terpadu ","Biasa","-","2020-01-21","2020-01-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("444","13","B/137/I/DT/DT.00.03/2020/BNN","BNN RI ","Permintaan inventaris aplikasi di lingkungan BNNP/BNNK","Biasa","-","2020-01-21","2020-01-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("445","9","-","KKN UNRAM DESA SUKANDA","Permohonan narasumber ","Permohonan Narasumber","-","2020-01-21","2020-01-21","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("446","10","02/KKN/UNRAM/I/2020","UNRAM ","Permohonan narasumber ","Permohonan Narasumber","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("447","11","01/B/PP/UKM-Upakara/STAHN/I/2020","STAHN ","Permohonan narasumber ","Permohonan Narasumber","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("448","12","01/KKN/UNRAM/1/2020","KKN UNRAM ","Permohonan narasumber ","Permohonan Narasumber","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("449","14","-","BKKBN","Ucapan terima kasih ","Biasa","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("450","15","B/99/I/Ka/SU.05/2020/BNNK-BIMA","BNN KAB BIMA","Usulan perubahan jabatan ","Biasa","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("451","16","B/147/I/DE/RH.03/2020/BNN","BNN RI","pemberitahuan tentang perubahan mekanisme peningkatan kemampuan LRKM Tahun 2020","Biasa","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("452","17","B/460/I/KEP/2020/Ro SDM ","POLDA NTB","Kirim nama anggota TAT TA 2020","Biasa","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("453","18","W21/EBM.UM.023.06","BALAI PERMASYARAKATAN MATARAM","Permohonan nama anggota TAT ","Biasa","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("454","19","B/121/I/SU/KU.01/2020/BNN","BNN RI","Langkah langkah pelaksana awal tahun 2020","Biasa","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("455","20","B/20/I/Ka/SU.07/2020/BNNK-MTR","BNNK MATARAM","Permohonan usulan operator website","Biasa","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("456","3","-","KANWIL KEMENKUMHAM NTB","Undangan deklarasi janji kinerja tahun 2020","Undangan","-","2020-01-23","2020-01-23","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("457","21","441/210/YM/RSJMS/2020","RSJ MUTIARA SUKMA","Balasan surat permohonan TAT ","Biasa","1 Lembar ","2020-01-24","2020-01-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("458","22","B/471/I/RES.4.2/2020/Ditresnarkoba","POLDA NTB","Permohonan TAT ","Biasa","1 EXEMPLAR","2020-01-24","2020-01-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("459","4","B/UND-36/I/SU/PR.02.00/2020/BNNP-NTB","BNN RI","Undangan Rapat tingkat pimpinan tahun 2020","Undangan","-","2020-01-24","2020-01-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("460","5","-","KANWIL MENKUMHAM ","Upacara hari bhakti imigrasi ke- 70","Undangan","-","2020-01-24","2020-01-24","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("461","6","B/87/I/LIT.5/2020/SETUM","MABES POLRI","Undangan Rapim POLRI ","Undangan","-","2020-01-27","2020-01-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("462","13","007/FMHTSTR/I/e/2020","FMH TASTURA","Permohonan pemateri ","Permohonan Narasumber","-","2020-01-27","2020-01-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("463","7","-","SUARA NTB","Undangan Diskusi terbatas ","Undangan","-","2020-01-27","2020-01-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("464","23","007/FMH TSTR/I/e/2020","FMH TASTURA","Permohonan audiensi ","Biasa","-","2020-01-27","2020-01-27","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("465","24","B/32/BB/RH.06/I/2020/BNN","BALAI BESAR REHABILITASI","Informasi klien pascarehabilitasi ","Biasa","-","2020-01-28","2020-01-28","","Yth Kabid Rehabilitasi ","Untk di pantau dan di Tindak Lnjuti ","1");
INSERT INTO tbl_surat_masuk VALUES("466","25","B/27/Ka/RH.06/2020/BNNKab ","BNNK SUMBAWA","Usulan Penetapan TAT di lingkungan BNN Kab Sumbawa Tahun 2020","Biasa","-","2020-01-28","2020-01-28","","Yth.Kabid Rehabilitasi ","Untuk di tindak lanjutgi ","1");
INSERT INTO tbl_surat_masuk VALUES("467","26","0055/14.18/PB/2020","KANTOR BAHASA NTB","Pengiriman Terbitan ","Biasa","2 BUKU","2020-01-28","2020-01-28","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("468","27","S-35/WPB.23/2020","DJPB","Peningkatan kualitas perencanaan pada DIPA Tahun 2020","Biasa","-","2020-01-28","2020-01-28","","Yth.Kasubag Perencanaan ","Untuk dipedomani dalam pelaksanaan revisi ","1");
INSERT INTO tbl_surat_masuk VALUES("469","28","b/250/i/de/pm.00/2020/bnn","BNN RI","Pemberitahuan standar alat tes urine ","Biasa","-","2020-01-28","2020-01-28","","Yth.Para Kabid ","Mulai Tahun 2020 ada perubahan alat tes urine,  untuk di pedomansi","1");
INSERT INTO tbl_surat_masuk VALUES("470","29","B/158/I/DE/RH.03/2020/BNN","BNN RI ","Pemberithauan tentang mekanisme pelaksanaan pemulihan berbasis masyarkat (PBM)","Biasa","-","2020-01-28","2020-01-28","","Yhh.Kabid Rehabilitasi ","untuk di pedomani ","1");
INSERT INTO tbl_surat_masuk VALUES("471","30","B/251/I/DE/PC/2020/BNN","BNN RI","Laporan pemulangan WNI Terbebas dari hukuman Tahanan Kasus Narkoba","Biasa","-","2020-01-28","2020-01-28","","Yth.Kabid Pemberantasan ","Untuk diketahui ","1");
INSERT INTO tbl_surat_masuk VALUES("472","31","B/Und-61/I/DE/PC/2020/BNN","BNN RI","Undangan BIMTEK Bidang Pencegahan ","Biasa","-","2020-01-28","2020-01-28","","Yth.Kabid p2m","-agar menugaskan kasi pencegahan untuk hadir kegiatan ini ","1");
INSERT INTO tbl_surat_masuk VALUES("473","14","01/LPMD/01/20","LPMD","Permohonan narasumber ","Permohonan Narasumber","-","2020-01-29","2020-01-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("474","8","B/UND-45/I/DE/RH.03/2020/BNN","BNN RI","Undangan kegiatan BIMTEK  dan workshop layanan rehabilitasu rawat inap ","Undangan","-","2020-01-29","2020-01-29","","Yth.Kabid Rehabilitasi ","Agar saudara ibu yati hadir ","1");
INSERT INTO tbl_surat_masuk VALUES("475","9","B/Und-238/I/SU/PR.04/2020/BNN","BNN RI ","Undangan Sinkronisasi Penyusunan LKIP Pusat dan Daerah Tahun 2019","Undangan","-","2020-01-29","2020-01-29","","Yth.Kasubag Perencanaan ","agar menyiapkan bahan untuk kegiatan tersebut ","1");
INSERT INTO tbl_surat_masuk VALUES("476","10","005/109/DPRD/2020","DPRD PROV NTB","Undangan Rapat Paripurna ","Undangan","-","2020-01-29","2020-01-29","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("477","32","B/111/Ka/RH.00.00/2020/BNNK-BIMA","BNNK BIMA","Penerbitan SK Anggota TAT di lingkungan BNNK bima  ","Biasa","-","2020-01-29","2020-01-29","","Yth.Kabid Rehabilitasi ","-Tindak lanjuti ","1");
INSERT INTO tbl_surat_masuk VALUES("478","11","005/243/TU/RSJMS/2020","BLUD RSJ MUTIARA SUKMA","Undangan Peringatan Hari Ulang Tahun RSJ Mutiara Sukma Tahun 2020","Undangan","-","2020-01-29","2020-01-29","","ADMIN","arsip","1");
INSERT INTO tbl_surat_masuk VALUES("479","33","440/264/Kes/I/2020","DINKES","BIMTEK ke klinik","Biasa","-","2020-01-30","2020-01-30","","Yth.Kabid Rehabilitasi ","-Agar menyiapkan bahan yang diperlukan terkait BIMTEK klinik pratama","1");
INSERT INTO tbl_surat_masuk VALUES("480","34","800/81/BPSDMD/PKMF/2020","BPSDMD","Pengumuman KKP Peserta Diklatpim Tingkat IV","Biasa","-","2020-01-30","2020-01-30","","Yth.Kabag Umum","-Untuk di ketahui","1");
INSERT INTO tbl_surat_masuk VALUES("481","12","B.01/SET/DWP PROV.NTB/I/2020","DHARMAWANITA","Undangan Pengajian ","Undangan","-","2020-01-30","2020-01-30","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("482","13","-","POLDA NTB","Undangan pembukaan KEJURPROV INKAI","Undangan","-","2020-01-31","2020-01-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("483","35","-","Diaz Thoha Mukhtar Zain.A.md Kom ","Lamaran pekerjaan ","Biasa","-","2020-01-31","2020-01-31","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("484","36","-","BNNK MATARAM","Permohonan alih status ","Biasa","-","2020-01-31","2020-01-31","","Yth.Kasubag admin","-segera usulkan ","1");
INSERT INTO tbl_surat_masuk VALUES("485","37","B/34/I/Ka/SU.05/2020/BNNKab","BNNK SUMBAWA","Rekomendasi mutasi an Ellyah Andriany S.KM","Biasa","-","2020-01-31","2020-01-31","","Yth.Kasubag admin ","segera usulkan statusnya ","1");
INSERT INTO tbl_surat_masuk VALUES("486","38","025/PPNK-1942/UKM-KMHD","UNRAM ","Permohonan partisipasi ","Biasa","-","2020-02-03","2020-02-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("487","39","R-278/I/LPSK/01/2020","LEMBAGA PELINDUNGAN SAKSI DAN KORBAN","Mekanisme penerapan saksi pelaku ","Biasa","-","2020-02-03","2020-02-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("488","40","W21.UM.01.01-39","LEMBAGA PEMASYARAKATAN PEREMPUAN  KLS III MATARAM","Pelaksanaan tes urine ","Biasa","-","2020-02-03","2020-02-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("489","41","093/PENG/PKL/D-3/UTM/II/2020","UNIVERSITAS TEHNOLOGI MATARAM ","Daftar nilai dan evaluasi dan jadwal kegiatan PKL","Biasa","-","2020-02-03","2020-02-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("490","42","079/II.3.AU/F/I/2020","UNMUH MATARAM ","Permohonan bimbimngan dan arahan kegiatan magang ","Biasa","-","2020-02-03","2020-02-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("491","43","824.4/265/BKD/2020","SEKDA ","Permohonan ASN di pekerjakan pada BNN PROV NTB ","Biasa","-","2020-02-03","2020-02-03","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("492","15","06/PPM-LTD/NTB/2020","PANITIA PEMILIHAN PUTERI MANDALIKA ","Mohon menjadi nrasumber ","Permohonan Narasumber","-","2020-02-06","2020-02-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("493","44","B/059/KP.07.06/SAR MTR/2020","BASARNAS","PERMOHONAN PEMERIKSAAN NARKOBA ","Biasa","-","2020-02-06","2020-02-06","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("494","14","0051/5/Kesmas/II/2020","DINKES","Undangan hari Gizi Nasional ","Undangan","-","2020-02-07","2020-02-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("495","15","0258/RECFON-DIR/S-70/II/2020","SEAMEO RECFON","Undangan pertemuan ","Undangan","-","2020-02-07","2020-02-07","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("496","45","B/24/II/RES.4.2/2020","POLRES LOMBOK UTARA","Permohonan team assesment terpadu","Biasa","1 Gabung","2020-02-07","2020-02-07","","Yth Kabid Rehab","Proses sesuai aturan","1");
INSERT INTO tbl_surat_masuk VALUES("497","46","B/191/II/Ka/Su.05/2020/BNNK BIMA","BNN KAB BIMA","Permohonan kepastiann posisi personil","Biasa","-","2020-02-10","2020-02-10","","Yth.Kabag Umum ","Tarik menjadi personil ","1");
INSERT INTO tbl_surat_masuk VALUES("498","47","B/42/II/PL/PL02/2020/Pusat Lab ","PUSAT LAB NARKOTIKA ","penyampaian bahan informasi terkait pembentukan zona integritas ","Biasa","-","2020-02-10","2020-02-10","","Yth.Kabag Umum ","Untuk dipedomani ","1");
INSERT INTO tbl_surat_masuk VALUES("499","48","76/PK.02/J4/2020","BKKBN","Pemanggilan peserta pengembangan dan penyediaan modul, materi dan media penyiapan perencanaan kehidupan berkeluarga bagi remaja (PKBR) di kelompok bina keluarga remaja (BKR) sesuai dengan kearifan lokal ","Biasa","-","2020-02-10","2020-02-10","","Yth.Kabag Umum ","Saran saya yang ikut ","1");
INSERT INTO tbl_surat_masuk VALUES("500","49","77/PK.02/J4/2020","BKKBN","Pemanggilan peserta pengembangan dan penyediaan modul, materi dan media penyiapan perencanaan kehidupan berkeluarga bagi remaja (PKBR) di kelompok PIK R sesuai dengan kearifan lokal ","Biasa","-","2020-02-10","2020-02-10","","saran","-","1");
INSERT INTO tbl_surat_masuk VALUES("501","50","-","BNNK Sumbawa barat ","Permohonan  alih status ","Biasa","-","2020-02-10","2020-02-10","","Yth Kabag Umum ","proses sesuai aturan ","1");
INSERT INTO tbl_surat_masuk VALUES("502","16","-","GUBERNUR NTB ","Undangan creative dialogue dan mandalika fashion ","Undangan","-","2020-02-10","2020-02-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("503","17","-","GUBERNUR NTB ","FESTIVAL PESONA BAU NYALE ","Undangan","-","2020-02-10","2020-02-10","","-","-","1");
INSERT INTO tbl_surat_masuk VALUES("504","51","B/41/Ka/SU.05/2020/BNNK SB","BNNK SUMBAWA","Permohonan sebagai pegawai BNNK  sumbawa ","Biasa","-","2020-02-10","2020-02-10","","Yth.Kabag Umum ","Proses sesuai dengan aturan ","1");
INSERT INTO tbl_surat_masuk VALUES("505","52","B/343/II/DT/DT.01.02/2020/BNN","PUSLIDATIN","Penyampaian buku hasil ","Biasa","2 buku ","2020-02-10","2020-02-10","","Yth.Kabag Umum ","buku ada di pimpinan ","1");



DROP TABLE tbl_user;

CREATE TABLE `tbl_user` (
  `id_user` tinyint(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nip` varchar(25) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO tbl_user VALUES("1","arsipbnnpntb","87f37fb7bc5c85a00944f3ab05f084a8","Admin","-","1");



