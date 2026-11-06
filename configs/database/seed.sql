USE nexocomercial_db;

INSERT INTO usuarios (nombre, rol) VALUES
('Ana Lopez', 'admin'), ('Carlos Ruiz', 'operador'), ('Elena Gomez', 'operador'),
('Diego Torres', 'auditor'), ('Sofia Mendez', 'operador');

INSERT INTO productos (sku, nombre, stock, precio) VALUES
('NX-001', 'Scanner Barcode USB', 25, 450.00), ('NX-002', 'Impresora Termica 80mm', 12, 1850.00),
('NX-003', 'Rollo Etiqueta Adhesiva', 100, 85.50), ('NX-004', 'Switch Gigabit 8 Puertos', 15, 620.00),
('NX-005', 'Patch Cord Cat6 2m', 80, 45.00), ('NX-006', 'NoBreak UPS 1000VA', 10, 2100.00),
('NX-007', 'Monitor LED 24 Pulgadas', 18, 2400.00), ('NX-008', 'Teclado Uso Rudo USB', 30, 220.00),
('NX-009', 'Mouse Optico Alambrico', 35, 110.00), ('NX-010', 'Bascula Digital 40kg', 8, 1650.00),
('NX-011', 'Cajon de Dinero RJ11', 14, 980.00), ('NX-012', 'Lector RFID Escritorio', 9, 1300.00),
('NX-013', 'Tarjeta RFID Mifare Paq10', 50, 150.00), ('NX-014', 'Servidor NAS 2 Bahias', 4, 5400.00),
('NX-015', 'Disco Duro NAS 4TB', 8, 2600.00), ('NX-016', 'Punto de Acceso WiFi 6', 11, 1950.00),
('NX-017', 'Bobina Cable UTP Cat6', 6, 1750.00), ('NX-018', 'Pinza Crimpadora RJ45', 15, 320.00),
('NX-019', 'Tester de Red RJ45', 20, 190.00), ('NX-020', 'Regulador Voltaje 1200VA', 22, 480.00);

INSERT INTO movimientos (id_producto, id_usuario, tipo, cantidad) VALUES
(1,1,'ENTRADA',10),(2,2,'ENTRADA',5),(3,3,'SALIDA',15),(4,2,'ENTRADA',4),(5,5,'SALIDA',20),
(6,1,'ENTRADA',3),(7,2,'SALIDA',2),(8,3,'ENTRADA',10),(9,5,'SALIDA',5),(10,1,'ENTRADA',2),
(11,2,'SALIDA',1),(12,3,'ENTRADA',3),(13,5,'SALIDA',10),(14,1,'ENTRADA',1),(15,2,'ENTRADA',4),
(16,3,'SALIDA',2),(17,5,'ENTRADA',2),(18,1,'SALIDA',3),(19,2,'ENTRADA',5),(20,3,'SALIDA',4),
(1,5,'SALIDA',2),(2,1,'SALIDA',1),(3,2,'ENTRADA',30),(4,3,'SALIDA',2),(5,5,'ENTRADA',25),
(6,1,'SALIDA',1),(7,2,'ENTRADA',6),(8,3,'SALIDA',4),(9,5,'ENTRADA',8),(10,1,'SALIDA',1);
