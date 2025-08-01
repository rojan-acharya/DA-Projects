select * from customers;
select * from geolocation;
select * from orders;
select * from order_items;
select * from products;
select * from payments;
select * from sellers;



-- For Sales Performance Analysis
select
	orders.order_id,
    order_items.order_item_id,
    order_items.product_id,
    order_items.seller_id,
	orders.order_purchase_timestamp,
    order_items.price,
    order_items.freight_value,
    round((order_items.price + order_items.freight_value),2) as total_revenue,
    products.product_category
from orders
join order_items on orders.order_id = order_items.order_id
join products on order_items.product_id = products.product_id
join sellers on order_items.seller_id = sellers.seller_id;
    

-- Customer Segmentation
select
    c.customer_unique_id,
    max(o.order_purchase_timestamp) as last_order_time,
    count(distinct o.order_id) as frequency,
    round(sum(payments.payment_value),2) as monetary_value,
    c.customer_city,
    c.customer_state
from customers c
join orders o on c.customer_id = o.customer_id
join payments on o.order_id = payments.order_id
group by c.customer_unique_id, c.customer_city, c.customer_state;


-- Delivery Performance Analysis
select
	o.order_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date as delivery_date,
    o.order_estimated_delivery_date as delivery_estimate_date,
    c.customer_state,
    freight.total_freight_value
from orders o
join customers c on o.customer_id = c.customer_id
left join(
	select order_id, SUM(freight_value) AS total_freight_value
    from order_items
    group by order_id
) as freight on o.order_id = freight.order_id;


-- Payment Behavior Analysis
select
	p.product_category,
	round(sum(py.payment_value),2) as total_payment
from payments py
join order_items oi on py.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by p.product_category
order by total_payment desc;


select 
	py.payment_type,
    c.customer_state,
    count(*) as count
from payments py
join orders o on o.order_id = py.order_id
join customers c on c.customer_id = o.customer_id
group by c.customer_state, py.payment_type
order by c.customer_state, count desc;
    
    
-- Product Analysis
-- Freight cost vs product weight
-- Product descriptions vs sales
-- Top categories by revenue

select
    oi.product_id,
    p.product_category,
    avg(oi.freight_value) as avg_freight,
    avg(p.product_weight_g) as avg_weight,
    avg(p.product_description_length) as avg_description_length,
    sum(oi.price) as total_sales,
    sum(oi.price + oi.freight_value) as total_revenue,
    count(*) as total_items_sold
from order_items oi
join products p on oi.product_id = p.product_id
group by oi.product_id, p.product_category;

    
    
    
    
    
    
