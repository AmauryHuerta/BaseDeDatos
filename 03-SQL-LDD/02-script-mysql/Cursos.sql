# Crear la base de datos
CREATE DATABASE cursos;
USE cursos;

# Crear tabla Curso
CREATE TABLE Curso (
    Numcurso INT NOT NULL AUTO_INCREMENT,
    Nombre NVARCHAR(100) NOT NULL,
    Codigo VARCHAR(20) NOT NULL,
    CONSTRAINT pk_curso 
    PRIMARY KEY (Numcurso),
    CONSTRAINT unique_codigo 
    UNIQUE (Codigo)
);

# Crear tabla Estudiante
CREATE TABLE Estudiante (
    Numestudiante INT NOT NULL AUTO_INCREMENT,
    Nombrep NVARCHAR(50) NOT NULL,
    Apellido1 NVARCHAR(50) NOT NULL,
    Apellido2 NVARCHAR(50),
    Nummatricula VARCHAR(20) NOT NULL,
    CONSTRAINT pk_estudiante 
    PRIMARY KEY (Numestudiante),
    CONSTRAINT unique_matricula 
    UNIQUE (Nummatricula)
);

# Crear tabla Inscripcion (relación M:N como tabla intermedia)
CREATE TABLE Inscripcion (
    Numcurso INT NOT NULL,
    Numestudiante INT NOT NULL,
    CONSTRAINT pk_inscripcion 
    PRIMARY KEY (Numcurso, Numestudiante),
    CONSTRAINT fk_inscripcion_curso 
    FOREIGN KEY (Numcurso)
	REFERENCES Curso(Numcurso),
    CONSTRAINT fk_inscripcion_estudiante
    FOREIGN KEY (Numestudiante)
	REFERENCES Estudiante(Numestudiante)
);