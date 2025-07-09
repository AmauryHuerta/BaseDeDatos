# Crear la base de datos
CREATE DATABASE biblioteca;

# Seleccionar la base de datos
USE biblioteca;

# Crear la tabla Lectores
CREATE TABLE Lectores (
    NumLector INT NOT NULL AUTO_INCREMENT,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido1 NVARCHAR(50) NOT NULL,
    Apellido2 NVARCHAR(50),
    CURP CHAR(18) NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Activo BOOLEAN NOT NULL,
    CONSTRAINT pk_lectores PRIMARY KEY (NumLector),
    CONSTRAINT unique_curp_lector UNIQUE (CURP),
    CONSTRAINT chk_sexo CHECK (Sexo IN ('M','F'))
);

# Crear la tabla Libro
CREATE TABLE Libro (
    NumLibro INT NOT NULL AUTO_INCREMENT,
    NumISBN VARCHAR(20) NOT NULL,
    Titulo NVARCHAR(100) NOT NULL,
    Autor NVARCHAR(100),
    NumLector INT,
    CONSTRAINT pk_libro 
    PRIMARY KEY (NumLibro),
    CONSTRAINT unique_isbn 
    UNIQUE (NumISBN),
    CONSTRAINT fk_libro_lector 
    FOREIGN KEY (NumLector)
    REFERENCES Lectores(NumLector)
);