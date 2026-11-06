CREATE DATABASE IF NOT EXISTS nexocomercial_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE nexocomercial_db;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    rol ENUM('admin', 'operador', 'auditor') NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    precio DECIMAL(10,2) NOT NULL CHECK (precio > 0)
) ENGINE=InnoDB;

CREATE TABLE movimientos (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    id_usuario INT NOT NULL,
    tipo ENUM('ENTRADA', 'SALIDA') NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_mov_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON DELETE RESTRICT,
    CONSTRAINT fk_mov_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE RESTRICT
) ENGINE=InnoDB;
