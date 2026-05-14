SELECT employee_name, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

SELECT employee_name, salary,
RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;

SELECT employee_name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

SELECT *
FROM (
    SELECT employee_name, salary,
    ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employees
) t
WHERE rn <= 3;

SELECT employee_name, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

SELECT employee_name, department, salary,
MAX(salary) OVER(PARTITION BY department) AS highest_salary
FROM employees;

SELECT order_id, order_date, total_amount,
SUM(total_amount) OVER(ORDER BY order_date) AS running_total
FROM orders;

SELECT employee_id, order_date, total_amount,
SUM(total_amount) OVER(PARTITION BY employee_id ORDER BY order_date) AS cumulative_sales
FROM orders;

SELECT customer_id, order_date, total_amount,
LAG(total_amount) OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_order
FROM orders;

SELECT customer_id, order_date, total_amount,
LEAD(total_amount) OVER(PARTITION BY customer_id ORDER BY order_date) AS next_order
FROM orders;

SELECT customer_id, order_date, total_amount,
total_amount - LAG(total_amount) OVER(PARTITION BY customer_id ORDER BY order_date) AS difference_amount
FROM orders;

SELECT order_id, order_date, total_amount,
AVG(total_amount) OVER(
ORDER BY order_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS moving_average
FROM orders;

SELECT employee_name, salary,
NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

SELECT *
FROM (
    SELECT customer_id, order_id, order_date,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM orders
) t
WHERE rn = 1;

SELECT *
FROM (
    SELECT customer_id, order_id, order_date,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
) t
WHERE rn = 1;

SELECT employee_name, department, salary,
AVG(salary) OVER(PARTITION BY department) AS dept_avg_salary
FROM employees;

SELECT *
FROM (
    SELECT employee_name, department, salary,
    AVG(salary) OVER(PARTITION BY department) AS dept_avg
    FROM employees
) t
WHERE salary > dept_avg;

SELECT employee_name, department, salary,
SUM(salary) OVER(PARTITION BY department) AS department_payroll
FROM employees;

SELECT employee_name, department, salary,
ROUND(
salary * 100.0 /
SUM(salary) OVER(PARTITION BY department), 2
) AS salary_percentage
FROM employees;

SELECT employee_name, department,
COUNT(*) OVER() AS total_employees
FROM employees;

WITH employee_sales AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT * FROM employee_sales;

WITH employee_sales AS (
    SELECT employee_id,
    SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
company_avg AS (
    SELECT AVG(total_sales) AS avg_sales
    FROM employee_sales
)
SELECT es.*
FROM employee_sales es, company_avg ca
WHERE es.total_sales > ca.avg_sales;

WITH customer_spending AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
),
customer_rankings AS (
    SELECT customer_id, total_spending,
    RANK() OVER(ORDER BY total_spending DESC) AS customer_rank
    FROM customer_spending
)
SELECT * FROM customer_rankings;

WITH RECURSIVE numbers AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;

WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id, employee_name, manager_id
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id
    FROM employees e
    JOIN employee_hierarchy eh
    ON e.manager_id = eh.employee_id
)
SELECT * FROM employee_hierarchy;

WITH avg_orders AS (
    SELECT AVG(total_amount) AS avg_amount
    FROM orders
)
SELECT *
FROM orders, avg_orders
WHERE total_amount > avg_amount;

WITH customer_spending AS (
    SELECT customer_id,
    SUM(total_amount) AS total_spending
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id, total_spending,
RANK() OVER(ORDER BY total_spending DESC) AS customer_rank
FROM customer_spending;

SELECT *
FROM (
    SELECT employee_name, department, salary,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank
    FROM employees
) t
WHERE dept_salary_rank = 2;

SELECT employee_name, department, salary,
MAX(salary) OVER(PARTITION BY department) - salary AS salary_difference
FROM employees;

WITH employee_sales AS (
    SELECT e.employee_id,
    e.employee_name,
    e.department,
    SUM(o.total_amount) AS total_sales
    FROM employees e
    LEFT JOIN orders o
    ON e.employee_id = o.employee_id
    GROUP BY e.employee_id, e.employee_name, e.department
),
ranked_employees AS (
    SELECT *,
    RANK() OVER(PARTITION BY department ORDER BY total_sales DESC) AS dept_rank
    FROM employee_sales
)
SELECT *
FROM ranked_employees
WHERE dept_rank = 1;
