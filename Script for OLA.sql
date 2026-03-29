CREATE DATABASE Ola;
USE Ola;

SELECT count(*) FROM bookings;

--  1. Retrieve all successful bookings:
CREATE VIEW  Successful_Booking AS
SELECT * FROM bookings
WHERE Booking_Status = 'Success';
-- OR
SELECT * FROM Successful_Booking;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW Ride_Distance_Foreach AS
SELECT Vehicle_Type , AVG(Ride_Distance) AS Average_Distance FROM bookings
GROUP BY Vehicle_Type;
-- OR
SELECT * FROM Ride_Distance_Foreach;

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW Canceled_Ride_by_Customer AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';
-- OR
SELECT * FROM Canceled_Ride_by_Customer;

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top5_Customer AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
-- OR
SELECT * FROM Top5_Customer;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Cancelled_Bydriver AS
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
-- OR
SELECT * FROM Rides_Cancelled_Bydriver;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Max_Min_Ratings AS
SELECT MAX(Driver_Ratings) AS Maximum_Rating, MIN(Driver_Ratings) AS Minimum_Rating FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';
-- OR
SELECT * FROM Max_Min_Ratings ;

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW P_Method AS 
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';
-- OR
SELECT * FROM P_Method;

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW Avg_Customer_Rating AS
SELECT   Vehicle_Type, AVG(Customer_Rating) FROM bookings
GROUP BY Vehicle_Type;
-- OR
SELECT * FROM Avg_Customer_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
 CREATE VIEW Total_Booking AS
 SELECT SUM(Booking_Value) FROM bookings 
 WHERE Incomplete_Rides= 'No'; 
-- OR
SELECT * FROM Total_Booking;

-- 10. List all incomplete rides along with the reason 
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings
WHERE Incomplete_Rides = 'Yes';
-- OR
SELECT * FROM Incomplete_Rides_Reason;



