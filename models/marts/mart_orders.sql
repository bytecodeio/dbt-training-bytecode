with customers as (
    select * from {{ ref('dim_customers') }}
),

orders as (
    select * from {{ ref('fct_orders') }}
)

select

customers.first_name,
customers.last_name,
customers.is_employee,
customers.first_order_date,
customers.most_recent_order_date,
customers.number_of_orders,
customers.lifetime_value,
orders.order_id,
orders.order_date,
orders.amount

from customers
left join orders on customers.customer_id = orders.customer_id