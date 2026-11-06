-- Creacion de cuenta de aplicacion con privilegios minimos (sustituir <DB_PASSWORD> en ejecucion)
CREATE USER IF NOT EXISTS 'app_nexo'@'localhost' IDENTIFIED BY '<DB_PASSWORD>';
GRANT SELECT, INSERT ON nexocomercial_db.* TO 'app_nexo'@'localhost';
FLUSH PRIVILEGES;

-- 1. Consulta de control de registros
SELECT (SELECT COUNT(*) FROM productos) AS total_productos,
       (SELECT COUNT(*) FROM usuarios) AS total_usuarios,
       (SELECT COUNT(*) FROM movimientos) AS total_movimientos;

-- 2. Operacion PERMITIDA (INSERT con app_nexo)
INSERT INTO movimientos (id_producto, id_usuario, tipo, cantidad) VALUES (1, 2, 'ENTRADA', 5);

-- 3. Operaciones DENEGADAS (DELETE y DROP rechazados por privilegios minimos)
DELETE FROM movimientos WHERE id_movimiento = 1;
DROP TABLE movimientos;
