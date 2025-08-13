-- Crear BD
CREATE DATABASE bdamaury;
GO

USE bdamaury;
GO

CREATE TABLE Empleado(
	IdEmpleado int not null identity(1,1),
	Nombre varchar(50) not null,
	Apellido1 varchar(20) not null,
	Apellido2 varchar(20) null,
	Edad int not null,
	Estatus char(1) not null default 'A',
	IdDepto int not null,
);
GO

-- Crear tabla departamentos
CREATE TABLE Departamentos(
	IdDepart int not null identity(1,1),
	NombreDepto varchar(20) not null,
	IdEmpleado int not null,
	CONSTRAINT pk_depto
	PRIMARY KEY(IdDepart)
);
GO

ALTER TABLE Empleado
ADD Jef int null;
GO

-- Restricciones
ALTER TABLE Empleado
ADD CONSTRAINT pk_empleado
PRIMARY KEY(IdEmpleado);
GO

ALTER TABLE Empleado
ADD CONSTRAINT chk_edad
CHECK(Edad between 18 and 60);
GO

ALTER TABLE Empleado
ADD CONSTRAINT fk_Empleado_EmpleJefe
FOREIGN KEY(jef)
REFERENCES Empleado(IdEmpleado)
GO