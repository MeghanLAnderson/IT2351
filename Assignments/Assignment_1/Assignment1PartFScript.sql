-- Assignment 1
-- repo: https://github.com/MeghanLAnderson/IT2351.git
-- Anderson, Meghan Spring IT2351Assignment1Part3A
-- Select customer data, ascending order State, city
select 	
	customer_first_name,
	customer_last_name,
	customer_city,
	customer_state
from 
	customers
order by 4 asc,3 asc;

-- Anderson, Meghan Spring 2021 Assignment1Part3B
-- create query to sort unit price
select
	title, 
    artist, 
    unit_price
from
	items
where
	unit_price > 16
order by 
	unit_price;
  
-- Anderson, Meghan Spring 2021 Assignment1Part3C
-- create a query to use aliases
select 	
	customer_first_name "First Name",
	customer_last_name "Last Name",
	customer_city "City",
	customer_state "State"
from 
	customers
order by 
	2, 1;

-- Anderson, Meghan Spring 2021 Assignment1Part3D
-- use arithmetic expressions
select
	customer_id "ID",
    order_date "Order Date",
    shipped_date "Shipped Date",
	shipped_date - order_date "Days_to_Ship"
from
	orders
order by
	customer_id,
    Days_to_Ship;
   
-- Anderson, Meghan Spring 2021 Assignment1PartG
-- use concat function
select
	concat(customer_first_name, " ", customer_last_name) as Name
from customers
order by 
	customer_last_name,
    customer_first_name;
    
-- Anderson, Meghan Spring 2021  Assignment1PartH
-- Formated Dates using m/d/y
select
	customer_id "ID",
   date_format (order_date, '%m/%d/%Y') as "Order Date",
    date_format(shipped_date, '%m/%d/%Y') "Shipped Date",
	shipped_date - order_date "Days_to_Ship"
from
	orders
order by
	customer_id,
    Days_to_Ship;