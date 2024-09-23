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

