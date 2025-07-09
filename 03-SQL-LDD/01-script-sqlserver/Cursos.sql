CREATE DATABASE Cursos;
USE Cursos;

-- Crear la tabla Alumno
CREATE TABLE Alumno (
    Numero INT PRIMARY KEY,
    Nombre VARCHAR(100),
    ApellidoPaterno VARCHAR(100),
    ApellidoMaterno VARCHAR(100)
);

-- Crear la tabla Curso
CREATE TABLE Curso (
    Codigo INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

-- Crear la tabla Inscripcion (relación muchos a muchos (M:N))
CREATE TABLE Inscripcion (
    Numero INT,
    Codigo INT,
    PRIMARY KEY (Numero, Codigo),
    FOREIGN KEY (Numero) REFERENCES Alumno(Numero),
    FOREIGN KEY (Codigo) REFERENCES Curso(Codigo)
);