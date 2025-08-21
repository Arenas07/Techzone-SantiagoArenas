-- Active: 1755088819527@@127.0.0.1@5433@techzone


CREATE TABLE Clientes(
    id INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL
);


CREATE TABLE Proveedores(
    id INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL
);

CREATE TABLE Categorias(
    id INTEGER NOT NULL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Productos(
    id INTEGER NOT NULL PRIMARY KEY,
    proveedor_id INTEGER NOT NULL,
    categoria_id INTEGER NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(8, 2) NOT NULL,
    stock INTEGER NOT NULL,
    CONSTRAINT productos_stock_chk CHECK (stock >= 0),
    CONSTRAINT productos_precio_chk CHECK (precio >= 0),
    CONSTRAINT productos_fk_categoria FOREIGN KEY (categoria_id)
        REFERENCES Categorias(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT productos_fk_proveedor FOREIGN KEY (proveedor_id)
        REFERENCES Proveedores(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE 

);

CREATE TABLE Ventas(
    producto_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    fecha_venta DATE NOT NULL,
    total DECIMAL(16, 2) NOT NULL,
    CONSTRAINT ventas_total_chk CHECK (total >= 0),
    CONSTRAINT ventas_cantidad_chk CHECK (cantidad >= 0),
    CONSTRAINT ventas_fk_producto FOREIGN KEY (producto_id)
        REFERENCES Productos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT ventas_fk_cliente FOREIGN KEY (cliente_id)
        REFERENCES Clientes(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE 
);
