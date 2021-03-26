-- Assignment4No1
SELECT format(list_price, 1), 
       convert(list_price, signed), 
       cast(list_price as signed)
FROM products
;
-- Assignment4No2
SELECT email_address,
       length(email_address) as length,
       locate('@', email_address) as "@",
       LEFT(email_address, locate('@',email_address) - 1) as username,
       SUBSTRING(email_address, locate('@',email_address) + 1) as domain
FROM customers 
;
-- Assignment4No3
SELECT list_price, discount_percent,
       ROUND(list_price * discount_percent * .01, 2) AS discount_amount
FROM products
;
-- Assignment4No4
SELECT order_id, order_date, ship_date,
       DATE_ADD(order_date, INTERVAL 2 DAY) as approx_ship_date,
       DATEDIFF(order_date,ship_date) as days_to_ship
FROM orders
WHERE EXTRACT(YEAR_MONTH FROM order_date) ="201803"
GROUP BY order_id, order_date, ship_date
;
-- Assignment4No5
SELECT c.category_name, 
       p.product_name,
       SUM(o.item_price) as total_sales,
       FIRST_VALUE(c.category_name) OVER (
           PARTITION BY o.item_price order by o.order_id DESC
       ) as highest_sales,
        LAST_VALUE(c.category_name) OVER (
           PARTITION BY o.item_price order by o.order_id DESC
           RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) as lowest_sales
FROM categories c
     JOIN products p
     JOIN order_items o
ON c.category_id = p.category_id
    AND p.product_id = o.product_id
GROUP BY c.category_name, p.product_name
;


SELECT c.category_name, 
       p.product_name,
       SUM(o.item_price) as total_sales,
       FIRST_VALUE(p.product_name) OVER (
        PARTITION BY c.category_name order by SUM(o.item_price) DESC
       ) as highest_sales,
       FIRST_VALUE(p.product_name) OVER (
        PARTITION BY c.category_name order by SUM(o.item_price) DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) as lowest_sales
FROM categories c
     JOIN products p
     JOIN order_items o
ON c.category_id = p.category_id
    AND p.product_id = o.product_id
GROUP BY c.category_name, p.product_name,o.item_price,o.order_id
;



-- Assignment4No6
CREATE VIEW order_item_products AS
SELECT o.order_id, o.order_date, o.tax_amount, o.ship_date, p.product_name, i.item_price, i.discount_amount,
 -- as final_price (the discount amount subtracted from the item price)
, i.quantity, 
-- as item_total (the calculated total for the item)
FROM products p
    JOIN order_items i
    JOIN orders o
ON p.product_id = i.product_id
    AND i.order_id = o.order_id