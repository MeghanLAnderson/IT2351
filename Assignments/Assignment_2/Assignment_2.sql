-- Output the title, artist, unit_price and order_qty for each 
-- orderin the OM database.  Use an INNER JOIN (INNER keyword is 
-- optional rather than a natural join-you will have an ON keyword), 
-- sort your output by title and then artist. Name your imageand 
-- script file IT2351Assignment2Part2A.  


--IT2351Assignment2Part2A
-- Select data from two tables joined by common key item_id
SELECT  title, artist, unit_price, order_qty
FROM items i INNER JOIN order_details od
ON i.item_id = od.item_id
;

--Assignment2Part2B
-- Output customername (concatenated), city, state, order_date and ship_date for each order.  
-- Sort the output by state, city, last name, first name. 
-- Name your image and script files: Assignment2Part2B. 
SELECT concat(customer_first_name, " ", customer_last_name) as Name,c.customer_city,c.customer_state,o.order_date,o.shipped_date
FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_state, c.customer_city, c.customer_last_name, c.customer_first_name
;

--  Assignment2Part2C
-- Output the detail for each order, inother words show 
-- the customer_id, order_date, item_id and order_qty for each order. 
-- Name the image and script files: Assignment2Part2C.
SELECT customer_id, order_date, item_id, order_qty
FROM orders o INNER JOIN order_details od
ON o.order_id = od.order_id
ORDER BY o.customer_id
;

-- QUERY D 
-- READ AND UNDERSTAND
SELECT o.customer_id, o.order_date, i.artist, od.order_qty
FROM orders o 
  INNER JOIN order_details od
  INNER JOIN items i
ON o.order_id = od.order_id
  AND i.item_id = od.item_id
ORDER BY i.artist
;
