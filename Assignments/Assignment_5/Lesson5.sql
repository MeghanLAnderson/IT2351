/********************************************************
* This script creates the database named my_guitar_shop 
*********************************************************/

DROP DATABASE IF EXISTS MeghanAnderson_lesson5;
CREATE DATABASE MeghanAnderson_lesson5;
USE MeghanAnderson_lesson5;

CREATE TABLE majors (
  major_id        INT            PRIMARY KEY   AUTO_INCREMENT,
  major_name      VARCHAR(255)   NOT NULL      UNIQUE
);