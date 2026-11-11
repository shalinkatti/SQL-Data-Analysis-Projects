use e_commerce;

select * from order_items;

select round(sum(price),2) as Total_sales 
from order_items;
/* the total sales of order_items is '10209865.44' */

select count(*) as total_orders from orders;
/* the total no of orders is '96461' */

select p.product_category_name, round(sum(price), 2) as total_sales
from order_items o
join products p on o.product_id = p.product_id
group by p.product_category_name
order by total_sales desc
limit 10;

/* the top 10 selling products with their total sales
 beleza_saude	945719.01
relogios_presentes	933953.78
cama_mesa_banho	802526.27
esporte_lazer	734501.09
informatica_acessorios	695286.77
moveis_decoracao	560031.49
utilidades_domesticas	482852.43
cool_stuff	471536.46
automotivo	449769.11
ferramentas_jardim	376619.95 */


select year(order_purchase_timestamp) as year,
month(order_purchase_timestamp) as month,
count(order_id) as total_orders 
from orders
group by year, month
order by year, month;

/* monthly orders by year 
'2016', '9', '1'
'2016', '10', '270'
'2016', '12', '1'
'2017', '1', '748'
'2017', '2', '1641'
'2017', '3', '2546'
'2017', '4', '2303'
'2017', '5', '3545'
'2017', '6', '3135'
'2017', '7', '3872'
'2017', '8', '4193'
'2017', '9', '4149'
'2017', '10', '4478'
'2017', '11', '7288'
'2017', '12', '5513'
'2018', '1', '7069'
'2018', '2', '6556'
'2018', '3', '7003'
'2018', '4', '6798'
'2018', '5', '6749'
'2018', '6', '6096'
'2018', '7', '6156'
'2018', '8', '6351' */


select payment_type,
count(*) as total_transactions,
round(sum(payment_value),2) as total_amount
from order_payments
group by payment_type
order by total_amount desc;

/* payment type analysis
'credit_card', '76795', '12542084.19'
'boleto', '19784', '2869361.27'
'voucher', '5775', '379436.87'
'debit_card', '1529', '217989.79'
'not_defined', '3', '0.00' */

select customer_state, count(*) as total_customer
from customers
group by customer_state;

/* state wise customer count
'SP', '41746'
'MG', '11635'
'ES', '2033'
'RJ', '12852'
'RS', '5466'
'BA', '3380'
'CE', '1336'
'PR', '5045'
'MS', '715'
'PB', '536'
'SC', '3637'
'MT', '907'
'PA', '975'
'RN', '485'
'PI', '495'
'DF', '2140'
'GO', '2020'
'PE', '1652'
'RO', '253'
'MA', '747'
'SE', '350'
'AM', '148'
'AL', '413'
'TO', '280'
'AC', '81'
'AP', '68'
'RR', '46' */

select seller_id, order_item_id
from order_items
group by seller_id, order_item_id
order by order_item_id desc;

select seller_id, round(sum(price),2) as total_revenue, order_item_id
from order_items
group by seller_id, order_item_id
order by total_revenue desc
limit 10;

/* seller performances with total revenue
'4869f7a5dfa277a7dca6462dcf3b52b2', '172587.10', '1'
'53243585a1d6dc2643021fd1853d8905', '159084.25', '1'
'fa1c13f2614d7b5c4749cbc52fecda94', '153309.82', '1'
'4a3ca9315b744ce9f8e9374361493884', '137802.13', '1'
'7e93a43ef30c4f03f38b393420bc753a', '133891.14', '1'
'7a67c85e85bb2ce8582c35f2203ad736', '109647.24', '1'
'7c67e1448b00f6e969d365cea6b010ab', '109105.83', '1'
'da8622b14eb17ae2831f4ac5b9dab84a', '104870.21', '1'
'6560211a19b47992c3666cc44a7e94c0', '90216.86', '1'
'7d13fca15225358621be4086e1eb0964', '88557.72', '1'   */


select round(avg(payment_value),2) as average_order_value
from order_payments;

/* average order vlue '154.10' */


select order_id, datediff(order_delievered_customer_date, order_estimated_delivery_date) as delivery_delay
from orders
where order_delievered_customer_date is not null;

select * from orders where order_id = '001d8f0e34a38c37f7dba2a37d4eba8b';


select c.customer_city, o.order_id
from orders o
join customers c on c.customer_id = o.customer_id;

select c.customer_city, count(o.order_id) as total_orders
from customers c
join orders o on o.customer_id = c.customer_id
group by c.customer_city
order by total_orders desc
limit 10;

/* top cities by orders
'sao paulo', '15044'
'rio de janeiro', '6603'
'belo horizonte', '2697'
'brasilia', '2071'
'curitiba', '1489'
'campinas', '1406'
'porto alegre', '1341'
'salvador', '1188'
'guarulhos', '1143'
'sao bernardo do campo', '911'  */


/* advance sql Queries */

select c.customer_state, round(sum(op.payment_value),2) as total_revenue
from customers c
join orders o on c.customer_id = o.customer_id
join order_payments op on o.order_id = op.order_id
group by c.customer_state
order by total_revenue;

/* revenue by state 
'RR', '9039.52'
'AP', '16141.81'
'AC', '19586.25'
'AM', '27596.18'
'RO', '56975.70'
'TO', '60007.37'
'SE', '70289.13'
'AL', '94195.79'
'RN', '100728.30'
'PI', '105272.17'
'MS', '134421.54'
'PB', '137834.65'
'MA', '147700.48'
'MT', '181441.72'
'PA', '212027.55'
'CE', '266357.16'
'PE', '309074.59'
'ES', '317682.65'
'GO', '334294.22'
'DF', '346146.17'
'BA', '591270.60'
'SC', '595361.91'
'PR', '781919.55'
'RS', '861054.35'
'MG', '1819029.99'
'RJ', '2055878.41'
'SP', '5768355.09'
*/

select count(*) as late_deliveries
from orders 
where order_delievered_customer_date > order_estimated_delivery_date;

/* late deliveries '7826' */

select p.product_category_name, round(sum(oi.price),2) as total_sales
from order_items oi
join products p on oi.product_id = p.product_id
group by p.product_category_name
order by total_sales desc
limit 10;

/* top product categories */


select round(avg(freight_value),2) as avg_freight_cost
from order_items;

/* avg_freight_cost '19.98' */


select c.customer_unique_id, round(sum(op.payment_value),2) as customer_purchase_value
from customers c
join orders o on c.customer_id = o.customer_id
join order_payments op on o.order_id = op.order_id
group by c.customer_unique_id 
order by customer_purchase_value desc
limit 10;


