-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Des 2022 pada 09.20
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `kode_akun` varchar(4) NOT NULL,
  `nama_akun` varchar(25) DEFAULT NULL,
  `header_akun` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`kode_akun`, `nama_akun`, `header_akun`) VALUES
('456', 'Farid', '456'),
('567', 'Rieziq', '567'),
('789', 'Abdul', '789');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_jual`
--

CREATE TABLE `detail_jual` (
  `no_nota` varchar(4) NOT NULL,
  `kode_kue` varchar(4) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_jual`
--

INSERT INTO `detail_jual` (`no_nota`, `kode_kue`, `jumlah`, `harga_satuan`, `subtotal`) VALUES
('011', '141', 10, 15000, 150000),
('012', '142', 10, 12000, 120000),
('013', '143', 10, 13000, 130000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kue`
--

CREATE TABLE `jenis_kue` (
  `kode_jenis_kue` varchar(4) NOT NULL,
  `nama_jenis_kue` varchar(25) DEFAULT NULL,
  `jangka_expired` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jenis_kue`
--

INSERT INTO `jenis_kue` (`kode_jenis_kue`, `nama_jenis_kue`, `jangka_expired`) VALUES
('121', 'APM', '28 Oktober 2025'),
('122', 'PTU', '28 Juni 2025'),
('123', 'PKS', '28 Oktober 2025');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurnal_penjualan`
--

CREATE TABLE `jurnal_penjualan` (
  `kode_akun` varchar(4) NOT NULL,
  `no_nota` varchar(4) NOT NULL,
  `posisi_dr_cr` varchar(6) DEFAULT NULL,
  `nominal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurnal_penjualan`
--

INSERT INTO `jurnal_penjualan` (`kode_akun`, `no_nota`, `posisi_dr_cr`, `nominal`) VALUES
('456', '011', '12111', 100000),
('567', '012', '12121', 100000),
('789', '013', '21321', 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kue`
--

CREATE TABLE `kue` (
  `kode_kue` varchar(4) NOT NULL,
  `nama_kue` varchar(25) DEFAULT NULL,
  `harga_satuan` int(11) DEFAULT NULL,
  `kode_jenis_kue` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kue`
--

INSERT INTO `kue` (`kode_kue`, `nama_kue`, `harga_satuan`, `kode_jenis_kue`) VALUES
('141', 'APEM', 15000, '121'),
('142', 'PUTU', 12000, '122'),
('143', 'PUKIS', 13000, '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `outlet`
--

CREATE TABLE `outlet` (
  `kode_outlet` varchar(3) NOT NULL,
  `nama_outlet` varchar(25) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `outlet`
--

INSERT INTO `outlet` (`kode_outlet`, `nama_outlet`, `alamat`, `telp`) VALUES
('111', 'BAKERY', 'Sleman', '0898597289'),
('112', 'Messi Bakery', 'Bantul', '0897376722'),
('113', 'Mbappe Bakery', 'Gunung Kidul', '0897584322');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `no_nota` varchar(4) NOT NULL,
  `tgl_jual` date DEFAULT NULL,
  `total_jual` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL,
  `kode_outlet` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`no_nota`, `tgl_jual`, `total_jual`, `discount`, `total_bayar`, `kode_outlet`) VALUES
('001', '0000-00-00', 100000, 1000, 20000, '111'),
('002', '0000-00-00', 100000, 1000, 15000, '112'),
('003', '0000-00-00', 100000, 1000, 15000, '113'),
('011', '0000-00-00', 100000, 1000, 20000, '111'),
('012', '0000-00-00', 100000, 1000, 15000, '112'),
('013', '0000-00-00', 100000, 1000, 15000, '113');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kode_akun`),
  ADD KEY `fk_akun_header` (`header_akun`);

--
-- Indeks untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`no_nota`,`kode_kue`),
  ADD KEY `fk_detail_kue` (`kode_kue`);

--
-- Indeks untuk tabel `jenis_kue`
--
ALTER TABLE `jenis_kue`
  ADD PRIMARY KEY (`kode_jenis_kue`);

--
-- Indeks untuk tabel `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD PRIMARY KEY (`kode_akun`,`no_nota`),
  ADD KEY `fk_jurnal_penjualan` (`no_nota`);

--
-- Indeks untuk tabel `kue`
--
ALTER TABLE `kue`
  ADD PRIMARY KEY (`kode_kue`),
  ADD KEY `fk_kue_jenis` (`kode_jenis_kue`);

--
-- Indeks untuk tabel `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`kode_outlet`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`no_nota`),
  ADD KEY `fk_penjualan_outlet` (`kode_outlet`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `fk_akun_header` FOREIGN KEY (`header_akun`) REFERENCES `akun` (`kode_akun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `fk_detail_kue` FOREIGN KEY (`kode_kue`) REFERENCES `kue` (`kode_kue`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detail_penjualan` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jurnal_penjualan`
--
ALTER TABLE `jurnal_penjualan`
  ADD CONSTRAINT `fk_jurnal_penjualan` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jurnal_penjualan_akun` FOREIGN KEY (`kode_akun`) REFERENCES `akun` (`kode_akun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kue`
--
ALTER TABLE `kue`
  ADD CONSTRAINT `fk_kue_jenis` FOREIGN KEY (`kode_jenis_kue`) REFERENCES `jenis_kue` (`kode_jenis_kue`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_penjualan_outlet` FOREIGN KEY (`kode_outlet`) REFERENCES `outlet` (`kode_outlet`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
