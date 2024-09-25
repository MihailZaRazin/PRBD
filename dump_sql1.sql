-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema univer
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema univer
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `univer` DEFAULT CHARACTER SET utf8 ;
USE `univer` ;

-- -----------------------------------------------------
-- Table `univer`.`director`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`director` (
  `iddir` INT NOT NULL,
  `dirname` VARCHAR(25) NOT NULL,
  `podr` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`iddir`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`group` (
  `#gr` CHAR(10) NOT NULL,
  `code` CHAR(8) NOT NULL,
  `napr` MEDIUMTEXT NOT NULL,
  `prof` MEDIUMTEXT NULL,
  PRIMARY KEY (`#gr`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`student` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `studname` VARCHAR(25) NOT NULL,
  `director_iddir` INT NOT NULL,
  `group_#gr` CHAR(10) NOT NULL,
  PRIMARY KEY (`idstudent`),
  INDEX `fk_student_director_idx` (`director_iddir` ASC) VISIBLE,
  INDEX `fk_student_group1_idx` (`group_#gr` ASC) VISIBLE,
  CONSTRAINT `fk_student_director`
    FOREIGN KEY (`director_iddir`)
    REFERENCES `univer`.`director` (`iddir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `univer`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`post` (
  `postname` VARCHAR(21) NOT NULL,
  PRIMARY KEY (`postname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`emploee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`emploee` (
  `#emp` INT NOT NULL,
  `empname` VARCHAR(25) NOT NULL,
  `director_iddir` INT NOT NULL,
  `post_postname1` VARCHAR(21) NOT NULL,
  PRIMARY KEY (`#emp`),
  INDEX `fk_emploee_director1_idx` (`director_iddir` ASC) VISIBLE,
  INDEX `fk_emploee_post2_idx` (`post_postname1` ASC) VISIBLE,
  CONSTRAINT `fk_emploee_director1`
    FOREIGN KEY (`director_iddir`)
    REFERENCES `univer`.`director` (`iddir`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emploee_post2`
    FOREIGN KEY (`post_postname1`)
    REFERENCES `univer`.`post` (`postname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`lessontype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`lessontype` (
  `lessonname` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`lessonname`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`subject` (
  `#subj` INT NOT NULL AUTO_INCREMENT,
  `subjname` VARCHAR(45) NOT NULL,
  `subjinfo` MEDIUMTEXT NULL,
  PRIMARY KEY (`#subj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`student_has_emploee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`student_has_emploee` (
  `student_idstudent` INT NOT NULL,
  `emploee_#emp` INT NOT NULL,
  `subject_#subj` INT NOT NULL,
  `date` DATE NOT NULL,
  `marks` VARCHAR(45) NULL,
  PRIMARY KEY (`student_idstudent`, `emploee_#emp`, `subject_#subj`, `date`),
  INDEX `fk_student_has_emploee_emploee1_idx` (`emploee_#emp` ASC) VISIBLE,
  INDEX `fk_student_has_emploee_student1_idx` (`student_idstudent` ASC) VISIBLE,
  INDEX `fk_student_has_emploee_subject1_idx` (`subject_#subj` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_emploee_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `univer`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_emploee_emploee1`
    FOREIGN KEY (`emploee_#emp`)
    REFERENCES `univer`.`emploee` (`#emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_emploee_subject1`
    FOREIGN KEY (`subject_#subj`)
    REFERENCES `univer`.`subject` (`#subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`subject_has_emploee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`subject_has_emploee` (
  `subject_#subj` INT NOT NULL,
  `emploee_#emp` INT NOT NULL,
  PRIMARY KEY (`subject_#subj`, `emploee_#emp`),
  INDEX `fk_subject_has_emploee_emploee1_idx` (`emploee_#emp` ASC) VISIBLE,
  INDEX `fk_subject_has_emploee_subject1_idx` (`subject_#subj` ASC) VISIBLE,
  CONSTRAINT `fk_subject_has_emploee_subject1`
    FOREIGN KEY (`subject_#subj`)
    REFERENCES `univer`.`subject` (`#subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_has_emploee_emploee1`
    FOREIGN KEY (`emploee_#emp`)
    REFERENCES `univer`.`emploee` (`#emp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `univer`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `univer`.`lessons` (
  `#week` VARCHAR(45) NOT NULL,
  `day` VARCHAR(3) NOT NULL,
  `group_#gr` CHAR(10) NOT NULL,
  `subject_#subj` INT NOT NULL,
  `lessontype_lessonname` VARCHAR(12) NOT NULL,
  `#room` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`#week`, `day`, `group_#gr`, `subject_#subj`, `lessontype_lessonname`),
  INDEX `fk_group_has_subject_subject1_idx` (`subject_#subj` ASC) VISIBLE,
  INDEX `fk_group_has_subject_group1_idx` (`group_#gr` ASC) VISIBLE,
  INDEX `fk_group_has_subject_lessontype1_idx` (`lessontype_lessonname` ASC) VISIBLE,
  CONSTRAINT `fk_group_has_subject_group1`
    FOREIGN KEY (`group_#gr`)
    REFERENCES `univer`.`group` (`#gr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_subject1`
    FOREIGN KEY (`subject_#subj`)
    REFERENCES `univer`.`subject` (`#subj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_group_has_subject_lessontype1`
    FOREIGN KEY (`lessontype_lessonname`)
    REFERENCES `univer`.`lessontype` (`lessonname`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
