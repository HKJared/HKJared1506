-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projectII
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projectII
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projectII` DEFAULT CHARACTER SET utf8 ;
USE `projectII` ;

-- -----------------------------------------------------
-- Table `projectII`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectII`.`User` (
  `idUser` INT NOT NULL,
  `account` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `fullname` VARCHAR(45) NULL,
  `created_at` VARCHAR(45) NULL,
  `Usercol` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projectII`.`Test`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectII`.`Test` (
  `idTest` INT NOT NULL,
  `detail` TEXT NULL,
  PRIMARY KEY (`idTest`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projectII`.`Code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectII`.`Code` (
  `idCode` INT NOT NULL,
  `source` TEXT NULL,
  `idUser` INT NULL,
  `idTest` INT NULL,
  `Point` INT NULL,
  `created_at` VARCHAR(45) NULL,
  PRIMARY KEY (`idCode`),
  INDEX `2_idx` (`idUser` ASC) VISIBLE,
  INDEX `3_idx` (`idTest` ASC) VISIBLE,
  CONSTRAINT `2`
    FOREIGN KEY (`idUser`)
    REFERENCES `projectII`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `3`
    FOREIGN KEY (`idTest`)
    REFERENCES `projectII`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projectII`.`Test_Case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectII`.`Test_Case` (
  `idTest_Case` INT NOT NULL,
  `idTest` INT NULL,
  `input` TEXT NULL,
  `output` TEXT NULL,
  PRIMARY KEY (`idTest_Case`),
  INDEX `1_idx` (`idTest` ASC) VISIBLE,
  CONSTRAINT `1`
    FOREIGN KEY (`idTest`)
    REFERENCES `projectII`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
