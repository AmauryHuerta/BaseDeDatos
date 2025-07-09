# Crear la base de datos
CREATE DATABASE empresa_final;
USE empresa_final;

# Tabla Employee
CREATE TABLE Employee (
    Ssn INT NOT NULL,
    Firstname NVARCHAR(20),
    Lastname NVARCHAR(20),
    Address NVARCHAR(100),
    Birthdate DATE,
    Salary DECIMAL(10,2),
    Sex NVARCHAR(10),
    Numberdepto INT,
    Supervisor INT,
    CONSTRAINT pk_employee 
    PRIMARY KEY (Ssn)
);

# Tabla Department
CREATE TABLE Department (
    Numberdepartment INT NOT NULL,
    Namedepartment NVARCHAR(30) NOT NULL,
    Ssn INT,
    Startdate DATE,
    CONSTRAINT pk_department 
    PRIMARY KEY (Numberdepartment),
    CONSTRAINT fk_manager 
    FOREIGN KEY (Ssn)
	REFERENCES Employee(Ssn)
);

# Relación 1:N – Empleado pertenece a un departamento
ALTER TABLE Employee
ADD CONSTRAINT fk_employee_depto FOREIGN KEY (Numberdepto)
REFERENCES Department(Numberdepartment);

# Relación recursiva – Supervisor
ALTER TABLE Employee
ADD CONSTRAINT fk_supervisor 
FOREIGN KEY (Supervisor)
    REFERENCES Employee(Ssn);

# Tabla Deptlocation
CREATE TABLE Deptlocation (
    Numberdepart INT NOT NULL,
    Dlocation NVARCHAR(30),
    CONSTRAINT pk_deptlocation 
    PRIMARY KEY (Numberdepart, Dlocation),
    CONSTRAINT fk_deptlocation 
    FOREIGN KEY (Numberdepart)
	REFERENCES Department(Numberdepartment)
);

# Tabla Dependent
CREATE TABLE Dependent (
    Ssn INT NOT NULL,
    Name NVARCHAR(50),
    Relationship NVARCHAR(30),
    Sex NVARCHAR(10),
    Birthdate DATE,
    CONSTRAINT pk_dependent 
    PRIMARY KEY (Ssn, Name),
    CONSTRAINT fk_dependent_employee 
    FOREIGN KEY (Ssn)
	REFERENCES Employee(Ssn)
);

# Tabla Project
CREATE TABLE Project (
    Numberproject INT NOT NULL,
    Nameproject NVARCHAR(50),
    Location NVARCHAR(30),
    Numberdepart INT,
    CONSTRAINT pk_project 
    PRIMARY KEY (Numberproject),
    CONSTRAINT fk_project_department 
    FOREIGN KEY (Numberdepart)
	REFERENCES Department(Numberdepartment)
);

# Tabla intermedia Work_on (M:N entre Employee y Project)
CREATE TABLE Work_on (
    Ssn INT NOT NULL,
    Numberproject INT NOT NULL,
    Hours INT,
    CONSTRAINT pk_workon 
    PRIMARY KEY (Ssn, Numberproject),
    CONSTRAINT fk_work_employee 
    FOREIGN KEY (Ssn)
	REFERENCES Employee(Ssn),
    CONSTRAINT fk_work_project 
    FOREIGN KEY (Numberproject)
	REFERENCES Project(Numberproject)
);