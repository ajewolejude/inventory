-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 27, 2018 at 09:57 AM
-- Server version: 5.5.45
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invent`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_active` int(11) NOT NULL DEFAULT '0',
  `brand_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_active`, `brand_status`) VALUES
(14, 'HP', 1, 1),
(15, 'Samsung', 1, 1),
(16, 'DELL', 1, 1),
(17, 'Apple', 1, 1),
(21, 'Lenovo', 1, 1),
(22, 'Asus', 1, 1),
(23, 'CISCO', 1, 1),
(24, 'GAMATRONICS', 1, 1),
(25, 'APC', 1, 1),
(26, 'Acer', 1, 1),
(27, 'PANASONIC', 1, 1),
(28, 'VNTS', 1, 1),
(29, 'FIRSTPOWER', 1, 1),
(30, 'Xerox', 1, 1),
(31, 'TENDA', 1, 1),
(32, 'SAFE POWER', 1, 1),
(33, 'TP-LINK', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(255) NOT NULL,
  `categories_active` int(11) NOT NULL DEFAULT '0',
  `categories_status` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_active`, `categories_status`, `type`, `value`) VALUES
(10, 'Computer Laptop', 1, 1, 1, ''),
(11, 'Computer Desktop', 1, 1, 1, ''),
(12, 'Printer', 1, 1, 1, ''),
(13, 'Servers', 1, 1, 1, ''),
(14, 'Racks', 1, 1, 1, ''),
(15, 'Switches/Patch panel', 1, 1, 1, ''),
(16, 'UPS/INVERTER', 1, 1, 1, ''),
(17, 'MOUSE', 1, 1, 2, 'Mouse'),
(18, 'Cordless Phone', 1, 1, 1, ''),
(19, 'Access point / Routers', 1, 1, 1, ''),
(20, 'Bag', 1, 1, 2, 'Bag');

-- --------------------------------------------------------

--
-- Table structure for table `categoriescon`
--

CREATE TABLE `categoriescon` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `consumables`
--

CREATE TABLE `consumables` (
  `consumables_id` int(11) NOT NULL,
  `consumable` varchar(255) NOT NULL,
  `service_tagC` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `consumer` varchar(255) NOT NULL,
  `consumer_tag` varchar(255) NOT NULL,
  `consumer_user` varchar(255) NOT NULL,
  `consumer_dept` varchar(255) NOT NULL,
  `expression_name` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL,
  `issue_date` date DEFAULT NULL,
  `vendor` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consumables`
--

INSERT INTO `consumables` (`consumables_id`, `consumable`, `service_tagC`, `price`, `item_id`, `consumer`, `consumer_tag`, `consumer_user`, `consumer_dept`, `expression_name`, `purchase_date`, `issue_date`, `vendor`, `status`, `type`) VALUES
(1, 'wireless optical mouse', 'MOUSE/BLAKETECH/01', 3700, 85, 'Dell inspiron 15', '3YBD512', 'Kuti Olujimi', 'IT', '3', '2018-05-14', '2018-05-14', 'blaketech', 2, 5),
(2, 'wireless optical mouse', 'MOUSE/BLAKETECH/02', 3700, 60, 'Dell inspiron 15', 'CTQSQZ1', 'Valentine Okwudili', 'Sound and Spirit', '3', '2018-05-11', '2018-05-14', 'blaketech', 2, 5),
(3, 'wireless optical mouse', 'MOUSE/BLAKETECH/03', 3700, 229, 'Dell Latitude 3470', '5ZMF0C2', 'Clement Ikhine', 'IT', '3', '2018-05-11', '2018-05-14', 'blaketech', 2, 5),
(4, 'wireless optical mouse', 'MOUSE/BLAKETECH/04', 3700, 103, 'Dell Latitude', 'BNNG0G2', 'Omonuwa Olulano', 'HR', '3', '2018-05-11', '2018-05-16', 'blaketech', 2, 5),
(5, 'wireless optical mouse', 'MOUSE/BLAKETECH/05', 3700, 102, 'Dell Latitude', 'DPFT2G2', 'Ebube Imana', 'HR', '3', '2018-05-11', '2018-05-16', 'blaketech', 2, 5),
(6, 'wireless optical mouse', 'MOUSE/BLAKETECH/06', 3700, 82, 'Dell inspiron 3521', '4Q7HRX1', 'Opeyemi Akinkusote', 'HR', '3', '2018-05-11', '2018-05-16', 'blaketech', 2, 5),
(7, 'wireless optical mouse', 'MOUSE/BLAKETECH/07', 3700, 62, 'Generic', 'C7XJJW1', 'Moses Yakubu', 'Media', '3', '2018-05-11', '2018-05-17', 'blaketech', 2, 5),
(8, 'wireless optical mouse', 'MOUSE/BLAKETECH/08', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(9, 'wireless optical mouse', 'MOUSE/BLAKETECH/09', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(10, 'wireless optical mouse', 'MOUSE/BLAKETECH/10', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(11, 'wireless optical mouse', 'MOUSE/BLAKETECH/11', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(12, 'wireless optical mouse', 'MOUSE/BLAKETECH/12', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(13, 'wireless optical mouse', 'MOUSE/BLAKETECH/13', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(15, 'wireless optical mouse', 'MOUSE/BLAKETECH/14', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(16, 'wireless optical mouse', 'MOUSE/BLAKETECH/15', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(17, 'wireless optical mouse', 'MOUSE/BLAKETECH/16', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(19, 'wireless optical mouse', 'MOUSE/BLAKETECH/17', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(20, 'wireless optical mouse', 'MOUSE/BLAKETECH/18', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(21, 'wireless optical mouse', 'MOUSE/BLAKETECH/19', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(22, 'wireless optical mouse', 'MOUSE/BLAKETECH/20', 3700, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 5),
(23, '65W Dell charger', 'CHARGER/BLAKETECH/01', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(24, '65W Dell charger', 'CHARGER/BLAKETECH/02', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(25, '65W Dell charger', 'CHARGER/BLAKETECH/03', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(26, '65W Dell charger', 'CHARGER/BLAKETECH/04', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(27, '65W Dell charger', 'CHARGER/BLAKETECH/05', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(28, '65W Dell charger', 'CHARGER/BLAKETECH/06', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(29, '65W Dell charger', 'CHARGER/BLAKETECH/07', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(30, '65W Dell charger', 'CHARGER/BLAKETECH/08', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(31, '65W Dell charger', 'CHARGER/BLAKETECH/09', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(32, '65W Dell charger', 'CHARGER/BLAKETECH/10', 6500, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(33, '130W Dell charger', 'CHARGER/BLAKETECH/11', 7000, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(34, '130W Dell charger', 'CHARGER/BLAKETECH/12', 7000, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(35, '130W Dell charger', 'CHARGER/BLAKETECH/13', 7000, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(36, '130W Dell charger', 'CHARGER/BLAKETECH/14', 7000, 0, '', '', '', '', '', '2018-05-11', '1970-01-01', 'blaketech', 1, 6),
(37, '90A (MF4555MFP)', 'INK/DIGITALDIRECT/01', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(38, '90A (MF4555MFP)', 'INK/DIGITALDIRECT/02', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(39, '90A (MF4555MFP)', 'INK/DIGITALDIRECT/03', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(40, '90A (MF4555MFP)', 'INK/DIGITALDIRECT/04', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(41, '951XL (YELLOW)', 'INK/DIGITALDIRECT/951Y/01', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(42, '951XL (YELLOW)', 'INK/DIGITALDIRECT/951Y/02', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(43, '951XL (YELLOW)', 'INK/DIGITALDIRECT/951Y/03', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(44, '951XL (YELLOW)', 'INK/DIGITALDIRECT/951Y/04', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(45, '951XL (YELLOW)', 'INK/DIGITALDIRECT/951Y/05', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(46, '951XL (YELLOW)', 'INK/DIGITALDIRECT/951Y/06', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(47, '951XL (CYAN)', 'INK/DIGITALDIRECT/951C/01', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(48, '951XL (CYAN)', 'INK/DIGITALDIRECT/951C/02', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(49, '951XL (CYAN)', 'INK/DIGITALDIRECT/951C/03', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(50, '951XL (CYAN)', 'INK/DIGITALDIRECT/951C/04', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(51, '951XL (CYAN)', 'INK/DIGITALDIRECT/951C/05', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(52, '951XL (CYAN)', 'INK/DIGITALDIRECT/951C/06', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(53, '951XL (CYAN)', 'INK/DIGITALDIRECT/951C/07', 0, 0, '', '', '', '', '', '2018-03-01', '1970-01-01', 'digitaldirect', 1, 2),
(55, '951XL (MAGENTA)', 'INK/DIGITALDIRECT/951M/01', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(56, '951XL (MAGENTA)', 'INK/DIGITALDIRECT/951M/02', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(57, '951XL (MAGENTA)', 'INK/DIGITALDIRECT/951M/03', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(58, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/01', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(59, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/02', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(60, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/03', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(61, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/04', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(62, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/05', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(63, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/06', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(64, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/07', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(65, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/08', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(66, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/09', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(67, '951XL (BLACK)', 'INK/DIGITALDIRECT/951B/10', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(68, '920XL (YELLOW)', 'INK/DIGITALDIRECT/920Y/01', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(69, '920XL (CYAN)', 'INK/DIGITALDIRECT/920C/01', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(70, '920XL (CYAN)', 'INK/DIGITALDIRECT/920C/02', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(71, '920XL (MAGENTA)', 'INK/DIGITALDIRECT/920M/01', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(72, '920XL (MAGENTA)', 'INK/DIGITALDIRECT/920M/02', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(73, '920XL (MAGENTA)', 'INK/DIGITALDIRECT/920M/03', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(74, '920XL (BLACK)', 'INK/DIGITALDIRECT/920B/01', 0, 0, '', '', '', '', '', '2017-01-10', '1970-01-01', 'digitaldirect', 1, 2),
(76, '920XL (BLACK)', 'INK/DIGITALDIRECT/920B/02', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(77, '920XL (BLACK)', 'INK/DIGITALDIRECT/920B/03', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(78, '920XL (BLACK)', 'INK/DIGITALDIRECT/920B/04', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(79, '920 (BLACK)', 'INK/DIGITALDIRECT/920B/05', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(80, '920 (BLACK)', 'INK/DIGITALDIRECT/920B/06', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(81, '920 (BLACK)', 'INK/DIGITALDIRECT/920B/07', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(82, '81A (BLACK)', 'INK/DIGITALDIRECT/81B/01', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(83, '81A (BLACK)', 'INK/DIGITALDIRECT/81B/02', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(84, '05A (BLACK)', 'INK/DIGITALDIRECT/05B/01', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(85, '05A (BLACK)', 'INK/DIGITALDIRECT/05B/02', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(86, '05A (BLACK)', 'INK/DIGITALDIRECT/05B/03', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(87, '05A (BLACK)', 'INK/DIGITALDIRECT/05B/04', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(88, '05A (BLACK)', 'INK/DIGITALDIRECT/05B/05', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(89, 'Q7562A (YELLOW)', 'INK/DIGITALDIRECT/Q7562Y/01', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(90, 'Q7562A (YELLOW)', 'INK/DIGITALDIRECT/Q7562Y/02', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(91, 'XEROX WORKCENTRE (5016/5020)', 'INK/DIGITALDIRECT/XEROX5016/5020/01', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(92, 'XEROX CARTRIDGE (4118)', 'INK/DIGITALDIRECT/XEROX4118/01', 0, 0, '', '', '', '', '', '2017-05-15', '1970-01-01', 'digitaldirect', 1, 2),
(93, 'laptop bags', 'BAG/BLAKETECH/01', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(94, 'laptop bags', 'BAG/BLAKETECH/02', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(95, 'laptop bags', 'BAG/BLAKETECH/03', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(97, 'laptop bags', 'BAG/BLAKETECH/04', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(98, 'laptop bags', 'BAG/BLAKETECH/05', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(99, 'laptop bags', 'BAG/BLAKETECH/06', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(100, 'laptop bags', 'BAG/BLAKETECH/07', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(101, 'laptop bags', 'BAG/BLAKETECH/08', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(102, 'laptop bags', 'BAG/BLAKETECH/09', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(103, 'laptop bags', 'BAG/BLAKETECH/10', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(104, 'laptop bags', 'BAG/BLAKETECH/11', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(105, 'laptop bags', 'BAG/BLAKETECH/12', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(106, 'laptop bags', 'BAG/BLAKETECH/13', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(107, 'laptop bags', 'BAG/BLAKETECH/14', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(108, 'laptop bags', 'BAG/BLAKETECH/15', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(109, 'laptop bags', 'BAG/BLAKETECH/16', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(111, 'laptop bags', 'BAG/BLAKETECH/17', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(113, 'laptop bags', 'BAG/BLAKETECH/18', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(114, 'laptop bags', 'BAG/BLAKETECH/19', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(115, 'laptop bags', 'BAG/BLAKETECH/20', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(117, 'laptop bags', 'BAG/BLAKETECH/21', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(118, 'laptop bags', 'BAG/BLAKETECH/22', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(119, 'laptop bags', 'BAG/BLAKETECH/24', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(120, 'laptop bags', 'BAG/BLAKETECH/25', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(121, 'laptop bags', 'BAG/BLAKETECH/26', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(122, 'laptop bags', 'BAG/BLAKETECH/27', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(123, 'laptop bags', 'BAG/BLAKETECH/28', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(124, 'laptop bags', 'BAG/BLAKETECH/29', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(125, 'laptop bags', 'BAG/BLAKETECH/30', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(126, 'laptop bag', 'BAG/BLAKETECH/23', 9000, 1, '', '', '', '', '', '2018-05-22', '1970-01-01', 'blaketech', 1, 3),
(127, 'Extension Box', 'EXT/BLAKETECH/01', 7500, 66, 'Dell inspiron 15', 'H3Q1512', 'Shola Ajao', 'Accounts', '3', '2018-05-24', '2018-05-24', 'BLAKETECH', 2, 7),
(128, 'Extension Box', 'EXT/BLAKETECH/02', 7500, 57, 'Dell inspiron 15', '7VBD512', 'Aladetoyinbo Shola', 'Junior Church', '3', '2018-05-24', '2018-05-24', 'BLAKETECH', 2, 7),
(129, 'Extension Box', 'EXT/BLAKETECH/03', 7500, 53, 'Dell latitude', 'HKYDCT1', 'Anthony Ileogbon', 'Media', '3', '2018-05-24', '2018-05-24', 'BLAKETECH', 2, 7),
(130, 'Extension Box', 'EXT/BLAKETECH/04', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(131, 'Extension Box', 'EXT/BLAKETECH/05', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(132, 'Extension Box', 'EXT/BLAKETECH/06', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(133, 'Extension Box', 'EXT/BLAKETECH/07', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(134, 'Extension Box', 'EXT/BLAKETECH/08', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(135, 'Extension Box', 'EXT/BLAKETECH/09', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(136, 'Extension Box', 'EXT/BLAKETECH/10', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(137, 'Extension Box', 'EXT/BLAKETECH/11', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(138, 'Extension Box', 'EXT/BLAKETECH/12', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(139, 'Extension Box', 'EXT/BLAKETECH/13', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(140, 'Extension Box', 'EXT/BLAKETECH/14', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(141, 'Extension Box', 'EXT/BLAKETECH/15', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(142, 'Extension Box', 'EXT/BLAKETECH/16', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(143, 'Extension Box', 'EXT/BLAKETECH/17', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(144, 'Extension Box', 'EXT/BLAKETECH/18', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(145, 'Extension Box', 'EXT/BLAKETECH/19', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(146, 'Extension Box', 'EXT/BLAKETECH/20', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(147, 'Extension Box', 'EXT/BLAKETECH/21', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(148, 'Extension Box', 'EXT/BLAKETECH/22', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(149, 'Extension Box', 'EXT/BLAKETECH/23', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(150, 'Extension Box', 'EXT/BLAKETECH/24', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7),
(151, 'Extension Box', 'EXT/BLAKETECH/25', 7500, 0, '', '', '', '', '', '2018-05-24', '1970-01-01', 'BLAKETECH', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file_id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `file` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`file_id`, `request_id`, `name`, `file`) VALUES
(10, 41, '2', 'files/2.PNG'),
(11, 42, '', ''),
(12, 43, '', ''),
(13, 44, '3', 'files/3.PNG'),
(14, 45, '2', 'files/2.PNG'),
(15, 46, '', ''),
(16, 47, '', ''),
(17, 48, '', ''),
(18, 49, '3', 'files/3.PNG'),
(19, 1, '1', 'files/1.PNG'),
(20, 51, '', ''),
(21, 52, '', ''),
(22, 53, '', ''),
(23, 54, '', ''),
(24, 260, 'WIN_20180514_15_10_01_Pro', 'C:/inetpub/wwwroot/invent/php_action/files/WIN_20180514_15_10_01_Pro.jpg'),
(25, 261, '', ''),
(26, 262, '', ''),
(27, 263, '', ''),
(28, 264, '', ''),
(29, 265, '', ''),
(30, 266, '', ''),
(31, 267, '', ''),
(32, 268, '', ''),
(33, 269, '', ''),
(34, 270, '', ''),
(35, 271, '', ''),
(36, 272, '', ''),
(37, 273, '', ''),
(38, 274, '', ''),
(39, 275, '', ''),
(40, 276, '', ''),
(41, 277, '', ''),
(42, 278, '', ''),
(43, 279, '', ''),
(44, 280, '', ''),
(45, 281, '', ''),
(46, 282, '', ''),
(47, 283, '', ''),
(48, 284, '', ''),
(49, 285, '', ''),
(50, 286, '', ''),
(51, 287, '', ''),
(52, 288, '', ''),
(53, 289, '', ''),
(54, 290, '', ''),
(55, 291, '', ''),
(56, 292, '', ''),
(57, 293, '', ''),
(58, 294, '', ''),
(59, 295, '', ''),
(60, 296, '', ''),
(61, 297, '', ''),
(62, 298, '', ''),
(63, 299, '', ''),
(64, 300, '', ''),
(65, 301, '', ''),
(66, 302, '', ''),
(67, 303, '', ''),
(68, 304, '', ''),
(69, 305, '', ''),
(70, 306, '', ''),
(71, 307, '', ''),
(72, 308, '', ''),
(73, 309, '', ''),
(74, 310, '', ''),
(75, 311, '', ''),
(76, 312, '', ''),
(77, 313, '', ''),
(78, 314, '', ''),
(79, 315, '', ''),
(80, 316, '', ''),
(81, 317, '', ''),
(82, 318, '', ''),
(83, 319, '', ''),
(84, 320, '', ''),
(85, 321, '', ''),
(86, 322, '', ''),
(87, 323, '', ''),
(88, 324, '', ''),
(89, 325, '', ''),
(90, 326, '', ''),
(91, 327, '', ''),
(92, 328, '', ''),
(93, 329, '', ''),
(94, 330, '', ''),
(95, 331, '', ''),
(96, 332, '', ''),
(97, 333, '', ''),
(98, 334, '', ''),
(99, 335, '', ''),
(100, 336, '', ''),
(101, 337, '', ''),
(102, 338, '', ''),
(103, 339, '', ''),
(104, 340, '', ''),
(105, 341, '', ''),
(106, 342, '', ''),
(107, 343, '', ''),
(108, 344, '', ''),
(109, 345, '', ''),
(110, 346, '', ''),
(111, 347, '', ''),
(112, 348, '', ''),
(113, 349, '', ''),
(114, 350, '', ''),
(115, 351, '', ''),
(116, 352, '', ''),
(117, 353, '', ''),
(118, 354, '', ''),
(119, 355, '', ''),
(120, 356, '', ''),
(121, 357, '', ''),
(122, 358, '', ''),
(123, 359, '', ''),
(124, 360, '', ''),
(125, 361, '', ''),
(126, 362, '', ''),
(127, 363, '', ''),
(128, 364, '', ''),
(129, 365, '', ''),
(130, 366, '', ''),
(131, 367, '', ''),
(132, 368, '', ''),
(133, 369, '', ''),
(134, 370, '', ''),
(135, 371, '', ''),
(136, 372, '', ''),
(137, 373, '', ''),
(138, 374, '', ''),
(139, 375, '', ''),
(140, 376, '', ''),
(141, 377, '', ''),
(142, 378, '', ''),
(143, 379, '', ''),
(144, 380, '', ''),
(145, 381, '', ''),
(146, 382, '', ''),
(147, 383, '', ''),
(148, 384, '', ''),
(149, 385, '', ''),
(150, 386, '', ''),
(151, 387, '', ''),
(152, 388, '', ''),
(153, 389, '', ''),
(154, 390, '', ''),
(155, 391, '', ''),
(156, 392, '', ''),
(157, 393, '', ''),
(158, 394, '', ''),
(159, 395, '', ''),
(160, 396, '', ''),
(161, 397, '', ''),
(162, 398, '', ''),
(163, 399, '', ''),
(164, 400, '', ''),
(165, 401, '', ''),
(166, 402, '', ''),
(167, 403, '', ''),
(168, 404, '', ''),
(169, 405, '', ''),
(170, 406, '', ''),
(171, 407, '', ''),
(172, 408, '', ''),
(173, 409, '', ''),
(174, 410, '', ''),
(175, 411, '', ''),
(176, 412, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `expression_name` int(11) NOT NULL DEFAULT '0',
  `item_image` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `service_tag` varchar(255) NOT NULL,
  `vendor` varchar(255) NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_name`, `expression_name`, `item_image`, `brand_id`, `categories_id`, `quantity`, `computer_name`, `price`, `active`, `status`, `service_tag`, `vendor`, `purchase_date`) VALUES
(1, 'ASUS', 3, '../assests/images/star.png', 22, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'NOTAG1', 'CHK', '2008-03-17'),
(2, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'GJSSR12', 'CHK', '2009-03-17'),
(3, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'FKFM12', 'CHK', '2010-03-17'),
(4, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '3YTPR12', 'CHK', '2011-03-17'),
(5, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '427MT02', 'CHK', '2012-03-17'),
(6, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '2N6MT02', 'CHK', '2013-03-17'),
(7, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '4781WS1', 'CHK', '2014-03-17'),
(8, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '9KYZVQ1', 'CHK', '2015-03-17'),
(9, 'Dell Optiplex 390', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '9YTF832', 'CHK', '2016-03-17'),
(10, 'iMac Intel core i5', 3, '../assests/images/star.png', 17, 11, '1', 'GENERIC_NAME', '400000', 0, 1, 'C02LM9QZF8J4', 'CHK', '2017-03-17'),
(11, 'iMac Intel core i5', 3, '../assests/images/star.png', 17, 11, '1', 'GENERIC_NAME', '400000', 0, 1, 'C02LM9ZBF8J4', 'CHK', '2018-03-17'),
(12, 'iMac Intel core 2 duo', 3, '../assests/images/star.png', 17, 11, '1', 'GENERIC_NAME', '400000', 0, 1, 'W8809HBBZE2', 'CHK', '2019-03-17'),
(13, 'iMac intel core i5', 3, '../assests/images/star.png', 17, 11, '1', 'GENERIC_NAME', '400000', 0, 1, 'C02KD142ZDNCW', 'CHK', '2020-03-17'),
(14, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '4V4NYX1', 'CHK', '2021-03-17'),
(15, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'FI7MT02', 'CHK', '2022-03-17'),
(16, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '9528WS1', 'CHK', '2023-03-17'),
(17, 'Dell Optiplex 390', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'F42665T', 'CHK', '2024-03-17'),
(18, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'H8LSPQ1', 'CHK', '2025-03-17'),
(19, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, 'NOTAG23', 'CHK', '2026-03-17'),
(20, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '9L43WS1', 'CHK', '2027-03-17'),
(21, 'Dell Optiple 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, '6XXRZ4J', 'CHK', '2028-03-17'),
(22, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, 'GD9QR12', 'CHK', '2029-03-17'),
(23, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '7J7G8BS', 'CHK', '2030-03-17'),
(24, 'Dell Optiplex 280', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'G4DNT2X', 'CHK', '2031-03-17'),
(25, 'Dell Optiplex 390', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, '7XX6655', 'CHK', '2001-04-17'),
(26, 'Dell Optiplex 390', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, '91RP75J', 'CHK', '2002-04-17'),
(27, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '4Y82WS1', 'CHK', '2003-04-17'),
(28, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'J14MT02', 'CHK', '2004-04-17'),
(29, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '21Z665J', 'CHK', '2005-04-17'),
(30, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'GV0FJ52', 'CHK', '2006-04-17'),
(31, 'Dell Optiplex 390', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'DBQFTS1', 'CHK', '2007-04-17'),
(32, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '8K6MT02', 'CHK', '2008-04-17'),
(33, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'HNDNT2X', 'CHK', '2009-04-17'),
(34, 'Dell Optiplex 320', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, 'JGB1D32', 'CHK', '2010-04-17'),
(35, 'Dell Optiplex 390', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'D5Z665J', 'CHK', '2011-04-17'),
(36, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '8W4RYX1', 'CHK', '2012-04-17'),
(37, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, '2X1F752', 'CHK', '2013-04-17'),
(38, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, '3QLNT2X', 'CHK', '2014-04-17'),
(39, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, 'GJ1FJ52', 'CHK', '2015-04-17'),
(40, 'Dell Optiplex 3020', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, '961FJ52', 'CHK', '2016-04-17'),
(41, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'CY16WS1', 'CHK', '2017-04-17'),
(42, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'JG4PYX1', 'CHK', '2018-04-17'),
(43, 'imac intel core 2 duo', 3, '../assests/images/star.png', 17, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'W8804D9RX85', 'CHK', '2019-04-17'),
(44, 'Dell Optiplex 3010', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '9K4HYX1', 'CHK', '2020-04-17'),
(45, 'Hp Pavilion', 3, '../assests/images/star.png', 14, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '3CR8230ZNU', 'CHK', '2021-04-17'),
(46, 'Asus', 3, '../assests/images/star.png', 22, 11, '1', 'GENERIC_NAME', '120000', 1, 1, 'NOTAG24', 'CHK', '2022-04-17'),
(47, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '2NVT7BS', 'CHK', '2023-04-17'),
(48, 'Dell Optiplex 390', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'HG5BTS1', 'CHK', '2024-04-17'),
(49, 'Dell Optiplex 380', 3, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '876BTS1', 'CHK', '2025-04-17'),
(50, 'Dell Vostro', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '0', 0, 1, 'CB0WZL1', 'CHK', '2026-04-17'),
(51, 'Dell inspiron N5040', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '0', 0, 1, '6VLPNP1', 'CHK', '2027-04-17'),
(52, 'Dell latitude 3570', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'DYSBB82', 'CHK', '2028-04-17'),
(53, 'Dell latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'HKYDCT1', 'CHK', '2029-04-17'),
(54, 'Macbook pro', 3, '../assests/images/star.png', 17, 10, '1', 'GENERIC_NAME', '410000', 0, 1, 'C02NC1R3G3QD', 'CHK', '2030-04-17'),
(55, 'Dell inspiron 15R', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '971Y402', 'CHK', '2001-05-17'),
(56, 'Dell inspiron 5547', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '145000', 0, 1, '3K6GK22', 'CHK', '2002-05-17'),
(57, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '7VBD512', 'CHK', '2003-05-17'),
(58, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '7P7HRX1', 'CHK', '2004-05-17'),
(59, 'Dell inspiron 15R', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '40QXCW1', 'CHK', '2005-05-17'),
(60, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, 'CTQSQZ1', 'CHK', '2006-05-17'),
(61, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '3FWGRX1', 'CHK', '2007-05-17'),
(62, 'Generic', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '0', 0, 1, 'C7XJJW1', 'CHK', '2008-05-17'),
(63, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, 'DMPD402', 'CHK', '2009-05-17'),
(64, 'Dell latitude 3540', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '165000', 1, 1, 'C00K802', 'CHK', '2010-05-17'),
(65, 'Dell inspiron 15R', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '3P1Y402', 'CHK', '2011-05-17'),
(66, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, 'H3Q1512', 'CHK', '2012-05-17'),
(67, 'Dell inspiron 15R', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '77G9C32', 'CHK', '2012-06-17'),
(68, 'Dell latitude 3520', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '165000', 0, 1, '2RSBB82', 'CHK', '2012-07-17'),
(69, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '7F3RQZ1', 'CHK', '2012-08-17'),
(70, 'Dell inspiron 15 5000 series', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '2JYJQ32', 'CHK', '2012-09-17'),
(71, 'Dell latitude 3540', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'D98DG22', 'CHK', '2012-10-17'),
(72, 'Dell inspiron', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '9GNR1X1', 'CHK', '2012-11-17'),
(73, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '7G55RY1', 'CHK', '2012-12-17'),
(74, 'Generic', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 1, 1, 'NOTAG25', 'CHK', '2013-12-17'),
(75, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, 'G4DNT21', 'CHK', '2014-12-17'),
(76, 'Lenovo flex 3', 3, '../assests/images/star.png', 21, 10, '1', 'GENERIC_NAME', '99000', 0, 1, 'R90JB4UY', 'CHK', '2015-12-17'),
(77, 'Dell inspiron', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '14R6RY1', 'CHK', '2016-12-17'),
(78, 'Generic', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 1, 1, 'NOTAG26', 'CHK', '2017-12-17'),
(79, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 1, 1, 'CKP6602', 'CHK', '2018-12-17'),
(80, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, 'HKYC402', 'CHK', '2019-12-17'),
(81, 'Dell inspiron N4050', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '5MTQKT1', 'CHK', '2020-12-17'),
(82, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '4Q7HRX1', 'CHK', '2021-12-17'),
(83, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 1, 1, '91RP5J', 'CHK', '2022-12-17'),
(84, 'Dell inspiron 5521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '145000', 0, 1, 'GFW1QX1', 'CHK', '2023-12-17'),
(85, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '3YBD512', 'CHK', '2024-12-17'),
(86, 'Dell xps', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '165000', 0, 1, '548V1S1', 'CHK', '2001-06-17'),
(87, 'Dell Latitude 3570', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'JDTBB82', 'CHK', '2002-06-17'),
(88, 'Dell inspiron 5521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '145000', 0, 1, '1K7P2X1', 'CHK', '2003-06-17'),
(89, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '9QQ81X1', 'CHK', '2004-06-17'),
(90, 'Dell Inspiron 15 -500', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, '49VKQ32', 'CHK', '2005-06-17'),
(91, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, '1YBD512', 'CHK', '2006-06-17'),
(92, 'Dell inspiron 15', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, '2WBD512', 'CHK', '2007-06-17'),
(93, 'Dell inspiron 3520', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, '6744DV1', 'CHK', '2008-06-17'),
(94, 'Dell inspiron 3521', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, 'B5Z5602', 'CHK', '2009-06-17'),
(95, 'Dell Inspiron N5010', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, '2S889N1', 'CHK', '2010-06-17'),
(96, 'Dell Inspiron N5010', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, 'F188II1', 'CHK', '2011-06-17'),
(97, 'Dell inspiron 15R', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '125000', 0, 1, 'H2TTOX1', 'CHK', '2012-06-17'),
(98, 'Dell Latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '295000', 1, 1, 'D10Y9G2', 'CHK', '2012-07-17'),
(99, 'Dell Latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '295000', 0, 1, 'FPTX9G2', 'CHK', '2012-08-17'),
(100, 'dell latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '295000', 0, 1, '8VRY9G2', 'CHK', '2012-09-17'),
(101, 'Dell Latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '295000', 0, 1, '6HF7bg2', 'CHK', '2012-10-17'),
(102, 'Dell Latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '289000', 0, 1, 'DPFT2G2', 'CHK', '2012-11-17'),
(103, 'Dell Latitude', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '289000', 0, 1, 'BNNG0G2', 'CHK', '2012-12-17'),
(104, 'dell latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '289000', 0, 1, 'HD690G2', 'CHK', '2013-12-17'),
(105, 'Dell Inspiron', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '99000', 0, 1, 'C4XX1X1', 'CHK', '2014-12-17'),
(106, 'Dell Latitude', 3, '../assests/images/star.png', 14, 10, '1', 'GENERIC_NAME', '289000', 0, 1, 'GR2JBG2', 'CHK', '2015-12-17'),
(107, 'Macbook pro', 3, '../assests/images/star.png', 17, 10, '1', 'GENERIC_NAME', '995000', 0, 1, 'C02TX6A3HTD6', 'CHK', '2016-12-17'),
(108, 'Macbook pro', 3, '../assests/images/star.png', 17, 10, '1', 'GENERIC_NAME', '995000', 0, 1, 'C02TX0N4HTD8', 'CHK', '2017-12-17'),
(109, 'Macbook pro', 3, '../assests/images/star.png', 17, 10, '1', 'GENERIC_NAME', '995000', 0, 1, 'C02TXEENHTD6', 'CHK', '2018-12-17'),
(110, 'HP Officejet pro 5600', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '50000', 1, 1, 'CN3CQRXJDQ', 'CHK', '2019-12-17'),
(111, 'HP Enterprise Laserjet M605', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '276000', 1, 1, 'NOTAG4', 'CHK', '2020-12-17'),
(112, 'HP color laserjet pro MFP M476', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '47000', 0, 1, 'CNB8G3W001', 'CHK', '2021-12-17'),
(113, 'HP officejet pro 8600', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '47000', 0, 1, 'CN1CF1Q0HB', 'CHK', '2022-12-17'),
(114, 'Hp officejet pro 8600 plus', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '46000', 0, 1, 'CN332B3GCC', 'CHK', '2023-12-17'),
(115, 'HP Laserjet 600 M602', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '46000', 0, 1, 'CNCVG350NH', 'CHK', '2024-12-17'),
(116, 'HP Officejet 700 widefront', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '50000', 0, 1, 'MYC0C81103', 'CHK', '2001-07-17'),
(117, 'HP Officejet 6500X Plus', 3, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '35000', 0, 1, 'CN0BFY270S', 'CHK', '2002-07-17'),
(118, 'Dell Inspiron 15 core I 5', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '480000', 0, 1, '446VK223', 'CHK', '2003-07-17'),
(119, 'Dell Latittude 3470', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '270000', 0, 1, '7YKF0C23', 'CHK', '2004-07-17'),
(120, 'Dell Latittude 3470', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '270000', 1, 1, 'BH910C23', 'CHK', '2005-07-17'),
(121, 'Dell Inspiron 15 core I 5', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '480000', 0, 1, '4Z50K22', 'CHK', '2006-07-17'),
(122, 'Dell Latitude 3470', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '270000', 0, 1, '13N13H12', 'CHK', '2007-07-17'),
(123, 'Dell Latitude E5470', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '270000', 0, 1, 'BNNG0G23', 'CHK', '2008-07-17'),
(124, 'Dell Latitude E5470', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '270000', 0, 1, 'DPFT2G23', 'CHK', '2009-07-17'),
(125, 'Dell inspiron 15 3567', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '125000', 1, 1, '5NK1MJ2', 'CHK', '2010-07-17'),
(126, 'Dell Inspiron 15R', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '125000', 1, 1, 'H7BG9H2', 'CHK', '2011-07-17'),
(127, 'Xerox work center 4118x', 3, '../assests/images/star.png', 30, 12, '1', 'GENERIC_NAME', '330000', 0, 1, 'BICP02094', 'CHK', '2011-08-17'),
(128, 'Xerox WorkCentre 5325', 3, '../assests/images/star.png', 30, 12, '1', 'GENERIC_NAME', '1120000', 0, 1, 'D-D 020 3322804180', 'CHK', '2011-09-17'),
(129, 'CISCO 1800', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG3', 'CHK', '2012-07-17'),
(130, 'CISCO 1800', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG5', 'CHK', '2012-08-17'),
(131, 'CISCO SF200 - 24P', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG6', 'CHK', '2012-09-17'),
(132, 'CISCO SF200 - 24P', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG7', 'CHK', '2012-10-17'),
(133, 'CISCO SF200 - 24P', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG8', 'CHK', '2012-11-17'),
(134, 'CISCO SF300 - 24P', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG9', 'CHK', '2012-12-17'),
(135, 'CISCO SF300 - 24P', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG10', 'CHK', '2013-12-17'),
(136, 'CISCO SF300 - 24P', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG11', 'CHK', '2014-12-17'),
(137, 'CISCO SG100 - 24P', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG12', 'CHK', '2015-12-17'),
(138, 'CISCO SG200 - 24', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG13', 'CHK', '2016-12-17'),
(139, 'CISCO SF100D-08', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG14', 'CHK', '2017-12-17'),
(140, 'CISCO SF100D-08', 3, '../assests/images/star.png', 23, 15, '1', 'GENERIC_NAME', '115000', 1, 1, 'NOTAG15', 'CHK', '2018-12-17'),
(141, 'DELL (ACCOUNT)', 3, '../assests/images/star.png', 16, 13, '1', 'GENERIC_NAME', '95000', 0, 1, 'JGDNT2X', 'CHK', '2019-12-17'),
(142, 'HP PROLIANT (AD)', 3, '../assests/images/star.png', 14, 13, '1', 'GENERIC_NAME', '400000', 0, 1, 'CZ20070HYH', 'CHK', '2020-12-17'),
(143, 'DELL OPTIPLEX 380 (ADC)', 3, '../assests/images/star.png', 16, 13, '1', 'GENERIC_NAME', '95000', 0, 1, '1YXRZ4J', 'CHK', '2021-12-17'),
(144, 'HP PROLIANT (APPLICATION)', 3, '../assests/images/star.png', 14, 13, '1', 'GENERIC_NAME', '400000', 1, 1, 'CZ20070J59', 'CHK', '2022-12-17'),
(145, 'DELL OPTIPLEX 360 (ISA)', 3, '../assests/images/star.png', 16, 13, '1', 'GENERIC_NAME', '95000', 0, 1, 'HW9VL8X', 'CHK', '2023-12-17'),
(146, 'POWER VAULT NX3200 (storage)', 3, '../assests/images/star.png', 16, 13, '1', 'GENERIC_NAME', '8242', 0, 1, '3LD96X1', 'CHK', '2024-12-17'),
(147, 'POWEREDGE DELL R210 (TMG)', 3, '../assests/images/star.png', 16, 13, '1', 'GENERIC_NAME', '250000', 0, 1, 'HGM1YX1', 'CHK', '2025-12-17'),
(148, 'DELL OPTIPLEX 380 (VPN)', 3, '../assests/images/star.png', 16, 13, '1', 'GENERIC_NAME', '95000', 0, 1, '6RLNT2X', 'CHK', '2026-12-17'),
(149, 'Gamatronics', 3, '../assests/images/star.png', 24, 16, '1', 'GENERIC_NAME', '1600000', 0, 1, '1028-710695', 'CHK', '2001-08-17'),
(150, 'Gamatronics MS 10 KVA', 3, '../assests/images/star.png', 24, 16, '1', 'GENERIC_NAME', '1600000', 0, 1, '1006-686030', 'CHK', '2002-08-17'),
(151, 'Gamatronics MST 3-6 KVA', 3, '../assests/images/star.png', 24, 16, '1', 'GENERIC_NAME', '1500000', 1, 1, 'NOTAG16', 'CHK', '2003-08-17'),
(152, 'Gamatronics Modular-20 KVA', 3, '../assests/images/star.png', 24, 16, '1', 'GENERIC_NAME', '4200000', 0, 1, '779525', 'CHK', '2004-08-17'),
(153, 'APC 1.5 KVA', 3, '../assests/images/star.png', 25, 16, '1', 'GENERIC_NAME', '95000', 0, 1, 'AS1351216692', 'CHK', '2005-08-17'),
(154, 'APC 1.5 KVA', 3, '../assests/images/star.png', 25, 16, '1', 'GENERIC_NAME', '95000', 1, 1, 'NOTAG2', 'CHK', '2006-08-17'),
(155, 'APC KVA FLAT', 3, '../assests/images/star.png', 25, 16, '1', 'GENERIC_NAME', '195000', 0, 1, 'RM12V', 'CHK', '2007-08-17'),
(156, 'Dell Inspiron 15 core I 7', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '480000', 0, 1, '446VK22', 'CHK', '2028-10-17'),
(157, 'Dell Latittude 3470', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '270000', 0, 1, '7YKF0C2', 'CHK', '2028-10-17'),
(158, 'Dell Latittude 3470', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '270000', 1, 1, 'BH910C2', 'CHK', '2028-10-17'),
(159, 'Dell Inspiron 15 core I 7', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '480000', 1, 1, 'FBB71C2', 'CHK', '2028-10-17'),
(160, 'Dell XPS13 (9365)', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '480000', 1, 1, '9BGRMH2', 'CHK', '2004-06-18'),
(161, 'Apple Magis Mouse', 3, '../assests/images/star.png', 17, 17, '1', 'GENERIC_NAME', '54000', 0, 1, 'CC264662DFMGRHQAF', 'CHK', '2007-12-17'),
(162, 'Apple Magis Mouse', 3, '../assests/images/star.png', 17, 17, '1', 'GENERIC_NAME', '54000', 0, 1, 'CC264351T8TGRHQAV', 'CHK', '2007-12-17'),
(163, 'DELL INSPIRON 15R', 3, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '125000', 1, 1, 'H7BG9H23', 'CHK', '2004-12-18'),
(164, 'DELL  LATITUDE 5480', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '0', 0, 1, '9NFGSF2', 'CHK', '2004-12-18'),
(165, 'Dell Optiplex 3010', 4, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '1Z08WS1', 'CHK', '2007-12-17'),
(166, 'DLL OPTIPLEX 3010', 4, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'FW4PYX1', 'CHK', '2013-07-17'),
(167, 'DELL OPTIPLEX 380', 4, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '851T7BS', 'CHK', '2014-07-17'),
(168, 'DELL OPTILEX 380', 4, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'BMDNT2X', 'CHK', '2015-07-17'),
(169, 'DELL GX620', 4, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 1, 1, 'NOTAG17', 'CHK', '2016-07-17'),
(170, 'HP COMPAQ DX1000MT', 4, '../assests/images/star.png', 14, 11, '1', 'GENERIC_NAME', '0', 0, 1, '3CB94121DX', 'CHK', '2017-07-17'),
(171, 'DELL INSPIRON 3521', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '3KL2602', 'CHK', '2018-07-17'),
(172, 'DELL INSPIRON 5558', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'F5QKQ32', 'CHK', '2019-07-17'),
(173, 'DELL INSPIRON 5558', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'G9LKQ32', 'CHK', '2020-07-17'),
(174, 'DELL INSPIRON 3521', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '99000', 0, 1, 'HSORQZ1', 'CHK', '2021-07-17'),
(175, 'DELL INSPIRON 3521', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '4SLTPX1', 'CHK', '2022-07-17'),
(176, 'ASPIRE ES1-131', 4, '../assests/images/star.png', 26, 10, '1', 'GENERIC_NAME', '0', 0, 1, 'NXG17EM0236070783A7600', 'CHK', '2023-07-17'),
(177, 'INSPIRON N5050', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'H9TQPR1', 'CHK', '2024-07-17'),
(178, 'INSPIRON 3521', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '6KPD402', 'CHK', '2025-07-17'),
(179, 'LATITUDE E5440', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '165000', 0, 1, '13S7482', 'CHK', '2026-07-17'),
(180, 'Imac', 4, '../assests/images/star.png', 17, 10, '1', 'GENERIC_NAME', '511000', 1, 1, 'NOTAG18', 'CHK', '2027-07-17'),
(181, 'INSPIRON N411Z', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '120000', 0, 1, '3MTJQS1', 'CHK', '2028-07-17'),
(182, 'LASERJET 600 M602', 4, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '0', 0, 1, '869457788', 'CHK', '2029-07-17'),
(183, 'LASERJET 500 COLOR M551', 4, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '0', 1, 1, 'CNBTD9C0C6', 'CHK', '2030-07-17'),
(184, 'KX-TG6823EB', 4, '../assests/images/star.png', 27, 18, '1', 'GENERIC_NAME', '0', 0, 1, '4LAQB059304', 'CHK', '2031-07-17'),
(185, 'KX-TG6823EB', 4, '../assests/images/star.png', 27, 18, '1', 'GENERIC_NAME', '0', 0, 1, '4LAQB059774', 'CHK', '2008-01-17'),
(186, 'KX-TG6823EB', 4, '../assests/images/star.png', 27, 18, '1', 'GENERIC_NAME', '0', 0, 1, '4LAQB059169', 'CHK', '2008-02-17'),
(187, 'KX-TG6823EB', 4, '../assests/images/star.png', 27, 18, '1', 'GENERIC_NAME', '0', 0, 1, '4LAQB054681', 'CHK', '2008-03-17'),
(188, 'VNTS-NPDTEPLC2014', 4, '../assests/images/star.png', 28, 19, '1', 'GENERIC_NAME', '0', 0, 1, '1411055344', 'CHK', '2008-04-17'),
(189, 'VNTS-NPDTEPLC2014', 4, '../assests/images/star.png', 28, 19, '1', 'GENERIC_NAME', '0', 0, 1, '1411055343', 'CHK', '2008-05-17'),
(190, 'FIRSTPOWER(LFP12200) 10KVA', 4, '../assests/images/star.png', 29, 16, '1', 'GENERIC_NAME', '1600000', 0, 1, '1006-688030', 'CHK', '2008-06-17'),
(191, 'XEROX WORK CENTER 5016', 4, '../assests/images/star.png', 30, 12, '1', 'GENERIC_NAME', '320000', 0, 1, '140082638', 'CHK', '2008-07-17'),
(192, '24 PORTS TENDA SWITCH ', 4, '../assests/images/star.png', 31, 15, '1', 'GENERIC_NAME', '0', 0, 1, '0002800', 'CHK', '2008-08-17'),
(193, '24 PORTS TENDA SWITCH ', 4, '../assests/images/star.png', 31, 15, '1', 'GENERIC_NAME', '0', 1, 1, 'NOTAG19', 'CHK', '2008-09-17'),
(194, '24 PORTS PATCH PANEL', 4, '../assests/images/star.png', 31, 15, '1', 'GENERIC_NAME', '0', 1, 1, 'NOTAG20', 'CHK', '2008-10-17'),
(195, '24 PORTS PATCH PANEL', 4, '../assests/images/star.png', 31, 15, '1', 'GENERIC_NAME', '0', 1, 1, 'NOTAG21', 'CHK', '2008-11-17'),
(196, '24 PORTS PATCH PANEL', 4, '../assests/images/star.png', 31, 15, '1', 'GENERIC_NAME', '0', 1, 1, 'NOTAG22', 'CHK', '2008-12-17'),
(197, 'DELL LATITUDE 3560', 4, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '260000', 0, 1, 'C5ZSPJ2\r\n', 'CHK', '2013-08-17'),
(198, 'DELL OPTIPLEX 3010', 5, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'J62FJ52', 'CHK', '2014-08-17'),
(199, 'DELL OPTIPLEX 3010', 5, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'J61FJ52', 'CHK', '2015-08-17'),
(200, 'DELL OPTIPLEX 3010', 5, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'BMY5WS1', 'CHK', '2016-08-17'),
(201, 'DELL OPTIPLEX 3010', 5, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'FL7Y8R1', 'CHK', '2017-08-17'),
(202, 'DELL OPTIPLEX 3010', 5, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '524JYX1', 'CHK', '2018-08-17'),
(203, 'LASERJET PRINTER P2055DN', 5, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '50000', 0, 1, 'CNCKD60538', 'CHK', '2019-08-17'),
(204, 'XEROX PHOTOCOPIER', 5, '../assests/images/star.png', 30, 12, '1', 'GENERIC_NAME', '320000', 0, 1, '898E6351', 'CHK', '2020-08-17'),
(205, 'Dell Optiplex 380', 6, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'CJCNT2X', 'CHK', '2021-08-17'),
(206, 'Dell Optiplex 3020', 6, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, 'BS9TYR12', 'CHK', '2022-08-17'),
(207, 'Dell Inspiron 15', 6, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '120000', 1, 1, '6KPD4023', 'CHK', '2023-08-17'),
(208, 'HP Laserjet pro 300 colour', 6, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '112000', 0, 1, 'CND8F8H3FY', 'CHK', '2024-08-17'),
(209, 'SAFE POWER 1.5KVA', 6, '../assests/images/star.png', 32, 16, '1', 'GENERIC_NAME', '252000', 0, 1, '7F828B100433', 'CHK', '2025-08-17'),
(210, 'Dell inspiron 15 3000 series', 1, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '122000', 0, 1, 'CB01512', 'CHK', '2026-08-17'),
(211, 'Dell latitude E5490', 1, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '165000', 0, 1, 'FQLTH12', 'CHK', '2027-08-17'),
(212, 'Dell latitude 3570', 1, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '165000', 0, 1, '8GSBB82', 'CHK', '2028-08-17'),
(213, 'Dell inspiron 3521', 7, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '99000', 0, 1, '6T7TPX1', 'CHK', '2029-08-17'),
(214, 'HP pro 8610', 7, '../assests/images/star.png', 14, 12, '1', 'GENERIC_NAME', '0', 0, 1, 'CN49QDW2ZY', 'CHK', '2030-08-17'),
(215, 'Dell Optilpex 3020', 8, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '5432KZ1', 'CHK', '2031-08-17'),
(216, 'Dell Optilpex 3020', 8, '../assests/images/star.png', 16, 11, '1', 'GENERIC_NAME', '120000', 0, 1, '1J3QR12', 'CHK', '2009-01-17'),
(217, 'Dell Inspiron 3520', 8, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '165000', 0, 1, '9FJBHW1', 'CHK', '2009-02-17'),
(218, 'Dell Inspiron 3521', 8, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '99000', 0, 1, 'HXB6602', 'CHK', '2009-03-17'),
(219, 'Dell Inspiron 15', 8, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '122000', 0, 1, '9PDJ402', 'CHK', '2009-04-17'),
(220, 'Dell Inspiron 15', 8, '../assests/images/star.png', 16, 10, '1', 'GENERIC_NAME', '122000', 0, 1, 'HYBR412', 'CHK', '2009-05-17'),
(221, 'WinPro', 3, '../assests/images/star.png', 14, 10, '1', 'Jay PC', '88888', 1, 1, 'ABDEE', 'JAYYY', '2018-05-14'),
(222, 'Viproq', 4, '../assests/images/star.png', 14, 10, '1', 'Jude', '90000', 1, 1, 'IJKL', 'Kola', '2018-05-13'),
(224, 'Vip', 4, '../assests/images/star.png', 1, 1, '1', 'Jay', '5000', 1, 1, 'ABCDEFG', 'Reality', '2018-05-13'),
(225, 'jjjjj', 1, '../assests/images/star.png', 14, 10, '1', 'jjj', '9999', 1, 1, 'oooo', 'kkkkkk', '2018-05-06'),
(226, 'jude', 2, '../assests/images/star.png', 15, 11, '1', 'jude', '88888', 1, 1, 'abkpdpo', 'kid', '2018-05-06'),
(227, 'dami', 3, '../assests/images/star.png', 15, 10, '1', 'jude', '8999', 1, 1, 'jinds8d', 'jucadg', '2018-05-13'),
(228, 'kris', 2, '../assests/images/star.png', 14, 10, '1', 'uuuuu', '999', 1, 1, '000jjj', 'mmm', '2018-05-06'),
(229, 'Dell Latitude 3470', 3, '../assests/images/star.png', 16, 10, '1', 'HOF_107', '285000', 0, 1, '5ZMF0C2', 'No Vendor', '2017-04-02'),
(230, 'Dell Inspiron 15', 3, '../assests/images/star.png', 16, 10, '1', 'Generic', '275000', 0, 1, 'C2DZLJ2', 'UNKNOWN', '2017-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `req`
--

CREATE TABLE `req` (
  `id` int(11) NOT NULL,
  `req_no` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `employee_dept` varchar(255) NOT NULL,
  `employee_email` varchar(255) NOT NULL,
  `issued_date` date NOT NULL,
  `returned_date` date DEFAULT NULL,
  `returned` int(11) NOT NULL DEFAULT '0',
  `expression` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`request_id`, `item_id`, `employee_name`, `employee_dept`, `employee_email`, `issued_date`, `returned_date`, `returned`, `expression`, `status`) VALUES
(1, 1, 'Maribel Karbeat', 'Media', 'maribel.karbeat@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(2, 3, 'Sesan Odukomaiya', 'Music', 'odukomaiya.sesan@thispresenthouse.org', '2017-04-01', '2018-05-07', 2, 3, 1),
(3, 4, 'Chinyere Ibeabuchi', 'Music', 'ibeabuchi.chinyere@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(4, 5, 'Opeyemi Olunuga', 'Admin', 'opeyemi.olunuga@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(5, 6, 'Live Production', 'Media', 'generic@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(6, 7, 'Live Production', 'Media', 'generic@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(7, 8, 'Live Production', 'Media', 'generic@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(8, 9, 'Live Production', 'Meida', 'generic@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(9, 10, 'Usman Samuel', 'Media', 'samuel.usman@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(10, 11, 'Osasumwen Jolly', 'Media', 'osasumwem.jolly@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(11, 12, 'AJA', 'Media', 'generic@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(12, 13, 'Okereafor Chima', 'Media', 'okereafor.chima@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(13, 14, 'Hilary Taiwo', 'Admin', 'taiwo.hilary@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(14, 15, 'Modupe Olatimehin', 'Admin', 'modupe.olatimehin@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(15, 18, 'Layo Samuel', 'Admin', 'samuel.layo@thispresenthouse.org', '2018-04-01', '1970-01-01', 2, 3, 1),
(16, 20, 'Irene Eromosele', 'Procurement', 'irene.eromosele@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(17, 23, 'Nkoyo Okon', 'OOP', 'eyo.okon@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(18, 24, 'Abu Adamu Otohimoyi', 'OOP', 'abu.adamu@thispresenthouse.org', '2017-04-01', '1970-01-01', 2, 3, 1),
(19, 16, 'Ruth Ozor', 'Admin', 'ozor.ruth@thispresenthouse.org', '2017-05-08', '2017-05-17', 2, 3, 1),
(20, 17, 'Helen Enenmoh Ubak', 'Admin', 'generic@c', '2017-05-01', '2017-05-03', 2, 3, 1),
(21, 21, 'Obigeri Imerion', 'HR', 'obiageri.imerion@thispresenthouse.org', '2017-04-02', '2017-04-02', 1, 3, 1),
(22, 22, 'Jacklyn Arigbe', 'HR', 'arigbe.jacklyn@thispresenthouse.org', '2017-04-01', '2017-04-01', 1, 3, 1),
(23, 27, 'Rufus Adegbite', 'Project', 'adegbite.rufus@thispresenthouse.org', '2017-05-01', '2017-05-01', 2, 3, 1),
(24, 28, 'Charles Umoh', 'Operations', 'c.umoh@thispresenthouse.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(25, 29, 'Olakunle Amodu', 'Oprerations', 'olakunle.amodu@thispresenthouse.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(26, 30, 'Ikwuogu Jonathan', 'Operations', 'ikwuogu.jonathan@thispresenthouse.org', '2017-05-01', '2017-05-10', 2, 3, 1),
(27, 31, 'Abe Oluwole', 'Junior church', 'abe.oluwole@thispresenthouse.org', '2017-05-03', '2017-05-01', 2, 3, 1),
(28, 32, 'Ayodele Adebayo', 'sound and spirit', 'generic@thispresenthouse.org', '2017-05-01', '2017-05-01', 2, 3, 1),
(29, 33, 'Ayodele Adebayo', 'Sound and Spirit', 'generic@tph.org', '2017-05-01', '2017-05-01', 2, 3, 1),
(30, 42, 'Gbemisola Adekola', 'Accounts', 'gbemisola.adekola@thispresenthouse.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(31, 35, 'Yinka Kadiri', 'Accounts', 'yinka.kadiri@thispresenthouse.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(32, 36, 'Adebowale Amugba', 'Accounts', 'adebowale.amugba@thispresenthouse.org', '2017-05-01', '2017-05-01', 2, 3, 1),
(33, 37, 'Toyin Kehinde', 'Accounts', 'toyin.kehinde@thispresenthouse.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(34, 38, 'Account Guest', 'Accounts', 'gen@tph.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(35, 39, 'Peter Ajalo', 'Accounts', 'ajalo.peter@thispresenthouse.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(36, 40, 'Oluwafemi Fatoba', 'Accounts', 'fatoba.oluwafemi@thispresenthouse.org', '2017-05-08', '1970-01-01', 2, 3, 1),
(37, 41, 'Collins Osuji', 'Security', 'osuji.collins@thispresenthouse.org', '2017-05-01', '2017-05-01', 2, 3, 1),
(38, 42, 'Collins Osuji', 'Security', 'osuji.collins@thispresenthouse.org', '2017-05-01', '1970-01-01', 2, 3, 1),
(261, 43, 'Anthony Ileogbon', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(262, 44, 'Tayo Adejumo', 'OOP', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(263, 45, 'Isaac Essien', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(264, 47, 'Akin Omoniyi', 'Security', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(265, 48, 'Salami Abiodun', 'Security', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(266, 49, 'Timi Tare', 'Security', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(267, 50, 'Abu Micheal', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(268, 51, 'Mike Okwudolor', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(269, 52, 'Odunayo Ojo', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(270, 53, 'Anthony Ileogbon', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(271, 54, 'Agho Favor', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(272, 55, 'Isaac Essien', 'Media', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(273, 56, 'Adetoro Oyairo- Aboluwarin Oluwayemisi-Funmi Ibiyode-Anthony Ileogben', 'OOP', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(274, 57, 'Aladetoyinbo Shola', 'Junior Church', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(275, 58, 'Unassigned', 'Sound and Spirit', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(276, 59, 'Chris Ugim', 'Sound and Spirit', 'Generic@TPH.org', '2018-05-15', '1970-01-01', 2, 3, 1),
(277, 60, 'Valentine Okwudili', 'Sound and Spirit', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(278, 61, 'Urinrin Ogidiama', 'Sound and Spirit', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(279, 62, 'Moses Yakubu', 'Media', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(280, 63, 'Akin Ajose-Adeogun', 'E-church', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(281, 64, 'Tomi Ajakaiye', 'Communications', 'Generic@TPH.org', '2018-05-16', '2018-05-23', 1, 3, 1),
(282, 65, 'Ooye Temitope', 'Communications', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(283, 66, 'Shola Ajao', 'Accounts', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(284, 67, 'Adedayo Alabi', 'Accounts', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(285, 68, 'CFO', 'Accounts', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(286, 106, 'Uzo Ndu-Nwogu', 'Procurement', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(287, 69, 'Ofure Kingsley', 'Accounts', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(288, 212, 'Vivian Akinsoye', 'OOSP', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(289, 70, 'Henry Nwachukwu', 'Security', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(290, 71, 'Uzo Ndu-Nwogu', 'Procurement', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(291, 72, 'Unassigned', 'Makeover series', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(292, 101, 'Kelechi Nduaguibe', 'COMMUNICATIONS', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(293, 73, 'Abe Olawale', 'HR', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(294, 75, 'Oluwaseun Okoro', 'OOP', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(295, 220, 'Olusola Opaoluwa', 'FREEDOM FOUNDATION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(296, 76, 'Funmi Ibiyode', 'OOP', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(297, 77, 'Tamilore Okuneye', 'OOP', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(298, 219, 'Olusola Okodugha', 'FREEDOM FOUNDATION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(299, 79, 'Nifesimi Laniyan', 'OOP', 'Generic@TPH.org', '2018-05-16', '2018-05-21', 1, 3, 1),
(300, 218, 'Eno Kennedy', 'FREEDOM FOUNDATION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(301, 217, 'Micheal Ejoor', 'FREEDOM FOUNDATION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(302, 80, 'Ariyike Ajuborisha', 'Makeover series', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(303, 81, 'Chizitere Ogbuike', 'TUG', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(304, 216, 'Timothy Idiaghe', 'FREEDOM FOUNDATION', 'geneirc@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(305, 82, 'Adejoke Adekoya', 'Legal', 'Generic@TPH.org', '2018-05-16', '2017-02-19', 1, 3, 1),
(306, 215, 'Unassigned', 'FREEDOM FOUNDATION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(307, 84, 'Oluwamayowa Ogunsola Steepe', 'IT', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(308, 85, 'Kuti Olujimi', 'IT', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(309, 214, 'Green house', 'Green house', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(310, 86, 'Oloruntoba Fasunon', 'IT', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(311, 87, 'Olamide Thomas', 'IT', 'Generic@TPH.org', '2018-05-16', '2018-03-08', 1, 3, 1),
(312, 213, 'Yetunde Daodu', 'Admin', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(313, 88, 'Ifeoma Nwawe', 'IT', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(314, 89, 'Unassigned', 'IT', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(315, 90, 'Nkoyelu Chijioke', 'Admin', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(316, 211, 'Ugoeze Udanoh', 'Admin', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(317, 91, 'Freedom Project', 'Project', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(318, 210, 'Mathilda Chiamaka Maduboko', 'Admin', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(319, 92, 'Freedom Project', 'Project', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(320, 93, 'Okonkwo Christopher', 'Operation', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(321, 209, 'MZ', 'MOUNT ZION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(322, 94, 'Henry Nwachukwu -', 'Project', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(323, 208, 'MZ', 'MOUNT ZION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(324, 95, 'Henry Nwachukwu ', 'Security', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 1, 3, 1),
(325, 96, 'Adewale Amugba', 'Accounts', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(326, 178, 'Shola Odewabi', 'MZ', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(327, 97, 'Karbeat Bella', 'Media', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(328, 206, 'Tobi Oke', 'MZ', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(329, 205, 'Micheal Ileogbon', 'MZ', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(330, 99, 'Babalola', 'HTL', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(331, 204, 'GBN', 'GBN', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(332, 100, 'Chike orji', 'Communications', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(333, 203, 'GBN', 'GBN', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(334, 102, 'Obigeri Imerion', 'HR', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 1, 3, 1),
(335, 103, 'Jacklyn Arigbe', 'HR', 'Generic@TPH.org', '2018-05-16', '2018-02-01', 1, 3, 1),
(336, 202, 'UNASSIGNED', 'GBN', 'generic@tph.com', '2018-05-16', '1970-01-01', 2, 3, 1),
(337, 104, 'Shola Ajao', 'Accounts', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(338, 201, 'TOBA ALAPO', 'ADMIN', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(339, 105, 'Tobe Rapu -Stephen Omotosho', 'OOSP-Dome Admin', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(340, 200, 'PASTOR ALEX', 'GBN', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(341, 199, 'GBN MEDIA/EASY WORSHIP', 'GBN MEDIA', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(342, 107, 'FAVOUR Agho', 'Media', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(343, 198, 'GBN MEDIA/EASY WORSHIP', 'GBN MEDIA', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(344, 197, 'SEUN', 'OPERATIONS', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(345, 192, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(346, 108, 'Abdul Usman', 'Media', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(347, 191, 'TWB GENERAL OFFICE', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(348, 109, 'Osasumwen Jolly', 'Media', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(349, 150, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(350, 189, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(351, 112, 'OOP', 'OOP', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(352, 188, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(353, 113, 'Accounts', 'Accounts', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(354, 114, 'Security', 'Security', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(355, 187, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(356, 115, 'Media wing', 'Media wing', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(357, 186, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(358, 116, 'Uzo Ndu-Nwogu', 'Procurement', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(359, 185, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(360, 117, 'Adejoke Adekoya', 'Legal', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(361, 156, 'Oloruntoba Fasunon', 'church technology', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(362, 184, 'TWB', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(363, 157, 'Nnaemeka Ekwueme', 'HR', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(364, 121, 'Oluwamayowa Ogunsola Steepe', 'IT', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(365, 182, 'TWB GENERAL OFFICE', 'TWB', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(366, 122, 'Oyinkansola Idowu', 'Media', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(367, 181, 'MEDIA', 'MEDIA', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(368, 123, 'Jacklyn Arigbe', 'HR', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(369, 124, 'Obigeri Imerion', 'HR', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(370, 179, 'MEDIA/EASY WORSHIP', 'MEDIA', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(371, 127, 'Media wing', 'Media wing', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(372, 177, 'MEDIA/ KIDZONE', 'MEDIA', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(373, 128, 'Second reception', 'Second reception', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(374, 141, 'ACCOUNT', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(375, 176, 'TWB MEDIA', 'MEDIA', 'generic@thp.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(376, 175, 'ADEOLA ELUJOBA', 'ADMIN', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(377, 174, 'OYEKU MICHAEL', 'IT', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(378, 173, 'STANLEY OYOVOTA', 'COMMUNICATION', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(379, 172, 'BENE OBIALI', 'ADMIN', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(380, 171, 'FRANCIS EBIEMI', 'OPERATION/PROJECT', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(381, 142, 'AD', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(382, 143, 'ADC', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(383, 41, 'APPLICATION', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(384, 145, 'ISA', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(385, 170, 'IT', 'IT', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(386, 146, 'POWER VAULT NX3200 (storage)', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(387, 147, 'POWEREDGE DELL R210 (TMG)', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(388, 168, 'IT', 'IT', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(389, 148, 'VPN', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(390, 167, 'IT', 'IT', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(391, 149, 'Gamatronics', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(392, 190, 'Gamatronics', 'TRI', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(393, 166, 'SANYA AJIBADE', 'ICHURCH TRAINING', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(394, 152, 'Gamatronics', 'DOME', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(395, 165, 'Peter Jacobs.', 'P.A To Pst. Tolu Adesanya', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(396, 153, 'APC', 'Auditoriun-Ene-Sound', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(397, 155, 'APC', 'Auditoriun-Production', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(398, 164, 'Seun Balogun', 'operations', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(399, 126, 'Ade Thompson-John', 'OOP', 'generic@tph.org', '2018-05-16', '2018-05-21', 1, 3, 1),
(400, 118, 'Mayowa Steepes', 'church technology', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(401, 2, 'IT', 'IT', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(402, 119, 'Nnaemeka Ekwueme', 'HR', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(403, 161, 'FAVOR AGHO', 'TRI', 'generic@tph.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(404, 162, 'I.T', 'I.T', 'Generic@TPH.org', '2018-05-16', '1970-01-01', 2, 3, 1),
(405, 87, 'Ikhine Clement', 'IT', 'ikhine.clement@thispresenthouse.org', '2018-04-02', '2018-05-15', 1, 3, 1),
(406, 103, 'Omonuwa Olulano', 'HR', 'Olulano.Omonuwa@thispresenthouse.org', '2018-02-02', '1970-01-01', 2, 3, 1),
(407, 229, 'Clement Ikhine', 'IT', 'ikhine.clement@thispresenthouse.org', '2018-04-02', '1970-01-01', 2, 3, 1),
(408, 102, 'Ebube Imana', 'HR', 'imana.ebube@thispresenthouse.org', '2018-04-16', '1970-01-01', 2, 3, 1),
(409, 82, 'Opeyemi Akinkusote', 'HR', 'akinkusote.opeyemi@thispresenthouse.org', '2018-02-12', '1970-01-01', 2, 2, 1),
(410, 230, 'Feigne Siunner', 'Junior Church', 'siunner.feigne@thispresenthouse.org', '2018-05-09', '1970-01-01', 2, 3, 1),
(411, 95, 'Amodu Olakunle Olukayode', 'Operations', 'generic@tph.org', '2018-05-08', '1970-01-01', 2, 4, 1),
(412, 87, 'Tobiloba Olaosun', 'Communications', 'olaosun.tobiloba@thispresenthouse.org', '2018-05-21', '1970-01-01', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `req_item`
--

CREATE TABLE `req_item` (
  `id` int(11) NOT NULL,
  `req_id` int(11) NOT NULL,
  `req_name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'damidinhojude@gmail.com'),
(2, 'guest', '084e0343a0486ff05530df6c705c8bb4', 'dami@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `categoriescon`
--
ALTER TABLE `categoriescon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumables`
--
ALTER TABLE `consumables`
  ADD PRIMARY KEY (`consumables_id`),
  ADD UNIQUE KEY `service_tagC` (`service_tagC`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `service_tag` (`service_tag`);

--
-- Indexes for table `req`
--
ALTER TABLE `req`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `req_item`
--
ALTER TABLE `req_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categoriescon`
--
ALTER TABLE `categoriescon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consumables`
--
ALTER TABLE `consumables`
  MODIFY `consumables_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
