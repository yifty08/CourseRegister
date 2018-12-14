CREATE TABLE IF NOT EXISTS `academy`.`classes` (
`ClassID` INT NOT NULL ,
`Day` DATE NOT NULL ,
 `Time` TIME(6) NOT NULL ,
  `Dates` VARCHAR(6) NOT NULL ,
   `instractorID` INT(25) NOT NULL ,
    `CourseID` INT(10) NOT NULL ,
     PRIMARY KEY (`ClassID`)) ENGINE = MyISAM;
