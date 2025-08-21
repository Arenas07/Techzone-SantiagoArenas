
-- - Un procedimiento almacenado para registrar una venta.

CREATE OR REPLACE PROCEDURE pr_registro_venta(producto_id INT, cliente_id INT, cantidad INT, total DECIMAL)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO Ventas(producto_id, cliente_id, cantidad, fecha_venta, total) VALUES(producto_id, cliente_id, cantidad, CURRENT_DATE, total);
END;
$$;

CALL pr_registro_venta(1, 1, 1, 600000.00);

SELECT * FROM Ventas;

-- Funciona

-- - Implementación de validaciones haciendo uso de RAISE para: Validar que el cliente exista.


CREATE OR REPLACE PROCEDURE pr_cliente_existe(id_cliente INT)
LANGUAGE plpgsql AS 
$$
DECLARE _id INT;
BEGIN

    SELECT cl.id INTO _id 
    FROM Clientes cl
    WHERE id = id_cliente;

    IF _id IS NOT NULL THEN
        RAISE NOTICE 'El cliente existe con el id: % ', id_cliente;
    ELSE
    
        RAISE EXCEPTION 'El usuario no existe';
    END IF;
END;
$$;

CALL pr_cliente_existe(1)


-- Implementación de validaciones haciendo uso de RAISE para: 

--Verificar que el stock sea suficiente antes de procesar la venta.

-- Si no hay stock suficiente, se hace un RAISE para notificar y cancelar la venta.

DROP PROCEDURE IF EXISTS pr_stock_venta;
CREATE OR REPLACE PROCEDURE pr_stock_venta(producto_id_venta INT, cliente_id_venta INT, cantidad_venta INT, total DECIMAL )
LANGUAGE plpgsql AS 
$$
DECLARE _stock INT;
BEGIN

    SELECT stock INTO _stock
    FROM Productos
    WHERE id = producto_id_venta;

    IF _stock >= cantidad_venta THEN
    
        INSERT INTO Ventas(producto_id, cliente_id, cantidad,   fecha_venta, total) VALUES
        (producto_id_venta, cliente_id_venta, cantidad_venta, CURRENT_DATE, total);

        UPDATE Productos
        SET stock = stock - cantidad_venta
        WHERE id = producto_id_venta;

    ELSE 
        RAISE EXCEPTION 'No hay stock suficiente';
    END IF;

END;
$$;

SELECT *
FROM Productos;
CALL pr_stock_venta(1, 1, 15, 600000.00);

