
 CREATE TABLE IF NOT EXISTS
 `academy`.`instructor` (
 `FirstName` VARCHAR(50) NOT NULL ,
 `LastName` VARCHAR(50) NOT NULL ,
 `email` VARCHAR(100) NOT NULL ,
 `Phone` INT(50) NOT NULL ,
 `Availablity` DATETIME(6) NOT NULL ,
 PRIMARY KEY (`LastName`)) ENGINE = MyISAM;

INSERT INTO `instructor` (`FirstName`, `LastName`, `email`, `Phone`, `Availablity`)
VALUES ('John', 'Smith', 'John.Smith@nvcc.edu', '571458818', '2018-11-20 07:00:00.000000')
