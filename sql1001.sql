use e_commerce;

create table customers (
customer_id varchar(100) primary key,
customer_unique_id varchar(100), 
customer_zip_code_prefix varchar(20),
customer_city varchar(100),
customer_state varchar(20)
);

select * from customers;


create table orders (
order_id varchar(100) primary key,
customer_id varchar(100),
order_status varchar(50),
order_purchase_timestamp datetime,
order_approved_at datetime,
order_delievered_carrier_date datetime,
order_delievered_customer_date datetime,
order_estimated_delivery_date datetime,
foreign key (customer_id) references customers(customer_id)
);

select * from orders;

use e_commerce;

SELECT * from order_payments;

create table products (
product_id varchar(100) primary key,
product_category_name varchar(100),
product_name_length int,
product_description_length int,
product_photos_qty int,
product_weight_g int,
product_length_cm int,
product_height_cm int,
product_width_cm int
);

select * from products;


create table sellers (
seller_id varchar(100) primary key,
seller_zip_code_prefix varchar(20),
seller_city varchar(100),
seller_state varchar(20)
);

select * from sellers;

create table order_items (
Order_id varchar(100),
order_item_id int,
product_id varchar(100),
seller_id varchar(100),
shipping_limit_date datetime,
price decimal(10,2),
freight_value decimal(10,2),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id),
foreign key (seller_id) references sellers(seller_id)
);

select * from order_items;


