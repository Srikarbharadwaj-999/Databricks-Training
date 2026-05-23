**Schema (MySQL v8)**

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

    SELECT
        order_id,
        order_date,
        total_amount,
        AVG(total_amount) OVER (
            ORDER BY order_date, order_id
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ) AS moving_avg_last_3_orders
    FROM orders;

| order_id | order_date | total_amount | moving_avg_last_3_orders |
| -------- | ---------- | ------------ | ------------------------ |
| 101      | 2024-01-10 | 500.0        | 500.0                    |
| 102      | 2024-01-11 | 700.0        | 600.0                    |
| 103      | 2024-01-15 | 1200.0       | 800.0                    |
| 104      | 2024-01-18 | 300.0        | 733.333333               |
| 105      | 2024-01-20 | 900.0        | 800.0                    |
| 106      | 2024-01-25 | 1500.0       | 900.0                    |
| 107      | 2024-02-01 | 650.0        | 1016.666667              |
| 108      | 2024-02-05 | 1100.0       | 1083.333333              |
| 109      | 2024-02-10 | 400.0        | 716.666667               |
| 110      | 2024-02-15 | 950.0        | 816.666667               |
| 111      | 2024-02-20 | 2000.0       | 1116.666667              |
| 112      | 2024-02-25 | 750.0        | 1233.333333              |

---
**Query #2**

    SELECT
        employee_id,
        employee_name,
        salary,
        NTILE(4) OVER (
            ORDER BY salary
        ) AS salary_quartile
    FROM employees;

| employee_id | employee_name | salary  | salary_quartile |
| ----------- | ------------- | ------- | --------------- |
| 6           | Fiona Green   | 58000.0 | 1               |
| 5           | Ethan Hunt    | 60000.0 | 1               |
| 2           | Bob Smith     | 65000.0 | 2               |
| 1           | Alice Johnson | 70000.0 | 2               |
| 8           | Hannah Lee    | 82000.0 | 3               |
| 7           | George Miller | 85000.0 | 3               |
| 3           | Charlie Brown | 90000.0 | 4               |
| 4           | Diana Prince  | 95000.0 | 4               |

---
**Query #3**

    SELECT *
    FROM (
        SELECT
            customer_id,
            order_id,
            order_date,
            total_amount,
            ROW_NUMBER() OVER (
                PARTITION BY customer_id
                ORDER BY order_date ASC, order_id ASC
            ) AS order_number
        FROM orders
    ) t
    WHERE order_number = 1;

| customer_id | order_id | order_date | total_amount | order_number |
| ----------- | -------- | ---------- | ------------ | ------------ |
| 1           | 101      | 2024-01-10 | 500.0        | 1            |
| 2           | 102      | 2024-01-11 | 700.0        | 1            |
| 3           | 104      | 2024-01-18 | 300.0        | 1            |
| 4           | 105      | 2024-01-20 | 900.0        | 1            |
| 5           | 106      | 2024-01-25 | 1500.0       | 1            |

---
**Query #4**

    SELECT *
    FROM (
        SELECT
            customer_id,
            order_id,
            order_date,
            total_amount,
            ROW_NUMBER() OVER (
                PARTITION BY customer_id
                ORDER BY order_date DESC, order_id DESC
            ) AS order_number
        FROM orders
    ) t
    WHERE order_number = 1;

| customer_id | order_id | order_date | total_amount | order_number |
| ----------- | -------- | ---------- | ------------ | ------------ |
| 1           | 112      | 2024-02-25 | 750.0        | 1            |
| 2           | 107      | 2024-02-01 | 650.0        | 1            |
| 3           | 109      | 2024-02-10 | 400.0        | 1            |
| 4           | 110      | 2024-02-15 | 950.0        | 1            |
| 5           | 111      | 2024-02-20 | 2000.0       | 1            |

---
**Query #5**

    SELECT
        employee_id,
        employee_name,
        salary,
        department,
        AVG(salary) OVER (
            PARTITION BY department
        ) AS dept_avg_salary
    FROM employees;

| employee_id | employee_name | salary  | department | dept_avg_salary |
| ----------- | ------------- | ------- | ---------- | --------------- |
| 7           | George Miller | 85000.0 | Finance    | 83500.0         |
| 8           | Hannah Lee    | 82000.0 | Finance    | 83500.0         |
| 5           | Ethan Hunt    | 60000.0 | HR         | 59000.0         |
| 6           | Fiona Green   | 58000.0 | HR         | 59000.0         |
| 3           | Charlie Brown | 90000.0 | IT         | 92500.0         |
| 4           | Diana Prince  | 95000.0 | IT         | 92500.0         |
| 1           | Alice Johnson | 70000.0 | Sales      | 67500.0         |
| 2           | Bob Smith     | 65000.0 | Sales      | 67500.0         |

---
**Query #6**

    SELECT *
    FROM (
        SELECT
            employee_id,
            employee_name,
            salary,
            department,
            AVG(salary) OVER (
                PARTITION BY department
            ) AS dept_avg_salary
        FROM employees
    ) t
    WHERE salary > dept_avg_salary;

| employee_id | employee_name | salary  | department | dept_avg_salary |
| ----------- | ------------- | ------- | ---------- | --------------- |
| 7           | George Miller | 85000.0 | Finance    | 83500.0         |
| 5           | Ethan Hunt    | 60000.0 | HR         | 59000.0         |
| 4           | Diana Prince  | 95000.0 | IT         | 92500.0         |
| 1           | Alice Johnson | 70000.0 | Sales      | 67500.0         |

---
**Query #7**

    SELECT DISTINCT
        department,
        SUM(salary) OVER (
            PARTITION BY department
        ) AS department_payroll
    FROM employees;

| department | department_payroll |
| ---------- | ------------------ |
| Finance    | 167000.0           |
| HR         | 118000.0           |
| IT         | 185000.0           |
| Sales      | 135000.0           |

---
**Query #8**

    SELECT
        employee_id,
        employee_name,
        salary,
        ROUND(
            salary * 100 /
            SUM(salary) OVER (
                PARTITION BY department
            ),
            2
        ) AS contribution_percentage
    FROM employees;

| employee_id | employee_name | salary  | contribution_percentage |
| ----------- | ------------- | ------- | ----------------------- |
| 7           | George Miller | 85000.0 | 50.9                    |
| 8           | Hannah Lee    | 82000.0 | 49.1                    |
| 5           | Ethan Hunt    | 60000.0 | 50.85                   |
| 6           | Fiona Green   | 58000.0 | 49.15                   |
| 3           | Charlie Brown | 90000.0 | 48.65                   |
| 4           | Diana Prince  | 95000.0 | 51.35                   |
| 1           | Alice Johnson | 70000.0 | 51.85                   |
| 2           | Bob Smith     | 65000.0 | 48.15                   |

---
**Query #9**

    SELECT
        employee_id,
        COUNT(*) OVER () AS total_employees
    FROM employees;

| employee_id | total_employees |
| ----------- | --------------- |
| 1           | 8               |
| 2           | 8               |
| 3           | 8               |
| 4           | 8               |
| 5           | 8               |
| 6           | 8               |
| 7           | 8               |
| 8           | 8               |

---
**Query #10**

    WITH employee_sales AS (
        SELECT
            employee_id,
            SUM(total_amount) AS total_sales
        FROM orders
        GROUP BY employee_id
    )
    SELECT *
    FROM employee_sales;

| employee_id | total_sales |
| ----------- | ----------- |
| 1           | 4350.0      |
| 2           | 3150.0      |
| 3           | 1400.0      |
| 4           | 2050.0      |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
