DELIMITER $$

CREATE FUNCTION obtener_mes(mes INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE nombre_mes VARCHAR(20);
    
    CASE mes
        WHEN 1 THEN SET nombre_mes = 'Enero';
        WHEN 2 THEN SET nombre_mes = 'Febrero';
        WHEN 3 THEN SET nombre_mes = 'Marzo';
        WHEN 4 THEN SET nombre_mes = 'Abril';
        WHEN 5 THEN SET nombre_mes = 'Mayo';
        WHEN 6 THEN SET nombre_mes = 'Junio';
        WHEN 7 THEN SET nombre_mes = 'Julio';
        WHEN 8 THEN SET nombre_mes = 'Agosto';
        WHEN 9 THEN SET nombre_mes = 'Septiembre';
        WHEN 10 THEN SET nombre_mes = 'Octubre';
        WHEN 11 THEN SET nombre_mes = 'Noviembre';
        WHEN 12 THEN SET nombre_mes = 'Diciembre';
        ELSE SET nombre_mes = 'Mes inválido';
    END CASE;
    
    RETURN nombre_mes;
END $$

DELIMITER ;

SELECT obtener_mes(1) AS Mes;
SELECT obtener_mes(13) AS Mes;
