use jardineria;

CREATE TABLE notificaciones (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME NOT NULL,
    total DECIMAL(15, 2) NOT NULL,
    codigo_cliente INT NOT NULL
);

DELIMITER $$

CREATE TRIGGER trigger_notificar_pago
AFTER INSERT ON pago
FOR EACH ROW
BEGIN
    INSERT INTO notificaciones (fecha_hora, total, codigo_cliente)
    VALUES (NEW.fecha_pago, NEW.total, NEW.codigo_cliente);
END$$

DELIMITER ;

INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total)
VALUES (1, 'PayPal', 'txn001', NOW(), 5000);

SELECT * FROM notificaciones;

