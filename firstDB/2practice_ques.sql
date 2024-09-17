CREATE DATABASE xyz_company;

USE xyz_company;

CREATE TABLE employee(
id INT PRIMARY KEY,
name varchar(100),
salary INT
);

INSERT INTO employee 
(id,name,salary)
VALUES 
(1,"aman",50000),
(2,"bob",60000);

SELECT * FROM employee;