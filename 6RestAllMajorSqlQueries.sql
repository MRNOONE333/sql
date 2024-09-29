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


SELECT * FROM student WHERE (marks>80);


-- OPERATORS 


SELECT * FROM student WHERE (marks BETWEEN 80 AND 90);

SELECT * FROM student WHERE (city = "mumbai" AND grade = "A");

SELECT * FROM student WHERE (city = "mumbai" OR grade = "A");

-- SELECT * FROM student WHERE city IN ("delhi" AND "Pune");
-- This query returns the entire table because of how SQL interprets "delhi" AND "Pune":
-- "delhi" AND "Pune" is interpreted as a logical expression. Since both strings are non-null, SQL evaluates "delhi" AND "Pune" as TRUE.

SELECT * FROM student WHERE city IN (TRUE);

-- It does return an empty table, and here's why:
-- Explanation:
-- The IN clause compares values from a column to a list of possible values. In this case, the column city likely contains string values (e.g., "delhi", "Pune").
-- However, TRUE is a boolean value, and since none of the entries in the city column are likely boolean, the query doesn't find any matches, so it returns an empty result.


SELECT * FROM student WHERE city IN ("delhi" , "Pune");

SELECT * FROM student WHERE city NOT IN ("delhi" , "Pune");


SELECT * FROM student LIMIT 3;

SELECT * FROM student WHERE marks > 80 LIMIT 1;

SELECT * FROM student ORDER BY marks  ASC LIMIT 3 ;
SELECT * FROM student ORDER BY marks  DESC LIMIT 3 ;



-- Aggregate function    ---------------------------------------------------------------------------------------------------

SELECT MIN(marks) from student;
SELECT max(marks) from student;

SELECT count(name) from student;

SELECT sum(marks) from student;



-- Group by clause ---------------------------------------------------------------------------------------------------

SELECT city
from student
GROUP BY city;


SELECT city,name, count(rollno) 
from student
GROUP BY city ,name;

SELECT city,count(rollno)
from student
GROUP BY city;
-- practice ques
--  Q)write query to find avg marks in each city in accending order

SELECT city,  avg(marks)
from student
GROUP BY city
ORDER BY avg(marks) ASC ;

-- q2) based on grade find no of students 

SELECT grade,count(rollNo)
from student
GROUP BY  grade
ORDER BY grade;


-- Having Clause 

-- No. of students in cities only when max. marks in that city >90.

-- part1
SELECT city , count(rollno)
FROM student
GROUP BY city;

-- part 2
SELECT city , count(rollno)
FROM student
GROUP BY city
HAVING MAX(marks)>90;

-- General Order IN SQQL QUERY.
-- SELECT 
-- FROM 
-- WHERE
-- GROUP BY
-- HAVING 
-- ORDER BY

SELECT city 
FROM student
WHERE grade ="A"
GROUP BY city
HAVING MAX(marks)>=85
ORDER BY MAX(marks) DESC;

-- Update command------------------------------------------------------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;



UPDATE student
SET grade = "O"
WHERE grade = "A";


UPDATE student
SET marks= 55
WHERE rollno = 105;

UPDATE student 
SET grade = "E"
WHERE marks BETWEEN 50 AND 60;

SELECT * FROM student;

-- q)increase all marks by +1

UPDATE student
SET marks = marks+1;

SELECT * FROM student;


-- repeat
UPDATE student
SET marks= 9
WHERE rollno = 105;

-- DELETE A row -------------------------------------------------------------------------------

DELETE FROM student 
WHERE marks<33;

SELECT * FROM student;


--  ----------------------------------------------


CREATE TABLE department(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- FOREIGN KEY
-- Click on reverse engineer option in database to confirm to see ER diagram
-- Cascading added. 
CREATE TABLE teacher(
	id INT PRIMARY KEY,
	name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO department
VALUES 
(101,"english"),
(102, "IT");

SELECT * FROM department;

INSERT INTO teacher
VALUES
(1,"bob",101),
(2,"marley",102);

SELECT * FROM teacher;


UPDATE department
SET id= 103
WHERE id =102;

-- ------------------------------------------------------------------------------------------------------
 
ALTER table student
ADD COLUMN age INT;

ALTER table student
DROP COLUMN age ;

ALTER TABLE student
RENAME TO students;

ALTER TABLE students
RENAME TO  student;

-- ------------------------------------------------------------------------------------------------------


ALTER TABLE student 
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE  student
MODIFY age VARCHAR(2);

INSERT INTO student
(rollno,name,marks,age)
VALUES
(108,"gargie",70,100);
-- Error Code: 1406. Data too long for column 'age' at row 1

ALTER TABLE student
CHANGE age Stu_age INT; 

INSERT INTO student
(rollno,name,marks,Stu_age)
VALUES
(108,"gargie",70,100);

ALTER TABLE student
DROP COLUMN Stu_age;

SELECT * FROM student;

-- ----------------------------------------------------------------------------------------------------
-- Truncate
TRUNCATE TABLE student;

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

SELECT * FROM student;

-- practice ques - 
-- i-change name of column name to Full_name 
-- ii-delete all students who scored marks less than 80
-- iii-delete  the column of grade

ALTER TABLE student
CHANGE name Full_name VARCHAR(50);

DELETE FROM student
where marks<80;

ALTER TABLE student 
DROP COLUMN grade;

-- drop previous tables.
DROP TABLE student;
-- ----------------------------------------------------------------------------------------------------------------
-- Joins

CREATE TABLE  student(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student (id, name)
VALUES
(101, "adam"),
(102, "bob"),
(103, "casey");

CREATE TABLE course(
    id INT PRIMARY KEY,
    course VARCHAR(50)
);
INSERT INTO course (id, course)
VALUES
(102, "english"),
(105, "math"),
(103, "science"),
(101, "computer science");

SELECT * FROM student;
SELECT * FROM course;

-- SELECT *  
-- FROM student 
-- INNER JOIN course
-- ON student.id= course.id;
-- or

SELECT *  
FROM student as s
INNER JOIN course as c
ON s.id= c.id;

-- LEFT JOIN

SELECT *  
FROM student as s
LEFT JOIN course as c
ON s.id= c.id;

-- RIGHT JOIN

SELECT *  
FROM student as s
RIGHT JOIN course as c
ON s.id= c.id;

-- FULL JOIN

SELECT *  
FROM student as s
LEFT JOIN course as c
ON s.id= c.id
UNION
SELECT *  
FROM student as s
RIGHT JOIN course as c
ON s.id= c.id;

-- left/right excusive joins
-- LEFT
SELECT *
FROM student as s
LEFT JOIN course as c
ON  s.id=c.id
WHERE c.id IS NULL;

-- RIGHT
SELECT *
FROM student as s
RIGHT JOIN course as c
ON  s.id=c.id
WHERE s.id IS NULL;

