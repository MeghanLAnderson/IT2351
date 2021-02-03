-- Anderson, Meghan Spring IT2351Assignment1Part3A
-- Select customer data, ascending order State, city
select 	customer_first_name,
		customer_last_name,
		customer_city,
        customer_state
from customers
order by 4 asc,3 asc