-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema javapart2
-- -----------------------------------------------------

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
-- Table `javapart2`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javapart2`.`departments` ;

CREATE TABLE IF NOT EXISTS `javapart2`.`departments` (
  `id` VARCHAR(5) NOT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `javapart2`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javapart2`.`users` ;

CREATE TABLE IF NOT EXISTS `javapart2`.`users` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` BIGINT(10) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `role_id` VARCHAR(10) NOT NULL,
  `department_id` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_users_roles_idx` (`role_id` ASC),
  INDEX `fk_users_departments_idx` (`department_id` ASC),
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `javapart2`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_departments`
    FOREIGN KEY (`department_id`)
    REFERENCES `javapart2`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `javapart2`.`courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javapart2`.`courses` ;

CREATE TABLE IF NOT EXISTS `javapart2`.`courses` (
  `id` VARCHAR(10) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `ects` SMALLINT NOT NULL,
  `teaching_hours` SMALLINT NOT NULL,
  `instructor_username` VARCHAR(45) NOT NULL,
  `semester` SMALLINT NOT NULL,
  `department_id` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_courses_users1_idx` (`instructor_username` ASC),
  INDEX `fk_courses_departments_idx` (`department_id` ASC),
  CONSTRAINT `fk_courses_users1`
    FOREIGN KEY (`instructor_username`)
    REFERENCES `javapart2`.`users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_departments`
    FOREIGN KEY (`department_id`)
    REFERENCES `javapart2`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `javapart2`.`grades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `javapart2`.`grades` ;

CREATE TABLE IF NOT EXISTS `javapart2`.`grades` (
  `student_id` VARCHAR(45) NOT NULL,
  `course_id` VARCHAR(10) NOT NULL,
  `grade` INT(2) UNSIGNED NULL,
  PRIMARY KEY (`student_id`, `course_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `student_id`
    FOREIGN KEY (`student_id`)
    REFERENCES `javapart2`.`users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `javapart2`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
-- Data for table `javapart2`.`departments`
-- -----------------------------------------------------
START TRANSACTION;
USE `javapart2`;
INSERT INTO `javapart2`.`departments` (`id`, `title`) VALUES ('comsc', 'Computer Science');
INSERT INTO `javapart2`.`departments` (`id`, `title`) VALUES ('ecnmc', 'Ecomomics');

COMMIT;


-- -----------------------------------------------------
-- Data for table `javapart2`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `javapart2`;
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('tony_stark', '6UVjGpMQSB+kJztXblrABx1/j+ZWlXE/8HcmRsTz6Rd1vTE/u3KAVPp7kOR1gxVq', 'Tony', 'Stark', 6942233668, 'tony_stark@gmail.com', 'instructor', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('nat_romanoff', '9BXRqnNNVjkEh0BKqmap6QJwQ6Vovot/rkd/lB7QhjK+zmt+ec1WPjQb0fOZ8Vk5', 'Natasha', 'Romanoff', 6971269874, 'nat_rom@gmail.com', 'secretary', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('steve_rogers', 'sm36qdYJJkzSgpZaxPPHqNaFsKzDbKjxUeJVpfwtf5yWnEEBSjI2HJBLbrmL6jfO', 'Steve', 'Rogers', 6993692581, 'steve_rog@outlook.com', 'instructor', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('wanda_max', 'afZHwmR2LYmRxG3FKRaoi58kFcCkX9xe44fNTbSYR/Gu7b8m5zzmwnn0ouAHDzwT', 'Wanda', 'Maximoff', 6936549873, 'wanda18@hotmail.com', 'student', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('bruce_banner', 'Qu2vLcZy3x1Rsi4dGZnuWk/IiKsJgxfjZU0rGIlrtnE8ExH0vTcmx1xvjVxUOEHk', 'Bruce', 'Banner', 6971234567, 'bbanner@yahoo.com', 'instructor', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('thor_odinson', 'IlWgnWednQrZKzIoL4tRagaeNutBpInXF6gLlYTzcwJQoQsOCJROxeD/Mv6B8rSZ', 'Thor', 'Odinson', 6949876543, 'thor@outlook.com', 'instructor', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('step_strange', 'Ct91XaxcxFP7ANEMAns6vXjTO4KUAGvQ/xJ+t2GAHX8zWbZGBMZizm88QZQ6jd7t', 'Stephen', 'Strange', 6985214782, 'dr_strange', 'instructor', 'ecnmc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('janet_vd', '4q8pISVUV3lpYUzK+kDbvBh9HYoTZ5/RczNa77Ph0mbtnrz7eDEsihwgNQL7U1LP', 'Janet', 'van Dyne', 6932145682, 'jvd@outlook.com', 'student', 'ecnmc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('dante_mathis', '5//OIBuYif6e7nq8O29tuRAQgT+Zr4zbjIjXHO9XlCQx8XRVFvvESIZuEDmuqe4N', 'Dante', 'Mathis', 6942514367, 'dantemathis@gmail.com', 'student', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('donald_word', 'QY+oS1Wz6K+FCM9rd6bacLNVUMklyuFXMTI816OdLtpwDx0BRh5Cmk9Gm7ubsVw1', 'Donald', 'Word', 6971235874, 'donaldword@gmail.com', 'student', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('paul_mann', 'bO8Dx/vBMnCfsd4ozwqfvmmJKWKhZl0eMLYKHp5PKsX9qEUX1Q/t3SlF1roAokFB', 'Paul', 'Mann', 6936589741, 'paulmann@gmail.com', 'student', 'comsc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('salvador_nix', 'PyggtyGyQkTrs1T4o/mH9/4XCdRCWxPMuXYUCzVeYvuGtkjadHzA+rJmv0W9Jf6f', 'Salvador', 'Nix', 6942123654, 'salvadornix@outlookl.com', 'student', 'ecnmc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('tommy_scot', 'r+19U0mcBwI0L8bvI4B2QsYymjHOGigEWNVMm/NMkSqA3GFMODQDKA4NAz29UKTu', 'Tommy', 'Scott', 6986532356, 'tommyscott@gmail.com', 'student', 'ecnmc');
INSERT INTO `javapart2`.`users` (`username`, `password`, `first_name`, `last_name`, `phone_number`, `email`, `role_id`, `department_id`) VALUES ('vision', 'cP7L5YTe4Yp1it4wa1W5EWe8AnUNOQfYUpLPiCaloRZOOT77I5/LMpMI8Hhf+2IN', 'Victor', 'Shade', 6921458325, 'vision@hotmail.com', 'instructor', 'comsc');

COMMIT;


-- -----------------------------------------------------
-- Data for table `javapart2`.`courses`
-- -----------------------------------------------------
START TRANSACTION;
USE `javapart2`;
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('java_oop', 'Java', 5, 4, 'tony_stark', 2, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('calc_1', 'Calculus 1', 5, 4, 'steve_rogers', 1, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('cpp', 'C++', 5, 4, 'bruce_banner', 1, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('algo', 'Algorithms', 5, 4, 'thor_odinson', 4, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('java_web', 'Java Servlets', 5, 4, 'tony_stark', 4, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('calc_2', 'Calculus 2', 5, 4, 'steve_rogers', 2, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('algb', 'Algebra', 5, 4, 'steve_rogers', 3, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('com_os', 'Operating Systems', 5, 4, 'bruce_banner', 3, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('compiler', 'Compilers', 5, 4, 'bruce_banner', 5, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('python', 'Python', 5, 4, 'tony_stark', 6, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('database', 'Databases', 5, 4, 'tony_stark', 7, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('ai', 'Aritficial Intelligence', 5, 4, 'thor_odinson', 8, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('eco_1', 'Economics 1', 5, 4, 'step_strange', 1, 'ecnmc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('int_com', 'Intro to Computer Science', 5, 4, 'vision', 1, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('comp_math', 'Computer Maths', 5, 4, 'steve_rogers', 3, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('web_tech', 'Web Tecnologies', 5, 4, 'vision', 4, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('com_arch', 'Computer Architecture', 5, 4, 'bruce_banner', 2, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('com_stat', 'Statistcs', 5, 4, 'steve_rogers', 5, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('nets', 'Networks', 5, 4, 'vision', 5, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('mach_lrn', 'Machine Learning', 5, 4, 'vision', 6, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('database_2', 'Databases 2', 5, 4, 'tony_stark', 6, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('graphics', 'Graphics', 5, 4, 'thor_odinson', 7, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('secur', 'Security', 5, 4, 'bruce_banner', 7, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('des_pat', 'Design Patterns', 5, 4, 'vision', 8, 'comsc');
INSERT INTO `javapart2`.`courses` (`id`, `title`, `ects`, `teaching_hours`, `instructor_username`, `semester`, `department_id`) VALUES ('crypt', 'Cryptography', 5, 4, 'bruce_banner', 8, 'comsc');

COMMIT;


-- -----------------------------------------------------
-- Data for table `javapart2`.`grades`
-- -----------------------------------------------------
START TRANSACTION;
USE `javapart2`;
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'java_oop', 10);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'cpp', 9);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'calc_1', 8);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'calc_2', 4);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('janet_vd', 'eco_1', 7);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'int_com', 9);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'com_arch', 7);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'algb', 8);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'com_os', 8);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'algo', 7);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'compiler', 3);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'web_tech', 10);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'com_stat', 6);
INSERT INTO `javapart2`.`grades` (`student_id`, `course_id`, `grade`) VALUES ('wanda_max', 'nets', 6);

COMMIT;

