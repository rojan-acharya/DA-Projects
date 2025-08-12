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


