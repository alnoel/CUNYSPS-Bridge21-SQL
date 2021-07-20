
/**
1. Returns the destination in the flights database 
that is the furthest distance away, based on information in the flights table. 
**/

SELECT dest Destination, MAX(distance) 'Furthest Distance Away' 
FROM flights;

/**
2. Returns the different numbers of engines in the planes table.
For each number of engines, returns which aircraft have the most number of seats.

**/

SELECT DISTINCT(engines) AS  'There Are These Different Numbers of Engines'  
FROM planes
ORDER BY engines;

SELECT manufacturer Manufacturer , model Model , MAX(seats) 'Most Seats' , engines 'Number of Engines'
FROM planes 
WHERE engines IN (SELECT DISTINCT(engines) 
FROM planes
ORDER BY engines)
GROUP BY engines;

/**
3. Returns the total number of flights.

**/

SELECT COUNT(*) 'Total Number of Flights' 
FROM flights;


/**
4. Returns the total number of flights by airline/carrier.

**/
 

SELECT carrier 'Carrier/Airline' , COUNT(*) AS 'Number of Flights' 
FROM flights
GROUP BY carrier
ORDER BY carrier;

/**
5. Returns all of the airlines, ordered by number of flights in descending order.


**/

SELECT carrier 'Carrier/Airline' , COUNT(*) AS 'Number of Flights' 
FROM flights
GROUP BY carrier
ORDER BY 2 DESC;

/**
6. Returns only the top 5 airlines, by number of flights, 
ordered by number of flights in descending order.

**/

SELECT carrier 'Carrier/Airline' , COUNT(*) AS 'Number of Flights' 
FROM flights
GROUP BY carrier
ORDER BY 2 DESC
LIMIT 5 ;

/**
7. Returns the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
flights in descending order.

**/

SELECT carrier 'Carrier/Airline' , COUNT(*) AS 'Number of Flights' 
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) 
DESC LIMIT 5 ;

/**
8. Return from the flights and airport tables the names of
the three originating airports in the flights table with the average
air times for those three airports.

**/


SELECT a.name 'Airport Name' , x.origin 'Airport FAA Code' , x.av 'Average Air Time (Minutes)'
FROM airports a JOIN
(SELECT origin, AVG(air_time) av 
FROM flights
GROUP BY origin) AS x ON x.origin = a.faa
ORDER BY x.av DESC;




