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


SELECT obtener_stock_producto(1);


SELECT id, nombre, obtener_stock_producto(id) AS stock_total
FROM productos;

CREAR una funcion que reciba una cantidad y devuelva SIN_STOCK, STOCK_BAJO, STOCK DISPONIBLE

DELIMITER //

CREATE FUNCTION estado_stock(p_cantidad INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN

    DECLARE resultado VARCHAR(30);

    IF p_cantidad = 0 THEN
        SET resultado = 'SIN STOCK';
    
    ELSEIF p_cantidad <= 10 THEN
        SET resultado = 'STOCK BAJO';
    ELSE
        SET resultado = 'STOCK DISPONIBLE';
    END IF;

    RETURN resultado;

END //

DELIMITER ;

-----------------------------------------------
DELIMITER //

CREATE PROCEDURE registrar_salida_inventario(
    IN p_producto_id INT, IN p_almacen_id INT, IN p_cantidad INT
)
BEGIN
    DECLARE v_stock INT DEFAULT NULL;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        IF p_cantidad <= 0 THEN
            signal SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cantidad invalida';
        END IF;

        SELECT cantidad_actual INTO v_stock
        FROM inventarios
        WHERE producto_id = p_producto_id
            AND almacen_id = p_almacen_id
        FOR UPDATE;

        IF v_stock IS NULL OR v_stock < p_cantidad THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'stock insuficiente';
        END IF;

        UPDATE inventarios 
        SET cantidad_actual = cantidad_actual - p_cantidad,
            fecha_actualizacion = CURDATE()
            WHERE producto_id = p_producto_id
            AND almacen_id = p_almacen_id;
    COMMIT;

END //

DELIMITER ;