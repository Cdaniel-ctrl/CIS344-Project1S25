-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Pet_Grooming_Salon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pet_Grooming_Salon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pet_Grooming_Salon` ;
USE `Pet_Grooming_Salon` ;

-- -----------------------------------------------------
-- Table `Pet_Grooming_Salon`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pet_Grooming_Salon`.`Customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `date_created` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pet_Grooming_Salon`.`Pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pet_Grooming_Salon`.`Pets` (
  `pet_id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `pet_name` VARCHAR(45) NOT NULL,
  `pet_species` VARCHAR(45) NOT NULL,
  `breed` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `weight` DECIMAL(5,4) NOT NULL,
  `accessibility` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pet_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Pet_Grooming_Salon`.`Customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pet_Grooming_Salon`.`Grooming Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pet_Grooming_Salon`.`Grooming Service` (
  `service_id` INT NOT NULL AUTO_INCREMENT,
  `service_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `duration` INT NOT NULL,
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pet_Grooming_Salon`.`Appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pet_Grooming_Salon`.`Appointments` (
  `appointment_id` INT NOT NULL AUTO_INCREMENT,
  `pet_id` INT NOT NULL,
  `service_id` INT NOT NULL,
  `appointment_date` DATETIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `pet_id_idx` (`pet_id` ASC) VISIBLE,
  INDEX `service_id_idx` (`service_id` ASC) VISIBLE,
  CONSTRAINT `pet_id`
    FOREIGN KEY (`pet_id`)
    REFERENCES `Pet_Grooming_Salon`.`Pets` (`pet_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `service_id`
    FOREIGN KEY (`service_id`)
    REFERENCES `Pet_Grooming_Salon`.`Grooming Service` (`service_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pet_Grooming_Salon`.`Payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pet_Grooming_Salon`.`Payments` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `appointment_id` INT NOT NULL,
  `payment_date` DATETIME NOT NULL,
  `amount` DECIMAL(5,2) NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `payment_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `appointment_id_idx` (`appointment_id` ASC) VISIBLE,
  CONSTRAINT `appointment_id`
    FOREIGN KEY (`appointment_id`)
    REFERENCES `Pet_Grooming_Salon`.`Appointments` (`appointment_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
