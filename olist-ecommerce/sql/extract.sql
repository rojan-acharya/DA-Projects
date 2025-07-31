select * from customers limit 5;
select * from geolocation limit 5;
select * from orders limit 5;
select * from order_items limit 5;
select * from products limit 5;
select * from payments limit 5;
select * from sellers limit 5;



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
-- RFM (Recency, Frequency, Monetary) analysis
-- Customer clustering by order/spend
-- Loyal customers by city/state









	







