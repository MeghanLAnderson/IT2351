/********************************************************
* This script creates the database named my_guitar_shop 
*********************************************************/

DROP DATABASE IF EXISTS MeghanAnderson_lesson5;
CREATE DATABASE MeghanAnderson_lesson5;
USE MeghanAnderson_lesson5;

CREATE TABLE majors (
  major_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  major_name      VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      INT
  CONSTRAINT majors_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

CREATE TABLE classes (
  class_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  class_name      VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      INT
    CONSTRAINT classes_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);
CREATE TABLE emails (
  email_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  email           VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      INT   
  CONSTRAINT email_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);
CREATE TABLE students (
  student_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  student_first_name VARCHAR(255)   NOT NULL,      
  student_last_name  VARCHAR(255)   NOT NULL     
);
CREATE TABLE addresses (
  address_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  address_name      VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      INT
  CONSTRAINT addresses_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)