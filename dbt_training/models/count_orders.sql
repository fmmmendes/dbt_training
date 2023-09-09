select  c.id as customer_id, 
concat(c.first_name, ' ' ,c.last_name) full_name, 
count(o.id) as count_orders
from {{ source('northwind', 'customers') }} as c
join {{ source('northwind', 'orders') }} as o on c.id = o.customer_id 
group by c.id, full_name
order by count_orders desc