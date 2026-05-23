-- 1
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

-- 2
SELECT
    employee_id,
    employee_name,
    salary,
    NTILE(4) OVER (
        ORDER BY salary
    ) AS salary_quartile
FROM employees
ORDER BY salary;

-- 3
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
        ) AS ORDER_NUMBER
    FROM orders
) t
WHERE ORDER_NUMBER = 1;

-- 4
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
        ) AS ORDER_NUMBER
    FROM orders
) t
WHERE ORDER_NUMBER = 1;

-- 5
SELECT
    employee_id,
    employee_name,
    salary,
    department,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS dept_avg_salary
FROM employees;

-- 6
SELECT *
FROM(
SELECT EMPLOYEE_ID , EMPLOYEE_NAME , SALARY , AVG(SALARY) OVER (PARTITION BY DEPARTMENT) AS DEPT_AVG_SALARY 
  FROM employees)t 
  WHERE SALARY > DEPT_AVG_SALARY ;

-- 7
SELECT DEPARTMENT , DEPARTMENT_PAYROLL 
FROM (
    SELECT DEPARTMENT , SUM(SALARY) OVER (PARTITION BY DEPARTMENT) AS DEPARTMENT_PAYROLL ,
    ROW_NUMBER() OVER(PARTITION BY DEPARTMENT ORDER BY DEPARTMENT) AS RANKK
    FROM employees
)t
WHERE RANKK = 1;

-- 8
SELECT EMPLOYEE_ID , EMPLOYEE_NAME , SALARY ,
ROUND( SALARY * 100 / SUM(SALARY) OVER(PARTITION BY DEPARTMENT ) ,2 ) AS CONTRIBUTION_PERCENTAGE  
FROM employees
ORDER BY employee_id;

--9
SELECT employee_id ,COUNT(*) OVER() AS TOTAL_EMPLOYEES FROM employees;

--10
WITH employee_sales AS (
    SELECT
        employee_id,
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT *
FROM employee_sales;
