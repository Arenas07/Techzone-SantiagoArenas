

-- 1️⃣ Listar los productos con stock menor a 5 unidades.

SELECT *
FROM Productos
WHERE stock <= 5;

-- 2️⃣ Calcular ventas totales de un mes específico.

SELECT *
FROM Ventas
WHERE MONTH(fecha_venta) = 7;

-- 3️⃣ Obtener el cliente con más compras realizadas.

SELECT cl.nombre, cl.apellidos, COUNT(v.cliente_id) AS cantidad_compras
FROM Clientes cl
JOIN Ventas v ON v.cliente_id = cl.id
GROUP BY cl.nombre, cl.apellidos
ORDER BY cantidad_compras DESC
LIMIT 1;

-- 4️⃣ Listar los productos más vendidos.

SELECT pr.nombre, SUM(v.cantidad) AS productos_vendidos
FROM Ventas v
JOIN Productos pr ON v.producto_id = pr.id
GROUP BY pr.nombre
ORDER BY productos_vendidos DESC;

-- 5️⃣ Consultar ventas realizadas en un rango de fechas.

SELECT *
FROM Ventas
WHERE fecha_venta BETWEEN '2025-08-14' AND '2025-09-01';


-- 6️⃣ Identificar clientes que no han comprado en los últimos 6 meses.

SELECT *
FROM Clientes cl
JOIN Ventas v ON v.cliente_id = cl.id
WHERE v.fecha_venta > NOW() - INTERVAL '1 months'

SELECT NOW() - INTERVAL '1 months';