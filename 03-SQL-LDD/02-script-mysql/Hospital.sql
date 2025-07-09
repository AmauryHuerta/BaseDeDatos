# Crear la base de datos
CREATE DATABASE hospital;

# Seleccionar la base de datos
USE hospital;

# Crear tabla de doctores
CREATE TABLE Doctor (
    Numdoctor INT NOT NULL AUTO_INCREMENT,
    Nombrep NVARCHAR(50) NOT NULL,
    Apellido1 NVARCHAR(50) NOT NULL,
    Apellido2 NVARCHAR(50),
    CONSTRAINT pk_doctor
    PRIMARY KEY (Numdoctor)
);

# Crear tabla de pacientes
CREATE TABLE Paciente (
    Numpaciente INT NOT NULL AUTO_INCREMENT,
    Nombrep NVARCHAR(50) NOT NULL,
    Apellido1 NVARCHAR(50) NOT NULL,
    Apellido2 NVARCHAR(50),
    CONSTRAINT pk_paciente 
    PRIMARY KEY (Numpaciente)
);

# Crear tabla intermedia Atiende (relación M:N con atributos)
CREATE TABLE Atiende (
    Numdoctor INT NOT NULL,
    Numpaciente INT NOT NULL,
    Diagnostico NVARCHAR(255),
    Fecha DATE NOT NULL,
    CONSTRAINT pk_atiende 
    PRIMARY KEY (Numdoctor, Numpaciente, Fecha),
    CONSTRAINT fk_atiende_doctor 
    FOREIGN KEY (Numdoctor)
	REFERENCES Doctor(Numdoctor),
    CONSTRAINT fk_atiende_paciente 
    FOREIGN KEY (Numpaciente)
	REFERENCES Paciente(Numpaciente)
);