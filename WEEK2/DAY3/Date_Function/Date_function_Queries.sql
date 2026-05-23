
SELECT * FROM orders;

SELECT 
    order_id,
    customer_name,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    DAY(order_date) AS order_day
FROM orders;

SELECT 
    order_id,
    customer_name,
    DATEDIFF(delivery_date, order_date) AS delivery_days
FROM orders;

SELECT 
    order_id,
    customer_name,
    order_timestamp,
    TIME(order_timestamp) AS order_time
FROM orders;

SELECT *
FROM orders
WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2024;

SELECT SUM(order_amount) AS total_revenue
FROM orders;

SELECT AVG(order_amount) AS avg_order_value
FROM orders;

SELECT 
    MAX(order_amount) AS highest_order,
    MIN(order_amount) AS lowest_order
FROM orders;

SELECT 
    customer_name,
    SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_name;

SELECT 
    customer_name,
    SUM(order_amount) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 1;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT *
FROM orders
WHERE order_amount > (
    SELECT AVG(order_amount) FROM orders
);

SELECT 
    order_id,
    customer_name,
    order_amount,
    RANK() OVER (ORDER BY order_amount DESC) AS order_rank
FROM orders;

SELECT 
    order_id,
    customer_name,
    order_date,
    order_amount,
    SUM(order_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

SELECT 
    order_id,
    customer_name,
    order_date,
    LAG(order_date) OVER (ORDER BY order_date) AS previous_order_date
FROM orders;

SELECT 
    order_id,
    customer_name,
    order_date,
    DATEDIFF(
        order_date,
        LAG(order_date) OVER (ORDER BY order_date)
    ) AS days_gap
FROM orders;

SELECT 
    customer_name,
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order
FROM orders
GROUP BY customer_name;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(order_amount) AS monthly_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date);

SELECT 
    customer_name,
    AVG(DATEDIFF(delivery_date, order_date)) AS avg_delivery_days
FROM orders
GROUP BY customer_name;

SELECT *
FROM orders
WHERE TIME(order_timestamp) > '18:00:00';
