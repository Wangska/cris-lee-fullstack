-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2025 at 09:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `default`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2023-06-17 03:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `breeder_records`
--

CREATE TABLE `breeder_records` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `breeder_id` int(32) NOT NULL,
  `date_farrowed` date NOT NULL,
  `weaned_date` date NOT NULL,
  `total_piglets` int(32) NOT NULL,
  `survived` int(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `breeder_records`
--

INSERT INTO `breeder_records` (`id`, `breeder_id`, `date_farrowed`, `weaned_date`, `total_piglets`, `survived`) VALUES
(61, 3, '2025-07-01', '2025-08-10', 2, 2),
(62, 5, '2025-07-23', '2025-09-01', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `piglets`
--

CREATE TABLE `piglets` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `growinphase_id` int(32) NOT NULL,
  `name` varchar(122) NOT NULL,
  `gender` varchar(122) NOT NULL,
  `breed` varchar(122) NOT NULL,
  `status` varchar(122) NOT NULL,
  `move` int(32) NOT NULL DEFAULT 0,
  `posted` int(11) NOT NULL DEFAULT 0,
  `img` varchar(122) NOT NULL,
  `timesstampt` date NOT NULL DEFAULT (CURRENT_DATE),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piglets`
--

INSERT INTO `piglets` (`id`, `growinphase_id`, `name`, `gender`, `breed`, `status`, `move`, `posted`, `img`, `timesstampt`) VALUES
(19, 7, 'momy jupeta', 'Male', 'Landrace', 'Healthy', 0, 1, 'baktin1.jpg', '2025-09-05'),
(20, 7, 'yy', 'Male', 'Landrace', 'Posted', 1, 0, 'baktin1.jpg', '2025-09-05'),
(21, 7, 'ww', 'Female', 'Landrace', 'Healthy', 0, 0, 'baktin1.jpg', '2025-09-05'),
(22, 6, '1', 'Male', 'Landrace', 'Healthy', 0, 0, 'baboy.jpg', '2025-09-05'),
(23, 6, '2', 'Male', 'Landrace', 'Healthy', 0, 0, 'baktin1.jpg', '2025-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `piglets_qr`
--

CREATE TABLE `piglets_qr` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `piglet_id` int(32) NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `piglets_qr`
--

INSERT INTO `piglets_qr` (`id`, `piglet_id`, `img`) VALUES
(13, 19, 'img/qr_piglets/piglet_19.png'),
(14, 20, 'img/qr_piglets/piglet_20.png'),
(15, 21, 'img/qr_piglets/piglet_21.png'),
(16, 22, 'img/qr_piglets/piglet_22.png'),
(17, 23, 'img/qr_piglets/piglet_23.png');

-- --------------------------------------------------------

--
-- Table structure for table `tblculling`
--

CREATE TABLE `tblculling` (
  `id` int(32) NOT NULL,
  `name` varchar(122) NOT NULL,
  `age` varchar(123) NOT NULL,
  `status` varchar(122) NOT NULL,
  `amount` int(32) NOT NULL,
  `img` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblculling`
--

INSERT INTO `tblculling` (`id`, `name`, `age`, `status`, `amount`, `img`) VALUES
(3, 'tae', '6 Months', 'Culling', 0, 'baboy.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblfeeds`
--

CREATE TABLE `tblfeeds` (
  `id` int(32) NOT NULL,
  `feedsname` varchar(255) NOT NULL,
  `quantity` int(32) NOT NULL,
  `price` int(32) NOT NULL,
  `datepurchased` date NOT NULL,
  `consumedate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblgestatingguide`
--

CREATE TABLE `tblgestatingguide` (
  `id` int(32) NOT NULL,
  `sow_id` int(32) NOT NULL,
  `details` varchar(122) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblgrowingphase`
--

CREATE TABLE `tblgrowingphase` (
  `id` int(32) NOT NULL,
  `sow_id` int(32) NOT NULL,
  `sacks` int(32) NOT NULL,
  `sowname` varchar(255) NOT NULL,
  `pigs` int(32) NOT NULL,
  `male` int(32) NOT NULL,
  `female` int(32) NOT NULL,
  `mortality` int(32) NOT NULL,
  `weaneddate` date NOT NULL,
  `img` varchar(30) NOT NULL,
  `status` varchar(32) NOT NULL,
  `piggybloom` date NOT NULL,
  `prestarter` date NOT NULL,
  `starter` date NOT NULL,
  `grower` date NOT NULL,
  `finisher` date NOT NULL,
  `posted` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblgrowingphase`
--

INSERT INTO `tblgrowingphase` (`id`, `sow_id`, `sacks`, `sowname`, `pigs`, `male`, `female`, `mortality`, `weaneddate`, `img`, `status`, `piggybloom`, `prestarter`, `starter`, `grower`, `finisher`, `posted`) VALUES
(6, 3, 0, 'tae Piglets', 2, 1, 1, 0, '2025-08-10', 'baboy.jpg', 'PiggyBloom', '2025-09-10', '2025-09-30', '2025-10-30', '2025-12-19', '2026-01-03', '1'),
(7, 5, 0, 'jupeta Piglets', 3, 2, 1, 0, '2025-09-01', 'baboy.jpg', 'Finisher', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '2025-09-20', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblmanage`
--

CREATE TABLE `tblmanage` (
  `id` int(32) NOT NULL,
  `about` varchar(500) NOT NULL,
  `products` varchar(500) NOT NULL,
  `map` varchar(50) NOT NULL,
  `mobilenumber` varchar(32) NOT NULL,
  `phonenumber` varchar(32) NOT NULL,
  `emailaddress` varchar(32) NOT NULL,
  `img` varchar(32) NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblmanage`
--

INSERT INTO `tblmanage` (`id`, `about`, `products`, `map`, `mobilenumber`, `phonenumber`, `emailaddress`, `img`, `tag`) VALUES
(1, 'Ronalds Baboyan is a family-owned pig farming business with a passion for providing high-quality, sustainable, and ethically-raised pork products. Our journey began with a vision to deliver exceptional pork while prioritizing the well-being of our pigs. We take pride in creating a stress-free environment for our pigs and feeding them natural, nutritious feed. Our commitment to transparency and integrity sets us apart, as we believe in building lasting relationships with our customers.', 'Ronalds Piggery specializes in breeding and selling live pigs. Our focus is on providing healthy and genetically superior pig breeds to farmers and livestock enthusiasts. With years of experience and expertise in pig husbandry, we ensure that our pigs are well-cared for and raised in optimal conditions. By offering live pigs, we aim to support and contribute to the agricultural industry by supplying high-quality breeding stock and helping farmers establish successful pig farming operations.', 'aboutus.jpg', '9135432243', '1231312', 'ronaldsbaboyan@gmail.com', 'banner-image.jpg', 'We have more pigs for you to choose');

-- --------------------------------------------------------

--
-- Table structure for table `tblmessage`
--

CREATE TABLE `tblmessage` (
  `id` int(11) NOT NULL,
  `fullname` varchar(122) NOT NULL,
  `emailaddress` varchar(122) NOT NULL,
  `message` varchar(122) NOT NULL,
  `tbldate` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `status` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblorderdetails`
--

CREATE TABLE `tblorderdetails` (
  `id` int(32) NOT NULL,
  `sow_id` int(32) NOT NULL,
  `order_id` int(32) NOT NULL,
  `pig_id` int(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(244) NOT NULL DEFAULT 'Female',
  `age` varchar(244) NOT NULL,
  `price` varchar(32) NOT NULL,
  `quantity` int(32) NOT NULL,
  `weight_class` varchar(255) NOT NULL,
  `weight` int(32) NOT NULL,
  `piglet` int(32) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblorderdetails`
--

INSERT INTO `tblorderdetails` (`id`, `sow_id`, `order_id`, `pig_id`, `name`, `sex`, `age`, `price`, `quantity`, `weight_class`, `weight`, `piglet`) VALUES
(4, 5, 4, 7, '7', 'Male', '4', '1322', 1, '23', 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblorders`
--

CREATE TABLE `tblorders` (
  `id` int(11) NOT NULL,
  `cust_id` int(32) NOT NULL,
  `orderdate` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `mop` varchar(20) NOT NULL,
  `total_amount` int(32) NOT NULL,
  `orderstatus` varchar(122) NOT NULL,
  `deliverydate` date NOT NULL,
  `canceltime` datetime(6) NOT NULL,
  `deleted` int(32) NOT NULL,
  `piglets` int(32) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblorders`
--

INSERT INTO `tblorders` (`id`, `cust_id`, `orderdate`, `mop`, `total_amount`, `orderstatus`, `deliverydate`, `canceltime`, `deleted`, `piglets`) VALUES
(4, 68, '2025-09-05 14:15:21.031577', 'Cash', 30406, 'Completed', '2025-09-05', '2025-09-05 22:15:13.198466', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpigbreeders`
--

CREATE TABLE `tblpigbreeders` (
  `id` int(11) NOT NULL,
  `name` varchar(244) NOT NULL,
  `age` varchar(100) NOT NULL,
  `status` varchar(255) NOT NULL,
  `total_farrowed` int(32) NOT NULL,
  `breedingstart` date NOT NULL,
  `forrowingdate` date NOT NULL,
  `gestateends` date NOT NULL,
  `piglets` int(20) NOT NULL,
  `male` int(32) NOT NULL,
  `female` int(32) NOT NULL,
  `mortality` int(32) NOT NULL,
  `img` varchar(100) NOT NULL,
  `date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpigbreeders`
--

INSERT INTO `tblpigbreeders` (`id`, `name`, `age`, `status`, `total_farrowed`, `breedingstart`, `forrowingdate`, `gestateends`, `piglets`, `male`, `female`, `mortality`, `img`, `date`) VALUES
(5, 'jupeta', '7 Months', 'Breeding', 1, '0000-00-00', '0000-00-00', '0000-00-00', 0, 2, 1, 0, 'baboy.jpg', '2025-09-05 05:24:16.995901');

-- --------------------------------------------------------

--
-- Table structure for table `tblpigforsale`
--

CREATE TABLE `tblpigforsale` (
  `id` int(11) NOT NULL,
  `piglet_id` int(32) NOT NULL,
  `name` varchar(120) NOT NULL,
  `sow_id` int(32) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `weight_class` varchar(255) NOT NULL,
  `price` int(32) NOT NULL,
  `img` varchar(32) NOT NULL,
  `back` varchar(32) NOT NULL,
  `side` varchar(32) NOT NULL,
  `front` varchar(32) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `status` varchar(122) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpigforsale`
--

INSERT INTO `tblpigforsale` (`id`, `piglet_id`, `name`, `sow_id`, `sex`, `age`, `weight_class`, `price`, `img`, `back`, `side`, `front`, `CreationDate`, `UpdationDate`, `status`) VALUES
(4, 20, 'yy', 7, 'Male', '6 Months', '50-60kg', 250, 'baboy.jpg', 'baboy.jpg', 'baboy.jpg', 'baboy.jpg', '2025-09-05 07:37:28', '2025-09-05 07:37:59', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblpiglet_for_sale`
--

CREATE TABLE `tblpiglet_for_sale` (
  `id` int(32) NOT NULL,
  `growingphase_id` int(32) NOT NULL,
  `name` varchar(122) NOT NULL,
  `farrowed_Date` date NOT NULL,
  `available` int(32) NOT NULL,
  `sold` int(32) NOT NULL,
  `price` int(32) NOT NULL,
  `status` varchar(122) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpiglet_for_sale`
--

INSERT INTO `tblpiglet_for_sale` (`id`, `growingphase_id`, `name`, `farrowed_Date`, `available`, `sold`, `price`, `status`, `created`) VALUES
(12, 7, '19', '2025-09-01', 0, 0, 1322, 'AVAILABLE', '2025-09-05'),
(13, 6, '6', '2025-08-10', 0, 0, 2566, 'AVAILABLE', '2025-09-05'),
(14, 6, '6', '2025-08-10', 0, 0, 0, 'AVAILABLE', '2025-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `tblpiglet_for_sale_details`
--

CREATE TABLE `tblpiglet_for_sale_details` (
  `id` int(32) NOT NULL,
  `tblpiglet_for_sale_id` int(32) NOT NULL,
  `piglet_id` int(32) NOT NULL,
  `name` varchar(122) NOT NULL,
  `price` int(32) NOT NULL,
  `piglet_weight` int(32) NOT NULL,
  `gender` varchar(122) NOT NULL,
  `img` varchar(122) NOT NULL,
  `status` varchar(122) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpiglet_for_sale_details`
--

INSERT INTO `tblpiglet_for_sale_details` (`id`, `tblpiglet_for_sale_id`, `piglet_id`, `name`, `price`, `piglet_weight`, `gender`, `img`, `status`, `created`) VALUES
(7, 12, 19, 'momy jupeta(1)', 1322, 23, 'Male', 'baktin1.jpg', 'ordered', '2025-09-05');

-- --------------------------------------------------------

--
-- Table structure for table `tblsales`
--

CREATE TABLE `tblsales` (
  `id` int(32) NOT NULL,
  `total_sales` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblsoworder`
--

CREATE TABLE `tblsoworder` (
  `id` int(32) NOT NULL,
  `sow_id` int(32) NOT NULL,
  `custname` varchar(122) NOT NULL,
  `date` date NOT NULL,
  `totalamount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbltodo`
--

CREATE TABLE `tbltodo` (
  `id` int(11) NOT NULL,
  `sow_id` int(32) NOT NULL,
  `piglet_id` int(32) NOT NULL,
  `details` varchar(255) NOT NULL,
  `time` date NOT NULL,
  `emailed` int(32) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbltodo`
--

INSERT INTO `tbltodo` (`id`, `sow_id`, `piglet_id`, `details`, `time`, `emailed`) VALUES
(35, 4, 0, 'Farrowing', '2026-03-15', 1),
(36, 4, 0, 'Weaning', '2025-12-24', 1),
(37, 4, 0, 'Vitamins', '2025-11-15', 1),
(38, 4, 0, 'Injecting Iron', '2025-11-16', 1),
(39, 4, 0, 'Kapon', '2025-12-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(32) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `RegDate`, `UpdationDate`) VALUES
(68, 'alfred', 'a@gmail.com', '$2y$10$37KTi5DQT42.oIDOG0YnGuxwZE.CnnvTmNl8VOjuTT2gi3/.nslXi', '12345678932', '2001-01-05', 'panadtaran', '2025-09-05 04:17:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unhealthy_piglets`
--

CREATE TABLE `unhealthy_piglets` (
  `id` int(32) NOT NULL,
  `piglet_id` int(32) NOT NULL,
  `details` varchar(255) NOT NULL,
  `status` varchar(32) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccines_guide`
--

CREATE TABLE `vaccines_guide` (
  `id` int(32) NOT NULL,
  `piglet_id` int(32) NOT NULL,
  `vaccine_name` varchar(122) NOT NULL,
  `details` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vaccines_shot`
--

CREATE TABLE `vaccines_shot` (
  `id` int(32) NOT NULL,
  `piglets_id` int(32) NOT NULL,
  `vaccine_name` varchar(122) NOT NULL,
  `date_vaccinated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vaccines_shot`
--

INSERT INTO `vaccines_shot` (`id`, `piglets_id`, `vaccine_name`, `date_vaccinated`) VALUES
(1, 21, 'Paracetamol ', 2025);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breeder_records`
--
ALTER TABLE `breeder_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piglets`
--
ALTER TABLE `piglets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `piglets_qr`
--
ALTER TABLE `piglets_qr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblculling`
--
ALTER TABLE `tblculling`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblfeeds`
--
ALTER TABLE `tblfeeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblgrowingphase`
--
ALTER TABLE `tblgrowingphase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmanage`
--
ALTER TABLE `tblmanage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmessage`
--
ALTER TABLE `tblmessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblorderdetails`
--
ALTER TABLE `tblorderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test` (`order_id`);

--
-- Indexes for table `tblorders`
--
ALTER TABLE `tblorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpigbreeders`
--
ALTER TABLE `tblpigbreeders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpigforsale`
--
ALTER TABLE `tblpigforsale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpiglet_for_sale`
--
ALTER TABLE `tblpiglet_for_sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpiglet_for_sale_details`
--
ALTER TABLE `tblpiglet_for_sale_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsales`
--
ALTER TABLE `tblsales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsoworder`
--
ALTER TABLE `tblsoworder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltodo`
--
ALTER TABLE `tbltodo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unhealthy_piglets`
--
ALTER TABLE `unhealthy_piglets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccines_guide`
--
ALTER TABLE `vaccines_guide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vaccines_shot`
--
ALTER TABLE `vaccines_shot`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `breeder_records`
--
ALTER TABLE `breeder_records`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `piglets`
--
ALTER TABLE `piglets`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `piglets_qr`
--
ALTER TABLE `piglets_qr`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblculling`
--
ALTER TABLE `tblculling`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblfeeds`
--
ALTER TABLE `tblfeeds`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblgrowingphase`
--
ALTER TABLE `tblgrowingphase`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblmanage`
--
ALTER TABLE `tblmanage`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblmessage`
--
ALTER TABLE `tblmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblorderdetails`
--
ALTER TABLE `tblorderdetails`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblorders`
--
ALTER TABLE `tblorders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpigbreeders`
--
ALTER TABLE `tblpigbreeders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblpigforsale`
--
ALTER TABLE `tblpigforsale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpiglet_for_sale`
--
ALTER TABLE `tblpiglet_for_sale`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblpiglet_for_sale_details`
--
ALTER TABLE `tblpiglet_for_sale_details`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblsales`
--
ALTER TABLE `tblsales`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblsoworder`
--
ALTER TABLE `tblsoworder`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbltodo`
--
ALTER TABLE `tbltodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `unhealthy_piglets`
--
ALTER TABLE `unhealthy_piglets`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccines_guide`
--
ALTER TABLE `vaccines_guide`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vaccines_shot`
--
ALTER TABLE `vaccines_shot`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
