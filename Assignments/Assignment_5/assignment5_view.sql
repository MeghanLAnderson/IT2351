-- create view for guitar database
CREATE VIEW item_ordered_view AS
SELECT c.category_name, p.product_name, i.item_price, i.quantity
FROM categories c
    JOIN products p 
    JOIN order_items i
ON c.category_id = p.category_id
    AND p.product_id = i.product_id
