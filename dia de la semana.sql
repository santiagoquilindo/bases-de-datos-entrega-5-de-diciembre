DROP PROCEDURE IF EXISTS dia_de_la_semana;
DELIMITER $$

CREATE PROCEDURE dia_de_la_semana(IN dia INT, OUT nombre_dia VARCHAR(10))
BEGIN
    IF dia = 1 THEN
        SET nombre_dia = 'lunes';
    ELSEIF dia = 2 THEN
        SET nombre_dia = 'martes';
    ELSEIF dia = 3 THEN
        SET nombre_dia = 'miércoles';
    ELSEIF dia = 4 THEN
        SET nombre_dia = 'jueves';
    ELSEIF dia = 5 THEN
        SET nombre_dia = 'viernes';
    ELSEIF dia = 6 THEN
        SET nombre_dia = 'sábado';
    ELSEIF dia = 7 THEN
        SET nombre_dia = 'domingo';
    ELSE
        SET nombre_dia = 'Dia invalido';
    END IF;
END $$

DELIMITER ;

SHOW PROCEDURE STATUS WHERE Name = 'dia_de_la_semana';

CALL dia_de_la_semana(3, @nombre_dia);
SELECT @nombre_dia;
