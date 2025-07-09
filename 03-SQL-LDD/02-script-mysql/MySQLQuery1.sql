# Lenguaje sql-ldd (create, alter,drop)

# Crear una base de datos empresag2
CREATE DATABASE empresag2;


# Utilizar la base de datos
USE empresag2;

# Crear la tabla categorias 
CREATE TABLE Categorias(
Categroriaid int primary key,
nombrecategoria nvarchar (30) not null unique
);


# Crear tabla empleado
CREATE TABLE Empleado(
EmpleadoId int not null auto_increment,
Nombre nvarchar(20) not null,
Apellidopaterno nvarchar(15) not null,
curp char(18) not null,
telefono char(15),
sexo char(1) not null,
activo boolean not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT unique_curp
UNIQUE(curp),
CONSTRAINT chk_sexo
CHECK (sexo in('M','F'))
);

drop table empleado;

INSERT INTO Categorias (Categroriaid,nombrecategoria)
VALUES(1,'CARNES FRIAS');


INSERT INTO Categorias (Categroriaid,nombrecategoria)
VALUES(2,'VINOS Y LICORES');


SELECT*FROM Categorias;

# Insertar en empelado 
INSERT INTO Empleado(Nombre,Apellidopaterno,curp,telefono,sexo,activo)
VALUES('Monico','Panfilo', 'sdsddssdf','M',1);


SELECT*FROM Empleado;

SELECT*FROM Empleado;

#Creacion de primary key compuestas
CREATE TABLE Tabla1
(
	Tabla1id1 int not null,
	Tabla1id2 int not null,
	Nombre nvarchar(20) not null,
	CONSTRAINT pk_tabla1
	PRIMARY KEY(Tabla1id1, Tabla1id2)
);

#Razon de cardinalidad 1:N
CREATE TABLE Tabla2(
	Tabla2id int not null auto_increment,
	Nombre varchar(20),
	Tabla1id1 int,
	Tabla1id2 int,
	CONSTRAINT pk_tabla2
	PRIMARY KEY(Tabla2id),
	CONSTRAINT fk_tabla2_tabla1
	FOREIGN KEY (Tabla1id1, Tabla1id2)
	REFERENCES Tabla1(Tabla1id1,Tabla1id2)
);

#Razon de cardinalidad 1:1
CREATE TABLE Employee(
	Id int not null auto_increment,
	Nombre varchar(20) not null,
	Ap1 varchar(15) not null,
	Ap2 varchar(15),
	Sexo char(1) not null,
	Salario decimal(10,2) not null,
	CONSTRAINT pk_employee
	PRIMARY KEY(Id),
	CONSTRAINT chk_Sexo2
	CHECK(sexo in ('M','F')),
	CONSTRAINT chk_salario
	CHECK(Salario > 0.0)
);

CREATE TABLE Department(
	Id int not null auto_increment,
	NombreProyecto varchar(20) not null,
	Ubicacion varchar(15) not null,
	FechaInicio Date not null,
	IdEmployee int not null,
	CONSTRAINT pk_departament
	PRIMARY KEY (Id),
	CONSTRAINT unique_nombreproyecto
	UNIQUE(NombreProyecto),
	CONSTRAINT unique_idemployee
	UNIQUE(IdEmployee),
	CONSTRAINT fk_department_employee
	FOREIGN KEY (IdEmployee)
	REFERENCES Employee(Id)
);

#Razon de cardinalidad M:N

CREATE TABLE Project(
	Projectid int not null auto_increment,
	Nombre varchar(20) not null,
	CONSTRAINT pk_project
	PRIMARY KEY (Projectid),
	CONSTRAINT Unique_nombreproject
	UNIQUE (Nombre)
);

CREATE TABLE WORK_ON(
	Employeeid int not null,
	Projectid int not null,
	Horas int not null,
	CONSTRAINT pk_work_on
	PRIMARY KEY (Employeeid, Projectid),
	CONSTRAINT fk_work_on_Employee
	FOREIGN KEY(Employeeid)
	REFERENCES Employee(Id),
	CONSTRAINT fk_work_on_Project
	FOREIGN KEY(Projectid)
	REFERENCES Project(Projectid),
);