--1
SELECT o.owner_id , o.owner_name , c.car_id , c.car_name 
FROM Owners o 
LEFT JOIN Cars c 
ON o.owner_id = c.owner_id;

--2
SELECT r.rental_id  , c.customer_name, cr.car_name , cr.car_type , o.owner_name 
FROM Rentals r 
LEFT JOIN Customers c
ON r.customer_id = c.customer_id
LEFT JOIN Cars cr 
ON r.car_id = cr.car_id 
LEFT JOIN Owners o 
ON cr.owner_id = o.owner_id;

--3
SELECT r.rental_id,r.car_id,c.car_name,c.car_type,SUM(r.fare_amount) OVER (PARTITION BY r.car_id) AS total_fare,COUNT(r.rental_id) OVER (PARTITION BY r.car_id) AS total_rentals,AVG(r.fare_amount) OVER (PARTITION BY r.car_id) AS avg_fare_per_rental
FROM Rentals r
LEFT JOIN Cars c
  ON r.car_id = c.car_id;

--4
SELECT c.customer_name , COUNT(DISTINCT r.car_id) AS CARS_RENTED
FROM Rentals r 
LEFT JOIN Customers c
ON r.customer_id = c.customer_id 
GROUP BY c.customer_name 
HAVING COUNT(DISTINCT r.car_id) > 1;

--5
SELECT c.car_name , AVG(r.km_driven) AS AVG_KM 
FROM Rentals r 
LEFT JOIN Cars c 
ON r.car_id = c.car_id
GROUP BY c.car_name;
