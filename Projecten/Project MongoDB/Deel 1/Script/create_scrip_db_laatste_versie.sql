-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Nutrient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nutrient` (
  `IdNutrient` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(15) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`IdNutrient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product` (
  `IdProduct` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Barcode` INT NULL,
  `CalPerGram` DECIMAL(21,18) NULL,
  PRIMARY KEY (`IdProduct`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProductNutrient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProductNutrient` (
  `IdProductNutrient` INT NOT NULL AUTO_INCREMENT,
  `PercInProduct` DECIMAL(22,19) NULL,
  `Nutrient_IdNutrient` INT NOT NULL,
  `Product_IdProduct` INT NOT NULL,
  PRIMARY KEY (`IdProductNutrient`),
  INDEX `fk_ProductNutrient_Nutrient_idx` (`Nutrient_IdNutrient` ASC),
  INDEX `fk_ProductNutrient_Product1_idx` (`Product_IdProduct` ASC),
  CONSTRAINT `fk_ProductNutrient_Nutrient`
    FOREIGN KEY (`Nutrient_IdNutrient`)
    REFERENCES `mydb`.`Nutrient` (`IdNutrient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductNutrient_Product1`
    FOREIGN KEY (`Product_IdProduct`)
    REFERENCES `mydb`.`Product` (`IdProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `IdUser` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `EmailAdres` VARCHAR(100) NULL,
  `WeightGoal` DECIMAL(5,2) NULL,
  `Country` VARCHAR(40) NULL,
  PRIMARY KEY (`IdUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Event` (
  `IdEvent` INT NOT NULL AUTO_INCREMENT,
  `Timestamp` DATETIME NULL,
  `Comment` VARCHAR(45) NULL,
  `User_IdUser` INT NOT NULL,
  PRIMARY KEY (`IdEvent`),
  INDEX `fk_Event_User1_idx` (`User_IdUser` ASC),
  CONSTRAINT `fk_Event_User1`
    FOREIGN KEY (`User_IdUser`)
    REFERENCES `mydb`.`User` (`IdUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProductIntake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProductIntake` (
  `IdProductIntake` INT NOT NULL AUTO_INCREMENT,
  `AmountGrams` DECIMAL(6,2) NULL,
  `Product_IdProduct` INT NOT NULL,
  `Event_IdEvent` INT NOT NULL,
  PRIMARY KEY (`IdProductIntake`),
  INDEX `fk_ProductIntake_Product1_idx` (`Product_IdProduct` ASC),
  INDEX `fk_ProductIntake_Event1_idx` (`Event_IdEvent` ASC),
  CONSTRAINT `fk_ProductIntake_Product1`
    FOREIGN KEY (`Product_IdProduct`)
    REFERENCES `mydb`.`Product` (`IdProduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProductIntake_Event1`
    FOREIGN KEY (`Event_IdEvent`)
    REFERENCES `mydb`.`Event` (`IdEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ActivityType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ActivityType` (
  `IdActivityType` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `CalPerSecond` DECIMAL(10,9) NULL,
  PRIMARY KEY (`IdActivityType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Activity` (
  `IdActivity` INT NOT NULL AUTO_INCREMENT,
  `Duration` TIME NULL,
  `ActivityType_IdActivityType` INT NOT NULL,
  `Event_IdEvent` INT NOT NULL,
  PRIMARY KEY (`IdActivity`),
  INDEX `fk_Activity_ActivityType1_idx` (`ActivityType_IdActivityType` ASC),
  INDEX `fk_Activity_Event1_idx` (`Event_IdEvent` ASC),
  CONSTRAINT `fk_Activity_ActivityType1`
    FOREIGN KEY (`ActivityType_IdActivityType`)
    REFERENCES `mydb`.`ActivityType` (`IdActivityType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Activity_Event1`
    FOREIGN KEY (`Event_IdEvent`)
    REFERENCES `mydb`.`Event` (`IdEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Weighing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Weighing` (
  `IdWeighing` INT NOT NULL AUTO_INCREMENT,
  `AmountKilograms` DECIMAL(6,3) NULL,
  `Event_IdEvent` INT NOT NULL,
  PRIMARY KEY (`IdWeighing`),
  INDEX `fk_Weighing_Event1_idx` (`Event_IdEvent` ASC),
  CONSTRAINT `fk_Weighing_Event1`
    FOREIGN KEY (`Event_IdEvent`)
    REFERENCES `mydb`.`Event` (`IdEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


create index user_name on `mydb`.`user` (FirstName, LastName); 
create index event_time on `mydb`.`event` (Timestamp); 
create index product_bar on `mydb`.`product` (Barcode);


LOAD DATA LOCAL INFILE '/temp/gebruikers.csv'
INTO TABLE user FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/temp/Mondelez.csv'
INTO TABLE product FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 0 LINES;


LOAD DATA LOCAL INFILE '/temp/Mars.csv'
INTO TABLE product FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 0 LINES;

LOAD DATA LOCAL INFILE '/temp/UnileverProduct.csv'
INTO TABLE product FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/temp/Nutrient.csv'
INTO TABLE nutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 0 LINES;

LOAD DATA LOCAL INFILE '/temp/ActivityType.csv'
INTO TABLE activitytype FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/temp/event.csv'
INTO TABLE event FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/temp/productIntake.csv'
INTO TABLE productintake FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/temp/activity.csv'
INTO TABLE activity FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/temp/weighing.csv'
INTO TABLE weighing FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/temp/Mondelez Product Nutrient.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 0 LINES;

LOAD DATA LOCAL INFILE '/temp/Mars_Nutrients.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 0 LINES;

LOAD DATA LOCAL INFILE '/temp/UnileverProductNutrient1.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/temp/UnileverProductNutrient2.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/temp/UnileverProductNutrient3.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/temp/UnileverProductNutrient4.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/temp/UnileverProductNutrient5.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/temp/UnileverProductNutrient6.csv'
INTO TABLE productnutrient FIELDS TERMINATED BY ';' LINES TERMINATED BY '\n' IGNORE 1 LINES;


