-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`USERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`USERS` (
  `idUSERS` INT NOT NULL AUTO_INCREMENT,
  `LOGIN` VARCHAR(45) NOT NULL,
  `NOME` VARCHAR(100) NOT NULL,
  `EMAIL` VARCHAR(80) NOT NULL,
  `SENHA` VARCHAR(500) NOT NULL,
  `DTA_NASC` DATETIME NOT NULL,
  PRIMARY KEY (`idUSERS`),
  UNIQUE INDEX `LOGIN_UNIQUE` (`LOGIN` ASC) VISIBLE,
  UNIQUE INDEX `EMAIL_UNIQUE` (`EMAIL` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FILTERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FILTERS` (
  `idFILTERS` INT NOT NULL AUTO_INCREMENT,
  `USERS_idUSERS` INT NOT NULL,
  `NOME_FILTRO` VARCHAR(45) NOT NULL,
  `TOKENSYMBOL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFILTERS`, `USERS_idUSERS`),
  INDEX `fk_FILTERS_USERS_idx` (`USERS_idUSERS` ASC) VISIBLE,
  CONSTRAINT `fk_FILTERS_USERS`
    FOREIGN KEY (`USERS_idUSERS`)
    REFERENCES `mydb`.`USERS` (`idUSERS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
