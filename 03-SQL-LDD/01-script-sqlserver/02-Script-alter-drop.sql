-- Crear base de datos
CREATE DATABASE empresacucha;
GO

-- Utilizar la base de datos
USE empresacucha;
GO

-- Crear tabla empleados
CREATE TABLE Empleados(
	IdEmpleado int not null identity(1,1),
	Nombre nvarchar(100) not null,
	Puesto varchar(20),
	FechaIngreso date,
	Salario decimal(10,2),
	CONSTRAINT pk_empleado
	PRIMARY KEY (IdEmpleado)
);
GO

-- Crear tabla departamentos
CREATE TABLE Departamentos(
	IdDepto int not null primary key,
	NombreDepto varchar(50)
);
GO

-- Agregar una columna a la tabla empleados
ALTER TABLE Empleados
ADD CorreoElectronico varchar(20) null;
GO

/*
  Modificar un tipo de dato de salario 
  de la tabla empleados
*/
ALTER TABLE Empleados
ALTER COLUMN Salario money not null;
GO

-- Renombrar columna CorreoElectronico de
-- la tabla empleado
EXECUTE sp_rename 
				'Empleados.CorreoElectronico',
				'Email', 'COLUMN';
GO

-- Agregar columna a Empleados para foreign key (clave foranea)
ALTER TABLE Empleados 
ADD IdDepto int;
GO

-- Agregar un constraint de Foreign key
ALTER TABLE Empleados
ADD CONSTRAINT fk_empleado_depto
FOREIGN KEY (IdDepto)
REFERENCES Departamentos(IdDepto)
GO

-- Agregar un CONSTRAINT a salrio
ALTER TABLE Empleados
ADD CONSTRAINT chk_salrio
CHECK(salario >= 100 and salario <= 100000)
GO

-- Agregar un CONSTRAINT UNIQUE al nombre del 
-- departamento
ALTER TABLE Departamentos
ADD CONSTRAINT unique_nombredepto
UNIQUE (Nombredepto);
GO

-- Eliminar el CONTRAINT de foreign key
ALTER TABLE Empleados
DROP CONSTRAINT fk_empleado_depto

-- Eliminar la PRIMARY KEY de empleados
ALTER TABLE Empleados
DROP CONSTRAINT pk_empleado;

-- Eliminar la PRIMARY KEY de departamentos
ALTER TABLE Departamentos
DROP CONSTRAINT PK__Departam__7AEC424E9C52A3FF;

-- Eliminar columna 
ALTER TABLE Empleados
DROP COLUMN Email;

-- Eliminar una tabla 
DROP TABLE Departamentos;
GO

DROP TABLE Empleados;
GO

SELECT * FROM Empleados
GO