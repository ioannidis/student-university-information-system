-- -----------------------------------------------------
-- Schema javapart2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `javapart2` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `javapart2` ;

-- -----------------------------------------------------
-- Table `javapart2`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javapart2`.`roles` ;

CREATE TABLE IF NOT EXISTS `javapart2`.`roles` (
  `id` VARCHAR(10) NOT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `javapart2`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javapart2`.`users` ;

CREATE TABLE IF NOT EXISTS `javapart2`.`users` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` BIGINT(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `role_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`username`, `role_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_users_roles_idx` (`role_id` ASC),
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `javapart2`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `javapart2`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javapart2`.`courses` ;

CREATE TABLE IF NOT EXISTS `javapart2`.`courses` (
  `id` VARCHAR(10) NOT NULL,
  `title` VARCHAR(45) NULL,
  `ects` SMALLINT NOT NULL,
  `teaching_hours` SMALLINT NOT NULL,
  `instructor_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `instructor_username`),
  INDEX `fk_courses_users1_idx` (`instructor_username` ASC),
  CONSTRAINT `fk_courses_users1`
    FOREIGN KEY (`instructor_username`)
    REFERENCES `javapart2`.`users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `javapart2`.`roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `javapart2`;
INSERT INTO `javapart2`.`roles` (`id`, `title`) VALUES ('admin', 'Administrator');
INSERT INTO `javapart2`.`roles` (`id`, `title`) VALUES ('instructor', 'Instructor');
INSERT INTO `javapart2`.`roles` (`id`, `title`) VALUES ('secretary', 'Secretary');
INSERT INTO `javapart2`.`roles` (`id`, `title`) VALUES ('student', 'Student');

COMMIT;


-- -----------------------------------------------------
-- Data for table `javapart2`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `javapart2`;
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`) VALUES ('tony_stark', '123456', 'Tony', 'Stark', 6942233668, 'tony_stark@gmail.com', 'instructor');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`) VALUES ('nat_romanoff', '123456', 'Natasha', 'Romanoff', 6971269874, 'nat_rom@gmail.com', 'secretary');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`) VALUES ('steve_rogers', '123456', 'Steve', 'Rogers', 6993692581, 'steve_rog@outlook.com', 'instructor');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`) VALUES ('wanda_max', '123456', 'Wanda', 'Maximoff', 6936549873, 'wanda18@hotmail.com', 'student');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`) VALUES ('bruce_banner', '123456', 'Bruce', 'Banner', 6971234567, 'bbanner@yahoo.com', 'instructor');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`) VALUES ('thor_odinson', '123456', 'Thor', 'Odinson', 6949876543, 'thor@outlook.com', 'instructor');

COMMIT;


-- -----------------------------------------------------
-- Data for table `javapart2`.`courses`
-- -----------------------------------------------------
START TRANSACTION;
USE `javapart2`;
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`) VALUES ('java_oop', 'Java', 5, 4, 'tony_stark');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`) VALUES ('calc_1', 'Calculus 1', 5, 4, 'steve_rogers');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`) VALUES ('cpp', 'C++', 5, 4, 'bruce_banner');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`) VALUES ('algo', 'Algorithms', 5, 4, 'thor_odinson');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`) VALUES ('java_web', 'Java Servlets', 5, 4, 'tony_stark');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`) VALUES ('calc_2', 'Calculus 2', 5, 4, 'steve_rogers');

COMMIT;