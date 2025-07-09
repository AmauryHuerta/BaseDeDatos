CREATE DATABASE RentaVehiculos;
USE RentaVehiculos;

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    numcliente INT PRIMARY KEY,
    nombre NVARCHAR(20),
    apellidop1 NVARCHAR(20),
    apellidop2 NVARCHAR(20),
    curp NCHAR(18),
    telefono NCHAR(12),
    calle NVARCHAR(50),
    numero INT,
    ciudad NVARCHAR(20)
);

-- Crear la tabla Sucursal
CREATE TABLE Sucursal (
    numerosucursal INT PRIMARY KEY,
    nombre NVARCHAR(20),
    ubicacion NVARCHAR(20)
);

-- Crear la tabla Vehiculo
CREATE TABLE Vehiculo (
    numvehiculo INT PRIMARY KEY,
    placa NCHAR(7),
    marca NVARCHAR(15),
    modelo NVARCHAR(20),
    anio INT,
    numcliente INT,
    numerosucursal INT,
    FOREIGN KEY (numcliente) 
	REFERENCES Cliente(numcliente),
    FOREIGN KEY (numerosucursal) 
	REFERENCES Sucursal(numerosucursal)
);