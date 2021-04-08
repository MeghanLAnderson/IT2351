/********************************************************
* This script creates the database named my_guitar_shop 
*********************************************************/

DROP DATABASE IF EXISTS MeghanAnderson_lesson5;
CREATE DATABASE MeghanAnderson_lesson5;
USE MeghanAnderson_lesson5;

CREATE TABLE majors (
  major_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  major_name      VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      INT,      
  CONSTRAINT majors_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

CREATE TABLE classes (
  class_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  class_name      VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      INT,
    CONSTRAINT classes_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);
CREATE TABLE emails (
  email_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  email           VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      INT,  
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
  student_id      INT,
  CONSTRAINT addresses_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

-- add data to tables
INSERT INTO majors (major_name) VALUES
('Programming'),
('Networking')
;
INSERT INTO classes (class_name) VALUES
('IT1025'),
('MATH1200'),
('IT1050'),
('IT2351')
;
INSERT INTO emails (email) VALUES
('Joe@school.edu'),
('Sue@school.edu'),
('Nick@school.edu'),
('John@school.edu'),
('Jane@school.edu'),
('Connor@school.edu'),
('Andy@school.edu')
;
INSERT INTO addresses (address_name) VALUES
('124 Main St.'),
('345 Second St.'),
('45 York Rd.'),
('600 5th Ave.'),
('580 Oak Ln.'),
('615 Magnolia Blvd.'),
('167 Eastwood Rd.')
;
INSERT INTO students (student_first_name, student_last_name) VALUES
('Joe','Green'),
('Sue','Smith'),
('Nick','Green'),
('John','Doe'),
('Jane','Williams'),
('Andy','Andrews'),
('Connor','Walters')
;