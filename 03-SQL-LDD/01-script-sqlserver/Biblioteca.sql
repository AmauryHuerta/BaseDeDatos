-- Crear la base de datos y utilizarla
CREATE DATABASE Biblioteca;
USE Biblioteca;

-- Crear la tabla Lector
CREATE TABLE Lector (
    Numero INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido1 VARCHAR(100),
    Apellido2 VARCHAR(100)
);

-- Crear la tabla Libro
CREATE TABLE Libro (
    ISBN VARCHAR(20) PRIMARY KEY,
    Titulo VARCHAR(200),
    Autor_Nombre VARCHAR(100),
    Autor_Apellido VARCHAR(100)
);

-- Relación "Presta a": un lector puede tener varios libros, pero cada libro solo puede estar con un lector
CREATE TABLE PrestaA (
    Numero INT,
    ISBN VARCHAR(20),
    PRIMARY KEY (ISBN),		
-- relación 1:N desde libro
    FOREIGN KEY (Numero) 
	REFERENCES Lector(Numero),
    FOREIGN KEY (ISBN) 
	REFERENCES Libro(ISBN)
);