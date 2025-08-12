create database uber;

use uber;


create table uber(
	date date,
    time time,
    booking_id varchar(50),
    status varchar(50),
    customer_id varchar(50),
    vehicle_type varchar(50),
    pickup_location varchar(50),
    drop_location varchar(50),
    avg_vtat float,
    avg_ctat float,
    customer_cancel int,
    customer_cancel_reason varchar(250),
    driver_cancel int,
    driver_cancel_reason varchar(250),
    incomplete_rides int,
    incomplete_rides_reason varchar(250),
    fare_price float,
    ride_distance float,
    driver_rating float,
    customer_rating float,
    pay_method varchar(50)
);