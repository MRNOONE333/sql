USE college;

CREATE table emp(
id INT ,
salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES (1);
INSERT INTO emp (id) VALUES (2);
INSERT INTO emp (id) VALUES (3);

SELECT * FROM emp;

USE xyz_company;

CREATE TABLE city(
id INT PRIMARY KEY,
cityName varchar(50),
age INT,
pincode INT CHECK (pincode>2000),
CONSTRAINT age_city_check CHECK (age>=18 AND cityName ="Delhi")
);