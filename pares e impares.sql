USE procedimientos;

CREATE TABLE IF NOT EXISTS pares (
    numero INT UNSIGNED
);

CREATE TABLE IF NOT EXISTS impares (
    numero INT UNSIGNED
);

DELIMITER $$

CREATE PROCEDURE calcular_pares_impares(IN tope INT UNSIGNED)
BEGIN
    DECLARE contador INT DEFAULT 1;
    
    TRUNCATE TABLE pares;
    TRUNCATE TABLE impares;
    
    WHILE contador <= tope DO
        IF contador % 2 = 0 THEN
            INSERT INTO pares (numero) VALUES (contador);
        ELSE
            INSERT INTO impares (numero) VALUES (contador);
        END IF;
        SET contador = contador + 1;
    END WHILE;
END $$

DELIMITER ;

CALL calcular_pares_impares(10);
SELECT * FROM pares;
SELECT * FROM impares;
