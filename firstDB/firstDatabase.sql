CREATE DATABASE db1;
DROP DATABASE db1;
DROP DATABASE IF EXISTS db2;

CREATE DATABASE college;

CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE students (
id INT  PRIMARY KEY,
name varchar(50),
age INT NOT NULL
);

INSERT INTO students VALUES (1,"AMAN",29);
INSERT INTO students VALUES (2,"Ahad",20);

Drop table students;

CREATE TABLE student (
rollNo INT PRIMARY KEY,
name VARCHAR (50)
);

SELECT * FROM student;

INSERT INTO student 
(rollNo, name)
VALUES 
(1,"max"),
(2,"bob");



INSERT INTO student VALUES (3,"charlie");

 