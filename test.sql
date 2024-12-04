CREATE DATABASE IF NOT EXISTS test;

USE test;

CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    email VARCHAR(100)
);

DELIMITER $$

CREATE PROCEDURE crear_email(
    IN nombre VARCHAR(50),
    IN apellido1 VARCHAR(50),
    IN apellido2 VARCHAR(50),
    IN dominio VARCHAR(50),
    OUT email VARCHAR(100)
)
BEGIN
    SET email = LOWER(CONCAT(
        LEFT(nombre, 1),
        LEFT(apellido1, 3),
        LEFT(apellido2, 3),
        '@',
        dominio
    ));
END$$

DELIMITER ;

CALL crear_email('Juan', 'Perez', 'Lopez', 'test.com', @resultado);
SELECT @resultado;


