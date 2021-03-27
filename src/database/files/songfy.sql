-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_songfy
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `db_songfy` ;

-- -----------------------------------------------------
-- Schema db_songfy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_songfy` ;
USE `db_songfy` ;

-- -----------------------------------------------------
-- Table `db_songfy`.`tb_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_songfy`.`tb_user` ;

CREATE TABLE IF NOT EXISTS `db_songfy`.`tb_user` (
  `idtb_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtb_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_songfy`.`tb_album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_songfy`.`tb_album` ;

CREATE TABLE IF NOT EXISTS `db_songfy`.`tb_album` (
  `idtb_album` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cover` VARCHAR(255) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  `tb_user_idtb_user` INT NOT NULL,
  PRIMARY KEY (`idtb_album`),
  INDEX `fk_tb_album_tb_user1_idx` (`tb_user_idtb_user` ASC),
  CONSTRAINT `fk_tb_album_tb_user1`
    FOREIGN KEY (`tb_user_idtb_user`)
    REFERENCES `db_songfy`.`tb_user` (`idtb_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_songfy`.`tb_song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_songfy`.`tb_song` ;

CREATE TABLE IF NOT EXISTS `db_songfy`.`tb_song` (
  `idtb_song` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `duration` INT NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `tb_album_idtb_album` INT NOT NULL,
  PRIMARY KEY (`idtb_song`),
  INDEX `fk_tb_song_tb_album1_idx` (`tb_album_idtb_album` ASC),
  CONSTRAINT `fk_tb_song_tb_album1`
    FOREIGN KEY (`tb_album_idtb_album`)
    REFERENCES `db_songfy`.`tb_album` (`idtb_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_songfy`.`tb_user_has_tb_song`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `db_songfy`.`tb_user_has_tb_song` ;

CREATE TABLE IF NOT EXISTS `db_songfy`.`tb_user_has_tb_song` (
  `tb_user_has_tb_songcol` INT NOT NULL AUTO_INCREMENT,
  `tb_user_idtb_user` INT NOT NULL,
  `tb_song_idtb_song` INT NOT NULL,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `fk_tb_user_has_tb_song_tb_song1_idx` (`tb_song_idtb_song` ASC),
  INDEX `fk_tb_user_has_tb_song_tb_user1_idx` (`tb_user_idtb_user` ASC),
  PRIMARY KEY (`tb_user_has_tb_songcol`),
  CONSTRAINT `fk_tb_user_has_tb_song_tb_user1`
    FOREIGN KEY (`tb_user_idtb_user`)
    REFERENCES `db_songfy`.`tb_user` (`idtb_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_user_has_tb_song_tb_song1`
    FOREIGN KEY (`tb_song_idtb_song`)
    REFERENCES `db_songfy`.`tb_song` (`idtb_song`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
