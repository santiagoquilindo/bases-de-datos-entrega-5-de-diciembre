use jardineria;
DROP PROCEDURE IF EXISTS calcular_valores_pago;
describe pago;

DELIMITER $$

CREATE PROCEDURE calcular_valores_pago(IN forma_pago VARCHAR(50))
BEGIN
    DECLARE maximo_pago DECIMAL(15, 2);
    DECLARE minimo_pago DECIMAL(15, 2);
    DECLARE valor_medio DECIMAL(15, 2);
    DECLARE suma_pagos DECIMAL(15, 2);
    DECLARE numero_pagos INT;

    -- Calcular el pago máximo
    SELECT MAX(total)
    INTO maximo_pago
    FROM pago
    WHERE forma_pago = forma_pago;

    -- Calcular el pago mínimo
    SELECT MIN(total)
    INTO minimo_pago
    FROM pago
    WHERE forma_pago = forma_pago;

    -- Calcular el valor medio
    SELECT AVG(total)
    INTO valor_medio
    FROM pago
    WHERE forma_pago = forma_pago;

    -- Calcular la suma de los pagos
    SELECT SUM(total)
    INTO suma_pagos
    FROM pago
    WHERE forma_pago = forma_pago;

    -- Calcular el número de pagos
    SELECT COUNT(*)
    INTO numero_pagos
    FROM pago
    WHERE forma_pago = forma_pago;

    -- Mostrar los resultados
    SELECT maximo_pago AS 'Pago Máximo',
           minimo_pago AS 'Pago Mínimo',
           valor_medio AS 'Valor Medio',
           suma_pagos AS 'Suma Total',
           numero_pagos AS 'Número de Pagos';
END$$

DELIMITER ;

CALL calcular_valores_pago('PayPal');
