SELECT * FROM green_tripdata_2019_01


--Question 3 How many taxi trips were totally made on January 15?

SELECT COUNT(*)
FROM green_tripdata_2019_01
WHERE ipep_pickup_datetime BETWEEN '2019-01-15 00:00:00' AND '2019-01-15 23:59:59'


--Question 4 Which was the day with the largest trip distance Use the pick up time for your calculations.

SELECT ipep_pickup_datetime, tripdistance
FROM green_tripdata_2019_01
ORDER BY tripdistance DESC 
LIMIT 1

--Question 5 In 2019-01-01 how many trips had 2 and 3 passengers?

SELECT passengercount, COUNT(ipep_pickup_datetime)
FROM green_tripdata_2019_01
WHERE ipep_pickup_datetime BETWEEN '2019-01-15 00:00:00' AND '2019-01-15 23:59:59' AND (passengercount = '2' OR passengercount = '3')
GROUP BY passengercount

--Question 6 For the passengers picked up in the Astoria Zone which was the drop off zone that had the largest tip? We want the name of the zone, not the id.

SELECT * FROM taxi_zone_lookup

SELECT z.zone, g.tipamount
FROM green_tripdata_2019_01 g
LEFT JOIN taxi_zone_lookup z
ON g.dolocationid = z.locationid
WHERE g.pulocationid = 7
ORDER BY g.tipamount DESC
LIMIT 1