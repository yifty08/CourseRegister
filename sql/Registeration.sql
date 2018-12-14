CREATE TABLE IF NOT EXISTS `academy`.`Registration`
( `RegID` INT(50) NOT NULL ,
`CourseId` INT(50) NOT NULL ,
`RegistrationDate` DATE NOT NULL ,
`payment` BOOLEAN NOT NULL ,
PRIMARY KEY (`RegID`)) ENGINE = MyISAM;
