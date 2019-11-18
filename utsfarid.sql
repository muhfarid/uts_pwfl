-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Nov 2019 pada 07.18
-- Versi server: 10.1.36-MariaDB
-- Versi PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `baru`
--

CREATE TABLE `baru` (
  `id` int(11) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `nama_mhs` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `baru`
--

INSERT INTO `baru` (`id`, `nim`, `nama_mhs`, `jenis_kelamin`, `alamat`, `no_hp`) VALUES
(1, '161240000533', 'Qorinul Hikam Ihsanillah', 'Laki-laki', 'Kauman', '7979'),
(2, '161240000532', 'Mahardika Widi H. A.', 'Laki-Laki', 'Panggang', '08956744321'),
(3, '161240000551', 'Retno Nur Cahyanti', 'Perempuan', 'Demaan', '08767890987'),
(4, '161240000589', 'Desy Amelina Suryani', 'Perempuan', 'Bangsri', '08765489054'),
(5, '161240000550', 'Ibrahim Dasuki', 'Laki-Laki', 'Mulyoharjo', '081236789546'),
(6, '161240000512', 'Septiar Robert', 'Perempuan', 'mambak', '080706565865');

--
-- Trigger `baru`
--
DELIMITER $$
CREATE TRIGGER `BEFORE_UPDATE` BEFORE UPDATE ON `baru` FOR EACH ROW BEGIN
	INSERT INTO log
    SET id = OLD.id,
    nim = OLD.nim,
    no_hp_lama = OLD.no_hp,
    no_hp_baru = OLD.no_hp,
    tgl_diubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `no_hp_lama` varchar(30) NOT NULL,
  `no_hp_baru` varchar(30) NOT NULL,
  `tgl_diubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id`, `nim`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
(0, '161240000533', '0895339229040', '00', '2019-11-04 21:13:23'),
(1, '161240000533', '00', '00', '2019-11-10 22:23:15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `nis` varchar(30) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `uts` int(11) NOT NULL,
  `uas` int(11) NOT NULL,
  `rata_rata` int(11) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `tampil`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tampil` (
`id` int(11)
,`nim` varchar(30)
,`nama_mhs` varchar(50)
,`jenis_kelamin` varchar(50)
,`alamat` varchar(50)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `tampil`
--
DROP TABLE IF EXISTS `tampil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil`  AS  (select `baru`.`id` AS `id`,`baru`.`nim` AS `nim`,`baru`.`nama_mhs` AS `nama_mhs`,`baru`.`jenis_kelamin` AS `jenis_kelamin`,`baru`.`alamat` AS `alamat`,`baru`.`no_hp` AS `no_hp` from `baru`) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `baru`
--
ALTER TABLE `baru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`nis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `baru`
--
ALTER TABLE `baru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
