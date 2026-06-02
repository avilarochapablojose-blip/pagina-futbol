
CREATE DATABASE IF NOT EXISTS semillero_futbol_comfenalco;
USE semillero_futbol_comfenalco;
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL, 
    edad_minima INT NOT NULL,
    edad_maxima INT NOT NULL,
    horario VARCHAR(100) NOT NULL,        
    lugar VARCHAR(100) DEFAULT 'Colegio Comfenalco'
);


CREATE TABLE acudientes (
    id_acudiente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    correo_electronico VARCHAR(100),
    parentesco VARCHAR(30) 
);


CREATE TABLE alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    documento_identidad VARCHAR(20) UNIQUE NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    eps VARCHAR(50) NOT NULL,
    id_categoria INT,
    id_acudiente INT,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE SET NULL,
    FOREIGN KEY (id_acudiente) REFERENCES acudientes(id_acudiente) ON DELETE SET NULL
);


CREATE TABLE asistencia (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT NOT NULL,
    fecha_entrenamiento DATE NOT NULL,
    asistio VARCHAR(2) DEFAULT 'SI', 
    observaciones TEXT,             
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno) ON DELETE CASCADE
);
INSERT INTO categorias (nombre_categoria, edad_minima, edad_maxima, horario) VALUES
('Infantil', 6, 10, 'Martes y Jueves 4:00 PM - 5:30 PM'),
('Juvenil', 11, 16, 'Miercoles y Viernes 4:00 PM - 5:30 PM'),
('Elite (SENA/Comfenalco)', 17, 25, 'Lunes y Sábados 5:00 PM / 6:00 AM');