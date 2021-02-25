-- IT2351Assignment2Part2A
-- Select data from two tables joined by common key item_id
SELECT  title, artist, unit_price, order_qty
FROM items i
   INNER JOIN order_details od
ON i.item_id = od.item_id
;

--Assignment2Part2B
-- Select data from multiple tables joined by a common key customer_id
SELECT concat(customer_first_name, " ", customer_last_name) as Name,c.customer_city,c.customer_state,o.order_date,o.shipped_date
FROM customers c
   JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_state, c.customer_city, c.customer_last_name, c.customer_first_name
;

--  Assignment2Part2C
-- Select data from multiple tables joined by a common key order_id
SELECT customer_id, order_date, item_id, order_qty
FROM orders o 
  INNER JOIN order_details od
ON o.order_id = od.order_id
ORDER BY o.customer_id
;

-- Assignment2Part2D.
-- Select data from multiple tables joined by a common key customer_id
script files:Assignment2Part2D
SELECT o.customer_id, o.order_date, i.artist, od.order_qty
FROM orders o 
  INNER JOIN order_details od
  INNER JOIN items i
ON o.order_id = od.order_id
  AND i.item_id = od.item_id
ORDER BY i.artist
;

-- Assignment2Part2E
-- Select data from multiple tables joined by a common key of order_id, item_id, and customer_id to sort by customers names
SELECT CONCAT(c.customer_first_name,' ',c.customer_last_name) as name
      , o.order_date
      , i.artist
      , od.order_qty
FROM orders o 
  INNER JOIN order_details od
  INNER JOIN items i
  INNER JOIN customers c
ON o.order_id = od.order_id
  AND i.item_id = od.item_id
  AND c.customer_id = o.customer_id
ORDER BY c.customer_first_name
;

-- Assignment2Part2F. 
-- Select data from multiple tables joined by a common key item_id to display orders that had a quantity on more than 1
SELECT i.title, od.order_qty
FROM items i
  JOIN order_details od
ON i.item_id = od.item_id
WHERE order_qty > 1
;

-- Assignment2Part2G
-- Select data from multiple tables joined by a common key customer_id, order_id, and item_id to sort customers that live in Ohio only
SELECT CONCAT(c.customer_first_name,' ',c.customer_last_name) as name
        , o.order_id
        , i.title
      --  , c.customer_state
FROM customers c
    JOIN orders o
    JOIN order_details od
    JOIN items i
WHERE c.customer_id = o.customer_id
    AND o.order_id = od.order_id
    AND od.item_id = i.item_id
    AND c.customer_state ='OH'
;

-- Assignment2Part2H
--Insert a row into the customers table making sure I satisfy all the contraints in the customers table
INSERT INTO customers (customer_id, customer_first_name, customer_last_name, customer_address, customer_city, customer_state, customer_zip, customer_phone)
 values  (26, 'Benjamin','Rusnak', '21 Main St', 'Springfield', 'OH', 1111, 2165551234)

;

--Assignment2Part2I.
--Update the unit_price and set it by 10% for all items with a unit_price > 17.
UPDATE items
SET unit_price = unit_price * 1.1
WHERE unit_price > 17
;