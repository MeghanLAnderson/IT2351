-- Assignment6No1
-- stored procedure named productCount. 
USE my_guitar_shop;

DROP PROCEDURE IF EXISTS productCount

DELIMITER //
CREATE PROCEDURE productCount()
BEGIN 
-- declare integer variable to told the count
    DECLARE countproduct INT;
    -- assign the count aggregate function to the variable countproduct
    SELECT count(*) INTO countproduct from orders;
    SELECT countproduct;
    -- output the value greater than or less than 20
    IF countproduct >= 20 THEN
        SELECT 'The number of products is greater than or equal to 20' as Result;
    ELSE
        SELECT 'The number of products is less than 20' as Result;
END IF;
END //
CALL productCount();
-- Assignment6No2
-- stored procedure called insertCategory
DROP PROCEDURE IF EXISTS insertCategory
DELIMITER //
CREATE PROCEDURE insertCategory
BEGIN 
    DECLARE CONTINUE HANDLER FOR 1062
    SET duplicate_entry_for_key = TRUE;
    INSERT INTO my_guitar_shop(category_id,category_name) values(5,Mircophones)
    IF duplicate_entry_for_key = TRUE THEN
        SELECT 'Row was not inserted - duplicate entry.' AS message;
        ELSE
        SELECT '1 row was inserted' AS message;
END IF;
END //
-- Assignment6No3
-- stored procedure called discount_price
DROP PROCEDURE IF EXISTS discount_price
DELIMITER // 
CREATE FUNCTION discount_price
(item_id_param INT
)
RETURNS DECIMAL (10,2)
BEGIN
    DECLARE discount_price_var DECIMAL(10,2);
    SELECT item_price - discount_amount
    INTO discount_price_var
    FROM order_items
WHERE item_id = item_id_param
RETURN discount_price_var;
END // 
-- Assignment6No4
-- EVENT run once a year to determine products that have not been ordered during the year
SET GLOBAL event_scheduler = ON;
DROP EVENT IF EXISTS yearly_product_ordering;
DELIMITER //
CREATE EVENT yearly_product_ordering
ON SCHEDULE EVERY 1 YEAR
STARTS '2020-01-01 00:00:00'
DO BEGIN 
    INSERT INTO messages(message,created_at)
    VALUES('Test MySQL recurring Event',NOW());
END //