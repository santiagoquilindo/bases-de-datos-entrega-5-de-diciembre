-- Usa la base de datos existente
USE procedimientos;

-- Crear las tablas pares e impares
CREATE TABLE IF NOT EXISTS pares (
    numero INT UNSIGNED
);

CREATE TABLE IF NOT EXISTS impares (
    numero INT UNSIGNED
);

DELIMITER $$

-- Crear el procedimiento almacenado para calcular pares e impares
CREATE PROCEDURE calcular_pares_impares(IN tope INT UNSIGNED)
BEGIN
    DECLARE contador INT DEFAULT 1;
    
    -- Limpiar las tablas antes de insertar nuevos valores
    TRUNCATE TABLE pares;
    TRUNCATE TABLE impares;
    
    -- Usar un bucle WHILE para calcular pares e impares
    WHILE contador <= tope DO
        IF contador % 2 = 0 THEN
            -- Si el número es par, lo insertamos en la tabla pares
            INSERT INTO pares (numero) VALUES (contador);
        ELSE
            -- Si el número es impar, lo insertamos en la tabla impares
            INSERT INTO impares (numero) VALUES (contador);
        END IF;
        SET contador = contador + 1;
    END WHILE;
END $$

DELIMITER ;

-- Llamar al procedimiento con un tope de 10
CALL calcular_pares_impares(10);

-- Consultar las tablas resultantes
SELECT * FROM pares;
SELECT * FROM impares;
