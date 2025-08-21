# PostgreSQL con Docker

## Creacion del contenedor

```bash

docker run -d --name postgres_container -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=campus -p 5433:5432 -v pgdata:/var/lib/postgresql/data --restart=unless-stopped postgres:15

```

## Conectar al contenedor

```bash

docker exec -it postgres_container bash

```

## Conectar postgres bajo consola

Conexión desde linux:

```bash
psql -h localhost -U admin -d campus -W 
```

Conexión desde Windows con usuario por defecto:

```bash
psql ... -U postgres ...
```

## Comandos PSQL

- `\l`: Lista las bases de datos
- `\c {db_name}`: Cambiar a una base de datos existente
- `\d`: Describe las tablas de la base de datos actual
- `\d {table_name}` Describe la tabla
- `\dt`: Listado de las tablas de la base de datos actual
- `\ds`: Secuencias que se crean con el tipo de datos `serial`
- `\di`: Listar los indices
- `\dp \z`: Listado de privilegios de las tablas

## Tipos de datos

### Enumeradores 

```pgsql

CREATE TYPE sexo AS ENUM('Masculino', 'Femenino', 'Otro');

CREATE TABLE campers(
    name varchar(100) NOT NULL,
    sexo_camper sexo NOT NULL 
)
```

# Tipos de Datos en PostgreSQL

## Tipos de Datos Numéricos

| **Name**         | **Storage Size** | **Description**                 | **Range**                                                                                |
| ---------------- | ---------------- | ------------------------------- | ---------------------------------------------------------------------------------------- |
| smallint         | 2 bytes          | Small-range integer             | -32768 to +32767                                                                         |
| integer          | 4 bytes          | Typical choice for integer      | -2147483648 to +2147483647                                                               |
| bigint           | 8 bytes          | Large-range integer             | -9223372036854775808 to +9223372036854775807                                             |
| decimal          | variable         | User-specified precision, exact | Up to 131072 digits before the decimal point; up to 16383 digits after the decimal point |
| numeric          | variable         | User-specified precision, exact | Up to 131072 digits before the decimal point; up to 16383 digits after the decimal point |
| real             | 4 bytes          | Variable-precision, inexact     | 6 decimal digits precision                                                               |
| double precision | 8 bytes          | Variable-precision, inexact     | 15 decimal digits precision                                                              |
| smallserial      | 2 bytes          | Small autoincrementing integer  | 1 to 32767                                                                               |
| serial           | 4 bytes          | Autoincrementing integer        | 1 to 2147483647                                                                          |
| bigserial        | 8 bytes          | Large autoincrementing integer  | 1 to 9223372036854775807                                                                 |

## Tipos de Datos de Caracteres

| **Name**                               | **Description**                          |
| -------------------------------------- | ---------------------------------------- |
| character varying(*n*), varchar(*n*)   | Variable-length with limit               |
| character(*n*), char(*n*), bpchar(*n*) | Fixed-length, blank-padded               |
| bpchar                                 | Variable unlimited length, blank-trimmed |
| text                                   | Variable unlimited length                |

## Tipos de Datos Booleanos

| **Name** | **Storage Size** | **Description**        |
| -------- | ---------------- | ---------------------- |
| boolean  | 1 byte           | State of true or false |

## Tipos de Datos de Fecha y Hora

| **Name**                                | **Storage Size** | **Description**                       | **Low Value**    | **High Value**  | **Resolution** |
| --------------------------------------- | ---------------- | ------------------------------------- | ---------------- | --------------- | -------------- |
| timestamp \[(*p*)] \[without time zone] | 8 bytes          | Both date and time (no time zone)     | 4713 BC          | 294276 AD       | 1 microsecond  |
| timestamp \[(*p*)] with time zone       | 8 bytes          | Both date and time, with time zone    | 4713 BC          | 294276 AD       | 1 microsecond  |
| date                                    | 4 bytes          | Date (no time of day)                 | 4713 BC          | 5874897 AD      | 1 day          |
| time \[(*p*)] \[without time zone]      | 8 bytes          | Time of day (no date)                 | 00:00:00         | 24:00:00        | 1 microsecond  |
| time \[(*p*)] with time zone            | 12 bytes         | Time of day (no date), with time zone | 00:00:00+1559    | 24:00:00-1559   | 1 microsecond  |
| interval \[*fields*] \[(*p*)]           | 16 bytes         | Time interval                         | -178000000 years | 178000000 years | 1 microsecond  |

## Tipos de Datos Monetarios

| **Name** | **Storage Size** | **Description** | **Range**                                      |
| -------- | ---------------- | --------------- | ---------------------------------------------- |
| money    | 8 bytes          | Currency amount | -92233720368547758.08 to +92233720368547758.07 |

## Tipos de Datos Binarios

Las cadenas binarias permiten almacenar octetos con valor cero y otros octetos "no imprimibles" (fuera del rango decimal de 32 a 126). Son apropiadas para almacenar datos "bytes en bruto".

| **Name** | **Storage Size**                           | **Description**               |
| -------- | ------------------------------------------ | ----------------------------- |
| bytea    | 1 or 4 bytes plus the actual binary string | Variable-length binary string |

## Tipos de Datos de Redes

| **Name** | **Storage Size** | **Description**                  |
| -------- | ---------------- | -------------------------------- |
| cidr     | 7 or 19 bytes    | IPv4 and IPv6 networks           |
| inet     | 7 or 19 bytes    | IPv4 and IPv6 hosts and networks |
| macaddr  | 6 bytes          | MAC addresses                    |
| macaddr8 | 8 bytes          | MAC addresses (EUI-64 format)    |

## Tipos de Datos Geométricos

| **Name** | **Storage Size** | **Description**                  | **Representation**                  |
| -------- | ---------------- | -------------------------------- | ----------------------------------- |
| point    | 16 bytes         | Point on a plane                 | (x,y)                               |
| line     | 32 bytes         | Infinite line                    | {A,B,C}                             |
| lseg     | 32 bytes         | Finite line segment              | ((x1,y1),(x2,y2))                   |
| box      | 32 bytes         | Rectangular box                  | ((x1,y1),(x2,y2))                   |
| path     | 16+16n bytes     | Closed path (similar to polygon) | ((x1,y1),...)                       |
| path     | 16+16n bytes     | Open path                        | \[(x1,y1),...]                      |
| polygon  | 40+16n bytes     | Polygon (similar to closed path) | ((x1,y1),...)                       |
| circle   | 24 bytes         | Circle                           | <(x,y),r> (center point and radius) |

## Tipos de Datos JSON y XML

| **Name** | **Description**               |
| -------- | ----------------------------- |
| json     | Datos en formato JSON         |
| jsonb    | Datos JSON en formato binario |
| xml      | Datos en formato XML          |

## Tipos de Datos Especiales

| **Name**  | **Description**                         |
| --------- | --------------------------------------- |
| uuid      | Identificador único universal           |
| array     | Arreglos de cualquier tipo de datos     |
| composite | Tipo compuesto de varios tipos de datos |
| range     | Rango de valores                        |

---

## Ejemplo General de Tipos de Datos

```sql

CREATE TABLE ejemplo(
    id serial PRIMARY KEY,
    nombre varchar(100) NOT NULL,
    descripcion text NULL,
    precio numeric(10, 2) NOT NULL,
    en_stock boolean NOT NULL,
    fecha_creacion date NOT NULL,
    hora_creacion time NOT NULL,
    fecha_hora timestamp NOT NULL,
    fecha_hora_zona timestamp with time zone,
    duracion interval,
    direccion_ip inet,
    direccion_mac macaddr,
    punto_geometrico point,
    datos_json json,
    datons_jsonb jsonb,
    identificador_unico uuid,
    cantidad_monetario money,
    rangos int4range,
    colores_preferidos varchar(20)[]
);
```

### Insert para `Ejemplo`

```SQL

INSERT INTO ejemplo(
    nombre,
    descripcion,
    precio,
    en_stock,
    fecha_creacion,
    hora_creacion,
    fecha_hora,
    fecha_hora_zona,
    duracion,
    direccion_ip, 
    direccion_mac, 
    punto_geometrico, 
    datos_json,
    datons_jsonb, 
    identificador_unico, 
    cantidad_monetario,
    rangos,
    colores_preferidos 
) VALUES (
    'Ejemplo A', 'Lorem ipsum.......', 9990.00, true, '2025-07-10', '20:30:10', '2025-07-10 20:30:10', '2025-07-10 20:30:10-05', '1 day', '192.168.0.1', '08:00:27:00:00:00', '(10, 20)', '{"key":"value"}', '{"key":"value"}', '7be95d0e-e4c9-4e29-9520-678f569b7288', '100.00', int4range(10, 20), ARRAY['rojo', 'verde', 'azul', 'otro']
);

```

## Definicion de Contraints (Restricciones)ç

### Tabla de Ejemplo

```SQL

CREATE TABLE departamentos(
    id int NOT NULL PRIMARY KEY,
    nombre varchar(100) NOT NULL
);

CREATE TABLE empleado(
    id serial,
    nombre varchar(100) NOT NULL,
    edad integer NOT NULL,
    salario numeric(10,2) NOT NULL,
    fecha_contrato date,
    vigente boolean DEFAULT true
);

ALTER TABLE empleado ADD COLUMN departamento_id integer NOT NULL;

```

## Constraints a Tablas Existentes

### Primary key

```sql
ALTER TABLE empleado ADD PRIMARY KEY(id);
```

### Foreign key

```sql
ALTER TABLE empleado ADD CONSTRAINT fk_departamento FOREIGN KEY(departamento_id) REFERENCES departamentos(id);
```

### Unique

```sql
ALTER TABLE departamentos ADD CONSTRAINT uq_nombre UNIQUE (nombre);
```
### Check

```sql
ALTER TABLE empleado ADD CONSTRAINT ck_edad CHECK (edad > 18);
```

### Default

```sql
ALTER TABLE empleado ALTER COLUMN salario SET DEFAULT 400.00;
```

## Taller de Constraints

```sql

CREATE TABLE country (
    id serial,
    name varchar(50)
);

CREATE TABLE region (
    id serial,
    name varchar(50),
    idcountry integer
);

CREATE TABLE city (
    id serial,
    name varchar(50),
    idregion integer
);

ALTER TABLE country ADD PRIMARY KEY(id);
ALTER TABLE region ADD PRIMARY KEY(id);
ALTER TABLE city ADD PRIMARY KEY(id);

ALTER TABLE region ADD CONSTRAINT fk_idcountry FOREIGN KEY(idcountry) REFERENCES country(id);
ALTER TABLE city ADD CONSTRAINT fk_idregion FOREIGN KEY(idregion) REFERENCES region(id);

ALTER TABLE country ALTER COLUMN id SET NOT NULL;
ALTER TABLE country ALTER COLUMN name SET NOT NULL;
ALTER TABLE region ALTER COLUMN id SET NOT NULL;
ALTER TABLE region ALTER COLUMN name SET NOT NULL;
ALTER TABLE region ALTER COLUMN idcountry SET NOT NULL;
ALTER TABLE city ALTER COLUMN id SET NOT NULL;
ALTER TABLE city ALTER COLUMN name SET NOT NULL;
ALTER TABLE city ALTER COLUMN idregion SET NOT NULL;



```

## Funciones mas ejemplos


## 🔢 SUM()

Suma los valores de una columna numérica.

```sql
SELECT SUM(monto) AS total_ventas
FROM ventas;
```


---

##  USING()

Se usa en un `JOIN` cuando ambas tablas tienen una columna con el mismo nombre.

```sql
SELECT *
FROM clientes
JOIN pedidos USING (id_cliente);
```


---

## PERCENTILE\_CONT(...) WITHIN GROUP

Calcula percentiles de un conjunto de datos.

```sql
SELECT 
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY monto) AS mediana
FROM ventas;
```

---

## AVG()

Devuelve el promedio.

```sql
SELECT AVG(salario) AS salario_promedio
FROM empleados;
```

---
## ROUND()

Redondea un número a cierta cantidad de decimales.

```sql
SELECT ROUND(AVG(salario), 2) AS promedio_redondeado
FROM empleados;
```

---

##  RANK() OVER (ORDER BY SUM(...) DESC)

Asigna un ranking a cada fila según un criterio.
```sql
SELECT id_cliente, SUM(monto) AS total,
       RANK() OVER (ORDER BY SUM(monto) DESC) AS ranking
FROM ventas
GROUP BY id_cliente;
```

---

## COUNT(DISTINCT ...)

Cuenta valores únicos.

```sql
SELECT COUNT(DISTINCT id_cliente) AS clientes_unicos
FROM ventas;
```

---

## CTE (WITH)

Un CTE (Common Table Expression) es una subconsulta con nombre.

```sql
WITH total_por_cliente AS (
  SELECT id_cliente, SUM(monto) AS total
  FROM ventas
  GROUP BY id_cliente
)
SELECT *
FROM total_por_cliente
WHERE total > 5000;
```

---

## Conversión de fecha (`fecha ::date`)

Convierte un `timestamp` a solo la fecha.

```sql
SELECT fecha_compra::date AS fecha
FROM ventas;
```

---

## ILIKE

Búsqueda **insensible a mayúsculas**.

```sql
SELECT *
FROM productos
WHERE nombre ILIKE 'caf%';
```

---

## TO\_CHAR(numeric, 'FM999G999G999D00')

Formatea números con separadores y decimales.

```sql
SELECT TO_CHAR(1234567.5, 'FM999G999G999D00') AS formato;
-- Resultado: '1,234,567.50'
```

---

## CASE

Permite condiciones dentro de una consulta.

```sql
SELECT nombre,
       CASE 
         WHEN edad < 18 THEN 'Menor de edad'
         ELSE 'Adulto'
       END AS categoria
FROM personas;
```

---

## DISTINCT ON (id\_cliente)

Devuelve la primera fila de cada grupo según un criterio.

```sql
SELECT DISTINCT ON (id_cliente) id_cliente, fecha, monto
FROM ventas
ORDER BY id_cliente, fecha DESC;
```

---

## ROW\_NUMBER() OVER (PARTITION BY ... ORDER BY ...)

Numera las filas en un grupo.

```sql
SELECT id_cliente, fecha, monto,
       ROW_NUMBER() OVER (PARTITION BY id_cliente ORDER BY fecha DESC) AS num
FROM ventas;
```

---

## TRIM()

Quita espacios en blanco al inicio y fin de un texto.

```sql
SELECT TRIM('   café   ') AS limpio;
-- Resultado: 'café'
```

---

## INITCAP()

Convierte la primera letra de cada palabra a mayúscula.

```sql
SELECT INITCAP('cafe de colombia') AS bonito;
-- Resultado: 'Cafe De Colombia'
```

---

## DATE\_TRUNC('month', fecha)

Redondea una fecha a un período (mes, día, año, etc.).

```sql
SELECT DATE_TRUNC('month', fecha) AS mes, SUM(monto)
FROM ventas
GROUP BY mes;
```

---

## REFRESH MATERIALIZED VIEW

Actualiza una **vista materializada** (almacena datos físicamente).

```sql
CREATE MATERIALIZED VIEW ventas_por_cliente AS
SELECT id_cliente, SUM(monto) AS total_compras, COUNT(*) AS num_compras
FROM ventas
GROUP BY id_cliente;

REFRESH MATERIALIZED VIEW ventas_resumen;
```

---

## INSERT ... ON CONFLICT (...) DO UPDATE

Evita duplicados actualizando si ya existe.

```sql
INSERT INTO productos (id, nombre, stock)
VALUES (1, 'Café', 50)
ON CONFLICT (id)
DO UPDATE SET stock = EXCLUDED.stock + productos.stock;
```

---

## GREATEST()

Devuelve el mayor valor entre varios.

```sql
SELECT GREATEST(10, 20, 5, 30) AS maximo;
```

---

## Creación de una base de datos correcta 

Todas las variantes para crear tablas

```sql
-- CASCADE
CREATE TABLE pagos (
    id_pago SERIAL PRIMARY KEY,
    id_cliente INT,
    monto DECIMAL(10,2),
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- SET NULL
CREATE TABLE direcciones (
    id_direccion SERIAL PRIMARY KEY,
    id_cliente INT,
    direccion TEXT,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- SET DEFAULT (requiere DEFAULT en la columna)
CREATE TABLE facturas (
    id_factura SERIAL PRIMARY KEY,
    id_cliente INT DEFAULT 1,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE SET DEFAULT
        ON UPDATE CASCADE
);

-- RESTRICT
CREATE TABLE soporte (
    id_ticket SERIAL PRIMARY KEY,
    id_cliente INT,
    descripcion TEXT,
    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

``` 

## Cosas importantes


## Funciones (`FUNCTION`)

###  Sintaxis

```sql
CREATE OR REPLACE FUNCTION nombre_funcion(param1 tipo, param2 tipo)
RETURNS tipo_retorno LANGUAGE plpgsql AS $$
BEGIN
    -- lógica de la función
    RETURN algo;
END;
$$;
```

### Ejemplo

Calcular el IVA de un monto:

```sql
CREATE OR REPLACE FUNCTION calcular_iva(precio NUMERIC, tasa NUMERIC DEFAULT 0.19)
RETURNS NUMERIC AS $$
BEGIN
    RETURN precio * tasa;
END;
$$ LANGUAGE plpgsql;

-- Uso:
SELECT calcular_iva(10000);
```


## 2. Procedimientos (`PROCEDURE`)

Un procedimiento **no devuelve valores** pero puede ejecutar acciones como `INSERT`, `UPDATE`, `DELETE`. Se invocan con `CALL`.

### ✅ Sintaxis

```sql
CREATE OR REPLACE PROCEDURE nombre_procedimiento(param tipo)
LANGUAGE plpgsql AS $$
BEGIN
    -- lógica del procedimiento
END;
$$;
```

### Ejemplo

Insertar un cliente nuevo:

```sql
CREATE OR REPLACE PROCEDURE insertar_cliente(nombre TEXT, correo TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO clientes(nombre, correo) VALUES(nombre, correo);
END;
$$;

-- Uso:
CALL insertar_cliente('Juan Pérez', 'juan@test.com');
```

---

## 🔹 3. Triggers (`TRIGGER`)

Un trigger se ejecuta **automáticamente** cuando ocurre un evento (`INSERT`, `UPDATE`, `DELETE`) en una tabla.

### Sintaxis

1. Crear una **función de trigger** (debe retornar `TRIGGER`).
2. Crear el **trigger** asociado a la tabla.

---

### Ejemplo: Auditar cambios

Queremos guardar en una tabla de auditoría cada vez que se actualiza un cliente.

```sql
-- 1. Tabla de auditoría
CREATE TABLE auditoria_clientes (
    id_auditoria SERIAL PRIMARY KEY,
    id_cliente INT,
    nombre_anterior TEXT,
    nombre_nuevo TEXT,
    fecha TIMESTAMP DEFAULT now()
);

-- 2. Función de trigger
CREATE OR REPLACE FUNCTION auditar_clientes()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO auditoria_clientes(id_cliente, nombre_anterior, nombre_nuevo)
    VALUES (OLD.id_cliente, OLD.nombre, NEW.nombre);
    RETURN NEW;
END;
$$;

-- 3. Crear el trigger
CREATE TRIGGER trg_auditar_clientes
AFTER UPDATE ON clientes
FOR EACH ROW
EXECUTE FUNCTION auditar_clientes();
```


```sql
UPDATE clientes SET nombre = 'Carlos Gómez' WHERE id_cliente = 1;
```

Se inserta un registro en `auditoria_clientes` con el nombre anterior y el nuevo.



