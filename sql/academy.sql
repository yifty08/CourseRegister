-- DROP DATABASE `academy`;

CREATE DATABASE academy;

USE academy;

CREATE TABLE IF NOT EXISTS `students` (
  `StudentID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Students';

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `City`) 
VALUES ('1', 'Bill', 'Clinton', 'Arkansas'); -- insert entry
INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `City`) 
VALUES ('2', 'George', 'Bush', 'Houston');
INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `City`) 
VALUES ('3', 'Barack', 'Obama', 'Chicago');
INSERT INTO `students` VALUES ('4', 'Jimmy', 'Carter', 'Atlanta');
INSERT INTO `students` VALUES ('5', 'George W', 'Bush', 'Houston');
INSERT INTO `students` VALUES ('6', 'Richard', 'Nixon', 'Atlanta');
INSERT INTO `students` VALUES ('7', 'George', 'Washington', 'Washington');
INSERT INTO `students` VALUES ('8', 'Abraham', 'Lincoln', 'Chicago');
INSERT INTO `students` VALUES ('9', 'Theodore', 'Roosevelt', 'Atlanta');
INSERT INTO `students` VALUES ('10', 'John', 'F Kennedy', 'Boston');
INSERT INTO `students` VALUES ('11', 'John', 'Quincy Adams', 'Boston');
INSERT INTO `students` (`FirstName`, `LastName`, `City`) 
VALUES ('Gerald', 'Ford', 'Atlanta');
INSERT INTO `students` (`FirstName`, `LastName`, `City`) 
VALUES ('Lyndon', 'Johnson', 'Portland');

ALTER TABLE `students` ADD `MiddleInitial` VARCHAR(5) NULL AFTER `LastName`;
ALTER TABLE `students` ADD `BirthYear` DATE NULL DEFAULT NULL AFTER `City`;
ALTER TABLE `students` CHANGE `BirthYear` `BirthDate` DATE NULL DEFAULT NULL;
ALTER TABLE `students` CHANGE `MiddleInitial` `MiddleInitial` VARCHAR(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL;
ALTER TABLE `students` CHANGE `StudentID` `StudentID` INT(11) NOT NULL AUTO_INCREMENT;

UPDATE `students` SET `MiddleInitial` = 'J', `BirthDate` = '1948-01-01', 'FirstName'='William'
WHERE `students`.`StudentID` = 1

INSERT INTO `students` (`StudentID`, `FirstName`, `LastName`, `MiddleInitial`, `City`, `BirthDate`) 
VALUES (NULL, 'Richard', 'Nixon', NULL, 'Atlanta', '1920-01-01');

CREATE TABLE IF NOT EXISTS `courses` (
  `CourseID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Courses';

-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2018 at 01:56 AM
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Students';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

select C.ClassID, I.FirstName, I.LastName, R.Title, R.Description, C.StartDate
from classes as C,
courses as R, instructor as I
where C.instructorID=I.InstructorID and R.CourseID=C.CourseID