CREATE DATABASE Dentista;
USE Dentista;

--Crear la tabla Paciente
CREATE TABLE PACIENTE (
    ID_paciente INT PRIMARY KEY,
    nombreP NVARCHAR(50),
    apellido1 NVARCHAR(50),
    apellido2 NVARCHAR(50),
    CURP NVARCHAR(18),
    fecha_nacimiento DATE,
    colonia NVARCHAR(50),
    numero NVARCHAR(10),
    calle NVARCHAR(50),
    correoelectronico NVARCHAR(100),
    telefono NVARCHAR(20),
    num_seguro NVARCHAR(20)
);

--Crear la tabla odontologo
CREATE TABLE ODONTOLOGO (
    ID_odontologo INT PRIMARY KEY,
    cedulaP NVARCHAR(20),
    nombreP NVARCHAR(50),
    apellido1 NVARCHAR(50),
    apellido2 NVARCHAR(50)
);

--Crear la tabla especialidad
CREATE TABLE ESPECIALIDAD (
    ID_especialidad INT PRIMARY KEY,
    nombre_Especialidad NVARCHAR(50)
);

--Crear la tabla "tiene"
CREATE TABLE TIENE (
    ID_odontologo INT,
    ID_especialidad INT,
    PRIMARY KEY (ID_odontologo, ID_especialidad),
    FOREIGN KEY (ID_odontologo) 
	REFERENCES ODONTOLOGO(ID_odontologo),
    FOREIGN KEY (ID_especialidad)
	REFERENCES ESPECIALIDAD(ID_especialidad)
);

--Crear la tabla consultorio
CREATE TABLE CONSULTORIO (
    ID_consultorio INT PRIMARY KEY,
    piso INT,
    numero NVARCHAR(10)
);

--Crear la tabla "usa"
CREATE TABLE USA (
    ID_odontologo INT,
    ID_consultorio INT,
    fecha DATE,
    horario NVARCHAR(20),
    PRIMARY KEY (ID_odontologo, ID_consultorio, fecha),
    FOREIGN KEY (ID_odontologo) 
	REFERENCES ODONTOLOGO(ID_odontologo),
    FOREIGN KEY (ID_consultorio) 
	REFERENCES CONSULTORIO(ID_consultorio)
);

--Crear la tabla cita
CREATE TABLE CITA (
    ID_cita INT PRIMARY KEY,
    estatus NVARCHAR(30),
    motivo NVARCHAR(100),
    hora TIME,
    fecha DATE,
    ID_odontologo INT,
    FOREIGN KEY (ID_odontologo) 
	REFERENCES ODONTOLOGO(ID_odontologo)
);

--Crear la tabla tratamiento
CREATE TABLE TRATAMIENTO (
    ID_tratamiento INT PRIMARY KEY,
    nombre NVARCHAR(50),
    duracion INT,
    costo DECIMAL(10,2),
    estatus NVARCHAR(30)
);

--Crear la tabla aplicacion_tratamiento
CREATE TABLE APLICACION_TRATAMIENTO (
    ID_aplicacion INT PRIMARY KEY,
    observaciones NVARCHAR(255),
    fecha DATE,
    ID_odontologo INT,
    ID_paciente INT,
    ID_tratamiento INT,
    FOREIGN KEY (ID_odontologo) 
	REFERENCES ODONTOLOGO(ID_odontologo),
    FOREIGN KEY (ID_paciente) 
	REFERENCES PACIENTE(ID_paciente),
    FOREIGN KEY (ID_tratamiento)
	REFERENCES TRATAMIENTO(ID_tratamiento)
);

--Crear la tabla sesion_tratamiento
CREATE TABLE SESION_TRATAMIENTO (
    ID_sesion INT PRIMARY KEY,
    fecha DATE,
    observaciones NVARCHAR(255),
    duracionsesion TIME
);

--Crear la tabla sesiones
CREATE TABLE SESIONES (
    ID_aplicacion INT,
    ID_sesion INT,
    PRIMARY KEY (ID_aplicacion, ID_sesion),
    FOREIGN KEY (ID_aplicacion) 
	REFERENCES APLICACION_TRATAMIENTO(ID_aplicacion),
    FOREIGN KEY (ID_sesion) 
	REFERENCES SESION_TRATAMIENTO(ID_sesion)
);

--Crear la tabla material
CREATE TABLE MATERIAL (
    ID_material INT PRIMARY KEY,
    nombre NVARCHAR(50),
    stock INT,
    unidad_material NVARCHAR(20),
    descripcion NVARCHAR(255)
);

--Crear la tabla utiliza_sesion
CREATE TABLE UTILIZA_SESION (
    ID_sesion INT,
    ID_material INT,
    PRIMARY KEY (ID_sesion, ID_material),
    FOREIGN KEY (ID_sesion) 
	REFERENCES SESION_TRATAMIENTO(ID_sesion),
    FOREIGN KEY (ID_material)
	REFERENCES MATERIAL(ID_material)
);

--Crear la tabla utiliza_tratamiento
CREATE TABLE UTILIZA_TRATAMIENTO (
    ID_material INT,
    ID_tratamiento INT,
    PRIMARY KEY (ID_material, ID_tratamiento),
    FOREIGN KEY (ID_material) 
	REFERENCES MATERIAL(ID_material),
    FOREIGN KEY (ID_tratamiento) 
	REFERENCES TRATAMIENTO(ID_tratamiento)
);

--Crear la tabla historia_clinica
CREATE TABLE HISTORIA_CLINICA (
    ID_historiaclinica INT PRIMARY KEY,
    fecha DATE,
    diagnostico NVARCHAR(255),
    observaciones NVARCHAR(255)
);

--Crear la tabala imagen
CREATE TABLE IMAGEN (
    ID_imagen INT PRIMARY KEY,
    ruta NVARCHAR(255),
    tipo NVARCHAR(50),
    ID_historiaclinica INT,
    FOREIGN KEY (ID_historiaclinica) 
	REFERENCES HISTORIA_CLINICA(ID_historiaclinica)
);

--Crear la tabla pago
CREATE TABLE PAGO (
    ID_aplicacion INT,
    ID_pago INT PRIMARY KEY,
    FOREIGN KEY (ID_aplicacion)
	REFERENCES APLICACION_TRATAMIENTO(ID_aplicacion)
);

--Crear la tabla factura
CREATE TABLE FACTURA (
    ID_pago INT PRIMARY KEY,
    fecha DATE,
    metodo_Pago NVARCHAR(50),
    estado_Pago NVARCHAR(30),
    monto DECIMAL(10,2),
    FOREIGN KEY (ID_pago) 
	REFERENCES PAGO(ID_pago)
);