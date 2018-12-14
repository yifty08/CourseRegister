-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 21, 2018 at 02:09 AM
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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  `StartDate` date NOT NULL,
  `Time` time(6) DEFAULT NULL,
  `Dates` varchar(100) NOT NULL,
  `instructorID` int(25) NOT NULL,
  `CourseID` int(10) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassID`, `StartDate`, `Time`, `Dates`, `instructorID`, `CourseID`) VALUES
(1, '2018-11-01', '17:00:00.000000', '11/1, 11/8, 11/15, 11/22', 1, 2),
(2, '2018-11-15', NULL, '12/1, 12/3, 12/8, 12/11', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `CourseID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Courses';

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `Name`, `Title`, `Description`) VALUES
(1, 'WD01', 'Web Design 1', 'Web Design I (HTML and CSS)'),
(2, 'WD02', 'Web Design 2', 'Web Design 2 (Javascript)'),
(3, 'WV01', 'Web Development 1', 'Web Development I (PHP)');

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
CREATE TABLE IF NOT EXISTS `instructor` (
  `InstructorID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Availablity` varchar(100) NOT NULL,
  PRIMARY KEY (`InstructorID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`InstructorID`, `FirstName`, `LastName`, `email`, `Phone`, `Availablity`) VALUES
(1, 'Bruce', 'Wayne', 'batman@gmail.com', NULL, 'M 6-10, W 6-10'),
(2, 'Clark', 'Kent', 'superman@gmail.com', NULL, 'T 6-10, H 6-10'),
(3, 'Tony', 'Stark', 'ironman@gmail.com', NULL, 'F 6-10, S 6-10'),
(4, 'Peter', 'Parker', 'spidey@gmail.com', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `RegID` int(50) NOT NULL,
  `CourseId` int(50) NOT NULL,
  `RegistrationDate` date NOT NULL,
  `payment` tinyint(1) NOT NULL,
  PRIMARY KEY (`RegID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Students';

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `MiddleInitial`, `City`, `BirthDate`) VALUES
(1, 'William', 'Clinton', 'J', 'Arkansas', '1948-01-01'),
(2, 'George', 'Bush', '', 'Houston', NULL),
(3, 'Barack', 'Obama', '', 'Chicago', NULL),
(4, 'Jimmy', 'Carter', '', 'Atlanta', NULL),
(5, 'George W', 'Bush', '', 'Houston', NULL),
(14, 'Richard', 'Nixon', NULL, 'Atlanta', '1920-01-01'),
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
