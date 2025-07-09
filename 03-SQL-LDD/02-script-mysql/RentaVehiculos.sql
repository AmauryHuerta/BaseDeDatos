# Crear la base de datos
CREATE DATABASE renta_vehiculos;
USE renta_vehiculos;

# Crear tabla Sucursal
CREATE TABLE Sucursal (
    NumSucursal INT NOT NULL AUTO_INCREMENT,
    Nombre NVARCHAR(20) NOT NULL,
    Ubicacion NVARCHAR(20),
    CONSTRAINT pk_sucursal 
    PRIMARY KEY (NumSucursal)
);

# Crear tabla Cliente
CREATE TABLE Cliente (
    NumCliente INT NOT NULL AUTO_INCREMENT,
    Nombre NVARCHAR(20) NOT NULL,
    Apellido1 NVARCHAR(20) NOT NULL,
    Apellido2 NVARCHAR(20),
    CURP NCHAR(18) NOT NULL,
    Telefono NCHAR(12),
    Calle NVARCHAR(50),
    Numero INT,
    Ciudad NVARCHAR(20),
    CONSTRAINT pk_cliente 
    PRIMARY KEY (NumCliente),
    CONSTRAINT unique_curp_cliente 
    UNIQUE (CURP)
);

# Crear tabla Vehiculo
CREATE TABLE Vehiculo (
    NumVehiculo INT NOT NULL AUTO_INCREMENT,
    Placa NCHAR(7) NOT NULL,
    Marca NVARCHAR(15),
    Modelo NVARCHAR(20),
    Anio INT,
    NumCliente INT NOT NULL,
    NumSucursal INT NOT NULL,
    CONSTRAINT pk_vehiculo 
    PRIMARY KEY (NumVehiculo),
    CONSTRAINT unique_placa 
    UNIQUE (Placa),
    CONSTRAINT fk_vehiculo_cliente 
    FOREIGN KEY (NumCliente)
	REFERENCES Cliente(NumCliente),
    CONSTRAINT fk_vehiculo_sucursal 
    FOREIGN KEY (NumSucursal)
	REFERENCES Sucursal(NumSucursal)
);