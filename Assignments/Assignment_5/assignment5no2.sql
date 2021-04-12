/********************************************************
* This script creates the database named my_guitar_shop 
*********************************************************/

DROP DATABASE IF EXISTS MeghanAnderson_lesson5;
CREATE DATABASE MeghanAnderson_lesson5;
USE MeghanAnderson_lesson5;

-- STUDENT TABLE 
CREATE TABLE students (
  student_id        VARCHAR(4)      PRIMARY KEY   NOT NULL,
  student_first_name VARCHAR(255)   NOT NULL,      
  student_last_name  VARCHAR(255)   NOT NULL     
);

-- Lookup for MAJOR
CREATE TABLE majors (
  major_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  major_name      VARCHAR(255)   NOT NULL      UNIQUE
);
-- Lookup for CLASS
CREATE TABLE classes (
  class_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  class_name      VARCHAR(255)   NOT NULL      UNIQUE
);
-- Lookup for EMAIL, must associate with a STUDENT
CREATE TABLE emails (
  email_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  email           VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      VARCHAR(4)     NOT NULL,  
  CONSTRAINT email_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

-- ADDRESS Table, must associate with STUDENT
CREATE TABLE addresses (
  address_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  address_name      VARCHAR(255)   NOT NULL      UNIQUE,
  student_id      VARCHAR(4)       NOT NULL,
  CONSTRAINT addresses_fk_students
    FOREIGN KEY (student_id)
    REFERENCES students (student_id)
);

--- ENROLLMENT Table, must associate with STUDENT & CLASS
CREATE TABLE enrollments (
  enrollment_id INT PRIMARY KEY AUTO_INCREMENT ,
  student_id VARCHAR(4) NOT NULL,
  class_id INT NOT NULL,
  majors_id INT,
  email_id INT
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

INSERT INTO students (student_id,student_first_name, student_last_name) VALUES
('S1','Joe','Green'),
('S2','Sue','Smith'),
('S3','Nick','Green'),
('S4','Andy','Andrews'),
('S5','John','Doe'),
('S6','Jane','Williams'),
('S7','Connor','Walters')
;

INSERT INTO emails (student_id,email) VALUES
('S1','Joe@school.edu'),
('S2','Sue@school.edu'),
('S3','Nick@school.edu'),
('S5','John@school.edu'),
('S6','Jane@school.edu'),
('S7','Connor@school.edu'),
('S4','Andy@school.edu')
;
INSERT INTO addresses (student_id,address_name) VALUES
('S1','124 Main St.'),
('S2','345 Second St.'),
('S3','45 York Rd.'),
('S4','600 5th Ave.'),
('S5','580 Oak Ln.'),
('S6','615 Magnolia Blvd.'),
('S7','167 Eastwood Rd.')
;

-- ENROLLMENT table
-- Jane is Double MAJOR
-- Connor has no MAJOR
INSERT INTO enrollments(student_id,class_id,majors_id,email_id) VALUES
('S1',1,1,1),
('S1',2,1,1),
('S1',3,1,1),
('S2',1,1,2),
('S2',3,1,2),
('S2',4,2,2),
('S3',1,2,3),
('S4',1,2,4),
('S4',3,2,4),
('S5',2,1,5),
('S6',1,1,6),
('S6',3,2,6),
('S7',1,0,7),
('S7',4,0,7);

SELECT S1
FROM students s
 JOIN enrollments e 
 JOIN majors m
 JOIN classes c 
 JOIN emails em
 JOIN addresses a
 ;   
-- create view for guitar database
CREATE VIEW item_ordered_view AS
SELECT c.category_name, p.product_name, i.item_price, i.quantity
FROM categories c
    JOIN products p 
    JOIN order_items i
ON c.category_id = p.category_id
    AND p.product_id = i.product_id
