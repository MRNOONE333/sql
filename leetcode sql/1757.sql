CREATE DATABASE ProductsDB;

USE ProductsDB;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    low_fats ENUM('Y', 'N') NOT NULL,
    recyclable ENUM('Y', 'N') NOT NULL
);

INSERT INTO Products (product_id, low_fats, recyclable)
VALUES 
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'Y'),
(4, 'N', 'N');

SELECT * from Products;

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

