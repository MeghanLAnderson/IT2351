-- Output the title, artist, unit_price and order_qty for each 
-- orderin the OM database.  Use an INNER JOIN (INNER keyword is 
-- optional rather than a natural join-you will have an ON keyword), 
-- sort your output by title and then artist. Name your imageand 
-- script file IT2351Assignment2Part2A.  

-- Select data from two tables joined by common key item_id
-- IT2351Assignment2Part2A
SELECT  title, artist, unit_price, order_qty
FROM items i INNER JOIN order_details od
ON i.item_id = od.item_id
;

--Assignment2Part2B
-- Output customername (concatenated), city, state, order_date and ship_date for each order.  
-- Sort the output by state, city, last name, first name. 
-- Name your image and script files: 
-- Assignment2Part2B. 
SELECT concat(customer_first_name, " ", customer_last_name) as Name,c.customer_city,c.customer_state,o.order_date,o.shipped_date
FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_state, c.customer_city, c.customer_last_name, c.customer_first_name
;

--  Assignment2Part2C
-- Output the detail for each order, inother words show 
-- the customer_id, order_date, item_id and order_qty for each order. 
-- Name the image and script files: 
-- Assignment2Part2C.
SELECT customer_id, order_date, item_id, order_qty
FROM orders o INNER JOIN order_details od
ON o.order_id = od.order_id
ORDER BY o.customer_id
;

-- Looking at your last query, it would be helpful to have item names (title) rather than item_id. 
-- Update the last query to replace item_id with artist (add another join). 
-- Name the image and script files:
-- Assignment2Part2D.
script files:Assignment2Part2D
SELECT o.customer_id, o.order_date, i.artist, od.order_qty
FROM orders o 
  INNER JOIN order_details od
  INNER JOIN items i
ON o.order_id = od.order_id
  AND i.item_id = od.item_id
ORDER BY i.artist
;

--Once again you will add to the last query replacing 
--customer_id with customer name.  Add another join that 
--will accomplish this goal. Name the image and script 
-- Assignment2Part2E
SELECT CONCAT(c.customer_first_name,' ',c.customer_last_name) as name
      , o.order_date
      , i.artist
      , od.order_qty
      --, c.customer_first_name
FROM orders o 
  INNER JOIN order_details od
  INNER JOIN items i
  INNER JOIN customers c
ON o.order_id = od.order_id
  AND i.item_id = od.item_id
  AND c.customer_id = o.customer_id
ORDER BY c.customer_first_name
;

--Output allthe titles with an order quantity over one. 
--Name the image and script files: 
-- Assignment2Part2F. 
SELECT i.title, od.order_qty
FROM items i
  JOIN order_details od
ON i.item_id = od.item_id
WHERE order_qty > 1
;

-- Output all the orders for customers in Ohio. 
-- Include the customer names and titles purchased in your output. 
-- Name your image and script files:
-- Assignment2Part2G

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

--Insert a row into the customers table(data of your choice).
--Name your image and script files
-- Assignment2Part2H
INSERT INTO customers (customer_id, customer_first_name, customer_last_name, customer_address, customer_city, customer_state, customer_zip, customer_phone)
 values  (26, 'Benjamin','Rusnak', '21 Main St', 'Springfield', 'OH', 1111, 2165551234)

;

