-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 02:12 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualanroti`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `kode_akun` varchar(4) NOT NULL,
  `nama_akun` varchar(25) DEFAULT NULL,
  `header_akun` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `no_nota` varchar(4) NOT NULL,
  `kode_kue` varchar(4) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kue`
--

CREATE TABLE `jenis_kue` (
  `kode_jenis_kue` varchar(4) NOT NULL,
  `nama_jenis_kue` varchar(25) DEFAULT NULL,
  `jangka_expired` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_penjualan`
--

CREATE TABLE `jurnal_penjualan` (
  `kode_akun` varchar(4) NOT NULL,
  `no_nota` varchar(4) NOT NULL,
  `posisi_dr_cr` varchar(6) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kue`
--

CREATE TABLE `kue` (
  `kode_kue` varchar(4) NOT NULL,
  `nama_kue` varchar(25) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `kode_jenis_kue` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `kode_outlet` varchar(3) NOT NULL,
  `nama_outlet` varchar(25) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `no_nota` varchar(4) NOT NULL,
  `tgl_jual` date DEFAULT NULL,
  `total_jual` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL,
  `kode_outlet` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kode_akun`),
  ADD KEY `fk_akun_header` (`header_akun`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`no_nota`,`kode_kue`),
  ADD KEY `fk_detail_kue` (`kode_kue`);

--
-- Indexes for table `jenis_kue`
--
ALTER TABLE `jenis_kue`
  ADD PRIMARY KEY (`kode_jenis_kue`);

--
-- Indexes for table `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD PRIMARY KEY (`kode_akun`,`no_nota`),
  ADD KEY `fk_jurnal_penjualan` (`no_nota`);

--
-- Indexes for table `kue`
--
ALTER TABLE `kue`
  ADD PRIMARY KEY (`kode_kue`),
  ADD KEY `fk_kue_jenis` (`kode_jenis_kue`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`kode_outlet`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`no_nota`),
  ADD KEY `fk_penjualan_outlet` (`kode_outlet`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `fk_akun_header` FOREIGN KEY (`header_akun`) REFERENCES `akun` (`kode_akun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `fk_detail_kue` FOREIGN KEY (`kode_kue`) REFERENCES `kue` (`kode_kue`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detail_penjualan` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD CONSTRAINT `fk_jurnal_penjualan` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jurnal_penjualan_akun` FOREIGN KEY (`kode_akun`) REFERENCES `akun` (`kode_akun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kue`
--
ALTER TABLE `kue`
  ADD CONSTRAINT `fk_kue_jenis` FOREIGN KEY (`kode_jenis_kue`) REFERENCES `jenis_kue` (`kode_jenis_kue`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_penjualan_outlet` FOREIGN KEY (`kode_outlet`) REFERENCES `outlet` (`kode_outlet`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
