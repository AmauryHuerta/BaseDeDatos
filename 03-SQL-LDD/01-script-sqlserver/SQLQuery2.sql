--Creacion de Base de Datos bdinstruccion

--Crear una base de datos empresag2
CREATE DATABASE bdinstruccion;
GO 

--utilizar la base de datos
USE bdinstruccion;
GO

--Crear la tabla Instruccion 
CREATE TABLE Instruccion(
	Ssn int not null identity(1,1),
	Lname varchar(20) not null,
	Fname varchar(20) not null,
	CONSTRAINT pk_Instruccion
	PRIMARY KEY (Ssn)
);
GO

--Crear la tabla Class
CREATE TABLE Class(
	CourseNum int not null,
	[Year] int not null,
	Term varchar(20) not null,
	Section varchar(20) not null,
	CONSTRAINT pk_Class
	PRIMARY KEY (CourseNum,[Year],Term,Section)
);