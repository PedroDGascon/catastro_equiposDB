CREATE SCHEMA IF NOT EXISTS `catastro` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema catastro 
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema catastro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `catastro`  DEFAULT CHARACTER SET utf8 ;
USE `catastro` ;

-- -----------------------------------------------------
-- Table `catastro`.`disk_type`
-- -----------------------------------------------------

-- DROP TABLE disk_type;

CREATE TABLE IF NOT EXISTS `catastro`.`disk_type` (
  `id` INT NOT NULL,
  `ssd_capacity` INT(4) NOT NULL,
  `hdd_capacity` INT(4) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`office_tools`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`office_tools` (
  `id` INT NOT NULL,
  `office` CHAR(2) NULL,
  `licence` CHAR(2) NULL,
  `principal_account` CHAR(2) NULL,
  `open_office` CHAR(2) NULL,
  `slack` CHAR(2) NULL,
  `adobe_reader` CHAR(2) NULL,
  `web_browser` CHAR(2) NULL,
  `anydesk` CHAR(2) NULL,
  `os_key` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`apps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`apps` (
  `id` INT NOT NULL,
  `wacom` CHAR(2) NULL,
  `sovos` CHAR(2) NULL,
  `bupa` CHAR(2) NULL,
  `toc` CHAR(2) NULL,
  `rx_app` CHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`state_of_preparation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`state_of_preparation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prepared_by` VARCHAR(45) NULL,
  `observation` VARCHAR(45) NULL,
  `document` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`asset_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`asset_description` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `operative_system` VARCHAR(45) NULL,
  `bios` VARCHAR(45) NULL,
  `processor` VARCHAR(45) NULL,
  `ghz` VARCHAR(45) NULL,
  `inches` VARCHAR(45) NULL,
  `ram` VARCHAR(45) NULL,
  `observation` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`it_asset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`it_asset` (
  `id` INT NOT NULL,
  `notebook` CHAR(2) NULL,
  `note_brand` VARCHAR(20) NULL,
  `note_model` VARCHAR(20) NULL,
  `tablet` CHAR(2) NULL,
  `tablet_brand` VARCHAR(20) NULL,
  `tablet_model` VARCHAR(20) NULL,
  `serial_number` VARCHAR(45) NULL,
  `disk_type_id` INT NOT NULL,
  `office_tools_id` INT NOT NULL,
  `apps_id` INT NOT NULL,
  `state_of_preparation_id` INT NOT NULL,
  `asset_description_id` INT NOT NULL,
  PRIMARY KEY (`id`, `disk_type_id`, `office_tools_id`, `apps_id`, `state_of_preparation_id`, `asset_description_id`),
  INDEX `fk_it_asset_disk_type1_idx` (`disk_type_id` ASC) VISIBLE,
  INDEX `fk_it_asset_office_tools1_idx` (`office_tools_id` ASC) VISIBLE,
  INDEX `fk_it_asset_branch_apps1_idx` (`apps_id` ASC) VISIBLE,
  INDEX `fk_it_asset_state_of_preparation1_idx` (`state_of_preparation_id` ASC) VISIBLE,
  INDEX `fk_it_asset_asset_description1_idx` (`asset_description_id` ASC) VISIBLE,
  CONSTRAINT `fk_it_asset_disk_type1`
    FOREIGN KEY (`disk_type_id`)
    REFERENCES `catastro`.`disk_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_it_asset_office_tools1`
    FOREIGN KEY (`office_tools_id`)
    REFERENCES `catastro`.`office_tools` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_it_asset_branch_apps1`
    FOREIGN KEY (`apps_id`)
    REFERENCES `catastro`.`apps` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_it_asset_state_of_preparation1`
    FOREIGN KEY (`state_of_preparation_id`)
    REFERENCES `catastro`.`state_of_preparation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_it_asset_asset_description1`
    FOREIGN KEY (`asset_description_id`)
    REFERENCES `catastro`.`asset_description` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`user_mail_tools`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`user_mail_tools` (
  `id` INT NOT NULL,
  `slack_email` VARCHAR(45) NULL,
  `sage_mail` VARCHAR(45) NULL,
  `gmail_user` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`workers_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`workers_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `job_description` VARCHAR(20) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`technologic_peripherals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`technologic_peripherals` (
  `id` INT NOT NULL,
  `mouse` CHAR(2) NULL,
  `keyboard` CHAR(2) NULL,
  `headphones` CHAR(2) NULL,
  `monitor` CHAR(2) NULL,
  `extra_monitor` CHAR(2) NULL,
  `notebook_lifter` CHAR(2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `catastro`.`branches`
-- -----------------------------------------------------
-- DROP TABLE branches;

/*
CREATE TABLE IF NOT EXISTS `catastro`.`branches` (
  `id` INT NOT NULL,
  `branch` VARCHAR(45) NULL,
  `it_asset_id` INT NOT NULL,
  `it_asset_disk_type_id` INT NOT NULL,
  `it_asset_office_tools_id` INT NOT NULL,
  `it_asset_apps_id` INT NOT NULL,
  `it_asset_state_of_preparation_id` INT NOT NULL,
  `it_asset_asset_description_id` INT NOT NULL,
  `workers_details_id` INT NOT NULL,
  PRIMARY KEY (`id`, `it_asset_id`, `it_asset_disk_type_id`, `it_asset_office_tools_id`, `it_asset_apps_id`, `it_asset_state_of_preparation_id`, `it_asset_asset_description_id`, `workers_details_id`),
  INDEX `fk_branches_it_asset1_idx` (`it_asset_id` ASC, `it_asset_disk_type_id` ASC, `it_asset_office_tools_id` ASC, `it_asset_apps_id` ASC, `it_asset_state_of_preparation_id` ASC, `it_asset_asset_description_id` ASC) VISIBLE,
  INDEX `fk_branches_workers_details1_idx` (`workers_details_id` ASC) VISIBLE,
  CONSTRAINT `fk_branches_it_asset1`
    FOREIGN KEY (`it_asset_id` , `it_asset_disk_type_id` , `it_asset_office_tools_id` , `it_asset_apps_id` , `it_asset_state_of_preparation_id` , `it_asset_asset_description_id`)
    REFERENCES `catastro`.`it_asset` (`id` , `disk_type_id` , `office_tools_id` , `apps_id` , `state_of_preparation_id` , `asset_description_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_branches_workers_details1`
    FOREIGN KEY (`workers_details_id`)
    REFERENCES `catastro`.`workers_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
*/

-- -----------------------------------------------------
-- Table `catastro`.`users`
-- -----------------------------------------------------
/*
CREATE TABLE IF NOT EXISTS `catastro`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `document_type` CHAR(10) NOT NULL,
  `document_number` VARCHAR(20) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NULL,
  `it_asset_id` INT NOT NULL,
  `user_mail_tools_id` INT NOT NULL,
  `workers_details_id` INT NOT NULL,
  `technologic_peripherals_id` INT NOT NULL,
  `branches_id` INT NOT NULL,
  PRIMARY KEY (`id`, `it_asset_id`, `user_mail_tools_id`, `workers_details_id`, `technologic_peripherals_id`, `branches_id`),
  INDEX `fk_users_it_asset_idx` (`it_asset_id` ASC) VISIBLE,
  INDEX `fk_users_user_mail_tools1_idx` (`user_mail_tools_id` ASC) VISIBLE,
  INDEX `fk_users_workers_details1_idx` (`workers_details_id` ASC) VISIBLE,
  INDEX `fk_users_technologic_peripherals1_idx` (`technologic_peripherals_id` ASC) VISIBLE,
  INDEX `fk_users_branches1_idx` (`branches_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_it_asset`
    FOREIGN KEY (`it_asset_id`)
    REFERENCES `catastro`.`it_asset` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_user_mail_tools1`
    FOREIGN KEY (`user_mail_tools_id`)
    REFERENCES `catastro`.`user_mail_tools` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_workers_details1`
    FOREIGN KEY (`workers_details_id`)
    REFERENCES `catastro`.`workers_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_technologic_peripherals1`
    FOREIGN KEY (`technologic_peripherals_id`)
    REFERENCES `catastro`.`technologic_peripherals` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_branches1`
    FOREIGN KEY (`branches_id`)
    REFERENCES `catastro`.`branches` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `catastro`.`timestamps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `users_id` INT NOT NULL,
  `users_it_asset_id` INT NOT NULL,
  `users_user_mail_tools_id` INT NOT NULL,
  `users_workers_details_id` INT NOT NULL,
  `users_technologic_peripherals_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `users_it_asset_id`, `users_user_mail_tools_id`, `users_workers_details_id`, `users_technologic_peripherals_id`),
  CONSTRAINT `fk_timestamps_users`
    FOREIGN KEY (`users_id` , `users_it_asset_id` , `users_user_mail_tools_id` , `users_workers_details_id` , `users_technologic_peripherals_id`)
    REFERENCES `catastro`.`users` (`id` , `it_asset_id` , `user_mail_tools_id` , `workers_details_id` , `technologic_peripherals_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `catastro`.`timestamps_preparation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `catastro`.`timestamps_preparation` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL,
  `state_of_preparation_id` INT NOT NULL,
  PRIMARY KEY (`state_of_preparation_id`),
  CONSTRAINT `fk_timestamps_preparation_state_of_preparation1`
    FOREIGN KEY (`state_of_preparation_id`)
    REFERENCES `catastro`.`state_of_preparation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
*/
USE `catastro` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
