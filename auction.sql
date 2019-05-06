-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 19, 2018 at 05:48 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `bidder_item`
--

DROP TABLE IF EXISTS `bidder_item`;
CREATE TABLE IF NOT EXISTS `bidder_item` (
  `Email` varchar(100) NOT NULL,
  `P_ID` int(5) NOT NULL,
  `Bid` float NOT NULL,
  KEY `fk_bid` (`P_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidder_item`
--

INSERT INTO `bidder_item` (`Email`, `P_ID`, `Bid`) VALUES
('bidder2@gmail.com', 28, 22),
('bidder2@gmail.com', 32, 30),
('bidder@gmail.com', 29, 10),
('bidder@gmail.com', 31, 4),
('bidder@gmail.com', 32, 25);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `P_ID` int(5) NOT NULL AUTO_INCREMENT,
  `P_Name` varchar(20) NOT NULL,
  `Brand` varchar(20) NOT NULL,
  `QTY` int(11) NOT NULL,
  `Price` float NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Image_Path` blob,
  `Item_Type` varchar(50) NOT NULL,
  `Seller_mail` varchar(100) NOT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`P_ID`, `P_Name`, `Brand`, `QTY`, `Price`, `Description`, `Image_Path`, `Item_Type`, `Seller_mail`) VALUES
(32, 'Violin', 'Treble', 1, 50, '', 0x696d616765732f6d757369632e6a7067, 'Musical Instrument', 'seller2@gmail.com'),
(31, 'Tennis rackets', 'Several brands', 10, 20, 'Used by top class tennis players', 0x696d616765732f73706f7274732e6a7067, 'Sports Equipment', 'seller2@gmail.com'),
(30, 'Shaker', 'MP', 5, 5, 'Original', 0x696d616765732f73706f7274732e6a7067, 'Sports Equipment', 'seller@gmail.com'),
(29, 'Video games', 'Several brands', 10, 10, 'Games for Xbox at best price', 0x696d616765732f656c6563747269632e6a7067, 'Electric Item', 'seller2@gmail.com'),
(28, 'Guitar', 'Yamaha', 1, 50, 'Second hand', 0x696d616765732f6d757369632e6a7067, 'Musical Instrument', 'seller@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `temp_products`
--

DROP TABLE IF EXISTS `temp_products`;
CREATE TABLE IF NOT EXISTS `temp_products` (
  `Temp_ID` int(5) NOT NULL AUTO_INCREMENT,
  `Temp_Name` varchar(20) NOT NULL,
  `Temp_Brand` varchar(20) NOT NULL,
  `Temp_QTY` int(11) NOT NULL,
  `Temp_Price` float NOT NULL,
  `Temp_Description` varchar(100) DEFAULT NULL,
  `Temp_Image` blob,
  `Temp_Type` varchar(50) NOT NULL,
  `Temp_Seller_mail` varchar(100) NOT NULL,
  PRIMARY KEY (`Temp_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_products`
--

INSERT INTO `temp_products` (`Temp_ID`, `Temp_Name`, `Temp_Brand`, `Temp_QTY`, `Temp_Price`, `Temp_Description`, `Temp_Image`, `Temp_Type`, `Temp_Seller_mail`) VALUES
(42, 'Headphones', 'JBL', 2, 10, 'Brand new', 0x696d616765732f656c6563747269632e6a7067, 'Electric Item', 'seller@gmail.com'),
(43, 'Power bank ', 'MI', 5, 10, 'Unused', 0x696d616765732f656c6563747269632e6a7067, 'Electric Item', 'seller@gmail.com'),
(44, 'Drumset', 'Yamaha', 1, 200, '', 0x696d616765732f6d757369632e6a7067, 'Musical Instrument', 'seller@gmail.com'),
(46, 'Wireless charges', 'Samsung', 1, 50, '', 0x696d616765732f656c6563747269632e6a7067, 'Electric Item', 'seller2@gmail.com'),
(48, 'Trumpet', 'Bass', 2, 70, 'Ideal for beginners', 0x696d616765732f6d757369632e6a7067, 'Musical Instrument', 'seller2@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Username` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Type` varchar(10) NOT NULL,
  PRIMARY KEY (`Email`,`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Email`, `Password`, `Type`) VALUES
('seller2', 'seller2@gmail.com', 'c30248d146039dd086b12f18154863e1', 'Seller'),
('bidder', 'bidder@gmail.com', '92e4a0364e2670a621aaf4bf5765aa77', 'Bidder'),
('Admin', 'admin@gmail.com', '80396443f055ea0c4fd9719ecefcc25a', 'Admin'),
('seller', 'seller@gmail.com', '64c9ac2bb5fe46c3ac32844bb97be6bc', 'Seller'),
('bidder2', 'bidder2@gmail.com', 'c97b00da0a0010c275c6067790453d58', 'Bidder');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
