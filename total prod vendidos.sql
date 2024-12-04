use jardineria;
describe producto;

DELIMITER $$

CREATE FUNCTION cantidad_total_de_productos_vendidos(codigo_producto VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_productos INT;
    SELECT SUM(cantidad)
    INTO total_productos
    FROM detalle_pedido
    WHERE codigo_producto = codigo_producto;

    RETURN IFNULL(total_productos, 0);
END$$

DELIMITER ;

SELECT cantidad_total_de_productos_vendidos('FR-67') AS total_vendido;


