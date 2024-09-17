 CREATE DATABASE tempCompany;
 CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Employeepin INT,
    FOREIGN KEY (Employeepin) REFERENCES Employees(EmployeeID)
);
