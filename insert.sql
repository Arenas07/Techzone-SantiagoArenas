
INSERT INTO Clientes (nombre, apellidos, correo, telefono) VALUES
('Atrian', 'ruis', 'trainercampus@gmail.com', '3012658420'),
('Yohlver', 'Pardo', 'johlverjava@gmail.com', '3042957304'),
('Santiago', 'Arenas Ardila', 'santiagoarenasardila@gmail.com', '3059543690'),
('John', 'Doe', 'johndoecorreo@gmail.com', '3025849203'),
('Maria', 'Carreño', 'mariacarreñoamante@gmail.com', '307123456'),
('Don', 'Bigotes', 'bigotesllamadores@gmail.com', '3012968456'),
('Pana', 'Choi', 'panachoimicompa@gmail.com', '3120987654'),
('Charmander', 'emilio', 'ejecutivosena@gmail.com', '3157676767');

INSERT INTO Proveedores(nombre, correo, telefono) VALUES
('Motorola', 'motorolaejecutivo@gmail.com', '3092859345'),
('Samsung', 'samsungcorporation@gmail.com', '3129885457'),
('Hp', 'hpcomputadoresoficial@gmail.com', '3872464367'),
('RealFit', 'realfitauriculares@gmail.com', '3096534981'),
('Amd', 'procesadoresymas@gmail.com', '3924567890'),
('Intel', 'corporationintel@gmail.com', '3123456789'),
('Compumax', 'tecladoscompumax@gmail.com', '3849532567');

INSERT INTO Categorias(nombre) VALUES
('Celulares'),
('Computadores'),
('Procesadores'),
('Auriculares'),
('Teclados');

INSERT INTO Productos(proveedor_id, categoria_id, nombre, precio, stock) VALUES
(1, 1, 'Motorola G8', 600000.00, 15),
(2, 1, 'Samsung Galaxy', 1100000.00, 20),
(3, 2, 'Hp calidium', 2200000.00, 13),
(4, 4, 'Auriculares realfit', 60000.00, 30),
(5, 3, 'Ryzen 5', 1200000.00, 17),
(6, 3, 'Intel core i5', 1300000.00, 15),
(7, 5, 'Teclado compumax', 120000.00, 40);

INSERT INTO Ventas(producto_id, cliente_id, cantidad, fecha_venta, total) VALUES
(1, 1, 1, '2025-08-17', 600000.00),
(2, 1, 3, '2025-08-17', 3300000.00),
(3, 2, 1, '2025-08-13', 2200000.00),
(4, 3, 1, '2025-08-14', 60000.00),
(5, 4, 1, '2025-07-28', 1200000.00),
(6, 5, 5, '2025-07-30', 6500000.00),
(7, 6, 3, '2025-07-21', 360000.00),
(7, 1, 1, '2025-07-24', 120000.00);



-- INSERTS ADICIONALES PARA COMPROBAR LAS QUERIES

INSERT INTO Productos(proveedor_id, categoria_id, nombre, precio, stock) VALUES
(2, 1, 'Samsung j2', 120000.00, 2);

INSERT INTO Clientes (nombre, apellidos, correo, telefono) VALUES
('No comprador', 'No compro nada', 'tacañodeprimera@gmail.com', '3014568420');

INSERT INTO Ventas(producto_id, cliente_id, cantidad, fecha_venta, total) VALUES
(1, 9, 1, '2024-01-01', 600000.00);