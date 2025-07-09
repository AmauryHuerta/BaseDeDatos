CREATE DATABASE Empresa;
USE Empresa;

--Crear la tabla Department
CREATE TABLE Department (
    Numberdepartment INT PRIMARY KEY,
    Namedepartment NVARCHAR(30) NOT NULL,
    Ssn INT,
    Startdate DATE
);

--Crear Employee
CREATE TABLE Employee (
    Ssn INT PRIMARY KEY,
    Firstname NVARCHAR(20),
    Lastname NVARCHAR(20),
    Address NVARCHAR(100),
    Birthdate DATE,
    Salary MONEY,
    Sex NVARCHAR(20),
    Numberdepto INT,
    Supervisor INT
);

--Crear la tabla Deptlocation
CREATE TABLE Deptlocation (
    Numberdepart INT,
    Dlocation NVARCHAR(30),
    PRIMARY KEY (Numberdepart, Dlocation)
);

--Crear la tabla Dependent
CREATE TABLE [Dependent] (
    Ssn INT,
    Name NVARCHAR(50),
    Relationship NVARCHAR(50),
    Sex NVARCHAR(30),
    Birthdate DATE,
    PRIMARY KEY (Ssn, Name)
);

--Crear la tabla Project
CREATE TABLE Project (
    Numberproject INT PRIMARY KEY,
    Nameproject NVARCHAR(30),
    Location NVARCHAR(30),
    Numberdepart INT
);

--Crear la tabla Work_on
CREATE TABLE Work_on (
    Ssn INT,
    Numberproject INT,
    hours INT,
    PRIMARY KEY (Ssn, Numberproject)
);

----- Agregar Relaciones de las Tablas -----

-- Relaciones en Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Department
FOREIGN KEY (Numberdepto) 
REFERENCES Department(Numberdepartment);

ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_Supervisor
FOREIGN KEY (Supervisor) 
REFERENCES Employee(Ssn);

-- Relaciones en Department
ALTER TABLE Department
ADD CONSTRAINT FK_Department_Manager
FOREIGN KEY (Ssn)
REFERENCES Employee(Ssn);

-- Deptlocation a Department
ALTER TABLE Deptlocation
ADD CONSTRAINT FK_Deptlocation_Department
FOREIGN KEY (Numberdepart)
REFERENCES Department(Numberdepartment);

-- Dependent a Employee
ALTER TABLE [Dependent]
ADD CONSTRAINT FK_Dependent_Employee
FOREIGN KEY (Ssn) 
REFERENCES Employee(Ssn);

-- Project a Department
ALTER TABLE Project
ADD CONSTRAINT FK_Project_Department
FOREIGN KEY (Numberdepart)
REFERENCES Department(Numberdepartment);

-- Work_on a Employee y Project
ALTER TABLE Work_on
ADD CONSTRAINT FK_WorkOn_Employee
FOREIGN KEY (Ssn) 
REFERENCES Employee(Ssn);

ALTER TABLE Work_on
ADD CONSTRAINT FK_WorkOn_Project
FOREIGN KEY (Numberproject) 
REFERENCES Project(Numberproject);