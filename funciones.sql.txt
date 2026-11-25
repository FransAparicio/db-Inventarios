DELIMITER //

CREATE FUNCTION obtener_stock_producto(p_producto_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE total INT DEFAULT 0;

    SELECT SUM(cantidad_actual) INTO total
    FROM inventarios
    WHERE producto_id = p_producto_id;

    RETURN total;

END //

DELIMITER ;