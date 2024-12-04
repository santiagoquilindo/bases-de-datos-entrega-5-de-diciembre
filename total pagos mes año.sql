total pagos mes año

use jardineria;
describe pago;

DELIMITER $$

CREATE FUNCTION obtener_total_pagos_mes_año(mes INT, anio INT)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE total_pagos DECIMAL(15,2);

    SELECT SUM(total)
    INTO total_pagos
    FROM pago
    WHERE MONTH(fecha_pago) = mes
      AND YEAR(fecha_pago) = anio;

    RETURN IFNULL(total_pagos, 0);
END$$

DELIMITER ;

SELECT obtener_total_pagos_mes_año(1, 2009) AS total_pagos_enero_2009;



