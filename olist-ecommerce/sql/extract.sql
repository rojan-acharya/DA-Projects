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
-- - Popular payment methods
-- - Installments by payment type
-- - Payment value by category
-- - Top payment types by region

select
    pay.order_id,
    pay.payment_type,
    pay.payment_installments,
    pay.payment_value,
    c.customer_state,
    p.product_category
from payments pay
join orders o on pay.order_id = o.order_id
join customers c on o.customer_id = c.customer_id
join order_items oi on pay.order_id = oi.order_id
join products p on oi.product_id = p.product_id;


    
    
    
    
    
    
    
    
