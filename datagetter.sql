-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Server version: 5.6.12
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `datagetter`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(1) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `email` varchar(26) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `phone`, `email`) VALUES
(1, 'John', 'Smith', '5125551111', 'john@smith.com'),
(2, 'Dave', 'Jones', '5125552222', 'dave.jones@egmail.com'),
(3, 'Betty', 'Rubble', '5125553333', 'bettyR@flintstone.net'),
(4, 'Frank', 'Zapino', '5125554444', 'fzapino@rocknstuff.com'),
(5, 'Alice', 'Hatter', '5125555555', 'madHatter@lookingglass.org');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `transaction_id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int(10) NOT NULL,
  `retail` float NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=16 ;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `customer_id`, `product_id`, `date`, `quantity`, `retail`, `cost`) VALUES
(1, 1, 1, '2012-12-01 09:10:00', 1, 10, 8),
(2, 3, 1, '2013-04-01 10:11:00', 3, 28.5, 24),
(3, 5, 1, '2012-06-02 19:55:00', 1, 9.75, 8),
(4, 2, 2, '2013-01-02 11:11:00', 1, 15, 10),
(5, 3, 3, '2013-04-01 10:11:00', 2, 19.6, 18),
(6, 5, 3, '2012-06-03 08:55:00', 4, 39, 36),
(7, 1, 4, '2012-12-01 09:10:00', 1, 14, 11),
(8, 5, 4, '2012-06-03 15:12:00', 1, 13, 11),
(9, 2, 5, '2013-02-01 16:11:00', 2, 50, 40),
(10, 4, 5, '2013-04-01 18:11:00', 2, 50, 40);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
