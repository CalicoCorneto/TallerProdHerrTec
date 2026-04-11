CREATE DATABASE IF NOT EXISTS gimnasio_db;
USE gimnasio_db;

-- Tabla de Usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    rol VARCHAR(20) DEFAULT 'recepcionista'
);

-- Tabla de Socios
CREATE TABLE socios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    fecha_registro DATE,
    fecha_vencimiento DATE,
    estado ENUM('ACTIVO', 'VENCIDO') DEFAULT 'ACTIVO'
);

-- Insertar un usuario de prueba (Password: admin123)
-- Nota: En un sistema real usaríamos BCrypt, por ahora es texto plano para probar conexión
INSERT INTO usuarios (username, password, rol) VALUES ('admin', 'admin123', 'admin');