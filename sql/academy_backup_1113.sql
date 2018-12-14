-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2018 at 02:06 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `CourseID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Courses';

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `StudentID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `MiddleInitial` varchar(5) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `BirthDate` date DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COMMENT='Students';

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `MiddleInitial`, `City`, `BirthDate`) VALUES
(1, 'William', 'Clinton', 'J', 'Arkansas', '1948-01-01'),
(2, 'George', 'Bush', '', 'Houston', NULL),
(3, 'Barack', 'Obama', '', 'Chicago', NULL),
(4, 'Jimmy', 'Carter', '', 'Atlanta', NULL),
(5, 'George W', 'Bush', '', 'Houston', NULL),
(6, 'Richard', 'Nixon', '', 'Atlanta', NULL),
(7, 'George', 'Washington', '', 'Washington', NULL),
(8, 'Abraham', 'Lincoln', '', 'Chicago', NULL),
(9, 'Theodore', 'Roosevelt', '', 'Atlanta', NULL),
(10, 'John', 'F Kennedy', '', 'Boston', NULL),
(11, 'John', 'Quincy Adams', '', 'Boston', NULL),
(12, 'Gerald', 'Ford', NULL, 'Atlanta', NULL),
(13, 'Lyndon', 'Johnson', NULL, 'Portland', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
