create database ola;	
use ola;


#1. Retrieve all successful bookings:

create view successfull_views as
select *  from bookings 
where Booking_status='Success';

# best answer 
select * from successfull_views;

#2. Find the average ride distance for each vehicle type:

create view ARD as
select Vehicle_Type ,Avg (Ride_Distance)
as avg_distance from Bookings
Group By Vehicle_Type;

# best answer 
select * from ARD;

#3. Get the total number of cancelled rides by customers:

create view CRC as
select count(*) from Bookings where Booking_Status='Canceled by Customer';

 # best answer 
 select * from CRC;
 
 #4. List the top 5 customers who booked the highest number of rides:
 
 create view Top5customer as  
 select Customer_id , count(Booking_id) as total_rides
 from Bookings 
 group by Customer_id 
 order by total_rides desc limit 5;
 
 
 #best answer
 select * from Top5customer;  
 
#5. Get the number of rides cancelled by drivers due to personal and car-related issues;

create view CBDPC as
select count(*) from bookings where Canceled_Rides_by_Driver='Personal & Car related issue';

# best answers  
select * from CBDPC;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_min_Driver_rating as 
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type='Prime Sedan';

# best answer 
select * from max_min_Driver_rating;

#7. Retrieve all rides where payment was made using UPI:

create view PaymentMethod_UPI as
select * from bookings where Payment_Method='UPI';

#best answer 
select * from  PaymentMethod_UPI; 

#8. Find the average customer rating per vehicle type:
create view avg_customer_rating_vehicle_type as
select Vehicle_Type, avg(Customer_Rating) as avg_Customer_Rating 
from Bookings 
group by Vehicle_Type; 

# best answer 
select * from avg_customer_rating_vehicle_type;

# jaha par (per) aaye group by use karna hai and jo per me ho usko group by table me lena hai

#9. Calculate the total booking value of rides completed successfully:

create view total_booking_value_completed as 
select sum(Booking_Value) as Total_Values 
from Bookings
where Booking_Status='Success';

#best answer 
select * from total_booking_value_completed;

#10. List all incomplete rides along with the reason:

create view Incomplete_Rides as
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides='Yes';

# best answer 
select * from  Incomplete_Rides;
