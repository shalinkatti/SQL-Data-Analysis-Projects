use e_commerce;

/* 1. total sales      
-----'16008872.12' */

select round(sum(payment_value),2) as total_sales
from order_payments;                                      

/* total orders ----96461 */

select count(*) as total_orders
from orders;

/* top selling products */

select p.product_id, op.payment_value
from order_payments op
join order_items oi on op.order_id = oi.Order_id
join products p on oi.product_id = p.product_id
group by p.product_id, op.payment_value
order by op.payment_value desc
limit 10;


/* monthly orders analysis */

select year(order_purchase_timestamp) as year,
month(order_purchase_timestamp) as month,
count(order_id) as count_of_orders
from orders
group by year, month
order by year, month;

select year(order_purchase_timestamp) as year,
month (order_purchase_timestamp) as month,
count(*) as count_of_order
from orders
group by year, month
order by year, month;


select payment_type, count(*) as total_transaction, round(sum(payment_value),2) as total_sales
from order_payments
group by payment_type
order by total_sales desc;

select customer_state, count(*) as count_of_customer_id
from customers
group by customer_state
order by count_of_customer_id;

select seller_id, round(sum(price),2) as most_sellings
from order_items
group by seller_id
order by most_sellings desc
limit 10;

select round(avg(payment_value),2) as total_average
from order_payments;


select order_id, datediff(order_delievered_customer_date, order_estimated_delivery_date) as delivery_delays
from orders;

select c.customer_city, op.payment_value
from customers c
join orders o on c.customer_id = o.customer_id
join order_payments op on o.order_id = op.order_id
group by c.customer_city, op.payment_value
order by op.payment_value desc
limit 10;