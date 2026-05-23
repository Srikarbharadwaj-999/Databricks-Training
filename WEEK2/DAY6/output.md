**Schema (MySQL v9)**

    -- SQL Window Functions and CTE Assignment
    -- Compatible with PostgreSQL
    
    DROP TABLE IF EXISTS orders;
    DROP TABLE IF EXISTS customers;
    DROP TABLE IF EXISTS employees;
    
    CREATE TABLE employees (
        employee_id INT PRIMARY KEY,
        employee_name VARCHAR(100),
        department VARCHAR(100),
        manager_id INT NULL,
        salary DECIMAL(10,2),
        hire_date DATE
    );
    
    CREATE TABLE customers (
        customer_id INT PRIMARY KEY,
        customer_name VARCHAR(100),
        city VARCHAR(100)
    );
    
    CREATE TABLE orders (
        order_id INT PRIMARY KEY,
        customer_id INT,
        employee_id INT,
        order_date DATE,
        total_amount DECIMAL(10,2),
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
    );
    
    -- Insert Employees
    INSERT INTO employees VALUES
    (1, 'Alice Johnson', 'Sales', NULL, 70000, '2020-01-15'),
    (2, 'Bob Smith', 'Sales', 1, 65000, '2021-03-20'),
    (3, 'Charlie Brown', 'IT', NULL, 90000, '2019-07-01'),
    (4, 'Diana Prince', 'IT', 3, 95000, '2018-11-11'),
    (5, 'Ethan Hunt', 'HR', NULL, 60000, '2022-02-10'),
    (6, 'Fiona Green', 'HR', 5, 58000, '2023-05-12'),
    (7, 'George Miller', 'Finance', NULL, 85000, '2017-09-18'),
    (8, 'Hannah Lee', 'Finance', 7, 82000, '2021-08-30');
    
    -- Insert Customers
    INSERT INTO customers VALUES
    (1, 'Acme Corp', 'New York'),
    (2, 'Tech Solutions', 'Chicago'),
    (3, 'Global Retail', 'Dallas'),
    (4, 'Blue Sky Ltd', 'Seattle'),
    (5, 'NextGen Systems', 'Boston');
    
    -- Insert Orders
    INSERT INTO orders VALUES
    (101, 1, 1, '2024-01-10', 500),
    (102, 2, 2, '2024-01-11', 700),
    (103, 1, 1, '2024-01-15', 1200),
    (104, 3, 3, '2024-01-18', 300),
    (105, 4, 4, '2024-01-20', 900),
    (106, 5, 2, '2024-01-25', 1500),
    (107, 2, 1, '2024-02-01', 650),
    (108, 1, 3, '2024-02-05', 1100),
    (109, 3, 4, '2024-02-10', 400),
    (110, 4, 2, '2024-02-15', 950),
    (111, 5, 1, '2024-02-20', 2000),
    (112, 1, 4, '2024-02-25', 750);
    
    -- Notes:
    -- Multiple departments for PARTITION BY exercises.
    -- Salary variations for ranking exercises.
    -- Multiple customer orders for LAG/LEAD analysis.
    -- Manager hierarchy included for recursive CTE practice.

---

**Query #1**

    -- 1
    WITH employee_sales AS (
      SELECT e.employee_id , e.employee_name , COALESCE(SUM(o.total_amount), 0) AS total_sales 
      FROM employees e 
      LEFT JOIN orders o 
      ON e.employee_id = o.employee_id 
      GROUP BY e.employee_id , e.employee_name ) , 
      company_avg AS ( 
        SELECT AVG(total_sales) AS avg_sales 
        FROM employee_sales )
    SELECT es.employee_id , es.employee_name , es.total_sales 
    FROM employee_sales es 
    CROSS JOIN  company_avg ca 
    WHERE es.total_sales > ca.avg_sales;

| employee_id | employee_name | total_sales |
| ----------- | ------------- | ----------- |
| 1           | Alice Johnson | 4350.0      |
| 2           | Bob Smith     | 3150.0      |
| 3           | Charlie Brown | 1400.0      |
| 4           | Diana Prince  | 2050.0      |

---
**Query #2**

    -- 2
    WITH customer_spendings AS( 
      SELECT c.customer_id , c.customer_name , SUM(o.total_amount) AS total_spendings 
      FROM customers c
      LEFT JOIN orders o
      ON c.customer_id = o.customer_id 
      GROUP BY c.customer_id , c.customer_name ) , 
      customer_rankings AS( 
        SELECT * , RANK() OVER (ORDER BY total_spendings DESC) AS spending_rank 
        FROM customer_spendings )
    SELECT * FROM customer_rankings
    ORDER BY spending_rank;

| customer_id | customer_name   | total_spendings | spending_rank |
| ----------- | --------------- | --------------- | ------------- |
| 1           | Acme Corp       | 3550.0          | 1             |
| 5           | NextGen Systems | 3500.0          | 2             |
| 4           | Blue Sky Ltd    | 1850.0          | 3             |
| 2           | Tech Solutions  | 1350.0          | 4             |
| 3           | Global Retail   | 700.0           | 5             |

---
**Query #3**

    -- 3
    WITH RECURSIVE numbers AS( 
      SELECT 1 AS N 
      UNION ALL 
      SELECT N+1 
      FROM numbers 
      WHERE N < 10)
    SELECT * FROM numbers;

| N   |
| --- |
| 1   |
| 2   |
| 3   |
| 4   |
| 5   |
| 6   |
| 7   |
| 8   |
| 9   |
| 10  |

---
**Query #4**

    -- 4
    WITH RECURSIVE employee_hierarchy AS (
      SELECT employee_id , employee_name , manager_id , department , 1 AS level
      FROM employees 
      WHERE manager_id IS NULL
      UNION ALL 
      SELECT e.employee_id , e.employee_id , e.manager_id , e.department , eh.level+1
      FROM employees e
      JOIN employee_hierarchy eh 
      ON e.manager_id = eh.employee_id
    )
    SELECT * FROM employee_hierarchy
    ORDER BY level , manager_id;

| employee_id | employee_name | manager_id | department | level |
| ----------- | ------------- | ---------- | ---------- | ----- |
| 1           | Alice Johnson |            | Sales      | 1     |
| 3           | Charlie Brown |            | IT         | 1     |
| 5           | Ethan Hunt    |            | HR         | 1     |
| 7           | George Miller |            | Finance    | 1     |
| 2           | 2             | 1          | Sales      | 2     |
| 4           | 4             | 3          | IT         | 2     |
| 6           | 6             | 5          | HR         | 2     |
| 8           | 8             | 7          | Finance    | 2     |

---
**Query #5**

    -- 5
    WITH avg_orders AS ( 
      SELECT AVG(total_amount) AS avg_amount 
      FROM orders )
    SELECT o.order_id , o.customer_id , o.employee_id , o.total_amount 
    FROM orders o 
    JOIN avg_orders ao 
    ON o.total_amount > ao.avg_amount;

| order_id | customer_id | employee_id | total_amount |
| -------- | ----------- | ----------- | ------------ |
| 103      | 1           | 1           | 1200.0       |
| 106      | 5           | 2           | 1500.0       |
| 108      | 1           | 3           | 1100.0       |
| 110      | 4           | 2           | 950.0        |
| 111      | 5           | 1           | 2000.0       |

---
**Query #6**

    -- 6
    WITH customer_spendings AS(
      SELECT c.customer_id , c.customer_name , SUM(o.total_amount) AS total_spendings
      FROM customers c 
      LEFT JOIN orders o 
      ON c.customer_id = o.customer_id 
      GROUP BY c.customer_id , c.customer_name)
    SELECT customer_id , customer_name , RANK() OVER (ORDER BY total_spendings DESC) AS spending_rank 
    FROM customer_spendings;

| customer_id | customer_name   | spending_rank |
| ----------- | --------------- | ------------- |
| 1           | Acme Corp       | 1             |
| 5           | NextGen Systems | 2             |
| 4           | Blue Sky Ltd    | 3             |
| 2           | Tech Solutions  | 4             |
| 3           | Global Retail   | 5             |

---
**Query #7**

    -- 7
    WITH ranked_salaries AS(
      SELECT employee_id ,employee_NAME , department , salary ,
             RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS SALARY_RANK
      FROM employees )
    SELECT department , employee_name , salary 
    FROM ranked_salaries 
    WHERE SALARY_RANK = 2;

| department | employee_name | salary  |
| ---------- | ------------- | ------- |
| Finance    | Hannah Lee    | 82000.0 |
| HR         | Fiona Green   | 58000.0 |
| IT         | Charlie Brown | 90000.0 |
| Sales      | Bob Smith     | 65000.0 |

---
**Query #8**

    -- 8
    SELECT employee_id , employee_name , department , salary ,
           MAX(salary) OVER(PARTITION BY DEPARTMENT ) AS DEPT_MAX_SALARY ,
           MAX(SALARY) OVER(PARTITION BY DEPARTMENT) - SALARY AS SALARY_DIFFERENCE 
    FROM employees ;

| employee_id | employee_name | department | salary  | DEPT_MAX_SALARY | SALARY_DIFFERENCE |
| ----------- | ------------- | ---------- | ------- | --------------- | ----------------- |
| 7           | George Miller | Finance    | 85000.0 | 85000.0         | 0.0               |
| 8           | Hannah Lee    | Finance    | 82000.0 | 85000.0         | 3000.0            |
| 5           | Ethan Hunt    | HR         | 60000.0 | 60000.0         | 0.0               |
| 6           | Fiona Green   | HR         | 58000.0 | 60000.0         | 2000.0            |
| 3           | Charlie Brown | IT         | 90000.0 | 95000.0         | 5000.0            |
| 4           | Diana Prince  | IT         | 95000.0 | 95000.0         | 0.0               |
| 1           | Alice Johnson | Sales      | 70000.0 | 70000.0         | 0.0               |
| 2           | Bob Smith     | Sales      | 65000.0 | 70000.0         | 5000.0            |

---
**Query #9**

    -- 9
    WITH employee_sales AS (
      SELECT e.employee_id , e.employee_name , department , COALESCE(SUM(o.total_amount),0) AS total_sales 
      FROM employees e 
      LEFT JOIN orders o 
      ON e.employee_id = o.employee_id
      GROUP BY e.employee_id , e.employee_name , e.DEPARTMENT ), 
      ranked_employees AS( 
        SELECT * ,
        ROW_NUMBER() OVER(PARTITION BY department ORDER BY total_sales DESC) AS sales_rank 
        FROM employee_sales )
    SELECT department , employee_name , total_sales 
    FROM ranked_employees;

| department | employee_name | total_sales |
| ---------- | ------------- | ----------- |
| Finance    | George Miller | 0.0         |
| Finance    | Hannah Lee    | 0.0         |
| HR         | Ethan Hunt    | 0.0         |
| HR         | Fiona Green   | 0.0         |
| IT         | Diana Prince  | 2050.0      |
| IT         | Charlie Brown | 1400.0      |
| Sales      | Alice Johnson | 4350.0      |
| Sales      | Bob Smith     | 3150.0      |

---
**Query #10**

    -- 10
    WITH monthly_sales AS(
      SELECT DATE_FORMAT(order_date, '%Y-%m-01') AS sales_month , SUM(total_amount) AS monthly_amount 
      FROM orders 
      GROUP BY DATE_FORMAT(order_date, '%Y-%m-01') ),
      sales_trends AS( 
        SELECT sales_month , monthly_amount ,
               SUM(monthly_amount) OVER (ORDER BY sales_month ) AS RUNNING_TOTAL ,
               LAG(monthly_amount) OVER (ORDER BY sales_month ) AS PREVIOUS_MONTH_SALES 
        FROM monthly_sales )
    SELECT sales_month , monthly_amount , RUNNING_TOTAL  , PREVIOUS_MONTH_SALES ,
           ROUND(((monthly_amount - previous_month_sales) / previous_month_sales ) * 100 ,2) as percentage_growth
    FROM sales_trends 
    ORDER BY sales_month;

| sales_month | monthly_amount | RUNNING_TOTAL | PREVIOUS_MONTH_SALES | percentage_growth |
| ----------- | -------------- | ------------- | -------------------- | ----------------- |
| 2024-01-01  | 5100.0         | 5100.0        |                      |                   |
| 2024-02-01  | 5850.0         | 10950.0       | 5100.0               | 14.71             |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
