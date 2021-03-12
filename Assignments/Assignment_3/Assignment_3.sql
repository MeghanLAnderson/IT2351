-- The count of the number of orders in the orders table
-- The sum of the “Ship Value” which is the sum of the ship_amount from the orders table.
SELECT COUNT(order_id), SUM(ship_amount) as "Ship Value"
FROM orders
;
-- The Category Name column from the Categories table
-- b) The count of the products in the Products table (join these two tables)
-- c) The price of the most expensive product in the Products table
-- d) Sort the result set so the category with the most products appears first.
SELECT c.category_name, COUNT(product_id), MAX(list_price)
FROM categories c
    JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY COUNT(product_id)
;
-- The CategoryName column from the category table
-- b) The ProductName column from the products table
-- c) The total quantity purchased for each product with orders in the OrderDetails table
-- d)Use the WITH ROLLUP operator to include rows that give a summary for each category name as well
-- as a row that gives the grand total. Use the IF and GROUPING functions to replace null values in the
-- category_name and product_name columns with literal values if they’re for summary rows.

SELECT 
    IF (GROUPING (c.category_name), 'All Categories', c.category_name) as category_name,
    IF (GROUPING (p.product_name), 'All Products' , p.product_name) as product_name,
    SUM(i.quantity)
FROM categories c
    JOIN products p
    JOIN order_items i 
ON c.category_id = p.category_id
    AND p.product_id = i.product_id
GROUP BY c.category_name, p.product_name WITH ROLLUP
;
--  Write a SELECT statement that returns the same result set as this SELECT statement, but don’t use a
-- join.
SELECT DISTINCT category_name
FROM categories c
WHERE category_id IN (SELECT category_id FROM products)
;

-- 6 Write a SELECT statement that returns three columns: email_address, order_id,and the order total for each customer. To do this, you can group the result set by the email_address and order_id columns.In addition, you must calculate the order total from the columns in the Order_Items table.
SELECT c.email_address, i.order_id, SUM(i.item_price)
FROM customers c
    JOIN order_items i
    JOIN orders o
ON c.customer_id = o.customer_id
    AND o.order_id = i.order_id
GROUP BY c.email_address, i.order_id
;