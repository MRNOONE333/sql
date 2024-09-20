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