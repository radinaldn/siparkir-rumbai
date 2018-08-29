-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2018 at 02:13 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sistemparkir`
--

-- --------------------------------------------------------

--
-- Table structure for table `hak_akses`
--

CREATE TABLE IF NOT EXISTS `hak_akses` (
  `id_user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hak_akses`
--

INSERT INTO `hak_akses` (`id_user`, `password`, `level`) VALUES
('admin', 'admin', 'admin'),
('security', '12345', 'security');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama_mahasiswa` varchar(30) DEFAULT NULL,
  `alamat` varchar(35) DEFAULT NULL,
  `fakultas` varchar(30) NOT NULL,
  `jk` char(2) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama_mahasiswa`, `alamat`, `fakultas`, `jk`, `foto`) VALUES
('11451105280', 'Rahmat Parlindungan', 'JL.Yossudarso', 'FAKULTAS TEKNIK', 'Lk', '11451105280.jpg'),
('11451105830', 'Randi pangestu', 'JL. Jendral', 'FAKULTAS TEKNIK', 'Lk', '11451105830.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `parkir`
--

CREATE TABLE IF NOT EXISTS `parkir` (
`id_parkir` int(11) NOT NULL,
  `id_pengguna` varchar(11) DEFAULT NULL,
  `jam_masuk` timestamp NULL DEFAULT NULL,
  `jam_keluar` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `parkir`
--

INSERT INTO `parkir` (`id_parkir`, `id_pengguna`, `jam_masuk`, `jam_keluar`) VALUES
(1, '0012036088', '2018-08-29 05:30:46', '2018-08-29 05:31:27'),
(2, '123456', '2018-08-29 05:30:51', '2018-08-29 05:31:44'),
(3, '123456', '2018-08-29 05:37:08', '2018-08-08 17:00:00'),
(4, '123456', '2018-08-29 05:42:55', '2018-08-29 05:43:01'),
(5, '123456', '2018-08-28 23:15:07', '2018-08-28 23:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
  `nip` varchar(20) NOT NULL,
  `nama_pegawai` varchar(30) DEFAULT NULL,
  `alamat` varchar(35) DEFAULT NULL,
  `jk` char(2) NOT NULL,
  `jabatan` varchar(30) NOT NULL,
  `gol` varchar(4) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama_pegawai`, `alamat`, `jk`, `jabatan`, `gol`, `foto`) VALUES
('19805088201001007', 'Rahmad Al Riyan', 'Jl Gabus', 'L', 'Dosen', 'IVC', '19805088201001007.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna_parkir`
--

CREATE TABLE IF NOT EXISTS `pengguna_parkir` (
  `id_pengguna` varchar(11) NOT NULL,
  `nipnimnik` varchar(20) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna_parkir`
--

INSERT INTO `pengguna_parkir` (`id_pengguna`, `nipnimnik`, `status`) VALUES
('0012036088', '19805088201001007', 'Pegawai'),
('123456', '11451105280', 'Mahasiswa'),
('12345678900', '14710001', 'Tamu');

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE IF NOT EXISTS `tamu` (
  `nik` varchar(20) NOT NULL,
  `no_kendaraan` varchar(20) NOT NULL,
  `no_stnk` varchar(20) NOT NULL,
  `jenis_kendaraan` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(35) NOT NULL,
  `jk` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`nik`, `no_kendaraan`, `no_stnk`, `jenis_kendaraan`, `nama`, `alamat`, `jk`) VALUES
('14710001', 'BM 3202 JL', '1234567890', 'Mobil', 'satya lanang', 'Jl.Riau', 'Lk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hak_akses`
--
ALTER TABLE `hak_akses`
 ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
 ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `parkir`
--
ALTER TABLE `parkir`
 ADD PRIMARY KEY (`id_parkir`), ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
 ADD PRIMARY KEY (`nip`), ADD KEY `nama_pegawai` (`nama_pegawai`);

--
-- Indexes for table `pengguna_parkir`
--
ALTER TABLE `pengguna_parkir`
 ADD PRIMARY KEY (`id_pengguna`), ADD KEY `nipnim` (`nipnimnik`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
 ADD PRIMARY KEY (`nik`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parkir`
--
ALTER TABLE `parkir`
MODIFY `id_parkir` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `parkir`
--
ALTER TABLE `parkir`
ADD CONSTRAINT `parkir_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna_parkir` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
