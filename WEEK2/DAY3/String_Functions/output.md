**Schema (MySQL v9)**

    CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    order_timestamp TIMESTAMP,
    delivery_date DATE,
    order_amount DECIMAL(10,2)
    );
    INSERT INTO orders VALUES
    (1, 'Karthik', '2024-01-15', '2024-01-15 10:30:45', '2024-01-20', 2500.00),
    (2, 'Veena', '2024-02-18', '2024-02-18 18:45:20', '2024-02-22', 3200.50),
    (3, 'Ravi', '2024-03-02', '2024-03-02 09:15:10', '2024-03-08', 4100.75),
    (4, 'Anil', '2024-03-09', '2024-03-09 14:05:55', '2024-03-15', 1800.00),
    (5, 'Suresh', '2024-01-07', '2024-01-07 23:55:00', '2024-01-12', 2900.00);

---

**Query #1**

    SELECT * FROM orders;

| order_id | customer_name | order_date | order_timestamp     | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------------- | ------------- | ------------ |
| 1        | Karthik       | 2024-01-15 | 2024-01-15 10:30:45 | 2024-01-20    | 2500.0       |
| 2        | Veena         | 2024-02-18 | 2024-02-18 18:45:20 | 2024-02-22    | 3200.5       |
| 3        | Ravi          | 2024-03-02 | 2024-03-02 09:15:10 | 2024-03-08    | 4100.75      |
| 4        | Anil          | 2024-03-09 | 2024-03-09 14:05:55 | 2024-03-15    | 1800.0       |
| 5        | Suresh        | 2024-01-07 | 2024-01-07 23:55:00 | 2024-01-12    | 2900.0       |

---
**Query #2**

    SELECT 
        order_id,
        customer_name,
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        DAY(order_date) AS order_day
    FROM orders;

| order_id | customer_name | order_year | order_month | order_day |
| -------- | ------------- | ---------- | ----------- | --------- |
| 1        | Karthik       | 2024       | 1           | 15        |
| 2        | Veena         | 2024       | 2           | 18        |
| 3        | Ravi          | 2024       | 3           | 2         |
| 4        | Anil          | 2024       | 3           | 9         |
| 5        | Suresh        | 2024       | 1           | 7         |

---
**Query #3**

    SELECT 
        order_id,
        customer_name,
        DATEDIFF(delivery_date, order_date) AS delivery_days
    FROM orders;

| order_id | customer_name | delivery_days |
| -------- | ------------- | ------------- |
| 1        | Karthik       | 5             |
| 2        | Veena         | 4             |
| 3        | Ravi          | 6             |
| 4        | Anil          | 6             |
| 5        | Suresh        | 5             |

---
**Query #4**

    SELECT 
        order_id,
        customer_name,
        order_timestamp,
        TIME(order_timestamp) AS order_time
    FROM orders;

| order_id | customer_name | order_timestamp     | order_time |
| -------- | ------------- | ------------------- | ---------- |
| 1        | Karthik       | 2024-01-15 10:30:45 | 10:30:45   |
| 2        | Veena         | 2024-02-18 18:45:20 | 18:45:20   |
| 3        | Ravi          | 2024-03-02 09:15:10 | 09:15:10   |
| 4        | Anil          | 2024-03-09 14:05:55 | 14:05:55   |
| 5        | Suresh        | 2024-01-07 23:55:00 | 23:55:00   |

---
**Query #5**

    SELECT *
    FROM orders
    WHERE MONTH(order_date) = 2 AND YEAR(order_date) = 2024;

| order_id | customer_name | order_date | order_timestamp     | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------------- | ------------- | ------------ |
| 2        | Veena         | 2024-02-18 | 2024-02-18 18:45:20 | 2024-02-22    | 3200.5       |

---
**Query #6**

    SELECT SUM(order_amount) AS total_revenue
    FROM orders;

| total_revenue |
| ------------- |
| 14501.25      |

---
**Query #7**

    SELECT AVG(order_amount) AS avg_order_value
    FROM orders;

| avg_order_value |
| --------------- |
| 2900.25         |

---
**Query #8**

    SELECT 
        MAX(order_amount) AS highest_order,
        MIN(order_amount) AS lowest_order
    FROM orders;

| highest_order | lowest_order |
| ------------- | ------------ |
| 4100.75       | 1800.0       |

---
**Query #9**

    SELECT 
        customer_name,
        SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_name;

| customer_name | total_spent |
| ------------- | ----------- |
| Karthik       | 2500.0      |
| Veena         | 3200.5      |
| Ravi          | 4100.75     |
| Anil          | 1800.0      |
| Suresh        | 2900.0      |

---
**Query #10**

    SELECT 
        customer_name,
        SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_name
    ORDER BY total_spent DESC
    LIMIT 1;

| customer_name | total_spent |
| ------------- | ----------- |
| Ravi          | 4100.75     |

---
**Query #11**

    SELECT COUNT(*) AS total_orders
    FROM orders;

| total_orders |
| ------------ |
| 5            |

---
**Query #12**

    SELECT *
    FROM orders
    WHERE order_amount > (
        SELECT AVG(order_amount) FROM orders
    );

| order_id | customer_name | order_date | order_timestamp     | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------------- | ------------- | ------------ |
| 2        | Veena         | 2024-02-18 | 2024-02-18 18:45:20 | 2024-02-22    | 3200.5       |
| 3        | Ravi          | 2024-03-02 | 2024-03-02 09:15:10 | 2024-03-08    | 4100.75      |

---
**Query #13**

    SELECT 
        order_id,
        customer_name,
        order_amount,
        RANK() OVER (ORDER BY order_amount DESC) AS order_rank
    FROM orders;

| order_id | customer_name | order_amount | order_rank |
| -------- | ------------- | ------------ | ---------- |
| 3        | Ravi          | 4100.75      | 1          |
| 2        | Veena         | 3200.5       | 2          |
| 5        | Suresh        | 2900.0       | 3          |
| 1        | Karthik       | 2500.0       | 4          |
| 4        | Anil          | 1800.0       | 5          |

---
**Query #14**

    SELECT 
        order_id,
        customer_name,
        order_date,
        order_amount,
        SUM(order_amount) OVER (ORDER BY order_date) AS running_total
    FROM orders;

| order_id | customer_name | order_date | order_amount | running_total |
| -------- | ------------- | ---------- | ------------ | ------------- |
| 5        | Suresh        | 2024-01-07 | 2900.0       | 2900.0        |
| 1        | Karthik       | 2024-01-15 | 2500.0       | 5400.0        |
| 2        | Veena         | 2024-02-18 | 3200.5       | 8600.5        |
| 3        | Ravi          | 2024-03-02 | 4100.75      | 12701.25      |
| 4        | Anil          | 2024-03-09 | 1800.0       | 14501.25      |

---
**Query #15**

    SELECT 
        order_id,
        customer_name,
        order_date,
        LAG(order_date) OVER (ORDER BY order_date) AS previous_order_date
    FROM orders;

| order_id | customer_name | order_date | previous_order_date |
| -------- | ------------- | ---------- | ------------------- |
| 5        | Suresh        | 2024-01-07 |                     |
| 1        | Karthik       | 2024-01-15 | 2024-01-07          |
| 2        | Veena         | 2024-02-18 | 2024-01-15          |
| 3        | Ravi          | 2024-03-02 | 2024-02-18          |
| 4        | Anil          | 2024-03-09 | 2024-03-02          |

---
**Query #16**

    SELECT 
        order_id,
        customer_name,
        order_date,
        DATEDIFF(
            order_date,
            LAG(order_date) OVER (ORDER BY order_date)
        ) AS days_gap
    FROM orders;

| order_id | customer_name | order_date | days_gap |
| -------- | ------------- | ---------- | -------- |
| 5        | Suresh        | 2024-01-07 |          |
| 1        | Karthik       | 2024-01-15 | 8        |
| 2        | Veena         | 2024-02-18 | 34       |
| 3        | Ravi          | 2024-03-02 | 13       |
| 4        | Anil          | 2024-03-09 | 7        |

---
**Query #17**

    SELECT 
        customer_name,
        MIN(order_date) AS first_order,
        MAX(order_date) AS last_order
    FROM orders
    GROUP BY customer_name;

| customer_name | first_order | last_order |
| ------------- | ----------- | ---------- |
| Karthik       | 2024-01-15  | 2024-01-15 |
| Veena         | 2024-02-18  | 2024-02-18 |
| Ravi          | 2024-03-02  | 2024-03-02 |
| Anil          | 2024-03-09  | 2024-03-09 |
| Suresh        | 2024-01-07  | 2024-01-07 |

---
**Query #18**

    SELECT 
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(order_amount) AS monthly_revenue
    FROM orders
    GROUP BY YEAR(order_date), MONTH(order_date);

| year | month | monthly_revenue |
| ---- | ----- | --------------- |
| 2024 | 1     | 5400.0          |
| 2024 | 2     | 3200.5          |
| 2024 | 3     | 5900.75         |

---
**Query #19**

    SELECT 
        customer_name,
        AVG(DATEDIFF(delivery_date, order_date)) AS avg_delivery_days
    FROM orders
    GROUP BY customer_name;

| customer_name | avg_delivery_days |
| ------------- | ----------------- |
| Karthik       | 5.0               |
| Veena         | 4.0               |
| Ravi          | 6.0               |
| Anil          | 6.0               |
| Suresh        | 5.0               |

---
**Query #20**

    SELECT *
    FROM orders
    WHERE TIME(order_timestamp) > '18:00:00';

| order_id | customer_name | order_date | order_timestamp     | delivery_date | order_amount |
| -------- | ------------- | ---------- | ------------------- | ------------- | ------------ |
| 2        | Veena         | 2024-02-18 | 2024-02-18 18:45:20 | 2024-02-22    | 3200.5       |
| 5        | Suresh        | 2024-01-07 | 2024-01-07 23:55:00 | 2024-01-12    | 2900.0       |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
