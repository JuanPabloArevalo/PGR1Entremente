CREATE DATABASE entremente;

CREATE TABLE paciente (
	id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(40),
    apellidos VARCHAR(40),
    documentoIdentidad VARCHAR(15),
    fechaNacimiento DATE,
    genero CHAR(1),
    pais VARCHAR(15),
    ciudad VARCHAR(15),
    nombreUsuario VARCHAR(50),
    password VARCHAR(50),
    direccion VARCHAR(100),
    tipoDocumento CHAR(1),
	correo VARCHAR(80)
);

CREATE TABLE FAMILIAR (
	id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(40),
    apellidos VARCHAR(40),
    documentoIdentidad VARCHAR(15),
    nombreUsuario VARCHAR(50),
    password VARCHAR(50),
    tipoDocumento CHAR(1),
	correo VARCHAR(80)
);

CREATE TABLE PERSONALSALUD (
	id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(40),
    apellidos VARCHAR(40),
    documentoIdentidad VARCHAR(15),
    nombreUsuario VARCHAR(50),
    password VARCHAR(50),
    tipoDocumento CHAR(1),
	correo VARCHAR(80),
    rol VARCHAR(2)
);

CREATE TABLE PACIENTEFAMILIAR (
	id INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT UNSIGNED NOT NULL,
    idFamiliar INT UNSIGNED NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES paciente(id),
    FOREIGN KEY (idFamiliar) REFERENCES FAMILIAR(id),
    estado VARCHAR(2),
    relacion VARCHAR(20),
	enviado VARCHAR(1)
);

CREATE TABLE PACIENTESALUD (
	id INT(8) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    idPaciente INT UNSIGNED NOT NULL,
    idPersonalSalud INT UNSIGNED NOT NULL,
    FOREIGN KEY (idPaciente) REFERENCES paciente(id),
    FOREIGN KEY (idPersonalSalud) REFERENCES PERSONALSALUD(id),
    estado VARCHAR(2),
    relacion VARCHAR(20),
	enviado VARCHAR(1)
);

