select * from uber;

-- How many rides are completed?
select 
	count(*) as total_completed_rides
from uber
where status = 'completed';


-- List all unique vehicle types.
select
	distinct(vehicle_type)
from uber;


-- Show details of all rides paid via "Cash".
select
	*
from uber
where pay_method = 'Cash';


-- Get all rides where the fare price is greater than 500.
select
	*
from uber
where fare_price > 500;


-- Get the top 10 most expensive rides.
select
	booking_id, status, vehicle_type, fare_price
from uber
order by fare_price desc
limit 10;


-- Retrieve all rides where the pickup location is "Cyber Hub" and payment method is "Credit Card".
select
	*
from uber
where pickup_location = 'Cyber Hub' and pay_method = 'Credit Card';


-- List all rides where driver_rating is less than customer_rating.
select
	*
from uber
where driver_rating < customer_rating;


-- Find the total number of bookings in the dataset.
select 
	count(*) total_bookings
from uber;


-- Calculate the average fare price for each vehicle_type.
select
	vehicle_type, round(avg(fare_price),2) avg_price
from uber
group by vehicle_type
order by avg_price desc;


-- Get the total fare revenue collected for each payment method.
select
	pay_method, sum(fare_price) revenue
from uber
group by pay_method
order by revenue desc;


-- Count the number of rides cancelled by customers for each cancellation reason.
select
	customer_cancel_reason,
	count(*) counts
from uber
where customer_cancel = 1
group by customer_cancel_reason
order by counts desc;


-- Find the average ride distance and average fare price for completed rides.
select
	avg(ride_distance) avg_distance,
    avg(fare_price) avg_price
from uber
where status = 'completed';


-- Get the total number of rides for each date.
select
	date, count(booking_id) as total_rides
from uber
group by date
order by date;


-- Find the busiest hour of the day for bookings.
select 
	hour(time) as hrs,
    count(booking_id) as total_rides
from uber
group by hrs
order by total_rides desc
limit 1;


-- Calculate the number of rides on weekends vs weekdays.
select 
	case
		when dayofweek(date) in (1, 7) then 'Weekend'
        else 'Weekday'
	end as day_type,
    count(*) as total_rides
from uber;


-- Find the top 3 pickup locations with the highest number of bookings
select
	pickup_location, count(booking_id) as total_bookings
from uber
group by pickup_location
order by total_bookings desc
limit 3;


-- For each driver rating, calculate the average fare price and ride distance.
select
	driver_rating, round(avg(fare_price),2) as avg_price, round(avg(ride_distance),2) as avg_ride
from uber
group by driver_rating;


-- Get the percentage of incomplete rides compared to total rides.
select
	(count(incomplete_rides) / (select count(*) from uber)) * 100 as `incomplete_ride_%`
from uber
where incomplete_rides = 1;


-- Find the vehicle type with the highest average customer rating.
select
	vehicle_type, avg(customer_rating) as cust_rating 
from uber
group by vehicle_type
order by cust_rating desc
limit 1;