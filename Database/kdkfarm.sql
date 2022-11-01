-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2022 at 05:58 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kdkfarm`
--

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `buy_id` int(11) DEFAULT NULL,
  `product` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `purchase_d` date DEFAULT NULL,
  `name` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `buy`
--

INSERT INTO `buy` (`buy_id`, `product`, `price`, `kg`, `total`, `purchase_d`, `name`) VALUES
(1, 'apple', 700, 1, 700, '2022-11-01', 'Kirti Salunkhe');

--
-- Triggers `buy`
--
DELIMITER $$
CREATE TRIGGER `delt` AFTER DELETE ON `buy` FOR EACH ROW delete from purchase where buy_id=old.buy_id and purchase_d=old.purchase_d
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `myt` AFTER INSERT ON `buy` FOR EACH ROW insert into purchase set
product=new.product,kg=new.kg,total=new.total,purchase_d=new.purchase_d,name=new.name,buy_id=new.buy_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cust_reg`
--

CREATE TABLE `cust_reg` (
  `name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(260) COLLATE utf8mb4_bin DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `cust_reg`
--

INSERT INTO `cust_reg` (`name`, `address`, `phone`, `email`, `dob`, `age`, `username`, `password`) VALUES
('Atharva Thakur', 'Pune', 8793817762, 'art@gmail.com', '2022-10-31', 18, 'art', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `farmer_reg`
--

CREATE TABLE `farmer_reg` (
  `farmer_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `city` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `phone` bigint(30) DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `farmer_reg`
--

INSERT INTO `farmer_reg` (`farmer_id`, `name`, `city`, `address`, `phone`, `username`, `password`) VALUES
(2, 'Atharva Thakur', 'Pune', 'Pune', 8793817762, 'art', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `price`) VALUES
(2, 'Wheat', 500);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `product` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `kg` int(11) DEFAULT NULL,
  `total` int(50) DEFAULT NULL,
  `purchase_d` date DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `buy_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cust_reg`
--
ALTER TABLE `cust_reg`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `farmer_reg`
--
ALTER TABLE `farmer_reg`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `farmer_reg`
--
ALTER TABLE `farmer_reg`
  MODIFY `farmer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
