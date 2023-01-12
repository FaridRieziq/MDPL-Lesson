-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2023 at 01:01 AM
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
-- Database: `manajemen_inventori_perusahaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `BUILDING_CODE` varchar(20) NOT NULL,
  `BUILDING_NAME` varchar(255) DEFAULT NULL,
  `BUILDING_MANAGER` varchar(20) DEFAULT NULL,
  `BUILDING_ADDR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`BUILDING_CODE`, `BUILDING_NAME`, `BUILDING_MANAGER`, `BUILDING_ADDR`) VALUES
('B01', 'Gedung A', 'E05', 'Jl. Jenderal Sudirman No.1'),
('B02', 'Gedung B', 'E06', 'Jl. Jenderal Gatot Subroto No.2'),
('B03', 'Gedung C', 'E07', 'Jl. Jenderal Sudirman No.3');

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `DIVISION_ID` varchar(10) NOT NULL,
  `DIVISION_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`DIVISION_ID`, `DIVISION_NAME`) VALUES
('D01', 'ACCOUNTING'),
('D02', 'Marketing'),
('D03', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EMPLOYEE_CODE` varchar(20) NOT NULL,
  `EMPLOYEE_FIRST_NAME` varchar(25) DEFAULT NULL,
  `EMPLOYEE_LAST_NAME` varchar(25) DEFAULT NULL,
  `EMPLOYEE_POSITION` varchar(255) DEFAULT NULL,
  `MANAGER_CODE` varchar(20) DEFAULT NULL,
  `DIVISION_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EMPLOYEE_CODE`, `EMPLOYEE_FIRST_NAME`, `EMPLOYEE_LAST_NAME`, `EMPLOYEE_POSITION`, `MANAGER_CODE`, `DIVISION_ID`) VALUES
('E01', 'John', 'Smith', 'Staff', 'E01', 'D01'),
('E02', 'Michael', 'Jordan', 'Manager', 'E02', 'D02'),
('E03', 'David', 'Wilson', 'Director', 'E03', 'D03');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ITEM_LABEL` varchar(255) NOT NULL,
  `RECEIVED_DATE` date NOT NULL,
  `ITEM_ID` varchar(20) DEFAULT NULL,
  `SUPPLIER_CODE` varchar(20) DEFAULT NULL,
  `ROOM_NUMBER` varchar(20) DEFAULT NULL,
  `ITEM_CAT_ID` varchar(10) DEFAULT NULL,
  `EMPLOYEE_CODE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ITEM_LABEL`, `RECEIVED_DATE`, `ITEM_ID`, `SUPPLIER_CODE`, `ROOM_NUMBER`, `ITEM_CAT_ID`, `EMPLOYEE_CODE`) VALUES
('Kompor Gas', '2020-12-12', 'I03', 'S03', '103', '3', 'E03'),
('Macbook Pro', '2020-08-18', 'I01', 'S01', '101', '1', 'E01'),
('Meja Kantor', '2021-12-14', 'I02', 'S02', '102', '2', 'E02');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `ITEM_CAT_ID` varchar(10) NOT NULL,
  `ITEM_CAT` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`ITEM_CAT_ID`, `ITEM_CAT`) VALUES
('1', 'Elektronik'),
('2', 'Furnitur'),
('3', 'Makanan & Minuman');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SUPPLIER_CODE` varchar(20) NOT NULL,
  `SUPPLIER_NAME` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`SUPPLIER_CODE`, `SUPPLIER_NAME`) VALUES
('S01', 'TechAndWin'),
('S02', 'Toko Furnitur Jaya'),
('S03', 'Sembako Makmur');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`BUILDING_CODE`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`DIVISION_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EMPLOYEE_CODE`),
  ADD KEY `fk_employee` (`DIVISION_ID`),
  ADD KEY `fk_employe_manager` (`MANAGER_CODE`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ITEM_LABEL`,`RECEIVED_DATE`),
  ADD KEY `fk_item_supplier` (`SUPPLIER_CODE`),
  ADD KEY `fk_item_category` (`ITEM_CAT_ID`),
  ADD KEY `fk_item_employee` (`EMPLOYEE_CODE`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`ITEM_CAT_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SUPPLIER_CODE`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employe_manager` FOREIGN KEY (`MANAGER_CODE`) REFERENCES `employee` (`EMPLOYEE_CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`DIVISION_ID`) REFERENCES `division` (`DIVISION_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `fk_item_category` FOREIGN KEY (`ITEM_CAT_ID`) REFERENCES `item_category` (`ITEM_CAT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_employee` FOREIGN KEY (`EMPLOYEE_CODE`) REFERENCES `employee` (`EMPLOYEE_CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_supplier` FOREIGN KEY (`SUPPLIER_CODE`) REFERENCES `supplier` (`SUPPLIER_CODE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
