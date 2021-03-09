-- Assignment3No2
SELECT COUNT(order_id), SUM(ship_amount) as "Ship Value"
FROM orders
;
-- fsigjsil
SELECT c.category_name, COUNT(product_id), MAX(list_price)
FROM categories c
    JOIN products p
ON c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY COUNT(product_id)
;