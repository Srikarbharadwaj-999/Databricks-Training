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

-- 3
WITH RECURSIVE numbers AS( 
  SELECT 1 AS N 
  UNION ALL 
  SELECT N+1 
  FROM numbers 
  WHERE N < 10)
SELECT * FROM numbers;

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

-- 5
WITH avg_orders AS ( 
  SELECT AVG(total_amount) AS avg_amount 
  FROM orders )
SELECT o.order_id , o.customer_id , o.employee_id , o.total_amount 
FROM orders o 
JOIN avg_orders ao 
ON o.total_amount > ao.avg_amount;

-- 6
WITH customer_spendings AS(
  SELECT c.customer_id , c.customer_name , SUM(o.total_amount) AS total_spendings
  FROM customers c 
  LEFT JOIN orders o 
  ON c.customer_id = o.customer_id 
  GROUP BY c.customer_id , c.customer_name)
SELECT customer_id , customer_name , RANK() OVER (ORDER BY total_spendings DESC) AS spending_rank 
FROM customer_spendings;

-- 7
WITH ranked_salaries AS(
  SELECT employee_id ,employee_NAME , department , salary ,
         RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS SALARY_RANK
  FROM employees )
SELECT department , employee_name , salary 
FROM ranked_salaries 
WHERE SALARY_RANK = 2;

-- 8
SELECT employee_id , employee_name , department , salary ,
       MAX(salary) OVER(PARTITION BY DEPARTMENT ) AS DEPT_MAX_SALARY ,
       MAX(SALARY) OVER(PARTITION BY DEPARTMENT) - SALARY AS SALARY_DIFFERENCE 
FROM employees ;

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
