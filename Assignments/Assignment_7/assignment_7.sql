-- question 1

-- Given the my_guitar_shop database, remove a customer.

-- Create Stored PROCEDURE 
DELIMITER $$
CREATE PROCEDURE remove_customer(IN f_name VARCHAR(60), 
                                IN l_name VARCHAR(60))
BEGIN 
  DECLARE cid INT DEFAULT 0; 
  SELECT customer_id INTO @cid 
  FROM customers 
  WHERE first_name = f_name 
    AND last_name = l_name;
  SET FOREIGN_KEY_CHECKS=0;  -- disabled to keep orders (i.e. financial data) but delete customer PII/PID
  DELETE FROM addresses WHERE customer_id = @cid;
  COMMIT;
  DELETE FROM customers WHERE customer_id = @cid;
  COMMIT;
  SET FOREIGN_KEY_CHECKS=1; -- enable fk restrictions again
END
DELIMITER ;

-- TEST Remove customer Allan Sherwood
SELECT * 
from customers,
  addresses 
where customers.customer_id = addresses.customer_id
  and first_name = 'Allan'
  and last_name = 'Sherwood'
;
CALL remove_customer('Allan','Sherwood');

SELECT * 
from customers,
  addresses 
where customers.customer_id = addresses.customer_id
  and first_name = 'Allan'
  and last_name = 'Sherwood'
;

-- question 2
USE ap;

DROP PROCEDURE IF EXISTS test;

DELIMITER //
-- assigns delimter to // instead of the deafult ; to be able to utilize ; in statements

CREATE PROCEDURE test()
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
    -- delcares and adds a continue handler condition to the procedure

  START TRANSACTION;
  -- start transaction turns off the autocommit feature
  
  UPDATE invoices
  SET vendor_id = 123
  WHERE vendor_id = 122;
  -- changes all vendor ids 122 in the vendors table to vendor id 123

  DELETE FROM vendors
  WHERE vendor_id = 122;
  -- deletes vendor id 122 from the vendors table

  UPDATE vendors
  SET vendor_name = 'FedUP'
  WHERE vendor_id = 123;
  -- renames the vendor table 123 to FedUP

  IF sql_error = FALSE THEN
    COMMIT;
    SELECT 'The transaction was committed.';
    -- commit the changes permantely if the statment is executed successfully
  ELSE
    ROLLBACK;
    SELECT 'The transaction was rolled back.';
    -- roll back the changes, or cancel, the statement if it is excuted unsuccessfully
  END IF;
END//
-- ends the procedure
DELIMITER ;
-- assigns delimter back to the deafult ;

CALL test();
-- executes procedure

-- question 3
USE ap;

DROP PROCEDURE IF EXISTS test;

DELIMITER //
-- assigns delimter to // instead of the deafult ; to be able to utilize ; in statements

CREATE PROCEDURE test()
BEGIN
  DECLARE sql_error INT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;
-- delcares and adds a continue handler condition to the procedure

  START TRANSACTION;
    -- start transaction turns off the autocommit feature
  DELETE FROM invoice_line_items
  WHERE invoice_id = 114;
-- delete invoice id 114 from table invoice line items
  DELETE FROM invoices
  WHERE invoice_id = 114;
-- deletes invoice id 114 from table invoices
  COMMIT;
  
  IF sql_error = FALSE THEN
    COMMIT;
    SELECT 'The transaction was committed.';
        -- commit the changes permantely if the statment is executed successfully
  ELSE
    ROLLBACK;
    SELECT 'The transaction was rolled back.';
        -- roll back the changes, or cancel, the statement if it is executed unsuccessfully
  END IF;
END//
-- ends the procedure
DELIMITER ;
-- assigns delimter back to the deafult ;
CALL test();
-- executes procedure

-- question 4a
-- make sure that privileges are as limited as possible for secruity starting with column privileges first and working up the ladder if needed
 -- Global: Possbily set all users to have READ ACCESS ONLY
 -- Database: Ensure ONLY the needed databases are accessed
 -- Tables: Ensure ONLY the needed tables are accessed
 -- Columns: Ensure ONLY the needed columns are accessed     
-- question 4b
-- set roles will make it easier to define each person 
-- example roles to create (e.g. DEV, SALESMAN, CUSTOMER) to give only what they need to access
-- Auto assign roles at user creation

