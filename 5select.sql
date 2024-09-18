CREATE DATABASE college;
USE college;

CREATE TABLE student (
    rollNo INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
VALUES 
    (101, "Anil", 75, "C", "Pune"),
    (102, "Bhumika", 93, "A", "Mumbai"),
    (103, "Chetan", 85, "A", "Delhi"),
    (104, "Druv", 86, "B", "Mumbai"),
    (105, "Emanuel", 12, "F", "Delhi"),
    (106, "Farah", 82, "B", "Delhi");

SELECT * from student;

SELECT DISTINCT city from student;