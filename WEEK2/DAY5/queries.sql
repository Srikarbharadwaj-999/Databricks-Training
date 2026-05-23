SELECT
    order_id,
    order_date,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_last_3_orders
FROM orders
ORDER BY order_date, order_id;

SELECT
    employee_id,
    employee_name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary
    ) AS salary_quartile
FROM employees
ORDER BY salary;

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

SELECT
    employee_id,
    employee_name,
    salary,
    department,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS dept_avg_salary
FROM employees;

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

SELECT department, department_payroll
FROM (
    SELECT
        department,
        SUM(salary) OVER (
            PARTITION BY department
        ) AS department_payroll,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY department
        ) AS rankk
    FROM employees
) t
WHERE rankk = 1;

SELECT
    employee_id,
    employee_name,
    salary,
    ROUND(
        salary * 100 /
        SUM(salary) OVER (PARTITION BY department),
        2
    ) AS contribution_percentage
FROM employees
ORDER BY employee_id;

SELECT
    employee_id,
    COUNT(*) OVER () AS total_employees
FROM employees;

WITH employee_sales AS (
    SELECT
        employee_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT *
FROM employee_sales;
