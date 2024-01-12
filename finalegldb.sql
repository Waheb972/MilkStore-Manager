-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 23, 2022 at 03:07 PM
-- Server version: 8.0.28
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalegldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numcom` int NOT NULL AUTO_INCREMENT,
  `price` float NOT NULL,
  `EmailClient` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`numcom`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`numcom`, `price`, `EmailClient`, `Date`) VALUES
(1, 75000, 'ilyes@gmail.com', '0000-00-00'),
(2, 5000, 'ilyes@gmail.com', '0000-00-00'),
(4, 17800, 'ilyes68@gmail.fr', '2022-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `estimation`
--

DROP TABLE IF EXISTS `estimation`;
CREATE TABLE IF NOT EXISTS `estimation` (
  `Date` date NOT NULL,
  `Montant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `estimation`
--

INSERT INTO `estimation` (`Date`, `Montant`) VALUES
('2022-05-01', 110000),
('2022-06-01', 200000),
('2022-07-01', 280000),
('2022-08-01', 170000),
('2022-09-01', 210000),
('2022-10-01', 100000),
('2024-08-01', 190000),
('2023-10-01', 100000),
('2023-05-01', 120000);

-- --------------------------------------------------------

--
-- Table structure for table `gros`
--

DROP TABLE IF EXISTS `gros`;
CREATE TABLE IF NOT EXISTS `gros` (
  `Type` varchar(30) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `quantity` int NOT NULL,
  `Quantity_restante` int NOT NULL,
  `prix_achat` float NOT NULL,
  `prix_client` float DEFAULT NULL,
  `prix_vendeur` float DEFAULT NULL,
  PRIMARY KEY (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gros`
--

INSERT INTO `gros` (`Type`, `designation`, `quantity`, `Quantity_restante`, `prix_achat`, `prix_client`, `prix_vendeur`) VALUES
('UTH	', '', 700, 699, 168000, 0, 0),
('LaitSter', '0%', 2000, 2000, 140000, 0, 0),
('UTH	', '222', 2, 2, 12500, NULL, NULL),
('CremeFraiche', '27% MG', 2600, 2600, 31200, 0, 0),
('LaitSter', '789', 50, 50, 70000, NULL, NULL),
('Yaourt', 'Bannane', 50, 50, 15800, 413.96, 353.92),
('LaitSter', 'bb', 60, 60, 48000, NULL, NULL),
('LaitCru', 'Befidus', 4500, 4500, 292500, 84.5, 72.15),
('Beurre', 'Demi-sel', 500, 500, 150000, 0, 0),
('LaitPast', 'Ecrémé', 3200, 3200, 176000, 0, 0),
('Yaourt', 'Fraise', 1000, 1000, 35000, 0, 0),
('Yaourt', 'Nature', 3600, 3600, 126000, 0, 0),
('LaitUHT', 'Partiellement Ecrémé', 2500, 2500, 200000, 0, 0),
('LaitPast', 'Sans lactose', 3000, 3000, 255000, 103.7, 87.55);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `numitem` int NOT NULL AUTO_INCREMENT,
  `numcom` int NOT NULL,
  `designation` varchar(30) NOT NULL,
  `type` varchar(20) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`numitem`),
  KEY `commandenum` (`numcom`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`numitem`, `numcom`, `designation`, `type`, `price`) VALUES
(1, 1, 'bananne', 'Yaourt', 25),
(2, 2, 'fraise', 'Yaourt', 25),
(3, 2, '500MG', 'Beure', 130);

-- --------------------------------------------------------

--
-- Table structure for table `journal_commande`
--

DROP TABLE IF EXISTS `journal_commande`;
CREATE TABLE IF NOT EXISTS `journal_commande` (
  `EmailClient` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `numcommande` int NOT NULL,
  `journal` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`numcommande`) USING BTREE,
  KEY `email` (`EmailClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_commande`
--

INSERT INTO `journal_commande` (`EmailClient`, `numcommande`, `journal`) VALUES
('ilyes@gmail.com', 1, 'item1---bananne---Yaourt---25.0\n'),
('ilyes@gmail.com', 2, 'item2---fraise---Yaourt---25.0\nitem3---500MG---Beure---130.0\n');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `reference` varchar(10) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `type` varchar(15) NOT NULL,
  `weight` float NOT NULL,
  `nutrition_val` float NOT NULL,
  `production_date` date NOT NULL,
  `premption_date` date NOT NULL,
  `ingredients` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`reference`),
  KEY `fr1` (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`reference`, `designation`, `type`, `weight`, `nutrition_val`, `production_date`, `premption_date`, `ingredients`) VALUES
('1200', '30M', 'Simple', 60, 350, '2022-05-01', '2023-05-26', 'item1 5g\nitem2 6g \nitem3 40g \n');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `Type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `designation` varchar(30) NOT NULL,
  `quantity_dachat` int NOT NULL,
  `quantityDispo` int NOT NULL,
  `priceB` float DEFAULT NULL,
  `PriceCC` float DEFAULT NULL,
  `PriceCR` float DEFAULT NULL,
  PRIMARY KEY (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`Type`, `designation`, `quantity_dachat`, `quantityDispo`, `priceB`, `PriceCC`, `PriceCR`) VALUES
('beurre', '30M', 65, 65, 54000, NULL, NULL),
('UTH	', 'dess', 10, 15, 14500, NULL, NULL),
('UTH	', 'Ecremé', 150, 139, 0, 150, 120),
('UTH	', 'Sans Lactosee', 1500, 1400, 0, 120, 130);

-- --------------------------------------------------------

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
CREATE TABLE IF NOT EXISTS `temp` (
  `Type` varchar(20) NOT NULL,
  `Designation` varchar(30) NOT NULL,
  `Quantity` int NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`Designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Email` varchar(30) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Adress` varchar(40) DEFAULT NULL,
  `Password` varchar(25) NOT NULL,
  `Role` varchar(2) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Email`, `First_Name`, `Last_Name`, `Adress`, `Password`, `Role`) VALUES
('00@gmail.com', 'ilia', 'jim', 'fizzy', '123456', 'AV'),
('derbaldontneedemail', 'chemma', 'derbal', '588', 'djidji', 'DG'),
('ilyed@gmail.con', 'ilyes', 'maro', '584kouba', 'qwert', 'CC'),
('ilyes@gmail.com', 'ilyes', 'Maroufi', 'Kouba', '342003', 'CR'),
('naila@gmail.com', 'naiilaa', 'nounou', '474', 'zeke', 'AC'),
('sami@gmail.com', 'sami', 'bloblo', 'babahssen', 'alibaba', 'CC'),
('wfewfw', 'dwedwerf', 'wefwef', 'wefwefe', 'fwefewf', 'CR');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `Com` FOREIGN KEY (`numcom`) REFERENCES `commande` (`numcom`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `journal_commande`
--
ALTER TABLE `journal_commande`
  ADD CONSTRAINT `commandenum` FOREIGN KEY (`numcommande`) REFERENCES `commande` (`numcom`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `email` FOREIGN KEY (`EmailClient`) REFERENCES `user` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fr1` FOREIGN KEY (`designation`) REFERENCES `stock` (`designation`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
